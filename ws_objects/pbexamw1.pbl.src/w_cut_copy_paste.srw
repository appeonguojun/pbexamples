$PBExportHeader$w_cut_copy_paste.srw
$PBExportComments$メタクラス呼び出しを使用した切り取り、コピー、貼り付けの例
forward
global type w_cut_copy_paste from w_center
end type
type lv_1 from listview within w_cut_copy_paste
end type
type tv_1 from treeview within w_cut_copy_paste
end type
type st_5 from statictext within w_cut_copy_paste
end type
type st_4 from statictext within w_cut_copy_paste
end type
type st_3 from statictext within w_cut_copy_paste
end type
type ddlb_1 from dropdownlistbox within w_cut_copy_paste
end type
type mle_1 from multilineedit within w_cut_copy_paste
end type
type st_2 from statictext within w_cut_copy_paste
end type
type st_1 from statictext within w_cut_copy_paste
end type
type sle_1 from singlelineedit within w_cut_copy_paste
end type
type rb_2 from radiobutton within w_cut_copy_paste
end type
type rb_1 from radiobutton within w_cut_copy_paste
end type
type cbx_1 from checkbox within w_cut_copy_paste
end type
type gb_1 from groupbox within w_cut_copy_paste
end type
end forward

global type w_cut_copy_paste from w_center
integer x = 4
integer y = 4
integer width = 2164
integer height = 1692
string title = "切り取り/コピー/貼り付け"
string menuname = "m_cut_copy_paste"
long backcolor = 80242744
event ue_postopen ( )
lv_1 lv_1
tv_1 tv_1
st_5 st_5
st_4 st_4
st_3 st_3
ddlb_1 ddlb_1
mle_1 mle_1
st_2 st_2
st_1 st_1
sle_1 sle_1
rb_2 rb_2
rb_1 rb_1
cbx_1 cbx_1
gb_1 gb_1
end type
global w_cut_copy_paste w_cut_copy_paste

forward prototypes
public subroutine of_cut ()
public function boolean of_function_exists (string as_ControlName, string as_FunctionName)
public subroutine of_copy ()
public subroutine of_paste ()
end prototypes

event ue_postopen;TreeViewItem	ltvi_1
Long					ll_Folder[3]
Integer				li_Cnt

ltvi_1.PictureIndex = 1
ltvi_1.SelectedPictureIndex = 2
ltvi_1.Children = True
ltvi_1.Label = "フォルダ 1"
ll_Folder[1] = tv_1.InsertItemLast(0, ltvi_1)

ltvi_1.Label = "フォルダ 2"
ll_Folder[2] = tv_1.InsertItemLast(0, ltvi_1)

ltvi_1.Label = "フォルダ 3"
ll_Folder[3] = tv_1.InsertItemLast(0, ltvi_1)

ltvi_1.PictureIndex = 3
ltvi_1.SelectedPictureIndex = 3
ltvi_1.Children = False

For li_Cnt = 1 To 3
	ltvi_1.Label = "アイテム 1"
	tv_1.InsertItemlast(ll_Folder[li_Cnt], ltvi_1)
	ltvi_1.Label = "アイテム 2"
	tv_1.InsertItemlast(ll_Folder[li_Cnt], ltvi_1)
Next

end event

public subroutine of_cut ();GraphicObject	lgo_Current

lgo_Current = GetFocus()

// Find if the object has a 'cut' function
If of_function_exists(lgo_Current.ClassName(), "cut") Then
	lgo_Current.Dynamic Cut()
Else
	MessageBox("エラー", "対象のオブジェクトは切り取ることができません。", Exclamation!)
End If

end subroutine

public function boolean of_function_exists (string as_ControlName, string as_FunctionName);ClassDefinition	lcd_Object
String				ls_ArgTypes[]

// Find class definition
lcd_Object = FindClassDefinition("w_cut_copy_paste`" + as_ControlName)

Return IsValid(lcd_Object.FindMatchingFunction(as_FunctionName, ls_ArgTypes[]))

end function

public subroutine of_copy ();GraphicObject	lgo_Current

lgo_Current = GetFocus()

// Find if the object has a 'copy' function
If of_function_exists(lgo_Current.ClassName(), "copy") Then
	lgo_Current.Dynamic Copy()
Else
	MessageBox("エラー", "対象のオブジェクトはコピーすることができません。", Exclamation!)
End If

end subroutine

public subroutine of_paste ();GraphicObject	lgo_Current

