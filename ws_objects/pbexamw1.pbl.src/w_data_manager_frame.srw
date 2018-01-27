$PBExportHeader$w_data_manager_frame.srw
$PBExportComments$データ マネージャ フレーム
forward
global type w_data_manager_frame from w_center
end type
type mdi_1 from mdiclient within w_data_manager_frame
end type
end forward

global type w_data_manager_frame from w_center
integer y = 4
integer width = 2932
integer height = 1895
string title = "データマネージャ"
string menuname = "m_data_manager"
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 273962025
toolbaralignment toolbaralignment = alignatleft!
mdi_1 mdi_1
end type
global w_data_manager_frame w_data_manager_frame

type variables
boolean	          ib_autoarrange = false
boolean	          ib_minimizeonuse = false
listviewview       ilvv_defaultstyle = listviewlargeicon!
end variables

event open;call super::open;n_cst_parms	lnv_parm

lnv_parm.is_dataobject = "d_sales_reps"
lnv_parm.iw_frame = this

OpenSheetWithParm(w_data_manager, lnv_parm, this, 3, original!)

end event

on w_data_manager_frame.create
int iCurrent
call super::create
if this.MenuName = "m_data_manager" then this.MenuID = create m_data_manager
this.mdi_1=create mdi_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
end on

on w_data_manager_frame.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

event close;Rollback using SQLCA ;
Show(w_main)

end event

type mdi_1 from mdiclient within w_data_manager_frame
long BackColor=273962025
end type

