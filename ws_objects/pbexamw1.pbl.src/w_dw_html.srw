$PBExportHeader$w_dw_html.srw
$PBExportComments$データウィンドウからHTMLテーブル/フォームを作成します。
forward
global type w_dw_html from w_center
end type
type tab_1 from tab within w_dw_html
end type
type tabpage_dw from userobject within tab_1
end type
type dw_1 from datawindow within tabpage_dw
end type
type tabpage_dw from userobject within tab_1
dw_1 dw_1
end type
type tabpage_html from userobject within tab_1
end type
type mle_1 from multilineedit within tabpage_html
end type
type tabpage_html from userobject within tab_1
mle_1 mle_1
end type
type tab_1 from tab within w_dw_html
tabpage_dw tabpage_dw
tabpage_html tabpage_html
end type
type st_buffer from statictext within w_dw_html
end type
type rb_filter from radiobutton within w_dw_html
end type
type rb_delete from radiobutton within w_dw_html
end type
type rb_primary from radiobutton within w_dw_html
end type
type ddlb_endcol from dropdownlistbox within w_dw_html
end type
type st_endcol from statictext within w_dw_html
end type
type st_startcol from statictext within w_dw_html
end type
type st_endrow from statictext within w_dw_html
end type
type sle_endrow from singlelineedit within w_dw_html
end type
type sle_startrow from singlelineedit within w_dw_html
end type
type st_startrow from statictext within w_dw_html
end type
type st_border from statictext within w_dw_html
end type
type sle_border from singlelineedit within w_dw_html
end type
type st_spacing from statictext within w_dw_html
end type
type sle_spacing from singlelineedit within w_dw_html
end type
type sle_padding from singlelineedit within w_dw_html
end type
type st_padding from statictext within w_dw_html
end type
type cbx_wrap from checkbox within w_dw_html
end type
type cbx_css from checkbox within w_dw_html
end type
type cb_html from commandbutton within w_dw_html
end type
type rb_form from radiobutton within w_dw_html
end type
type rb_table from radiobutton within w_dw_html
end type
type st_1 from statictext within w_dw_html
end type
type ddlb_1 from dropdownlistbox within w_dw_html
end type
type cb_browse from commandbutton within w_dw_html
end type
type cb_help from commandbutton within w_dw_html
end type
type cb_close from commandbutton within w_dw_html
end type
type gb_1 from groupbox within w_dw_html
end type
type st_bufferb from statictext within w_dw_html
end type
type ddlb_startcol from dropdownlistbox within w_dw_html
end type
type st_width from statictext within w_dw_html
end type
type sle_width from singlelineedit within w_dw_html
end type
type gb_table from groupbox within w_dw_html
end type
type gb_form from groupbox within w_dw_html
end type
end forward

global type w_dw_html from w_center
integer y = 4
integer width = 2884
integer height = 1799
string title = "データウィンドウからの HTML 構文の作成"
long backcolor = 75530304
toolbaralignment toolbaralignment = alignatleft!
tab_1 tab_1
st_buffer st_buffer
rb_filter rb_filter
rb_delete rb_delete
rb_primary rb_primary
ddlb_endcol ddlb_endcol
st_endcol st_endcol
st_startcol st_startcol
st_endrow st_endrow
sle_endrow sle_endrow
sle_startrow sle_startrow
st_startrow st_startrow
st_border st_border
sle_border sle_border
st_spacing st_spacing
sle_spacing sle_spacing
sle_padding sle_padding
st_padding st_padding
cbx_wrap cbx_wrap
cbx_css cbx_css
cb_html cb_html
rb_form rb_form
rb_table rb_table
st_1 st_1
ddlb_1 ddlb_1
cb_browse cb_browse
cb_help cb_help
cb_close cb_close
gb_1 gb_1
st_bufferb st_bufferb
ddlb_startcol ddlb_startcol
st_width st_width
sle_width sle_width
gb_table gb_table
gb_form gb_form
end type
global w_dw_html w_dw_html

type prototypes

end prototypes

type variables
String	is_Browser, is_Files[]
Boolean	ib_LongFileNames
Inet	iin_Context
end variables

