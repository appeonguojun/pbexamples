$PBExportHeader$w_phone_dir.srw
$PBExportComments$タブ コントロールを使用した電話番号帳
forward
global type w_phone_dir from w_center
end type
type cb_help from commandbutton within w_phone_dir
end type
type cb_uo from commandbutton within w_phone_dir
end type
type cb_pages from commandbutton within w_phone_dir
end type
type dw_list from datawindow within w_phone_dir
end type
type cb_close from commandbutton within w_phone_dir
end type
type cb_change from commandbutton within w_phone_dir
end type
type tab_book from tab within w_phone_dir
end type
type tabpage_a from userobject within tab_book
end type
type tabpage_a from userobject within tab_book
end type
type tabpage_b from userobject within tab_book
end type
type tabpage_b from userobject within tab_book
end type
type tabpage_c from userobject within tab_book
end type
type tabpage_c from userobject within tab_book
end type
type tabpage_d from userobject within tab_book
end type
type tabpage_d from userobject within tab_book
end type
type tabpage_e from userobject within tab_book
end type
type tabpage_e from userobject within tab_book
end type
type tabpage_f from userobject within tab_book
end type
type tabpage_f from userobject within tab_book
end type
type tabpage_g from userobject within tab_book
end type
type tabpage_g from userobject within tab_book
end type
type tabpage_h from userobject within tab_book
end type
type tabpage_h from userobject within tab_book
end type
type tabpage_i from userobject within tab_book
end type
type tabpage_i from userobject within tab_book
end type
type tabpage_j from userobject within tab_book
end type
type tabpage_j from userobject within tab_book
end type
type tabpage_k from userobject within tab_book
end type
type tabpage_k from userobject within tab_book
end type
type tab_book from tab within w_phone_dir
tabpage_a tabpage_a
tabpage_b tabpage_b
tabpage_c tabpage_c
tabpage_d tabpage_d
tabpage_e tabpage_e
tabpage_f tabpage_f
tabpage_g tabpage_g
tabpage_h tabpage_h
tabpage_i tabpage_i
tabpage_j tabpage_j
tabpage_k tabpage_k
end type
type tab_uo from tab within w_phone_dir
end type
type tabpage_uoa from u_tab_dir within tab_uo
end type
type tabpage_uoa from u_tab_dir within tab_uo
end type
type tabpage_uob from u_tab_dir within tab_uo
end type
type tabpage_uob from u_tab_dir within tab_uo
end type
type tabpage_uoc from u_tab_dir within tab_uo
end type
type tabpage_uoc from u_tab_dir within tab_uo
end type
type tabpage_uod from u_tab_dir within tab_uo
end type
type tabpage_uod from u_tab_dir within tab_uo
end type
type tabpage_uoe from u_tab_dir within tab_uo
end type
type tabpage_uoe from u_tab_dir within tab_uo
end type
type tabpage_uof from u_tab_dir within tab_uo
end type
type tabpage_uof from u_tab_dir within tab_uo
end type
type tabpage_uog from u_tab_dir within tab_uo
end type
type tabpage_uog from u_tab_dir within tab_uo
end type
type tabpage_uoh from u_tab_dir within tab_uo
end type
type tabpage_uoh from u_tab_dir within tab_uo
end type
type tabpage_uoi from u_tab_dir within tab_uo
end type
type tabpage_uoi from u_tab_dir within tab_uo
end type
type tabpage_uoj from u_tab_dir within tab_uo
end type
type tabpage_uoj from u_tab_dir within tab_uo
end type
type tabpage_uok from u_tab_dir within tab_uo
end type
type tabpage_uok from u_tab_dir within tab_uo
end type
type tab_uo from tab within w_phone_dir
tabpage_uoa tabpage_uoa
tabpage_uob tabpage_uob
tabpage_uoc tabpage_uoc
tabpage_uod tabpage_uod
tabpage_uoe tabpage_uoe
tabpage_uof tabpage_uof
tabpage_uog tabpage_uog
tabpage_uoh tabpage_uoh
tabpage_uoi tabpage_uoi
tabpage_uoj tabpage_uoj
tabpage_uok tabpage_uok
end type
end forward

global type w_phone_dir from w_center
integer width = 3024
integer height = 1892
string title = "顧客のアドレス帳"
long backcolor = 75530368
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen ( )
event ue_filterdw ( string as_letter )
cb_help cb_help
cb_uo cb_uo
cb_pages cb_pages
dw_list dw_list
cb_close cb_close
cb_change cb_change
tab_book tab_book
tab_uo tab_uo
end type
global w_phone_dir w_phone_dir

