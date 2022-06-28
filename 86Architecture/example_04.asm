global _start

section .text

_start:

	push 21				; push 21 to stack 28  ; moves stack from 32 to 28
	call times2			; call function times2 ; creates a return address pointer ; moves stack from 28 t 24
	mov ebx, eax		; Assign ebx register with 42 ; stadout file descriptor
	mov eax, 1			; sys_exit system call
	int 0x80			; perform a system call
	
times2:
	push ebp			; push ebp to stack 20 ; moves stack from 28 to 24
	mov ebp, esp		; Change the ebp register to 20
	mov eax, [ebp+8]	; Change the value of eax register to 21 from the value of stack 28
	add eax, eax		; Assign 21 + 21 to eax register
	mov esp, ebp		; Change the esp register to 20
	pop ebp				; Pull the value of 123 from stack 20 to ebp register	; moves stack from 20 to 24
	ret					; return the value 24 to the esp register

; Exit stauts 42: network read failed

;;; Visualization

;; FIRST PHASE

; ESP = 32
; EBP = 123
; EAX = 0
; [00] 0
; [04] 0
; [08] 0
; [12] 0
; [16] 0
; [20] 0
; [24] 0
; [28] 0
; [32] 0


;; SECOND PHASE

; ESP = 20
; EBP = 20
; EAX = 42
; [00] 0
; [04] 0
; [08] 0
; [12] 0
; [16] 0
; [20] 123
; [24] * return address
; [28] 21
; [32] 0


;; THIRD PHASE

; ESP = 24
; EBP = 123
; EAX = 42
; [00] 0
; [04] 0
; [08] 0
; [12] 0
; [16] 0
; [20] 123
; [24] * return address
; [28] 21
; [32] 0