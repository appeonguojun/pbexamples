$PBExportHeader$w_scale.srw
$PBExportComments$ウィンドウのコントロール配列を利用し、ウィンドウのサイズを変更するときに、ウィンドウ上のすべてのコントロールもサイズ変更する方法
forward
global type w_scale from w_center
end type
type cb_2 from commandbutton within w_scale
end type
type cb_exit from commandbutton within w_scale
end type
type cbx_1 from checkbox within w_scale
end type
type st_9 from statictext within w_scale
end type
type st_11 from statictext within w_scale
end type
type rb_2 from radiobutton within w_scale
end type
type rb_1 from radiobutton within w_scale
end type
type st_8 from statictext within w_scale
end type
type st_7 from statictext within w_scale
end type
type st_6 from statictext within w_scale
end type
type st_5 from statictext within w_scale
end type
type st_4 from statictext within w_scale
end type
type st_3 from statictext within w_scale
end type
type st_2 from statictext within w_scale
end type
type dw_freeform from datawindow within w_scale
end type
type vsb_1 from vscrollbar within w_scale
end type
type hsb_1 from hscrollbar within w_scale
end type
type gr_1 from graph within w_scale
end type
type p_1 from picture within w_scale
end type
type dw_1 from datawindow within w_scale
end type
type lb_1 from listbox within w_scale
end type
type mle_1 from multilineedit within w_scale
end type
type em_2 from editmask within w_scale
end type
type sle_1 from singlelineedit within w_scale
end type
type st_1 from statictext within w_scale
end type
type cb_1 from commandbutton within w_scale
end type
type em_1 from editmask within w_scale
end type
type gb_1 from groupbox within w_scale
end type
end forward

global type w_scale from w_center
integer x = 8
integer y = 132
integer width = 2928
integer height = 1682
string title = "ウィンドウ上のコントロールのサイズ変更"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_2 cb_2
cb_exit cb_exit
cbx_1 cbx_1
st_9 st_9
st_11 st_11
rb_2 rb_2
rb_1 rb_1
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
dw_freeform dw_freeform
vsb_1 vsb_1
hsb_1 hsb_1
gr_1 gr_1
p_1 p_1
dw_1 dw_1
lb_1 lb_1
mle_1 mle_1
em_2 em_2
sle_1 sle_1
st_1 st_1
cb_1 cb_1
em_1 em_1
gb_1 gb_1
end type
global w_scale w_scale

type variables
int ii_win_width, ii_win_height, ii_win_frame_w, ii_win_frame_h
str_size size_ctrl [] 

//Boolean variable to stop recursion
boolean ib_exec = false

end variables

forward prototypes
public function integer wf_size_it ()
public function integer wf_resize_it (double size_factor)
end prototypes

public function integer wf_size_it ();////////////////////////////////////////////////////////////////////////////////////////////////////
// function: wf_size_it
////////////////////////////////////////////////////////////////////////////////////////////////////

// save the original sizes of the window and all of the objects on the window
// NOTE !!!! this process does not work on objects that are not descended
// from the dragobject class.

dragobject temp
int cnt,i
ii_win_width  = this.width
ii_win_height = this.height
ii_win_frame_w = this.width - this.WorkSpaceWidth()
ii_win_frame_h = this.height - this.WorkSpaceHeight()