forward prototypes
public function integer of_changetab (tabposition atb_Position)
end prototypes

event ue_postopen;dw_list.SetRedraw(False)

dw_list.SetTransObject(sqlca)
dw_list.Retrieve()

Trigger Event ue_filterdw("あ")

dw_list.SetRedraw(True)

end event

event ue_filterdw;dw_list.SetFilter("Lower(letter) = '" + Lower(as_Letter) + "'")
dw_list.Filter()
dw_list.GroupCalc()

end event

public function integer of_changetab (tabposition atb_Position);tab_book.TabPosition = atb_Position
tab_uo.TabPosition = atb_Position

Choose Case atb_Position
	Case TabsOnLeft!
		tab_book.PerpendicularText = True
		tab_uo.PerpendicularText = True
		dw_list.X = 240
		dw_list.Y = 26
		dw_list.Width = 2028
		dw_list.Height = 1690
	Case TabsOnRight!
		tab_book.PerpendicularText = True
		tab_uo.PerpendicularText = True
		dw_list.X = 45
		dw_list.Y = 20
		dw_list.Width = 2028
		dw_list.Height = 1690
	Case TabsOnLeftAndRight!
		tab_book.PerpendicularText = True
		tab_uo.PerpendicularText = True
		dw_list.X = 240
		dw_list.Y = 20
		dw_list.Width = 1840
		dw_list.Height = 1690
	Case TabsOnRightAndLeft!
		tab_book.PerpendicularText = True
		tab_uo.PerpendicularText = True
		dw_list.X = 240
		dw_list.Y = 20
		dw_list.Width = 1840
		dw_list.Height = 1690
	Case TabsOnTop!
		tab_book.PerpendicularText = False
		tab_uo.PerpendicularText = False
		dw_list.X = 33
		dw_list.Y = 100
		dw_list.Width = 2250
		dw_list.Height = 1605
	Case TabsOnBottom!
		tab_book.PerpendicularText = False
		tab_uo.PerpendicularText = False
		dw_list.X = 33
		dw_list.Y = 16
		dw_list.Width = 2250
		dw_list.Height = 1605
	Case TabsOnTopAndBottom!
		tab_book.PerpendicularText = False
		tab_uo.PerpendicularText = False
		dw_list.X = 33
		dw_list.Y = 100
		dw_list.Width = 2250
		dw_list.Height = 1522
	Case TabsOnBottomAndTop!
		tab_book.PerpendicularText = False
		tab_uo.PerpendicularText = False
		dw_list.X = 33
		dw_list.Y = 100
		dw_list.Width = 2250
		dw_list.Height = 1522
End Choose

tab_uo.Post Event SelectionChanging(0, tab_uo.SelectedTab)

Return 1

end function

on w_phone_dir.create
int iCurrent
call super::create
this.cb_help=create cb_help
this.cb_uo=create cb_uo
this.cb_pages=create cb_pages
this.dw_list=create dw_list
this.cb_close=create cb_close
this.cb_change=create cb_change
this.tab_book=create tab_book
this.tab_uo=create tab_uo
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_help
this.Control[iCurrent+2]=this.cb_uo
this.Control[iCurrent+3]=this.cb_pages
this.Control[iCurrent+4]=this.dw_list
this.Control[iCurrent+5]=this.cb_close
this.Control[iCurrent+6]=this.cb_change
this.Control[iCurrent+7]=this.tab_book
this.Control[iCurrent+8]=this.tab_uo
end on

on w_phone_dir.destroy
call super::destroy
destroy(this.cb_help)
destroy(this.cb_uo)
destroy(this.cb_pages)
destroy(this.dw_list)
destroy(this.cb_close)
destroy(this.cb_change)
destroy(this.tab_book)
destroy(this.tab_uo)
end on

event open;call super::open;Post Event ue_postopen()
end event

event close;Show(w_main)

end event

type cb_help from commandbutton within w_phone_dir
integer x = 2344
integer y = 469
integer width = 608
integer height = 85
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ(&H)"
end type

event clicked;f_open_help ("w_phone_dir")

end event

type cb_uo from commandbutton within w_phone_dir
integer x = 2344
integer y = 324
integer width = 608
integer height = 85
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ユーザオブジェクト(&U)"
end type

