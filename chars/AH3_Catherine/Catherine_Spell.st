;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
; 超必殺技ステート
;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ミサイルぎょーさん発射やでー！
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2000]
Type     = S
MoveType = A
Physics  = S
Ctrl     = 0
velset   = 0, 0
Anim     = 2000
SprPriority = 2

;-------------------------------------------------[キャンセル補正]

[State a, 変数]  ;Chain spell補正
Type           = VarAdd
triggerAll     = Numenemy > 0
Trigger1       = !time
Trigger1       = (Enemynear,Movetype = H)
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = (1.0 - fvar(3))*0.3

;-----------------------------------------------------[ゲージ管理]

[State 2000, ゲージ減少]
Type           = varAdd
Trigger1       = !time
Persistent     = 0
IgnoreHitPause = 1
fvar(20)       = -1000

[State 2000, ゲージ回復抑制]
Type           = varset
Trigger1       = fvar(22) < 120
IgnoreHitPause = 1
fvar(22)       = 120

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = time = 0
value    = s5, 0

[State a, 暗転処理]
type     = SuperPause
trigger1 = time = 0
darken   = 0
anim     = -1
sound    = -1
time     = 45
movetime = 45
P2DefMul = 1

[state a, nothitby]
type     = nothitby
trigger1 = Time <= 46	;暗転+1F
value    = SCA,AA,AT,AP
time     = 1
ignorehitpause = 1

;--------------------------------------------------[エフェクト]

[State a];カットイン
Type = Helper
Trigger1 = !time
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = -140,0
PosType = back
StateNo = 10000
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

[State a];暗転処理
Type = Helper
Trigger1 = !time
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = 32, -141
PosType = P1
StateNo = 8800
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1


;=================================================================
;  |ここから攻撃ステート|
;=================================================================

[state 2000, エフェクト];アーム表示
type     = Explod
trigger1 = AnimelemTime(5) = 0
anim     = 2001
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 2001
bindtime = -1
sprpriority    = -1
IgnoreHitPause = 0
removeongethit = 1

[State 2000, 弾幕] ;ミサイル1
type        = Helper
trigger1    = AnimelemTime(5) = 12
name        = "Skill-miso"
ID          = 1200
postype     = P1
pos         = 80, -50
Stateno     = 12000
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

[State 2000, 弾幕] ;ミサイル2
type        = Helper
trigger1    = AnimelemTime(5) = 12
name        = "Skill-miso"
ID          = 1201
postype     = P1
pos         = 85, -100
Stateno     = 12000
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

[State 2000, 弾幕] ;ミサイル3
type        = Helper
trigger1    = AnimelemTime(5) = 12
name        = "Skill-miso"
ID          = 1202
postype     = P1
pos         = 80, -140
Stateno     = 12000
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

;-------------------------------------------------[攻撃状態終了]

[State 2000, 終了]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1




;============================================================
; [Helper]  ミサイル / 爆発前
;============================================================

[Statedef 12000]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 9999
velset   = 0, 0
sprpriority = 9

[State 12000, 煙エフェクト]
Type     = Helper
trigger1 = !time
StateNo  = 10105
ID       = 1000
Name     = "Smoke-Effect"
Pos      = 0, 0
PosType  = P1
Ownpal   = 1
size.xscale = 0.75
size.yscale = 0.75
IgnoreHitPause = 1
Persistent     = 0

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

;-------------------------------------------------[爆発1]

;爆心地はランダム

[State 12000]
type     = VarRandom
Trigger1 = 1
v        = 10
range    = -45, 45

[State 12000]
type     = VarRandom
Trigger1 = 1
v        = 11
range    = -40, 40

[State 12000, 効果音]
type     = PlaySnd
trigger1 = Time = 0
trigger2 = Time = 10
trigger3 = Time = 20
value    = s80, 28
channel  = 2

[State 12000, 効果音]
type     = PlaySnd
trigger1 = time = 0
value    = s80, 17

[State 12000, 弾幕]
type        = Helper
TriggerAll  = IsHelper(1200)
trigger1    = Time = 0
trigger2    = Time = 5
trigger3    = Time = 10
trigger4    = Time = 15
trigger5    = Time = 20
name        = "Spell-missoA"
ID          = 12010
postype     = P1
pos         = Var(10), Var(11)
Stateno     = 12010
size.xscale = 1
size.yscale = 1
ownpal      = 1
ignorehitpause = 1

;-------------------------------------------------[爆発2]

;爆心地はランダム

[State 12000]
type     = VarRandom
Trigger1 = 1
v        = 20
range    = -40, 40

[State 12000]
type     = VarRandom
Trigger1 = 1
v        = 21
range    = -30, 30

[State 12000, 効果音]
type     = PlaySnd
trigger1 = time = 25
value    = s80, 17

[State 12000, 効果音]
type     = PlaySnd
trigger1 = Time = 25
trigger2 = Time = 35
trigger3 = Time = 45
value    = s80, 28
channel  = 2

[State 12000, 弾幕]
type        = Helper
TriggerAll  = IsHelper(1201)
trigger1    = Time = 25
trigger2    = Time = 30
trigger3    = Time = 35
trigger4    = Time = 40
trigger5    = Time = 45
name        = "Spell-missoB"
ID          = 12010
postype     = P1
pos         = Var(20), Var(21)
Stateno     = 12010
size.xscale = 1
size.yscale = 1
ownpal      = 1
ignorehitpause = 1

;-------------------------------------------------[爆発3]

;爆心地はランダム

[State 12000]
type     = VarRandom
Trigger1 = 1
v        = 30
range    = -40, 40

[State 12000]
type     = VarRandom
Trigger1 = 1
v        = 31
range    = -30, 30

[State 12000, 効果音]
type     = PlaySnd
trigger1 = time = 50
value    = s80, 17

[State 12000, 効果音]
type     = PlaySnd
trigger1 = Time = 50
trigger2 = Time = 60
trigger3 = Time = 70
value    = s80, 28
channel  = 2

[State 12000, 弾幕]
type        = Helper
TriggerAll  = IsHelper(1202)
trigger1    = Time = 50
trigger2    = Time = 55
trigger3    = Time = 60
trigger4    = Time = 65
trigger5    = Time = 70
name        = "Spell-missoC"
ID          = 12010
postype     = P1
pos         = Var(30), Var(31)
Stateno     = 12010
size.xscale = 1
size.yscale = 1
ownpal      = 1
ignorehitpause = 1

;-------------------------------------------------[終了]

[state a, 終了]
type     = destroyself
trigger1 = IsHelper(1200) && (Statetime >= 25)
trigger2 = IsHelper(1201) && (Statetime >= 45)
trigger3 = IsHelper(1202) && (Statetime >= 75)




;============================================================
; [Helper] ミサイル-炸裂
;============================================================

[Statedef 12010]
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

[state 12010, HitDef]
type              = HitDef
Trigger1          = 1
attr              = S, HP
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
down.velocity     = -9, 0
down.hittime      = 15
down.bounce       = 0
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

[State 12010, 補正制御用]
Type           = Projectile
Trigger1       = (Movehit = 1)&&(Var(7)=0)
ProjID         = 12000
ProjAnim       = 0;9999
ProjRemoveTime = 0
Persistent     = 0
IgnoreHitPause = 1
SuperMoveTime  = 99999
PauseMoveTime  = 99999

[State 12010, 補正制御用]
Type           = Projectile
Trigger1       = (Movehit = 1)&&(Var(7)=1)
ProjID         = 12001
ProjAnim       = 0;9999
ProjRemoveTime = 0
Persistent     = 0
IgnoreHitPause = 1
SuperMoveTime  = 99999
PauseMoveTime  = 99999

[State 12010, 補正制御用];ガード
Type           = Projectile
Trigger1       = (Moveguarded = 1)
ProjID         = 12010
ProjAnim       = 0;9999
ProjRemoveTime = 0
Persistent     = 0
IgnoreHitPause = 1
SuperMoveTime  = 99999
PauseMoveTime  = 99999

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

[state a, 終了]
type     = destroyself
trigger1 = Animtime = 0






;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; めっちゃ回るでラリアット！
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2100]
Type     = U
MoveType = A
Physics  = N
Ctrl     = 0
velset   = 0, 0
Anim     = 2100
SprPriority = 2

[State 2100]
type     = ChangeAnim
Trigger1 = !time
Trigger1 = Statetype = A
value    = 2150

[State 2100]
type      = StatetypeSet
Trigger1  = !time
statetype = A

;-------------------------------------------------[キャンセル補正]

[State a, 変数]  ;Chain spell補正
Type           = VarAdd
triggerAll     = Numenemy > 0
Trigger1       = !time
Trigger1       = (Enemynear,Movetype = H)
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = (1.0 - fvar(3))*0.3

;-----------------------------------------------------[ゲージ管理]

[State 2100, ゲージ減少]
Type           = varAdd
Trigger1       = !time
Persistent     = 0
IgnoreHitPause = 1
fvar(20)       = -1000

[State 2100, ゲージ回復抑制]
Type           = varset
Trigger1       = fvar(22) < 120
IgnoreHitPause = 1
fvar(22)       = 120

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = time = 0
value    = s5, 0

[State a, 暗転処理]
type     = SuperPause
trigger1 = time = 0
darken   = 0
anim     = -1
sound    = -1
time     = 30
movetime = 30
P2DefMul = 1

[state a, nothitby]
type     = nothitby
trigger1 = Time <= 31	;暗転+1F
value    = SCA,AA,AT,AP
time     = 1
ignorehitpause = 1

;--------------------------------------------------[エフェクト]

[State a];カットイン
Type = Helper
Trigger1 = !time
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = -140,0
PosType = back
StateNo = 10000
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

[State a];暗転処理
Type = Helper
Trigger1 = !time
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = 35, -133
PosType = P1
StateNo = 8801
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1


;=================================================================
;  |ここから攻撃ステート|
;=================================================================

[State 2100, 効果音]
type     = PlaySnd
Trigger1 = Animelem = 6
Trigger2 = Animelem = 12
Trigger3 = Animelem = 18
Trigger4 = Animelem = 24
Trigger5 = Animelem = 30
value    = s80, 16

[state 2100, 速度]
type     = Velset
trigger1 = Animelem = 4
X        = 2
Y        = -4

[state 2100, 速度]
type     = VelAdd
trigger1 = Animelem = 41, >= 0
Y        = 0.33

[State 2100, リングエフェクト]
Type     = Helper
Trigger1 = AnimElemtime(4) = 0
StateNo  = 12100
ID       = 12100
Name     = "Ring-Effect"
Pos      = 0, 0
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1

[State 2100, 煙エフェクト]
Type       = Helper
TriggerAll = AnimElemtime(4) >= 0
TriggerAll = time%9 = 0
trigger1   = (Animelemtime(40) < 0)
StateNo  = 11210
ID       = 11210
Name     = "Smoke-Effect"
Pos      = -20, -70
PosType  = P1
Ownpal   = 1
IgnoreHitPause = 1

[State 12100, 爆発]
type        = Helper
trigger1    = Animelemtime(40) = 0
trigger2    = Animelemtime(40) = 5
trigger3    = Animelemtime(40) = 10
trigger4    = Animelemtime(40) = 15
trigger5    = Animelemtime(40) = 15
name        = "Spell-Bomb"
ID          = 12110
postype     = P1
pos         = -50+(random%100), -50+(-50+(random%100))
Stateno     = 12110
size.xscale = 2
size.yscale = 2
ownpal      = 1
ignorehitpause = 1

;-----------------------------------------------[アーマー処理]

[State 2100, スーパーアーマー]
Type     = Helper
Trigger1 = NumHelper(2180) = 0
trigger1 = !time
PosType  = P1
Pos      = 0, 0
ID       = 2180
StateNo  = 2180
Name     = "Super-Armer"
Persistent    = 0
PauseMoveTime = 0;999999
SuperMoveTime = 0;999999

[State a];投げ無敵
type     = Nothitby
Trigger1 = Animelemtime(2) >= 0
value2   = ,AT

[State 2100, 無敵処理]
type     = NotHitBy
Trigger1 = NumHelper(2180) > 0
trigger1 = AnimelemTime(41) < 0
value    = SCA, AA, At, AP
time     = 1
ignorehitpause = 1

;-------------------------------------------------[連続ヒット制御]

[State 2100, ヒットリセット]
Type     = MoveHitReset
Trigger1 = AnimElemTime(42) < 0
Trigger1 = MoveContact >= 2 || MoveReversed >= 2


