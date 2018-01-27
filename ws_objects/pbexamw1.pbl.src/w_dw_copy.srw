$PBExportHeader$w_dw_copy.srw
$PBExportComments$構造体の配列を使用して、データウィンドウから別のデータウィンドウにデータをコピーします。
forward
global type w_dw_copy from w_center
end type
type cb_rowscopy from commandbutton within w_dw_copy
end type
type st_rowscopy from statictext within w_dw_copy
end type
type st_5 from statictext within w_dw_copy
end type
type cb_array from commandbutton within w_dw_copy
end type
type st_array from statictext within w_dw_copy
end type
type st_4 from statictext within w_dw_copy
end type
type st_7 from statictext within w_dw_copy
end type
type st_6 from statictext within w_dw_copy
end type
type st_2 from statictext within w_dw_copy
end type
type st_clipboard from statictext within w_dw_copy
end type
type st_getitem from statictext within w_dw_copy
end type
type st_1 from statictext within w_dw_copy
end type
type st_3 from statictext within w_dw_copy
end type
type st_direct from statictext within w_dw_copy
end type
type cb_clipboard from commandbutton within w_dw_copy
end type
type cb_getitem from commandbutton within w_dw_copy
end type
type cb_close from commandbutton within w_dw_copy
end type
type cb_help from commandbutton within w_dw_copy
end type
type cb_direct from commandbutton within w_dw_copy
end type
type dw_dest from datawindow within w_dw_copy
end type
type dw_source from datawindow within w_dw_copy
end type
type os_data from structure within w_dw_copy
end type
end forward

type os_data from structure
	integer		id
	integer		line_id
	integer		prod_id
	integer		quantity
	datetime		ship_date
end type

global type w_dw_copy from w_center
integer x = 5
integer y = 4
integer width = 2766
integer height = 1852
string title = "データウィンドウのコピー"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen ( )
cb_rowscopy cb_rowscopy
st_rowscopy st_rowscopy
st_5 st_5
cb_array cb_array
st_array st_array
st_4 st_4
st_7 st_7
st_6 st_6
st_2 st_2
st_clipboard st_clipboard
st_getitem st_getitem
st_1 st_1
st_3 st_3
st_direct st_direct
cb_clipboard cb_clipboard
cb_getitem cb_getitem
cb_close cb_close
cb_help cb_help
cb_direct cb_direct
dw_dest dw_dest
dw_source dw_source
end type
global w_dw_copy w_dw_copy

type variables
Long	il_Begin, il_Rows

end variables

forward prototypes
public function double of_calctime ()
end prototypes

event ue_postopen;SetPointer(HourGlass!)

dw_source.SetTransObject(sqlca)
il_Rows = dw_source.Retrieve()

end event

public function double of_calctime ();Long		ll_End
Double	ldb_Diff

ll_End = CPU()

ldb_Diff = (ll_End - il_Begin) / 1000

Return ldb_Diff

end function

event open;call super::open;Post Event ue_postopen()

end event

on w_dw_copy.create
this.cb_rowscopy=create cb_rowscopy
this.st_rowscopy=create st_rowscopy
this.st_5=create st_5
this.cb_array=create cb_array
this.st_array=create st_array
this.st_4=create st_4
this.st_7=create st_7
this.st_6=create st_6
this.st_2=create st_2
this.st_clipboard=create st_clipboard
this.st_getitem=create st_getitem
this.st_1=create st_1
this.st_3=create st_3
this.st_direct=create st_direct
this.cb_clipboard=create cb_clipboard
this.cb_getitem=create cb_getitem
this.cb_close=create cb_close
this.cb_help=create cb_help
this.cb_direct=create cb_direct
this.dw_dest=create dw_dest
this.dw_source=create dw_source
this.Control[]={ this.cb_rowscopy,&
this.st_rowscopy,&
this.st_5,&
this.cb_array,&
this.st_array,&
this.st_4,&
this.st_7,&
this.st_6,&
this.st_2,&
this.st_clipboard,&
this.st_getitem,&
this.st_1,&
this.st_3,&
this.st_direct,&
this.cb_clipboard,&
this.cb_getitem,&
this.cb_close,&
this.cb_help,&
this.cb_direct,&
this.dw_dest,&
this.dw_source}
end on

on w_dw_copy.destroy
destroy(this.cb_rowscopy)
destroy(this.st_rowscopy)
destroy(this.st_5)
destroy(this.cb_array)
destroy(this.st_array)
destroy(this.st_4)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_2)
destroy(this.st_clipboard)
destroy(this.st_getitem)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.st_direct)
destroy(this.cb_clipboard)
destroy(this.cb_getitem)
destroy(this.cb_close)
destroy(this.cb_help)
destroy(this.cb_direct)
destroy(this.dw_dest)
destroy(this.dw_source)
end on

event close;Show(w_main)

end event

type cb_rowscopy from commandbutton within w_dw_copy
event clicked pbm_bnclicked
integer x = 23
integer y = 448
integer width = 690
integer height = 88
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "RowsCopy 関数"
end type

event clicked;SetPointer(HourGlass!)

// First, reset the destination DataWindow
dw_dest.Reset()

// Start Timer
il_Begin = CPU()

// Copy the data to the destination DataWindow
dw_source.RowsCopy(1, il_Rows, Primary!, dw_dest, 1, Primary!)

// Display Time
st_rowscopy.Text = String(of_calctime())

end event

type st_rowscopy from statictext within w_dw_copy
integer x = 750
integer y = 448
integer width = 206
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_dw_copy
integer x = 974
integer y = 460
integer width = 219
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
string text = "秒"
boolean focusrectangle = false
end type

