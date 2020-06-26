org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di

	mov	    si, 100d ; X -> Columna   LINEAS VERTICALES
	mov 	di, 50d ; Y -> Fila
    mov     bx, di
    add     bx, 100d; largo
	call 	linea_v

    mov	    si, 110d ; X -> Columna
	mov 	di, 60d ; Y -> Fila
    mov     bx, di
    add     bx, 100d; largo
	call 	linea_v
    
    mov	    si, 230d ; X -> Columna
	mov 	di, 60d ; Y -> Fila
    mov     bx, di
    add     bx, 100d; largo
	call 	linea_v
    
    mov	    si, 130d ; X -> Columna
	mov 	di, 90d ; Y -> Fila
    mov     bx, di
    add     bx, 70d; largo
	call 	linea_v
    
    mov	    si, 210d ; X -> Columna
	mov 	di, 90d ; Y -> Fila
    mov     bx, di
    add     bx, 70d; largo
	call 	linea_v
    
    mov	    si, 200d ; X -> Columna
	mov 	di, 100d ; Y -> Fila
    mov     bx, di
    add     bx, 50d; largo
	call 	linea_v
    
	mov	    si, 100d ; X -> Columna    LINEAS HORIZONATALES
	mov 	di, 50d ; Y -> Fila
    mov     bx, Si
    add     bx, 20d; largo
	call 	linea_h

    mov	    si, 110d ; X -> Columna
	mov 	di, 60d ; Y -> Fila
    mov     bx, Si
    add     bx, 20d; largo
	call 	linea_h
	
    mov	    si, 110d ; X -> Columna
	mov 	di, 160d ; Y -> Fila
    mov     bx, Si
    add     bx, 20d; largo
	call 	linea_h
	
    mov	    si, 210d ; X -> Columna
	mov 	di, 160d ; Y -> Fila
    mov     bx, Si
    add     bx, 20d; largo
	call 	linea_h
	
    mov	    si, 210d ; X -> Columna
	mov 	di, 60d ; Y -> Fila
    mov     bx, Si
    add     bx, 20d; largo
	call 	linea_h
	
    mov	    si, 200d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
    mov     bx, Si
    add     bx, 20d; largo
	call 	linea_h
	
    
    mov 	si, 100d ; X -> Columna      LINEAS DIAGONALES NEGATIVAS
	mov 	di, 50d ; Y -> Fila
    mov     bx, si
    add     bx, 10d ; largo
	call 	linea_diagN
	
    mov 	si, 100d ; X -> Columna      
	mov 	di, 150d ; Y -> Fila
    mov     bx, si
    add     bx, 10d ; largo
	call 	linea_diagN
	
    mov 	si, 200d ; X -> Columna      
	mov 	di, 150d ; Y -> Fila
    mov     bx, si
    add     bx, 10d ; largo
	call 	linea_diagN
	
    mov 	si, 200d ; X -> Columna      
	mov 	di, 50d ; Y -> Fila
    mov     bx, si
    add     bx, 10d ; largo
	call 	linea_diagN
	
    mov 	si, 220d ; X -> Columna      
	mov 	di, 50d ; Y -> Fila
    mov     bx, si
    add     bx, 10d ; largo
	call 	linea_diagN
	
    mov 	si, 120d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
    mov     bx, si
    add     bx, 50d ; largo
	call 	linea_diagN
    
    mov 	si, 130d ; X -> Columna
	mov 	di, 90d ; Y -> Fila
    mov     bx, si
    add     bx, 40d ; largo
	call 	linea_diagN

    

	mov 	si, 160d ; X -> Columna      LINEAS DIAGONALES POSITIVAS
	mov 	di, 90d ; Y -> Fila
    mov     bx, si
    add     bx, 40d ;largo
	call 	linea_diagP
	
    mov 	si, 170d ; X -> Columna
	mov 	di, 100d ; Y -> Fila
    mov     bx, si
    add     bx, 40d ;largo
	call 	linea_diagP
	
    mov 	si, 170d ; X -> Columna
	mov 	di, 130d ; Y -> Fila
    mov     bx, si
    add     bx, 40d ;largo
	call 	linea_diagP



	call 	kb		; Utilizamos espera de alguna tecla

	int 	20h

grafico:mov	ah, 00h
	mov	    al, 13h
	int 	10h
	ret

pixel:	    
    mov	    ah, 0Ch
	mov	    al, 1010b
	int 	10h
	ret

linea_h: 
lupi_h:	
    mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	    dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, bx
	jne 	lupi_h
	ret

linea_diagN: 
lupi_diagN:	
    mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	    dx, di ; Fila
	call 	pixel
	inc 	si
	inc 	di
	cmp 	si, bx
	jne 	lupi_diagN
	ret

linea_diagP: 
lupi_diagP:	
    mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	    dx, di ; Fila
	call 	pixel
	inc 	si
	dec 	di
	cmp 	si, bx
	jne 	lupi_diagP
	ret

linea_v:

linea_v:
lupi_v:	
    mov 	cx, si ; Columna 
	mov	    dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, bx
	jne 	lupi_v
	ret


kb: 	mov	ah, 00h
	int 	16h
	ret

section .data