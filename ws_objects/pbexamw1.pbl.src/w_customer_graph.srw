$PBExportHeader$w_customer_graph.srw
$PBExportComments$顧客の受注収支データウィンドウとグラフオブジェクトを持つウィンドウ
forward
global type w_customer_graph from w_graph_sheet
end type
end forward

global type w_customer_graph from w_graph_sheet
integer x = 23
integer y = 56
integer width = 2857
integer height = 1657
string title = "顧客別受注金額合計グラフ"
end type
global w_customer_graph w_customer_graph

event open;// Create a new series calles "Total Orders"
int series_num
series_num = gr_1.addseries ( "Total Orders" )
if series_num < 1 then return
Call super::open
end event

on w_customer_graph.create
call super::create
end on

on w_customer_graph.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type gr_1 from w_graph_sheet`gr_1 within w_customer_graph
grgraphtype graphtype = colgraph!
string title = "北海道地区: 受注顧客"
end type

on gr_1.create
call super::create
Category.Label="顧客名"
Category.LabelDispAttr.TextSize=-11
Category.LabelDispAttr.AutoSize=false
Values.DispAttr.Format="#,##0"
Values.LabelDispAttr.TextSize=-12
Values.LabelDispAttr.AutoSize=false
end on

type dw_1 from w_graph_sheet`dw_1 within w_customer_graph
integer width = 1156
string dataobject = "d_total_customer_orders"
boolean vscrollbar = true
end type

