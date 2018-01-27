$PBExportHeader$w_update_trigger.srw
$PBExportComments$部署テーブルが変更された時、従業員を更新するためのトリガの定義デモ
forward
global type w_update_trigger from w_center
end type
type st_trig2 from statictext within w_update_trigger
end type
type st_trig1 from statictext within w_update_trigger
end type
type cb_help from commandbutton within w_update_trigger
end type
type cb_close from commandbutton within w_update_trigger
end type
type cb_update from commandbutton within w_update_trigger
end type
type st_2 from statictext within w_update_trigger
end type
type st_1 from statictext within w_update_trigger
end type
type dw_emp from datawindow within w_update_trigger
end type
type dw_dept from datawindow within w_update_trigger
end type
type ln_1a from line within w_update_trigger
end type
type ln_1b from line within w_update_trigger
end type
type ln_1c from line within w_update_trigger
end type
type ln_2a from line within w_update_trigger
end type
type ln_2b from line within w_update_trigger
end type
type ln_2c from line within w_update_trigger
end type
end forward

global type w_update_trigger from w_center
integer x = 460
integer y = 100
integer width = 2000
integer height = 1728
string title = "更新トリガ"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_open pbm_custom01
st_trig2 st_trig2
st_trig1 st_trig1
cb_help cb_help
cb_close cb_close
cb_update cb_update
st_2 st_2
st_1 st_1
dw_emp dw_emp
dw_dept dw_dept
ln_1a ln_1a
ln_1b ln_1b
ln_1c ln_1c
ln_2a ln_2a
ln_2b ln_2b
ln_2c ln_2c
end type
global w_update_trigger w_update_trigger

type variables

end variables

event ue_open;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ue_open script for w_update_trigger
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Set commit option to ON
execute immediate "set option wait_for_commit = on";

//Create trigger
execute immediate "create trigger DBA.update_emp_head_id after update of dept_head_id &
							order 1 on DBA.department &
							referencing old as old_dept new as new_dept &
							for each row &
							begin &
							  update employee set &
								 employee.manager_id = new_dept.dept_head_id where &
								 employee.dept_id = old_dept.dept_id &
							end" ;

//Set transaction objects
dw_dept.SetTransObject (SQLCA)
dw_emp.SetTransObject (SQLCA)

//Retrive the department datawindow
dw_dept.Retrieve()
end event

on w_update_trigger.create
int iCurrent
call super::create
this.st_trig2=create st_trig2
this.st_trig1=create st_trig1
this.cb_help=create cb_help
this.cb_close=create cb_close
this.cb_update=create cb_update
this.st_2=create st_2
this.st_1=create st_1
this.dw_emp=create dw_emp
this.dw_dept=create dw_dept
this.ln_1a=create ln_1a
this.ln_1b=create ln_1b
this.ln_1c=create ln_1c
this.ln_2a=create ln_2a
this.ln_2b=create ln_2b
this.ln_2c=create ln_2c
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_trig2
this.Control[iCurrent+2]=this.st_trig1
this.Control[iCurrent+3]=this.cb_help
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.cb_update
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.dw_emp
this.Control[iCurrent+9]=this.dw_dept
this.Control[iCurrent+10]=this.ln_1a
this.Control[iCurrent+11]=this.ln_1b
this.Control[iCurrent+12]=this.ln_1c
this.Control[iCurrent+13]=this.ln_2a
this.Control[iCurrent+14]=this.ln_2b
this.Control[iCurrent+15]=this.ln_2c
end on

on w_update_trigger.destroy
call super::destroy
destroy(this.st_trig2)
destroy(this.st_trig1)
destroy(this.cb_help)
destroy(this.cb_close)
destroy(this.cb_update)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_emp)
destroy(this.dw_dept)
destroy(this.ln_1a)
destroy(this.ln_1b)
destroy(this.ln_1c)
destroy(this.ln_2a)
destroy(this.ln_2b)
destroy(this.ln_2c)
end on

event close;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// close script for w_update_trigger
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Set commit option to OFF
execute immediate "set option wait_for_commit = off";

//Drop trigger
execute immediate "drop trigger DBA.update_emp_head_id" ;

w_main.Show()
end event

event open;call super::open;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// open script for w_update_trigger
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// To allow window to open faster, postevent to perform open operations
this.PostEvent ("ue_open")
end event

type st_trig2 from statictext within w_update_trigger
integer x = 384
integer y = 708
integer width = 904
integer height = 71
integer textsize = -9
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 8421504
long backcolor = 74481808
boolean enabled = false
string text = "自動的に更新します。"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_trig1 from statictext within w_update_trigger
integer x = 384
integer y = 654
integer width = 904
integer height = 71
integer textsize = -9
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 8421504
long backcolor = 74481808
boolean enabled = false
string text = "従業員テーブルを"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_help from commandbutton within w_update_trigger
integer x = 1672
integer y = 292
integer width = 248
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ(&H)"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_help
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

