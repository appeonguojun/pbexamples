$PBExportHeader$w_employee_graph.srw
$PBExportComments$従業員の給与データウィンドウと給与グラフ オブジェクトを表示するウィンドウ
forward
global type w_employee_graph from w_graph_sheet
end type
end forward

global type w_employee_graph from w_graph_sheet
integer height = 1584
string title = "部署別従業員給与合計金額グラフ"
end type
global w_employee_graph w_employee_graph

on open;// Create a new series calles "Total Salaries"
int series_num
series_num = gr_1.addseries ( "給与合計" )
if series_num < 1 then return
Call super::open
end on

on w_employee_graph.create
call w_graph_sheet::create
end on

on w_employee_graph.destroy
call w_graph_sheet::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type gr_1 from w_graph_sheet`gr_1 within w_employee_graph
integer y = 524
integer height = 848
string title = "部署別の従業員給与合計"
end type

on gr_1.create
call w_graph_sheet`gr_1::create
TitleDispAttr.FaceName="ＭＳ Ｐゴシック"
TitleDispAttr.FontCharSet=ShiftJIS!
TitleDispAttr.FontFamily=Modern!
TitleDispAttr.FontPitch=Fixed!
Category.DispAttr.TextSize=-11
Category.DispAttr.AutoSize=false
Category.LabelDispAttr.TextSize=-15
Category.LabelDispAttr.AutoSize=false
Values.DispAttr.Format="#,##0"
Values.LabelDispAttr.TextSize=-12
Values.LabelDispAttr.AutoSize=false
LegendDispAttr.TextSize=-11
LegendDispAttr.AutoSize=false
end on

type dw_1 from w_graph_sheet`dw_1 within w_employee_graph
integer width = 1472
integer height = 464
string dataobject = "d_total_employee_salary"
boolean vscrollbar = true
end type