cnt = upperbound(this.control)
for i = cnt to 1 step -1
	temp = this.control[i]
	
	// everything has a x,y,width and height
	size_ctrl[i].x = temp.x 
	size_ctrl[i].width = temp.width 
	size_ctrl[i].y = temp.y
	size_ctrl[i].height = temp.height 

	// now go get text size information
	choose case typeof(temp)
		case commandbutton!
			commandbutton cb
			cb = temp
			size_ctrl[i].fontsize = cb.textsize 

		case singlelineedit!
			singlelineedit sle
			sle = temp
			size_ctrl[i].fontsize = sle.textsize 

		case editmask!
			editmask em
			em = temp
			size_ctrl[i].fontsize  	=	em.textsize 

		case statictext!
			statictext st
			st = temp
			size_ctrl[i].fontsize  	=	st.textsize 
	
		case picturebutton!
			picturebutton pb
			pb = temp
			size_ctrl[i].fontsize = pb.textsize 

		case checkbox!
			checkbox cbx
			cbx = temp
			size_ctrl[i].fontsize  	=	cbx.textsize 

		case dropdownlistbox!
			dropdownlistbox ddlb
			ddlb = temp
			size_ctrl[i].fontsize  	=	ddlb.textsize 

		case groupbox!
			groupbox gb
			gb = temp
			size_ctrl[i].fontsize  	=	gb.textsize 

		case listbox!
			listbox lb
			lb = temp
			size_ctrl[i].fontsize  	=	lb.textsize 

		case multilineedit!
			multilineedit mle
			mle = temp
			size_ctrl[i].fontsize  	=	mle.textsize 
		case radiobutton!
			radiobutton rb
			rb = temp
			size_ctrl[i].fontsize  	=	rb.textsize 
	end choose
next

return 1
end function

public function integer wf_resize_it (double size_factor);////////////////////////////////////////////////////////////////////////////////////////////////////
// function: wf_resize_it
////////////////////////////////////////////////////////////////////////////////////////////////////


// loop through off of the objects captured in the wf_size_it function and resize them
// Note !! radio buttons and checkboxes do not size properly as they are of fixed size.

dragobject temp
int cnt,i

ib_exec = false // keep the function from being called recursively
this.hide()

// resize the window
this.width = ((  ii_win_width - ii_win_frame_w) * size_factor) + ii_win_frame_w

this.height = ((  ii_win_height - ii_win_frame_h) * size_factor) + ii_win_frame_h

// for each control in the list, resize it and it's textsize (as applicable)
cnt = upperbound(this.control)
for i = cnt to 1 step -1
	temp = this.control[i]
	temp.x		 = size_ctrl[i].x * size_factor
	temp.width   = size_ctrl[i].width  * size_factor
	temp.y		 = size_ctrl[i].y * size_factor
	temp.height  = size_ctrl[i].height * size_factor 
	

	choose case typeof(temp)
		case commandbutton!
			commandbutton cb
			cb = temp
			cb.textsize =  size_ctrl[i].fontsize * size_factor 

		case singlelineedit!
			singlelineedit sle
			sle = temp
			sle.textsize =  size_ctrl[i].fontsize * size_factor 
		
		case editmask!
			editmask em
			em = temp
			em.textsize =  size_ctrl[i].fontsize * size_factor 
		
		case statictext!
			statictext st
			st = temp
			st.textsize =  size_ctrl[i].fontsize * size_factor 

		case datawindow! // datawindows get zoomed
			datawindow dw
			dw = temp
			dw.Object.DataWindow.zoom = string(int(size_factor*100))

		case picturebutton!
			picturebutton pb
			pb = temp
			pb.textsize =  size_ctrl[i].fontsize * size_factor 

		case checkbox!
			checkbox cbx
			cbx = temp
			cbx.textsize =  size_ctrl[i].fontsize * size_factor 

		case dropdownlistbox!
			dropdownlistbox ddlb
			ddlb = temp
			ddlb.textsize =  size_ctrl[i].fontsize * size_factor 

		case groupbox!
			groupbox gb
			gb = temp
			gb.textsize =  size_ctrl[i].fontsize * size_factor 

		case listbox!
			listbox lb
			lb = temp
			lb.textsize  =  size_ctrl[i].fontsize * size_factor 

		case multilineedit!
			multilineedit mle
			mle = temp
			mle.textsize =  size_ctrl[i].fontsize * size_factor 

		case radiobutton!
			radiobutton rb
			rb = temp
			rb.textsize =  size_ctrl[i].fontsize * size_factor 

	end choose
next

	
this.Show()
ib_exec = true
return 1
end function

