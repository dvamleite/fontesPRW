#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'TOTVS.CH'
#INCLUDE 'RWMAKE.CH'

USER FUNCTION TELA01()
	Local nAltura := SPACE(3), nPeso :=  SPACE(6)

	@ 200,001 TO 410,480 DIALOG oDlg TITLE OemToAnsi( "Cálculo IMC" )
	@ 02,10 TO 095,230
	@ 10,018 Say " Este programa ira calcular o IMC - Indice de massa corporal "
	@ 30,018 Say " Digite a altura em CM"
	@ 37,018 Say " Ex. 187"
	@ 30,098 Say " Digite o peso com casas Decimais."
	@ 37,098 Say " Ex. 97,8 ou 97.8"
	@ 45,018 MSGET nAltura SIZE 55,11 of oDlg PIXEL PICTURE "@!"  //VALID !Vazio()
	@ 45,098 MSGET nPeso SIZE 55,11 of oDlg PIXEL PICTURE "@!" //VALID !Vazio()
	@ 70,158 BMPBUTTON TYPE 02 ACTION Close(oDlg)
	@ 70,188 BMPBUTTON TYPE 01 ACTION geracalc(nAltura,nPeso)

	Activate Dialog oDlg Centered

RETURN

Static Function geracalc(nAltura,nPeso)

	Local cTexto := ""
	Local nImc

	If validpeso(nPeso)

		nAltura := VAL(nAltura)/100
		nPeso   := VAL(STRTRAN(nPeso,",","."))

		nImc := nPeso / (nAltura ^ 2)

		Do case
		case nImc <= 18.5
			cTexto := "Abaixo da Peso"
		case nImc >= 18.6 .AND. nImc <= 24.9
			cTexto := "Peso normal"
		case nImc >= 25 .and. nImc <= 29.9
			cTexto := "Acima do Peso"
		case nImc >= 30 .and. nImc <= 39.9
			cTexto := "Obesidade"
		Otherwise
			cTexto := "Obesidade Mórbida"
		EndCase

		MsgInfo("Seu ICM é " + Alltrim(str(nImc,5,2)) + " e você está " + cTexto)
	Else
		Alert("Separe o peso com casas decimais utilizando ( . ) ou ( , )")
	EndIF


Return

Static Function validpeso(nPeso)

	Local lRet := .F.
	Local cStrA:= ","
	Local cStrB:= "."

	If cStrA $ nPeso .or. cStrB $ nPeso
		lRet := .T.
	Else
		lRet := .F.
	EndIF

return lRet
