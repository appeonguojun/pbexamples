$PBExportHeader$w_dw_expressions.srw
$PBExportComments$現バージョンで追加されたデータウィンドウ式を使用します。
forward
global type w_dw_expressions from w_center
end type
type em_to from editmask within w_dw_expressions
end type
type em_from from editmask within w_dw_expressions
end type
type em_ab from editmask within w_dw_expressions
end type
type st_16 from statictext within w_dw_expressions
end type
type st_17 from statictext within w_dw_expressions
end type
type em_tb from editmask within w_dw_expressions
end type
type st_21 from statictext within w_dw_expressions
end type
type em_lb from editmask within w_dw_expressions
end type
type em_ag from editmask within w_dw_expressions
end type
type em_tg from editmask within w_dw_expressions
end type
type em_lg from editmask within w_dw_expressions
end type
type st_23 from statictext within w_dw_expressions
end type
type st_22 from statictext within w_dw_expressions
end type
type em_lr from editmask within w_dw_expressions
end type
type st_19 from statictext within w_dw_expressions
end type
type st_18 from statictext within w_dw_expressions
end type
type em_tr from editmask within w_dw_expressions
end type
type em_ar from editmask within w_dw_expressions
end type
type st_13 from statictext within w_dw_expressions
end type
type st_12 from statictext within w_dw_expressions
end type
type st_10 from statictext within w_dw_expressions
end type
type st_8 from statictext within w_dw_expressions
end type
type st_15 from statictext within w_dw_expressions
end type
type st_14 from statictext within w_dw_expressions
end type
type st_9 from statictext within w_dw_expressions
end type
type sle_in from singlelineedit within w_dw_expressions
end type
type sle_like from singlelineedit within w_dw_expressions
end type
type cb_help from commandbutton within w_dw_expressions
end type
type cb_cancel from commandbutton within w_dw_expressions
end type
type cb_modify from commandbutton within w_dw_expressions
end type
type st_7 from statictext within w_dw_expressions
end type
type st_6 from statictext within w_dw_expressions
end type
type st_5 from statictext within w_dw_expressions
end type
type st_4 from statictext within w_dw_expressions
end type
type st_3 from statictext within w_dw_expressions
end type
type st_2 from statictext within w_dw_expressions
end type
type st_1 from statictext within w_dw_expressions
end type
type dw_1 from datawindow within w_dw_expressions
end type
type st_24 from statictext within w_dw_expressions
end type
type st_20 from statictext within w_dw_expressions
end type
type st_11 from statictext within w_dw_expressions
end type
end forward

global type w_dw_expressions from w_center
integer x = 288
integer y = 4
integer width = 2459
integer height = 1596
string title = "データウィンドウの式"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
em_to em_to
em_from em_from
em_ab em_ab
st_16 st_16
st_17 st_17
em_tb em_tb
st_21 st_21
em_lb em_lb
em_ag em_ag
em_tg em_tg
em_lg em_lg
st_23 st_23
st_22 st_22
em_lr em_lr
st_19 st_19
st_18 st_18
em_tr em_tr
em_ar em_ar
st_13 st_13
st_12 st_12
st_10 st_10
st_8 st_8
st_15 st_15
st_14 st_14
st_9 st_9
sle_in sle_in
sle_like sle_like
cb_help cb_help
cb_cancel cb_cancel
cb_modify cb_modify
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
dw_1 dw_1
st_24 st_24
st_20 st_20
st_11 st_11
end type
global w_dw_expressions w_dw_expressions