event open;call super::open;////////////////////////////////////////////////////////////////////////////////////////////////////
// open script for w_scale
////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////
// This example is included as more of an oddity than something that you would 
// want to put into a production application
////////////////////////////////////////////////////////////////////////////////////////////////////

int	rc
int	series_nbr

// add some random data to the graph
series_nbr = gr_1.Addseries("経費")
randomize(0)
gr_1.AddData(Series_Nbr, rand(1000), "Jan")
gr_1.AddData(Series_Nbr, rand(1000), "Feb")
gr_1.AddData(Series_Nbr, rand(1000), "Mar")
gr_1.AddData(Series_Nbr, rand(1000), "Apr")
gr_1.AddData(Series_Nbr, rand(1000), "May")
dw_freeform.insertrow(0)

// save off the size data
rc = wf_size_it()
ib_exec = true




end event

event close;////////////////////////////////////////////////////////////////////////////////////////////////////
// close script for w_scale
////////////////////////////////////////////////////////////////////////////////////////////////////

w_main.show()
end event

event resize;////////////////////////////////////////////////////////////////////////////////////////////////////
// resize script for w_scale
////////////////////////////////////////////////////////////////////////////////////////////////////

double ratiow, ratio, ratioh
int rc

// recalculate the new ratios and then use the minimum
if ib_exec then  // Check to see if wf_resize_it is already running.
	ratioh = this.height /ii_win_height
	ratiow = this.width / ii_win_width
	ratio = min (ratioh, ratiow)
	rc = wf_resize_it(ratio)
end if

end event

on w_scale.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_exit=create cb_exit
this.cbx_1=create cbx_1
this.st_9=create st_9
this.st_11=create st_11
this.rb_2=create rb_2
this.rb_1=create rb_1
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.dw_freeform=create dw_freeform
this.vsb_1=create vsb_1
this.hsb_1=create hsb_1
this.gr_1=create gr_1
this.p_1=create p_1
this.dw_1=create dw_1
this.lb_1=create lb_1
this.mle_1=create mle_1
this.em_2=create em_2
this.sle_1=create sle_1
this.st_1=create st_1
this.cb_1=create cb_1
this.em_1=create em_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_exit
this.Control[iCurrent+3]=this.cbx_1
this.Control[iCurrent+4]=this.st_9
this.Control[iCurrent+5]=this.st_11
this.Control[iCurrent+6]=this.rb_2
this.Control[iCurrent+7]=this.rb_1
this.Control[iCurrent+8]=this.st_8
this.Control[iCurrent+9]=this.st_7
this.Control[iCurrent+10]=this.st_6
this.Control[iCurrent+11]=this.st_5
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.st_3
this.Control[iCurrent+14]=this.st_2
this.Control[iCurrent+15]=this.dw_freeform
this.Control[iCurrent+16]=this.vsb_1
this.Control[iCurrent+17]=this.hsb_1
this.Control[iCurrent+18]=this.gr_1
this.Control[iCurrent+19]=this.p_1
this.Control[iCurrent+20]=this.dw_1
this.Control[iCurrent+21]=this.lb_1
this.Control[iCurrent+22]=this.mle_1
this.Control[iCurrent+23]=this.em_2
this.Control[iCurrent+24]=this.sle_1
this.Control[iCurrent+25]=this.st_1
this.Control[iCurrent+26]=this.cb_1
this.Control[iCurrent+27]=this.em_1
this.Control[iCurrent+28]=this.gb_1
end on

on w_scale.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_exit)
destroy(this.cbx_1)
destroy(this.st_9)
destroy(this.st_11)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_freeform)
destroy(this.vsb_1)
destroy(this.hsb_1)
destroy(this.gr_1)
destroy(this.p_1)
destroy(this.dw_1)
destroy(this.lb_1)
destroy(this.mle_1)
destroy(this.em_2)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.em_1)
destroy(this.gb_1)
end on

type cb_2 from commandbutton within w_scale
integer x = 2568
integer y = 196
integer width = 248
integer height = 107
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ"
end type

