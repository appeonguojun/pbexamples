$PBExportHeader$w_customer_report.srw
$PBExportComments$検索引数によってネスティッド レポートを表示します。
forward
global type w_customer_report from w_center
end type
type ddlb_customer from dropdownlistbox within w_customer_report
end type
type st_1 from statictext within w_customer_report
end type
type dw_1 from datawindow within w_customer_report
end type
end forward

global type w_customer_report from w_center
integer x = 8
integer y = 210
integer width = 2972
integer height = 1540
string title = "顧客/受注 レポート"
string menuname = "m_nest"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_print pbm_custom01
event ue_first pbm_custom02
event ue_prior pbm_custom03
event ue_next pbm_custom04
event ue_last pbm_custom05
event ue_rulers pbm_custom06
event ue_zoom_down pbm_custom07
event ue_zoom_up pbm_custom08
event ue_zoom pbm_custom09
ddlb_customer ddlb_customer
st_1 st_1
dw_1 dw_1
end type
global w_customer_report w_customer_report

event ue_print;////////////////////////////////////////////////////////////////////////////////////////////////////////
// ue_print script for w_customer_report
////////////////////////////////////////////////////////////////////////////////////////////////////////

dw_1.Print()
end event

event ue_first;////////////////////////////////////////////////////////////////////////////////////////////////////////
// ue_first script for w_customer_report
////////////////////////////////////////////////////////////////////////////////////////////////////////

// Go to the first page of the report 
long	ll_row

dw_1.SetRedraw (false)
do 
	ll_row = dw_1.ScrollPriorPage()
loop until ll_row <= 1
dw_1.SetRedraw (true)

end event

event ue_prior;////////////////////////////////////////////////////////////////////////////////////////////////////////
// ue_prior script for w_customer_report
////////////////////////////////////////////////////////////////////////////////////////////////////////

// Go to the prior page of the report 
dw_1.ScrollPriorPage()

end event

event ue_next;////////////////////////////////////////////////////////////////////////////////////////////////////////
// ue_next script for w_customer_report
////////////////////////////////////////////////////////////////////////////////////////////////////////

// Go to the next page of the report 
dw_1.ScrollNextPage()
end event

event ue_last;////////////////////////////////////////////////////////////////////////////////////////////////////////
// ue_last script for w_customer_report
////////////////////////////////////////////////////////////////////////////////////////////////////////


// Go to the last page of the report 

long	ll_row, ll_prev_row

dw_1.SetRedraw (false)
do 
	ll_prev_row = ll_row
	ll_row = dw_1.ScrollNextPage()
loop until ll_row = ll_prev_row or ll_row <= 0
dw_1.SetRedraw (true)

end event

event ue_rulers;////////////////////////////////////////////////////////////////////////////////////////////////////////
// ue_rulers script for w_customer_report
////////////////////////////////////////////////////////////////////////////////////////////////////////

// Toggle the display of rulers on the datawindow.

m_nest		lm_menu

lm_menu = this.menuid
if lm_menu.m_display.m_rulers.checked then
	dw_1.Object.DataWindow.print.preview.rulers = 'yes'
else
	dw_1.Object.DataWindow.print.preview.rulers = 'no'
end if
end event

event ue_zoom_down;////////////////////////////////////////////////////////////////////////////////////////////////////////
// ue_zoom_down script for w_customer_report
////////////////////////////////////////////////////////////////////////////////////////////////////////

// Zoom the display area of the datawindow down

string		ls_factor
integer		li_factor
m_nest		lm_menu

// get the current zoom
ls_factor = dw_1.Object.DataWindow.print.preview.zoom
li_factor = integer (ls_factor)

// only zoom down if magnification is greater than 20%
if li_factor >=40 and li_factor <= 100 then
	li_factor = li_factor - 20
else
	// if magnification is currently 200%, zoom down to 100%
	if li_factor = 200 then
		li_factor = 100
	end if
end if

// set the new zoom level
dw_1.Object.DataWindow.print.preview.zoom = li_factor

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Check/uncheck the zoom menu items
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
lm_menu = this.menuid

lm_menu.m_display.m_zoom.m_20%.checked = false
lm_menu.m_display.m_zoom.m_40%.checked = false
lm_menu.m_display.m_zoom.m_60%.checked = false
lm_menu.m_display.m_zoom.m_80%.checked = false
lm_menu.m_display.m_zoom.m_100%.checked = false
lm_menu.m_display.m_zoom.m_200%.checked = false

choose case li_factor

	case 20
		lm_menu.m_display.m_zoom.m_20%.checked = true

	case 40
		lm_menu.m_display.m_zoom.m_40%.checked = true

	case 60
		lm_menu.m_display.m_zoom.m_60%.checked = true

	case 80
		lm_menu.m_display.m_zoom.m_80%.checked = true

	case 100
		lm_menu.m_display.m_zoom.m_100%.checked = true

	case 200
		lm_menu.m_display.m_zoom.m_200%.checked = true

end choose
end event

event ue_zoom_up;////////////////////////////////////////////////////////////////////////////////////////////////////////
// ue_zoom_up script for w_customer_report
////////////////////////////////////////////////////////////////////////////////////////////////////////

// Zoom the display area of the datawindow down

string		ls_factor
integer		li_factor
m_nest		lm_menu

// get the current zoom
ls_factor = dw_1.Object.DataWindow.print.preview.zoom
li_factor = Integer (ls_factor)

// zoom up by a factor of 20% if current magnification is between 20% - 80%
if li_factor >=20 and li_factor <=80 then
	li_factor = li_factor + 20