[State 2100, HitDef];奇数ヒット
type                = HitDef
TriggerAll          = Animelem = 42, < 0
triggerAll          = !(Movecontact) && !(movereversed)
Trigger1            = Animelem = 6
Trigger2            = Animelem = 12
Trigger3            = Animelem = 18
Trigger4            = Animelem = 24
Trigger5            = Animelem = 30
Trigger6            = Animelem = 36
attr                = A, HA
hitflag             = MAFD
guardflag           = MA
damage              = Floor(37*Fvar(0)), 4
getpower = 20,10
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(2*(1+0.5*var(7))), floor(1*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = 4, -3
guard.velocity      = -4
air.velocity        = 4, -6
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(48*FVar(3))+(floor(2*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3


[State 2100, HitDef];偶数ヒット
type                = HitDef
TriggerAll          = Animelem = 42, < 0
triggerAll          = !(Movecontact) && !(movereversed)
Trigger1            = Animelem = 9
Trigger2            = Animelem = 15
Trigger3            = Animelem = 21
Trigger4            = Animelem = 27
Trigger5            = Animelem = 33
Trigger6            = Animelem = 39
attr                = A, HA
hitflag             = MAFD
guardflag           = MA
damage              = Floor(37*Fvar(0)), 4
getpower = 20,10
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(2*(1+0.5*var(7))), floor(1*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -4, -3
guard.velocity      = -4
air.velocity        = -4, -6
airguard.velocity   = -3, -4
down.velocity       = -9, 0
down.hittime        = 15
down.bounce         = 0
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(48*FVar(3))+(floor(2*(1+1*var(7))))
yaccel              = 0.42
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

[State 2100, HitDef];ラスト
type                = HitDef
triggerAll          = !(Movecontact) && !(movereversed)
Trigger1            = Animelem = 42
attr                = A, HA
hitflag             = MAFD
guardflag           = MA
damage              = Floor(125*Fvar(0)), 4
getpower = 20,10
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
guard.slidetime     = 20
guard.hittime       = 20
guard.ctrltime      = 22
air.guard.slidetime = 24
air.guard.hittime   = 24
air.guard.ctrltime  = 26

ground.velocity     = -9.5
guard.velocity      = -8
air.velocity        = -9.5
airguard.velocity   = -2, -4
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(48*FVar(3))+(floor(9*(1+1*var(7))))
Palfx.Time        = 120
Palfx.Mul         = 200,200,200
Palfx.Add         = 100,-120,-120
yaccel              = 0.42
ID = 8010
Ground.CornerPush.VelOff   = -3
Air.CornerPush.VelOff      = -3
Down.CornerPush.VelOff     = -3
Guard.CornerPush.VelOff    = -3

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = AnimElem = 42, < 0
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
Persistent = 2

[State a]
Type     = Helper
Trigger1 = AnimElem = 42, < 0
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
Persistent = 2


;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正 (1hit)
Type           = VarSet
Trigger1       = AnimElem = 42, < 0
Trigger1       = MoveHit = 1 && Var(7) = 0
Persistent     = 2
IgnoreHitPause = 1
fvar(1)        = FVar(1) * 0.91

[State a, VarSet];連続ヒット補正 (1hit)
Type           = VarSet
Trigger1       = AnimElem = 42, < 0
Trigger1       = MoveHit = 1 && Var(7) = 1
Persistent     = 2
IgnoreHitPause = 1
fvar(1)        = FVar(1) * 0.98

[State a, VarSet];連続ヒット補正 (13hit)
Type           = VarSet
Trigger1       = AnimElem = 42, >= 0
Trigger1       = MoveHit = 1 && Var(7) = 0
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * 0.50

[State a, VarSet];連続ヒット補正 (13hit)
Type           = VarSet
Trigger1       = AnimElem = 42, >= 0
Trigger1       = MoveHit = 1 && Var(7) = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * 0.89

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = AnimElem = 42, < 0
Trigger1       = MoveHit = 1
Persistent     = 2
IgnoreHitPause = 1
fvar(3)        = FVar(3) * 0.91

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = AnimElem = 42, >= 0
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.5

;-------------------------------------------------[アルカナゲージ]

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = AnimElem = 42, < 0
Trigger1       = MoveContact = 1
Persistent     = 2
IgnoreHitPause = 1
fvar(21)       = 37*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

[State a, アルカナゲージ]
Type           = VarAdd
TriggerAll     = Fvar(20) >= Fvar(21)
Trigger1       = AnimElem = 42, >= 0
Trigger1       = MoveContact = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(21)       = 125*ifelse(MoveHit, 0.66, 0.275)*ifelse(var(15)=1, 1.1, 1)

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
Trigger1 =  Animelem = 42, >=0
Trigger1 =  MoveHit = 1
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

[State 2100, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
Trigger2 = (Pos Y >= 0)&&(Vel Y > 0)
value    = 2110
ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━
; めっちゃ回るでラリアット！ / 着地硬直
;━━━━━━━━━━━━━━━━━━━━━

[StateDef 2110]
Type     = S
Movetype = A
Physics  = N
velset   = 0, 0
Anim     = 2110
ctrl     = 0

[State 2110, ゲージ回復抑制]
Type           = varset
Trigger1       = fvar(22) < 120
IgnoreHitPause = 1
fvar(22)       = 120

;---------------------------------

[State 2110, 無敵]
type     = Nothitby
Trigger1 = 1
value    = ,AT

[State 2110, 接地]
type     = PosSet
trigger1 = Time = 0
Y        = 0

[State 2110, 効果音]
type     = PlaySnd
trigger1 = Time = 0
trigger2 = Animelem = 4
value    = s80, 9

[State 2110, 画面振動]
type     = EnvShake
trigger1 = !time
time     = 15
ampl     = 4

[State 2110, Helper];ダウンエフェクト
type     = Helper
trigger1 = Time = 1
StateNo  = 7200
PosType  = P1
Pos      = 0, 0
Ownpal   = 1
ID       = 7200

;----------------------------------------[バウンド]

[State 2110, 状態変更]
type      = StatetypeSet
Trigger1  = Animelem = 2
Statetype = A
Movetype  = H

[State 2110]
type     = Velset
trigger1 = Animelem = 2
X = 1.5
Y = -2.5

[State 2110]
type     = VelAdd
trigger1 = Animelem = 2, >= 0
Trigger1 = Animelem = 4, < 0
Y = 0.3

[State 2110]
type     = Velset
trigger1 = Pos Y > 0
Y = 0

;----------------------------------------[ダウン～リバーサル]

[State 2110]
type     = Velset
trigger1 = Animelem = 4
X = 0
Y = 0

[State 2110, 接地]
type     = PosSet
trigger1 = Animelem = 4
Y        = 0

[State 2110, 状態変更]
type      = StatetypeSet
Trigger1  = Animelem = 4
Statetype = L
Movetype  = H

[State 2110, 状態変更]
type      = StatetypeSet
Trigger1  = Animelem = 5
Statetype = S
Movetype  = I

[State 2110, 振り向き]
type     = Turn
trigger1 = Animtime = 0
trigger1 = P2dist X < 0

[State 2110, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;============================================================
; [HELPER] らりあっと / スーパーアーマー処理
;============================================================

[Statedef 2180]
Type     = A
Movetype = A
Physics  = N
Velset   = 0, 0
Ctrl     = 0

;-------------------------------------------------[ヘルパー制御]

[State 2180, 特殊効果]
type     = AssertSpecial
trigger1 = 1
flag     = Invisible
Flag2    = NoShadow

[State 2180, アニメ変更]
type     = Changeanim
trigger1 = Anim != root,Anim
value    = root,Anim
ignorehitpause = 1

[State 2180, ターン]
type     = Turn
trigger1 = Facing != root,Facing
ignorehitpause = 1

[State 2180, 座標]
type     = BindtoRoot
trigger1 = 1
pos      = 0,0
ignorehitpause = 1

[State 2180]
type     = NotHitBy
trigger1 = 1
value    = ,AT

;-------------------------------------------------[アーマー処理]

[State 2185, ダメージ処理]
type     = VarSet
trigger1 = var(0) > 0
var(0)   = 0
ignorehitpause = 1

[State 2185, ダメージ処理]
type     = Varset
trigger1 = 1
var(0)   = GetHitvar(damage)
ignorehitpause = 1

[State 2185, ダメージ処理]
type     = Varset
trigger1 = 1
var(1)   = GetHitvar(hitshaketime)
ignorehitpause = 1

[State 2185, タイムカウント]
type     = VarAdd
trigger1 = prevStateNo = 2180
var(10)  = 1
ignorehitpause = 1

[State 2180, アーマー処理]
type     = HitOverRide
trigger1 = 1
attr     = SCA, AA, AP
stateno  = 2180
ignorehitpause = 1

;-------------------------------------------------[終了]

[State 2185, ヘルパー消滅]
type       = null;DestroySelf
Trigger1   = var(10) > var(1)

[State 2180, ヘルパー消滅];A
type       = DestroySelf
TriggerAll = IsHelper(2180)
trigger1   = (root,Anim = 2100) && (root,Animelem = 41)
trigger2   = (root,Anim = 2150) && (root,Animelem = 41)
trigger3   = (root,StateNo != 2100)



;============================================================
;[helper] 専用エフェクト / めっちゃ回るでラリアット！
;============================================================
[statedef 12100]
Physics     = N
Anim        = 12100
SprPriority = 9

[State 12100]
Type     = AssertSpecial
Trigger1 = 1
Flag     = NoShadow

[State 12100]
Type     = AngleDraw
Trigger1 = 1
Scale    = 2, 2

[State 12100, 透過]
Type     = Trans
Trigger1 = 1
Trans    = Addalpha
alpha    = var(2), 256

[State 12100, 通常]
type     = Varset
Trigger1 = !time
var(2)   = 125

[State 12100, 通常]
type     = Varset
Trigger1 = time = 1
var(2)   = 175

[State 12100, 通常]
type     = Varset
Trigger1 = time = 2
var(2)   = 225

[State 12100, 通常]
type     = Varset
Trigger1 = time = 3
var(2)   = 256

[State 12100, 座標]
type     = BindtoRoot
trigger1 = 1
pos      = 0, 0
ignorehitpause = 1

[State 12100, 通常]
type     = VarAdd
Trigger1 = (root,Anim=2100)&&(root,Animelemtime(41)>0)
var(2)   = -50

[State 12100, ヘルパー消滅]
type     = DestroySelf
trigger1 = (root,StateNo != 2100)
Trigger2 = root,Movetype = H
Trigger3 = (Time > 0)&&(var(2) < 0) 


;============================================================
; [Helper] ラリアット / 爆発
;============================================================

[Statedef 12110]
type     = A
movetype = I
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
fvar(0)  = 1

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

[State 12110, 効果音]
type     = PlaySnd
trigger1 = !time
value    = s80, 28

[State 12110, サークル]
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
Scale    = 0.5+0.015*(time), 0.5+0.015*(time)

;-------------------------------------------

[state a, 終了]
type     = destroyself
trigger1 = Animtime = 0







;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; みんなのヒーローちびガワ発進！
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2200]
Type     = S
MoveType = A
Physics  = S
Ctrl     = 0
velset   = 0, 0
Anim     = 2200
SprPriority = 2

;-------------------------------------------------[キャンセル補正]

[State a, 変数]  ;Chain spell補正
Type           = VarAdd
triggerAll     = Numenemy > 0
Trigger1       = !time
Trigger1       = (Enemynear,Movetype = H)
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = (1.0 - fvar(3))*0.3

;-----------------------------------------------------[ゲージ管理]

[State 2200, ゲージ減少]
Type           = varAdd
Trigger1       = !time
Persistent     = 0
IgnoreHitPause = 1
fvar(20)       = -1000

[State 2200, ゲージ回復抑制]
Type           = varset
Trigger1       = fvar(22) < 300
IgnoreHitPause = 1
fvar(22)       = 120 + 180

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = Animelemtime(3) = 0
value    = s5, 0

[State a, 暗転処理]
type     = SuperPause
trigger1 = Animelemtime(3) = 0
darken   = 0
anim     = -1
sound    = -1
time     = 69
movetime = 69
P2DefMul = 1

[state a, nothitby]
type     = nothitby
trigger1 = Animelemtime(3) = 0
value    = SCA,AA,AT,AP
time     = 69
ignorehitpause = 1

;--------------------------------------------------[エフェクト]

[State a];カットイン
Type = Helper
Trigger1 = !time
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = -140,0
PosType = back
StateNo = 10000
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

[State a];暗転処理
Type = Helper
Trigger1 = !time
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = 32, -141
PosType = P1
StateNo = 8802
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1


;=================================================================
;  |ここから攻撃ステート|
;=================================================================

[state 2200, エフェクト];アーム表示
type     = Explod
trigger1 = AnimelemTime(3) = 0
anim     = 2205
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 2205
bindtime = -1
sprpriority    = 4
IgnoreHitPause = 0
removeTime     = 63
removeongethit = 1

[State 2200, エフェクト消去]
type     = removeexplod
Trigger1 = Animelemtime(4) >= 0
Trigger1 = NumExplod(2205) > 0
Id       = 2205

[State 2005, 弾幕] ;チビガワ
type        = Helper
trigger1    = AnimelemTime(3) = 0
name        = "Spell-tibigawa"
ID          = 2200
postype     = P1
pos         = 23, -55
Stateno     = 12200
SuperMoveTime=70
PauseMoveTime=70
size.xscale = 1
size.yscale = 1
ownpal      = 1
persistent  = 0
ignorehitpause = 1

[State 2200, 画面振動]
type     = EnvShake
trigger1 = AnimElem = 2
time     = 6
ampl     = 4
IgnoreHitPause = 1

[State 2200, 画面振動]
type     = EnvShake
trigger1 = AnimElem = 2
time     = 6
ampl     = 4
IgnoreHitPause = 1

[State 2200, 画面振動]
type     = EnvShake
trigger1 = AnimElem = 5
time     = 6
ampl     = 4
IgnoreHitPause = 1

;-------------------------------------------------[攻撃状態終了]

[State 2200, 終了]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;============================================================
; [Helper]  チビガワ / 登場
;============================================================

[Statedef 12200]
type     = A
movetype = I
physics  = N
ctrl     = 0
anim     = 12200
velset   = 0, 0
sprpriority = 5

[state a]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[state a]
type     = AngleDraw
trigger1 = 1
scale    = 0.5, 0.5

;-------------------------------------------------[共通設定]

[State a]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State a]
type     = Trans
Trigger1 = Animelemtime(2) < 0
trans    = Addalpha
alpha    = var(2), 256

[State a]
type     = VarSet
Trigger1 = !time
var(2)   = 0

[State a]
type     = VarAdd
Trigger1 = time <= 15
var(2)   = 17

;-------------------------------------------------[移動設定]

[State 12200, 座標]
type     = BindtoRoot
trigger1 = Animelemtime(3) = 0
pos      = 27, -54
ignorehitpause = 1

[State 12200, 座標]
type     = BindtoRoot
trigger1 = Animelemtime(3) = 3
pos      = 30, -50
ignorehitpause = 1

[State 12200, 座標]
type     = BindtoRoot
trigger1 = Animelemtime(3) = 5
pos      = 32, -46
ignorehitpause = 1

[State 12200, 座標]
type     = BindtoRoot
trigger1 = Animelemtime(3) = 7
pos      = 27, -54
ignorehitpause = 1

[State 12200, 座標]
type     = BindtoRoot
trigger1 = Animelemtime(3) = 9
pos      = 35, -39
ignorehitpause = 1

[State 12200, 座標]
type     = BindtoRoot
trigger1 = Animelemtime(3) = 11
pos      = 39, -31
ignorehitpause = 1

[State 12200, 座標]
type     = BindtoRoot
trigger1 = Animelemtime(3) = 13
pos      = 42, -24
ignorehitpause = 1

[State 12200, 座標]
type     = BindtoRoot
trigger1 = Animelemtime(3) = 14
pos      = 45, -18
ignorehitpause = 1

[State 12200, 座標]
type     = BindtoRoot
trigger1 = Animelemtime(3) = 15
pos      = 50, -10
ignorehitpause = 1

[State 12200, 座標]
type     = BindtoRoot
trigger1 = Animelemtime(3) = 17
pos      = 56, -6
ignorehitpause = 1

[State 12200, 座標]
type     = BindtoRoot
trigger1 = Animelemtime(3) = 19
pos      = 65, 0
ignorehitpause = 1

[State 12200, 座標]
type     = BindtoRoot
trigger1 = Animelemtime(3) = 21
pos      = 80, 4
ignorehitpause = 1

[State 12200, 速度]
type     = VelSet
Trigger1 = Animelemtime(3) = 21
X        = 1

[State 12200, 速度]
type     = Velmul
Trigger1 = Animelemtime(3) >= 21
X        = 0.97

[State 12200, 速度]
type     = VelSet
Trigger1 = Animelemtime(3) = 69
X        = 0

;-------------------------------------------------[ステート変更]

[State 12200, 終了]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 12201




;============================================================
; [Helper]  チビガワ / 行動開始
;============================================================

[Statedef 12201]
Type     = S
Movetype = I
Physics  = N
Velset   = 0, 0
Ctrl     = 0

[state a]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 12201, アニメ変更]
type     = Changeanim
trigger1 = !time
Trigger1 = PrevStateNo != 12202
Value    = 12201

[State 12201, アニメ変更]
type     = Changeanim
trigger1 = !time
Trigger1 = PrevStateNo = 12202
value    = 12201
elem     = 2

;------------------------------------------------------[演出]

[State 12201]
type     = VelSet
Trigger1 = 1
X        = 0.25

[state a]
type     = AngleDraw
trigger1 = 1
scale    = 0.5, 0.5

[State 12201, 効果音]
type     = PlaySnd
trigger1 = Animelem = 3
value    = s410, 10

;------------------------------------------------------[アーマー処理]

[State 12201]
type     = NotHitBy
trigger1 = 1
value    = ,AT

[State 12201, アーマー処理]
type     = HitOverRide
trigger1 = 1
attr     = SCA, AA, AP
stateno  = 12210
ignorehitpause = 1

;-------------------------------------------------[判定いろいろ]

[State a, 死亡確認]
Type     = null;Varset
Trigger1 = !Time
trigger1 = Enemy,Teammode = simul
var(50)  = (EnemyNear,Alive = 0)

[State a, ターンフラグ]
Type     = VarAdd
Trigger1 = P2Dist X < 0
var(51)  = 1

[State a, ターンフラグ]
Type     = VarSet
Trigger1 = P2Dist X >= 0
Trigger2 = !time
var(51)  = 0

;-------------------------------------------------[ステート変更]

[State 12201, 爆発ステートへ]
type     = ChangeState
Trigger1 = Root,MoveType = H && Root,StateNo != [120,159]
Trigger2 = (P2Dist X = [-35, 35])&&(P2bodyDist Y = [-20, 20])
Trigger3 = roundstate = 3
value    = 12210

[State 12201, ターンステートへ]
type     = ChangeState
Trigger1 = Var(51) >= 30
value    = 12202

[State 12201, ヘルパー消滅]
type     = DestroySelf
trigger1 = FrontEdgeBodyDist <= -50



;============================================================
; [Helper]  チビガワ / ターンステート
;============================================================

[Statedef 12202]
Type     = S
Movetype = I
Physics  = N
Velset   = 0, 0
Ctrl     = 0

[state a]
type     = AssertSpecial
trigger1 = 1
flag     = noshadow

[State 12202, アニメ変更]
type     = Changeanim
trigger1 = !time
value    = 12202

[State 12202, 電波受信中]
type       = Explod
trigger1   = !time
anim       = 12203
ID         = 1
postype    = P1
pos        = 0, 0
vel        = 0, 0
sprpriority    = 5
bindtime       = -1
removeongethit = 1

[State a, ターンフラグ]
Type     = VarSet
Trigger1 = !time
var(51)  = 0

[state a]
type     = AngleDraw
trigger1 = 1
scale    = 0.5, 0.5

;------------------------------------------------------[アーマー処理]

[State 12202]
type     = NotHitBy
trigger1 = 1
value    = ,AT

[State 12202, アーマー処理]
type     = HitOverRide
trigger1 = 1
attr     = SCA, AA, AP
stateno  = 12210
ignorehitpause = 1

;------------------------------------

[State 12202, 振り向き]
type     = Turn
trigger1 = AnimTime = 0
trigger1 = P2dist X < 0

[State 12202, 着地終了]
Type     = ChangeState
trigger1 = AnimTime = 0
Value    = 12201




;============================================================
; [Helper]  チビガワ / 爆発ステート
;============================================================

[Statedef 12210]
Type     = S
Movetype = A
Physics  = N
Velset   = 0, 0
Ctrl     = 0

[State 12210, アニメ変更]
type     = Changeanim
trigger1 = !time
value    = 12210

[state a]
type     = AngleDraw
trigger1 = 1
scale    = 0.5, 0.5

;-------------------------------------------------[共通設定]

[State a]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[state a]
type     = AssertSpecial
trigger1 = 1
flag     = noshadow

;-------------------------------------------------[爆発1]

[State 12210, 効果音]
type     = PlaySnd
trigger1 = Time = 15
trigger2 = Time = 20
trigger3 = Time = 25
trigger4 = Time = 30
trigger5 = Time = 35
trigger6 = Time = 40
trigger7 = Time = 45
trigger8 = Time = 50
trigger9 = Time = 55
trigger10= Time = 60
value    = s80, 28
channel  = 2

[State 12000, 効果音]
type     = PlaySnd
trigger1 = time = 15
value    = s80, 17

[State 12000, 弾幕]
type        = Helper
trigger1 = Time = 15
trigger2 = Time = 20
trigger3 = Time = 25
trigger4 = Time = 30
trigger5 = Time = 35
trigger6 = Time = 40
trigger7 = Time = 45
trigger8 = Time = 50
trigger9 = Time = 55
trigger10= Time = 60
name        = "Spell-tibiga2"
ID          = 12020
postype     = P1
pos         = 0, -15
Stateno     = 12020
size.xscale = 1
size.yscale = 1
ownpal      = 1
ignorehitpause = 1

[State 12210]
type     = VarRandom
Trigger1 = 1
v        = 10
range    = -10, 10

[State 12210]
type     = VarRandom
Trigger1 = 1
v        = 11
range    = -10, 10

[State 12010, エフェクト]
type        = Helper
trigger1    = (Time >= 15)&&(time < 55-6)
Trigger1    = time%3 = 0
Trigger1    = Random < 800
name        = "ef-tibigawa"
ID          = 12221
postype     = P1
pos         = var(10), -15 + var(11)
Stateno     = 12221
size.xscale = 1
size.yscale = 1
ownpal      = 1
ignorehitpause = 1

;-------------------------------------------------[終了]

[state a, 終了]
type     = destroyself
trigger1 = Animtime = 0









;============================================================
; [Helper] チビガワ-炸裂
;============================================================

[Statedef 12020]
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
flag2= invisible

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
value    = 12220

;爆心地はランダム

[State 12220]
type     = VarRandom
Trigger1 = !time
v        = 10
range    = -45, 45

[State 12220]
type     = VarRandom
Trigger1 = !time
v        = 11
range    = -40, 10

[State 12020, サークル]
type       = Explod
trigger1   = !time
anim       = 12220
ID         = 2
postype    = P1
pos        = var(10), var(11)
random     = 0, 0
scale      = 0.5, 0.5
vel        = 0, 0
sprpriority    = 9
bindtime       = -1
removeongethit = 1

[State 12020, サークル]
type       = Explod
trigger1   = time = 1
anim       = 11011
ID         = 1
postype    = P1
pos        = var(10), var(11)
random     = 0, 0
scale      = 0.1, 0.1
vel        = 0, 0
sprpriority    = 9
bindtime       = -1
removeongethit = 1

[State a];エフェクト管理
type     = ModifyExplod
trigger1 = Numexplod(2) = 1
ID       = 2
Scale    = fvar(0), fvar(0)

[State a];エフェクト管理
type     = ModifyExplod
trigger1 = Numexplod(1) = 1
ID       = 1
Scale    = 0.25+0.015*(time), 0.25+0.015*(time)

;-------------------------------------------------[ヒット定義]

[state 12020, HitDef]
type              = HitDef
Trigger1          = 1
attr              = S, HP
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
down.velocity     = -9, 0
down.hittime      = 15
down.bounce       = 0
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

[State 12220, 補正制御用]
Type           = Projectile
Trigger1       = (Movehit = 1)&&(Var(7)=0)
ProjID         = 12200
ProjAnim       = 0;9999
ProjRemoveTime = 0
Persistent     = 0
IgnoreHitPause = 1
SuperMoveTime  = 99999
PauseMoveTime  = 99999

[State 12220, 補正制御用]
Type           = Projectile
Trigger1       = (Movehit = 1)&&(Var(7)=1)
ProjID         = 12201
ProjAnim       = 0;9999
ProjRemoveTime = 0
Persistent     = 0
IgnoreHitPause = 1
SuperMoveTime  = 99999
PauseMoveTime  = 99999

[State 12220, 補正制御用];ガード
Type           = Projectile
Trigger1       = (Moveguarded = 1)
ProjID         = 12020
ProjAnim       = 0;9999
ProjRemoveTime = 0
Persistent     = 0
IgnoreHitPause = 1
SuperMoveTime  = 99999
PauseMoveTime  = 99999

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

[state a, 終了]
type     = destroyself
trigger1 = Animtime = 0




;============================================================
; [Helper] チビガワ-炸裂(エフェクト)
;============================================================

[Statedef 12221]
type     = A
movetype = I
anim     = 12221
sprpriority = 8

[state a]
type     = AssertSpecial
trigger1 = 1
flag     = noshadow

[State a]
type     = Trans
Trigger1 = Animelemtime(2) < 0
trans    = Add1

[State a]
type     = Trans
Trigger1 = Animelemtime(2) >= 0
trans    = Add


[State a]
type     = VarSet
Trigger1 = !time
fvar(0)  = 0.75

[State a]
type     = VarAdd
Trigger1 = time
fvar(0)  = 0.01

[State a]
type     = VarSet
Trigger1 = !time
var(0)   = 0 + (random%360)

[State a]
type     = VarAdd
Trigger1 = 1
var(0)   = 3

[state a]
type     = AngleDraw
trigger1 = 1
value    = var(0)
scale    = fvar(0), fvar(0)

[State a]
type     = Velset
trigger1 = !time
X = 0.5 * cos(var(0)*pi/180)
Y = 0.5 * sin(var(0)*pi/180)

;-------------------------------------------------[終了]

[state a, 終了]
type     = destroyself
trigger1 = Animtime = 0










;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 回転力は遠心力で破壊力や！
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2300]
Type     = S
MoveType = A
Physics  = S
Ctrl     = 0
velset   = 0, 0
Anim     = 2300
SprPriority = 2

;-------------------------------------------------[キャンセル補正]

[State a, 変数]  ;Chain spell補正
Type           = VarAdd
triggerAll     = Numenemy > 0
Trigger1       = !time
Trigger1       = (Enemynear,Movetype = H)
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = (1.0 - fvar(3))*0.3

;-----------------------------------------------------[ゲージ管理]

[State 2300, ゲージ減少]
Type           = varAdd
Trigger1       = !time
Persistent     = 0
IgnoreHitPause = 1
fvar(20)       = -3000

[State 2300, ゲージ回復抑制]
Type           = varset
Trigger1       = fvar(22) < 120
IgnoreHitPause = 1
fvar(22)       = 120

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = Animelem = 2
value    = s5, 1

[State a, 暗転処理]
type     = SuperPause
trigger1 = Animelem = 2
darken   = 0
anim     = -1
sound    = -1
time     = 60
movetime = 60
P2DefMul = 1

[state a, nothitby]
type     = nothitby
trigger1 = Time <= 64	;暗転+1F
value    = SCA,AA,AT,AP
time     = 1
ignorehitpause = 1

;-----------------------------------------------------[エフェクト]

[State a];カットイン
Type = Helper
Trigger1 = Animelem = 2
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = -140,0
PosType = back
StateNo = 10000
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

[State a];暗転処理
Type = Helper
Trigger1 = Animelem = 2
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = 43, -131
PosType = P1
StateNo = 8805
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

;=================================================================
;  |ここから攻撃ステート|
;=================================================================


[State a, 効果音]
type     = playsnd
trigger1 = Animelem = 5
value    = s2, 2

[State 2300, 状態変更]
type     = StatetypeSet
Trigger1 = Animelem = 8
Movetype = I

;-------------------------------------------------[攻撃判定]

[State 2300, HitDef]
type          = HitDef
Trigger1      = AnimElem = 3
Trigger1      = P2StateNo != [150, 153]
attr          = S, HT
damage        = 0
getpower = 60,30
hitflag       = MA
priority      = 3, miss
pausetime     = 0, 0
sparkno       = -1
sparkxy       = 0, 0
hitsound      = -1
guard.sparkno = -1
guardsound    = -1
P1facing      = 1
P2facing      = 1
Fall          = 0
Kill          = 0
P2stateno     = 2350
ID            = 2300

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * ifelse(fvar(2)=1, 0.91, 1.0)

;-------------------------------------------------[攻撃状態終了]

[State 2300, ステート変更] ;成功
Type     = ChangeState
Trigger1 = MoveHit
value    = 2305

[State 2300, 終了]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 回転力は遠心力で破壊力や！ / 回転中
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2305]
type     = A
movetype = A
physics  = N
velset   = 0, 0
ctrl     = 0
anim     = 2305

[State 2305, NotHitBy]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP
IgnoreHitPause = 1

[State 810, Width 2-11]
type = Width
trigger1 = time = 0
edge = 40,0

;-------------------------------------------------[演出-1]

[State 2305, 変数0];バーニア表示時間
type     = VarSet
Trigger1 = !time
var(0)   = 5

[State 2305, 変数1];バーニア表示時間
type     = VarSet
Trigger1 = !time
var(1)   = 4

[State 2305, 変数];バーニア表示時間
type     = null
Trigger1 = AnimElemTime(17) = 0
Trigger1 = var(0) := 4
Trigger1 = var(1) := 3
Trigger2 = AnimElemTime(33) = 0
Trigger2 = var(0) := 3
Trigger2 = var(1) := 2
Trigger3 = AnimElemTime(65) = 0
Trigger3 = var(0) := 2
Trigger3 = var(1) := 1

[State 2305, バーニア表示A];(スピード変化)
type     = Explod
Trigger1 = Animelemtime(1) = 0
Trigger2 = Animelemtime(17) = 0
Trigger3 = Animelemtime(33) = 0
Trigger4 = Animelemtime(49) = 0
Trigger5 = Animelemtime(57) = 0
Trigger6 = Animelemtime(65) = 0
anim     = 4062
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(1)

[State 2305, バーニア表示B]
type     = Explod
Trigger1 = Animelemtime(1) = 0
Trigger2 = Animelemtime(17) = 0
Trigger3 = Animelemtime(33) = 0
Trigger4 = Animelemtime(49) = 0
Trigger5 = Animelemtime(57) = 0
Trigger6 = Animelemtime(65) = 0
anim     = 4081
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = Var(1)

[State 2305, バーニア表示C]
type     = Explod
Trigger1 = Animelemtime(1) = 0
Trigger2 = Animelemtime(17) = 0
Trigger3 = Animelemtime(33) = 0
Trigger4 = Animelemtime(49) = 0
Trigger5 = Animelemtime(57) = 0
Trigger6 = Animelemtime(65) = 0
anim     = 4082
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = Var(1)

[State 2305, バーニア表示A2]
type     = Explod
Trigger1 = Animelemtime(9) = 0
Trigger2 = Animelemtime(25) = 0
Trigger3 = Animelemtime(41) = 0
Trigger4 = Animelemtime(73) = 0
Trigger5 = Animelemtime(81) = 0
anim     = 4062
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示B2]
type     = Explod
Trigger1 = Animelemtime(9) = 0
Trigger2 = Animelemtime(25) = 0
Trigger3 = Animelemtime(41) = 0
Trigger4 = Animelemtime(73) = 0
Trigger5 = Animelemtime(81) = 0
anim     = 4063
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示C2]
type     = Explod
Trigger1 = Animelemtime(9) = 0
Trigger2 = Animelemtime(25) = 0
Trigger3 = Animelemtime(41) = 0
Trigger4 = Animelemtime(73) = 0
Trigger5 = Animelemtime(81) = 0
anim     = 4063
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

