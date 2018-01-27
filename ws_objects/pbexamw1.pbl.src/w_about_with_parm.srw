$PBExportHeader$w_about_with_parm.srw
$PBExportComments$一般的なバージョン情報ウィンドウで OpenSheetWithParm 機能が使用されています。
forward
global type w_about_with_parm from w_center
end type
type lv_1 from listview within w_about_with_parm
end type
type st_sys_resources from statictext within w_about_with_parm
end type
type st_mode from statictext within w_about_with_parm
end type
type cb_ok from commandbutton within w_about_with_parm
end type
type st_1 from statictext within w_about_with_parm
end type
type st_app_title from statictext within w_about_with_parm
end type
type st_conv_memory from statictext within w_about_with_parm
end type
type mle_about from multilineedit within w_about_with_parm
end type
type ln_1 from line within w_about_with_parm
end type
end forward

global type w_about_with_parm from w_center
integer x = 664
integer y = 267
integer width = 1576
integer height = 1060
string title = "バージョン情報"
windowtype windowtype = response!
long backcolor = 78682240
string icon = "None!"
toolbaralignment toolbaralignment = alignatleft!
lv_1 lv_1
st_sys_resources st_sys_resources
st_mode st_mode
cb_ok cb_ok
st_1 st_1
st_app_title st_app_title
st_conv_memory st_conv_memory
mle_about mle_about
ln_1 ln_1
end type
global w_about_with_parm w_about_with_parm

type prototypes

end prototypes

event open;call super::open;////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Purpose:
//	This window expects to receive a string parameter that will contain
//	an @ sign to use as a delimiter to provide a window title and a message
//	to place in the window MLE control.
//
//	This script uses the 
//		Message Object String Parm to pass the title and contents of the 
//			About Window
//		POS function to find the Position of the @ sign 
//		MID Funciton to disect the string into 
//			THe window title = everything infront of the @ sign
//			The about Message = Everything after the @ sign
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string			 	ls_message, ls_windowtitle
int 				li_position, li_index
ulong			lul_memcount
uint				lui_resource_avail
ListViewItem	llvi_1

st_1.Text = "PowerBuilder " + sVersion + " Code Examples"
//************************************************************************
//		Display the logo icon in the ListView
//************************************************************************
llvi_1.PictureIndex = 1
lv_1.AddItem(llvi_1)
//llvi_1.ItemX = -75
//llvi_1.ItemY = 5
lv_1.SetItem(1, llvi_1)

//************************************************************************
//		First find the postion of the @ sign  
//************************************************************************
li_position = pos(message.stringparm, "@")

//************************************************************************
//		If There is an @ sign (lPosition > 0) then take the title and 
//		message out of the Message object StringParm
//		If there is no @ sign Assume that there is no title and use the 
//		String as the message
//************************************************************************

If li_position > 0 then 
	ls_windowtitle = mid(Message.StringParm, 1, li_position - 1)
	ls_message = mid (Message.StringParm, li_position + 1, Len(Message.StringParm))
else
	ls_windowtitle = Message.StringParm
	ls_message = ""
End if


//************************************************************************
//		Set up the window
//************************************************************************

//Move Title to appropriate spots
this.title = "バージョン情報: " + ls_windowtitle
st_app_title.text = ls_windowtitle

//Display message if any 
//If no message is available, remove comment box
if ls_message = "" then
	mle_about.visible = false
else
	mle_about.text = ls_message
End if

//Get Conventional memory from Global ExternalSDK call
// It returns the number of bytes available. Convert Bytes
// returned to K by dividing by 1024.
lul_memcount = gu_ext_func.uf_GetFreeMemory()
st_conv_memory.text = "メモリ:             " + &
	String(lul_memcount / 1024,"#,##0") + " KB の空き"


//Get System Resources from Global External SDK call
// It returns the % free System Resources 
lui_resource_avail = gu_ext_func.uf_GetFreeSystemResources( 0 )
If lui_resource_avail <> 0 Then
	st_sys_resources.text = "システム リソース:  " + String (lui_resource_avail) + " %  の空き"
End If


// Returns a double word of binary  encoded values.
// If the 6th bit is turned on , then the system is 386 enhanced mode
// If the 5th bit is turned on, then the system is standard mode
// other wise its in Real Mode
st_mode.text = gu_ext_func.uf_GetOS_mode ( )

end event

on w_about_with_parm.create
int iCurrent
call super::create
this.lv_1=create lv_1
this.st_sys_resources=create st_sys_resources
this.st_mode=create st_mode
this.cb_ok=create cb_ok
this.st_1=create st_1
this.st_app_title=create st_app_title
this.st_conv_memory=create st_conv_memory
this.mle_about=create mle_about
this.ln_1=create ln_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lv_1
this.Control[iCurrent+2]=this.st_sys_resources
this.Control[iCurrent+3]=this.st_mode
this.Control[iCurrent+4]=this.cb_ok
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_app_title
this.Control[iCurrent+7]=this.st_conv_memory
this.Control[iCurrent+8]=this.mle_about
this.Control[iCurrent+9]=this.ln_1
end on

on w_about_with_parm.destroy
call super::destroy
destroy(this.lv_1)
destroy(this.st_sys_resources)
destroy(this.st_mode)
destroy(this.cb_ok)
destroy(this.st_1)
destroy(this.st_app_title)
destroy(this.st_conv_memory)
destroy(this.mle_about)
destroy(this.ln_1)
end on

type lv_1 from listview within w_about_with_parm
integer x = 36
integer y = 21
integer width = 212
integer height = 171
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = shiftjis!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
boolean border = false
boolean buttonheader = false
boolean showheader = false
boolean labelwrap = false
boolean scrolling = false
string largepicturename[] = {"exampl.bmp"}
long largepicturemaskcolor = 12632256
integer smallpicturewidth = 16
integer smallpictureheight = 16
long smallpicturemaskcolor = 553648127
long statepicturemaskcolor = 553648127
end type

type st_sys_resources from statictext within w_about_with_parm
integer x = 264
integer y = 864
integer width = 1224
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 78682240
boolean enabled = false
boolean focusrectangle = false
end type

type st_mode from statictext within w_about_with_parm
integer x = 264
integer y = 736
integer width = 1224
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 78682240
boolean enabled = false
string text = "Windows モード"
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_about_with_parm
integer x = 1176
integer y = 18
integer width = 328
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "OK"
boolean default = true
end type

on clicked;close(parent)
end on

type st_1 from statictext within w_about_with_parm
integer x = 264
integer y = 114
integer width = 888
integer height = 75
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 78682240
boolean enabled = false
string text = "PowerBuilder 5.0 Code Examples "
boolean focusrectangle = false
end type

type st_app_title from statictext within w_about_with_parm
integer x = 264
integer y = 36
integer width = 916
integer height = 75
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 78682240
boolean enabled = false
string text = "アプリケーションタイトル"
boolean focusrectangle = false
end type

type st_conv_memory from statictext within w_about_with_parm
integer x = 264
integer y = 800
integer width = 1224
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 78682240
boolean enabled = false
string text = "コンベンショナルメモリ"
boolean focusrectangle = false
end type

type mle_about from multilineedit within w_about_with_parm
integer x = 40
integer y = 242
integer width = 1464
integer height = 448
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 78682240
boolean vscrollbar = true
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type ln_1 from line within w_about_with_parm
long linecolor = 33554432
integer linethickness = 4
integer beginx = 264
integer beginy = 725
integer endx = 1512
integer endy = 725
end type