on clicked;f_open_help(parent.classname())
end on

type cb_exit from commandbutton within w_scale
integer x = 2568
integer y = 57
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
boolean cancel = true
end type

on clicked;close(parent)
end on

type cbx_1 from checkbox within w_scale
integer x = 728
integer y = 348
integer width = 496
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long backcolor = 74481808
string text = "チェックボックス"
end type

type st_9 from statictext within w_scale
integer x = 2028
integer y = 1461
integer width = 820
integer height = 96
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long backcolor = 74481808
boolean enabled = false
string text = "ウィンドウのサイズを変更してください。"
alignment alignment = center!
boolean border = true
long bordercolor = 16711680
boolean focusrectangle = false
end type

type st_11 from statictext within w_scale
integer x = 24
integer y = 885
integer width = 788
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long backcolor = 74481808
boolean enabled = false
string text = "データウィンドウ (フリーフォーム)"
boolean focusrectangle = false
end type

type rb_2 from radiobutton within w_scale
integer x = 808
integer y = 220
integer width = 248
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long backcolor = 74481808
string text = "いいえ"
end type

type rb_1 from radiobutton within w_scale
integer x = 808
integer y = 156
integer width = 248
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long backcolor = 74481808
string text = "はい"
end type

type st_8 from statictext within w_scale
integer x = 1892
integer y = 740
integer width = 248
integer height = 57
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long backcolor = 74481808
boolean enabled = false
string text = "グラフ"
boolean focusrectangle = false
end type

type st_7 from statictext within w_scale
integer x = 152
integer y = 441
integer width = 512
integer height = 57
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long backcolor = 74481808
boolean enabled = false
string text = "マルチラインエディット"
boolean focusrectangle = false
end type

type st_6 from statictext within w_scale
integer x = 1168
integer y = 882
integer width = 632
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long backcolor = 74481808
boolean enabled = false
string text = "データウィンドウ (タブラ)"
boolean focusrectangle = false
end type

type st_5 from statictext within w_scale
integer x = 724
integer y = 437
integer width = 368
integer height = 57
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long backcolor = 74481808
boolean enabled = false
string text = "リストボックス"
boolean focusrectangle = false
end type

type st_4 from statictext within w_scale
integer x = 1304
integer y = 252
integer width = 372
integer height = 57
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long backcolor = 74481808
boolean enabled = false
string text = "エディットマスク"
boolean focusrectangle = false
end type

type st_3 from statictext within w_scale
integer x = 1304
integer y = 459
integer width = 456
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long backcolor = 74481808
boolean enabled = false
string text = "スピンコントロール"
boolean focusrectangle = false
end type

type st_2 from statictext within w_scale
integer x = 1304
integer y = 21
integer width = 248
integer height = 53
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long backcolor = 74481808
boolean enabled = false
string text = "ピクチャ"
boolean focusrectangle = false
end type

type dw_freeform from datawindow within w_scale
integer x = 32
integer y = 956
integer width = 1092
integer height = 498
integer taborder = 100
string dataobject = "d_empl_address_data"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

type vsb_1 from vscrollbar within w_scale
integer x = 36
integer y = 18
integer width = 56
integer height = 832
integer minposition = 1
integer maxposition = 100
integer position = 50
end type

type hsb_1 from hscrollbar within w_scale
integer x = 224
integer y = 18
integer width = 984
integer height = 53
integer minposition = 1
integer maxposition = 100
integer position = 50
end type

type gr_1 from graph within w_scale
integer x = 1892
integer y = 779
integer width = 960
integer height = 647
boolean enabled = false
grgraphtype graphtype = pie3d!
long backcolor = 74481808
long shadecolor = 6316128
integer spacing = 100
string title = "販売"
integer elevation = -60
integer rotation = -20
integer perspective = 1
integer depth = 50
grlegendtype legend = atleft!
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

