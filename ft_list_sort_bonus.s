global      _ft_list_sort
extern		_ft_list_size

section		.text

_ft_list_sort:
	cmp		rdi, 0
	je		return
	cmp		rsi, 0
	je		return
	mov		r8, [rdi]			; current head->data pointer
	cmp		r8, 0
	je		return
	mov		r9, r8
	jmp		loop

pre_loop:
	mov		r8, [r8 + 8]		; move to next elem
	cmp		r8, 0
	je		return
	mov		r9, r8

loop:
	mov		r9, [r9 + 8]		; next->data pointer
	cmp		r9, 0
	je		pre_loop			; if end inc next pointer
	push	rsi
	push	rdi
	push	rsp
	push	r8
	push	r9
	mov		rax, rsi
	mov		rdi, [r8]
	mov		rsi, [r9]
	call	rax					; call comparison
	pop		r9
	pop		r8
	pop		rsp
	pop		rdi
	pop		rsi
	cmp		rax, 0				; check
	jle		loop

switch_elem:
	mov		rcx, r8
	mov		rdx, r9
	mov		r10, [rcx]
	mov		r11, [rdx]
	mov		[rcx], r11
	mov		[rdx], r10
	jmp		loop

return:
	ret
	