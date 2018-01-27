$PBExportHeader$w_notepad_goto.srw
$PBExportComments$指定した行にジャンプ; メモ帳で使用されます。
forward
global type w_notepad_goto from w_center
end type
type cb_ok from commandbutton within w_notepad_goto
end type
type cb_cancel from commandbutton within w_notepad_goto
end type
type sle_linenum from singlelineedit within w_notepad_goto
end type
type st_1 from statictext within w_notepad_goto
end type
end forward

global type w_notepad_goto from w_center
integer x = 1016
integer y = 732
integer width = 892
integer height = 459
string title = "行移動"
windowtype windowtype = response!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_ok cb_ok
cb_cancel cb_cancel
sle_linenum sle_linenum
st_1 st_1
end type
global w_notepad_goto w_notepad_goto

type variables
MultiLineEdit   imle_parm
end variables

on open;// The calling window passes it's multilineedit as a parameter
imle_parm = message.powerobjectparm
end on

on w_notepad_goto.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.sle_linenum=create sle_linenum
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.cb_cancel
this.Control[iCurrent+3]=this.sle_linenum
this.Control[iCurrent+4]=this.st_1
end on

on w_notepad_goto.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.sle_linenum)
destroy(this.st_1)
end on

type cb_ok from commandbutton within w_notepad_goto
integer x = 168
integer y = 213
integer width = 248
integer height = 107
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "OK"
boolean default = true
end type

event clicked;//////////////////////////////////////////////////////////////////////
//
// Go to the line number specified by the user
//
//////////////////////////////////////////////////////////////////////

int	li_linenum, &
		li_loc, &
		li_line_len, &
		li_line_count, &  
		li_em_lineindex = 187


// Get the line number requested by the user
li_linenum = integer (sle_linenum.text)

// Get the Total line number in the MLE
li_line_count = imle_parm.LineCount ( )
//Checking for user line number bounds
if li_linenum = 0 Then li_linenum = 1
if li_linenum > li_line_count then li_linenum = li_line_count

// Send a notify message to the MLE to return the character position
// of the specified line number.
//Put the cursor at the beginning of the line istead of at the end
li_loc = Send (Handle (imle_parm), li_em_lineindex, li_linenum - 1, 0)
li_loc = li_loc + 1

imle_parm.SelectText (li_loc, 0)

Close (parent)

end event

type cb_cancel from commandbutton within w_notepad_goto
integer x = 456
integer y = 213
integer width = 272
integer height = 107
integer taborder = 20
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

type sle_linenum from singlelineedit within w_notepad_goto
event char_modified pbm_char
integer x = 448
integer y = 43
integer width = 328
integer height = 89
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string pointer = "arrow!"
long textcolor = 41943040
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

on char_modified;// Enable the OK button when a character has been entered

cb_ok.enabled = true
end on

on modified;if not IsNumber (this.text) then
	this.text = ''
end if
end on

type st_1 from statictext within w_notepad_goto
integer x = 40
integer y = 53
integer width = 372
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "行番号(&L):"
alignment alignment = right!
boolean focusrectangle = false
end type

