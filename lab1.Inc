include WINDOWS.inc

include user32.inc
include kernel32.inc
include RADbg.inc

includelib user32.lib
includelib kernel32.lib

.data
	comp_name	db	200	Dup(0)
	temp_path	db	200	Dup(0)
	arr_size	dd	200
	hello_title	db	' ����������� ������ � 1 ',0
	comp_name_len	db	0
	immediate_operand_not_allowed	dw	3
	smalls	db	0
	bigs	db	0
	not_letters	db	0
	string	db	"not letters:%d",10,13
		db	"small letters: %d",10,13
		db	"big letters: %d",0
	buffer	db	200	Dup(0)
