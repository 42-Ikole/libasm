# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_list_push_front_bonus.s                         :+:    :+:             #
#                                                      +:+                     #
#    By: ikole <ikole@student.codam.nl>               +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/09 17:02:31 by ikole          #+#    #+#                 #
#    Updated: 2020/03/10 02:19:41 by ikole         ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

global         _ft_list_push_front
extern         _malloc

section .text

_ft_list_push_front:
	cmp			rdi, 0
	je			error
	push		rsi
	push		rcx
	push 		rdi
	mov			rdi, 16
	call		_malloc
	pop			rdi
	pop			rcx
	pop			rsi
	cmp			rax, 0
	je			error
	mov			[rax], rsi				;set data
	mov			r9, [rdi]				;set next pointer
	mov			[rax + 8], r9
	mov			[rdi], rax
	ret

error:
	ret