	thumb
	area dft, code, readonly
	import TabSin
	import TabCos
	export m2
;

;fonction Re(k,adresse signal)
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
	ldrsh r3, [r1, r4, lsl #1]
	ldrsh r7, [r2, r6, lsl #1]
	;somme
	mla r5, r3, r7, r5
	
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

	pop{r4, r5, r6, r7}
	
	bx lr
	endp
	
	
;fonction M2(k, adresse signal)
m2 proc
	push{r4, r5, r6, lr}
	
	mov r4, r0
	
	;table cos -> r2
	ldr r2, =TabCos
	;appel fonction re
	bl re
	;on met le résultat au carré dans r5 et r6
	smull r5, r6, r0, r0
	
	mov r0,r4
	
	;table sin -> r2
	ldr r2, =TabSin
	;appel fonction re
	bl re
	;on met le résultat au carré et on l'ajoute au précédent
	smlal r5, r6, r0, r0
	;on ne renvoie que les 32 bits de poids fort stockés dans r6
	mov r0,r6
	
	pop {r4, r5, r6, lr} 
	bx lr
	endp
	end
;