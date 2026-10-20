;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
;必殺技ステート
;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ミサイル発射やー！
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1000]
type     = S
movetype = A
physics  = S
ctrl     = 0
sprpriority = 2

;-------------------------------------------------[コマンド判定]

[state 1000, varset1];リセット
type     = VarSet
trigger1 = (!time)
Trigger1 = (PrevStateNo != 1010)&&(PrevStateNo != 1020)
var(0)   = 0

[State 1000]
type     = ChangeAnim
Trigger1 = !time
value    = 1000  + (var(0)*10)

;-------------------------------------------------[アルカナゲージ処理A]

[State a, VarAdd];アルカナゲージ最大量
Type       = VarAdd
TriggerAll = Fvar(20) >= Fvar(21)
Trigger1   = !time
fvar(21)   = 15
Persistent = 0
IgnoreHitPause = 1

;-------------------------------------------------[演出]

[State 1000, 効果音]
type     = PlaySnd
trigger1 = Animelemtime(4) = 6
value    = s80, 17

[State 1000, 画面振動]
type     = EnvShake
trigger1 = AnimElem = 4
time     = 12
ampl     = 4
IgnoreHitPause = 1

[state 1000, エフェクト];アーム表示
type     = Explod
trigger1 = AnimelemTime(4) = 0
anim     = 1001 + (var(0)*10)
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 1000
bindtime = -1
sprpriority    = -1
IgnoreHitPause = 0
removeongethit = 1

[State 1000, 弾幕] ;A版ミサイル
type        = Helper
triggerAll  = Var(0) = 0
trigger1    = AnimelemTime(4) = 6
name        = "Skill-miso"
ID          = 11000
postype     = P1
pos         = 10, -150
Stateno     = 11000
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

[State 1000, 煙エフェクト]
Type     = Helper
triggerAll  = Var(0) = 0
trigger1    = AnimelemTime(4) = 6
StateNo  = 10105
ID       = 1000
Name     = "Smoke-Effect"
Pos      = 10, -150
PosType  = P1
Ownpal   = 1
size.xscale = 0.75
size.yscale = 0.75
IgnoreHitPause = 1
Persistent     = 0

[State 1000, 弾幕] ;B版ミサイル
type        = Helper
triggerAll  = Var(0) = 1
trigger1    = AnimelemTime(4) = 6
name        = "Skill-miso"
ID          = 11001
postype     = P1
pos         = 20, -155
Stateno     = 11000
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

[State 1000, 煙エフェクト]
Type     = Helper
triggerAll  = Var(0) = 1
trigger1    = AnimelemTime(4) = 6
StateNo  = 10105
ID       = 1000
Name     = "Smoke-Effect"
Pos      = 20, -155
PosType  = P1
Ownpal   = 1
size.xscale = 0.75
size.yscale = 0.75
IgnoreHitPause = 1
Persistent     = 0

[State 1000, 弾幕] ;C版ミサイル
type        = Helper
triggerAll  = Var(0) = 2
trigger1    = AnimelemTime(4) = 6
name        = "Skill-miso"
ID          = 11002
postype     = P1
pos         = 50, -110
Stateno     = 11000
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

[State 1000, 煙エフェクト]
Type     = Helper
triggerAll  = Var(0) = 2
trigger1    = AnimelemTime(4) = 6
StateNo  = 10105
ID       = 1000
Name     = "Smoke-Effect"
Pos      = 50, -110
PosType  = P1
Ownpal   = 1
size.xscale = 0.75
size.yscale = 0.75
IgnoreHitPause = 1
Persistent     = 0

;-------------------------------------------------[攻撃状態終了]

[State 1000, 終了]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ミサイル発射 / B版
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1010]
type     = S
movetype = A
physics  = S
velset   = 0, 0
ctrl     = 0
sprpriority = 2

;-------------------------------------------------[コマンド判定]

[State 1010, 変数]
type     = Varset
Trigger1 = !time
var(0)   = 0

[State 1010, 変数]
type     = Varset
Trigger1 = !time
var(0)   = 1

;-------------------------------------------------[終了]

[state 1010, ステート変更]
type     = ChangeState
trigger1 = !time
value	 = 1000
ctrl	 = 0

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ミサイル発射 / C版
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1020]
type     = S
movetype = A
physics  = S
velset   = 0, 0
ctrl     = 0
sprpriority = 2

;-------------------------------------------------[コマンド判定]

[State 1020, 変数]
type     = Varset
Trigger1 = !time
var(0)   = 0

[State 1020, 変数]
type     = Varset
Trigger1 = !time
var(0)   = 2

;-------------------------------------------------[終了]

[state 1020, ステート変更]
type     = ChangeState
trigger1 = !time
value	 = 1000
ctrl	 = 0


;============================================================
; [Helper] 地上 / ミサイル
;============================================================

[Statedef 11000]
type     = A
movetype = A
physics	 = N
ctrl     = 0
velset   = 0, 0
sprpriority = 9

;-------------------------------------------------[共通設定]

[State a]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[state a]
type     = AngleDraw
trigger1 = 1
scale    = 0.5, 0.5
value    = Var(0)

[state a]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 11000, 効果音];「命中！」
type     = PlaySnd
trigger1 = Movehit = 1
value    = s400, 1

;-------------------------------------------------[アニメ設定]

[State a]
type     = ChangeAnim
trigger1 = !Time
trigger1 = isHelper(11000) || isHelper(11001) || isHelper(11002)
value    = Ifelse(isHelper(11000),11000,ifelse(ishelper(11001),11001,ifelse(ishelper(11002),11002,11000)))


;-------------------------------------------------[速度管理A]

[State a]
type     = VelSet
Trigger1 = (Anim = 11000)
Trigger1 = !time
X = 3*cos(50*pi/180)
Y =-3*Sin(50*pi/180)

[State a]
type     = VelSet
Trigger1 = (Anim = 11000)
Trigger1 = (Animelemtime(2)>=0)&&(Animelemtime(3)<0)
X = 2*cos(25*pi/180)
Y =-2*Sin(25*pi/180)

[State a]
type     = VelSet
Trigger1 = (Anim = 11000)
Trigger1 = (Animelemtime(3)>=0)
X = 1*cos(0*pi/180)
Y =-1*Sin(0*pi/180)

;-------------------------------------------------[速度管理B]

[State a]
type     = VelSet
Trigger1 = (Anim = 11001)
Trigger1 = !time
X = 3*cos(20*pi/180)
Y =-3*Sin(20*pi/180)

[State a]
type     = VelSet
Trigger1 = (Anim = 11001)
Trigger1 = (Animelemtime(2)>=0)&&(Animelemtime(3)<0)
X = 2*cos(5*pi/180)
Y =-2*Sin(5*pi/180)

[State a]
type     = VelSet
Trigger1 = (Anim = 11001)
Trigger1 = (Animelemtime(3)>=0)
X = 1*cos(-25*pi/180)
Y =-1*Sin(-25*pi/180)

;-------------------------------------------------[速度管理C]

[State a, 変数];角度
type     = varSet
Trigger1 = (!time) && (IsHelper(11002))
var(0)   = -25
Persistent     = 0
IgnoreHitPause = 1

[State a, 変数];角度
type     = varSet
Trigger1 = (Animelem = 2) && (IsHelper(11002))
var(0)   = -50
Persistent     = 0
IgnoreHitPause = 1

[State a, 変数];角度
type     = varSet
Trigger1 = (Animelem = 3) && (IsHelper(11002))
var(0)   = -75
Persistent     = 0
IgnoreHitPause = 1

[State a]
type     = VelSet
Trigger1 = (IsHelper(11002))
X        = 3.1*cos(var(0)*pi/180)
Y        =-3.1*Sin(var(0)*pi/180)

[State a]
type     = VelSet
Trigger1 = (Pos Y >= 0)
Y        = 0

;-------------------------------------------------[ヒット定義]

[state 11000, HitDef]
type              = HitDef
Trigger1          = 1
attr              = S, SP
hitflag           = MAFD
guardflag         = MA
damage            = Floor(21*root,FVar(1)), 5
animtype          = Mid
ground.type       = Low
priority          = 3, Hit
pausetime         = 0, floor(9*(1+1*var(7)))
sparkno           = -1
sparkxy           = 0, 0
guard.sparkno     = -1
hitsound          = s0, 3
guardsound        = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity   = -2.3, -8
guard.velocity    = -5
air.velocity      = -2.3, -8
airguard.velocity = -3, -2
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall              = 1
air.fall          = 1
fall.recovertime  = Ceil(root,FVar(3)*30)+(floor(9*(1+1*var(7))))
Persistent        = 0
guard.kill        = 0
yaccel            = 0.4
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0

;==============================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 10, IfElse(EnemyNear,StateType = A, -60, -55)
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
ID       = 7000
Pos      = 10,IfElse(EnemyNear,StateType = A, -60, -50)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, 変数]  ;Rate補正
Type           = ParentVarSet
Trigger1       = (Movehit = 1)&&(Var(7)=0)
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = root,FVar(1) * ifelse(root,fvar(2)=1, 0.95, 0.80)

[State a, 変数]  ;Rate補正
Type           = ParentVarSet
Trigger1       = (Movehit = 1)&&(Var(7)=1)
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = root,FVar(1) * ifelse(root,fvar(2)=1, 0.98, 0.95)

[State a, VarSet];復帰不能補正
Type           = parentVarSet
Trigger1       = MoveHit=1
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = root,FVar(3) - 0.02

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = ParentVarAdd
TriggerAll     = root,Fvar(20) >= root,Fvar(21)
Trigger1       = MoveContact=1
Persistent     = 1
IgnoreHitPause = 1
fvar(21)       = 210*ifelse(MoveHit, 0.70, 0.275)*ifelse(root,var(15)=1, 1.1, 1)

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
Trigger1       = ((MoveHit = 1)&&(MoveHit))
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[state a];炸裂ステート
type     = ChangeState
trigger1 = AnimTime = 0
trigger2 = MoveContact = 1
value    = 11010


;============================================================
; [Helper] 地上 / ミサイル - 炸裂
;============================================================

[Statedef 11010]
type     = A
movetype = I
physics	 = N
ctrl     = 0
velset   = 0, 0
sprpriority = -1

[State 11010]
type     = ChangeAnim
Trigger1 = !time
value    = 9999

;-------------------------------------------------[共通設定]

[State a]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[state a]
type     = AssertSpecial
trigger1 = 1
flag     = noshadow

;-------------------------------------------------[弾幕展開]

;爆心地はランダム

[State 11010]
type     = VarRandom
Trigger1 = 1
v        = 20
range    = -40, 40

[State 11010]
type     = VarRandom
Trigger1 = 1
v        = 21
range    = -30, 30

