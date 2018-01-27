$PBExportHeader$w_date_window.srw
$PBExportComments$2000 年問題のサンプル コントロールの日付表示のウィンドウ
forward
global type w_date_window from w_center
end type
type cb_subtract from commandbutton within w_date_window
end type
type cb_add from commandbutton within w_date_window
end type
type st_6 from statictext within w_date_window
end type
type rb_year from radiobutton within w_date_window
end type
type rb_month from radiobutton within w_date_window
end type
type rb_day from radiobutton within w_date_window
end type
type mle_1 from multilineedit within w_date_window
end type
type st_3 from statictext within w_date_window
end type
type sle_1 from singlelineedit within w_date_window
end type
type em_1 from editmask within w_date_window
end type
type gb_2 from groupbox within w_date_window
end type
type gb_1 from groupbox within w_date_window
end type
type rb_1 from radiobutton within w_date_window
end type
type rb_2 from radiobutton within w_date_window
end type
type gb_3 from groupbox within w_date_window
end type
end forward

global type w_date_window from w_center
integer x = 5
integer y = 4
integer width = 1362
integer height = 1340
string title = "コントロールの2000年対応"
long backcolor = 80242744
cb_subtract cb_subtract
cb_add cb_add
st_6 st_6
rb_year rb_year
rb_month rb_month
rb_day rb_day
mle_1 mle_1
st_3 st_3
sle_1 sle_1
em_1 em_1
gb_2 gb_2
gb_1 gb_1
rb_1 rb_1
rb_2 rb_2
gb_3 gb_3
end type
global w_date_window w_date_window

type variables
Boolean	ib_LongDate = False, &
	ib_LastYear = False, &
	ib_Mod = False
Date	id_Date
Integer	ii_Day, ii_Month, ii_Year


end variables

forward prototypes
public function boolean of_is_leap_year (integer ai_year)
public subroutine of_days ()
public subroutine of_mod ()
public subroutine of_initialize ()
public subroutine of_update ()
end prototypes

public function boolean of_is_leap_year (integer ai_year);//	The year is a leap year if it is divisible by 4, but not by 100, unless it is also divisible by 400
If ((Mod(ai_Year, 4) = 0 And Mod(ai_Year,100) <> 0) Or (Mod(ai_Year,400) = 0)) Then
	Return True
Else
	Return False
End If

end function

public subroutine of_days ();Choose Case ii_Month
	Case 09, 04, 06, 11
		If ii_Day > 30 Then
			ii_Day = 30
		End If
	Case 02
		If ii_Day > 28 Then
			If of_is_leap_year(ii_Year) Then 
				ii_Day = 29
			Else
				ii_Day = 28
			End If
		End If
End Choose

end subroutine

public subroutine of_mod ();If Not ib_Mod Then
	MessageBox("日付テスト", "日付が入力されていないので本日の日付を使用します。", Information!)
	id_Date = Today()
	em_1.Text = String(id_Date, "yy/mm/dd")
	ib_Mod = True
End If

end subroutine

public subroutine of_initialize ();of_mod()

ii_Month = Month(id_Date)
ii_Year = Year(id_Date)
ii_Day = Day(id_Date)

end subroutine

public subroutine of_update ();//updates the edit mask and sle control
String	ls_Date

ls_Date = String(ii_Year) + "/" + String(ii_Month)  + "/" + String(ii_Day)
id_Date = Date(ls_Date)

em_1.Text = String(id_Date)
If ib_LongDate Then
	sle_1.Text = String(id_Date, "yyyy年mm月dd日, dddd")
Else
	sle_1.Text = String(id_Date, "yyyy/mm/dd")
End If

end subroutine

on w_date_window.create
this.cb_subtract=create cb_subtract
this.cb_add=create cb_add
this.st_6=create st_6
this.rb_year=create rb_year
this.rb_month=create rb_month
this.rb_day=create rb_day
this.mle_1=create mle_1
this.st_3=create st_3
this.sle_1=create sle_1
this.em_1=create em_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.gb_3=create gb_3
this.Control[]={this.cb_subtract,&
this.cb_add,&
this.st_6,&
this.rb_year,&
this.rb_month,&
this.rb_day,&
this.mle_1,&
this.st_3,&
this.sle_1,&
this.em_1,&
this.gb_2,&
this.gb_1,&
this.rb_1,&
this.rb_2,&
this.gb_3}
end on

