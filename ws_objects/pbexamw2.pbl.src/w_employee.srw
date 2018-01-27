$PBExportHeader$w_employee.srw
$PBExportComments$従業員ビジネス オブジェクトを使用したサンプル
forward
global type w_employee from w_ancestor_one_dw
end type
type cb_about from commandbutton within w_employee
end type
type st_1 from statictext within w_employee
end type
type st_2 from statictext within w_employee
end type
type st_3 from statictext within w_employee
end type
type st_4 from statictext within w_employee
end type
end forward

global type w_employee from w_ancestor_one_dw
integer x = 32
integer y = 320
integer width = 3036
integer height = 1355
string title = "ビジネス クラス オブジェクト"
cb_about cb_about
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
end type
global w_employee w_employee

on w_employee.create
int iCurrent
call w_ancestor_one_dw::create
this.cb_about=create cb_about
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=cb_about
this.Control[iCurrent+2]=st_1
this.Control[iCurrent+3]=st_2
this.Control[iCurrent+4]=st_3
this.Control[iCurrent+5]=st_4
end on

on w_employee.destroy
call w_ancestor_one_dw::destroy
destroy(this.cb_about)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
end on

on close;call w_ancestor_one_dw::close;w_main.Show()
end on

event ue_delete_row;call super::ue_delete_row;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Display error message if trying to delete an employee with active status.
// AncestorReturnValue is the return value of the ue_delete_row event in 
// w_ancestor_one_dw.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

If AncestorReturnValue = -2 Then
	MessageBox ("削除エラー", "就業中の従業員を削除することはできません。")
End If

end event

type cb_close from w_ancestor_one_dw`cb_close within w_employee
integer x = 2456
integer width = 500
end type

type cb_delete from w_ancestor_one_dw`cb_delete within w_employee
integer x = 2456
integer width = 500
end type

type cb_insert from w_ancestor_one_dw`cb_insert within w_employee
integer x = 2456
integer width = 500
end type

type cb_update from w_ancestor_one_dw`cb_update within w_employee
integer x = 2456
integer width = 500
end type

type cb_retrieve from w_ancestor_one_dw`cb_retrieve within w_employee
integer x = 2456
integer width = 500
end type

type dw_1 from w_ancestor_one_dw`dw_1 within w_employee
integer y = 320
integer width = 2376
integer height = 889
string dataobject = "d_employee_required"
end type

on dw_1::ue_create_business_object;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Override the ancestor script.
// Create employee business object.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

iuo_business_object = create u_employee_object
end on

type cb_about from commandbutton within w_employee
integer x = 2456
integer y = 636
integer width = 500
integer height = 100
integer taborder = 70
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "バージョン情報(&A)..."
end type

on clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Display an about box with credits for this example
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

OpenWithParm (w_about_with_parm, "ビジネス クラス オブジェクト@このサンプルで使われているテクニックは~r~n" + &
				"以下の関係者によって提供されました。~r~n" + &
				"Wain Kellum~r~nOmni Training Centers~r~n~r~n" + &
				"Steve Benfield~r~nConsulting Partner~r~nCCS Consulting~r~n981 Woodward Park Drive~r~nSuwanee, GA 30174~r~nPhone: (404) 813-0480~r~nFax: (404) 813-1203")
end on

type st_1 from statictext within w_employee
integer x = 40
integer y = 25
integer width = 936
integer height = 71
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "従業員管理のためのビジネス ルール:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_employee
integer x = 40
integer y = 85
integer width = 1592
integer height = 71
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "1) 新規従業員を登録する場合、既存の従業員IDは使用できない。"
boolean focusrectangle = false
end type

type st_3 from statictext within w_employee
integer x = 40
integer y = 203
integer width = 1320
integer height = 71
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "3) 就業中の従業員は削除できない。"
boolean focusrectangle = false
end type

type st_4 from statictext within w_employee
integer x = 40
integer y = 146
integer width = 1256
integer height = 53
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "2) 既存の従業員を削除する場合は、削除確認を行う。"
boolean focusrectangle = false
end type

