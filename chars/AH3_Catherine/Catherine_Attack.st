;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
; 通常攻撃ステート
;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / A
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 200]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 200
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[演出]

[State a]
type     = Velset
trigger1 = Animelem = 2
X        = 2
IgnoreHitPause = 1

[State 200, 効果音]
type     = PlaySnd
trigger1 = Animelem = 2
value    = s80, 8
IgnoreHitPause = 1

[State 200, 衝撃波エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(3) = 0
StateNo  = 10200
ID       = 10200
Name     = "Shock-Effect"
Pos      = 55, 0
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1
Persistent     = 0

[State 200, 煙エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(3) = 2
StateNo  = 10105
ID       = 106
Name     = "Smoke-Effect"
Pos      = 40, -15
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1
Persistent     = 0

[State 200, 煙エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(3) = 3
StateNo  = 10105
ID       = 105
Name     = "Smoke-Effect"
Pos      = 75, -15
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1
Persistent     = 0

[State 200, 画面振動]
type     = EnvShake
trigger1 = AnimElem = 2
time     = 13
ampl     = 4
IgnoreHitPause = 1

;-------------------------------------------------[ヒット定義]
[State 200, HitDef]
type                = HitDef
trigger1            = AnimElem = 2
attr                = S, NA
hitflag             = MAFD
guardflag           = LA
damage              = Floor(42*Fvar(0)),0
getpower = 30,15
animtype            = Mid
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 1
ground.slidetime    = 15
ground.hittime      = 15
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -6
guard.velocity      = -6
air.velocity        = -1.3, -2
airguard.velocity   = -1.3, -2.5
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
air.fall            = 1
fall.recovertime    = Ceil(25*FVar(3))+(floor(10*(1+1*var(7))))
yaccel              = 0.48
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 10, -25
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -70, -60)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * ifelse(fvar(2)=1, 0.91, 0.70)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * ifelse(fvar(2)=1, 0.97, 0.93)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.04

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 42*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[カウンターヒット]

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit = 1
Trigger1 = P2MoveType = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0,-50
PosType  = P2
OwnPal   = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 200, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;━━━━━━━━━━━━━━━━
; [Helper] 地上A / 衝撃波
;━━━━━━━━━━━━━━━━

[statedef 10200]
MoveType = A
Physics  = N
Anim     = 10200
SprPriority = -1

[state 10200]
type     = AssertSpecial
trigger1 = 1
flag     = noshadow

;-------------------------------------------------[透過処理]

[State 10200, 変数]
Type     = VarSet
Trigger1 = !time
var(1)   = 0

[State 10200, 変数]
Type     = VarAdd
Trigger1 = Time >= 10
var(1)   = 30

[state 10200, 透過]
type     = Trans
trigger1 = 1
trans    = Addalpha
alpha    = 256-var(1), 256

;-------------------------------------------------[各種設定]

[State 10200, 変数]
Type     = VarSet
Trigger1 = !time
fvar(2)   = 0

[State 10200, 変数]
Type     = VarAdd
Trigger1 = Time
fvar(2)  = 0.08

[State 10200, 変数]
Type     = VarAdd
Trigger1 = fvar(3) < 0.15
fvar(3)  = 0.02

[state 10200, 設定反映]
type     = AngleDraw
trigger1 = 1
Scale	 = 0.2+fvar(2), 0.1+fvar(3)

;-------------------------------------------------[終了]

[State 10200, ヘルパー消滅]
type     = DestroySelf
Trigger1 = AnimTime = 0
Trigger2 = var(1) >= 256
Trigger3 = Root,Movetype = H




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / B
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 210]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 210
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[演出]

[State 210, 効果音]
type     = PlaySnd
trigger1 = Animelem = 3
value    = s80, 10

[state 210, 速度]
type     = Velset
trigger1 = !time
X        = 4

[State 200, 画面振動]
type     = EnvShake
trigger1 = AnimElem = 3
time     = 13
ampl     = 4

;-------------------------------------------------[ヒット定義]

[State 210, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = S, NA
hitflag             = MAFD
guardflag           = MA
damage              = Floor(92*Fvar(0)), 0
getpower = 30,15
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 3
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -6
guard.velocity      = -6
air.velocity        = -4, -3.5
airguard.velocity   = -4, -3.5
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(10*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -6
Air.CornerPush.VelOff      = -6
Down.CornerPush.VelOff     = -6
Guard.CornerPush.VelOff    = -6

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 10210
ID       = 7000
Pos      = 10, -50
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.83)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.96)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.08

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 92*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[カウンターヒット]

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit = 1
Trigger1 = P2MoveType = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0,-50
PosType  = P2
OwnPal   = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 210, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━
;[helper] 専用ヒットエフェクト / B
;━━━━━━━━━━━━━━━━
[statedef 10210]
Physics     = N
Anim        = 7005
SprPriority = 6

[State 10210, 透過]
Type     = Trans
Trigger1 = 1
Trans    = Add

[State 10210]
Type     = VarRandom
Trigger1 = Time = 0
V        = 0
Range    = 0,359

[State 10210]
Type     = AngleSet
Trigger1 = 1
Value    = Var(0)

[State 10210]
Type     = AngleDraw
Trigger1 = 1
Scale    = 0.7+(time*0.02) ,0.7+(time*0.02)

[State 10210]
Type     = AssertSpecial
Trigger1 = 1
Flag     = NoShadow

[State 10210, サークル]
type       = Explod
trigger1   = time = 0
anim       = 7021
ID         = 1
postype    = P1
pos        = 0, 0
random     = 0, 0
scale      = 0.5, 0.5
vel        = 0, 0
sprpriority    = 8
bindtime       = -1
removeongethit = 1
removetime  = 15

[State a];エフェクト管理
type     = ModifyExplod
trigger1 = Numexplod(1) = 1
ID       = 1
Trans    = Addalpha
alpha    = 256-var(2), 256
Scale    = 0.5, 1.1 + fvar(0)

[State 7001, 透過]
type     = Varadd
Trigger1 = Time < 6
fvar(0)  = 0.05

[State 7001, 透過]
type     = Varadd
Trigger1 = 1
var(2)   = 17

[State 10210, 波紋]
type       = Explod
trigger1   = time = 0
anim       = 10210
ID         = 2
postype    = P1
pos        = 0, 0
random     = 0, 0
scale      = 1, 1
vel        = 0, 0
sprpriority    = 9
bindtime       = -1
removeongethit = 1
removetime  = 16

;--------------------------------[終了]

[State 10210]
Type     = DestroySelf
Trigger1 = animTime =0






;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / C
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 220]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 220
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[演出]

[State 220, 効果音]
type     = PlaySnd
trigger1 = Animelem = 4
value    = s80, 15

[state 220, 速度]
type     = Velset
trigger1 = !time
X        = 3

;-------------------------------------------------[ヒット定義]

[State 220, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(117*Fvar(0)), 4
getpower = 30,15
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(22*(1+0.5*var(7))), floor(21*(1+1*var(7)))
Guard.PauseTime 	= floor(20*(1+0.5*var(7))), floor(19*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s80, 5
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 27
guard.hittime       = 27
guard.ctrltime      = 29
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -9, -6
guard.velocity      = -9
air.velocity        = -9, -6
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(22*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -6
Air.CornerPush.VelOff      = -6
Down.CornerPush.VelOff     = -6
Guard.CornerPush.VelOff    = -6


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 10, -50
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.70)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.93)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.10

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 117*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[カウンターヒット]

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit = 1
Trigger1 = P2MoveType = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0,-50
PosType  = P2
OwnPal   = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 220, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 4C - 開始
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 230]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 230
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[演出]

[State 230, 効果音]
type     = PlaySnd
trigger1 = Animelem = 4
value    = s80, 3

[state 230, 速度]
type     = Velset
trigger1 = Animelem = 4, >= 0
X        = 0.5

;-------------------------------------------------[連続ヒット制御]

[State a, リセット]
Type     = Varset
Trigger1 = !Time
var(2)   = 0

[State a, リセット]
Type     = Varset
Trigger1 = !Time
var(3)   = 0

[State a, ヒット数]
Type     = VarAdd
Trigger1 = MoveContact = 1
var(2)   = 1
Persistent = 1    ;pausetime
IgnoreHitPause = 1

[State a, ヒット間隔]
Type     = VarSet
Trigger1 = MoveContact = 1
var(3)   = 3

[State a, ヒット間隔-減少]
Type     = VarAdd
Trigger1 = 1
var(3)   = -1

[State a, ヒットリセット]
Type     = MoveHitReset
Trigger1 = var(3) <= 0   ;ヒット間隔フラグ

;-------------------------------------------------[ヒット定義]

[State 230, HitDef]
type                = HitDef
Trigger1            = AnimElem = 4, >= 0
Trigger1            = var(2) < 50
Trigger1            = var(3) <= 0
attr                = S, NA
hitflag             = MAFD
guardflag           = MA
damage              = Floor(21*Fvar(0)), 4
getpower = 30,15
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(1*(1+0.5*var(7))), floor(0*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 7
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -6
guard.velocity      = -6
air.velocity        = -4, -1
airguard.velocity   = -3, -3
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(1*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -4
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7025
ID       = 7000
Pos      = -10+(random%21), -40+(random%21)
PosType  = P2
OwnPal   = 1
size.xscale = 1.5
size.yscale = 1.5
IgnoreHitPause = 1
Persistent = 1

[State a]
Type     = Helper
Trigger1 = MoveGuarded = 1
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 1

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 1
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.95)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 1
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.97)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 1
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.04

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 1
IgnoreHitPause = 1
fvar(21)       = 21*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[カウンターヒット]

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit = 1
Trigger1 = P2MoveType = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0,-50
PosType  = P2
OwnPal   = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 1
IgnoreHitPause = 1
fvar(2)        = 1

