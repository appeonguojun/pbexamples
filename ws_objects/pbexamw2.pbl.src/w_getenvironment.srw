$PBExportHeader$w_getenvironment.srw
$PBExportComments$GetEnvironment関数の使用方法を示しています。
forward
global type w_getenvironment from w_center
end type
type st_4 from statictext within w_getenvironment
end type
type st_exe from statictext within w_getenvironment
end type
type cb_ok from commandbutton within w_getenvironment
end type
type st_width from statictext within w_getenvironment
end type
type st_height from statictext within w_getenvironment
end type
type st_colors from statictext within w_getenvironment
end type
type st_7 from statictext within w_getenvironment
end type
type st_6 from statictext within w_getenvironment
end type
type st_5 from statictext within w_getenvironment
end type
type st_pbver from statictext within w_getenvironment
end type
type st_3 from statictext within w_getenvironment
end type
type st_2 from statictext within w_getenvironment
end type
type st_1 from statictext within w_getenvironment
end type
type st_ostype from statictext within w_getenvironment
end type
type st_cpu_type from statictext within w_getenvironment
end type
end forward

global type w_getenvironment from w_center
integer x = 808
integer y = 544
integer width = 1304
integer height = 900
string title = "GetEnvironment関数"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_4 st_4
st_exe st_exe
cb_ok cb_ok
st_width st_width
st_height st_height
st_colors st_colors
st_7 st_7
st_6 st_6
st_5 st_5
st_pbver st_pbver
st_3 st_3
st_2 st_2
st_1 st_1
st_ostype st_ostype
st_cpu_type st_cpu_type
end type
global w_getenvironment w_getenvironment

event open;call super::open;environment env
integer resp
string temp
resp = getenvironment(env)

choose case env.cputype
	case alpha!
		st_cpu_type.text = 'Alpha'
	case hppa!
		st_cpu_type.text = 'HPPA'
	case i286!
		st_cpu_type.text = '286'
	case i386!
		st_cpu_type.text = '386'
	case i486!
		st_cpu_type.text = '486'
	case m68000!
		st_cpu_type.text = '68000'
	case m68020!
		st_cpu_type.text = '68020'
	case m68030!
		st_cpu_type.text = '68030'
	case m68040!
		st_cpu_type.text = '68040'
	case mips!
		st_cpu_type.text = 'MIPS'
	case pentium!
		st_cpu_type.text = 'Pentium'
	case powerpc!
		st_cpu_type.text = 'PowerPC'
	case sparc!
		st_cpu_type.text = 'Sparc'
end choose

choose case env.ostype
	case aix!
		temp = 'AIX'
	case hpux!
		temp = 'HPUX'
	case osf1!
		temp = 'OSF1'
	case sol2!
		temp = 'Solaris 2'
	case Windows!
		temp = 'Windows'
	case Windowsnt!
		temp = 'Windows NT'
end choose
st_ostype.text = temp + ' '+string(env.osmajorrevision)+'.'+string(env.osminorrevision)+'.'+string(env.osfixesrevision)

choose case env.pbtype
	case enterprise!
		temp = 'Enterprise'
	case desktop!
		temp = 'Desktop'
end choose
If env.win16 Then
	temp = temp + "/16"
Else
	temp = temp + "/32"
End If

st_pbver.text = temp + ' '+string(env.pbmajorrevision)+'.'+string(env.pbminorrevision)+'.'+string(env.pbfixesrevision)

If env.machinecode Then
	st_exe.text = "Machine Code"
Else
	st_exe.text = "P-Code"
End If

st_colors.text =string(env.numberofcolors)
st_height.text = string(env.screenheight)
st_width.text = string(env.screenwidth)

end event

on w_getenvironment.create
this.st_4=create st_4
this.st_exe=create st_exe
this.cb_ok=create cb_ok
this.st_width=create st_width
this.st_height=create st_height
this.st_colors=create st_colors
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_pbver=create st_pbver
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.st_ostype=create st_ostype
this.st_cpu_type=create st_cpu_type
this.Control[]={this.st_4,&
this.st_exe,&
this.cb_ok,&
this.st_width,&
this.st_height,&
this.st_colors,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_pbver,&
this.st_3,&
this.st_2,&
this.st_1,&
this.st_ostype,&
this.st_cpu_type}
end on

on w_getenvironment.destroy
destroy(this.st_4)
destroy(this.st_exe)
destroy(this.cb_ok)
destroy(this.st_width)
destroy(this.st_height)
destroy(this.st_colors)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_pbver)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_ostype)
destroy(this.st_cpu_type)
end on

on close;w_main.Show()
end on

type st_4 from statictext within w_getenvironment
integer x = 24
integer y = 277
integer width = 644
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "実行ファイル形式の種類 :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_exe from statictext within w_getenvironment
integer x = 676
integer y = 277
integer width = 800
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "unknown"
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_getenvironment
integer x = 536
integer y = 676
integer width = 248
integer height = 89
integer taborder = 1
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "OK"
boolean default = true
end type

on clicked;close(parent)
end on

type st_width from statictext within w_getenvironment
integer x = 676
integer y = 572
integer width = 248
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "?"
boolean focusrectangle = false
end type

type st_height from statictext within w_getenvironment
integer x = 676
integer y = 491
integer width = 248
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "?"
boolean focusrectangle = false
end type

type st_colors from statictext within w_getenvironment
integer x = 676
integer y = 412
integer width = 248
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "?"
boolean focusrectangle = false
end type

type st_7 from statictext within w_getenvironment
integer x = 176
integer y = 572
integer width = 500
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "画面の幅 : "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within w_getenvironment
integer x = 180
integer y = 491
integer width = 488
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "画面の高さ : "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_getenvironment
integer x = 36
integer y = 412
integer width = 636
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "サポートしている色の数 : "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_pbver from statictext within w_getenvironment
integer x = 676
integer y = 196
integer width = 800
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "version unkown"
boolean focusrectangle = false
end type

type st_3 from statictext within w_getenvironment
integer x = 24
integer y = 196
integer width = 644
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "PowerBuilder バージョン : "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_getenvironment
integer x = 404
integer y = 117
integer width = 264
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "OS 種別 : "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_getenvironment
integer x = 384
integer y = 36
integer width = 288
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "CPU タイプ : "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_ostype from statictext within w_getenvironment
integer x = 676
integer y = 117
integer width = 760
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "os type unknown"
boolean focusrectangle = false
end type

type st_cpu_type from statictext within w_getenvironment
integer x = 676
integer y = 36
integer width = 760
integer height = 71
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "cpu unkown"
boolean focusrectangle = false
end type

