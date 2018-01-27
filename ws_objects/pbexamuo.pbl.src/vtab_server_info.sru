$PBExportHeader$vtab_server_info.sru
$PBExportComments$分散処理サンプル プログラムのユーザ オブジェクト タブで、サーバとの接続をモニターするのに使用します。
forward
global type vtab_server_info from UserObject
end type
type cb_1 from commandbutton within vtab_server_info
end type
type dw_1 from datawindow within vtab_server_info
end type
end forward

global type vtab_server_info from UserObject
int Width=2454
int Height=516
boolean Border=true
long BackColor=79416533
long PictureMaskColor=553648127
long TabTextColor=33554432
long TabBackColor=79416533
string PictureName="browseobject!"
string Text="Connection Info."
event ue_update ( )
cb_1 cb_1
dw_1 dw_1
end type
global vtab_server_info vtab_server_info

type variables
//transport itrp_transport
nvo_connection icn_myconnect
boolean ib_busy=false

end variables

forward prototypes
public subroutine of_set_connection (ref connection ac_conn)
end prototypes

event ue_update;//local variables
connectioninfo lcn_info[]
int li_i

if ib_busy then return 

ib_busy = TRUE

// get connection info
icn_myconnect.getserverinfo ( lcn_info )

dw_1.SetRedraw(FALSE)

dw_1.reset()

// loop thru connections 
for li_i = 1 to upperbound(lcn_info)
	dw_1.insertrow(0)
	if lcn_info[li_i].busy then
		dw_1.object.busy[li_i] = 1 
	else
		dw_1.object.busy[li_i] = 2
	end if
	dw_1.object.connecttime[li_i] = lcn_info[li_i].connecttime
	dw_1.object.lastcalltime[li_i] = lcn_info[li_i].lastcalltime
	dw_1.object.callcount[li_i] = lcn_info[li_i].callcount
	dw_1.object.clientid[li_i] = lcn_info[li_i].clientid
	dw_1.object.location[li_i] = lcn_info[li_i].location
	dw_1.object.userid[li_i] = lcn_info[li_i].userid

next

ib_busy = FALSE
dw_1.SetRedraw(TRUE)

end event

public subroutine of_set_connection (ref connection ac_conn);icn_myconnect = ac_conn



end subroutine

on vtab_server_info.create
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={ this.cb_1,&
this.dw_1}
end on

on vtab_server_info.destroy
destroy(this.cb_1)
destroy(this.dw_1)
end on

event constructor;icn_myconnect = create nvo_connection




end event

type cb_1 from commandbutton within vtab_server_info
int X=11
int Y=26
int Width=264
int Height=81
int TabOrder=20
string Text="更新"
int TextSize=-8
int Weight=400
string FaceName="ＭＳ ゴシック"
FontCharSet FontCharSet=ShiftJIS!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Variable!
end type

event clicked;parent.post event ue_update()
end event

type dw_1 from datawindow within vtab_server_info
int X=11
int Y=113
int Width=2393
int Height=369
int TabOrder=10
string DataObject="d_console"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

