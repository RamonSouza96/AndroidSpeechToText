unit FMX.SpeechToText;

interface

uses
  System.Messaging,
  Androidapi.Helpers,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Speech,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.App;

type
  TSpeechHandler = procedure(AResult: string) of object;

type
  TSpeech_Text = class
  private
    const
      FREQUEST_CODE_SPEECH = 205;
    class var FProcResult: TSpeechHandler;
    class procedure SetProcSpeechHandler(AHandler: TSpeechHandler);
    class procedure HandleActivityMessage(const Sender: TObject; const M: TMessage);
    class procedure HandleActivityResult(ARequestCode, AResultCode: Integer; AData: JIntent);
  public
    class procedure StartRecognition(ADisplay: string; AProcFinish: TSpeechHandler);

  end;

implementation

{ TSpeech_Text }

class procedure TSpeech_Text.SetProcSpeechHandler(AHandler: TSpeechHandler);
begin
  FProcResult := AHandler;
end;

class procedure TSpeech_Text.StartRecognition(ADisplay: string; AProcFinish: TSpeechHandler);
var
  LRequestIntent: JIntent;
begin
  SetProcSpeechHandler(AProcFinish);
  TMessageManager.DefaultManager.SubscribeToMessage(TMessageResultNotification, HandleActivityMessage);

  // Create an Intent object for speech recognition
  LRequestIntent := TJIntent.Create;
  LRequestIntent.setAction(TJRecognizerIntent.JavaClass.ACTION_RECOGNIZE_SPEECH);

  // Set language model and number of expected results
  LRequestIntent.putExtra(TJRecognizerIntent.JavaClass.EXTRA_LANGUAGE_MODEL, TJRecognizerIntent.JavaClass.LANGUAGE_MODEL_FREE_FORM);
  // https://cloud.google.com/speech-to-text/docs/speech-to-text-supported-languages
  LRequestIntent.putExtra(TJRecognizerIntent.JavaClass.EXTRA_LANGUAGE, StringToJString('pt-BR'));
  LRequestIntent.putExtra(TJRecognizerIntent.JavaClass.EXTRA_MAX_RESULTS, 1);

  // Set prompt message to be displayed to the user
  LRequestIntent.putExtra(TJRecognizerIntent.JavaClass.EXTRA_PROMPT, StringToJString(ADisplay));

  // Start activity for speech recognition
  SharedActivity.StartActivityForResult(LRequestIntent, FREQUEST_CODE_SPEECH);
end;

class procedure TSpeech_Text.HandleActivityResult(ARequestCode, AResultCode: Integer; AData: JIntent);
var
  LResults: JArrayList;
  LResultText: string;
  LResultObject: JObject;
begin
  // Check if request code and result are correct
  if (ARequestCode = FREQUEST_CODE_SPEECH) and (AResultCode = TJActivity.JavaClass.RESULT_OK) then
  begin
    // Get the results of speech recognition
    LResults := AData.getStringArrayListExtra(TJRecognizerIntent.JavaClass.EXTRA_RESULTS);

    // If there are results, get the first one (the most likely one)
    if Assigned(LResults) and (LResults.size > 0) then
    begin
      // Convert JObject to JString
      LResultObject := LResults.get(0);
      if Assigned(lResultObject) then
      begin
        TMessageManager.DefaultManager.Unsubscribe(TMessageResultNotification, HandleActivityMessage);
        LResultText := JStringToString(TJString.Wrap(lResultObject));
        // Do something with the recognized text (resultText)
        if Assigned(FProcResult) then
          FProcResult(LResultText);
      end;
    end;
  end;
end;

class procedure TSpeech_Text.HandleActivityMessage(const Sender: TObject; const M: TMessage);
begin
  if M is TMessageResultNotification then
    HandleActivityResult(TMessageResultNotification(M).RequestCode, TMessageResultNotification(M).ResultCode,
      TMessageResultNotification(M).Value);
end;

end.

