extern _GetProcAddress@8



;--------------------------------------
; ALL you fucking data store here!
;--------------------------------------
section .data
	msg db 'Hello, world!', 0



;--------------------------------------
; my pseudo ffi
;--------------------------------------
section .text

global _Callf@16
_Callf@16:
	push ebp
	push esi
	mov ebp, esp

	;ebp+0	- esi
	;ebp+4  - ebp
	;ebp+8  - ret addr
	;ebp+12 - h
	;ebp+16 - const char*
	;ebp+20 - DWORD
	;ebp+24 - void**

	push dword [ebp+16]
	push dword [ebp+12]
	call _GetProcAddress@8
	mov edx, eax
	test eax, eax
	jz .f

	mov ecx, [ebp+20]
	mov eax, [ebp+24]
	.while:
		lea esi, [eax + ecx*4-4]
		push dword [esi]
		loop .while
	call edx
	jmp .ok

	.f:
		mov eax, 0xFFFFFFFF
	.ok:
	pop esi
	pop ebp
	ret 16
