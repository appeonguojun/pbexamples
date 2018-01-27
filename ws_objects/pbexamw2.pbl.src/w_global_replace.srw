$PBExportHeader$w_global_replace.srw
$PBExportComments$グローバル Replace 関数の多重定義デモ
forward
global type w_global_replace from w_center
end type
type cb_reset from commandbutton within w_global_replace
end type
type em_end from editmask within w_global_replace
end type
type em_start from editmask within w_global_replace
end type
type st_syntax from statictext within w_global_replace
end type
type st_6 from statictext within w_global_replace
end type
type cb_help from commandbutton within w_global_replace
end type
type sle_num from singlelineedit within w_global_replace
end type
type st_5 from statictext within w_global_replace
end type
type cbx_case from checkbox within w_global_replace
end type
type st_4 from statictext within w_global_replace
end type
type sle_new from singlelineedit within w_global_replace
end type
type sle_old from singlelineedit within w_global_replace
end type
type st_3 from statictext within w_global_replace
end type
type st_2 from statictext within w_global_replace
end type
type st_1 from statictext within w_global_replace
end type
type cb_close from commandbutton within w_global_replace
end type
type cb_ok from commandbutton within w_global_replace
end type
type mle_1 from multilineedit within w_global_replace
end type
end forward

global type w_global_replace from w_center
integer x = 452
integer y = 53
integer width = 1816
integer height = 1436
string title = "グローバル Replace 関数"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_reset cb_reset
em_end em_end
em_start em_start
st_syntax st_syntax
st_6 st_6
cb_help cb_help
sle_num sle_num
st_5 st_5
cbx_case cbx_case
st_4 st_4
sle_new sle_new
sle_old sle_old
st_3 st_3
st_2 st_2
st_1 st_1
cb_close cb_close
cb_ok cb_ok
mle_1 mle_1
end type
global w_global_replace w_global_replace

type variables
String	is_Text
end variables

forward prototypes
public function integer of_global_replace (ref string as_source, string as_old, string as_new)
public function integer of_global_replace (ref string as_Source, string as_Old, string as_New, boolean ab_UseCase)
public function integer of_global_replace (ref string as_Source, string as_Old, string as_New, boolean ab_UseCase, integer ai_Start, integer ai_End)
public function string of_get_syntax ()
end prototypes

public function integer of_global_replace (ref string as_source, string as_old, string as_new);//  This function replaces all occurrences in as_Source of as_Old with as_New
//  it returns the number of replacements made.

Integer	li_Pos, li_OldLen, li_NewLen, li_Cnt

li_OldLen = Len(as_Old)
li_NewLen = Len(as_New)


//Find the first occurrence of as_Old
li_Pos = Pos(Upper(as_Source), Upper(as_Old), 1)

Do While li_Pos > 0
	as_Source = Replace(as_Source, li_Pos, li_OldLen, as_New)
	li_Pos = Pos(Upper(as_Source), Upper(as_Old), (li_Pos + li_NewLen))
	li_Cnt ++
Loop

Return li_Cnt

end function

public function integer of_global_replace (ref string as_Source, string as_Old, string as_New, boolean ab_UseCase);//  This function replaces all occurrences in as_Source of as_Old with as_New
//  it returns the number of replacements made.

Integer	li_Pos, li_OldLen, li_NewLen, li_Cnt

li_OldLen = Len(as_Old)
li_NewLen = Len(as_New)


//Find the first occurrence of as_Old
If ab_UseCase Then
	li_Pos = Pos(as_Source, as_Old, 1)
Else
	li_Pos = Pos(Upper(as_Source), Upper(as_Old), 1)
End if

Do While li_Pos > 0
	as_Source = Replace(as_Source, li_Pos, li_OldLen, as_New)
	
	If ab_UseCase Then
		li_Pos = Pos(as_Source, as_Old, (li_Pos + li_NewLen))
	Else
		li_Pos = Pos(Upper(as_Source), Upper(as_Old), (li_Pos + li_NewLen))
	End if

	li_Cnt ++
Loop

Return li_Cnt

end function

