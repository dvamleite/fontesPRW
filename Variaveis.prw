#INCLUDE 'PROTHEUS.CH'

#DEFINE ENTER CHR(13)+CHR(10)

/*
+====================================================+
/ Programa: Variaveis                                /
/ Autor   : Dvam leite                               /
/ Data    : 08 de Janeiro de 2023                    /
*====================================================+
*/

USER FUNCTION VARIAVEIS()

Local nPrimeiro := 10
Local nSegundo  := 2
Local nResult   := 0
Local cNome     := "Dvam"

//Estrutura do programa
 nResult := nPrimeiro * nSegundo

 MsgInfo( cNome + " O Resultado e " + ENTER +;
 cValToChar(nResult))

 RETURN nResult
