$PBExportHeader$w_select_from_list.srw
$PBExportComments$UO:  Find closest entry in list as user enters search string
forward
global type w_select_from_list from w_center
end type
type uo_1 from u_selection_list within w_select_from_list
end type
type st_return from statictext within w_select_from_list
end type
type st_2 from statictext within w_select_from_list
end type
type st_1 from statictext within w_select_from_list
end type
type rb_states from radiobutton within w_select_from_list
end type
type rb_customer from radiobutton within w_select_from_list
end type
type cb_close from commandbutton within w_select_from_list
end type
type gb_1 from groupbox within w_select_from_list
end type
end forward

global type w_select_from_list from w_center
integer x = 472
integer y = 213
integer width = 1984
integer height = 1515
string title = "Quick Select 検索"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
uo_1 uo_1
st_return st_return
st_2 st_2
st_1 st_1
rb_states rb_states
rb_customer rb_customer
cb_close cb_close
gb_1 gb_1
end type
global w_select_from_list w_select_from_list

event open;call super::open;sqlca.AutoCommit = True

rb_customer.Triggerevent("clicked")
end event

event close;// Close script for w_select_from_list

sqlca.AutoCommit = False

w_main.Show( )
end event

on w_select_from_list.create
int iCurrent
call super::create
this.uo_1=create uo_1
this.st_return=create st_return
this.st_2=create st_2
this.st_1=create st_1
this.rb_states=create rb_states
this.rb_customer=create rb_customer
this.cb_close=create cb_close
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_1
this.Control[iCurrent+2]=this.st_return
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.rb_states
this.Control[iCurrent+6]=this.rb_customer
this.Control[iCurrent+7]=this.cb_close
this.Control[iCurrent+8]=this.gb_1
end on

on w_select_from_list.destroy
call super::destroy
destroy(this.uo_1)
destroy(this.st_return)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.rb_states)
destroy(this.rb_customer)
destroy(this.cb_close)
destroy(this.gb_1)
end on

type uo_1 from u_selection_list within w_select_from_list
integer x = 8
integer y = 100
integer width = 1320
end type

on ue_entry_chosen;call u_selection_list::ue_entry_chosen;// Entry_Chosen Script for UO_1

string	ls_selected_value

ls_selected_value = return_selected ()

if Len (ls_selected_value) = 0  then  ls_selected_value = "Nothing"

st_return.text =  ls_selected_value
end on

on uo_1.destroy
call u_selection_list::destroy
end on

type st_return from statictext within w_select_from_list
integer x = 1348
integer y = 1060
integer width = 552
integer height = 85
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 78682240
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_select_from_list
integer x = 32
integer y = 11
integer width = 1228
integer height = 82
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 78682240
boolean enabled = false
string text = "エンド ユーザにデータリストからデータを選択させるためのユーザ オブジェクト"
boolean focusrectangle = false
end type

type st_1 from statictext within w_select_from_list
integer x = 1364
integer y = 956
integer width = 544
integer height = 107
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 78682240
boolean enabled = false
string text = "ユーザオブジェクトからの戻り値:"
alignment alignment = center!
boolean focusrectangle = false
end type

type rb_states from radiobutton within w_select_from_list
integer x = 1440
integer y = 192
integer width = 356
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 78682240
string text = "都道府県"
end type

on clicked;// Clicked script for cb_search_parts

uo_1.create_datawindow(sqlca, &
	"SELECT state_name FROM states")



end on

type rb_customer from radiobutton within w_select_from_list
integer x = 1440
integer y = 117
integer width = 416
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 78682240
string text = "顧客"
boolean checked = true
end type

on clicked;// Clicked script for cb_search_emps
CHOOSE CASE Lower(Left(sqlca.dbms,2))
	CASE "sy"
		uo_1.create_datawindow(sqlca, &
			"Select  ~"Customer Name~" = (lname + ', ' +  fname) from customer")
	CASE "or"
		uo_1.create_datawindow(sqlca, &
			"Select  (lname || ', ' ||  fname) ~"Customer Name~" from customer")
	CASE ELSE 
		uo_1.create_datawindow(sqlca, &
			"Select string(lname,', ', fname) ~"Customer Name~" from customer")
END CHOOSE

end on

type cb_close from commandbutton within w_select_from_list
integer x = 1528
integer y = 388
integer width = 312
integer height = 96
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

on clicked;//Clicked script for cb_1

Close(parent)
end on

type gb_1 from groupbox within w_select_from_list
integer x = 1412
integer y = 53
integer width = 480
integer height = 260
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 78682240
string text = "テーブル"
end type

