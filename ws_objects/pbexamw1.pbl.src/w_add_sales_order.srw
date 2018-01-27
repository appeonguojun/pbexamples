$PBExportHeader$w_add_sales_order.srw
$PBExportComments$受注を追加するウィンドウです。
forward
global type w_add_sales_order from w_center
end type
type cb_help from commandbutton within w_add_sales_order
end type
type cb_del from commandbutton within w_add_sales_order
end type
type dw_items from datawindow within w_add_sales_order
end type
type cb_close from commandbutton within w_add_sales_order
end type
type cb_update from commandbutton within w_add_sales_order
end type
type cb_prod from commandbutton within w_add_sales_order
end type
type cb_add from commandbutton within w_add_sales_order
end type
type dw_order from datawindow within w_add_sales_order
end type
end forward

global type w_add_sales_order from w_center
integer y = 171
integer width = 2528
integer height = 1653
string title = "受注登録"
long backcolor = 73955432
toolbaralignment toolbaralignment = alignatleft!
event ue_add_order ( )
cb_help cb_help
cb_del cb_del
dw_items dw_items
cb_close cb_close
cb_update cb_update
cb_prod cb_prod
cb_add cb_add
dw_order dw_order
end type
global w_add_sales_order w_add_sales_order

type variables
Boolean	ib_Changed
end variables

forward prototypes
public function integer of_get_next_num ()
end prototypes

event ue_add_order;Integer					li_OrderNum, li_Row
DataWindowChild	ldwc_Fin, ldwc_Cust, ldwc_Rep

li_OrderNum = of_get_next_num()
If li_OrderNum < 0 Then Return

dw_order.Reset()
li_Row = dw_order.InsertRow(0)
dw_order.object.id[li_Row] = li_OrderNum
dw_order.object.order_date[li_Row] = Today()

dw_order.GetChild("fin_code_id", ldwc_Fin)
dw_order.GetChild("cust_id", ldwc_Cust)
dw_order.GetChild("sales_rep", ldwc_Rep)

ldwc_Fin.SetTransObject(sqlca)
ldwc_Fin.Retrieve()

ldwc_Cust.SetTransObject(sqlca)
ldwc_Cust.Retrieve()

ldwc_Rep.SetTransObject(sqlca)
ldwc_Rep.Retrieve()

ib_Changed = True

end event

public function integer of_get_next_num ();Integer		li_NextNum

SELECT Max(id)
INTO :li_NextNum
FROM sales_order;

If sqlca.sqlcode < 0 Then
	MessageBox("SQL エラー", sqlca.sqlerrtext, Stopsign!)
	Return -1
End if

Return li_NextNum + 1

end function

event open;call super::open;dw_items.SetRowFocusIndicator(Hand!)

Post Event ue_add_order()
cb_prod.Post Event Clicked()

end event

on w_add_sales_order.create
int iCurrent
call super::create
this.cb_help=create cb_help
this.cb_del=create cb_del
this.dw_items=create dw_items
this.cb_close=create cb_close
this.cb_update=create cb_update
this.cb_prod=create cb_prod
this.cb_add=create cb_add
this.dw_order=create dw_order
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_help
this.Control[iCurrent+2]=this.cb_del
this.Control[iCurrent+3]=this.dw_items
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.cb_update
this.Control[iCurrent+6]=this.cb_prod
this.Control[iCurrent+7]=this.cb_add
this.Control[iCurrent+8]=this.dw_order
end on

on w_add_sales_order.destroy
call super::destroy
destroy(this.cb_help)
destroy(this.cb_del)
destroy(this.dw_items)
destroy(this.cb_close)
destroy(this.cb_update)
destroy(this.cb_prod)
destroy(this.cb_add)
destroy(this.dw_order)
end on

event closequery;Integer	li_Ans

If ib_Changed Then
	li_Ans = MessageBox("受注登録", "受注情報の変更は保存されていません。保存してから終了しますか？", &
									Question!, YesNoCancel!, 1)
	If li_Ans = 3 Then
		Return 1
	Elseif li_Ans = 1 Then
		If cb_update.Trigger Event Clicked() < 1 Then
			Return 1
		End If
	End if
End if

Return 0

end event

event close;If IsValid(w_prod_listview) Then Close(w_prod_listview)

Show(w_main)

end event

type cb_help from commandbutton within w_add_sales_order
integer x = 2016
integer y = 622
integer width = 436
integer height = 85
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ"
end type

event clicked;f_open_help ("w_add_sales_order")

end event

type cb_del from commandbutton within w_add_sales_order
integer x = 2016
integer y = 274
integer width = 436
integer height = 85
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "受注項目の削除"
end type

