antb .byt 0,0,0
fuu .byt 0,4,8,12,16,20
exalg2 .byt 0,0,0,0,0
exalg4 .byt 0
dedmed .byt 0,0,0,0,0
sts .byt 0,0,0,0,0
sts2 .byt 0,0,0,0,0
sif .byt 0,0,0,0,0
;
;meanie driver
;
sman
lda init
bne sein
jmp soin
sein
ldx #14
jsr $bb46
;lda #0
;sta levin
jsr rndit
lda seed
and #7
tay
lda (airz),y
tax
lda ansf1,x
sta antb
lda ansf2,x
sta antb+1
lda ansf1,x
sta antb+2
lda fishpi,x
tax
lda sesled,x
sta smog
lda seslad,x
sta smog+1
ldy #0
ldx #0
savlon ;set meanies up on either
;left (1) or right (2) of player
txa
pha
lda (smog),y
cmp #2  ;right
beq smrt
smlf
ldx scoff
lda mbh8,x
sta smth
bne scoc1
lda #7
sta smth
jmp scoc2
scoc1
scoc2 lda mby8,x
sec
sbc #80
sta smtl
bcs smlf2
lda smth
bne scoc21
lda #7
sta smth
jmp smlf2
scoc21
dec smth
smlf2
jmp smrt2
;
smrt
ldx scoff
lda mbh8,x
sta smth
inc smth
lda smth
cmp #7
bne scoc3
lda #0
sta smth
scoc3 lda mby8,x
clc
adc #$80
sta smtl
bcc smrt2
lda smth
cmp #7
beq scoc31
inc smth
jmp smrt2
scoc31
lda #0
sta smth
smrt2
pla
tax
lda smth
sta shig,x
lda smtl
sta slig,x
;
inx
iny
cpy #5
beq savlol
jmp savlon
savlol
;adjust x
ldx #0
savol2
lda slig,x
clc
adc (smog),y
sta slig,x
bcc savl2a
lda shig,x
cmp #7
bne savle1
lda #0
sta shig,x
jmp savl2a
savle1
inc shig,x
savl2a
inx
iny
cpy #10
bne savol2
ldx #0
savlop ;data pointer
lda #0
sta exalg,x
sta exalg2,x
sta dedmed,x
lda (smog),y
sta spig,x
inx
iny
cpy #15
bne savlop
ldx #0
savl1p ;colour
lda spric
sta scig,x
inx
cpx #5
bne savl1p
ldx #0
savl2p ;x
lda (smog),y
sta sxig,x
inx
iny
cpy #20
bne savl2p
ldx #0
savlo2 ;where data ?
lda (smog),y
sta szp,x
sta szp3,x
inx
iny
cpy #30
bne savlo2
ldx #0
savlo3 ;how many moves ?
lda (smog),y
sta sts,x
sta sts2,x
lda #$40
sta sif,x
inx
iny
cpy #35
bne savlo3
ldx #0
traz2
lda (smog),y
sta desat,x
iny
inx
cpx #5
bne traz2
lda #0
sta init
;lda #$40
;sta levin
;
soin
ldx #0
momels
lda desat,x
beq mom2s
dec desat,x
jmp desat2
mom2s
lda dedmed,x
beq so2i
jmp noeto
so2i
lda exalg,x
beq noeto
jsr exma2
;jmp soen2
;
noeto lda sif,x
bne shkit
jmp spkit
shkit
lda t2,x
tay
lda szp+1,y
cmp #$ff
beq spkit
sta szp2+1
lda szp,y
sta szp2
ldy #0
txa
pha
lda fuu,x
tax
spmc
lda (szp2),y
sta sewpow,x
inx
iny
cpy #4
bne spmc
pla
tax
;
;
lda #0
sta sif,x
;
spkit ;move meanie
;animate meanie
lda fuu,x
tay
lda antb
tay
lda exalg,x
beq sss
jmp ssa
sss lda anit,y
sta spig,x
ssa lda fuu,x
tay
inc dtel2,x
lda dtel2,x
cmp #15
beq spsm1
jmp spc2
spsm1 lda #0
sta dtel2,x
lda antb
clc
adc #1
sta antb
cmp antb+1
bne spc2
lda antb+2
sta antb
spc2
txa
pha
lda t2,x
tax
lda szp,x
cmp #$ff
bne spc2a
pla
tax
jmp soen2
spc2a pla
tax
lda sewpow+0,y
and #2
beq sosmy
lda sxig,x
sec
sbc sewpow+2,y
sta sxig,x
jmp sposmx
sosmy
lda sxig,x
clc
adc sewpow+2,y
sta sxig,x
sposmx
lda sewpow+0,y
and #1
beq snegmx
lda slig,x
sec
sbc sewpow+1,y
sta slig,x
lda shig,x
sbc #0
and #7
sta shig,x
jmp spc3
snegmx
lda slig,x
clc
adc sewpow+1,y
sta slig,x
lda shig,x
adc #0     ;wilbury
and #7
sta shig,x
spc3 lda sewpow+3,y
sec
sbc #1
sta sewpow+3,y
bne soen2
;no more moves left!
lda #40
sta sif,x
lda t2,x
tay
lda szp,y
clc
adc #4
sta szp,y
bcc sdogx1
lda szp+1,y
clc
adc #1
sta szp+1,y
sdogx1
lda sts2,x
sec
sbc #1
sta sts2,x
bne soen2
lda sts,x
sta sts2,x
lda szp3,y
sta szp,y
lda szp3+1,y
sta szp+1,y
soen2
;reached left of window ?
jsr finlef
desat2
inx
cpx #5
beq somelo
jmp momels
somelo
;all dead?
ldx #0
dedlp lda dedmed,x
beq outmom
inx
cpx #5
bne dedlp
lda #$40
sta init
inc atwnum
ldy atwnum
lda (airz),y
cmp #$ff
bne outmom
lda #0
sta atwnum
outmom rts
;
sesled
.byt <sen1,<sen2,<sen3,<sen4
.byt <sen5,<sen6,<sen7,<sen8
.byt <sen9,<sen10,<sen11,<sen12
.byt <sen13,<sen14,<sen15,<sen16
.byt <sea1,<sea2,<sea3,<sea4
.byt <sea5,<sea6,<sea7,<sea8
.byt <sea9,<sea10,<sea11,<sea12
.byt <sea13,<sea14,<sea15,<sea16
;
seslad
.byt >sen1,>sen2,>sen3,>sen4
.byt >sen5,>sen6,>sen7,>sen8
.byt >sen9,>sen10,>sen11,>sen12
.byt >sen13,>sen14,>sen15,>sen16
.byt >sea1,>sea2,>sea3,>sea4
.byt >sea5,>sea6,>sea7,>sea8
.byt >sea9,>sea10,>sea11,>sea12
.byt >sea13,>sea14,>sea15,>sea16
;
;find sprite
;
finlef
txa
pha
ldx scoff
lda mbh8,x
sta smth
dec smth
lda mby8,x
sec
sbc #$60
sta smtl
bcs nood1
dec smth
nood1
;
pla
tax
;
lda shig,x
sec
sbc smth
sta sood+1
;
lda slig,x
sec
sbc smtl
sta sood
lda sood+1
sbc #0
and #7
sta sood+1
;
lda #$04
sta smth
lda #$08
sta smtl
;
lda sood+1
cmp smth
bcc nood6
beq nood3
jmp nood4
nood3 lda sood
cmp smtl
bcc nood6
;
nood4
lda #1
sta dedmed,x
jmp nood5
;
nood6
;lda #0
;sta dedmed,x
;
nood5
rts
exma2
lda #0
sta dtel2,x
lda exalg2,x
tay
lda epld,y
sta spig,x
inc exalg4
lda exalg4
cmp #2
beq exma3
rts
exma3
lda #0
sta exalg4
inc exalg2,x
lda exalg2,x
cmp #5
beq exma4
rts
exma4
lda #0
sta exalg2,x
sta exalg,x
lda #$40
sta dedmed,x
lda #100
sta poival
txa
pha
jsr skores
jsr scores
pla
tax
rts
rndit ;random number sub routine
lda seed
asl a
asl a
clc
sidrnd adc #77
adc seed
adc atwnum
sta seed
inc atwnum
bne sidrn2
inc sidrnd+1
inc sidrnd+1
sidrn2
rts
;
seed .byt 57
