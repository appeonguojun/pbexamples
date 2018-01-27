$PBExportHeader$w_runtime_systemfunctions.srw
$PBExportComments$PB 8 - New System Functions
forward
global type w_runtime_systemfunctions from w_center
end type
type st_results from statictext within w_runtime_systemfunctions
end type
type cb_run from commandbutton within w_runtime_systemfunctions
end type
type lv_functions from listview within w_runtime_systemfunctions
end type
type cb_close from commandbutton within w_runtime_systemfunctions
end type
type ov_1 from oval within w_runtime_systemfunctions
end type
end forward

shared variables
string ss_return 
end variables

global type w_runtime_systemfunctions from w_center
integer width = 2564
integer height = 1013
string title = "システム関数の組み合わせ"
boolean center = true
st_results st_results
cb_run cb_run
lv_functions lv_functions
cb_close cb_close
ov_1 ov_1
end type
global w_runtime_systemfunctions w_runtime_systemfunctions

type variables

end variables

on w_runtime_systemfunctions.create
int iCurrent
call super::create
this.st_results=create st_results
this.cb_run=create cb_run
this.lv_functions=create lv_functions
this.cb_close=create cb_close
this.ov_1=create ov_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_results
this.Control[iCurrent+2]=this.cb_run
this.Control[iCurrent+3]=this.lv_functions
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.ov_1
end on

on w_runtime_systemfunctions.destroy
call super::destroy
destroy(this.st_results)
destroy(this.cb_run)
destroy(this.lv_functions)
destroy(this.cb_close)
destroy(this.ov_1)
end on

event close;call super::close;Show ( w_main )
end event

event open;listviewitem lvi_item

lv_functions.AddColumn ("詳細", Left!, 800 )
lv_functions.AddColumn ("関数", Left!, 3000 )
lv_functions.AddItem ( "指定のコントロールのためのヘルプをポップアップ表示します。~tinteger ShowPopupHelp(string helpfile,dragobject control, long contextid)", 1 )
lv_functions.AddItem ( "文字列の各単語の最初の文字を大文字に変換し、それ以外の文字を小文字に変換します。~tstring WordCap(string str)", 1 )
lv_functions.AddItem ( "文字列の中から指定された文字列を検索し、最後に検索した文字列の先頭文字の位置を返します。~tlong LastPos(string source, string target {, start})", 1 )
lv_functions.AddItem ( "フォルダの参照ダイアログを表示します。~tinteger GetFolder(string title, ref string directory)", 1 )
lv_functions.AddItem ( "色の設定ダイアログを表示します。~tinteger ChooseColor(ref long color {, ref long customcolors[]})", 1 )

end event

type st_results from statictext within w_runtime_systemfunctions
integer x = 704
integer y = 711
integer width = 1268
integer height = 107
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

type cb_run from commandbutton within w_runtime_systemfunctions
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

ov_1.Visible = False
Choose Case li_index
	Case 1
		int li_major, li_minor
		ContextInformation lcx_key

		/*  Get PB Version.    */
		ge_environment.GetContextService ( "ContextInformation", lcx_key)
		lcx_key.GetMajorVersion ( li_major )
		lcx_key.GetMinorVersion ( li_minor )
		//ShowPopupHelp ( "exampl" + String ( li_major ) + String ( li_minor ) + ".chm", this, 101 )
		ShowPopupHelp ( "exampl.chm", this, 101 )		//2017.10.10 modified by wukaichen, reason: change file name to exampl.chm

	Case 2
		OpenWithParm ( w_runtime_filefunctions_popup, "文字列の指定~t" + &
			ss_return + "~t変換する文字列を指定してください。~tno" )
		ss_return = Message.StringParm 
		st_results.Text = "変換された文字列: " + WordCap ( ss_return )
	
	Case 3
		string ls_text = "This is a test."
		st_results.Text = "'" + ls_text + "' の中で最後の 's' は " + String ( LastPos ( ls_text, "s" ) ) + " 文字目です。" 

	Case 4
		string ls_folder
		GetFolder ( "ディレクトリの参照", ls_folder)
		st_results.Text = ls_folder + " を選択しました。"

	Case 5
		long ll_color, ll_customcolors[]
		ov_1.Visible = True
		ChooseColor(ll_color, ll_customcolors[] ) 
		ov_1.FillColor = ll_color
		st_results.Text = "選択した色で円を表示します。"
		ov_1.Visible = True
End Choose


end event

type lv_functions from listview within w_runtime_systemfunctions
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

type cb_close from commandbutton within w_runtime_systemfunctions
integer x = 372
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

type ov_1 from oval within w_runtime_systemfunctions
boolean visible = false
integer linethickness = 4
long fillcolor = 12632256
integer x = 2244
integer y = 740
integer width = 164
integer height = 149
end type

