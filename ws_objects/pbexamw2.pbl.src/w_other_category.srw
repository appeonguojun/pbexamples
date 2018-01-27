$PBExportHeader$w_other_category.srw
$PBExportComments$グラフに「その他」項目を作成する方法を示したサンプル プログラム
forward
global type w_other_category from w_center
end type
type cb_close from commandbutton within w_other_category
end type
type cb_help from commandbutton within w_other_category
end type
type dw_1 from datawindow within w_other_category
end type
end forward

global type w_other_category from w_center
integer x = 215
integer y = 188
integer width = 2487
integer height = 1540
string title = "グラフへの「その他」の項目の追加"
long backcolor = 79741120
toolbaralignment toolbaralignment = alignatleft!
cb_close cb_close
cb_help cb_help
dw_1 dw_1
end type
global w_other_category w_other_category

event open;call super::open;dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

end event

on w_other_category.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.cb_help=create cb_help
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.cb_help
this.Control[iCurrent+3]=this.dw_1
end on

on w_other_category.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.cb_help)
destroy(this.dw_1)
end on

event close;Show(w_main)

end event

type cb_close from commandbutton within w_other_category
integer x = 2167
integer y = 180
integer width = 247
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる"
boolean cancel = true
end type

event clicked;Close(Parent)

end event

type cb_help from commandbutton within w_other_category
integer x = 2167
integer y = 36
integer width = 247
integer height = 84
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ"
end type

event clicked;f_open_help ("w_other_category")

end event

type dw_1 from datawindow within w_other_category
integer x = 32
integer y = 36
integer width = 2075
integer height = 1376
string dataobject = "d_other_category"
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

