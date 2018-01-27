$PBExportHeader$w_fish_config.srw
$PBExportComments$水槽の環境設定をするためのウィンドウ
forward
global type w_fish_config from w_center
end type
type st_speed from statictext within w_fish_config
end type
type lv_1 from listview within w_fish_config
end type
type st_2 from statictext within w_fish_config
end type
type cb_close from commandbutton within w_fish_config
end type
type hsb_speed from hscrollbar within w_fish_config
end type
type st_4 from statictext within w_fish_config
end type
type st_1 from statictext within w_fish_config
end type
type s_fish from structure within w_fish_config
end type
end forward

type s_fish from structure
	picture		p_pict
	integer		i_pos
	integer		i_dist
	boolean		b_right
	boolean		b_visible
end type

global type w_fish_config from w_center
integer x = 2100
integer y = 21
integer width = 932
integer height = 1404
string title = "水槽の設定"
long backcolor = 81838264
toolbaralignment toolbaralignment = alignatleft!
st_speed st_speed
lv_1 lv_1
st_2 st_2
cb_close cb_close
hsb_speed hsb_speed
st_4 st_4
st_1 st_1
end type
global w_fish_config w_fish_config

type variables
w_fish w_aquarium
end variables

forward prototypes
public subroutine of_change_speed (integer ai_position)
end prototypes

public subroutine of_change_speed (integer ai_position);// Function to change the speed of the fish.

ai_Position = ai_Position - 4

Choose Case ai_Position
	Case -4, -3
		st_speed.Text = "遅い"
	Case -2 To -1
		st_speed.Text = "やや遅い"
	Case 0
		st_speed.Text = "普通"
	Case 1, 2
		st_speed.Text = "やや速い"
	Case 3, 4
		st_speed.Text = "速い"
End Choose

w_aquarium.ii_Delta = ai_Position * 2

end subroutine

on w_fish_config.create
int iCurrent
call super::create
this.st_speed=create st_speed
this.lv_1=create lv_1
this.st_2=create st_2
this.cb_close=create cb_close
this.hsb_speed=create hsb_speed
this.st_4=create st_4
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_speed
this.Control[iCurrent+2]=this.lv_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.hsb_speed
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.st_1
end on

on w_fish_config.destroy
call super::destroy
destroy(this.st_speed)
destroy(this.lv_1)
destroy(this.st_2)
destroy(this.cb_close)
destroy(this.hsb_speed)
destroy(this.st_4)
destroy(this.st_1)
end on

event open;call super::open;Integer	li_1, li_2, li_3, li_4, li_5, li_Overlay, li_Position
ListViewItem	llvi_Item

w_aquarium = Message.PowerObjectParm 

// Add the fish pictures to the ListView
lv_1.SmallPictureWidth = 57
lv_1.SmallPictureHeight = 39

li_1 = lv_1.AddSmallPicture("fish1r.bmp")
li_2 = lv_1.AddSmallPicture("fish2r.bmp")
li_3 = lv_1.AddSmallPicture("fish3r.bmp")
li_4 = lv_1.AddSmallPicture("fish4r.bmp")
li_5 = lv_1.AddSmallPicture("fish5r.bmp")
li_Overlay = lv_1.AddSmallPicture("NotFound!")

lv_1.SetOverlayPicture(1, li_Overlay)

lv_1.AddColumn("fish", Left!, 780)

llvi_item.Label = "カクレクマノミ"
llvi_item.PictureIndex = li_1
llvi_Item.OverlayPictureIndex = w_aquarium.of_GetFishVisible ( li_1 ) 
lv_1.AddItem ( llvi_item ) 

llvi_item.Label = "モンガラカワハギ"
llvi_item.PictureIndex = li_2
llvi_Item.OverlayPictureIndex = w_aquarium.of_GetFishVisible ( li_2 ) 
lv_1.AddItem ( llvi_item ) 

