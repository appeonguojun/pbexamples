$PBExportHeader$w_style_uos.srw
$PBExportComments$ユーザオブジェクトとそれを継承したユーザ オブジェクトを持つウィンドウ
forward
global type w_style_uos from w_center
end type
type uo_2 from u_style_descendant within w_style_uos
end type
type cb_help from commandbutton within w_style_uos
end type
type cb_close from commandbutton within w_style_uos
end type
type uo_1 from u_style_ancestor within w_style_uos
end type
type gb_2 from groupbox within w_style_uos
end type
type gb_1 from groupbox within w_style_uos
end type
end forward

global type w_style_uos from w_center
integer x = 617
integer y = 216
integer width = 1687
integer height = 948
string title = "テキスト プロパティの変更"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
uo_2 uo_2
cb_help cb_help
cb_close cb_close
uo_1 uo_1
gb_2 gb_2
gb_1 gb_1
end type
global w_style_uos w_style_uos

on close;w_main.Show()
end on

on w_style_uos.create
this.uo_2=create uo_2
this.cb_help=create cb_help
this.cb_close=create cb_close
this.uo_1=create uo_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.uo_2,&
this.cb_help,&
this.cb_close,&
this.uo_1,&
this.gb_2,&
this.gb_1}
end on

on w_style_uos.destroy
destroy(this.uo_2)
destroy(this.cb_help)
destroy(this.cb_close)
destroy(this.uo_1)
destroy(this.gb_2)
destroy(this.gb_1)
end on

type uo_2 from u_style_descendant within w_style_uos
integer x = 128
integer y = 524
integer width = 978
integer height = 120
boolean border = false
end type

on uo_2.destroy
call u_style_descendant::destroy
end on

type cb_help from commandbutton within w_style_uos
integer x = 1367
integer y = 188
integer width = 247
integer height = 108
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ(&H)"
end type

on clicked;f_open_help ('w_style_uos')
end on

type cb_close from commandbutton within w_style_uos
integer x = 1367
integer y = 44
integer width = 247
integer height = 108
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

on clicked;close (parent)
end on

type uo_1 from u_style_ancestor within w_style_uos
int X=128
int Y=160
int Width=978
int Height=128
boolean Border=false
BorderStyle BorderStyle=StyleBox!
end type

on uo_1.destroy
call u_style_ancestor::destroy
end on

type gb_2 from groupbox within w_style_uos
integer x = 87
integer y = 452
integer width = 1047
integer height = 224
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 78682240
string text = "継承されたユーザオブジェクト"
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_style_uos
integer x = 87
integer y = 92
integer width = 1047
integer height = 224
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 78682240
string text = "ユーザオブジェクト"
borderstyle borderstyle = stylelowered!
end type

