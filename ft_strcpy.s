# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_strcpy.s                                        :+:    :+:             #
#                                                      +:+                     #
#    By: ikole <ikole@student.codam.nl>               +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/09 11:36:01 by ikole          #+#    #+#                 #
#    Updated: 2020/03/09 11:36:02 by ikole         ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

global  _ft_strcpy

section .text

_ft_strcpy:
    mov		rax, -1
	cmp		byte[rsi], 0
    jne		loop


loop:
	inc		rax
	mov		r8b, [rsi + rax]
	mov		byte[rdi + rax], r8b
	cmp		byte[rsi + rax], 0
	jne		loop
	mov		rax, rdi
	ret
