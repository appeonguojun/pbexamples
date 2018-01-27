$PBExportHeader$w_dpb_launcher.srw
$PBExportComments$分散処理 ランチャー
forward
global type w_dpb_launcher from w_center
end type
type st_4 from statictext within w_dpb_launcher
end type
type st_3 from statictext within w_dpb_launcher
end type
type st_2 from statictext within w_dpb_launcher
end type
type st_1 from statictext within w_dpb_launcher
end type
type mle_servernotes from multilineedit within w_dpb_launcher
end type
type mle_clientnotes from multilineedit within w_dpb_launcher
end type
type cb_serverlocation from commandbutton within w_dpb_launcher
end type
type sle_serverlocation from singlelineedit within w_dpb_launcher
end type
type cb_clientlocation from commandbutton within w_dpb_launcher
end type
type sle_clientlocation from singlelineedit within w_dpb_launcher
end type
type pb_runserver from picturebutton within w_dpb_launcher
end type
type pb_runclient from picturebutton within w_dpb_launcher
end type
type gb_2 from groupbox within w_dpb_launcher
end type
type gb_1 from groupbox within w_dpb_launcher
end type
end forward

global type w_dpb_launcher from w_center
integer x = 848
integer y = 388
integer width = 2244
integer height = 1234
boolean TitleBar=true
string Title="分散PowerBuilderランチャ"
long BackColor=79741120
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
event ue_postopen ( )
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
mle_servernotes mle_servernotes
mle_clientnotes mle_clientnotes
cb_serverlocation cb_serverlocation
sle_serverlocation sle_serverlocation
cb_clientlocation cb_clientlocation
sle_clientlocation sle_clientlocation
pb_runserver pb_runserver
pb_runclient pb_runclient
gb_2 gb_2
gb_1 gb_1
end type
global w_dpb_launcher w_dpb_launcher

type prototypes
Function uint GetWindowsDirectoryA (ref string dirtext, uint textlen) library "KERNEL32.DLL" alias for "GetWindowsDirectoryA;Ansi"
Function uint GetSystemDirectoryA (ref string dirtext, uint textlen) library "KERNEL32.DLL" alias for "GetSystemDirectoryA;Ansi"
Function uint GetDriveTypeA (string drive) library "KERNEL32.DLL" alias for "GetDriveTypeA;Ansi"
Function ulong GetCurrentDirectoryA (ulong textlen, ref string dirtext) library "KERNEL32.DLL" alias for "GetCurrentDirectoryA;Ansi"

end prototypes

type variables
s_parms istr_parms
string is_caller
string is_port
string is_dirsep
end variables

forward prototypes
public subroutine of_setnotes (multilineedit aml_target, string as_note)
end prototypes

event ue_postopen;sle_clientlocation.text = istr_parms.s_client
mle_clientnotes.text = istr_parms.s_clientnotes
sle_serverlocation.text = istr_parms.s_server
mle_servernotes.text = istr_parms.s_servernotes
end event

public subroutine of_setnotes (multilineedit aml_target, string as_note);// called to set text to passed in multiline
aml_target.text = as_note
end subroutine

on w_dpb_launcher.create
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.mle_servernotes=create mle_servernotes
this.mle_clientnotes=create mle_clientnotes
this.cb_serverlocation=create cb_serverlocation
this.sle_serverlocation=create sle_serverlocation
this.cb_clientlocation=create cb_clientlocation
this.sle_clientlocation=create sle_clientlocation
this.pb_runserver=create pb_runserver
this.pb_runclient=create pb_runclient
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.mle_servernotes,&
this.mle_clientnotes,&
this.cb_serverlocation,&
this.sle_serverlocation,&
this.cb_clientlocation,&
this.sle_clientlocation,&
this.pb_runserver,&
this.pb_runclient,&
this.gb_2,&
this.gb_1}
end on

on w_dpb_launcher.destroy
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_servernotes)
destroy(this.mle_clientnotes)
destroy(this.cb_serverlocation)
destroy(this.sle_serverlocation)
destroy(this.cb_clientlocation)
destroy(this.sle_clientlocation)
destroy(this.pb_runserver)
destroy(this.pb_runclient)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event close;Show(w_main)
end event

