$PBExportHeader$w_runtime_filefunctions.srw
$PBExportComments$PB 8 - New File Functions
forward
global type w_runtime_filefunctions from w_center
end type
type st_results from statictext within w_runtime_filefunctions
end type
type cb_run from commandbutton within w_runtime_filefunctions
end type
type lv_functions from listview within w_runtime_filefunctions
end type
type cb_close from commandbutton within w_runtime_filefunctions
end type
end forward

shared variables
string ss_return 
end variables

global type w_runtime_filefunctions from w_center
integer width = 2564
integer height = 1013
string title = "ファイルシステム関数"
boolean center = true
st_results st_results
cb_run cb_run
lv_functions lv_functions
cb_close cb_close
end type
global w_runtime_filefunctions w_runtime_filefunctions

type variables

end variables

on w_runtime_filefunctions.create
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

on w_runtime_filefunctions.destroy
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
lv_functions.AddItem ( "カレントディレクトリを取得します。~tstring GetCurrentDirectory ( )", 1 )
lv_functions.AddItem ( "ディレクトリの存在チェックをします。~tboolean DirectoryExists ( string directoryname )", 1 )
lv_functions.AddItem ( "カレントディレクトリを変更します。~tinteger ChangeDirectory ( string directoryname )", 1 )
lv_functions.AddItem ( "ディレクトリを作成します。~tinteger CreateDirectory ( string directoryname )", 1 )
lv_functions.AddItem ( "ディレクトリを削除します。~tinteger RemoveDirectory ( string directoryname )", 1 )
lv_functions.AddItem ( "ファイルをコピーします。~tinteger FileCopy ( string sourcefile, string targetfile {,boolean replace} )", 1 )
lv_functions.AddItem ( "ファイルを移動します。~tinteger FileMove ( string sourcefile, string targetfile )", 1 )
end event

type st_results from statictext within w_runtime_filefunctions
integer x = 728
integer y = 736
integer width = 1716
integer height = 164
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

type cb_run from commandbutton within w_runtime_filefunctions
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
		ss_return = GetCurrentDirectory ( ) 
		
		st_results.Text = "カレントディレクトリは " + ss_return + " です。"
	Case 2
		OpenWithParm ( w_runtime_filefunctions_popup, "ディレクトリの指定~t" + &
			ss_return + "~t ディレクトリが存在する場合はディレクトリの名前を指定して下さい。~tno" )
			
		ss_return = Message.StringParm 
		If DirectoryExists ( ss_return ) Then 
			st_results.Text = "ディレクトリ '" + ss_return + "' は存在します。"
		Else
			st_results.Text = "ディレクトリ'" + ss_return + "'は存在しません。"
		End If

	Case 3
		OpenWithParm ( w_runtime_filefunctions_popup, "ディレクトリの変更~t" + &
			ss_return + "~t 変更するディレクトリ名を指定して下さい。~tno" )
		ss_return = Message.StringParm 
		If ChangeDirectory ( ss_return ) = 1 Then 
			st_results.Text = "ディレクトリ'" + ss_return + "'は変更されました。"
		Else
			st_results.Text = "ディレクトリ'" + ss_return + "'は変更できませんでした。"
		End If
		
	Case 4
		OpenWithParm ( w_runtime_filefunctions_popup, "新規ディレクトリの作成 ~t" + &
			ss_return + "~t ディレクトリ名を作成して下さい。~tno" )
		ss_return = Message.StringParm 
		If CreateDirectory ( ss_return ) = 1 Then 
			st_results.Text = "ディレクトリ '" + ss_return + "' が作成されました。"
		Else
			st_results.Text = "ディレクトリ '" + ss_return + "' は作成できませんでした。"
		End If
	Case 5
		OpenWithParm ( w_runtime_filefunctions_popup, "ディレクトリの削除~t" + &
			ss_return + "~t 削除するディレクトリ名を指定して下さい。~tno" )
		ss_return = Message.StringParm 
		
		li_rc = MessageBox ( "ディレクトリの削除", ss_return + " ディレクトリを削除しますか？", Question!, YesNo!, 2 ) 
		If li_rc = 1 Then
			If RemoveDirectory ( ss_return ) = 1 Then 
				st_results.Text = "ディレクトリ '" + ss_return + "' は削除されました。"
			Else
				st_results.Text = "ディレクトリ '" + ss_return + "' は削除できませんでした。"
			End If
		End If
	Case 6
		OpenWithParm ( w_runtime_filefunctions_popup, "ファイルのコピー~t" + &
			ss_return + "~t コピー元のファイル名を指定して下さい。~tyes" )
		ss_return = Message.StringParm
		OpenWithParm ( w_runtime_filefunctions_popup, "ファイル指定 ~t" + &
			ss_return + "~t コピー先のファイル名を指定して下さい。~tyes" )
		ls_copyto = Message.StringParm
		li_rc = 1
		If FileExists ( ls_copyto ) Then
			li_rc = MessageBox ( "ファイルのコピー", ss_return + " に置き換えますか?", Question!, YesNo!, 2 ) 
		End If
		If li_rc = 1 Then
			If FileCopy ( ss_return, ls_copyto, True ) = 1 Then 
				st_results.Text = "ファイル '" + ss_return + "' はコピーされました。"
			Else
				st_results.Text = "ファイル '" + ss_return + "' はコピーできませんでした。"
			End If
		End If

	Case 7
		OpenWithParm ( w_runtime_filefunctions_popup, "ファイルの移動~t" + &
			ss_return + "~t移動元のファイル名を指定して下さい。~tyes" )
		ss_return = Message.StringParm
		OpenWithParm ( w_runtime_filefunctions_popup, "ファイルの指定~t" + &
			ss_return + "~t移動先のファイル名を指定して下さい。~tyes" )
		ls_copyto = Message.StringParm
		li_rc = 1
		If FileExists ( ls_copyto ) Then
			li_rc = MessageBox ( "ファイルの移動", ss_return + " を置き換えますか?", Question!, YesNo!, 2 ) 
		End If
		If li_rc = 1 Then
			If FileMove ( ss_return, ls_copyto ) = 1 Then 
				st_results.Text = "ファイル '" + ss_return + "' は移動されました。"
			Else
				st_results.Text = "ファイル '" + ss_return + "' は移動できませんでした"
			End If
		End If

End Choose
end event

type lv_functions from listview within w_runtime_filefunctions
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

type cb_close from commandbutton within w_runtime_filefunctions
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

