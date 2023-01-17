#INCLUDE 'PROTHEUS.CH'

/*/{Protheus.doc} zTpFuncB
Teste de Funcao de Usuario
@type function
@Author Dvam
@since 08/12/2023
@version 1.0
    @example
    u_zTpFuncB()
/*/

User function zTpFuncB()
    Local aArea := GetArea()


    //mostra Mensagem e chamar a funcao estatica
    MsgInfo("Estou na funcao u_zTpFuncB() ", "Atencao")
    fTesteB()

    RestArea(aArea)

Return

/*
+====================================================+
/ Funcao  : fTesteB                                  /
/ Autor   : Dvam leite                               /
/ Data    : 08 de Janeiro de 2023                    /
/ Descr   : Funcao estatica de teste                 /
*====================================================+
*/

Static Function fTesteB(cPar1)
    Local aArea := GetArea()
    Default cPar1 := ""

    //Mensagem 
    MsgInfo("Estou em uma Funcao estatica <b>(B)</B>, "+cPar1+"!"," Atencao")

    RestArea(aArea)
Return
