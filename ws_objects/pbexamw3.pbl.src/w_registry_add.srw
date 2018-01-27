$PBExportHeader$w_registry_add.srw
$PBExportComments$レジストリに値を設定するウィンドウ
forward
global type w_registry_add from w_center
end type
type p_binary from picture within w_registry_add
end type
type st_binary3 from statictext within w_registry_add
end type
type st_binary2 from statictext within w_registry_add
end type
type cb_browse from commandbutton within w_registry_add
end type
type sle_binary from singlelineedit within w_registry_add
end type
type st_binary1 from statictext within w_registry_add
end type
type st_ulong2 from statictext within w_registry_add
end type
type st_ulong1 from statictext within w_registry_add
end type
type st_expandedstring from statictext within w_registry_add
end type
type mle_multistring from multilineedit within w_registry_add
end type
type st_multistring3 from statictext within w_registry_add
end type
type st_multistring2 from statictext within w_registry_add
end type
type st_multistring1 from statictext within w_registry_add
end type
type sle_string from singlelineedit within w_registry_add
end type
type st_string from statictext within w_registry_add
end type
type sle_name from singlelineedit within w_registry_add
end type
type st_1 from statictext within w_registry_add
end type
type cb_cancel from commandbutton within w_registry_add
end type
type cb_ok from commandbutton within w_registry_add
end type
end forward

global type w_registry_add from w_center
integer x = 284
integer y = 299
integer width = 2000
integer height = 1209
string title = "レジストリエントリの追加/更新"
windowtype windowtype = response!
long backcolor = 79741120
p_binary p_binary
st_binary3 st_binary3
st_binary2 st_binary2
cb_browse cb_browse
sle_binary sle_binary
st_binary1 st_binary1
st_ulong2 st_ulong2
st_ulong1 st_ulong1
st_expandedstring st_expandedstring
mle_multistring mle_multistring
st_multistring3 st_multistring3
st_multistring2 st_multistring2
st_multistring1 st_multistring1
sle_string sle_string
st_string st_string
sle_name sle_name
st_1 st_1
cb_cancel cb_cancel
cb_ok cb_ok
end type
global w_registry_add w_registry_add

type variables
String	sKEY
String	is_Type
end variables

forward prototypes
public function integer of_readblob (string as_filename, ref blob ab_Picture)
end prototypes

public function integer of_readblob (string as_filename, ref blob ab_Picture);Long		ll_FileNo

ll_FileNo = FileOpen(as_FileName, StreamMode!)
If ll_FileNo = -1 Then
	Return -1
End If

FileRead(ll_FileNo, ab_Picture)

FileClose(ll_FileNo)

Return 1

end function

on w_registry_add.create
int iCurrent
call super::create
this.p_binary=create p_binary
this.st_binary3=create st_binary3
this.st_binary2=create st_binary2
this.cb_browse=create cb_browse
this.sle_binary=create sle_binary
this.st_binary1=create st_binary1
this.st_ulong2=create st_ulong2
this.st_ulong1=create st_ulong1
this.st_expandedstring=create st_expandedstring
this.mle_multistring=create mle_multistring
this.st_multistring3=create st_multistring3
this.st_multistring2=create st_multistring2
this.st_multistring1=create st_multistring1
this.sle_string=create sle_string
this.st_string=create st_string
this.sle_name=create sle_name
this.st_1=create st_1
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_binary
this.Control[iCurrent+2]=this.st_binary3
this.Control[iCurrent+3]=this.st_binary2
this.Control[iCurrent+4]=this.cb_browse
this.Control[iCurrent+5]=this.sle_binary
this.Control[iCurrent+6]=this.st_binary1
this.Control[iCurrent+7]=this.st_ulong2
this.Control[iCurrent+8]=this.st_ulong1
this.Control[iCurrent+9]=this.st_expandedstring
this.Control[iCurrent+10]=this.mle_multistring
this.Control[iCurrent+11]=this.st_multistring3
this.Control[iCurrent+12]=this.st_multistring2
this.Control[iCurrent+13]=this.st_multistring1
this.Control[iCurrent+14]=this.sle_string
this.Control[iCurrent+15]=this.st_string
this.Control[iCurrent+16]=this.sle_name
this.Control[iCurrent+17]=this.st_1
this.Control[iCurrent+18]=this.cb_cancel
this.Control[iCurrent+19]=this.cb_ok
end on

