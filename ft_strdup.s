# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_strdup.s                                        :+:    :+:             #
#                                                      +:+                     #
#    By: ikole <ikole@student.codam.nl>               +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/09 11:36:06 by ikole          #+#    #+#                 #
#    Updated: 2020/03/09 11:36:07 by ikole         ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

extern	_ft_strlen
extern	_malloc
global	_ft_strdup

section .text

_ft_strdup:
	push	rdi
	call	_ft_strlen
	mov		rdi, rax
	call	_malloc
	cmp		rax, 0
	je 		error
	pop		rdi
	mov		rcx, -1

loop:
	inc		rcx
	mov		r8b, byte[rdi + rcx]
	mov		byte[rax + rcx], r8b
	cmp		r8b, 0
	jne		loop
	ret

error:
	pop		rdi
	ret