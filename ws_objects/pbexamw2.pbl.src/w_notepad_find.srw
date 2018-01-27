$PBExportHeader$w_notepad_find.srw
$PBExportComments$文字列の検索; メモ帳で使用されます。
forward
global type w_notepad_find from w_center
end type
type cb_ok from commandbutton within w_notepad_find
end type
type cbx_uplow from checkbox within w_notepad_find
end type
type sle_find_text from singlelineedit within w_notepad_find
end type
type cb_cancel from commandbutton within w_notepad_find
end type
type st_1 from statictext within w_notepad_find
end type
end forward

global type w_notepad_find from w_center
integer x = 760
integer y = 640
integer width = 1404
integer height = 661
string title = "テキスト検索"
windowtype windowtype = response!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_ok cb_ok
cbx_uplow cbx_uplow
sle_find_text sle_find_text
cb_cancel cb_cancel
st_1 st_1
end type
global w_notepad_find w_notepad_find

type variables
s_notepad_parms   istr_parm
multilineedit   imle_parm
end variables

on open;imle_parm = message.powerobjectparm
end on

on w_notepad_find.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.cbx_uplow=create cbx_uplow
this.sle_find_text=create sle_find_text
this.cb_cancel=create cb_cancel
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.cbx_uplow
this.Control[iCurrent+3]=this.sle_find_text
this.Control[iCurrent+4]=this.cb_cancel
this.Control[iCurrent+5]=this.st_1
end on

on w_notepad_find.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.cbx_uplow)
destroy(this.sle_find_text)
destroy(this.cb_cancel)
destroy(this.st_1)
end on

type cb_ok from commandbutton within w_notepad_find
integer x = 384
integer y = 409
integer width = 280
integer height = 89
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
boolean enabled = false
string text = "OK(&O)"
boolean default = true
end type

event clicked;//////////////////////////////////////////////////////////////////////
//
// Find the text that was specified in the multilineedit that was
// passed to this window.
//
//////////////////////////////////////////////////////////////////////

int		li_loc
string	ls_source


// Check for matching upper/lower case

if cbx_uplow.checked then
	istr_parm.uplow = true
	li_loc = Pos (imle_parm.text, sle_find_text.text)
else
	istr_parm.uplow = false
	ls_source = Lower (imle_parm.text)
	li_loc = Pos (ls_source, Lower (sle_find_text.text))
end if

if li_loc = 0 then
	MessageBox (parent.title, "文字列 " + sle_find_text.text + " が見つかりませんでした。", StopSign!)
	Disable (m_notepad.m_search.m_findnexttext)
else
	imle_parm.SelectText (li_loc, Len (sle_find_text.text))
	Enable (m_notepad.m_search.m_findnexttext)
	istr_parm.find_string = sle_find_text.text
end if

istr_parm.find_loc = li_loc
CloseWithReturn (parent, istr_parm)
end event

type cbx_uplow from checkbox within w_notepad_find
integer x = 408
integer y = 220
integer width = 868
integer height = 71
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "大文字と小文字を区別する(&M)"
end type

type sle_find_text from singlelineedit within w_notepad_find
event char_modified pbm_char
integer x = 408
integer y = 60
integer width = 868
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
borderstyle borderstyle = stylelowered!
end type

on char_modified;// Enable the OK button when a character is entered

cb_ok.enabled = true
end on

type cb_cancel from commandbutton within w_notepad_find
integer x = 712
integer y = 409
integer width = 280
integer height = 89
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "キャンセル"
boolean cancel = true
end type

on clicked;Close (parent)
end on

type st_1 from statictext within w_notepad_find
integer x = 28
integer y = 68
integer width = 360
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "検索文字列(&S):"
alignment alignment = right!
boolean focusrectangle = false
end type

