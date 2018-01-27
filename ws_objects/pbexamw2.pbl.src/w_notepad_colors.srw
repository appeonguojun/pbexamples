$PBExportHeader$w_notepad_colors.srw
$PBExportComments$メモ帳のテキスト カラーの選択
forward
global type w_notepad_colors from w_center
end type
type cb_cancel from commandbutton within w_notepad_colors
end type
type cb_ok from commandbutton within w_notepad_colors
end type
type uo_colors from u_color_selection within w_notepad_colors
end type
end forward

global type w_notepad_colors from w_center
integer x = 965
integer y = 572
integer width = 1001
integer height = 776
string title = "テキストの色の変更"
windowtype windowtype = response!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_cancel cb_cancel
cb_ok cb_ok
uo_colors uo_colors
end type
global w_notepad_colors w_notepad_colors

type variables
MultiLineEdit   imle_parm
end variables

on open;long	ll_fillcolor


//////////////////////////////////////////////////////////////////////
// Obtain the MultiLineEdit from the message object
//////////////////////////////////////////////////////////////////////
imle_parm = message.powerobjectparm
ll_fillcolor = imle_parm.TextColor


//////////////////////////////////////////////////////////////////////
// Initialize the user object color changer to the current text color of the
// MultiLineEdit.
//////////////////////////////////////////////////////////////////////
uo_colors.uf_set_rgb (ll_fillcolor)


end on

on w_notepad_colors.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.uo_colors=create uo_colors
this.Control[]={ this.cb_cancel,&
this.cb_ok,&
this.uo_colors}
end on

on w_notepad_colors.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.uo_colors)
end on

type cb_cancel from commandbutton within w_notepad_colors
integer x = 521
integer y = 536
integer width = 265
integer height = 108
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

on clicked;close (parent)
end on

type cb_ok from commandbutton within w_notepad_colors
integer x = 224
integer y = 536
integer width = 247
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "OK"
boolean default = true
end type

on clicked;// Set the text color to the RGB value specified by the user object

imle_parm.textcolor = uo_colors.uf_get_rgb()
close (parent)
end on

type uo_colors from u_color_selection within w_notepad_colors
integer x = 114
integer y = 40
integer height = 460
integer taborder = 10
boolean border = false
end type

on uo_colors.destroy
call u_color_selection::destroy
end on

