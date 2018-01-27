$PBExportHeader$w_ancestor.srw
$PBExportComments$多国語サンプルの先祖ウィンドウ
forward
global type w_ancestor from w_center
end type
type em_date from editmask within w_ancestor
end type
type st_1 from statictext within w_ancestor
end type
type st_2 from statictext within w_ancestor
end type
type sle_price from singlelineedit within w_ancestor
end type
type sle_qty from singlelineedit within w_ancestor
end type
type cb_1 from commandbutton within w_ancestor
end type
type cb_2 from commandbutton within w_ancestor
end type
type st_4 from statictext within w_ancestor
end type
type st_3 from statictext within w_ancestor
end type
type sle_total from singlelineedit within w_ancestor
end type
end forward

global type w_ancestor from w_center
integer x = 421
integer y = 512
integer width = 2080
integer height = 904
string title = "Price Calculation in English (US dollars)"
windowtype windowtype = response!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
em_date em_date
st_1 st_1
st_2 st_2
sle_price sle_price
sle_qty sle_qty
cb_1 cb_1
cb_2 cb_2
st_4 st_4
st_3 st_3
sle_total sle_total
end type
global w_ancestor w_ancestor

type variables

end variables

forward prototypes
public function decimal wf_total (decimal ac_price, decimal ac_quantity)
end prototypes

public function decimal wf_total (decimal ac_price, decimal ac_quantity);//////////////////////////////////////////////////////////////////////
//
// Function: wf_total
//
// Purpose: compute the total for the price and quantity arguments
//
//	Scope: public
//
//	Arguments: ac_price		the price
//				  ac_quantity	the quantity
//
//	Returns: decimal		
//
//////////////////////////////////////////////////////////////////////


return ac_quantity * ac_price

end function

on open;// default purchase date as today's date

em_date.text = String (Today())
end on

on w_ancestor.create
int iCurrent
call super::create
this.em_date=create em_date
this.st_1=create st_1
this.st_2=create st_2
this.sle_price=create sle_price
this.sle_qty=create sle_qty
this.cb_1=create cb_1
this.cb_2=create cb_2
this.st_4=create st_4
this.st_3=create st_3
this.sle_total=create sle_total
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_date
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.sle_price
this.Control[iCurrent+5]=this.sle_qty
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.sle_total
end on

on w_ancestor.destroy
call super::destroy
destroy(this.em_date)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.sle_price)
destroy(this.sle_qty)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.sle_total)
end on

type em_date from editmask within w_ancestor
integer x = 567
integer y = 40
integer width = 325
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy/mm/dd"
end type

type st_1 from statictext within w_ancestor
integer x = 261
integer y = 248
integer width = 265
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "Quantiy:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_ancestor
integer x = 247
integer y = 388
integer width = 279
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "Unit Price:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_price from singlelineedit within w_ancestor
integer x = 567
integer y = 376
integer width = 599
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string pointer = "arrow!"
long textcolor = 41943040
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

on modified;if not IsNumber (this.text) then
	this.text = '0'
end if

end on

on getfocus;this.SelectText (1, Len (this.text))
end on

type sle_qty from singlelineedit within w_ancestor
integer x = 567
integer y = 236
integer width = 599
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string pointer = "arrow!"
long textcolor = 41943040
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

on getfocus;this.SelectText (1, Len (this.text))
end on

on modified;if not IsNumber (this.text) then
	this.text = '0'
end if
end on

type cb_1 from commandbutton within w_ancestor
integer x = 1527
integer y = 48
integer width = 480
integer height = 108
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "Compute Total"
boolean default = true
end type

on clicked;// call the window function to calculate the total

decimal	lc_price, &
			lc_quantity, &
			lc_total

lc_price = Dec (sle_price.text)
lc_quantity = Dec (sle_qty.text)

lc_total = wf_total (lc_price, lc_quantity)
sle_total.text = String (lc_total, '[currency]')
end on

type cb_2 from commandbutton within w_ancestor
integer x = 1527
integer y = 184
integer width = 480
integer height = 108
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "Cancel"
boolean cancel = true
end type

on clicked;close (parent)
end on

type st_4 from statictext within w_ancestor
integer x = 50
integer y = 52
integer width = 480
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "Date of Purchase:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_ancestor
integer x = 361
integer y = 572
integer width = 169
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "Total:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_total from singlelineedit within w_ancestor
integer x = 567
integer y = 560
integer width = 599
integer height = 92
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string pointer = "arrow!"
long textcolor = 41943040
long backcolor = 74481808
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

