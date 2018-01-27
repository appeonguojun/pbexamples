$PBExportHeader$w_dynsql_format3.srw
$PBExportComments$動的 SQL : 書式 3 サンプル
forward
global type w_dynsql_format3 from w_center
end type
type st_2 from statictext within w_dynsql_format3
end type
type st_1 from statictext within w_dynsql_format3
end type
type lb_employee from listbox within w_dynsql_format3
end type
type lb_dept from listbox within w_dynsql_format3
end type
end forward

global type w_dynsql_format3 from w_center
int X=644
int Y=529
int Width=1615
int Height=916
boolean TitleBar=true
string Title="動的 SQL: サンプル 3"
string MenuName="m_dynsql_format3"
long BackColor=74481808
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
ToolBarAlignment ToolBarAlignment=AlignAtLeft!
event ue_open pbm_custom01
st_2 st_2
st_1 st_1
lb_employee lb_employee
lb_dept lb_dept
end type
global w_dynsql_format3 w_dynsql_format3

on ue_open;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Use format 3 of dynamic sql to populate a listbox with manager names
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string				ls_sql, &
					ls_dept_name
m_dynsql_frame		lm_menuid



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Associate the dynamic staging area with a dynamic cursor
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
declare lc_dept dynamic cursor for sqlsa;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Prepare the dynamic staging area with an SQL statement
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ls_sql = "select dept_name from department"
prepare sqlsa from :ls_sql;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Open the dynamic cursor
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
open dynamic lc_dept;
if sqlca.sqlcode = -1 then
	MessageBox ("エラー", string (sqlca.sqldbcode) + ":  " + sqlca.sqlerrtext)
	close lc_dept;	
	return
end if


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Fetch rows, adding them to the manager ListBox
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
do while sqlca.sqlcode = 0
	fetch lc_dept into :ls_dept_name;
	if sqlca.sqlcode = 0 then
		lb_dept.AddItem (ls_dept_name)
	end if
loop
	

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Close the dynamic cursor
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
close lc_dept;
end on

on w_dynsql_format3.create
if this.MenuName = "m_dynsql_format3" then this.MenuID = create m_dynsql_format3
this.st_2=create st_2
this.st_1=create st_1
this.lb_employee=create lb_employee
this.lb_dept=create lb_dept
this.Control[]={ this.st_2,&
this.st_1,&
this.lb_employee,&
this.lb_dept}
end on

on w_dynsql_format3.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.lb_employee)
destroy(this.lb_dept)
end on

on open;this.PostEvent ("ue_open")
end on

type st_2 from statictext within w_dynsql_format3
integer x = 832
integer y = 53
integer width = 312
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
string text = "従業員:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_dynsql_format3
integer x = 76
integer y = 53
integer width = 332
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
string text = "部署:"
boolean focusrectangle = false
end type

type lb_employee from listbox within w_dynsql_format3
integer x = 832
integer y = 135
integer width = 684
integer height = 544
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type lb_dept from listbox within w_dynsql_format3
integer x = 72
integer y = 135
integer width = 684
integer height = 544
integer taborder = 20
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

on selectionchanged;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Use format 3 of dynamic sql to retrieve the employees for the current department
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string				ls_sql, &
					ls_emp_namef, ls_emp_namel, &
					ls_dept_name
window				lw_frame


ls_dept_name = this.SelectedItem()
lb_employee.Reset()

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Associate the dynamic staging area with a dynamic cursor
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
declare lc_emp dynamic cursor for sqlsa;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Prepare the dynamic staging area with an SQL statement
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ls_sql = "select emp_lname, emp_fname from employee e, department d " + &
		" where d.dept_name = ? and d.dept_id = e.dept_id"
prepare sqlsa from :ls_sql;

// Set microhelp to display the sql statement
lw_frame = parent.ParentWindow()
if IsValid (lw_frame) then
	lw_frame.SetMicroHelp ("動的 SQL 書式: " + ls_sql)
end if


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Open the dynamic cursor
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
open dynamic lc_emp using :ls_dept_name;
if sqlca.sqlcode = -1 then
	MessageBox ("エラー", string (sqlca.sqldbcode) + ":  " + sqlca.sqlerrtext)
	close lc_emp;	
	return
end if


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Fetch rows, adding them to the employees ListBox
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
do while sqlca.sqlcode = 0
	fetch lc_emp into :ls_emp_namel, :ls_emp_namef ;
	if sqlca.sqlcode = 0 then
		lb_employee.AddItem (ls_emp_namel + " " + ls_emp_namef)
	end if
loop
	

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Close the dynamic cursor
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
close lc_emp;
end on

