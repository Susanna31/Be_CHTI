	thumb
	area dft, code, readonly
	import TabSin
	import TabCos
	import TabSig
	import somme
	export re
	export m2
;

;fonction Re(k)
re proc
	
	push{r4, r5, r6, r7}
	
	ldr r1, =TabSig
	ldr r1, [r1, r4, lsl #1]
	ldr r2, =TabCos
	ldr r2, [r2, r6, lsl #1]
	;i -> r4
	mov r4, #0
	;somme -> r5
	mov r5, #0
	
	;initialisation compteur boucle somme à N-1=63
	movs r7, #63
	
	;debut boucle somme
boucle	
	;incrementation de i
	add r4, #1
	;ik -> r6
	mul r6, r4, r0
	;ik modulo N -> r6
	and r6, r6, #63
	;somme
	mla r5, r1, r2, r5
	;decrementation compteur boucle somme
	sub r7, #1
	;retour debut boucle somme
	;cbnz r7, boucle
	cmp r7, #0
	bne boucle
	;fin boucle somme
	
	;valeur de retour dans r0
	mov r0, r5
	
	pop{r4, r5, r6, r7}
	
	bx lr
	endp
		
;fonction M2(k)
m2 proc
	
	;appel fonction re
	bl re
	
	

	end
;