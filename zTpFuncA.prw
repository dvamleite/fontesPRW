#INCLUDE 'PROTHEUS.CH'
#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} zTpFuncA

    Rotina customizada - Para ivocar Outras funcoes

    @type       User Function
    @author     Dvam leite
    @since      20/01/2023
    @version    V12
    @database   MSSQL, Oracle

    @history    10/03/2022, Dvam leite, ajuste na função teste para retornar uma Mensagem e Chamar outras funcoes.

    @param      zTpFuncA, fTesteA. 

    @see        zTpFuncA.PRW
    
/*/

User function zTpFuncA()
	Local aArea := GetArea()

	MsgInfo("estou na funcao A !")

	//Chamada de funcao estatica
	fTesteA()

	RestArea(aArea)

Return

//funcao statica para mostra mensagem de chama e chama a Funcao B de outro Fonte
Static Function fTesteA()
	Local aArea := getArea()

	//Mensagem
	MsgInfo("Estou em uma funcao estatica <b>(A)</b>, ! ")

	//chamar a funcao de outro fonte
	u_zTpFuncB()

	RestArea(aArea)
Return

/*

Function zTest()
    MsgInfo("Funcao de uso exclusivo da TOTVS")
return

*/

