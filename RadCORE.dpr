{$define UNIGUI_VCL} // Comment out this line to turn this project into an ISAPI module
(*
colar UNIGUI_VCL; antes do DEBUG d    em DELPHI COMPILER

ai vai gerar EXE pra DEBUG
e DLL pra PRODUCAO

    aaaaaaaaaaaaaaa       aaaaaaaaaaaaaaa          aaaaaaaaaaa         aaaaaaaaaaaaa      aaaa    aaaa
    aaaaaaaaaaaaaaaaa     aaaaaaaaaaaaaaaaa      aaaaaaaaaaaaaaa     aaaaaaaaaaaaaaaa     aaaa    aaaa
    aaaa          aaaa    aaaa          aaaa    aaaa         aaaa    aaa          aaa     aaaa    aaaa
    aaaa          aaaa    aaaa          aaaa    aaaa         aaaa    aaa                  aaaa    aaaa
    aaaa          aaaa    aaaa          aaaa    aaaa         aaaa    aaa                  aaaa    aaaa
    aaaaaaaaaaaaaaa       aaaaaaaaaaaaaaa       aaaaaaaaaaaaaaaaa     aaaaaaaaaaaaaaa     aaaa    aaaa
    aaaaaaaaaaaaaaaaa     aaaaaaaaaaaaaaaaa     aaaaaaaaaaaaaaaaa      aaaaaaaaaaaaaaa    aaaa    aaaa
    aaaa          aaaa    aaaa          aaaa    aaaa         aaaa                  aaa    aaaa    aaaa
    aaaa          aaaa    aaaa          aaaa    aaaa         aaaa    aaa           aaa    aaaa    aaaa
    aaaaaaaaaaaaaaaaaa    aaaa          aaaa    aaaa         aaaa    aaaaaaaaaaaaaaaa     aaaa    aaaaaaaaaaaaaaaa
    aaaaaaaaaaaaaaaaa     aaaa          aaaa    aaaa         aaaa     aaaaaaaaaaaaaa      aaaa    aaaaaaaaaaaaaaaa
*)


{$ifndef UNIGUI_VCL}
library
{$else}
program
{$endif}
  RadCORE;