type cb_array from commandbutton within w_dw_copy
event clicked pbm_bnclicked
integer x = 23
integer y = 236
integer width = 690
integer height = 88
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "構造体の配列"
end type

event clicked;os_data	lstr_Data[]

SetPointer(HourGlass!)

// First, reset the destination DataWindow
dw_dest.Reset()

// Start Timer
il_Begin = CPU()

// Copy the data from the source DataWindow to the array of structures
lstr_Data = dw_source.Object.Data

// Copy the data from the array of structures to the destination DataWindow
dw_dest.Object.Data = lstr_Data

// Display Time
st_array.Text = String(of_calctime())

end event

type st_array from statictext within w_dw_copy
integer x = 750
integer y = 236
integer width = 206
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_dw_copy
integer x = 974
integer y = 248
integer width = 219
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
string text = "秒"
boolean focusrectangle = false
end type

type st_7 from statictext within w_dw_copy
integer x = 1367
integer y = 588
integer width = 361
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
boolean underline = true
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
string text = "コピー先"
boolean focusrectangle = false
end type

type st_6 from statictext within w_dw_copy
integer x = 14
integer y = 588
integer width = 311
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
boolean underline = true
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
string text = "コピー元"
boolean focusrectangle = false
end type

type st_2 from statictext within w_dw_copy
integer x = 974
integer y = 140
integer width = 219
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
string text = "秒"
boolean focusrectangle = false
end type

type st_clipboard from statictext within w_dw_copy
integer x = 750
integer y = 132
integer width = 206
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_getitem from statictext within w_dw_copy
integer x = 750
integer y = 28
integer width = 206
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_dw_copy
integer x = 974
integer y = 36
integer width = 219
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
string text = "秒"
boolean focusrectangle = false
end type

type st_3 from statictext within w_dw_copy
integer x = 974
integer y = 352
integer width = 219
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
string text = "秒"
boolean focusrectangle = false
end type

type st_direct from statictext within w_dw_copy
integer x = 750
integer y = 344
integer width = 206
integer height = 88
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_clipboard from commandbutton within w_dw_copy
event clicked pbm_bnclicked
integer x = 23
integer y = 132
integer width = 690
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "クリップボード"
end type

event clicked;SetPointer(HourGlass!)

// First, reset the destination DataWindow
dw_dest.Reset()

// Start Timer
il_Begin = CPU()

// Copy the data to the clipboard
dw_source.SaveAs("", Clipboard!, False)

// Copy the data from the clipboard to the destination DataWindow
dw_dest.ImportClipboard()

// Display Time
st_clipboard.Text = String(of_calctime())

end event

type cb_getitem from commandbutton within w_dw_copy
event clicked pbm_bnclicked
integer x = 23
integer y = 28
integer width = 690
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "GetItem/SetItem 関数"
end type

event clicked;Long			ll_Cnt
Integer		li_Data
DateTime	ldt_Data

SetPointer(HourGlass!)

// First, reset the destination DataWindow and turn redraw off
dw_dest.Reset()
dw_dest.SetRedraw(False)

// Start Timer
il_Begin = CPU()

For ll_Cnt = 1 To il_Rows
	
	// Insert a blank row
	dw_dest.InsertRow(0)
	
	// Copy data from the source DataWindow using GetItem...
	// And write it to the destination DataWindow using SetItem
	li_Data = dw_source.GetItemNumber(ll_Cnt, "id")
	dw_dest.SetItem(ll_Cnt, "id", li_Data)
	
	li_Data = dw_source.GetItemNumber(ll_Cnt, "line_id")
	dw_dest.SetItem(ll_Cnt, "line_id", li_Data)
	
	li_Data = dw_source.GetItemNumber(ll_Cnt, "prod_id")
	dw_dest.SetItem(ll_Cnt, "prod_id", li_Data)
	
	li_Data = dw_source.GetItemNumber(ll_Cnt, "quantity")
	dw_dest.SetItem(ll_Cnt, "quantity", li_Data)
	
	ldt_Data = dw_source.GetItemDateTime(ll_Cnt, "ship_date")
	dw_dest.SetItem(ll_Cnt, "ship_date", ldt_Data)
Next

// Display Time
st_getitem.Text = String(of_calctime())

dw_dest.SetRedraw(True)

end event

type cb_close from commandbutton within w_dw_copy
integer x = 2391
integer y = 128
integer width = 302
integer height = 88
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる"
end type

event clicked;Close(Parent)

end event

type cb_help from commandbutton within w_dw_copy
integer x = 2391
integer y = 28
integer width = 302
integer height = 88
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ"
end type

event clicked;f_open_help("w_dw_copy")

end event

type cb_direct from commandbutton within w_dw_copy
integer x = 23
integer y = 344
integer width = 690
integer height = 88
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ドット(.)表記による参照"
end type

event clicked;SetPointer(HourGlass!)

// First, reset the destination DataWindow
dw_dest.Reset()

// Start Timer
il_Begin = CPU()

// Copy the data to the destination DataWindow
dw_dest.Object.Data = dw_source.Object.Data

// Display Time
st_direct.Text = String(of_calctime())

end event

type dw_dest from datawindow within w_dw_copy
integer x = 1367
integer y = 656
integer width = 1321
integer height = 1084
string dataobject = "d_items"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_source from datawindow within w_dw_copy
integer x = 14
integer y = 656
integer width = 1321
integer height = 1084
string dataobject = "d_items"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

