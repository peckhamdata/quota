t2 .byt 0,2,4,6,8,10,12,14,16,18,20,24
;ofstme .byt 0,6,12,18,24,30,36,42,46,54,60,66,72
ofstme .byt 0,7,14,21,28,35,42,49,56,63,70,77,84
;
;meanie driver
;
meani
lda init
beq noin
yein
;lda #0
;sta levin
ldx levnum
lda qesled,x
sta moog
lda qeslad,x
sta moog+1
   
ldy #0
lavlop
lda (moog),y
sta shig,y
iny
cpy #60
bne lavlop
;
;
ldx #0
lavlo2
lda (moog),y
sta mzp,x
sta mzp3,x
inx
iny
cpy #84
bne lavlo2
;
;
ldx #0
lavlo3
lda (moog),y
sta mtm,x
sta mtm2,x
lda #$40
sta if,x
inx
iny
cpy #96
bne lavlo3
lda #0
sta init
sta ccal
;lda #$40
;sta levin
;
noin
ldx #0
momelo
lda if,x
bne chkit
jmp cokit
chkit
lda t2,x
tay
lda mzp+1,y
cmp #$ff
beq cokit
sta mzp2+1
lda mzp,y
sta mzp2
ldy #0
txa
pha
lda ofstme,x
tax
slck
lda (mzp2),y
sta newpow,x
inx
iny
cpy #7
bne slck
pla
tax
;
;
lda #0
sta if,x
;
cokit ;move meanie
;animate meanie
lda ofstme,x
tay
lda newpow,y
tay
lda anit,y
sta spig,x
lda ofstme,x
tay
inc dtel2
lda dtel2
cmp #5
beq ansm1
jmp cok2
ansm1 lda #0
sta dtel2
lda newpow,y
clc
adc #1
sta newpow,y
cmp newpow+1,y
bne cok2
lda newpow+2,y
sta newpow,y
cok2
txa
pha
lda t2,x
tax
lda mzp,x
cmp #$ff
bne cok2a
pla
tax
jmp doen2
cok2a pla
tax
lda newpow+3,y
and #2
beq posmy
lda sxig,x
sec
sbc newpow+5,y
sta sxig,x
jmp posmx
posmy
lda sxig,x
clc
adc newpow+5,y
sta sxig,x
posmx
lda newpow+3,y
and #1
beq negmx
lda slig,x
sec
sbc newpow+4,y
sta slig,x
bcs cok4a
dec shig,x
cok4a jmp cok3
negmx
lda slig,x
clc
adc newpow+4,y
sta slig,x
bcc cok3
inc shig,x
cok3 lda newpow+6,y
sec
sbc #1
sta newpow+6,y
bne doen2
;no more moves left!
lda #40
sta if,x
lda t2,x
tay
lda mzp,y
clc
adc #7
sta mzp,y
bcc dogx1
lda mzp+1,y
clc
adc #1
sta mzp+1,y
dogx1
lda mtm2,x
sec
sbc #1
sta mtm2,x
bne doen2
lda mtm,x
sta mtm2,x
lda mzp3,y
sta mzp,y
lda mzp3+1,y
sta mzp+1,y
doen2 inx
cpx #12
beq nomelo
jmp momelo
nomelo
rts
;
qesled
.byt <ken1,<ken2,<ken3,<ken4
.byt <ken5,<ken6,<ken7,<ken8
;
qeslad
.byt >ken1,>ken2,>ken3,>ken4
.byt >ken5,>ken6,>ken7,>ken8
;
anit
;mouse left
.byt $10,$11
;
.byt $12,$13
;mouse right
.byt $16,$17
.byt $14,$15
;bas
.byt $18
.byt $19
;umbrella
.byt $1a,$1b,$1c,$1d,$1e,$1f
;rocket left
.byt $e2,$e3,$e4,$e5,$e6,$e7,$e8
.byt $e9,$ea,$eb
;rocket right
.byt $ec,$ed,$ee,$ef,$f0,$f1,$f2
.byt $f3,$f4,$f5
;allykat
.byt $f6,$f7,$f8,$f9,$fa,$fb,$fc
.byt $fb,$fa,$f9,$f8,$f7
;face
.byt $fe,$fe,$ff,$fe
;eyes
.byt $e2,$e3,$e4,$e3
;teapot right
.byt $e5,$e6,$e7,$e8,$e9,$ea
.byt $e9,$e8,$e7,$e6
;cup right
.byt $eb,$ec,$ed,$ee,$ef,$f0
.byt $ef,$ee,$ed,$ec
;carpet right
.byt $f1,$f2
;ghost right
.byt $f3,$f4
;spider left
.byt $f5,$f6,$f7,$f6
;spider right
.byt $f8,$f9,$fa,$f9
;ghost left
.byt $fb,$fc
;carpet left
.byt $fd,$fe
;laze
.byt $be,$bf
;bullet
.byt $bd,$83
;
.byt 24,25,26,27,28,29,30,31
.byt $e4,$e5,$e6,$e7,$e8,$e9,$ea,$eb,$ec,$f1,$f2
