$PBExportHeader$w_hyperlinks.srw
$PBExportComments$PB7 ハイパーリンク コントロール
forward
global type w_hyperlinks from w_center
end type
type shl_phl_linksybase from statichyperlink within w_hyperlinks
end type
type phl_linksybase from picturehyperlink within w_hyperlinks
end type
type st_instruct from statictext within w_hyperlinks
end type
type cb_close from commandbutton within w_hyperlinks
end type
end forward

global type w_hyperlinks from w_center
integer width = 2588
integer height = 1909
string title = "ハイパーリンクコントロール"
shl_phl_linksybase shl_phl_linksybase
phl_linksybase phl_linksybase
st_instruct st_instruct
cb_close cb_close
end type
global w_hyperlinks w_hyperlinks

on w_hyperlinks.create
int iCurrent
call super::create
this.shl_phl_linksybase=create shl_phl_linksybase
this.phl_linksybase=create phl_linksybase
this.st_instruct=create st_instruct
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.shl_phl_linksybase
this.Control[iCurrent+2]=this.phl_linksybase
this.Control[iCurrent+3]=this.st_instruct
this.Control[iCurrent+4]=this.cb_close
end on

on w_hyperlinks.destroy
call super::destroy
destroy(this.shl_phl_linksybase)
destroy(this.phl_linksybase)
destroy(this.st_instruct)
destroy(this.cb_close)
end on

event close;call super::close;Show ( w_main )
end event

type shl_phl_linksybase from statichyperlink within w_hyperlinks
integer x = 248
integer y = 284
integer width = 1480
integer height = 75
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS UI Gothic"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 67108864
string text = "https://www.appeon.com/products/appeon-powerbuilder.html"
boolean focusrectangle = false
string url = "https://www.appeon.com/products/appeon-powerbuilder.html"
end type

type phl_linksybase from picturehyperlink within w_hyperlinks
integer x = 208
integer y = 388
integer width = 2204
integer height = 1212
string pointer = "HyperLink!"
boolean originalsize = true
string picturename = "example.bmp"
boolean focusrectangle = false
string url = "https://www.appeon.com/products/appeon-powerbuilder.html"
end type

type st_instruct from statictext within w_hyperlinks
integer x = 128
integer y = 53
integer width = 1020
integer height = 85
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
string text = "リンク先を参照するにはテキストか画像をクリックしてください"
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_hyperlinks
integer x = 1044
integer y = 1660
integer width = 340
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる"
end type

event clicked;Close ( Parent )
end event

