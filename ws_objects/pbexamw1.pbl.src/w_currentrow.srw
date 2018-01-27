$PBExportHeader$w_currentrow.srw
$PBExportComments$顧客情報を更新するときに CurrentRow 関数を使用しているサンプル プログラムです。
forward
global type w_currentrow from w_center
end type
type cb_help from commandbutton within w_currentrow
end type
type cb_cancel from commandbutton within w_currentrow
end type
type cb_update from commandbutton within w_currentrow
end type
type dw_1 from datawindow within w_currentrow
end type
end forward

global type w_currentrow from w_center
integer x = 5
integer y = 4
integer width = 2962
integer height = 1864
string title = "CurrentRow 関数"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen ( )
cb_help cb_help
cb_cancel cb_cancel
cb_update cb_update
dw_1 dw_1
end type
global w_currentrow w_currentrow

event ue_postopen;dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

end event

event open;call super::open;Post Event ue_postopen()

end event

on w_currentrow.create
int iCurrent
call super::create
this.cb_help=create cb_help
this.cb_cancel=create cb_cancel
this.cb_update=create cb_update
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_help
this.Control[iCurrent+2]=this.cb_cancel
this.Control[iCurrent+3]=this.cb_update
this.Control[iCurrent+4]=this.dw_1
end on

on w_currentrow.destroy
call super::destroy
destroy(this.cb_help)
destroy(this.cb_cancel)
destroy(this.cb_update)
destroy(this.dw_1)
end on

event close;Show(w_main)

end event

type cb_help from commandbutton within w_currentrow
integer x = 1751
integer y = 1652
integer width = 247
integer height = 88
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ"
end type

event clicked;f_open_help ("w_currentrow")

end event

type cb_cancel from commandbutton within w_currentrow
integer x = 1385
integer y = 1652
integer width = 287
integer height = 88
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "キャンセル"
boolean cancel = true
end type

event clicked;Close(Parent)

end event

type cb_update from commandbutton within w_currentrow
integer x = 1015
integer y = 1652
integer width = 247
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "更新"
end type

event clicked;dw_1.Update()

end event

type dw_1 from datawindow within w_currentrow
integer x = 5
integer y = 4
integer width = 2921
integer height = 1604
integer taborder = 20
string dataobject = "d_currentrow"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

