/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   Makefile                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gariadno <gariadno@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/11/28 13:11:39 by gariadno          #+#    #+#             */
/*   Updated: 2021/12/21 20:22:19 by gariadno         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

NAME	=	push_swap

CC		=	clang
C_FLAGS	=	-c		\
			-Wall	\
			-Wextra	\
			-Werror	\
			-I${INCLUDE}	\
			-I./${LIB_DIR} 

INCLUDE	=	./include

LIB_DIR	=	libft
LIBFT	=	${LIB_DIR}/libft.a

SRC_DIR	=	src
SRC		=	operations.c\
			sort_few.c	\
			llist.c		\
			check.c		\
			main.c		\
			free.c		\
			sort.c

vpath %.c ${SRC_DIR}

OBJ_DIR	=	obj
OBJ		=	$(patsubst %.c, ${OBJ_DIR}/%.o, ${SRC})


all		:	${NAME}

${NAME}	:	${OBJ} ${LIBFT}
			${CC} -o $@ $^ -g -fsanitize=address

${LIBFT}:
			${MAKE} -C ${LIB_DIR}

${OBJ_DIR}/%.o	:	%.c
			mkdir -p ${OBJ_DIR}
			${CC} ${C_FLAGS} -g $< -o $@

clean	:
			${MAKE} clean -C ${LIB_DIR}
			rm -rf ${OBJ_DIR}

fclean	:	clean
			${MAKE} fclean -C ${LIB_DIR}
			rm -rf ${NAME}

re		:	fclean all

.PHONY	:	all test clean fclean re
