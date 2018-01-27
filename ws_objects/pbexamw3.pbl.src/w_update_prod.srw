$PBExportHeader$w_update_prod.srw
$PBExportComments$商品の情報を更新するためのウィンドウで、w_prod_listview から開かれます。
forward
global type w_update_prod from Window
end type
type p_product from picture within w_update_prod
end type
type cb_cancel from commandbutton within w_update_prod
end type
type cb_ok from commandbutton within w_update_prod
end type
type dw_prod from datawindow within w_update_prod
end type
end forward

global type w_update_prod from w_center
integer x = 174
integer y = 228
integer width = 2171
integer height = 744
string title = "商品情報の編集"
windowtype windowtype = response!
long backcolor = 75530304
toolbaralignment toolbaralignment = alignatleft!
p_product p_product
cb_cancel cb_cancel
cb_ok cb_ok
dw_prod dw_prod
end type
global w_update_prod w_update_prod

type variables
Boolean	ib_Changed
end variables

event open;call super::open;Integer	li_ID
Blob		lblb_BMP

li_ID = Message.DoubleParm

// Retrieve data into DataWindow
dw_prod.SetTransObject(sqlca)
dw_prod.Retrieve(li_ID)

// Retrieve blob into picture
SelectBlob catalog_picture
into :lblb_BMP
from product
where id = :li_ID;

p_product.SetPicture(lblb_BMP)

ib_Changed = False

end event

on w_update_prod.create
this.p_product=create p_product
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_prod=create dw_prod
this.Control[]={ this.p_product,&
this.cb_cancel,&
this.cb_ok,&
this.dw_prod}
end on

on w_update_prod.destroy
destroy(this.p_product)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_prod)
end on

event closequery;Integer	li_Ans

If ib_Changed Then
	li_Ans = MessageBox("商品情報の更新", "この商品の情報は更新されました。  終了する前に保存しますか?", &
									Question!, YesNoCancel!)
	If li_Ans = 3 Then
		Message.ReturnValue = 1
	Elseif li_Ans = 1 Then
		dw_prod.Update()
		commit;
		Message.DoubleParm = 1
	End if
End if

end event

type p_product from picture within w_update_prod
integer x = 9
integer y = 12
integer width = 654
integer height = 588
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_update_prod
integer x = 1463
integer y = 528
integer width = 283
integer height = 88
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "キャンセル"
boolean cancel = true
end type

event clicked;CloseWithReturn(Parent, 0)

end event

type cb_ok from commandbutton within w_update_prod
integer x = 1138
integer y = 528
integer width = 247
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "OK"
boolean default = true
end type

event clicked;dw_prod.AcceptText()

If ib_Changed Then
	dw_prod.Update()
	commit;
	ib_Changed = False
	CloseWithReturn(Parent, 1)
Else
	CloseWIthReturn(Parent, 0)
End if

end event

type dw_prod from datawindow within w_update_prod
int X=709
int Y=60
int Width=1335
int Height=376
int TabOrder=10
string DataObject="d_edit_product"
boolean Border=false
boolean LiveScroll=true
end type

event itemchanged;ib_Changed = True

end event

