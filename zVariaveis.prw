#INCLUDE 'PROTHEUS.CH'

#DEFINE ENTER CHR(13)+CHR(10)

/*/{Protheus.doc} zConstantes
Exemplo de teste com diretivas / Constantes
@author Dvam
@since 17/01/2023
@version 0.1
    @exemole
    u_zConstantes()
/*/
USER FUNCTION zVariaveis()
    Local aArea := GetArea()

    //Declaracao de variaveis
    Local nValor   := 10
    Local dData    := Date()
    Local lTeste   := .T.
    Local cTexto   := "Informacoes no fomato de texto"
    Local oObjeto   := TFont() :New("Tahoma")
    Local xInfo   := 0
    Local aDados   := {"Array de Dados", dData}
    Local bBloco := {||  nValor += 2,;
                        Alert("O Valor e Igual a "+ENTER+CValToChar(nValor))}

    //execucao do bloco de codigo
    EVal (bBloco)

    //Alterando valores das variaveis
    xInfo := "Troca de Valor"

    //mostra os valores das Variaveis
    MsgInfo("Variavel do tipo verdadeiro ou falso" +ENTER+CValToChar(lTeste))
    MsgInfo(cTexto)
    MsgInfo(aDados[1])

    RestArea(aArea)

 RETURN 
