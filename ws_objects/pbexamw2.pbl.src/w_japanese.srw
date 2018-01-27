$PBExportHeader$w_japanese.srw
$PBExportComments$継承:  日本語語版ｳｨﾝﾄﾞｳ
forward
global type w_japanese from w_ancestor
end type
end forward

global type w_japanese from w_ancestor
boolean TitleBar=true
string Title="日本語での合計金額計算(日本円)"
long BackColor=79741120
end type
global w_japanese w_japanese

on w_japanese.create
call super::create
end on

on w_japanese.destroy
call super::destroy
end on

type st_1 from w_ancestor`st_1 within w_japanese
string Text="数量:"
end type

type st_2 from w_ancestor`st_2 within w_japanese
string Text="単価:"
end type

type cb_1 from w_ancestor`cb_1 within w_japanese
string Text="合計算出"
end type

event clicked;// call the window function to calculate the total

decimal	lc_price, &
			lc_quantity, &
			lc_total

lc_price = Dec (sle_price.text)
lc_quantity = Dec (sle_qty.text)

lc_total = wf_total (lc_price, lc_quantity)
sle_total.text = String (lc_total, '[currency]')
end event

type cb_2 from w_ancestor`cb_2 within w_japanese
string Text="ｷｬﾝｾﾙ"
end type

event clicked;close (parent)
end event

type st_4 from w_ancestor`st_4 within w_japanese
string Text="購入日:"
end type

type st_3 from w_ancestor`st_3 within w_japanese
int X=267
int Y=564
int Width=263
string Text="合計金額:"
end type

