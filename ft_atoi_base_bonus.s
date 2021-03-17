# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_atoi_base_bonus.s                               :+:    :+:             #
#                                                      +:+                     #
#    By: ikole <ikole@student.codam.nl>               +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/09 22:08:31 by ikole          #+#    #+#                 #
#    Updated: 2020/03/09 22:11:56 by ikole         ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

global  	_ft_atoi_base
default		rel

section	.data
	check_upper	db	"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ", 0
	check_lower	db	"0123456789abcdefghijklmnopqrstuvwxyz", 0

section .text

_ft_atoi_base:
	cmp		rdi, 0
	je		just_return
	cmp		rsi, 0
	je		just_return
	push	r12
	lea		r12, [check_upper]
    mov		rcx, -1

loop:
	inc		rcx							;this is my base value
	mov		r8b, byte[rsi + rcx]
	cmp		r8b, 0
	je		pre_whitespace
	cmp		r8b, byte[r12 + rcx]
	je		loop

lower:
	lea		r12, [check_lower]
	mov		rcx, -1

loop_lower:
	inc		rcx							;this is my base value
	mov		r8b, byte[rsi + rcx]
	cmp		r8b, 0
	je		pre_whitespace
	cmp		r8b, byte[r12 + rcx]
	jne		error
	jmp		loop_lower

pre_whitespace:
	cmp		rcx, 1
	jle		error
	mov		rdx, -1

whitespace:
	inc		rdx								;index in num
	mov		r9b, byte[rdi + rdx]
	cmp		r9b, 9
	jl		check_neg
	cmp		r9b, 32
	je		whitespace
	cmp		r9b, 13
	jg		check_neg
	jmp		whitespace

check_neg:
	mov		rax, 0
	mov		r11, 1
	cmp		r9b, '-'
	je		set_neg
	cmp		r9b, '+'
	je		skip_plus
	jmp		pre_calc

skip_plus:
	inc	 	rdx
	jmp		pre_calc

set_neg:
	mov		r11, -1 						;sgn
	inc		rdx

pre_calc:
	mov		r10, -1							;cur base value

calc:
	inc		r10								;calc base
	cmp		r10, rcx
	jge		return
	mov		r9b, byte[r12 + r10]
	cmp		r9b, 0
	je		error
	cmp		r9b, byte[rdi + rdx]
	jne		calc

set_value:
	cmp		byte[rdi + rdx], 0
	je		return
	imul	rax, rcx
	add		rax, r10
	inc		rdx
	jmp		pre_calc

return:
	pop		r12
	imul	rax, r11
	ret

error:
	pop		r12
	mov		rax, 0
	ret

just_return:
	ret