[State 230, ステート変更]
type     = ChangeState
Trigger1 = Animelemtime(10) >= 0
Trigger1 = !(Command = "holdc")
Trigger2 = Animtime = 0
value    = 231


;━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 4C - 終了
;━━━━━━━━━━━━━━━━━━━━━━━━
[Statedef 231]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 231
sprpriority = 2

[State 231, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1





;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 6C
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 240]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 240
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[演出]

[State 240, 効果音]
type     = PlaySnd
trigger1 = Animelem = 4
value    = s80, 16

[state 240, 速度]
type     = Velset
trigger1 = !time
X        = 3

[state 240, 速度]
type     = Velset
trigger1 = !time
X        = 3

[state 240, 速度]
type     = Velset
trigger1 = Animelem = 4, =3
X        = 0

;-------------------------------------------------[弾幕展開]

[State 240, 弾幕] ;クナイ1
Type        = Helper
trigger1    = Animelemtime(4) = 0
name        = "Attack_6C"
ID          = 240
postype     = P1
pos         = 120, -108
Stateno     = 10240
size.xscale = 1
size.yscale = 1
ownpal      = 1
ignorehitpause = 1

;-------------------------------------------------[終了]

[State 240, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[HELPER] 4C / 鉄球
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[statedef 10240]
MoveType    = A
Physics     = N
Anim        = 10240
SprPriority = 1

[state a, AssertSpecial]
type     = AssertSpecial
trigger1 = 1
flag     = noshadow

[state 10240, 設定反映]
type     = AngleDraw
trigger1 = 1
Scale    = 0.5, 0.5

;-------------------------------------------------[速度設定-1]

[state 10240, velset]
type     = Velset
trigger1 = time > 0
X        = 18

;-------------------------------------------------[ヒット定義]

[State 10240, HitDef]
type                = HitDef
trigger1            = (MoveType = A) && (!MoveContact) && (!MoveReversed)
attr                = A, NP
hitflag             = MAFD
guardflag           = MA
damage              = Floor(117*root,Fvar(0)), 4
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 0, floor(21*(1+1*var(7)))
Guard.PauseTime 	= 0, floor(19*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s80, 5
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 27
guard.hittime       = 27
guard.ctrltime      = 29
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26
ground.velocity     = -9, -6
guard.velocity      = -9
air.velocity        = -9, -6
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*root,FVar(3))+(floor(21*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 10, -50
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = ParentVarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = root,FVar(1) * (0.70)

[State a, VarSet];連続ヒット補正
Type           = ParentVarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = root,FVar(1) * (0.93)

[State a, VarSet];復帰不能補正
Type           = parentVarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = root,FVar(3) - 0.10

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = ParentVarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 117*ifelse(MoveHit, 0.66, 0.275)*ifelse(root,var(15)=1, 1.1, 1)

;-------------------------------------------------[カウンターヒット]

[State a, 変数]
type     = Varset
trigger1 = P2Movetype = A
var(7)   = 1

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit = 1
Trigger1 = P2MoveType = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0,-50
PosType  = P2
OwnPal   = 1
IgnoreHitPause = 1
Persistent = 0

[State a, 変数]
type     = Varset
trigger1 = P2Movetype != A
var(7)   = 0

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = ParentVarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 10240, ガード消滅]
Type     = ChangeState
Trigger1 = MoveContact = 1
Value    = 10241

[State 10240, 終了]
type     = Destroyself
Trigger1 = Time >= 600
Trigger2 = FrontEdgeBodyDist <= -200
Trigger3 = Pos Y < -300


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[HELPER] 6C鉄球 / 接触後
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[statedef 10241]
MoveType    = I
Physics     = N
SprPriority = 6
Anim        = 10241

[State 10241, 完全無敵]
Type     = NotHitBy
Trigger1 = 1
Value    = SCA

[State 10241]
type	 = AssertSpecial
trigger1 = 1
flag	 = Noshadow

[State 10241, 角度]
type     = VarSet
Trigger1 = !time
var(5)   = 30

[State 10241, 角度]
type     = VarAdd
Trigger1 = time%2 = 0
var(5)   = 90

[state 10241, 設定反映]
type     = AngleDraw
trigger1 = time
value    = Var(5)
Scale    = 0.5, 0.5

;-------------------------------------------------[速度設定]

[State 10241]
type     = Velset
Trigger1 = !time
X        =  7 * Cos(50*Pi/180)
Y        = -7 * Sin(50*Pi/180)

[State 10240, 終了]
type     = Destroyself
Trigger1 = Time >= 600
Trigger2 = FrontEdgeBodyDist <= -90
Trigger3 = Pos Y < -300





;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 2A
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 400]
type     = C
movetype = A
physics  = C
ctrl     = 0
anim     = 400
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[演出]

[State 400, 効果音]
type     = PlaySnd
trigger1 = Animelem = 2
trigger2 = Animelem = 4
value    = s80, 23

[State a, MoveContactリセット]
Type     = MoveHitReset
Trigger1 = Animelemtime(3) = 3

;-------------------------------------------------[ヒット定義]

[State 400, HitDef]
type                = HitDef
trigger1            = AnimElem = 2
attr                = C, NA
hitflag             = MAFD
guardflag           = MA
damage              = Floor(8*Fvar(0)), 0
getpower = 15,7
animtype            = Light
ground.type         = High
priority            = 3, Hit
pausetime           = 5, 4
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 0
guardsound          = s1, 0
ground.slidetime    = 10
ground.hittime      = 10
guard.slidetime     = 11
guard.hittime       = 11
guard.ctrltime      = 13
air.guard.slidetime = 13
air.guard.hittime   = 13
air.guard.ctrltime  = 15
ground.velocity     = -4
guard.velocity      = -4
air.velocity        = -1.5, -8
airguard.velocity   = -1.5, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
air.fall            = 1
fall.recovertime    = Ceil(22*FVar(3))+5
yaccel              = 0.42
Ground.CornerPush.VelOff   = -4
Air.CornerPush.VelOff      = -4
Down.CornerPush.VelOff     = -4
Guard.CornerPush.VelOff    = -4


[State 400, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = C, NA
hitflag             = MAFD
guardflag           = MA
damage              = Floor(8*Fvar(0)), 0
getpower = 15,7
animtype            = Light
ground.type         = High
priority            = 3, Hit
pausetime           = 5, 4
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 0
guardsound          = s1, 0
ground.slidetime    = 10
ground.hittime      = 10
guard.slidetime     = 11
guard.hittime       = 11
guard.ctrltime      = 13
air.guard.slidetime = 13
air.guard.hittime   = 13
air.guard.ctrltime  = 15
ground.velocity     = -3
guard.velocity      = -4
air.velocity        = -1.5, -7
airguard.velocity   = -1.5, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
air.fall            = 1
fall.recovertime    = Ceil(22*FVar(3))+5
yaccel              = 0.42
Ground.CornerPush.VelOff   = -4
Air.CornerPush.VelOff      = -4
Down.CornerPush.VelOff     = -4
Guard.CornerPush.VelOff    = -4


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Trigger1 = (AnimElem = 2,>=0) && (AnimElem = 3,<0)
Name     = "hit"
Stateno  = 7001
ID       = 7000
Pos      = 65, -110
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Trigger1 = (AnimElem = 4,>=0) && (AnimElem = 5,<0)
Name     = "hit"
Stateno  = 7001
ID       = 7000
Pos      = 65, -110
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded = 1
Name     = "Guard"
Trigger1 = (AnimElem = 2,>=0) && (AnimElem = 3,<0)
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded = 1
Name     = "Guard"
Trigger1 = (AnimElem = 4,>=0) && (AnimElem = 5,<0)
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit
Trigger1       = (AnimElem = 2,>=0) && (AnimElem = 3,<0)
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * 0.95

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit
Trigger1       = (AnimElem = 4,>=0) && (AnimElem = 5,<0)
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * 0.95

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Trigger1       = (AnimElem = 2,>=0) && (AnimElem = 3,<0)
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.02

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Trigger1       = (AnimElem = 4,>=0) && (AnimElem = 5,<0)
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.02

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Trigger1       = (AnimElem = 2,>=0) && (AnimElem = 3,<0)
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 8*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Trigger1       = (AnimElem = 4,>=0) && (AnimElem = 5,<0)
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 8*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 400, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 2B
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 410]
type     = C
movetype = A
physics  = C
ctrl     = 0
anim     = 410
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[演出]

[State a]
type     = Velset
trigger1 = Animelem = 4
X        = 3

[State 410, 画面振動]
type     = EnvShake
trigger1 = AnimElem = 5
time     = 13
ampl     = 4

[State 410, 効果音]
type     = PlaySnd
trigger1 = Animelem = 5
value    = s80, 25

[state 220, エフェクト]
type     = Explod
trigger1 = AnimelemTime(5) = 0
anim     = 10400
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10400
bindtime = 1
sprpriority    = 8
IgnoreHitPause = 0
removeongethit = 1

[State a]
type     = Velset
trigger1 = Animelem = 5
X        = 0

;-------------------------------------------------[ヒット定義]

[State 410, HitDef]
type                = HitDef
trigger1            = AnimElem = 5
attr                = C, NA
hitflag             = MAFD
guardflag           = LA
damage              = Floor(83*Fvar(0)), 0
getpower = 30,15
animtype            = Light
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 3
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26
ground.velocity     = -3, -7.4
guard.velocity      = -4
air.velocity        = -3, -7.4
airguard.velocity   = -2, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(10*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 10, -50
PosType  = P2
OwnPal   = 1
size.xscale = 1.5
size.yscale = 1.5
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.83)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.95)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.08

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 83*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 410, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 2C
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 420]
type     = C
movetype = A
physics  = C
ctrl     = 0
anim     = 420
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[演出]

