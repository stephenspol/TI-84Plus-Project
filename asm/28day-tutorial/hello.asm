.binarymode TI8X            ; Tells Brass to ouput a 8xp file for TI83+/TI84+
.nolist
#include "ti84plus.inc"  ; TI84plus.inc and Ti83plus.inc are identical
#define ProgStart $9D95     ; Start program at defined address
.list
.org ProgStart - 2
.db t2ByteTok, tAsmCmp

    bcall(_ClrLCDFull)      ; Clear calculator screen
    ld a, 0                 ; Reset register A to zero
    ld (CurRow), a          ; Set cursor row to zero by changing value in stored address
    ld (CurCol), a          ; Set cursor column to zero by changing value in stored address
    ld hl, msg              ; Load msg into register HL
    bcall(_PutS)            ; Display the text
    bcall(_NewLine)         ; Print a new line
    ret                     ; Exit program

msg:
    .db "Hello Z80!", 0     ; Text to display on screen
.end                        ; Finish compiling assembly code