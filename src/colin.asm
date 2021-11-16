;
;collisions
;
;about time too !
;
colin
nop ;  ldx tbl   ; *^*
nop ;  ldx tbl   ; *^*
nop ;  rts       ; *^*
ldx scoff
lda mbh8,x
sta tagl+1
lda mby8,x
clc
adc sprix,y
sta tagl
lda tagl+1
adc #0
and #7
sta tagl+1
ldx smve
lda tagl
sec
sbc #22  ;25
sta tagl
lda tagl+1
sbc #0
and #7
sta tagl+1
lda tagl
sec
sbc sijtoy,x
sta tagl
lda tagl+1
sbc #0
and #7
sta tagl+1
lda msb
and madms,y
beq keno4
lda tagl+1
clc
adc #1
and #7
sta tagl+1
keno4
;
ldx #0
checol
;
lda dog
beq chek2
lda exalg,x
beq chek
jmp cout2
chek lda dedmed,x
beq chek2
jmp cout2
chek2 sec
lda slig,x
sbc tagl
sta dtp
lda shig,x
sbc tagl+1
and #7
sta dtp+1
;
bcc clow
;meanie is on your right
lda dtp+1
bne cout
lda dtp
cmp #19 ;$18
bcc colide
jmp cout
;
clow
;meanie is on your left
lda shig,x
sta dtpr+1
lda slig,x
clc
adc #19 ;$18
sta dtpr
bcc clow2
inc dtpr+1
clow2
;
sec
lda dtpr
sbc tagl
sta dtp
lda dtpr+1
sbc tagl+1
sta dtp+1
bcc cout
jmp colide
;
cout ;no collision in x
jmp cout2
;
colide ;collision in x
;now check y
lda spriy,y
cmp sxig,x
bcc clowy
;you are higher than it
lda spriy,y
sec
sbc sxig,x
cmp #17 ;21
bcc colidx
jmp cout2
;
clowy ;you are lower than it
lda spriy,y
clc
adc #17 ;21
cmp sxig,x
bcc cout2
;jmp colidx
;
colidx
rts
cout2
inx
cpx tbl
beq chrst
jmp checol
chrst rts
;
;on return if x = 12
;then no collision has occured
;else use x as offset for result
;table