llvi_item.Label = "タテジマキンチャクダイ"
llvi_item.PictureIndex = li_3
llvi_Item.OverlayPictureIndex = w_aquarium.of_GetFishVisible ( li_3 ) 
lv_1.AddItem ( llvi_item ) 

llvi_item.Label = "ツノダシ"
llvi_item.PictureIndex = li_4
llvi_Item.OverlayPictureIndex = w_aquarium.of_GetFishVisible ( li_4 ) 
lv_1.AddItem ( llvi_item ) 

llvi_item.Label = "ナンヨウハギ"
llvi_item.PictureIndex = li_5
llvi_Item.OverlayPictureIndex = w_aquarium.of_GetFishVisible ( li_5 ) 
lv_1.AddItem ( llvi_item ) 

li_Position = ( w_aquarium.ii_Delta / 2 ) 

Choose Case li_Position
	Case -4, -3
		st_speed.Text = "遅い"
	Case -2 To -1
		st_speed.Text = "やや遅い"
	Case 0
		st_speed.Text = "普通"
	Case 1, 2
		st_speed.Text = "やや速い"
	Case 3, 4
		st_speed.Text = "速い"
End Choose

hsb_speed.Position = li_Position + 4


end event

type st_speed from statictext within w_fish_config
integer x = 408
integer y = 999
integer width = 264
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
string text = "標準"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type lv_1 from listview within w_fish_config
integer x = 36
integer y = 149
integer width = 816
integer height = 828
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 16777215
long backcolor = 8388608
borderstyle borderstyle = stylelowered!
boolean buttonheader = false
boolean showheader = false
boolean scrolling = false
listviewview view = listviewreport!
integer largepicturewidth = 32
integer largepictureheight = 32
long largepicturemaskcolor = 553648127
integer smallpicturewidth = 16
integer smallpictureheight = 16
long smallpicturemaskcolor = 12632256
long statepicturemaskcolor = 536870912
end type

event doubleclicked;// Remove or add a fish to/from the aquarium

ListViewItem	llvi_Item

If index <=0 Then Return
If GetItem(index, llvi_Item) = -1 Then Return

If llvi_Item.OverlayPictureIndex = 0 Then
	llvi_Item.OverlayPictureIndex = 1
	
	// Remove the fish from the aquarium
	w_aquarium.of_AddRemoveFish ( index, False ) 
	
Else
	llvi_Item.OverlayPictureIndex = 0
	
	// Add the fish back to the aquarium
	w_aquarium.of_AddRemoveFish ( index, True ) 
End If

llvi_Item.Selected = False

SetItem(index, llvi_Item)

end event

type st_2 from statictext within w_fish_config
integer x = 36
integer y = 75
integer width = 740
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
string text = "魚をダブルクリックしてください:"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_fish_config
integer x = 340
integer y = 1173
integer width = 232
integer height = 85
integer taborder = 20
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

type hsb_speed from hscrollbar within w_fish_config
integer x = 36
integer y = 1063
integer width = 808
integer height = 60
integer maxposition = 8
integer position = 4
end type

event moved;of_change_speed(position)

end event

event lineleft;If This.Position > 0 Then
	This.Position = This.Position - 1
End If

of_change_speed(This.Position)

end event

event lineright;If This.Position < 8 Then
	This.Position = This.Position + 1
End If

of_change_speed(This.Position)

end event

event pageright;If This.Position < 7 Then
	This.Position = This.Position + 2
End If

of_change_speed(This.Position)

end event

event pageleft;If This.Position > 1 Then
	This.Position = This.Position - 2
End If

of_change_speed(This.Position)

end event

type st_4 from statictext within w_fish_config
integer x = 36
integer y = 999
integer width = 372
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
string text = "魚の速さ:"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_1 from statictext within w_fish_config
integer x = 36
integer y = 21
integer width = 736
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
string text = "魚を追加/除外するには、"
long bordercolor = 8388608
boolean focusrectangle = false
end type

