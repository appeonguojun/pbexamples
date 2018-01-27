$PBExportHeader$w_set_toolbars.srw
$PBExportComments$ツールバーを設定します。
forward
global type w_set_toolbars from w_center
end type
type cb_help from commandbutton within w_set_toolbars
end type
type st_1 from statictext within w_set_toolbars
end type
type lb_toolbar from listbox within w_set_toolbars
end type
type cbx_user_control from checkbox within w_set_toolbars
end type
type cbx_powertips from checkbox within w_set_toolbars
end type
type cb_visible from commandbutton within w_set_toolbars
end type
type cb_1 from commandbutton within w_set_toolbars
end type
type cbx_showtext from checkbox within w_set_toolbars
end type
type rb_floating from radiobutton within w_set_toolbars
end type
type rb_left from radiobutton within w_set_toolbars
end type
type rb_right from radiobutton within w_set_toolbars
end type
type rb_bottom from radiobutton within w_set_toolbars
end type
type rb_top from radiobutton within w_set_toolbars
end type
type gb_1 from groupbox within w_set_toolbars
end type
type os_toolbarattributes from structure within w_set_toolbars
end type
end forward

type os_toolbarattributes from structure
	integer		i_index
	window		w_window
	boolean		b_visible
	toolbaralignment		ta_alignment
	string		s_name
end type

global type w_set_toolbars from w_center
integer x = 888
integer y = 487
integer width = 1528
integer height = 871
string title = "ツールバーの設定"
windowtype windowtype = response!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_help cb_help
st_1 st_1
lb_toolbar lb_toolbar
cbx_user_control cbx_user_control
cbx_powertips cbx_powertips
cb_visible cb_visible
cb_1 cb_1
cbx_showtext cbx_showtext
rb_floating rb_floating
rb_left rb_left
rb_right rb_right
rb_bottom rb_bottom
rb_top rb_top
gb_1 gb_1
end type
global w_set_toolbars w_set_toolbars

type variables
Public:
Window		iw_Frame, iw_Sheet
Application	ia_App
Integer		ii_CurrentToolbar

Private:
/*  Object Structure references must be
     declared as private  */
os_ToolbarAttributes	istr_Attrib[]
end variables

event open;call super::open;Integer		li_Index[], li_Indexes, li_Cnt, li_Attrib, li_Empty[]

iw_Frame = Message.PowerObjectParm
iw_Sheet = iw_Frame.GetActiveSheet()
ia_App = GetApplication()

// Get the toolbar information for the frame and sheet (If any).
li_Indexes = f_get_toolbar_indexes(iw_Frame.Menuid, li_Index)
For li_Cnt = 1 To li_Indexes
	li_Attrib ++
	istr_Attrib[li_Attrib].i_Index = li_Index[li_Cnt]
	istr_Attrib[li_Attrib].w_Window = iw_Frame
	iw_Frame.GetToolbar(li_Index[li_Cnt], istr_Attrib[li_Attrib].b_Visible, &
														istr_Attrib[li_Attrib].ta_Alignment, &
														istr_Attrib[li_Attrib].s_Name)
Next

li_Index = li_Empty
If IsValid(iw_Sheet) Then
	If IsValid(iw_Sheet.Menuid) Then
		li_Indexes = f_get_toolbar_indexes(iw_Sheet.Menuid, li_Index)
		For li_Cnt = 1 To li_Indexes
			li_Attrib ++
			istr_Attrib[li_Attrib].i_Index = li_Index[li_Cnt]
			istr_Attrib[li_Attrib].w_Window = iw_Sheet
			iw_Sheet.GetToolbar(li_Index[li_Cnt], istr_Attrib[li_Attrib].b_Visible, &
																istr_Attrib[li_Attrib].ta_Alignment, &
																istr_Attrib[li_Attrib].s_Name)
		Next
	End If
End If

// Fill the ListBox
For li_Cnt = 1 To li_Attrib
	lb_toolbar.AddItem(istr_Attrib[li_Cnt].s_Name)
Next

// Check the Show Text checkbox If the toolbar is currently showing text.
If ia_App.ToolbarText Then
	cbx_showtext.Checked = True
Else
	cbx_showtext.Checked = False
End If

// Check the Show PowerTips checkbox If the toolbar is currently showing PowerTips.
If ia_App.ToolBarTips Then
	cbx_powertips.Checked = True
Else
	cbx_powertips.Checked = False
End If

// Check the 'Movable' checkbox If the application allows the toolbars to be moved.
If ia_app.ToolBarUserControl Then
	cbx_user_control.Checked = True
Else
	cbx_user_control.Checked = False
End If

