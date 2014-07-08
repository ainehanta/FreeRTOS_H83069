
#ifdef __H8300H__  

#ifdef __NORMAL_MODE__
	.h8300hn
#else
	.h8300h
#endif

#endif	/*_H8300H_ */

#ifdef __H8300S__

#ifdef __NORMAL_MODE__
	.h8300sn
#else
	.h8300s
#endif

#endif /* __H8300S__ */
	
	.section .text
	.global _start

_start:

	mov.l #__ext_stack, sp

__go_main:

	jsr @_main
	sleep
	bra __go_main
