$PBExportHeader$u_date_edit.sru
$PBExportComments$指定された日が金曜かどうかテストするエディットマスク
forward
global type u_date_edit from UserObject
end type
type em_1 from editmask within u_date_edit
end type
end forward

global type u_date_edit from UserObject
integer width = 468
integer height = 124
long backcolor = 78682240
long tabtextcolor = 33554432
long TabBackColor=67108864
em_1 em_1
end type
global u_date_edit u_date_edit

on u_date_edit.create
this.em_1=create em_1
this.Control[]={ this.em_1}
end on

on u_date_edit.destroy
destroy(this.em_1)
end on

type em_1 from editmask within u_date_edit
integer x = 12
integer y = 14
integer width = 436
integer height = 96
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ ゴシック"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yy/mm/dd"
end type

event modified;//////////////////////////////////////////////////////////////////////
//
// Test if the date entered is a Friday
//
//////////////////////////////////////////////////////////////////////

date	ld_friday

this.GetData (ld_friday)

if not DayName (ld_friday) = "金曜日" then
	Beep (1)
	this.text = ""
	this.SelectText (1, Len (this.text))
end if


	
end event

