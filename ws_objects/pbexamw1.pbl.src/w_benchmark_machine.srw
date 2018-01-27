$PBExportHeader$w_benchmark_machine.srw
$PBExportComments$テストを行うコンピュータの種類を入力するウィンドウ
forward
global type w_benchmark_machine from w_center
end type
type ddlb_cpu from dropdownlistbox within w_benchmark_machine
end type
type cb_cancel from commandbutton within w_benchmark_machine
end type
type cb_ok from commandbutton within w_benchmark_machine
end type
type st_7 from statictext within w_benchmark_machine
end type
type st_6 from statictext within w_benchmark_machine
end type
type sle_memory from singlelineedit within w_benchmark_machine
end type
type sle_speed from singlelineedit within w_benchmark_machine
end type
type st_4 from statictext within w_benchmark_machine
end type
type st_3 from statictext within w_benchmark_machine
end type
type st_2 from statictext within w_benchmark_machine
end type
type st_1 from statictext within w_benchmark_machine
end type
end forward

global type w_benchmark_machine from w_center
integer x = 796
integer y = 789
integer width = 1280
integer height = 732
string title = "テスト コンピュータ情報"
windowtype windowtype = response!
long backcolor = 73955432
toolbaralignment toolbaralignment = alignatleft!
ddlb_cpu ddlb_cpu
cb_cancel cb_cancel
cb_ok cb_ok
st_7 st_7
st_6 st_6
sle_memory sle_memory
sle_speed sle_speed
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
end type
global w_benchmark_machine w_benchmark_machine

on w_benchmark_machine.create
int iCurrent
call super::create
this.ddlb_cpu=create ddlb_cpu
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.st_7=create st_7
this.st_6=create st_6
this.sle_memory=create sle_memory
this.sle_speed=create sle_speed
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_cpu
this.Control[iCurrent+2]=this.cb_cancel
this.Control[iCurrent+3]=this.cb_ok
this.Control[iCurrent+4]=this.st_7
this.Control[iCurrent+5]=this.st_6
this.Control[iCurrent+6]=this.sle_memory
this.Control[iCurrent+7]=this.sle_speed
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.st_1
end on

on w_benchmark_machine.destroy
call super::destroy
destroy(this.ddlb_cpu)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.sle_memory)
destroy(this.sle_speed)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
end on

event open;call super::open;If f_get_profile("Benchmark Machine", "CPU", ddlb_cpu.Text) = -1 Then
	Choose Case ge_Environment.cputype
		Case alpha!
			ddlb_cpu.Text = "Alpha"
		Case hppa!
			ddlb_cpu.Text = "HPPA"
		Case i286!
			ddlb_cpu.Text = "i286"
		Case i386!
			ddlb_cpu.Text = "i386"
		Case i486!
			ddlb_cpu.Text = "i486"
		Case m68000!
			ddlb_cpu.Text = "m68000"
		Case m68020!
			ddlb_cpu.Text = "m68020"
		Case m68030!
			ddlb_cpu.Text = "m68030"
		Case m68040!
			ddlb_cpu.Text = "m68040"
		Case mips!
			ddlb_cpu.Text = "Mips"
		Case pentium!
			ddlb_cpu.Text = "Pentium"
		Case powerpc!
			ddlb_cpu.Text = "PowerPC"
		Case sparc!
			ddlb_cpu.Text = "Sparc"
	End Choose
End If

f_get_profile("Benchmark Machine", "Speed", sle_speed.Text)
f_get_profile("Benchmark Machine", "Memory", sle_memory.Text)

end event

type ddlb_cpu from dropdownlistbox within w_benchmark_machine
integer x = 316
integer y = 128
integer width = 340
integer height = 444
integer taborder = 1
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"Alpha","HPPA","i286","i386","i486","m68000","m68020","m68030","m68040","Mips","Pentium","PowerPC","Sparc"}
borderstyle borderstyle = stylelowered!
end type

type cb_cancel from commandbutton within w_benchmark_machine
integer x = 632
integer y = 480
integer width = 312
integer height = 89
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "キャンセル"
end type

event clicked;Close(Parent)

end event

type cb_ok from commandbutton within w_benchmark_machine
integer x = 264
integer y = 480
integer width = 276
integer height = 89
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "OK"
boolean default = true
end type

event clicked;f_set_profile("Benchmark Machine", "CPU", ddlb_cpu.Text)
f_set_profile("Benchmark Machine", "Speed", sle_speed.Text)
f_set_profile("Benchmark Machine", "Memory", sle_memory.Text)

Close(Parent)

end event

type st_7 from statictext within w_benchmark_machine
integer x = 516
integer y = 338
integer width = 136
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Meg."
boolean focusrectangle = false
end type

type st_6 from statictext within w_benchmark_machine
integer x = 516
integer y = 235
integer width = 144
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "MHz"
boolean focusrectangle = false
end type

type sle_memory from singlelineedit within w_benchmark_machine
integer x = 316
integer y = 331
integer width = 192
integer height = 75
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_speed from singlelineedit within w_benchmark_machine
integer x = 316
integer y = 228
integer width = 192
integer height = 75
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_benchmark_machine
integer x = 96
integer y = 338
integer width = 208
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "メモリ:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_benchmark_machine
integer x = 4
integer y = 235
integer width = 304
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "CPUクロック:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_benchmark_machine
integer x = 160
integer y = 135
integer width = 144
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "CPU:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_benchmark_machine
integer x = 28
integer y = 21
integer width = 936
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "テストを行うコンピュータ情報:"
boolean focusrectangle = false
end type

