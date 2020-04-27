	org	100h	;004 00815

section	.text 
	mov	ax,		0
	mov	bl,		5

	add	ax,		0
	add	ax,		0
	add	ax,		8
	add	ax,		1
	add	ax,		5
	div	bl
	;mov [208h], 		al

	cmp 	al,		 2
	je	lupi

	mov	di,		0d
	mov	cx,		[len]

lupi:	mov	bl,		[comnt+di]
	mov	[di+200h],	bl
	inc	di
	loop	lupi

	mov	di,		220h
		mov		cx,		11
		mov		ax,		2h

lupi2:	add 	ax,		ax
		mov		[di],		ah
		mov		[di+1],		al
		inc		di
		inc		di
		loop	lupi2

	int 20h

section	.data
	comnt	db	"2 = Aun se pasa"
	len	equ	$-comnt
