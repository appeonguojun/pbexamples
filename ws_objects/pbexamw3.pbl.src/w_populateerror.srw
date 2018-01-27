$PBExportHeader$w_populateerror.srw
$PBExportComments$PopulateError 関数の使用例
forward
global type w_populateerror from w_center
end type
type cb_help from commandbutton within w_populateerror
end type
type cb_close from commandbutton within w_populateerror
end type
type st_3 from statictext within w_populateerror
end type
type st_2 from statictext within w_populateerror
end type
type st_1 from statictext within w_populateerror
end type
type sle_date from singlelineedit within w_populateerror
end type
type sle_number from singlelineedit within w_populateerror
end type
type sle_letter from singlelineedit within w_populateerror
end type
type cb_validate from commandbutton within w_populateerror
end type
end forward

global type w_populateerror from w_center
integer x = 712
integer y = 601
integer width = 1668
integer height = 960
string title = "PopulateError 関数"
long backcolor = 80242744
cb_help cb_help
cb_close cb_close
st_3 st_3
st_2 st_2
st_1 st_1
sle_date sle_date
sle_number sle_number
sle_letter sle_letter
cb_validate cb_validate
end type
global w_populateerror w_populateerror

type variables
Boolean	ib_Error = False
end variables

forward prototypes
public subroutine of_validate_letter ()
public subroutine of_validate_number ()
public subroutine of_validate_date ()
end prototypes

public subroutine of_validate_letter ();If Len(sle_letter.Text) <> 1 Then
	ib_Error = True
	PopulateError(1, "1文字のみ入力してください。")
	SignalError()
End If

If Not ((Lower(sle_letter.Text) >= "a") And (Lower(sle_letter.Text) <= "l")) Then
	ib_Error = True
	PopulateError(2, "文字は'A'から'L'までの値を入力してください。")
	SignalError()
End If

end subroutine

public subroutine of_validate_number ();If Not IsNumber(sle_number.Text) Then
	ib_Error = True
	PopulateError(3, "入力された値は数値ではありません。")
	SignalError()
End If

If (Integer(sle_number.Text) < 100) Or (Integer(sle_number.Text) > 1000) Then
	ib_Error = True
	PopulateError(4, "100 から 1000 までの数値を入力してください。")
	SignalError()
End If

end subroutine

public subroutine of_validate_date ();Date		ld_Today, ld_LastYear
Integer	li_Year, li_Month, li_Day

ld_Today = Today()
li_Year = Year(ld_Today)
li_Month = Month(ld_Today)
li_Day = Day(ld_Today)

ld_LastYear = Date(String(li_Year - 1) + "/" + String(li_Month) + "/" + String(li_Day))

If Not IsDate(sle_date.Text) Then
	ib_Error = True
	PopulateError(5, "入力された値は、日付形式ではありません。")
	SignalError()
End If

If (Date(sle_date.Text) < ld_LastYear) Or (Date(sle_date.Text) > ld_Today) Then
	ib_Error = True
	PopulateError(6, String(ld_LastYear) + " から " + String(ld_Today) + " までの日付を入力してください。")
	SignalError()
End If

end subroutine

on w_populateerror.create
int iCurrent
call super::create
this.cb_help=create cb_help
this.cb_close=create cb_close
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.sle_date=create sle_date
this.sle_number=create sle_number
this.sle_letter=create sle_letter
this.cb_validate=create cb_validate
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_help
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.sle_date
this.Control[iCurrent+7]=this.sle_number
this.Control[iCurrent+8]=this.sle_letter
this.Control[iCurrent+9]=this.cb_validate
end on

on w_populateerror.destroy
call super::destroy
destroy(this.cb_help)
destroy(this.cb_close)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_date)
destroy(this.sle_number)
destroy(this.sle_letter)
destroy(this.cb_validate)
end on

event close;w_main.Show()

end event

type cb_help from commandbutton within w_populateerror
integer x = 1108
integer y = 644
integer width = 260
integer height = 107
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ"
end type

event clicked;String				ls_Win

ls_win = parent.ClassName()

f_open_help(ls_win)
end event

type cb_close from commandbutton within w_populateerror
integer x = 664
integer y = 644
integer width = 260
integer height = 107
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる"
end type

event clicked;Close(Parent)

end event

type st_3 from statictext within w_populateerror
integer x = 116
integer y = 405
integer width = 956
integer height = 128
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "昨年の今日から今年の今日までの日付を入力してください(YYYY/MM/DD):"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_populateerror
integer x = 8
integer y = 252
integer width = 1060
integer height = 75
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "100 から 1000 までの数値を入力してください:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_populateerror
integer x = 96
integer y = 85
integer width = 872
integer height = 75
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "AからLまでの文字を入力してください:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_date from singlelineedit within w_populateerror
integer x = 1096
integer y = 412
integer width = 356
integer height = 92
integer taborder = 30
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

type sle_number from singlelineedit within w_populateerror
integer x = 1096
integer y = 245
integer width = 156
integer height = 92
integer taborder = 20
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

type sle_letter from singlelineedit within w_populateerror
integer x = 1096
integer y = 75
integer width = 132
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

type cb_validate from commandbutton within w_populateerror
integer x = 220
integer y = 644
integer width = 260
integer height = 107
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "検証"
boolean default = true
end type

event clicked;of_validate_letter()
of_validate_number()
of_validate_date()

If Not ib_Error Then
	MessageBox("有効", "入力された情報はすべて正しいです。", Information!)
Else
	ib_Error = False
End If

end event

