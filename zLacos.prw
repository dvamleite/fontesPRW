#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"

/*/{Protheus.doc} zLacoFor

    Rotina customizada - Criar laco de repeticao que chama mais lacos de repeticao

    @type       User Function
    @author     Dvam leite
    @since      22/01/2023
    @version    V12
    @database   MSSQL, Oracle

    @history    22/01/2023, Dvam leite, Repeticoes condicionais que chama outros lacos de repeticoes.

    @param      zLacoFor, zLacoCond, zLacoWhile.

    @see        zLacoFor.PRW
    
/*/

User Function zLacoFor()
Local i
Local j

For i := 1 to 2  

    MsgInfo("O Valor da Repeticao 1 e : "+ Alltrim(Str(i)))

    for j := 1 to 4

       MsgInfo("A soma de: "+Alltrim(Str(i))+" + "+Alltrim(Str(j))+ " = "+Alltrim(Str(i+j))) 

    Next

if i == 2 && j >= 4

    zLacoCond()

EndIf

Next 

Return

//Funcao statica com laco de repeticao e condicional
Static Function zLacoCond()
Local i 
Local nIni, nFim

nIni := 100
nFim := 120

For i := nIni To nFim Step 2    

    If i == 110

        MsgAlert("Laco 2 Aki !")
        zLacoWhile()

    EndIf
Next

Return Nil

//Funcao statica com Laco do tipo While 
Static Function zLacoWhile()
Local  nAux := 350
Local nCnt := 15
Local nRgs := 0

nAux := Int(nAux /2)

While nAux < 350

    nAux += nCnt
    nRgs ++
Enddo 

Alert("O laco foi executado "+ CValToChar(nRgs) + " vezes !")

Return
