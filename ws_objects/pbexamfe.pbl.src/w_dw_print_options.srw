$PBExportHeader$w_dw_print_options.srw
$PBExportComments$印刷オプション ダイアログ
forward
global type w_dw_print_options from w_center
end type
type ddlb_range from dropdownlistbox within w_dw_print_options
end type
type st_4 from statictext within w_dw_print_options
end type
type cb_printer from commandbutton within w_dw_print_options
end type
type cb_cancel from commandbutton within w_dw_print_options
end type
type cbx_collate from checkbox within w_dw_print_options
end type
type cbx_print_to_file from checkbox within w_dw_print_options
end type
type st_3 from statictext within w_dw_print_options
end type
type sle_page_range from singlelineedit within w_dw_print_options
end type
type rb_pages from radiobutton within w_dw_print_options
end type
type rb_current_page from radiobutton within w_dw_print_options
end type
type rb_all from radiobutton within w_dw_print_options
end type
type em_copies from editmask within w_dw_print_options
end type
type st_2 from statictext within w_dw_print_options
end type
type sle_printer from singlelineedit within w_dw_print_options
end type
type st_1 from statictext within w_dw_print_options
end type
type cb_ok from commandbutton within w_dw_print_options
end type
type gb_1 from groupbox within w_dw_print_options
end type
end forward

global type w_dw_print_options from w_center
integer x = 672
integer y = 267
integer width = 1984
integer height = 1106
string title = "データウィンドウの印刷オプション"
windowtype windowtype = response!
long backcolor = 78748035
toolbaralignment toolbaralignment = alignatleft!
ddlb_range ddlb_range
st_4 st_4
cb_printer cb_printer
cb_cancel cb_cancel
cbx_collate cbx_collate
cbx_print_to_file cbx_print_to_file
st_3 st_3
sle_page_range sle_page_range
rb_pages rb_pages
rb_current_page rb_current_page
rb_all rb_all
em_copies em_copies
st_2 st_2
sle_printer sle_printer
st_1 st_1
cb_ok cb_ok
gb_1 gb_1
end type
global w_dw_print_options w_dw_print_options

type variables
string is_page_range
datawindow idw_dw
end variables

forward prototypes
private subroutine wf_page_range (radiobutton who)
end prototypes

private subroutine wf_page_range (radiobutton who);choose case who
	case rb_all
		sle_page_range.text = ''
		sle_page_range.enabled = false
		is_page_range = 'a'
	case rb_current_page
		sle_page_range.text = ''
		sle_page_range.enabled = false
		is_page_range = 'c'
	case rb_pages		
		sle_page_range.enabled = true
		is_page_range = 'p'
end choose
end subroutine

on open;call super::open;// we assume that this window will be opened using openwitparm and that
// a datawindow control will be passed to it

idw_dw = message.powerobjectparm
sle_printer.text = idw_dw.describe('datawindow.printer')
is_page_range = 'a'
end on

on w_dw_print_options.create
int iCurrent
call super::create
this.ddlb_range=create ddlb_range
this.st_4=create st_4
this.cb_printer=create cb_printer
this.cb_cancel=create cb_cancel
this.cbx_collate=create cbx_collate
this.cbx_print_to_file=create cbx_print_to_file
this.st_3=create st_3
this.sle_page_range=create sle_page_range
this.rb_pages=create rb_pages
this.rb_current_page=create rb_current_page
this.rb_all=create rb_all
this.em_copies=create em_copies
this.st_2=create st_2
this.sle_printer=create sle_printer
this.st_1=create st_1
this.cb_ok=create cb_ok
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_range
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.cb_printer
this.Control[iCurrent+4]=this.cb_cancel
this.Control[iCurrent+5]=this.cbx_collate
this.Control[iCurrent+6]=this.cbx_print_to_file
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.sle_page_range
this.Control[iCurrent+9]=this.rb_pages
this.Control[iCurrent+10]=this.rb_current_page
this.Control[iCurrent+11]=this.rb_all
this.Control[iCurrent+12]=this.em_copies
this.Control[iCurrent+13]=this.st_2
this.Control[iCurrent+14]=this.sle_printer
this.Control[iCurrent+15]=this.st_1
this.Control[iCurrent+16]=this.cb_ok
this.Control[iCurrent+17]=this.gb_1
end on

on w_dw_print_options.destroy
call super::destroy
destroy(this.ddlb_range)
destroy(this.st_4)
destroy(this.cb_printer)
destroy(this.cb_cancel)
destroy(this.cbx_collate)
destroy(this.cbx_print_to_file)
destroy(this.st_3)
destroy(this.sle_page_range)
destroy(this.rb_pages)
destroy(this.rb_current_page)
destroy(this.rb_all)
destroy(this.em_copies)
destroy(this.st_2)
destroy(this.sle_printer)
destroy(this.st_1)
destroy(this.cb_ok)
destroy(this.gb_1)
end on

