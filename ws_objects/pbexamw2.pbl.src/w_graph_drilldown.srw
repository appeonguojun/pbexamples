$PBExportHeader$w_graph_drilldown.srw
$PBExportComments$マスタ/詳細 ビジネス-グラフのサンプル
forward
global type w_graph_drilldown from w_center
end type
type st_3 from statictext within w_graph_drilldown
end type
type st_2 from statictext within w_graph_drilldown
end type
type st_popup from statictext within w_graph_drilldown
end type
type st_1 from statictext within w_graph_drilldown
end type
type cb_close from commandbutton within w_graph_drilldown
end type
type dw_salaries from datawindow within w_graph_drilldown
end type
type dw_headcount from datawindow within w_graph_drilldown
end type
end forward

global type w_graph_drilldown from w_center
integer x = 212
integer y = 50
integer width = 2956
integer height = 1966
string title = "グラフのドリルダウンとマウスの右ボタンの操作"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_rbuttonup pbm_rbuttonup
st_3 st_3
st_2 st_2
st_popup st_popup
st_1 st_1
cb_close cb_close
dw_salaries dw_salaries
dw_headcount dw_headcount
end type
global w_graph_drilldown w_graph_drilldown

on ue_rbuttonup;//hide the popup detail box again
st_popup.visible = false

end on

on open;// Open script for w_graph_drilldown

dw_headcount.SetTransObject (sqlca)
dw_salaries.SetTransObject (sqlca)


//populate the inital department datawindow
dw_headcount.Retrieve ()

end on

on close;// Close script for w_graph_drilldown

w_main.Show ()

end on

on w_graph_drilldown.create
int iCurrent
call super::create
this.st_3=create st_3
this.st_2=create st_2
this.st_popup=create st_popup
this.st_1=create st_1
this.cb_close=create cb_close
this.dw_salaries=create dw_salaries
this.dw_headcount=create dw_headcount
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_popup
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.cb_close
this.Control[iCurrent+6]=this.dw_salaries
this.Control[iCurrent+7]=this.dw_headcount
end on

on w_graph_drilldown.destroy
call super::destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_popup)
destroy(this.st_1)
destroy(this.cb_close)
destroy(this.dw_salaries)
destroy(this.dw_headcount)
end on

type st_3 from statictext within w_graph_drilldown
integer x = 72
integer y = 910
integer width = 1292
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "詳細を表示するにはダブルクリックしてください:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_graph_drilldown
integer x = 72
integer y = 68
integer width = 1748
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
string text = "バーの値を参照するには右クリックしてください。"
boolean focusrectangle = false
end type

type st_popup from statictext within w_graph_drilldown
boolean visible = false
integer x = 1900
integer y = 7
integer width = 480
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "ポップアップ"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_1 from statictext within w_graph_drilldown
integer x = 72
integer y = 14
integer width = 1764
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
string text = "部署をクリックすると部署別の従業員給与を参照できます。"
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_graph_drilldown
integer x = 1332
integer y = 1724
integer width = 324
integer height = 85
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

on clicked;// Clicked script for cb_done

Close (Parent)

end on

type dw_salaries from datawindow within w_graph_drilldown
event ue_rbuttonup pbm_rbuttonup
event ue_graphcreate pbm_dwngraphcreate
integer x = 56
integer y = 978
integer width = 2760
integer height = 708
integer taborder = 20
string dataobject = "d_empl_salaries_in_dept"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

on ue_rbuttonup;//hide the popup again
st_popup.visible = false

end on

on ue_graphcreate;// GraphCreate script for dw_salaries

/****************************************************************
	GraphCreate is a user-defined event assigned to the
	Event ID pbm_dwngraphcreate.
 ****************************************************************/


string 	ls_seriesname
string 	ls_grgraphname = "gr_1"
int    	li_result, li_count, li_index

/****************************************************************
	Now that the graph has been populated by the DataWindow, we
	can get the name of its series and set the color of that
	series to blue. Also set the average line to red
 ****************************************************************/

//average line
ls_seriesname = dw_salaries.SeriesName (ls_grgraphname,1)
li_result       =    dw_salaries.SetSeriesStyle ( ls_grgraphname, ls_seriesname, &
    				Foreground!, Rgb (255, 0,0) )
dw_salaries.SetSeriesStyle (ls_grgraphname, ls_seriesname,NoSymbol!)

//bars
ls_seriesname = dw_salaries.SeriesName (ls_grgraphname,2)

