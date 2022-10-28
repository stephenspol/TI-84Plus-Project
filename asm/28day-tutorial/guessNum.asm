.binarymode TI8X
#include "ti84plus.inc"
#define ProgStart $9D95
#define RndSeed $9000
.org ProgStart - 2
.db t2ByteTok, tAsmCmp

    bcall(_ClrLCDFull)
    bcall(_RunIndicOff)             ; Disable annoying line on the right that indicates the program is running
    ld hl, 0
    ld (curRow), hl                 ; Since curRow and curCol are 1 byte next to each other in memory, hl will replace both
 
    ld hl, startMsg
    bcall(_PutS)                    ; Display initial guess prompt
    
    ld  a, (RndSeed)                ; A random number seed — make the result "more random"
    ld  b, a
    ld  a, r                        ; Get a psudo-random number from 0-127
    add a, b                        ; Combine both random numbers for more randomness (might only go up to 127)

    ld b, 0                         ; Set counter to 0

while:
    jr break

    jr while

break:
    ld hl, winMsg
    bcall(_PutS)

    ret

startMsg:
    .db "Guess a number from 0-255: ", 0

winMsg:
    .db "You won!", 0

.end