;
;display new level
;
deflev  ;set up
lda #0
sta levin
nbig
lda scoff
sta inpos
ldy levnum
lda #$00
sta moog
sta meeg
sta atwnum
lda dedq
beq dedqd4
jmp dedqd3
dedqd4
lda #$00
sta $d01a
lda #$0b
sta $d011
lda #$34 ;*^^*
sta $0001
lda #$80
sta swac
lda #$00
sta swac2
lda #$78
sta swac+1
lda #$d8 ;b5
sta swac2+1
lda swap1,y
cmp swacaz
beq nswp
lda lint
beq nswpqq
jmp cazno
nswpqq
lda swap1,y
sta swacaz
ldy #0
nnswp
lda (swac),y
tax
lda (swac2),y
sta (swac),y
txa
sta (swac2),y
lda swac
clc
adc #1
sta swac
bcc nswp2
inc swac+1
lda swac+1
cmp #$80
bne nswp2
jmp nswp4
nswp2
lda swac2
clc
adc #1
sta swac2
bcc nswp3
inc swac2+1
nswp3
jmp nnswp
nswp4
lda #$35 ;*^^*
sta $0001
lda #$ff
sta $d019
lda #$01
sta $d01a
ldy levnum
;
nswp
lda cazet,y
cmp curcaz
beq cazno
sta curcaz
lda #$00
sta $d01a
lda #$0b
sta $d011
lda #$34 ;*^^*
sta $0001
lda #$d0   ;  c8
sta moog+1
lda #$50
sta meeg+1
ldx #0
cazlp ldy #0
cazlp2
lda (moog),y
pha
lda (meeg),y
sta (moog),y
pla
sta (meeg),y
iny
bne cazlp2
inc moog+1
inc meeg+1
inx
cpx #8
bne cazlp
lda #$35 ;*^^*
sta $0001
lda #$ff
sta $d019
lda #$01
sta $d01a
;
cazno
ldy levnum
lda lint
bne roundn
lda moqo,y
sta monum
lda alqo,y
sta alnum
roundn
lda mins,y
sta gizpd
lda lemc1,y
sta levc1
lda lemc2,y
sta levc2
lda lemc3,y
sta levc3
lda smoon1,y
sta sms1
sta spric
sta sprs1
lda smoon2,y
sta spric+2
sta sprs3
sta sms2
lda smoon3,y
sta spric+1
sta sprs2
dedqd3 lda rool,y
sta moog
lda rooh,y
sta moog+1
lda airinl,y
sta airz
lda airinh,y
sta airz+1
;lda ratabl,y -re intro soon.
;sta godwin   -relife tables
;lda ratabh,y --------------
;sta godwin+1
lda #$00 ;start of buffer
sta maag
lda #$e0
sta maag+1
;
ldy #0 ;row counter
ldx #0 ;width marker
lelop1
sty mark2
ldy #0
lda (moog),y ;from room data
sta mark1
stx mark3
tay
lda partsl,y ;part type ?
sta miig
lda partsh,y
sta miig+1
;
ldy #0
lelop2
lda (miig),y ;take part type
sta mark4
lda maag+1
clc
adc ofsthi,y
sta meeg+1
lda maag
clc
adc ofstlo,y
sta meeg
bcc lowe
inc meeg+1
lowe  
tya
pha
ldy #0
lda mark4
sta (meeg),y ;dump in buffer
pla
tay
iny
cpy #9
bne lelop2
;
ldy mark2
ldx mark3
lda moog
clc
adc #1
sta moog
bcc jonjo
inc moog+1
jonjo
lda maag
clc
adc #$03
sta maag
bcc marke2
inc maag+1
marke2
inx
cpx #85
bne lelop1
;
;check if reached end of table
iny
cpy #6
bne marke4
jmp outlev
marke4
ldx #0
lda maag
clc
adc #$fe
sta maag
bcc marke3
inc maag+1
marke3 inc maag+1
jmp lelop1
outlev
lda $f1ed
sta $f1ee
lda #$40
sta levin
lda #$35 ;*^^*
sta $0001
lda #$1b
sta $d011
lda #$ff
sta $d019
lda #$01
sta $d01a
rts
;
airinl
.byt <alev1,<alev2,<alev3,<alev4
.byt <alev5,<alev6,<alev7,<alev8
airinh
.byt >alev1,>alev2,>alev3,>alev4
.byt >alev5,>alev6,>alev7,>alev8
cazet .byt 1,0,0,0,1,0,1,0,0,0,0
;
swap1 .byt 1,0,1,0,0,1,1,0,0,0,0
moqo .byt 4,8,4,6,4,7,14,4,0
alqo .byt 12,18,18,24,36,36,36,12,00
mins .byt 1,1,1,2,1,1,1,1,1,1
lemc1 .byt 1,1,13,15,13,13,10,3,3,13,13
lemc2 .byt 15,7,14,12,12,12,9,12,10,14,12
lemc3 .byt 8,5,6,9,9,11,0,11,4,6,11
smoon1 .byt 03,07,01,15,01,01,07,07,01,01,01
smoon2 .byt 06,02,00,06,06,04,02,09,00,00,04
smoon3 .byt 14,10,15,14,14,03,10,08,15,15,03
rool .byt <lev4,<lev1,<lev2
.byt <lev3
.byt <lev5,<lev6
.byt <lev7,<lev8
.byt <lev9,<leva,<levb
rooh .byt >lev4,>lev1,>lev2
.byt >lev3
.byt >lev5,>lev6
.byt >lev7,>lev8
.byt >lev9,>leva,>levb
partsl .byt <part1,<part2,<part3
.byt <part4,<part5,<part6
.byt <part7,<part8,<part9
.byt <parta,<partb,<partc
.byt <partd,<parte,<partf
.byt <partg,<parth,<parti
.byt <partj,<partk,<partl
.byt <partm,<partn,<parto,<partp
.byt <partq
.byt <partr,<parts,<partt
.byt <partu,<partv,<partw
.byt <partx,<party,<partz
.byt <partaa,<partab,<partac
.byt <partad,<partae,<partaf
.byt <partag,<partah,<partai
.byt <partaj
.byt <jug1,<jug2,<jug3,<jug4
.byt <jug5,<jug6,<jug7,<jug8
.byt <jug9,<juga,<jugb,<jugc
.byt <jugd,<juge,<jugf,<jugg
.byt <jugh,<jugi,<jugj,<jugk
.byt <jugl,<jugm 
.byt <jugn,<jugo,<jugp,<jugq
.byt <jugr,<jugs
.byt <jugt,<jugu,<jugv,<jugw,<jugx
.byt <jugy,<jugz,<jugaa
.byt <pg1,<pg2,<pg3,<pg4,<part8,<part6
.byt <lob88,<lob89,<lob90
.byt <lob91,<lob92,<lob93
.byt <lob94,<lob95,<lob96
.byt <lob97,<lob98,<lob99
.byt <lob100,<lob101,<lob102
.byt <lob103,<lob104
.byt <lob105,<lob106,<lob107,<lob108
.byt <lob109,<lob10a,<lob10b,<lob10c
.byt <mtal1,<mtal2,<mtal3,<mtal4
.byt <mtal5,<mtal6,<mtal7,<mtal8
.byt <mtal9,<mtala,<mtalb,<mtalc
.byt <mtald,<mtale,<mtalf,<mtalg
.byt <mtalh,<mtali,<mtalj,<mtalk
.byt <mtall,<mtalm,<mtaln
.byt <plt1,<plt2,<plt3,<plt4,<plt5,<plt6,<plt7,<plt8,<plt9,<plta,<pltb
.byt <pltc,<pltd,<plte,<pltf
partsh .byt >part1,>part2,>part3
.byt >part4,>part5,>part6
.byt >part7,>part8,>part9
.byt >parta,>partb,>partc
.byt >partd,>parte,>partf
.byt >partg,>parth,>parti
.byt >partj,>partk,>partl
.byt >partm,>partn,>parto,>partp
.byt >partq
.byt >partr,>parts,>partt
.byt >partu,>partv,>partw
.byt >partx,>party,>partz
.byt >partaa,>partab,>partac
.byt >partad,>partae,>partaf
.byt >partag,>partah,>partai
.byt >partaj
.byt >jug1,>jug2,>jug3,>jug4
.byt >jug5,>jug6,>jug7,>jug8
.byt >jug9,>juga,>jugb,>jugc
.byt >jugd,>juge,>jugf,>jugg
.byt >jugh,>jugi,>jugj,>jugk
.byt >jugl,>jugm
.byt >jugn,>jugo,>jugp,>jugq
.byt >jugr,>jugs
.byt >jugt,>jugu,>jugv,>jugw,>jugx
.byt >jugy,>jugz,>jugaa
.byt >pg1,>pg2,>pg3,>pg4,>part8,>part6
.byt >lob88,>lob89,>lob90
.byt >lob91,>lob92,>lob93
.byt >lob94,>lob95,>lob96
.byt >lob97,>lob98,>lob99
.byt >lob100,>lob101,>lob102
.byt >lob103,>lob104
.byt >lob105,>lob106,>lob107,>lob108
.byt >lob109,>lob10a,>lob10b,>lob10c
.byt >mtal1,>mtal2,>mtal3,>mtal4
.byt >mtal5,>mtal6,>mtal7,>mtal8
.byt >mtal9,>mtala,>mtalb,>mtalc
.byt >mtald,>mtale,>mtalf,>mtalg
.byt >mtalh,>mtali,>mtalj,>mtalk
.byt >mtall,>mtalm,>mtaln
.byt >plt1,>plt2,>plt3,>plt4,>plt5,>plt6,>plt7,>plt8,>plt9,>plta,>pltb
.byt >pltc,>pltd,>plte,>pltf
ofstlo .byt $00,$01,$02,$ff,$00,$01,$fe,$ff,$00
ofsthi .byt $00,$00,$00,$00,$01,$01,$01,$01,$02
;
lev1 = $c000
lev9 = $c1fe
lev2 = $c3fc
lev3 = $c5fa
lev4 = $c7f8
lev5 = $c9f6
lev6 = $cbf4
lev7 = $cdf2
lev8 = $aff0
leva = $b1ee
levb = $b3ec
;
;
part1 = $8000
part2 = part1+9
part3 = part2+9
part4 = part3+9
part5 = part4+9
part6 = part5+9
part7 = part6+9
part8 = part7+9
part9 = part8+9
parta = part9+9
partb = parta+9
partc = partb+9
partd = partc+9
parte = partd+9
partf = parte+9
partg = partf+9
parth = partg+9
parti = parth+9
partj = parti+9
partk = partj+9
partl = partk+9
partm = partl+9
partn = partm+9
parto = partn+9
partp = parto+9
partq = partp+9
partr = partq+9
parts = partr+9
partt = parts+9
partu = partt+9
partv = partu+9
partw = partv+9
partx = partw+9
party = partx+9
partz = party+9
partaa = partz+9
partab = partaa+9
partac = partab+9
partad = partac+9
partae = partad+9
partaf = partae+9
partag = partaf+9
partah = partag+9
partai = partah+9
partaj = partai+9
jug1 = partaj+9
jug2 = jug1+9
jug3 = jug2+9
jug4 = jug3+9
jug5 = jug4+9
jug6 = jug5+9
jug7 = jug6+9
jug8 = jug7+9
jug9 = jug8+9
juga = jug9+9
jugb = juga+9
jugc = jugb+9
jugd = jugc+9
juge = jugd+9
jugf = juge+9
jugg = jugf+9
jugh = jugg+9
jugi = jugh+9
jugj = jugi+9
jugk = jugj+9
jugl = jugk+9
jugm = jugl+9
jugn = jugm+9
jugo = jugn+9
jugp = jugo+9
jugq = jugp+9
jugr = jugq+9
jugs = jugr+9
jugt = jugs+9
jugu = jugt+9
jugv = jugu+9
jugw = jugv+9
jugx = jugw+9
jugy = jugx+9
jugz = jugy+9
jugaa = jugz+9
pg1 = jugaa+9
pg2 = pg1+9
pg3 = pg2+9
pg4 = pg3+9
lob88 = pg4+9
lob89 = lob88+9
lob90 = lob89+9
lob91 = lob90+9
lob92 = lob91+9
lob93 = lob92+9
lob94 = lob93+9
lob95 = lob94+9
lob96 = lob95+9
lob97 = lob96+9
lob98 = lob97+9
lob99 = lob98+9
lob100 = lob99+9
lob101 = lob100+9
lob102 = lob101+9
lob103 = lob102+9
lob104 = lob103+9
lob105 = lob104+9
lob106 = lob105+9
lob107 = lob106+9
lob108 = lob107+9
lob109 = lob108+9
lob10a = lob109+9
lob10b = lob10a+9
lob10c = lob10b+9
mtal1 = lob10c+9
mtal2 = mtal1+9
mtal3 = mtal2+9
mtal4 = mtal3+9
mtal5 = mtal4+9
mtal6 = mtal5+9
mtal7 = mtal6+9
mtal8 = mtal7+9
mtal9 = mtal8+9
mtala = mtal9+9
mtalb = mtala+9
mtalc = mtalb+9
mtald = mtalc+9
mtale = mtald+9
mtalf = mtale+9
mtalg = mtalf+9
mtalh = mtalg+9
mtali = mtalh+9
mtalj = mtali+9
mtalk = mtalj+9
mtall = mtalk+9
mtalm = mtall+9
mtaln = mtalm+9
plt1 = mtaln+9
plt2 = plt1+9
plt3 = plt2+9
plt4 = plt3+9
plt5 = plt4+9
plt6 = plt5+9
plt7 = plt6+9
plt8 = plt7+9
plt9 = plt8+9
plta = plt9+9
pltb = plta+9
pltc = pltb+9
pltd = pltc+9
plte = pltd+9
pltf = plte+9