[State 11010, 弾幕]
type        = Helper
trigger1    = Time = 0
trigger2    = Time = 5
trigger3    = Time = 10
trigger4    = Time = 15
name        = "Skill-GlanfiaA"
ID          = 11011
postype     = P1
pos         = Var(20), Var(21)
Stateno     = 11011
size.xscale = 1
size.yscale = 1
ownpal      = 1
ignorehitpause = 1


[state a, 終了]
type     = destroyself
trigger1 = Statetime >= 20


;============================================================
; [Helper] 地上 / ミサイル-炸裂2
;============================================================

[Statedef 11011]
type     = A
movetype = A
physics	 = N
ctrl     = 0
velset   = 0, 0
sprpriority = 8

;-------------------------------------------------[共通設定]

[State a]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[state a]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State a]
type     = Trans
Trigger1 = 1
trans    = Add

[State a]
type     = VarSet
Trigger1 = !time
fvar(0)  = 0.5

[State a]
type     = VarAdd
Trigger1 = time <= 10
fvar(0)  = 0.025

[state a]
type     = AngleDraw
trigger1 = 1
scale    = fvar(0), fvar(0)

;-------------------------------------------------[アニメ設定]

[State a]
type     = ChangeAnim
trigger1 = !Time
value    = 11010

[State 11011, 効果音]
type     = PlaySnd
trigger1 = !time
value    = s80, 28

[State 11011, サークル]
type       = Explod
trigger1   = time = 1
anim       = 11011
ID         = 1
postype    = P1
pos        = 0, 0
random     = 0, 0
scale      = 0.1, 0.1
vel        = 0, 0
sprpriority    = 9
bindtime       = -1
removeongethit = 1

[State a];エフェクト管理
type     = ModifyExplod
trigger1 = Numexplod(1) = 1
ID       = 1
Scale    = 0.25+0.015*(time), 0.25+0.015*(time)

;-------------------------------------------------[ヒット定義]

[state 11011, HitDef]
type              = HitDef
Trigger1          = 1
attr              = S, SP
hitflag           = MAFD
guardflag         = MA
damage            = Floor(21*root,FVar(1)), 5
animtype          = Mid
ground.type       = Low
priority          = 3, Hit
pausetime         = 0, floor(9*(1+1*var(7)))
sparkno           = -1
sparkxy           = 0, 0
guard.sparkno     = -1
hitsound          = s0, 3
guardsound        = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity   = -2.3, -8
guard.velocity    = -5
air.velocity      = -2.3, -8
airguard.velocity = -3, -2
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall              = 1
air.fall          = 1
fall.recovertime  = Ceil(root,FVar(3)*30)+(floor(9*(1+1*var(7))))
Persistent        = 0
guard.kill        = 0
yaccel            = 0.4
Palfx.Time        = 120
Palfx.Mul         = 200,200,200
Palfx.Add         = 100,-120,-120
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0

;==============================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 10, IfElse(EnemyNear,StateType = A, -60, -55)
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
ID       = 7000
Pos      = 10,IfElse(EnemyNear,StateType = A, -60, -50)
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, 変数]  ;Rate補正
Type           = ParentVarSet
Trigger1       = (Movehit = 1)&&(Var(7)=0)
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = root,FVar(1) * ifelse(root,fvar(2)=1, 0.95, 0.80)

[State a, 変数]  ;Rate補正
Type           = ParentVarSet
Trigger1       = (Movehit = 1)&&(Var(7)=1)
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = root,FVar(1) * ifelse(root,fvar(2)=1, 0.98, 0.95)

[State a, VarSet];復帰不能補正
Type           = parentVarSet
Trigger1       = MoveHit=1
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = root,FVar(3) - 0.02

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = ParentVarAdd
TriggerAll     = root,Fvar(20) >= root,Fvar(21)
Trigger1       = MoveContact=1
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 21*ifelse(MoveHit, 0.70, 0.275)*ifelse(root,var(15)=1, 1.1, 1)

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
Trigger1       = ((MoveHit = 1)&&(MoveHit))
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[state a, 終了]
type     = destroyself
trigger1 = Animtime = 0







;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / ラリアットぶんぶんぶん！ - A
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1100]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 1100
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

[State 1100, 状態変更]
type     = StatetypeSet
Trigger1 = Animelem = 2
Statetype= A
Physics  = N

[State 1100, 効果音]
type     = PlaySnd
trigger1 = Animelem = 4
value    = s80, 16

[State 1100, 効果音]
type     = PlaySnd
trigger1 = Animelem = 7
value    = s80, 11

[State 1100, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4023
ID       = 4023
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1100, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4024
ID       = 4023
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1100, バーニア表示]
type     = Explod
Trigger1 = Animelemtime(3) = 0
anim     = 4025
ID       = 4023
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 7
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1100, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4026
ID       = 4023
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 7
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1110, 煙エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(3) = 0
StateNo  = 11100
ID       = 11100
Name     = "Smoke-Effect"
Pos      = -55, -35
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1

[state 1100, 速度]
type     = Velset
trigger1 = Animelem = 2
X        = 1
Y        = -1

[state 1100, 速度]
type     = VelAdd
trigger1 = Animelemtime(10) >= 0
Y        = 0.45

;-----------------------------------------------[アーマー処理]

[State 1100, スーパーアーマー]
Type     = Helper
Trigger1 = NumHelper(1180) = 0
trigger1 = !time
PosType  = P1
Pos      = 0, 0
ID       = 1180
StateNo  = 1180
Name     = "Super-Armer"
Persistent    = 0
PauseMoveTime = 0;999999
SuperMoveTime = 0;999999

[State a];投げ無敵
type     = Nothitby
Trigger1 = Animelemtime(2) >= 0
value2   = ,AT

[State 1100, 無敵処理]
type     = NotHitBy
Trigger1 = NumHelper(1180) > 0
trigger1 = AnimelemTime(10) < 0
value    = SCA, AA, At, AP
time     = 1
ignorehitpause = 1

;-------------------------------------------------[ヒット定義]

[State 1100, HitDef]
type                = HitDef
trigger1            = AnimElem = 5
attr                = S, NA
hitflag             = MAFD
guardflag           = MA
damage              = Floor(58*Fvar(0)), 4
getpower = 30,15
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = 4, -3
guard.velocity      = -4
air.velocity        = 4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

[State 1100, HitDef]
type                = HitDef
trigger1            = AnimElem = 8
attr                = S, NA
hitflag             = MAFD
guardflag           = MA
damage              = Floor(58*Fvar(0)), 4
getpower = 30,15
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -4, -3
guard.velocity      = -4
air.velocity        = -4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = AnimElem = 8, < 0
Trigger1 = MoveHit = 1
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

[State a];ヒットスパーク
Type     = Helper
Trigger1 = AnimElem = 8, >= 0
Trigger1 = MoveHit = 1
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
Trigger1 = AnimElem = 8, < 0
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
Persistent = 0

[State a]
Type     = Helper
Trigger1 = AnimElem = 8, >= 0
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
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正 (1hit)
Type           = VarSet
Trigger1       = AnimElem = 8, < 0
Trigger1       = MoveHit = 1 && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * Ifelse(fvar(2)=0,(0.70),(0.87))

[State a, VarSet];連続ヒット補正 (1hit counter)
Type           = VarSet
Trigger1       = AnimElem = 8, < 0
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * Ifelse(fvar(2)=0,(0.93),(0.96))

[State a, VarSet];連続ヒット補正 (2hit)
Type           = VarSet
Trigger1       = AnimElem = 8, >= 0
Trigger1       = MoveHit = 1 && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * Ifelse(fvar(2)=0,(0.70),(0.87))

[State a, VarSet];連続ヒット補正 (2hit counter)
Type           = VarSet
Trigger1       = AnimElem = 8, >= 0
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * Ifelse(fvar(2)=0,(0.93),(0.96))

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = AnimElem = 8, < 0
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.06

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = AnimElem = 8, >= 0
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.06

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = AnimElem = 8, < 0
Trigger1       = MoveContact = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 58*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = AnimElem = 8, >= 0
Trigger1       = MoveContact = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 58*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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

[State 1100, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
;Trigger2 = (Pos Y >= 0)||(Vel Y > 0)
value    = 1130
ctrl     = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / ラリアットぶんぶんぶん！ - B
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1110]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 1110
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

[State 1110, 状態変更]
type     = StatetypeSet
Trigger1 = Animelem = 2
Statetype= A
Physics  = N

[State 1110, 効果音]
type     = PlaySnd
trigger1 = Animelem = 4
Trigger2 = Animelem = 10
value    = s80, 16

[State 1110, 効果音]
type     = PlaySnd
trigger1 = Animelem = 7
value    = s80, 11

[State 1110, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4027
ID       = 4027
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1110, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4028
ID       = 4027
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1110, バーニア表示]
type     = Explod
Trigger1 = Animelemtime(3) = 0
anim     = 4029
ID       = 4027
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 7
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1110, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4030
ID       = 4027
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 7
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1110, 煙エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(3) = 0
StateNo  = 11100
ID       = 11100
Name     = "Smoke-Effect"
Pos      = -55, -35
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1

[state 1110, 速度]
type     = Velset
trigger1 = Animelem = 2
X        = 1
Y        = -1

[state 1110, 速度]
type     = VelAdd
trigger1 = Animelemtime(15) >= 0
Y        = 0.2

;-----------------------------------------------[アーマー処理]

[State 1110, スーパーアーマー]
Type     = Helper
Trigger1 = NumHelper(1181) = 0
trigger1 = !time
PosType  = P1
Pos      = 0, 0
ID       = 1181
StateNo  = 1180
Name     = "Super-Armer"
Persistent    = 0
PauseMoveTime = 0;999999
SuperMoveTime = 0;999999

[State a];投げ無敵
type     = Nothitby
Trigger1 = Animelemtime(2) >= 0
value2   = ,AT

[State 1110, 無敵処理]
type     = NotHitBy
Trigger1 = NumHelper(1181) > 0
trigger1 = AnimelemTime(15) < 0
value    = SCA, AA, At, AP
time     = 1
ignorehitpause = 1

;-------------------------------------------------[ヒット定義]

[State 1110, HitDef]
type                = HitDef
trigger1            = AnimElem = 5
attr                = S, NA
hitflag             = MAFD
guardflag           = MA
damage              = Floor(58*Fvar(0)), 4
getpower = 15,7
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = 4, -3
guard.velocity      = -4
air.velocity        = 4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

[State 1110, HitDef]
type                = HitDef
trigger1            = AnimElem = 8
attr                = S, NA
hitflag             = MAFD
guardflag           = MA
damage              = Floor(58*Fvar(0)), 4
getpower = 15,7
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -4, -3
guard.velocity      = -4
air.velocity        = -4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