on w_date_window.destroy
destroy(this.cb_subtract)
destroy(this.cb_add)
destroy(this.st_6)
destroy(this.rb_year)
destroy(this.rb_month)
destroy(this.rb_day)
destroy(this.mle_1)
destroy(this.st_3)
destroy(this.sle_1)
destroy(this.em_1)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.gb_3)
end on

event open;call super::open;SetNull(id_Date)

end event

type cb_subtract from commandbutton within w_date_window
integer x = 878
integer y = 1020
integer width = 297
integer height = 108
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "引く"
end type

event clicked;of_initialize()

If rb_day.Checked Then
	// subtract a day
	id_Date = RelativeDate(id_Date, -1)
	ii_Day = Day(id_Date)
	ii_Month = Month(id_Date)
	ii_Year = Year(id_Date)
Else
	If rb_month.Checked Then
		// subtract a month
		If ii_Month = 1 Then
			ii_Year --
			ii_Month = 12
		Else
			ii_Month --
			of_days()
		End If
	Else
		If rb_year.Checked Then
			// subtract a year
			ii_Year --
			of_days()	
		End If
	End If
End If

of_update()

end event

type cb_add from commandbutton within w_date_window
integer x = 878
integer y = 876
integer width = 297
integer height = 108
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "足す"
end type

event clicked;of_initialize()

If rb_day.Checked Then
	// add a day
	id_Date = RelativeDate(id_Date, 1)
	ii_Day = Day(id_Date)
	ii_Month = Month(id_Date)
	ii_Year = Year(id_Date)
Else
	If rb_month.Checked Then
		// add a month
		If ii_Month = 12 Then
			ii_Year ++
			ii_Month = 1
		Else
			ii_Month ++
			of_days()
		End If
	Else
		If rb_year.Checked Then
			// add a year
			ii_Year ++
			of_days()	
		End If
	End If
End If

of_update()

end event

type st_6 from statictext within w_date_window
integer x = 146
integer y = 788
integer width = 887
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 80242744
boolean enabled = false
string text = "表示されている日付を変更します"
boolean focusrectangle = false
end type

type rb_year from radiobutton within w_date_window
integer x = 210
integer y = 1028
integer width = 430
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 80242744
string text = "年"
end type

type rb_month from radiobutton within w_date_window
integer x = 210
integer y = 960
integer width = 430
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 80242744
string text = "月"
end type

type rb_day from radiobutton within w_date_window
integer x = 210
integer y = 892
integer width = 466
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 80242744
string text = "日"
boolean checked = true
end type

type mle_1 from multilineedit within w_date_window
integer y = 24
integer width = 1303
integer height = 104
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 80242744
string text = "お好きな日付を下のエディットマスク コントロールに入力して下さい。"
boolean border = false
end type

type st_3 from statictext within w_date_window
integer y = 524
integer width = 535
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 80242744
boolean enabled = false
string text = "日付の結果表示:"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_date_window
integer x = 110
integer y = 588
integer width = 1102
integer height = 92
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 80242744
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type em_1 from editmask within w_date_window
integer x = 110
integer y = 140
integer width = 256
integer height = 80
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yy/mm/dd"
end type

event modified;ib_Mod = True
id_Date = Date(em_1.Text)

end event

type gb_2 from groupbox within w_date_window
integer x = 105
integer y = 716
integer width = 1106
integer height = 460
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 80242744
string text = "日付計算"
end type

type gb_1 from groupbox within w_date_window
boolean visible = false
integer x = 1184
integer y = 236
integer width = 827
integer height = 268
integer taborder = 20
integer textsize = -11
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 12632256
long backcolor = 16777215
string text = "none"
end type

type rb_1 from radiobutton within w_date_window
integer x = 155
integer y = 300
integer width = 430
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 80242744
string text = "yyyy/mm/dd"
end type

event clicked;of_mod()

sle_1.Text = String(id_Date, "yyyy/mm/dd")
ib_LongDate = False

end event

type rb_2 from radiobutton within w_date_window
integer x = 155
integer y = 372
integer width = 658
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 80242744
string text = "yyyy年mm月dd日, 曜日"
end type

event clicked;of_mod()

sle_1.Text = String(id_Date, "yyyy年mm月dd日, dddd")
ib_LongDate = True

end event

type gb_3 from groupbox within w_date_window
integer x = 110
integer y = 244
integer width = 745
integer height = 240
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
string text = "表示書式:"
borderstyle borderstyle = stylelowered!
end type

