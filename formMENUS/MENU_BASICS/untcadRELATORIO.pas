unit untcadRELATORIO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel,
  uniPageControl;

type
  TuntfrmRELATORIO = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    btnimpressao: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    UniPageControl: TUniPageControl;
    UniTabSheetvendas: TUniTabSheet;
    UniContainerPanel2: TUniContainerPanel;
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function untfrmRELATORIO: TuntfrmRELATORIO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function untfrmRELATORIO: TuntfrmRELATORIO;
begin
  Result := TuntfrmRELATORIO(mm.GetFormInstance(TuntfrmRELATORIO));
end;

procedure TuntfrmRELATORIO.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