lgo_Current = GetFocus()

// Find if the object has a 'paste' function
If of_function_exists(lgo_Current.ClassName(), "paste") Then
	lgo_Current.Dynamic Paste()
Else
	MessageBox("エラー", "対象のオブジェクトは貼り付けることができません。", Exclamation!)
End If

end subroutine

on w_cut_copy_paste.create
int iCurrent
call super::create
if this.MenuName = "m_cut_copy_paste" then this.MenuID = create m_cut_copy_paste
this.lv_1=create lv_1
this.tv_1=create tv_1
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.ddlb_1=create ddlb_1
this.mle_1=create mle_1
this.st_2=create st_2
this.st_1=create st_1
this.sle_1=create sle_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cbx_1=create cbx_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lv_1
this.Control[iCurrent+2]=this.tv_1
this.Control[iCurrent+3]=this.st_5
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.ddlb_1
this.Control[iCurrent+7]=this.mle_1
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.sle_1
this.Control[iCurrent+11]=this.rb_2
this.Control[iCurrent+12]=this.rb_1
this.Control[iCurrent+13]=this.cbx_1
this.Control[iCurrent+14]=this.gb_1
end on

on w_cut_copy_paste.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.lv_1)
destroy(this.tv_1)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.ddlb_1)
destroy(this.mle_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cbx_1)
destroy(this.gb_1)
end on

event open;call super::open;Post Event ue_postopen()

end event

event close;w_main.Show()

end event

type lv_1 from listview within w_cut_copy_paste
integer x = 1096
integer y = 875
integer width = 968
integer height = 594
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean autoarrange = true
string item[] = {"アイテム 1","アイテム 2","アイテム 3","アイテム 4","アイテム 5","アイテム 6","アイテム 7","アイテム 8"}
integer itempictureindex[] = {1,1,1,1,1,1,1,1}
string largepicturename[] = {"UserObject5!"}
integer largepicturewidth = 32
integer largepictureheight = 32
long largepicturemaskcolor = 12632256
string smallpicturename[] = {"UserObject5!"}
integer smallpicturewidth = 16
integer smallpictureheight = 16
long smallpicturemaskcolor = 12632256
long statepicturemaskcolor = 536870912
end type

type tv_1 from treeview within w_cut_copy_paste
integer x = 48
integer y = 875
integer width = 968
integer height = 594
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
string picturename[] = {"Custom039!","Custom050!","UserObject5!"}
long picturemaskcolor = 12632256
long statepicturemaskcolor = 536870912
end type

type st_5 from statictext within w_cut_copy_paste
integer x = 48
integer y = 804
integer width = 392
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
string text = "ツリービュー:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_cut_copy_paste
integer x = 1096
integer y = 804
integer width = 384
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
string text = "リストビュー:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_cut_copy_paste
integer x = 196
integer y = 580
integer width = 352
integer height = 107
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "ドロップダウンリストボックス:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_cut_copy_paste
integer x = 560
integer y = 594
integer width = 520
integer height = 384
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"アイテム １","アイテム ２","アイテム ３","アイテム ４","アイテム ５"}
borderstyle borderstyle = stylelowered!
end type

type mle_1 from multilineedit within w_cut_copy_paste
integer x = 560
integer y = 181
integer width = 984
integer height = 370
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
string text = "これはマルチラインエディット コントロールです。"
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_cut_copy_paste
integer x = 196
integer y = 192
integer width = 340
integer height = 103
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "マルチラインエディット:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_cut_copy_paste
integer x = 164
integer y = 39
integer width = 376
integer height = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "シングルラインエディット:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_cut_copy_paste
integer x = 560
integer y = 43
integer width = 996
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
string text = "これはシングルラインエディット コントロールです。"
borderstyle borderstyle = stylelowered!
end type

type rb_2 from radiobutton within w_cut_copy_paste
integer x = 1628
integer y = 352
integer width = 376
integer height = 75
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
string text = "ボタン ２"
end type

type rb_1 from radiobutton within w_cut_copy_paste
integer x = 1628
integer y = 267
integer width = 360
integer height = 75
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
string text = "ボタン １"
end type

type cbx_1 from checkbox within w_cut_copy_paste
integer x = 1592
integer y = 64
integer width = 516
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
string text = "チェックボックス"
end type

type gb_1 from groupbox within w_cut_copy_paste
integer x = 1592
integer y = 217
integer width = 456
integer height = 235
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
string text = "ラジオ ボタン:"
end type

