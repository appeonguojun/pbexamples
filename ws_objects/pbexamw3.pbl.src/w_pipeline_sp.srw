$PBExportHeader$w_pipeline_sp.srw
$PBExportComments$ストアド プロシージャ を使用したデータ パイプラインのサンプル
forward
global type w_pipeline_sp from w_center
end type
type st_6 from statictext within w_pipeline_sp
end type
type st_5 from statictext within w_pipeline_sp
end type
type st_time from statictext within w_pipeline_sp
end type
type st_errors from statictext within w_pipeline_sp
end type
type st_written from statictext within w_pipeline_sp
end type
type st_read from statictext within w_pipeline_sp
end type
type st_4 from statictext within w_pipeline_sp
end type
type st_3 from statictext within w_pipeline_sp
end type
type st_2 from statictext within w_pipeline_sp
end type
type st_1 from statictext within w_pipeline_sp
end type
type dw_errors from datawindow within w_pipeline_sp
end type
type dw_result from datawindow within w_pipeline_sp
end type
type cb_help from commandbutton within w_pipeline_sp
end type
type cb_close from commandbutton within w_pipeline_sp
end type
type cb_execute from commandbutton within w_pipeline_sp
end type
type rb_sp from radiobutton within w_pipeline_sp
end type
type rb_query from radiobutton within w_pipeline_sp
end type
type gb_1 from groupbox within w_pipeline_sp
end type
end forward

global type w_pipeline_sp from w_center
integer x = 128
integer y = 4
integer width = 2679
integer height = 1856
string title = "ストアド プロシージャをソースとするデータ パイプライン"
long backcolor = 79741120
toolbaralignment toolbaralignment = alignatleft!
st_6 st_6
st_5 st_5
st_time st_time
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
rb_sp rb_sp
rb_query rb_query
gb_1 gb_1
end type
global w_pipeline_sp w_pipeline_sp

forward prototypes
public function integer of_drop_table ()
end prototypes

public function integer of_drop_table ();Integer	li_NotExist

Choose Case Lower(Left(sqlca.DBMS, 3))
	Case "odb"
		li_NotExist = -141
	Case "syb"
		li_NotExist = 3701
	Case "syc"
		li_NotExist = 3701
	Case "ora"
		li_NotExist = 3701
End Choose

// Drop the new table if it already exists
sqlca.AutoCommit = True
Execute Immediate "DROP TABLE full_sales_orders";
If sqlca.SQLCode <> 0 Then
	If sqlca.SQLDBCode <> li_NotExist Then
		// -141 means the table did not already exist
		sqlca.AutoCommit = False
		MessageBox("エラー","新規テーブルを削除できませんでした。  エラー :  " + &
							String(sqlca.SQLDBCode) + " - " + sqlca.SQLErrText);
		Return sqlca.SQLCode
	End If
End If
sqlca.AutoCommit = False

commit;

Return 0

end function

on w_pipeline_sp.create
this.st_6=create st_6
this.st_5=create st_5
this.st_time=create st_time
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
this.rb_sp=create rb_sp
this.rb_query=create rb_query
this.gb_1=create gb_1
this.Control[]={ this.st_6,&
this.st_5,&
this.st_time,&
this.st_errors,&
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
this.cb_execute,&
this.rb_sp,&
this.rb_query,&
this.gb_1}
end on

on w_pipeline_sp.destroy
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_time)
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
destroy(this.rb_sp)
destroy(this.rb_query)
destroy(this.gb_1)
end on

event close;of_drop_table()

Show(w_main)

end event

event open;call super::open;dw_result.SetTrans(sqlca)

end event

type st_6 from statictext within w_pipeline_sp
integer x = 2194
integer y = 628
integer width = 128
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
string text = "秒"
boolean focusrectangle = false
end type

type st_5 from statictext within w_pipeline_sp
integer x = 1746
integer y = 628
integer width = 238
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
string text = "経過時間:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_time from statictext within w_pipeline_sp
integer x = 1996
integer y = 628
integer width = 151
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
string text = "0"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_errors from statictext within w_pipeline_sp
integer x = 1582
integer y = 628
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

type st_written from statictext within w_pipeline_sp
integer x = 1202
integer y = 628
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

type st_read from statictext within w_pipeline_sp
integer x = 690
integer y = 628
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

type st_4 from statictext within w_pipeline_sp
integer x = 1371
integer y = 628
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

type st_3 from statictext within w_pipeline_sp
integer x = 846
integer y = 628
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

type st_2 from statictext within w_pipeline_sp
integer x = 311
integer y = 628
integer width = 361
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

type st_1 from statictext within w_pipeline_sp
integer x = 9
integer y = 276
integer width = 498
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

type dw_errors from datawindow within w_pipeline_sp
integer x = 9
integer y = 348
integer width = 2601
integer height = 244
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_result from datawindow within w_pipeline_sp
integer x = 9
integer y = 708
integer width = 2601
integer height = 1020
string dataobject = "d_full_sales_orders"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

type cb_help from commandbutton within w_pipeline_sp
integer x = 2281
integer y = 100
integer width = 329
integer height = 84
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ"
end type

event clicked;f_open_help ("w_pipeline_sp")

end event

type cb_close from commandbutton within w_pipeline_sp
integer x = 1920
integer y = 100
integer width = 329
integer height = 84
integer taborder = 30
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

type cb_execute from commandbutton within w_pipeline_sp
integer x = 709
integer y = 100
integer width = 512
integer height = 84
integer taborder = 20
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
Long				ll_Start, ll_End
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
OpenWithParm(w_pipe_status, "新規テーブルを作成し、データをロードしています。")

// Set the data object based on the radio button checked.
If rb_query.Checked Then
	lp_Create.DataObject = "p_create_full_sales_orders" 
Else
	lp_Create.DataObject = "p_create_full_sales_orders_sp" 
End If

// Execute the pipe.
// Get the time for a total elapsed time.
ll_Start = CPU()

li_RC = lp_Create.Start(lt_Source, sqlca, dw_errors)

// Get the ending time.
ll_End = CPU()
st_time.Text = String((ll_End - ll_Start)/1000,"##0.0")

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

type rb_sp from radiobutton within w_pipeline_sp
integer x = 41
integer y = 92
integer width = 599
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "ストアド プロシージャ"
boolean checked = true
end type

type rb_query from radiobutton within w_pipeline_sp
integer x = 41
integer y = 156
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
string text = "SQL 文"
end type

type gb_1 from groupbox within w_pipeline_sp
integer x = 18
integer y = 28
integer width = 640
integer height = 224
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "データストア"
borderstyle borderstyle = stylelowered!
end type

