# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_strcmp.s                                        :+:    :+:             #
#                                                      +:+                     #
#    By: ikole <ikole@student.codam.nl>               +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/09 11:35:56 by ikole          #+#    #+#                 #
#    Updated: 2020/03/09 11:35:57 by ikole         ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

global _ft_strcmp

section .text

pos_s1:
	add		r8, 256
	jmp		compare

pos_s2:
	add		r9, 256
	jmp		compare

_ft_strcmp:
    mov		rcx, -1

loop:
	inc		rcx
	movsx	r9, byte[rsi + rcx]
	movsx	r8, byte[rdi + rcx]
	cmp		r8, 0
	je		compare
	cmp		r8, r9
	je		loop

compare:
	cmp		r8, 0
	jl		pos_s1
	cmp		r9, 0
	jl		pos_s2
	mov		rax, r8
	sub		rax, r9
	ret
