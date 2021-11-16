nerg ;do energy display
lda dog
beq neg22
dec longti
bne neg22
dec longti+1
bne neg22
lda #$01
sta longti+1
lda minerg
beq neg221
dec minerg
jmp neg22
neg221 lda #7
sta minerg
lda manerg
cmp #1
bne neg222
sta dogne
pla
pla
jmp beenup
;
neg222
dec manerg
neg22
ldx #0
clrlop
lda #$20
sta entob,x
lda #0
sta curn2,x
inx
cpx #5
bne clrlop
ldx manerg
noglop
lda #$47
sta entob,x
lda curn,x
sta curn2,x
dex
bne noglop
ldx manerg
lda minerg
clc
adc #$40
sta entob,x
ldx #0
itlop
lda entob,x
sta $439b-1,x
lda curn2,x
sta $db9b-1,x
inx
cpx #5
bne itlop
lda #$48
sta $4399
lda #$49
sta $43a1
lda #$4a
sta $43a6
lda #1
sta $db99
sta $dba1
sta $dba6
ldx monum
lda num1,x
clc
adc #48
sta $43a3
lda num2,x
clc
adc #48
sta $43a4
ldx alnum
lda num1,x
clc
adc #48
sta $43a8
lda num2,x
clc
adc #48
sta $43a9
lda #1
sta $dba3
sta $dba4
sta $dba8
sta $dba9
ldx #2
blex
lda #$20
sta bstrn,x
lda #0
sta bstco,x
dex
bpl blex
ldx bomb
beq bort
blex2
lda #$4b
sta bstrn-1,x
lda #3
sta bstco-1,x
dex
bne blex2
bort
ldx #2
blex3
lda bstrn,x
sta $43ab,x
lda bstco,x
sta $dbab,x
dex
bpl blex3
rts
curn .byt 2,2,5,5,5
curn2 .byt 0,0,0,0,0
bstrn .byt 0,0,0
bstco .byt 0,0,0
