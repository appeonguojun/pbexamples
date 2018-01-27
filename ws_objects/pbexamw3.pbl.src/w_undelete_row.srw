$PBExportHeader$w_undelete_row.srw
$PBExportComments$データウィンドウの行を dwRowsMove 関数を用いて削除行を復元するサンプル プログラム
forward
global type w_undelete_row from w_center
end type
type cb_help from commandbutton within w_undelete_row
end type
type cb_undelete from commandbutton within w_undelete_row
end type
type cb_close from commandbutton within w_undelete_row
end type
type cb_delete from commandbutton within w_undelete_row
end type
type cb_retrieve from commandbutton within w_undelete_row
end type
type cb_apply from commandbutton within w_undelete_row
end type
type dw_1 from datawindow within w_undelete_row
end type
end forward

global type w_undelete_row from w_center
integer x = 32
integer y = 117
integer width = 2940
integer height = 1700
string Title="RowsMove 関数を使用した削除行の復元"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_help cb_help
cb_undelete cb_undelete
cb_close cb_close
cb_delete cb_delete
cb_retrieve cb_retrieve
cb_apply cb_apply
dw_1 dw_1
end type
global w_undelete_row w_undelete_row

type variables
long   il_row_deleted
end variables

on open;// open script for w_dw_functions

dw_1.SetTransObject(sqlca)
dw_1.SetRowFocusIndicator(hand!, -10, -10)

end on

on close;w_main.Show()
end on

on w_undelete_row.create
this.cb_help=create cb_help
this.cb_undelete=create cb_undelete
this.cb_close=create cb_close
this.cb_delete=create cb_delete
this.cb_retrieve=create cb_retrieve
this.cb_apply=create cb_apply
this.dw_1=create dw_1
this.Control[]={ this.cb_help,&
this.cb_undelete,&
this.cb_close,&
this.cb_delete,&
this.cb_retrieve,&
this.cb_apply,&
this.dw_1}
end on

on w_undelete_row.destroy
destroy(this.cb_help)
destroy(this.cb_undelete)
destroy(this.cb_close)
destroy(this.cb_delete)
destroy(this.cb_retrieve)
destroy(this.cb_apply)
destroy(this.dw_1)
end on

type cb_help from commandbutton within w_undelete_row
integer x = 2432
integer y = 658
integer width = 420
integer height = 96
integer taborder = 70
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

type cb_undelete from commandbutton within w_undelete_row
integer x = 2432
integer y = 391
integer width = 420
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
boolean enabled = false
string text = "削除行の復元(&L)"
end type

on clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// "Undelete" the last row that was deleted from the DataWindow by using the RowsMove
// function to move the last row in the deleted buffer back to the primary buffer.
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long	ll_row


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Get the last row in the deleted buffer
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ll_row = dw_1.DeletedCount()


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Move the last row in the deleted buffer to the primary buffer
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_1.SetRedraw(false)
if dw_1.RowsMove(ll_row, ll_row, delete!, dw_1, il_row_deleted, primary!) = -1 then
	MessageBox("エラー", "削除行の復元に失敗しました。", exclamation!)
else
	// Set focus to the row that was "restored"
	dw_1.SetFocus()
	dw_1.ScrollToRow(il_row_deleted)
	dw_1.SetColumn(1)

	// Disable UnDelete Row button until another row is deleted
	this.enabled = false
end if
dw_1.SetRedraw(true)

end on

type cb_close from commandbutton within w_undelete_row
integer x = 2432
integer y = 526
integer width = 420
integer height = 96
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

on clicked;// Close the window

// Cancel any retrievals in progress
dw_1.DBCancel()
Close (parent)
end on

type cb_delete from commandbutton within w_undelete_row
integer x = 2432
integer y = 277
integer width = 420
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
boolean enabled = false
string text = "行の削除(&D)"
end type

on clicked;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Purpose:  Delete the current row from the DataWindow
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long	ll_row


if dw_1.AcceptText() = -1 then
	return
end if

il_row_deleted = dw_1.GetRow()
dw_1.DeleteRow(il_row_deleted)

// Enable the UnDelete Row button
cb_undelete.enabled = true

// Set focus to the current row
dw_1.SetFocus()
ll_row = dw_1.GetRow()
dw_1.ScrollToRow(ll_row)
dw_1.SetColumn(1)


end on

type cb_retrieve from commandbutton within w_undelete_row
integer x = 2432
integer y = 36
integer width = 420
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "検索(&R)"
end type

on clicked;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Retrieve the datawindow & select the current row in the datawindow
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if dw_1.Retrieve() = -1 then
	return
end if

dw_1.SetFocus()
dw_1.ScrollToRow(1)
dw_1.SetColumn(1)

end on

type cb_apply from commandbutton within w_undelete_row
integer x = 2432
integer y = 149
integer width = 420
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "更新(&U)"
end type

on clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Purpose: Update the datawindow
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if dw_1.Update() = -1 then
	rollback;
else
	commit;
end if

end on

type dw_1 from datawindow within w_undelete_row
integer x = 64
integer y = 64
integer width = 2324
integer height = 1454
integer taborder = 10
string dataobject = "d_contact_list"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

on retrieveend;// Enable command buttons after retrieval of datawindow

cb_apply.enabled = true
cb_delete.enabled = true
cb_retrieve.enabled = true
end on

on retrievestart;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Disable command buttons
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

cb_retrieve.enabled = false
cb_apply.enabled = false
cb_delete.enabled = false
cb_undelete.enabled = false


end on

