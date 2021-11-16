angt .byt $cb,$cc,$c8,$c9,$ca
ginus .byt 0
angin .byt 0
;game loop
go
jsr status
lda #0
sta tagon
sta lorx2
sta lorx
sta sprax
sta dog
sta dtel2
sta ghosti
lda #1     ;it couldn't happen
sta manerg ;here
lda #0
sta minerg
sta inmu
sta bomb
sta bom2
sta ginus
resto
jsr fup
resso2
lda #0
sta dedq
sta dogne
lda #2
sta angin
lda #128
sta shad
lda #$40
sta init
lda ress
bne sstaz
jsr setpuk
sstaz
lda #0
sta ress
lda #2
sta speed
start jsr scores
jsr lejmp
lda lint
bne lint2
jsr meani
lint2
lda lint
bne pob
lda tagon
bne pob
ldy #0
jsr colin
cpx #12
beq pob
ldx #0
jsr $bb46
inc ginus
lda ginus
cmp #25
bne pob
lda #128
sta shad
lda sprix
sta sprix+7
lda #0
sta ginus
sta dirv
sta dirscr
jsr explsh
jsr defe
pob
lda $d012
cmp #$c0
bne pob
jsr nerg
lda tagon
bne noinmu
jsr maping
jsr anban
;check spray
jsr sprjr
lda #0
sta lorx2
jmp noin2
;
noinmu
jsr chetag
noin2
;do ghost noises
lda lint
beq ghno
dec ghosti
bne ghno
ldx #10
jsr $bb46
ghno
;
lda #0
sta dire
sta dirvm
lda #127
sta $dc00
lda $dc00
sta jsc
;
lda #0
sta aldek
lsr jsc
bcs no1
jsr up
no1
lsr jsc
bcs no2
jsr down
no2
lda dirvm
sta dirv
lsr jsc
bcs no3
jsr left
no3
lsr jsc
bcs no4
jsr right
no4 lda tagon
beq outsid
lda jazzax
sta sprix
lda jazzay
sta spriy
outsid
lsr jsc
bcs no5
jsr fire
jmp no6
no5 lda #0
sta zapflg
lda tagon
beq no6
jsr maping
lda #0
sta tagon
lda sprs1
sta spric
lda sprs2
sta spric+1
lda sprs3
sta spric+2
lda sprid+1
sta sprid
lda sprid+2
sta sprid+1
lda sprid+7
sta sprid+2
lda levc3
sta spric+7
lda sprix+1
sta sprix
lda spriy+1
sta spriy
lda #128
sta shad
dec bomb
lda #$40
sta bom2
;
no6
lda dire
sta dirscr
jmp start
;
;score driver routine
skores
txa
pha
ldy poival
lopib
ldx #4
lopia
inc scoreb,x
lda scoreb,x
cmp #10
bne enlpib
lda #0
sta scoreb,x
dex
bpl lopia
enlpib
dey
bne lopib
lda #0
sta czhflg
;hi scores
ldx #0
hiclop lda scoreb,x
cmp scoreh,x
bcc lower
beq nedlop
jmp itshic
nedlop
inx
cpx #5
bne hiclop
itshic
ldx #0
hicl2
lda scoreb,x
sta scoreh,x
inx
cpx #5
bne hicl2
lower
pla
tax
rts
;
delay
tya
pha
ldy #3
lda #0
sta delex
del1
inc delex
bne del1
dey
bne del1
pla
tay
rts
;
up
ldx #13
jsr $bb46
dec angin
bpl angil7
lda #4
sta angin
angil7
lda #$40
sta aldek
;
;
;
;
lda tagon
bne up2
lda upflg
bne upout
zup lda spriy
cmp #59
bcc upout
lda #1
sta dirvm
upout
rts
up2 lda spriy+1
cmp #61
bcc up2o
lda jazzay
cmp spriy+1
bcc up22
jmp up23
up22 lda jazzay
clc
adc #24
cmp spriy+1
bcc up2o
up23
lda jazzay
sec
sbc #1
sta jazzay
up2o rts
;
down
ldx #13
jsr $bb46
lda angin
cmp #4
bne angil8
lda #0
sta angin
jmp angil9
angil8
inc angin
angil9
lda #$40
sta aldek
;
lda tagon
bne down2
lda doflg
bne doout
zdown lda spriy
cmp #180
bcs doout
lda #2
sta dirvm
doout
rts
down2
lda spriy+1
cmp #171
bcc zebedi
rts
zebedi
lda jazzay
cmp spriy+1
bcc do21
lda jazzay
sec
sbc spriy+1
cmp #24
bcc do21
jmp do20
do21 lda jazzay
clc
adc #1
sta jazzay
do20 rts
;
left
ldx #13
jsr $bb46
lda aldek
bne angil1
dec angin
bpl angil1
lda #4
sta angin
angil1
lda #1
sta lorx
sta lorx2
lda tagon
bne left2
lda lftflg
bne outlf
lda #2
sta dire
outlf rts
left2
lda sprix+1
cmp jazzax
bcc outlf2
lda sprix+1
sec
sbc #24
cmp jazzax
bcc outlf2
jmp outlf
outlf2
lda jazzax
sec
sbc #1
sta jazzax
rts
;
right
ldx #13
jsr $bb46
lda aldek
bne angil3
lda angin
cmp #4
bne angil2
lda #0
sta angin
jmp angil3
angil2
inc angin
angil3
lda #0
sta lorx
lda #1
sta lorx2
lda tagon
bne right2
lda ritflg
bne outrt
lda #1
sta dire
outrt rts
right2
lda jazzax
cmp sprix+1
bcc outrt2
lda sprix+1
clc
adc #24
cmp jazzax
bcc outrt
outrt2
lda jazzax
clc
adc #1
sta jazzax
;
fire
lda #$40
sta lorx2
lda notag
bne zop
lda bom2
beq zop
lda bomb
beq zop
jmp zip
zop lda zapflg
bne outf
lda #$40
sta zapflg
jmp outf
zip ;bomb target
lda sprix+1
sta jazzax
lda spriy+1
sta jazzay
lda spric+2
sta spric+7
lda spric+1
sta spric+2
lda spric
sta spric+1
lda sprid+2
sta sprid+7
lda sprid+1
sta sprid+2
lda sprid
sta sprid+1
lda #0
sta spric
sta shad
sta bom2
lda #$b7
sta sprid
lda #$40
sta zapflg
sta tagon
outf rts
poo .byt 8,7,6,5,4,3,2,1,0
;
sprjr
lda sprax
beq lorxr
lda zapflg
beq lorxr
lda lorx2
beq lorxr
ldx #9
jsr $bb46
lda lorx
beq lorst
;
;display spray on left
;
lda sprix
sec
sbc #24
sta sprix+7
lda #0
sta shad
lda #1
sta spric+7
lda sprid+7
cmp #$ce
beq adth
lda #$ce
sta sprid+7
rts
adth lda #$c5
sta sprid+7
rts
;
rts
;
lorst
;
;display spray on right
;
lda sprix
clc
adc #24
sta sprix+7
lda #0
sta shad
lda #1
sta spric+7
lda sprid+7
cmp #$cf
beq bdth
lda #$cf
sta sprid+7
rts
bdth lda #$d0
sta sprid+7
rts
;
lorxr
lda lint
bne lint3
lda sprix
sta sprix+7
lda levc3
sta spric+7
lint3 rts
;
anban
txa
pha
ldx angin
lda angt,x
sta sprid
pla
tax
rts
;
chetag
;check tagdag
lda jazzax
cmp #156
bcc tageq0
lda jazzax
cmp #180
bcc tageq1
lda #2
jmp trtsq
;
tageq0
lda #0
jmp trtsq
;
tageq1
lda #1
trtsq
sta tagdag
rts
;
lejmp
lda $dc01
cmp #$fd
beq lejmp2
rts
lejmp2
lda #0
sta dirscr
sta speed
sta dirv
sta sprax
sta bomb
sta bom2
lda #128
sta shad
lda sabt
beq sabtt
jsr rerep
sabtt
lda #6
sta scoff
lda #$83
sta sprid
sta sprid+1
sta sprid+2
sta sprid+7
jsr clspik
jsr fdp
lda levnum
cmp #7
bne lejmp3
lda #0
sta levnum
jmp lejmp4
lejmp3
inc levnum
lejmp4 jsr deflev
pla
pla
jmp resto