on w_dw_expressions.create
int iCurrent
call super::create
this.em_to=create em_to
this.em_from=create em_from
this.em_ab=create em_ab
this.st_16=create st_16
this.st_17=create st_17
this.em_tb=create em_tb
this.st_21=create st_21
this.em_lb=create em_lb
this.em_ag=create em_ag
this.em_tg=create em_tg
this.em_lg=create em_lg
this.st_23=create st_23
this.st_22=create st_22
this.em_lr=create em_lr
this.st_19=create st_19
this.st_18=create st_18
this.em_tr=create em_tr
this.em_ar=create em_ar
this.st_13=create st_13
this.st_12=create st_12
this.st_10=create st_10
this.st_8=create st_8
this.st_15=create st_15
this.st_14=create st_14
this.st_9=create st_9
this.sle_in=create sle_in
this.sle_like=create sle_like
this.cb_help=create cb_help
this.cb_cancel=create cb_cancel
this.cb_modify=create cb_modify
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.st_24=create st_24
this.st_20=create st_20
this.st_11=create st_11
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_to
this.Control[iCurrent+2]=this.em_from
this.Control[iCurrent+3]=this.em_ab
this.Control[iCurrent+4]=this.st_16
this.Control[iCurrent+5]=this.st_17
this.Control[iCurrent+6]=this.em_tb
this.Control[iCurrent+7]=this.st_21
this.Control[iCurrent+8]=this.em_lb
this.Control[iCurrent+9]=this.em_ag
this.Control[iCurrent+10]=this.em_tg
this.Control[iCurrent+11]=this.em_lg
this.Control[iCurrent+12]=this.st_23
this.Control[iCurrent+13]=this.st_22
this.Control[iCurrent+14]=this.em_lr
this.Control[iCurrent+15]=this.st_19
this.Control[iCurrent+16]=this.st_18
this.Control[iCurrent+17]=this.em_tr
this.Control[iCurrent+18]=this.em_ar
this.Control[iCurrent+19]=this.st_13
this.Control[iCurrent+20]=this.st_12
this.Control[iCurrent+21]=this.st_10
this.Control[iCurrent+22]=this.st_8
this.Control[iCurrent+23]=this.st_15
this.Control[iCurrent+24]=this.st_14
this.Control[iCurrent+25]=this.st_9
this.Control[iCurrent+26]=this.sle_in
this.Control[iCurrent+27]=this.sle_like
this.Control[iCurrent+28]=this.cb_help
this.Control[iCurrent+29]=this.cb_cancel
this.Control[iCurrent+30]=this.cb_modify
this.Control[iCurrent+31]=this.st_7
this.Control[iCurrent+32]=this.st_6
this.Control[iCurrent+33]=this.st_5
this.Control[iCurrent+34]=this.st_4
this.Control[iCurrent+35]=this.st_3
this.Control[iCurrent+36]=this.st_2
this.Control[iCurrent+37]=this.st_1
this.Control[iCurrent+38]=this.dw_1
this.Control[iCurrent+39]=this.st_24
this.Control[iCurrent+40]=this.st_20
this.Control[iCurrent+41]=this.st_11
end on

on w_dw_expressions.destroy
call super::destroy
destroy(this.em_to)
destroy(this.em_from)
destroy(this.em_ab)
destroy(this.st_16)
destroy(this.st_17)
destroy(this.em_tb)
destroy(this.st_21)
destroy(this.em_lb)
destroy(this.em_ag)
destroy(this.em_tg)
destroy(this.em_lg)
destroy(this.st_23)
destroy(this.st_22)
destroy(this.em_lr)
destroy(this.st_19)
destroy(this.st_18)
destroy(this.em_tr)
destroy(this.em_ar)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_10)
destroy(this.st_8)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_9)
destroy(this.sle_in)
destroy(this.sle_like)
destroy(this.cb_help)
destroy(this.cb_cancel)
destroy(this.cb_modify)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.st_24)
destroy(this.st_20)
destroy(this.st_11)
end on

event open;call super::open;dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

end event

event close;Show(w_main)

end event

type em_to from editmask within w_dw_expressions
integer x = 1243
integer y = 144
integer width = 352
integer height = 84
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "[currency(7)]"
string displaydata = "P@"
end type

type em_from from editmask within w_dw_expressions
integer x = 713
integer y = 144
integer width = 352
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "[currency(7)]"
string displaydata = ""
end type

type em_ab from editmask within w_dw_expressions
integer x = 1202
integer y = 384
integer width = 123
integer height = 84
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##0"
string displaydata = ""
end type

type st_16 from statictext within w_dw_expressions
integer x = 1339
integer y = 400
integer width = 41
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = ")"
boolean focusrectangle = false
end type