else
	// if magnification is currently 100%, zoom to 200%
	if li_factor = 100 then
		li_factor = 200
	end if
end if

// set the new zoom level
dw_1.Object.DataWindow.print.preview.zoom = li_factor


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Check/uncheck the zoom menu items
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
lm_menu = this.menuid

lm_menu.m_display.m_zoom.m_20%.checked = false
lm_menu.m_display.m_zoom.m_40%.checked = false
lm_menu.m_display.m_zoom.m_60%.checked = false
lm_menu.m_display.m_zoom.m_80%.checked = false
lm_menu.m_display.m_zoom.m_100%.checked = false
lm_menu.m_display.m_zoom.m_200%.checked = false

choose case li_factor

	case 20
		lm_menu.m_display.m_zoom.m_20%.checked = true

	case 40
		lm_menu.m_display.m_zoom.m_40%.checked = true

	case 60
		lm_menu.m_display.m_zoom.m_60%.checked = true

	case 80
		lm_menu.m_display.m_zoom.m_80%.checked = true

	case 100
		lm_menu.m_display.m_zoom.m_100%.checked = true

	case 200
		lm_menu.m_display.m_zoom.m_200%.checked = true

end choose
end event

event ue_zoom;////////////////////////////////////////////////////////////////////////////////////////////////////////
// ue_zoom script for w_customer_report
////////////////////////////////////////////////////////////////////////////////////////////////////////

// Zoom the display size of the report to the size specified on the menu.

int			li_factor
m_nest		lm_menu

lm_menu = this.menuid

// Initialize li_factor to zero
li_factor = 0

if lm_menu.m_display.m_zoom.m_20%.checked then 	
	li_factor = 20
elseif lm_menu.m_display.m_zoom.m_40%.checked then
	li_factor = 40

elseif lm_menu.m_display.m_zoom.m_60%.checked then
	li_factor = 60
elseif lm_menu.m_display.m_zoom.m_80%.checked then
	li_factor = 80
elseif lm_menu.m_display.m_zoom.m_100%.checked then
	li_factor = 100
elseif lm_menu.m_display.m_zoom.m_200%.checked then
	li_factor = 200
end if

if li_factor > 0 Then
	dw_1.Object.DataWindow.print.preview.zoom = li_factor
end if
end event

event open;call super::open;////////////////////////////////////////////////////////////////////////////////////////////////////////
// open script for w_customer_report
////////////////////////////////////////////////////////////////////////////////////////////////////////



// Load the ddlb with customer names from the customer table.

string	ls_select, &
			ls_add, &
			ls_lname, &
			ls_fname

dw_1.SetTransObject (sqlca)


declare lcur_cust cursor for
  SELECT distinct fname,lname 
    FROM customer,   
         sales_order  
   WHERE ( customer.id = sales_order.cust_id )   ;
open lcur_cust;

if sqlca.sqlcode < 0 then
	MessageBox ("データベース エラー", sqlca.sqlerrtext, exclamation!)
	return
end if 

ddlb_customer.SetRedraw(false)

do while sqlca.sqlcode = 0
	fetch lcur_cust into :ls_lname,:ls_fname;
	if sqlca.sqlcode = 0 then
		ls_add = ls_fname + ' '+ ls_lname
		ddlb_customer.AddItem (ls_add)
	elseif sqlca.sqlcode < 0 then
		MessageBox ("データベース エラー", sqlca.sqlerrtext, exclamation!)
		return
	else
		exit
	end if
loop

ddlb_customer.SetRedraw(true)
close lcur_cust;

end event

on w_customer_report.create
int iCurrent
call super::create
if this.MenuName = "m_nest" then this.MenuID = create m_nest
this.ddlb_customer=create ddlb_customer
this.st_1=create st_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_customer
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_1
end on

on w_customer_report.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.ddlb_customer)
destroy(this.st_1)
destroy(this.dw_1)
end on

event resize;////////////////////////////////////////////////////////////////////////////////////////////////////////
// resize script for w_customer_report
////////////////////////////////////////////////////////////////////////////////////////////////////////

// Resize the datawindow to match the size of the window.
dw_1.Resize (this.WorkSpaceWidth(), this.WorkSpaceHeight() - dw_1.Y)
end event

type ddlb_customer from dropdownlistbox within w_customer_report
integer x = 1204
integer y = 36
integer width = 708
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

event selectionchanged;////////////////////////////////////////////////////////////////////////////////////////////////////////
// selectionchanged script for dw_1
////////////////////////////////////////////////////////////////////////////////////////////////////////


// Retrieve the datawindow based on the user's selection of customer name.
string lname,fname
int posi
posi = pos(ddlb_customer.text,' ')
lname = trim(left(ddlb_customer.text, posi - 1))
fname = trim(mid(ddlb_customer.text, posi + 1))
dw_1.Retrieve (lname, fname)

// Set the Title
parent.title = "受注売上げ - " + lname + '  ' + fname

end event

type st_1 from statictext within w_customer_report
integer y = 46
integer width = 1184
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string Text="参照する顧客を選択してください:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_customer_report
integer y = 220
integer width = 2776
integer height = 1113
integer taborder = 20
string dataobject = "d_select_customer"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event rbuttondown;////////////////////////////////////////////////////////////////////////////////////////////////////////
// rbuttondown script for dw_1
////////////////////////////////////////////////////////////////////////////////////////////////////////


// Have the Display menu pop-up when the right mouse button is clicked
m_nest		lm_menuid
lm_menuid = parent.menuid
lm_menuid.m_display.PopMenu (parent.PointerX(), parent.PointerY())
end event

