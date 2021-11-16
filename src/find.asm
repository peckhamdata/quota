finder
;find sprites
lda ccal
beq ccal1
lda #135
sta gotan
rts
ccal1
lda #255
sta gotan
lda defasd
sta asd
ldx scoff
lda mby8,x
sta sfl
lda mbh8,x
sta sfl+1
ldx smve
lda sfl
sec
sbc sijtoy,x
sta sfl
bcs fsd
lda sfl+1
beq fssd
dec sfl+1
jmp fsd
fssd lda #7
sta sfl+1
fsd
ldx #0
lda #$01
sta sfl2+1
lda #$48
sta sfl2
nom0
lda dog
beq ndedm
lda dedmed,x
beq ndedm
jmp nom4
ndedm lda slig,x
sec
sbc sfl
sta stuff
lda shig,x
sbc sfl+1
sta stuff+1
lda stuff
clc
adc #25
sta stuff
lda stuff+1
adc #0
and #$07
sta stuff+1
;
ldy asd
lda stuff+1
;sfl2+1 contains #1
beq nom3a
cmp #1
bne nom4 ;branch if off screen
;
nom2
lda stuff
cmp sfl2
bcs nom4
nom3
lda msb ;set msb
ora madms,y
sta msb
jmp nom3b
nom3a ;clear msb
lda msb
and madan,y
sta msb
nom3b
lda stuff
sta sprix,y
lda sxig,x
sta spriy,y
lda spig,x
sta sprid,y
lda scig,x
sta spric,y
iny
sty asd
cpy #7
beq nom5
;
nom4
inx
cpx tbl
beq nom00
jmp nom0
nom00 ldx asd
cpx #7
bcs nom5
nom05
lda gotan
and madan,x
sta gotan
inx
cpx #7
bne nom05
nom5 rts
madan .byt 254,253,251,247,239,223,191,127
sijtoy .byt 0,1,2,3,4,5,6,7
;gootn .byt 129,131,134,143,159,191,255
