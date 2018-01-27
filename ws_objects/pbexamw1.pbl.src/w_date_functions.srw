$PBExportHeader$w_date_functions.srw
$PBExportComments$入力した曜日/日付の関係が正しいかチェック
forward
global type w_date_functions from w_center
end type
type cb_help from commandbutton within w_date_functions
end type
type st_1 from statictext within w_date_functions
end type
type st_3 from statictext within w_date_functions
end type
type st_2 from statictext within w_date_functions
end type
type dw_1 from datawindow within w_date_functions
end type
type cb_ok from commandbutton within w_date_functions
end type
type cb_cancel from commandbutton within w_date_functions
end type
type gb_1 from groupbox within w_date_functions
end type
end forward

global type w_date_functions from w_center
int X=523
int Y=503
int Width=1885
int Height=935
boolean TitleBar=true
string Title="日付関数"
long BackColor=74481808
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
ToolBarAlignment ToolBarAlignment=AlignAtLeft!
cb_help cb_help
st_1 st_1
st_3 st_3
st_2 st_2
dw_1 dw_1
cb_ok cb_ok
cb_cancel cb_cancel
gb_1 gb_1
end type
global w_date_functions w_date_functions

event open;call super::open;/////////////////////////////////////////////////////////////////////
// initialize datawindow, set test date default as current date
/////////////////////////////////////////////////////////////////////

dw_1.InsertRow (0)
dw_1.Object.test_date[1] = Today()
end event

on close;w_main.Show()
end on

on w_date_functions.create
this.cb_help=create cb_help
this.st_1=create st_1
this.st_3=create st_3
this.st_2=create st_2
this.dw_1=create dw_1
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.gb_1=create gb_1
this.Control[]={ this.cb_help,&
this.st_1,&
this.st_3,&
this.st_2,&
this.dw_1,&
this.cb_ok,&
this.cb_cancel,&
this.gb_1}
end on

on w_date_functions.destroy
destroy(this.cb_help)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_1)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.gb_1)
end on

type cb_help from commandbutton within w_date_functions
integer x = 1504
integer y = 260
integer width = 302
integer height = 100
integer taborder = 40
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

type st_1 from statictext within w_date_functions
integer x = 82
integer y = 460
integer width = 1641
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
boolean focusrectangle = false
end type

type st_3 from statictext within w_date_functions
integer x = 82
integer y = 628
integer width = 1664
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
boolean focusrectangle = false
end type

type st_2 from statictext within w_date_functions
integer x = 82
integer y = 560
integer width = 1664
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_date_functions
integer x = 41
integer y = 48
integer width = 1001
integer height = 248
integer taborder = 10
string dataobject = "d_date_functions"
boolean border = false
end type

type cb_ok from commandbutton within w_date_functions
integer x = 1504
integer y = 24
integer width = 302
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "テスト"
boolean default = true
end type

event clicked;////////////////////////////////////////////////////////////////////
// Purpose:  Determine whether the specified test date is valid for
//				 the specified day name.  Display information as to
//				 whether the date is valid or invalid.  
////////////////////////////////////////////////////////////////////

date		ld_testdate, &
			ld_closest
string	ls_dayname, &
			ls_when
long		ll_days


/////////////////////////////////////////////////////////////////////
// Check if both columns have been entered on the datawindow
/////////////////////////////////////////////////////////////////////
if dw_1.AcceptText() = -1 then
	return
end if


/////////////////////////////////////////////////////////////////////
// Get the data
/////////////////////////////////////////////////////////////////////
ls_dayname = dw_1.Object.day_name[1]
ld_testdate = dw_1.Object.test_date[1]


/////////////////////////////////////////////////////////////////////
// call the check_dayname function to determine whether the test date
// is valid for the day name.
/////////////////////////////////////////////////////////////////////
if f_check_dayname (ls_dayname, ld_testdate) then
	// Display message to show that test date is valid for day name
	st_1.text = 'はい、' + String (ld_testdate, 'yyyy/mm/dd') + ' は' + ls_dayname + 'です。'
	st_2.text = ''
	st_3.text = ''
else
	st_1.text = 'いいえ、' + String (ld_testdate, 'yyyy/mm/dd') + ' は' + &
					DayName (ld_testdate) + 'です。'

	// Determine which date is the closest [dayname] to [testdate]
	ld_closest = f_closest_date (ls_dayname, ld_testdate)
	st_2.text = String (ld_testdate, 'yyyy/mm/dd') + ' に最も近い' + &
      			ls_dayname + 'は ' + String (ld_closest, 'yyyy/mm/dd') + ' で、'

	// Determine the relative number of days from closest date to test date
	ll_days = DaysAfter (ld_testdate, ld_closest)
	if ll_days > 0 then
		ls_when = ' 後 '
	else
		ls_when = ' 前 '
	end if
	st_3.text = String (ld_testdate, 'yyyy/mm/dd') + ' から ' + String (Abs (ll_days)) + ' 日' + &
					ls_when + 'です。'
end if



end event

type cb_cancel from commandbutton within w_date_functions
integer x = 1504
integer y = 136
integer width = 302
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

on clicked;Close (parent)
end on

type gb_1 from groupbox within w_date_functions
integer x = 41
integer y = 368
integer width = 1765
integer height = 412
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "テスト結果"
borderstyle borderstyle = stylelowered!
end type

