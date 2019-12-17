#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'RWMAKE.CH'
#INCLUDE 'FONT.CH'
#INCLUDE 'COLORS.CH'

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³FSCAPTCHA ºAutor  ³ Fábio Costa        º Data ³  29/07/2016 º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Funcao generica para capturar a atenção do usuario,        º±±
±±º          ³ obrigando a digitar 4 numeros aleatorios para continuar    º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AP                                                         º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/

*******************************
User Function fsCAPTCHA(_cMsg)
*******************************
Private _cCaptcha := Randomize(1000, 9999)
Private _cValid := Space(4)
Private _lValid := .f.
Default _cMsg   := "Você tem certeza de que deseja continuar?"

SetPrvt("oFont1","oDlg1","oGrp1","omsg","oSay1","oSay2","oGet1","oBtn1")

oFont1     := TFont():New( "Courier New",0,-24,,.T.,0,,700,.F.,.F.,,,,,, )
oFont2     := TFont():New( "Courier New",0,-16,,.T.,0,,700,.F.,.F.,,,,,, )

oDlg1      := MSDialog():New( 233,362,410,665,"Confirma?",,,.F.,,,,,,.T.,,,.T. )
oDlg1:lEscClose := .F.

oGrp1      := TGroup():New( 002,002,088,152,"",oDlg1,CLR_BLACK,CLR_WHITE,.T.,.F. )
oSay2      := TSay():New(037,051,{||"Digite o código abaixo"},oGrp1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,055,008)
omsg       := TSay():New(007,005,{||_cMsg	 },oGrp1,,oFont2,.F.,.F.,.F.,.T.,CLR_RED  ,CLR_WHITE,145,027)
oSay1      := TSay():New(046,062,{||_cCaptcha},oGrp1,,oFont1,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,030,016)
oGet1      := TGet():New(065,055,{|u| If(PCount()>0,_cValid:=u,_cValid)},oGrp1,030,015,'', ,CLR_BLACK,CLR_WHITE,oFont1,,,.T.,"",,,.F.,.F., ,.F.,.F.,"","_cValid",,)
oBtn1      := TButton():New( 065,090,"ok",oGrp1,{|| verifica()  },016,017,,,,.T.,,"",,,,.F. )
oDlg1:Activate(,,,.T.)

Return _lValid

***************************
Static Function verifica() 
***************************

if alltrim(_cValid) == alltrim(str(_cCaptcha))
	_lValid := .t.  
	oDlg1:End()
else
	MsgBox("Confirmação Invalida!","Atencao")
	_lValid := .f.
endif

return _lValid
