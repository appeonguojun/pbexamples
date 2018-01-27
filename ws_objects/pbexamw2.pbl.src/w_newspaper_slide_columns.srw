$PBExportHeader$w_newspaper_slide_columns.srw
$PBExportComments$段組提示様式/スライド カラムのサンプル プログラム
forward
global type w_newspaper_slide_columns from w_center
end type
type cb_help from commandbutton within w_newspaper_slide_columns
end type
type cb_print from commandbutton within w_newspaper_slide_columns
end type
type cb_close from commandbutton within w_newspaper_slide_columns
end type
type dw_1 from datawindow within w_newspaper_slide_columns
end type
end forward

global type w_newspaper_slide_columns from w_center
integer x = 84
integer y = 132
integer width = 2776
integer height = 1668
string title = "段組みカラムとカラムのスライド"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen pbm_custom01
cb_help cb_help
cb_print cb_print
cb_close cb_close
dw_1 dw_1
end type
global w_newspaper_slide_columns w_newspaper_slide_columns

event ue_postopen;////////////////////////////////////////////////////////////////////////////////////////////////////////
// ue_postopen script for w_newspaper_slide_columns
////////////////////////////////////////////////////////////////////////////////////////////////////////

// Set Print Preview on and at 70%
dw_1.Object.Datawindow.Print.Preview = 'yes' 
dw_1.Object.Datawindow.Print.Preview.Zoom= '70'

//Retrive data
dw_1.settransobject(sqlca)
dw_1.retrieve()


end event

event open;call super::open;////////////////////////////////////////////////////////////////////////////////////////////////////////
// open script for w_newspaper_slide_columns
////////////////////////////////////////////////////////////////////////////////////////////////////////

this.postevent("ue_postopen")
end event

event close;////////////////////////////////////////////////////////////////////////////////////////////////////////
// close script for w_newspaper_slide_columns
////////////////////////////////////////////////////////////////////////////////////////////////////////

// Show the Front End Window
w_main.Show( )

end event

on w_newspaper_slide_columns.create
this.cb_help=create cb_help
this.cb_print=create cb_print
this.cb_close=create cb_close
this.dw_1=create dw_1
this.Control[]={ this.cb_help,&
this.cb_print,&
this.cb_close,&
this.dw_1}
end on

on w_newspaper_slide_columns.destroy
destroy(this.cb_help)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.dw_1)
end on

type cb_help from commandbutton within w_newspaper_slide_columns
integer x = 1532
integer y = 1397
integer width = 280
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ(&H)"
end type

event clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_help
////////////////////////////////////////////////////////////////////////////////////////////////////////

//Call the help window
f_open_help(parent.ClassName( ))
end event

type cb_print from commandbutton within w_newspaper_slide_columns
integer x = 812
integer y = 1397
integer width = 280
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "印刷(&P)"
end type

event clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_print
////////////////////////////////////////////////////////////////////////////////////////////////////////

//print the datawindow
dw_1.print() 
end event

type cb_close from commandbutton within w_newspaper_slide_columns
integer x = 1176
integer y = 1397
integer width = 280
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

event clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_close
////////////////////////////////////////////////////////////////////////////////////////////////////////

//Close the window
Close(parent)
end event

type dw_1 from datawindow within w_newspaper_slide_columns
integer x = 12
integer y = 14
integer width = 2696
integer height = 1340
integer taborder = 10
string dataobject = "d_snake_slide_columns"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

