$PBExportHeader$w_shared_dddw.srw
$PBExportComments$共有しているドロップダウンデータウィンドウのサンプル
forward
global type w_shared_dddw from w_center
end type
type cb_help from commandbutton within w_shared_dddw
end type
type cb_close from commandbutton within w_shared_dddw
end type
type cb_delete from commandbutton within w_shared_dddw
end type
type cb_insert from commandbutton within w_shared_dddw
end type
type cb_reset from commandbutton within w_shared_dddw
end type
type cb_retrieve from commandbutton within w_shared_dddw
end type
type dw_sales_orders from datawindow within w_shared_dddw
end type
type cbx_share from checkbox within w_shared_dddw
end type
end forward

global type w_shared_dddw from w_center
integer x = 169
integer y = 368
integer width = 2597
integer height = 1188
string title = "ドロップダウン データウィンドウの共有"
windowtype windowtype = popup!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_help cb_help
cb_close cb_close
cb_delete cb_delete
cb_insert cb_insert
cb_reset cb_reset
cb_retrieve cb_retrieve
dw_sales_orders dw_sales_orders
cbx_share cbx_share
end type
global w_shared_dddw w_shared_dddw

type variables
// Handles to DropDownDataWindows
datawindowchild   idw_customer
datawindowchild   idw_sales_rep
datawindowchild   idw_fin_code
end variables

on w_shared_dddw.create
int iCurrent
call super::create
this.cb_help=create cb_help
this.cb_close=create cb_close
this.cb_delete=create cb_delete
this.cb_insert=create cb_insert
this.cb_reset=create cb_reset
this.cb_retrieve=create cb_retrieve
this.dw_sales_orders=create dw_sales_orders
this.cbx_share=create cbx_share
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_help
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.cb_delete
this.Control[iCurrent+4]=this.cb_insert
this.Control[iCurrent+5]=this.cb_reset
this.Control[iCurrent+6]=this.cb_retrieve
this.Control[iCurrent+7]=this.dw_sales_orders
this.Control[iCurrent+8]=this.cbx_share
end on

on w_shared_dddw.destroy
call super::destroy
destroy(this.cb_help)
destroy(this.cb_close)
destroy(this.cb_delete)
destroy(this.cb_insert)
destroy(this.cb_reset)
destroy(this.cb_retrieve)
destroy(this.dw_sales_orders)
destroy(this.cbx_share)
end on

event close;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// close script for w_shared_dddw
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Show the front-end for the Code Examples
w_main.Show()
end event

event open;call super::open;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// open script for w_shared_dddw
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Set the transaction object
dw_sales_orders.SetTransObject (sqlca)

// For this example, retrieve as needed will be turned off
dw_sales_orders.Object.datawindow.retrieve.asneeded = 'no'

// Obtain references to the DropDownDataWindows
dw_sales_orders.GetChild ("cust_id", idw_customer)
dw_sales_orders.GetChild ("sales_rep", idw_sales_rep)
dw_sales_orders.GetChild ("fin_code_id", idw_fin_code)

// Open the window containing the primary DropDownDataWindows
Open (w_master_dddw)




end event

type cb_help from commandbutton within w_shared_dddw
integer x = 2185
integer y = 580
integer width = 343
integer height = 92
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
// clicked script for cb_help
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Display help for this window
f_open_help (parent.ClassName())
end event

type cb_close from commandbutton within w_shared_dddw
integer x = 2185
integer y = 452
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

event clicked;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_close
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// Close the window containing the primary DropDownDataWindows
if IsValid (w_master_dddw) then
	Close (w_master_dddw)
end if

// Close parent window
close (parent)
end event

type cb_delete from commandbutton within w_shared_dddw
integer x = 2185
integer y = 348
integer width = 343
integer height = 92
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
boolean enabled = false
string text = "行の削除(&D)"
end type

event clicked;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_delete
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//	Delete the current row from the DataWindow
dw_sales_orders.DeleteRow (0)
dw_sales_orders.SetFocus()

// If the datawindow does not have any rows left, disable it.
if dw_sales_orders.RowCount() = 0 then
	this.enabled = false
end if
end event

type cb_insert from commandbutton within w_shared_dddw
integer x = 2185
integer y = 244
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "行の挿入(&I)"
end type

event clicked;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_insert
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


long	ll_cur_row, &
		ll_new_row
		
// Insert a row into the DataWindow prior to the current row
ll_cur_row = dw_sales_orders.GetRow()
ll_new_row = dw_sales_orders.InsertRow(ll_cur_row)
dw_sales_orders.ScrollToRow(ll_new_row)
dw_sales_orders.SetColumn(1)
dw_sales_orders.SetFocus()

// Enable the Delete Row button
cb_delete.enabled = true
end event

type cb_reset from commandbutton within w_shared_dddw
integer x = 2185
integer y = 140
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "リセット(&E)"
end type

event clicked;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_reset
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Reset the DataWindow
dw_sales_orders.Reset()

// Disable the Delete Row button
cb_delete.enabled = false
end event

type cb_retrieve from commandbutton within w_shared_dddw
integer x = 2185
integer y = 36
integer width = 343
integer height = 92
integer taborder = 20
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

// Retrieve the DataWindow
dw_sales_orders.Retrieve()

// Enable the Delete Row button, if necessary
if dw_sales_orders.RowCount() > 0 then
	cb_delete.enabled = true
end if
end event

type dw_sales_orders from datawindow within w_shared_dddw
integer x = 41
integer y = 152
integer width = 2089
integer height = 892
integer taborder = 10
string dataobject = "d_sales_orders"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_share from checkbox within w_shared_dddw
integer x = 41
integer y = 32
integer width = 1161
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "ドロップダウン データウィンドウを共有する"
borderstyle borderstyle = stylelowered!
end type

event clicked;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cbx_share
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Purpose:
// 	Share DropDownDataWindows with the DataWindows on w_master_dddw
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// Check to see if w_master_dddw is open (where primary DataWindows are located)
if not IsValid (w_master_dddw) then
	MessageBox ("エラー", "プライマリ データウィンドウを保持しているウィンドウが開いていません。", exclamation!)
	return
end if

if this.checked then
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Share data between DataWindows on w_master_dddw and DropDownDataWindows
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	if w_master_dddw.dw_customers.ShareData (idw_customer) = -1 then
		MessageBox ("エラー", "顧客データが共有できません。", exclamation!)
	end if

	if w_master_dddw.dw_sales_reps.ShareData (idw_sales_rep) = -1 then
		MessageBox ("エラー", "販売担当者データが共有できません。", exclamation!)
	end if

	if w_master_dddw.dw_fin_codes.ShareData (idw_fin_code) = -1 then
		MessageBox ("エラー", "会計コード データが共有できません。", exclamation!)
	end if
else
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Stop sharing data
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	w_master_dddw.dw_customers.ShareDataOff()
	w_master_dddw.dw_sales_reps.ShareDataOff()
	w_master_dddw.dw_fin_codes.ShareDataOff()
end if
	
end event