event clicked;Integer	li_Row
String	ls_Desc

li_Row = dw_items.GetRow()

If li_Row < 1 Then Return

ls_Desc = dw_items.Object.product_description[li_Row]
If MessageBox("商品項目の削除", "商品項目番号: " + String(li_Row) + " を削除しますか?" + &
					":  " + ls_Desc , Question!, YesNo!, 2) = 2 Then Return

dw_items.DeleteRow(li_Row)
ib_Changed = True

end event

type dw_items from datawindow within w_add_sales_order
integer x = 8
integer y = 292
integer width = 1952
integer height = 1223
integer taborder = 20
string dataobject = "d_add_sales_order_items"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dragdrop;Integer			li_Item, li_Row, li_OrderID
String			ls_Column, ls_Desc, ls_Picture
Double			ldb_Price
ListView		llv_Prod
ListViewItem	llvi_Item

// Dropped a product on the order, so add it

//llv_Prod = source
llv_Prod = DraggedObject()
li_Item = llv_Prod.SelectedIndex()
llv_Prod.GetItem(li_Item, llvi_Item)

// Add new order item line
li_Row = This.InsertRow(0)
This.Object.line_id[li_Row] = li_Row

// Default Ship Date and Quantity
This.Object.ship_date[li_Row] = Today()
This.Object.quantity[li_Row] = 0

// Get the product information from the dropped ListViewItem columns
// Get the product id
llv_Prod.GetItem(li_Item, 3, ls_Column)
This.Object.prod_id[li_Row] = Integer(ls_Column)

// Get price (strip off the leading $)
llv_Prod.GetItem(li_Item, 7, ls_Column)
ldb_Price = Double(Right(ls_Column, (Len(ls_Column) - 1)))
This.Object.product_unit_price[li_Row] = ldb_Price

// Get product description
llv_Prod.GetItem(li_Item, 2, ls_Column)
ls_Desc = ls_Column
llv_Prod.GetItem(li_Item, 1, ls_Column)
ls_Desc = ls_Desc + " - " + ls_Column
This.Object.product_description[li_Row] = ls_Desc

// Get the picture name
This.Object.product_picture_name[li_Row] = String(llvi_Item.Data)

li_OrderID = dw_order.Object.id[1]
This.Object.sales_order_items_id[li_Row] = li_OrderID

ib_Changed = True

end event

event itemchanged;ib_Changed = True

end event

type cb_close from commandbutton within w_add_sales_order
integer x = 2016
integer y = 505
integer width = 436
integer height = 85
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる"
boolean cancel = true
end type

event clicked;Close(Parent)

end event

type cb_update from commandbutton within w_add_sales_order
integer x = 2016
integer y = 388
integer width = 436
integer height = 85
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "更新"
end type

event clicked;Integer	li_RC

dw_order.AcceptText()
dw_items.AcceptText()

If Not ib_Changed Then Return

// Verify that all order data was entered
If IsNull(dw_order.Object.cust_id[1]) Or IsNull(dw_order.Object.fin_code_id[1]) Or &
	IsNull(dw_order.Object.sales_rep[1]) Or IsNull(dw_order.Object.region[1]) Then
	MessageBox("不適切な受注", "受注のすべてのデータを入力しなければなりません。", Exclamation!)
	Return -1
End If

dw_order.SetTransObject(sqlca)
li_RC = dw_order.Update()
If li_RC < 0 Then Return li_RC

dw_items.SetTransObject(sqlca)
li_RC = dw_items.Update()
If li_RC < 0 Then
	Rollback;
	Return li_RC
Else
	Commit;
End if

ib_Changed = False

If IsValid(w_prod_listview) Then w_prod_listview.Post Event ue_refresh_items()

Return 1

end event

type cb_prod from commandbutton within w_add_sales_order
integer x = 2016
integer y = 160
integer width = 436
integer height = 85
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "商品の選択..."
end type

event clicked;Open(w_prod_listview)

end event

type cb_add from commandbutton within w_add_sales_order
integer x = 2016
integer y = 43
integer width = 436
integer height = 85
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "新規受注"
end type

event clicked;If ib_Changed Then
	If MessageBox("受注の追加", "現在の受注を保存してから、新規受注を登録しますか?", &
							Question!, YesNo!) = 1 Then
		cb_update.Trigger Event Clicked()
	End if
End if

dw_items.Reset()

Parent.Post Event ue_add_order()

end event

type dw_order from datawindow within w_add_sales_order
integer x = 12
integer y = 11
integer width = 1920
integer height = 267
integer taborder = 10
string dataobject = "d_add_sales_order"
boolean border = false
boolean livescroll = true
end type

event itemchanged;ib_Changed = True

end event