// Select the first toolbar
If UpperBound ( istr_Attrib ) > 0 Then
	lb_toolbar.SelectItem(1)
	lb_toolbar.Post Event SelectionChanged(1)
End If

end event

on w_set_toolbars.create
int iCurrent
call super::create
this.cb_help=create cb_help
this.st_1=create st_1
this.lb_toolbar=create lb_toolbar
this.cbx_user_control=create cbx_user_control
this.cbx_powertips=create cbx_powertips
this.cb_visible=create cb_visible
this.cb_1=create cb_1
this.cbx_showtext=create cbx_showtext
this.rb_floating=create rb_floating
this.rb_left=create rb_left
this.rb_right=create rb_right
this.rb_bottom=create rb_bottom
this.rb_top=create rb_top
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_help
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.lb_toolbar
this.Control[iCurrent+4]=this.cbx_user_control
this.Control[iCurrent+5]=this.cbx_powertips
this.Control[iCurrent+6]=this.cb_visible
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.cbx_showtext
this.Control[iCurrent+9]=this.rb_floating
this.Control[iCurrent+10]=this.rb_left
this.Control[iCurrent+11]=this.rb_right
this.Control[iCurrent+12]=this.rb_bottom
this.Control[iCurrent+13]=this.rb_top
this.Control[iCurrent+14]=this.gb_1
end on

on w_set_toolbars.destroy
call super::destroy
destroy(this.cb_help)
destroy(this.st_1)
destroy(this.lb_toolbar)
destroy(this.cbx_user_control)
destroy(this.cbx_powertips)
destroy(this.cb_visible)
destroy(this.cb_1)
destroy(this.cbx_showtext)
destroy(this.rb_floating)
destroy(this.rb_left)
destroy(this.rb_right)
destroy(this.rb_bottom)
destroy(this.rb_top)
destroy(this.gb_1)
end on

type cb_help from commandbutton within w_set_toolbars
integer x = 1164
integer y = 142
integer width = 316
integer height = 89
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ(&H)"
end type

event clicked;OpenWithParm(w_about_with_parm, "ツールバーの設定@")
end event

type st_1 from statictext within w_set_toolbars
integer x = 40
integer y = 25
integer width = 476
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "ツールバーの選択:"
boolean focusrectangle = false
end type

type lb_toolbar from listbox within w_set_toolbars
integer x = 40
integer y = 92
integer width = 544
integer height = 498
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;If index = 0 Then Return

// Set alignment radio button
Choose Case istr_Attrib[index].ta_Alignment
	Case alignatleft!
		rb_left.Checked = True
	Case alignatright!
		rb_right.Checked = True
	Case alignattop!
		rb_top.Checked = True
	Case alignatbottom!
		rb_bottom.Checked = True
	Case floating!
		rb_floating.Checked = True
End Choose

// Set text of button appropriately
If istr_Attrib[index].b_Visible Then
	cb_visible.Text = "非表示(&I)"
Else
	cb_visible.Text = "表示(&S)"
End If

ii_CurrentToolbar = index

end event

type cbx_user_control from checkbox within w_set_toolbars
integer x = 52
integer y = 661
integer width = 340
integer height = 71
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "移動可能(&M)"
end type

event clicked;// Allow/Disallow changes to application toolbars

If This.Checked Then
	ia_App.ToolBarUserControl = True
Else
	ia_App.ToolBarUserControl = False
End If
end event

type cbx_powertips from checkbox within w_set_toolbars
integer x = 912
integer y = 661
integer width = 572
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "PowerTips を表示する(&P)"
end type

event clicked;// Show/Hide PowerTips on application toolbars

If This.Checked then
	ia_App.ToolBarTips = True
Else
	ia_App.ToolBarTips = False
End If
end event

type cb_visible from commandbutton within w_set_toolbars
integer x = 1160
integer y = 309
integer width = 316
integer height = 89
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "非表示（&I）"
end type

event clicked;// Hide/Show toolbar

If This.text = "非表示(&I)" then
	istr_Attrib[ii_CurrentToolbar].b_Visible = False
	This.Text = "表示(&S)"
Else
	istr_Attrib[ii_CurrentToolbar].b_Visible = True
	This.Text = "非表示(&I)"
End If

istr_Attrib[ii_CurrentToolbar].w_Window.SetToolbar(istr_Attrib[ii_CurrentToolbar].i_Index, &
																		istr_Attrib[ii_CurrentToolbar].b_Visible, &
																		istr_Attrib[ii_CurrentToolbar].ta_Alignment, &
																		lb_toolbar.Text(ii_CurrentToolbar))

end event

