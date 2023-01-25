#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'RWMAKE.CH'
#INCLUDE 'FONT.CH'
#INCLUDE 'COLORS.CH'


/*/{Protheus.doc} zCrud01

    Rotina customizada - Criar uma Tela com a funcao crud

    @type       User Function
    @author     Dvam leite
    @since      24/01/2023
    @version    V12
    @database   MSSQL, Oracle

    @history    24/01/2023, Dvam leite, Criacao de uma tela com de um crud para salva ler alterar e deletar dados do banco.
   
    @param      zCrud01.

    @see        zCrud01.PRW
    
/*/

#DEFINE ENTER CHR(13)+CHR(10)

User Function zCrud01()
Private cGCod      := Space(5)
Private cGNome     := Space(10)
Private cGEnde     := Space(20)


//ARRAY DE ARMAZENAMENTO
Private aDados := {}


SetPrvt("oDlg1","osCod","osNome","oSEnd","oGCod","oGNome","oGEnde","oBIncluir","oBtShow","oBtShow1","oBtShow2")

//TELA PRINCIPAL
oDlg1      := MSDialog():New( 094,225,300,800,"CRUD - ADVPL",,,.F.,,,,,,.T.,,,.T. )

//R�TULOS DOS CAMPOS 
osCod      := TSay():New( 012,016,{||"Codigo"},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,040,008)
osNome     := TSay():New( 012,104,{||"Nome"},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oSEnd      := TSay():New( 012,176,{||"Endereco"},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)

//GETS PARA RECEP��O DE VALORES
oGCod      := TGet():New( 020,016,{|u| If(PCount()>0,cGCod:=u,cGCod)},oDlg1,30,010,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cGCod",,)
oGNome     := TGet():New( 020,104,{|u| If(PCount()>0,cGNome:=u,cGNome)},oDlg1,70,010,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cGNome",,)
oGEnde     := TGet():New( 020,176,{|u| If(PCount()>0,cGEnde:=u,cGEnde)},oDlg1,100,010,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cGEnde",,)

//BOT�ES DE INTERA��O
oBIncluir  	 := TButton():New( 040,010,"Incluir",oDlg1,{|u| fInclui(),cGCod := Space(5),cGNome  := Space(10), cGEnde  := Space(20)},037,012,,,,.T.,,"",,,,.F. )
oBtShow      := TButton():New( 040,050,"Buscar registro",oDlg1,{|u| fShowOne(cGCod,cGNome,cGEnde)},048,012,,,,.T.,,"",,,,.F. )
oBtShow1     := TButton():New( 040,100,"Mostrar Todos",oDlg1,{|u| fShowAll()},048,012,,,,.T.,,"",,,,.F. )
oBtShow2     := TButton():New( 040,150,"Alterar",oDlg1,{|u| fAltera()},048,012,,,,.T.,,"",,,,.F. )
oBtShow3     := TButton():New( 085,010,"Excluir",oDlg1,{|u| fDeleta()},048,012,,,,.T.,,"",,,,.F. )

oDlg1:Activate(,,,.T.)

Return


//##############################
//FUN��O DE INCLUSAO
//##############################
Static Function fInclui()

if Empty(Alltrim(cGCod)) .Or. Empty(Alltrim(cGNome)) .Or. Empty(Alltrim(cGEnde))
	Alert("EXISTEM CAMPOS VAZIOS, FAVOR PREENCHER!","ATENCAO")
ELSE
//GRAVA REGISTRO NO BANCO DE DADOS	
	dbSelectArea("ZA1")
		RecLock("ZA1",.T.)  
		ZA1->ZA1_COD	:= cGCod
		ZA1->ZA1_NOME	:= cGNome
		ZA1->ZA1_END 	:= cGEnde
	MsUnlock()
	

	MsgInfo("Inclus�o conclu�da com sucesso!","AVISO!")
ENDIF

	//dbCloseArea("ZA1")
return


//##############################
//FUN��O DE DELECAO L�GICA
//##############################
Static Function fDeleta()

//SELECIONAMOS A TABEA/�REA
dbSelectArea("ZA1")
dbSetOrder(1)

if !(dbSeek(xFilial("ZA1")+cGCod))
	Alert("Este registro n�o existe,"+Chr(13)+Chr(10)+"portanto n�o pode ser DELETADO!","ATEN��O!")
	//dbCloseArea("ZA1")
else
//GRAVA DELE��O NO BANCO DE DADOS	
	IF MsgYesNo("Tem certeza que quer DELETAR o registro?", "ATEN��O" )
		dbSelectArea("ZA1")
		RecLock("ZA1",.F.)  
		
			dbDelete() //fun��o respons�vel pela dele��o l�gica
		MsUnlock()
		
		MsgInfo("Registro DELETADO com sucesso!","AVISO!")
	ELSE
		MsgInfo("Dele��o abortada pelo usu�rio!","AVISO!")
	ENDIF
ENDIF

//dbCloseArea("ZA1")
return



//##############################
//FUN��O DE ALTERA��O
//##############################
Static Function fAltera()

//SELECIONAMOS A TABEA/�REA
dbSelectArea("ZA1")
dbSetOrder(1)

if !(dbSeek(xFilial("ZA1")+cGCod))
	Alert("Este registro n�o existe,"+Chr(13)+Chr(10)+"portanto n�o pode ser alterado!","ATEN��O!")
	//dbCloseArea("ZA1")
else
//GRAVA ALTERACAO NO BANCO DE DADOS	
	dbSelectArea("ZA1")
		RecLock("ZA1",.F.)  
		ZA1->ZA1_COD	:= cGCod
		ZA1->ZA1_NOME	:= cGNome
		ZA1->ZA1_END 	:= cGEnde
	MsUnlock()
	
	//dbCloseArea("ZA1")
	
	MsgInfo("Altera��o conclu�da com sucesso!","AVISO!")
ENDIF

return


//##############################
//FUN��O QUE MOSTRA UM REGISTRO
//##############################

Static Function fShowOne()

//SELECIONAMOS A TABEA/�REA
dbSelectArea("ZA1")
dbSetOrder(1)

if !(dbSeek(xFilial("ZA1")+cGCod))
	Alert("N�O H� DADOS PARA EXIBIR!","ATEN��O!") 
	//dbCloseArea("ZA1")
else
	MsgInfo("Registro encontrado com sucesso!","SUCESSO")
	cGNome := ZA1->ZA1_NOME
	cGEnde := ZA1->ZA1_END
ENDIF

	//dbCloseArea("ZA1")
return


//##############################
//FUN��O QUE MOSTRA TODOS
//##############################
Static Function fShowAll()

//SELECIONAMOS A TABEA/�REA
dbSelectArea("ZA1")
//POSICIONAMOS NO PRIMEIRO REGISTRO
ZA1->(DbGoTop())  

if ZA1->(RECCOUNT()) = 0 
	Alert("N�O H� DADOS PARA EXIBIR!","ATEN��O!")
	//dbCloseArea("ZA1")
else
		dbSelectArea("ZA1")
		ZA1->(DbGoTop())  
		
		While !ZA1->(EOF())
			MsgInfo("CODIGO: "+ZA1->ZA1_COD+ENTER+;
			" NOME: "+ZA1->ZA1_NOME+ENTER+;
			" ENDERECO: "+ZA1->ZA1_END)
			
			ZA1->(DbSkip())
		ENDDO
		
		//dbCloseArea("ZA1")
ENDIF

return