forward prototypes
public subroutine of_add_columns ()
public function string of_write_file (string as_html)
public subroutine of_generate_html ()
end prototypes

public subroutine of_add_columns ();String	ls_Column
Integer	li_Columns, li_Cnt

ddlb_startcol.Reset()
ddlb_endcol.Reset()
ddlb_startcol.AddItem("")
ddlb_endcol.AddItem("")

li_Columns = Integer(tab_1.tabpage_dw.dw_1.Describe("Datawindow.column.count"))
For li_Cnt = 1 To li_Columns
	ls_Column = tab_1.tabpage_dw.dw_1.Describe("#" + String(li_Cnt) + ".name")
	ddlb_startcol.AddItem(ls_Column)
	ddlb_endcol.AddItem(ls_Column)
Next

end subroutine

public function string of_write_file (string as_html);String	ls_FileName, ls_buf
Integer	li_FileNumber, li_Files
Long		ll_BytesWritten, ll_max, ll_len, ll_buf

If ib_LongFileNames Then
	ls_FileName = tab_1.tabpage_dw.dw_1.DataObject + ".htm"
Else
	ls_FileName = Left(tab_1.tabpage_dw.dw_1.DataObject, 8) + ".htm"
End If

li_FileNumber = FileOpen(ls_FileName, StreamMode!, Write!, LockReadWrite!, Replace! )
If (li_FileNumber >= 0) Then
	ll_max = 32000
	ll_len = lenA(as_HTML)
	ll_BytesWritten = 0
	// 32000バイトづつファイルに出力
	do while (ll_BytesWritten + ll_max) <= ll_len
		ls_buf = mid(as_HTML, ll_BytesWritten, ll_max)
		ll_buf = FileWrite(li_FileNumber, ls_buf)
		ll_BytesWritten = ll_BytesWritten + ll_buf
	loop
	// 32000でのあまりの部分を出力
	ls_buf = mid(as_HTML, ll_BytesWritten, ll_len - ll_BytesWritten)
	ll_buf = FileWrite(li_FileNumber, ls_buf)
	ll_BytesWritten = ll_BytesWritten + ll_buf
	FileClose(li_FileNumber)

	If ll_BytesWritten = LenA(as_HTML) Then
		//  Add file to list to be deleted
		li_Files = UpperBound(is_Files)
		is_Files[li_Files + 1] = gs_ExampleDir + "\" + ls_FileName
	Else
		MessageBox ("書き込みエラー", String(LenA(as_HTML)) + " バイトのうち " + String(ll_BytesWritten) + &
							" バイトを書き込みました。" , Exclamation!)
		Return ""
	End If


Else // File open error
	MessageBox ("FileOpen Error", "Could not open file: " + ls_FileName + &
						" (" + String( li_FileNumber ) + ")")
	Return ""
End If

Return ls_FileName

end function

public subroutine of_generate_html ();String	ls_HTML, ls_FileName, ls_Style, ls_Action, ls_Modify
Integer	li_StartCol, li_EndCol, li_startrow, li_endrow

// Don't proceed if there is no data object loaded in the DW
If (tab_1.tabpage_dw.dw_1.dataobject = "") Then Return