li_result       = dw_salaries.SetSeriesStyle ( ls_grgraphname, ls_seriesname, &
    				Shade!, Rgb (0, 0, 128) )
li_result       = dw_salaries.SetSeriesStyle ( ls_grgraphname, ls_seriesname, &
    				Foreground!, Rgb (0, 0, 255) )



end on

event rbuttondown;// Clicked script for dw_headcount
// This will cause the acutal salary to appear in a text box next to the pointer
// when the user right mouse button clicks on a bar column.

grObjectType	ClickedObject
string			ls_grgraphname="gr_1"
int				li_series, li_category

/************************************************************
	Find out where the user clicked in the graph
 ***********************************************************/
ClickedObject = this.ObjectAtPointer (ls_grgraphname, li_series, &
						li_category)

/************************************************************
	If user clicked on data or category, find out which one
 ***********************************************************/

If ClickedObject = TypeData! Then
//fill the text box with data 
	st_popup.text = string(this.GetData(ls_grgraphname, li_series, li_category)*1000,"#,###,##0")+" 円"
//move the box to the pointer location
	st_popup.x = parent.PointerX()
	st_popup.y = parent.PointerY() - 65
//make the box visible
	st_popup.visible = true
End If

end event

on doubleclicked;// Clicked script for dw_headcount
//This will open up a responce window containing the detail of the employee that
//was double clicked on


grObjectType	ClickedObject
string			ls_empl , ls_grgraphname="gr_1"
int				li_series, li_category,li_pos
s_employee      lst_employee
/************************************************************
	Find out where the user clicked in the graph
 ***********************************************************/

SetPointer (Hourglass!)

ClickedObject = this.ObjectAtPointer (ls_grgraphname, li_series, &
						li_category)

/************************************************************
	If user clicked on data or category, find out which one
 ***********************************************************/
If ClickedObject = TypeData!  or &
	ClickedObject = TypeCategory!  then
		ls_empl = this.CategoryName (ls_grgraphname, li_category)
//get the employee #
		lst_employee.employee_id = integer( ls_empl )
		lst_employee.no_edit = true
		openwithparm(w_empl_detail, lst_employee)
Else
		MessageBox (Parent.Title, "棒グラフをクリックすると、従業員の詳細情報が参照できます。")
End If

end on

type dw_headcount from datawindow within w_graph_drilldown
event ue_rbuttonup pbm_rbuttonup
integer x = 56
integer y = 146
integer width = 2760
integer height = 757
integer taborder = 10
string dataobject = "d_dept_headcount"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

on ue_rbuttonup;//hide the popup box again
st_popup.visible = false
end on

on rbuttondown;// Clicked script for dw_headcount
// This will cause a static text box to appear next to the pointer where the user
// is using right mouse button down. The acutal value for the data item will
// be displayed in the text box.

grObjectType	ClickedObject
string			ls_grgraphname="gr_1"
int				li_series, li_category

/************************************************************
	Find out where the user clicked in the graph
 ***********************************************************/
ClickedObject = this.ObjectAtPointer (ls_grgraphname, li_series, &
						li_category)

/************************************************************
	If user clicked on data or category, find out which one
 ***********************************************************/
If ClickedObject = TypeData! Then
	st_popup.text = "従業員" + string(this.GetData(ls_grgraphname, li_series, li_category)) &
		+ "人"
	st_popup.x = parent.PointerX()
	st_popup.y = parent.PointerY() - 65
	st_popup.visible = true
End If

end on

on clicked;// Clicked script for dw_headcount
// This will cause the employee datawindow to populate based
// on which bar column you clicked on.

grObjectType	ClickedObject
string			ls_dept, ls_grgraphname="gr_1" 
int				li_series, li_category

/************************************************************
	Find out where the user clicked in the graph
 ***********************************************************/
ClickedObject = this.ObjectAtPointer (ls_grgraphname, li_series, &
						li_category)

/************************************************************
	If user clicked on data or category, find out which one
 ***********************************************************/
If ClickedObject = TypeData!  or &
	ClickedObject = TypeCategory!  then
		ls_dept = this.CategoryName (ls_grgraphname, li_category)
		dw_salaries.Modify (ls_grgraphname + ".title=" + &
				"'" + ls_dept + " の従業員 ' ")

		dw_salaries.Retrieve (ls_dept)
Else

	MessageBox (Parent.Title, "棒グラフをクリックすると、その部署の従業員情報が参照できます。")

End If

end on

