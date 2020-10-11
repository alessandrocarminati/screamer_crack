.286
cseg    segment para public
        assume  cs:cseg, ds:cseg, ss:tsrstk
int_15h_hook    proc    far
                pushf
                PUSHA
                PUSH    DS
                PUSH    ES
                CMP     AX,1510H
                JNZ     SKIP
                PUSH    ES
                POP     DS
                MOV     SI,BX
                lodsw
                lodsb
                cmp     al,80h
                jnz     skip
                MOV     AX,1510H
                MOV     CX,3
                add     si,13
                lodsw
                mov     es,ax
                xor     di,di
                push    cs
                pop     ds
                mov     si,offset screamer
                mov     cx,192
                REP     MOVSB
                POP     ES
                POP     DS
                POPA
                popf
                iret
SKIP:           POP     ES
                POP     DS
                POPA
                popf
                jmp     cs:int15h
int_15h_hook    endp
int15h     dd      0
screamer   db      001,067,068,048,048,049,001,000,080,067,032,032,032,032,032
           db      032,032,032,032,032,032,032,032,032,032,032,032,032,032,032
           db      032,032,032,032,032,032,032,032,032,032,083,067,082,069,065
           db      077,069,082,032,032,032,032,032,032,032,032,032,032,032,032
           db      032,032,032,032,032,032,032,032,032,032,032,032,000,000,000
           db      000,000,000,000,000,238,062,000,000,000,000,062,238,000,000
           db      000,000,000,000,000,000,000,000,000,000,000,000,000,000,000
           db      000,000,000,000,000,000,000,000,000,000,000,000,000,000,000
           db      001,000,000,001,001,000,000,001,000,008,008,000,104,000,000
           db      000,000,000,000,104,019,000,000,000,000,000,000,000,000,000
           db      000,018,000,000,000,000,034,000,020,000,000,000,000,000,000
           db      020,000,008,000,000,000,000,008,000,000,000,000,000,000,000
           db      000,002,000,000,001,000,000,001,001,000,032,0032
install proc    far
start:
	push    cs
	pop     ds
	mov     si,offset head
	mov     cx,32
	mov     ah,0eh
@l:     lodsb
	int     10h
	loop    @l
	mov     al, 2fh
	mov     ah, 35h
	int     21h
	mov     word ptr int15h, bx
	mov     word ptr int15h+2, es
	mov     dx, offset int_15h_hook
	mov     al, 2fh
	mov     ah, 25h
	int     21h
	mov     dx, (offset start - offset int_15h_hook) SHR 4
	add     dx, 11h
	mov     ax, 3100h
	int     21h
install         endp
head    db      'Handle Software Screamer Crack',0dh,0ah
cseg    ends
tsrstk  segment para stack
        db      150 dup (0)
tsrstk  ends
        end     start

