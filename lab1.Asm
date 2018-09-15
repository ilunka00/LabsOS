.386
.model flat,STDCALL
option casemap :none  ;case sensitive

include lab1.inc

.code
Begin:
	call main
	
invoke ExitProcess,NULL


main proc
	invoke GetComputerName,addr comp_name, addr arr_size
	invoke GetTempPath,addr arr_size, addr temp_path
	invoke lstrcat, addr comp_name, addr temp_path
	invoke MessageBox,0,addr comp_name, addr hello_title, MB_OK
	ret

main endp

end Begin
