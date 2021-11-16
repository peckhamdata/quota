;put "@:init"
;split rasters at:
;do rasters
;init:initalsie
;
*=endsvs ;end of screen vars
sei
cld
ldx #<nmivec
ldy #>nmivec
stx $fffa
sty $fffb
lda #$2f
sta $00
lda #$35
sta $01
ldy $9ffb ;save for nmi prot below
;all these are done at start
;of program run
lda #3
sta defasd
lda #12
sta tbl
lda #128
sta shad
ldx #0
stx swacaz
stx curcaz
stx pause
stx levin
stx dirscr
stx dirv
stx speed
stx smve
stx msb
stx dog
stx $d020
stx $d021
stx linflg
stx $dc0e ;cia1 timer a stop
stx $dc0f ;cia1 timer b stop
stx $dd0e ;cia2 timer a stop
stx $dd0f ;cia2 timer b stop
stx $d01a ;disable vic irq's
lda #$78 ;$78=sei
peow sta $0200,x
dex
bne peow
lda $d01e ;clear sprite-sprite reg
lda $d01f ;clear sprite-bgnd reg
ldx #$ff
stx $d019 ;clear vic irq flags
lda #$7f
sta $dc0d ;disable cia1 irqs
sta $dd0d ;disable cia2 nmis
lda $dc0d ;clear cia1 irq flags
lda $dd0d ;clear cia2 nmi flags
ldx #finep-exppro-1
gurgle lda exppro,x
sta $0300,x
dex
bpl gurgle
lda #$3f
sta $dd02
lda #$06
sta $dd00
ldx #$18
txs
stx $d016
lda #$95
sta $43f8
lda #$02
sta $d018
;do some protection
ldx #0
stx $dd05 ;cia2 timer a hi
inx ;=1
stx $dd04 ;cia2 timer a lo
lda #$81
sta $dd0d ;nmis from timer a
lda #$99
ldx $dd0d
sta $dd0e ;start timer a
ldx #$02
;nmi pulse banks in expert now
stx $9ffb ;nmi vec hi in expert
;jumps to nmi now
sty $9ffb ;restore byte saved above
;if prog has reached here then
;nmi line is set so no nmis can
;occur until it is cleared
;
;set so if nmi occurs then crash
inx ;=3
stx $fffa
stx $fffb
lda #$91 ;start timer a continuous
sta $dd0e ;^
;
;copy $e000-$efff to $d000-$dfff
;dont run more than once !
ldx #$10
ldy #0
dec $01 ;=$34
pomp1 lda $e000,y
pomp2 sta $d000,y
dey
bne pomp1
inc pomp1+2
inc pomp2+2
dex
bne pomp1
inc $01 ;=$35
;
jsr $a000 ;initialise music player
jsr intro
retaz
lda #$40
sta tigtig
sta zendin+1
lda #$ff
sta gotan
lda #$eb
sta bland+1
lda #$b5
sta bland+2
lda #6
sta scoff
lda #$40
sta zendin+2
sei
cld
lda #<tilet
sta $fffe
lda #>tilet
sta $ffff
lda #$1b
sta $d011
lda #50
sta $d012
lda #$01
sta $d01a
sta $d019
lda #0
sta dtel
sta tfg
lda #$ff
sta ccal
cli
jsr cls
jsr bada
lda #$02
sta $d018
;titles loop
lda #0
sta zendin
jsr zend
ldx #$7a
ldy #0
tiglip jsr zend2
lda tigtig
bne tiglip
;fade volume
ldx #15
pere
stx $d024
ldy #12
ubu
jsr delay
dey
bpl ubu
dex
bpl pere
jsr fdp
lda #$0b
sta $d011
jsr cls
sei
cld
lda #<rast3
sta $fffe
lda #>rast3
sta $ffff
lda #$1b
sta $d011
lda #$cf
sta $d012
lda #$01
sta $d01a
sta $d019
lda #0
sta dtel
sta tfg
sta $d015
cli
jsr status
lda #$00
sta dog
lda #$f0
sta multic
lda #1
sta longti+1
lda #0
sta longti
sta lint
sta turv
sta dirscr
sta dirv
sta speed
sta smve
sta intab
sta sabt
sta sprax
sta decada
lda #0
sta levnum
lda #0
sta dedq
lda #3
sta defasd
lda #12
sta tbl
jsr zeroal
jsr scoset
jsr deflev
lda #0
sta zendin+2
lda #$1b
sta $d011
jsr $bb43
jmp go
;
;
rast2
;sei
pha
txa
pha
tya
pha
lda #$ff
sta $d019
lda zendin+2
beq depre
lda #0
sta gotan
jmp depre2
depre
jsr $bb49
jsr smav
jsr finder
;tod protection
lda #0
sta $dc0f ;set tod to clock
ldx #$7f
stx $dcdd ;disable cia1 irqs
ldy $dcfd
ora #$09 ;ar=$09
ldx #3
plobb sta $dcc8,x ;cia1 tod clock
dex
bpl plobb
ldx #$04
cpx $dc4d
beq depre2
ldx #0
qwe1 pha ;destroy stack
dex
bne qwe1
jmp $0300 ;crash
;
depre2
lda #<rast3
sta $fffe
lda #>rast3
sta $ffff
lda #$cb
sta $d012
jmp exirq
;
rast3
;sei
pha
txa
pha
tya
pha
lda #$ff
sta $d019
lda coltob+7
sta $d021
lda #0
sta $d00e
lda #$18
sta $d016
lda #$02
sta $d018
lda #$ff
sta $d01c
sta $d015
lda #6
sta $d022
lda #7
sta $d025
lda #3
sta $d023
lda #9
sta $d026
lda zendin+2
beq ato1
jmp ato2
ato1
ldy #0
ldx #0
setspl
lda left1,x  ;x
sta $d004,y
lda #$da
sta $d005,y
lda #8
sta $d029,x
lda left3,x  ;d
sta $43fa,x
iny
iny
inx
cpx #5
bne setspl
lda #112
sta $d010
ldy #6
chomp lda $d012
cmp #$d3
bne chomp
ldx #$d4
chomp3 lda coltob,y
chomp2 cpx $d012
bne chomp2
sta $d021
inx
dey
bpl chomp3
lda #0
sta $d021
sta $d01b
;display scroll extract
lda linflg
beq jiant2
jmp devi3
jiant2
lda levin
bne devi2
jmp devi
devi2 ldx smve
lda hand,x
sta $5148
sta $5148+1
sta $5148+2
sta $5148+4
sta $5148+5
sta $5148+6
sta $5148+7
ldx scoff
ldy #0
device
lda $e000,x
sta $4028,y
lda $e0ff,x
sta $4050,y
lda $e1fe,x
sta $4078,y
lda $e2fd,x
sta $40a0,y
lda $e3fc,x
sta $40c8,y
lda $e4fb,x
sta $40f0,y
lda $e5fa,x
sta $4118,y
lda $e6f9,x
sta $4140,y
lda $e7f8,x
sta $4168,y
lda $e8f7,x
sta $4190,y
lda $e9f6,x
sta $41b8,y
lda $eaf5,x
sta $41e0,y
lda $ebf4,x
sta $4208,y
lda $ecf3,x
sta $4230,y
lda $edf2,x
sta $4258,y
lda $eef1,x
sta $4280,y
lda $eff0,x
sta $42a8,y
lda $f0ef,x
sta $42d0,y
inx
iny
cpy #40
beq devi3
jmp device
devi3
lda pause
beq npoo
jmp outof
npoo
lda dirv
beq outof
;
lda dog
beq gdu
;
spu
lda dirv
cmp #2
beq spu2
spu1 lda spriy
sec
sbc #2 ;     speed
sta spriy
jmp noft1
;
spu2 lda spriy
clc
adc #2 ;     speed
sta spriy
noft1
clc
adc #32
sta spriy+7
jmp outof
;
gdu
lda dirv
cmp #2
beq gdu2
gdu1 lda spriy
sec
sbc #2 ;     speed
jmp gdu3
gdu2 lda spriy
clc
adc #2 ;     speed
gdu3
sta spriy
sta spriy+1
sta spriy+2
tax
ldy sprix
lda lint
bne gdu5
lda #0
sta $d017
sta $d01d
jmp gdu4
gdu5 lda spriy
sec
sbc #12
tax
lda sprix
sec
sbc #12
tay
lda #128
sta $d017
sta $d01d
gdu4 stx spriy+7
lda sprax
bne outof
sty sprix+7
outof
ato2
;
lda linflg
beq outof2
lda #<rast1
sta $fffe
lda #>rast1
sta $ffff
lda #$40
sta $d012
;
jmp exirq
;
outof2
;
lda gotan
sta $d015
lda msb
sta $d010
lda multic
sta $d01c
lda sms2
sta $d026
lda sms1
sta $d025
lda shad
sta $d01b
lda #0
sta tfg
lda #$10
ora smve
sta $d016
lda #$04
sta $d018
lda thru+1
sta $d022
lda thru+2
sta $d023
lda thru
sta $d021
lda levin
bne jian2
jmp devi
jian2
;do sprites
ldx #0
ldy #0
splp
lda sprix,x
sta $d000,y
lda spriy,x
sta $d001,y
lda spric,x
sta $d027,x
lda sprid,x
sta $43f8,x
iny
iny
inx
cpx #8
bne splp
lda msb
sta $d010
lda multic
sta $d01c
;
lda levin
bne jazok3
devi
lda #$cb
sta $d012
lda #<rast3
sta $fffe
lda #>rast3
sta $ffff
jmp exirq
jazok3 lda #$9a
sta $d012
lda #<rast2
sta $fffe
lda #>rast2
sta $ffff
;
exirq
lda $dc01
cmp #$7f
bne tfthr
lda flace
bne tfthr2
lda #$40
sta flace
lda pause
beq npau2
;
;
;
lda #0
sta pause
jmp tfthr2
npau2
;
;
;
lda #$80
sta pause
jmp tfthr2
tfthr
lda #0
sta flace
tfthr2
lda #$ff
sta $d019
lda pause
cmp #$80
beq pau
npau
pla
tay
pla
tax
pla
nmivec rti
;
;
;
pau
lda #$40
sta pause
cli
pau2 lda pause
bne pau2
pla
tay
pla
tax
pla
rti
left1 .byt $d8,$f0,$09,$21,$39
left3 .byt $60,$61,$62,$63,$64
coltob .byt 9,8,7,1,7,8,9,9
.byt 0,0,0,0,0,0,0,0
tac4 .byt 2,2,2,2,2,2,2,2
.byt 0,0,0,0,0,0,0,0
tac3 .byt 2,2,2,2,2,2,2,2
.byt 0,0,0,0,0,0,0,0
tac2 .byt 2,2,2,2,2,2,2,2
;
;
madms .byt 1,2,4,8,16,32,64,128
hand
.byt %11111100
.byt %11111100
.byt %11110011
.byt %11110011
.byt %11001111
.byt %11001111
.byt %00111111
.byt %00111111
smav     ;smooth update
lda pause
beq npoo3
jmp nodiv
npoo3
lda turv
beq smav2
cmp #2
beq smt1
;turning right
inc dtel
lda dtel
cmp #3
beq smt2a
jmp nodiv
smt2a lda #0
sta dtel
inc sprid
inc sprid+7
lda sprid
cmp #$da
beq smt2
jmp nodiv
smt2
lda #9
sta spept
lda #1
sta dirscr
lda #0
sta turv
jmp nodiv
;turning left
smt1
inc dtel
lda dtel
cmp #5
beq smt3a
jmp nodiv
smt3a
lda #0
sta dtel
dec sprid
dec sprid+7
lda sprid
cmp #$d4
beq smt3
jmp nodiv
smt3
lda #7
sta spept
lda #2
sta dirscr
lda #0
sta turv
smav2 lda dirscr
beq nodiva
cmp #2
beq nodiv2
lda scoff
cmp #$eb
beq nodiva
lda smve
sec
sbc speed
sta smve
bcs nodiv
lda smve
clc
adc #8
sta smve
inc scoff
jmp nodiv
nodiv2
lda scoff
cmp #$ec
beq nodiva
lda smve
clc
adc speed
sta smve
cmp #8
bcc nodiv
lda smve
sec
sbc #8
sta smve
dec scoff
jmp nodiv
nodiva lda dog
beq nodiv
lda decada
beq decadb
jmp nodiv
decadb
lda sprid
cmp #$d4
bne nod2
;facing left
lda #$01
sta turv
jmp nod3
;
nod2
;facing right
lda #$02
sta turv
nod3 lda gizpd
sta speed
sta dirscr
lda #0
sta dirv
sta dtel
nodiv rts
;
;
rast1
;sei
pha
txa
pha
tya
pha
lda #$ff
sta $d019
lda #0
sta $d022
sta $d023
lda #254
sta $d01c
lda #252
sta $d015
lda coltob+55
sta $d021
lda #67
sta $d005
sta $d007
sta $d009
sta $d00b
sta $d00d
lda #124
sta $d004
lda #148
sta $d006
lda #172
sta $d008
lda #196
sta $d00a
lda #220
sta $d00c
ldy #0
sty $d010
lear2 lda $d012
cmp #79
bne lear2
lda #3
sta $d025
lda #6
sta $d026
lda #1
sta $d027
lda #14
ldx #0
toig2
sta $d029,x
inx
cpx #5
bne toig2
ldy #54
lit2 lda $d012
cmp #91
bne lit2
ldx #92
lit3 lda coltob,y
lit4 cpx $d012
bne lit4
sta $d021
inx
dey
bpl lit3
lda #<rast3
sta $fffe
lda #>rast3
sta $ffff
lda #$cb
sta $d012
jmp exirq
dirp .byt 0
dirsp .byt 0
;
tilet2
;sei
pha
txa
pha
tya
pha
lda #$ff
sta $d019
;
;
lda #$18
sta $d016
lda thru
sta $d021
lda thru+1
sta $d022
lda thru+2
sta $d023
dec smve
bpl vanpt
lda #7
sta smve
inc bland+1
bne dowcow
inc bland+2
dowcow
lda bland+2
cmp #$ba
bne downco
lda bland+1
cmp #$73
bne downco
lda #$b5
sta bland+2
lda #$eb
sta bland+1
downco lda $4258+35
cmp #$24
bne vanpt
lda #$40
sta zendin
vanpt
jsr $a003
lda #56
sta $d012
lda #<tilet
sta $fffe
lda #>tilet
sta $ffff
;
pla
tay
pla
tax
pla
rti
;
tilet
;sei
pha
txa
pha
tya
pha
lda #$ff
sta $d019
lda taltob+95
sta $d021
lda #$02
sta $d018
ldy #94
chzmp lda $d012
cmp #58
bne chzmp
ldx #59
chzmp3 lda taltob,y
chzmp2 cpx $d012
bne chzmp2
sta $d021
inx
dey
bpl chzmp3
; do scroll
lda $d016
and #$f8
ora smve
sta $d016
lda #1
sta $d021
ldy #0
dcopl
bland lda $b5eb,y
sta $4258,y
inx
iny
cpy #40
bne dcopl
lda $d016
and #$f7
sta $d016
;
;
;
;
;
;
;
lda $dc00
cmp #111
bne n127
lda zendin+1
bne n128
lda #$40
sta zendin+1
lda #0
sta tigtig
lda #180
sta $d012
lda #<tilet2
sta $fffe
lda #>tilet2
sta $ffff
pla
tay
pla
tax
pla
rti
;
;stuff for protection vs expert
;copied to $0300 on
exppro
sei
sei
sei
;@$0303
ldy #0
lda #3
late sta $9f00,y
sta $ff00,y
dey
bne late
lda #$35
sta $01
and #0
sta $d011 ;screen off
dec $01 ;=$34
sty $02 ;=0
lda #$04
sta $03
pyong sta ($02),y
iny
bne pyong
inc $03
bne pyong
inc $01 ;=$35
quack inc $d020
pha ;destroy stack
jmp quack
finep
;
n127
lda #0
sta zendin+1
n128
lda #180
sta $d012
lda #<tilet2
sta $fffe
lda #>tilet2
sta $ffff
;
pla
tay
pla
tax
pla
rti
taltob
.byt 0,0,0,0,0,0,0,0
.byt 0,1,1,7,10,2,0,0
.byt 0,1,1,7,10,2,0,0
.byt 0,1,13,3,14,6,0,0
.byt 0,1,1,7,8,9,0,0
.byt 0,1,13,3,14,6,0,0
.byt 0,1,1,7,10,2,0,0
.byt 0,0,0,0,0,0,0,0
.byt $09,$09,$08,$07,$01,$01,$01,$01
.byt $01,$01,$01,$01,$07,$07,$08,$09
.byt $09,$06,$0e,$03,$0d,$01,$01,$01
.byt $01,$01,$01,$0d,$03,$0e,$06,$06
zend
ldx #0
zendl
lda $0400,x
sta $4028+9,x
lda $0400+22,x
sta $4028+49,x
lda $0400+44,x
sta $4028+89,x
lda $0400+66,x
sta $4028+129,x
inx
cpx #22
bne zendl
ldx #0
zendl2
lda $9f38,x
sta $4028+240,x
lda #8
sta $dae2,x
inx
cpx #200
bne zendl2
ldx #0
raylop
lda raygun,x
sta $43f8,x
lda raygu2,x
sta $d000,x
lda raygu3,x
sta $d006,x
lda #12
sta $d027,x
inx
cpx #6
bne raylop
lda #2
sta $d028
lda #63
sta $d015
lda #253
sta $d01c
lda #3
sta $d025
lda #11
sta $d026
lda #0
sta $d010
lda #7
sta smve
rts
;
;zend2
;
zend2
lda zendin
bne nozein
rts
nozein
jsr fdp
;
stx $42e2
inx
stx $42e2+1
inx
stx $42e2+2
inx
stx $430a
inx
stx $430a+1
inx
stx $430a+2
inx
stx $4332
inx
stx $4332+1
inx
stx $4332+2
inx
;
lda qstp,y
sta levc1
lda qstp1,y
sta levc2
lda qstp2,y
sta levc3
iny
lda #0
sta zendin
cpy #14
bne zotzen
ldy #0
ldx #$7a
zotzen jsr fup
rts
qstp .byt 1,13,15,7,1,13,15,7,1,13,15,7,7,8
qstp1 .byt 13,14,12,10,13,14,12,10,13,14,12,10,10,10
qstp2 .byt 5,6,11,2,5,6,11,2,5,6,11,2,7,9
zendin .byt 0,0,0
raygun .byt $18,184,$b9,$ba,$bb,$bc
raygu2 .byt 0,150,33,228,156,188
raygu3 .byt 180,188,156,208,180,208
