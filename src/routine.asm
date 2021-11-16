cls
txa
pha
ldx #0
cloop
lda #$20
sta $4000,x
sta $40fa,x
sta $41f4,x
sta $42ee,x
lda #$08
sta $d800,x
sta $d8fa,x
sta $d9f4,x
sta $daee,x
inx
cpx #$fa
bne cloop
pla
tax
rts
;
status
ldx #0
stalop
lda char,x
sta $4320,x
lda col,x
sta $db20,x
inx
cpx #$c8
bne stalop
rts
char
.byt 27,19,3,15,18,5,28,28,19,8,9,16,19,28,28,8,9,32,19,3,15,18,5
.byt 28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,29
.byt 30,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
.byt 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,31
.byt 30,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
.byt 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,31
.byt 30,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32
.byt 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,31
.byt 33,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28
.byt 28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,35
;
col
.byt 8,0,0,0,0,0,8,8,0,0,0,0,0,8,8,0,0,0,0,0,0,0,0,8,8,8,8,8,8,8,8,8,8,8,8
.byt 8,8,8,8,8
.byt 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
.byt 8,8,8,8,8
.byt 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
.byt 8,8,8,8,8
.byt 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
.byt 8,8,8,8,8
.byt 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
.byt 8,8,8,8,8
;
zeroal
lda #0
ldx #0
zesp
sta sprix,x
inx
cpx #32
bne zesp
rts
;
setpuk
;lda #128
;sta shad
lda msb
and #135
sta msb
ldx #0
spep
lda #108
sta sprix,x
lda #60
sta spriy,x
lda sprs1,x
sta spric,x
lda dadas,x
sta sprid,x
inx
cpx #3
bne spep
lda levc3
sta spric+7
lda #228
sta sprix+7
lda #180
sta spriy+7
lda #120
sta multic
ldx #37
thfall
lda sprix
clc
adc addin-1,x
sta sprix
sta sprix+1
sta sprix+2
lda spriy
clc
adc addin-1,x
sta spriy
sta spriy+1
sta spriy+2
lda sprix+7
sec
sbc addin-1,x
sta sprix+7
lda spriy+7
sec
sbc addin-1,x
sta spriy+7
lda turnt1-1,x
sta sprid+2
sta sprid+7
lda turnt2-1,x
sta sprid+1
lda turnt3-1,x
sta sprid
jsr delay
jsr delay
jsr delay
jsr delay
jsr delay
dex
bne thfall
lda #0
sta ccal
rts
dadas .byt $7d,$6e,$66
turnt1
.byt $66,$66,$66,$67,$68,$69,$6a,$6b,$6c
.byt $6d,$6c,$6b,$6a,$69,$68,$67
.byt $66,$67,$68,$69,$6a,$6b,$6c
.byt $6d,$6c,$6b,$6a,$69,$68,$67
.byt $89,$89,$88,$87,$86,$85,$84
;
turnt2
.byt $6e,$6e,$6e,$6f,$70,$71,$72,$73,$74
.byt $75,$74,$73,$72,$71,$70,$6f
.byt $70,$71,$72,$73,$74,$75,$74
.byt $75,$74,$73,$72,$71,$70,$6f
.byt $8f,$8f,$8e,$8d,$8c,$8b,$8a
turnt3
.byt $76,$76,$76,$77,$78,$79,$7a,$7b,$7c
.byt $7d,$7c,$7b,$7a,$79,$78,$77
.byt $78,$79,$7a,$7b,$7c,$7d,$7c
.byt $7b,$7a,$79,$78,$77,$76,$76
.byt $94,$94,$94,$93,$92,$91,$90
addin
.byt 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
.byt 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
.byt 0,0,0,0,0,0,0
;
;intro routine
;
intro
jsr cls
jsr bada
lda #255
sta $d015
lda #0
sta $d01c
lda #24
sta $d000
lda #51
sta $d001
lda #1
sta $d027
sta $d021
;
ldx #3
inlp
lda $d012
cmp #$fb
bne inlp
cpx #3
bne jono2
jsr doly1
jono2 cpx #2
bne jono1
jsr doly2
jono1 cpx #1
bne jono0
jsr doly3
jono0 dex
bne inlp
ldx #5
inlp2
lda $d012
cmp #$fb
bne inlp2
jsr delay
jsr delay
jsr delay
jsr delay
jsr delay
lda chanc-1,x
sta $d021
dex
bne inlp2
;jsr scores
rts
;
chanc .byt 0,11,12,15,1
chanc1 .byt 1,15,12,11,0,11,12,15,1
texus .byt 17,21,15,20,01
texus2 .byt 1,32,7,1,13,5,32,2,25,32,3,8,18,9,19,32,25,15,21,14,7
texus3 .byt 20,8,5,32,7,1,13,5,32
.byt 23,9,12,12,32,14,15,23,32,2,5
.byt 7,9,14,32
;
doly1
txa
pha
ldx #0
dolop1
lda texus,x
sta $4000,x
ldy #8
dolop2
lda $d012
cmp #$fb
bne dolop2
jsr delay
jsr delay
jsr delay
inc $d000
lda chanc1,y
sta $d027
dey
bne dolop2
;
inx
cpx #5
bne dolop1
;
ldx #8
dolop3
lda $d012
cmp #$fb
bne dolop3
jsr delay
jsr delay
jsr delay
lda chanc1,x
sta $d027
lda $d000
sec
sbc #5
sta $d000
lda $d001
clc
adc #2
sta $d001
dex
bne dolop3
pla
tax
rts
;
doly2
txa
pha
ldx #0
dolop4
lda texus2,x
sta $4050,x
ldy #8
dolop5
lda $d012
cmp #$fb
bne dolop5
jsr delay
jsr delay
jsr delay
inc $d000
lda chanc1,y
sta $d027
dey
bne dolop5
;
inx
cpx #21
bne dolop4
;
ldx #8
dolop6
lda $d012
cmp #$fb
bne dolop6
jsr delay
jsr delay
jsr delay
lda $d000
sec
sbc #21
sta $d000
lda $d001
clc
adc #2
sta $d001
lda chanc1,x
sta $d027
dex
bne dolop6
pla
tax
rts
;
doly3
txa
pha
ldx #0
dolop7
lda texus3,x
sta $4050+80,x
ldy #8
dolop8
lda $d012
cmp #$fb
bne dolop8
jsr delay
jsr delay
jsr delay
inc $d000
lda chanc1,y
sta $d027
dey
bne dolop8
;
inx
cpx #23
bne dolop7
;
ldx #8
dolop9
lda $d012
cmp #$fb
bne dolop9
jsr delay
jsr delay
jsr delay
lda chanc,x
sta $d027
dex
bne dolop9
lda #0
sta $d000
pla
tax
rts
ofk .byt 0,8,16,24,32,40,48
inst2 .byt 0,0,6,14,1,14,6,0
.byt 0,0,15,1,15,12,11,0
.byt 0,0,3,1,3,14,6,0
.byt 0,0,5,13,1,13,5,0
.byt 0,0,4,14,3,14,4,0
.byt 0,0,4,14,3,14,4,0
inst3 .byt 0,0,6,14,1,14,6,0
.byt 0,0,15,1,15,12,11,0
.byt 0,0,2,10,7,10,2,0
.byt 0,0,4,14,3,14,4,0
.byt 0,0,2,10,1,10,2,0
.byt 0,0,2,10,1,10,2,0
inst4 .byt 0,0,6,14,1,14,6,0
.byt 0,0,15,1,15,12,11,0
.byt 0,0,3,1,3,14,6,0
.byt 0,0,5,13,1,13,5,0
.byt 0,0,4,14,3,14,4,0
.byt 0,0,4,14,3,14,4,0
;
link
jsr bada
lda #$40
sta linflg
ldy #0
sty $d000
sty $d000+1
sty $d000+2
sty $d000+3
sty $d000+4
sty $d000+5
ldx linum
lda ofk,x
tax
limp1
lda inst2,x
sta tac2,y
lda inst3,x
sta tac3,y
lda inst4,x
sta tac4,y
inx
iny
cpy #8
bne limp1
jsr bada
;
ldx linum
lda tex1a,x
sta moog
lda tex1b,x
sta moog+1
lda tex2a,x
sta meeg
lda tex2b,x
sta meeg+1
lda tex3a,x
sta miig
lda tex3b,x
sta miig+1
ldy #0
lino2
lda (moog),y
cmp #$20
beq hairm1
sec
sbc #64
hairm1
sta $40a0+$28,y
lda (meeg),y
cmp #$20
beq hairm2
sec
sbc #64
hairm2
sta $40f0+$28,y
lda (miig),y
cmp #$20
beq hairm3
sec
sbc #64
hairm3
sta $4140+$28,y
lda linum
cmp #2
beq hairm5
lda jig,y
cmp #$20
beq hairm4
sec
sbc #64
hairm4
sta $41e0-$28,y
hairm5
iny
cpy #$28
bne lino2
lda #$80
sta linflg
;test for fire
;lda #0
;sta pcyc
;sta ppos
;sta moog
;sta moog+1
;lda #1
;sta $d027
lda #127
sta $dc00
lp ;ping ting
;inc moog
;lda moog
;cmp #$ff
;bne nob1
;inc moog+1
;lda moog+1
;cmp #8
;bne nob1
;lda #0
;sta moog+1
;ldx ppos
;lda pinx,x
;sta $d000
;lda piny,x
;sta $d001
;ldx pcyc
;lda pdat,x
;sta $43f8
;inc pcyc
;lda pcyc
;cmp #5
;bne nob1
;lda #0
;sta pcyc
;inc ppos
;lda ppos
;cmp #6
;bne nob1
;lda #0
;sta ppos
;calculate bonus
ldx bone
beq nob1
cbl
lda bonelo,x
sta $40a0+$28+20
lda bonehi,x
sta $40a0+$28+19
lda #50
sta poival
jsr skores
jsr scores
txa
pha
ldx #14
jdx1 jsr delay
dex
bpl jdx1
pla
tax
dex
bpl cbl
lda #0
sta bone
nob1
lda linum
cmp #2
bne nob121
ldx #0
nob12a jsr delay
inx
cpx #100
bne nob12a
jmp nob12b
nob121
lda $dc00
cmp #111
bne nob121
nob12b
lda #0
sta linflg
lda #6
sta scoff
lda linum
cmp #1
bne hos
jsr deflev
lda #0
sta dedq
hos jsr ccls
rts
jig .byt '               press fire               '
tex1a .byt <mp1,<mq1,<mr1,<ms1,<ms5
.byt <ms6
tex1b .byt >mp1,>mq1,>mr1,>ms1,>ms5
.byt >ms6
tex2a .byt <mp2,<mq2,<mr2,<ms2,<ms2
.byt <ms2
tex2b .byt >mp2,>mq2,>mr2,>ms2,>ms2
.byt >ms2
tex3a .byt <mp3,<mq3,<mr3,<ms3,<ms4
.byt <ms4
tex3b .byt >mp3,>mq3,>mr3,>ms3,>ms4
.byt >ms4
mp1 .byt '               well done               '
mp2 .byt '                                        '
mp3 .byt '              do it again               '
mq1 .byt '                                        '
mq2 .byt '            droid  destroyed            '
mq3 .byt '                                        '
mr1 .byt '            droid  destroyed            '
mr2 .byt '               game  over               '
mr3 .byt '                                        '
ms1 .byt '                complete             '
ms2 .byt '             now advance to             '
ms3 .byt '               bonus game               '
ms4 .byt '               next level               '
ms5 .byt '             sorry no bonus             '
ms6 .byt '             bonus 00 x ',$91,$8c,'                '
;
;fade up
;
th .byt 0
thru .byt 0,0,0,0,0,0
fup
txa
pha
tya
pha
lda levc1
sta thru+5
lda levc2
sta thru+4
lda levc3
sta thru+3
lda #0
sta thru
sta thru+1
sta thru+2
;
ldy #0
tlp2
ldx #0
tlp lda thru+1,x
sta thru,x
inx
cpx #5
bne tlp
jsr delay
jsr delay
jsr delay
jsr delay
iny
cpy #3
bne tlp2
pla
tay
pla
tax
rts
;
;
fdp
txa
pha
tya
pha
ldy #0
tld2
ldx #6
tld lda th-1,x
sta th,x
dex
bne tld
jsr delay
jsr delay
jsr delay
jsr delay
iny
cpy #3
bne tld2
pla
tay
pla
tax
rts
pinx .byt 120,200,170,110,138,150
piny .byt 100,108,100,116,108,116
pdat .byt $b6,$b8,$b9,$ba,$bb,$bc
pcn .byt 1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6
ccls ldx #0
cloo2
lda #$20
sta $4000,x
sta $40c8,x
sta $4190,x
sta $4258,x
lda #$08
sta $d800,x
sta $d8c8,x
sta $d990,x
sta $da58,x
inx
cpx #$c8
bne cloo2
rts
explsh
ldx #37
exlsop
lda turnt1-1,x
sta sprid+7
sta sprid+2
lda turnt2-1,x
sta sprid+1
lda turnt3-1,x
sta sprid
jsr delay
jsr delay
jsr delay
jsr delay
jsr delay
jsr delay
jsr delay
jsr delay
jsr delay
dex
cpx #30
bne exlsop
rts
bada
ldx #0
cloo
lda #$20
sta $4000,x
sta $40c8,x
sta $4190,x
sta $4258,x
lda #$00
sta $d800,x
sta $d8c8,x
sta $d990,x
sta $da58,x
inx
cpx #$c8
bne cloo
rts
