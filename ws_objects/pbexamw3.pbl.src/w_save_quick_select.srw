$PBExportHeader$w_save_quick_select.srw
$PBExportComments$クイック セレクト データウィンドウ保存時に使用されるレスポンス ダイアログ(ライブラリ名、データウィンドウ名、コメント)
forward
global type w_save_quick_select from w_center
end type
type cb_1 from commandbutton within w_save_quick_select
end type
type sle_library from singlelineedit within w_save_quick_select
end type
type cb_cancel from commandbutton within w_save_quick_select
end type
type cb_save from commandbutton within w_save_quick_select
end type
type mle_comments from multilineedit within w_save_quick_select
end type
type st_3 from statictext within w_save_quick_select
end type
type st_2 from statictext within w_save_quick_select
end type
type sle_dwname from singlelineedit within w_save_quick_select
end type
type st_1 from statictext within w_save_quick_select
end type
end forward

global type w_save_quick_select from w_center
integer x = 420
integer y = 309
integer width = 1984
integer height = 772
string title = "データウィンドウの保存"
windowtype windowtype = response!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_1 cb_1
sle_library sle_library
cb_cancel cb_cancel
cb_save cb_save
mle_comments mle_comments
st_3 st_3
st_2 st_2
sle_dwname sle_dwname
st_1 st_1
end type
global w_save_quick_select w_save_quick_select

on w_save_quick_select.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.sle_library=create sle_library
this.cb_cancel=create cb_cancel
this.cb_save=create cb_save
this.mle_comments=create mle_comments
this.st_3=create st_3
this.st_2=create st_2
this.sle_dwname=create sle_dwname
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.sle_library
this.Control[iCurrent+3]=this.cb_cancel
this.Control[iCurrent+4]=this.cb_save
this.Control[iCurrent+5]=this.mle_comments
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.sle_dwname
this.Control[iCurrent+9]=this.st_1
end on

on w_save_quick_select.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.sle_library)
destroy(this.cb_cancel)
destroy(this.cb_save)
destroy(this.mle_comments)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_dwname)
destroy(this.st_1)
end on

type cb_1 from commandbutton within w_save_quick_select
integer x = 1668
integer y = 36
integer width = 260
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "参照(&B)"
end type

event clicked;string ls_filename, ls_file
integer li_rc

li_rc = GetFileOpenName ( "ライブラリの選択", &
		+ ls_filename, ls_file, "PBL", &
		+ "PB ライブラリ (*.PBL),*.PBL" )

If li_rc = 1 Then sle_library.Text = ls_filename
end event

type sle_library from singlelineedit within w_save_quick_select
integer x = 444
integer y = 39
integer width = 1212
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_cancel from commandbutton within w_save_quick_select
integer x = 1092
integer y = 530
integer width = 352
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "キャンセル(&C)"
boolean cancel = true
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_save
///////////////////////////////////////////////////////////////////////////////////////////////////////

close(parent)
end event

type cb_save from commandbutton within w_save_quick_select
integer x = 764
integer y = 530
integer width = 296
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "保存(&S)"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_save
///////////////////////////////////////////////////////////////////////////////////////////////////////


// this event will take the datawindow that was passed to it and request a pbl and 
// datawindow filename to save it under

string 	ls_libraryname,  &
			ls_dwsyntax,     &
			ls_importerrorbuffer
integer	li_returncode
datawindow ldw_passeddw

//get the datawindow passed to the window
ldw_passeddw = create datawindow
ldw_passeddw = message.powerobjectparm

//check for library (pbl) selection
ls_libraryname = sle_library.Text
if ls_libraryname = "" then
	messagebox("ライブラリ エラー", "データウィンドウ オブジェクトを格納するライブラリを選択してください。")
	setFocus(sle_library)
	return
end if

//check for datawindow name
if sle_dwname.text = "" then 
	messagebox("データウィンドウ名エラー", "データウィンドウ名を入力してください。")
	setFocus(sle_dwName)
	return
end if

//no spaces allowed
if  pos(sle_dwname.text, " ") > 0 then 
	messagebox("データウィンドウ名エラー", "データウィンドウ名に空白があります。　再入力してください。")
	setFocus(sle_dwName)
	return
end if

//get the datawindow syntax in the form of a string
ls_dwsyntax = ldw_passeddw.Object.DataWindow.Syntax

//make sure no errors were found
if (pos(ls_dwsyntax, "!") > 0 or pos(ls_dwsyntax, "?") > 0) and len(ls_dwsyntax) = 1 Then
	messagebox("データウィンドウ構文エラー", ls_dwsyntax)
	return
end if

//move the string into the pbl 
li_returncode =	LibraryImport(ls_libraryname, sle_dwName.text, ImportDataWindow!, &
						ls_dwsyntax, ls_importerrorbuffer, mle_comments.text)

If li_returncode < 1 then
	messagebox("データウィンドウのインポート エラー", ls_importerrorbuffer)
	return
end if


close(Parent)
end event

type mle_comments from multilineedit within w_save_quick_select
integer x = 448
integer y = 295
integer width = 1468
integer height = 188
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_save_quick_select
integer x = 96
integer y = 334
integer width = 340
integer height = 117
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "データウィンドウコメント:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_save_quick_select
integer x = 8
integer y = 185
integer width = 436
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
string text = "データウィンドウ名:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_dwname from singlelineedit within w_save_quick_select
integer x = 448
integer y = 167
integer width = 1468
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
boolean autohscroll = false
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_save_quick_select
integer x = 28
integer y = 57
integer width = 412
integer height = 92
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "ライブラリの選択:"
alignment alignment = right!
boolean focusrectangle = false
end type