event clicked;Parent.SetRedraw(False)

tab_book.Visible = False
dw_list.Visible = False
tab_uo.Visible = True

Parent.SetRedraw(True)

This.Enabled = False
cb_pages.Enabled = True

end event

type cb_pages from commandbutton within w_phone_dir
integer x = 2344
integer y = 224
integer width = 608
integer height = 85
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
boolean enabled = false
string text = "タブページ(&T)"
end type

event clicked;Parent.SetRedraw(False)

tab_uo.Visible = False
tab_book.Visible = True
dw_list.Visible = True

Parent.SetRedraw(True)

This.Enabled = False
cb_uo.Enabled = True

end event

type dw_list from datawindow within w_phone_dir
integer x = 32
integer y = 100
integer width = 2244
integer height = 1604
integer taborder = 30
string dataobject = "d_cust_phone_dir"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_close from commandbutton within w_phone_dir
integer x = 2344
integer y = 612
integer width = 608
integer height = 85
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "終了(&L)"
boolean cancel = true
end type

event clicked;Close(Parent)

end event

type cb_change from commandbutton within w_phone_dir
integer x = 2344
integer y = 85
integer width = 608
integer height = 85
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "タブ表示位置(&C)..."
end type

event clicked;OpenWithParm(w_tab_position, Parent)

end event

type tab_book from tab within w_phone_dir
integer width = 2304
integer height = 1728
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long backcolor = 74481808
boolean multiline = true
boolean raggedright = true
boolean showpicture = false
boolean createondemand = true
integer selectedtab = 1
tabpage_a tabpage_a
tabpage_b tabpage_b
tabpage_c tabpage_c
tabpage_d tabpage_d
tabpage_e tabpage_e
tabpage_f tabpage_f
tabpage_g tabpage_g
tabpage_h tabpage_h
tabpage_i tabpage_i
tabpage_j tabpage_j
tabpage_k tabpage_k
end type

on tab_book.create
this.tabpage_a=create tabpage_a
this.tabpage_b=create tabpage_b
this.tabpage_c=create tabpage_c
this.tabpage_d=create tabpage_d
this.tabpage_e=create tabpage_e
this.tabpage_f=create tabpage_f
this.tabpage_g=create tabpage_g
this.tabpage_h=create tabpage_h
this.tabpage_i=create tabpage_i
this.tabpage_j=create tabpage_j
this.tabpage_k=create tabpage_k
this.Control[]={this.tabpage_a,&
this.tabpage_b,&
this.tabpage_c,&
this.tabpage_d,&
this.tabpage_e,&
this.tabpage_f,&
this.tabpage_g,&
this.tabpage_h,&
this.tabpage_i,&
this.tabpage_j,&
this.tabpage_k}
end on

on tab_book.destroy
destroy(this.tabpage_a)
destroy(this.tabpage_b)
destroy(this.tabpage_c)
destroy(this.tabpage_d)
destroy(this.tabpage_e)
destroy(this.tabpage_f)
destroy(this.tabpage_g)
destroy(this.tabpage_h)
destroy(this.tabpage_i)
destroy(this.tabpage_j)
destroy(this.tabpage_k)
end on

event selectionchanged;Parent.Post Event ue_filterdw(This.Control[newindex].Text)

end event

type tabpage_a from userobject within tab_book
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
long backcolor = 73955432
string text = "あ"
long tabtextcolor = 33554432
long tabbackcolor = 73955432
end type

type tabpage_b from userobject within tab_book
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
long backcolor = 73955432
string text = "か"
long tabtextcolor = 33554432
long tabbackcolor = 73955432
end type

type tabpage_c from userobject within tab_book
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
long backcolor = 73955432
string text = "さ"
long tabtextcolor = 33554432
long tabbackcolor = 73955432
end type

type tabpage_d from userobject within tab_book
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
long backcolor = 73955432
string text = "た"
long tabtextcolor = 33554432
long tabbackcolor = 73955432
end type

type tabpage_e from userobject within tab_book
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
long backcolor = 73955432
string text = "な"
long tabtextcolor = 33554432
long tabbackcolor = 73955432
end type

type tabpage_f from userobject within tab_book
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
long backcolor = 73955432
string text = "は"
long tabtextcolor = 33554432
long tabbackcolor = 73955432
end type

