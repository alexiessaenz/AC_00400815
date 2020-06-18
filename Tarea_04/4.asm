org	100h	;  carnet: 004 00815

section	.text 
    call 	texto  	;iniciamos modo texto
	call 	pagina  ;indicamos numero de pagina

    call    prom    ;calculo del promedio
    call 	cursor		;configuramos el cursor
	call 	phrase1     ;imprimimos el mensaje

	int 20h

texto:	
    mov 	ah, 	00h
	mov	    al, 	03h
	int 	10h
	ret

pagina:	
    mov 	ah, 	05h
	mov	    al, 	00h
	int 	10h
ret
	;---------------------
prom:  
        mov	ax,		0d 
        mov	bx,		0d 
        mov	bl,		5d
        add	al,		0d
        add	al,		0d
        add	al,		8d
        add	al,		1d
        add	al,		5d
        div	bl
        mov [200h], al
ret
cursor: 
    mov	    ah,     01h
	mov 	ch,     00000000b
	mov 	cl,     00001110b	;   IRGB
	int 	10h
ret

w_char1:	
    mov 	ah, 	09h
	mov 	al, 	cl
	mov 	bh, 	0h
	mov 	bl, 	00001111b
	mov 	cx, 	1h
	int 	10h
ret

m_cursr1:
    mov 	ah, 	02h
	mov 	dx, 	di  ; columna
	mov 	dh, 	15d ; fila
	mov 	bh, 	0h
	int 	10h
ret

phrase1:
    mov 	di, 	 31d
	mov	    si,      0d
    mov     al,      [200h]
	cmp 	al,		 1d
	je	    lupi1
	cmp 	al,		 2d
	je	    lupi2
	cmp 	al,		 3d
	je	    lupi3
	cmp 	al,		 4d
	je	    lupi4
	cmp 	al,		 5d
	je	    lupi5
	cmp 	al,		 6d
	je	    lupi6
	cmp 	al,		 7d
	je	    lupi7
	cmp 	al,		 8d
	je	    lupi8
	cmp 	al,		 9d
	je	    lupi9
	cmp 	al,		 10d
	je	    lupi10
    int     20h
lupi1:	
    mov 	cl, 	[msg1+di-31d]
	call    m_cursr1
	call 	w_char1
	inc	    di
	cmp 	di,     len1
	jb	    lupi1
    jmp     fine
lupi2:	
    mov 	cl, 	[msg2+di-31d]
	call    m_cursr1
	call 	w_char1
	inc	    di
	cmp 	di,     len2
	jb	    lupi2
    jmp     fine
lupi3:	
    mov 	cl, 	[msg3+di-31d]
	call    m_cursr1
	call 	w_char1
	inc	    di
	cmp 	di,     len3
	jb	    lupi3
    jmp     fine
lupi4:	
    mov 	cl, 	[msg4+di-31d]
	call    m_cursr1
	call 	w_char1
	inc	    di
	cmp 	di,     len4
	jb	    lupi4
    jmp     fine
lupi5:	
    mov 	cl, 	[msg5+di-31d]
	call    m_cursr1
	call 	w_char1
	inc	    di
	cmp 	di,     len5
	jb	    lupi5
    jmp     fine
lupi6:	
    mov 	cl, 	[msg6+di-31d]
	call    m_cursr1
	call 	w_char1
	inc	    di
	cmp 	di, len6
	jb	    lupi6
    jmp     fine
lupi7:	
    mov 	cl, 	[msg7+di-31d]
	call    m_cursr1
	call 	w_char1
	inc	    di
	cmp 	di, len7
	jb	    lupi7
    jmp     fine
lupi8:	
    mov 	cl, 	[msg8+di-31d]
	call    m_cursr1
	call 	w_char1
	inc	    di
	cmp 	di,     len8
	jb	    lupi8
    jmp     fine
lupi9:	
    mov 	cl, 	[msg9+di-31d]
	call    m_cursr1
	call 	w_char1
	inc	    di
	cmp 	di,     len9
	jb	    lupi9
    jmp     fine
lupi10:	
    mov 	cl, 	[msg10+di-31d]
	call    m_cursr1
	call 	w_char1
	inc	    di
	cmp 	di,     len10
	jb	    lupi10
fine:
ret
;---------------

section	.data
    msg1	db 	"Solo necesito el 0 "
    len1	equ	$-msg1+31d          ;promedio 1
    msg2	db 	"Aun se pasa "
    len2	equ	$-msg2+31d          ;promedio 2
    msg3	db 	"Hay salud "
    len3	equ	$-msg3+31d          ;promedio 3
    msg4	db 	"Me recupero "
    len4	equ	$-msg4+31d          ;promedio 4
    msg5	db 	"En el segundo "
    len5	equ	$-msg5+31d          ;promedio 5
    msg6	db 	"Peor es nada "
    len6	equ	$-msg6+31d          ;promedio 6
    msg7	db 	"Muy bien "
    len7	equ	$-msg7+31d          ;promedio 7
    msg8	db 	"Colocho "
    len8	equ	$-msg8+31d          ;promedio 8
    msg9	db 	"Siempre me esfuerzo "
    len9	equ	$-msg9+31d          ;promedio 9
    msg10	db 	"Perfecto solo Dios "
    len10	equ	$-msg10+31d         ;promedio 10