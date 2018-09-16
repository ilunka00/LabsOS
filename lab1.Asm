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
	;invoke lstrcat, addr comp_name, addr temp_path
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
	
	ret

main endp

end Begin
