program AndroidSpeechToText;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main.View in 'Main.View.pas' {FormMain},
  FMX.SpeechToText in 'FMX.SpeechToText.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