type st_17 from statictext within w_dw_expressions
integer x = 1339
integer y = 488
integer width = 41
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = ")"
boolean focusrectangle = false
end type

type em_tb from editmask within w_dw_expressions
integer x = 1202
integer y = 476
integer width = 123
integer height = 84
integer taborder = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##0"
string displaydata = ""
end type

type st_21 from statictext within w_dw_expressions
integer x = 1339
integer y = 584
integer width = 41
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = ")"
boolean focusrectangle = false
end type

type em_lb from editmask within w_dw_expressions
integer x = 1202
integer y = 568
integer width = 123
integer height = 84
integer taborder = 130
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##0"
string displaydata = ""
end type

type em_ag from editmask within w_dw_expressions
integer x = 1029
integer y = 384
integer width = 123
integer height = 84
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##0"
string displaydata = ""
end type

type em_tg from editmask within w_dw_expressions
integer x = 1029
integer y = 476
integer width = 123
integer height = 84
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##0"
string displaydata = ""
end type

type em_lg from editmask within w_dw_expressions
integer x = 1029
integer y = 568
integer width = 123
integer height = 84
integer taborder = 120
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##0"
string displaydata = ""
end type

type st_23 from statictext within w_dw_expressions
integer x = 992
integer y = 584
integer width = 32
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = ", "
boolean focusrectangle = false
end type

type st_22 from statictext within w_dw_expressions
integer x = 1166
integer y = 584
integer width = 32
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = ", "
boolean focusrectangle = false
end type

type em_lr from editmask within w_dw_expressions
integer x = 859
integer y = 568
integer width = 123
integer height = 84
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##0"
string displaydata = "タ"
end type

type st_19 from statictext within w_dw_expressions
integer x = 992
integer y = 496
integer width = 32
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = ", "
boolean focusrectangle = false
end type

type st_18 from statictext within w_dw_expressions
integer x = 1166
integer y = 496
integer width = 32
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = ", "
boolean focusrectangle = false
end type

type em_tr from editmask within w_dw_expressions
integer x = 859
integer y = 476
integer width = 123
integer height = 84
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##0"
string displaydata = "タ"
end type

type em_ar from editmask within w_dw_expressions
integer x = 859
integer y = 384
integer width = 123
integer height = 84
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
string text = "0"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##0"
string displaydata = "タ"
end type

type st_13 from statictext within w_dw_expressions
integer x = 1161
integer y = 400
integer width = 32
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = ", "
boolean focusrectangle = false
end type

type st_12 from statictext within w_dw_expressions
integer x = 1001
integer y = 400
integer width = 32
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = ", "
boolean focusrectangle = false
end type

type st_10 from statictext within w_dw_expressions
integer x = 448
integer y = 584
integer width = 233
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "休職中:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_8 from statictext within w_dw_expressions
integer x = 489
integer y = 496
integer width = 192
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "退職:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_15 from statictext within w_dw_expressions
integer x = 1641
integer y = 248
integer width = 192
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = ") 青"
boolean focusrectangle = false
end type

type st_14 from statictext within w_dw_expressions
integer x = 1691
integer y = 156
integer width = 192
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "黄色"
boolean focusrectangle = false
end type

type st_9 from statictext within w_dw_expressions
integer x = 1696
integer y = 64
integer width = 142
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "赤"
boolean focusrectangle = false
end type

type sle_in from singlelineedit within w_dw_expressions
integer x = 617
integer y = 240
integer width = 983
integer height = 72
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_like from singlelineedit within w_dw_expressions
integer x = 709
integer y = 56
integer width = 891
integer height = 72
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_help from commandbutton within w_dw_expressions
integer x = 2048
integer y = 320
integer width = 350
integer height = 84
integer taborder = 160
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "ヘルプ(&H)"
end type

event clicked;f_open_help ("w_dw_expressions")

end event

type cb_cancel from commandbutton within w_dw_expressions
integer x = 2048
integer y = 180
integer width = 350
integer height = 84
integer taborder = 150
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "キャンセル(&C)"
boolean cancel = true
end type

