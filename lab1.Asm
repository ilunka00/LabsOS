.386
.model flat,STDCALL
option casemap :none  ;case sensitive

include lab1.inc
include RADbg.inc
.code
Begin:
	call main
	
invoke ExitProcess,NULL


main proc
	invoke GetComputerName,addr comp_name, addr arr_size
	invoke GetTempPath,addr arr_size, addr temp_path
	invoke MessageBox,0,addr comp_name, addr hello_title, MB_OK
	invoke MessageBox,0,addr temp_path, addr hello_title, MB_OK
	invoke lstrlen,addr comp_name
	mov ecx, eax
    mov edx, 0
    div immediate_operand_not_allowed
    sub ecx,edx
    
	
exchange:
	dec ecx
	mov al,comp_name[ecx]
	mov ah,temp_path[ecx]
	mov temp_path[ecx],al
	mov comp_name[ecx],ah
	dec ecx
	loop exchange
	
	invoke MessageBox,0,addr comp_name, addr hello_title, MB_OK
	invoke MessageBox,0,addr temp_path, addr hello_title, MB_OK
	invoke lstrcat, addr comp_name, addr temp_path
	invoke lstrlen,addr comp_name
	mov ecx, eax
	mov eax,0
		mov edx,0
	mov esi,0
big_small:
	cmp comp_name[ecx-1],'A'
	jae CHECK2
	cmp comp_name[ecx-1],'a'
	jae check2
	jmp not_letter
CHECK2:	
	cmp comp_name[ecx-1],'Z'
	jbe big
	cmp comp_name[ecx-1],'a'
	jae check2
	jmp not_letter
check2:
	cmp comp_name[ecx-1],'z'
	jbe small
	jmp not_letter
big:
	inc eax
	jmp next_iteration
small:
	inc esi
	jmp next_iteration
not_letter:
	inc edx
next_iteration:
	loop big_small
	mov smalls,esi
	mov bigs,eax
	mov not_letters,edx
	
	ret

main endp

end Begin
