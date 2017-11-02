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

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

includelib p:\masm32\lib\ca296.lib
includelib kernel32.lib
includelib user32.lib
includelib msvcrt.lib


;
; Data & Code
;

N EQU 100

.data

.code
	main:nop

		invoke version
		invoke randomArray,N

		push N
		push eax
		call maximum

		invoke writeInteger,eax
		invoke ExitProcess,0

	maximum:
		push ebp
		mov  ebp,esp
		sub  esp,8


		;;;;;;
		; max = array[0]
		mov eax,[ebp+8]
		mov eax,[eax]
		mov [ebp-4],eax

		; i = 1
		mov	eax,1
		mov [ebp-8],eax

	startLoop:
		; size <= i
		mov eax,[ebp+12]
		cmp eax,[ebp-8]
		jle loopOver
		
		; array[i] > max
		mov eax,[ebp-8]
		sal eax,2
		add eax,[ebp+8]
		mov eax,[eax]
		cmp eax,[ebp-4]
		jle continue
		
		; max = array[i]
		mov [ebp-4],eax

	continue:
		; i++
		inc dword ptr [ebp-8]

		jmp startLoop

	loopOver:
		mov eax,[ebp-4]

		mov esp,ebp
		pop ebp
		ret 8
	end main
	                                                                 