public function integer of_global_replace (ref string as_Source, string as_Old, string as_New, boolean ab_UseCase, integer ai_Start, integer ai_End);//  This function replaces all occurrences in as_Source of as_Old with as_New
//  it returns the number of replacements made.

Integer		li_Pos, li_OldLen, li_NewLen, li_Cnt
Boolean		lb_GetLen

li_OldLen = Len(as_Old)
li_NewLen = Len(as_New)

// If ai_End is 0 then replace to the end of as_Source
If ai_End = 0 Then
	ai_End = Len(as_Source)
	lb_GetLen = True
Else
	lb_GetLen = False
End if

//Find the first occurrence of as_Old
If ab_UseCase Then
	li_Pos = Pos(as_Source, as_Old, ai_Start)
Else
	li_Pos = Pos(Upper(as_Source), Upper(as_Old), ai_Start)
End if

Do While (li_Pos > 0) And (li_Pos < ai_End)
	as_Source = Replace(as_Source, li_Pos, li_OldLen, as_New)
	
	If ab_UseCase Then
		li_Pos = Pos(as_Source, as_Old, (li_Pos + li_NewLen))
	Else
		li_Pos = Pos(Upper(as_Source), Upper(as_Old), (li_Pos + li_NewLen))
	End if

	// Because the length of as_Source may have changed, get it again
	If lb_GetLen Then
		ai_End = Len(as_Source)
	End if

	li_Cnt ++
Loop

Return li_Cnt

end function

public function string of_get_syntax ();String	ls_Syntax
Double	ldb_Start, ldb_End

ls_Syntax = "of_global_replace(mle_1.Text, ~"" + sle_old.Text + "~", ~"" + sle_new.Text + "~""

If cbx_case.Checked Then
	ls_Syntax = ls_Syntax + ", True"
End if

em_start.GetData(ldb_Start)
em_end.GetData(ldb_End)

If ldb_Start > 0 Then
	If Not cbx_case.Checked Then
		ls_Syntax = ls_Syntax + ", False"
	End if
	
	ls_Syntax = ls_Syntax + ", " + String(ldb_Start) + ", " + String(ldb_End)
End if

ls_Syntax = ls_Syntax + ")"

Return ls_Syntax

end function

on w_global_replace.destroy
call super::destroy
destroy(this.cb_reset)
destroy(this.em_end)
destroy(this.em_start)
destroy(this.st_syntax)
destroy(this.st_6)
destroy(this.cb_help)
destroy(this.sle_num)
destroy(this.st_5)
destroy(this.cbx_case)
destroy(this.st_4)
destroy(this.sle_new)
destroy(this.sle_old)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_close)
destroy(this.cb_ok)
destroy(this.mle_1)
end on

event open;call super::open;
is_Text = &
			"このサンプルコードは PowerBuilder の機能を実用の例を使って紹介します。" + &
			"サンプルコードは、トピックによってグループ分けされていますが、" + &
			"一つの機能について複数のサンプルが取り上げている場合があります。" + &
			"それぞれのサンプルで使用されているコーディングテクニックは、各機能について一つの最適な実装例です。" + &
			"開発者は、サンプルの中からコードをコピーし、自分のアプリケーションの一部として使用することが出来ます。"

mle_1.Text = is_Text

end event

on w_global_replace.create
int iCurrent
call super::create
this.cb_reset=create cb_reset
this.em_end=create em_end
this.em_start=create em_start
this.st_syntax=create st_syntax
this.st_6=create st_6
this.cb_help=create cb_help
this.sle_num=create sle_num
this.st_5=create st_5
this.cbx_case=create cbx_case
this.st_4=create st_4
this.sle_new=create sle_new
this.sle_old=create sle_old
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_close=create cb_close
this.cb_ok=create cb_ok
this.mle_1=create mle_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_reset
this.Control[iCurrent+2]=this.em_end
this.Control[iCurrent+3]=this.em_start
this.Control[iCurrent+4]=this.st_syntax
this.Control[iCurrent+5]=this.st_6
this.Control[iCurrent+6]=this.cb_help
this.Control[iCurrent+7]=this.sle_num
this.Control[iCurrent+8]=this.st_5
this.Control[iCurrent+9]=this.cbx_case
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.sle_new
this.Control[iCurrent+12]=this.sle_old
this.Control[iCurrent+13]=this.st_3
this.Control[iCurrent+14]=this.st_2
this.Control[iCurrent+15]=this.st_1
this.Control[iCurrent+16]=this.cb_close
this.Control[iCurrent+17]=this.cb_ok
this.Control[iCurrent+18]=this.mle_1
end on