// Generate the HTML
If rb_table.Checked Then
	
	// HTML Table
	If cbx_css.Checked Then
		ls_Modify = "DataWindow.HTMLTable.GenerateCSS=~'yes~' "
		ls_Style = tab_1.tabpage_dw.dw_1.Object.DataWindow.HTMLTable.StyleSheet
	else
		ls_Modify = "DataWindow.HTMLTable.GenerateCSS=~'no~' "
		ls_Style = tab_1.tabpage_dw.dw_1.Object.DataWindow.HTMLTable.StyleSheet
	End If
	
	If cbx_wrap.Checked Then
		ls_Modify += "DataWindow.HTMLTable.NoWrap=~'no~' "
	else
		ls_Modify += "DataWindow.HTMLTable.NoWrap=~'yes~' "
	End If
	
	If Integer(sle_border.Text) >= 0 Then
		ls_Modify += "DataWindow.HTMLTable.Border=" + sle_border.Text + "  "
	End If
	
	If Integer(sle_width.Text) >= 0 Then
		ls_Modify += "DataWindow.HTMLTable.Width=" + sle_width.Text + " "
	End If
	
	If Integer(sle_padding.Text) >= 0 Then
		ls_Modify += "DataWindow.HTMLTable.CellPadding=" + sle_padding.Text + " "
	End If

	If Integer(sle_spacing.Text) >= 0 Then
		ls_Modify += "DataWindow.HTMLTable.CellSpacing=" + sle_spacing.Text
	End If
	
	If Trim(ls_Modify) <> "" Then
		tab_1.tabpage_dw.dw_1.Modify(ls_Modify)
	End If
	
	ls_HTML = ls_Style + "~r~n" + tab_1.tabpage_dw.dw_1.Object.DataWindow.Data.HTMLTable
Else
	
	// HTML Form
	li_StartCol = ddlb_startcol.FindItem(ddlb_startcol.Text, 0) - 1
	li_EndCol = ddlb_endcol.FindItem(ddlb_endcol.Text, 0) - 1

	li_startrow = Integer(sle_startrow.Text)
	li_endrow = Integer(sle_endrow.Text)

	if li_endrow > tab_1.tabpage_dw.dw_1.rowCount() then li_endrow = tab_1.tabpage_dw.dw_1.rowCount()

	If (li_startrow > 0) And (li_endrow > 0) And &
		(li_StartCol > 0) And (li_EndCol > 0) Then
		
		If rb_primary.Checked Then
			tab_1.tabpage_dw.dw_1.GenerateHTMLForm(ls_HTML, ls_Style, ls_Action, li_startrow, li_endrow, &
													li_StartCol, li_EndCol)
		ElseIf rb_delete.Checked Then
			tab_1.tabpage_dw.dw_1.GenerateHTMLForm(ls_HTML, ls_Style, ls_Action, li_startrow, li_endrow, &
													li_StartCol, li_EndCol, Delete!)
		Else
			tab_1.tabpage_dw.dw_1.GenerateHTMLForm(ls_HTML, ls_Style, ls_Action, li_startrow, li_endrow, &
													li_StartCol, li_EndCol, Filter!)
		End If
	Else
		tab_1.tabpage_dw.dw_1.GenerateHTMLForm(ls_HTML, ls_Style, ls_Action)
	End If

	ls_HTML = ls_Style + "~r~n" + ls_HTML
End If

If IsNull(ls_HTML) Or LenA(ls_HTML) <= 1 Then
	MessageBox ("エラー", "HTMLテーブルを作成しようとしてエラーが発生しました。", Exclamation!)
	Return
Else
	ls_HTML = "<H1>PowerBuilder のデータウィンドウから作成したHTMLテーブル:  "  + &
					tab_1.tabpage_dw.dw_1.DataObject + "</H1><P>" + ls_HTML
End If

// Display the HTML source
tab_1.tabpage_html.mle_1.Text = ls_HTML

end subroutine

event close;Integer	li_Cnt, li_Files

// Delete all file created
li_Files = UpperBound(is_Files)
For li_Cnt = 1 To li_Files
	FileDelete(is_Files[li_Cnt])
Next

w_main.show()
end event

