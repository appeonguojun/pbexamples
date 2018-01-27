$PBExportHeader$w_datastore_share.srw
$PBExportComments$データストアを使用して、データウィンドウのデータを共用します。
forward
global type w_datastore_share from w_center
end type
type mle_inst from multilineedit within w_datastore_share
end type
type rb_4 from radiobutton within w_datastore_share
end type
type rb_3 from radiobutton within w_datastore_share
end type
type rb_2 from radiobutton within w_datastore_share
end type
type rb_1 from radiobutton within w_datastore_share
end type
type cb_help from commandbutton within w_datastore_share
end type
type cb_close from commandbutton within w_datastore_share
end type
type dw_1 from datawindow within w_datastore_share
end type
type gb_1 from groupbox within w_datastore_share
end type
end forward

global type w_datastore_share from w_center
integer x = 4
integer y = 64
integer width = 2964
integer height = 1419
string title = "データストアと ShareData 関数"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen ( )
mle_inst mle_inst
rb_4 rb_4
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
cb_help cb_help
cb_close cb_close
dw_1 dw_1
gb_1 gb_1
end type
global w_datastore_share w_datastore_share

type variables
DataStore	ids_1, ids_2, ids_3, ids_4
end variables

event ue_postopen;SetPointer(HourGlass!)

ids_1.SetTransObject(sqlca)
ids_1.Retrieve()
ids_2.SetTransObject(sqlca)
ids_2.Retrieve()
ids_3.SetTransObject(sqlca)
ids_3.Retrieve()
ids_4.SetTransObject(sqlca)
ids_4.Retrieve()

mle_inst.Visible = False

end event

event open;call super::open;ids_1 = Create DataStore
ids_2 = Create DataStore
ids_3 = Create DataStore
ids_4 = Create DataStore

ids_1.DataObject = "d_compute_in_attribute"
ids_2.DataObject = "d_contact_list_protected"
ids_3.DataObject = "d_empl_employment_data"
ids_4.DataObject = "d_employees_by_dept"

Post Event ue_postopen()

end event

event close;Destroy ids_1
Destroy ids_2
Destroy ids_3
Destroy ids_4

Show(w_main)

end event

on w_datastore_share.create
this.mle_inst=create mle_inst
this.rb_4=create rb_4
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cb_help=create cb_help
this.cb_close=create cb_close
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={ this.mle_inst,&
this.rb_4,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.cb_help,&
this.cb_close,&
this.dw_1,&
this.gb_1}
end on

on w_datastore_share.destroy
destroy(this.mle_inst)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cb_help)
destroy(this.cb_close)
destroy(this.dw_1)
destroy(this.gb_1)
end on

type mle_inst from multilineedit within w_datastore_share
integer x = 744
integer y = 441
integer width = 856
integer height = 149
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "データストアにデータを読み込んでいます。お待ちください。"
boolean displayonly = true
borderstyle borderstyle = styleraised!
end type

type rb_4 from radiobutton within w_datastore_share
event clicked pbm_bnclicked
integer x = 2196
integer y = 320
integer width = 632
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "d_employees_by_dept"
end type

event clicked;dw_1.DataObject = ids_4.DataObject

ids_4.ShareData(dw_1)
dw_1.HScrollBar = True

end event

type rb_3 from radiobutton within w_datastore_share
event clicked pbm_bnclicked
integer x = 2196
integer y = 242
integer width = 672
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "d_empl_employment_data"
end type

event clicked;DataWindowChild	ldwc_Target, ldwc_Source

dw_1.DataObject = ids_3.DataObject

ids_3.ShareData(dw_1)
dw_1.HScrollBar = False

// Share the DropDownDataWindow
ids_3.GetChild("dept_id", ldwc_Source)
dw_1.GetChild("dept_id", ldwc_Target)

ldwc_Source.ShareData(ldwc_Target)

end event

type rb_2 from radiobutton within w_datastore_share
event clicked pbm_bnclicked
integer x = 2196
integer y = 164
integer width = 628
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "d_contact_list_protected"
end type

event clicked;dw_1.DataObject = ids_2.DataObject

ids_2.ShareData(dw_1)
dw_1.HScrollBar = True

end event

type rb_1 from radiobutton within w_datastore_share
integer x = 2196
integer y = 89
integer width = 596
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
string text = "d_compute_in_attribute"
end type

event clicked;dw_1.DataObject = ids_1.DataObject

ids_1.ShareData(dw_1)
dw_1.HScrollBar = True

end event

type cb_help from commandbutton within w_datastore_share
integer x = 2360
integer y = 644
integer width = 324
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

event clicked;f_open_help ("w_datastore_share")

end event

type cb_close from commandbutton within w_datastore_share
integer x = 2360
integer y = 501
integer width = 324
integer height = 85
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

event clicked;Close(Parent)

end event

type dw_1 from datawindow within w_datastore_share
integer x = 8
integer y = 21
integer width = 2136
integer height = 1237
integer taborder = 10
boolean vscrollbar = true
boolean livescroll = true
end type

type gb_1 from groupbox within w_datastore_share
integer x = 2168
integer y = 21
integer width = 712
integer height = 409
integer taborder = 20
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

