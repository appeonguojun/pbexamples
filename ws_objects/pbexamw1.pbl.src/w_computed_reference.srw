$PBExportHeader$w_computed_reference.srw
$PBExportComments$他の計算フィールドを参照している計算フィールドを持つデータウィンドウ
forward
global type w_computed_reference from w_center
end type
type st_2 from statictext within w_computed_reference
end type
type st_1 from statictext within w_computed_reference
end type
type mle_help from multilineedit within w_computed_reference
end type
type cb_print_setup from commandbutton within w_computed_reference
end type
type cb_close from commandbutton within w_computed_reference
end type
type cb_print from commandbutton within w_computed_reference
end type
type dw_1 from datawindow within w_computed_reference
end type
end forward

global type w_computed_reference from w_center
integer x = 69
integer y = 32
integer width = 2793
integer height = 1868
string title = "計算フィールドの参照"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen pbm_custom01
st_2 st_2
st_1 st_1
mle_help mle_help
cb_print_setup cb_print_setup
cb_close cb_close
cb_print cb_print
dw_1 dw_1
end type
global w_computed_reference w_computed_reference

on ue_postopen;dw_1.SetTransObject (sqlca)
dw_1.Retrieve()
end on

on close;w_main.Show()
end on

on open;this.postevent("ue_postopen")
end on

on w_computed_reference.create
this.st_2=create st_2
this.st_1=create st_1
this.mle_help=create mle_help
this.cb_print_setup=create cb_print_setup
this.cb_close=create cb_close
this.cb_print=create cb_print
this.dw_1=create dw_1
this.Control[]={ this.st_2,&
this.st_1,&
this.mle_help,&
this.cb_print_setup,&
this.cb_close,&
this.cb_print,&
this.dw_1}
end on

on w_computed_reference.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_help)
destroy(this.cb_print_setup)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.dw_1)
end on

type st_2 from statictext within w_computed_reference
int X=1960
int Y=23
int Width=139
int Height=71
boolean Enabled=false
string Text="label."
boolean FocusRectangle=false
long TextColor=41943040
long BackColor=74481808
int TextSize=-9
int Weight=700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
end type

type st_1 from statictext within w_computed_reference
integer x = 82
integer y = 36
integer width = 128
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 16711680
long backcolor = 74481808
boolean enabled = false
string text = "青色"
boolean focusrectangle = false
end type

type mle_help from multilineedit within w_computed_reference
integer x = 210
integer y = 36
integer width = 2473
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "ラベルで示された計算フィールドは、他の計算フィールドを参照しています。"
boolean border = false
boolean displayonly = true
end type

type cb_print_setup from commandbutton within w_computed_reference
integer x = 1111
integer y = 1604
integer width = 437
integer height = 108
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "プリンタの設定(&S)"
end type

on clicked;if PrintSetup() = -1 then
	MessageBox ("プリンタの設定エラー", "プリンタの設定でエラーが発生しました。", exclamation!)
end if
end on

type cb_close from commandbutton within w_computed_reference
integer x = 1589
integer y = 1604
integer width = 234
integer height = 108
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

on clicked;Close (parent)
end on

type cb_print from commandbutton within w_computed_reference
integer x = 855
integer y = 1604
integer width = 224
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "印刷(&P)"
end type

on clicked;dw_1.Print()
end on

type dw_1 from datawindow within w_computed_reference
integer x = 23
integer y = 148
integer width = 2711
integer height = 1380
integer taborder = 10
string dataobject = "d_dept_emp_stats"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

