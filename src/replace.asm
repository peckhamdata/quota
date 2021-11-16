;
;replace and save table
replo2
lda moog
clc
adc tagdag
sta moog
bcc maza
inc moog+1
maza
lda #55
sta roar
;
reploc
lda #$40
sta sabt
ldx intab
lda moog
sta svtab1,x
lda moog+1
sta svtab2,x
lda roar
sta svtab3,x
inc intab
rts
;
rerep
ldx #0
ldy #0
relop
lda svtab1,x
sta moog
lda svtab2,x
sta moog+1
lda svtab3,x
pha
lda dedq
beq ndedq
pla
cmp #56
bne ndedq2
sta (moog),y
jmp ndedq2
ndedq
pla
sta (moog),y
ndedq2
inx
cpx intab
bne relop
lda dedq
bne orp
lda #0
sta sabt
sta intab
orp rts
;
