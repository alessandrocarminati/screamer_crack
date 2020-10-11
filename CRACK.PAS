{$M 16384,0,0}
program screamer_crack;
const msg:array[0..7] of string [40] =
      ('Salve gente','eccovi un crack per screamer',
       'il fantastico gioco di auto italiano','e per un gioco italiano ',
       'ci vuole un crack italiano','per uscire premere il tasto esc',
       'arrivederci','vi auguriamo una buona giornata');
      msg2:array[0..9] of string [60] =(
      '                                     .',
      '                                     |',
      '                        -   -- ФФФ-ФФХФ- -',
      'л   л ллллл  л   л лллл  л     ллллл |',
      'л   л л   л  лл  л л   л л     л     :',
      'ллллл ллллл  л л л л   л л     ллллл .',
      'л   л л   л  л  лл л   л л     л      ',
      'л   л л   л  л   л лллл  ллллл ллллл  ',
      'ATTENZIONE: Il device driver mscdexe deve essere installato!',
      'Buon divertimento.');
      head:string[6]='HaNdLe';
var s:string;
    p,p2:pointer;
    dev,mix,stat,pro,loop : integer;
    md : string;
    I,h,lung:word;
    x:longint;
    blk,isr:pointer;
    handle:word;
    charp:byte;
    font:pointer;
    oldint9:pointer;
{$L \app\src\PLAYER.DAT}
{$F+}
procedure modvolume(v1,v2,v3,v4:integer); external ;
procedure moddevice(var device:integer); external ;
procedure modsetup(var status:integer;device,mixspeed,pro,loop:integer;var str:string); external ;
procedure modstop; external ;
procedure modinit; external;
{$F-}
procedure crack;assembler;
asm
                jmp     @install
@int_15h_hook:
                pushf
                PUSHA
                PUSH    DS
                PUSH    ES
                cmp     ax,666h
                jnz     @skips
                cmp     bx,999h
                jnz     @skips
                POP     ES
                POP     DS
                POPA
                popf
                xchg    ax,bx
                iret
@skips:         CMP     AX,1510H
                JNZ     @SKIP
                PUSH    ES
                POP     DS
                MOV     SI,BX
                lodsb
                lodsb
                lodsb
                cmp     al,80h
                jnz     @skip
                MOV     AX,1510H
                MOV     CX,3
                add     si,13
                lodsw
                mov     es,ax
                xor     di,di
                push    cs
                pop     ds
                mov     si,offset @screamer-3
                mov     cx,2048
                rep     movsb
                POP     ES
                POP     DS
                POPA
                popf
                iret
@SKIP:          POP     ES
                POP     DS
                POPA
                popf
                db      $ea
@int15h:   dd      $12345678
@screamer: db      1,67,68,48,48,49,1,0,80,67,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
           db      32,32,32,32,32,32,32,32,83,67,82,69,65,77,69,82
           db      32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
           db      32,32,32,32,32,32,32,32,0,0,0,0,0,0,0,0,238,62,0,0,0,0,62,238,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,0,0,1
           db      0,8,8,0,104,0,0,0,0,0,0,104,19,0,0,0,0,0,0,0,0,0,0,18,0,0,0,0,34,0,20,0
           db      0,0,0,0,0,20,0,8,0,0,0,0,8,0,0,0,0,0,0,0,0,2,0,0,1,0,0,1,1,0,32,32
           db      32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
           db      32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
           db      32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
           db      32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,86,73
           db      69,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
           db      32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
           db      32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
           db      32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
           db      32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
           db      32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
           db      32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
           db      32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,83,67
           db      82,69,65,77,69,82,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
           db      32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
           db      32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
           db      32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
           db      32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
           db      32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
           db      32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
           db      32,32,32,32,32,32,32,32,32,32,32,32,32,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,0,48,48
           db      48,48,48,48,48,48,48,48,48,48,48,48,48,48,0,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,0
           db      48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
           db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
