$PBExportHeader$w_nested_composite.srw
$PBExportComments$ネステッド レポート サンプル プログラムで使用するコンポジット レポート シート
forward
global type w_nested_composite from w_nested_ancestor
end type
end forward

global type w_nested_composite from w_nested_ancestor
string title = "商品/顧客レポート"
long backcolor = 79741120
end type
global w_nested_composite w_nested_composite

event open;call super::open;// Since datawindow is a composite dw, can't do first/last page
m_nest.m_display.m_firstpage.visible = False
m_nest.m_display.m_firstpage.toolbaritemvisible = False
m_nest.m_display.m_lastpage.visible = False
m_nest.m_display.m_lastpage.toolbaritemvisible = False
m_nest.m_display.m_priorpage.toolbaritemspace = 2

end event

on w_nested_composite.create
call super::create
end on

on w_nested_composite.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_1 from w_nested_ancestor`dw_1 within w_nested_composite
string dataobject = "d_products_customers"
end type

