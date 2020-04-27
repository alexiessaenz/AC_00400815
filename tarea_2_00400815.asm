	org	100h	;004 00815

section	.text 
	mov	ax,		0 ;-----------ejercicio 1
	mov	bl,		5

	add	ax,		0
	add	ax,		0
	add	ax,		8
	add	ax,		1
	add	ax,		5
	div	bl

	cmp 	al,		 2
	je	lupi

	mov	di,		0d
	mov	cx,		[len]

lupi:	mov	bl,		[comnt+di]
	mov	[di+200h],	bl
	inc	di
	loop	lupi

	mov	di,		210h ;===============ejercicio 2
	mov	cx,		11
	mov	ax,		2h

lupi2:	add 	ax,		ax
	mov     [di], 		ax
        cmp     ah, 		00h
        ja      words  ;ja>  ah!=00
        je      bytes  ;je =
words:  add     di, 		2h
		jmp		d
bytes:  add     di, 		1h
d:	loop		lupi2

	mov    	byte[220h], 	0 ; F0 = 0 ;========== ejercicio 3
        mov     byte[221h], 	1  ; F1 = 1
        mov     di, 		222h
    	mov	cx,		13
		
lupi3:	mov     ax, 		0
        mov     [di], 		ax ;0
    	sub     di, 		2h; 2
        mov     al, 		[di] ;2
        add     di, 		1h  ;1
        add     ax, 		[di] ;1
        add     di, 		1h  ;1 
        mov     [di], 		ax ;1
        add     di, 		1h  ;1
	loop	lupi3

	int 20h

section	.data
	comnt	db	"2 = Aun se pasa"
	len	equ	$-comnt
