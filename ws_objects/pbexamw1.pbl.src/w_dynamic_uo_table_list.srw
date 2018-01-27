$PBExportHeader$w_dynamic_uo_table_list.srw
$PBExportComments$動的ユーザ オブジェクトのサンプルで使用するデータウィンドウを定義するMDI シート
forward
global type w_dynamic_uo_table_list from w_center
end type
type rb_free from radiobutton within w_dynamic_uo_table_list
end type
type rb_tabular from radiobutton within w_dynamic_uo_table_list
end type
type rb_grid from radiobutton within w_dynamic_uo_table_list
end type
type cb_cancel from commandbutton within w_dynamic_uo_table_list
end type
type mle_dscrption from multilineedit within w_dynamic_uo_table_list
end type
type cb_ok from commandbutton within w_dynamic_uo_table_list
end type
type dw_tbls_lst from datawindow within w_dynamic_uo_table_list
end type
type gb_1 from groupbox within w_dynamic_uo_table_list
end type
end forward

global type w_dynamic_uo_table_list from w_center
int X=644
int Y=327
int Width=1629
int Height=1274
boolean TitleBar=true
string Title="テーブル一覧"
long BackColor=74481808
boolean ControlMenu=true
ToolBarAlignment ToolBarAlignment=AlignAtLeft!
WindowType WindowType=response!
rb_free rb_free
rb_tabular rb_tabular
rb_grid rb_grid
cb_cancel cb_cancel
mle_dscrption mle_dscrption
cb_ok cb_ok
dw_tbls_lst dw_tbls_lst
gb_1 gb_1
end type
global w_dynamic_uo_table_list w_dynamic_uo_table_list

type variables
string is_table,is_style
end variables

on open;
	dw_tbls_lst.settransobject(sqlca)
	dw_tbls_lst.retrieve()

//************************************************************************
//			The first Radio Button in the Group box of DataWindow type will
//			be automatically checked.  If the user does not mouse click on 
//			any radio button the following line of code will make the 
//			DataWindow come up in a Grid Style, otherwise it would default 
//			to tabular and confuse the user.
//************************************************************************
rb_grid.postevent(clicked!)


end on

on w_dynamic_uo_table_list.create
this.rb_free=create rb_free
this.rb_tabular=create rb_tabular
this.rb_grid=create rb_grid
this.cb_cancel=create cb_cancel
this.mle_dscrption=create mle_dscrption
this.cb_ok=create cb_ok
this.dw_tbls_lst=create dw_tbls_lst
this.gb_1=create gb_1
this.Control[]={ this.rb_free,&
this.rb_tabular,&
this.rb_grid,&
this.cb_cancel,&
this.mle_dscrption,&
this.cb_ok,&
this.dw_tbls_lst,&
this.gb_1}
end on

on w_dynamic_uo_table_list.destroy
destroy(this.rb_free)
destroy(this.rb_tabular)
destroy(this.rb_grid)
destroy(this.cb_cancel)
destroy(this.mle_dscrption)
destroy(this.cb_ok)
destroy(this.dw_tbls_lst)
destroy(this.gb_1)
end on

type rb_free from radiobutton within w_dynamic_uo_table_list
integer x = 832
integer y = 864
integer width = 462
integer height = 68
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "フリー フォーム"
borderstyle borderstyle = stylelowered!
end type

on clicked;
	IF this.checked THEN is_style	=	"form"
end on

type rb_tabular from radiobutton within w_dynamic_uo_table_list
integer x = 553
integer y = 864
integer width = 279
integer height = 68
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "タブラ"
borderstyle borderstyle = stylelowered!
end type

on clicked;
	IF this.checked THEN is_style	=	"tabular"

end on

type rb_grid from radiobutton within w_dynamic_uo_table_list
integer x = 279
integer y = 864
integer width = 256
integer height = 68
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "グリッド"
boolean checked = true
borderstyle borderstyle = stylelowered!
end type

on clicked;
	if this.checked then is_style	=	"grid"
end on

type cb_cancel from commandbutton within w_dynamic_uo_table_list
integer x = 809
integer y = 1028
integer width = 347
integer height = 96
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "キャンセル(&C)"
end type

on clicked;// pass back an empty string since the user did not select a table
	closewithreturn(parent,'')
end on

type mle_dscrption from multilineedit within w_dynamic_uo_table_list
integer x = 55
integer y = 20
integer width = 1481
integer height = 196
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "データウィンドウを作成するには、テーブルの一覧からテーブル名とデータウィンドウの提示様式を選択し、OKボタンを押すか、またはテーブル名をダブルクリックして下さい。"
boolean border = false
boolean displayonly = true
end type

type cb_ok from commandbutton within w_dynamic_uo_table_list
integer x = 485
integer y = 1028
integer width = 288
integer height = 96
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
boolean enabled = false
string text = "OK(&O)"
boolean default = true
end type

on clicked;	Closewithreturn(parent,is_table+'|'+is_style)

end on

type dw_tbls_lst from datawindow within w_dynamic_uo_table_list
integer x = 466
integer y = 300
integer width = 649
integer height = 396
integer taborder = 10
string dataobject = "d_table_list"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;/////////////////////////////////////////////////////////////////////////////////////////////
// Clicked script for dw_tbls_lst
/////////////////////////////////////////////////////////////////////////////////////////////

If row > 0 Then
	//get the table name
	is_table = this.object.data[row, 1]

	//highlight the clicked row
	this.selectrow(0, FALSE)
	this.selectrow(row,TRUE)
	
	//the OK button is now available
	cb_ok.enabled = true
End If

end event

event doubleclicked;/////////////////////////////////////////////////////////////////////////////////////////////
// DoubleClicked script for dw_tbls_lst
/////////////////////////////////////////////////////////////////////////////////////////////

if row > 0 then
	//get the table name
	is_table = this.object.data[row, 1]
		
	//the OK button is now available
	cb_ok.enabled = true
	
	//complete processing by executing the clicked event
	cb_ok.postevent(clicked!)
end if
end event

type gb_1 from groupbox within w_dynamic_uo_table_list
integer x = 215
integer y = 788
integer width = 1157
integer height = 180
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "提示様式"
borderstyle borderstyle = stylelowered!
end type

