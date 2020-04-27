org	100h	;004 00815

mov	ax,		0
mov	bl,		5

add	ax,		0
add	ax,		0
add	ax,		8
add	ax,		1
add	ax,		5
div	bl
mov [208h], 		al	

int 20h
