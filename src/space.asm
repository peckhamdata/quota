;space loop
space
lda #$40
sta dog
lda #0
sta ccal
sta anc
sta gion
sta ginit
sta spept2
sta spept2+1
sta sprix+1
sta ginus
lda #9
sta spept
decre lda #0
sta decada
spart jsr scores
ldy #0
jsr colin
cpx #5
beq poc
beenup
ldx #3
jsr $bb46
lda #$ff
sta decada
lda #0
sta turv
sta ginus
sta dirv
;sta dirscr
jsr exman
jsr sdef
jsr defe
poc lda $d012
cmp #$c0
bne poc
jsr nerg
jsr maping
jsr sman
jsr gunz
;
lda #0
sta dunne
sta dirvm
lda turv
bne notv
lda #127
sta $dc00
lda $dc00
sta jsc
;
lsr jsc
bcs sno1
jsr sup
sno1
lsr jsc
bcs sno2
jsr sdown
sno2
lda dirvm
sta dirv
lsr jsc
bcs sno3
jsr sleft
sno3
lsr jsc
bcs sno4
jsr sright
sno4
lsr jsc
bcs sno5
jsr sfire
jmp sno6
sno5 lda #0
sta zapflg
sno6
jay0
jjj3 ldx spept
lda daktab,x
sta dire
jjjk lda dire
sta dirscr
notv
jmp spart
;
;
;
sup
lda spriy
cmp #59
bcc supout
lda #$01
sta dirvm
supout
rts
;
sdown
lda spriy
cmp #180
bcs sdoout
lda #$02
sta dirvm
sdoout
rts
;
sleft
lda #$40
sta dunne
ldx spept
lda yortab,x
sta sprid
lda shatab,x
sta sprid+7
lda levnum
cmp #3
bne light1
lda spe2,x
jmp light2
light1 lda spetab,x
light2 sta speed
lda daktab,x
sta dire
inc spept2
lda spept2
cmp #1
bne slj
lda #0
sta spept2
lda spept
beq slj
dec spept
slj
rts
;
sright
lda #$40
sta dunne
ldx spept
lda yorta2,x
sta sprid
lda shata2,x
sta sprid+7
lda levnum
cmp #3
bne light3
lda spe2,x
jmp light4
light3
lda spetab,x
light4 sta speed
lda daktab,x
sta dire
inc spept2+1
lda spept2+1
cmp #1
bne srj
lda #0
sta spept2+1
lda spept
cmp #16
beq srj
inc spept
srj
rts
;
sfire
lda zapflg
bne soutf
lda gion
bne soutf
lda #$40
sta zapflg
sta ginit
soutf rts
ams1 .byt $68,$68,$67,$67,$66,$66,$67,$67,$68,$68,$67,$67,$66,$66,$67,$67
ams2 .byt $70,$70,$6f,$6f,$6e,$6e,$6f,$6f,$70,$70,$6f,$6f,$6e,$6e,$6f,$6f
ams3 .byt $78,$78,$77,$77,$76,$76,$77,$77,$78,$78,$77,$77,$76,$76,$77,$77
spetab .byt 5,5,4,3,3,2,2,1,0
.byt 1,2,2,3,3,4,5,5
spe2 .byt 8,8,6,6,4,4,2,2,0
.byt 2,2,4,4,6,6,8,8
daktab .byt 2,2,2,2,2,2,2,2,0
.byt 1,1,1,1,1,1,1,1
yortab .byt $d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4
.byt $da,$da,$da,$da,$da,$da,$da,$da
yorta2 .byt $d4,$d4,$d4,$d4,$d4,$d4,$d4,$d4,$da
.byt $da,$da,$da,$da,$da,$da,$da,$da
shatab .byt $db,$db,$db,$db,$db,$db,$db,$db,$db
.byt $e1,$e1,$e1,$e1,$e1,$e1,$e1,$e1
shata2 .byt $db,$db,$db,$db,$db,$db,$db,$db,$e1
.byt $e1,$e1,$e1,$e1,$e1,$e1,$e1,$e1
