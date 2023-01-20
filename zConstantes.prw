#Include "Protheus.ch"
#Include "TopConn.ch"
#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} zConstantes

    Rotina customizada - Definicao e chamada de Constantes 

    @type       User Function
    @author     Dvam leite
    @since      20/01/2023
    @version    V12
    @database   MSSQL, Oracle

    @history    20/01/2023, Nome Sobrenome, ajuste na função teste para retornar o valor teste.

    @param      aVarSA1, array, dados do cliente da empresa teste.

    @see        zConstantes.PRW
   
/*/

//Se for espanhol
#Ifdef SPANISH
    #Define STR_TESTE 'Un gran poder conlleva una gran responsabilidad.'
    #Define STR_TITULO 'Precaucion'

//Senao, ira testa este bloco
#Else

    //se for em Ingles
    #Ifdef ENGLISH
        #Define STR_TESTE 'with great power comes great responsibility.'
        #Define STR_TITULO 'Caution'

//Senao, ira testa este bloco
#Else
//Se for Portugues
        #Define STR_TESTE 'Com grandes poderes vem grandes responsabilidades'
        #Define STR_TITULO 'Atencao'
    #EndIf
#EndIf 

//Constantes
#Define STR_PULA Chr(13)+Chr(10)

User Function zConstantes()
    Local aArea := GetArea()

    //Mensagem que vai ser Mostrada na tela
    MsgInfo(STR_TESTE + STR_PULA + "...", STR_TITULO)

    RestArea(aArea)

Return
