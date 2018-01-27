$PBExportHeader$w_uo_sampler.srw
$PBExportComments$入力チェックや日付のスクロール、処理の進行状況を示すインジケータ機能をもつユーザ オブジェクトを含むウィンドウ
forward
global type w_uo_sampler from w_center
end type
type st_4 from statictext within w_uo_sampler
end type
type cb_help from commandbutton within w_uo_sampler
end type
type st_8 from statictext within w_uo_sampler
end type
type cb_1 from commandbutton within w_uo_sampler
end type
type cb_close from commandbutton within w_uo_sampler
end type
type st_overtype from statictext within w_uo_sampler
end type
type sle_overtype from u_overtype_edit within w_uo_sampler
end type
type uo_progress_bar from u_progress_bar within w_uo_sampler
end type
type uo_date_scroller from u_date_scroller within w_uo_sampler
end type
type st_5 from statictext within w_uo_sampler
end type
type uo_range_checker from u_range_checker within w_uo_sampler
end type
type sle_from from singlelineedit within w_uo_sampler
end type
type sle_to from singlelineedit within w_uo_sampler
end type
type st_3 from statictext within w_uo_sampler
end type
type st_2 from statictext within w_uo_sampler
end type
type st_1 from statictext within w_uo_sampler
end type
type st_6 from statictext within w_uo_sampler
end type
type uo_3 from u_numeric_edit within w_uo_sampler
end type
type uo_2 from u_date_edit within w_uo_sampler
end type
type st_7 from statictext within w_uo_sampler
end type
end forward

global type w_uo_sampler from w_center
int X=192
int Y=376
int Width=2537
int Height=1176
boolean TitleBar=true
string Title="ユーザオブジェクトサンプル"
long BackColor=74481808
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
ToolBarAlignment ToolBarAlignment=AlignAtLeft!
st_4 st_4
cb_help cb_help
st_8 st_8
cb_1 cb_1
cb_close cb_close
st_overtype st_overtype
sle_overtype sle_overtype
uo_progress_bar uo_progress_bar
uo_date_scroller uo_date_scroller
st_5 st_5
uo_range_checker uo_range_checker
sle_from sle_from
sle_to sle_to
st_3 st_3
st_2 st_2
st_1 st_1
st_6 st_6
uo_3 uo_3
uo_2 uo_2
st_7 st_7
end type
global w_uo_sampler w_uo_sampler

type variables
dec {2}  ic_pct_complete

end variables

on timer;//////////////////////////////////////////////////////////////////////
// Update the progress meter each time the timer event is triggered.
// When the progress meter is at 100%, stop triggering the timer evetn.
//////////////////////////////////////////////////////////////////////

ic_pct_complete = ic_pct_complete + 10
uo_progress_bar.uf_set_position (ic_pct_complete)

if ic_pct_complete >= 100.0  then 
	Timer (0)
	Beep (1)
end if
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////
// Initialize date scroller to today
//////////////////////////////////////////////////////////////////////
uo_date_scroller.uf_set_date (Today())


//////////////////////////////////////////////////////////////////////
// Initialize range checker default values
//////////////////////////////////////////////////////////////////////
uo_range_checker.uf_set_range (Long (sle_from.text), Long (sle_to.text))

//////////////////////////////////////////////////////////////////////
// Overtype mode example only works on Windows
//////////////////////////////////////////////////////////////////////
If (ge_Environment.OSType <> windows!) And (ge_Environment.OSType <> windowsnt!) Then
	st_overtype.Visible = False
	sle_overtype.Visible = False
End If

end event

on close;w_main.Show()
end on

on w_uo_sampler.create
int iCurrent
call super::create
this.st_4=create st_4
this.cb_help=create cb_help
this.st_8=create st_8
this.cb_1=create cb_1
this.cb_close=create cb_close
this.st_overtype=create st_overtype
this.sle_overtype=create sle_overtype
this.uo_progress_bar=create uo_progress_bar
this.uo_date_scroller=create uo_date_scroller
this.st_5=create st_5
this.uo_range_checker=create uo_range_checker
this.sle_from=create sle_from
this.sle_to=create sle_to
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.st_6=create st_6
this.uo_3=create uo_3
this.uo_2=create uo_2
this.st_7=create st_7
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_4
this.Control[iCurrent+2]=this.cb_help
this.Control[iCurrent+3]=this.st_8
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.cb_close
this.Control[iCurrent+6]=this.st_overtype
this.Control[iCurrent+7]=this.sle_overtype
this.Control[iCurrent+8]=this.uo_progress_bar
this.Control[iCurrent+9]=this.uo_date_scroller
this.Control[iCurrent+10]=this.st_5
this.Control[iCurrent+11]=this.uo_range_checker
this.Control[iCurrent+12]=this.sle_from
this.Control[iCurrent+13]=this.sle_to
this.Control[iCurrent+14]=this.st_3
this.Control[iCurrent+15]=this.st_2
this.Control[iCurrent+16]=this.st_1
this.Control[iCurrent+17]=this.st_6
this.Control[iCurrent+18]=this.uo_3
this.Control[iCurrent+19]=this.uo_2
this.Control[iCurrent+20]=this.st_7
end on

