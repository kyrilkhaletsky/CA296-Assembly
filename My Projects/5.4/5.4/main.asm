;
; CA296 Console Template
; Version 1
;

;
; Preamble
;

.586
.model flat,stdcall
.stack 4096
option casemap:none

include     c:\masm32\include\windows.inc
include     c:\masm32\include\kernel32.inc
include		c:\masm32\include\user32.inc
include		c:\masm32\include\msvcrt.inc
include		c:\masm32\include\ca296.inc

includelib c:\masm32\lib\ca296.lib
includelib kernel32.lib
includelib user32.lib
includelib msvcrt.lib


;
; Data & Code
;

.data
n			DWORD	0
r			DWORD	0
x			DWORD	2
qTotal		DWORD	0
rTotal		DWORD	0
message1	BYTE	'Enter n (>=2)',0
message2	BYTE	'Enter r',0
message		BYTE	'Quotient is %d and Remainder is %d',0

.code
	main:nop

		invoke readIntegerWithMessage,ADDR message1
		mov n,eax
		invoke readIntegerWithMessage,ADDR message2
		mov r,eax

		mov eax,x
		mov edx,0
		startLoop:
			cmp eax,n 
			ja endLoop

			div r
			
			add qTotal,eax
			add rTotal,edx

			
			inc x
			mov eax,x
			mov edx,0
			jmp startLoop
		endLoop:
		
		invoke crt_printf, ADDR message,qTotal,rTotal
		invoke Sleep, 5000
		invoke ExitProcess,0

	end main