[State 420, 効果音]
type     = PlaySnd
trigger1 = Animelem = 4
value    = s80, 15

[state 420, 速度]
type     = Velset
trigger1 = !time
X        = 3

[state 420, 速度]
type     = Velset
trigger1 = Animelem = 4
X        = 0

;-------------------------------------------------[ヒット定義]

[State 420, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(117*Fvar(0)), 4
getpower = 30,15
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(22*(1+0.5*var(7))), floor(21*(1+1*var(7)))
Guard.PauseTime 	= floor(20*(1+0.5*var(7))), floor(19*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s80, 5
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 27
guard.hittime       = 27
guard.ctrltime      = 29
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -9, -6
guard.velocity      = -9
air.velocity        = -9, -6
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(22*(1+1*var(7))))
yaccel              = 0.4
Ground.CornerPush.VelOff   = -6
Air.CornerPush.VelOff      = -6
Down.CornerPush.VelOff     = -6
Guard.CornerPush.VelOff    = -6

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 10, -50
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.70)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.93)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.10

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 117*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[カウンターヒット]

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit = 1
Trigger1 = P2MoveType = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0,-50
PosType  = P2
OwnPal   = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 420, ステート変更];ヒットした場合
type     = ChangeState
trigger1 = Movecontact = 1
value    = 421
ctrl     = 0

[State 420, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 2C - ヒット硬直
;━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 421]
type     = C
movetype = A
physics  = C
ctrl     = 0
anim     = 421
sprpriority = 2

[State 420, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 1C - 開始
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 430]
type     = C
movetype = A
physics  = C
ctrl     = 0
anim     = 430
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[演出]

[State 430, 効果音]
type     = PlaySnd
trigger1 = Animelem = 4
value    = s80, 3

[state 430, 速度]
type     = Velset
trigger1 = Animelem = 4, >= 0
X        = 0.5

;-------------------------------------------------[連続ヒット制御]

[State a, リセット]
Type     = Varset
Trigger1 = !Time
var(2)   = 0

[State a, リセット]
Type     = Varset
Trigger1 = !Time
var(3)   = 0

[State a, ヒット数]
Type     = VarAdd
Trigger1 = MoveContact = 1
var(2)   = 1
Persistent = 1    ;pausetime
IgnoreHitPause = 1

[State a, ヒット間隔]
Type     = VarSet
Trigger1 = MoveContact = 1
var(3)   = 3

[State a, ヒット間隔-減少]
Type     = VarAdd
Trigger1 = 1
var(3)   = -1

[State a, ヒットリセット]
Type     = MoveHitReset
Trigger1 = var(3) <= 0   ;ヒット間隔フラグ

;-------------------------------------------------[ヒット定義]

[State 430, HitDef]
type                = HitDef
Trigger1            = AnimElem = 4, >= 0
Trigger1            = var(2) < 50
Trigger1            = var(3) <= 0
attr                = S, NA
hitflag             = MAFD
guardflag           = MA
damage              = Floor(21*Fvar(0)), 4
getpower = 30,15
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(1*(1+0.5*var(7))), floor(0*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 7
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -6
guard.velocity      = -6
air.velocity        = -4, -1
airguard.velocity   = -3, -3
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(1*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -4
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7025
ID       = 7000
Pos      = -10+(random%21), -40+(random%21)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 1

[State a]
Type     = Helper
Trigger1 = MoveGuarded = 1
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 1

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 1
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.95)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 1
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.97)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 1
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.04

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 1
IgnoreHitPause = 1
fvar(21)       = 21*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[カウンターヒット]

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit = 1
Trigger1 = P2MoveType = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0,-50
PosType  = P2
OwnPal   = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 1
IgnoreHitPause = 1
fvar(2)        = 1

[State 430, ステート変更]
type     = ChangeState
Trigger1 = Animelemtime(10) >= 0
Trigger1 = !(Command = "holdc")
Trigger2 = Animtime = 0
value    = 431


;━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 1C - 終了
;━━━━━━━━━━━━━━━━━━━━━━━━
[Statedef 431]
type     = C
movetype = A
physics  = C
ctrl     = 0
anim     = 431
sprpriority = 2

[State 431, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 3C
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 440]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 440
sprpriority = 2

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[演出]

[State 440, 効果音]
type     = PlaySnd
trigger1 = Animelem = 4
value    = s80, 16

[state 440, 速度]
type     = Velset
trigger1 = !time
X        = 3

[state 440, 速度]
type     = Velset
trigger1 = Animelem = 4, =3
X        = 0

;-------------------------------------------------[弾幕展開]

[State 440, 弾幕] ;クナイ1
Type        = Helper
trigger1    = Animelemtime(4) = 0
name        = "Attack_6C"
ID          = 240
postype     = P1
pos         = 120, -53
Stateno     = 10240
size.xscale = 1
size.yscale = 1
ownpal      = 1
ignorehitpause = 1

;-------------------------------------------------[終了]

[State 440, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1









;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 / JA
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 600]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 600
sprpriority = 2

;-------------------------------------------------[演出]

[State 600, 効果音]
type     = PlaySnd
trigger1 = Animelem = 1
value    = s2, 2

;-------------------------------------------------[ヒット定義]
[State 600, HitDef]
type                = HitDef
trigger1            = AnimElem = 2
attr                = A, NA
hitflag             = MAFD
guardflag           = HA
damage              = Floor(30*Fvar(0)),0
getpower = 30,15
animtype            = Mid
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 0
guardsound          = s1, 1
ground.slidetime    = 10
ground.hittime      = 10
guard.slidetime     = 11
guard.hittime       = 11
guard.ctrltime      = 13
air.guard.slidetime = 13
air.guard.hittime   = 13
air.guard.ctrltime  = 15

ground.velocity     = -4
guard.velocity      = -4
air.velocity        = -2.5, -6
airguard.velocity   = -2.5, -4.5
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
air.fall            = 1
fall.recovertime    = Ceil(22*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -4
Air.CornerPush.VelOff      = -4
Down.CornerPush.VelOff     = -4
Guard.CornerPush.VelOff    = -4

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 10, -50
PosType  = P2
OwnPal   = 1
size.xscale = 1.2
size.yscale = 1.2
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.95)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.98)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.02

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 30*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[カウンターヒット]

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit = 1
Trigger1 = P2MoveType = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0,-50
PosType  = P2
OwnPal   = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State a, CtrlSet];行動可能に
type     = CtrlSet
trigger1 = Animelem = 7
value    = 1

[State a, ChangeState];着地硬直
type     = ChangeState
trigger1 = Pos Y >= 0
value    = 52
ctrl     = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 / JB
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 610]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 610
sprpriority = 2

;-------------------------------------------------[演出]

[State 610, 効果音]
type     = PlaySnd
trigger1 = Animelem = 3
value    = s2, 2

;-------------------------------------------------[ヒット定義]
[State 610, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = A, NA
hitflag             = MAFD
guardflag           = HA
damage              = Floor(63*Fvar(0)),0
getpower = 30,15
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 22
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28

ground.velocity     = -5
guard.velocity      = -5
air.velocity        = -2, -2
airguard.velocity   = -2, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(10*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -4
Air.CornerPush.VelOff      = -4
Down.CornerPush.VelOff     = -4
Guard.CornerPush.VelOff    = -4

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7011
ID       = 610
Pos      = 10, -50
PosType  = P2
OwnPal   = 1
size.xscale = 1.2
size.yscale = 1.2
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[カウンターヒット]

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit = 1
Trigger1 = P2MoveType = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0,-50
PosType  = P2
OwnPal   = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.83)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.96)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.08

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 63*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State a, CtrlSet];行動可能に
type     = CtrlSet
trigger1 = Animelem = 10
value    = 1

[State a, ChangeState];着地硬直
type     = ChangeState
trigger1 = Pos Y >= 0
value    = 52
ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 / JC
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 620]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 620
sprpriority = 2

;-------------------------------------------------[演出]

[State 620, 効果音]
type     = PlaySnd
trigger1 = Animelem = 3
value    = s2, 4

;-------------------------------------------------[ヒット定義]
[State 620, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = A, NA
hitflag             = MAFD
guardflag           = HA
damage              = Floor(125*Fvar(0)),0
getpower = 30,15
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 22
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28

ground.velocity     = -6
guard.velocity      = -6
air.velocity        = -2, 10
airguard.velocity   = -2, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
air.fall            = 1
fall.recovertime    = Ceil(56*FVar(3))+(floor(10*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -4
Air.CornerPush.VelOff      = -4
Down.CornerPush.VelOff     = -4
Guard.CornerPush.VelOff    = -4

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7011
ID       = 620
Pos      = 10, -50
PosType  = P2
OwnPal   = 1
size.xscale = 1.2
size.yscale = 1.2
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[カウンターヒット]

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit = 1
Trigger1 = P2MoveType = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0,-50
PosType  = P2
OwnPal   = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.70)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.93)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.10

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 125*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[相手制御]

[State a, 床バウンド]
type           = TargetState
TriggerAll     = NumTarget > 0
trigger1       = Enemynear,Statetype = A
trigger1       =(MoveHit=1) && target,ishelper = 0
value          = 8060
persistent     = 0
ignorehitpause = 1

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State a, CtrlSet];行動可能に
type     = CtrlSet
trigger1 = Animelem = 10
value    = 1

