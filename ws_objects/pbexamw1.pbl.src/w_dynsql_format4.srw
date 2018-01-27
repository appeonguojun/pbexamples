$PBExportHeader$w_dynsql_format4.srw
$PBExportComments$動的 SQL : 書式 4 サンプル
forward
global type w_dynsql_format4 from w_center
end type
type st_3 from statictext within w_dynsql_format4
end type
type st_2 from statictext within w_dynsql_format4
end type
type dw_out_parms from datawindow within w_dynsql_format4
end type
type dw_in_parms from datawindow within w_dynsql_format4
end type
type st_1 from statictext within w_dynsql_format4
end type
type mle_sql from multilineedit within w_dynsql_format4
end type
end forward

global type w_dynsql_format4 from w_center
int X=235
int Y=269
int Width=2443
int Height=1386
boolean TitleBar=true
string Title="動的 SQL: サンプル 4"
string MenuName="m_dynsql_format4"
long BackColor=74481808
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
ToolBarAlignment ToolBarAlignment=AlignAtLeft!
event ue_describe pbm_custom01
event ue_execute pbm_custom02
st_3 st_3
st_2 st_2
dw_out_parms dw_out_parms
dw_in_parms dw_in_parms
st_1 st_1
mle_sql mle_sql
end type
global w_dynsql_format4 w_dynsql_format4

type variables
declare ic_cursor dynamic cursor for sqlsa;

// menuid of the window
m_dynsql_format4	im_menuid
end variables

event ue_describe;int					i
long				ll_row
string				ls_type


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Prepare the dynamic staging area 
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
prepare sqlsa from :mle_sql.text;
if sqlca.sqlcode = -1 then
	MessageBox ("Prepare エラー", sqlca.sqlerrtext, exclamation!)
	return
end if


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Describe the dynamic staging area into the dynamic description area
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
describe sqlsa into sqlda;
if sqlca.sqlcode = -1 then
	MessageBox ("Describe エラー", sqlca.sqlerrtext, exclamation!)
	return
end if


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Populate DataWindows to show input parms
// The number & type of input parameters can be obtained through attributes of 
// sqlda (the dynamic description area).  
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_in_parms.Reset()
dw_out_parms.Reset()

for i = 1 to sqlda.NumInputs
	ls_type = ""

	choose case sqlda.InParmType[i]

		case TypeString!
			ls_type = "string"		
	
		case TypeInteger!
			ls_type = "integer"

		case TypeUnknown!
			ls_type = "unknown"

	end choose

	if Len (ls_type) > 0 then
		ll_row = dw_in_parms.InsertRow (0)
		dw_in_parms.object.parm_type[ll_row] = ls_type
	end if
next


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Input parm values should be set before the dynamic SQL is executed
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if sqlda.NumInputs = 0 then
	im_menuid.m_dynamicsql.m_execute.enabled = true
else
	im_menuid.m_dynamicsql.m_execute.enabled = false
end if	
end event

event ue_execute;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 
// Purpose:  Execute the dynamic SQL statement
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string	ls_col_name, &
		ls_type, &
		ls_val
long	ll_required_row, &
		ll_row
int		li_col = 1, &
		i


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Be sure that all input parameters have been assigned values first
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_in_parms.AcceptText()
dw_in_parms.FindRequired(primary!, ll_required_row, li_col, ls_col_name, false)
if ll_required_row > 0 then
	MessageBox("必須フィールド", "実行前に引数を入力して下さい。" + &
					"動的 SQL 書式")
	dw_in_parms.SetFocus()
	dw_in_parms.ScrollToRow(ll_required_row)
end if


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Open the dynamic cursor using the dynamic description area
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
open dynamic ic_cursor using descriptor sqlda;
if sqlca.sqlcode = -1 then
	MessageBox("動的カーソルのオープンに失敗しました。", sqlca.sqlerrtext, exclamation!)
	return
end if


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Fetch rows using the dynamic description area.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_out_parms.Reset()

