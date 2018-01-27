$PBExportHeader$w_data_edit.srw
$PBExportComments$各項目の情報を編集するウィンドウです。データ エクスプローラを使用しています。
forward
global type w_data_edit from w_center
end type
type cb_cancel from commandbutton within w_data_edit
end type
type cb_ok from commandbutton within w_data_edit
end type
type dw_1 from datawindow within w_data_edit
end type
end forward

global type w_data_edit from w_center
int X=5
int Y=4
int Width=1893
int Height=904
boolean TitleBar=true
string Title="項目編集"
long BackColor=75530304
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
ToolBarAlignment ToolBarAlignment=AlignAtLeft!
cb_cancel cb_cancel
cb_ok cb_ok
dw_1 dw_1
end type
global w_data_edit w_data_edit

type variables
Window	iw_Frame, iw_Parent
end variables

event open;call super::open;n_cst_parms	lnv_Parm

SetPointer(HourGlass!)

lnv_Parm = Message.PowerObjectParm

iw_Frame = lnv_Parm.iw_Frame
iw_Parent = lnv_Parm.iw_Parent

dw_1.DataObject = lnv_Parm.is_DataObject
dw_1.SetTransObject(sqlca)
dw_1.Retrieve(lnv_Parm.ii_Parm1, lnv_Parm.ii_Parm2)

dw_1.SetFilter(lnv_Parm.is_Filter)
dw_1.Filter()

This.Move(This.X + lnv_Parm.ii_OpenPos, This.Y + lnv_Parm.ii_OpenPos)

end event

on w_data_edit.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_1=create dw_1
this.Control[]={ this.cb_cancel,&
this.cb_ok,&
this.dw_1}
end on

on w_data_edit.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_1)
end on

event close;If IsValid(iw_Frame) Then
	iw_Frame.WindowState = Normal!
End If

end event

type cb_cancel from commandbutton within w_data_edit
integer x = 951
integer y = 672
integer width = 289
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "キャンセル"
boolean cancel = true
end type

event clicked;Close(Parent)

end event

type cb_ok from commandbutton within w_data_edit
integer x = 677
integer y = 672
integer width = 229
integer height = 88
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "OK"
boolean default = true
end type

event clicked;dw_1.Update()

iw_Parent.Trigger Dynamic Event ue_refresh()

Close(Parent)

end event

type dw_1 from datawindow within w_data_edit
integer x = 5
integer y = 4
integer width = 1801
integer height = 608
integer taborder = 10
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

