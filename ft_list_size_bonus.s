# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_list_size_bonus.s                               :+:    :+:             #
#                                                      +:+                     #
#    By: ikole <ikole@student.codam.nl>               +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/09 12:56:49 by ikole          #+#    #+#                 #
#    Updated: 2020/03/09 22:10:31 by ikole         ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

global		_ft_list_size

section		.text

_ft_list_size:
	mov		rax, 0
	cmp		rdi, 0
	je		empty
	mov		r8,	rdi

loop:
	inc		rax
	mov		r8, [r8 + 8]
	cmp		r8, 0
	jne		loop
	ret

empty:
	mov		rax, 0
	ret
