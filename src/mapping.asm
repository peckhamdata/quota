maping
lda scoff
cmp #$f0
bcc alzazq
rts
alzazq
lda tagon
beq azzaz
jmp roop1
azzaz lda #0
sta notag
sta lftflg
sta ritflg
sta upflg
sta doflg
;do x
roop1
ldx scoff
lda squtab,x
sta mapoff
sta mapx
lda whtax,x
sta wherex
;do y
lda spriy
sec
sbc #47
lsr a
lsr a
lsr a
tax
lda squhi,x
sta mapoff+1
lda squsi,x
sta mapy
lda mapoff
clc
adc squlo,x
sta mapoff
bcc nochag
inc mapoff+1
nochag
lda whtay,x
sta wherey
;
ldy levnum
lda rool,y
sta moog
lda rooh,y
sta moog+1
lda moog+1
clc
adc mapoff+1
sta moog+1
lda moog
clc
adc mapoff
sta moog
bcc nochg2
inc moog+1
nochg2
lda lorx2
beq roop2b
jsr spray
roop2b
lda tagon
beq roop2a
jmp roop2
roop2a
;
;chk nogo
;left
;
ldy #0
lda wherex
bne omlf
lda moog+1
sta meeg+1
lda moog
sec
sbc #1
sta meeg
bcs nso1
dec meeg+1
nso1
lda (meeg),y
tax
lda nogo,x
sta lftflg
omlf
;
;right
lda wherex
cmp #2
bne omrt
lda moog+1
sta meeg+1
lda moog
clc
adc #1
sta meeg
bcc nso2
inc meeg+1
nso2
lda (meeg),y
tax
lda nogo,x
sta ritflg
omrt
;
;down
lda wherey
cmp #2
bne omdo
lda moog+1
sta meeg+1
lda moog
clc
adc #85
sta meeg
bcc nso3
inc meeg+1
nso3
lda (meeg),y
tax
lda nogo,x
sta doflg
omdo
;
;up
lda wherey
bne omup
lda moog+1
sta meeg+1
lda moog
sec
sbc #85
sta meeg
bcs nso4
dec meeg+1
nso4
lda (meeg),y
tax
lda nogo,x
sta upflg
lda (meeg),y
cmp #53
bne omup
jmp chute
omup
lda (moog),y
tax
stx roar
lda rnum,x
tax
beq outmp
lda dog
beq getit
lda dogtab-1,x
beq outmp
getit lda addrm-1,x
sta meeg
lda addr2-1,x
sta meeg+1
jmp (meeg)
;
;
;
outmp lda #0
sta $d020
rts
;
;remove later
;
num2 .byt 0,1,2,3,4,5,6,7,8,9
.byt 0,1,2,3,4,5,6,7,8,9
.byt 0,1,2,3,4,5,6,7,8,9
.byt 0,1,2,3,4,5,6,7,8,9
.byt 0,1,2,3,4,5,6,7,8,9
.byt 0,1,2,3,4,5,6,7,8,9
.byt 0,1,2,3,4,5,6,7,8,9
.byt 0,1,2,3,4,5,6,7,8,9
num1 .byt 0,0,0,0,0,0,0,0,0,0
.byt 1,1,1,1,1,1,1,1,1,1
.byt 2,2,2,2,2,2,2,2,2,2
.byt 3,3,3,3,3,3,3,3,3,3
.byt 4,4,4,4,4,4,4,4,4,4
.byt 5,5,5,5,5,5,5,5,5,5
.byt 6,6,6,6,6,6,6,6,6,6
.byt 7,7,7,7,7,7,7,7,7,7
;
;no go table
;
nogo
.byt 1,1,1,1,1,1,1,1,1,0
.byt 0,0,0,0,0,0,0,0,0,0
.byt 0,0,1,1,1,1,0,0,0,0
.byt 0,0,0,0,0,0,0,0,0,0
.byt 0,0,0,0,0,0,0,0,0,0
.byt 0,0,0,1,1,1,0,0,0,0
.byt 0,0,0,0,0,0,0,1,0,1
.byt 0,0,0,1,1,0,0,0,0,0
.byt 0,0,0,0,0,0,0
.byt 1,0,0,1,0,0,0,1,1,1,1,0,0,1,1,0,1,0,1,0,0,1,0,0,0
.byt 1,1,1,1,1,1,1,1,1,1,0,0,1,1,0,0,0,1,1,1,1,1,1
.byt 1,1,0,1,1,1,0,1,1,1,0,0,0,0,0
.byt 0,0,0,0,0,0
;
whtay
.byt $00,$01,$02
.byt $00,$01,$02
.byt $00,$01,$02
.byt $00,$01,$02
.byt $00,$01,$02
.byt $00,$01,$02
rnum
.byt 0,0,0,0,0,0,0,0,0,0
.byt 0,0,0,1,2,3,4,5,0,0
.byt 0,0,0,0,0,0,11,0,0,0
.byt 0,0,0,0,0,0,0,0,0,0
.byt 0,0,0,0,0,0,0,0,0,0
.byt 0,0,0,6,6,0,12,12,12,12
.byt 12,12,12,7,8,9,10,0,0,0
.byt 0,0,0,0,0,0,0,0,0,0
.byt 0,0,0,0,0,0,0
.byt 0,0,0,0,13,14,15
.byt 0,0,0,0,0,0,0,0,0,0,0,0,11,11
.byt 0,16,17,11
.byt 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,18
.byt 0,0,0,0,0,0,0,0
.byt 12,12,12,12,12,12
addrm
.byt <hole,<land,<eng,<off
.byt <unit,<chute,<s7,<e8,<n9,<t10
.byt <dief,<colps
.byt <port,<opopt,<river
.byt <def2,<def3,<grand
addr2
.byt >hole,>land,>eng,>off
.byt >unit,>chute,>s7,>e8,>n9,>t10
.byt >dief,>colps
.byt >port,>opopt,>river
.byt >def2,>def3,>grand
;
;
;
land
lda #$40
sta notag
lda dog
bne lrt2
jmp lrt
lrt2 lda zapflg
bne lrt3
jmp lrt
lrt3
lda turv
beq lrt5
jmp lrt
lrt5 lda speed
cmp gizpd
beq lrt4
jmp lrt
lrt4
ldx #6
jsr $bb46
ldx #7
jsr $bb46
lda #0
sta dog
sta dirv
sta dirscr
jsr exman
jsr clspik
lda #3
sta defasd
lda #12
sta tbl
jsr trans2
ldx #2
frip
lda turnt3-1,x
sta sprid
lda turnt2-1,x
sta sprid+1
lda turnt1-1,x
sta sprid+2
sta sprid+7
lda spriy+7
sec
sbc #2
sta spriy+7
lda sprix+7
sec
sbc #2
sta sprix+7
jsr delay
jsr delay
jsr delay
inx
cpx #18
bne frip
;
;
;
;
pla
pla
lda msb
and #248
sta msb
jmp sstaz
lrt rts
;
;
eng
ldx #11
jsr $bb46
lda #0
sta tirep
jsr remove
lda manerg
cmp #4
bcc oen2
;lda minerg
;cmp #7 ;8
;bne oen2
jmp oen
oen2 lda minerg
clc
adc #4
sta minerg
cmp #8
bcc oen
lda manerg
cmp #4
beq oen
lda minerg
sec
sbc #8
sta minerg
lda manerg
cmp #4
beq oen
inc manerg
oen rts
;
off
lda #$40
sta notag
lda dirscr
beq gol
rts
gol
lda zapflg
bne zaptst
rts
zaptst
lda lint
beq zapts2
jmp unit3
zapts2
ldx #4
jsr $bb46
ldx #5
jsr $bb46
lda #0
sta lorx2
lda #128
sta shad
ldx #0
stx dirv
lda sprix
sta sprix+7
lda levc3
sta spric+7
fliplp
lda turnt3,x
sta sprid
lda turnt2,x
sta sprid+1
lda turnt1,x
sta sprid+2
sta sprid+7
lda spriy+7
clc
adc #2
sta spriy+7
lda sprix+7
clc
adc #2
sta sprix+7
txa
pha
ldx #7
hlfs1
jsr delay
dex
bpl hlfs1
pla
tax
inx
cpx #16
bne fliplp
lda manerg
cmp #3
bcs imok
ldx #16
flipl2
lda turnt3-1,x
sta sprid
lda turnt2-1,x
sta sprid+1
lda turnt1-1,x
sta sprid+2
sta sprid+7
lda spriy+7
sec
sbc #2
sta spriy+7
lda sprix+7
sec
sbc #2
sta sprix+7
jsr delay
jsr delay
jsr delay
jsr delay
dex
bne flipl2
;
;
;
;
;
rts
imok jsr trans1
lda #2
sta defasd
lda #5
sta tbl
lda #1
sta dirscr
lda gizpd
sta speed
lda #$40
sta init
pla
pla
jmp space
;
;
unit
ldx #12
jsr $bb46
lda #0
sta tirep
jsr remove
dec monum
lda lint
beq lint6
unit3
lda #$40
sta ress
unit2
lda #$83
sta sprid
sta sprid+1
sta sprid+2
sta sprid+7
lda #0
sta dirv
sta dirscr
sta $d017
sta $d01d
lda bod
sta levnum
jsr ccls
jsr deflev
lda #$66
ldx #$6e
ldy #$76
sta sprid+2
sta sprid+7
stx sprid+1
sty sprid
lda #0
sta lint
sta ccal
pla
pla
lda spriy
sta spriy+7
lda sprix
sta sprix+7
jmp resto
lint6 rts
;
chute
lda dirscr
bne rsts
lda dirv
bne rsts
lda dog
bne rsts
lda bomb
cmp #3
beq rsts
inc bomb
lda #$40
sta bom2
lda #248
sta multic
lda #0
sta spric+7
lda #$b6
sta sprid+7
lda sprix
sta sprix+7
lda spriy
sec
sbc #9
sta spriy+7
ldx #0
slps
lda bomt,x
sta sprid+7
jsr delay
jsr delay
jsr delay
jsr delay
jsr delay
inx
cpx #15
bne slps
lda spriy
sta spriy+7
lda #120
sta multic
lda levc3
sta spric+7
rsts rts
;
s7
ldx #0
nc0
lda compx,x
cmp wherex
bne nc1
lda compy,x
cmp wherey
bne nc1
jmp dief
nc1 inx
cpx #3
bne nc0
rts
compx .byt 0,1,0
compy .byt 0,0,1
;
;
e8
ldx #0
nc2
lda compx2,x
cmp wherex
bne nc3
lda compy2,x
cmp wherey
bne nc3
jmp dief
nc3 inx
cpx #3
bne nc2
rts
compy2 .byt 1,2,2
compx2 .byt 0,0,1
rts
;
n9
ldx #0
nc4
lda compx3,x
cmp wherex
bne nc5
lda compy3,x
cmp wherey
bne nc5
jmp dief
nc5 inx
cpx #3
bne nc4
rts
compx3 .byt 1,2,2
compy3 .byt 0,0,1
;
;
t10
ldx #0
nc6
lda compx4,x
cmp wherex
bne nc7
lda compy4,x
cmp wherey
bne nc7
jmp dief
nc7 inx
cpx #3
bne nc6
rts
compx4 .byt 2,1,2
compy4 .byt 1,2,2
sta $d020
rts
;
dief
lda lint
beq lintz
lda #0
sta $d017
sta $d01d
jsr falout
lda #0
sta sprix
sta sprix+1
sta sprix+2
sta sprix+7
jmp defe
lintz jsr falout
defe
dec life
jsr scores
lda #$40
sta dedq
jsr rerep
lda #$40
sta ccal
jsr fdp
;jsr deflev
lda #128
sta shad
lda #0
sta ress
lda #1
sta linum
lda life
bne nomi
lda #0
sta dedq
lda sabt
beq nomi3
jsr rerep
nomi3
lda #3
sta defasd
lda #12
sta tbl
lda #5
sta life
lda #$0f
sta $d024
lda #2
sta linum
jsr fdp
lda #$00
sta levin
jsr bada
jsr link
lda #$40
sta levin
pla
pla
jmp retaz
nomi
jsr fdp
lda #$00
sta levin
jsr bada
jsr link
lda #$40
sta levin
lda lint
beq lintaz
jmp unit2
lintaz pla
pla
lda dogne
beq linta2
jmp jazzaj
linta2 lda dog
beq dog2z
lda #$40
sta init
jsr sman
lda #1
sta dirscr
lda gizpd
sta speed
lda #9
sta spept
lda #$da
sta sprid
lda #$e1
sta sprid+7
lda #$ec
sta scoff
jsr fup
jmp space
dog2z jmp resto
jazzaj
lda #3
sta defasd
lda #12
sta tbl
lda #0
sta dog
sta dirscr
lda #3
sta scoff
lda #120
sta multic
lda msb
and #$fb
sta msb
jmp resto
;
colps
lda roar
sec
sbc #$38
tax
lda klas,x
sta tirep
jsr remove
rts
klas .byt 3,4,5,6,7,8,9
.byt 0,0,0,0,0,0,0
.byt 0,0,0,0,0,0,0,0,0,0
.byt 0,0,0,0,0,0,0
.byt 0,0,0,0,0,0,0
.byt 0,0,0,0,0,0,0,0,0,0,0,0,0,0
.byt 0,0,0,0
.byt 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.byt 0,0,0,0,0,0,0,0
.byt 10,11,12,13,14,15
;
remx .byt 0,3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48,51,54,57,60,63,66
.byt 69,72,75,78,81,84,87,90,93,96,99,102,105,108,111,114,117,120,123,126
.byt 129,132,135,138,141,144,147,150,153,156,159,162,165,168,171,174,177
.byt 180,183,186,189,192,195,198,201,204,207,210,213,216,219,222,225,228
.byt 231,234,237,240,243,246,249,252,255
remy .byt $00,$fd,$fa,$f7,$f4,$f1
remy2 .byt $00,$02,$05,$08,$0b,$0e
remove
;
ldx tirep
lda trap1,x
sta trep2
lda trap2,x
sta trep2+1
lda trap3,x
sta trep4
lda trap4,x
sta trep5
lda #$e0
sta miig+1
lda #$00
sta miig
ldx mapx
lda #$00
clc
adc remx,x
sta miig
ldx mapy
lda miig
clc
adc remy,x
sta miig
bcc norem1
inc miig+1
norem1
lda miig+1
clc
adc remy2,x
sta miig+1
;
ldx #0
stx tinx
cov2
ldy #0
cover
tya
pha
ldy tinx
lda (trep2),y
sta tinx2
pla
tay
lda tinx2
sta (miig),y
inc tinx
iny
cpy #3
bne cover
lda miig
clc
adc #$ff
sta miig
bcc cov3
inc miig+1
cov3
inx
cpx #3
bne cov2
lda tagon
beq roop6
rts
roop6
ldy #0
lda trep4
sta (moog),y
lda trep5
beq traz
jsr reploc
traz rts
falsp .byt $a2,$a3,$a4,$a5,$a6,$a7,$83
fals2 .byt $9c,$9d,$9e,$9f,$a0,$a1,$83
fals3 .byt $96,$97,$98,$99,$9a,$9b,$83
bomt .byt $a8,$a9,$aa,$ab,$ac,$ad,$ae,$af,$b0,$b1,$b2,$b3,$b4,$b5,$b6
roop2 ;what's bomb over
lda moog
sec
sbc #1
sta moog
bcs roop3
dec moog+1
roop3
ldy tagdag
lda (moog),y
cmp #55
bne roop4
;explode
tya
pha
ldx #3
jsr $bb46
pla
tay
inc multic
lda #10
sta spric
ldx #0
exmul
lda burn,x
sta sprid
jsr delay
jsr delay
jsr delay
jsr delay
inx
cpx #6
bne exmul
dec multic
dec mapx
lda mapx
clc
adc tagdag
sta mapx
lda #1
sta tirep
jsr remove
ldy tagdag
lda #12
sta (moog),y
jsr replo2
;
roop4 rts
tagdag .byt 0
burn .byt $7e,$7f,$80,$81,$82,$83,$b6
port
lda #2
sta tirep
jsr remove
rts
opopt
lda wherex
cmp #1
bne nan2
jsr falout
lda levnum
sta bod
tax
lda hid,x
sta levnum
jsr fdp
jsr bada
jsr clspik
lda #$40
sta lint
jsr deflev
lda #$66
ldx #$6e
ldy #$76
sta sprid+2
sta sprid+7
stx sprid+1
sty sprid
lda #1
sta spric+7
lda sprix
sec
sbc #12
sta sprix+7
lda spriy
sec
sbc #12
sta spriy+7
lda #128
sta $d017
sta $d01d
nan rts
nan2 rts
river
inc $d020
rts
def3
lda wherey
beq green1
jmp dief
green1 rts
def2
lda wherey
cmp #2
beq green2
jmp dief
green2 rts
grand ;zap spray for plant level!
lda #20
sta spct
lda #$40
sta sprax
lda #0
sta tirep
jsr remove
rts
tra1 .byt $c0,$c1,$c2
trans1
;transmute routine
ldx #0
tralp1
lda tra1,x
sta sprid+2
sta sprid+7
inx
cpx #2
bne trall1
lda #0
sta sprix
sta sprix+1
trall1
txa
pha
ldx #10
lfs1 jsr delay
dex
bpl lfs1
pla
tax
cpx #3
bne tralp1
lda #$e1
sta sprid+7
lda #$da
sta sprid
sta sprid+2
lda sprs2
sta spric
lda #127
sta multic
lda sprix+2
sta sprix
lda #0
sta sprix+2
rts
;
trans2
lda #0
sta spriy+1
sta spriy+2
lda tra1+2
sta sprid
lda sprs3
sta spric
lda #120
sta multic
lda msb
and #$fb
sta msb
ldx #3
tralq1
lda tra1-1,x
sta sprid
sta sprid+7
txa
pha
ldx #10
l4sl jsr delay
dex
bpl l4sl
pla
tax
dex
bne tralq1
lda sprs1
sta spric
lda sprs2
sta spric+1
lda sprs3
sta spric+2
lda #76
sta sprid
lda #$6e
sta sprid+1
lda #$66
sta sprid+2
lda sprix
sta sprix+1
sta sprix+2
lda spriy
sta spriy+1
sta spriy+2
rts
exman
ldx #0
exmlp
lda epld,x
ldy #0
exmlp2
sta spig,y
iny
cpy #5
bne exmlp2
jsr delay
jsr delay
jsr delay
jsr delay
inx
cpx #6
bne exmlp
lda #$40
sta init
rts
;
epld .byt $7e,$7f,$80,$81,$82,$83,$ce,$ce,$ce
epld2 .byt $84,$85,$86,$87,$88,$83
sdef
lda #0
sta turv
ldx #0
sxmlp
lda epld,x
ldy #0
sxmlp2
sta sprid,y
iny
cpy #2
bne sxmlp2
lda epld2,x
sta sprid+7
jsr delay
jsr delay
jsr delay
jsr delay
inx
cpx #6
bne sxmlp
lda msb
and #$fb
sta msb
rts
trap3 .byt 12,54,92,57,58,59,60,61,62,$96,$97,$98,$99,$9a,$9b,26
trap1 .byt <partd,<juga,<lob93
.byt <jugd,<jugd,<juge
.byt <juge,<jugf,<jugf,<jugg
.byt <jugg,<jugh,<jugh
.byt <jugi,<jugi,<partr,<partr
trap2 .byt >partd,>juga,>lob93
.byt >jugd,>jugd,>juge
.byt >juge,>jugf,>jugf,>jugg
.byt >jugg,>jugh,>jugh
.byt >jugi,>jugi,>partr,<partr
trap4 .byt 1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
spray
lda sprax
bne norst1
jmp sprst
norst1
lda zapflg
beq sprst
;
jsr te
lda lorx
cmp #1
beq splf1
;
ldy #2
lda (moog),y
cmp #$8f
beq ydes
cmp #$90
beq ydes
jsr re
jmp sprst
;
ydes ;destroy
sta roar
inc mapx
lda #0
sta tirep
jsr re
jsr re
jsr remove
jsr te
dec mapx
dec spct
lda spct
bne dddny
sta sprax
sta lorx2
dddny jmp sprst
;
splf1
ldy #0
lda (moog),y
cmp #$8f
beq zdes
cmp #$90
beq zdes
jsr re
jmp sprst
;
zdes ;destroy
sta roar
dec mapx
lda #0
sta tirep
jsr remove
jsr re
inc mapx
dec spct
lda spct
bne sprst
sta sprax
sta lorx2
sprst rts
;
;re
;
re
lda moog
clc
adc #1
sta moog
bcc nobbs3
inc moog+1
nobbs3
rts
te
lda moog
sec
sbc #1
sta moog
bcs nobbs2
dec moog+1
nobbs2
rts
spct .byt 0
trep5 .byt 0
falout
ldx #8
jsr $bb46
lda #$83
sta sprid+7
ldx #0
stx dirscr
stx dirv
stx lorx2
lda sprix
sta sprix+7
dielop
lda falsp,x
sta sprid
lda fals2,x
sta sprid+1
lda fals3,x
sta sprid+2
sta sprid+7
jsr delay
jsr delay
jsr delay
jsr delay
jsr delay
jsr delay
jsr delay
inx
cpx #7
bne dielop
rts
hid .byt 0,0,9,0,0,10,0,0,0,0
