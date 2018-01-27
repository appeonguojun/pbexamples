﻿$PBExportHeader$w_cpu.srw
$PBExportComments$実行タイムのループを表すために CPU 関数を使用
forward
global type w_cpu from w_center
end type
type st_6 from statictext within w_cpu
end type
type st_5 from statictext within w_cpu
end type
type cbx_yield from checkbox within w_cpu
end type
type st_elapsed from statictext within w_cpu
end type
type st_count from statictext within w_cpu
end type
type cb_stop from commandbutton within w_cpu
end type
type st_4 from statictext within w_cpu
end type
type em_counter from editmask within w_cpu
end type
type cb_close from commandbutton within w_cpu
end type
type cb_start from commandbutton within w_cpu
end type
type st_3 from statictext within w_cpu
end type
type st_2 from statictext within w_cpu
end type
type st_1 from statictext within w_cpu
end type
end forward

global type w_cpu from w_center
integer x = 496
integer y = 388
integer width = 1968
integer height = 1045
string title = "CPU 関数と Yield 関数"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_6 st_6
st_5 st_5
cbx_yield cbx_yield
st_elapsed st_elapsed
st_count st_count
cb_stop cb_stop
st_4 st_4
em_counter em_counter
cb_close cb_close
cb_start cb_start
st_3 st_3
st_2 st_2
st_1 st_1
end type
global w_cpu w_cpu

type variables
boolean ib_break_requested
end variables

on open;// initial value
em_counter.text = '5000'
em_counter.setfocus()
end on

on w_cpu.create
int iCurrent
call super::create
this.st_6=create st_6
this.st_5=create st_5
this.cbx_yield=create cbx_yield
this.st_elapsed=create st_elapsed
this.st_count=create st_count
this.cb_stop=create cb_stop
this.st_4=create st_4
this.em_counter=create em_counter
this.cb_close=create cb_close
this.cb_start=create cb_start
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_6
this.Control[iCurrent+2]=this.st_5
this.Control[iCurrent+3]=this.cbx_yield
this.Control[iCurrent+4]=this.st_elapsed
this.Control[iCurrent+5]=this.st_count
this.Control[iCurrent+6]=this.cb_stop
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.em_counter
this.Control[iCurrent+9]=this.cb_close
this.Control[iCurrent+10]=this.cb_start
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.st_1
end on

on w_cpu.destroy
call super::destroy
destroy(this.st_6)
destroy(this.st_5)
destroy(this.cbx_yield)
destroy(this.st_elapsed)
destroy(this.st_count)
destroy(this.cb_stop)
destroy(this.st_4)
destroy(this.em_counter)
destroy(this.cb_close)
destroy(this.cb_start)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
end on

on close;Show (w_main)
end on

type st_6 from statictext within w_cpu
integer x = 36
integer y = 316
integer width = 1056
integer height = 128
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "<ストップ> ボタンを押すと途中結果が得られます。"
boolean focusrectangle = false
end type

type st_5 from statictext within w_cpu
integer x = 32
integer y = 156
integer width = 1032
integer height = 117
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Yield関数を使用した場合と使用しない場合を試してください。 "
boolean focusrectangle = false
end type

type cbx_yield from checkbox within w_cpu
integer x = 1248
integer y = 11
integer width = 652
integer height = 96
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "ループで Yield 関数を使用"
boolean checked = true
boolean lefttext = true
end type

type st_elapsed from statictext within w_cpu
integer x = 720
integer y = 793
integer width = 372
integer height = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_count from statictext within w_cpu
integer x = 720
integer y = 661
integer width = 372
integer height = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_stop from commandbutton within w_cpu
integer x = 1500
integer y = 608
integer width = 328
integer height = 107
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
boolean enabled = false
string text = "ストップ(&T)"
boolean default = true
end type

on clicked;ib_break_requested = True
end on

type st_4 from statictext within w_cpu
integer x = 232
integer y = 811
integer width = 472
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "処理経過時間:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_counter from editmask within w_cpu
integer x = 720
integer y = 519
integer width = 440
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "0"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,##0"
boolean spin = true
string minmax = "01~~999999"
end type

type cb_close from commandbutton within w_cpu
integer x = 1500
integer y = 772
integer width = 328
integer height = 107
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
boolean cancel = true
end type

on clicked;close (parent)
end on

type cb_start from commandbutton within w_cpu
integer x = 1500
integer y = 480
integer width = 328
integer height = 107
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "スタート(&S)"
boolean default = true
end type

event clicked;// Remember the start cpu time in the long variable 'start'
// Loop from 1 to the number in sle_counter, updating the number of
// iterations in sle_total every 10 iterations.
// At the end of the loop, set used to the ending CPU time minus
// the time in 'start' and display seconds used in a message box.
int 		li_ret
long 	ll_index, ll_limit
long 	ll_start,ll_used

ll_limit = Long(em_counter.Text)
st_elapsed.text = ""
ib_break_requested = false
cb_stop.enabled = true
cb_close.enabled = false
cb_start.enabled = false

if ll_limit > 10000 then
	li_ret = messagebox("確認", "長時間のループ処理になりますが、よろしいですか?", &
					Exclamation!,yesno!)
	If li_ret = 2 then return
End If

ll_start = cpu()
for ll_index = 1 to ll_limit
	If mod(ll_index,10) = 0 Then st_count.text = string( ll_index, "###,##0")

	// This yield function will take place any time the check box is turned on.
	// NOTE: if the checkbox is turned off, The STOP button will not be functional 
	// during the loop, because its message will not be processed until the loop
	// completes.

	If cbx_yield.checked Then Yield ( )
	If ib_break_requested Then EXIT
next

ll_used = Cpu() - ll_start
 
cb_stop.enabled = false
cb_close.enabled = true
cb_start.enabled = true
st_elapsed.text = string(ll_used/1000)
end event

type st_3 from statictext within w_cpu
integer x = 36
integer y = 25
integer width = 1048
integer height = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "ループ数の上限を入力して、<スタート> ボタンを押して下さい。"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cpu
integer x = 224
integer y = 668
integer width = 480
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "現在のループ数: "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_cpu
integer x = 104
integer y = 530
integer width = 600
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "ループ数の上限: "
alignment alignment = right!
boolean focusrectangle = false
end type

