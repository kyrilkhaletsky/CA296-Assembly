.data
array			DWORD	N DUP(1,2,2,1,3)
num				DWORD	0
i		DWORD	0


.code
	main:nop

		invoke writeArray, ADDR array, N
		invoke readInteger
		mov num, eax
		
		push num
		push N
		push OFFSET array

		call sum
		
		invoke writeInteger, eax

		invoke Sleep, 5000
		invoke ExitProcess,0



	end main


sum:
		push ebp
		mov ebp, esp

		mov eax, i
		mov [ebp-4], eax

		;; set pointer
		mov eax, 0
		mov [ebp-8], eax

		loopy:
				mov eax, [ebp - 8]
				cmp eax, [ebp + 12]
				je exit

				mov eax, [ebp - 8]
				sal eax, 2
				add eax, [ebp + 8]
				mov eax, [eax]
				
				cmp [ebp+16], eax

				je total
				inc dword ptr [ebp-8]
				jmp loopy
		
		total:
				inc i
				inc dword ptr [ebp-8]
				jmp loopy


	exit:
		mov eax, i
		pop ebp
		ret 

end sum