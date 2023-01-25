#INCLUDE 'PROTHEUS.CH'
#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} zTpFuncB

    Rotina customizada - Para ivocar Outras funcoes

    @type       User Function
    @author     Dvam leite
    @since      20/01/2023
    @version    V12
    @database   MSSQL, Oracle

    @history    10/03/2022, Dvam leite, ajuste na função teste para retornar uma Mensagem e Chamar outras funcoes.
    
    @param      zTpFuncB, fTesteB. 

    @see        zTpFuncB.PRW
    
/*/
User function zTpFuncB()
	Local aArea := GetArea()

	//mostra Mensagem na tela
	MsgInfo("Estou na funcao <b>(B)</B>")

	//chamar a funcao estatica
	fTesteB()

	RestArea(aArea)

Return

//Funcao estatica que Chama a Funcao Padrao Mata010
Static Function fTesteB()
	Local aArea := GetArea()

	//chamada de funcao do sistema
	Mata010()

	RestArea(aArea)
Return