[State 1110, HitDef]
type                = HitDef
trigger1            = AnimElem = 11
attr                = S, NA
hitflag             = MAFD
guardflag           = MA
damage              = Floor(58*Fvar(0)), 4
getpower = 15,7
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = 4, -3
guard.velocity      = -4
air.velocity        = 4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

[State 1110, HitDef]
type                = HitDef
trigger1            = AnimElem = 14
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(58*Fvar(0)), 4
getpower = 15,7
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -4, -3
guard.velocity      = -4
air.velocity        = -4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 10, -50
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
Persistent     = 10
IgnoreHitPause = 1

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
Persistent     = 10
IgnoreHitPause = 1

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit = 1 && Var(7) = 0
IgnoreHitPause = 1
Persistent     = 10
fvar(1)        = FVar(1) * Ifelse(fvar(2)=0,(0.70),(0.87))

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
IgnoreHitPause = 1
Persistent     = 10
fvar(1)        = FVar(1) * Ifelse(fvar(2)=0,(0.93),(0.96))

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit = 1
IgnoreHitPause = 1
Persistent     = 10
fvar(3)        = FVar(3) - 0.06

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact = 1
IgnoreHitPause = 1
Persistent     = 6
fvar(21)       = 58*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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

[State a, フラグリセット]
Type     = MoveHitReset
trigger1 = AnimElemTime(8) = -1
trigger2 = AnimElemTime(10) = 1
trigger3 = AnimElemTime(13) = 2

[State 1110, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
;Trigger2 = (Pos Y >= 0)||(Vel Y > 0)
value    = 1130
ctrl     = 0




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / ラリアットぶんぶんぶん！ - C
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1120]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 1120
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

[State 1120, 状態変更]
type     = StatetypeSet
Trigger1 = Animelem = 2
Statetype= A
Physics  = N

[State 1120, 効果音]
type     = PlaySnd
trigger1 = Animelem = 4
Trigger2 = Animelem = 10
Trigger3 = Animelem = 16
value    = s80, 16

[State 1120, 効果音]
type     = PlaySnd
trigger1 = Animelem = 7
value    = s80, 11

[State 1120, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4031
ID       = 4031
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1120, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4032
ID       = 4031
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1120, バーニア表示]
type     = Explod
Trigger1 = Animelemtime(3) = 0
anim     = 4033
ID       = 4031
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 7
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1120, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4034
ID       = 4031
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 7
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1110, 煙エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(3) = 0
StateNo  = 11100
ID       = 11100
Name     = "Smoke-Effect"
Pos      = -55, -35
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1

[state 1120, 速度]
type     = Velset
trigger1 = Animelem = 2
X        = 1
Y        = -1

[state 1120, 速度]
type     = VelAdd
trigger1 = Animelemtime(21) >= 0
Y        = 0.2

;-------------------------------------------------[アーマー]

[State 1120, スーパーアーマー]
Type     = Helper
Trigger1 = NumHelper(1182) = 0
trigger1 = !time
PosType  = P1
Pos      = 0, 0
ID       = 1182
StateNo  = 1180
Name     = "Super-Armer"
Persistent    = 0
PauseMoveTime = 0;999999
SuperMoveTime = 0;999999

[State a];投げ無敵
type     = Nothitby
Trigger1 = Animelemtime(2) >= 0
value2   = ,AT

[State 1120, 無敵処理]
type     = NotHitBy
Trigger1 = NumHelper(1182) > 0
trigger1 = AnimelemTime(22) < 0
value    = SCA, AA, At, AP
time     = 1
ignorehitpause = 1

;-------------------------------------------------[ヒット定義]

[State 1120, HitDef]
type                = HitDef
trigger1            = AnimElem = 5
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(58*Fvar(0)), 4
getpower = 10,5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = 4, -3
guard.velocity      = -4
air.velocity        = 4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

[State 1120, HitDef]
type                = HitDef
trigger1            = AnimElem = 8
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(58*Fvar(0)), 4
getpower = 10,5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -4, -3
guard.velocity      = -4
air.velocity        = -4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

[State 1120, HitDef]
type                = HitDef
trigger1            = AnimElem = 11
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(58*Fvar(0)), 4
getpower = 10,5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = 4, -3
guard.velocity      = -4
air.velocity        = 4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

[State 1120, HitDef]
type                = HitDef
trigger1            = AnimElem = 14
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(58*Fvar(0)), 4
getpower = 10,5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -4, -3
guard.velocity      = -4
air.velocity        = -4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

[State 1120, HitDef]
type                = HitDef
trigger1            = AnimElem = 17
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(58*Fvar(0)), 4
getpower = 10,5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = 4, -3
guard.velocity      = -4
air.velocity        = 4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

[State 1120, HitDef]
type                = HitDef
trigger1            = AnimElem = 20
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(58*Fvar(0)), 4
getpower = 10,5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -4, -3
guard.velocity      = -4
air.velocity        = -4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 10, -50
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
Persistent     = 10
IgnoreHitPause = 1

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
Persistent     = 10
IgnoreHitPause = 1

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit = 1 && Var(7) = 0
IgnoreHitPause = 1
Persistent     = 10
fvar(1)        = FVar(1) * Ifelse(fvar(2)=0,(0.70),(0.87))

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
IgnoreHitPause = 1
Persistent     = 10
fvar(1)        = FVar(1) * Ifelse(fvar(2)=0,(0.93),(0.96))

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit = 1
IgnoreHitPause = 1
Persistent     = 10
fvar(3)        = FVar(3) - 0.06

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact = 1
IgnoreHitPause = 1
Persistent     = 6
fvar(21)       = 58*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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

[State a, フラグリセット]
Type     = MoveHitReset
trigger1 = AnimElemTime(8) = -1
trigger2 = AnimElemTime(10) = 1
trigger3 = AnimElemTime(13) = 1
trigger4 = AnimElemTime(16) = 1
trigger5 = AnimElemTime(19) = 2

[State 1120, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
;Trigger2 = (Pos Y >= 0)||(Vel Y > 0)
value    = 1130
ctrl     = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ラリアット / 着地硬直
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[StateDef 1130]
Type     = S
Movetype = I
Physics  = S
velset   = 0, 0
Anim     = 1130
ctrl     = 0

[State 1130, 振り向き]
type     = Turn
trigger1 = Animtime = 0
trigger1 = P2dist X < 0

[State 1130, 接地]
type     = PosSet
trigger1 = Time = 0
Y        = 0

[State 1130, 効果音]
type     = PlaySnd
trigger1 = Time = 0
value    = s80, 9

[State 1130, 画面振動]
type     = EnvShake
trigger1 = AnimElem = 2
time     = 10
ampl     = 4

[State 1130, 煙エフェクト]
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

[State 1130, 煙エフェクト]
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

[State 1130, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 / ラリアットぶんぶんぶん！ - JA
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1150]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 1150
sprpriority = 2

[State a]
type     = Velset
trigger1 = !time
Y        = 0

[State a];投げ無敵
type     = Nothitby
Trigger1 = Animelemtime(2) >= 0
value2   = ,AT

;-------------------------------------------------[演出]

[State 1150, 効果音]
type     = PlaySnd
trigger1 = Animelem = 4
value    = s80, 16

[State 1150, 効果音]
type     = PlaySnd
trigger1 = Animelem = 7
value    = s80, 11

[State 1150, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4023
ID       = 4023
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1150, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4024
ID       = 4023
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1150, バーニア表示]
type     = Explod
Trigger1 = Animelemtime(3) = 0
anim     = 4025
ID       = 4023
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 7
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1150, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4026
ID       = 4023
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 7
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1150, 煙エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(3) = 0
StateNo  = 11100
ID       = 11100
Name     = "Smoke-Effect"
Pos      = -55, -35
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1

[state 1150, 速度]
type     = Velset
trigger1 = Animelem = 2
X        = 1
Y        = -1

[state 1150, 速度]
type     = VelAdd
trigger1 = Animelemtime(10) >= 0
Y        = 0.45

;-----------------------------------------------[アーマー処理]

[State 1150, スーパーアーマー]
Type     = Helper
Trigger1 = NumHelper(1180) = 0
trigger1 = AnimelemTime(10) < 0
PosType  = P1
Pos      = 0, 0
ID       = 1180
StateNo  = 1180
Name     = "Super-Armer"
Persistent    = 0
PauseMoveTime = 0;999999
SuperMoveTime = 0;999999

[State 1150, 無敵処理]
type     = NotHitBy
Trigger1 = NumHelper(1180) > 0
trigger1 = AnimelemTime(10) < 0
value    = SCA, AA, At, AP
time     = 3
ignorehitpause = 1

;-------------------------------------------------[ヒット定義]

[State 1100, HitDef]
type                = HitDef
trigger1            = AnimElem = 5
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(58*Fvar(0)), 4
getpower = 30,15
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = 4, -3
guard.velocity      = -4
air.velocity        = 4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

[State 1100, HitDef]
type                = HitDef
trigger1            = AnimElem = 8
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(58*Fvar(0)), 4
getpower = 30,15
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -4, -3
guard.velocity      = -4
air.velocity        = -4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = AnimElem = 8, < 0
Trigger1 = MoveHit = 1
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

[State a];ヒットスパーク
Type     = Helper
Trigger1 = AnimElem = 8, >= 0
Trigger1 = MoveHit = 1
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
Trigger1 = AnimElem = 8, < 0
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
Persistent = 0

[State a]
Type     = Helper
Trigger1 = AnimElem = 8, >= 0
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
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正 (1hit)
Type           = VarSet
Trigger1       = AnimElem = 8, < 0
Trigger1       = MoveHit = 1 && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * Ifelse(fvar(2)=0,(0.70),(0.87))

[State a, VarSet];連続ヒット補正 (1hit counter)
Type           = VarSet
Trigger1       = AnimElem = 8, < 0
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * Ifelse(fvar(2)=0,(0.93),(0.96))

[State a, VarSet];連続ヒット補正 (2hit)
Type           = VarSet
Trigger1       = AnimElem = 8, >= 0
Trigger1       = MoveHit = 1 && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * Ifelse(fvar(2)=0,(0.70),(0.87))

[State a, VarSet];連続ヒット補正 (2hit counter)
Type           = VarSet
Trigger1       = AnimElem = 8, >= 0
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * Ifelse(fvar(2)=0,(0.93),(0.96))

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = AnimElem = 8, < 0
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.06

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = AnimElem = 8, >= 0
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.06

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = AnimElem = 8, < 0
Trigger1       = MoveContact = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 58*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = AnimElem = 8, >= 0
Trigger1       = MoveContact = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 58*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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

[State 1150, ステート変更];硬直アリ
type     = ChangeState
trigger1 = AnimElemtime(16) < 0
Trigger1 = (Pos Y >= 0)&&(Vel Y > 0)
value    = 1130
ctrl     = 0

[State 1150, ステート変更];硬直なし
type     = ChangeState
trigger1 = AnimElemtime(16) >= 0
Trigger1 = (Pos Y >= 0)&&(Vel Y > 0)
value    = 52
ctrl     = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 / ラリアットぶんぶんぶん！ - JB
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1160]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 1160
sprpriority = 2

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[演出]