do while sqlca.sqlcode = 0
	fetch ic_cursor using descriptor sqlda;

	if sqlca.sqlcode = 0 then

		// For each row that is fetched, display the result set data types and values 
		for i = 1 to sqlda.NumOutputs
			ls_type = ""

			choose case sqlda.OutParmType[i]

				case TypeString!
					ls_type = "string"		
					ls_val = GetDynamicString(sqlda, i)
	
				case TypeInteger!, TypeReal!, TypeDouble!, TypeLong!
					ls_type = "integer"
					ls_val = String(GetDynamicNumber (sqlda, i))

				case TypeDate!
					ls_type = "date"
					ls_val = String(GetDynamicDate (sqlda, i))
	
				case TypeDateTime!
					ls_type = "datetime"
					ls_val = String(GetDynamicDateTime (sqlda, i))

				case TypeUnknown!
					ls_type = "unknown"
					ls_val = ""

			end choose

			if Len (ls_type) > 0 then
				ll_row = dw_out_parms.InsertRow (0)
				dw_out_parms.object.parm_type[ll_row] = ls_type
				dw_out_parms.object.parm_val[ll_row] = ls_val
			end if
		next
	end if
loop


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Close the dynamic cursor
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
close ic_cursor;

end event

on w_dynsql_format4.create
if this.MenuName = "m_dynsql_format4" then this.MenuID = create m_dynsql_format4
this.st_3=create st_3
this.st_2=create st_2
this.dw_out_parms=create dw_out_parms
this.dw_in_parms=create dw_in_parms
this.st_1=create st_1
this.mle_sql=create mle_sql
this.Control[]={ this.st_3,&
this.st_2,&
this.dw_out_parms,&
this.dw_in_parms,&
this.st_1,&
this.mle_sql}
end on

on w_dynsql_format4.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_out_parms)
destroy(this.dw_in_parms)
destroy(this.st_1)
destroy(this.mle_sql)
end on

event open;call super::open;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Obtain menuid of this window
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
im_menuid = this.menuid


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Initialize dynamic SQL statement used for this example & parms DataWindows
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
mle_sql.text = "SELECT id, last_name, city, state FROM contact WHERE city = ? and state = ?"

dw_out_parms.object.parm_val.edit.required = 'no'
end event

type st_3 from statictext within w_dynsql_format4
integer x = 1225
integer y = 584
integer width = 306
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "結果集合:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_dynsql_format4
integer x = 41
integer y = 584
integer width = 480
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "検索引数:"
boolean focusrectangle = false
end type

type dw_out_parms from datawindow within w_dynsql_format4
integer x = 1225
integer y = 660
integer width = 1138
integer height = 508
integer taborder = 30
string dataobject = "d_parms"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_in_parms from datawindow within w_dynsql_format4
integer x = 41
integer y = 660
integer width = 1138
integer height = 508
integer taborder = 20
string dataobject = "d_parms"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

on editchanged;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enable menu item that can execute the dynamic sql
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
im_menuid.m_dynamicsql.m_execute.enabled = true
end on

event itemerror;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Return 3 =
// 		Reject the data value but allow the focus to change. 
//			Replace the column value just entered with the value originally in the column.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Return 3
end event

on itemchanged;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Purpose:  Use the SetDynamicParm function to set the value of each input parameter
//			in the dynamic description area
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long	ll_cur_row


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Obtain the current row
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ll_cur_row = this.GetRow()
if ll_cur_row <= 0 then
	return
end if


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Set the input parameter value to the value specified in the DataWindow
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if SetDynamicParm (sqlda, ll_cur_row, this.GetText()) = -1 then
	MessageBox ("エラー", "動的パラメタ設定に失敗しました", exclamation!)
end if
end on

type st_1 from statictext within w_dynsql_format4
integer x = 41
integer y = 60
integer width = 658
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "動的SQL構文:"
boolean focusrectangle = false
end type

type mle_sql from multilineedit within w_dynsql_format4
event ue_char pbm_char
integer x = 41
integer y = 136
integer width = 2327
integer height = 360
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

on ue_char;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// As soon as a character is entered into the multilineedit, changing the SQL statement,
// the dynamic staging area must be prepared again, and described into the dynamic 
// description area.  Therefore, disable the menuitem to execute the dynamic sql
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

im_menuid.m_dynamicsql.m_execute.enabled = false
end on