;=========================================

[State 2305, バーニア表示D]
type     = Explod
Trigger1 = Animelemtime(2) = 0
Trigger2 = Animelemtime(10) = 0
Trigger3 = Animelemtime(18) = 0
Trigger4 = Animelemtime(26) = 0
Trigger5 = Animelemtime(34) = 0
Trigger6 = Animelemtime(42) = 0
Trigger7 = Animelemtime(50) = 0
Trigger8 = Animelemtime(58) = 0
Trigger9 = Animelemtime(66) = 0
Trigger10= Animelemtime(74) = 0
anim     = 4063
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示E]
type     = Explod
Trigger1 = Animelemtime(2) = 0
Trigger2 = Animelemtime(10) = 0
Trigger3 = Animelemtime(18) = 0
Trigger4 = Animelemtime(26) = 0
Trigger5 = Animelemtime(34) = 0
Trigger6 = Animelemtime(42) = 0
Trigger7 = Animelemtime(50) = 0
Trigger8 = Animelemtime(58) = 0
Trigger9 = Animelemtime(66) = 0
Trigger10= Animelemtime(74) = 0
anim     = 4064
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示F]
type     = Explod
Trigger1 = Animelemtime(2) = 0
Trigger2 = Animelemtime(10) = 0
Trigger3 = Animelemtime(18) = 0
Trigger4 = Animelemtime(26) = 0
Trigger5 = Animelemtime(34) = 0
Trigger6 = Animelemtime(42) = 0
Trigger7 = Animelemtime(50) = 0
Trigger8 = Animelemtime(58) = 0
Trigger9 = Animelemtime(66) = 0
Trigger10= Animelemtime(74) = 0
anim     = 4065
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)

;=========================================

[State 2305, バーニア表示G]
type     = Explod
Trigger1 = Animelemtime(3) = 0
Trigger2 = Animelemtime(11) = 0
Trigger3 = Animelemtime(19) = 0
Trigger4 = Animelemtime(27) = 0
Trigger5 = Animelemtime(35) = 0
Trigger6 = Animelemtime(43) = 0
Trigger7 = Animelemtime(51) = 0
Trigger8 = Animelemtime(59) = 0
Trigger9 = Animelemtime(67) = 0
Trigger10= Animelemtime(75) = 0
anim     = 4066
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示H]
type     = Explod
Trigger1 = Animelemtime(3) = 0
Trigger2 = Animelemtime(11) = 0
Trigger3 = Animelemtime(19) = 0
Trigger4 = Animelemtime(27) = 0
Trigger5 = Animelemtime(35) = 0
Trigger6 = Animelemtime(43) = 0
Trigger7 = Animelemtime(51) = 0
Trigger8 = Animelemtime(59) = 0
Trigger9 = Animelemtime(67) = 0
Trigger10= Animelemtime(75) = 0
anim     = 4067
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示I]
type     = Explod
Trigger1 = Animelemtime(3) = 0
Trigger2 = Animelemtime(11) = 0
Trigger3 = Animelemtime(19) = 0
Trigger4 = Animelemtime(27) = 0
Trigger5 = Animelemtime(35) = 0
Trigger6 = Animelemtime(43) = 0
Trigger7 = Animelemtime(51) = 0
Trigger8 = Animelemtime(59) = 0
Trigger9 = Animelemtime(67) = 0
Trigger10= Animelemtime(75) = 0
anim     = 4068
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示J]
type     = Explod
Trigger1 = Animelemtime(3) = 0
Trigger2 = Animelemtime(11) = 0
Trigger3 = Animelemtime(19) = 0
Trigger4 = Animelemtime(27) = 0
Trigger5 = Animelemtime(35) = 0
Trigger6 = Animelemtime(43) = 0
Trigger7 = Animelemtime(51) = 0
Trigger8 = Animelemtime(59) = 0
Trigger9 = Animelemtime(67) = 0
Trigger10= Animelemtime(75) = 0
anim     = 4069
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

;=========================================

