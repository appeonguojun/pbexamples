$PBExportHeader$w_pipeline_blob.srw
$PBExportComments$Blob データを使用したデータ パイプラインのサンプル プログラム
forward
global type w_pipeline_blob from w_center
end type
type st_errors from statictext within w_pipeline_blob
end type
type st_written from statictext within w_pipeline_blob
end type
type st_read from statictext within w_pipeline_blob
end type
type st_4 from statictext within w_pipeline_blob
end type
type st_3 from statictext within w_pipeline_blob
end type
type st_2 from statictext within w_pipeline_blob
end type
type st_1 from statictext within w_pipeline_blob
end type
type dw_errors from datawindow within w_pipeline_blob
end type
type dw_result from datawindow within w_pipeline_blob
end type
type cb_help from commandbutton within w_pipeline_blob
end type
type cb_close from commandbutton within w_pipeline_blob
end type
type cb_execute from commandbutton within w_pipeline_blob
end type
end forward

global type w_pipeline_blob from w_center
integer x = 279
integer y = 4
integer width = 2368
integer height = 1856
string title = "データ パイプライン における Blob カラム"
long backcolor = 79741120
toolbaralignment toolbaralignment = alignatleft!
st_errors st_errors
st_written st_written
st_read st_read
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
dw_errors dw_errors
dw_result dw_result
cb_help cb_help
cb_close cb_close
cb_execute cb_execute
end type
global w_pipeline_blob w_pipeline_blob

forward prototypes
public function integer of_drop_table ()
end prototypes

public function integer of_drop_table ();// Drop the new table if it already exists

Execute Immediate "DROP TABLE ole_copy";
If sqlca.SQLCode <> 0 Then
	If sqlca.SQLDBCode <> -141 Then
		// -141 means the table did not already exist
		MessageBox("エラー","新規テーブルを削除できませんでした。  エラー:  " + &
							String(sqlca.SQLDBCode) + " - " + sqlca.SQLErrText);
		Return sqlca.SQLCode
	End If
End If

commit;

Return 0

end function

on w_pipeline_blob.create
this.st_errors=create st_errors
this.st_written=create st_written
this.st_read=create st_read
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_errors=create dw_errors
this.dw_result=create dw_result
this.cb_help=create cb_help
this.cb_close=create cb_close
this.cb_execute=create cb_execute
this.Control[]={ this.st_errors,&
this.st_written,&
this.st_read,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.dw_errors,&
this.dw_result,&
this.cb_help,&
this.cb_close,&
this.cb_execute}
end on

on w_pipeline_blob.destroy
destroy(this.st_errors)
destroy(this.st_written)
destroy(this.st_read)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_errors)
destroy(this.dw_result)
destroy(this.cb_help)
destroy(this.cb_close)
destroy(this.cb_execute)
end on

event close;of_drop_table()

Show(w_main)

end event

event open;call super::open;dw_result.SetTrans(sqlca)

end event

type st_errors from statictext within w_pipeline_blob
integer x = 1385
integer y = 4
integer width = 151
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "0"
alignment alignment = right!
boolean border = true
long bordercolor = 8388608
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_written from statictext within w_pipeline_blob
integer x = 1001
integer y = 4
integer width = 151
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "0"
alignment alignment = right!
boolean border = true
long bordercolor = 8388608
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_read from statictext within w_pipeline_blob
integer x = 489
integer y = 4
integer width = 151
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "0"
alignment alignment = right!
boolean border = true
long bordercolor = 8388608
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_pipeline_blob
integer x = 1170
integer y = 8
integer width = 201
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "エラー:"
alignment alignment = right!
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_3 from statictext within w_pipeline_blob
integer x = 649
integer y = 8
integer width = 343
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "書き込み行数:"
alignment alignment = right!
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_2 from statictext within w_pipeline_blob
integer x = 114
integer y = 8
integer width = 352
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "読み込み行数:"
alignment alignment = right!
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_1 from statictext within w_pipeline_blob
integer x = 9
integer y = 92
integer width = 553
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "パイプライン エラー:"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type dw_errors from datawindow within w_pipeline_blob
integer x = 9
integer y = 160
integer width = 1911
integer height = 276
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_result from datawindow within w_pipeline_blob
integer x = 9
integer y = 456
integer width = 1911
integer height = 1264
string dataobject = "d_ole_blob"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

type cb_help from commandbutton within w_pipeline_blob
integer x = 1947
integer y = 232
integer width = 366
integer height = 84
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ"
end type

event clicked;f_open_help ("w_pipeline_blob")

end event

type cb_close from commandbutton within w_pipeline_blob
integer x = 1947
integer y = 120
integer width = 366
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる"
boolean cancel = true
end type

event clicked;Close(Parent)

end event

type cb_execute from commandbutton within w_pipeline_blob
integer x = 1947
integer y = 8
integer width = 366
integer height = 84
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "実行"
boolean default = true
end type

event clicked;Integer			li_RC
Transaction	lt_Source
p_pipe_wmeter	lp_Create

SetPointer(HourGlass!)

This.Enabled = False
cb_close.Enabled = False

If of_drop_table() <> 0 Then Return
dw_result.Reset()

// lt_Source will be the source transaction, sqlca is the destination.
lt_Source = CREATE Transaction

lt_Source.dbms   = sqlca.dbms
lt_Source.database = sqlca.database
lt_Source.userid   = sqlca.userid
lt_Source.dbpass = sqlca.dbpass
lt_Source.logid  = sqlca.logid
lt_Source.logpass  = sqlca.logpass
lt_Source.servername   = sqlca.servername
lt_Source.dbparm = sqlca.dbparm

Connect using lt_Source;
If lt_Source.sqlcode <> 0 Then 
	Messagebox("転送元接続エラー", lt_Source.sqlerrtext)
	Return
End If

// Create the local pipeline object to create the new table.
lp_Create = CREATE p_pipe_wmeter
lp_Create.st_read = st_read
lp_Create.st_written = st_written
lp_Create.st_errors = st_errors

// Open a status window.
OpenWithParm(w_pipe_status, "新しいテーブルの作成とデータのロード")

lp_Create.DataObject = "p_create_ole_blob" 

// Execute the pipe.
li_RC = lp_Create.Start(lt_Source, sqlca, dw_errors)

If li_RC <> 1 Then 
	MessageBox("新規テーブル作成","エラー コード: " + string(li_rc))
End if

Commit;

DESTROY lp_Create

Disconnect Using lt_Source;
DESTROY lt_Source

w_pipe_status.st_msg.Text = "結果の表示"

// Retrieve data into display DataWindow
dw_result.Retrieve()

Close(w_pipe_status)

This.Enabled = True
cb_close.Enabled = True

end event