@start:
@install:

        push    ds
        push    cs
	pop     ds
	mov     al, 2fh
	mov     ah, 35h
	int     21h
	mov     cs:word ptr [@int15h], bx
	mov     cs:word ptr [@int15h+2], es

        mov     si,offset @int_15h_hook
        mov     bx,0bb8h
        shr     bx,4
        inc     bx
        mov     ah,48h
        int     21h
        mov     es,ax

        xor     dx, dx
        mov     ds, ax
	mov     al, 2fh
	mov     ah, 25h
	int     21h


        push    cs
        pop     ds
        xor     di,di
        mov     cx,0bb0h
        rep     movsb
        mov     ax,es
        dec     ax
        mov     es,ax
        mov     di,1
        mov     ax,8
        stosw
        pop     ds
        mov     di,8
        lea     si,head
        inc     si
        mov     cx,6
        rep     movsb
end;
procedure stamp2(x,y:word;var s:string;c:byte;var let);assembler;
asm
        push   ds
        les    di,s
        mov    al,es:[di]
        cmp    al,28h
        ja     @fine
        MOV    AX,Y
        MOV    BX,X
        XCHG   AH, AL
        ADD    BX,AX
        shr    ax,1
        shr    ax,1
        ADD    BX,AX
        mov    dx,bx
        xor    cx,cx
@let:   les    di,s
        pusha
        mov    dx,5h
@loop2: mov    cx,0ffffh
@Loop:  loop   @loop
        dec    dx
        jnz    @loop2
@l:     mov    bx,500
        in     al,61h
        and    al,0feh
        out    61h,al
        or     al,2
        out    61h,al
        mov    dx,80
        mov    cx,bx
@k:     loop   @k
        and    al,0fdh
        out    61h,al
        mov    cx,bx
@j:     loop   @j
        dec    dx
        popa
        xor    ah,ah
        inc    cx
        mov    al,es:[di]
        cmp    cx,ax
        ja     @fine
        add    di,cx
        mov    al,es:[di]
        cmp    al,20h
        jnz    @normal
        add    dx,8
        add    di,8
        jmp    @let
@normal:cmp    al,5Ah
        jb     @scrivi
        sub    al,20h
@scrivi:sub    al,41h
        xor    ah,ah
        mov    bx,31h
        PUSH   DX
        mul    bx
        pop    dx
        lds    si,let
        add    si,ax
        mov    di,dx
        mov    ax,0a000h
        mov    es,ax
        mov    bh,7h
@l2:    mov    bl,7h
@l1:    mov    al,ds:[si]
        or     al,al
        jz     @ok
        MOV    AL,c
        mov    es:[di],al
@ok:    inc    di
        inc    si
        dec    bl
        jnz    @l1
        add    di,139h
        dec    bh
        jnz    @l2
        add    dx,8
        jmp    @let
@fine:  pop    ds
end;
procedure pcxdraw(var pic,p2;lung:word);assembler;
asm
       push  ds
       mov   dx,lung
       sub   dx,2ffh
       lds   si,pic
       les   di,p2
@loop: lodsb
       cmp   al,0c0h
       jb    @dir
       and   al,3fh
       cbw
       mov   cx,ax
       lodsb
       rep   stosb
       sub   dx,2
       jnz   @loop
       jmp   @end
@dir:  stosb
       dec   dx
       jnz   @loop
@end:
       pop   ds

end;
Procedure Set256Colors2 (Var Pal;l:word);Assembler;
Asm
  push ds
  lds si,pal
  add si,l
  sub si,300h
  mov cx,300h
  @l:
  mov al,ds:[si]
  shr al,2
  mov ds:[si],al
  inc si
  loop @l
  Mov ah,10h
  Mov al,12h
  Mov bx,0
  Mov cx,100h
  Les dx,pal
  add dx,l
  sub dx,300h
  Int 10h
  pop ds
end;

Procedure Set256Colors (Var Pal;l:word);Assembler;
Asm
   push ds
   Lds si,pal
   mov ax,l
   add si,ax
   sub si,300h
   mov cx,300