on gr_1.create
TitleDispAttr = create grDispAttr
LegendDispAttr = create grDispAttr
PieDispAttr = create grDispAttr
Series = create grAxis
Series.DispAttr = create grDispAttr
Series.LabelDispAttr = create grDispAttr
Category = create grAxis
Category.DispAttr = create grDispAttr
Category.LabelDispAttr = create grDispAttr
Values = create grAxis
Values.DispAttr = create grDispAttr
Values.LabelDispAttr = create grDispAttr
TitleDispAttr.Weight=700
TitleDispAttr.FaceName="ＭＳ Ｐゴシック"
TitleDispAttr.FontCharSet=DefaultCharSet!
TitleDispAttr.FontFamily=Swiss!
TitleDispAttr.FontPitch=Variable!
TitleDispAttr.Alignment=Center!
TitleDispAttr.BackColor=553648127
TitleDispAttr.Format="[General]"
TitleDispAttr.DisplayExpression="title"
TitleDispAttr.AutoSize=true
Category.Label="(None)"
Category.AutoScale=true
Category.ShadeBackEdge=true
Category.SecondaryLine=transparent!
Category.MajorGridLine=transparent!
Category.MinorGridLine=transparent!
Category.DropLines=transparent!
Category.OriginLine=transparent!
Category.MajorTic=Outside!
Category.DataType=adtText!
Category.DispAttr.Weight=400
Category.DispAttr.FaceName="Arial"
Category.DispAttr.FontCharSet=DefaultCharSet!
Category.DispAttr.FontFamily=Swiss!
Category.DispAttr.FontPitch=Variable!
Category.DispAttr.Alignment=Center!
Category.DispAttr.BackColor=536870912
Category.DispAttr.Format="[General]"
Category.DispAttr.DisplayExpression="category"
Category.DispAttr.AutoSize=true
Category.LabelDispAttr.Weight=400
Category.LabelDispAttr.FaceName="Arial"
Category.LabelDispAttr.FontCharSet=DefaultCharSet!
Category.LabelDispAttr.FontFamily=Swiss!
Category.LabelDispAttr.FontPitch=Variable!
Category.LabelDispAttr.Alignment=Center!
Category.LabelDispAttr.BackColor=553648127
Category.LabelDispAttr.Format="[General]"
Category.LabelDispAttr.DisplayExpression="categoryaxislabel"
Category.LabelDispAttr.AutoSize=true
Values.Label="(None)"
Values.AutoScale=true
Values.SecondaryLine=transparent!
Values.MajorGridLine=transparent!
Values.MinorGridLine=transparent!
Values.DropLines=transparent!
Values.MajorTic=Outside!
Values.DataType=adtDouble!
Values.DispAttr.Weight=400
Values.DispAttr.FaceName="Arial"
Values.DispAttr.FontCharSet=DefaultCharSet!
Values.DispAttr.FontFamily=Swiss!
Values.DispAttr.FontPitch=Variable!
Values.DispAttr.Alignment=Right!
Values.DispAttr.BackColor=536870912
Values.DispAttr.Format="[General]"
Values.DispAttr.DisplayExpression="value"
Values.DispAttr.AutoSize=true
Values.LabelDispAttr.Weight=400
Values.LabelDispAttr.FaceName="Arial"
Values.LabelDispAttr.FontCharSet=DefaultCharSet!
Values.LabelDispAttr.FontFamily=Swiss!
Values.LabelDispAttr.FontPitch=Variable!
Values.LabelDispAttr.Alignment=Center!
Values.LabelDispAttr.BackColor=553648127
Values.LabelDispAttr.Format="[General]"
Values.LabelDispAttr.DisplayExpression="valuesaxislabel"
Values.LabelDispAttr.AutoSize=true
Values.LabelDispAttr.Escapement=900
Series.Label="(None)"
Series.AutoScale=true
Series.SecondaryLine=transparent!
Series.MajorGridLine=transparent!
Series.MinorGridLine=transparent!
Series.DropLines=transparent!
Series.OriginLine=transparent!
Series.MajorTic=Outside!
Series.DataType=adtText!
Series.DispAttr.Weight=400
Series.DispAttr.FaceName="Arial"
Series.DispAttr.FontCharSet=DefaultCharSet!
Series.DispAttr.FontFamily=Swiss!
Series.DispAttr.FontPitch=Variable!
Series.DispAttr.BackColor=536870912
Series.DispAttr.Format="[General]"
Series.DispAttr.DisplayExpression="series"
Series.DispAttr.AutoSize=true
Series.LabelDispAttr.Weight=400
Series.LabelDispAttr.FaceName="Arial"
Series.LabelDispAttr.FontCharSet=DefaultCharSet!
Series.LabelDispAttr.FontFamily=Swiss!
Series.LabelDispAttr.FontPitch=Variable!
Series.LabelDispAttr.Alignment=Center!
Series.LabelDispAttr.BackColor=549503168
Series.LabelDispAttr.Format="[General]"
Series.LabelDispAttr.DisplayExpression="seriesaxislabel"
Series.LabelDispAttr.AutoSize=true
LegendDispAttr.Weight=400
LegendDispAttr.FaceName="MS UI Gothic"
LegendDispAttr.FontCharSet=DefaultCharSet!
LegendDispAttr.FontFamily=Swiss!
LegendDispAttr.FontPitch=Variable!
LegendDispAttr.BackColor=553648127
LegendDispAttr.Format="[General]"
LegendDispAttr.DisplayExpression="category"
LegendDispAttr.AutoSize=true
PieDispAttr.Weight=400
PieDispAttr.FaceName="MS UI Gothic"
PieDispAttr.FontCharSet=DefaultCharSet!
PieDispAttr.FontFamily=Swiss!
PieDispAttr.FontPitch=Variable!
PieDispAttr.BackColor=553648127
PieDispAttr.Format="[General]"
PieDispAttr.DisplayExpression="if(seriescount > 1, series,string(percentofseries,~"0.00%~"))"
PieDispAttr.AutoSize=true
end on

