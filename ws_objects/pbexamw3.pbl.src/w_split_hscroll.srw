$PBExportHeader$w_split_hscroll.srw
$PBExportComments$水平スクロールバーの分割のサンプル
forward
global type w_split_hscroll from w_center
end type
type cb_close from commandbutton within w_split_hscroll
end type
type dw_data from datawindow within w_split_hscroll
end type
type st_1 from statictext within w_split_hscroll
end type
end forward

global type w_split_hscroll from w_center
integer width = 2885
integer height = 2060
string title = "水平分割スクロール"
windowstate windowstate = maximized!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen pbm_custom01
cb_close cb_close
dw_data dw_data
st_1 st_1
end type
global w_split_hscroll w_split_hscroll

event ue_postopen;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ue_postopen script for w_split_hscroll
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string ls_colx

//retrieve data into datawindow
dw_data.SetTransObject (sqlca)
dw_data.Retrieve ()

// Get x location of emp_fname column
ls_colx = dw_data.Object.emp_fname.x

// Set the position of the horizontal split scroll point.
dw_data.Object.datawindow.horizontalscrollsplit = ls_colx
end event

event open;call super::open;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// open script for w_split_hscroll
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

this.postevent("ue_postopen")

end event

on w_split_hscroll.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.dw_data=create dw_data
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.dw_data
this.Control[iCurrent+3]=this.st_1
end on

on w_split_hscroll.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.dw_data)
destroy(this.st_1)
end on

event close;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// close script for w_split_hscroll
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Hide (this)
Show (w_main)
end event

type cb_close from commandbutton within w_split_hscroll
integer x = 1225
integer y = 1644
integer width = 329
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

event clicked;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_close
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

close(parent)
end event

type dw_data from datawindow within w_split_hscroll
integer x = 55
integer y = 252
integer width = 2729
integer height = 1368
integer taborder = 10
string dataobject = "d_employee_data_list_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_split_hscroll
integer x = 16
integer y = 25
integer width = 2824
integer height = 146
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "分割の位置を変更するには、2 つの水平スクロールバーの境界のマーカをドラッグしてください。データウィンドウの垂直スクロールは同期します。"
boolean focusrectangle = false
end type

