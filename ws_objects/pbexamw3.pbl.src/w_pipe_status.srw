$PBExportHeader$w_pipe_status.srw
$PBExportComments$パイプラインのステータスを表示するウィンドウ
forward
global type w_pipe_status from w_center
end type
type st_msg from statictext within w_pipe_status
end type
end forward

global type w_pipe_status from w_center
integer x = 677
integer y = 268
integer width = 1701
integer height = 428
string title = "データ パイプライン ステータス"
windowtype windowtype = popup!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_msg st_msg
end type
global w_pipe_status w_pipe_status

on open;string ls_msg

ls_msg = message.stringparm

If len(ls_msg) > 0 Then 
	st_msg.text = ls_msg
End If


end on

on w_pipe_status.create
int iCurrent
call super::create
this.st_msg=create st_msg
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_msg
end on

on w_pipe_status.destroy
call super::destroy
destroy(this.st_msg)
end on

type st_msg from statictext within w_pipe_status
integer x = 23
integer y = 80
integer width = 1595
integer height = 164
integer textsize = -10
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "なし"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

