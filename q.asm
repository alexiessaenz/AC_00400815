	org	100h	;004 00815

section	.text
	mov	al,		0
	mov	bl,		0

	add	al,		0
	add	al,		0
	add	al,		8
	add	al,		1
	add	al,		5
	mov	ax,		al	
	int 20h

section	.data
comnt	db	"Me recupero"
len	equ	$-comnt