on w_dw_html.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.st_buffer=create st_buffer
this.rb_filter=create rb_filter
this.rb_delete=create rb_delete
this.rb_primary=create rb_primary
this.ddlb_endcol=create ddlb_endcol
this.st_endcol=create st_endcol
this.st_startcol=create st_startcol
this.st_endrow=create st_endrow
this.sle_endrow=create sle_endrow
this.sle_startrow=create sle_startrow
this.st_startrow=create st_startrow
this.st_border=create st_border
this.sle_border=create sle_border
this.st_spacing=create st_spacing
this.sle_spacing=create sle_spacing
this.sle_padding=create sle_padding
this.st_padding=create st_padding
this.cbx_wrap=create cbx_wrap
this.cbx_css=create cbx_css
this.cb_html=create cb_html
this.rb_form=create rb_form
this.rb_table=create rb_table
this.st_1=create st_1
this.ddlb_1=create ddlb_1
this.cb_browse=create cb_browse
this.cb_help=create cb_help
this.cb_close=create cb_close
this.gb_1=create gb_1
this.st_bufferb=create st_bufferb
this.ddlb_startcol=create ddlb_startcol
this.st_width=create st_width
this.sle_width=create sle_width
this.gb_table=create gb_table
this.gb_form=create gb_form
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.st_buffer
this.Control[iCurrent+3]=this.rb_filter
this.Control[iCurrent+4]=this.rb_delete
this.Control[iCurrent+5]=this.rb_primary
this.Control[iCurrent+6]=this.ddlb_endcol
this.Control[iCurrent+7]=this.st_endcol
this.Control[iCurrent+8]=this.st_startcol
this.Control[iCurrent+9]=this.st_endrow
this.Control[iCurrent+10]=this.sle_endrow
this.Control[iCurrent+11]=this.sle_startrow
this.Control[iCurrent+12]=this.st_startrow
this.Control[iCurrent+13]=this.st_border
this.Control[iCurrent+14]=this.sle_border
this.Control[iCurrent+15]=this.st_spacing
this.Control[iCurrent+16]=this.sle_spacing
this.Control[iCurrent+17]=this.sle_padding
this.Control[iCurrent+18]=this.st_padding
this.Control[iCurrent+19]=this.cbx_wrap
this.Control[iCurrent+20]=this.cbx_css
this.Control[iCurrent+21]=this.cb_html
this.Control[iCurrent+22]=this.rb_form
this.Control[iCurrent+23]=this.rb_table
this.Control[iCurrent+24]=this.st_1
this.Control[iCurrent+25]=this.ddlb_1
this.Control[iCurrent+26]=this.cb_browse
this.Control[iCurrent+27]=this.cb_help
this.Control[iCurrent+28]=this.cb_close
this.Control[iCurrent+29]=this.gb_1
this.Control[iCurrent+30]=this.st_bufferb
this.Control[iCurrent+31]=this.ddlb_startcol
this.Control[iCurrent+32]=this.st_width
this.Control[iCurrent+33]=this.sle_width
this.Control[iCurrent+34]=this.gb_table
this.Control[iCurrent+35]=this.gb_form
end on

on w_dw_html.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.st_buffer)
destroy(this.rb_filter)
destroy(this.rb_delete)
destroy(this.rb_primary)
destroy(this.ddlb_endcol)
destroy(this.st_endcol)
destroy(this.st_startcol)
destroy(this.st_endrow)
destroy(this.sle_endrow)
destroy(this.sle_startrow)
destroy(this.st_startrow)
destroy(this.st_border)
destroy(this.sle_border)
destroy(this.st_spacing)
destroy(this.sle_spacing)
destroy(this.sle_padding)
destroy(this.st_padding)
destroy(this.cbx_wrap)
destroy(this.cbx_css)
destroy(this.cb_html)
destroy(this.rb_form)
destroy(this.rb_table)
destroy(this.st_1)
destroy(this.ddlb_1)
destroy(this.cb_browse)
destroy(this.cb_help)
destroy(this.cb_close)
destroy(this.gb_1)
destroy(this.st_bufferb)
destroy(this.ddlb_startcol)
destroy(this.st_width)
destroy(this.sle_width)
destroy(this.gb_table)
destroy(this.gb_form)
end on

event open;call super::open;// Determine if long file names are in use
If ge_Environment.OSType = Sol2! Then
	ib_LongFileNames = True
Elseif (ge_Environment.OSType = WindowsNT!) Or &
	(ge_Environment.OSType = Windows! And &
	(ge_Environment.OSMajorRevision = 4 Or ge_Environment.OSMinorRevision = 95)) Then
	ib_LongFileNames = True
Else
	ib_LongFileNames = False
End If

