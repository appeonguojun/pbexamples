$PBExportHeader$w_preview.srw
$PBExportComments$分散処理サンプル プログラムで使用する印刷プレビュー ウィンドウ
forward
global type w_preview from w_center
end type
type cb_close from commandbutton within w_preview
end type
type cb_print from commandbutton within w_preview
end type
type em_page from editmask within w_preview
end type
type cb_last from commandbutton within w_preview
end type
type cb_next from commandbutton within w_preview
end type
type cb_2 from commandbutton within w_preview
end type
type cb_1 from commandbutton within w_preview
end type
type em_1 from editmask within w_preview
end type
type dw_1 from datawindow within w_preview
end type
type gb_print from groupbox within w_preview
end type
type gb_2 from groupbox within w_preview
end type
type gb_rows from groupbox within w_preview
end type
type gb_1 from groupbox within w_preview
end type
end forward

global type w_preview from w_center
integer x = 457
integer y = 72
integer width = 2720
integer height = 2244
string title = "レポートのプレビュー"
long backcolor = 79416533
event ue_zoom ( integer ai_size )
event ue_set_page ( )
cb_close cb_close
cb_print cb_print
em_page em_page
cb_last cb_last
cb_next cb_next
cb_2 cb_2
cb_1 cb_1
em_1 em_1
dw_1 dw_1
gb_print gb_print
gb_2 gb_2
gb_rows gb_rows
gb_1 gb_1
end type
global w_preview w_preview

type variables
int ii_pagecount
end variables

event ue_zoom;dw_1.modify('datawindow.print.preview.zoom = ' + String(ai_size))

end event

event ue_set_page;em_page.text = string(1)

ii_pagecount = integer(dw_1.describe("evaluate('pagecount()',1)"))

em_page.minmax = "1-"+string(ii_pagecount)
end event

event open;call super::open;string ls_syntax, ls_rc
int    li_rc

ls_syntax =message.stringparm

li_rc = dw_1.create(ls_syntax)

if li_rc <> 1 then
	messagebox("エラー メッセージ", "データウィンドウ作成エラー: "+string(li_rc))
end if


ls_rc = dw_1.modify("DataWindow.Print.Preview = yes")

if ls_rc <> "" THEN
	
end if


end event

on w_preview.create
this.cb_close=create cb_close
this.cb_print=create cb_print
this.em_page=create em_page
this.cb_last=create cb_last
this.cb_next=create cb_next
this.cb_2=create cb_2
this.cb_1=create cb_1
this.em_1=create em_1
this.dw_1=create dw_1
this.gb_print=create gb_print
this.gb_2=create gb_2
this.gb_rows=create gb_rows
this.gb_1=create gb_1
this.Control[]={ this.cb_close,&
this.cb_print,&
this.em_page,&
this.cb_last,&
this.cb_next,&
this.cb_2,&
this.cb_1,&
this.em_1,&
this.dw_1,&
this.gb_print,&
this.gb_2,&
this.gb_rows,&
this.gb_1}
end on

on w_preview.destroy
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.em_page)
destroy(this.cb_last)
destroy(this.cb_next)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.em_1)
destroy(this.dw_1)
destroy(this.gb_print)
destroy(this.gb_2)
destroy(this.gb_rows)
destroy(this.gb_1)
end on

event resize;dw_1.width = this.width - 100
dw_1.height = this.height - 400
end event

type cb_close from commandbutton within w_preview
event clicked pbm_bnclicked
integer x = 2066
integer y = 64
integer width = 247
integer height = 88
integer taborder = 91
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる"
end type

event clicked;close(parent)
end event

type cb_print from commandbutton within w_preview
integer x = 1367
integer y = 68
integer width = 247
integer height = 88
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "印刷"
end type

event clicked;dw_1.print()
end event

type em_page from editmask within w_preview
event modified pbm_enmodified
integer x = 910
integer y = 68
integer width = 165
integer height = 88
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = styleraised!
string mask = "#####"
boolean autoskip = true
string displaydata = "ト"
end type

event modified;parent.event trigger ue_zoom(integer(this.text))
end event

type cb_last from commandbutton within w_preview
event clicked pbm_bnclicked
integer x = 818
integer y = 68
integer width = 91
integer height = 88
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "<<<"
end type

event clicked;if integer(em_page.text) >1 THEN
	em_page.text = string(integer(em_page.text) - 1)
	dw_1.scrollpriorpage()
end if

end event

type cb_next from commandbutton within w_preview
event clicked pbm_bnclicked
integer x = 1074
integer y = 68
integer width = 91
integer height = 88
integer taborder = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = ">>>"
end type

event clicked;if integer(em_page.text) < ii_pagecount THEN
	em_page.text = string(integer(em_page.text) + 1)
	dw_1.scrollnextpage()
end if

end event

type cb_2 from commandbutton within w_preview
integer x = 489
integer y = 68
integer width = 91
integer height = 88
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = ">>>"
end type

event clicked;int li_size

li_size = integer(em_1.text) +10

parent.event trigger ue_zoom(li_size)

em_1.text = string(li_size)
end event

type cb_1 from commandbutton within w_preview
integer x = 233
integer y = 68
integer width = 91
integer height = 88
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "<<<"
end type

event clicked;int li_size

if integer(em_1.text) > 10 THEN
	li_size = integer(em_1.text) -10

	parent.event trigger ue_zoom(li_size)

	em_1.text = string(li_size)
end if

end event

type em_1 from editmask within w_preview
integer x = 325
integer y = 68
integer width = 165
integer height = 88
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
string text = "100"
alignment alignment = center!
borderstyle borderstyle = styleraised!
string mask = "#####"
string displaydata = "l"
end type

event modified;parent.event trigger ue_zoom(integer(this.text))
end event

type dw_1 from datawindow within w_preview
integer x = 50
integer y = 244
integer width = 2592
integer height = 1840
integer taborder = 120
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_print from groupbox within w_preview
integer x = 1207
integer y = 12
integer width = 599
integer height = 172
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 79416533
end type

type gb_2 from groupbox within w_preview
integer x = 1216
integer y = 12
integer width = 1426
integer height = 172
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 79416533
end type

type gb_rows from groupbox within w_preview
integer x = 626
integer y = 12
integer width = 599
integer height = 172
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 79416533
string text = "ページ:"
end type

type gb_1 from groupbox within w_preview
integer x = 41
integer y = 12
integer width = 599
integer height = 172
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 79416533
string text = "縮小/拡大:"
end type