on w_uo_sampler.destroy
call super::destroy
destroy(this.st_4)
destroy(this.cb_help)
destroy(this.st_8)
destroy(this.cb_1)
destroy(this.cb_close)
destroy(this.st_overtype)
destroy(this.sle_overtype)
destroy(this.uo_progress_bar)
destroy(this.uo_date_scroller)
destroy(this.st_5)
destroy(this.uo_range_checker)
destroy(this.sle_from)
destroy(this.sle_to)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_6)
destroy(this.uo_3)
destroy(this.uo_2)
destroy(this.st_7)
end on

type st_4 from statictext within w_uo_sampler
integer x = 1184
integer y = 85
integer width = 352
integer height = 85
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "ＭＳ ゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "(YY/MM/DD)"
boolean focusrectangle = false
end type

type cb_help from commandbutton within w_uo_sampler
integer x = 2172
integer y = 181
integer width = 292
integer height = 107
integer taborder = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ(&H)"
end type

on clicked;f_open_help (parent.ClassName())
end on

type st_8 from statictext within w_uo_sampler
integer x = 564
integer y = 924
integer width = 488
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "処理率(%):"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_uo_sampler
integer x = 40
integer y = 903
integer width = 480
integer height = 107
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "処理の進行状況(&P)"
end type

on clicked;//////////////////////////////////////////////////////////////////////
// Start the progress meter by setting the timer event on the window
//////////////////////////////////////////////////////////////////////

ic_pct_complete = 0.0
uo_progress_bar.uf_set_position (ic_pct_complete)

Timer (0.7)


end on

type cb_close from commandbutton within w_uo_sampler
integer x = 2172
integer y = 39
integer width = 292
integer height = 107
integer taborder = 90
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

type st_overtype from statictext within w_uo_sampler
integer x = 128
integer y = 370
integer width = 532
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "上書きモード:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_overtype from u_overtype_edit within w_uo_sampler
integer x = 704
integer y = 370
integer width = 756
integer height = 89
integer taborder = 30
long textcolor = 41943040
long backcolor = 1086902488
end type

type uo_progress_bar from u_progress_bar within w_uo_sampler
integer x = 1080
integer y = 924
integer width = 1176
integer height = 75
end type

on uo_progress_bar.destroy
call u_progress_bar::destroy
end on

type uo_date_scroller from u_date_scroller within w_uo_sampler
integer x = 704
integer y = 626
integer width = 416
integer height = 139
integer taborder = 70
long backcolor = 74481808
end type

on uo_date_scroller.destroy
call u_date_scroller::destroy
end on

type st_5 from statictext within w_uo_sampler
integer x = 284
integer y = 654
integer width = 376
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "日付スクロール:"
alignment alignment = right!
boolean focusrectangle = false
end type

type uo_range_checker from u_range_checker within w_uo_sampler
integer x = 704
integer y = 512
integer width = 728
integer height = 89
integer taborder = 40
long textcolor = 41943040
long backcolor = 1086902488
end type

on uo_range_checker.destroy
call u_range_checker::destroy
end on

type sle_from from singlelineedit within w_uo_sampler
integer x = 1640
integer y = 505
integer width = 312
integer height = 89
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string pointer = "arrow!"
long textcolor = 41943040
string text = "0"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

on modified;//////////////////////////////////////////////////////////////////////
// Call user object function to set the lower and upper range limits.
//////////////////////////////////////////////////////////////////////

uo_range_checker.uf_set_range (Long (sle_from.text), Long (sle_to.text))
end on

type sle_to from singlelineedit within w_uo_sampler
integer x = 2152
integer y = 505
integer width = 312
integer height = 89
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string pointer = "arrow!"
long textcolor = 41943040
string text = "100"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

on modified;//////////////////////////////////////////////////////////////////////
// Call user object function to set the lower and upper range limits.
//////////////////////////////////////////////////////////////////////

uo_range_checker.uf_set_range (Long (sle_from.text), Long (sle_to.text))
end on

type st_3 from statictext within w_uo_sampler
integer x = 76
integer y = 228
integer width = 584
integer height = 57
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "数値のみ有効:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_uo_sampler
integer x = 120
integer y = 85
integer width = 540
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "金曜日の日付のみ:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_uo_sampler
integer x = 140
integer y = 512
integer width = 520
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "指定領域のチェック:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within w_uo_sampler
integer x = 1436
integer y = 508
integer width = 188
integer height = 82
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "最小値:"
alignment alignment = right!
boolean focusrectangle = false
end type

type uo_3 from u_numeric_edit within w_uo_sampler
integer x = 704
integer y = 199
integer width = 504
integer height = 124
integer taborder = 20
long backcolor = 74481808
end type

on uo_3.destroy
call u_numeric_edit::destroy
end on

type uo_2 from u_date_edit within w_uo_sampler
integer x = 704
integer y = 57
integer width = 480
integer taborder = 10
long backcolor = 74481808
end type

on uo_2.destroy
call u_date_edit::destroy
end on

type st_7 from statictext within w_uo_sampler
integer x = 1968
integer y = 508
integer width = 176
integer height = 82
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "最大値:"
alignment alignment = right!
boolean focusrectangle = false
end type