[State a, ChangeState];着地硬直
type     = ChangeState
trigger1 = Pos Y >= 0
value    = 52
ctrl     = 0






;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / E攻撃 (準備)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 300]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 300
poweradd = 0

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

[State a]
type     = VelMul
Trigger1 = 1
X        = 0.85

;-------------------------------------------------[演出]

[State 300, 効果音] ;ホールド音
type     = null;PlaySnd
trigger1 = Time = 25
value    = s0, 17

;-------------------------------------------------[ステート変更]

[State 300] ;通常
type       = ChangeState
triggerAll = time >= 17
trigger1   = command != "holdx"
value      = 301

[State 300] ;最大タメ
type       = ChangeState
triggerAll = time >= 17
trigger1   = Animtime = 0
value 	   = 302


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / E攻撃 (通常)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 301]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 301
sprpriority = 2

;-------------------------------------------------[演出]

[State 301, 効果音]
type     = PlaySnd
trigger1 = Animelem = 2
value    = s80, 26

[state 301, 速度]
type     = Velset
trigger1 = !time
X        = 4.5

[State 301, 煙エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(3) = 1
StateNo  = 10300
ID       = 10300
Name     = "Smoke-Effect"
Pos      = 7, -112
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1
Persistent     = 0

[state 301, エフェクト]
type     = Explod
trigger1 = Animelem = 2
anim     = 10300
pos      = 0, 0
Scale    = (const(size.xscale))*1.25,(const(size.xscale))*1.5
id       = 10300
bindtime = -1
IgnoreHitPause = 1
sprpriority    = 7
removeongethit = 1

[state 301, エフェクト]
type     = Explod
trigger1 = Animelem = 3
anim     = 10305
pos      = 0, 0
Scale    = const(size.xscale), const(size.yscale)
id       = 10305
bindtime = -1
IgnoreHitPause = 1
sprpriority    = 8
removeongethit = 1

;-------------------------------------------------[ヒット定義]

[State 301, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = S, NA
hitflag             = MAF
guardflag           = M
damage              = Floor(133*Fvar(0)),0
getpower = 15,7
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 6
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 22
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28

ground.velocity     = -9.5
guard.velocity      = -8
air.velocity        = -9.5
airguard.velocity   = -2, -4
fall                = 1
air.fall            = 1
ID = 8010
fall.recovertime    = Ceil(26*FVar(3))+(floor(10*(1+1*var(7))))
Palfx.Time        = 120
Palfx.Mul         = 200,200,200
Palfx.Add         = 100,-120,-120
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7020
ID       = 7000
Pos      = 10+ceil(p2dist x-enemynear,const(size.ground.front)), -105
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25,IfElse(EnemyNear,StateType = A, -70, -60)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.70)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.93)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.10

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 113*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[カウンターヒット]

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit = 1
Trigger1 = P2MoveType = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0,-50
PosType  = P2
OwnPal   = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[相手制御]

[state a, ステート奪取]
type     =  Targetstate
Trigger1 =  MoveHit
Trigger1 = (NumTarget>0)&&(target,IsHelper=0)
Trigger1 =  enemy,stateno != 8010
Trigger1 =  P2statetype != L
value    =  8010
IgnoreHitPause = 1
Persistent     = 0

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 301, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / E攻撃 (最大タメ)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 302]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 302
sprpriority = 2

;-------------------------------------------------[演出]

[State 302, 効果音]
type     = PlaySnd
trigger1 = Animelem = 2
value    = s80, 26

[state 302, 速度]
type     = Velset
trigger1 = !time
X        = 4.5

[State 301, 煙エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(3) = 1
StateNo  = 10300
ID       = 10300
Name     = "Smoke-Effect"
Pos      = 7, -112
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1
Persistent     = 0

[state 302, エフェクト]
type     = Explod
trigger1 = Animelem = 2
anim     = 10301
pos      = 0, 0
Scale    = (const(size.xscale)*1.5),(const(size.xscale)*1.75)
id       = 10300
bindtime = -1
IgnoreHitPause = 1
sprpriority    = 7
removeongethit = 1

[state 302, エフェクト]
type     = Explod
trigger1 = Animelem = 3
anim     = 10306
pos      = 0, 0
Scale    = const(size.xscale), const(size.yscale)*1.5
id       = 10306
bindtime = -1
IgnoreHitPause = 1
sprpriority    = 8
removeongethit = 1

;-------------------------------------------------[ヒット定義]
[State 302, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = S, NA
hitflag             = MAF
guardflag           = M
damage              = Floor(158*Fvar(0)),0
getpower = 15,7
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(20*(1+0.5*var(7))), floor(19*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 6
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 24
guard.hittime       = 24
guard.ctrltime      = 26
air.guard.slidetime = 29
air.guard.hittime   = 29
air.guard.ctrltime  = 31

ground.velocity     = -9.5
guard.velocity      = -8
air.velocity        = -9.5
airguard.velocity   = -2, -4
fall                = 1
air.fall            = 1
ID = 8010
fall.recovertime    = Ceil(26*FVar(3))+(floor(20*(1+1*var(7))))
Palfx.Time        = 120
Palfx.Mul         = 200,200,200
Palfx.Add         = 100,-120,-120
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7020
ID       = 300
Pos      = 10+ceil(p2dist x-enemynear,const(size.ground.front)), -105
PosType  = P1
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7110
ID       = 7100
Pos      = 25, -50
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.83)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.98)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.08

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 158*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[カウンターヒット]

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit = 1
Trigger1 = P2MoveType = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0,-50
PosType  = P2
OwnPal   = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[相手制御]

[state a, ステート奪取]
type     = targetstate
trigger1 =  MoveHit
trigger1 = (NumTarget>0)&&(target,IsHelper=0)
trigger1 =  enemy,stateno != 8010
trigger1 =  P2statetype != L
value    =  8010
IgnoreHitPause = 1
Persistent     = 0

[state a, ステート奪取]
type     = targetstate
trigger1 =  MoveGuarded
trigger1 = (NumTarget>0)&&(target,IsHelper=0)
trigger1 =  enemy,stateno != 8020
trigger1 =  P2statetype != L
value    =  8020
IgnoreHitPause = 1
Persistent     = 0

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 302, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 2E攻撃 (準備)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 310]
type     = C
movetype = A
physics  = C
ctrl     = 0
anim     = 310
poweradd = 0

[State a]
type     = Posset
trigger1 = !time
Y        = 0

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[空中判定]

[State 310]
type      = StateTypeSet
Trigger1  = Time = 2
Statetype = A
Physics   = N

[State 310, 速度]
type     = VelSet
Trigger1 = !time
X =  5
Y = -2

[State 310, 速度]
type     = VelAdd
Trigger1 = AnimelemTime(3) >= 0
Y = 0.1

;-------------------------------------------------[演出]

[State 310, 効果音] ;ホールド音
type     = null;PlaySnd
trigger1 = Time = 25
value    = s0, 17

[State 310, 無敵]
type     = NotHitBy
Trigger1 = 1
value    = ,AT

[State 310, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4020
ID       = 4020
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 9
RemoveOnGetHit = 1
removetime = 4

[State 310, バーニア表示]
type     = Explod
Trigger1 = Animelemtime(2) = 0
anim     = 4022
ID       = 4020
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = 37-4

[State 310, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4021
ID       = 4021
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = 37

;-------------------------------------------------[ステート変更]

[State 310] ;通常
type       = ChangeState
triggerAll = time >= 10
Trigger1   = !Var(10)
trigger1   = command != "holdx"
value      = 311

[State 310] ;最大タメ
type       = ChangeState
triggerAll = time >= 10
trigger1   = Animtime = 0
value 	   = 312


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 2E攻撃 (通常)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 311]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 311
sprpriority = 2

[State a]
type     = RemoveExplod
Trigger1 = !time
Id       = 4020

[State a]
type     = RemoveExplod
Trigger1 = !time
Id       = 4021

;-------------------------------------------------[速度設定]

[State 311]
type     = VelAdd
Trigger1 = Animelemtime(2) < 0
Y        = 0.45

[State 311, 座標固定]
type     = PosSet
Trigger1 = Pos Y < 0
Y = 0

;-------------------------------------------------[速度設定-2]

[state 311, 速度]
type     = Velset
trigger1 = animelem = 2
X        = 0
Y        = 0

[State 311, 座標固定]
type     = PosSet
Trigger1 = Animelem = 2
Y = 0

[State 312, 座標固定]
type     = VelSet
Trigger1 = Pos Y < 0
Y = 0

[State 311]
type      = StateTypeSet
Trigger1  = Animelem = 2
Statetype = C

;-------------------------------------------------[演出]

[State 311, 効果音]
type     = PlaySnd
trigger1 = Animelem = 2
value    = s80, 25

[State 312, 画面振動]
type     = EnvShake
trigger1 = AnimElem = 2
time     = 25
ampl     = 4
IgnoreHitPause = 1

[state 311, エフェクト(岩盤)]
type     = Explod
trigger1 = AnimelemTime(2) = 0
anim     = 10310
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10310
bindtime = -1
sprpriority    = -1
IgnoreHitPause = 0
removeongethit = 1

[state 311, エフェクト(岩盤)]
type     = Explod
trigger1 = AnimelemTime(2) = 0
anim     = 10311
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10310
bindtime = -1
sprpriority    = 9
IgnoreHitPause = 0
removeongethit = 1

[State 311, 衝撃波エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(2) = 3
StateNo  = 10315
ID       = 10315
Name     = "Shock-Effect"
Pos      = 25, -10
size.xscale = const(size.xscale)*2
size.yscale = const(size.Yscale)*2
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1
Persistent     = 0

;-------------------------------------------------[ヒット定義]

[State 311, HitDef]
type                = HitDef
trigger1            = AnimElem = 2
attr                = C, NA
hitflag             = MAF
guardflag           = M
damage              = Floor(133*Fvar(0)),0
getpower = 15,7
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 6
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 22
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28

ground.velocity     = -0.5, -12
guard.velocity      = -6
air.velocity        = -0.5, -12
airguard.velocity   = -5, -3
Down.velocity 	    = -5, -2
yaccel              = 0.24
fall                = 1
air.fall            = 1
ID                  = 8030
fall.recovertime    = Ceil(66*FVar(3))+(floor(9*(1+1*var(7))))
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7011
ID       = 310
Pos      = 20, -50
PosType  = P2
OwnPal   = 1
size.xscale = 1.3
size.yscale = 1.3
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 0, IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.83)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.98)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.08

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 133*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[カウンターヒット]

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit = 1
Trigger1 = P2MoveType = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0,-50
PosType  = P2
OwnPal   = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[相手制御]

