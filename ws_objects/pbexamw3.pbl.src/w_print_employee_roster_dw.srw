$PBExportHeader$w_print_employee_roster_dw.srw
$PBExportComments$部署毎の従業員給与レポートを印刷します。データウィンドウのレポート機能と印刷機能を使用します。
forward
global type w_print_employee_roster_dw from w_center
end type
type cb_saveas from commandbutton within w_print_employee_roster_dw
end type
type cb_close from commandbutton within w_print_employee_roster_dw
end type
type st_please_wait from statictext within w_print_employee_roster_dw
end type
type cb_pr_setup from commandbutton within w_print_employee_roster_dw
end type
type cb_print from commandbutton within w_print_employee_roster_dw
end type
type cb_retrieve from commandbutton within w_print_employee_roster_dw
end type
type dw_employee_roster from datawindow within w_print_employee_roster_dw
end type
end forward

global type w_print_employee_roster_dw from w_center
integer x = 196
integer y = 299
integer width = 2716
integer height = 1977
string title = "グループカラムと計算カラムのサンプル"
windowstate windowstate = maximized!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen pbm_custom01
cb_saveas cb_saveas
cb_close cb_close
st_please_wait st_please_wait
cb_pr_setup cb_pr_setup
cb_print cb_print
cb_retrieve cb_retrieve
dw_employee_roster dw_employee_roster
end type
global w_print_employee_roster_dw w_print_employee_roster_dw

on ue_postopen;dw_employee_roster.SetTransObject(sqlca)
cb_retrieve.triggerevent("clicked")
end on

on open;//Open script for w_print_employee_roster_dw

this.postevent("ue_postopen")
end on

on w_print_employee_roster_dw.create
int iCurrent
call super::create
this.cb_saveas=create cb_saveas
this.cb_close=create cb_close
this.st_please_wait=create st_please_wait
this.cb_pr_setup=create cb_pr_setup
this.cb_print=create cb_print
this.cb_retrieve=create cb_retrieve
this.dw_employee_roster=create dw_employee_roster
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_saveas
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.st_please_wait
this.Control[iCurrent+4]=this.cb_pr_setup
this.Control[iCurrent+5]=this.cb_print
this.Control[iCurrent+6]=this.cb_retrieve
this.Control[iCurrent+7]=this.dw_employee_roster
end on

on w_print_employee_roster_dw.destroy
call super::destroy
destroy(this.cb_saveas)
destroy(this.cb_close)
destroy(this.st_please_wait)
destroy(this.cb_pr_setup)
destroy(this.cb_print)
destroy(this.cb_retrieve)
destroy(this.dw_employee_roster)
end on

on close;//Close script for w_print_employee_roster_dw

this.Hide( )
w_main.Show( )
end on

type cb_saveas from commandbutton within w_print_employee_roster_dw
integer x = 1568
integer y = 1653
integer width = 508
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "名前を付けて保存(&A)"
end type

on clicked;dw_employee_roster.SaveAs()
end on

type cb_close from commandbutton within w_print_employee_roster_dw
integer x = 2116
integer y = 1653
integer width = 244
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

on clicked;//Clicked script for cb_close

Close(parent)
end on

type st_please_wait from statictext within w_print_employee_roster_dw
boolean visible = false
integer x = 2376
integer y = 1653
integer width = 360
integer height = 114
integer textsize = -9
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long backcolor = 12632256
string text = "印刷しています。しばらくお待ちください..."
alignment alignment = center!
end type

type cb_pr_setup from commandbutton within w_print_employee_roster_dw
integer x = 1048
integer y = 1653
integer width = 480
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "プリンタの設定(&S)..."
end type

on clicked;//Clicked script for cb_pr_setup

if PrintSetup( ) = -1 then
	MessageBox("エラー","プリンタの設定が開けません。")
end if
end on

type cb_print from commandbutton within w_print_employee_roster_dw
integer x = 616
integer y = 1653
integer width = 408
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "レポート印刷(&P)"
end type

on clicked;//Clicked script for cb_print

//notice to user
st_please_wait.Show( )

//print datawindow object contents
dw_employee_roster.Print( )

//clear notice
st_please_wait.Hide( )
end on

type cb_retrieve from commandbutton within w_print_employee_roster_dw
integer x = 264
integer y = 1653
integer width = 312
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "検索(&R)"
end type

on clicked;//Clicked script for cb_retrieve


//load datawindow
dw_employee_roster.Retrieve( )

end on

type dw_employee_roster from datawindow within w_print_employee_roster_dw
integer x = 56
integer y = 21
integer width = 2536
integer height = 1593
integer taborder = 10
string dataobject = "d_print_employee_roster_dw"
boolean vscrollbar = true
end type

