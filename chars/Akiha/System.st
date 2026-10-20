; vim: set ts=4 sw=4 sts=4 expandtab: =========================================;
;                         [ 遠野秋葉 from MELTY BLOOD ]                        ;
;==============================================================================;

;==============================================================================;
; 回避行動
;==============================================================================;
;------------------------------------------------------------------------------;
; 地上避け
;------------------------------------------------------------------------------;
;---------------------------------------------------------------------------
; Recuperacion tras esquivar/rodar: sin control y golpeable unos frames,
; para que no se pueda encadenar sin riesgo.
;---------------------------------------------------------------------------
[Statedef 1003]
type = S
movetype = I
physics = S
ctrl = 0
anim = 0
velset = 0,0

[State 1003, Fin de la recuperacion]
type = ChangeState
trigger1 = Time >= 12
value = 0
ctrl = 1

[Statedef 700]
type        = S
movetype    = I
physics     = S
anim        = 700
ctrl        = 0
sprpriority = -1

;-------[ Sounds ]-------;

[State 700:         SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 1
value    = 6, 0

[State 700:         Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 2
trigger1    = Random < 350
value       = ifelse(var(50), 2, 0), 700 + (Random % 2)
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

;-------[ Movement ]-------;

[State 700:         Hit by Throw]
type     = HitBy
trigger1 = 1
value    = SCA, NT, ST, HT
time     = 1

[State 800:         Push]
type     = PlayerPush
trigger1 = 1
value    = 0

;-------[ Effects ]-------;

[State 700:         Flash]
type     = PalFX
trigger1 = Time = 0
sinadd   = 196, 196, 196, 12
time     = 6

[State 800:         AfterImage]
type        = AfterImage
trigger1    = Time = 0
time        = 2
framegap    = 6
length      = 10
paladd      = 0, 0, 0
palbright   = 1, 1, 1
palmul      = 0.5, 0.5, 0.5
palcontrast = 128, 128, 128
trans       = Add1

[State 800:         AfterImage]
type     = AfterImageTime
trigger1 = 1
time     = 2

;-------[ States ]-------;

[State 800:         ChangeState, Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 1003
ctrl     = 0

;------------------------------------------------------------------------------;
; 空中避け
;------------------------------------------------------------------------------;
[Statedef 710]
type        = A
movetype    = I
physics     = A
anim        = 710
ctrl        = 0
sprpriority = -1

;-------[ Sounds ]-------;

[State 700:         SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 1
value    = 6, 0

[State 700:         Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = Random < 350
value       = ifelse(var(50), 2, 0), 700 + (Random % 2)
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

;-------[ Movement ]-------;

[State 700:         Hit by Throw]
type     = HitBy
trigger1 = 1
value    = SCA, NT, ST, HT
time     = 1

[State 800:         Push]
type     = PlayerPush
trigger1 = 1
value    = 0

[State 710:         Ctrl]
type     = CtrlSet
trigger1 = AnimElem = 4
value    = 1

;-------[ Effects ]-------;

[State 700:         Flash]
type     = PalFX
trigger1 = Time = 0
sinadd   = 196, 196, 196, 12
time     = 6

[State 800:         AfterImage]
type        = AfterImage
trigger1    = Time = 0
time        = 2
framegap    = 6
length      = 10
paladd      = 0, 0, 0
palbright   = 1, 1, 1
palmul      = 0.5, 0.5, 0.5
palcontrast = 128, 128, 128
trans       = Add1

[State 800:         AfterImage]
type     = AfterImageTime
trigger1 = 1
time     = 2

;-------[ States ]-------;

[State 800:         ChangeState, Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 51
ctrl     = 1


;==============================================================================;
; ガードキャンセル
;==============================================================================;
;------------------------------------------------------------------------------;
; ガードキャンセル後転
;------------------------------------------------------------------------------;
[Statedef 760]
type     = S
movetype = I
physics  = S
ctrl     = 0
velset   = 0, 0
poweradd = -(var(5))

;-------[ Sounds ]-------;

[State 750:         SE, 1]
type     = PlaySnd
trigger1 = Time = 0
value    = 10, 2

;-------[ Movement ]-------;

[State 750:         Pause]
type     = Pause
trigger1 = Time = 0
time     = 16
movetime = 16

[State 750:         Not Hit, Muteki]
type     = NotHitBy
trigger1 = Time = 0
value    = SCA, NA, SA, HA, NT, ST, HT, NP, SP, HP
time     = 32

;-------[ Effects ]-------;

[State 750:         Blocking Effect]
type          = Explod
trigger1      = Time = 0
anim          = 6102
postype       = p1
pos           = Floor(-3 * const(size.xscale)), Floor(-72 * const(size.yscale))
scale         = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
sprpriority   = 10
ownpal        = 1
ontop         = 1
pausemovetime = 20
supermovetime = 20

;-------[ States ]-------;

[State 750:         ChangeState, Rolling]
type     = ChangeState
trigger1 = Time >= 10
value    = 105  ;820
ctrl     = 0

;------------------------------------------------------------------------------;
; ガードキャンセルシールドバンカー
;------------------------------------------------------------------------------;
[Statedef 770]
type     = S
movetype = A
physics  = S
ctrl     = 0
velset   = 0, 0
poweradd = -(var(5))

;-------[ Sounds ]-------;

[State 750:         SE, 1]
type     = PlaySnd
trigger1 = Time = 0
value    = 10, 2

;-------[ Movement ]-------;

[State 750:         Pause]
type     = Pause
trigger1 = Time = 0
time     = 16
movetime = 16

[State 750:         Not Hit, Muteki]
type     = NotHitBy
trigger1 = Time = 0
value    = SCA, NA, SA, HA, NT, ST, HT, NP, SP, HP
time     = 32

;-------[ Effects ]-------;

[State 750:         Blocking Effect]
type          = Explod
trigger1      = Time = 0
anim          = 6102
postype       = p1
pos           = Floor(-3 * const(size.xscale)), Floor(-72 * const(size.yscale))
scale         = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
sprpriority   = 10
ownpal        = 1
ontop         = 1
pausemovetime = 20
supermovetime = 20

;-------[ States ]-------;

[State 750:         ChangeState, Attack]
type     = ChangeState
trigger1 = Time >= 10
value    = 930
ctrl     = 0


;==============================================================================;
; HEAT
;==============================================================================;
;------------------------------------------------------------------------------;
; HEAT (地上)
;------------------------------------------------------------------------------;
[Statedef 800]
type     = S
movetype = I
physics  = S
anim     = 800
ctrl     = 0

;-------[ Sounds ]-------;

[State 800:         Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 3
value       = ifelse(var(50), 2, 0), 800 + (Random % 2)
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 800:         SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 5, 0

;-------[ Movement ]-------;

[State 800:         Not hit]
type     = NotHitBy
trigger1 = AnimElemTime(5) < 0
value    = SCA, NA, SA, HA, NT, ST, HT, NP, SP, HP
time     = 2

;-------[ Var ]-------;

[State 800:         Set Time]
type     = VarSet
trigger1 = AnimElem = 4
v        = 20
value    = Power / 5

[State 800:         Set Power]
type     = VarSet
trigger1 = AnimElem = 4
v        = 25
value    = Power - var(7)

;-------[ Effects ]-------;

[State 800:         HEAT Effect]
type        = Explod
trigger1    = AnimElem = 4
anim        = 6700
postype     = p1
pos         = Floor(-4 * const(size.xscale)), Floor(-60 * const(size.yscale))
ownpal      = 1
scale       = const(size.xscale), const(size.yscale)
sprpriority = -1

;-------[ Projectiles ]-------;

[State 800:         Projectile]
type             = Projectile
trigger1         = AnimElem = 4
projid           = 800
projanim         = 801
projhitanim      = -1
projremanim      = -1
projremove       = 1
projremovetime   = 6
projhits         = 1
projpriority     = 1
projsprpriority  = 10
offset           = Floor(-4 * const(size.xscale)), Floor(-60 * const(size.yscale))
velocity         = 0, 0
animtype         = Hard
attr             = S, SA
damage           = 0, 0
getpower         = 0, 0
hitflag          = MA
guardflag        = MA
pausetime        = 0, 0
sparkno          = S6010 + Random % 8
guard.sparkno    = S6061
sparkxy          = 15, Floor((-20 + (Random % 40)) * const(size.yscale))
hitsound         = S7, 11
guardsound       = S8, 1
ground.type      = High
ground.hittime   = 19
ground.slidetime = 18
ground.velocity  = -8, -4
air.hittime      = 19
air.velocity     = -6, -3
air.juggle       = 0
air.fall         = 1
fall             = 1
fall.recover     = 0
id               = 800
p2stateno        = 4900
p2facing         = ifelse(P2Dist X > 0, 1, -1)

;-------[ States ]-------;

[State 800:         Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; HEAT (空中)
;------------------------------------------------------------------------------;
[Statedef 805]
type     = A
movetype = I
physics  = N
anim     = 805
ctrl     = 0
velset   = 0, 0

;-------[ Sounds ]-------;

[State 800:         Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 3
value       = ifelse(var(50), 2, 0), 800 + (Random % 2)
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 800:         SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 5, 0

;-------[ Movement ]-------;

[State 800:         Not hit]
type     = NotHitBy
trigger1 = AnimElemTime(5) < 0
value    = SCA, NA, SA, HA, NT, ST, HT, NP, SP, HP
time     = 2

;-------[ Var ]-------;

[State 800:         Set Time]
type     = VarSet
trigger1 = AnimElem = 4
v        = 20
value    = Power / 5

[State 800:         Set Power]
type     = VarSet
trigger1 = AnimElem = 4
v        = 25
value    = Power - var(7)

;-------[ Effects ]-------;

[State 800:         HEAT Effect]
type        = Explod
trigger1    = AnimElem = 4
anim        = 6700
postype     = p1
pos         = Floor(-4 * const(size.xscale)), Floor(-60 * const(size.yscale))
ownpal      = 1
scale       = const(size.xscale), const(size.yscale)
sprpriority = -1

;-------[ Projectiles ]-------;

[State 800:         Projectile]
type             = Projectile
trigger1         = AnimElem = 4
projid           = 800
projanim         = 801
projhitanim      = -1
projremanim      = -1
projremove       = 1
projremovetime   = 6
projhits         = 1
projpriority     = 1
projsprpriority  = 10
offset           = Floor(-4 * const(size.xscale)), Floor(-60 * const(size.yscale))
velocity         = 0, 0
animtype         = Hard
attr             = A, SA
damage           = 0, 0
getpower         = 0, 0
hitflag          = MA
guardflag        = MA
pausetime        = 0, 0
sparkno          = S6010 + Random % 8
guard.sparkno    = S6061
sparkxy          = 15, Floor((-20 + (Random % 40)) * const(size.yscale))
hitsound         = S7, 11
guardsound       = S8, 1
ground.type      = High
ground.hittime   = 19
ground.slidetime = 18
ground.velocity  = -8, -4
air.hittime      = 19
air.velocity     = -6, -3
air.juggle       = 0
air.fall         = 1
fall             = 1
fall.recover     = 0
id               = 800
p2stateno        = 4900
p2facing         = ifelse(P2Dist X > 0, 1, -1)

;-------[ States ]-------;

[State 800:         Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 51
ctrl     = 1

;------------------------------------------------------------------------------;
; BLOOD HEAT (地上)
;------------------------------------------------------------------------------;
[Statedef 810]
type     = S
movetype = I
physics  = S
anim     = 800
ctrl     = 0

;-------[ Sounds ]-------;

[State 800:         Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 3
value       = ifelse(var(50), 2, 0), 800 + (Random % 2)
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 800:         SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 5, 1

;-------[ Movement ]-------;

[State 800:         Not hit]
type     = NotHitBy
trigger1 = AnimElemTime(5) < 0
value    = SCA, NA, SA, HA, NT, ST, HT, NP, SP, HP
time     = 2

;-------[ Var ]-------;

[State 800:         Set Time]
type     = VarSet
trigger1 = AnimElem = 4
v        = 21
value    = ifelse((var(24) > 0), var(24), Power / 5)

[State 800:         Set Power]
type     = VarSet
trigger1 = AnimElem = 4
v        = 25
value    = ifelse((var(24) > 0), PowerMax - var(7), Power - var(7))

;-------[ Effects ]-------;

[State 800:         HEAT Effect]
type        = Explod
trigger1    = AnimElem = 4
anim        = 6700
postype     = p1
pos         = Floor(-4 * const(size.xscale)), Floor(-60 * const(size.yscale))
ownpal      = 1
scale       = const(size.xscale), const(size.yscale)
sprpriority = -1

;-------[ Projectiles ]-------;

[State 800:         Projectile]
type             = Projectile
trigger1         = AnimElem = 4
projid           = 810
projanim         = 801
projhitanim      = -1
projremanim      = -1
projremove       = 1
projremovetime   = 6
projhits         = 1
projpriority     = 1
projsprpriority  = 10
offset           = Floor(-4 * const(size.xscale)), Floor(-60 * const(size.yscale))
velocity         = 0, 0
animtype         = Hard
attr             = S, SA
damage           = 0, 0
getpower         = 0, 0
hitflag          = MA
guardflag        = MA
pausetime        = 0, 0
sparkno          = S6010 + Random % 8
guard.sparkno    = S6061
sparkxy          = 15, Floor((-20 + (Random % 40)) * const(size.yscale))
hitsound         = S7, 11
guardsound       = S8, 1
ground.type      = High
ground.hittime   = 19
ground.slidetime = 18
ground.velocity  = -8, -4
air.hittime      = 19
air.velocity     = -6, -3
air.juggle       = 0
air.fall         = 1
fall             = 1
fall.recover     = 1
fall.recovertime = 30
id               = 810
p2stateno        = 4900
p2facing         = 1

;-------[ States ]-------;

[State 800:         Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; BLOOD HEAT (空中)
;------------------------------------------------------------------------------;
[Statedef 815]
type     = A
movetype = I
physics  = N
anim     = 805
ctrl     = 0
velset   = 0, 0

;-------[ Sounds ]-------;

[State 800:         Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 3
value       = ifelse(var(50), 2, 0), 800 + (Random % 2)
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 800:         SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 5, 1

;-------[ Movement ]-------;

[State 800:         Not hit]
type     = NotHitBy
trigger1 = AnimElemTime(5) < 0
value    = SCA, NA, SA, HA, NT, ST, HT, NP, SP, HP
time     = 2

;-------[ Var ]-------;

[State 800:         Set Time]
type     = VarSet
trigger1 = AnimElem = 4
v        = 21
value    = ifelse((var(24) > 0), var(24), Power / 5)

[State 800:         Set Power]
type     = VarSet
trigger1 = AnimElem = 4
v        = 25
value    = ifelse((var(24) > 0), PowerMax - var(7), Power - var(7))

;-------[ Effects ]-------;

[State 800:         HEAT Effect]
type        = Explod
trigger1    = AnimElem = 4
anim        = 6700
postype     = p1
pos         = Floor(-4 * const(size.xscale)), Floor(-60 * const(size.yscale))
ownpal      = 1
scale       = const(size.xscale), const(size.yscale)
sprpriority = -1

;-------[ Projectiles ]-------;

[State 800:         Projectile]
type             = Projectile
trigger1         = AnimElem = 4
projid           = 810
projanim         = 801
projhitanim      = -1
projremanim      = -1
projremove       = 1
projremovetime   = 6
projhits         = 1
projpriority     = 1
projsprpriority  = 10
offset           = Floor(-4 * const(size.xscale)), Floor(-60 * const(size.yscale))
velocity         = 0, 0
animtype         = Hard
attr             = A, SA
damage           = 0, 0
getpower         = 0, 0
hitflag          = MA
guardflag        = MA
pausetime        = 0, 0
sparkno          = S6010 + Random % 8
guard.sparkno    = S6061
sparkxy          = 15, Floor((-20 + (Random % 40)) * const(size.yscale))
hitsound         = S7, 11
guardsound       = S8, 1
ground.type      = High
ground.hittime   = 19
ground.slidetime = 18
ground.velocity  = -8, -4
air.hittime      = 19
air.velocity     = -6, -3
air.juggle       = 0
air.fall         = 1
fall             = 1
fall.recover     = 1
fall.recovertime = 30
id               = 810
p2stateno        = 4900
p2facing         = 1

;-------[ States ]-------;

[State 800:         Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 51
ctrl     = 1


;==============================================================================;
; サーキットスパーク (食らい抜け)
;==============================================================================;
;------------------------------------------------------------------------------;
; サーキットスパーク (地上)
;------------------------------------------------------------------------------;
[Statedef 820]
type     = S
movetype = I
physics  = S
anim     = 820
ctrl     = 0

;-------[ Sounds ]-------;

[State 800:         Voice, 1, MBAC]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = !var(50)
value       = 0, 800 + (Random % 2)
channel     = 0
volume      = 127
lowpriority = 1

[State 800:         Voice, 1, MBAA]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = var(50)
value       = 2, 820
channel     = 0
volume      = 255
lowpriority = 1

[State 800:         SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 5, 1

;-------[ Movement ]-------;

[State 800:         Not hit]
type     = NotHitBy
trigger1 = 1
value    = SCA, NA, SA, HA, NT, ST, HT, NP, SP, HP
time     = 2

;-------[ Var ]-------;

[State 800:         Set Time]
type     = VarRangeSet
trigger1 = AnimElem = 4
first    = 22
last     = 23
value    = 180 + Ceil((1.0 - (Power * 1.0 / PowerMax)) * 180)

[State 800:         Set Power]
type     = VarSet
trigger1 = AnimElem = 4
v        = 25
value    = 0

;-------[ Effects ]-------;

[State 800:         HEAT Effect]
type        = Explod
trigger1    = AnimElem = 4
anim        = 6700
postype     = p1
pos         = Floor(-4 * const(size.xscale)), Floor(-60 * const(size.yscale))
ownpal      = 1
scale       = const(size.xscale), const(size.yscale)
sprpriority = -1

[State 800:         BGPalFX]
type     = BGPalFX
trigger1 = Time = 0
time     = 24
sinadd   = -128, -128, -128, 48

;-------[ Projectiles ]-------;

[State 800:         Projectile]
type             = Projectile
trigger1         = AnimElem = 4
projid           = 820
projanim         = 801
projhitanim      = -1
projremanim      = -1
projremove       = 1
projremovetime   = 6
projhits         = 1
projpriority     = 1
projsprpriority  = 10
offset           = Floor(-4 * const(size.xscale)), Floor(-60 * const(size.yscale))
velocity         = 0, 0
animtype         = Hard
attr             = S, SA
damage           = 0, 0
getpower         = 0, 0
hitflag          = MA
guardflag        = MA
pausetime        = 0, 0
sparkno          = S6010 + Random % 8
guard.sparkno    = S6061
sparkxy          = 15, Floor((-20 + (Random % 40)) * const(size.yscale))
hitsound         = S7, 11
guardsound       = S8, 1
ground.type      = High
ground.hittime   = 19
ground.slidetime = 18
ground.velocity  = -8, -4
air.hittime      = 19
air.velocity     = -6, -3
air.juggle       = 0
air.fall         = 1
fall             = 1
fall.recover     = 1
fall.recovertime = 30
id               = 820
p2stateno        = 4900
p2facing         = 1

;-------[ States ]-------;

[State 800:         Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; サーキットスパーク (空中)
;------------------------------------------------------------------------------;
[Statedef 825]
type     = A
movetype = I
physics  = N
anim     = 825
ctrl     = 0
velset   = 0, 0

;-------[ Sounds ]-------;

[State 800:         Voice, 1, MBAC]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = !var(50)
value       = 0, 800 + (Random % 2)
channel     = 0
volume      = 127
lowpriority = 1

[State 800:         Voice, 1, MBAA]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = var(50)
value       = 2, 820
channel     = 0
volume      = 255
lowpriority = 1

[State 800:         SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 5, 1

;-------[ Movement ]-------;

[State 800:         Not hit]
type     = NotHitBy
trigger1 = 1
value    = SCA, NA, SA, HA, NT, ST, HT, NP, SP, HP
time     = 2

;-------[ Var ]-------;

[State 800:         Set Time]
type     = VarRangeSet
trigger1 = AnimElem = 4
first    = 22
last     = 23
value    = 180 + Ceil((1.0 - (Power * 1.0 / PowerMax)) * 180)

[State 800:         Set Power]
type     = VarSet
trigger1 = AnimElem = 4
v        = 25
value    = 0

;-------[ Effects ]-------;

[State 800:         HEAT Effect]
type        = Explod
trigger1    = AnimElem = 4
anim        = 6700
postype     = p1
pos         = Floor(-4 * const(size.xscale)), Floor(-60 * const(size.yscale))
ownpal      = 1
scale       = const(size.xscale), const(size.yscale)
sprpriority = -1

[State 800:         BGPalFX]
type     = BGPalFX
trigger1 = Time = 0
time     = 24
sinadd   = -128, -128, -128, 48

;-------[ Projectiles ]-------;

[State 800:         Projectile]
type             = Projectile
trigger1         = AnimElem = 4
projid           = 820
projanim         = 801
projhitanim      = -1
projremanim      = -1
projremove       = 1
projremovetime   = 6
projhits         = 1
projpriority     = 1
projsprpriority  = 10
offset           = Floor(-4 * const(size.xscale)), Floor(-60 * const(size.yscale))
velocity         = 0, 0
animtype         = Hard
attr             = A, SA
damage           = 0, 0
getpower         = 0, 0
hitflag          = MA
guardflag        = MA
pausetime        = 0, 0
sparkno          = S6010 + Random % 8
guard.sparkno    = S6061
sparkxy          = 15, Floor((-20 + (Random % 40)) * const(size.yscale))
hitsound         = S7, 11
guardsound       = S8, 1
ground.type      = High
ground.hittime   = 19
ground.slidetime = 18
ground.velocity  = -8, -4
air.hittime      = 19
air.velocity     = -6, -3
air.juggle       = 0
air.fall         = 1
fall             = 1
fall.recover     = 1
fall.recovertime = 30
id               = 820
p2stateno        = 4900
p2facing         = 1

;-------[ States ]-------;

[State 800:         Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 51
ctrl     = 1


;==============================================================================;
; チャージ
;==============================================================================;
;------------------------------------------------------------------------------;
; チャージ開始
;------------------------------------------------------------------------------;
[Statedef 850]
type     = S
movetype = I
physics  = S
anim     = 850
ctrl     = 0
velset   = 0, 0

;-------[ Sounds ]-------;

[State 750:         Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 4
trigger1 = !var(50)
value    = 0, 201
volume   = 127
channel  = 0

[State 750:         Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 4
trigger1 = var(50)
value    = 2, 850
volume   = 255
channel  = 0

[State 750:         SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 10, 0
channel  = 20

;-------[ Power ]-------;

[State 750:         Power, 1]
type     = PowerAdd
trigger1 = Time = [10, 69]
value    = Ceil(PowerMax * 0.0016)

[State 750:         Power, 2]
type     = PowerAdd
trigger1 = Time = [70, 129]
value    = Ceil(PowerMax * 0.0032)

[State 750:         Power, 3]
type     = PowerAdd
trigger1 = Time >= 130
value    = Ceil(PowerMax * 0.0048)

;-------[ Effects ]-------;

[State 750:         Effect, 1]
type           = Explod
trigger1       = AnimElem = 4
anim           = 6300
id             = 6300
postype        = p1
pos            = Floor(-4 * const(size.xscale)), 0
ownpal         = 1
removetime     = -1
sprpriority    = 10
scale          = 1.0 * const(size.xscale), 0.1 * const(size.yscale)
removeongethit = 1
bindtime       = -1

[State 750:         Effect Scale]
type     = ModifyExplod
trigger1 = NumExplod(6300)
scale    = 1.0 * const(size.xscale), 0.2 * (1 + (Power / (PowerMax / 5))) * const(size.yscale)
id       = 6300

[State 750:         Effect, 2]
type           = Explod
trigger1       = AnimElem = 4
anim           = 6301
id             = 6301
postype        = p1
pos            = Floor(-4 * const(size.xscale)), 0
scale          = const(size.xscale), const(size.yscale)
ownpal         = 1
removetime     = -1
sprpriority    = -4
removeongethit = 1
bindtime       = -1

;-------[ States ]-------;

[State 750:         Finish Charge]
type       = ChangeState
triggerall = AnimElemTime(4) > 3
trigger1   = !var(59)
trigger1   = !(command = "PowerChargeP" && command = "PowerChargeK")
trigger2   = Power >= PowerMax
trigger3   = var(20) > 0
trigger4   = var(21) > 0
trigger5   = var(23) > 0
trigger6   = var(24) > 0
value      = 851

;------------------------------------------------------------------------------;
; 溜め終了
;------------------------------------------------------------------------------;
[Statedef 851]
type     = S
movetype = I
physics  = S
anim     = 851
ctrl     = 1

;-------[ Sounds ]-------;

[State 751:         Stop Voice]
type     = StopSnd
trigger1 = Time = 0
channel  = 0

[State 751:         Stop SE]
type     = StopSnd
trigger1 = Time = 0
channel  = 20

;-------[ Effects ]-------;

[State 751:         Remove Effect]
type     = RemoveExplod
trigger1 = Time = 0
id       = 6300

[State 751:         Remove Effect]
type     = RemoveExplod
trigger1 = Time = 0
id       = 6301

;-------[ States ]-------;

[State 751:         ChangeState, Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;==============================================================================;
; シールド
;==============================================================================;
;------------------------------------------------------------------------------;
; 立ちシールド
;------------------------------------------------------------------------------;
[Statedef 900]
type     = S
movetype = I
physics  = S
anim     = 900
ctrl     = 0
velset   = 0, 0

;-------[ Movement ]-------;

[State 900:         State Type, 2]
type      = StateTypeSet
trigger1  = AnimElemTime(2) = 0
statetype = S
movetype  = I
physics   = S

[State 900:         Power]
type     = PowerAdd
trigger1 = AnimElem = 1
value    = -(var(3))

;-------[ Effects ]-------;

[State 900:         Shield Effect]
type          = Explod
trigger1      = AnimElem = 1
anim          = 6710
postype       = p1
pos           = Floor(28 * const(size.xscale)), Floor(-70 * const(size.yscale))
scale         = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
ownpal        = 1
bindtime      = -1
sprpriority   = 3
supermovetime = 32
pausemovetime = 32

;-------[ Sounds ]-------;

[State 900:         SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 1
value    = 5, 23

;-------[ Hit Defs ]-------;

[State 900:         Reversal Def]
type          = ReversalDef
trigger1      = AnimElem = 1
attr          = S, NA
reversal.attr = SA, NA, SA, HA, NP, SP, HP
pausetime     = 0, 0
sparkno       = -1
sparkxy       = 0, 0
hitsound      = -1  ;S5, 20 + (Random % 3)
p1stateno     = 901

[State 900:         Hit Override]
type     = HitOverride
trigger1 = AnimElemTime(2) < 0
attr     = SA, NA, SA, HA, NP, SP, HP
slot     = 1
stateno  = 901
time     = 1

;-------[ States ]-------;

[State 900:         Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 立ちシールド 成立
;------------------------------------------------------------------------------;
[Statedef 901]
type     = S
movetype = I
physics  = S
anim     = 901
ctrl     = 0
velset   = 0, 0

;-------[ Last-Arc ]-------;

[State 901:         Goto Last-Arc (赤主遍生・緋の火槌)]
type     = ChangeState
trigger1 = Time = 15
trigger1 = var(21) > 0
value    = 3100

;-------[ Movement ]-------;

[State 901:         No Hit]
type     = NotHitBy
trigger1 = Time < 19
value    = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time     = 1

[State 901:         Pause]
type     = Pause
trigger1 = Time = 0
time     = 18
movetime = 18

[State 901:         Ctrl]
type     = CtrlSet
trigger1 = Time = 19
value    = 1

;-------[ Sounds ]--------;

[State 901:         SE, 1]
type     = PlaySnd
trigger1 = Time = 0
value    = 5, 20 + (Random % 3)
channel  = 5
volume   = 255

[State 901:         Voice, 1, MBAC]
type        = PlaySnd
trigger1    = Time = 18
trigger1    = !var(50)
trigger1    = Random < 650
value       = 1, 900
channel     = 0
volume      = 127
lowpriority = 1

[State 901:         Voice, 1, MBAA]
type        = PlaySnd
trigger1    = Time = 18
trigger1    = var(50)
trigger1    = Random < 650
value       = 2, 900 + (Random % 2)
channel     = 0
volume      = 255
lowpriority = 1

;-------[ Effects ]-------;

[State 901:         Blocking]
type          = Explod
trigger1      = Time = 0
anim          = 6101
postype       = p1
pos           = Floor(28 * const(size.xscale)), Floor(-70 * const(size.yscale))
ownpal        = 1
scale         = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
sprpriority   = 5
pausemovetime = 32
supermovetime = 32

;-------[ Powers ]-------;

[State 901:         Power Add]
type     = PowerAdd
trigger1 = Time = 0
value    = Ceil(PowerMax * 0.025)

;-------[ States ]-------;

[State 900:         Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 立ちブロッキング 成立
;------------------------------------------------------------------------------;
[Statedef 902]
type     = S
movetype = I
physics  = S
anim     = 901
ctrl     = 0
velset   = 0, 0

;-------[ Last-Arc ]-------;

[State 901:         Goto Last-Arc (赤主遍生・朱宴ノ良坂)]
type     = ChangeState
trigger1 = Time = 15
trigger1 = var(21) > 0
value    = 3110

;-------[ Movement ]-------;

[State 901:         No Hit]
type     = NotHitBy
trigger1 = Time < 19
value    = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time     = 1

[State 901:         Pause]
type     = Pause
trigger1 = Time = 0
time     = 18
movetime = 18

[State 901:         Ctrl]
type     = CtrlSet
trigger1 = Time = 19
value    = 1

;-------[ Sounds ]--------;

[State 901:         SE, 1]
type     = PlaySnd
trigger1 = Time = 0
value    = 5, 20 + (Random % 3)
channel  = 5
volume   = 255

[State 901:         Voice, 1, MBAC]
type        = PlaySnd
trigger1    = Time = 18
trigger1    = !var(50)
trigger1    = Random < 650
value       = 1, 900
channel     = 0
volume      = 127
lowpriority = 1

[State 901:         Voice, 1, MBAA]
type        = PlaySnd
trigger1    = Time = 18
trigger1    = var(50)
trigger1    = Random < 650
value       = 2, 900 + (Random % 2)
channel     = 0
volume      = 255
lowpriority = 1

;-------[ Effects ]-------;

[State 901:         Blocking]
type          = Explod
trigger1      = Time = 0
anim          = 6101
postype       = p1
pos           = Floor(28 * const(size.xscale)), Floor(-70 * const(size.yscale))
ownpal        = 1
scale         = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
sprpriority   = 5
pausemovetime = 32
supermovetime = 32

;-------[ Powers ]-------;

[State 901:         Power Add]
type     = PowerAdd
trigger1 = Time = 0
value    = Ceil(PowerMax * 0.025)

;-------[ States ]-------;

[State 900:         Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; しゃがみシールド
;------------------------------------------------------------------------------;
[Statedef 910]
type     = C
movetype = I
physics  = C
anim     = 910
ctrl     = 0
velset   = 0, 0

;-------[ Movement ]-------;

[State 900:         State Type, 2]
type      = StateTypeSet
trigger1  = AnimElemTime(2) = 0
statetype = C
movetype  = I
physics   = C

[State 900:         Power]
type     = PowerAdd
trigger1 = AnimElem = 1
value    = -(var(3))

;-------[ Effects ]-------;

[State 900:         Shield Effect]
type          = Explod
trigger1      = AnimElem = 1
anim          = 6710
postype       = p1
pos           = Floor(14 * const(size.xscale)), Floor(-36 * const(size.yscale))
scale         = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
ownpal        = 1
bindtime      = -1
sprpriority   = 3
supermovetime = 32
pausemovetime = 32

;-------[ Sounds ]-------;

[State 900:         SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 1
value    = 5, 23

;-------[ Hit Defs ]-------;

[State 900:         Reversal Def]
type          = ReversalDef
trigger1      = AnimElem = 1
attr          = C, NA
reversal.attr = C, NA, SA, HA, NP, SP, HP
pausetime     = 0, 0
sparkno       = -1
sparkxy       = 0, 0
hitsound      = -1  ;S5, 20 + (Random % 3)
p1stateno     = 911

[State 900:         Hit Override]
type     = HitOverride
trigger1 = AnimElemTime(2) < 0
attr     = C, NA, SA, HA, NP, SP, HP
slot     = 1
stateno  = 911
time     = 1

;-------[ States ]-------;

[State 900:         Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1

;------------------------------------------------------------------------------;
; しゃがみシールド 成立
;------------------------------------------------------------------------------;
[Statedef 911]
type     = C
movetype = I
physics  = C
anim     = 911
ctrl     = 0
velset   = 0, 0

;-------[ Last-Arc ]-------;

[State 901:         Goto Last-Arc (赤主遍生・緋の火槌)]
type     = ChangeState
trigger1 = Time = 15
trigger1 = var(21) > 0
value    = 3100

;-------[ Movement ]-------;

[State 901:         No Hit]
type     = NotHitBy
trigger1 = Time < 19
value    = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time     = 1

[State 901:         Pause]
type     = Pause
trigger1 = Time = 0
time     = 18
movetime = 18

[State 901:         Ctrl]
type     = CtrlSet
trigger1 = Time = 19
value    = 1

;-------[ Sounds ]--------;

[State 901:         SE, 1]
type     = PlaySnd
trigger1 = Time = 0
value    = 5, 20 + (Random % 3)
channel  = 5
volume   = 255

[State 901:         Voice, 1, MBAC]
type        = PlaySnd
trigger1    = Time = 18
trigger1    = !var(50)
trigger1    = Random < 650
value       = 1, 900
channel     = 0
volume      = 127
lowpriority = 1

[State 901:         Voice, 1, MBAA]
type        = PlaySnd
trigger1    = Time = 18
trigger1    = var(50)
trigger1    = Random < 650
value       = 2, 900 + (Random % 2)
channel     = 0
volume      = 255
lowpriority = 1

;-------[ Effects ]-------;

[State 901:         Blocking]
type          = Explod
trigger1      = Time = 0
anim          = 6101
postype       = p1
pos           = Floor(14 * const(size.xscale)), Floor(-36 * const(size.yscale))
ownpal        = 1
scale         = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
sprpriority   = 5
pausemovetime = 32
supermovetime = 32

;-------[ Powers ]-------;

[State 901:         Power Add]
type     = PowerAdd
trigger1 = Time = 0
value    = Ceil(PowerMax * 0.025)

;-------[ States ]-------;

[State 900:         Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1

;------------------------------------------------------------------------------;
; しゃがみブロッキング 成立
;------------------------------------------------------------------------------;
[Statedef 912]
type     = C
movetype = I
physics  = C
anim     = 911
ctrl     = 0
velset   = 0, 0

;-------[ Last-Arc ]-------;

[State 901:         Goto Last-Arc (赤主遍生・朱宴ノ良坂)]
type     = ChangeState
trigger1 = Time = 15
trigger1 = var(21) > 0
value    = 3110

;-------[ Movement ]-------;

[State 901:         No Hit]
type     = NotHitBy
trigger1 = Time < 19
value    = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time     = 1

[State 901:         Pause]
type     = Pause
trigger1 = Time = 0
time     = 18
movetime = 18

[State 901:         Ctrl]
type     = CtrlSet
trigger1 = Time = 19
value    = 1

;-------[ Sounds ]--------;

[State 901:         SE, 1]
type     = PlaySnd
trigger1 = Time = 0
value    = 5, 20 + (Random % 3)
channel  = 5
volume   = 255

[State 901:         Voice, 1, MBAC]
type        = PlaySnd
trigger1    = Time = 18
trigger1    = !var(50)
trigger1    = Random < 650
value       = 1, 900
channel     = 0
volume      = 127
lowpriority = 1

[State 901:         Voice, 1, MBAA]
type        = PlaySnd
trigger1    = Time = 18
trigger1    = var(50)
trigger1    = Random < 650
value       = 2, 900 + (Random % 2)
channel     = 0
volume      = 255
lowpriority = 1

;-------[ Effects ]-------;

[State 901:         Blocking]
type          = Explod
trigger1      = Time = 0
anim          = 6101
postype       = p1
pos           = Floor(14 * const(size.xscale)), Floor(-36 * const(size.yscale))
ownpal        = 1
scale         = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
sprpriority   = 5
pausemovetime = 32
supermovetime = 32

;-------[ Powers ]-------;

[State 901:         Power Add]
type     = PowerAdd
trigger1 = Time = 0
value    = Ceil(PowerMax * 0.025)

;-------[ States ]-------;

[State 900:         Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1

;------------------------------------------------------------------------------;
; 空中シールド
;------------------------------------------------------------------------------;
[Statedef 920]
type     = A
movetype = I
physics  = A
anim     = 920
ctrl     = 0

;-------[ Movement ]-------;

[State 900:         State Type, 2]
type      = StateTypeSet
trigger1  = AnimElemTime(2) = 0
statetype = A
movetype  = I
physics   = A

[State 900:         Power]
type     = PowerAdd
trigger1 = AnimElem = 1
value    = -(var(3))

;-------[ Effects ]-------;

[State 900:         Shield Effect]
type          = Explod
trigger1      = AnimElem = 1
anim          = 6710
postype       = p1
pos           = Floor(30 * const(size.xscale)), Floor(-80 * const(size.yscale))
scale         = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
ownpal        = 1
bindtime      = -1
sprpriority   = 3
supermovetime = 32
pausemovetime = 32

;-------[ Sounds ]-------;

[State 900:         SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 1
value    = 5, 23

;-------[ Hit Defs ]-------;

[State 900:         Reversal Def]
type          = ReversalDef
trigger1      = AnimElem = 1
attr          = A, NA
reversal.attr = SCA, NA, SA, HA, NP, SP, HP
pausetime     = 0, 0
sparkno       = -1
sparkxy       = 0, 0
hitsound      = -1  ;S5, 20 + (Random % 3)
p1stateno     = 921

[State 900:         Hit Override]
type     = HitOverride
trigger1 = AnimElemTime(2) < 0
attr     = SCA, NA, SA, HA, NP, SP, HP
slot     = 1
stateno  = 921
time     = 1

;-------[ States ]-------;

[State 900:         Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 51
ctrl     = 1

;------------------------------------------------------------------------------;
; 空中シールド 成立
;------------------------------------------------------------------------------;
[Statedef 921]
type     = A
movetype = I
physics  = N
anim     = 921
ctrl     = 0
velset   = 0, 0

;-------[ Movement ]-------;

[State 901:         No Hit]
type     = NotHitBy
trigger1 = Time < 19
value    = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time     = 1

[State 901:         Pause]
type     = Pause
trigger1 = Time = 0
time     = 18
movetime = 18

[State 901:         Ctrl]
type     = CtrlSet
trigger1 = Time = 19
value    = 1

[State 901:         Gravity]
type     = Gravity
trigger1 = AnimElemTime(3) > 0

;-------[ Sounds ]--------;

[State 901:         SE, 1]
type     = PlaySnd
trigger1 = Time = 0
value    = 5, 20 + (Random % 3)
channel  = 5
volume   = 255

[State 901:         Voice, 1, MBAC]
type        = PlaySnd
trigger1    = Time = 18
trigger1    = !var(50)
trigger1    = Random < 650
value       = 1, 900
channel     = 0
volume      = 127
lowpriority = 1

[State 901:         Voice, 1, MBAA]
type        = PlaySnd
trigger1    = Time = 18
trigger1    = var(50)
trigger1    = Random < 650
value       = 2, 900 + (Random % 2)
channel     = 0
volume      = 255
lowpriority = 1

;-------[ Effects ]-------;

[State 901:         Blocking]
type          = Explod
trigger1      = Time = 0
anim          = 6101
postype       = p1
pos           = Floor(30 * const(size.xscale)), Floor(-80 * const(size.yscale))
ownpal        = 1
scale         = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
sprpriority   = 5
pausemovetime = 32
supermovetime = 32

;-------[ Powers ]-------;

[State 901:         Power Add]
type     = PowerAdd
trigger1 = Time = 0
value    = Ceil(PowerMax * 0.025)

;-------[ States ]-------;

[State 900:         Landing]
type     = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value    = 52

[State 900:         Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 51
ctrl     = 1

;------------------------------------------------------------------------------;
; 空中ブロッキング 成立
;------------------------------------------------------------------------------;
[Statedef 922]
type     = A
movetype = I
physics  = N
anim     = 921
ctrl     = 0
velset   = 0, 0

;-------[ Movement ]-------;

[State 901:         No Hit]
type     = NotHitBy
trigger1 = Time < 19
value    = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time     = 1

[State 901:         Pause]
type     = Pause
trigger1 = Time = 0
time     = 18
movetime = 18

[State 901:         Ctrl]
type     = CtrlSet
trigger1 = Time = 19
value    = 1

[State 901:         Gravity]
type     = Gravity
trigger1 = AnimElemTime(3) > 0

;-------[ Sounds ]--------;

[State 901:         SE, 1]
type     = PlaySnd
trigger1 = Time = 0
value    = 5, 20 + (Random % 3)
channel  = 5
volume   = 255

[State 901:         Voice, 1, MBAC]
type        = PlaySnd
trigger1    = Time = 18
trigger1    = !var(50)
trigger1    = Random < 650
value       = 1, 900
channel     = 0
volume      = 127
lowpriority = 1

[State 901:         Voice, 1, MBAA]
type        = PlaySnd
trigger1    = Time = 18
trigger1    = var(50)
trigger1    = Random < 650
value       = 2, 900 + (Random % 2)
channel     = 0
volume      = 255
lowpriority = 1

;-------[ Effects ]-------;

[State 901:         Blocking]
type          = Explod
trigger1      = Time = 0
anim          = 6101
postype       = p1
pos           = Floor(30 * const(size.xscale)), Floor(-80 * const(size.yscale))
ownpal        = 1
scale         = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
sprpriority   = 5
pausemovetime = 32
supermovetime = 32

;-------[ Powers ]-------;

[State 901:         Power Add]
type     = PowerAdd
trigger1 = Time = 0
value    = Ceil(PowerMax * 0.025)

;-------[ States ]-------;

[State 900:         Landing]
type     = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value    = 52

[State 900:         Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 51
ctrl     = 1

;------------------------------------------------------------------------------;
; シールドバンカー
;------------------------------------------------------------------------------;
[Statedef 930]
type     = S
movetype = A
physics  = S
anim     = 930
ctrl     = 0
velset   = 0, 0

;-------[ Vars ]-------;

[State 930:         Guard Cancel Flag]
type     = VarSet
trigger1 = Time = 0
v        = 40
value    = (PrevStateNo = 770)

;-------[ Shield ]-------;

[State 900:         Reversal Def]
type          = ReversalDef
triggerall    = !MoveReversed
trigger1      = AnimElemTime(2) >= 0
trigger1      = AnimElemTime(4) < 0
attr          = S, NA
reversal.attr = SA, NA, SA, HA, NP, SP, HP
pausetime     = 0, 0
sparkno       = -1
sparkxy       = 0, 0
hitsound      = S5, 20 + (Random % 3)
p1stateno     = 932

[State 900:         Hit Override]
type       = HitOverride
triggerall = !MoveReversed
trigger1   = AnimElemTime(2) >= 0
trigger1   = AnimElemTime(4) < 0
attr       = SA, NA, SA, HA, NP, SP, HP
slot       = 1
stateno    = 932
time       = 1

;-------[ States ]-------;

[State 930:         Attack]
type     = ChangeState
trigger1 = AnimElemTime(4) = 0
value    = 931

;------------------------------------------------------------------------------;
; シールドバンカー 攻撃
;------------------------------------------------------------------------------;
[Statedef 931]
type           = S
movetype       = A
physics        = S
ctrl           = 0
velset         = 0, 0
movehitpersist = 1

;-------[ Sounds ]-------;

[State 930:         SE, 1]
type     = PlaySnd
trigger1 = AnimElemTime(4) = 1
value    = 6, 2

[State 930:         Voice, 1, MBAC]
type        = PlaySnd
triggerall  = AnimElemTime(4) = 1
triggerall  = !var(50)
trigger1    = Random < 450
trigger2    = var(40)
value       = 1, 203 + (Random % 3)
channel     = 0
volume      = 127
lowpriority = 1

[State 930:         Voice, 1, MBAA]
type        = PlaySnd
triggerall  = AnimElemTime(4) = 1
triggerall = var(50)
trigger1    = Random < 450
trigger2    = var(40)
value       = 2, 210 + (Random % 5)
channel     = 0
volume      = 255
lowpriority = 1

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
triggerall       = AnimElem = 6
trigger1         = !var(40)         ; ガードキャンセルシールドバンカーではない
attr             = S, NA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
priority         = 6, Hit
damage           = 59, 0
getpower = 60,30
pausetime        = 8, 8
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-60 * const(size.yscale))
hitsound         = S7, 2
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 20
ground.hittime   = 19
ground.velocity  = -7.0, -3.0
guard.ctrltime   = 18
air.type         = High
air.hittime      = 19
air.velocity     = -7, -2
air.fall         = 1
fall.recover     = 1
fall.recovertime = 15
id               = 930

[State 200:             Hit Def, 2]
type             = HitDef
triggerall       = AnimElem = 6
trigger1         = var(40)          ; ガードキャンセルシールドバンカーではない
attr             = S, NA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
priority         = 6, Hit
damage           = 59, 0
getpower = 60,30
pausetime        = 8, 8
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-60 * const(size.yscale))
hitsound         = S7, 2
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 20
ground.hittime   = 19
ground.velocity  = -7.0, -3.0
guard.ctrltime   = 18
air.type         = High
air.hittime      = 19
air.velocity     = -7, -2
air.fall         = 1
fall.recover     = 1
fall.recovertime = 15
p2stateno        = 4900
id               = 930

;-------[ States ]-------;

[State 930:         Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; シールドバンカー シールド成立
;------------------------------------------------------------------------------;
[Statedef 932]
type           = S
movetype       = A
physics        = S
ctrl           = 0
velset         = 0, 0
movehitpersist = 1

;-------[ Movement ]-------;

[State 901:         No Hit]
type     = NotHitBy
trigger1 = Time < 15
value    = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time     = 1

[State 901:         Pause]
type     = Pause
trigger1 = Time = 0
time     = 15
movetime = 0

;-------[ Effects ]-------;

[State 901:         Blocking]
type          = Explod
trigger1      = Time = 0
anim          = 6101
postype       = p1
pos           = Floor(28 * const(size.xscale)), Floor(-70 * const(size.yscale))
ownpal        = 1
scale         = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
sprpriority   = 5
pausemovetime = 30
supermovetime = 30

;-------[ Powers ]-------;

[State 901:         Power Add]
type     = PowerAdd
trigger1 = Time = 0
value    = Ceil(PowerMax * 0.025)

;-------[ States ]-------;

[State 900:         Standing]
type     = ChangeState
trigger1 = Time >= 1
value    = 931
ctrl     = 0


;==============================================================================;
; ジャストディフェンス
;==============================================================================;
;------------------------------------------------------------------------------;
; ジャストディフェンス (立)
;------------------------------------------------------------------------------;
[Statedef 950]
type     = S
movetype = I
physics  = S
anim     = 950
ctrl     = 0
velset   = 0, 0

;-------[ Misc ]-------;

[State 950:         VarSet, Damage]
type     = VarSet
trigger1 = Time = 0
v        = 31
value    = GetHitVar(Damage)

[State 950:         VarSet, Life]
type     = VarSet
trigger1 = Time = 0
v        = 32
value    = ifelse(var(31) > 9, var(31), 9) * ifelse((var(54) = 3), 2, 1)

[State 950:         Life]
type     = LifeAdd
trigger1 = Time = 0
value    = Abs(var(32))
absolute = 1

[State 950:         Power]
type     = PowerAdd
trigger1 = Time = 0
value    = Ceil(var(32) * 5.0)

;-------[ Sounds ]-------;

[State 950:         SE, 1]
type     = PlaySnd
trigger1 = Time = 0
value    = 10, 6

;-------[ Movement ]-------;

[State 950:         Not Hit]
type     = NotHitBy
trigger1 = 1
value    = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time     = 1

[State 950:         Pause]
type     = Pause
trigger1 = Time = 0
time     = 3
movetime = 3

[State 950:         Hit Ctrl Time]
type     = VarSet
trigger1 = Time = 0
v        = 40
value    = GetHitVar(ctrltime) / 2

;-------[ Effects ]-------;

[State 950:         Just Defence Effect]
type          = Explod
trigger1      = Time = 0
anim          = 6100
postype       = p1
pos           = Floor(0 * const(size.xscale)), Floor(-72 * const(size.yscale))
scale         = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
sprpriority   = 10
ownpal        = 1
ontop         = 1
pausemovetime = 20
supermovetime = 20

;-------[ States ]-------;

[State 950:         ChangeState, Guarding]
type     = ChangeState
trigger1 = Time = 0
value    = 151  ;130
ctrl     = 0

;------------------------------------------------------------------------------;
; ジャストディフェンス (屈)
;------------------------------------------------------------------------------;
[Statedef 960]
type     = C
movetype = I
physics  = C
anim     = 960
ctrl     = 0
velset   = 0, 0

;-------[ Misc ]-------;

[State 950:         VarSet, Damage]
type     = VarSet
trigger1 = Time = 0
v        = 31
value    = GetHitVar(Damage)

[State 950:         VarSet, Life]
type     = VarSet
trigger1 = Time = 0
v        = 32
value    = ifelse(var(31) > 9, var(31), 9) * ifelse((var(54) = 3), 2, 1)

[State 950:         Life]
type     = LifeAdd
trigger1 = Time = 0
value    = Abs(var(32))
absolute = 1

[State 950:         Power]
type     = PowerAdd
trigger1 = Time = 0
value    = Ceil(var(32) * 5.0)

;-------[ Sounds ]-------;

[State 950:         SE, 1]
type     = PlaySnd
trigger1 = Time = 0
value    = 10, 6

;-------[ Movement ]-------;

[State 950:         Not Hit]
type     = NotHitBy
trigger1 = 1
value    = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time     = 1

[State 950:         Pause]
type     = Pause
trigger1 = Time = 0
time     = 3
movetime = 3

[State 950:         Hit Ctrl Time]
type     = VarSet
trigger1 = Time = 0
v        = 40
value    = GetHitVar(ctrltime) / 2

;-------[ Effects ]-------;

[State 950:         Just Defence Effect]
type          = Explod
trigger1      = Time = 0
anim          = 6100
postype       = p1
pos           = Floor(0 * const(size.xscale)), Floor(-36 * const(size.yscale))
scale         = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
sprpriority   = 10
ownpal        = 1
ontop         = 1
pausemovetime = 20
supermovetime = 20

;-------[ States ]-------;

[State 950:         ChangeState, Guarding]
type     = ChangeState
trigger1 = Time = 0
value    = 153  ;131
ctrl     = 0

;------------------------------------------------------------------------------;
; ジャストディフェンス (空)
;------------------------------------------------------------------------------;
[Statedef 970]
type     = A
movetype = I
physics  = N
anim     = 970
ctrl     = 0
velset   = 0, 0

;-------[ Misc ]-------;

[State 950:         VarSet, Damage]
type     = VarSet
trigger1 = Time = 0
v        = 31
value    = GetHitVar(Damage)

[State 950:         VarSet, Life]
type     = VarSet
trigger1 = Time = 0
v        = 32
value    = ifelse(var(31) > 9, var(31), 9) * ifelse((var(54) = 3), 2, 1)

[State 950:         Life]
type     = LifeAdd
trigger1 = Time = 0
value    = Abs(var(32))
absolute = 1

[State 950:         Power]
type     = PowerAdd
trigger1 = Time = 0
value    = Ceil(var(32) * 5.0)

;-------[ Sounds ]-------;

[State 950:         SE, 1]
type     = PlaySnd
trigger1 = Time = 0
value    = 10, 6

;-------[ Movement ]-------;

[State 950:         Not Hit]
type     = NotHitBy
trigger1 = 1
value    = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time     = 1

[State 950:         Pause]
type     = Pause
trigger1 = Time = 0
time     = 3
movetime = 3

[State 950:         Hit Ctrl Time]
type     = VarSet
trigger1 = Time = 0
v        = 40
value    = GetHitVar(ctrltime) / 2

;-------[ Effects ]-------;

[State 950:         Just Defence Effect]
type          = Explod
trigger1      = Time = 0
anim          = 6100
postype       = p1
pos           = Floor(7 * const(size.xscale)), Floor(-85 * const(size.yscale))
scale         = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
sprpriority   = 10
ownpal        = 1
ontop         = 1
pausemovetime = 20
supermovetime = 20

;-------[ States ]-------;

[State 950:         ChangeState, Guarding]
type     = ChangeState
trigger1 = Time = 0
value    = 971
ctrl     = 0

;------------------------------------------------------------------------------;
; ジャストディフェンス (空) 落下
;------------------------------------------------------------------------------;
[Statedef 971]
type     = A
movetype = I
physics  = N
ctrl     = 0
velset   = -2.5, -4

;-------[ Movement ]-------;

[State 950:         Not Hit]
type     = NotHitBy
trigger1 = 1
value    = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time     = 1

;-------[ State ]-------;

[State 971:         Guarding]
type     = ChangeState
trigger1 = Time = 0
value    = 155  ;132
ctrl     = 0

;==============================================================================;
; Last Revision : $Rev$
; Last Modified : $Date$
;==============================================================================;
