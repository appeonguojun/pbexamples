$PBExportHeader$w_serverpush.srw
$PBExportComments$サーバ プッシュ サンプル
forward
global type w_serverpush from w_dpb_launcher
end type
end forward

global type w_serverpush from w_dpb_launcher
boolean TitleBar=true
string Title="分散型 Powerbuilder サーバにおける Push のサンプル"
end type
global w_serverpush w_serverpush

on w_serverpush.create
call super::create
end on

on w_serverpush.destroy
call super::destroy
end on

event open;call super::open;istr_parms.s_client = "distrib" + is_dirsep + "srvrpush" + is_dirsep + "dpbclnt"
istr_parms.s_clientnotes = "クライアントはレポート リストを要求し、処理を実行します。"
istr_parms.s_server = "distrib" + is_dirsep + "srvrpush" + is_dirsep + "dpbsrvr"
istr_parms.s_servernotes = "クライアントの要求により、サーバは取得したレポート リストをクライアントに送ります。"

post event ue_postopen()
end event

event ue_postopen;call super::ue_postopen;is_caller = "dpbserver60"
is_port = "10099"
end event

