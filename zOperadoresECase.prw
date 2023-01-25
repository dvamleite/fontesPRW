#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"

/*/{Protheus.doc} zOpECase

    Rotina customizada - Calculo de salario e imc com operadores e case

    @type       User Function
    @author     Dvam leite
    @since      22/01/2023
    @version    V12
    @database   MSSQL, Oracle

    @history    22/01/2023, Dvam leite,Criacao de 3 funcoes uma para cauculo de salario em porcentagem e outra de imc e uma para calcular o ganho do mes.
   
    @param      zOpECase, fCalcImc, fCalSalary.

    @see        zOpECase.PRW
    
/*/

//Funcao de usuario que calcula o salario com almento em porcentagem
USER FUNCTION zOpECase()

	Local nSalario := 1500, nDesconto := 0.10
	Local nAumento, nSalLiq

	nAumento := nSalario * 1.20
	nSalLiq := nAumento * (1-nDesconto)

	MsgInfo("Salario Líquido: R$ " + Alltrim(str(nSalLiq)))

	fCalcImc()

RETURN

//Funcao statica que calcula o imc com base na altura e peso da pessoa
Static FUNCTION fCalcImc()

//O Cálculo do IMC é feito deividindo o Peso pela Altura ao Quadrado

	Local nAltura := 1.90, nPeso := 100, nImc := 0
	Local cTexto := ""

	nImc := nPeso / (nAltura ^ 2)

	Do case
	case nImc <= 18.5
		cTexto := "Abaixo da Peso"
	case nImc >= 18.6 .AND. nImc <= 24.9
		cTexto := "no Peso normal"
	case nImc >= 25 .and. nImc <= 29.9
		cTexto := "Acima do Peso"
	case nImc >= 30 .and. nImc <= 39.9
		cTexto := "com Obesidade"
	Otherwise
		cTexto := "com Obesidade Mórbida"
	EndCase

	MsgInfo("Seu ICM é " + Alltrim(str(nImc,5,2)) + " e você está " + cTexto)

	fCalSalary()

RETURN

//Funcao statica que calcula os ganhos do mes 
Static FUNCTION fCalSalary()

	Local nSalario := 1750
	Local nVa       := 450
	Local nVr       := 23
	Local nDias     := 21
	Local nTotal    := 0

	nTotal := nSalario + nVa + (nVr * nDias)

	MsgInfo("Total recebido no mês é de R$ " + cValToCHar(nTotal))

RETURN

/*
outros exemplos de operadores

$              // Verifica se uma string(Varial tipo texto) esta contida em outro
=              // Compara se as variaveis sao iguais
==             // Compara se as variaveis sao iguais e do mesmo tipo
!=  <>  #      // Compara se as variaveis sao diferentes 
%              // Mostra o resto da divisao
++             // Incrementa um valor 
--             // Decrementa um valor

*/
