$PBExportHeader$w_psr_viewer.srw
$PBExportComments$.psrファイルを選択して、参照します。ウィンドウとデータウィンドウのサイズを調整してくだい。
forward
global type w_psr_viewer from w_center
end type
type cb_help from commandbutton within w_psr_viewer
end type
type cb_close from commandbutton within w_psr_viewer
end type
type cb_npage from commandbutton within w_psr_viewer
end type
type cb_ppage from commandbutton within w_psr_viewer
end type
type cb_print from commandbutton within w_psr_viewer
end type
type st_file from statictext within w_psr_viewer
end type
type cb_select from commandbutton within w_psr_viewer
end type
type dw_1 from datawindow within w_psr_viewer
end type
end forward

global type w_psr_viewer from w_center
int X=274
int Y=292
int Width=2391
int Height=1348
boolean TitleBar=true
string Title="PSR ファイルビューア"
long BackColor=74481808
boolean ControlMenu=true
ToolBarAlignment ToolBarAlignment=AlignAtLeft!
cb_help cb_help
cb_close cb_close
cb_npage cb_npage
cb_ppage cb_ppage
cb_print cb_print
st_file st_file
cb_select cb_select
dw_1 dw_1
end type
global w_psr_viewer w_psr_viewer

type prototypes

end prototypes

type variables
int ii_minheight
int ii_minwidth
end variables

forward prototypes
public subroutine of_change_dw (string as_filename)
end prototypes

public subroutine of_change_dw (string as_filename);//This function will assign the PSR to the DataWindow and size it and the window to the best size for 
//the contents. This is done by searching the columns of the datawindow to find the right most
//width.  The height is determined by the size of the detail band and summary.

Integer			li_column_count, li_counter, li_column_x, li_column_y, 	li_column_width, li_column_height, &
					li_new_width, li_new_height, li_screenwidth, li_screenheight, li_controls, li_index, &
					li_winheight, 	li_winwidth, li_dwheight, li_dwwidth, &
					li_max_x = 0, li_max_y = 0, li_vscroll_width = 78, li_hscroll_height = 69, li_report_width = 3190
String			ls_detail_height, ls_header_height, ls_footer_height, ls_summary_height
DragObject	ldo_temp
Environment	le_Environment

//turn redraw off to help avoid flicker
dw_1.setredraw(false)

//store filename on screen
st_file.text = as_filename

//assign the filename (.psr) to the datawindow dataobject.
dw_1.dataobject = as_filename

if dw_1.Describe("DataWindow.Print.Preview") = "yes" then
	li_max_x = li_report_width
else
//size window to the new datawindow
//fill sort column list box with column name as defined in the datawindow
li_column_count = Integer(dw_1.Object.DataWindow.Column.Count)

//loop through all of the columns in the datawindow
For li_counter =  1 To li_column_count
//	Find max x	
	li_column_x = Integer(dw_1.Describe("#"+string(li_counter)+".X"))
	li_column_width = Integer(dw_1.Describe("#"+string(li_counter)+".Width"))
	If li_column_x + li_column_width > li_max_x Then
		li_max_x = li_column_x + li_column_width
	End If
Next 
end if

//	Find max y -- get height of detail and summary band
ls_summary_height = dw_1.Object.Datawindow.Summary.Height
ls_detail_height = dw_1.Object.Datawindow.Detail.Height
ls_header_height = dw_1.Object.Datawindow.Header.Height
ls_footer_height = dw_1.Object.Datawindow.Footer.Height
li_max_y =  Integer(ls_summary_height) + &
				(Integer(ls_detail_height) * 5) + &
				Integer(ls_header_height) +  &
				Integer(ls_footer_height)

//calculate new height and width for datawindow	
li_new_width = dw_1.X + li_max_x + li_vscroll_width + 25
li_new_height = dw_1.Y + li_max_y + li_hscroll_height + 25

//min size of datawindow (contraints of the controls on the screen)
If li_new_width < ii_minwidth Then li_new_width = ii_minwidth
If li_new_height < ii_minheight Then li_new_height = ii_minheight

/* get screen measurements */
GetEnvironment(le_Environment)

li_screenheight = PixelsToUnits(le_Environment.screenheight, YPixelsToUnits!) - 120  // 250 taskbar height
li_screenwidth = PixelsToUnits(le_Environment.screenwidth, XPixelsToUnits!)

//max size of datawindow (contraints of screen width)
If li_new_width >= li_screenwidth - 75 Then
	dw_1.hscrollbar = true
	li_dwwidth = li_screenwidth - 75
	li_winwidth = li_screenwidth
Else
	dw_1.hscrollbar = false
	li_dwwidth = li_new_width 
	li_winwidth = li_new_width + dw_1.X + 75
End If

//max size for vertical (contraint of screen)
If li_new_height >= li_screenheight - 350 Then
	li_dwheight = li_screenheight - 350
	li_winheight = li_screenheight