[State 2305, バーニア表示K]
type     = Explod
Trigger1 = Animelemtime(4) = 0
Trigger2 = Animelemtime(12) = 0
Trigger3 = Animelemtime(20) = 0
Trigger4 = Animelemtime(28) = 0
Trigger5 = Animelemtime(36) = 0
Trigger6 = Animelemtime(44) = 0
Trigger7 = Animelemtime(52) = 0
Trigger8 = Animelemtime(60) = 0
Trigger9 = Animelemtime(68) = 0
Trigger10= Animelemtime(76) = 0
anim     = 4070
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示L]
type     = Explod
Trigger1 = Animelemtime(4) = 0
Trigger2 = Animelemtime(12) = 0
Trigger3 = Animelemtime(20) = 0
Trigger4 = Animelemtime(28) = 0
Trigger5 = Animelemtime(36) = 0
Trigger6 = Animelemtime(44) = 0
Trigger7 = Animelemtime(52) = 0
Trigger8 = Animelemtime(60) = 0
Trigger9 = Animelemtime(68) = 0
Trigger10= Animelemtime(76) = 0
anim     = 4071
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示M]
type     = Explod
Trigger1 = Animelemtime(4) = 0
Trigger2 = Animelemtime(12) = 0
Trigger3 = Animelemtime(20) = 0
Trigger4 = Animelemtime(28) = 0
Trigger5 = Animelemtime(36) = 0
Trigger6 = Animelemtime(44) = 0
Trigger7 = Animelemtime(52) = 0
Trigger8 = Animelemtime(60) = 0
Trigger9 = Animelemtime(68) = 0
Trigger10= Animelemtime(76) = 0
anim     = 4072
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

;=========================================

[State 2305, バーニア表示N]
type     = Explod
Trigger1 = Animelemtime(5) = 0
Trigger2 = Animelemtime(13) = 0
Trigger3 = Animelemtime(21) = 0
Trigger4 = Animelemtime(29) = 0
Trigger5 = Animelemtime(37) = 0
Trigger6 = Animelemtime(45) = 0
Trigger7 = Animelemtime(53) = 0
Trigger8 = Animelemtime(61) = 0
Trigger9 = Animelemtime(69) = 0
Trigger10= Animelemtime(77) = 0
anim     = 4073
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示O]
type     = Explod
Trigger1 = Animelemtime(5) = 0
Trigger2 = Animelemtime(13) = 0
Trigger3 = Animelemtime(21) = 0
Trigger4 = Animelemtime(29) = 0
Trigger5 = Animelemtime(37) = 0
Trigger6 = Animelemtime(45) = 0
Trigger7 = Animelemtime(53) = 0
Trigger8 = Animelemtime(61) = 0
Trigger9 = Animelemtime(69) = 0
Trigger10= Animelemtime(77) = 0
anim     = 4074
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

;=========================================

[State 2305, バーニア表示P]
type     = Explod
Trigger1 = Animelemtime(6) = 0
Trigger2 = Animelemtime(14) = 0
Trigger3 = Animelemtime(22) = 0
Trigger4 = Animelemtime(30) = 0
Trigger5 = Animelemtime(38) = 0
Trigger6 = Animelemtime(46) = 0
Trigger7 = Animelemtime(54) = 0
Trigger8 = Animelemtime(62) = 0
Trigger9 = Animelemtime(70) = 0
Trigger10= Animelemtime(78) = 0
anim     = 4075
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示Q]
type     = Explod
Trigger1 = Animelemtime(6) = 0
Trigger2 = Animelemtime(14) = 0
Trigger3 = Animelemtime(22) = 0
Trigger4 = Animelemtime(30) = 0
Trigger5 = Animelemtime(38) = 0
Trigger6 = Animelemtime(46) = 0
Trigger7 = Animelemtime(54) = 0
Trigger8 = Animelemtime(62) = 0
Trigger9 = Animelemtime(70) = 0
Trigger10= Animelemtime(78) = 0
anim     = 4076
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)

;=========================================

[State 2305, バーニア表示R]
type     = Explod
Trigger1 = Animelemtime(7) = 0
Trigger2 = Animelemtime(15) = 0
Trigger3 = Animelemtime(23) = 0
Trigger4 = Animelemtime(31) = 0
Trigger5 = Animelemtime(39) = 0
Trigger6 = Animelemtime(47) = 0
Trigger7 = Animelemtime(55) = 0
Trigger8 = Animelemtime(63) = 0
Trigger9 = Animelemtime(71) = 0
Trigger10= Animelemtime(79) = 0
anim     = 4077
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示S]
type     = Explod
Trigger1 = Animelemtime(7) = 0
Trigger2 = Animelemtime(15) = 0
Trigger3 = Animelemtime(23) = 0
Trigger4 = Animelemtime(31) = 0
Trigger5 = Animelemtime(39) = 0
Trigger6 = Animelemtime(47) = 0
Trigger7 = Animelemtime(55) = 0
Trigger8 = Animelemtime(63) = 0
Trigger9 = Animelemtime(71) = 0
Trigger10= Animelemtime(79) = 0
anim     = 4078
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)

;=========================================

[State 2305, バーニア表示U]
type     = Explod
Trigger1 = Animelemtime(8) = 0
Trigger2 = Animelemtime(16) = 0
Trigger3 = Animelemtime(24) = 0
Trigger4 = Animelemtime(32) = 0
Trigger5 = Animelemtime(40) = 0
Trigger6 = Animelemtime(48) = 0
Trigger7 = Animelemtime(56) = 0
Trigger8 = Animelemtime(64) = 0
Trigger9 = Animelemtime(72) = 0
Trigger10= Animelemtime(80) = 0
anim     = 4079
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示V]
type     = Explod
Trigger1 = Animelemtime(8) = 0
Trigger2 = Animelemtime(16) = 0
Trigger3 = Animelemtime(24) = 0
Trigger4 = Animelemtime(32) = 0
Trigger5 = Animelemtime(40) = 0
Trigger6 = Animelemtime(48) = 0
Trigger7 = Animelemtime(56) = 0
Trigger8 = Animelemtime(64) = 0
Trigger9 = Animelemtime(72) = 0
Trigger10= Animelemtime(80) = 0
anim     = 4080
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)

;--------------------------------------------------------------------

[State 2305, 効果音]
type     = PlaySnd
Trigger1 = Animelem = 7
Trigger2 = Animelem = 15
Trigger3 = Animelem = 23
Trigger4 = Animelem = 31
Trigger5 = Animelem = 39
Trigger6 = Animelem = 47
Trigger7 = Animelem = 55
Trigger8 = Animelem = 63
Trigger9 = Animelem = 71
Trigger10= Animelem = 79
value    = s80, 16

[state 2305, 速度]
type     = Velset
trigger1 = !time
Y        = -2.5

[state 2305, 速度]
type     = Velset
trigger1 = Animelem = 57
Y        = -1.75

[state 2305, 速度]
type     = Velset
trigger1 = Animelem = 65
Y        = -0.7

[State 2305, 煙エフェクト]
Type       = Helper
TriggerAll = time%9 = 0
trigger1   = (Animelemtime(80) < 0)
StateNo    = 12310
ID         = 12310
Name       = "Smoke-Effect"
Pos        = -20+(random%40), -50+(-20+(random%40))
PosType    = P1
Ownpal     = 1
IgnoreHitPause = 1

[State 2305, 爆発]
type        = Helper
trigger1    = Animelemtime(81) = 0
trigger2    = Animelemtime(81) = 5
trigger3    = Animelemtime(81) = 10
trigger4    = Animelemtime(81) = 15
trigger5    = Animelemtime(81) = 20
name        = "Spell-Bomb"
ID          = 12110
postype     = P1
pos         = -50+(random%100), -50+(-50+(random%100))
Stateno     = 12110
size.xscale = 2.5
size.yscale = 2.5
ownpal      = 1
ignorehitpause = 1

[State -2, パレット変更] ;トランザム!
type     = Palfx
trigger1 = Animelemtime(65) > 0
trigger1 = Animelemtime(81) < 0
Mul      = 200,200,200
Add      = 100,-120,-120
time     = 1
ignorehitpause = 1

;-------------------------------------------------[ターゲット制御]

[State 2305, 相手ステート制御]
Type     = TargetState
Trigger1 = !time
Trigger2 = Animelem = 9
Trigger3 = Animelem = 17
Trigger4 = Animelem = 25
Trigger5 = Animelem = 33
Trigger6 = Animelem = 41
Trigger7 = Animelem = 49
Trigger8 = Animelem = 57
Trigger9 = Animelem = 65
Trigger10= Animelem = 73
value    = 2351

[State 2305]
type     = TargetBind
Trigger1 = !time
Trigger2 = Animelem = 9
Trigger3 = Animelem = 17
Trigger4 = Animelem = 25
Trigger5 = Animelem = 33
Trigger6 = Animelem = 41
Trigger7 = Animelem = 49
Trigger8 = Animelem = 57
Trigger9 = Animelem = 65
Trigger10= Animelem = 73
pos      = 85, -92
time = 5
IgnoreHitPause = 1

[State 2305, 相手ステート制御]
Type     = TargetState
Trigger1 = Animelem = 2
Trigger2 = Animelem = 10
Trigger3 = Animelem = 18
Trigger4 = Animelem = 26
Trigger5 = Animelem = 34
Trigger6 = Animelem = 42
Trigger7 = Animelem = 50
Trigger8 = Animelem = 58
Trigger9 = Animelem = 66
Trigger10= Animelem = 74
value    = 2352

[State 2305]
type     = TargetBind
Trigger1 = Animelem = 2
Trigger2 = Animelem = 10
Trigger3 = Animelem = 18
Trigger4 = Animelem = 26
Trigger5 = Animelem = 34
Trigger6 = Animelem = 42
Trigger7 = Animelem = 50
Trigger8 = Animelem = 58
Trigger9 = Animelem = 66
Trigger10= Animelem = 74
pos      = 90, -105
time = 5
IgnoreHitPause = 1

[State 2305]
type     = TargetBind
Trigger1 = Animelem = 3
Trigger2 = Animelem = 11
Trigger3 = Animelem = 19
Trigger4 = Animelem = 27
Trigger5 = Animelem = 35
Trigger6 = Animelem = 43
Trigger7 = Animelem = 51
Trigger8 = Animelem = 59
Trigger9 = Animelem = 67
Trigger10= Animelem = 75
pos      = 0, -80
time = 5
IgnoreHitPause = 1

[State 2305, 相手ステート制御]
Type     = TargetState
Trigger1 = Animelem = 3
Trigger2 = Animelem = 11
Trigger3 = Animelem = 19
Trigger4 = Animelem = 27
Trigger5 = Animelem = 35
Trigger6 = Animelem = 43
Trigger7 = Animelem = 51
Trigger8 = Animelem = 59
Trigger9 = Animelem = 67
Trigger10= Animelem = 75
value    = 2353

[State 2305]
type     = TargetBind
Trigger1 = Animelem = 4
Trigger2 = Animelem = 12
Trigger3 = Animelem = 20
Trigger4 = Animelem = 28
Trigger5 = Animelem = 36
Trigger6 = Animelem = 44
Trigger7 = Animelem = 52
Trigger8 = Animelem = 60
Trigger9 = Animelem = 68
Trigger10= Animelem = 76
pos      = -90, -102
time = 5
IgnoreHitPause = 1

[State 2305, 相手ステート制御]
Type     = TargetState
Trigger1 = Animelem = 4
Trigger2 = Animelem = 12
Trigger3 = Animelem = 20
Trigger4 = Animelem = 28
Trigger5 = Animelem = 36
Trigger6 = Animelem = 44
Trigger7 = Animelem = 52
Trigger8 = Animelem = 60
Trigger9 = Animelem = 68
Trigger10= Animelem = 76
value    = 2354

[State 2305]
type     = TargetBind
Trigger1 = Animelem = 5
Trigger2 = Animelem = 13
Trigger3 = Animelem = 21
Trigger4 = Animelem = 29
Trigger5 = Animelem = 37
Trigger6 = Animelem = 45
Trigger7 = Animelem = 53
Trigger8 = Animelem = 61
Trigger9 = Animelem = 69
Trigger10= Animelem = 77
pos      = -95, -95
time = 5
IgnoreHitPause = 1

[State 2305, 相手ステート制御]
Type     = TargetState
Trigger1 = Animelem = 5
Trigger2 = Animelem = 13
Trigger3 = Animelem = 21
Trigger4 = Animelem = 29
Trigger5 = Animelem = 37
Trigger6 = Animelem = 45
Trigger7 = Animelem = 53
Trigger8 = Animelem = 61
Trigger9 = Animelem = 69
Trigger10= Animelem = 77
value    = 2355

[State 2305]
type     = TargetBind
Trigger1 = Animelem = 6
Trigger2 = Animelem = 14
Trigger3 = Animelem = 22
Trigger4 = Animelem = 30
Trigger5 = Animelem = 38
Trigger6 = Animelem = 46
Trigger7 = Animelem = 54
Trigger8 = Animelem = 62
Trigger9 = Animelem = 70
Trigger10= Animelem = 78
pos      = -35, -63
time = 5
IgnoreHitPause = 1

[State 2305, 相手ステート制御]
Type     = TargetState
Trigger1 = Animelem = 6
Trigger2 = Animelem = 14
Trigger3 = Animelem = 22
Trigger4 = Animelem = 30
Trigger5 = Animelem = 38
Trigger6 = Animelem = 46
Trigger7 = Animelem = 54
Trigger8 = Animelem = 62
Trigger9 = Animelem = 70
Trigger10= Animelem = 78
value    = 2356

[State 2305]
type     = TargetBind
Trigger1 = Animelem = 7
Trigger2 = Animelem = 15
Trigger3 = Animelem = 23
Trigger4 = Animelem = 31
Trigger5 = Animelem = 39
Trigger6 = Animelem = 47
Trigger7 = Animelem = 55
Trigger8 = Animelem = 63
Trigger9 = Animelem = 71
Trigger10= Animelem = 79
pos      = 0, -60
time = 5
IgnoreHitPause = 1

[State 2305, 相手ステート制御]
Type     = TargetState
Trigger1 = Animelem = 7
Trigger2 = Animelem = 15
Trigger3 = Animelem = 23
Trigger4 = Animelem = 31
Trigger5 = Animelem = 39
Trigger6 = Animelem = 47
Trigger7 = Animelem = 55
Trigger8 = Animelem = 63
Trigger9 = Animelem = 71
Trigger10= Animelem = 79
value    = 2357

[State 2305]
type     = TargetBind
Trigger1 = Animelem = 8
Trigger2 = Animelem = 16
Trigger3 = Animelem = 24
Trigger4 = Animelem = 32
Trigger5 = Animelem = 40
Trigger6 = Animelem = 48
Trigger7 = Animelem = 56
Trigger8 = Animelem = 64
Trigger9 = Animelem = 72
Trigger10= Animelem = 80
pos      = 33, -62
time = 5
IgnoreHitPause = 1

[State 2305, 相手ステート制御]
Type     = TargetState
Trigger1 = Animelem = 8
Trigger2 = Animelem = 16
Trigger3 = Animelem = 24
Trigger4 = Animelem = 32
Trigger5 = Animelem = 40
Trigger6 = Animelem = 48
Trigger7 = Animelem = 56
Trigger8 = Animelem = 64
Trigger9 = Animelem = 72
Trigger10= Animelem = 80
value    = 2358

[State 2305]
type     = TargetBind
Trigger1 = Animelem = 81
pos      = 85, -92
IgnoreHitPause = 1

[State 2305, 相手ステート制御];最終
Type     = TargetState
Trigger1 = Animelem = 81
value    = 2359

;-------------------------------------------------[数値調整]

[State 2305, 相手ダメージ]
Type       = TargetLifeAdd
Trigger1   = Animelemtime(81) < 0
absolute   = 1			;防御力を反映する
value      = -floor(4*fvar(0))
kill       = 0
Persistent = 3

[State 2305, 相手ダメージ]
Type       = TargetLifeAdd
Trigger1   = Animelemtime(81) = 0
absolute   = 1			;防御力を反映する
value      = -floor(250*fvar(0))
Persistent = 0

;-------------------------------------------------[最後落下]

[State 2305, 速度]
type     = velSet
trigger1 = Animelem = 82
X = -2
Y = -4

[State 2305, 重力]
type     = VelAdd
trigger1 = Animelem = 82, >0
Y = 0.47

[State 2305, ステート変更]
type     = ChangeState
Trigger1 = (Pos Y >= 0)&&(Vel Y > 0)
value    = 2310
ctrl     = 0

;━━━━━━━━━━━━━━━━━━━━━
; 回転力は遠心力で破壊力や！ / 着地硬直
;━━━━━━━━━━━━━━━━━━━━━

[StateDef 2310]
Type     = S
Movetype = A
Physics  = N
velset   = 0, 0
Anim     = 2310
ctrl     = 0

[State 2310, ゲージ回復抑制]
Type           = varset
Trigger1       = fvar(22) < 120
IgnoreHitPause = 1
fvar(22)       = 120

;---------------------------------

[State 2310, 無敵]
type     = Nothitby
Trigger1 = 1
value    = ,AT

