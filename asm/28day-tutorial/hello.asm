.binarymode TI8X            ; Tells Brass to output a 8xp file for TI83+/TI84+
#include "ti84plus.inc"     ; TI84plus.inc and Ti83plus.inc are identical
#define ProgStart $9D95     ; Start program at defined address
.org ProgStart - 2          ; Program starts a ProgStart address minus 2 bytes due to the tokens below
.db t2ByteTok, tAsmCmp      ; First token specifies that a 2 byte sized token will be used
                            ; Second token lets the program know that it will be assembly code

    bcall(_ClrLCDFull)      ; Clear calculator screen
    ld a, 0                 ; Reset register A to zero
    ld (CurRow), a          ; Set cursor row to zero by changing value in stored address
    ld (CurCol), a          ; Set cursor column to zero by changing value in stored address
    ld hl, msg              ; Load msg into register HL
    bcall(_PutS)            ; Display the text
    bcall(_NewLine)         ; Print a new line
    ret                     ; Exit program

msg:                        ; Starting address to read a string
    .db "Hello Z80!", 0     ; Text to display on screen
                            ; Zero at the end is there because of NTBS (null-byte terminated strings)
                            ; to indicate the ending of the string with a null-byte

.end                        ; Finish compiling assembly code