type ddlb_range from dropdownlistbox within w_dw_print_options
integer x = 400
integer y = 697
integer width = 1064
integer height = 288
integer taborder = 120
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 78748035
string text = "すべてのページ"
boolean sorted = false
string item[] = {"すべてのページ","偶数ページ","奇数ページ"}
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_dw_print_options
integer x = 16
integer y = 708
integer width = 368
integer height = 96
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "印刷指定(&R):"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_printer from commandbutton within w_dw_print_options
integer x = 1408
integer y = 306
integer width = 340
integer height = 89
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "プリンタ(&T)..."
end type

on clicked;printsetup()
sle_printer.text = idw_dw.describe('datawindow.printer')
end on

type cb_cancel from commandbutton within w_dw_print_options
integer x = 1408
integer y = 196
integer width = 340
integer height = 89
integer taborder = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "キャンセル"
boolean cancel = true
end type

on clicked;closewithreturn(parent,-1)
end on

type cbx_collate from checkbox within w_dw_print_options
integer x = 1392
integer y = 576
integer width = 516
integer height = 68
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 78748035
string text = "部単位で出力(&I)"
boolean checked = true
end type

type cbx_print_to_file from checkbox within w_dw_print_options
integer x = 1392
integer y = 484
integer width = 536
integer height = 68
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 78748035
string text = "ファイルへ出力(&L)"
end type

type st_3 from statictext within w_dw_print_options
integer x = 104
integer y = 548
integer width = 1184
integer height = 114
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "2,5 のようにページ番号をカンマで区切って指定するか、8-10 のようにページ範囲を指定してください。"
boolean focusrectangle = false
end type

type sle_page_range from singlelineedit within w_dw_print_options
integer x = 628
integer y = 448
integer width = 672
integer height = 85
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 78748035
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type rb_pages from radiobutton within w_dw_print_options
integer x = 148
integer y = 459
integer width = 456
integer height = 68
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 78748035
string text = "ページ指定(&G):"
end type

on clicked;wf_page_range(this)
end on

type rb_current_page from radiobutton within w_dw_print_options
integer x = 148
integer y = 391
integer width = 488
integer height = 68
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 78748035
string text = "現在のページ(&E)"
end type

on clicked;wf_page_range(this)
end on

type rb_all from radiobutton within w_dw_print_options
integer x = 148
integer y = 324
integer width = 420
integer height = 68
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 78748035
string text = "全ページ(&A)"
boolean checked = true
end type

on clicked;wf_page_range(this)
end on

type em_copies from editmask within w_dw_print_options
integer x = 356
integer y = 149
integer width = 244
integer height = 89
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
string text = "1"
borderstyle borderstyle = stylelowered!
string mask = "#####"
end type

type st_2 from statictext within w_dw_print_options
integer x = 64
integer y = 164
integer width = 264
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "印刷部数:"
boolean focusrectangle = false
end type

type sle_printer from singlelineedit within w_dw_print_options
integer x = 308
integer y = 53
integer width = 864
integer height = 85
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ　ゴシック"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
boolean border = false
boolean autohscroll = false
end type

type st_1 from statictext within w_dw_print_options
integer x = 64
integer y = 53
integer width = 212
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "プリンタ:"
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_dw_print_options
integer x = 1408
integer y = 85
integer width = 340
integer height = 89
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "OK"
boolean default = true
end type

event clicked;string tmp, command
long row 
string	docname, named
int	value

choose case left(ddlb_range.text,1) // determine rangeinclude (all,even,odd)
	case 'す' // all
		tmp = '0'
	case '偶' // even
		tmp = '1'
	case '奇' //odd
		tmp = '2'
end choose
command = 'datawindow.print.page.rangeinclude = '+tmp
if cbx_collate.checked then // collate output ?
	command = command +  " datawindow.print.collate = 'yes'"
else
	command = command +  " datawindow.print.collate = 'no'"
end if
choose case is_page_range // did they pick a page range?
	case 'a'  // all
		tmp = ''
	case 'c' // current page?
		row = idw_dw.getrow()
		tmp = idw_dw.describe("evaluate('page()',"+string(row)+")")
	case 'p' // a range?
		tmp = sle_page_range.text
end choose		
if len(tmp) > 0 then command = command +  " datawindow.print.page.range = '"+tmp+"'"

// number of copies ?
if len(em_copies.text) > 0 then command = command +  " datawindow.print.copies = "+em_copies.text

if cbx_print_to_file.checked then // print to file ?
	value = GetFileSaveName("ファイルに出力", docname, named, "PRN", "印刷 (*.PRN),*.PRN")
	if value = 1 then 
		command = command + " datawindow.print.filename = '"+docname+"'"
	else // they canceled out of the dialog so quit completely
		return
	end if
end if

// now alter the datawindow
tmp = idw_dw.modify(command)
if len(tmp) > 0 then // if error the display the 
	messagebox('プリンタ オプション設定エラー','エラー メッセージ = ' + tmp + '~r~nCommand = ' + command)
	return
end if
closewithreturn(parent,1)
end event

type gb_1 from groupbox within w_dw_print_options
integer x = 68
integer y = 263
integer width = 1300
integer height = 409
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 78748035
string text = "印刷範囲の選択"
end type

