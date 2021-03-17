# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_list_remove_if_bonus.s                          :+:    :+:             #
#                                                      +:+                     #
#    By: ikole <ikole@student.codam.nl>               +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/10 02:08:38 by ikole          #+#    #+#                 #
#    Updated: 2020/03/10 02:08:40 by ikole         ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

global		_ft_list_remove_if
extern		_free

section     .text

_ft_list_remove_if:
    cmp     rdi, 0
    je      return
    cmp     rdx, 0
    je      return
    mov     r8, [rdi]			; current pointer
	mov		r9, r8				; previous pointer
	jmp		compare

next:
    mov     r9, r8
    mov     r8, [r8 + 8]		; move to next list element
	cmp		r8, 0
	je		return

compare:
    push    rdi
    push	rsi
	push	rdx
	push	r9
	push	r8
	mov		rdi, [r8]
	call	rdx					; compare args
	pop		r8
	pop		r9
	pop		rdx
	pop		rsi
	pop		rdi
	cmp		rax, 0				; check result
	jne		next

delete:
	cmp		r8, [rdi]
	je		head_pointer
	mov		r10, [r8 + 8]
	mov		[r9 + 8], r10		; set previous next pointer
	mov		qword[r8 + 8], 0
	push	rdi
	push	r8
	push	r9
	push	rdx
	push	rsi
	mov		rdi, r8
	call	_free				; free old list
	pop		rsi
	pop		rdx
	pop		r9
	pop		r8
	pop		rdi
	mov		r8, r9
	jmp		compare

head_pointer:
	mov		r10, [r8 + 8]
	mov		[rdi], r10		; set previous next pointer
	push	rdi
	push	r8
	push	r9
	push	rdx
	push	rsi
	mov		rdi, r8
	call	_free				; free old list
	pop		rsi
	pop		rdx
	pop		r9
	pop		r8
	pop		rdi
	jmp		next

return:
    ret