[State 1160, 効果音]
type     = PlaySnd
trigger1 = Animelem = 4
Trigger2 = Animelem = 10
value    = s80, 16

[State 1160, 効果音]
type     = PlaySnd
trigger1 = Animelem = 7
value    = s80, 11

[State 1160, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4027
ID       = 4027
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1160, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4028
ID       = 4027
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1160, バーニア表示]
type     = Explod
Trigger1 = Animelemtime(3) = 0
anim     = 4029
ID       = 4027
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 7
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1160, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4030
ID       = 4027
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 7
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1160, 煙エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(3) = 0
StateNo  = 11100
ID       = 11100
Name     = "Smoke-Effect"
Pos      = -55, -35
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1

[state 1160, 速度]
type     = Velset
trigger1 = Animelem = 2
X        = 1
Y        = -1

[state 1160, 速度]
type     = VelAdd
trigger1 = Animelemtime(15) >= 0
Y        = 0.45

;-------------------------------------------------[アーマー]

[State 1160, スーパーアーマー]
Type     = Helper
Trigger1 = NumHelper(1181) = 0
trigger1 = !time
PosType  = P1
Pos      = 0, 0
ID       = 1181
StateNo  = 1180
Name     = "Super-Armer"
Persistent    = 0
PauseMoveTime = 0;999999
SuperMoveTime = 0;999999

[State a];投げ無敵
type     = Nothitby
Trigger1 = Animelemtime(2) >= 0
value2   = ,AT

[State 1160, 無敵処理]
type     = NotHitBy
Trigger1 = NumHelper(1181) > 0
trigger1 = AnimelemTime(15) < 0
value    = SCA, AA, At, AP
time     = 1
ignorehitpause = 1

;-------------------------------------------------[ヒット定義]

[State 1116, HitDef]
type                = HitDef
trigger1            = AnimElem = 5
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(58*Fvar(0)), 4
getpower = 15,7
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = 4, -3
guard.velocity      = -4
air.velocity        = 4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

[State 1160, HitDef]
type                = HitDef
trigger1            = AnimElem = 8
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(58*Fvar(0)), 4
getpower = 15,7
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -4, -3
guard.velocity      = -4
air.velocity        = -4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

[State 1160, HitDef]
type                = HitDef
trigger1            = AnimElem = 11
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(58*Fvar(0)), 4
getpower = 15,7
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = 4, -3
guard.velocity      = -4
air.velocity        = 4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

[State 1160, HitDef]
type                = HitDef
trigger1            = AnimElem = 14
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(58*Fvar(0)), 4
getpower = 15,7
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -4, -3
guard.velocity      = -4
air.velocity        = -4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 10, -50
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
Persistent     = 10
IgnoreHitPause = 1

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
Persistent     = 10
IgnoreHitPause = 1

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit = 1 && Var(7) = 0
IgnoreHitPause = 1
Persistent     = 10
fvar(1)        = FVar(1) * Ifelse(fvar(2)=0,(0.70),(0.87))

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
IgnoreHitPause = 1
Persistent     = 10
fvar(1)        = FVar(1) * Ifelse(fvar(2)=0,(0.93),(0.96))

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit = 1
IgnoreHitPause = 1
Persistent     = 10
fvar(3)        = FVar(3) - 0.06

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact = 1
IgnoreHitPause = 1
Persistent     = 6
fvar(21)       = 58*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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

[State a, フラグリセット]
Type     = MoveHitReset
trigger1 = AnimElemTime(8) = -1
trigger2 = AnimElemTime(10) = 1
trigger3 = AnimElemTime(13) = 2

[State 1160, ステート変更];硬直アリ
type     = ChangeState
trigger1 = AnimElemtime(16) < 0
Trigger1 = (Pos Y >= 0)&&(Vel Y > 0)
value    = 1130
ctrl     = 0

[State 1160, ステート変更];硬直なし
type     = ChangeState
trigger1 = AnimElemtime(16) >= 0
Trigger1 = (Pos Y >= 0)&&(Vel Y > 0)
value    = 52
ctrl     = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 / ラリアットぶんぶんぶん！ - C
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1170]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 1170
sprpriority = 2

[State a]
type     = Velset
trigger1 = !time
Y        = 0

;-------------------------------------------------[演出]

[State 1170, 効果音]
type     = PlaySnd
trigger1 = Animelem = 4
Trigger2 = Animelem = 10
Trigger3 = Animelem = 16
value    = s80, 16

[State 1170, 効果音]
type     = PlaySnd
trigger1 = Animelem = 7
value    = s80, 11

[State 1170, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4031
ID       = 4031
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1170, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4032
ID       = 4031
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1170, バーニア表示]
type     = Explod
Trigger1 = Animelemtime(3) = 0
anim     = 4033
ID       = 4031
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 7
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1170, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4034
ID       = 4031
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 7
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1170, 煙エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(3) = 0
StateNo  = 11100
ID       = 11100
Name     = "Smoke-Effect"
Pos      = -55, -35
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1

[state 1170, 速度]
type     = Velset
trigger1 = Animelem = 2
X        = 1
Y        = -1

[state 1170, 速度]
type     = VelAdd
trigger1 = Animelemtime(21) >= 0
Y        = 0.45

;-------------------------------------------------[アーマー]

[State 1170, スーパーアーマー]
Type     = Helper
Trigger1 = NumHelper(1182) = 0
trigger1 = !time
PosType  = P1
Pos      = 0, 0
ID       = 1182
StateNo  = 1180
Name     = "Super-Armer"
Persistent    = 0
PauseMoveTime = 0;999999
SuperMoveTime = 0;999999

[State a];投げ無敵
type     = Nothitby
Trigger1 = Animelemtime(2) >= 0
value2   = ,AT

[State 1170, 無敵処理]
type     = NotHitBy
Trigger1 = NumHelper(1182) > 0
trigger1 = AnimelemTime(22) < 0
value    = SCA, AA, At, AP
time     = 1
ignorehitpause = 1

;-------------------------------------------------[ヒット定義]

[State 1170, HitDef]
type                = HitDef
trigger1            = AnimElem = 5
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(58*Fvar(0)), 4
getpower = 10,5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = 4, -3
guard.velocity      = -4
air.velocity        = 4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

[State 1170, HitDef]
type                = HitDef
trigger1            = AnimElem = 8
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(58*Fvar(0)), 4
getpower = 10,5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -4, -3
guard.velocity      = -4
air.velocity        = -4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

[State 1170, HitDef]
type                = HitDef
trigger1            = AnimElem = 11
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(58*Fvar(0)), 4
getpower = 10,5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = 4, -3
guard.velocity      = -4
air.velocity        = 4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

[State 1170, HitDef]
type                = HitDef
trigger1            = AnimElem = 14
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(58*Fvar(0)), 4
getpower = 10,5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -4, -3
guard.velocity      = -4
air.velocity        = -4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

[State 1170, HitDef]
type                = HitDef
trigger1            = AnimElem = 17
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(58*Fvar(0)), 4
getpower = 10,5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = 4, -3
guard.velocity      = -4
air.velocity        = 4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

[State 1170, HitDef]
type                = HitDef
trigger1            = AnimElem = 20
attr                = S, NA
hitflag             = MAFD
guardflag           = M
damage              = Floor(58*Fvar(0)), 4
getpower = 10,5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity     = -4, -3
guard.velocity      = -4
air.velocity        = -4, -3
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(30*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 10, -50
PosType  = P2
OwnPal   = 1
size.xscale = 1
size.yscale = 1
Persistent     = 10
IgnoreHitPause = 1

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
Persistent     = 10
IgnoreHitPause = 1

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit = 1 && Var(7) = 0
IgnoreHitPause = 1
Persistent     = 10
fvar(1)        = FVar(1) * Ifelse(fvar(2)=0,(0.70),(0.87))

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
IgnoreHitPause = 1
Persistent     = 10
fvar(1)        = FVar(1) * Ifelse(fvar(2)=0,(0.93),(0.96))

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit = 1
IgnoreHitPause = 1
Persistent     = 10
fvar(3)        = FVar(3) - 0.06

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact = 1
IgnoreHitPause = 1
Persistent     = 6
fvar(21)       = 58*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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

[State a, フラグリセット]
Type     = MoveHitReset
trigger1 = AnimElemTime(8) = -1
trigger2 = AnimElemTime(10) = 1
trigger3 = AnimElemTime(13) = 1
trigger4 = AnimElemTime(16) = 1
trigger5 = AnimElemTime(19) = 2

[State 1170, ステート変更];硬直アリ
type     = ChangeState
trigger1 = AnimElemtime(16) < 0
Trigger1 = (Pos Y >= 0)&&(Vel Y > 0)
value    = 1130
ctrl     = 0

[State 1170, ステート変更];硬直なし
type     = ChangeState
trigger1 = AnimElemtime(16) >= 0
Trigger1 = (Pos Y >= 0)&&(Vel Y > 0)
value    = 52
ctrl     = 0










;============================================================
; [HELPER] らりあっと / スーパーアーマー処理
;============================================================

[Statedef 1180]
Type     = A
Movetype = A
Physics  = N
Velset   = 0, 0
Ctrl     = 0

;-------------------------------------------------[ヘルパー制御]

[State 1180, 特殊効果]
type     = AssertSpecial
trigger1 = 1
flag     = Invisible
Flag2    = NoShadow

[State 1180, アニメ変更]
type     = Changeanim
trigger1 = Anim != root,Anim
value    = root,Anim
ignorehitpause = 1

[State 1180, ターン]
type     = Turn
trigger1 = Facing != root,Facing
ignorehitpause = 1

[State 1180, 座標]
type     = BindtoRoot
trigger1 = 1
pos      = 0,0
ignorehitpause = 1

[State 1180]
type     = NotHitBy
trigger1 = 1
value    = ,AT

;-------------------------------------------------[アーマー処理]

[State 1185, ダメージ処理]
type     = VarSet
trigger1 = var(0) > 0
var(0)   = 0
ignorehitpause = 1

[State 1185, ダメージ処理]
type     = Varset
trigger1 = 1
var(0)   = GetHitvar(damage)
ignorehitpause = 1

[State 1185, ダメージ処理]
type     = Varset
trigger1 = 1
var(1)   = GetHitvar(hitshaketime)
ignorehitpause = 1

[State 1185, タイムカウント]
type     = VarAdd
trigger1 = prevStateNo = 1180
var(10)  = 1
ignorehitpause = 1

[State 1180, アーマー処理]
type     = HitOverRide
trigger1 = 1
attr     = SCA, AA, AP
stateno  = 1180
ignorehitpause = 1

;-------------------------------------------------[終了]

[State 1185, ヘルパー消滅]
type       = null;DestroySelf
Trigger1   = var(10) > var(1)

[State 1180, ヘルパー消滅];A
type       = DestroySelf
TriggerAll = IsHelper(1180)
trigger1   = (root,Anim = 1100) && (root,Animelem = 10)
trigger2   = (root,Anim = 1150) && (root,Animelem = 10)
trigger3   = (root,StateNo != 1100)&&(root,StateNo != 1150)

[State 1180, ヘルパー消滅];B
type       = DestroySelf
TriggerAll = IsHelper(1181)
trigger1   = (root,Anim = 1100) && (root,Animelem = 16)
trigger2   = (root,Anim = 1150) && (root,Animelem = 16)
trigger3   = (root,StateNo != 1110)&&(root,StateNo != 1160)

[State 1180, ヘルパー消滅];C
type       = DestroySelf
TriggerAll = IsHelper(1182)
trigger1   = (root,Anim = 1120) && (root,Animelem = 22)
trigger2   = (root,Anim = 1170) && (root,Animelem = 22)
trigger3   = (root,StateNo != 1120)&&(root,StateNo != 1170)




;============================================================
; [HELPER] ラリアット / 煙エフェクト
;============================================================
[Statedef 11100]
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

[State 11100, 速度]
type     = VelSet
trigger1 = !time
X        = -1
Y        = 1

[State 11000, 速度]
type     = Velmul
trigger1 = time >= 10
X        = 0.9

;-------------------------------------------------[サイズ設定]

[State 11100, サイズ変更];墓石から
type     = AngleDraw
trigger1 = 1
scale    = 3+(Time*0.01), 3+(Time*0.01)

;-------------------------------------------------[透過設定]

[State 11100, 透過処理]
Type     = Trans
Trigger1 = 1
trans    = addalpha
Alpha    = var(1), 256

[state 11100, 変数]
type     = VarAdd
trigger1 = Time < 5
var(1)   = 51

[state 11100, 変数]
type     = VarSet
trigger1 = Time = 5
var(1)   = 255

[state 11100, 変数]
type     = VarAdd
trigger1 = Time > 10
var(1)   = -35

;-------------------------------------------------[終了]

[State 11100, ヘルパー消滅]
type = DestroySelf
trigger1 = time >= 20
trigger2 = Var(1) < 0




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 押しつぶしたるっちゅーねん！
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1200]
type     = S
movetype = A
physics  = N
ctrl     = 0
velset   = 0, 0
sprpriority = 2