type cb_1 from commandbutton within w_set_toolbars
integer x = 1160
integer y = 28
integer width = 316
integer height = 89
integer taborder = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
boolean default = true
end type

event clicked;Close(Parent)

end event

type cbx_showtext from checkbox within w_set_toolbars
integer x = 404
integer y = 661
integer width = 496
integer height = 71
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "テキストを表示(&X)"
end type

event clicked;// Show/Hide text on application toolbars

If This.Checked Then
	ia_App.ToolbarText = True
Else
	ia_App.ToolbarText = False
End If

end event

type rb_floating from radiobutton within w_set_toolbars
integer x = 676
integer y = 484
integer width = 344
integer height = 71
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "浮動(&F)"
end type

event clicked;// Make toolbar a floating toolbar.

Integer	li_X, li_Y

istr_Attrib[ii_CurrentToolbar].ta_Alignment = floating!
istr_Attrib[ii_CurrentToolbar].w_Window.SetToolbar(istr_Attrib[ii_CurrentToolbar].i_Index, &
																		istr_Attrib[ii_CurrentToolbar].b_Visible, &
																		istr_Attrib[ii_CurrentToolbar].ta_Alignment, &
																		lb_toolbar.Text(ii_CurrentToolbar))

li_X = istr_Attrib[ii_CurrentToolbar].w_Window.X + &
			(istr_Attrib[ii_CurrentToolbar].w_Window.Width / 3)
li_Y = istr_Attrib[ii_CurrentToolbar].w_Window.Y + &
			(istr_Attrib[ii_CurrentToolbar].w_Window.Height / 3)

istr_Attrib[ii_CurrentToolbar].w_Window.SetToolbarPos(istr_Attrib[ii_CurrentToolbar].i_Index, &
																				100, 100, 100, 100)

end event

type rb_left from radiobutton within w_set_toolbars
integer x = 676
integer y = 132
integer width = 344
integer height = 71
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "左端(&L)"
end type

event clicked;// Move toolbar to the left-side of the screen

istr_Attrib[ii_CurrentToolbar].ta_Alignment = alignatleft!
istr_Attrib[ii_CurrentToolbar].w_Window.SetToolbar(istr_Attrib[ii_CurrentToolbar].i_Index, &
																		istr_Attrib[ii_CurrentToolbar].b_Visible, &
																		istr_Attrib[ii_CurrentToolbar].ta_Alignment, &
																		lb_toolbar.Text(ii_CurrentToolbar))


end event

type rb_right from radiobutton within w_set_toolbars
integer x = 676
integer y = 220
integer width = 344
integer height = 71
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "右端(&R)"
end type

event clicked;// Move toolbar to the right side of the screen

istr_Attrib[ii_CurrentToolbar].ta_Alignment = alignatright!
istr_Attrib[ii_CurrentToolbar].w_Window.SetToolbar(istr_Attrib[ii_CurrentToolbar].i_Index, &
																		istr_Attrib[ii_CurrentToolbar].b_Visible, &
																		istr_Attrib[ii_CurrentToolbar].ta_Alignment, &
																		lb_toolbar.Text(ii_CurrentToolbar))

end event

type rb_bottom from radiobutton within w_set_toolbars
integer x = 676
integer y = 395
integer width = 344
integer height = 71
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "下端(&B)"
end type

event clicked;// Move toolbar to the bottom of the screen

istr_Attrib[ii_CurrentToolbar].ta_Alignment = alignatbottom!
istr_Attrib[ii_CurrentToolbar].w_Window.SetToolbar(istr_Attrib[ii_CurrentToolbar].i_Index, &
																		istr_Attrib[ii_CurrentToolbar].b_Visible, &
																		istr_Attrib[ii_CurrentToolbar].ta_Alignment, &
																		lb_toolbar.Text(ii_CurrentToolbar))

end event

type rb_top from radiobutton within w_set_toolbars
integer x = 676
integer y = 309
integer width = 344
integer height = 71
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "上端(&T)"
end type

event clicked;// Move toolbar to the top of the screen

istr_Attrib[ii_CurrentToolbar].ta_Alignment = alignattop!
istr_Attrib[ii_CurrentToolbar].w_Window.SetToolbar(istr_Attrib[ii_CurrentToolbar].i_Index, &
																		istr_Attrib[ii_CurrentToolbar].b_Visible, &
																		istr_Attrib[ii_CurrentToolbar].ta_Alignment, &
																		lb_toolbar.Text(ii_CurrentToolbar))

end event

type gb_1 from groupbox within w_set_toolbars
integer x = 612
integer y = 60
integer width = 456
integer height = 523
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "移動"
end type

