$PBExportHeader$w_puzzle_thumnail.srw
$PBExportComments$PowerPuzzle の完成図
forward
global type w_puzzle_thumnail from w_center
end type
type p_1 from picture within w_puzzle_thumnail
end type
end forward

global type w_puzzle_thumnail from w_center
integer x = 4
integer y = 4
integer width = 616
integer height = 626
string title = "完成図"
long backcolor = 79416533
toolbaralignment toolbaralignment = alignatleft!
p_1 p_1
end type
global w_puzzle_thumnail w_puzzle_thumnail

on w_puzzle_thumnail.create
int iCurrent
call super::create
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_1
end on

on w_puzzle_thumnail.destroy
call super::destroy
destroy(this.p_1)
end on

type p_1 from picture within w_puzzle_thumnail
integer x = 8
integer y = 11
integer width = 560
integer height = 505
string picturename = "logo.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

