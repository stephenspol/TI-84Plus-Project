.binarymode TI8X
#include "ti84plus.inc"
#define ProgStart $9D95

#define maxPenCol 95
#define maxTxtWidth 6
#define txtHeight 7
.org ProgStart - 2
.db t2ByteTok, tAsmCmp

    bcall(_ClrLCDFull)
    ld a, 0
    ld (penCol), a
    ld hl, penRow                  ; Set hl to penRow for future quick access
    ld (hl), a

    ld b, 255                      ; Start for loop at 255

forLoop:                           ; For loop from 255 (inclusive) to 0 (exclusive)
                                   ; Ascii will be reversed for this reason

    ld a, b                        ; Sync register a with register b; register a gets destroyed by bcall
    bcall(_VPutMap)                ; Print register a as small ascii and increment penCol

    ld a, (penCol)                 ; Get current penCol position
    cp maxPenCol - maxTxtWidth     ; Check if end of column
    jr c, continue                 ; If penCol < 89 goto continue and skip

    ld a, 0
    ld (penCol), a                 ; Put penCol back to 0
    ld a, txtHeight                ; small text is 7 penRow's high
    add a, (hl)                    ; Add text height offset to penRow
    ld (hl), a                     ; Update penRow

continue:
    djnz forLoop                   ; Decrement b and jump to forLoop if b > 0

    res donePrgm, (iy + doneFlags) ; Disable "done" after pgrm finishes

    ret

.end