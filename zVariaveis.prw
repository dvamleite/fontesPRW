#INCLUDE 'PROTHEUS.CH'
#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} zVariaveis

    Rotina customizada - Definicao e tipos de variaveis

    @type       User Function
    @author     Dvam leite
    @since      20/01/2023
    @version    V12
    @database   MSSQL, Oracle

    @history    20/01/2023, ajustes nas variaveis para mostra seus tipos e valores.

    @param      aVarSA1, array, dados do cliente da empresa teste.

    @see        zVariaveis.PRW
   
/*/
#DEFINE ENTER CHR(13)+CHR(10)

USER FUNCTION zVariaveis()
	Local aArea := GetArea()

	//Declaracao de variaveis
	Local nValor   := 10
	Local dData    := Date()
	Local lTeste   := .T.
	Local cTexto   := "Informacoes no fomato de texto"
	//Local oObjeto   := TFont() :New("Tahoma")
	Local xInfo   := 0
	Local aDados   := {"Array de Dados","Com texto e Datas", dData}
	Local bBloco := {||  nValor += 2,;
		Alert("O Valor e Igual a "+ENTER+cValToChar(nValor))}

	//execucao do bloco de codigo
	EVal (bBloco)

	//Alterando valores das variaveis
	xInfo := "Troca de Valor"

	//mostra os valores das Variaveis
	MsgInfo("Variavel do tipo Logico (verdadeiro ou falso)" +ENTER+cValToChar(lTeste))
	MsgInfo(cTexto)
	MsgInfo(aDados[3])

	RestArea(aArea)

RETURN
