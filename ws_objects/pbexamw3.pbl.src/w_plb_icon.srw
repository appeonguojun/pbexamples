$PBExportHeader$w_plb_icon.srw
$PBExportComments$アイコンを表示するウィンドウ
forward
global type w_plb_icon from w_center
end type
type lv_1 from listview within w_plb_icon
end type
type rb_small from radiobutton within w_plb_icon
end type
type rb_large from radiobutton within w_plb_icon
end type
type cb_close from commandbutton within w_plb_icon
end type
type gb_1 from groupbox within w_plb_icon
end type
end forward

global type w_plb_icon from w_center
integer x = 4
integer y = 4
integer width = 1172
integer height = 587
string title = "アイコンの表示"
long backcolor = 74481808
lv_1 lv_1
rb_small rb_small
rb_large rb_large
cb_close cb_close
gb_1 gb_1
end type
global w_plb_icon w_plb_icon

type variables

end variables

event open;call super::open;Integer			li_Pict
String			ls_PictName
ListViewItem	llvi_1

ls_PictName = Message.StringParm

li_Pict = lv_1.AddLargePicture(ls_PictName)
li_Pict = lv_1.AddSmallPicture(ls_PictName)

llvi_1.PictureIndex = li_Pict
lv_1.AddItem(llvi_1)
llvi_1.ItemX = -60
lv_1.SetItem(1, llvi_1)
lv_1.View = ListViewLargeIcon!
end event

on w_plb_icon.create
int iCurrent
call super::create
this.lv_1=create lv_1
this.rb_small=create rb_small
this.rb_large=create rb_large
this.cb_close=create cb_close
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lv_1
this.Control[iCurrent+2]=this.rb_small
this.Control[iCurrent+3]=this.rb_large
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.gb_1
end on

on w_plb_icon.destroy
call super::destroy
destroy(this.lv_1)
destroy(this.rb_small)
destroy(this.rb_large)
destroy(this.cb_close)
destroy(this.gb_1)
end on

type lv_1 from listview within w_plb_icon
integer x = 56
integer y = 256
integer width = 280
integer height = 203
integer taborder = 11
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
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
boolean hideselection = false
integer largepicturewidth = 32
integer largepictureheight = 32
long largepicturemaskcolor = 553648127
integer smallpicturewidth = 16
integer smallpictureheight = 16
long smallpicturemaskcolor = 553648127
long statepicturemaskcolor = 553648127
end type

type rb_small from radiobutton within w_plb_icon
integer x = 40
integer y = 128
integer width = 660
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 74481808
string text = "小 (16 x 16)"
end type

event clicked;ListViewItem	llvi_1

lv_1.View = ListViewSmallIcon!

lv_1.GetItem(1, llvi_1)
llvi_1.ItemX = 1
lv_1.SetItem(1, llvi_1)

end event

type rb_large from radiobutton within w_plb_icon
integer x = 40
integer y = 60
integer width = 660
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 74481808
string text = "大 (32 x 32)"
boolean checked = true
end type

event clicked;ListViewItem	llvi_1

lv_1.View = ListViewLargeIcon!

lv_1.GetItem(1, llvi_1)
llvi_1.ItemX = 0
lv_1.SetItem(1, llvi_1)

end event

type cb_close from commandbutton within w_plb_icon
integer x = 756
integer y = 21
integer width = 340
integer height = 89
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる"
boolean default = true
end type

event clicked;Close(Parent)

end event

type gb_1 from groupbox within w_plb_icon
integer x = 16
integer width = 716
integer height = 220
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 74481808
string text = "アイコンサイズ"
end type

