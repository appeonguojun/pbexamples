$PBExportHeader$w_step.srw
$PBExportComments$（レスポンス ウィンドウ）入力:  タイトル, "@", 詳細.  出力:  続行 1, キャンセル 0
forward
global type w_step from w_center
end type
type mle_description from multilineedit within w_step
end type
type cb_cancel from commandbutton within w_step
end type
type cb_proceed from commandbutton within w_step
end type
end forward

global type w_step from w_center
integer x = 695
integer y = 528
integer width = 1522
integer height = 868
boolean TitleBar=true
string Title="Untitled"
long BackColor=74481808
boolean ControlMenu=true
ToolBarAlignment ToolBarAlignment=AlignAtLeft!
WindowType WindowType=response!
mle_description mle_description
cb_cancel cb_cancel
cb_proceed cb_proceed
end type
global w_step w_step

on open;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Obtain the title and description from the message object.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string	ls_parm
int		li_pos


ls_parm = message.StringParm
li_pos = Pos (ls_parm, "@")
if li_pos > 0 then
	this.title = Left (ls_parm, li_pos - 1)
	mle_description.text = Mid (ls_parm, li_pos + 1)
else
	this.title = ls_parm
end if
end on

on w_step.create
int iCurrent
call super::create
this.mle_description=create mle_description
this.cb_cancel=create cb_cancel
this.cb_proceed=create cb_proceed
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_description
this.Control[iCurrent+2]=this.cb_cancel
this.Control[iCurrent+3]=this.cb_proceed
end on

on w_step.destroy
call super::destroy
destroy(this.mle_description)
destroy(this.cb_cancel)
destroy(this.cb_proceed)
end on

type mle_description from multilineedit within w_step
integer x = 41
integer y = 36
integer width = 1417
integer height = 508
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_cancel from commandbutton within w_step
integer x = 754
integer y = 604
integer width = 357
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "キャンセル(&C)"
boolean cancel = true
end type

on clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Return a value of 0, which will signify that cancel was hit.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CloseWithReturn (parent, 0)
end on

type cb_proceed from commandbutton within w_step
integer x = 402
integer y = 604
integer width = 311
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string Text="継続(&P)"
boolean default = true
end type

on clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Return a value of 1, which will signify that proceed was hit.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CloseWithReturn (parent, 1)
end on

