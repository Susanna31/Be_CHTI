	thumb
	area  somme_carre, code, readonly
	import TabSin
	import TabCos 
	export somme
;
somme proc 
	
	ldr r1, =TabSin 
	ldrsh r2, [r1, r0, lsl #1]
	
	ldr r1, =TabCos
	ldrsh r3, [r1, r0, lsl #1]
	
	;carré sin 
	mul r2, r2,r2
	
	;carré cos
	mul r3, r3,r3
	
	;somme carré du sin et du cos
	add r0, r2, r3
	
	bx lr 
	endp 
	end
;
