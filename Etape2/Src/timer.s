	thumb 
	area timer, code, readonly

	export timer_callback ; 
	extern etat ; 
		
GPIOB_BSRR	equ	0x40010C10	; Bit Set/Reset register
	
timer_callback proc
	ldr	r0, =etat
	ldr	r1, [r0]
	
	CBZ	r1, branch_zero 
	
; mise a 1 de PB1
	ldr	r3, =GPIOB_BSRR
	mov	r1, #0x00000002
	str	r1, [r3]
	
;mise de etat à 1
	mov	r1, #1
	str	r1, [r0]


branch_zero 	
; mise a zero de PB1
	ldr	r3, =GPIOB_BSRR
	mov	r1, #0x00020000
	str	r1, [r3]
	
; mise à 0 de etat
	mov	r1, #0
	str	r1, [r0]
	
; N.B. le registre BSRR est write-only, on ne peut pas le relire
	bx lr	
	
	endp 
		
	end 