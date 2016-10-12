program Heaven_Door;

uses
  Vcl.Forms,
  backdoor in 'backdoor.pas' {FormHome},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Charcoal Dark Slate');
  Application.CreateForm(TFormHome, FormHome);
  Application.Run;
end.
