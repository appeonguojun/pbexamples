$PBExportHeader$w_notepad_replace.srw
$PBExportComments$文字列検索と置換; メモ帳に使用される
forward
global type w_notepad_replace from w_center
end type
type cb_search_and_verify from commandbutton within w_notepad_replace
end type
type cb_cancel from commandbutton within w_notepad_replace
end type
type cb_change_all from commandbutton within w_notepad_replace
end type
type cbx_uplow from checkbox within w_notepad_replace
end type
type sle_replace from singlelineedit within w_notepad_replace
end type
type sle_find_text from singlelineedit within w_notepad_replace
end type
type st_2 from statictext within w_notepad_replace
end type
type st_1 from statictext within w_notepad_replace
end type
end forward

global type w_notepad_replace from w_center
integer x = 626
integer y = 580
integer width = 1673
integer height = 776
string title = "テキスト置換"
windowtype windowtype = response!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_search_and_verify cb_search_and_verify
cb_cancel cb_cancel
cb_change_all cb_change_all
cbx_uplow cbx_uplow
sle_replace sle_replace
sle_find_text sle_find_text
st_2 st_2
st_1 st_1
end type
global w_notepad_replace w_notepad_replace

type variables
s_notepad_parms   istr_parm
end variables

forward prototypes
private subroutine wf_start_search (string as_parm)
end prototypes

private subroutine wf_start_search (string as_parm);//////////////////////////////////////////////////////////////////////
//
// Function: wf_start_search
//
// Purpose: Load the structure to return with the users specifications
//				for search string, replace string, and match upper/lower case
//
//	Scope: private
//
//	Arguments: as_parm
//
//	Returns: none
//
//////////////////////////////////////////////////////////////////////

// Check if user wants to match upper/lower case
if cbx_uplow.checked then
	istr_parm.uplow = true
else
	istr_parm.uplow = false
end if

istr_parm.find_string    = sle_find_text.text
istr_parm.replace_string = sle_replace.text
istr_parm.replace_event  = as_parm

CloseWithReturn (this, istr_parm)

end subroutine

on w_notepad_replace.create
int iCurrent
call super::create
this.cb_search_and_verify=create cb_search_and_verify
this.cb_cancel=create cb_cancel
this.cb_change_all=create cb_change_all
this.cbx_uplow=create cbx_uplow
this.sle_replace=create sle_replace
this.sle_find_text=create sle_find_text
this.st_2=create st_2
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_search_and_verify
this.Control[iCurrent+2]=this.cb_cancel
this.Control[iCurrent+3]=this.cb_change_all
this.Control[iCurrent+4]=this.cbx_uplow
this.Control[iCurrent+5]=this.sle_replace
this.Control[iCurrent+6]=this.sle_find_text
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_1
end on

on w_notepad_replace.destroy
call super::destroy
destroy(this.cb_search_and_verify)
destroy(this.cb_cancel)
destroy(this.cb_change_all)
destroy(this.cbx_uplow)
destroy(this.sle_replace)
destroy(this.sle_find_text)
destroy(this.st_2)
destroy(this.st_1)
end on

type cb_search_and_verify from commandbutton within w_notepad_replace
integer x = 160
integer y = 532
integer width = 523
integer height = 88
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
boolean enabled = false
string text = "置換(&V)"
boolean default = true
end type

on clicked;// Search and Verify based on user specifications

wf_start_search ("search_and_verify")

end on

type cb_cancel from commandbutton within w_notepad_replace
integer x = 1111
integer y = 532
integer width = 329
integer height = 88
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "キャンセル"
boolean cancel = true
end type

on clicked;// Close with a parm saying that the cancel button was hit

istr_parm.replace_event = "キャンセル"
CloseWithReturn (parent, istr_parm)
end on

type cb_change_all from commandbutton within w_notepad_replace
integer x = 715
integer y = 532
integer width = 359
integer height = 88
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
boolean enabled = false
string text = "全て置換(&A)"
end type

on clicked;// Change all ocurrences of text based on user specifications

wf_start_search ("change_all")


end on

type cbx_uplow from checkbox within w_notepad_replace
integer x = 425
integer y = 352
integer width = 896
integer height = 72
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "大文字と小文字を区別する(&M)"
borderstyle borderstyle = stylelowered!
end type

type sle_replace from singlelineedit within w_notepad_replace
integer x = 425
integer y = 216
integer width = 1152
integer height = 88
integer taborder = 20
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

type sle_find_text from singlelineedit within w_notepad_replace
event char_modified pbm_char
integer x = 425
integer y = 80
integer width = 1152
integer height = 88
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

on char_modified;// Enable the search buttons when a character has been entered

cb_search_and_verify.enabled = true
cb_change_all.enabled = true
end on

type st_2 from statictext within w_notepad_replace
integer x = 137
integer y = 224
integer width = 251
integer height = 104
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "置換後の文字列(&T):"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_notepad_replace
integer x = 123
integer y = 80
integer width = 265
integer height = 104
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "置換前の文字列(&S):"
alignment alignment = right!
boolean focusrectangle = false
end type

