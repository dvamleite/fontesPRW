#INCLUDE "PROTHEUS.CH"

/*/{Protheus.doc} zArray

    Rotina customizada - Criar um Array de dados

    @type       User Function
    @author     Dvam leite
    @since      24/01/2023
    @version    V12
    @database   MSSQL, Oracle

    @history    24/01/2023, Dvam leite,exemplo de matriz (Array).

    @param      aVarSA1, array, dados do cliente da empresa teste.

    @see        zArray.PRW
    
/*/


User Function zArray()
    Local aDados := {}
    Local i := 1

//Indice da Col    1         2       3            4
    aAdd(aDados,{"Jose"     ,24,"01/01/1999" ,"Sao paulo"     })//indece da Lin 1
    aAdd(aDados,{"Maria"    ,30,"10/08/1992" ,"Londres"       })//indece da Lin 2
    aAdd(aDados,{"Carlos"   ,21,"21/08/2001" ,"Salvador"      })//indece da Lin 3
    aAdd(aDados,{"Adao"     ,54,"31/12/1969" ,"Rio de Janeiro"})//indece da Lin 4
    aAdd(aDados,{"Marcelo"  ,30,"01/05/1989" ,"Manaus"        })//indece da Lin 5

    while i <= Len(aDados)
        MsgInfo("Nome: "+ aDados[i,1]+chr(13)+;
                "Idade: "+CValToChar(aDados[i,2])+chr(13)+;
                "Nascimento: "+aDados[i,3]+chr(13)+;
                "Cidade: "+aDados[i,4])
    i++
    Enddo
Return