[state a, ステート奪取]
type     = targetstate
trigger1 =  MoveHit
trigger1 = (NumTarget>0)&&(target,IsHelper=0)
trigger1 =  enemy,stateno != 8030
trigger1 =  P2statetype != L && !var(9)
value    =  8030
IgnoreHitPause = 1
Persistent     = 0

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 311, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 2E攻撃 (ホールド)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 312]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 312
sprpriority = 2

[State a]
type     = RemoveExplod
Trigger1 = !time
Id       = 4020

[State a]
type     = RemoveExplod
Trigger1 = !time
Id       = 4021

;-------------------------------------------------[速度設定]

[State 312]
type     = VelAdd
Trigger1 = Animelemtime(2) < 0
Y        = 0.5

[State 312, 座標固定]
type     = PosSet
Trigger1 = Pos Y < 0
Y = 0

[State 312, 座標固定]
type     = VelSet
Trigger1 = Pos Y < 0
Y = 0

[State 312, 画面振動]
type     = EnvShake
trigger1 = AnimElem = 2
time     = 25
ampl     = 4
IgnoreHitPause = 1

;-------------------------------------------------[速度設定-2]

[state 312, 速度]
type     = Velset
trigger1 = animelem = 2
X        = 0
Y        = 0

[State 312, 座標固定]
type     = PosSet
Trigger1 = Animelem = 2
Y = 0

[State 312]
type      = StateTypeSet
Trigger1  = Animelem = 2
Statetype = C

;-------------------------------------------------[演出]

[State 312, 効果音]
type     = PlaySnd
trigger1 = Animelem = 2
value    = s80, 25

[state 312, エフェクト(岩盤)]
type     = Explod
trigger1 = AnimelemTime(2) = 0
anim     = 10310
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10310
bindtime = -1
sprpriority    = -1
IgnoreHitPause = 0
removeongethit = 1

[state 312, エフェクト(岩盤)]
type     = Explod
trigger1 = AnimelemTime(2) = 0
anim     = 10311
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 10310
bindtime = -1
sprpriority    = -1
IgnoreHitPause = 0
removeongethit = 1

[State 312, 衝撃波エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(2) = 3
StateNo  = 10315
ID       = 10315
Name     = "Shock-Effect"
size.xscale = const(size.xscale)*2
size.yscale = const(size.Yscale)*2
Pos      = 25, -10
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1
Persistent     = 0

;-------------------------------------------------[ヒット定義]

[State 312, HitDef]
type                = HitDef
trigger1            = AnimElem = 2
attr                = C, NA
hitflag             = MAF
guardflag           = M
damage              = Floor(158*Fvar(0)),0
getpower = 15,7
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 6
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 24
guard.hittime       = 24
guard.ctrltime      = 26
air.guard.slidetime = 29
air.guard.hittime   = 29
air.guard.ctrltime  = 31

ground.velocity     = -0.5, -14.5
guard.velocity      = -6
air.velocity        = -0.5, -14.5
airguard.velocity   = -5, -3
Down.velocity 	    = -5, -2
yaccel              = 0.24
fall                = 1
air.fall            = 1
ID                  = 8030
fall.recovertime    = Ceil((66+15)*FVar(3))+(floor(9*(1+1*var(7))))
Ground.CornerPush.VelOff   = -5
Air.CornerPush.VelOff      = -5
Down.CornerPush.VelOff     = -5
Guard.CornerPush.VelOff    = -5

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7011
ID       = 310
Pos      = 20, -50
PosType  = P2
OwnPal   = 1
size.xscale = 1.3
size.yscale = 1.3
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7110
ID       = 7100
Pos      = 0, IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.83)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.98)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.08

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 133*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[カウンターヒット]

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit = 1
Trigger1 = P2MoveType = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0,-50
PosType  = P2
OwnPal   = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[相手制御]

[state a, ステート奪取]
type     = targetstate
trigger1 =  MoveHit
trigger1 = (NumTarget>0)&&(target,IsHelper=0)
trigger1 =  enemy,stateno != 8030
trigger1 =  P2statetype != L && !var(9)
value    =  8030
IgnoreHitPause = 1
Persistent     = 0

[state a, ステート奪取]
type     = targetstate
trigger1 =  MoveGuarded
trigger1 = (NumTarget>0)&&(target,IsHelper=0)
trigger1 =  enemy,stateno != 8035
trigger1 =  P2statetype != L
value    =  8035
IgnoreHitPause = 1
Persistent     = 0

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 312, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1



;━━━━━━━━━━━━━━━━
; [Helper] 地上A / 衝撃波
;━━━━━━━━━━━━━━━━

[statedef 10315]
MoveType = A
Physics  = N
Anim     = 10315
SprPriority = 3

[state 10315]
type     = AssertSpecial
trigger1 = 1
flag     = noshadow

;-------------------------------------------------[透過処理]

[State 10315, 変数]
Type     = VarSet
Trigger1 = !time
var(1)   = 0

[State 10315, 変数]
Type     = VarAdd
Trigger1 = Time >= 15
var(1)   = 13

[state 10315, 透過]
type     = Trans
trigger1 = 1
trans    = Addalpha
alpha    = 256-var(1), 256

;-------------------------------------------------[各種設定]

[State 10315, 変数]
Type     = VarSet
Trigger1 = !time
fvar(2)   = 0

[State 10315, 変数]
Type     = VarAdd
Trigger1 = Time < 20
fvar(2)  = 0.0375

[State 10315, 変数]
Type     = VarAdd
Trigger1 = time >= 20
fvar(2)  = -0.0375

[state 10315, 設定反映]
type     = AngleDraw
trigger1 = 1
Scale	 = 0.5, 0.25 + fvar(2)

;-------------------------------------------------[終了]

[State 10315, ヘルパー消滅]
type     = DestroySelf
Trigger1 = AnimTime = 0
Trigger2 = var(1) >= 256
Trigger3 = Root,Movetype = H
Trigger4 = Root,StateNo != [311, 312]






;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 / JE
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 320]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 320
sprpriority = 2

;-------------------------------------------------[演出]

[State 320, 速度]
type     = Velset
trigger1 = !time
X        = 0
y        = 0

[State 320]
type     = velset
trigger1 = Animelem = 3
X        = -3
Y        = -5

[State 320, 速度]
type     = VelAdd
trigger1 = Animelemtime(3) >= 0
y        = 0.47

;-------------------------------------------------[演出]

[State 320, 効果音]
type     = PlaySnd
trigger1 = AnimElem = 2
value    = s80, 26

[state 320, エフェクト]
type     = Explod
trigger1 = AnimElemTime(2) = 0
anim     = 10320
pos      = -6, -43
Scale    = const(size.xscale),const(size.yscale)
id       = 10320
bindtime = -1
ownpal   = 1
sprpriority    = 8
removeongethit = 1

[state 320, エフェクト]
type     = Explod
trigger1 = AnimElemTime(2) = 0
anim     = 10320
pos      = 65, -50
Scale    = const(size.xscale),const(size.yscale)
id       = 10320
bindtime = -1
ownpal   = 1
sprpriority    = 8
removeongethit = 1

;-------------------------------------------------[ヒット定義]

