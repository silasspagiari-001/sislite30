unit untDM_IMP;

interface

uses
  SysUtils, Classes, frxBarcode, frxClass, frxExportBaseDialog, frxExportPDF,
  frxDBSet;



type
  Tdm_imp = class(TDataModule)
    frxDBDataset: TfrxDBDataset;
    frxReport: TfrxReport;
    frxPDFExport: TfrxPDFExport;
    frxBarCodeObject1: TfrxBarCodeObject;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function dm_imp: Tdm_imp;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, MainModule;

function dm_imp: Tdm_imp;
begin
  Result := Tdm_imp(mm.GetModuleInstance(Tdm_imp));
end;

initialization
  RegisterModuleClass(Tdm_imp);

end.
