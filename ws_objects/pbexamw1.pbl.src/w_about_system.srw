$PBExportHeader$w_about_system.srw
$PBExportComments$バージョン情報の表示形式でシステム情報を表示
forward
global type w_about_system from w_center
end type
type cb_close from commandbutton within w_about_system
end type
type dw_about from uo_about within w_about_system
end type
end forward

global type w_about_system from w_center
integer x = 105
integer y = 160
integer width = 1851
integer height = 1124
string title = "システム情報の表示"
long backcolor = 78682240
toolbaralignment toolbaralignment = alignatleft!
cb_close cb_close
dw_about dw_about
end type
global w_about_system w_about_system

type prototypes


end prototypes

forward prototypes
public subroutine centerwindow (window awin)
end prototypes

public subroutine centerwindow (window awin);//////////////////////////////////////////////////////////////////////
// Center a window based on the screen dimensions.
//////////////////////////////////////////////////////////////////////
environment le_env
int screenheight, screenwidth

/* get screen measurements */

GetEnvironment(le_env)
screenheight = PixelsToUnits(le_env.screenheight,YPixelsToUnits!)
screenwidth = PixelsToUnits(le_env.screenwidth,XPixelsToUnits!)

/* now position window */

aWin.Move( (ScreenWidth - aWin.Width) / 2, (ScreenHeight - aWin.Height) / 2 )

end subroutine

on open;//////////////////////////////////////////////////////////////////////
// Call window function to center the window.  This window function is
// normally not necessary to center a window.  Windows can be centered
// when they are built in the window painter.  The purpose of this 
// window function is to make an external function call to determine
// the screen dimensions and center the window based on the screen 
// dimensions.
//////////////////////////////////////////////////////////////////////

this.centerwindow (this)


//////////////////////////////////////////////////////////////////////
// Trigger an event on the datawindow (which is a standard user object)
// to populate the datawindow with system information.
//////////////////////////////////////////////////////////////////////

dw_about.insertrow(0)
dw_about.triggerevent("ue_populate")
end on

on close;w_main.Show()
end on

on w_about_system.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.dw_about=create dw_about
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.dw_about
end on

on w_about_system.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.dw_about)
end on

type cb_close from commandbutton within w_about_system
integer x = 759
integer y = 848
integer width = 293
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

on clicked;close (parent)
end on

type dw_about from uo_about within w_about_system
integer x = 23
integer y = 36
integer width = 1751
integer height = 764
integer taborder = 10
boolean border = false
boolean livescroll = false
end type