;-------------------------------------------------[コマンド判定]

[state 1200, varset1];リセット
type     = VarSet
trigger1 = (!time)
Trigger1 = (PrevStateNo != 1210)&&(PrevStateNo != 1220)
var(0)   = 0

[State 1200]
type     = ChangeAnim
Trigger1 = !time
value    = 1200  + (var(0)*10)

;-------------------------------------------------[アルカナゲージ処理]

[State a, VarAdd];アルカナゲージ最大量
Type       = VarAdd
TriggerAll = Fvar(20) >= Fvar(21)
Trigger1   = !time
fvar(21)   = 15
Persistent = 0
IgnoreHitPause = 1

;-------------------------------------------------[演出]

[State 1200, 効果音]
type     = PlaySnd
trigger1 = Animelemtime(3) = 0
value    = s80, 2

[State 1200, 煙エフェクト]
Type       = Helper
TriggerAll = AnimElemtime(5) >= 0
TriggerAll = time%5 = 0
trigger1   = (var(0)=0)&&(Animelemtime(11) < 0)
trigger2   = (var(0)=1)&&(Animelemtime(14) < 0)
trigger3   = (var(0)=2)&&(Animelemtime(19) < 0)
StateNo  = 11210
ID       = 11210
Name     = "Smoke-Effect"
Pos      = -30, -50
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1

[State 1200, 速度]
type     = VelSet
Trigger1 = Animelem = 5
X        = 7

[State 1200, 速度]
type     = VelSet
Trigger1 = Animelem = 6
X        = 11

[State 1200, 減速]
type     = VelMul
Trigger1 = var(0) = 0
Trigger1 = Animelemtime(11) >= 0
Trigger2 = var(0) = 1
Trigger2 = Animelemtime(14) >= 0
Trigger3 = var(0) = 2
Trigger3 = Animelemtime(19) >= 0
X        = 0.92

[State 1200, バーニア表示]
type     = Explod
Trigger1 = AnimelemTime(3) = 0
anim     = 4035
ID       = 4035
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1

[State 1200, バーニア表示]
type     = Explod
Trigger1 = AnimelemTime(3) = 0
anim     = 4036
ID       = 4035
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1

[State 1200, バーニア表示]
type     = Explod
Trigger1 = AnimelemTime(5) = 0
anim     = 4037
ID       = 4037
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1

[State 1200, バーニア表示]
type     = Explod
Trigger1 = AnimelemTime(5) = 0
anim     = 4038
ID       = 4037
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1

[State 1200, バーニア表示]
type     = Explod
trigger1 = (var(0)=0)&&(Animelemtime(11) = 0)
trigger2 = (var(0)=1)&&(Animelemtime(14) = 0)
trigger3 = (var(0)=2)&&(Animelemtime(19) = 0)
anim     = 4039
ID       = 4039
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1

[State 1200, バーニア表示]
type     = Explod
trigger1 = (var(0)=0)&&(Animelemtime(11) = 0)
trigger2 = (var(0)=1)&&(Animelemtime(14) = 0)
trigger3 = (var(0)=2)&&(Animelemtime(19) = 0)
anim     = 4040
ID       = 4039
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1

;-------------------------------------------------[攻撃判定]

[State 1200, HitDef]
type          = HitDef
Trigger1      = AnimElem = 4
Trigger1      = P2StateNo != [150, 155]
attr          = S, ST
damage        = 0
getpower = 60,30
hitflag       = M
priority      = 3, hit
pausetime     = 2, 1
sparkno       = -1
sparkxy       = 0, 0
hitsound      = -1
guard.sparkno = -1
guardsound    = -1
P1facing      = 1
P2facing      = 1
Fall          = 0
Kill          = 0
P1StateNo     = 1230
P2stateno     = 1240
ID            = 1200

;-------------------------------------------------[エフェクト消去]

[State -2, RemoveExplod]
Type       = RemoveExplod
TriggerAll = NumExplod(4035) > 0
trigger1   = Animelemtime(5) >= 0
ID         = 4035

[State -2, RemoveExplod]
Type       = RemoveExplod
TriggerAll = NumExplod(4037) > 0
trigger1   = (var(0)=0)&&(Animelemtime(11) = 0)
trigger2   = (var(0)=1)&&(Animelemtime(14) = 0)
trigger3   = (var(0)=2)&&(Animelemtime(19) = 0)
ID         = 4037

;-------------------------------------------------[攻撃状態終了]

[State 1200, 終了]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 押しつぶしたるっちゅーねん！ / B版
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1210]
type     = S
movetype = A
physics  = S
velset   = 0, 0
ctrl     = 0
sprpriority = 2

;-------------------------------------------------[コマンド判定]

[State 1210, 変数]
type     = Varset
Trigger1 = !time
var(0)   = 0

[State 1210, 変数]
type     = Varset
Trigger1 = !time
var(0)   = 1

;-------------------------------------------------[終了]

[state 1210, ステート変更]
type     = ChangeState
trigger1 = !time
value	 = 1200
ctrl	 = 0

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 押しつぶしたるっちゅーねん！ / C版
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1220]
type     = S
movetype = A
physics  = S
velset   = 0, 0
ctrl     = 0
sprpriority = 2

;-------------------------------------------------[コマンド判定]

[State 1220, 変数]
type     = Varset
Trigger1 = !time
var(0)   = 0

[State 1220, 変数]
type     = Varset
Trigger1 = !time
var(0)   = 2

;-------------------------------------------------[終了]

[state 1220, ステート変更]
type     = ChangeState
trigger1 = !time
value	 = 1200
ctrl	 = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 押しつぶしたるっちゅーねん！ / 運送中
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1230]
type     = S
movetype = A
physics  = N
ctrl     = 0
anim     = 1230
sprpriority = 2

;-------------------------------------------------[演出]

[State 1230, 煙エフェクト]
Type     = Helper
Trigger1 = time%5 = 0
StateNo  = 11210
ID       = 11210
Name     = "Smoke-Effect"
Pos      = -30, -50
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1

[State 1230, 速度]
type     = VelSet
Trigger1 = 1
X        = 11

[State 1230, 相手制御]
type     = TargetBind
trigger1 = 1
pos      = 80, -60

[State 1230]
type     = ChangeState
trigger1 = FrontEdgeBodyDist <= 60
value    = 1231


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 押しつぶしたるっちゅーねん！ / フィニッシュ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1231]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 1231
sprpriority = 2

[State 1231, 無敵]
type     = Nothitby
trigger1 = 1
value    = SCA

[State 1231, 座標]
type     = PosAdd
trigger1 = !time
X        = -20

[State 1231, 速度]
type     = Velset
trigger1 = !time
X        = 0

[State 1231, 画面振動]
type     = EnvShake
trigger1 = !time
time     = 20
ampl     = 4

[State 1231]
type     = PlaySnd
Trigger1 = !time
value    = s80, 9

[state 1231, エフェクト]
type     = Explod
trigger1 = !time
anim     = 11200
pos      = 0, 0
Scale    = (const(size.xscale))*1.75,(const(size.xscale))*1.75
id       = 11200
bindtime = -1
IgnoreHitPause = 0
sprpriority    = 7
removeongethit = 1

[State a];ヒットスパーク
Type     = Helper
Trigger1 = !time
Name     = "hit"
Stateno  = 11200
ID       = 11200
Pos      = 90, -75
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

;-----------------------------------------[制御]

[State 1231, 相手ステート制御]
Type     = TargetState
Trigger1 = !time
value    = 1241

[State 1231, 相手ダメージ]
Type     = TargetLifeAdd
Trigger1 = !time
absolute = 1			;防御力を反映する
value    = floor(-150*fvar(0))


;-----------------------------------------[解放]

[State 1231, 速度2]
type     = Velset
trigger1 = Animelem = 2
X        = -7

[State 1231, 速度2]
type     = Velmul
trigger1 = Animelem = 4
X        = 0.2

;-------------------------------------------------[終了]

