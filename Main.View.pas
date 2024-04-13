unit Main.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.Edit, FMX.Effects, FMX.StdCtrls;

type
  TFormMain = class(TForm)
    RectBackground: TRectangle;
    EditText: TEdit;
    RectTalk: TRectangle;
    BtnTalk: TSpeedButton;
    RectSearch: TRectangle;
    ShadowEffect9: TShadowEffect;
    StyleBook1: TStyleBook;
    procedure BtnTalkClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ResultSpeech(AResult: string);
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

uses FMX.SpeechToText;

procedure TFormMain.ResultSpeech(AResult: string);
begin
  // Clear the EditText before setting the result
  EditText.Text := EmptyStr;
  // Set the recognized text to the EditText
  EditText.Text := AResult;
end;

procedure TFormMain.BtnTalkClick(Sender: TObject);
begin
  // Call the StartRecognition method of TSpeech_Text class with a prompt message and a reference to the ResultSpeech method
  TSpeech_Text.StartRecognition('SPEAK Now', ResultSpeech);
end;

end.