[State 320, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = A, NP
hitflag             = MAF
guardflag           = HA
damage              = Floor(100*Fvar(1)), 0
getpower = 30,15
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 6
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 22
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28

ground.velocity     = -6.5, 12
guard.velocity      = -6
air.velocity        = -6.5, 11
airguard.velocity   = -2, -4
fall                = 1
air.fall            = 1
fall.recover        = 1
fall.recovertime    = Ceil(FVar(3)*56)+(floor(10*(1+1*var(7))))
yaccel              = 0.42
Palfx.Time        = 120
Palfx.Mul         = 200,200,200
Palfx.Add         = 100,-120,-120
p2facing            = 1

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7010
ID       = 620
Pos      = 10, -50
PosType  = P2
OwnPal   = 1
size.xscale = 1.3
size.yscale = 1.3
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 25, IfElse(EnemyNear,StateType = A, -50, -40)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[カウンターヒット]

[State a, エフェクト]
Type     = Helper
Trigger1 = NumEnemy > 0
Trigger1 = Var(7) = 1
Trigger1 = MoveHit = 1
Trigger1 = P2MoveType = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0,-50
PosType  = P2
OwnPal   = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.83)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.95)

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = ((MoveHit = 1)&&(MoveHit))
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.08

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 100*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[相手制御]

[State a, 床バウンド]
type           = TargetState
TriggerAll     = NumTarget > 0
trigger1       =(MoveHit=1) && target,ishelper = 0
value          = 8060
persistent     = 0
ignorehitpause = 1

;-------------------------------------------------[攻撃状態終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State a, CtrlSet];行動可能に
type     = CtrlSet
trigger1 = Animelem = 8
value    = 1

[State a, ChangeState];着地硬直
type     = ChangeState
trigger1 = Animelemtime(8) < 0
trigger1 = Pos Y >= 0
value    = 321
ctrl     = 0

[State a, ステート変更]
type     = ChangeState
trigger1 = Animelemtime(8) >= 0
trigger1 = Pos Y >= 0
value    = 52
ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; JE / 着地硬直
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[StateDef 321]
Type     = S
Movetype = I
Physics  = S
velset   = 0, 0
Anim     = 321
ctrl     = 0

[State 321, 振り向き]
type     = Turn
trigger1 = Animtime = 0
trigger1 = P2dist X < 0

[State 321, 接地]
type     = PosSet
trigger1 = Time = 0
Y        = 0

[State 321, 効果音]
type     = PlaySnd
trigger1 = Time = 0
value    = s80, 9

[State 321, 画面振動]
type     = EnvShake
trigger1 = AnimElem = 2
time     = 10
ampl     = 4

[State 321, 煙エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(2) = 1
StateNo  = 10105
ID       = 106
Name     = "Smoke-Effect"
Pos      = -35, -40
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1
Persistent     = 0

[State 321, 煙エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(2) = 1
StateNo  = 10105
ID       = 105
Name     = "Smoke-Effect"
Pos      = 55, -40
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1
Persistent     = 0

[State 321, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1






;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / ニュートラル投げ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 800]
type     = S
movetype = A
physics  = S
anim     = 800
velset   = 0,0
ctrl     = 0
sprpriority = 2

[State a]
type     = Posset
Trigger1 = !Time
Y        = 0

;-------------------------------------------------[演出]

[State 800]
Type     = AttackDist
Trigger1 = 1
value    = 0

[State 800]
type     = PlaySnd
Trigger1 = !time
value    = s2, 0

;-------------------------------------------------[攻撃判定]

[State 800, HitDef]
type          = HitDef
Trigger1      = AnimElem = 2
Trigger1      = P2StateNo != [150, 153]
attr          = S, NT
damage        = 0
getpower = 20,10
hitflag       = M-
priority      = 3, miss
pausetime     = 9, 8
sparkno       = -1
sparkxy       = 0, 0
hitsound      = -1
guard.sparkno = -1
guardsound    = -1
P1facing      = 1
P2facing      = 1
Fall          = 0
Kill          = 0
P2stateno     = 810
ID = 800


[state 800, エフェクト]
type     = Explod
trigger1 = Movehit
anim     = 7050
postype  = P1
pos      = 80, -50
Scale    = 1, 1
id       = 7000
ownpal   = 1
Persistent     = 0
sprpriority    = 5
removeongethit = 1
IgnoreHitPause = 1

;-------------------------------------------------[終了]

[State 800, ステート変更] ;成功
Type     = ChangeState
Trigger1 = MoveHit
value    = 801

[State 800, ステート変更] ;失敗
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ニュートラル投げ / 投げ抜け 受付
;━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 801]
type     = S
movetype = A
physics  = S
velset   = 0,0
anim     = 801
sprpriority = 2

[State 801]
type     = Posset
trigger1 = !time
Y        = 0

[State 801]
type     = NotHitBy
trigger1 = 1
value    = SCA

[State 801, 投げ抜けされた]
type     = ChangeState
trigger1 = EnemyNear, StateNo = 807
value    = 802

[State 801, 投げステートへ]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 805


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ニュートラル投げ / 投げ抜けされた
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 802]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 802

[State a]
Type     = Helper
Trigger1 = !time
Name     = "Guard"
Stateno  = 7055
ID       = 7055
Pos      = 25, -50
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
Persistent     = 10
IgnoreHitPause = 1


[State 802]
type     = NotHitBy
trigger1 = 1
value    = SCA

[State 802]
type     = Velset
trigger1 = !time
X        = -5

[State 802]
type     = Velset
trigger1 = Animelem = 4
X        = 0

[State 802]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / ニュートラル投げ-成功
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 805]
type     = S
movetype = A
physics  = S
velset   = 0, 0
ctrl     = 0
anim     = 805

[State 805, NotHitBy]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP
IgnoreHitPause = 1

;-------------------------------------------------[演出-1]

[State 805, 状態変更]
type     = StatetypeSet
Trigger1 = Animelem = 5
Statetype= A
Physics  = N

[State 805, 速度]
type     = Velset
trigger1 = Animelem = 5
X        = -2
Y        = -3

[State 805, 速度]
type     = VelAdd
trigger1 = Animelem = 5, > 0
Trigger1 = Animelemtime(9) < 0
Y        = 0.3

[State 805, 効果音]
Type     = PlaySnd
Trigger1 = AnimElem = 5
value    = s80, 26
ignorehitpause = 1

[State 805, エフェクト]
type     = Explod
trigger1 = AnimelemTime(5) = 0
anim     = 10320
pos      = -6, -30
Scale    = const(size.xscale),const(size.yscale)
id       = 10800
bindtime = -1
ownpal   = 1
sprpriority    = 5
removeongethit = 1

[State 805, エフェクト]
type     = Explod
trigger1 = AnimelemTime(5) = 0
anim     = 10320
pos      = 65, -37
Scale    = const(size.xscale),const(size.yscale)
id       = 10800
bindtime = -1
ownpal   = 1
sprpriority    = 5
removeongethit = 1

;-------------------------------------------------[ヒット定義]
[State 805, HitDef-1]
type                = HitDef
trigger1            = AnimElem = 5
attr                = A, NA
hitflag             = MAFD
guardflag           = N
damage              = Floor(42*Fvar(0)),0
getpower = 20,10
animtype            = hard
ground.type         = High
priority            = 3, Hit
pausetime           = 9, 10
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 6
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 22
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28

ground.velocity     = -0.5, 12
guard.velocity      = -6
air.velocity        = -0.5, 11
airguard.velocity   = -2, -4
fall                = 1
air.fall            = 1
fall.recover        = 0
fall.recovertime    = Ceil(FVar(3)*60)+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Palfx.Time        = 120
Palfx.Mul         = 200,200,200
Palfx.Add         = 100,-120,-120
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Trigger1 = Animelemtime(5) > 0
Trigger1 = Animelemtime(13) < 0
Name     = "hit"
Stateno  = 7005
ID       = 320
Pos      = 10, -50
PosType  = P2
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Trigger1       = Animelemtime(6) < 0
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 42*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

;-------------------------------------------------[相手制御]

[State a, 床バウンド(強)]
type           = TargetState
trigger1       =(MoveHit= 1) && target,ishelper = 0
Trigger1       = Animelemtime(6) < 3
value          = 8070
persistent     = 0
ignorehitpause = 1

;-------------------------------------------------[演出-2]

[State 805, 状態変更]
type     = StatetypeSet
Trigger1 = Animelem = 9
Statetype= S
Physics  = S

[State 805, 速度]
type     = PosSet
trigger1 = Animelem = 9
Y        = 0

[State 805, 速度]
type     = Velset
trigger1 = Animelem = 9
X        = 0
Y        = 0

[State 805, 効果音]
type     = PlaySnd
trigger1 = AnimElem = 9
value    = s80, 9

[State 805, 画面振動]
type     = EnvShake
trigger1 = AnimElem = 9
time     = 13
ampl     = 4


[State 805, 効果音]
Type     = PlaySnd
Trigger1 = AnimElem = 13
value    = s80, 26
ignorehitpause = 1

