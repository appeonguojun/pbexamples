$PBExportHeader$w_runtime_printfunctions.srw
$PBExportComments$PB 8 - New Print Functions
forward
global type w_runtime_printfunctions from w_center
end type
type st_results from statictext within w_runtime_printfunctions
end type
type cb_run from commandbutton within w_runtime_printfunctions
end type
type lv_functions from listview within w_runtime_printfunctions
end type
type cb_close from commandbutton within w_runtime_printfunctions
end type
end forward

shared variables
string ss_return 
end variables

global type w_runtime_printfunctions from w_center
integer width = 2565
integer height = 1012
string title = "プリンタ関数"
boolean center = true
st_results st_results
cb_run cb_run
lv_functions lv_functions
cb_close cb_close
end type
global w_runtime_printfunctions w_runtime_printfunctions

type variables

end variables

on w_runtime_printfunctions.create
int iCurrent
call super::create
this.st_results=create st_results
this.cb_run=create cb_run
this.lv_functions=create lv_functions
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_results
this.Control[iCurrent+2]=this.cb_run
this.Control[iCurrent+3]=this.lv_functions
this.Control[iCurrent+4]=this.cb_close
end on

on w_runtime_printfunctions.destroy
call super::destroy
destroy(this.st_results)
destroy(this.cb_run)
destroy(this.lv_functions)
destroy(this.cb_close)
end on

event close;call super::close;Show ( w_main )
end event

event open;listviewitem lvi_item

lv_functions.AddColumn ("詳細", Left!, 800 )
lv_functions.AddColumn ("関数", Left!, 3000 )
lv_functions.AddItem ( "プリンタ情報を取得します。~tstring PrintGetPrinters ( )", 1 )
lv_functions.AddItem ( "現在のプリンタを取得します。~tstring PrintGetPrinter ( )", 1 )
lv_functions.AddItem ( "現在のプリンタを設定します。~tinteger PrintSetPrinter ( string printername )", 1 )
lv_functions.AddItem ( "プリンタの設定を行います。~tinteger PrintSetupPrinter ( )", 1 )
end event

type st_results from statictext within w_runtime_printfunctions
integer x = 728
integer y = 736
integer width = 1716
integer height = 174
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_run from commandbutton within w_runtime_printfunctions
integer x = 32
integer y = 743
integer width = 324
integer height = 92
integer taborder = 180
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "実行(&R)"
end type

event clicked;integer li_index, li_rc
string ls_copyto

li_index = lv_functions.SelectedIndex ( ) 

Choose Case li_index
	Case 1
		ss_return = PrintGetPrinters ( ) 
		st_results.Text = "プリンタ一覧: " + ss_return
	Case 2
		ss_return = PrintGetPrinter ( ) 
		st_results.Text = "現在のプリンタ: " + ss_return
	Case 3
		OpenWithParm ( w_runtime_filefunctions_popup, "プリンタの指定~t" + &
			ss_return + "~t使用するプリンタを指定してください。.~tno" )
		ss_return = Message.StringParm 
		If PrintSetPrinter ( ss_return )  = 1 Then
			st_results.Text = "現在のプリンタ: " + ss_return
		Else
			st_results.Text = "プリンタを変更できませんでした。"
		End If
	Case 4
		PrintSetupPrinter ( )

End Choose
end event

type lv_functions from listview within w_runtime_printfunctions
integer x = 24
integer y = 28
integer width = 2468
integer height = 683
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
listviewview view = listviewreport!
string largepicturename[] = {"Function!"}
long largepicturemaskcolor = 536870912
string smallpicturename[] = {"Function!"}
long smallpicturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

type cb_close from commandbutton within w_runtime_printfunctions
integer x = 368
integer y = 743
integer width = 324
integer height = 92
integer taborder = 170
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "終了(&E)"
end type

event clicked;Close ( Parent )
end event

