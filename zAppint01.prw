#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} APPINT01

    Rotina customizada - Telas de Exemplos

    @type       User Function
    @author     Dvam leite
    @since      21/01/2023
    @version    V12
    @database   MSSQL, Oracle

    @history    21/01/2023, Dvam leite, foi criado 2 telas simples onde a tela 1 chama a tela 2 

    @param      button Proximo (inclusao),

    @see        APPINT01.PRW  
    
/*/

User Function APPINT01()
    Local oDlg
    Local oBtn1, oSay1
    
    //coordenadas para criacao de tela
    DEFINE DIALOG oDlg TITLE "Exemplo de Tela 1" FROM 0,0 TO 150,300 COLOR CLR_BLACK,CLR_WHITE PIXEL
    @ 25,05 SAY oSay1 PROMPT "Tela de Exemplo 01" SIZE 60,12 OF oDlg PIXEL 
    
    //Botoes de interacoes na tela
    @ 50,95 BUTTON oBtn1 PROMPT 'Proximo Tela' ACTION ( APPINT02() ) SIZE 40, 013 OF oDlg PIXEL 
    @ 50,05 BUTTON oBtn1 PROMPT 'Sair' ACTION ( oDlg:End() ) SIZE 40, 013 OF oDlg PIXEL
    
    ACTIVATE DIALOG oDlg CENTER
Return

//Tela 2 que sera chamada pela tela 1
Static Function APPINT02() 
Local oDlg
Local oBtn1, oSay1
 
//coordenadas para criacao de tela
oDlg = TDialog():New( 0, 0, 150, 300, "Exemplo de tela 2" ,,,,, CLR_BLACK,CLR_WHITE ,,, .T. )

//Mensagem que vai ser mostrada na tela 
oSay1 := TSay():New( 25, 05, {|| "Apenas uma mensagem"} ,oDlg,,,,,,.T.,,, 60, 12 )

//Botoes de interacoes na tela
oBtn1 := TButton():New( 50, 05, "Sair", oDlg,{|| oDlg:End() }, 40, 013,,,,.T. )
oDlg:Activate( , , , .T. )

Return
