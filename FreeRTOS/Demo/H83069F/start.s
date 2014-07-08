	.h8300h
	.section .text
	.global _start

_start:

	mov.l #__ext_stack, sp

__call_main:

	jsr @_main
	sleep
	bra __call_main