event open;call super::open;environment lenv_sys

getenvironment(lenv_sys)
// set directory separator for platform
// for unix
if lenv_sys.OSType = aix! or &
	lenv_sys.OSType = hpux! or &
	lenv_sys.OSType = osf1! or &
	lenv_sys.OSType = sol2! then
	is_dirsep = "/"
else
	is_dirsep ="\"
end if

end event

type st_4 from statictext within w_dpb_launcher
integer x = 116
integer y = 775
integer width = 192
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
string text = "説明:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_dpb_launcher
integer x = 100
integer y = 210
integer width = 192
integer height = 53
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "説明:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_dpb_launcher
integer x = 48
integer y = 96
integer width = 285
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "ロケーション"
boolean focusrectangle = false
end type

type st_1 from statictext within w_dpb_launcher
integer x = 40
integer y = 658
integer width = 288
integer height = 89
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "ロケーション"
boolean focusrectangle = false
end type

type mle_servernotes from multilineedit within w_dpb_launcher
integer x = 340
integer y = 192
integer width = 1304
integer height = 284
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type mle_clientnotes from multilineedit within w_dpb_launcher
integer x = 340
integer y = 757
integer width = 1332
integer height = 284
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_serverlocation from commandbutton within w_dpb_launcher
integer x = 1540
integer y = 92
integer width = 120
integer height = 75
integer taborder = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "..."
end type

event clicked;string ls_path
string ls_filename
int 	 li_return


li_return = GetFileOpenName("実行するアプリケーションを選択してください", ls_path, ls_filename, "EXE", &
										+ "Application Files (*.EXE), *.EXE, *.*")
										
										
if li_return = 1 then
	sle_serverlocation.text = ls_path
end if

end event

type sle_serverlocation from singlelineedit within w_dpb_launcher
integer x = 340
integer y = 92
integer width = 1200
integer height = 75
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

type cb_clientlocation from commandbutton within w_dpb_launcher
integer x = 1552
integer y = 658
integer width = 120
integer height = 75
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "..."
end type

event clicked;string ls_path
string ls_filename
int 	 li_return


li_return = GetFileOpenName("実行するアプリケーションを選択してください。", ls_path, ls_filename, "EXE", &
										+ "Application Files (*.EXE), *.EXE, *.*")
										
										
if li_return = 1 then
	sle_clientlocation.text = ls_path
end if

end event

type sle_clientlocation from singlelineedit within w_dpb_launcher
integer x = 340
integer y = 658
integer width = 1212
integer height = 75
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

type pb_runserver from picturebutton within w_dpb_launcher
integer x = 1684
integer y = 192
integer width = 436
integer height = 92
integer taborder = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "サーバ起動"
vtextalign vtextalign = vcenter!
end type

event clicked;string ls_run
int li_return

// get command line
ls_run = sle_serverlocation.text

// if not empty, run it
if not ls_run ="" then
	li_return = run(ls_run)
else
	messagebox("エラー", "サーバ名が指定されていません。サーバ名を選択してください。")
	return -1
end if

// check for error
if li_return = -1 then
	messagebox("実行時エラー", string(li_return)+":実行エラー: "+ls_run)
	return li_return
else
	pb_runclient.enabled = true
	return 1
end if



end event

type pb_runclient from picturebutton within w_dpb_launcher
integer x = 1696
integer y = 757
integer width = 436
integer height = 92
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
boolean enabled = false
string text = "クライアント起動"
vtextalign vtextalign = vcenter!
end type

event clicked;int li_return
string ls_run

// get command line
ls_run = sle_clientlocation.text

// if not empty, run it
if not ls_run ="" then
	li_return = run(ls_run)
end if

// check for error
if li_return = -1 then
	messagebox("実行時エラー", "エラー:"+string(li_return))
end if

end event

type gb_2 from groupbox within w_dpb_launcher
integer x = 20
integer y = 576
integer width = 2148
integer height = 516
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
string text = "クライアント アプリケーション"
end type

type gb_1 from groupbox within w_dpb_launcher
integer x = 20
integer y = 18
integer width = 2148
integer height = 516
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 67108864
string text = "サーバ アプリケーション"
end type

