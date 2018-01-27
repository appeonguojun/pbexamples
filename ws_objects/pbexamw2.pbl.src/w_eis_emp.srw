$PBExportHeader$w_eis_emp.srw
$PBExportComments$従業員情報システムの部署別の従業員一覧
forward
global type w_eis_emp from w_center
end type
type cb_ok from commandbutton within w_eis_emp
end type
type st_1 from statictext within w_eis_emp
end type
type cb_new from commandbutton within w_eis_emp
end type
type cb_close from commandbutton within w_eis_emp
end type
type dw_emp_list from datawindow within w_eis_emp
end type
end forward

global type w_eis_emp from w_center
integer x = 472
integer y = 352
integer width = 1800
integer height = 1447
string title = " の従業員"
boolean controlmenu = false
windowtype windowtype = response!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_ok cb_ok
st_1 st_1
cb_new cb_new
cb_close cb_close
dw_emp_list dw_emp_list
end type
global w_eis_emp w_eis_emp

type variables
// structure which holds the department, manager id, 
// and employee id
s_employee    istr_info


end variables

forward prototypes
public function integer wf_refresh_emp (integer ai_dept, integer ai_emp)
end prototypes

public function integer wf_refresh_emp (integer ai_dept, integer ai_emp);//////////////////////////////////////////////////////////////////////
//
// Function: wf_refresh_emp
//
// Purpose: retrieves the employees datawindow, 
//				selects the desired employee id,
//				changes the title of the window to match department argument
//
//	Scope: public
//
//	Arguments: ai_dept			the department number retrieval argument
//				  ai_emp				the employee number to be selected
//
//	Returns: integer		the value returned from the retrieve function
//
//////////////////////////////////////////////////////////////////////

int		li_rc, &
			li_row, &
			li_rowcount
string	ls_dept_name


li_rc = dw_emp_list.Retrieve (ai_dept)

if li_rc = -1 then
	return li_rc
else
	// select the department name and
	// change the window title to match the department name argument

	select department.dept_name
	into :ls_dept_name
	from department
	where dept_id = :ai_dept;

	this.title = ls_dept_name + ' の従業員'


	// select the employee 
	li_rowcount = dw_emp_list.RowCount()
	if li_rowcount > 0 then
		li_row = dw_emp_list.Find ('emp_id = ' + String (ai_emp), 1, li_rowcount)
		dw_emp_list.SelectRow (0, false)		
		if li_row > 0 then
			dw_emp_list.SelectRow (li_row, true)
			dw_emp_list.ScrollToRow (li_row)
		end if
	end if

	return li_rc
end if

end function

event open;call super::open;//////////////////////////////////////////////////////////////////////
//
// Get the department number and manager id from the message object
// and retrieve the employees for department.
//
//////////////////////////////////////////////////////////////////////

int	li_rc


dw_emp_list.SetTransObject (SQLCA)

istr_info = message.PowerObjectParm

// assign a reference to this window in the employee info structure
// so that functions from this window can be called by the employee
// detail window.
istr_info.emp_win = this

// update the title of this window with the department name
this.title =  istr_info.dept_name + ' 部署' + this.title 

// if the auto_new field is true, then the user wants to enter a new
// employee without having to click the 'New Employee' button.
if istr_info.auto_new then
	cb_new.PostEvent (clicked!)
else
	li_rc = dw_emp_list.Retrieve (istr_info.department)
	if li_rc <= 0 then
		CloseWithReturn (this, li_rc)
		return
	end if
end if
end event

on w_eis_emp.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.st_1=create st_1
this.cb_new=create cb_new
this.cb_close=create cb_close
this.dw_emp_list=create dw_emp_list
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cb_new
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.dw_emp_list
end on

on w_eis_emp.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.st_1)
destroy(this.cb_new)
destroy(this.cb_close)
destroy(this.dw_emp_list)
end on

type cb_ok from commandbutton within w_eis_emp
integer x = 384
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

on clicked;dw_emp_list.TriggerEvent (doubleclicked!)
end on

type st_1 from statictext within w_eis_emp
integer x = 8
integer y = 11
integer width = 1692
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
string text = "従業員をダブルクリックするか、<新規従業員>ボタンを押して下さい。"
boolean focusrectangle = false
end type

type cb_new from commandbutton within w_eis_emp
integer x = 1000
integer y = 1152
integer width = 440
integer height = 107
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "新規従業員(&N)"
end type

on clicked;//////////////////////////////////////////////////////////////////////
// open the employee detail window, passing a 0 for employee id
// to signify a new employee to the detail window.
//////////////////////////////////////////////////////////////////////

istr_info.employee_id = 0
OpenWithParm (w_empl_detail, istr_info)

end on

type cb_close from commandbutton within w_eis_emp
integer x = 660
integer y = 1152
integer width = 288
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

on clicked;// close the window and pass 1 to the parent window
// In the parent window, if a 1 is returned, no errors occured.

CloseWithReturn (parent, 1)
end on

type dw_emp_list from datawindow within w_eis_emp
integer x = 84
integer y = 153
integer width = 1592
integer height = 900
integer taborder = 40
string dataobject = "d_emplist"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//////////////////////////////////////////////////////////////////////
// When an employee is doubleclicked, pass the employee id
// to the employee detail window.
//////////////////////////////////////////////////////////////////////

int			li_row

// get clicked row number
li_row = dw_emp_list.GetRow()
if li_row > 0 then 
	
	SetPointer(HourGlass!)
	
	// deselect old row, select new row
	dw_emp_list.SelectRow (0, false)
	dw_emp_list.SelectRow (li_row, true)
	
	// pass the employee id to the employee detail window
	istr_info.employee_id = dw_emp_list.Object.emp_id[li_row]
	istr_info.department = dw_emp_list.Object.dept_id[li_row]
	istr_info.manager_id = dw_emp_list.Object.manager_id[li_row]
	OpenWithParm (w_empl_detail, istr_info)
	
end if

end event

on rowfocuschanged;// select the current row

f_select_current_row (this)
end on