[State 2310, 接地]
type     = PosSet
trigger1 = Time = 0
Y        = 0

[State 2310, 効果音]
type     = PlaySnd
trigger1 = Time = 0
trigger2 = Animelem = 4
value    = s80, 9

[State 2310, 画面振動]
type     = EnvShake
trigger1 = !time
time     = 15
ampl     = 4

[State -2, Helper];ダウンエフェクト
type     = Helper
trigger1 = Time = 1
StateNo  = 7200
PosType  = P1
Pos      = 0, 0
Ownpal   = 1
ID       = 7200

;----------------------------------------[バウンド]

[State 2310, 状態変更]
type      = StatetypeSet
Trigger1  = Animelem = 2
Statetype = A
Movetype  = H

[State 2310]
type     = Velset
trigger1 = Animelem = 2
Y = -2.5

[State 2310]
type     = VelAdd
trigger1 = Animelem = 2, >= 0
Trigger1 = Animelem = 4, < 0
Y = 0.3

[State 2310]
type     = Velset
trigger1 = Pos Y > 0
Y = 0

;----------------------------------------[ダウン～リバーサル]

[State 2310]
type     = Velset
trigger1 = Animelem = 4
X = 0
Y = 0

[State 2310, 接地]
type     = PosSet
trigger1 = Animelem = 4
Y        = 0

[State 2310, 状態変更]
type      = StatetypeSet
Trigger1  = Animelem = 4
Statetype = L
Movetype  = H

[State 2310, 状態変更]
type      = StatetypeSet
Trigger1  = Animelem = 5
Statetype = S
Movetype  = I

[State 2310, 振り向き]
type     = Turn
trigger1 = Animtime = 0
trigger1 = P2dist X < 0

[State 2310, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;==================================================
; [ENEMY] 相手 / CHくらい(0)
;==================================================
[Statedef 2350]
Type     = A
MoveType = H
PhySics  = N
VelSet   = 0, 0
Sprpriority = -1

[State 2351, カメラ操作]
type       = ScreenBound
Trigger1   = 1
value      = 0
movecamera = 0, 0

[State 2351, NotHitBy];邪魔されない
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 2351]
type     = turn
trigger1 = facing = enemy,facing

[State 2351]
type     = AngleDraw
trigger1 = 1
value    = 80

[State 2351, 相手アニメ変更]
type     = ChangeAnim2
Trigger1 = !Time
value    = 2351

[State 2351];もしものために 
Type     = SelfState
Trigger1 = Time>= 150
value    = 5210


;==================================================
; [ENEMY] 相手 / CHくらい(1)
;==================================================
[Statedef 2351]
Type     = A
MoveType = H
PhySics  = N
VelSet   = 0, 0
Sprpriority = -1

[State 2351, カメラ操作]
type       = ScreenBound
Trigger1   = 1
value      = 0
movecamera = 0, 0

[State 2351, NotHitBy];邪魔されない
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 2351]
type     = turn
trigger1 = facing = enemy,facing

[State 2351]
type     = AngleDraw
trigger1 = 1
value    = 80

[State 2351, 相手アニメ変更]
type     = ChangeAnim2
Trigger1 = !Time
value    = 2351

[State 2351];もしものために 
Type     = SelfState
Trigger1 = Time>= 150
value    = 5210

;==================================================
; [ENEMY] 相手 / CHくらい(2)
;==================================================
[Statedef 2352]
Type     = A
MoveType = H
PhySics  = N
VelSet   = 0, 0
Sprpriority = -1

[State 2351, カメラ操作]
type       = ScreenBound
Trigger1   = 1
value      = 0
movecamera = 0, 0

[State 2352, NotHitBy];邪魔されない
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 2352]
type     = turn
trigger1 = facing = enemy,facing

[State 2352]
type     = AngleDraw
trigger1 = 1
value    = 60

[State 2352, 相手アニメ変更]
type     = ChangeAnim2
Trigger1 = !Time
value    = 2351

[State 2352];もしものために 
Type     = SelfState
Trigger1 = Time>= 150
value    = 5210

;==================================================
; [ENEMY] 相手 / CHくらい(3)
;==================================================
[Statedef 2353]
Type     = A
MoveType = H
PhySics  = N
VelSet   = 0, 0
Sprpriority = -1

[State 2351, カメラ操作]
type       = ScreenBound
Trigger1   = 1
value      = 0
movecamera = 0, 0

[State 2353, NotHitBy];邪魔されない
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 2353]
type     = turn
trigger1 = facing = enemy,facing

[State 2353]
type     = AngleDraw
trigger1 = 1
value    = 0

[State 2352, 相手アニメ変更]
type     = ChangeAnim2
Trigger1 = !Time
value    = 2351

[State 2353];もしものために 
Type     = SelfState
Trigger1 = Time>= 150
value    = 5210

;==================================================
; [ENEMY] 相手 / CHくらい(4)
;==================================================
[Statedef 2354]
Type     = A
MoveType = H
PhySics  = N
VelSet   = 0, 0
Sprpriority = -1

[State 2351, カメラ操作]
type       = ScreenBound
Trigger1   = 1
value      = 0
movecamera = 0, 0

[State 2354, NotHitBy];邪魔されない
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 2354]
type     = turn
trigger1 = facing = enemy,facing

[State 2354]
type     = AngleDraw
trigger1 = 1
value    = -60

[State 2354, 相手アニメ変更]
type     = ChangeAnim2
Trigger1 = !Time
value    = 2351

[State 2354];もしものために 
Type     = SelfState
Trigger1 = Time>= 150
value    = 5210

;==================================================
; [ENEMY] 相手 / CHくらい(5)
;==================================================
[Statedef 2355]
Type     = A
MoveType = H
PhySics  = N
VelSet   = 0, 0
Sprpriority = -1

[State 2351, カメラ操作]
type       = ScreenBound
Trigger1   = 1
value      = 0
movecamera = 0, 0

[State 2355, NotHitBy];邪魔されない
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 2355]
type     = turn
trigger1 = facing = enemy,facing

[State 2355]
type     = AngleDraw
trigger1 = 1
value    = -80

[State 2355, 相手アニメ変更]
type     = ChangeAnim2
Trigger1 = !Time
value    = 2351

[State 2355];もしものために 
Type     = SelfState
Trigger1 = Time>= 150
value    = 5210

;==================================================
; [ENEMY] 相手 / CHくらい(6)
;==================================================
[Statedef 2356]
Type     = A
MoveType = H
PhySics  = N
VelSet   = 0, 0
Sprpriority = 9

[State 2351, カメラ操作]
type       = ScreenBound
Trigger1   = 1
value      = 0
movecamera = 0, 0

[State 2356, NotHitBy];邪魔されない
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 2356]
type     = turn
trigger1 = facing = enemy,facing

[State 2356]
type     = AngleDraw
trigger1 = 1
value    = -140

[State 2356, 相手アニメ変更]
type     = ChangeAnim2
Trigger1 = !Time
value    = 2351

[State 2356];もしものために 
Type     = SelfState
Trigger1 = Time>= 150
value    = 5210

;==================================================
; [ENEMY] 相手 / CHくらい(7)
;==================================================
[Statedef 2357]
Type     = A
MoveType = H
PhySics  = N
VelSet   = 0, 0
Sprpriority = 9

[State 2351, カメラ操作]
type       = ScreenBound
Trigger1   = 1
value      = 0
movecamera = 0, 0

[State 2357, NotHitBy];邪魔されない
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 2357]
type     = turn
trigger1 = facing = enemy,facing

[State 2357]
type     = AngleDraw
trigger1 = 1
value    = -170

[State 2357, 相手アニメ変更]
type     = ChangeAnim2
Trigger1 = !Time
value    = 2351

[State 2357];もしものために 
Type     = SelfState
Trigger1 = Time>= 150
value    = 5210

;==================================================
; [ENEMY] 相手 / CHくらい(8)
;==================================================
[Statedef 2358]
Type     = A
MoveType = H
PhySics  = N
VelSet   = 0, 0
Sprpriority = 9

[State 2351, カメラ操作]
type       = ScreenBound
Trigger1   = 1
value      = 0
movecamera = 0, 0

[State 2358, NotHitBy];邪魔されない
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP

[State 2358]
type     = turn
trigger1 = facing = enemy,facing

[State 2358]
type     = AngleDraw
trigger1 = 1
value    = -230

[State 2358, 相手アニメ変更]
type     = ChangeAnim2
Trigger1 = !Time
value    = 2351

[State 2358];もしものために 
Type     = SelfState
Trigger1 = Time>= 150
value    = 5210


;==================================================
; [ENEMY] 相手 / CHくらい(ふっとび)
;==================================================
[Statedef 2359]
Type     = A
MoveType = H
PhySics  = N
VelSet   = 0, 0
Sprpriority = -1

[State 2359];相手のアニメ指定
Type     = ChangeAnim
Trigger1 = !Time
value    = 5050

[State 2358]
type     = AngleDraw
trigger1 = 1
value    = 0

[State 833]
type     = turn
trigger1 = facing = enemy,facing
trigger1 = time = 0

[State 2359]
Type     = VelSet
Trigger1 = !time
x = -8
y = -5.5

[State 2359]
Type     = Gravity
Trigger1 = Time > 0

;-------------------------------------------[ダウンへ]

[State 2359]
Type       =  SelfState;ChangeState
TriggerAll = Vel Y>0
Trigger1   = Pos Y>=0
value      = 5100

;==================================================
; [ENEMY] 相手 / EFCHくらい(落下)
;==================================================
[Statedef 2360]
Type     = A
MoveType = H
PhySics  = N
VelSet   = 0, 0
Sprpriority = -1

[State 2360];相手のアニメ指定
Type     = ChangeAnim
Trigger1 = !Time
value    = 5050

[State 2360]
type     = AngleDraw
trigger1 = 1
value    = 0

[State 2360]
type     = turn
trigger1 = facing = enemy,facing
trigger1 = time = 0

[State 2360]
Type     = VelSet
Trigger1 = !time
x = -0.5
y = -5.5

[State 2360]
Type     = Gravity
Trigger1 = Time > 0

;-------------------------------------------[ダウンへ]

[State 2360]
Type       =  SelfState;ChangeState
TriggerAll = Vel Y>0
Trigger1   = Pos Y>=0
value      = 5100



;============================================================
; [HELPER] ラリアット / 煙エフェクト
;============================================================
[Statedef 12310]
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

[State 12310, 速度]
type     = VelSet
trigger1 = !time
X        = 0
Y        = 3

;-------------------------------------------------[サイズ設定]

[State 123100, サイズ変更];墓石から
type     = AngleSet
trigger1 = !time
value    = (random%360)

[State 123100, サイズ変更];墓石から
type     = AngleDraw
trigger1 = 1
scale    = 1.5+(Time*0.05), 1.5+(Time*0.05)

;-------------------------------------------------[透過設定]

[State 12310, 透過処理]
Type     = Trans
Trigger1 = 1
trans    = addalpha
Alpha    = var(1), 256

[state 12310, 変数]
type     = VarAdd
trigger1 = Time < 5
var(1)   = 51

[state 12310, 変数]
type     = VarSet
trigger1 = Time = 5
var(1)   = 256

[state 12310, 変数]
type     = VarAdd
trigger1 = Time > 15
var(1)   = -18

;-------------------------------------------------[終了]

[State 12310, ヘルパー消滅]
type = DestroySelf
trigger1 = time >= 25
trigger2 = Var(1) < 0








;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 回転力は遠心力で破壊力や！ (EF)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2400]
Type     = S
MoveType = A
Physics  = S
Ctrl     = 0
velset   = 0, 0
Anim     = 2300
SprPriority = 2

;-------------------------------------------------[キャンセル補正]

[State a, 変数]  ;Chain spell補正
Type           = VarAdd
triggerAll     = Numenemy > 0
Trigger1       = !time
Trigger1       = (Enemynear,Movetype = H)
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = (1.0 - fvar(3))*0.3

;-----------------------------------------------------[ゲージ管理]

[State 2400, ゲージ減少]
Type           = varAdd
Trigger1       = !time
Persistent     = 0
IgnoreHitPause = 1
fvar(20)       = -3000

[State 2400, ゲージ回復抑制]
Type           = varset
Trigger1       = fvar(22) < 120
IgnoreHitPause = 1
fvar(22)       = 120

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = Animelem = 2
value    = s5, 2

[State a, 暗転処理]
type     = SuperPause
trigger1 = Animelem = 2
darken   = 0
anim     = -1
sound    = -1
time     = 60
movetime = 60
P2DefMul = 1

[state a, nothitby]
type     = nothitby
trigger1 = Time <= 64	;暗転+1F
value    = SCA,AA,AT,AP
time     = 1
ignorehitpause = 1

;-----------------------------------------------------[エフェクト]

[State a];カットイン
Type = Helper
Trigger1 = Animelem = 2
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = -140,0
PosType = back
StateNo = 10000
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

[State a];暗転処理
Type = Helper
Trigger1 = Animelem = 2
ID = 10000
Name = "Cut-in"
SprPriority = 3
Pos = 43, -131
PosType = P1
StateNo = 8806
SuperMoveTime=99999
PauseMoveTime=99999
KeyCtrl = 0 
Ownpal = 1

;=================================================================
;  |ここから攻撃ステート|
;=================================================================


[State a, 効果音]
type     = playsnd
trigger1 = Animelem = 5
value    = s2, 2

[State 2300, 状態変更]
type     = StatetypeSet
Trigger1 = Animelem = 8
Movetype = I

;-------------------------------------------------[攻撃判定]

[State 2300, HitDef]
type          = HitDef
Trigger1      = AnimElem = 3
Trigger1      = P2StateNo != [150, 153]
attr          = S, HT
damage        = 0
getpower = 30,15
hitflag       = MA
priority      = 3, miss
pausetime     = 0, 0
sparkno       = -1
sparkxy       = 0, 0
hitsound      = -1
guard.sparkno = -1
guardsound    = -1
P1facing      = 1
P2facing      = 1
Fall          = 0
Kill          = 0
P2stateno     = 2350
ID            = 2300

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * ifelse(fvar(2)=1, 0.91, 1.0)

;-------------------------------------------------[攻撃状態終了]

[State 2400, ステート変更] ;成功
Type     = ChangeState
Trigger1 = MoveHit
value    = 2405

[State 2400, 終了]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 回転力は遠心力で破壊力や！(EF) / 回転中
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2405]
type     = A
movetype = A
physics  = N
velset   = 0, 0
ctrl     = 0
anim     = 2405

[State 2405, NotHitBy]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AT,AP
IgnoreHitPause = 1

[State 2405, Width 2-11]
type = Width
trigger1 = time = 0
edge = 40,0

;-------------------------------------------------[演出-1]

[State 2405, 変数0];バーニア表示時間
type     = VarSet
Trigger1 = !time
var(0)   = 5

[State 2405, 変数1];バーニア表示時間
type     = VarSet
Trigger1 = !time
var(1)   = 4

[State 2405, 変数];バーニア表示時間
type     = null
Trigger1 = AnimElemTime(17) = 0
Trigger1 = var(0) := 4
Trigger1 = var(1) := 3
Trigger2 = AnimElemTime(41) = 0
Trigger2 = var(0) := 3
Trigger2 = var(1) := 2
Trigger3 = AnimElemTime(65) = 0
Trigger3 = var(0) := 2
Trigger3 = var(1) := 1
Trigger4 = AnimElemTime(97) = 0
Trigger4 = var(0) := 1

[State 2405, バーニア表示A];(スピード変化)
type     = Explod
Trigger1 = Animelemtime(1) = 0
Trigger2 = Animelemtime(17) = 0
Trigger3 = Animelemtime(41) = 0
Trigger4 = Animelemtime(65) = 0
anim     = 4062
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(1)

[State 2405, バーニア表示B]
type     = Explod
Trigger1 = Animelemtime(1) = 0
Trigger2 = Animelemtime(17) = 0
Trigger3 = Animelemtime(41) = 0
Trigger4 = Animelemtime(65) = 0
anim     = 4081
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = Var(1)

[State 2305, バーニア表示C]
type     = Explod
Trigger1 = Animelemtime(1) = 0
Trigger2 = Animelemtime(17) = 0
Trigger3 = Animelemtime(41) = 0
Trigger4 = Animelemtime(65) = 0
anim     = 4082
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = Var(1)