event close;Show(w_main)

end event

type cb_reset from commandbutton within w_global_replace
integer x = 1384
integer y = 757
integer width = 288
integer height = 85
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "リセット(&R)"
end type

event clicked;mle_1.Text = is_Text

end event

type em_end from editmask within w_global_replace
integer x = 968
integer y = 807
integer width = 192
integer height = 85
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#####"
string displaydata = ""
end type

event modified;st_syntax.Text = of_get_syntax()

end event

type em_start from editmask within w_global_replace
integer x = 352
integer y = 807
integer width = 192
integer height = 85
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#####"
string displaydata = ""
end type

event modified;st_syntax.Text = of_get_syntax()

end event

type st_syntax from statictext within w_global_replace
integer x = 16
integer y = 1084
integer width = 1688
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "of_global_replace(mle_1.Text, ~"example~", ~"fragment~")"
boolean border = true
long bordercolor = 8388608
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_global_replace
integer x = 8
integer y = 1010
integer width = 452
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "関数呼び出し構文:"
alignment alignment = right!
long bordercolor = 8388608
boolean focusrectangle = false
end type

type cb_help from commandbutton within w_global_replace
event clicked pbm_bnclicked
integer x = 1384
integer y = 971
integer width = 288
integer height = 85
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ(&H)"
end type

event clicked;f_open_help ("w_global_replace")

end event

type sle_num from singlelineedit within w_global_replace
integer x = 952
integer y = 1202
integer width = 192
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_global_replace
integer x = 212
integer y = 1205
integer width = 712
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "置換件数:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_case from checkbox within w_global_replace
integer x = 224
integer y = 693
integer width = 644
integer height = 60
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
string text = "大文字/小文字の区別"
end type

event clicked;st_syntax.Text = of_get_syntax()

end event

type st_4 from statictext within w_global_replace
integer x = 628
integer y = 821
integer width = 336
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "終了位置(文字):"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_new from singlelineedit within w_global_replace
integer x = 1028
integer y = 540
integer width = 616
integer height = 75
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
string text = "フラグメント"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;st_syntax.Text = of_get_syntax()

end event

type sle_old from singlelineedit within w_global_replace
integer x = 224
integer y = 540
integer width = 616
integer height = 75
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
string text = "サンプル"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;st_syntax.Text = of_get_syntax()

end event

type st_3 from statictext within w_global_replace
integer y = 821
integer width = 344
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "開始位置(文字):"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_global_replace
integer x = 880
integer y = 548
integer width = 144
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "置換:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_global_replace
integer x = 4
integer y = 548
integer width = 212
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "検索:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_global_replace
integer x = 1384
integer y = 864
integer width = 288
integer height = 85
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

event clicked;Close(Parent)

end event

type cb_ok from commandbutton within w_global_replace
integer x = 1384
integer y = 644
integer width = 288
integer height = 85
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "OK(&O)"
end type

event clicked;Integer	li_Cnt
Double	ldb_Start, ldb_End

em_start.GetData(ldb_Start)
em_end.GetData(ldb_End)
If ldb_Start > 0 Then
	li_Cnt = of_global_replace(mle_1.Text, sle_old.Text, sle_new.Text, cbx_case.Checked, &
											ldb_Start, ldb_End)

Elseif cbx_case.Checked Then
	li_Cnt = of_global_replace(mle_1.Text, sle_old.Text, sle_new.Text, cbx_case.Checked)

Else
	li_Cnt = of_global_replace(mle_1.Text, sle_old.Text, sle_new.Text)
End If

sle_num.Text = String(li_Cnt)

end event

type mle_1 from multilineedit within w_global_replace
integer x = 16
integer y = 18
integer width = 1636
integer height = 452
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

