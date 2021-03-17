# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_write.s                                         :+:    :+:             #
#                                                      +:+                     #
#    By: ikole <ikole@student.codam.nl>               +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/09 11:36:18 by ikole          #+#    #+#                 #
#    Updated: 2020/03/09 11:36:19 by ikole         ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

global _ft_write

section .text

_ft_write:
    mov     rax, 0x02000004
    syscall
    jc		error
    ret

error:
    mov		rax, -1
	ret
