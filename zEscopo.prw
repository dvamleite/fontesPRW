#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} zEscopo

    Rotina customizada - Pasar valores das variaveis de uma funcao para outra

    @type       User Function
    @author     Dvam leite
    @since      21/01/2023
    @version    V12
    @database   MSSQL, Oracle

    @history    21/01/2023, Dvam leite, Criacao de função para teste e escopo de variavei e passagem de valores entre funcoes.

    @param      zEscopo(), fEscopo().

    @see        zEscopo.PRW    
    
/*/

User Function zEscopo()
    Local aArea := GetArea()

    //Variaveis Locais
    Local nVar01 := 5
    Local nVar02 := 8 
    Local nVar03 := 10

    //Variaveis Privadas
    Private cTst := "Teste Pvt"
    cTst2 := "Teste Pvt2"

    //Variaveis Publicas
    Public __cTeste  := "Dvam"
    Public __cTeste2 := "Leite"

    //Chamada de outra Rotina para demonstra escopo de variaveis
    fEscopo(nVar01, @nVar02)

    Alert(nVar02)
    Alert("Public: "+__cTeste + " " + __cTeste2)
    RestArea(aArea)
    Return
    
    //Funcao que recebe as variaveis da funcao zEscopo
    Static Function fEscopo(nValor1,nValor2, nValor3)
        Local aArea := GetArea()

        //Variaveis Locais
        Local __cTeste2 := "Teste2"

        //Variaveis Default
        Default nValor1 := 0
        Default nValor2 := 0
        Default nValor3 := 0

        //Altera o valor Da Variavel nValor2 somando mais 10
        nValor2 += 10

        //Mostra o conteudo da variavel Private cTeste2
        Alert("Private: "+cTst2)

        //Atribui Valor na Variavel Publica __cTeste para mostra o perigo da utilizacao de variaveis publicas
        __cTeste := "Teste1"

        RestArea(aArea)
    Return
