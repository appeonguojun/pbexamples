$PBExportHeader$u_dyn_datawindow.sru
$PBExportComments$UO: ダイナミック ユーザ オブジェクトのサンプルで使用するデータウィンドウ コントロールを含んでいます。
forward
global type u_dyn_datawindow from datawindow
end type
end forward

global type u_dyn_datawindow from datawindow
int Width=1185
int Height=689
int TabOrder=1
BorderStyle BorderStyle=StyleRaised!
boolean HScrollBar=true
boolean VScrollBar=true
boolean Resizable=true
boolean LiveScroll=true
end type
global u_dyn_datawindow u_dyn_datawindow

on doubleclicked;w_dynamic_uo_work_area win
win = parent
win.triggerevent("openwindow")
end on

