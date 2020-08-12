#include "defines.h"

#define STDOUT 0xd0580000

.section .text
.global _start
_start:

    // Clear minstret
    csrw minstret, zero
    csrw minstreth, zero

    // Set up MTVEC - not expecting to use it though
    li x1, RV_ICCM_SADR
    csrw mtvec, x1


    // Enable Caches in MRAC
    li x1, 0x5f555555
    csrw 0x7c0, x1

	la sp, _stack_end
	
    li x10, 0
	li x11, 0
	call main

_finish:
    li x3, STDOUT
    addi x5, x0, 0xff
    sb x5, 0(x3)
    beq x0, x0, _finish
.rept 100
    nop
.endr

puts:
    li x3, STDOUT
.Lputsloop:
	lb x4, 0(x10)
	sb x4, 0(x3)
	addi x10, x10, 1
	bnez x4, .Lputsloop
	ret

#include "called_code.s"
	
	.bss
_stack_begin:
	.skip 8192
_stack_end:
