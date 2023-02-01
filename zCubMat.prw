#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'TOTVS.CH'
#INCLUDE 'RWMAKE.CH'

/*/{Protheus.doc} User Function nomeFunction
    (long_description)
    @type  Function
    @author user
    @since 31/01/2023
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function zCalMate()
	Local nVal01 := SPACE(4), nVal02 :=  SPACE(4), nVal03 :=  SPACE(4), nVal04 :=  SPACE(4), nVal05 :=  SPACE(4)
	//Local nVal01 := 'slot 1', nVal02 :=  'slot 2', nVal03 :=   'slot 3', nVal04 :=   'slot 4', nVal05 :=   'slot 5'
    Local nLag := 2.5
    Local nComp := 7.5

	@ 200,001 TO 610,720 DIALOG oDlg TITLE OemToAnsi( "Cubicagem de Material" )
	@ 02,10 TO 195,350
	@ 10,018 Say " Este programa ira calcular Quantos metros Quadrados tem uma Carga com base nas medidas "
	@ 30,018 Say " Digite a altura um valor"
	@ 37,018 Say " Ex. 1.87"
	@ 30,098 Say " Digite o peso com casas Decimais."
	@ 37,098 Say " Ex. 97,8 ou 97.8"

	@ 45,018 MSGET nVal01 SIZE 55,11 of oDlg PIXEL PICTURE "@!"    //VALID !Vazio()
	@ 45,098 MSGET nVal02 SIZE 55,11 of oDlg PIXEL PICTURE "@!"    //VALID !Vazio()
    @ 60,049 MSGET nVal03 SIZE 55,11 of oDlg PIXEL PICTURE "@!"    //VALID !Vazio()
	@ 75,018 MSGET nVal04 SIZE 55,11 of oDlg PIXEL PICTURE "@!"    //VALID !Vazio()
    @ 75,098 MSGET nVal05 SIZE 55,11 of oDlg PIXEL PICTURE "@!"    //VALID !Vazio()
	@ 105,018 MSGET nLag   SIZE 55,11 of oDlg PIXEL PICTURE "@!"    //VALID !Vazio()
    @ 105,088 MSGET nComp  SIZE 55,11 of oDlg PIXEL PICTURE "@!"    //VALID !Vazio()
	
	@ 120,158 BMPBUTTON TYPE 02 ACTION Close(oDlg)
	@ 120,188 BMPBUTTON TYPE 01 ACTION fCalc()

	Activate Dialog oDlg Centered    
Return 

/*/{Protheus.doc} nomeStaticFunction
    (long_description)
    @type  Static Function
    @author user
    @since 31/01/2023
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function fCalc(nVal01, nVal02, nVal03, nVal04, nVal05, nLag, nComp)
Local nTotal 
Local nMed
Local nResult

nTotal := nVal01 + nVal02 + nVal03 + nVal04 + nVal05
nMed := nTotal/5
nResult := nMed * nLag * nComp

MsgInfo(nResult, " Metros Quadrado !")
    
Return 
