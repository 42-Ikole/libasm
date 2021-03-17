# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_read.s                                          :+:    :+:             #
#                                                      +:+                     #
#    By: ikole <ikole@student.codam.nl>               +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/09 11:35:50 by ikole          #+#    #+#                 #
#    Updated: 2020/03/09 11:35:51 by ikole         ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

global      _ft_read

section .text

_ft_read:
    mov     rax, 0x02000003
    syscall
    jc		error
    ret

error:
    mov		rax, -1
	ret