[state 1220, ステート変更]
type     = ChangeState
trigger1 = Animtime = 0
value	 = 0
ctrl	 = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 押しつぶしたるっちゅーねん！ / 空中 - 運送中
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1235]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 1235
sprpriority = 2

;-------------------------------------------------[演出]

[State 1235, 煙エフェクト]
Type      = Helper
Trigger1 = time%5 = 0
StateNo  = 11210
ID       = 11210
Name     = "Smoke-Effect"
Pos      = -70, -80
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1

[State 1235, 速度]
type     = VelSet
Trigger1 = 1
X        = 11

[State 1235, 相手制御]
type     = TargetBind
trigger1 = 1
pos      = 80, -110

[State 1235]
type     = ChangeState
trigger1 = FrontEdgeBodyDist <= 60
value    = 1236


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 押しつぶしたるっちゅーねん！ / 空中フィニッシュ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1236]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 1236
sprpriority = 2

[State 1236, 無敵]
type     = Nothitby
trigger1 = Animelemtime(6) < 0
value    = SCA,AA,AT,AP

[State 1236, 座標]
type     = PosAdd
trigger1 = !time
X        = -20

[State 1236, 速度]
type     = Velset
trigger1 = !time
X        = 0
Y        = 0

[State 1236, 画面振動]
type     = EnvShake
trigger1 = !time
time     = 20
ampl     = 4

[State 1236]
type     = PlaySnd
Trigger1 = !time
value    = s80, 9

[state 1231, エフェクト]
type     = Explod
trigger1 = !time
anim     = 11200
pos      = 0, 0
Scale    = (const(size.xscale))*1.75,(const(size.xscale))*1.75
id       = 11200
bindtime = -1
IgnoreHitPause = 0
sprpriority    = 7
removeongethit = 1

[State a];ヒットスパーク
Type     = Helper
Trigger1 = !time
Name     = "hit"
Stateno  = 11200
ID       = 11200
Pos      = 90, -75
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
IgnoreHitPause = 1
Persistent = 0

;-----------------------------------------[制御]

[State 1236, 相手ステート制御]
Type     = TargetState
Trigger1 = !time
value    = 1241

[State 1236, 相手ダメージ]
Type     = TargetLifeAdd
Trigger1 = !time
absolute = 1			;防御力を反映する
value    = floor(-150*fvar(0))


;-----------------------------------------[解放]

[State 1236, 速度]
type     = Velset
trigger1 = Animelem = 2
X        = -3
Y        = -6

[State 1236, 速度]
type     = VelAdd
trigger1 = Animelem = 2, >= 0
Y        = 0.42

;-------------------------------------------------[終了]

[State 1236]
type     = Ctrlset
Trigger1 = Animelem = 7
value    = 1


[state 1236, ステート変更]
type     = ChangeState
trigger1 = (Vel Y > 0)&&(Pos Y >= 0)
value	 = 52
ctrl	 = 0



;==================================================
; [ENEMY] 相手 / 運送くらい
;==================================================
[Statedef 1240]
Type     = A
MoveType = H
PhySics  = N
VelSet   = 0, 0
Sprpriority = -1

[State 1240, NotHitBy];邪魔されない
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 1240]
type     = turn
Trigger1 = !time
trigger1 = facing = enemy,facing

[State 1240, 相手アニメ変更]
type     = ChangeAnim2
Trigger1 = !Time
value    = 1240

[State 1240];もしものために 
Type     = SelfState
Trigger1 = Time>= 600
value    = 5210


;==================================================
; [ENEMY] 相手 / 運送-壁に衝突
;==================================================

[Statedef 1241]
type     = A
movetype = H
physics  = N
velset   = 0, 0
sprpriority = 1

[State 1241];相手のアニメをこちらで指定
type     = ChangeAnim2
Trigger1 = Time = 0
value    = 1241

;-------------------------------------------------[特殊な状態]

[State a];カメラ固定
type     = ScreenBound
trigger1 = 1
value    = 1
movecamera = 1

;-------------------------------------------------[ステート変更]

[state a] ;バウンドして落下へ
type     = changestate
trigger1 = animtime = 0
value    = 1242


;==================================================
; [ENEMY] 相手 / 運送-解放
;==================================================

[Statedef 1242]
type     = A
movetype = H
physics  = N
sprpriority = 1

[State 1242];相手のアニメ変更
type     = ChangeAnim
Trigger1 = Time = 0
value    = 5050

;-------------------------------------------------[移動]

[State a]
type = turn
trigger1 = time = 0

[State a]
type = VelSet
trigger1 = time = 0
x = -2
y = -4.2

[state a]
type     = Veladd
trigger1 = Time > 0
Y        = 0.38

;-------------------------------------------------[特殊な状態]

[State a];カメラ固定
type = screenbound
trigger1 = 1
value = 1
movecamera = 1

[State a] 
type       = SelfState
triggerall = time >= 30
Trigger1   = Canrecover
trigger1   = command = "recovery"
value      = 5210

[State a, SelfState];ステートを返す 
type       = SelfState
triggerall = Vel Y > 0
trigger1   = Pos Y >= 0
value      = 5100


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 / 押しつぶしたるっちゅーねん！
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1250]
type     = A
movetype = A
physics  = N
ctrl     = 0
velset   = 0, 0
sprpriority = 2

[State 1250]
type     = VarSet
trigger1 = !time
var(10)  = 1

;-------------------------------------------------[コマンド判定]

[state 1250, varset1];リセット
type     = VarSet
trigger1 = (!time)
Trigger1 = (PrevStateNo != 1260)&&(PrevStateNo != 1270)
var(0)   = 0

[State 1250]
type     = ChangeAnim
Trigger1 = !time
value    = 1250  + (var(0)*10)

;-------------------------------------------------[アルカナゲージ処理]

[State a, VarAdd];アルカナゲージ最大量
Type       = VarAdd
TriggerAll = Fvar(20) >= Fvar(21)
Trigger1   = !time
fvar(21)   = 15
Persistent = 0
IgnoreHitPause = 1

;-------------------------------------------------[演出]

[State 1250, 効果音]
type     = PlaySnd
trigger1 = Animelemtime(3) = 0
value    = s80, 2

[State 1250, 速度]
type     = VelSet
Trigger1 = Animelem = 3
X        = 7

[State 1250, 速度]
type     = VelSet
Trigger1 = Animelem = 4
X        = 9

[State 1250, 重力]
type     = VelAdd
Trigger1 = (var(0)=0)&&(Animelemtime(8) > 0)
Trigger2 = (var(0)=1)&&(Animelemtime(12) > 0)
Trigger3 = (var(0)=2)&&(Animelemtime(16) > 0)
Y        = 0.4

[State 1200, 煙エフェクト]
Type       = Helper
TriggerAll = AnimElemtime(3) >= 0
TriggerAll = time%5 = 0
trigger1   = (var(0)=0)&&(Animelemtime(11) < 0)
trigger2   = (var(0)=1)&&(Animelemtime(14) < 0)
trigger3   = (var(0)=2)&&(Animelemtime(19) < 0)
StateNo  = 11210
ID       = 11210
Name     = "Smoke-Effect"
Pos      = -70, -80
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1

[State 1250, バーニア表示]
type     = null;Explod
Trigger1 = AnimelemTime(3) = 0
anim     = 4035
ID       = 4035
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1

[State 1250, バーニア表示]
type     = null;Explod
Trigger1 = AnimelemTime(3) = 0
anim     = 4036
ID       = 4035
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1

;-------------------------------------------------[攻撃判定]

[State 1250, HitDef]
type          = HitDef
Trigger1      = AnimElem = 3
Trigger1      = P2StateNo != [150, 155]
attr          = A, ST
damage        = 0
getpower = 60,30
hitflag       = A
priority      = 3, hit
pausetime     = 2, 1
sparkno       = -1
sparkxy       = 0, 0
hitsound      = -1
guard.sparkno = -1
guardsound    = -1
P1facing      = 1
P2facing      = 1
Fall          = 0
Kill          = 0
P1StateNo     = 1235
P2stateno     = 1240
ID            = 1200

;-------------------------------------------------[エフェクト消去]

[State -2, RemoveExplod]
Type       = RemoveExplod
TriggerAll = NumExplod(4035) > 0
trigger1   = Animelemtime(5) >= 0
ID         = 4035

[State -2, RemoveExplod]
Type       = RemoveExplod
TriggerAll = NumExplod(4037) > 0
trigger1   = (var(0)=0)&&(Animelemtime(11) = 0)
trigger2   = (var(0)=1)&&(Animelemtime(14) = 0)
trigger3   = (var(0)=2)&&(Animelemtime(19) = 0)
ID         = 4037

;-------------------------------------------------[終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State a, CtrlSet];行動可能に
type     = CtrlSet
trigger1 = (var(0)=0)&&(AnimElem = 15)
trigger2 = (var(0)=1)&&(AnimElem = 19)
trigger3 = (var(0)=2)&&(AnimElem = 23)
value    = 1

[State 1250, ステート変更];硬直アリ
type       = ChangeState
TriggerAll = (Pos Y >= 0)&&(Vel Y > 0)
trigger1   = (var(0)=0)&&(AnimElemtime(15) < 0)
trigger2   = (var(0)=1)&&(AnimElemtime(19) < 0)
trigger3   = (var(0)=2)&&(AnimElemtime(23) < 0)
value      = 1280
ctrl       = 0

[State 1250, ステート変更];硬直なし
type       = ChangeState
TriggerAll = (Pos Y >= 0)&&(Vel Y > 0)
trigger1   = (var(0)=0)&&(AnimElemtime(15) >= 0)
trigger2   = (var(0)=1)&&(AnimElemtime(19) >= 0)
trigger3   = (var(0)=2)&&(AnimElemtime(23) >= 0)
value      = 52
ctrl       = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 押しつぶしたるっちゅーねん！ / JB版
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1260]
type     = S
movetype = A
physics  = S
velset   = 0, 0
ctrl     = 0
sprpriority = 2

;-------------------------------------------------[コマンド判定]

[State 1260, 変数]
type     = Varset
Trigger1 = !time
var(0)   = 0

[State 1260, 変数]
type     = Varset
Trigger1 = !time
var(0)   = 1

;-------------------------------------------------[終了]

[state 1260, ステート変更]
type     = ChangeState
trigger1 = !time
value	 = 1250
ctrl	 = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 押しつぶしたるっちゅーねん！ / JC版
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1270]
type     = S
movetype = A
physics  = S
velset   = 0, 0
ctrl     = 0
sprpriority = 2

;-------------------------------------------------[コマンド判定]

[State 1270, 変数]
type     = Varset
Trigger1 = !time
var(0)   = 0

[State 1270, 変数]
type     = Varset
Trigger1 = !time
var(0)   = 2

