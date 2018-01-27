$PBExportHeader$w_dutch.srw
$PBExportComments$継承:  オランダ版ウィンドウ
forward
global type w_dutch from w_ancestor
end type
type st_message from statictext within w_dutch
end type
end forward

global type w_dutch from w_ancestor
integer width = 2088
integer height = 910
string title = "Dutch"
st_message st_message
end type
global w_dutch w_dutch

on w_dutch.create
int iCurrent
call super::create
this.st_message=create st_message
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_message
end on

on w_dutch.destroy
call super::destroy
destroy(this.st_message)
end on

type em_date from w_ancestor`em_date within w_dutch
end type

on em_date::modified;call w_ancestor`em_date::modified;st_message.text = ''
end on

type st_1 from w_ancestor`st_1 within w_dutch
integer x = 184
integer width = 344
string text = "Hoeveelheid:"
end type

type st_2 from w_ancestor`st_2 within w_dutch
string text = "Prijs:"
end type

type sle_price from w_ancestor`sle_price within w_dutch
end type

on sle_price::modified;call w_ancestor`sle_price::modified;// extend ancestor script to erase thank-you message

st_message.text = ''
end on

type sle_qty from w_ancestor`sle_qty within w_dutch
long backcolor = 16777215
end type

on sle_qty::modified;call w_ancestor`sle_qty::modified;// extend ancestor script to erase thank-you message

st_message.text = ''
end on

type cb_1 from w_ancestor`cb_1 within w_dutch
string text = "Bereken Totaal"
end type

on cb_1::clicked;call w_ancestor`cb_1::clicked;// extend ancestor script to display thank you message

st_message.text = 'Dank U!'
end on

type cb_2 from w_ancestor`cb_2 within w_dutch
end type

type st_4 from w_ancestor`st_4 within w_dutch
string text = "Aankoop Datum:"
end type

type st_3 from w_ancestor`st_3 within w_dutch
integer x = 344
integer width = 184
string text = "Totaal:"
end type

type sle_total from w_ancestor`sle_total within w_dutch
end type

type st_message from statictext within w_dutch
integer x = 568
integer y = 693
integer width = 600
integer height = 82
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
boolean focusrectangle = false
end type

