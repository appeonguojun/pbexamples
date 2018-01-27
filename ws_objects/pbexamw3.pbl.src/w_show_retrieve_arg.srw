$PBExportHeader$w_show_retrieve_arg.srw
$PBExportComments$ユーザによって入力された検索引数でデータウィンドウを検索します。データウィンドウはその検索引数と一致するデータを表示します。
forward
global type w_show_retrieve_arg from w_center
end type
type cb_close from commandbutton within w_show_retrieve_arg
end type
type cb_retrieve from commandbutton within w_show_retrieve_arg
end type
type em_end_date from editmask within w_show_retrieve_arg
end type
type em_start_date from editmask within w_show_retrieve_arg
end type
type st_4 from statictext within w_show_retrieve_arg
end type
type st_3 from statictext within w_show_retrieve_arg
end type
type st_2 from statictext within w_show_retrieve_arg
end type
type ddlb_customer from dropdownlistbox within w_show_retrieve_arg
end type
type st_1 from statictext within w_show_retrieve_arg
end type
type dw_1 from datawindow within w_show_retrieve_arg
end type
end forward

global type w_show_retrieve_arg from w_center
int X=168
int Y=23
int Width=2593
int Height=1869
boolean TitleBar=true
string Title="データウィンドウの検索引数の参照"
long BackColor=74481808
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
ToolBarAlignment ToolBarAlignment=AlignAtLeft!
event ue_open pbm_custom01
cb_close cb_close
cb_retrieve cb_retrieve
em_end_date em_end_date
em_start_date em_start_date
st_4 st_4
st_3 st_3
st_2 st_2
ddlb_customer ddlb_customer
st_1 st_1
dw_1 dw_1
end type
global w_show_retrieve_arg w_show_retrieve_arg

on ue_open;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Load the ddlb with customer names from the customer table.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string	ls_select, ls_lname,ls_fname,ls_add


dw_1.SetTransObject (sqlca)
dw_1.InsertRow (0)

em_start_date.text = String (Year (Today())) + "/01/01"
em_end_date.text = String (Today())

declare lcur_cust cursor for
  SELECT distinct fname,lname 
    FROM customer,   
         sales_order  
   WHERE ( customer.id = sales_order.cust_id )   ;
open lcur_cust;

if sqlca.sqlcode < 0 then
	MessageBox ("データベースエラー", sqlca.sqlerrtext, exclamation!)
	return
end if 

ddlb_customer.SetRedraw(false)

do while sqlca.sqlcode = 0
	fetch lcur_cust into :ls_lname,:ls_fname;
	if sqlca.sqlcode = 0 then
		ls_add = ls_fname + ' '+ls_lname
		ddlb_customer.AddItem (ls_add)
	elseif sqlca.sqlcode < 0 then
		MessageBox ("データベースエラー", sqlca.sqlerrtext, exclamation!)
		return
	else
		exit
	end if
loop

ddlb_customer.SetRedraw(true)
close lcur_cust;

end on

on close;w_main.Show()
end on

on open;this.PostEvent ("ue_open")


end on

on w_show_retrieve_arg.create
this.cb_close=create cb_close
this.cb_retrieve=create cb_retrieve
this.em_end_date=create em_end_date
this.em_start_date=create em_start_date
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.ddlb_customer=create ddlb_customer
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={ this.cb_close,&
this.cb_retrieve,&
this.em_end_date,&
this.em_start_date,&
this.st_4,&
this.st_3,&
this.st_2,&
this.ddlb_customer,&
this.st_1,&
this.dw_1}
end on

on w_show_retrieve_arg.destroy
destroy(this.cb_close)
destroy(this.cb_retrieve)
destroy(this.em_end_date)
destroy(this.em_start_date)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.ddlb_customer)
destroy(this.st_1)
destroy(this.dw_1)
end on

type cb_close from commandbutton within w_show_retrieve_arg
integer x = 2184
integer y = 167
integer width = 280
integer height = 110
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

on clicked;close (parent)
end on

type cb_retrieve from commandbutton within w_show_retrieve_arg
integer x = 2184
integer y = 39
integer width = 280
integer height = 110
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "検索"
boolean default = true
end type

on clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Verify that the customer name retrieval argument has been entered, and then retrieve the
// DataWindow with arguments the user entered.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

date	ld_start, &
		ld_end
integer posi
string lname,fname


if Len (ddlb_customer.text) = 0 then
	MessageBox ("必須フィールド", "顧客名を指定してください。")
else
	em_start_date.GetData (ld_start)
	em_end_date.GetData (ld_end)
	posi = pos(ddlb_customer.text,',')
	lname = trim(left(ddlb_customer.text,posi -1))
	fname = trim(mid(ddlb_customer.text,posi +1))
	dw_1.Retrieve (ld_start, ld_end,fname,lname)
end if
end on

type em_end_date from editmask within w_show_retrieve_arg
integer x = 808
integer y = 388
integer width = 264
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
string text = "01/01/94"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yy/mm/dd"
end type

type em_start_date from editmask within w_show_retrieve_arg
integer x = 808
integer y = 277
integer width = 264
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
string text = "94/01/01"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yy/mm/dd"
end type

type st_4 from statictext within w_show_retrieve_arg
integer x = 44
integer y = 21
integer width = 1676
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string Text="データウィンドウの検索引数を入力してください。"
boolean focusrectangle = false
end type

type st_3 from statictext within w_show_retrieve_arg
integer x = 100
integer y = 398
integer width = 684
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "販売受注終了日:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_show_retrieve_arg
integer x = 68
integer y = 284
integer width = 716
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "販売受注開始日:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_customer from dropdownlistbox within w_show_retrieve_arg
integer x = 808
integer y = 167
integer width = 712
integer height = 388
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_show_retrieve_arg
integer x = 260
integer y = 174
integer width = 524
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "顧客名:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_show_retrieve_arg
integer x = 44
integer y = 537
integer width = 2480
integer height = 1205
integer taborder = 60
string dataobject = "d_sales_orders_args"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

