$PBExportHeader$w_entry_only.srw
$PBExportComments$受注データを登録するウィンドウ。但し、新規行の挿入のみで修正はできない。
forward
global type w_entry_only from w_center
end type
type st_windowback from statictext within w_entry_only
end type
type st_buttonface from statictext within w_entry_only
end type
type cb_delete from commandbutton within w_entry_only
end type
type cb_update from commandbutton within w_entry_only
end type
type cb_retrieve from commandbutton within w_entry_only
end type
type cb_insert from commandbutton within w_entry_only
end type
type cb_close from commandbutton within w_entry_only
end type
type dw_1 from datawindow within w_entry_only
end type
end forward

global type w_entry_only from w_center
integer x = 428
integer y = 412
integer width = 2192
integer height = 1099
string title = "追加のみ可能なデータウィンドウ"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_windowback st_windowback
st_buttonface st_buttonface
cb_delete cb_delete
cb_update cb_update
cb_retrieve cb_retrieve
cb_insert cb_insert
cb_close cb_close
dw_1 dw_1
end type
global w_entry_only w_entry_only

type variables
// Keeps track of the rows that cannot be deleted
long   il_perm_count
end variables

event open;call super::open;dw_1.SetTransObject (sqlca)

end event

on close;w_main.Show()
end on

on w_entry_only.create
int iCurrent
call super::create
this.st_windowback=create st_windowback
this.st_buttonface=create st_buttonface
this.cb_delete=create cb_delete
this.cb_update=create cb_update
this.cb_retrieve=create cb_retrieve
this.cb_insert=create cb_insert
this.cb_close=create cb_close
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_windowback
this.Control[iCurrent+2]=this.st_buttonface
this.Control[iCurrent+3]=this.cb_delete
this.Control[iCurrent+4]=this.cb_update
this.Control[iCurrent+5]=this.cb_retrieve
this.Control[iCurrent+6]=this.cb_insert
this.Control[iCurrent+7]=this.cb_close
this.Control[iCurrent+8]=this.dw_1
end on

on w_entry_only.destroy
call super::destroy
destroy(this.st_windowback)
destroy(this.st_buttonface)
destroy(this.cb_delete)
destroy(this.cb_update)
destroy(this.cb_retrieve)
destroy(this.cb_insert)
destroy(this.cb_close)
destroy(this.dw_1)
end on

type st_windowback from statictext within w_entry_only
boolean visible = false
integer x = 1744
integer y = 750
integer width = 192
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
boolean enabled = false
boolean focusrectangle = false
end type

type st_buttonface from statictext within w_entry_only
boolean visible = false
integer x = 1732
integer y = 647
integer width = 192
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
boolean focusrectangle = false
end type

type cb_delete from commandbutton within w_entry_only
integer x = 1776
integer y = 260
integer width = 344
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
boolean enabled = false
string text = "行を削除"
end type

on clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Delete the current row of the DataWindow
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

dw_1.SetRedraw (false)
dw_1.DeleteRow (0)

// Disable the Delete Row button if there are no more new rows
if il_perm_count = dw_1.RowCount() then
	cb_delete.enabled = false
else
	dw_1.SetColumn (1)
	dw_1.SetFocus()
end if

dw_1.SetRedraw (true)
end on

type cb_update from commandbutton within w_entry_only
integer x = 1776
integer y = 370
integer width = 344
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
boolean enabled = false
string text = "更新(&U)"
end type

on clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Update the DataWindow
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

dw_1.SetRedraw (false)
if dw_1.Update() = -1 then
	rollback;
else
	commit;
end if
dw_1.SetRedraw (true)
end on

type cb_retrieve from commandbutton within w_entry_only
integer x = 1776
integer y = 39
integer width = 344
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "検索(&R)"
end type

on clicked;//dw_1.SetRedraw (false)
dw_1.Retrieve()
//dw_1.SetRedraw (true)
end on

type cb_insert from commandbutton within w_entry_only
integer x = 1776
integer y = 149
integer width = 344
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "行追加(&A)"
end type

on clicked;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Insert a new row into the DataWindow prior to the current row.
//
// The expression for the protect attribute for the DataWindow columns, set in the DataWindow
// painter, will evaluate whether the row is new.  If the row is new, the column will not be 
// protected.  If the row is not new, the column will be protected.  An expression for the background
// color attribute will similarly determine that the background is white for columns on new rows, 
// and light gray for columns on other rows.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
long	ll_new_row


cb_delete.enabled = true
cb_update.enabled = true


ll_new_row = dw_1.InsertRow(0)

dw_1.SetFocus()
dw_1.ScrollToRow(ll_new_row)
dw_1.SetColumn(1)

end on

type cb_close from commandbutton within w_entry_only
integer x = 1776
integer y = 480
integer width = 344
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

on clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// close the window
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

close (parent)
end on

type dw_1 from datawindow within w_entry_only
integer x = 16
integer y = 18
integer width = 1740
integer height = 964
integer taborder = 10
string dataobject = "d_sales_order_items"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

on retrieveend;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enable command buttons
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
il_perm_count = this.RowCount()

cb_delete.enabled = false
cb_insert.enabled = true
cb_retrieve.enabled = true
cb_update.enabled = false


end on

on retrievestart;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Disable command buttons
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
cb_delete.enabled = false
cb_insert.enabled = false
cb_retrieve.enabled = false
cb_update.enabled = false
end on