type tabpage_g from userobject within tab_book
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
long backcolor = 73955432
string text = "ま"
long tabtextcolor = 33554432
long tabbackcolor = 73955432
end type

type tabpage_h from userobject within tab_book
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
long backcolor = 73955432
string text = "や"
long tabtextcolor = 33554432
long tabbackcolor = 73955432
end type

type tabpage_i from userobject within tab_book
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
long backcolor = 73955432
string text = "ら"
long tabtextcolor = 33554432
long tabbackcolor = 73955432
end type

type tabpage_j from userobject within tab_book
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
long backcolor = 73955432
string text = "わ"
long tabtextcolor = 33554432
long tabbackcolor = 73955432
end type

type tabpage_k from userobject within tab_book
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
long backcolor = 73955432
string text = "ん"
long tabtextcolor = 33554432
long tabbackcolor = 73955432
end type

type tab_uo from tab within w_phone_dir
integer width = 2304
integer height = 1728
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long backcolor = 74481808
boolean multiline = true
boolean raggedright = true
boolean showpicture = false
boolean createondemand = true
integer selectedtab = 1
tabpage_uoa tabpage_uoa
tabpage_uob tabpage_uob
tabpage_uoc tabpage_uoc
tabpage_uod tabpage_uod
tabpage_uoe tabpage_uoe
tabpage_uof tabpage_uof
tabpage_uog tabpage_uog
tabpage_uoh tabpage_uoh
tabpage_uoi tabpage_uoi
tabpage_uoj tabpage_uoj
tabpage_uok tabpage_uok
end type

on tab_uo.create
this.tabpage_uoa=create tabpage_uoa
this.tabpage_uob=create tabpage_uob
this.tabpage_uoc=create tabpage_uoc
this.tabpage_uod=create tabpage_uod
this.tabpage_uoe=create tabpage_uoe
this.tabpage_uof=create tabpage_uof
this.tabpage_uog=create tabpage_uog
this.tabpage_uoh=create tabpage_uoh
this.tabpage_uoi=create tabpage_uoi
this.tabpage_uoj=create tabpage_uoj
this.tabpage_uok=create tabpage_uok
this.Control[]={this.tabpage_uoa,&
this.tabpage_uob,&
this.tabpage_uoc,&
this.tabpage_uod,&
this.tabpage_uoe,&
this.tabpage_uof,&
this.tabpage_uog,&
this.tabpage_uoh,&
this.tabpage_uoi,&
this.tabpage_uoj,&
this.tabpage_uok}
end on

on tab_uo.destroy
destroy(this.tabpage_uoa)
destroy(this.tabpage_uob)
destroy(this.tabpage_uoc)
destroy(this.tabpage_uod)
destroy(this.tabpage_uoe)
destroy(this.tabpage_uof)
destroy(this.tabpage_uog)
destroy(this.tabpage_uoh)
destroy(this.tabpage_uoi)
destroy(this.tabpage_uoj)
destroy(this.tabpage_uok)
end on

event selectionchanged;u_tab_dir		luo_Tab

luo_Tab = This.Control[newindex]
luo_Tab.of_retrieve_data(This.Control[newindex].Text)

end event

event selectionchanging;u_tab_dir		luo_Tab

luo_Tab = This.Control[newindex]

luo_Tab.dw_dir.Height = dw_list.Height
luo_Tab.dw_dir.Width = dw_list.Width

end event

type tabpage_uoa from u_tab_dir within tab_uo
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
string text = "あ"
end type

type tabpage_uob from u_tab_dir within tab_uo
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
string text = "か"
end type

type tabpage_uoc from u_tab_dir within tab_uo
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
string text = "さ"
end type

type tabpage_uod from u_tab_dir within tab_uo
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
string text = "た"
end type

type tabpage_uoe from u_tab_dir within tab_uo
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
string text = "な"
end type

type tabpage_uof from u_tab_dir within tab_uo
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
string text = "は"
end type

type tabpage_uog from u_tab_dir within tab_uo
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
string text = "ま"
end type

type tabpage_uoh from u_tab_dir within tab_uo
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
string text = "や"
end type

type tabpage_uoi from u_tab_dir within tab_uo
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
string text = "ら"
end type

type tabpage_uoj from u_tab_dir within tab_uo
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
string text = "わ"
end type

type tabpage_uok from u_tab_dir within tab_uo
integer x = 16
integer y = 85
integer width = 2272
integer height = 1628
string text = "ん"
end type