uses
  {$ifdef MSWINDOWS}
  uniGUIISAPI,
  {$endif }
  Forms,
  MidasLib,
  ServerModule in 'ServerModule.pas' {sm: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {mm: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  uMenu_BASICS in 'formMENUS\uMenu_BASICS.pas',
  uMenu_TOOLS in 'formMENUS\uMenu_TOOLS.pas',
  uMenu_MOVEMENT in 'formMENUS\uMenu_MOVEMENT.pas',
  uMenu_OTHERS in 'formMENUS\uMenu_OTHERS.pas',
  uMenu_REPORTS in 'formMENUS\uMenu_REPORTS.pas',
  mkm_menus in 'formMENUS\mkm_menus.pas',
  mkm_func_web in 'FUNCTIONS\mkm_func_web.pas',
  Login in 'Login.pas' {frmLogin: TUniLoginForm},
  untFrmBase in 'frameBASE\untFrmBase.pas' {frmBase: TUniFrame},
  untCadCLIENTES in 'formMENUS\MENU_BASICS\untCadCLIENTES.pas' {frmCadCLIENTES: TUniFrame},
  str_func in 'FUNCTIONS\str_func.pas',
  untFrmLookUp in 'frameBASE\untFrmLookUp.pas' {frmLookUp: TUniForm},
  untCadFORNECEDORES in 'formMENUS\MENU_BASICS\untCadFORNECEDORES.pas' {frmCadFORNECEDORES: TUniFrame},
  untFrmInputBox in 'frameBASE\untFrmInputBox.pas' {frmInputBOX: TUniForm},
  untCadUSUARIOS in 'formMENUS\MENU_TOOLS\untCadUSUARIOS.pas' {frmCadUSUARIOS: TUniFrame},
  untFrmUSUARIOSONLINE in 'formMENUS\MENU_TOOLS\untFrmUSUARIOSONLINE.pas' {frmUsuariosOnline: TUniForm},
  untFrmMessage in 'frameBASE\untFrmMessage.pas' {frmMessage: TUniForm},
  untFrmBaseCRUDDetail in 'frameBASE\untFrmBaseCRUDDetail.pas' {frmBaseCRUDDetail: TUniForm},
  untFrmBaseReportMenu in 'frameBASE\untFrmBaseReportMenu.pas' {frmBaseReportMenu: TUniFrame},
  untReportMenuClientes in 'formMENUS\MENU_REPORTS\untReportMenuClientes.pas' {frmReportMenuClientes: TUniFrame},
  untfrmBaseReportDefault in 'frameBASE\untfrmBaseReportDefault.pas' {frmBaseReportDefault: TUniForm},
  mkm_func_report in 'FUNCTIONS\mkm_func_report.pas',
  untReportClientesSimples in 'formMENUS\MENU_REPORTS\untReportClientesSimples.pas' {frmReportClientesSimples: TUniForm},
  untReportClientesCompleto in 'formMENUS\MENU_REPORTS\untReportClientesCompleto.pas' {frmReportClientesCompleto: TUniForm},
  uVersion in 'FUNCTIONS\uVersion.pas',
  untCadBASICS in 'formMENUS\MENU_BASICS\untCadBASICS.pas' {frmCadBASICS: TUniFrame},
  untCadCOMPRAS in 'formMENUS\MENU_MOVEMENT\untCadCOMPRAS.pas' {frmCadCOMPRAS: TUniFrame},
  untFrmBaseReport in 'frameBASE\untFrmBaseReport.pas' {frmBaseReport: TUniForm},
  untCadRECIBOS in 'formMENUS\MENU_MOVEMENT\untCadRECIBOS.pas' {frmCadRECIBOS: TUniFrame},
  untReportReciboSimples in 'formMENUS\MENU_REPORTS\untReportReciboSimples.pas' {frmReportReciboSimples: TUniForm},
  untCadCLIENTES_VEICULOS in 'formMENUS\MENU_BASICS\untCadCLIENTES_VEICULOS.pas' {frmCadCLIENTES_VEICULOS: TUniForm},
  untCadMOVCAIXA in 'formMENUS\MENU_MOVEMENT\untCadMOVCAIXA.pas' {frmCadMOVCAIXA: TUniFrame},
  untFrmPDV in 'formMENUS\MENU_MOVEMENT\untFrmPDV.pas' {frmPDV: TUniForm},
  untCadT040001 in 'formMENUS\MENU_BASICS\untCadT040001.pas' {frmCadT040001: TUniFrame},
  untFrmLookUp_Lite in 'frameBASE\untFrmLookUp_Lite.pas' {frmLookUp_Lite: TUniForm},
  untFrmFREEFRAME in 'formMENUS\MENU_BASICS\untFrmFREEFRAME.pas' {frmFreeFrame: TUniFrame},
  untFormBase in 'formBASE\untFormBase.pas' {formBase: TUniForm},
  untCadFERIADOS in 'formMENUS\MENU_BASICS\untCadFERIADOS.pas' {frmCadFERIADOS: TUniFrame},
  untFrmWEBCAM in 'formMENUS\MENU_TOOLS\untFrmWEBCAM.pas' {frmWEBCAM: TUniForm},
  untFrmTHEMES in 'formMENUS\MENU_TOOLS\untFrmTHEMES.pas' {frmThemes: TUniForm},
  untDM_RC in 'datamodules\untDM_RC.pas' {dm_rc: TDataModule},
  mkm_graphs in 'FUNCTIONS\mkm_graphs.pas',
  mkm_gridblock in 'FUNCTIONS\mkm_gridblock.pas',
  mkm_layout in 'FUNCTIONS\mkm_layout.pas',
  mkm_validate in 'FUNCTIONS\mkm_validate.pas',
  untFrmRCBLOCKS in 'formMENUS\MENU_BASICS\untFrmRCBLOCKS.pas' {frmRCBlocks: TUniFrame},
  untFrmDEMOWITHFORM in 'formMENUS\MENU_BASICS\untFrmDEMOWITHFORM.pas' {frmDEMOWithForm: TUniForm},
  untFrmDEMOWITHFORMMODAL in 'formMENUS\MENU_BASICS\untFrmDEMOWITHFORMMODAL.pas' {frmDEMOWithFormMODAL: TUniForm},
  untFrmRCRacing in 'formMENUS\MENU_BASICS\untFrmRCRacing.pas' {frmRCRACING: TUniFrame},
  mkm_anim in 'FUNCTIONS\mkm_anim.pas',
  mkm_translate in 'FUNCTIONS\mkm_translate.pas',
  untFrmTRANSLATE in 'formMENUS\MENU_TOOLS\untFrmTRANSLATE.pas' {frmTranslate: TUniForm},
  untFrmBasePDF in 'frameBASE\untFrmBasePDF.pas' {frmBasePDF: TUniForm},
  untFrmWIZARD in 'formMENUS\MENU_BASICS\untFrmWIZARD.pas' {frmWIZARD: TUniFrame},
  untFrmWIZARDDEMO in 'formMENUS\MENU_BASICS\untFrmWIZARDDEMO.pas' {frmWIZARDDEMO: TUniForm},
  uconsts in 'functions\uconsts.pas',
  uDeployControl in 'functions\uDeployControl.pas',
  mkm_email in 'FUNCTIONS\mkm_email.pas',
  untFrmFISHFACT in 'formMENUS\MENU_BASICS\untFrmFISHFACT.pas' {frmFishFact: TUniFrame},
  mkm_login in 'FUNCTIONS\mkm_login.pas',
  untCadCLIENTES_REVISOES in 'formMENUS\MENU_BASICS\untCadCLIENTES_REVISOES.pas' {frmCadCLIENTES_REVISOES: TUniForm},
  DelphiZXIngQRCode in 'FUNCTIONS\DelphiZXIngQRCode.pas',
  mkm_qrcode in 'FUNCTIONS\mkm_qrcode.pas',
  untCadTB_COMPOUNDPK in 'formMENUS\MENU_BASICS\untCadTB_COMPOUNDPK.pas' {frmCadTB_COMPOUNDPK: TUniFrame},
  mkm_procedures in 'functions\mkm_procedures.pas',
  mkm_funcoes in 'functions\mkm_funcoes.pas',
  untFrmPesquisa in 'frameBASE\untFrmPesquisa.pas' {frmPesquisa: TUniForm},
  untCadBANCOS in 'formMENUS\MENU_MOVEMENT\untCadBANCOS.pas' {frmcadBANCOS: TUniFrame},
  mkm_regrasnegocio in 'regras\mkm_regrasnegocio.pas',
  untFrmCAIXADIARIO in 'formMENUS\MENU_MOVEMENT\untFrmCAIXADIARIO.pas' {frmCAIXADIARIO: TUniFrame},
  untFrmEXTRATOBANCARIO in 'formMENUS\MENU_MOVEMENT\untFrmEXTRATOBANCARIO.pas' {frmEXTRATOBANCARIO: TUniFrame},
  untFrmPLANOCONTASINDIVIDUAL in 'formMENUS\MENU_MOVEMENT\untFrmPLANOCONTASINDIVIDUAL.pas' {frmPLANOCONTASINDIVIDUAL: TUniFrame},
  untFrmPLANOCONTASANALITICO in 'formMENUS\MENU_MOVEMENT\untFrmPLANOCONTASANALITICO.pas' {frmPLANOCONTASANALITICO: TUniFrame},
  untFrmPLANOCONTASRESUMO in 'formMENUS\MENU_MOVEMENT\untFrmPLANOCONTASRESUMO.pas' {frmPLANOCONTASRESUMO: TUniFrame},
  untFrmBANCORESUMO in 'formMENUS\MENU_MOVEMENT\untFrmBANCORESUMO.pas' {frmBANCORESUMO: TUniFrame},
  untFrmBASEBAIXATITULOS in 'formMENUS\MENU_MOVEMENT\untFrmBASEBAIXATITULOS.pas' {frmBASEBAIXATITULOS: TUniFrame},
  untFrmMOVIMENTOMESTRE in 'formMENUS\MENU_MOVEMENT\untFrmMOVIMENTOMESTRE.pas' {frmMOVIMENTOMESTRE: TUniFrame},
  untFrmORCAMENTO in 'formMENUS\MENU_MOVEMENT\untFrmORCAMENTO.pas' {frmORCAMENTO: TUniFrame},
  untFrmPEDIDOS in 'formMENUS\MENU_MOVEMENT\untFrmPEDIDOS.pas' {frmPEDIDOS: TUniFrame},
  untFrmNOTAELETRONICA in 'formMENUS\MENU_MOVEMENT\untFrmNOTAELETRONICA.pas' {frmNOTAELETRONICA: TUniFrame},
  untFrmBAIXARECEBER in 'formMENUS\MENU_MOVEMENT\untFrmBAIXARECEBER.pas' {frmBAIXARECEBER: TUniFrame},
  untFrmBaixaTitulos in 'frameBASE\untFrmBaixaTitulos.pas' {frmBAIXATITULOS: TUniForm},
  untFrmBAIXAPAGAR in 'formMENUS\MENU_MOVEMENT\untFrmBAIXAPAGAR.pas' {frmBAIXAPAGAR: TUniFrame},
  untFrmPROTOCOLO in 'formMENUS\MENU_BASICS\untFrmPROTOCOLO.pas' {frmCADprotocolo: TUniFrame},
  mkm_dbfuncs in 'functions\mkm_dbfuncs.pas',
  mkm_dbcombobox in 'functions\mkm_dbcombobox.pas',
  untFormCRUDPROPRIO in 'formBASE\untFormCRUDPROPRIO.pas' {frmCRUDPROPRIO: TUniFrame},
  untCadBALANCAS in 'formMENUS\MENU_BASICS\untCadBALANCAS.pas' {frmCADBALANCAS: TUniFrame},
  untCadHISTORICO in 'formMENUS\MENU_BASICS\untCadHISTORICO.pas' {frmCADHISTORICO: TUniFrame},
  untCadCARTEIRA in 'formMENUS\MENU_BASICS\untCadCARTEIRA.pas' {frmCADCARTEIRA: TUniFrame},
  untCadCONDICOES in 'formMENUS\MENU_BASICS\untCadCONDICOES.pas' {frmCADCONDICOES: TUniFrame},
  untCadESCRITAS in 'formMENUS\MENU_BASICS\untCadESCRITAS.pas' {frmCADESCRITAS: TUniFrame},
  untCadPARAMETROSOPERACAO in 'formMENUS\MENU_BASICS\untCadPARAMETROSOPERACAO.pas' {frmCADPARAMETROSOPERACAO: TUniFrame},
  untCadPORTADORES in 'formMENUS\MENU_BASICS\untCadPORTADORES.pas' {frmCADPORTADORES: TUniFrame},
  untCadREGIAO in 'formMENUS\MENU_BASICS\untCadREGIAO.pas' {frmCADREGIAO: TUniFrame},
  untCadMEDIDAS in 'formMENUS\MENU_BASICS\untCadMEDIDAS.pas' {frmCADMEDIDAS: TUniFrame},
  untCadCENTROCUSTO in 'formMENUS\MENU_BASICS\untCadCENTROCUSTO.pas' {frmCADCENTROCUSTO: TUniFrame},
  untCadPLANOCONTAS in 'formMENUS\MENU_BASICS\untCadPLANOCONTAS.pas' {frmCADPLANOCONTAS: TUniFrame},
  untCadDOCUMENTOS in 'formMENUS\MENU_BASICS\untCadDOCUMENTOS.pas' {frmCADDOCUMENTOS: TUniFrame},
  untCadAPLICACAO in 'formMENUS\MENU_BASICS\untCadAPLICACAO.pas' {frmCADAPLICACAO: TUniFrame},
  untCadGRUPOS in 'formMENUS\MENU_BASICS\untCadGRUPOS.pas' {frmCADGRUPOS: TUniFrame},
  untCadOPERACOES in 'formMENUS\MENU_BASICS\untCadOPERACOES.pas' {frmCADOPERACOES: TUniFrame},
  untCadPROBABILIDADE in 'formMENUS\MENU_BASICS\untCadPROBABILIDADE.pas' {frmCADPROBABILIDADE: TUniFrame},
  untDM_IMP in 'datamodules\untDM_IMP.pas' {dm_imp: TDataModule},
  unReportImpressao in 'formMENUS\MENU_REPORTS\unReportImpressao.pas' {unfImpressao: TUniForm},
  mkm_impressao in 'functions\mkm_impressao.pas',
  untCadRESPONSAVEL in 'formMENUS\MENU_BASICS\untCadRESPONSAVEL.pas' {frmCADRESPONSAVEL: TUniFrame},
  untFrmProtocoloopcoes in 'frameBASE\untFrmProtocoloopcoes.pas' {frmProtocoloopcoes: TUniForm},
  untFrmRelatorioLevantamento in 'frameBASE\untFrmRelatorioLevantamento.pas' {FrmRelatorioLevantamento: TUniFrame},
  untFrmDEMONSTRATIVO in 'formMENUS\MENU_BASICS\untFrmDEMONSTRATIVO.pas' {frmDEMONSTRATIVO: TUniFrame},
  untFrmLaboratorioRAM in 'formMENUS\MENU_BASICS\untFrmLaboratorioRAM.pas' {frmLaboratorioRAM: TUniFrame},
  untFrmLaboratorioSEMRENASEM in 'formMENUS\MENU_BASICS\untFrmLaboratorioSEMRENASEM.pas' {frmSEMRENASEM: TUniFrame},
  untFrmLaboratorioRELATORIOENTRADAS in 'formMENUS\MENU_BASICS\untFrmLaboratorioRELATORIOENTRADAS.pas' {frmRELATORIOENTRADAS: TUniFrame},
  untFrmTELAGENERICA in 'frameBASE\untFrmTELAGENERICA.pas' {frmTELAGENERICA: TUniForm},
  untCadPESSOAS in 'formMENUS\MENU_BASICS\untCadPESSOAS.pas' {frmcadPESSOAS: TUniFrame},
  untFrmTransfereImportacao in 'frameBASE\untFrmTransfereImportacao.pas' {frmTransfereImportacao: TUniForm},
  untCadTRANSPORTES in 'formMENUS\MENU_BASICS\untCadTRANSPORTES.pas' {frmcadTRANSPORTES: TUniFrame},
  untcadFUNCIONARIOS in 'formMENUS\MENU_BASICS\untcadFUNCIONARIOS.pas' {frmcadFUNCIONARIOS: TUniFrame},
  untCadPRODUTOS in 'formMENUS\MENU_BASICS\untCadPRODUTOS.pas' {frmcadPRODUTOS: TUniFrame},
  untCadEMPRESAS in 'formMENUS\MENU_BASICS\untCadEMPRESAS.pas' {frmcadEMPRESAS: TUniFrame},
  untCadPONTOS in 'formMENUS\MENU_BASICS\untCadPONTOS.pas' {frmcadPONTOS: TUniFrame},
  untfrmSEFAZNOTA in 'frameBASE\untfrmSEFAZNOTA.pas' {frmSEFAZNOTA: TUniForm},
  mkm_relatorios in 'functions\mkm_relatorios.pas',
  untfrmPesquisalote in 'frameBASE\untfrmPesquisalote.pas' {frmpesquisalote: TUniForm},
  untfrmTelaproducaogenerica in 'frameBASE\untfrmTelaproducaogenerica.pas' {frmtelaproducaogenerica: TUniForm},
  untfrmDeclaracaoretirada in 'frameBASE\untfrmDeclaracaoretirada.pas' {frmdeclaracaoretirada: TUniForm},
  untFrmMANIFESTO in 'formMENUS\MENU_MOVEMENT\untFrmMANIFESTO.pas' {frmMANIFESTO: TUniFrame},
  untfrmSEFAZMANIFESTO in 'frameBASE\untfrmSEFAZMANIFESTO.pas' {frmSEFAZMANIFESTO: TUniForm},
  untfrmImpressaoFinanceiro in 'frameBASE\untfrmImpressaoFinanceiro.pas' {frmimpressaofinanceiro: TUniForm},
  untfrmRELATORIOS in 'formMENUS\MENU_BASICS\untfrmRELATORIOS.pas' {frmRELATORIOS: TUniForm},
  untFrmRELATORIOBASE in 'frameBASE\untFrmRELATORIOBASE.pas' {frmRELATORIOBASE: TUniForm},
  untFrmDETALHESITENSNOTA in 'frameBASE\untFrmDETALHESITENSNOTA.pas' {frmDETALHESITENSNOTA: TUniForm},
  untFrmTRANSPORTADORAMOVIMENTO in 'frameBASE\untFrmTRANSPORTADORAMOVIMENTO.pas' {frmTRANPORTADORAMOVIMENTO: TUniForm},
  untFrmRELATORIO_LOTE in 'formMENUS\MENU_BASICS\untFrmRELATORIO_LOTE.pas' {frmRELATORIO_LOTE: TUniForm},
  untFrmPesquisaProduto in 'frameBASE\untFrmPesquisaProduto.pas' {frmpesquisaproduto: TUniForm},
  untFrmMESTRE in 'formMENUS\MENU_MOVEMENT\untFrmMESTRE.pas' {frmMESTRE: TUniFrame},
  untFrmORCAMENTOTEMPERFARMA in 'formMENUS\MENU_MOVEMENT\untFrmORCAMENTOTEMPERFARMA.pas' {frmORCAMENTOTEMPERFARMA: TUniFrame},
  untFrmCOMPOSICAOPRODUTO in 'frameBASE\untFrmCOMPOSICAOPRODUTO.pas' {frmCOMPOSICAOPRODUTO: TUniForm},
  untcadMENUSISTEMA in 'formMENUS\MENU_TOOLS\untcadMENUSISTEMA.pas' {frmcadMENUSISTEMA: TUniFrame},
  untCadINDICATIVO in 'formMENUS\MENU_BASICS\untCadINDICATIVO.pas' {frmcadINDICATIVO: TUniFrame},
  untFrmPEDIDOTEMPERFARMA in 'formMENUS\MENU_BASICS\untFrmPEDIDOTEMPERFARMA.pas' {frmPEDIDOTEMPERFARMA: TUniFrame},
  untFrmPEDIDOCOMPRA in 'formMENUS\MENU_BASICS\untFrmPEDIDOCOMPRA.pas' {frmPEDIDOCOMPRA: TUniFrame},
  untFrmBLOQUEIOSISTEMA in 'frameBASE\untFrmBLOQUEIOSISTEMA.pas' {frmBLOQUEIOSISTEMA: TUniForm},
  untfrmTELAAVISOSISTEMA in 'frameBASE\untfrmTELAAVISOSISTEMA.pas' {frmTELAAVISOSISTEMA: TUniForm},
  untFrmRELATORIO_PRODUTOS in 'formMENUS\MENU_BASICS\untFrmRELATORIO_PRODUTOS.pas' {frmRELATORIO_PRODUTOS: TUniForm},
  untFrmCONSULTAKARDEXPRODUTO in 'formMENUS\MENU_BASICS\untFrmCONSULTAKARDEXPRODUTO.pas' {frmCONSULTAKARDEXPRODUTO: TUniFrame},
  untFrmCONSULTAESTOQUE in 'formMENUS\MENU_BASICS\untFrmCONSULTAESTOQUE.pas' {frmCONSULTAESTOQUE: TUniFrame},
  untFrmBaseCRUD in 'frameBASE\untFrmBaseCRUD.pas' {frmBaseCRUD: TUniFrame},
  untFrmARQUIVOXML in 'frameBASE\untFrmARQUIVOXML.pas' {frmARQUIVOXML: TUniFrame},
  untFrmRELATORIOPRODUTOPESSOA in 'formMENUS\MENU_BASICS\untFrmRELATORIOPRODUTOPESSOA.pas' {FrmRELATORIOPRODUTOPESSOA: TUniForm},
  untFrmRELATORIOQTDEPRODUTO in 'formMENUS\MENU_BASICS\untFrmRELATORIOQTDEPRODUTO.pas' {FrmRELATORIOQTDEPRODUTO: TUniForm},
  uMsgInfo in 'frameBASE\uMsgInfo.pas',
  untFrmSUPORTESISGRAOS in '..\RadCorePastagem\frameBASE\untFrmSUPORTESISGRAOS.pas' {frmSUPORTESISGRAOS: TUniFrame},
  untFrmCRUDSUPORTE in '..\RadCorePastagem\frameBASE\untFrmCRUDSUPORTE.pas' {frmCRUDSUPORTE: TUniForm},
  untFrmANEXACERTIFICADO in 'frameBASE\untFrmANEXACERTIFICADO.pas' {frmANEXACERTIFICADO: TUniForm},
  untfrmSEFAZCUPOM in '..\RadCorePastagem\frameBASE\untfrmSEFAZCUPOM.pas' {frmSEFAZCUPOM: TUniForm},
  untFrmCUPOMELETRONICO in '..\RadCorePastagem\formMENUS\MENU_MOVEMENT\untFrmCUPOMELETRONICO.pas' {FrmCUPOMELETRONICO: TUniFrame},
  untFrmNOTAENTRADA in 'formMENUS\MENU_MOVEMENT\untFrmNOTAENTRADA.pas' {frmNOTAENTRADA: TUniFrame},
  untFrmCRUDFINANCEIRO in 'frameBASE\untFrmCRUDFINANCEIRO.pas' {frmCRUDFINANCEIRO: TUniForm},
  untCadPAGAR in 'formMENUS\MENU_MOVEMENT\untCadPAGAR.pas',
  untCADRECEBER in 'formMENUS\MENU_MOVEMENT\untCADRECEBER.pas',
  untFrmBASEFINANCEIRO in 'frameBASE\untFrmBASEFINANCEIRO.pas' {frmBASEFINANCEIRO: TUniFrame},
  untFrmTELACENTROCUSTO in 'frameBASE\untFrmTELACENTROCUSTO.pas' {frmTELACENTROCUSTO: TUniForm},
  untFrmTELAMOVIMENTOBOLETOS in 'formMENUS\MENU_BASICS\untFrmTELAMOVIMENTOBOLETOS.pas' {frmTELAMOVIMENTOBOLETOS: TUniForm},
  untFrmFORMAPAGAMENTO in 'frameBASE\untFrmFORMAPAGAMENTO.pas' {frmFORMAPAGAMENTO: TUniForm},
  untFrmTELACHAVENOTA in 'frameBASE\untFrmTELACHAVENOTA.pas' {FrmTELACHAVENOTA: TUniForm},
  untfrmTELAAVISOMSG in 'frameBASE\untfrmTELAAVISOMSG.pas' {frmTELAAVISOMSG: TUniForm},
  untFrmAVISOFINANCEIRO in 'frameBASE\untFrmAVISOFINANCEIRO.pas' {frmAVISOFINANCEIRO: TUniForm},
  untFrmCADASTROCONTRATO in 'frameBASE\untFrmCADASTROCONTRATO.pas' {frmCADASTROCONTRATO: TUniForm},
  untFrmAVISOCOMUNICADO in 'frameBASE\untFrmAVISOCOMUNICADO.pas' {frmAVISOCOMUNICADO: TUniForm},
  untFrmMENUNOTIFICACOES in 'formMENUS\MENU_TOOLS\untFrmMENUNOTIFICACOES.pas' {frmMENUNOTIFICACOES: TUniForm};
{$R *.res}

{$ifndef UNIGUI_VCL}
exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;
{$endif}

begin
{$ifdef UNIGUI_VCL}
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Tsm.Create(Application);
  Application.Run;
{$endif}
end.

