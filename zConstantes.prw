#Include "Protheus.ch"
#Include "TopConn.ch"

//Se for espanhol
#Ifdef PORTUGUES
    #Define STR_TESTE 'Com grandes poderes vem grandes responsabilidades'
    #Define STR_TITULO 'Atencao'

//Senao, ira testa este bloco
#ELSE
    //se for em Ingles
    #Ifdef ENGLISH
        #Define STR_TESTE 'with great power comes great responsibility.'
        #Define STR_TITULO 'Caution'
    #Endif
#Endif 

//Constantes
#Define STR_PULA Chr(13)+Chr(10)

/*/{Protheus.doc} zConstantes
Exemplo de teste com diretivas / Constantes
@author Dvam
@since 17/01/2023
@version 0.1
    @exemole
    u_zConstantes()
/*/

User Function zConstantes()
    Local aArea := GetArea()

    //Mensagem que vai ser Mostrada na tela
    MsgAlert(STR_TESTE + STR_PULA + "...", STR_TITULO)

    RestArea(aArea)

Return