// Create Internet Context Service - this is used to open the default browser
If (ge_Environment.OSType = windows!) Or (ge_Environment.OSType = windowsNT!) Then
	// This service is only available on Win32
	This.GetContextService("Internet", iin_Context)
End If

end event

type tab_1 from tab within w_dw_html
event create ( )
event destroy ( )
integer x = 4
integer y = 466
integer width = 2868
integer height = 1092
integer taborder = 130
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long backcolor = 80242744
boolean raggedright = true
tabposition tabposition = tabsonbottom!
integer selectedtab = 1
tabpage_dw tabpage_dw
tabpage_html tabpage_html
end type

on tab_1.create
this.tabpage_dw=create tabpage_dw
this.tabpage_html=create tabpage_html
this.Control[]={this.tabpage_dw,&
this.tabpage_html}
end on

on tab_1.destroy
destroy(this.tabpage_dw)
destroy(this.tabpage_html)
end on

type tabpage_dw from userobject within tab_1
event create ( )
event destroy ( )
integer x = 16
integer y = 14
integer width = 2836
integer height = 992
long backcolor = 80242744
string text = "データウィンドウ表示"
long tabtextcolor = 33554432
long tabbackcolor = 80242744
long picturemaskcolor = 536870912
dw_1 dw_1
end type

on tabpage_dw.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tabpage_dw.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within tabpage_dw
integer width = 2820
integer height = 971
integer taborder = 21
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_html from userobject within tab_1
event create ( )
event destroy ( )
integer x = 16
integer y = 14
integer width = 2836
integer height = 992
long backcolor = 80242744
string text = "HTMLソース"
long tabtextcolor = 33554432
long tabbackcolor = 80242744
long picturemaskcolor = 536870912
mle_1 mle_1
end type

on tabpage_html.create
this.mle_1=create mle_1
this.Control[]={this.mle_1}
end on

on tabpage_html.destroy
destroy(this.mle_1)
end on

type mle_1 from multilineedit within tabpage_html
integer width = 2820
integer height = 971
integer taborder = 22
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_buffer from statictext within w_dw_html
boolean visible = false
integer x = 2104
integer y = 171
integer width = 260
integer height = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "バッファ:"
boolean focusrectangle = false
end type

type rb_filter from radiobutton within w_dw_html
boolean visible = false
integer x = 2116
integer y = 352
integer width = 284
integer height = 75
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
string text = "フィルタ"
end type

type rb_delete from radiobutton within w_dw_html
boolean visible = false
integer x = 2116
integer y = 288
integer width = 284
integer height = 75
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
string text = "削除"
end type

type rb_primary from radiobutton within w_dw_html
boolean visible = false
integer x = 2116
integer y = 228
integer width = 284
integer height = 75
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
string text = "プライマリ"
boolean checked = true
end type

type ddlb_endcol from dropdownlistbox within w_dw_html
boolean visible = false
integer x = 1188
integer y = 331
integer width = 852
integer height = 309
integer taborder = 120
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_endcol from statictext within w_dw_html
boolean visible = false
integer x = 848
integer y = 341
integer width = 336
integer height = 75
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "終了カラム:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_startcol from statictext within w_dw_html
boolean visible = false
integer x = 848
integer y = 235
integer width = 336
integer height = 75
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "開始カラム:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_endrow from statictext within w_dw_html
boolean visible = false
integer x = 372
integer y = 341
integer width = 264
integer height = 75
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "終了行:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_endrow from singlelineedit within w_dw_html
boolean visible = false
integer x = 636
integer y = 331
integer width = 188
integer height = 92
integer taborder = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
string text = "0"
boolean autohscroll = false
integer limit = 4
borderstyle borderstyle = stylelowered!
end type

type sle_startrow from singlelineedit within w_dw_html
boolean visible = false
integer x = 636
integer y = 224
integer width = 188
integer height = 92
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
string text = "0"
boolean autohscroll = false
integer limit = 4
borderstyle borderstyle = stylelowered!
end type

