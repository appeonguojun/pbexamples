$PBExportHeader$w_orders_graph_list_sheet.srw
$PBExportComments$年月別受注情報グラフ
forward
global type w_orders_graph_list_sheet from w_graph_sheet_with_list
end type
end forward

global type w_orders_graph_list_sheet from w_graph_sheet_with_list
integer width = 2784
integer height = 1671
string title = "顧客別統計"
end type
global w_orders_graph_list_sheet w_orders_graph_list_sheet

on w_orders_graph_list_sheet.create
call super::create
end on

on w_orders_graph_list_sheet.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type gr_1 from w_graph_sheet_with_list`gr_1 within w_orders_graph_list_sheet
string Title="月別注文統計"
end type

on gr_1.create
call super::create
Category.Label="期間"
Values.DispAttr.Format="#,##0;[RED](#,##0)"
end on

type dw_1 from w_graph_sheet_with_list`dw_1 within w_orders_graph_list_sheet
integer x = 248
integer y = 18
string dataobject = "d_order_data_for_graph"
end type

type lb_category from w_graph_sheet_with_list`lb_category within w_orders_graph_list_sheet
boolean BringToTop=true
end type

type lb_value from w_graph_sheet_with_list`lb_value within w_orders_graph_list_sheet
boolean BringToTop=true
end type

type st_1 from w_graph_sheet_with_list`st_1 within w_orders_graph_list_sheet
boolean BringToTop=true
end type

type st_2 from w_graph_sheet_with_list`st_2 within w_orders_graph_list_sheet
boolean BringToTop=true
end type

type st_3 from w_graph_sheet_with_list`st_3 within w_orders_graph_list_sheet
boolean BringToTop=true
end type