event clicked;Close(Parent)

end event

type cb_modify from commandbutton within w_dw_expressions
integer x = 2048
integer y = 52
integer width = 350
integer height = 84
integer taborder = 140
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "変更(&M)"
end type

event clicked;Double	ldb_From, ldb_To, ldb_Ar, ldb_Ag, ldb_Ab, ldb_Tr, ldb_Tg, ldb_Tb, ldb_Lr, ldb_Lg, ldb_Lb
Long		ll_WindowText

ll_WindowText = st_1.TextColor

If Trim(sle_like.Text) <> "" Then
	dw_1.Object.employee_emp_lname.Color = "0~tIf( employee_emp_lname LIKE '" + sle_like.Text + "', &
																	RGB(255, 0, 0), " + String(ll_WindowText) + ")"
End If

em_from.GetData(ldb_From)
em_to.GetData(ldb_To)
dw_1.Object.employee_salary.Color = "0~tIf( employee_salary BETWEEN " + String(ldb_From) + " And " + String(ldb_To) + ", &
																RGB(255, 255, 0), " + String(ll_WindowText) + ")"

If Trim(sle_in.Text) <> "" Then
	dw_1.Object.employee_emp_id.Color = "0~tIf( employee_emp_id in (" + sle_in.Text + "), &
																	RGB(0, 0, 255), " + String(ll_WindowText) + ")"
End If

em_ar.GetData(ldb_Ar)
em_ag.GetData(ldb_Ag)
em_ab.GetData(ldb_Ab)
em_tr.GetData(ldb_Tr)
em_tg.GetData(ldb_Tg)
em_tb.GetData(ldb_Tb)
em_lr.GetData(ldb_Lr)
em_lg.GetData(ldb_Lg)
em_lb.GetData(ldb_Lb)
dw_1.Object.employee_status.Color = "0~tCASE(employee_status WHEN 'A' Then RGB(" + String(ldb_Ar) + "," + &
																String(ldb_Ag) + "," + String(ldb_Ab) + ") " + &
														"WHEN 'T' Then RGB(" + String(ldb_Tr) + "," + String(ldb_Tg) + "," + &
																String(ldb_Tb) + ") " + &
														"WHEN 'L' Then RGB(" + String(ldb_Lr) + "," + String(ldb_Lg) + "," + &
																String(ldb_Lb) + ") Else " + String(ll_WindowText) + ")"

end event

type st_7 from statictext within w_dw_expressions
integer x = 206
integer y = 404
integer width = 475
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "勤務状況: 就業中:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within w_dw_expressions
integer y = 324
integer width = 631
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "CASE式とRGB関数:"
boolean focusrectangle = false
end type

type st_5 from statictext within w_dw_expressions
integer x = 215
integer y = 248
integer width = 393
integer height = 60
integer textsize = -9



integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "従業員ID IN ("
boolean focusrectangle = false
end type

type st_4 from statictext within w_dw_expressions
integer x = 1120
integer y = 156
integer width = 110
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "AND"
boolean focusrectangle = false
end type

type st_3 from statictext within w_dw_expressions
integer x = 343
integer y = 156
integer width = 407
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "給与 BETWEEN"
boolean focusrectangle = false
end type

type st_2 from statictext within w_dw_expressions
integer x = 343
integer y = 64
integer width = 361
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "姓 LIKE"
boolean focusrectangle = false
end type

type st_1 from statictext within w_dw_expressions
integer x = 32
integer y = 12
integer width = 370
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "SQL 表記:"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_dw_expressions
integer x = 110
integer y = 712
integer width = 2231
integer height = 720
string dataobject = "d_salary_adm"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_24 from statictext within w_dw_expressions
integer x = 727
integer y = 584
integer width = 128
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "RGB("
boolean focusrectangle = false
end type

type st_20 from statictext within w_dw_expressions
integer x = 731
integer y = 496
integer width = 128
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "RGB("
boolean focusrectangle = false
end type

type st_11 from statictext within w_dw_expressions
integer x = 727
integer y = 400
integer width = 128
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "RGB("
boolean focusrectangle = false
end type