on w_registry_add.destroy
call super::destroy
destroy(this.p_binary)
destroy(this.st_binary3)
destroy(this.st_binary2)
destroy(this.cb_browse)
destroy(this.sle_binary)
destroy(this.st_binary1)
destroy(this.st_ulong2)
destroy(this.st_ulong1)
destroy(this.st_expandedstring)
destroy(this.mle_multistring)
destroy(this.st_multistring3)
destroy(this.st_multistring2)
destroy(this.st_multistring1)
destroy(this.sle_string)
destroy(this.st_string)
destroy(this.sle_name)
destroy(this.st_1)
destroy(this.cb_cancel)
destroy(this.cb_ok)
end on

event open;call super::open;String	ls_Parm, ls_Name, ls_Val, ls_AVal[]
Integer	li_Pos, li_Strings, li_Cnt
ULong	lul_Val
Blob		lb_Val

sKey  = sREGKEY + "\Code Examples\Registry Functions"
 
ls_Parm = Message.StringParm
li_Pos = Pos(ls_Parm, "~t")

If li_Pos = 0 Then
	is_Type = ls_Parm
	ls_Name = ""
Else
	is_Type = Left (ls_Parm, (li_Pos - 1))
	sle_name.Text = Right(ls_Parm, (Len(ls_Parm) - li_Pos))
	sle_name.BackColor = This.BackColor
	sle_name.Enabled = False
	ls_Name = sle_name.Text + " (" + is_Type + ")"
End If

Choose Case is_Type
	Case "String"
		st_string.Visible = True
		sle_string.Visible = True
		If ls_Name <> "" Then
			RegistryGet(sKEY, ls_Name, RegString!, ls_Val)
			sle_string.Text = ls_Val
		End If
			
	Case "Expanded String"
		st_expandedstring.Visible = True
		sle_string.Visible = True
		If ls_Name <> "" Then
			RegistryGet(sKEY, ls_Name, RegExpandString!, ls_Val)
			sle_string.Text = ls_Val
		End If

	Case "Multi String"
		st_multistring1.Visible = True
		st_multistring2.Visible = True
		st_multistring3.Visible = True
		mle_multistring.Visible = True
		If ls_Name <> "" Then
			RegistryGet(sKEY, ls_Name, RegMultiString!, ls_AVal)
			li_Strings = UpperBound(ls_AVal)
			For li_Cnt = 1 To li_Strings
				mle_multistring.Text += ls_AVal[li_Cnt] + "~r~n"
			Next
		End If

	Case "Unsigned Long"
		st_ulong1.Visible = True
		st_ulong2.Visible = True
		sle_string.Visible = True
		If ls_Name <> "" Then
			RegistryGet(sKEY, ls_Name, ReguLong!, lul_Val)
			sle_string.Text = String(lul_Val)
		End If

	Case "Binary"
		st_binary1.Visible = True
		st_binary2.Visible = True
		st_binary3.Visible = True
		sle_binary.Visible = True
		cb_browse.Visible = True
		p_binary.Visible = True
		If ls_Name <> "" Then
			RegistryGet(sKEY, ls_Name, RegBinary!, lb_Val)
			p_binary.SetPicture(lb_Val)
		End If
End Choose

end event

type p_binary from picture within w_registry_add
boolean visible = false
integer x = 740
integer y = 476
integer width = 552
integer height = 402
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_binary3 from statictext within w_registry_add
boolean visible = false
integer x = 528
integer y = 395
integer width = 776
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
string text = "画像がレジストリに保存されます。"
boolean focusrectangle = false
end type

type st_binary2 from statictext within w_registry_add
boolean visible = false
integer x = 528
integer y = 331
integer width = 1272
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
string text = "ビットマップファイルの名前を入力すると、"
boolean focusrectangle = false
end type

type cb_browse from commandbutton within w_registry_add
boolean visible = false
integer x = 1632
integer y = 203
integer width = 248
integer height = 107
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "参照"
end type

event clicked;String	ls_Path, ls_File

GetFileOpenName("ビットマップファイルの選択", ls_Path, ls_File, "BMP", "ビットマップファイル (*.BMP),*.BMP")

sle_binary.Text = ls_Path
sle_binary.Post Event modified()

end event

type sle_binary from singlelineedit within w_registry_add
boolean visible = false
integer x = 528
integer y = 217
integer width = 1092
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;Blob		lb_Picture

If of_readblob(This.Text, lb_Picture) = -1 Then
	MessageBox("エラー", "ファイルの読み込みでエラーが発生しました。別のファイルを選択してください。", StopSign!)
	Return
End If

If p_binary.SetPicture(lb_Picture) = -1 Then
	MessageBox("エラー", "画像の表示でエラーが発生しました。別のファイルを選択してください。", StopSign!)
	Return
End If

end event