@l:lodsb
   dec si
   shr al,4
   stosb
   loop @l
   Les di,pal
   mov ax,l
   add dx,ax
   sub dx,300h
   mov cx,300
   Mov ah,10h
   Mov al,12h
   Mov bx,0
   Mov cx,100h
   Int 10h
   pop ds
end;
Function Fopen(Var Nome_F:String):word;Assembler;
asm
 Push ds
 Mov ax,3d00h
 Lds dx,Nome_F
 Inc dx
 Int 21h
 Jnc @Fine
 mov ax,0ffffh
 @Fine:
 Pop ds
end;
Function  Fread(Handle:Word;Bytes:Word;Var Buffer):word;Assembler;
Asm
 Push ds
 Mov  bx,Handle
 Lds  dx,Buffer
 Mov  cx,Bytes
 Mov  ah,3Fh
 Int  21h
 Pop ds
end;
procedure fclose(handle:word);assembler;
asm
 Mov ax,3e00h
 Mov Bx,handle
 Int 21h
 mov al,1
 Jnc @Fine
 xor al,al
 @Fine:
end;
procedure fseek(handle:word;var pos:longint);assembler;
asm
    mov bx,handle
    les di,pos
    mov ax,es:[di]
    mov dx,ax
    add di,2h
    mov ax,es:[di]
    mov cx,ax
    mov ax,4200h
    int 21h
    xor ax,ax
    jc @l
    inc ax
@l:
end;
procedure smear(x1,y1,x2,y2: word);assembler;
var       x,y:word;
asm
        push    ds
        mov     ax,0a000h
        mov     es,ax
        mov     ds,ax
        mov     ax,y1
        mov     y,ax
@r1:    mov     ax,x1
        mov     x,ax
@r0:    xor     dx,dx
        MOV     AX,Y
        MOV     BX,X
        XCHG    AH, AL
        ADD     BX,AX
        shr     ax,1
        shr     ax,1
        ADD     BX,AX

        lea     si,[bx-1]
        xor     ax,ax
        mov     cx,3
@l:     lodsb
        add     dx,ax
        cmp     cx,2
        jz      @NO
        MOV     AL,DS:[SI]
        add     dx,ax
@NO:    INC     SI
        lodsb
        add     dx,ax
        add     si,317
        loop    @l
        mov     di,bx
        ADD     DI,320
        mov     ax,dx
        shr     ax,3
        stosb
        inc     x
        mov     ax,x
        cmp     ax,x2
        jna     @r0
        inc     y
        mov     ax,y
        cmp     ax,y2
        jna     @r1
        pop     ds
end;
procedure gdm(var p;size:word);assembler;
asm
        mov    bx,size
        shr    bx,4
        inc    bx
        mov    ah,48h
        int    21h
        jc     @error
        les    di,p
        add    di,2
        mov    es:[di],ax
        xor    ax,ax
        sub    di,2
        mov    es:[di],ax
        jmp    @fine
@error: les    di,p
        xor    ax,ax
        stosw
        stosw
@fine:
end;
procedure drawx(var canz);assembler;
asm
        push   ds
        mov    ax,0a000h
        mov    es,ax
        mov    bh,0c7h
        mov    dx,140h
@l1:    lds    si,canz
        xor    di,di
        mov    cx,dx
        shr    cx,1
        rep    movsw
        mov    bl,bh
@l:     sub    si,140h
        mov    cx,0a0h
        rep    movsw
        dec    bl
        jnz    @l
        push   dx
        mov    dx,3dah
@lq1:   in     al,dx
        and    al,8
        jz     @lq1
@lq2:   in     al,dx
        and    al,8
        jnz    @lq2
        pop    dx
        dec    bh
        add    dx,140h
        cmp    dx,0fa00h
        jne    @l1
        lds    si,canz
        xor    di,di
        mov    cx,07d00h
        rep    movsw
        pop    ds
end;
function check:boolean;assembler;
asm
        xor     cx,cx
        mov     ax,666h
        mov     bx,999h
        int     2fh
        cmp     ax,999h
        jnz     @n
        cmp     bx,666h
        jnz     @n
        inc     cx
