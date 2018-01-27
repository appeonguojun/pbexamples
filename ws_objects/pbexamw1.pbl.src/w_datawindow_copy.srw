$PBExportHeader$w_datawindow_copy.srw
$PBExportComments$ImportString 関数を使用してデータウィンドウを複製する サンプル
forward
global type w_datawindow_copy from w_center
end type
type st_2 from statictext within w_datawindow_copy
end type
type st_1 from statictext within w_datawindow_copy
end type
type cb_2 from commandbutton within w_datawindow_copy
end type
type cb_1 from commandbutton within w_datawindow_copy
end type
type cb_copy from commandbutton within w_datawindow_copy
end type
type cb_undo from commandbutton within w_datawindow_copy
end type
type dw_copy from datawindow within w_datawindow_copy
end type
type dw_cust from datawindow within w_datawindow_copy
end type
end forward

global type w_datawindow_copy from w_center
integer x = 165
integer y = 92
integer width = 2606
integer height = 1756
string title = "ImportString 関数 と RowsCopy 関数"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen pbm_custom01
st_2 st_2
st_1 st_1
cb_2 cb_2
cb_1 cb_1
cb_copy cb_copy
cb_undo cb_undo
dw_copy dw_copy
dw_cust dw_cust
end type
global w_datawindow_copy w_datawindow_copy

type variables
string is_dwcopy
end variables

event ue_postopen;
//set transaction object up for the datawindow and retrieve
dw_cust.settransobjecT(sqlca)
dw_cust.retrieve()


//This will store the data portion of the datawindow in a string called is_dwcopy
is_dwcopy = dw_cust.Object.DataWindow.data

end event

on open;//do the work in the custom post open event
this.postevent("ue_postopen")
end on

on w_datawindow_copy.create
this.st_2=create st_2
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_copy=create cb_copy
this.cb_undo=create cb_undo
this.dw_copy=create dw_copy
this.dw_cust=create dw_cust
this.Control[]={ this.st_2,&
this.st_1,&
this.cb_2,&
this.cb_1,&
this.cb_copy,&
this.cb_undo,&
this.dw_copy,&
this.dw_cust}
end on

on w_datawindow_copy.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_copy)
destroy(this.cb_undo)
destroy(this.dw_copy)
destroy(this.dw_cust)
end on

on close;show(w_main)
end on

type st_2 from statictext within w_datawindow_copy
integer x = 727
integer y = 800
integer width = 631
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
string text = "RowsCopy 関数を使用"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_datawindow_copy
integer x = 727
integer y = 60
integer width = 631
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
string text = "ImportString 関数を使用"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_datawindow_copy
integer x = 1399
integer y = 1500
integer width = 311
integer height = 108
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ(&H)"
end type

on clicked;f_open_help(parent.classname())
end on

type cb_1 from commandbutton within w_datawindow_copy
integer x = 882
integer y = 1500
integer width = 311
integer height = 108
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

on clicked;close(parent)
end on

type cb_copy from commandbutton within w_datawindow_copy
integer x = 37
integer y = 784
integer width = 672
integer height = 108
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string Text="データウィンドウのコピー"
end type

event clicked;string ls_dwcopy, ls_type, ls_name
datawindowchild ldw_child
string ls_count
int li_count, li_index, li_rc

//accept text on datawindow about to be copied
dw_cust.accepttext()

//clear out the destination
dw_copy.reset()

//This section is not needed if the destination does not contain child datawindows.
ls_count = dw_copy.Object.DataWindow.column.count
li_count = integer (ls_count)

For li_index = 1 to li_count
	ls_type = dw_copy.describe("#" + string(li_index) + ".edit.style")
	If ls_type = "dddw" Then
		ls_name = dw_copy.describe("#" + string(li_index) + ".name")
         	li_rc = dw_copy.GetChild(ls_name , ldw_child)
		If li_rc = -1 Then 
			MessageBox("データウィンドウコントロールの検索中にエラーが発生しました。",String(li_rc))
		Else
			ldw_child.settransobject(sqlca)
			ldw_child.retrieve()
		End If
	End If
Next
//***********************************************************************************

//put the data portion of source datawindow into a string

dw_cust.RowsCopy(1,dw_cust.rowcount(),Primary!,dw_copy,1,Primary!)



end event

type cb_undo from commandbutton within w_datawindow_copy
integer x = 37
integer y = 48
integer width = 672
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "すべての変更を元に戻す"
end type

on clicked;//This will clear of data contents of the datawindow and 
//refill the data using the importstring() function. The data is stored in the instance
//string is_dwcopy which was loaded in the postopen event of the window.
dw_cust.reset()
dw_cust.importstring(is_dwcopy)

end on

type dw_copy from datawindow within w_datawindow_copy
integer x = 41
integer y = 912
integer width = 2473
integer height = 520
integer taborder = 60
string dataobject = "d_cust"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_cust from datawindow within w_datawindow_copy
integer x = 41
integer y = 192
integer width = 2473
integer height = 520
integer taborder = 10
string dataobject = "d_cust"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

