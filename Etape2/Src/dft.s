	thumb
	area dft, code, readonly
	import TabSin
	import TabCos
	import TabSig
	export re
	export m2
;

;fonction Re(k)
re proc
	
	push{r4, r5, r6, r7}
	
	;i -> r4
	mov r4, #0
	;ik -> r6
	mov r6, #0
	;somme -> r5
	mov r5, #0
	
	
	;debut boucle somme
boucle	
	ldr r2, =TabSig
	ldrsh r2, [r2, r4, lsl #1]
	ldrsh r7, [r1, r6, lsl #1]
	;somme
	mla r5, r2, r8, r5
	
	;incrementation de i
	add r4, #1
	;ik -> r6
	mul r6, r4, r0
	;ik modulo N -> r6
	and r6, r6, #63
	;retour debut boucle somme
	cmp r4, #64
	bne boucle
	;fin boucle somme
	
	;valeur de retour dans r0
	mov r0, r5
	b fin
fin
	pop{r4, r5, r6, r7}
	
	bx lr
	endp
		
;fonction M2(k)
m2 proc
	push{r4, r5, lr}
	
	mov r4, r0
	
	;table cos -> r1
	ldr r1, =TabCos
	;appel fonction re
	bl re
	;on met le résultat au carré dans r5
	mul r5, r0, r0
	
	mov r0,r4
	
	;table sin -> r1
	ldr r1, =TabSin
	;appel fonction re
	bl re
	;on met au carré et on fait la somme
	mla r5, r0, r0, r5
	;on ramène le résultat à 32bits
	mov r0, r5, lsr #32
	b finm2
finm2
	pop {r4, r5, lr} 
	bx lr
	endp
	end
;