type st_startrow from statictext within w_dw_html
boolean visible = false
integer x = 372
integer y = 235
integer width = 264
integer height = 75
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "開始行:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_border from statictext within w_dw_html
integer x = 1192
integer y = 331
integer width = 340
integer height = 75
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "枠線の幅:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_border from singlelineedit within w_dw_html
integer x = 1544
integer y = 324
integer width = 188
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
string text = "0"
boolean autohscroll = false
integer limit = 4
borderstyle borderstyle = stylelowered!
end type

type st_spacing from statictext within w_dw_html
integer x = 1848
integer y = 331
integer width = 324
integer height = 75
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "間隔の調節:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_spacing from singlelineedit within w_dw_html
integer x = 2176
integer y = 324
integer width = 188
integer height = 92
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
string text = "0"
boolean autohscroll = false
integer limit = 4
borderstyle borderstyle = stylelowered!
end type

type sle_padding from singlelineedit within w_dw_html
integer x = 2176
integer y = 220
integer width = 188
integer height = 92
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
string text = "0"
boolean autohscroll = false
integer limit = 4
borderstyle borderstyle = stylelowered!
end type

type st_padding from statictext within w_dw_html
integer x = 1848
integer y = 224
integer width = 324
integer height = 75
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "すきまの調節:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_wrap from checkbox within w_dw_html
integer x = 436
integer y = 331
integer width = 728
integer height = 75
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
string text = "セル内にテキストを含める"
end type

type cbx_css from checkbox within w_dw_html
integer x = 436
integer y = 224
integer width = 648
integer height = 75
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
string text = "スタイルシートの作成"
end type

type cb_html from commandbutton within w_dw_html
integer x = 896
integer y = 1596
integer width = 540
integer height = 85
integer taborder = 150
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "HTMLソースの更新"
end type

event clicked;of_generate_html()

end event

type rb_form from radiobutton within w_dw_html
integer x = 2392
integer y = 53
integer width = 356
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 75530304
string text = "フォーム"
end type

event clicked;Parent.SetRedraw(False)

gb_table.Hide()
cbx_css.Hide()
cbx_wrap.Hide()
st_width.Hide()
sle_width.Hide()
st_border.Hide()
sle_border.Hide()
st_spacing.Hide()
sle_spacing.Hide()
st_padding.Hide()
sle_padding.Hide()

gb_form.Show()
st_startrow.Show()
sle_startrow.Show()
st_endrow.Show()
sle_endrow.Show()
st_startcol.Show()
ddlb_startcol.Show()
st_endcol.Show()
ddlb_endcol.Show()
st_buffer.Show()
st_bufferb.Show()
rb_primary.Show()
rb_delete.Show()
rb_filter.Show()

Parent.SetRedraw(True)

end event

type rb_table from radiobutton within w_dw_html
integer x = 2032
integer y = 53
integer width = 316
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 75530304
string text = "テーブル"
boolean checked = true
end type

event clicked;Parent.SetRedraw(False)

gb_form.Hide()
st_startrow.Hide()
sle_startrow.Hide()
st_endrow.Hide()
sle_endrow.Hide()
st_startcol.Hide()
ddlb_startcol.Hide()
st_endcol.Hide()
ddlb_endcol.Hide()
st_buffer.Hide()
st_bufferb.Hide()
rb_primary.Hide()
rb_delete.Hide()
rb_filter.Hide()

gb_table.Show()
cbx_css.Show()
cbx_wrap.Show()
st_width.Show()
sle_width.Show()
st_border.Show()
sle_border.Show()
st_spacing.Show()
sle_spacing.Show()
st_padding.Show()
sle_padding.Show()

Parent.SetRedraw(True)

end event

type st_1 from statictext within w_dw_html
integer x = 40
integer y = 28
integer width = 472
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 75530304
boolean enabled = false
string text = "データウィンドウ"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_dw_html
integer x = 552
integer y = 28
integer width = 1116
integer height = 576
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"d_dwexample_crosstab  (クロスタブ)","d_dwexample_grid  (グリッド)","d_dwexample_tabular  (タブラ)","d_dwexample_group  (タブラとグループ)","d_button_report  (タブラとボタン)","d_sales_reps  (フリーフォーム)","d_contact_maintenance  (フリ-フォームとボタン)"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;Integer	li_Pos
String	ls_DW

