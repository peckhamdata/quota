;
;guns
;
gunz
lda ginit
beq gont
;initalise guns
ldx #1
jsr $bb46
lda #$0
sta ginit
lda spriy
sta spriy+1
lda #$c6
sta sprid+1
lda dirscr
sta gion
cmp #2
beq gonl
;gun on right
;
lda sprix
clc
adc #16
sta sprix+1
jmp gont
;
;gun on left
gonl
lda sprix
sec
sbc #16
sta sprix+1
;
gont
;now move
lda gion
bne nngun
jmp nogun
nngun
ldy #1
jsr colin
cpx #5
beq ngis
txa
pha
tya
pha
ldx #3
jsr $bb46
pla
tay
pla
tax
lda #$40
sta exalg,x
lda alnum
beq jcz1
dec alnum
jcz1 jmp cez1
ngis lda gion
cmp #2
beq gml
;move bullet right
lda msb
and #2
bne gmson
;msb is off
lda sprix+1
clc
adc #16
sta sprix+1
bcc nogun
lda msb
ora #2
sta msb
jmp nogun
;
;msb is on
gmson
lda sprix+1
clc
adc #16
sta sprix+1
cmp #$40
bcc nogun
cez1 lda #0
sta sprix+1
sta gion
lda msb
and #$fd
sta msb
jmp nogun
;
gml
;move bullet left
lda sprix+1
sec
sbc #16
sta sprix+1
cmp #25
bcc gzed
jmp nogun
gzed lda #0
sta sprix+1
sta gion
;
nogun
rts
