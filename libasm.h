/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   libasm.h                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: ikole <ikole@student.codam.nl>               +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/03/06 10:52:28 by ikole          #+#    #+#                */
/*   Updated: 2020/03/09 22:35:18 by ikole         ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <stdio.h>
# include <stdlib.h>
# include <unistd.h>
# include <string.h>
# include <fcntl.h>

typedef struct	s_list
{
	void			*data;
	struct s_list	*next;
} 				t_list;

extern size_t	ft_strlen(const char *s);
extern char		*ft_strcpy(char * dst, const char * src);
extern int		ft_strcmp(const char *s1, const char *s2);
extern ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);
extern ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
extern char 	*ft_strdup(const char *s1);
extern int      ft_atoi_base(char *str, char *base);
extern int		ft_list_size(t_list *begin_list);
extern void		ft_list_push_front(t_list **begin_list, void *data);
extern void		ft_list_sort(t_list **begin_list, int (*cmp)());
extern void		ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());

#endif
