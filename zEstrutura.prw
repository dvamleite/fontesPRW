#Include 'Protheus.ch'

#DEFINE ENTER CHR(13)+CHR(10)

/*===================================================*
/ Funcao  : zEstrutura                               /
/ Autor   : Dvam leite                               /
/ Data    : 18/01/2023                               /
/ Descr   : Funcao estatica de teste                 /
*====================================================*/

User Function zEstrutura()

Local nPrimeiro  := 8
Local nSegundo   := 7
Local nResultado := 0
Local cNome      := "A + B"

//Estrutura
    nResultado := nPrimeiro * nSegundo
    
    MsgInfo(cNome+ " O Resultado e: "+ENTER+;
    CValToChar(nResultado))

Return nResultado
