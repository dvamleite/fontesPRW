#Include 'Protheus.ch'

#DEFINE ENTER CHR(13)+CHR(10)

/*===================================================*
/ Funcao  : fTesteA                                  /
/ Autor   : Dvam leite                               /
/ Data    : 08 de Janeiro de 2023                    /
/ Descr   : Funcao estatica de teste                 /
*====================================================*/

User Function zEstrutura()

Local nPrimeiro  := 10
Local nSegundo   := 2
Local nResultado := 0
Local cNome      := "A + B"

//Estrutura
    nResultado := nPrimeiro * nSegundo
    
    MsgInfo(cNome+ " O Resultado e: "+ENTER+;
    CValToChar(nResultado))

Return nResultado
