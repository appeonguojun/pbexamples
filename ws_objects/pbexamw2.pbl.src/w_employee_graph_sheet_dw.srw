$PBExportHeader$w_employee_graph_sheet_dw.srw
$PBExportComments$グラフで表した従業員の合計給与を表示する MDI シートです。
forward
global type w_employee_graph_sheet_dw from w_graph_sheet_using_dw
end type
end forward

global type w_employee_graph_sheet_dw from w_graph_sheet_using_dw
int Width=2873
int Height=1892
boolean TitleBar=true
string Title="部署別の給与合計額グラフ(DW)"
long BackColor=74481808
end type
global w_employee_graph_sheet_dw w_employee_graph_sheet_dw

on w_employee_graph_sheet_dw.create
call w_graph_sheet_using_dw::create
end on

on w_employee_graph_sheet_dw.destroy
call w_graph_sheet_using_dw::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

