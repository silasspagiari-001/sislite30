unit uMsgInfo;

interface

type
  TMsgInfo = class
  public
    Codigo           : Integer;
    Registro         : Integer;
    Titulo           : string;
    Corpo            : string;
    ImagemUrl        : string;
    Data             : string;
    DataInicio       : string;
    DataFinal        : string;
    Prioridade       : string;
    Lido             : Boolean;
    Lida             : string;
    Tipo             : string;
    ExibirPopup      : string;
    ExigirConfirmacao: string;
    ContratoNumero   : string;
    ContratoSituacao : string;
    Pendentes        : Integer;
  end;

  TAvisoFinanceiroInfo = class
  public
    Status        : string;
    Codigo        : Integer;
    Documento     : string;
    Valor         : string;
    Vencimento    : string;
    DiasAtraso    : Integer;
    DiasTolerancia: Integer;
    Contrato      : string;
    Motivo        : string;
  end;

implementation

end.