on gr_1.destroy
destroy TitleDispAttr
destroy LegendDispAttr
destroy PieDispAttr
destroy Series.DispAttr
destroy Series.LabelDispAttr
destroy Series
destroy Category.DispAttr
destroy Category.LabelDispAttr
destroy Category
destroy Values.DispAttr
destroy Values.LabelDispAttr
destroy Values
end on

type p_1 from picture within w_scale
integer x = 1304
integer y = 75
integer width = 152
integer height = 132
string picturename = "beach.bmp"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_scale
integer x = 1168
integer y = 953
integer width = 488
integer height = 359
integer taborder = 70
string dataobject = "d_cust_id"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type lb_1 from listbox within w_scale
integer x = 724
integer y = 508
integer width = 504
integer height = 295
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
boolean vscrollbar = true
string item[] = {"項目 1","項目 2","項目 3","項目 4","項目 5"}
borderstyle borderstyle = stylelowered!
end type

type mle_1 from multilineedit within w_scale
integer x = 152
integer y = 508
integer width = 488
integer height = 295
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "あいうえおかきくけこさしすそたちつてと"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type em_2 from editmask within w_scale
integer x = 1304
integer y = 324
integer width = 248
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS UI Gothic"
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_scale
integer x = 152
integer y = 331
integer width = 436
integer height = 89
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "シングルラインエディット"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_scale
integer x = 152
integer y = 235
integer width = 480
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long backcolor = 74481808
boolean enabled = false
string text = "スタティックテキスト"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_scale
integer x = 148
integer y = 100
integer width = 472
integer height = 107
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "コマンドボタン"
end type

type em_1 from editmask within w_scale
integer x = 1304
integer y = 537
integer width = 232
integer height = 89
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "50"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
string minmax = "10~~100"
end type

type gb_1 from groupbox within w_scale
integer x = 724
integer y = 92
integer width = 436
integer height = 228
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long backcolor = 74481808
string text = "グループボックス"
end type