[State 805, 煙エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(14) = 2
StateNo  = 10300
ID       = 10300
Name     = "Smoke-Effect"
Pos      = -10, -53
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1
Persistent     = 0

[state 805, エフェクト]
type     = Explod
trigger1 = Animelem = 12
anim     = 10800
pos      = 0, 0
Scale    = (const(size.xscale))*1,(const(size.xscale))*1.25
id       = 10800
bindtime = -1
IgnoreHitPause = 0
sprpriority    = 7
removeongethit = 1

[state 805, エフェクト]
type     = Explod
trigger1 = Animelem = 13
anim     = 10805
pos      = 0, 0
Scale    = const(size.xscale)*0.75, const(size.yscale)
id       = 10805
bindtime = -1
IgnoreHitPause = 0
sprpriority    = 8
removeongethit = 1

;-------------------------------------------------[ヒット定義2]

[State a, フラグリセット]
Type     = MoveHitReset
trigger1 = AnimElemTime(13) = -1

[State 805, HitDef-2]
type                = HitDef
trigger1            = AnimElem = 13
attr                = A, NA
hitflag             = MAFD
guardflag           = N
damage              = Floor(84*Fvar(0)),0
getpower = 20,10
animtype            = hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 6
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 22
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28


ground.velocity     = -9.5
guard.velocity      = -8
air.velocity        = -9.5
airguard.velocity   = -2, -4
fall                = 1
air.fall            = 1
ID = 8010
fall.recovertime    = Ceil(26*FVar(3))+(floor(10*(1+1*var(7))))
yaccel              = 0.42
Palfx.Time        = 120
Palfx.Mul         = 200,200,200
Palfx.Add         = 100,-120,-120
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Trigger1 = Animelemtime(13) >= 0
Name     = "hit"
Stateno  = 7020
ID       = 800
Pos      = 10+ceil(p2dist x-enemynear,const(size.ground.front)), -72
PosType  = P1
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Trigger1       = Animelemtime(13) >= 0
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 84*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit = 1
Trigger1       = Animelemtime(13) >= 0
IgnoreHitPause = 1
Persistent     = 0
fvar(1)        = FVar(1) * 0.5

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit = 1
Trigger1       = Animelemtime(13) >= 0
IgnoreHitPause = 1
Persistent     = 0
fvar(3)        = FVar(3) - 0.2

;-------------------------------------------------[相手制御]

[State a, 床バウンド]
type           = TargetState
trigger1       =(MoveHit=1) && target,ishelper = 0
Trigger1       = Animelemtime(13) >= 0
value          = 8010
persistent     = 0
ignorehitpause = 1

;-------------------------------------------------[終了]

[State 805, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;==================================================
; [ENEMY] 相手 / 投げ抜けチャンス
;==================================================

[Statedef 810]
type     = S
movetype = H
physics  = N
velset   = 0, 0
sprpriority = -1

[State 810]
type     = turn
trigger1 = facing = enemy,facing
trigger1 = time = 0

[State 810, 相手アニメ変更]
type     = ChangeAnim2
Trigger1 = !Time
value    = 810

[State 810]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 810]
type       = ChangeState
TriggerAll = Statetime < 10
trigger1   = command = "recovery"
Trigger2   = command = "a"
Trigger3   = command = "b"
Trigger4   = command = "c"
Trigger5   = command = "x"
Trigger6   = command = "y"
Trigger7   = command = "z"
value      = 811

[State 810]
type     = ChangeState
Trigger1 = Animtime = 0
value    = 812

[state 810]
type     = Selfstate
trigger1 = time = 100
value    = 0
ctrl     = 1


;==================================================
; [ENEMY] 相手 / 投げ抜け
;==================================================

[Statedef 811]
type     = S
movetype = A
physics  = S
ctrl     = 0

[State 811]
type     = ChangeAnim2
Trigger1 = Time = 0
value    = 811

[State 811]
type     = NotHitBy
trigger1 = 1
value    = SCA

[State 811]
type     = Velset
trigger1 = !time
X        = -4

[State 811]
type     = Velset
trigger1 = Animelem = 2
X        = -5

[State 811]
type     = selfState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;==================================================
; [ENEMY] 相手 / 投げ抜け失敗 - 硬直
;==================================================

[Statedef 812]
type     = S
movetype = H
physics  = N
velset   = 0, 0
sprpriority = -1

[state 812]
type     = Selfstate
trigger1 = time = 100
value    = 0
ctrl     = 1




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / レバー投げ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 820]
type     = S
movetype = A
physics  = S
anim     = 820
velset   = 0,0
ctrl     = 0
sprpriority = 2

[State a]
type     = Posset
Trigger1 = !Time
Y        = 0

;-------------------------------------------------[演出]

[State 820]
Type     = AttackDist
Trigger1 = 1
value    = 0

[State 820]
type     = PlaySnd
Trigger1 = !time
value    = s2, 0

;-------------------------------------------------[攻撃判定]

[State 820, HitDef]
type          = HitDef
Trigger1      = AnimElem = 2
Trigger1      = P2StateNo != [150, 153]
attr          = S, NT
damage        = 0
getpower = 60,30
hitflag       = M-
priority      = 3, miss
pausetime     = 9, 8
sparkno       = -1
sparkxy       = 0, 0
hitsound      = -1
guard.sparkno = -1
guardsound    = -1
P1facing      = 1
P2facing      = 1
Fall          = 0
Kill          = 0
P2stateno     = 830
ID = 800


[state 820, エフェクト]
type     = Explod
trigger1 = Movehit
anim     = 7050
postype  = P1
pos      = 80, -50
Scale    = 1, 1
id       = 7000
ownpal   = 1
persistent     = 0
sprpriority    = 5
removeongethit = 1
IgnoreHitPause = 1

;-------------------------------------------------[終了]

[State 820, ステート変更] ;成功
Type     = ChangeState
Trigger1 = MoveHit
value    = 821

[State 820, ステート変更] ;失敗
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ニュートラル投げ / 投げ抜け 受付
;━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 821]
type     = S
movetype = A
physics  = S
velset   = 0,0
anim     = 821
sprpriority = 2

[State 821]
type     = Posset
trigger1 = !time
Y        = 0

[State 821]
type     = NotHitBy
trigger1 = 1
value    = SCA

[State 821, 投げ抜けされた]
type     = ChangeState
trigger1 = EnemyNear, StateNo = 811
value    = 802

[State 821, 投げステートへ]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 825



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / レバー投げ-成功
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 825]
type     = S
movetype = A
physics  = N
velset   = 0, 0
ctrl     = 0
anim     = 825

[State 825, NotHitBy]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP
IgnoreHitPause = 1

[State 825]
type     = turn
trigger1 = Animelemtime(5) = 0

[state 825, 速度]
type     = Velset
trigger1 = Animelem = 2
X        = -1

[state 825, 速度]
type     = Velmul
trigger1 = Animelemtime(5) > 0
X        = 0.98

;-----------------------------------[ターゲット制御]

[State 825, 相手ステート制御]
Type     = TargetState
Trigger1 = !time
value    = 831

[State 825]
type     = TargetBind
Trigger1 = !time
pos      = 90, 0
IgnoreHitPause = 1

[State 825, 相手ステート制御]
Type     = TargetState
Trigger1 = Animelem = 2
value    = 832

[State 825]
type     = TargetBind
Trigger1 = Animelem = 2
pos      = 85, -90
IgnoreHitPause = 1

[State 825]
type     = TargetBind
Trigger1 = Animelem = 3
pos      = 85, -100
IgnoreHitPause = 1

[State 825]
type     = TargetBind
Trigger1 = Animelem = 4
pos      = 5, -80
IgnoreHitPause = 1

[State 825]
type     = TargetBind
Trigger1 = AnimelemTime(5) = 0
pos      = 90, -105
IgnoreHitPause = 1

[State 825, 相手ステート制御]
Type     = TargetState
Trigger1 = AnimelemTime(5) =2
value    = 833

;-------------------------------------------------[数値調整]

[State 825, 相手ダメージ]
Type     = TargetLifeAdd
Trigger1 = Animelemtime(5) = 1
absolute = 1			;防御力を反映する
value    = -133

;-------------------------------------------------[終了]

[State a, ステート変更]
type     = ChangeState
trigger1 = Animtime = 0
value    = 0
ctrl     = 1


;==================================================
; [ENEMY] 相手 / 投げ抜けチャンス
;==================================================

[Statedef 830]
type     = S
movetype = H
physics  = N
velset   = 0, 0
sprpriority = -1

[State 830]
type     = turn
trigger1 = facing = enemy,facing
trigger1 = time = 0

[State 830, 相手アニメ変更]
type     = ChangeAnim2
Trigger1 = !Time
value    = 810

[State 830]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 830]
type       = ChangeState
TriggerAll = Statetime < 8
trigger1   = command = "recovery"
Trigger2   = command = "a"
Trigger3   = command = "b"
Trigger4   = command = "c"
Trigger5   = command = "x"
Trigger6   = command = "y"
Trigger7   = command = "z"
value      = 811

[State 830]
type     = ChangeState
Trigger1 = Animtime = 0
value    = 831

[state 830]
type     = Selfstate
trigger1 = time = 100
value    = 0
ctrl     = 1


;==================================================
; [ENEMY] 相手 / 投げくらい(地上)
;==================================================
[Statedef 831]
Type     = S
MoveType = H
PhySics  = N
VelSet   = 0,0
Sprpriority = -1

[State 831, NotHitBy];邪魔されない
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 831];もしものために 
Type     = SelfState
Trigger1 = Time>= 150
value    = 0


;==================================================
; [ENEMY] 相手 / 投げくらい(空中)
;==================================================
[Statedef 832]
Type     = A
MoveType = H
PhySics  = N
VelSet   = 0, 0
Sprpriority = -1

[State 832, NotHitBy];邪魔されない
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 832]
type     = turn
trigger1 = facing = enemy,facing

[State 832, 相手アニメ変更]
type     = ChangeAnim2
Trigger1 = !Time
value    = 830

[State 832];もしものために 
Type     = SelfState
Trigger1 = Time>= 150
value    = 5210


;==================================================
; [ENEMY] 相手 / 投げくらい(ふっとび)
;==================================================
[Statedef 833]
Type     = A
MoveType = H
PhySics  = N
VelSet   = 0, 0
Sprpriority = -1

