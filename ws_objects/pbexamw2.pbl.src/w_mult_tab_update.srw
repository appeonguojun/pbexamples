$PBExportHeader$w_mult_tab_update.srw
$PBExportComments$シングル データウィンドウからマルチ テーブルを更新する方法
forward
global type w_mult_tab_update from w_center
end type
type cb_retrieve from commandbutton within w_mult_tab_update
end type
type cb_close from commandbutton within w_mult_tab_update
end type
type cb_update from commandbutton within w_mult_tab_update
end type
type dw_sale_cust from datawindow within w_mult_tab_update
end type
end forward

global type w_mult_tab_update from w_center
int X=203
int Y=260
int Width=2585
int Height=1399
boolean TitleBar=true
string Title="単一データウィンドウによる複数テーブル更新"
long BackColor=74481808
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
ToolBarAlignment ToolBarAlignment=AlignAtLeft!
event ue_postopen pbm_custom01
cb_retrieve cb_retrieve
cb_close cb_close
cb_update cb_update
dw_sale_cust dw_sale_cust
end type
global w_mult_tab_update w_mult_tab_update

on ue_postopen;dw_sale_cust.settransobject(sqlca)
dw_sale_cust.retrieve()

Commit using Sqlca;
end on

on open;this.postevent("ue_postopen")
end on

on w_mult_tab_update.create
this.cb_retrieve=create cb_retrieve
this.cb_close=create cb_close
this.cb_update=create cb_update
this.dw_sale_cust=create dw_sale_cust
this.Control[]={ this.cb_retrieve,&
this.cb_close,&
this.cb_update,&
this.dw_sale_cust}
end on

on w_mult_tab_update.destroy
destroy(this.cb_retrieve)
destroy(this.cb_close)
destroy(this.cb_update)
destroy(this.dw_sale_cust)
end on

on close;show(w_main)
end on

type cb_retrieve from commandbutton within w_mult_tab_update
int X=1074
int Y=1133
int Width=310
int Height=103
int TabOrder=40
string Text="検索(&R)"
int TextSize=-9
int Weight=400
string FaceName="ＭＳ Ｐゴシック"
FontCharSet FontCharSet=ShiftJIS!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Variable!
end type

on clicked;dw_sale_cust.reset()
dw_sale_cust.retrieve()
Commit using Sqlca;
end on

type cb_close from commandbutton within w_mult_tab_update
int X=1448
int Y=1133
int Width=296
int Height=103
int TabOrder=30
string Text="閉じる(&C)"
int TextSize=-9
int Weight=400
string FaceName="ＭＳ Ｐゴシック"
FontCharSet FontCharSet=ShiftJIS!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Variable!
end type

on clicked;close(parent)

end on

type cb_update from commandbutton within w_mult_tab_update
int X=715
int Y=1133
int Width=296
int Height=103
int TabOrder=20
string Text="更新(&U)"
int TextSize=-9
int Weight=400
string FaceName="ＭＳ Ｐゴシック"
FontCharSet FontCharSet=ShiftJIS!
FontFamily FontFamily=Modern!
FontPitch FontPitch=Variable!
end type

on clicked;int li_rc
string ls_err
string ls_mod

//The DataWindow is setup to update the sales order table first. 
//Perform that update
li_rc =dw_sale_cust.Update(true,false)

If li_rc = 1 Then
	//turn off update of sales_order columns
	ls_mod = "sales_order_order_date.Update=No "
	ls_mod= ls_mod + "sales_order_sales_rep.Update=No "
	ls_mod= ls_mod + "sales_order_region.Update=No "
	ls_mod= ls_mod + "sales_order_id.Key=No "
		
	//make customer table the new update table and set its key.
	ls_mod= ls_mod + "DataWindow.Table.UpdateTable='customer' "
	ls_mod= ls_mod + "customer_id.Key=Yes "

	//Turn on update for customer columns
	ls_mod= ls_mod + "customer_fname.Update=Yes "
	ls_mod= ls_mod + "customer_lname.Update=Yes "
	ls_mod= ls_mod + "customer_address.Update=Yes "
	ls_mod= ls_mod + "customer_city.Update=Yes "
	ls_mod= ls_mod + "customer_state.Update=Yes "
	ls_mod= ls_mod + "customer_zip.Update=Yes "
	ls_mod= ls_mod + "customer_phone.Update=Yes "

	//update DataWindow and check return code
	ls_err = dw_sale_cust.modify(ls_mod)
	If ls_err <> "" Then Messagebox("データウィンドウ更新エラー",ls_err)

	//Update the customer table
	li_rc = dw_sale_cust.Update()
	If li_rc = 1Then
		COMMIT using sqlca;
		If sqlca.sqlcode <> 0 Then
			Messagebox("コミットエラー",Sqlca.sqlerrtext)
		End If
	else
		Messagebox("顧客テーブルの更新に失敗しました","売上受注テーブルと 顧客テーブルへの" +&
			"変更をロールバックします")
		ROLLBACK using sqlca;
	End If
Else //the update of sales order failed... display message and rollback changed
	Messagebox("売上受注テーブルの更新に失敗しました","売上受注テーブルへの変更を" +&
		"ロールバックします")
	ROLLBACK using sqlca;
End If


//Reset the DataWindow back to its original state.
//turn on update of sales_order columns
ls_mod = "sales_order_order_date.Update=Yes "
ls_mod= ls_mod + "sales_order_sales_rep.Update=Yes "
ls_mod= ls_mod + "sales_order_region.Update=Yes "
ls_mod= ls_mod + "DataWindow.Table.UpdateTable='sales_order' "
ls_mod= ls_mod + "sales_order_id.Key=Yes "	

//Turn off update for customer columns
ls_mod= ls_mod + "customer_fname.Update=No "
ls_mod= ls_mod + "customer_lname.Update=No "
ls_mod= ls_mod + "customer_address.Update=No "
ls_mod= ls_mod + "customer_city.Update=No "
ls_mod= ls_mod + "customer_state.Update=No "
ls_mod= ls_mod + "customer_zip.Update=No "
ls_mod= ls_mod + "customer_phone.Update=No "
ls_mod= ls_mod + "customer_id.Key=No "

//update DataWindow and check return code
ls_err = dw_sale_cust.modify(ls_mod)
If ls_err <> "" Then Messagebox("データウィンドウ変更エラー",ls_err)
end on

type dw_sale_cust from datawindow within w_mult_tab_update
int X=22
int Y=20
int Width=2500
int Height=1037
int TabOrder=10
string DataObject="d_sales_cust_update"
BorderStyle BorderStyle=StyleRaised!
boolean VScrollBar=true
boolean LiveScroll=true
end type

