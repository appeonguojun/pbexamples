$PBExportHeader$w_spellcheck.srw
$PBExportComments$OLE 2 サンプル。Excel経由でmleのスペルをチェックする。
forward
global type w_spellcheck from w_center
end type
type st_2 from statictext within w_spellcheck
end type
type st_1 from statictext within w_spellcheck
end type
type cb_close from commandbutton within w_spellcheck
end type
type cb_spell from commandbutton within w_spellcheck
end type
type mle_1 from multilineedit within w_spellcheck
end type
end forward

global type w_spellcheck from w_center
integer x = 265
integer y = 336
integer width = 2313
integer height = 1236
string title = "OLE 2.0 および Excel によるスペルチェック"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_2 st_2
st_1 st_1
cb_close cb_close
cb_spell cb_spell
mle_1 mle_1
end type
global w_spellcheck w_spellcheck

on activate;setredraw(true)
end on

on w_spellcheck.create
int iCurrent
call super::create
this.st_2=create st_2
this.st_1=create st_1
this.cb_close=create cb_close
this.cb_spell=create cb_spell
this.mle_1=create mle_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cb_close
this.Control[iCurrent+4]=this.cb_spell
this.Control[iCurrent+5]=this.mle_1
end on

on w_spellcheck.destroy
call super::destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_close)
destroy(this.cb_spell)
destroy(this.mle_1)
end on

on close;show(w_main)
end on

type st_2 from statictext within w_spellcheck
integer x = 18
integer y = 108
integer width = 2007
integer height = 112
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
string text = "下のエディットボックスに文字を入力し、スペルチェックボタンをクリックして入力のスペルチェックを行ってください。"
boolean focusrectangle = false
end type

type st_1 from statictext within w_spellcheck
integer x = 18
integer y = 4
integer width = 2007
integer height = 104
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS UI Gothic"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
string text = "このサンプルを実行するためには、ご使用の環境に Microsoft Excel がインストールされており、Excel のスペルチェックツールが有効になっている必要があります。"
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_spellcheck
integer x = 1801
integer y = 432
integer width = 439
integer height = 108
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "閉じる(&C)"
end type

on clicked;close(parent)
end on

type cb_spell from commandbutton within w_spellcheck
integer x = 1801
integer y = 264
integer width = 439
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
string text = "スペルチェック(&S)"
end type

event clicked;//This will copy the contents of the mle to a cell in the excel spreadsheet .
//After the spreadsheet has been spellchecked, its contents will be copied back
//to the mle.

oleobject ole_object
boolean lb_booleanval
any anyval
string ls_holdtype
string ls_holdtext
double ls_doubleval
datetime datetimeval

setpointer(hourglass!)

//create a local ole object
Ole_object = create oleobject

//connect the ole object to excel
If ole_object.ConnectToNewObject("excel.application") <> 0 Then
	Messagebox("OLE エラー","Excel に接続できませんでした。")
	Return
End If

//Insert a new book into the spreadsheet
ole_object.workbooks.add()

//set the first cell to the contents of the mle
ole_object.activesheet.cells(1,1).value = mle_1.text

//invoke the spellchecker
ole_object.activesheet.checkspelling()

//get the results of the spellchecker back
anyval = ole_object.activesheet.cells(1,1).value

//identify the type of data returned. Data returned may be string, numeric, or date
//Find out which one it was and then assign it to a string
ls_holdtype = classname(anyval)
choose case ls_holdtype
    case "boolean"
      lb_booleanval = anyval
      if lb_booleanval then
        ls_holdtext = "TRUE"
      else
        ls_holdtext = "FALSE"
      end if
      
      case "integer", "long", "float", "double", "decimal", "time"
      ls_doubleval   =  anyval
      ls_holdtext = string(ls_doubleval)

      case "string"
      ls_holdtext = anyval

      case "date", "datetime"
      datetimeval = anyval
      ls_holdtext = string(datetimeval)

end choose

//copy the string to the mle
mle_1.text = ls_holdtext

//set the workbook status to saved so you can quit without prompting to save
ole_object.activeworkbook.saved=true

//quit excel
ole_object.application.quit()

//disconnect the object
ole_object.disconnectobject()

//free the memory
destroy ole_object
end event

type mle_1 from multilineedit within w_spellcheck
integer x = 105
integer y = 248
integer width = 1541
integer height = 856
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "ＭＳ Ｐゴシック"
long textcolor = 33554432
integer limit = 255
borderstyle borderstyle = stylelowered!
end type

