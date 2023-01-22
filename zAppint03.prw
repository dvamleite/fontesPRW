#INCLUDE "TOTVS.CH"
#INCLUDE 'PROTHEUS.CH'

/*/{Protheus.doc} APPINT03

    Rotina customizada - Telas de Exemplos

    @type       User Function
    @author     Dvam leite
    @since      22/01/2023
    @version    V12
    @database   MSSQL, Oracle

    @history    22/01/2023, Dvam leite, foi criado 2 telas simples onde a tela 1 chama a tela 2 

    @param      button Proximo (inclusao),

    @see        APPINT03.PRW  
    
/*/


User Function APPINT03()
Local cNome 
cNome := GetNome("Insira seu nome",50,"!@")
If empty(cNome)
   MsgStop("Nenhum nome foi digitado","Nome Digitado")
Else
   MsgInfo("["+cNome+"]","Nome Digitado")
Endif
Return

/*
Funcao para perguntar um nome
Parâmetros	cTitulo = Titulo da Pergunta 
		nTam = Tamanho máximo da string de retorno \
		cPicture = Máscara de entrada de dados para o objeto GET 
Retorno		String vazia :"Nenhum nome digitado ou o duálogo 
		foi encerrado ou cancelado
*/

STATIC Function GetNome(cTitulo,nTam,cPicture)
Local oDlg
Local cGetVar := space(nTam)
Local oGet
Local oBtn1,oBtn2
Local lOk := .F. 

DEFINE DIALOG oDlg TITLE (cTitulo) ;
    FROM 0,0 TO 100,500 ;      
    COLOR CLR_BLACK, CLR_HBLUE PIXEL

@ 05,05 GET oGet VAR cGetVar  PICTURE (cPicture) ;
        SIZE (nTam*4),12 OF oDlg PIXEL 

@ 25,05  BUTTON oBtn1 PROMPT "Confirmar" SIZE 40,15 ; 
         ACTION (lOk := .T. , oDlg:End()) OF oDlg PIXEL 

@ 25,50  BUTTON oBtn2 PROMPT "Voltar" SIZE 40,15 ; 
         ACTION (oDlg:End()) OF oDlg PIXEL 

ACTIVATE DIALOG oDlg CENTER

If !lOk
   cGetVar := space(nTam)
Endif

Return cGetVar