f_open_help (parent.ClassName())
end event

type cb_close from commandbutton within w_update_trigger
integer x = 1672
integer y = 160
integer width = 248
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_close
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

close (parent)
end event

type cb_update from commandbutton within w_update_trigger
integer x = 1672
integer y = 46
integer width = 248
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
boolean enabled = false
string text = "更新(&U)"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_update
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Update the departments DataWindow.  A trigger will fire that will automatically update the
// employees DataWindow.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Long	ll_cur_row, ll_dep_id, ll_Gray


if dw_dept.Update() = 1 then
	commit;
	if sqlca.sqlcode <> 0 then
		messagebox("エラー" + String (SQLCA.SQLDBCode), SQLCA.SQLErrText)
		return
	end if

	// Since we want to show the effects that the trigger had on the employee table, re-retrieve the
	// employees DataWindow.

	ll_cur_row = dw_dept.GetRow()
	if ll_cur_row > 0 then
		ll_dep_id = dw_dept.Object.dept_id[ll_cur_row]
		dw_emp.Retrieve (ll_dep_id)
	end if

else
	rollback;
end if


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Disable the update button and grey out the trigger help text
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 

// Disable the update button
this.enabled = false

// Change back to gray
ll_Gray = RGB(128, 128, 128)
st_trig1.TextColor = ll_Gray
st_trig2.TextColor = ll_Gray

// Change arrows
ln_1a.LineColor = ll_Gray
ln_1b.LineColor = ll_Gray
ln_1c.LineColor = ll_Gray
ln_2a.LineColor = ll_Gray
ln_2b.LineColor = ll_Gray
ln_2c.LineColor = ll_Gray

end event

type st_2 from statictext within w_update_trigger
integer x = 56
integer y = 821
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

type st_1 from statictext within w_update_trigger
integer x = 56
integer y = 50
integer width = 364
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

type dw_emp from datawindow within w_update_trigger
integer x = 56
integer y = 900
integer width = 1556
integer height = 644
integer taborder = 20
string dataobject = "d_emp_managed_by"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_dept from datawindow within w_update_trigger
integer x = 56
integer y = 124
integer width = 1556
integer height = 452
integer taborder = 10
string dataobject = "d_departments"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// rowfocuschanged script for dw_dept
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Retrieve the employees for the current department
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 

long 	ll_dept_id

If currentrow > 0 then
	ll_dept_id = this.Object.dept_id[currentrow]
	dw_emp.Retrieve (ll_dept_id)
End If
end event

event editchanged;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// editchanged script for dw_dept
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// When data changes, enable the update button and change color of trigger help text
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Long		ll_Blue

// Enable update button
cb_update.enabled = true

// Bright blue color
ll_Blue = RGB(0, 0, 255)
st_trig1.TextColor = ll_Blue
st_trig2.TextColor = ll_Blue

// Blue arrows
ln_1a.LineColor = ll_Blue
ln_1b.LineColor = ll_Blue
ln_1c.LineColor = ll_Blue
ln_2a.LineColor = ll_Blue
ln_2b.LineColor = ll_Blue
ln_2c.LineColor = ll_Blue

end event

event itemchanged;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// itemchanged script for dw_dept
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Long		ll_Blue

// Enable update button
cb_update.enabled = true

// Bright blue color
ll_Blue = RGB(0, 0, 255)
st_trig1.TextColor = ll_Blue
st_trig2.TextColor = ll_Blue

// Blue arrows
ln_1a.LineColor = ll_Blue
ln_1b.LineColor = ll_Blue
ln_1c.LineColor = ll_Blue
ln_2a.LineColor = ll_Blue
ln_2b.LineColor = ll_Blue
ln_2c.LineColor = ll_Blue

end event

type ln_1a from line within w_update_trigger
long linecolor = 8421504
integer linethickness = 13
integer beginx = 332
integer beginy = 636
integer endx = 332
integer endy = 768
end type

type ln_1b from line within w_update_trigger
long linecolor = 8421504
integer linethickness = 10
integer beginx = 304
integer beginy = 711
integer endx = 328
integer endy = 768
end type

type ln_1c from line within w_update_trigger
long linecolor = 8421504
integer linethickness = 10
integer beginx = 356
integer beginy = 711
integer endx = 332
integer endy = 768
end type

type ln_2a from line within w_update_trigger
long linecolor = 8421504
integer linethickness = 13
integer beginx = 1336
integer beginy = 636
integer endx = 1336
integer endy = 768
end type

type ln_2b from line within w_update_trigger
long linecolor = 8421504
integer linethickness = 10
integer beginx = 1304
integer beginy = 711
integer endx = 1332
integer endy = 768
end type

type ln_2c from line within w_update_trigger
long linecolor = 8421504
integer linethickness = 10
integer beginx = 1360
integer beginy = 711
integer endx = 1336
integer endy = 768
end type

