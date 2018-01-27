$PBExportHeader$u_date_scroller.sru
$PBExportComments$VScrollBar を使用して、日付を変更する
forward
global type u_date_scroller from UserObject
end type
type em_date from editmask within u_date_scroller
end type
type vsb_1 from vscrollbar within u_date_scroller
end type
end forward

global type u_date_scroller from UserObject
integer width = 408
integer height = 139
long BackColor=78682240
long PictureMaskColor=25166016
long TabTextColor=33554432
long TabBackColor=67108864
em_date em_date
vsb_1 vsb_1
end type
global u_date_scroller u_date_scroller

forward prototypes
public subroutine uf_set_date (date ad_date)
end prototypes

public subroutine uf_set_date (date ad_date);//////////////////////////////////////////////////////////////////////
//
// Function: uf_set_date
//
// Purpose: set the date on the date scroller
//
//	Scope: public
//
//	Arguments: ad_date	the date that you want to set the date scroller to
//
//	Returns: none
//
//////////////////////////////////////////////////////////////////////

em_date.text = String (ad_date)
end subroutine

on u_date_scroller.create
this.em_date=create em_date
this.vsb_1=create vsb_1
this.Control[]={ this.em_date,&
this.vsb_1}
end on

on u_date_scroller.destroy
destroy(this.em_date)
destroy(this.vsb_1)
end on

type em_date from editmask within u_date_scroller
integer x = 12
integer y = 18
integer width = 280
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ ゴシック"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yy/mm/dd"
end type

type vsb_1 from vscrollbar within u_date_scroller
integer x = 312
integer y = 18
integer width = 48
integer height = 103
integer maxposition = 200
integer position = 100
end type

on lineup;//Lineup script for vsb_1

if IsDate(em_date.text) then
	em_date.text = String(Relativedate(Date(em_date.text), 1))
else
	em_date.text = String(Today( ))
end if
end on

on linedown;//////////////////////////////////////////////////////////////////////
// Decrease the date by one day
//////////////////////////////////////////////////////////////////////

if IsDate(em_date.text) then
	em_date.text = String(Relativedate(Date(em_date.text), -1))
else
	em_date.text = String(Today( ))
end if
end on

