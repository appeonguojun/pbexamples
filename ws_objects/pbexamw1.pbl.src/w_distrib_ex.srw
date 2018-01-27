$PBExportHeader$w_distrib_ex.srw
$PBExportComments$分散処理　サンプル
forward
global type w_distrib_ex from w_dpb_launcher
end type
end forward

global type w_distrib_ex from w_dpb_launcher
integer height = 1244
string title = "分散処理"
end type
global w_distrib_ex w_distrib_ex

on w_distrib_ex.create
call super::create
end on

on w_distrib_ex.destroy
call super::destroy
end on

event open;call super::open;istr_parms.s_client = "distrib" + is_dirsep + "distexam" + is_dirsep +"clntapp"
istr_parms.s_clientnotes = "[非同期処理の実行] ボタンをクリックすると、非同期処理の初期処理が呼び出されます。" +&
									"ここではサーバの処理を起動し、サーバが結果を返すために必要なテキストとオブジェクトのハンドルを渡します。"
istr_parms.s_server = "distrib" + is_dirsep + "distexam" + is_dirsep + "srvrapp"
istr_parms.s_servernotes = "サーバは呼び出しを受けると、受け取りを示すメッセージボックスを表示します。"+&
									"クライアント側では、サーバの起動を示すメッセージボックスが表示されます。"

post event ue_postopen()
end event

event ue_postopen;call super::ue_postopen;is_caller = ProfileString("distributed" + is_dirsep + "distrib_ex" + &
	is_dirsep + "dpb_info.ini", "server", "application", "nameserver")
is_port = "10100"
end event

type st_4 from w_dpb_launcher`st_4 within w_distrib_ex
end type

type st_3 from w_dpb_launcher`st_3 within w_distrib_ex
end type

type st_2 from w_dpb_launcher`st_2 within w_distrib_ex
end type

type st_1 from w_dpb_launcher`st_1 within w_distrib_ex
end type

type mle_servernotes from w_dpb_launcher`mle_servernotes within w_distrib_ex
string facename = "ＭＳ ゴシック"
end type

type mle_clientnotes from w_dpb_launcher`mle_clientnotes within w_distrib_ex
string facename = "ＭＳ ゴシック"
end type

type cb_serverlocation from w_dpb_launcher`cb_serverlocation within w_distrib_ex
integer x = 1531
end type

type sle_serverlocation from w_dpb_launcher`sle_serverlocation within w_distrib_ex
string facename = "ＭＳ ゴシック"
end type

type cb_clientlocation from w_dpb_launcher`cb_clientlocation within w_distrib_ex
integer x = 1545
end type

type sle_clientlocation from w_dpb_launcher`sle_clientlocation within w_distrib_ex
string facename = "ＭＳ ゴシック"
end type

type pb_runserver from w_dpb_launcher`pb_runserver within w_distrib_ex
end type

type pb_runclient from w_dpb_launcher`pb_runclient within w_distrib_ex
end type

type gb_2 from w_dpb_launcher`gb_2 within w_distrib_ex
end type

type gb_1 from w_dpb_launcher`gb_1 within w_distrib_ex
end type

