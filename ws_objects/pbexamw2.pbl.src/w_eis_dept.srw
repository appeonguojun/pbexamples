$PBExportHeader$w_eis_dept.srw
$PBExportComments$従業員情報システムのための部署一覧
forward
global type w_eis_dept from w_center
end type
type cb_1 from commandbutton within w_eis_dept
end type
type cb_close from commandbutton within w_eis_dept
end type
type st_1 from statictext within w_eis_dept
end type
type dw_dept_list from datawindow within w_eis_dept
end type
end forward

global type w_eis_dept from w_center
integer x = 152
integer y = 107
integer width = 1872
integer height = 1447
boolean TitleBar=true
string title = "部署一覧"
long BackColor=74481808
boolean ControlMenu=true
ToolBarAlignment ToolBarAlignment=AlignAtLeft!
cb_1 cb_1
cb_close cb_close
st_1 st_1
dw_dept_list dw_dept_list
end type
global w_eis_dept w_eis_dept

type variables
int mgrid
int deptnum


end variables

forward prototypes
public function int wf_refresh_dept (int ai_dept)
end prototypes

public function int wf_refresh_dept (int ai_dept);//////////////////////////////////////////////////////////////////////
//
// Function: wf_refresh_dept
//
// Purpose: retrieves the department datawindow, and selects the
//				desired row
//
//	Scope: public
//
//	Arguments: ai_dept	the department number to be selected
//
//	Returns: integer		the value returned from the retrieve function
//
//////////////////////////////////////////////////////////////////////

int	li_rc, &
		li_row, &
		li_rowcount


li_rc = dw_dept_list.Retrieve()
if li_rc = -1 then
	return li_rc
else

	// select the row with department id = department argument (ai_dept)
	li_rowcount = dw_dept_list.RowCount()
	if li_rowcount > 0 then
		li_row = dw_dept_list.Find ('dept_id = ' + String (ai_dept), 1, li_rowcount)
		dw_dept_list.SelectRow (0, false)		
		if li_row > 0 then
			dw_dept_list.SelectRow (li_row, true)
			dw_dept_list.ScrollToRow (li_row)
		end if
	end if

	return li_rc
end if
end function

on open;
// retrieve the departments

dw_dept_list.SetTransObject (SQLCA)
dw_dept_list.Retrieve()

end on

on close;w_main.Show()
end on

on w_eis_dept.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_close=create cb_close
this.st_1=create st_1
this.dw_dept_list=create dw_dept_list
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.dw_dept_list
end on

on w_eis_dept.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_close)
destroy(this.st_1)
destroy(this.dw_dept_list)
end on

type cb_1 from commandbutton within w_eis_dept
integer x = 608
integer y = 1152
integer width = 248
integer height = 107
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

on clicked;dw_dept_list.TriggerEvent (doubleclicked!)
end on

type cb_close from commandbutton within w_eis_dept
integer x = 888
integer y = 1152
integer width = 248
integer height = 107
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる"
end type

on clicked;close (parent)
end on

type st_1 from statictext within w_eis_dept
integer x = 20
integer y = 11
integer width = 1760
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
string text = "従業員情報を参照/更新するには、部署をダブルクリックして下さい。"
boolean focusrectangle = false
end type

type dw_dept_list from datawindow within w_eis_dept
integer x = 72
integer y = 128
integer width = 1668
integer height = 953
integer taborder = 30
string dataobject = "d_dept"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//////////////////////////////////////////////////////////////////////
// When a department is doubleclicked, pass the department number
// to the w_eis_emp window.  On the open event of the w_eis_emp
// window, the employees for the department that was doubleclicked
// will be retrieved.
//////////////////////////////////////////////////////////////////////

s_employee	lstr_info
int			li_row, &
				li_rc

// assign a reference to this window in the employee info structure
// so that functions from this window can be called by the employee
// detail window.
lstr_info.dept_win = parent

// get clicked row number
li_row = dw_dept_list.GetRow()
if li_row > 0 then 
	
	SetPointer(HourGlass!)
	
	// deselect old row, select new row
	dw_dept_list.SelectRow (0, false)
	dw_dept_list.SelectRow (li_row, true)
	
	// pass the department number and manager id to the employees window.
	// The auto_new field specifies whether to immediately go to the 
	// employee detail window.
	lstr_info.dept_name = dw_dept_list.Object.dept_name[li_row]
	lstr_info.department = dw_dept_list.Object.dept_id[li_row]
	lstr_info.manager_id = dw_dept_list.Object.dept_head_id[li_row]
	lstr_info.auto_new = false
	OpenWithParm (w_eis_emp, lstr_info)
	
	// if there was a retrieve problem in the employee window, display message.
	li_rc = Message.DoubleParm
	if li_rc = 0 then
		if MessageBox ('検索エラー', lstr_info.dept_name + 'には従業員がいません。' &
			+'新規従業員情報を入力しますか?', question!, YesNo!) = 1 then
			lstr_info.auto_new = true
			OpenWithParm (w_eis_emp, lstr_info)
		end if
	end if
	
end if

end event

on rowfocuschanged;// select the current row

f_select_current_row (this)
end on