[State 2305, バーニア表示A2]
type     = Explod
Trigger1 = Animelemtime(9) = 0
Trigger2 = Animelemtime(25) = 0
Trigger3 = Animelemtime(33) = 0
Trigger4 = Animelemtime(49) = 0
Trigger5 = Animelemtime(57) = 0
Trigger6 = Animelemtime(73) = 0
Trigger7 = Animelemtime(81) = 0
Trigger8 = Animelemtime(89) = 0
Trigger9 = Animelemtime(97) = 0
Trigger10= Animelemtime(105) = 0
Trigger11= Animelemtime(113) = 0
Trigger12= Animelemtime(121) = 0
Trigger13= Animelemtime(129) = 0
Trigger14= Animelemtime(137) = 0
Trigger15= Animelemtime(145) = 0
Trigger16= Animelemtime(153) = 0
Trigger17= Animelemtime(161) = 0
Trigger18= Animelemtime(169) = 0
Trigger19= Animelemtime(177) = 0
Trigger20= Animelemtime(185) = 0
Trigger21= Animelemtime(193) = 0
anim     = 4062
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示B2]
type     = Explod
Trigger1 = Animelemtime(9) = 0
Trigger2 = Animelemtime(25) = 0
Trigger3 = Animelemtime(33) = 0
Trigger4 = Animelemtime(49) = 0
Trigger5 = Animelemtime(57) = 0
Trigger6 = Animelemtime(73) = 0
Trigger7 = Animelemtime(81) = 0
Trigger8 = Animelemtime(89) = 0
Trigger9 = Animelemtime(97) = 0
Trigger10= Animelemtime(105) = 0
Trigger11= Animelemtime(113) = 0
Trigger12= Animelemtime(121) = 0
Trigger13= Animelemtime(129) = 0
Trigger14= Animelemtime(137) = 0
Trigger15= Animelemtime(145) = 0
Trigger16= Animelemtime(153) = 0
Trigger17= Animelemtime(161) = 0
Trigger18= Animelemtime(169) = 0
Trigger19= Animelemtime(177) = 0
Trigger20= Animelemtime(185) = 0
Trigger21= Animelemtime(193) = 0
anim     = 4063
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示C2]
type     = Explod
Trigger1 = Animelemtime(9) = 0
Trigger2 = Animelemtime(25) = 0
Trigger3 = Animelemtime(33) = 0
Trigger4 = Animelemtime(49) = 0
Trigger5 = Animelemtime(57) = 0
Trigger6 = Animelemtime(73) = 0
Trigger7 = Animelemtime(81) = 0
Trigger8 = Animelemtime(89) = 0
Trigger9 = Animelemtime(97) = 0
Trigger10= Animelemtime(105) = 0
Trigger11= Animelemtime(113) = 0
Trigger12= Animelemtime(121) = 0
Trigger13= Animelemtime(129) = 0
Trigger14= Animelemtime(137) = 0
Trigger15= Animelemtime(145) = 0
Trigger16= Animelemtime(153) = 0
Trigger17= Animelemtime(161) = 0
Trigger18= Animelemtime(169) = 0
Trigger19= Animelemtime(177) = 0
Trigger20= Animelemtime(185) = 0
Trigger21= Animelemtime(193) = 0
anim     = 4063
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

;=========================================

[State 2305, バーニア表示D]
type     = Explod
Trigger1 = Animelemtime(2)  = 0
Trigger2 = Animelemtime(10) = 0
Trigger3 = Animelemtime(18) = 0
Trigger4 = Animelemtime(26) = 0
Trigger5 = Animelemtime(34) = 0
Trigger6 = Animelemtime(42) = 0
Trigger7 = Animelemtime(50) = 0
Trigger8 = Animelemtime(58) = 0
Trigger9 = Animelemtime(66) = 0
Trigger10= Animelemtime(74) = 0
Trigger11= Animelemtime(82) = 0
Trigger12= Animelemtime(90) = 0
Trigger13= Animelemtime(98) = 0
Trigger14= Animelemtime(106) = 0
Trigger15= Animelemtime(114) = 0
Trigger16= Animelemtime(122) = 0
Trigger17= Animelemtime(130) = 0
Trigger18= Animelemtime(138) = 0
Trigger19= Animelemtime(146) = 0
Trigger20= Animelemtime(154) = 0
Trigger21= Animelemtime(162) = 0
Trigger22= Animelemtime(170) = 0
Trigger23= Animelemtime(178) = 0
Trigger24= Animelemtime(186) = 0
Trigger25= Animelemtime(194) = 0
anim     = 4063
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示E]
type     = Explod
Trigger1 = Animelemtime(2)  = 0
Trigger2 = Animelemtime(10) = 0
Trigger3 = Animelemtime(18) = 0
Trigger4 = Animelemtime(26) = 0
Trigger5 = Animelemtime(34) = 0
Trigger6 = Animelemtime(42) = 0
Trigger7 = Animelemtime(50) = 0
Trigger8 = Animelemtime(58) = 0
Trigger9 = Animelemtime(66) = 0
Trigger10= Animelemtime(74) = 0
Trigger11= Animelemtime(82) = 0
Trigger12= Animelemtime(90) = 0
Trigger13= Animelemtime(98) = 0
Trigger14= Animelemtime(106) = 0
Trigger15= Animelemtime(114) = 0
Trigger16= Animelemtime(122) = 0
Trigger17= Animelemtime(130) = 0
Trigger18= Animelemtime(138) = 0
Trigger19= Animelemtime(146) = 0
Trigger20= Animelemtime(154) = 0
Trigger21= Animelemtime(162) = 0
Trigger22= Animelemtime(170) = 0
Trigger23= Animelemtime(178) = 0
Trigger24= Animelemtime(186) = 0
Trigger25= Animelemtime(194) = 0
anim     = 4064
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示F]
type     = Explod
Trigger1 = Animelemtime(2)  = 0
Trigger2 = Animelemtime(10) = 0
Trigger3 = Animelemtime(18) = 0
Trigger4 = Animelemtime(26) = 0
Trigger5 = Animelemtime(34) = 0
Trigger6 = Animelemtime(42) = 0
Trigger7 = Animelemtime(50) = 0
Trigger8 = Animelemtime(58) = 0
Trigger9 = Animelemtime(66) = 0
Trigger10= Animelemtime(74) = 0
Trigger11= Animelemtime(82) = 0
Trigger12= Animelemtime(90) = 0
Trigger13= Animelemtime(98) = 0
Trigger14= Animelemtime(106) = 0
Trigger15= Animelemtime(114) = 0
Trigger16= Animelemtime(122) = 0
Trigger17= Animelemtime(130) = 0
Trigger18= Animelemtime(138) = 0
Trigger19= Animelemtime(146) = 0
Trigger20= Animelemtime(154) = 0
Trigger21= Animelemtime(162) = 0
Trigger22= Animelemtime(170) = 0
Trigger23= Animelemtime(178) = 0
Trigger24= Animelemtime(186) = 0
Trigger25= Animelemtime(194) = 0
anim     = 4065
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)

;=========================================

[State 2305, バーニア表示G]
type     = Explod
Trigger1 = Animelemtime(3)  = 0
Trigger2 = Animelemtime(11) = 0
Trigger3 = Animelemtime(19) = 0
Trigger4 = Animelemtime(27) = 0
Trigger5 = Animelemtime(35) = 0
Trigger6 = Animelemtime(43) = 0
Trigger7 = Animelemtime(51) = 0
Trigger8 = Animelemtime(59) = 0
Trigger9 = Animelemtime(67) = 0
Trigger10= Animelemtime(75) = 0
Trigger11= Animelemtime(83) = 0
Trigger12= Animelemtime(91) = 0
Trigger13= Animelemtime(99) = 0
Trigger14= Animelemtime(107) = 0
Trigger15= Animelemtime(115) = 0
Trigger16= Animelemtime(123) = 0
Trigger17= Animelemtime(131) = 0
Trigger18= Animelemtime(139) = 0
Trigger19= Animelemtime(147) = 0
Trigger20= Animelemtime(155) = 0
Trigger21= Animelemtime(163) = 0
Trigger22= Animelemtime(171) = 0
Trigger23= Animelemtime(179) = 0
Trigger24= Animelemtime(187) = 0
Trigger25= Animelemtime(195) = 0
anim     = 4066
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示H]
type     = Explod
Trigger1 = Animelemtime(3)  = 0
Trigger2 = Animelemtime(11) = 0
Trigger3 = Animelemtime(19) = 0
Trigger4 = Animelemtime(27) = 0
Trigger5 = Animelemtime(35) = 0
Trigger6 = Animelemtime(43) = 0
Trigger7 = Animelemtime(51) = 0
Trigger8 = Animelemtime(59) = 0
Trigger9 = Animelemtime(67) = 0
Trigger10= Animelemtime(75) = 0
Trigger11= Animelemtime(83) = 0
Trigger12= Animelemtime(91) = 0
Trigger13= Animelemtime(99) = 0
Trigger14= Animelemtime(107) = 0
Trigger15= Animelemtime(115) = 0
Trigger16= Animelemtime(123) = 0
Trigger17= Animelemtime(131) = 0
Trigger18= Animelemtime(139) = 0
Trigger19= Animelemtime(147) = 0
Trigger20= Animelemtime(155) = 0
Trigger21= Animelemtime(163) = 0
Trigger22= Animelemtime(171) = 0
Trigger23= Animelemtime(179) = 0
Trigger24= Animelemtime(187) = 0
Trigger25= Animelemtime(195) = 0
anim     = 4067
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示I]
type     = Explod
Trigger1 = Animelemtime(3)  = 0
Trigger2 = Animelemtime(11) = 0
Trigger3 = Animelemtime(19) = 0
Trigger4 = Animelemtime(27) = 0
Trigger5 = Animelemtime(35) = 0
Trigger6 = Animelemtime(43) = 0
Trigger7 = Animelemtime(51) = 0
Trigger8 = Animelemtime(59) = 0
Trigger9 = Animelemtime(67) = 0
Trigger10= Animelemtime(75) = 0
Trigger11= Animelemtime(83) = 0
Trigger12= Animelemtime(91) = 0
Trigger13= Animelemtime(99) = 0
Trigger14= Animelemtime(107) = 0
Trigger15= Animelemtime(115) = 0
Trigger16= Animelemtime(123) = 0
Trigger17= Animelemtime(131) = 0
Trigger18= Animelemtime(139) = 0
Trigger19= Animelemtime(147) = 0
Trigger20= Animelemtime(155) = 0
Trigger21= Animelemtime(163) = 0
Trigger22= Animelemtime(171) = 0
Trigger23= Animelemtime(179) = 0
Trigger24= Animelemtime(187) = 0
Trigger25= Animelemtime(195) = 0
anim     = 4068
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示J]
type     = Explod
Trigger1 = Animelemtime(3)  = 0
Trigger2 = Animelemtime(11) = 0
Trigger3 = Animelemtime(19) = 0
Trigger4 = Animelemtime(27) = 0
Trigger5 = Animelemtime(35) = 0
Trigger6 = Animelemtime(43) = 0
Trigger7 = Animelemtime(51) = 0
Trigger8 = Animelemtime(59) = 0
Trigger9 = Animelemtime(67) = 0
Trigger10= Animelemtime(75) = 0
Trigger11= Animelemtime(83) = 0
Trigger12= Animelemtime(91) = 0
Trigger13= Animelemtime(99) = 0
Trigger14= Animelemtime(107) = 0
Trigger15= Animelemtime(115) = 0
Trigger16= Animelemtime(123) = 0
Trigger17= Animelemtime(131) = 0
Trigger18= Animelemtime(139) = 0
Trigger19= Animelemtime(147) = 0
Trigger20= Animelemtime(155) = 0
Trigger21= Animelemtime(163) = 0
Trigger22= Animelemtime(171) = 0
Trigger23= Animelemtime(179) = 0
Trigger24= Animelemtime(187) = 0
Trigger25= Animelemtime(195) = 0
anim     = 4069
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

;=========================================

[State 2305, バーニア表示K]
type     = Explod
Trigger1 = Animelemtime(4)  = 0
Trigger2 = Animelemtime(12) = 0
Trigger3 = Animelemtime(20) = 0
Trigger4 = Animelemtime(28) = 0
Trigger5 = Animelemtime(36) = 0
Trigger6 = Animelemtime(44) = 0
Trigger7 = Animelemtime(52) = 0
Trigger8 = Animelemtime(60) = 0
Trigger9 = Animelemtime(68) = 0
Trigger10= Animelemtime(76) = 0
Trigger11= Animelemtime(84) = 0
Trigger12= Animelemtime(92) = 0
Trigger13= Animelemtime(100) = 0
Trigger14= Animelemtime(108) = 0
Trigger15= Animelemtime(116) = 0
Trigger16= Animelemtime(124) = 0
Trigger17= Animelemtime(132) = 0
Trigger18= Animelemtime(140) = 0
Trigger19= Animelemtime(148) = 0
Trigger20= Animelemtime(156) = 0
Trigger21= Animelemtime(164) = 0
Trigger22= Animelemtime(172) = 0
Trigger23= Animelemtime(180) = 0
Trigger24= Animelemtime(188) = 0
Trigger25= Animelemtime(196) = 0
anim     = 4070
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示L]
type     = Explod
Trigger1 = Animelemtime(4)  = 0
Trigger2 = Animelemtime(12) = 0
Trigger3 = Animelemtime(20) = 0
Trigger4 = Animelemtime(28) = 0
Trigger5 = Animelemtime(36) = 0
Trigger6 = Animelemtime(44) = 0
Trigger7 = Animelemtime(52) = 0
Trigger8 = Animelemtime(60) = 0
Trigger9 = Animelemtime(68) = 0
Trigger10= Animelemtime(76) = 0
Trigger11= Animelemtime(84) = 0
Trigger12= Animelemtime(92) = 0
Trigger13= Animelemtime(100) = 0
Trigger14= Animelemtime(108) = 0
Trigger15= Animelemtime(116) = 0
Trigger16= Animelemtime(124) = 0
Trigger17= Animelemtime(132) = 0
Trigger18= Animelemtime(140) = 0
Trigger19= Animelemtime(148) = 0
Trigger20= Animelemtime(156) = 0
Trigger21= Animelemtime(164) = 0
Trigger22= Animelemtime(172) = 0
Trigger23= Animelemtime(180) = 0
Trigger24= Animelemtime(188) = 0
Trigger25= Animelemtime(196) = 0
anim     = 4071
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示M]
type     = Explod
Trigger1 = Animelemtime(4)  = 0
Trigger2 = Animelemtime(12) = 0
Trigger3 = Animelemtime(20) = 0
Trigger4 = Animelemtime(28) = 0
Trigger5 = Animelemtime(36) = 0
Trigger6 = Animelemtime(44) = 0
Trigger7 = Animelemtime(52) = 0
Trigger8 = Animelemtime(60) = 0
Trigger9 = Animelemtime(68) = 0
Trigger10= Animelemtime(76) = 0
Trigger11= Animelemtime(84) = 0
Trigger12= Animelemtime(92) = 0
Trigger13= Animelemtime(100) = 0
Trigger14= Animelemtime(108) = 0
Trigger15= Animelemtime(116) = 0
Trigger16= Animelemtime(124) = 0
Trigger17= Animelemtime(132) = 0
Trigger18= Animelemtime(140) = 0
Trigger19= Animelemtime(148) = 0
Trigger20= Animelemtime(156) = 0
Trigger21= Animelemtime(164) = 0
Trigger22= Animelemtime(172) = 0
Trigger23= Animelemtime(180) = 0
Trigger24= Animelemtime(188) = 0
Trigger25= Animelemtime(196) = 0
anim     = 4072
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

;=========================================