;-------------------------------------------------[終了]

[state 1270, ステート変更]
type     = ChangeState
trigger1 = !time
value	 = 1250
ctrl	 = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中運送 / 着地硬直
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[StateDef 1280]
Type     = S
Movetype = I
Physics  = S
velset   = 0, 0
Anim     = 1280
ctrl     = 0

[State 1280, 振り向き]
type     = Turn
trigger1 = Animtime = 0
trigger1 = P2dist X < 0

[State 1280, 接地]
type     = PosSet
trigger1 = Time = 0
Y        = 0

[State 1280, 効果音]
type     = PlaySnd
trigger1 = Time = 0
value    = s80, 9

[State 1280, 画面振動]
type     = EnvShake
trigger1 = AnimElem = 2
time     = 10
ampl     = 4

[State 1820, 煙エフェクト]
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

[State 1280, 煙エフェクト]
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

[State 1280, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;============================================================
;[helper] 専用ヒットエフェクト / どないや
;============================================================
[statedef 11200]
Physics     = N
Anim        = 7020
SprPriority = 9

[State 11200, 透過]
Type     = Trans
Trigger1 = 1
Trans    = Add

[State 11200]
Type     = AssertSpecial
Trigger1 = 1
Flag     = NoShadow

;-------------------------------[角度設定]

[State 7020, 通常]
type     = Varset
Trigger1 = !time
var(0)   = 0

[State 7020]
Type     = AngleSet
Trigger1 = 1
Value    = Var(0)

[State 7020]
Type     = AngleDraw
Trigger1 = 1
Scale    = 1.25, 1.25

;-------------------------------

[State 7020, サークル]
type       = Explod
trigger1   = time = 0
anim       = 7021
ID         = 1
postype    = P1
pos        = 20, 0
random     = 0, 0
scale      = 0.5, 0.5
vel        = 0, 0
sprpriority    = 8
bindtime       = -1
removeongethit = 1

[State a];エフェクト管理
type     = ModifyExplod
trigger1 = Numexplod(1) = 1
ID       = 1
Trans    = Addalpha
alpha    = 256-var(1), 256
Scale    = 0.75+0.015*(time), 0.75+0.015*(time)

[State a];エフェクト管理2
type     = Varadd
trigger1 = 1
var(1)   = 18

[state 7020, ヘルパー]  ;線エフェクト
type       = Helper
trigger1   = time = 0
id         = 10
name       = "Effect"
pos        = 0, 0
postype    = p1
stateno    = 7010
helpertype = normal
keyctrl    = 0 
ownpal     = 1
persistent     = 0
ignorehitpause = 1

[state 7020, ヘルパー]
type       = Helper
trigger1   = time = 0
id         = 10
name       = "Effect"
pos        = 0, 0
postype    = p1
stateno    = 7021
helpertype = normal
keyctrl    = 0 
ownpal     = 1
persistent     = 0
ignorehitpause = 1

;--------------------------------[終了]

[State 7020]
Type     = DestroySelf
Trigger1 = animTime =0

;============================================================
; [HELPER] 押しつぶしたるっちゅーねん！ / 煙エフェクト
;============================================================
[Statedef 11210]
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

[State 11210, 速度]
type     = VelSet
trigger1 = !time
X        = -1

[State 11210, 速度]
type     = Velmul
trigger1 = time = 8
X        = 0.9

;-------------------------------------------------[サイズ設定]

[State 11210, サイズ変更]
type     = AngleDraw
trigger1 = 1
scale    = 1.2+(Time*0.03), 1.2+(Time*0.03)

;-------------------------------------------------[透過設定]

[State 11210, 透過処理]
Type     = Trans
Trigger1 = 1
trans    = addalpha
Alpha    = var(1), 256

[state 11210, 変数]
type     = VarAdd
trigger1 = Time < 5
var(1)   = 51

[state 11210, 変数]
type     = VarSet
trigger1 = Time = 15
var(1)   = 255

[state 11210, 変数]
type     = VarAdd
trigger1 = Time > 15
var(1)   = -15

;-------------------------------------------------[終了]

[State 11210, ヘルパー消滅]
type = DestroySelf
trigger1 = time >= 30
trigger2 = Var(1) < 0




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; せくしーきゅーとなヒップでドン！
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1300]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 1300
sprpriority = 2

[State 1300, リセット]
Type     = VarSet
Trigger1 = !time
var(0)   = 0

;-------------------------------------------------[アルカナゲージ処理A]

[State a, VarAdd];アルカナゲージ最大量
Type       = VarAdd
TriggerAll = Fvar(20) >= Fvar(21)
Trigger1   = !time
fvar(21)   = 15
Persistent = 0
IgnoreHitPause = 1

;-------------------------------------[演出]

[State 1300]
type     = PlaySnd
Trigger1 = !time
Value    = s80, 24

[State 1300, 速度]
type     = Velset
trigger1 = !time
X        = 2
Y        = -4

[State 1300, 速度]
type     = VelAdd
trigger1 = Animelemtime(3) >= 0
Y        = 0.5

[state 1300, エフェクト]
type     = Explod
trigger1 = Animelem = 5
anim     = 11305
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 11305
bindtime = -1
sprpriority    = 8
Persistent     = 0
IgnoreHitPause = 0
removeongethit = 1

[State 1300, バーニア表示]
type     = Explod
Trigger1 = Animelem = 3
anim     = 4041
ID       = 4040
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1

[State 1300, バーニア表示]
type     = Explod
Trigger1 = Animelem = 4
anim     = 4042
ID       = 4040
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
removetime = -1
sprpriority = 9
RemoveOnGetHit = 1

[State 1300, バーニア表示]
type     = Explod
Trigger1 = Animelem = 3
anim     = 4043
ID       = 4040
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1

[State 1300, バーニア表示]
type     = Explod
Trigger1 = Animelem = 5
anim     = 4044
ID       = 4040
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
removetime = -1
sprpriority = 8
RemoveOnGetHit = 1

[State 1300, バックファイア]
Type     = Helper
Trigger1 = !time
StateNo  = 11300
ID       = 11300
Name     = "Fire-Effect"
Pos      = -80, -32
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1
Persistent     = 0

[State 1300, バックファイア]
Type     = Helper
Trigger1 = !time
StateNo  = 11300
ID       = 11301
Name     = "Fire-Effect"
Pos      = -25, -50
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1
Persistent     = 0

;-----------------------------------------------[アーマー処理]

[State 1300, スーパーアーマー]
Type     = Helper
Trigger1 = NumHelper(1380) = 0
trigger1 = Animelemtime(5) = 0
PosType  = P1
Pos      = 0, 0
ID       = 1380
StateNo  = 1380
Name     = "Super-Armer"
Persistent    = 0
PauseMoveTime = 0;999999
SuperMoveTime = 0;999999

[State 1300, 無敵処理]
type     = NotHitBy
Trigger1 = NumHelper(1380) > 0
trigger1 = AnimelemTime(5) >= 0
value    = SCA, AA, At, AP
time     = 1
ignorehitpause = 1

;-------------------------------------------------[ヒット定義]

[State 1300, HitDef];ヒップ
type                = HitDef
trigger1            = AnimElem = 6
attr                = S, NA
hitflag             = MAFD
guardflag           = HA
damage              = Floor(133*Fvar(0)), 4
getpower = 30,15
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(9*(1+0.5*var(7))), floor(8*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 3
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 22
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28

ground.velocity     = -0.1, 12
guard.velocity      = -5
air.velocity        = -0.1, 12
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(20*FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42

[State a, VarSet];ヒット判定
Type           = VarSet
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
var(0)         = 1

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7020
ID       = 1300
Pos      = 10, -50
PosType  = P2
OwnPal   = 1
size.xscale = 1.1
size.yscale = 1.1
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
Trigger1       = ((MoveHit = 1)&&(MoveHit))
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

[State a, 床バウンド]
type           = TargetState
TriggerAll     = NumTarget > 0
trigger1       =(MoveHit=1) && target,ishelper = 0
value          = 8070
persistent     = 0
ignorehitpause = 1

;-------------------------------------------------[攻撃状態終了]

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State a, ChangeState];着地硬直A
type     = ChangeState
trigger1 = Var(0) = 0 ;ヒットしていない
trigger1 = (Vel Y > 0)&&(Pos Y >= 0)
value    = 1305
ctrl     = 0

[State a, ステート変更]
type     = ChangeState
trigger1 = var(0) = 1 ;ヒットした
trigger1 = (Vel Y > 0)&&(Pos Y >= 0)
value    = 1306
ctrl     = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; せくしーきゅーとなヒップでドン！ / 着地硬直-ミス
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[StateDef 1305]
Type     = S
Movetype = A
Physics  = N
velset   = 0, 0
Anim     = 1305
ctrl     = 0

;---------------------------------[エフェクト消去]

[State 1305]
type     = RemoveExplod
Trigger1 = !time
Id       = 11305

;---------------------------------

[State 1305, 無敵]
type     = Nothitby
Trigger1 = 1
value    = ,AT

[State 1305, 接地]
type     = PosSet
trigger1 = Time = 0
Y        = 0

[State 1305, 効果音]
type     = PlaySnd
trigger1 = Time = 0
trigger2 = Animelem = 6
value    = s80, 9

[State 1305, 画面振動]
type     = EnvShake
trigger1 = AnimElem = 2
time     = 15
ampl     = 4

[state 1305, エフェクト]
type     = Explod
trigger1 = Time = 1
anim     = 11300
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 11300
sprpriority    = 8
IgnoreHitPause = 0
removeongethit = 1

[state 1305, エフェクト]
type     = Explod
trigger1 = Time = 2
anim     = 11301
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 11300
sprpriority    = 8
IgnoreHitPause = 0
removeongethit = 1

;-------------------------------------------------[ヒット定義]

[State 1305, HitDef]
type                = HitDef
trigger1            = AnimElem = 2
attr                = C, SA
hitflag             = MAFD
guardflag           = LA
damage              = Floor(133*Fvar(0)), 4
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
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28
ground.velocity     = 0, -3
guard.velocity      = -4
air.velocity        = 0, -3
airguard.velocity   = -2, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(56*FVar(3))+(floor(10*(1+1*var(7))))
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
Persistent     = 1
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.83)

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 1
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

;----------------------------------------[バウンド]

[State 1305, 状態変更]
type      = StatetypeSet
Trigger1  = time = 5
Statetype = A
Movetype  = H

[State 1305]
type     = Velset
trigger1 = Animelem = 4
X = 1.5
Y = -2.5

[State 1305]
type     = VelAdd
trigger1 = Animelem = 4, >= 0
Trigger1 = Animelem = 6, < 0
Y = 0.3

[State 1305]
type     = Velset
trigger1 = Pos Y > 0
Y = 0