Else
	li_dwheight = li_new_height
	li_winheight = li_new_height + dw_1.Y + 350
End If

//shift buttons and text to match new window size
li_controls = upperbound( control[])
For li_index = 1 to li_controls
	If Typeof(this.control[li_index]) = CommandButton! Then
			ldo_temp = this.control[li_index]
			ldo_temp.Y = li_winheight - (125 + ldo_temp.height)
	ElseIf  Typeof(this.control[li_index]) = StaticText! Then
			ldo_temp = this.control[li_index]
			ldo_temp.Y = li_winheight - (225 +ldo_temp.height)
	End If
Next

//resize window to best fit
this.resize(li_winwidth,li_winheight)		
//move window to be centered based on new size
this.Move((li_ScreenWidth - li_winwidth) / 2, (li_ScreenHeight - li_winheight) / 2)

//resize datawindow to best fit
dw_1.resize(li_dwwidth,li_dwheight)

//set redraw back on
dw_1.setredraw(true)

end subroutine

event open;call super::open;///////////////////////////////////////////////////////////////////////////////////////////////////////
// Open script for w_psr_viewer
///////////////////////////////////////////////////////////////////////////////////////////////////////

//this will open a file selector, then display the PSR report file in a datawindow

//get original height/width of datawindow 
ii_minheight = dw_1.height
ii_minwidth = dw_1.width

//start off getting a file
cb_select.Post Event clicked()

end event

event close;///////////////////////////////////////////////////////////////////////////////////////////////////////
// close script for w_psr_viewer
///////////////////////////////////////////////////////////////////////////////////////////////////////

//Show the Front End Window
w_main.show()
end event

on w_psr_viewer.create
this.cb_help=create cb_help
this.cb_close=create cb_close
this.cb_npage=create cb_npage
this.cb_ppage=create cb_ppage
this.cb_print=create cb_print
this.st_file=create st_file
this.cb_select=create cb_select
this.dw_1=create dw_1
this.Control[]={ this.cb_help,&
this.cb_close,&
this.cb_npage,&
this.cb_ppage,&
this.cb_print,&
this.st_file,&
this.cb_select,&
this.dw_1}
end on

on w_psr_viewer.destroy
destroy(this.cb_help)
destroy(this.cb_close)
destroy(this.cb_npage)
destroy(this.cb_ppage)
destroy(this.cb_print)
destroy(this.st_file)
destroy(this.cb_select)
destroy(this.dw_1)
end on

type cb_help from commandbutton within w_psr_viewer
integer x = 2020
integer y = 1120
integer width = 248
integer height = 89
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ(&H)"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////
// Clicked script for cb_help
///////////////////////////////////////////////////////////////////////////////////////////////////////

// Call for help
f_open_help(Parent.classname())
end event

type cb_close from commandbutton within w_psr_viewer
integer x = 1736
integer y = 1120
integer width = 248
integer height = 89
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////
// Clicked script for cb_close
///////////////////////////////////////////////////////////////////////////////////////////////////////

// Close window
close(parent)
end event

type cb_npage from commandbutton within w_psr_viewer
integer x = 1380
integer y = 1120
integer width = 320
integer height = 89
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "次ページ"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////
// Clicked script for cb_npage
///////////////////////////////////////////////////////////////////////////////////////////////////////

//Scroll datawindow forward a page
dw_1.scrollnextpage()
end event

type cb_ppage from commandbutton within w_psr_viewer
integer x = 928
integer y = 1120
integer width = 424
integer height = 89
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "前ページ"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////
// Clicked script for cb_ppage
///////////////////////////////////////////////////////////////////////////////////////////////////////

//scroll datawindow back a page
dw_1.scrollpriorpage()
end event

type cb_print from commandbutton within w_psr_viewer
integer x = 644
integer y = 1120
integer width = 248
integer height = 89
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "印刷(&P)"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////
// Clicked script for cb_print
///////////////////////////////////////////////////////////////////////////////////////////////////////

//standard print for a datawindow
dw_1.print( )
end event

type st_file from statictext within w_psr_viewer
integer x = 52
integer y = 1028
integer width = 2268
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
boolean focusrectangle = false
end type

type cb_select from commandbutton within w_psr_viewer
integer x = 36
integer y = 1120
integer width = 580
integer height = 89
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "PSR レポートの選択(&S)..."
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////
// Clicked script for cb_select
///////////////////////////////////////////////////////////////////////////////////////////////////////

int li_rc
string ls_path, ls_file
//
//This will open the standard file open dialog box with PSR extensions
li_rc = GetFileOpenName("PSR レポートファイルの選択", &
	ls_path,ls_file,"psr","レポートファイル (*.PSR),*.PSR")

If li_rc = 0 Then
	Return
End If

//change the datawindow
of_change_dw(ls_path)

end event

type dw_1 from datawindow within w_psr_viewer
integer x = 52
integer y = 43
integer width = 2244
integer height = 939
integer taborder = 10
boolean hscrollbar = true
boolean vscrollbar = true
end type

