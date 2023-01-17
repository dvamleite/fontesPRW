#Include 'Protheus.ch'

/*/{Protheus.doc} zTpFuncA
Teste de Funcao de Usuario
@type function
@Author Dvam
@since 08/12/2023
@version 1.0
    @example
    u_zTpFuncA()
/*/

User function zTpFuncA()
    Local aArea := GetArea()

    //Chamada de Funcao Padrao
  //  Mata10 ()

    //Chamada de funcao de Usuario (Customizada)
    u_zTpFuncB()

    //Chamada de funcao no mesmo prw
    fTesteA()

    //Chamada de funcao estatica de outro prw
    //StaticCall(zTpFuncB, fTesteB, "Dvam")

    RestArea(aArea)

Return

/*===================================================*
/ Funcao  : fTesteA                                  /
/ Autor   : Dvam leite                               /
/ Data    : 08 de Janeiro de 2023                    /
/ Descr   : Funcao estatica de teste                 /
*====================================================*/

Static Function fTesteA(cPar1)
    Local aArea := getArea()    

    //Mensagem
    MsgInfo("Estou em uma funcao estatica <b>(B)</b>, "+ cPar1+"!", "Atencao")

    RestArea(aArea)
Return

