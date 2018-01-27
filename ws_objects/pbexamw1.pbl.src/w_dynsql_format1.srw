$PBExportHeader$w_dynsql_format1.srw
$PBExportComments$動的 SQL : 書式 1 サンプル
forward
global type w_dynsql_format1 from w_center
end type
type st_2 from statictext within w_dynsql_format1
end type
type st_1 from statictext within w_dynsql_format1
end type
type dw_cols from datawindow within w_dynsql_format1
end type
type dw_tables from datawindow within w_dynsql_format1
end type
end forward

global type w_dynsql_format1 from w_center
int X=641
int Y=468
int Width=1650
int Height=986
boolean TitleBar=true
string Title="動的SQL: サンプル 1"
string MenuName="m_dynsql_format1"
long BackColor=74481808
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
ToolBarAlignment ToolBarAlignment=AlignAtLeft!
event ue_open pbm_custom01
event ue_create pbm_custom02
event ue_alter pbm_custom03
event ue_drop pbm_custom04
st_2 st_2
st_1 st_1
dw_cols dw_cols
dw_tables dw_tables
end type
global w_dynsql_format1 w_dynsql_format1

type variables
// menuid of the window
m_dynsql_format1   im_menuid

// determines whether the "location" tables was created.
// This will tell us whether to drop the table when the 
// window is closed.
boolean   ib_created
end variables

event ue_open;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Obtain menuid of the window
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
im_menuid = this.menuid

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Set transaction objects for DataWindows
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
sqlca.autocommit = True

dw_tables.SetTransObject (sqlca)
dw_cols.SetTransObject (sqlca)


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Retrieve the column list for the first table in the table list
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if dw_tables.Retrieve() > 0 then
	string ls_string
	ls_string = dw_tables.object.data[1, 1]
	dw_cols.Retrieve (ls_string)
end if

end event

on ue_create;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Create a new table
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string	ls_sql
long	ll_row
window	lw_frame


ls_sql = "create table location " + &
		"(loc_code char(6), " + &
		"state char(2), " + &
		"city char(20), " + &
		"address char(30), " + &
		"zip_code char(5), " + &
		"phone char(10))"


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Show SQL statement in the microhelp
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
lw_frame = this.ParentWindow()
if IsValid(lw_frame) then
	lw_frame.SetMicroHelp("動的 SQL 書式:  " + ls_sql)
end if


execute immediate :ls_sql;

if sqlca.sqlcode = -1 then
	MessageBox("エラー", String (sqlca.sqldbcode) + ":  " + sqlca.sqlerrtext, exclamation!)
else
	ib_created = true

	im_menuid.m_dynamicsql.m_createtablelocations.enabled = false
	im_menuid.m_dynamicsql.m_altertablelocations.enabled = true
	im_menuid.m_dynamicsql.m_droptable.enabled = true

	// Re-retrieve the table and column listings
	if dw_tables.Retrieve() > 0 then
		
		// Find the row in the tables DataWindow where the new locations table is
		ll_row = dw_tables.Find("tname = 'location'", 1, dw_tables.RowCount())
		if ll_row > 0 then
			dw_tables.ScrollToRow(ll_row)
		end if	
	end if
end if
end on

on ue_alter;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Alter the location table by adding a fax column
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string	ls_sql
long	ll_row
window	lw_frame


ls_sql = "alter table location " + &
		"add fax char(10) NULL"


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Show SQL statement in the microhelp
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
lw_frame = this.ParentWindow()
if IsValid(lw_frame) then
	lw_frame.SetMicroHelp("動的 SQL 書式:  " + ls_sql)
end if


execute immediate :ls_sql;

if sqlca.sqlcode = -1 then
	MessageBox("エラー", String (sqlca.sqldbcode) + ":  " + sqlca.sqlerrtext, exclamation!)
else
	im_menuid.m_dynamicsql.m_altertablelocations.enabled = false

	// Find the row in the tables DataWindow where the locations table is.
	ll_row = dw_tables.Find("tname = 'location'", 1, dw_tables.RowCount())

	// Set the current row of the tables DataWindow to the location table to force re-retrieve
	// of all columns.
	if ll_row > 0 then
		if dw_tables.GetRow() <> ll_row then
			dw_tables.ScrollToRow(ll_row)
		else
			//dw_table.TriggerEvent(rowfocuschanged!)
			dw_cols.Retrieve("location")
		end if
	end if	
end if
end on

on ue_drop;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Drop the location table from the database
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string	ls_sql
window	lw_frame


ls_sql = "drop table location"

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Show SQL statement in the microhelp
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
lw_frame = this.ParentWindow()
if IsValid(lw_frame) then
	lw_frame.SetMicroHelp("動的 SQL 書式:  " + ls_sql)
end if


execute immediate :ls_sql;

if sqlca.sqlcode = -1 then
	MessageBox("エラー", String(sqlca.sqldbcode) + ":  " + sqlca.sqlerrtext, exclamation!)
else
	ib_created = false

	im_menuid.m_dynamicsql.m_createtablelocations.enabled = true
	im_menuid.m_dynamicsql.m_altertablelocations.enabled = false
	im_menuid.m_dynamicsql.m_droptable.enabled = false

	// Re-retrieve the table and column listings
	if dw_tables.Retrieve() > 0 then
		dw_tables.SetRow(1)
	end if
end if

end on

on close;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// If the location table was created, drop it
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if ib_created then
	this.TriggerEvent ("ue_drop")
end if

sqlca.autocommit = False

end on

on open;this.PostEvent ("ue_open")
end on

on w_dynsql_format1.create
if this.MenuName = "m_dynsql_format1" then this.MenuID = create m_dynsql_format1
this.st_2=create st_2
this.st_1=create st_1
this.dw_cols=create dw_cols
this.dw_tables=create dw_tables
this.Control[]={ this.st_2,&
this.st_1,&
this.dw_cols,&
this.dw_tables}
end on

on w_dynsql_format1.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_cols)
destroy(this.dw_tables)
end on

type st_2 from statictext within w_dynsql_format1
integer x = 824
integer y = 68
integer width = 348
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
string Text="カラム一覧:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_dynsql_format1
integer x = 56
integer y = 68
integer width = 408
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
string Text="テーブル一覧:"
boolean focusrectangle = false
end type

type dw_cols from datawindow within w_dynsql_format1
integer x = 820
integer y = 146
integer width = 724
integer height = 594
integer taborder = 20
string dataobject = "d_columns"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_tables from datawindow within w_dynsql_format1
integer x = 56
integer y = 146
integer width = 724
integer height = 594
integer taborder = 10
string dataobject = "d_tables"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Select the current row.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if currentrow > 0 then
	
	// Highlight the current row
	this.SelectRow (0, false)
	this.SelectRow (currentrow, true)

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Retrieve the columns for the current table selected
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	dw_cols.Retrieve (this.object.data[currentrow, 1])
end if
end event

