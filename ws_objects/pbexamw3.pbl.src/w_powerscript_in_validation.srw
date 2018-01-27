$PBExportHeader$w_powerscript_in_validation.srw
$PBExportComments$入力条件則においてPowerScript関数をコールし、また、複雑な入力条件則の例を持つデータウィンドウ
forward
global type w_powerscript_in_validation from w_center
end type
type st_8 from statictext within w_powerscript_in_validation
end type
type st_7 from statictext within w_powerscript_in_validation
end type
type st_6 from statictext within w_powerscript_in_validation
end type
type st_5 from statictext within w_powerscript_in_validation
end type
type st_4 from statictext within w_powerscript_in_validation
end type
type st_3 from statictext within w_powerscript_in_validation
end type
type cb_1 from commandbutton within w_powerscript_in_validation
end type
type dw_1 from datawindow within w_powerscript_in_validation
end type
type st_2 from statictext within w_powerscript_in_validation
end type
type st_1 from statictext within w_powerscript_in_validation
end type
end forward

global type w_powerscript_in_validation from w_center
integer x = 192
integer y = 260
integer width = 2552
integer height = 1227
string title = "データウィンドウの入力条件則"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
cb_1 cb_1
dw_1 dw_1
st_2 st_2
st_1 st_1
end type
global w_powerscript_in_validation w_powerscript_in_validation

on open;//open event
//Set the tranasaction object and retrieve data into the datawindow.
//The validation rules that exist for this example are contained in the datawindow

dw_1.SetTransObject (sqlca)

dw_1.Retrieve ()

end on

on w_powerscript_in_validation.create
int iCurrent
call super::create
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.cb_1=create cb_1
this.dw_1=create dw_1
this.st_2=create st_2
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_8
this.Control[iCurrent+2]=this.st_7
this.Control[iCurrent+3]=this.st_6
this.Control[iCurrent+4]=this.st_5
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.dw_1
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.st_1
end on

on w_powerscript_in_validation.destroy
call super::destroy
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.st_2)
destroy(this.st_1)
end on

on close;w_main.show()
end on

type st_8 from statictext within w_powerscript_in_validation
integer x = 64
integer y = 807
integer width = 500
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "その他    < 9,000,000"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_7 from statictext within w_powerscript_in_validation
integer x = 64
integer y = 757
integer width = 520
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = " 200       < 6,000,000"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_powerscript_in_validation
integer x = 64
integer y = 693
integer width = 520
integer height = 75
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = " 100       < 6,500,000"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_5 from statictext within w_powerscript_in_validation
integer x = 20
integer y = 53
integer width = 452
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS UI Gothic"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "入力条件則"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_powerscript_in_validation
integer x = 64
integer y = 629
integer width = 448
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "部署         給与"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_powerscript_in_validation
integer x = 20
integer y = 338
integer width = 612
integer height = 242
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_powerscript_in_validation
integer x = 1088
integer y = 949
integer width = 356
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

on clicked;close(parent)
end on

type dw_1 from datawindow within w_powerscript_in_validation
integer x = 644
integer y = 117
integer width = 1792
integer height = 800
integer taborder = 10
string dataobject = "d_powerscript_function_validation"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_powerscript_in_validation
integer x = 20
integer y = 220
integer width = 584
integer height = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "dept テーブルに存在する ID"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_powerscript_in_validation
integer x = 20
integer y = 132
integer width = 596
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "部署ID:100より大きい数"
alignment alignment = center!
boolean focusrectangle = false
end type

