scores
txa
pha
ldx #0
scoop
lda scoreb,x
clc
adc #$30
sta $4349,x
lda scoreh,x
clc
adc #$30
sta $4359,x
lda #1
sta $db49,x
sta $db59,x
inx
cpx #5
bne scoop
lda life
clc
adc #$30
sta $4352
lda #1
sta $db52
pla
tax
rts
;
scoset
ldx #0
lda #0
scalop
sta scoreb,x
inx
cpx #5
bne scalop
lda #5
sta life
rts
;
scoreh .byt 1,0,0,0
scoreb .byt 0,0,0,0