li_Pos = Pos(This.Text, "(")
ls_DW = Left(This.Text, (li_Pos - 3))

// Change the DataWindow to the selected one.
tab_1.tabpage_dw.dw_1.DataObject = ls_DW
tab_1.tabpage_dw.dw_1.SetTransObject(sqlca)
tab_1.tabpage_dw.dw_1.Retrieve()

of_add_columns()

end event

type cb_browse from commandbutton within w_dw_html
integer x = 296
integer y = 1596
integer width = 540
integer height = 85
integer taborder = 140
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ブラウズ"
boolean default = true
end type

event clicked;String	ls_FileName, ls_Browser, ls_BrowserName
Integer	li_Result


SetPointer(HourGlass!)

// Update the HTML source
cb_html.Trigger Event Clicked()

// Write the HTML to a file
ls_FileName = of_write_file(tab_1.tabpage_html.mle_1.Text)
If ls_FileName <> "" Then

	// Run browser with the HTML file
	// First, determine the browser to use
	If (ge_Environment.OSType = windows!) Or (ge_Environment.OSType = windowsNT!) Then

		// Use Context Object function to display the file in the default browser.
		If iin_Context.HyperlinkToURL("~"file://" + gs_ExampleDir + "\" +  ls_FileName + "~"") <> 1 Then
			MessageBox("エラー", "デフォルトのブラウザで起動できません。", StopSign!)
		End If	
	Else
		// The Context Object Internet service is only available on Win32, so have the user find the browser.
		If is_Browser = "" Then

			// Open dialog to select a browser.
			li_Result = GetFileOpenName("ブラウザの選択", ls_Browser,  ls_BrowserName, &
														"exe", "Executable Files (*.exe),*.exe")
			If li_Result <> -1 Then
				is_Browser = ls_Browser
			Else
				MessageBox("データウィンドウからHTML", "使用するブラウザを、実行可能ファイルから選択して下さい。", Information!)
				Return
			End If
		End If
		
		// Run browser with the HTML file
		li_Result = Run(is_Browser + " ~"file:\\" + gs_ExampleDir + "\" + ls_FileName + "~"")
		If li_Result = -1 Then
			MessageBox("エラー", "ブラウザを起動しようとしてエラーが発生しました。" + is_Browser + " " + ls_FileName, Exclamation!)
		End If	

		// Executing this dialog resets the current working directory, set it back.
		w_main.of_set_cwd(gs_ExampleDir)
	End If
End If

end event

type cb_help from commandbutton within w_dw_html
integer x = 2100
integer y = 1596
integer width = 540
integer height = 85
integer taborder = 170
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ(&H)"
end type

event clicked;f_open_help ("w_dw_html")

end event

type cb_close from commandbutton within w_dw_html
integer x = 1496
integer y = 1596
integer width = 540
integer height = 85
integer taborder = 160
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

type gb_1 from groupbox within w_dw_html
integer x = 1988
integer width = 832
integer height = 132
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 75530304
string text = "HTML オプション"
end type

type st_bufferb from statictext within w_dw_html
boolean visible = false
integer x = 2100
integer y = 220
integer width = 312
integer height = 213
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type ddlb_startcol from dropdownlistbox within w_dw_html
boolean visible = false
integer x = 1188
integer y = 224
integer width = 852
integer height = 309
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_width from statictext within w_dw_html
integer x = 1168
integer y = 224
integer width = 368
integer height = 75
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "テーブルの幅:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_width from singlelineedit within w_dw_html
integer x = 1544
integer y = 220
integer width = 188
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
string text = "0"
boolean autohscroll = false
integer limit = 4
borderstyle borderstyle = stylelowered!
end type

type gb_table from groupbox within w_dw_html
integer x = 368
integer y = 156
integer width = 2088
integer height = 288
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
string text = "テーブル オプション:"
end type

type gb_form from groupbox within w_dw_html
boolean visible = false
integer x = 360
integer y = 139
integer width = 2088
integer height = 309
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
string text = "フォーム オプション:"
end type