[State 2305, バーニア表示N]
type     = Explod
Trigger1 = Animelemtime(5) = 0
Trigger2 = Animelemtime(13) = 0
Trigger3 = Animelemtime(21) = 0
Trigger4 = Animelemtime(29) = 0
Trigger5 = Animelemtime(37) = 0
Trigger6 = Animelemtime(45) = 0
Trigger7 = Animelemtime(53) = 0
Trigger8 = Animelemtime(61) = 0
Trigger9 = Animelemtime(69) = 0
Trigger10= Animelemtime(77) = 0
Trigger11= Animelemtime(85) = 0
Trigger12= Animelemtime(93) = 0
Trigger13= Animelemtime(101) = 0
Trigger14= Animelemtime(109) = 0
Trigger15= Animelemtime(117) = 0
Trigger16= Animelemtime(125) = 0
Trigger17= Animelemtime(133) = 0
Trigger18= Animelemtime(141) = 0
Trigger19= Animelemtime(149) = 0
Trigger20= Animelemtime(157) = 0
Trigger21= Animelemtime(165) = 0
Trigger22= Animelemtime(173) = 0
Trigger23= Animelemtime(181) = 0
Trigger24= Animelemtime(189) = 0
Trigger25= Animelemtime(197) = 0
anim     = 4073
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示O]
type     = Explod
Trigger1 = Animelemtime(5) = 0
Trigger2 = Animelemtime(13) = 0
Trigger3 = Animelemtime(21) = 0
Trigger4 = Animelemtime(29) = 0
Trigger5 = Animelemtime(37) = 0
Trigger6 = Animelemtime(45) = 0
Trigger7 = Animelemtime(53) = 0
Trigger8 = Animelemtime(61) = 0
Trigger9 = Animelemtime(69) = 0
Trigger10= Animelemtime(77) = 0
Trigger11= Animelemtime(85) = 0
Trigger12= Animelemtime(93) = 0
Trigger13= Animelemtime(101) = 0
Trigger14= Animelemtime(109) = 0
Trigger15= Animelemtime(117) = 0
Trigger16= Animelemtime(125) = 0
Trigger17= Animelemtime(133) = 0
Trigger18= Animelemtime(141) = 0
Trigger19= Animelemtime(149) = 0
Trigger20= Animelemtime(157) = 0
Trigger21= Animelemtime(165) = 0
Trigger22= Animelemtime(173) = 0
Trigger23= Animelemtime(181) = 0
Trigger24= Animelemtime(189) = 0
Trigger25= Animelemtime(197) = 0
anim     = 4074
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1
removetime = var(0)

;=========================================

[State 2305, バーニア表示P]
type     = Explod
Trigger1 = Animelemtime(6) = 0
Trigger2 = Animelemtime(14) = 0
Trigger3 = Animelemtime(22) = 0
Trigger4 = Animelemtime(30) = 0
Trigger5 = Animelemtime(38) = 0
Trigger6 = Animelemtime(46) = 0
Trigger7 = Animelemtime(54) = 0
Trigger8 = Animelemtime(62) = 0
Trigger9 = Animelemtime(70) = 0
Trigger10= Animelemtime(78) = 0
Trigger11= Animelemtime(86) = 0
Trigger12= Animelemtime(94) = 0
Trigger13= Animelemtime(102) = 0
Trigger14= Animelemtime(110) = 0
Trigger15= Animelemtime(118) = 0
Trigger16= Animelemtime(126) = 0
Trigger17= Animelemtime(134) = 0
Trigger18= Animelemtime(142) = 0
Trigger19= Animelemtime(150) = 0
Trigger20= Animelemtime(158) = 0
Trigger21= Animelemtime(166) = 0
Trigger22= Animelemtime(174) = 0
Trigger23= Animelemtime(182) = 0
Trigger24= Animelemtime(190) = 0
Trigger25= Animelemtime(198) = 0
anim     = 4075
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示Q]
type     = Explod
Trigger1 = Animelemtime(6) = 0
Trigger2 = Animelemtime(14) = 0
Trigger3 = Animelemtime(22) = 0
Trigger4 = Animelemtime(30) = 0
Trigger5 = Animelemtime(38) = 0
Trigger6 = Animelemtime(46) = 0
Trigger7 = Animelemtime(54) = 0
Trigger8 = Animelemtime(62) = 0
Trigger9 = Animelemtime(70) = 0
Trigger10= Animelemtime(78) = 0
Trigger11= Animelemtime(86) = 0
Trigger12= Animelemtime(94) = 0
Trigger13= Animelemtime(102) = 0
Trigger14= Animelemtime(110) = 0
Trigger15= Animelemtime(118) = 0
Trigger16= Animelemtime(126) = 0
Trigger17= Animelemtime(134) = 0
Trigger18= Animelemtime(142) = 0
Trigger19= Animelemtime(150) = 0
Trigger20= Animelemtime(158) = 0
Trigger21= Animelemtime(166) = 0
Trigger22= Animelemtime(174) = 0
Trigger23= Animelemtime(182) = 0
Trigger24= Animelemtime(190) = 0
Trigger25= Animelemtime(198) = 0
anim     = 4076
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)

;=========================================

[State 2305, バーニア表示R]
type     = Explod
Trigger1 = Animelemtime(7) = 0
Trigger2 = Animelemtime(15) = 0
Trigger3 = Animelemtime(23) = 0
Trigger4 = Animelemtime(31) = 0
Trigger5 = Animelemtime(39) = 0
Trigger6 = Animelemtime(47) = 0
Trigger7 = Animelemtime(55) = 0
Trigger8 = Animelemtime(63) = 0
Trigger9 = Animelemtime(71) = 0
Trigger10= Animelemtime(79) = 0
Trigger11= Animelemtime(87) = 0
Trigger12= Animelemtime(95) = 0
Trigger13= Animelemtime(103) = 0
Trigger14= Animelemtime(111) = 0
Trigger15= Animelemtime(119) = 0
Trigger16= Animelemtime(127) = 0
Trigger17= Animelemtime(135) = 0
Trigger18= Animelemtime(143) = 0
Trigger19= Animelemtime(151) = 0
Trigger20= Animelemtime(159) = 0
Trigger21= Animelemtime(167) = 0
Trigger22= Animelemtime(175) = 0
Trigger23= Animelemtime(183) = 0
Trigger24= Animelemtime(191) = 0
Trigger25= Animelemtime(199) = 0
anim     = 4077
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示S]
type     = Explod
Trigger1 = Animelemtime(7) = 0
Trigger2 = Animelemtime(15) = 0
Trigger3 = Animelemtime(23) = 0
Trigger4 = Animelemtime(31) = 0
Trigger5 = Animelemtime(39) = 0
Trigger6 = Animelemtime(47) = 0
Trigger7 = Animelemtime(55) = 0
Trigger8 = Animelemtime(63) = 0
Trigger9 = Animelemtime(71) = 0
Trigger10= Animelemtime(79) = 0
Trigger11= Animelemtime(87) = 0
Trigger12= Animelemtime(95) = 0
Trigger13= Animelemtime(103) = 0
Trigger14= Animelemtime(111) = 0
Trigger15= Animelemtime(119) = 0
Trigger16= Animelemtime(127) = 0
Trigger17= Animelemtime(135) = 0
Trigger18= Animelemtime(143) = 0
Trigger19= Animelemtime(151) = 0
Trigger20= Animelemtime(159) = 0
Trigger21= Animelemtime(167) = 0
Trigger22= Animelemtime(175) = 0
Trigger23= Animelemtime(183) = 0
Trigger24= Animelemtime(191) = 0
Trigger25= Animelemtime(199) = 0
anim     = 4078
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)

;=========================================

[State 2305, バーニア表示U]
type     = Explod
Trigger1 = Animelemtime(8) = 0
Trigger2 = Animelemtime(16) = 0
Trigger3 = Animelemtime(24) = 0
Trigger4 = Animelemtime(32) = 0
Trigger5 = Animelemtime(40) = 0
Trigger6 = Animelemtime(48) = 0
Trigger7 = Animelemtime(56) = 0
Trigger8 = Animelemtime(64) = 0
Trigger9 = Animelemtime(72) = 0
Trigger10= Animelemtime(80) = 0
Trigger11= Animelemtime(88) = 0
Trigger12= Animelemtime(96) = 0
Trigger13= Animelemtime(104) = 0
Trigger14= Animelemtime(112) = 0
Trigger15= Animelemtime(120) = 0
Trigger16= Animelemtime(128) = 0
Trigger17= Animelemtime(136) = 0
Trigger18= Animelemtime(144) = 0
Trigger19= Animelemtime(152) = 0
Trigger20= Animelemtime(160) = 0
Trigger21= Animelemtime(168) = 0
Trigger22= Animelemtime(176) = 0
Trigger23= Animelemtime(184) = 0
Trigger24= Animelemtime(192) = 0
Trigger25= Animelemtime(200) = 0
anim     = 4079
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)

[State 2305, バーニア表示V]
type     = Explod
Trigger1 = Animelemtime(8) = 0
Trigger2 = Animelemtime(16) = 0
Trigger3 = Animelemtime(24) = 0
Trigger4 = Animelemtime(32) = 0
Trigger5 = Animelemtime(40) = 0
Trigger6 = Animelemtime(48) = 0
Trigger7 = Animelemtime(56) = 0
Trigger8 = Animelemtime(64) = 0
Trigger9 = Animelemtime(72) = 0
Trigger10= Animelemtime(80) = 0
Trigger11= Animelemtime(88) = 0
Trigger12= Animelemtime(96) = 0
Trigger13= Animelemtime(104) = 0
Trigger14= Animelemtime(112) = 0
Trigger15= Animelemtime(120) = 0
Trigger16= Animelemtime(128) = 0
Trigger17= Animelemtime(136) = 0
Trigger18= Animelemtime(144) = 0
Trigger19= Animelemtime(152) = 0
Trigger20= Animelemtime(160) = 0
Trigger21= Animelemtime(168) = 0
Trigger22= Animelemtime(176) = 0
Trigger23= Animelemtime(184) = 0
Trigger24= Animelemtime(192) = 0
Trigger25= Animelemtime(200) = 0
anim     = 4080
ID       = 4062
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
RemoveOnGetHit = 1
removetime = var(0)


;--------------------------------------------------------------------

[State 2405, 効果音]
type     = PlaySnd
Trigger1 = Animelem = 7
Trigger2 = Animelem = 15
Trigger3 = Animelem = 23
Trigger4 = Animelem = 31
Trigger5 = Animelem = 39
Trigger6 = Animelem = 47
Trigger7 = Animelem = 55
Trigger8 = Animelem = 63
Trigger9 = Animelem = 71
Trigger10= Animelem = 79
Trigger11= Animelem = 87
Trigger12= Animelem = 95
Trigger13= Animelem = 103
Trigger14= Animelem = 111
Trigger15= Animelem = 119
Trigger16= Animelem = 127
Trigger17= Animelem = 135
Trigger18= Animelem = 143
Trigger19= Animelem = 151
Trigger20= Animelem = 159
Trigger21= Animelem = 167
Trigger22= Animelem = 175
Trigger23= Animelem = 183
Trigger24= Animelem = 191
value    = s80, 16

[state 2405, 速度]
type     = Velset
trigger1 = !time
Y        = -3

[state 2405, 速度]
type     = Velset
trigger1 = Animelem = 41
Y        = -2

[state 2405, 速度]
type     = Velset
trigger1 = Animelem = 65
Y        = -1.5

[State 2405, 煙エフェクト]
Type       = Helper
TriggerAll = time%9 = 0
trigger1   = (Animelemtime(200) < 0)
StateNo    = 12310
ID         = 12310
Name       = "Smoke-Effect"
Pos        = -20+(random%40), -50+(-20+(random%40))
PosType    = P1
Ownpal     = 1
IgnoreHitPause = 1

[State 2405, 爆発]
type        = Helper
trigger1    = Animelemtime(201) = 0
trigger2    = Animelemtime(201) = 5
trigger3    = Animelemtime(201) = 10
trigger4    = Animelemtime(201) = 15
trigger5    = Animelemtime(201) = 20
name        = "Spell-Bomb"
ID          = 12410
postype     = P1
pos         = -50+(random%100), -50+(-50+(random%100))
Stateno     = 12410
size.xscale = 4
size.yscale = 4
ownpal      = 1
ignorehitpause = 1

[State -2, パレット変更] ;トランザム!
type     = Palfx
trigger1 = Animelemtime(97) > 0
trigger1 = Animelemtime(201) < 0
Mul      = 200,200,200
Add      = 100,-120,-120
time     = 1
ignorehitpause = 1

;-------------------------------------------------[ターゲット制御]

[State 2405, 相手ステート制御]
Type     = TargetState
Trigger1 = !time
Trigger2 = Animelem = 9
Trigger3 = Animelem = 17
Trigger4 = Animelem = 25
Trigger5 = Animelem = 33
Trigger6 = Animelem = 41
Trigger7 = Animelem = 49
Trigger8 = Animelem = 57
Trigger9 = Animelem = 65
Trigger10= Animelem = 73
Trigger11= Animelem = 81
Trigger12= Animelem = 89
Trigger13= Animelem = 97
Trigger14= Animelem = 105
Trigger15= Animelem = 113
Trigger16= Animelem = 121
Trigger17= Animelem = 129
Trigger18= Animelem = 137
Trigger19= Animelem = 145
Trigger20= Animelem = 153
Trigger21= Animelem = 161
Trigger22= Animelem = 169
Trigger23= Animelem = 177
Trigger24= Animelem = 185
Trigger25= Animelem = 193
value    = 2351

[State 2405]
type     = TargetBind
Trigger1 = !time
Trigger2 = Animelem = 9
Trigger3 = Animelem = 17
Trigger4 = Animelem = 25
Trigger5 = Animelem = 33
Trigger6 = Animelem = 41
Trigger7 = Animelem = 49
Trigger8 = Animelem = 57
Trigger9 = Animelem = 65
Trigger10= Animelem = 73
Trigger11= Animelem = 81
Trigger12= Animelem = 89
Trigger13= Animelem = 97
Trigger14= Animelem = 105
Trigger15= Animelem = 113
Trigger16= Animelem = 121
Trigger17= Animelem = 129
Trigger18= Animelem = 137
Trigger19= Animelem = 145
Trigger20= Animelem = 153
Trigger21= Animelem = 161
Trigger22= Animelem = 169
Trigger23= Animelem = 177
Trigger24= Animelem = 185
Trigger25= Animelem = 193
pos      = 85, -92
time = 5
IgnoreHitPause = 1

[State 2405, 相手ステート制御]
Type     = TargetState
Trigger1 = Animelem = 2
Trigger2 = Animelem = 10
Trigger3 = Animelem = 18
Trigger4 = Animelem = 26
Trigger5 = Animelem = 34
Trigger6 = Animelem = 42
Trigger7 = Animelem = 50
Trigger8 = Animelem = 58
Trigger9 = Animelem = 66
Trigger10= Animelem = 74
Trigger11= Animelem = 82
Trigger12= Animelem = 90
Trigger13= Animelem = 98
Trigger14= Animelem = 106
Trigger15= Animelem = 114
Trigger16= Animelem = 122
Trigger17= Animelem = 130
Trigger18= Animelem = 138
Trigger19= Animelem = 146
Trigger20= Animelem = 154
Trigger21= Animelem = 162
Trigger22= Animelem = 170
Trigger23= Animelem = 178
Trigger24= Animelem = 186
Trigger25= Animelem = 194
value    = 2352

[State 2405]
type     = TargetBind
Trigger1 = Animelem = 2
Trigger2 = Animelem = 10
Trigger3 = Animelem = 18
Trigger4 = Animelem = 26
Trigger5 = Animelem = 34
Trigger6 = Animelem = 42
Trigger7 = Animelem = 50
Trigger8 = Animelem = 58
Trigger9 = Animelem = 66
Trigger10= Animelem = 74
Trigger11= Animelem = 82
Trigger12= Animelem = 90
Trigger13= Animelem = 98
Trigger14= Animelem = 106
Trigger15= Animelem = 114
Trigger16= Animelem = 122
Trigger17= Animelem = 130
Trigger18= Animelem = 138
Trigger19= Animelem = 146
Trigger20= Animelem = 154
Trigger21= Animelem = 162
Trigger22= Animelem = 170
Trigger23= Animelem = 178
Trigger24= Animelem = 186
Trigger25= Animelem = 194
pos      = 90, -105
time = 5
IgnoreHitPause = 1

[State 2405]
type     = TargetBind
Trigger1 = Animelem = 3
Trigger2 = Animelem = 11
Trigger3 = Animelem = 19
Trigger4 = Animelem = 27
Trigger5 = Animelem = 35
Trigger6 = Animelem = 43
Trigger7 = Animelem = 51
Trigger8 = Animelem = 59
Trigger9 = Animelem = 67
Trigger10= Animelem = 75
Trigger11= Animelem = 83
Trigger12= Animelem = 91
Trigger13= Animelem = 99
Trigger14= Animelem = 107
Trigger15= Animelem = 115
Trigger16= Animelem = 123
Trigger17= Animelem = 131
Trigger18= Animelem = 139
Trigger19= Animelem = 147
Trigger20= Animelem = 155
Trigger21= Animelem = 163
Trigger22= Animelem = 171
Trigger23= Animelem = 179
Trigger24= Animelem = 187
Trigger25= Animelem = 195
pos      = 0, -80
time = 5
IgnoreHitPause = 1