@n:     mov    ax,cx
end;
procedure wraster;assembler;
asm
        mov    dx,3dah
@l1:    in     al,dx
        and    al,8
        jz     @l1
@l2:    in     al,dx
        and    al,8
        jnz    @l2
end;
procedure giv(intnum:byte;var p);assembler;
asm
        push    ds
        xor     ax,ax
        mov     ds,ax
        mov     al,intnum
        cbw
        add     ax,ax
        add     ax,ax
        mov     si,ax
        les     di,p
        lodsw
        stosw
        lodsw
        stosw
        pop     ds
end;
procedure siv(intnum:byte;var p);assembler;
asm
        push    ds
        xor     ax,ax
        mov     es,ax
        mov     al,intnum
        cbw
        add     ax,ax
        add     ax,ax
        mov     di,ax
        lds     si,p
        lodsw
        stosw
        lodsw
        stosw
        pop     ds
end;
procedure keyboard;interrupt;assembler;
asm
        in      al,60h
        cmp     al,01h
        jNz     @NOT
        MOV     CHARP,1
@not:   mov     al,20h
        out     20h,al
end;
procedure inti;assembler;
asm
        mov     dx,3dah
@l1:    in      al,dx
        and     al,8
        jz      @l1
@l2:    in      al,dx
        and     al,8
        jnz     @l2
        mov     al,09
        mov     dx,3d4h
        out     dx,al
        inc     dl
        in      al,dx
        and     al,0e0h
        or      al,1
        out     dx,al
end;
procedure dg;assembler;
asm
        mov     ah,1
@l:     mov     al, 9
        mov     dx,3d4h
        out     dx,al
        inc     dx
        in      al,dx
        and     al,0e0h
        or      al,ah
        out     dx,al
        mov     bl,2
        mov     dx,3dah
@l1:    in      al,dx
        and     al,8
        jz      @l1
@l2:    in      al,dx
        and     al,8
        jnz     @l2
        dec     bl
        jnz     @l1

        inc     ah
        cmp     ah,10h
        jnz     @l
end;
begin
IF CHECK THEN BEGIN
              WRITELN('Crack is alredy installed');
              halt;
              end;
if not ((paramcount=2) and (paramstr(2)='/$')) then begin
                                                    GIV(9,OLDINT9);
                                                    FONT:=ADDR(KEYBOARD);
                                                    SIV(9,font);
                                                    md:='agony2.mod';
                                                    modinit;
                                                    dev:=3;
                                                    mix := 10000;
                                                    pro := 0;
                                                    loop :=4;
                                                    modvolume (255,255,255,255);
                                                    modsetup ( stat, dev, mix, pro, loop, md );
                                                    gdm(font,1274);
                                                    s:=paramstr(0)+#0;
                                                    h:=fopen(s);
                                                    x:=18144;
                                                    fseek(h,x);
                                                    lung:=fread(h,1274,font^);
                                                    gdm(p,$FFFF);
                                                    lung:=fread(h,128,p^);
                                                    lung:=fread(h,$FFFF,p^);
                                                    asm
                                                    mov ax,0013h
                                                    int 10h
                                                    end;
                                                    set256colors2(p^,lung);
                                                    gdm(p2,$fa00);
                                                    pcxdraw(p^,p2^,lung);
                                                    drawx(p2^);
                                                    lung:=0;
                                                    repeat
                                                    s:=msg[lung];
                                                    stamp2(0,180,s,200,font^);
                                                    for i :=1 to 100 do wraster;
                                                    i:=0;
                                                    inc(lung);
                                                    lung:=lung and 7;
                                                    repeat
                                                    smear(0,170,320,200);
                                                    INC(I);
                                                    until I=25;
                                                    until charp<>0;
                                                    i:=0;
                                                    repeat
                                                    smear(107,30,205,160);
                                                    INC(I);
                                                    until I=150;
                                                    asm
                                                    mov     ax,3h
                                                    int     10h
                                                    end;
                                                    end;
crack;
inti;
for i :=0 to 9 do writeln(msg2[i]);
dg;
modstop;
SIV(9,oldint9);
end.
