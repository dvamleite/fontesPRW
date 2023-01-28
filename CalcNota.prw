#Include "Protheus.ch"

/*/{Protheus.doc} zCalcMed
    Rotina customizada - Funcao para calculo de notas

    @type       User Function
    @author     Dvam leite
    @since      26/01/2023
    @version    V12
	@ Param   aAlunos

    @history    26/01/2023, Dvam leite,Criacao de funcao para calculo de notas.   
/*/

User Function zCalcMed()
    Local aAlunos := {}
    //Adicionando alunos na Matrix
    aAdd(aAlunos,{"Jose"     ,8,10,7,6     })//indece da Lin 1
    aAdd(aAlunos,{"Maria"    ,22,24,20,22  })//indece da Lin 2
    aAdd(aAlunos,{"Carlos"   ,23,20,18,14  })//indece da Lin 3
    aAdd(aAlunos,{"Adao"     ,25,25,25,25  })//indece da Lin 4
    fCalNota(aAlunos)
return

//Funcao statica que calcula a nota do aluno e o status e mostra na tela
Static Function fCalNota(aAlunos)
    Local nMedia
    Local nTotal
    Local i := 1
    Local cStatus
    Local cMensagem

    while i <= Len(aAlunos)
        nTotal := aAlunos[i,2]+aAlunos[i,3]+aAlunos[i,4]+aAlunos[i,5]
        nMedia := nTotal/4
        cStatus := ""
        Do case
        case nMedia <= 49.99
            cStatus := "Aluno Reprovado !"
        case nMedia >= 50 .and. nMedia <= 80
            cStatus := "Aluno Aprovado !"
        case nMedia >= 80 .and. nMedia <= 95
            cStatus := "Aprovado com Merito !"
        case nMedia >= 95
            cStatus := "Aprovado Com Merito e Louvor !"
        EndCase
        cMensagem := "Nome: "+ aAlunos[i,1] + " Media: "+ CValToChar(nMedia) + " Total: " + CValToChar(nTotal)

return

