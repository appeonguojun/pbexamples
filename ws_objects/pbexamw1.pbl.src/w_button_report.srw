$PBExportHeader$w_button_report.srw
$PBExportComments$ボタン オブジェクトを使用したデータウィンドウ レポートを表示するウィンドウ
forward
global type w_button_report from w_center
end type
type dw_1 from datawindow within w_button_report
end type
end forward

global type w_button_report from w_center
int X=123
int Y=24
int Width=2523
int Height=1852
boolean TitleBar=true
string Title="データウィンドウのボタン オブジェクトを使用したレポート"
long BackColor=79741120
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
dw_1 dw_1
end type
global w_button_report w_button_report

event open;call super::open;dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

end event

on w_button_report.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_button_report.destroy
destroy(this.dw_1)
end on

event close;w_main.Show()

end event

type dw_1 from datawindow within w_button_report
int Width=2478
int Height=1736
int TabOrder=1
string DataObject="d_button_report"
boolean Border=false
boolean LiveScroll=true
end type

event buttonclicked;string	ls_Object
string	ls_win

ls_Object = String(dwo.name)

If ls_Object = "cb_exit" Then
	Close(Parent)
ElseIf ls_Object = "cb_help" Then
	ls_win = parent.ClassName()
	f_open_help(ls_win)
End If

end event

