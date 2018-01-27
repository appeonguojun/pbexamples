$PBExportHeader$w_mdi_main_sheet.srw
$PBExportComments$MDIフレーム
forward
global type w_mdi_main_sheet from w_center
end type
type dw_1 from datawindow within w_mdi_main_sheet
end type
end forward

global type w_mdi_main_sheet from w_center
integer x = 676
integer y = 270
integer width = 1588
integer height = 1067
string menuname = "m_mdiframe_sheet"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
dw_1 dw_1
end type
global w_mdi_main_sheet w_mdi_main_sheet

type variables
string is_title
end variables

forward prototypes
public subroutine wf_retrieve_data (integer dept, string dept_name)
end prototypes

public subroutine wf_retrieve_data (integer dept, string dept_name);/////////////////////////////////////////////////////////////////////////////////////////
// Function: wf_retrieve_data
/////////////////////////////////////////////////////////////////////////////////////////

integer ll_ret

this.title = is_title +dept_name

ll_ret = dw_1.Retrieve(dept)
if ll_ret < 1 then
	MessageBox("エラー", "部署 " + String(dept) + " に所属する従業員が見つかりません", &
					 Information!, OK!)
end if



end subroutine

event open;call super::open;/////////////////////////////////////////////////////////////////////////////////////////
//Open script for w_mdi_main_sheet
/////////////////////////////////////////////////////////////////////////////////////////

// Get the structure 
mdi_main_structure parm
parm = message.powerobjectparm

// Assign the appropriate window title
is_title = parm.title

// Assign the appropriate datawindow object
dw_1.dataobject = parm.datawindow_name

// Retrive the datawindow
dw_1.settransobject(sqlca)
if parm.dept <> 0 then wf_retrieve_data(parm.dept,parm.dept_name)

end event

event resize;/////////////////////////////////////////////////////////////////////////////////////////
//Resize script for w_mdi_main_sheet
/////////////////////////////////////////////////////////////////////////////////////////

// Resize the data window to fit neatly, however the window is sized
dw_1.Resize(this.WorkSpaceWidth( ) - 25, this.WorkSpaceHeight( ) - 25)
end event

on w_mdi_main_sheet.create
int iCurrent
call super::create
if this.MenuName = "m_mdiframe_sheet" then this.MenuID = create m_mdiframe_sheet
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on w_mdi_main_sheet.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_1)
end on

type dw_1 from datawindow within w_mdi_main_sheet
integer y = 4
integer width = 996
integer height = 597
integer taborder = 1
boolean vscrollbar = true
boolean livescroll = true
end type

event dragdrop;/////////////////////////////////////////////////////////////////////////////////////////
// DragDrop script for dw_1
/////////////////////////////////////////////////////////////////////////////////////////

DragObject	ldo_which_control
int li_dept, li_row
string ls_dept_name
datawindow ldw

ldo_which_control = DraggedObject()
if TypeOf(ldo_which_control) = Datawindow! then // did a datawindow get dropped on me?
	ldw = ldo_which_control
//	if dw.dataobject = 'd_dept_name'  then // is it one I know how to work with?
		li_row = ldw.getrow()
		if li_row > 0 then // does it have rows in it?
			li_dept = ldw.object.dept_id[li_row]
			ls_dept_name = ldw.object.dept_name[li_row]
			wf_retrieve_data(li_dept,ls_dept_name)
		end if
//	end if
end if
end event

