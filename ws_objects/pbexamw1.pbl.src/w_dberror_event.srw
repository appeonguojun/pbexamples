$PBExportHeader$w_dberror_event.srw
$PBExportComments$既存のdberrorメッセージを表示せずに、カスタム メッセージを表示するサンプル
forward
global type w_dberror_event from w_center
end type
type cb_add from commandbutton within w_dberror_event
end type
type rb_none from radiobutton within w_dberror_event
end type
type rb_custom from radiobutton within w_dberror_event
end type
type rb_default from radiobutton within w_dberror_event
end type
type cb_retrieve from commandbutton within w_dberror_event
end type
type cb_update from commandbutton within w_dberror_event
end type
type cb_close from commandbutton within w_dberror_event
end type
type cb_help from commandbutton within w_dberror_event
end type
type dw_1 from datawindow within w_dberror_event
end type
type gb_1 from groupbox within w_dberror_event
end type
end forward

global type w_dberror_event from w_center
integer x = 457
integer y = 376
integer width = 2016
integer height = 1172
string title = "DBError イベント"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_add cb_add
rb_none rb_none
rb_custom rb_custom
rb_default rb_default
cb_retrieve cb_retrieve
cb_update cb_update
cb_close cb_close
cb_help cb_help
dw_1 dw_1
gb_1 gb_1
end type
global w_dberror_event w_dberror_event

on w_dberror_event.create
this.cb_add=create cb_add
this.rb_none=create rb_none
this.rb_custom=create rb_custom
this.rb_default=create rb_default
this.cb_retrieve=create cb_retrieve
this.cb_update=create cb_update
this.cb_close=create cb_close
this.cb_help=create cb_help
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={ this.cb_add,&
this.rb_none,&
this.rb_custom,&
this.rb_default,&
this.cb_retrieve,&
this.cb_update,&
this.cb_close,&
this.cb_help,&
this.dw_1,&
this.gb_1}
end on

on w_dberror_event.destroy
destroy(this.cb_add)
destroy(this.rb_none)
destroy(this.rb_custom)
destroy(this.rb_default)
destroy(this.cb_retrieve)
destroy(this.cb_update)
destroy(this.cb_close)
destroy(this.cb_help)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event close;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// close script for w_dberror_event
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Show front-end to Code Examples
w_main.Show()
end event

event open;call super::open;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// open script for w_dberror_event
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Set Transaction Object for the DataWindow
dw_1.SetTransObject (sqlca)
end event

type cb_add from commandbutton within w_dberror_event
integer x = 1627
integer y = 156
integer width = 329
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "行追加(&A)"
end type

event clicked;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Clicked script for cb_add
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Add a new row into the DataWindow
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long	ll_row

ll_row = dw_1.InsertRow (0)
dw_1.ScrollToRow(ll_row)
dw_1.SetColumn(1)
dw_1.SetFocus()
end event

type rb_none from radiobutton within w_dberror_event
integer x = 96
integer y = 264
integer width = 1024
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "エラー メッセージを表示しない"
borderstyle borderstyle = stylelowered!
end type

type rb_custom from radiobutton within w_dberror_event
integer x = 96
integer y = 192
integer width = 1184
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "カスタマイズした エラー メッセージ"
borderstyle borderstyle = stylelowered!
end type

type rb_default from radiobutton within w_dberror_event
integer x = 96
integer y = 120
integer width = 1029
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "デフォルトの PB エラー メッセージ"
boolean checked = true
borderstyle borderstyle = stylelowered!
end type

type cb_retrieve from commandbutton within w_dberror_event
integer x = 1627
integer y = 36
integer width = 329
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "検索(&R)"
end type

event clicked;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_retrieve
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Retrieve the DataWindow.
// If the Retrieve function fails (return code of -1), the dberror event of the DataWindow will be triggered.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_1.Retrieve()
end event

type cb_update from commandbutton within w_dberror_event
integer x = 1627
integer y = 276
integer width = 329
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "更新(&U)"
end type

event clicked;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_update
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Update the DataWindow.
// If the Update function fails (return code of -1), the dberror event of the DataWindow will be triggered.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if dw_1.Update() = 1 then
	commit;
else
	rollback;
end if
end event

type cb_close from commandbutton within w_dberror_event
integer x = 1627
integer y = 396
integer width = 329
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_close 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

close (parent)
end event

type cb_help from commandbutton within w_dberror_event
integer x = 1627
integer y = 532
integer width = 329
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ(&H)"
end type

event clicked;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Clicked script for cb_help
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Display help for this example
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

f_open_help (parent.ClassName())
end event

type dw_1 from datawindow within w_dberror_event
integer x = 50
integer y = 432
integer width = 1536
integer height = 596
integer taborder = 30
string dataobject = "d_departments"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// dberror script for dw_1
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Depending on which error message option is checked, display appropriate error message.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// If custom error message is checked, then display an error message with the specific
// database error code and error message that occurred.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if rb_custom.checked then
	MessageBox ("データベースエラー", "データベースエラーコード:  " + String (sqldbcode) + &
						"~r~nデータベースエラーメッセージ:  " + sqlerrtext, exclamation!)
end if


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Setting the return code to 1 in the dberror event will stop PowerBuilder from displaying
// the default error message
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if not rb_default.checked then
	return 1
end if

end event

type gb_1 from groupbox within w_dberror_event
integer x = 50
integer y = 44
integer width = 1541
integer height = 336
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "エラー メッセージの表示内容"
borderstyle borderstyle = stylelowered!
end type