type st_binary1 from statictext within w_registry_add
boolean visible = false
integer x = 172
integer y = 224
integer width = 348
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
string text = "バイナリ データ:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_ulong2 from statictext within w_registry_add
boolean visible = false
integer x = 56
integer y = 313
integer width = 444
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
string text = "(32-bit 数値)"
boolean focusrectangle = false
end type

type st_ulong1 from statictext within w_registry_add
boolean visible = false
integer y = 224
integer width = 516
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
string text = "Unsigned Longデータ:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_expandedstring from statictext within w_registry_add
boolean visible = false
integer y = 224
integer width = 508
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
string text = "拡張文字列データ:"
alignment alignment = right!
boolean focusrectangle = false
end type

type mle_multistring from multilineedit within w_registry_add
boolean visible = false
integer x = 532
integer y = 220
integer width = 1404
integer height = 640
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_multistring3 from statictext within w_registry_add
boolean visible = false
integer x = 84
integer y = 309
integer width = 424
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
string text = "改行(CR)で区切る"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_multistring2 from statictext within w_registry_add
boolean visible = false
integer x = 88
integer y = 242
integer width = 420
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
string text = "それぞれ文字列を"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_multistring1 from statictext within w_registry_add
end type

type sle_string from singlelineedit within w_registry_add
boolean visible = false
integer x = 528
integer y = 220
integer width = 1424
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_string from statictext within w_registry_add
boolean visible = false
integer x = 200
integer y = 228
integer width = 288
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
string text = "文字列データ:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_name from singlelineedit within w_registry_add
integer x = 528
integer y = 25
integer width = 856
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_registry_add
integer x = 200
integer y = 32
integer width = 316
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
string text = "値の名前:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_registry_add
integer x = 1048
integer y = 924
integer width = 284
integer height = 107
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "キャンセル"
boolean cancel = true
end type

event clicked;CloseWithReturn(Parent, "")

end event

type cb_ok from commandbutton within w_registry_add
integer x = 564
integer y = 924
integer width = 248
integer height = 107
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "OK"
boolean default = true
end type

event clicked;String	ls_Name, ls_AVal[], ls_Strings
Integer	li_Pos, li_Cnt
ULong	lul_Val
Blob		lb_Val

If Trim(sle_name.Text) = "" Then
	MessageBox("エラー", "値の名前を入力してください。", Exclamation!)
	Return
End If

// Add/update the value
ls_Name = sle_name.Text + " (" + is_Type + ")"

Choose Case is_Type
	Case "String"
		If Trim(sle_string.Text) = "" Then
			MessageBox("エラー", "値を入力してください。", Exclamation!)
			Return
		End If
		RegistrySet(sKEY, ls_Name, RegString!, sle_string.Text)
			
	Case "Expanded String"
		If Trim(sle_string.Text) = "" Then
			MessageBox("エラー", "値を入力してください。", Exclamation!)
			Return
		End If
		RegistrySet(sKEY, ls_Name, RegExpandString!, sle_string.Text)

	Case "Multi String"
		If Trim(mle_multistring.Text) = "" Then
			MessageBox("エラー", "値を入力してください。", Exclamation!)
			Return
		End If
		
		ls_Strings = mle_multistring.Text
		li_Cnt = 0
		Do
			li_Pos = Pos(ls_Strings, "~r~n")
			li_Cnt ++
			If li_Pos > 0 Then
				ls_AVal[li_Cnt] = Left(ls_Strings, (li_Pos - 1))
				ls_Strings = Right(ls_Strings, (Len(ls_Strings) - (li_Pos + 1)))
			Else
				ls_AVal[li_Cnt] = ls_Strings
			End If
		Loop Until (li_Pos = 0)
		
		RegistrySet(sKEY, ls_Name, RegMultiString!, ls_AVal)

	Case "Unsigned Long"
		If Trim(sle_string.Text) = "" Then
			MessageBox("エラー", "値を入力してください。", Exclamation!)
			Return
		End If
		If Not IsNumber(sle_String.Text) Then
			MessageBox("エラー", "値は数値で入力してください。", Exclamation!)
			Return
		End If
		
		lul_Val = Long(sle_String.Text)
		RegistrySet(sKEY, ls_Name, ReguLong!, lul_Val)

	Case "Binary"
		If Trim(sle_binary.Text) = "" Then
			MessageBox("エラー", "ファイル名を入力してください。", Exclamation!)
			Return
		End If

		If of_readblob(sle_binary.Text, lb_Val) = -1 Then
			MessageBox("エラー", "ファイルの読み込みでエラーが発生しました。別のファイルを選択してください。", Exclamation!)
			Return
		End If
		RegistrySet(sKEY, ls_Name, RegBinary!, lb_Val)
End Choose

CloseWithReturn(Parent, sle_name.Text)

end event