[State 2405, 相手ステート制御]
Type     = TargetState
Trigger1 = Animelem = 3
Trigger2 = Animelem = 11
Trigger3 = Animelem = 19
Trigger4 = Animelem = 27
Trigger5 = Animelem = 35
Trigger6 = Animelem = 43
Trigger7 = Animelem = 51
Trigger8 = Animelem = 59
Trigger9 = Animelem = 67
Trigger10= Animelem = 75
Trigger11= Animelem = 83
Trigger12= Animelem = 91
Trigger13= Animelem = 99
Trigger14= Animelem = 107
Trigger15= Animelem = 115
Trigger16= Animelem = 123
Trigger17= Animelem = 131
Trigger18= Animelem = 139
Trigger19= Animelem = 147
Trigger20= Animelem = 155
Trigger21= Animelem = 163
Trigger22= Animelem = 171
Trigger23= Animelem = 179
Trigger24= Animelem = 187
Trigger25= Animelem = 195
value    = 2353

[State 2405]
type     = TargetBind
Trigger1 = Animelem = 4
Trigger2 = Animelem = 12
Trigger3 = Animelem = 20
Trigger4 = Animelem = 28
Trigger5 = Animelem = 36
Trigger6 = Animelem = 44
Trigger7 = Animelem = 52
Trigger8 = Animelem = 60
Trigger9 = Animelem = 68
Trigger10= Animelem = 76
Trigger11= Animelem = 84
Trigger12= Animelem = 92
Trigger13= Animelem = 100
Trigger14= Animelem = 108
Trigger15= Animelem = 116
Trigger16= Animelem = 124
Trigger17= Animelem = 132
Trigger18= Animelem = 140
Trigger19= Animelem = 148
Trigger20= Animelem = 156
Trigger21= Animelem = 164
Trigger22= Animelem = 172
Trigger23= Animelem = 180
Trigger24= Animelem = 188
Trigger25= Animelem = 196
pos     = -90, -102
time = 5
IgnoreHitPause = 1

[State 2405, 相手ステート制御]
Type     = TargetState
Trigger1 = Animelem = 4
Trigger2 = Animelem = 12
Trigger3 = Animelem = 20
Trigger4 = Animelem = 28
Trigger5 = Animelem = 36
Trigger6 = Animelem = 44
Trigger7 = Animelem = 52
Trigger8 = Animelem = 60
Trigger9 = Animelem = 68
Trigger10= Animelem = 76
Trigger11= Animelem = 84
Trigger12= Animelem = 92
Trigger13= Animelem = 100
Trigger14= Animelem = 108
Trigger15= Animelem = 116
Trigger16= Animelem = 124
Trigger17= Animelem = 132
Trigger18= Animelem = 140
Trigger19= Animelem = 148
Trigger20= Animelem = 156
Trigger21= Animelem = 164
Trigger22= Animelem = 172
Trigger23= Animelem = 180
Trigger24= Animelem = 188
Trigger25= Animelem = 196
value    = 2354

[State 2405]
type     = TargetBind
Trigger1 = Animelem = 5
Trigger2 = Animelem = 13
Trigger3 = Animelem = 21
Trigger4 = Animelem = 29
Trigger5 = Animelem = 37
Trigger6 = Animelem = 45
Trigger7 = Animelem = 53
Trigger8 = Animelem = 61
Trigger9 = Animelem = 69
Trigger10= Animelem = 77
Trigger11= Animelem = 85
Trigger12= Animelem = 93
Trigger13= Animelem = 101
Trigger14= Animelem = 109
Trigger15= Animelem = 117
Trigger16= Animelem = 125
Trigger17= Animelem = 133
Trigger18= Animelem = 141
Trigger19= Animelem = 149
Trigger20= Animelem = 157
Trigger21= Animelem = 165
Trigger22= Animelem = 173
Trigger23= Animelem = 181
Trigger24= Animelem = 189
Trigger25= Animelem = 197
pos      = -95, -95
time = 5
IgnoreHitPause = 1

[State 2405, 相手ステート制御]
Type     = TargetState
Trigger1 = Animelem = 5
Trigger2 = Animelem = 13
Trigger3 = Animelem = 21
Trigger4 = Animelem = 29
Trigger5 = Animelem = 37
Trigger6 = Animelem = 45
Trigger7 = Animelem = 53
Trigger8 = Animelem = 61
Trigger9 = Animelem = 69
Trigger10= Animelem = 77
Trigger11= Animelem = 85
Trigger12= Animelem = 93
Trigger13= Animelem = 101
Trigger14= Animelem = 109
Trigger15= Animelem = 117
Trigger16= Animelem = 125
Trigger17= Animelem = 133
Trigger18= Animelem = 141
Trigger19= Animelem = 149
Trigger20= Animelem = 157
Trigger21= Animelem = 165
Trigger22= Animelem = 173
Trigger23= Animelem = 181
Trigger24= Animelem = 189
Trigger25= Animelem = 197
value    = 2355

[State 2405]
type     = TargetBind
Trigger1 = Animelem = 6
Trigger2 = Animelem = 14
Trigger3 = Animelem = 22
Trigger4 = Animelem = 30
Trigger5 = Animelem = 38
Trigger6 = Animelem = 46
Trigger7 = Animelem = 54
Trigger8 = Animelem = 62
Trigger9 = Animelem = 70
Trigger10= Animelem = 78
Trigger11= Animelem = 86
Trigger12= Animelem = 94
Trigger13= Animelem = 102
Trigger14= Animelem = 110
Trigger15= Animelem = 118
Trigger16= Animelem = 126
Trigger17= Animelem = 134
Trigger18= Animelem = 142
Trigger19= Animelem = 150
Trigger20= Animelem = 158
Trigger21= Animelem = 166
Trigger22= Animelem = 174
Trigger23= Animelem = 182
Trigger24= Animelem = 190
Trigger25= Animelem = 198
pos      = -35, -63
time = 5
IgnoreHitPause = 1

[State 2405, 相手ステート制御]
Type     = TargetState
Trigger1 = Animelem = 6
Trigger2 = Animelem = 14
Trigger3 = Animelem = 22
Trigger4 = Animelem = 30
Trigger5 = Animelem = 38
Trigger6 = Animelem = 46
Trigger7 = Animelem = 54
Trigger8 = Animelem = 62
Trigger9 = Animelem = 70
Trigger10= Animelem = 78
Trigger11= Animelem = 86
Trigger12= Animelem = 94
Trigger13= Animelem = 102
Trigger14= Animelem = 110
Trigger15= Animelem = 118
Trigger16= Animelem = 126
Trigger17= Animelem = 134
Trigger18= Animelem = 142
Trigger19= Animelem = 150
Trigger20= Animelem = 158
Trigger21= Animelem = 166
Trigger22= Animelem = 174
Trigger23= Animelem = 182
Trigger24= Animelem = 190
Trigger25= Animelem = 198
value    = 2356

[State 2405]
type     = TargetBind
Trigger1 = Animelem = 7
Trigger2 = Animelem = 15
Trigger3 = Animelem = 23
Trigger4 = Animelem = 31
Trigger5 = Animelem = 39
Trigger6 = Animelem = 47
Trigger7 = Animelem = 55
Trigger8 = Animelem = 63
Trigger9 = Animelem = 71
Trigger10= Animelem = 79
Trigger11= Animelem = 87
Trigger12= Animelem = 95
Trigger13= Animelem = 103
Trigger14= Animelem = 111
Trigger15= Animelem = 119
Trigger16= Animelem = 127
Trigger17= Animelem = 135
Trigger18= Animelem = 143
Trigger19= Animelem = 151
Trigger20= Animelem = 159
Trigger21= Animelem = 167
Trigger22= Animelem = 175
Trigger23= Animelem = 183
Trigger24= Animelem = 191
Trigger25= Animelem = 199
pos      = 0, -60
time = 5
IgnoreHitPause = 1

[State 2405, 相手ステート制御]
Type     = TargetState
Trigger1 = Animelem = 7
Trigger2 = Animelem = 15
Trigger3 = Animelem = 23
Trigger4 = Animelem = 31
Trigger5 = Animelem = 39
Trigger6 = Animelem = 47
Trigger7 = Animelem = 55
Trigger8 = Animelem = 63
Trigger9 = Animelem = 71
Trigger10= Animelem = 79
Trigger11= Animelem = 87
Trigger12= Animelem = 95
Trigger13= Animelem = 103
Trigger14= Animelem = 111
Trigger15= Animelem = 119
Trigger16= Animelem = 127
Trigger17= Animelem = 135
Trigger18= Animelem = 143
Trigger19= Animelem = 151
Trigger20= Animelem = 159
Trigger21= Animelem = 167
Trigger22= Animelem = 175
Trigger23= Animelem = 183
Trigger24= Animelem = 191
Trigger25= Animelem = 199
value    = 2357

[State 2405]
type     = TargetBind
Trigger1 = Animelem = 8
Trigger2 = Animelem = 16
Trigger3 = Animelem = 24
Trigger4 = Animelem = 32
Trigger5 = Animelem = 40
Trigger6 = Animelem = 48
Trigger7 = Animelem = 56
Trigger8 = Animelem = 64
Trigger9 = Animelem = 72
Trigger10= Animelem = 80
Trigger11= Animelem = 88
Trigger12= Animelem = 96
Trigger13= Animelem = 104
Trigger14= Animelem = 112
Trigger15= Animelem = 120
Trigger16= Animelem = 128
Trigger17= Animelem = 136
Trigger18= Animelem = 144
Trigger19= Animelem = 152
Trigger20= Animelem = 160
Trigger21= Animelem = 168
Trigger22= Animelem = 176
Trigger23= Animelem = 184
Trigger24= Animelem = 192
Trigger25= Animelem = 200
pos      = 33, -62
time = 5
IgnoreHitPause = 1

[State 2405, 相手ステート制御]
Type     = TargetState
Trigger1 = Animelem = 8
Trigger2 = Animelem = 16
Trigger3 = Animelem = 24
Trigger4 = Animelem = 32
Trigger5 = Animelem = 40
Trigger6 = Animelem = 48
Trigger7 = Animelem = 56
Trigger8 = Animelem = 64
Trigger9 = Animelem = 72
Trigger10= Animelem = 80
Trigger11= Animelem = 88
Trigger12= Animelem = 96
Trigger13= Animelem = 104
Trigger14= Animelem = 112
Trigger15= Animelem = 120
Trigger16= Animelem = 128
Trigger17= Animelem = 136
Trigger18= Animelem = 144
Trigger19= Animelem = 152
Trigger20= Animelem = 160
Trigger21= Animelem = 168
Trigger22= Animelem = 176
Trigger23= Animelem = 184
Trigger24= Animelem = 192
Trigger25= Animelem = 200
value    = 2358

[State 2405]
type     = TargetBind
Trigger1 = Animelem = 201
pos      = 85, -92
IgnoreHitPause = 1

[State 2405, 相手ステート制御];最終
Type     = TargetState
Trigger1 = Animelem = 201
value    = 2360

;-------------------------------------------------[数値調整]

[State 2405, 相手ダメージ]
Type       = TargetLifeAdd
Trigger1   = Animelemtime(201) < 0
absolute   = 1			;防御力を反映する
value      = -floor(4*fvar(0))
kill       = 0
Persistent = 3

;-------------------------------------------------[最後落下]

[State 2405, 速度]
type     = velSet
trigger1 = Animelem = 201
X = 1
Y = -7

[State 2405, 重力]
type     = VelAdd
trigger1 = Animelem = 201, >0
Y = 0.47

[State 2405, ステート変更]
type     = ChangeState
Trigger1 = (Pos Y >= 0)&&(Vel Y > 0)
value    = 2410
ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━
; 回転力は遠心力で破壊力や！(EF) / 着地硬直
;━━━━━━━━━━━━━━━━━━━━━

[StateDef 2410]
Type     = S
Movetype = A
Physics  = N
velset   = 0, 0
Anim     = 2410
ctrl     = 0

[State 2410, ゲージ回復抑制]
Type           = varset
Trigger1       = fvar(22) < 120
IgnoreHitPause = 1
fvar(22)       = 120

;---------------------------------

[State 2410, 無敵]
type     = Nothitby
Trigger1 = 1
value    = ,AT

[State 2410, 接地]
type     = PosSet
trigger1 = Time = 0
Y        = 0

[State 2410, 効果音]
type     = PlaySnd
trigger1 = Time = 0
trigger2 = Animelem = 4
value    = s80, 9

[State 2410, 画面振動]
type     = EnvShake
trigger1 = !time
time     = 15
ampl     = 4

[state 2410, エフェクト(岩盤)]
type     = Explod
trigger1 = AnimelemTime(1) = 0
anim     = 12411
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12410
sprpriority    = -1
IgnoreHitPause = 0
removeongethit = 1

[state 2410, エフェクト(岩盤)]
type     = Explod
trigger1 = AnimelemTime(1) = 0
anim     = 12412
pos      = 0, 0
Scale    = const(size.xscale),const(size.yscale)
id       = 12400
sprpriority    = 9
IgnoreHitPause = 0
removeongethit = 1

[State 2410, 衝撃波エフェクト]
Type     = Helper
Trigger1 = AnimElemtime(1) = 1
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

[State 2410, HitDef]
type                = HitDef
trigger1            = AnimElem = 1
attr                = C, HA
hitflag             = MAFD
guardflag           = 
damage              = Floor(125*Fvar(0)), 0
getpower = 30,15
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(10*(1+0.5*var(7))), floor(9*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 4
guardsound          = s1, 2
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
fall.recovertime    = Ceil(25*FVar(3))+(floor(10*(1+1*var(7))))
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
Trigger1       = MoveHit
Persistent     = 1
IgnoreHitPause = 1
fvar(1)        = FVar(1) * (0.70)


[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 0.2

[State a, VarSet];コンボ判定
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 1

;----------------------------------------[バウンド]

[State 2410, 状態変更]
type      = StatetypeSet
Trigger1  = Animelem = 2
Statetype = A
Movetype  = H

[State 2410]
type     = Velset
trigger1 = Animelem = 2
Y = -2.5

[State 2410]
type     = VelAdd
trigger1 = Animelem = 2, >= 0
Trigger1 = Animelem = 4, < 0
Y = 0.3

[State 2410]
type     = Velset
trigger1 = Pos Y > 0
Y = 0

;----------------------------------------[ダウン～リバーサル]

[State 2410]
type     = Velset
trigger1 = Animelem = 4
X = 0
Y = 0

[State 2410, 接地]
type     = PosSet
trigger1 = Animelem = 4
Y        = 0

[State 2410, 状態変更]
type      = StatetypeSet
Trigger1  = Animelem = 4
Statetype = L
Movetype  = H

[State 2410, 状態変更]
type      = StatetypeSet
Trigger1  = Animelem = 5
Statetype = S
Movetype  = I

[State 2410, 振り向き]
type     = Turn
trigger1 = Animtime = 0
trigger1 = P2dist X < 0

[State 2410, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1




;============================================================
; [Helper] 回転力は遠心力で破壊力 - 爆発
;============================================================

[Statedef 12410]
type     = A
movetype = A
physics	 = N
ctrl     = 0
velset   = 0, 0
sprpriority = 9

[State 12410, 効果音]
type     = PlaySnd
trigger1 = !time
value    = s80, 28

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
value    = 12410

[State 12410, サークル]
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

[state 12410, HitDef]
type              = HitDef
Trigger1          = 1
attr              = S, HP
hitflag           = MAFD
guardflag         = 
damage            = Floor(8.3*root,FVar(1)), 5
animtype          = Mid
ground.type       = Low
priority          = 3, Hit
pausetime         = 0, 6
sparkno           = -1
sparkxy           = 0, 0
guard.sparkno     = -1
hitsound          = s0, 6
guardsound        = s1, 1
ground.slidetime    = 20
ground.hittime      = 20
guard.slidetime     = 15
guard.hittime       = 15
guard.ctrltime      = 17
air.guard.slidetime = 17
air.guard.hittime   = 17
air.guard.ctrltime  = 19

ground.velocity   = 0, 7
guard.velocity    = -5
air.velocity      = 0, 7
airguard.velocity = -3, -2
down.velocity     = -9, 0
down.hittime      = 15
down.bounce       = 0
fall              = 1
air.fall          = 1
fall.recover      = 0
fall.recovertime  = 9999
Persistent        = 0
guard.kill        = 0
yaccel            = 0.47
kill              = 0
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

;-------------------------------------------------[終了]

[state a, 終了]
type     = destroyself
trigger1 = Animtime = 0