;----------------------------------------[ダウン～リバーサル]

[State 1305]
type     = Velset
trigger1 = Animelem = 6
X = 0
Y = 0

[State 1305, 接地]
type     = PosSet
trigger1 = Animelem = 6
Y        = 0

[State 1305, 状態変更]
type      = StatetypeSet
Trigger1  = Animelem = 6
Statetype = L
Movetype  = H

[State 1305, 状態変更]
type      = StatetypeSet
Trigger1  = Animelem = 7
Statetype = S
Movetype  = I

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

[State 1305, 振り向き]
type     = Turn
trigger1 = Animtime = 0
trigger1 = P2dist X < 0

[State 1135, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; せくしーきゅーとなヒップ / 着地硬直-ヒット
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[StateDef 1306]
Type     = S
Movetype = I
Physics  = S
velset   = 0, 0
Anim     = 1306
ctrl     = 0

;---------------------------------[エフェクト消去]

[State 1305]
type     = RemoveExplod
Trigger1 = !time
Id       = 11305

;---------------------------------

[State 1306, 振り向き]
type     = Turn
trigger1 = Animtime = 0
trigger1 = P2dist X < 0

[State 1306, 接地]
type     = PosSet
trigger1 = Time = 0
Y        = 0

[State 1306, 効果音]
type     = PlaySnd
trigger1 = Time = 0
value    = s80, 9

[State 1306, 煙エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(2) = 1
StateNo  = 11310
ID       = 11310
Name     = "Smoke-Effect"
Pos      = 0, 0
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1
Persistent     = 0

[State 1306, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;============================================================
; [HELPER] せくしーなヒップ / スーパーアーマー処理
;============================================================

[Statedef 1380]
Type     = A
Movetype = A
Physics  = N
Velset   = 0, 0
Ctrl     = 0

;-------------------------------------------------[ヘルパー制御]

[State 1380, 特殊効果]
type     = AssertSpecial
trigger1 = 1
flag     = Invisible
Flag2    = NoShadow

[State 1380, アニメ変更]
type     = Changeanim
trigger1 = Anim != root,Anim
value    = root,Anim
ignorehitpause = 1

[State 1380, ターン]
type     = Turn
trigger1 = Facing != root,Facing
ignorehitpause = 1

[State 1380, 座標]
type     = BindtoRoot
trigger1 = 1
pos      = 0,0
ignorehitpause = 1

[State 1380]
type     = NotHitBy
trigger1 = 1
value    = ,AT

;-------------------------------------------------[アーマー処理]

[State 1385, ダメージ処理]
type     = VarSet
trigger1 = var(0) > 0
var(0)   = 0
ignorehitpause = 1

[State 1385, ダメージ処理]
type     = Varset
trigger1 = 1
var(0)   = GetHitvar(damage)
ignorehitpause = 1

[State 1385, ダメージ処理]
type     = Varset
trigger1 = 1
var(1)   = GetHitvar(hitshaketime)
ignorehitpause = 1

[State 1385, タイムカウント]
type     = VarAdd
trigger1 = prevStateNo = 1380
var(10)  = 1
ignorehitpause = 1

[State 1380, アーマー処理]
type     = HitOverRide
trigger1 = 1
attr     = SCA, AA, AP
stateno  = 1380
ignorehitpause = 1

;-------------------------------------------------[終了]

[State 1385, ヘルパー消滅]
type       = DestroySelf
Trigger1   = var(10) > 5

[State 1380, ヘルパー消滅]
type       = DestroySelf
TriggerAll = IsHelper(1380)
trigger1   = (root,StateNo != 1300)






;============================================================
;[helper] せくしーきゅーとなヒップ / バックファイア
;============================================================
[statedef 11300]
Physics     = N
Movetype    = A
Anim        = 11310
SprPriority = -1

[State 11300, 透過]
Type     = Trans
Trigger1 = 1
Trans    = Add

[State 11300]
type     = BindtoParent
Trigger1 = IsHelper(11300)
pos      = -70, -40

[State 11300]
type     = BindtoParent
Trigger1 = IsHelper(11301)
pos      = -15, -45

[State 11300]
Type     = AssertSpecial
Trigger1 = 1
Flag     = NoShadow

[State 11300]
Type     = AngleSet
Trigger1 = 1
Value    = -160

[State 11300]
Type     = AngleDraw
Trigger1 = 1
Scale    = 0.75, 0.5

;-------------------------------------------------[ヒット定義]

[State 11300, HitDef]
type                = HitDef
trigger1            = (MoveType = A) && (!MoveContact) && (!MoveReversed)
attr                = A, SP
hitflag             = MAFD
guardflag           = MA
damage              = Floor(100*root,Fvar(0)), 4
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 0, floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 3
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 22
guard.hittime       = 22
guard.ctrltime      = 24
air.guard.slidetime = 26
air.guard.hittime   = 26
air.guard.ctrltime  = 28
ground.velocity     = -1, 12
guard.velocity      = -6
air.velocity        = -1, 12
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(20*root,FVar(3))+(floor(9*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0
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
ID       = 629
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
fvar(1)        = root,FVar(1) * (0.83)

[State a, VarSet];連続ヒット補正
Type           = ParentVarSet
Trigger1       = MoveHit && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = root,FVar(1) * (0.96)

[State a, VarSet];復帰不能補正
Type           = parentVarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = root,FVar(3) * 0.92

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = ParentVarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = MoveContact
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 100*ifelse(MoveHit, 0.66, 0.275)*ifelse(root,var(15)=1, 1.1, 1)

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

;--------------------------------[終了]

[State 7020]
Type     = DestroySelf
Trigger1 = animTime =0


;============================================================
; [HELPER] せくしーきゅーとなヒップ / 煙エフェクト
;============================================================
[Statedef 11310]
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

[State 11310, 速度]
type     = VelSet
trigger1 = !time
Y        = -0.1

[State 11310, 速度]
type     = Velmul
trigger1 = time >= 10
X        = 0.9

;-------------------------------------------------[サイズ設定]

[State 11310, サイズ変更];墓石から
type     = AngleDraw
trigger1 = 1
scale    = 2+(Time*0.01), 2+(Time*0.01)

;-------------------------------------------------[透過設定]

[State 11300, 透過処理]
Type     = Trans
Trigger1 = 1
trans    = addalpha
Alpha    = var(1), 256

[state 11310, 変数]
type     = VarAdd
trigger1 = Time < 5
var(1)   = 51

[state 11310, 変数]
type     = VarSet
trigger1 = Time = 5
var(1)   = 255

[state 11310, 変数]
type     = VarAdd
trigger1 = Time > 10
var(1)   = -35

;-------------------------------------------------[終了]

[State 11310, ヘルパー消滅]
type = DestroySelf
trigger1 = time >= 20
trigger2 = Var(1) < 0







;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 滞空制御も完璧やでー！ / 開始
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1400]
type     = A
movetype = I
physics  = N
Anim     = 1400
ctrl     = 0
sprpriority = 2

[state 1400, 速度]
type     = velset
trigger1 = !time
X        = 0
Y        = 0

[state 1400, 速度]
type     = velset
trigger1 = !time
Y        = -3

;-------------------------------------------------[演出]

[State 1400, 効果音]
type     = PlaySnd
trigger1 = !time
value    = s80, 1

[State 1400, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4045
ID       = 4045
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1400, バーニア表示]
type     = Explod
Trigger1 = !time
anim     = 4046
ID       = 4045
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1400, バーニア表示]
type     = Explod
Trigger1 = Animelemtime(2) = 0
anim     = 4047
ID       = 4045
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 5
IgnoreHitPause = 0
RemoveOnGetHit = 1

;-------------------------------------------------[攻撃状態終了]

[State 1400, タイムカウント]
type     = VarSet
Trigger1 = !time
var(0)   = 0

[State 1400, タイムカウント]
type     = VarAdd
Trigger1 = 1
var(0)   = 1

[State 1400, 終了]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 1410




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 滞空制御も完璧やでー！ / ホバリング中
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 1410]
type     = A
movetype = I
physics  = N
Anim     = 1401
ctrl     = 0
sprpriority = 2

[state 1400, 速度]
type     = velmul
trigger1 = !time
Y        = 0.5

[State 1410, アニメ変更];F
type     = Changeanim
trigger1 = Anim != 1401
Trigger1 = Vel X = 0
value    = 1401

[State 1410, アニメ変更];F
type     = Changeanim
trigger1 = Anim != 1402
Trigger1 = Vel X > 0
value    = 1402

[State 1410, アニメ変更];B
type     = Changeanim
trigger1 = Anim != 1403
Trigger1 = Vel X < 0
value    = 1403


[State 1410, バーニア表示];ニュートラル
type     = Explod
Trigger1 = Anim = 1401
Trigger1 = NumExplod(4048) = 0
anim     = 4048
ID       = 4048
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
removetime = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1410, バーニア表示];ニュートラル
type     = Explod
Trigger1 = Anim = 1401
Trigger1 = NumExplod(4049) = 0
anim     = 4049
ID       = 4049
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
removetime = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1410, バーニア表示];Front
type     = Explod
Trigger1 = Anim = 1402
Trigger1 = NumExplod(4050) = 0
anim     = 4050
ID       = 4050
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
removetime = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1410, バーニア表示];Front
type     = Explod
Trigger1 = Anim = 1402
Trigger1 = NumExplod(4051) = 0
anim     = 4051
ID       = 4051
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
removetime = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1


[State 1410, バーニア表示];back
type     = Explod
Trigger1 = Anim = 1403
Trigger1 = NumExplod(4052) = 0
anim     = 4052
ID       = 4052
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
removetime = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 1410, バーニア表示];back
type     = Explod
Trigger1 = Anim = 1403
Trigger1 = NumExplod(4053) = 0
anim     = 4053
ID       = 4053
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
removetime = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

;----------------------------------------------[移動]

[State 1400, Veladd]
Type     = VelSet
Trigger1 = !time
y        = 0.5

[State 1410, Veladd];左右舵取り
Type     = Veladd
Trigger1 = 1
Trigger1 = Command = "holdback"
x        = -0.1

[State 1410, Veladd];左右舵取り
Type     = Veladd
Trigger1 = 1
Trigger1 = Command = "holdfwd"
x        = 0.1

;-----------------------------------------[終了]

[State 1410, タイムカウント]
type     = VarAdd
Trigger1 = 1
var(0)   = 1

[State 1410, 時間終了]
Type     = ChangeState
Trigger1 = var(0) >= 108
Value    = 51
Ctrl     = 1

[State 1410, ステート変更];着地
Type     = ChangeState
Trigger1 = (Pos Y >= 0) && (Vel Y > 0)
Value    = 52
Ctrl     = 0
