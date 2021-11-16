bone .byt 0
bonelo .byt $4c,$4d,$4e,$4f,$50,$51,$52,$53,$54,$55,$4c
bonehi .byt $4c,$4c,$4c,$4c,$4c,$4c,$4c,$4c,$4c,$4c,$4d
bod .byt 0
hole
lda monum
beq zebade
rts
zebade
lda alnum
beq zebad2
rts
zebad2
ldx #2
jsr $bb46
lda #128
sta shad
ldx #0
stx dirscr
stx dirv
stx bone
stx sprax
lda sprix
sta sprix+7
centl
lda wherey
bne albat1
lda spriy
clc
adc #1
sta spriy
sta spriy+1
sta spriy+2
sta spriy+7
albat1
lda wherey
cmp #2
bne albat2
lda spriy
sec
sbc #1
sta spriy
sta spriy+1
sta spriy+2
sta spriy+7
albat2
;
lda wherex
bne albat3
inc sprix
inc sprix+1
inc sprix+2
inc sprix+7
albat3
lda wherex
cmp #2
bne albat4
dec sprix
dec sprix+1
dec sprix+2
dec sprix+7
albat4
ldy #0
turn jsr delay
jsr delay
jsr delay
jsr delay
inx
cpx #8
bne centl
holslp
ldx #0
urghka
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
inx
cpx #6
bne urghka
lda #0
sta sprix
sta sprix+1
sta sprix+2
sta sprix+7
jsr clspik
jsr fdp
lda levnum
cmp #7
bne norepl
jmp scok
norepl
lda #0
sta bone
lda #3
sta linum
jsr link
lda sabt
beq gongp
jsr rerep
gongp
lda levnum
sta bod
lda #8
sta levnum
jsr deflev
ldx bod
lda qhat,x
sta moog
lda phat,x
sta moog+1
ldy #0
moplop lda (moog),y
sta shig,y
iny
cpy #60
bne moplop
jsr fup
jsr setpuk
lda #0
sta ccal
lda #1
sta dirscr
lda #3
sta speed
 
lda #127
sta $dc00
ldy #0
bones
jsr anflg
jsr delay
jsr anink
jsr anban
lda #0
sta dirvm
lda $dc00
and #126
cmp #126
beq bp1
jsr zup
bp1
lda $dc00
and #125
cmp #125
beq bp2
jsr zdown
bp2 lda dirvm
sta dirv
ldy #0
jsr colin
cpx #12
beq noeyan
lda spig,x
cmp #$c7
bne noeyan
cleyan
txa
pha
ldx #11
jsr $bb46
pla
tax
lda #$00
sta shig,x
sta slig,x
inc bone
noeyan
;
lda scoff
cmp #$d7
bne bones
ldx #12
jsr $bb46
lda #0
sta dirscr
sta dirv
sta speed
ldy #0
ldx #0
ned jsr delay
jsr delay
jsr anflg
inx
cpx #60
bne ned
lda #0
sta sprix
sta sprix+1
sta sprix+2
sta sprix+7
jsr clspik
jsr fdp
lda bod
sta levnum
inc levnum
lda bone
beq nobone
lda #5
sta linum
ldx bone
lda bonelo,x
sta ms6+20
lda bonehi,x
sta ms6+19
jmp bono
nobone
lda #4
sta linum
bono jsr link
jsr deflev
pla
pla
jmp resto
spac .byt 1,1,2,4
qhat .byt <bql1,<bql2,<bql3,<bql4
.byt <bql5,<bql6,<bql7,<bql8
phat .byt >bql1,>bql2,>bql3,>bql4
.byt >bql5,>bql6,>bql7,>bql8
;
;
anflg
lda flagan,y
sta shig+34
sta shig+35
iny
cpy #6
bne flago1
ldy #0
flago1 rts
flagan .byt $d1,$d1
.byt $d2,$d2
.byt $d3,$d3
;
clspik
lda #$ff
sta ccal
rts
scok
;action replay
lda #0
sta linum
jsr link
lda sabt
beq noodfg
jsr rerep
noodfg
lda #35
sta sprix
lda #55
sta spriy
lda #$c3
sta sprid
lda #255
sta multic
lda #215
sta scoff
jsr fup
lda #4
sta speed
lda #2
sta dirscr
dfgh lda scoff
cmp #6
bne dfgh
lda #0
sta dirscr
lda levnum
beq finrlp
dec levnum
jsr fdp
jsr deflev
jmp noodfg
finrlp
pla
pla
jmp resso2
;
anink
lda angin
cmp #4
beq anink2
inc angin
rts
anink2
lda #0
sta angin
rts