[State 833];相手のアニメ指定
Type     = ChangeAnim
Trigger1 = !Time
value    = 5050

[State 833]
type     = turn
trigger1 = facing = enemy,facing
trigger1 = time = 0

[State 833]
Type     = VelSet
Trigger1 = !time
x = -8
y = -5.5

[State 833]
Type     = Gravity
Trigger1 = Time > 0

;-------------------------------------------[ダウンへ]

[State 833]
Type       =  SelfState;ChangeState
TriggerAll = Vel Y>0
Trigger1   = Pos Y>=0
value      = 5100



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中投げ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 840]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 840
sprpriority = 2

[State 840]
Type     = AttackDist
Trigger1 = 1
value    = 0

;-------------------------------------------------[攻撃判定]

[State 840, HitDef]
type          = HitDef
Trigger1      = AnimElem = 2
Trigger1      = P2StateNo != [150, 153]
Trigger1      = P2StateType = A
attr          = A, NT
damage        = 0
getpower = 30,15
hitflag       = A-
priority      = 3, miss
pausetime     = 3, 2
sparkno       = -1
sparkxy       = 0, 0
hitsound      = -1
guard.sparkno = -1
guardsound    = -1
P1facing      = 1
P2facing      = 1
Fall          = 0
Kill          = 0
P2stateno     = 850
ID            = 800

[state 840, エフェクト]
type     = Explod
trigger1 = Movehit
anim     = 7050
postype  = P1
pos      = 65, -85
Scale    = 1, 1
id       = 7000
bindtime = 1
ownpal   = 1
Persistent     = 0
sprpriority    = 5
removeongethit = 1

[State a]
Type     = ChangeState
Trigger1 = MoveHit
value    = 845

;-------------------------------------------------[終了]

[State a, CtrlSet];行動可能に
type     = CtrlSet
trigger1 = Animelem = 7
value    = 1

[State a, 終了]
type     = ChangeState
trigger1 = Pos Y >= 0
value    = 52
ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 / 空中投げ-成功
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 845]
type     = A
movetype = A
physics  = N
velset   = 0, 0
ctrl     = 0
anim     = 845

[State 845, NotHitBy]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP
IgnoreHitPause = 1

[State 845, 効果音]
type     = PlaySnd
trigger1 = Animelem = 3
value    = 80, 1
channel  = 0

;--------------------------------------

[State 845]
type     = TargetBind
trigger1 = animelem = 1,>=0
trigger1 = Animelem = 2,<0
pos      = 60, -85
IgnoreHitPause = 1

[State 825, 相手ステート制御]
Type     = TargetState
Trigger1 = Animelem = 2
value    = 851

[State 845]
type     = TargetBind
trigger1 = animelem = 2,>=0
trigger1 = Animelem = 3,<0
pos      = 30, -190

[State 845, 速度]
type     = VelSet
Trigger1 = Animelem = 2
X        = 3
Y        = -6

[State 845, 重力]
type     = VelAdd
Trigger1 = Animelemtime(2) >= 0
Y        = 0.4

[State 825, 相手ステート制御]
Type     = TargetState
Trigger1 = Animelem = 2
value    = 852

[State 845]
type     = TargetBind
trigger1 = Animelem = 3,>=0
pos      = -30, -235

;-----------------------------------------[次の段階へ]

[State 845, ステート変更]
Type     = ChangeState
trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
value    = 846


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 / 空中投げ-成功2
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 846]
type     = S
movetype = A
physics  = S
velset   = 0, 0
ctrl     = 0
anim     = 846

[State 846, NotHitBy]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP
IgnoreHitPause = 1

[State 845, 効果音]
type     = PlaySnd
trigger1 = Animelem = 2
value    = 80, 9

[State 846, 速度]
type     = Velset
trigger1 = !time
X        = 0
Y        = 0

[State 846, 相手ステート制御]
Type     = TargetState
Trigger1 = !time
value    = 853

[State 845]
type     = TargetBind
trigger1 = animelem = 1
pos      = 90, -105
IgnoreHitPause = 1

[State 846]
type     = TargetBind
trigger1 = animelem = 2
Pos      = 85, 0

[State 846, 画面振動]
type     = EnvShake
trigger1 = AnimElem = 2
time     = 4
ampl     = 4

[State 846, 煙エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(3) = 1
StateNo  = 10840
ID       = 840
Name     = "Smoke-Effect"
Pos      = -25, -20
PosType  = P1
Ownpal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent     = 0

[State 846, 煙エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(3) = 1
StateNo  = 10840
ID       = 841
Name     = "Smoke-Effect"
Pos      = 30, -20
PosType  = P1
Ownpal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent     = 0

;-------------------------------------------------[ヒット定義]

[State 846, HitDef-1]
type                = HitDef
trigger1            = AnimElem = 3
attr                = A, NA
hitflag             = MAFD
guardflag           = N
damage              = Floor(117*Fvar(0)),0
getpower = 30,15
animtype            = hard
ground.type         = High
priority            = 3, Hit
pausetime           = 25, 24
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 6
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 22
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28

ground.velocity     = -0.5, -15
guard.velocity      = -6
air.velocity        = -0.5, -15
airguard.velocity   = -2, -4
fall                = 1
air.fall            = 1
fall.recover        = 1
fall.recovertime    = Ceil(FVar(3)*81)+25
yaccel              = 0.22

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7005
ID       = 320
Pos      = 10, -50
PosType  = P2
OwnPal   = 1
size.xscale = 1.2
size.yscale = 1.2
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 117*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit = 1
IgnoreHitPause = 1
Persistent     = 0
fvar(1)        = FVar(1) * 0.5

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit = 1
IgnoreHitPause = 1
Persistent     = 0
fvar(3)        = FVar(3) - 0.2

;-----------------------------------------[終了]

[State 846, ステート変更]
Type     = ChangeState
trigger1 = Animtime = 0
value    = 0
ctrl     = 1



;==================================================
; [ENEMY] 相手 / 投げくらい(空中1)
;==================================================
[Statedef 850]
Type     = A
MoveType = H
PhySics  = N
VelSet   = 0, 0
Sprpriority = -1

[State 850, NotHitBy];邪魔されない
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 850]
type     = turn
trigger1 = facing = enemy,facing

[State 850, 相手アニメ変更]
type     = ChangeAnim2
Trigger1 = !Time
value    = 850

[State 850];もしものために 
Type     = SelfState
Trigger1 = Time>= 150
value    = 5210


;==================================================
; [ENEMY] 相手 / 投げくらい(空中2)
;==================================================
[Statedef 851]
Type     = A
MoveType = H
PhySics  = N
VelSet   = 0, 0
Sprpriority = -1

[State 851, NotHitBy];邪魔されない
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 851]
type     = turn
Trigger1 = !time
trigger1 = facing = enemy,facing

[State 851, 相手アニメ変更]
type     = ChangeAnim2
Trigger1 = !Time
value    = 850

[State 851]
type     = AngleDraw
Trigger1 = 1
value    = -30

[State 851];もしものために 
Type     = SelfState
Trigger1 = Time>= 150
value    = 5210

;==================================================
; [ENEMY] 相手 / 投げくらい(空中3)
;==================================================
[Statedef 852]
Type     = A
MoveType = H
PhySics  = N
VelSet   = 0, 0
Sprpriority = -1

[State 852, NotHitBy];邪魔されない
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 852]
type     = turn
Trigger1 = !time
trigger1 = facing = enemy,facing

[State 852, 相手アニメ変更]
type     = ChangeAnim2
Trigger1 = !Time
value    = 850

[State 852]
type     = AngleDraw
Trigger1 = 1
value    = -120

[State 852];もしものために 
Type     = SelfState
Trigger1 = Time>= 600
value    = 5210


;==================================================
; [ENEMY] 相手 / 投げくらい(着地)
;==================================================
[Statedef 853]
Type     = S
MoveType = H
PhySics  = S
VelSet   = 0, 0
Sprpriority = -1

[State 853]
type     = turn
trigger1 = facing = enemy,facing

[State 853, 相手アニメ変更]
type     = ChangeAnim2
Trigger1 = !Time
value    = 851

[State 8523]
TYpe     = AngleDraw
Trigger1 = 1
value    = 0

[State 853];もしものために 
Type     = SelfState
Trigger1 = Time>= 150
value    = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [HELPER] 空中投げ / 煙エフェクト
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[Statedef 10840]
type    = A
physics = N
anim    = 10105
ctrl    = 0
sprpriority = 8

[State a]
type     = AssertSpecial
trigger1 = 1
flag     = noshadow

;-------------------------------------------------[速度設定]

;-------------------------------------------------[サイズ設定]

[State 10840, サイズ変更];墓石から
type     = AngleDraw
trigger1 = 1
scale    = 1+(Time*0.015), 1+(Time*0.015)

;-------------------------------------------------[透過設定]

[State 10840, 透過処理]
Type     = Trans
Trigger1 = 1
trans    = addalpha
Alpha    = var(1), 256

[state 10840, 変数]
type     = VarAdd
trigger1 = Time < 5
var(1)   = 50

[state 10840, 変数]
type     = VarSet
trigger1 = Time = 15
var(1)   = 256

[state 10840, 変数]
type     = VarAdd
trigger1 = Time > 15
var(1)   = -12

;-------------------------------------------------[終了]

[State 10840, ヘルパー消滅]
type = DestroySelf
trigger1 = time >= 30
trigger2 = Var(1) < 0