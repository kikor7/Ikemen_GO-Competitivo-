;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
; 超必殺技 管理ステート
;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / ウルフハンティング
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2000]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 2000
sprpriority = 2

;-------------------------------------------------[キャンセル補正]

[State 2000, 変数]  ;Chain spell補正
Type           = VarSet
Trigger1       = !time
Trigger1       = PrevStateNo = [200,1900]
Persistent     = 0
IgnoreHitPause = 1
fvar(4)        = 0.925

;-----------------------------------------------------[ゲージ管理]

[State 2000, ゲージ減少]
Type           = PowerAdd
Trigger1       = !time ;Animelemtime(4) = 0
Persistent     = 0
IgnoreHitPause = 1
Value          = -1000

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = !time ;Animelemtime(4) = 0
value    = s60, 2

[state a, nothitby]
type     = nothitby
trigger1 = !time ;Animelemtime(4) = 0
value    = SCA, AA, AT, AP
time     = 40
Persistent     = 0
ignorehitpause = 1

[State a, 背景用]
type     = VarSet
Trigger1 = !time
var(1)   = 0

[State a, 背景用]
type     = VarAdd
Trigger1 = time = [1,5] ;Animelemtime(4) = [1, 5]
var(1)   = 10

[State a, 背景用]
type     = VarAdd
Trigger1 = time = [31,35] ;Animelemtime(4) = [36, 40]
var(1)   = -10

[State a];背景色
type      = BGPalFX
trigger1  = time = [0,35] ;Animelemtime(4) = [0, 40]
time      = 1
mul       = 255-var(1),255-var(1),255-var(1)
invertall = 0

[State a, 暗転処理]
type     = SuperPause
trigger1 = !time  ;Animelemtime(4) = 0
anim     = -1
sound    = -1
darken   = 0
time     = 35
movetime = 35
P2DefMul = 1

;-----------------------------------------------------[エフェクト]

[State a, エフェクト] ;スペル発動エフェクト
Type     = Helper
Trigger1 = !time  ;AnimelemTime(4) = 0
OwnPal   = 1
PosType  = P1
Pos      = 0, const(size.mid.pos.y)
ID       = 8800
StateNo  = 8800
Name     = "Spell-time"
Persistent= 0
PauseMoveTime = 999999
SuperMoveTime = 999999

[State a, エフェクト] ;カットイン表示
Type     = Helper
Trigger1 = !time  ;AnimelemTime(4) = 0
OwnPal   = 1
PosType  = back
Pos      = 0, -180;const(size.mid.pos.y)
ID       = Ifelse(TeamSide=1,9800,9801)
StateNo  = 9800
Name     = "Cut-In"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999


;-------------------------------------------------[演出]

[State a, ボイス再生];これで！
type       = PlaySnd
triggerAll = Alive
trigger1   = !time  ;Animelemtime(4) = 0
value      = s1100, 0
channel    = 5

[State a, ボイス再生];消滅しなさい！
type       = PlaySnd
triggerAll = Alive
trigger1   = Animelemtime(8) = 0
value      = s1100, 1

[State a, 効果音]
type       = PlaySnd
trigger1   = Animelemtime(12) = 0
value      = s50, 0

[State 2000, リロード判定]
type     = Varset
Trigger1 = AnimelemTime(12) = 0
var(50)  = 0

[State 2000, 速度]
type     = Velset
Trigger1 = Animelemtime(12) = 0
X = -4

[State 2000, エフェクト]
Type     = Helper
Trigger1 = Animelem = 12
Name     = "Effect"
Stateno  = 11010
ID       = 11010
Pos      = 55, -80
PosType  = P1
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State 50, 煙エフェクト]
type     = Helper
Trigger1 = Animelem = 12
ID       = 8042
postype  = p1
pos      = 55, -80
name     = "jamp-Smoke"
stateno  = 8042
helpertype = normal
keyctrl  = 0
ownpal   = 1
PauseMoveTime = 99999
supermovetime = 99999


;-------------------------------------------------[弾幕展開]

[State 2000]
Type     = Helper
Trigger1 = Animelemtime(12) = 0
Name     = "sord off"
Stateno  = 12000
ID       = 12000
Pos      = 25, -80
PosType  = P1
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State 2000, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 / ウルフハンティング
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2050]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 2050
sprpriority = 2

[State 2050, 速度]
type     = VelMul
Trigger1 = !time
X = 0.25
Y = 0.25

[State 2050, 速度]
type     = VelSet
Trigger1 = Time = 1
X = 0
Y = 0

;-------------------------------------------------[キャンセル補正]

[State 2050, 変数]  ;Chain spell補正
Type           = VarSet
Trigger1       = !time
Trigger1       = PrevStateNo = [200,1900]
Persistent     = 0
IgnoreHitPause = 1
fvar(4)        = 0.925

;-----------------------------------------------------[ゲージ管理]

[State 2050, ゲージ減少]
Type           = PowerAdd
Trigger1       = !time  ;Animelemtime(2) = 0
Persistent     = 0
IgnoreHitPause = 1
Value          = -1000

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = !time  ;Animelemtime(2) = 0
value    = s60, 2

[state a, nothitby]
type     = nothitby
trigger1 = !time  ;Animelemtime(2) = 0
value    = SCA, AA, AT, AP
time     = 30;40
Persistent     = 0
ignorehitpause = 1

[State a, 背景用]
type     = VarSet
Trigger1 = !time
var(1)   = 0

[State a, 背景用]
type     = VarAdd
Trigger1 = time = [1,5] ;Animelemtime(2) = [1, 5]
var(1)   = 20

[State a, 背景用]
type     = VarAdd
Trigger1 = time = [26, 30]  ;Animelemtime(2) = [36, 40]
var(1)   = -20

[State a];背景色
type      = BGPalFX
trigger1  = time = [0, 30]  ;Animelemtime(2) = [0, 40]
time      = 1
mul       = 255-var(1),255-var(1),255-var(1)
invertall = 0

[State a, 暗転処理]
type     = SuperPause
trigger1 = !time  ;Animelemtime(2) = 0
anim     = -1
sound    = -1
darken   = 0
time     = 30  ;40
movetime = 30  ;40
P2DefMul = 1

;-----------------------------------------------------[エフェクト]

[State a, エフェクト] ;スペル発動エフェクト
Type     = Helper
Trigger1 = !time ;AnimelemTime(2) = 0
OwnPal   = 1
PosType  = P1
Pos      = 0, const(size.mid.pos.y)
ID       = 8800
StateNo  = 8800
Name     = "Spell-time"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999

[State a, エフェクト] ;カットイン表示
Type     = Helper
Trigger1 = !time ;AnimelemTime(2) = 0
OwnPal   = 1
PosType  = back
Pos      = 0, -180;const(size.mid.pos.y)
ID       = Ifelse(TeamSide=1,9800,9801)
StateNo  = 9800
Name     = "Cut-In"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999


;-------------------------------------------------[演出]

[State a, ボイス再生];逃げても無駄！
type       = PlaySnd
triggerAll = Alive
trigger1   = !time ;Animelemtime(2) = 0
value      = s1100, 2

[State a, 効果音]
type       = PlaySnd
trigger1   = Animelemtime(8) = 0
value      = s50, 0

[State 2050, リロード判定]
type     = Varset
Trigger1 = AnimelemTime(8) = 0
var(50)  = 0

[State 2050, 速度]
type     = Velset
Trigger1 = Animelemtime(8) = 0
X = -4
Y = -3

[State 2050, 速度]
type     = VelAdd
Trigger1 = AnimelemTime(9) >= 0
Y = 0.45

[State a, エフェクト]
Type     = Helper
Trigger1 = Animelem = 8
Name     = "Effect"
Stateno  = 11060
ID       = 11061
Pos      = 85, -80
PosType  = P1
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State 50, 煙エフェクト]
type     = Helper
Trigger1 = Animelem = 8
ID       = 8042
postype  = p1
pos      = 85, -80
name     = "jamp-Smoke"
stateno  = 8042
helpertype = normal
keyctrl  = 0
ownpal   = 1
PauseMoveTime = 99999
supermovetime = 99999

;-------------------------------------------------[弾幕展開]

[State 2050]
Type     = Helper
Trigger1 = Animelemtime(8) = 0
Name     = "sord off"
Stateno  = 12050
ID       = 12050
Pos      = 30, -80
PosType  = P1
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State 2050, 行動可能]
type     = CtrlSet
trigger1 = Animelem = 13
value    = 1

[State 2050, 着地終了]
Type     = ChangeState
Trigger1 = Animelem = 8, > 0
Trigger1 = (Vel Y > 0) && (pos y >= 0)
Value    = 52
Ctrl     = 0







;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[エフェクト] ウルフハンティング / 弾丸
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[statedef 12000]
type        = A
Physics     = N
Movetype    = A
Anim        = 12000
SprPriority = 4

[State 10000, 速度用]
type     = VarAdd
trigger1 = Time > 2
var(1)   = 5

[State 10000, 速度]
type     = Velset
Trigger1 = ISHelper(12000)
Trigger1 = time > 0
X        = 50 + var(1)

;-------------------------------------------------[ヒット定義]

[State 10000, HitDef]
type                = HitDef
Trigger1            = ISHelper(12000)
trigger1            = Time > 0
attr                = S, HP
hitflag             = MAF
guardflag           = MA
damage              = Floor(200*root,Fvar(5)), 40
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 0, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 6
guardsound          = s1, 2
ground.slidetime    = 20 + ((p2movetype=A)*5)
ground.hittime      = 20 + ((p2movetype=A)*5)
air.hittime         = 20 + ((p2movetype=A)*5)
guard.slidetime     = 18
guard.hittime       = 18
ground.velocity     = -8, -4
guard.velocity      = -10
air.velocity        = -8, -4
airguard.velocity   = -5, -3
yaccel              = 0.47
fall                = 1
air.fall            = 1
ID                  = 2000
fall.recovertime    = Ceil(60*(1+(0.5*root,var(7))))
getpower            = 0, 0
givepower           = Floor(200*Fvar(5)), 0
Ground.CornerPush.VelOff   = 0
Guard.CornerPush.VelOff    = 0


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7015
ID       = 7000
Pos      = 0, 0
PosType  = P1
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = Moveguarded = 1
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 0, 0
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, 変数]  ;Rate補正
Type           = ParentVarSet
Trigger1       = MoveHit
Trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = Root,FVar(0) * 0.80

[State a, 変数]  ;smash attck補正
Type           = ParentVarSet
Trigger1       = MoveHit
Trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 0.80

;-------------------------------------------------[カウンターヒット]

[State a, 変数]
type     = Varset
trigger1 = P2Movetype = A
var(7)   = 1

[State a, 攻撃力補正] 
type     = AttackMulSet 
trigger1 = 1
value    = 1.0+(0.33*(var(7)=1))

[State a, エフェクト]
Type     = Helper
Trigger1 = var(7) = 1
Trigger1 = MoveHit
trigger1 = enemynear,movetype = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0, -50
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State 2410, 相手制御]
type     = targetstate
trigger1 = NumTarget(2000) >= 1
trigger1 = Target(2000),ishelper = 0
trigger1 = Movehit = 1
value    = 8020
ID       = 2000
persistent = 0


;-------------------------------------------------[終了]

[State 12000]
Type     = DestroySelf
Trigger1 = MoveContact = 1
Trigger2 = time > 10




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[エフェクト] ウルフハンティング(空中) / 弾丸
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[statedef 12050]
type        = A
Physics     = N
Movetype    = A
Anim        = 12050
SprPriority = 4

[State 12050, 速度]
type     = Velset
Trigger1 = time > 0
X        = 50 * cos(-30*Pi/180)
Y        =-50 * Sin(-30*Pi/180)

;-------------------------------------------------[ヒット定義]

[State 10000, HitDef]
type                = HitDef
Trigger1            = ISHelper(12050)
trigger1            = Time > 0
attr                = A, HP
hitflag             = MAF
guardflag           = MA
damage              = Floor(200*root,Fvar(5)), 40
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 0, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 6
guardsound          = s1, 2
ground.slidetime    = 20 + ((p2movetype=A)*5)
ground.hittime      = 20 + ((p2movetype=A)*5)
air.hittime         = 20 + ((p2movetype=A)*5)
guard.slidetime     = 18
guard.hittime       = 18
ground.velocity     = -4, -7.5
guard.velocity      = -10
air.velocity        = -4, -7.5
airguard.velocity   = -5, -3
yaccel              = 0.47
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(60*(1+(0.5*root,var(7))))
getpower            = 0, 0
givepower           = Floor(200*Fvar(5)), 0
Ground.CornerPush.VelOff   = 0
Guard.CornerPush.VelOff    = 0


;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7015
ID       = 7000
Pos      = 0, 0
PosType  = P1
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = Moveguarded = 1
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 0, 0
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, 変数]  ;Rate補正
Type           = ParentVarSet
Trigger1       = MoveHit
Trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = Root,FVar(0) * 0.80

[State a, 変数]  ;smash attck補正
Type           = ParentVarSet
Trigger1       = MoveHit
Trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 0.80

;-------------------------------------------------[カウンターヒット]

[State a, 変数]
type     = Varset
trigger1 = P2Movetype = A
var(7)   = 1

[State a, 攻撃力補正] 
type     = AttackMulSet 
trigger1 = 1
value    = 1.0+(0.33*(var(7)=1))

[State a, エフェクト]
Type     = Helper
Trigger1 = var(7) = 1
Trigger1 = MoveHit
trigger1 = enemynear,movetype = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0, -50
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State 12050]
Type     = DestroySelf
Trigger1 = MoveContact = 1
Trigger2 = time > 10






;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / クイックリロード
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2100]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 2100
sprpriority = 2

;-------------------------------------------------[キャンセル補正]

[State 2100, 変数]  ;Chain spell補正
Type           = VarSet
Trigger1       = !time
Trigger1       = PrevStateNo = [200,1900]
Persistent     = 0
IgnoreHitPause = 1
fvar(4)        = 0.925

;-----------------------------------------------------[ゲージ管理]

[State 2100, ゲージ減少]
Type           = PowerAdd
Trigger1       = !time
Persistent     = 0
IgnoreHitPause = 1
Value          = -1000

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = !time
value    = s60, 2

[state a, nothitby]
type     = nothitby
trigger1 = !time
value    = SCA, AA, AT, AP
time     = 40
Persistent     = 0
ignorehitpause = 1

[State a, 背景用]
type     = VarSet
Trigger1 = !time
var(1)   = 0

[State a, 背景用]
type     = VarAdd
Trigger1 = Animelemtime(1) = [1, 5]
var(1)   = 20

[State a, 背景用]
type     = VarAdd
Trigger1 = Animelemtime(1) = [55, 59]
var(1)   = -20

[State a];背景色
type      = BGPalFX
trigger1  = Animelemtime(1) = [0, 59]
time      = 1
mul       = 255-var(1),255-var(1),255-var(1)
invertall = 0

[State a, 暗転処理]
type     = SuperPause
trigger1 = !time
anim     = -1
sound    = -1
darken   = 0
time     = 59
movetime = 59
P2DefMul = 1

;-----------------------------------------------------[エフェクト]

[State a, エフェクト] ;スペル発動エフェクト
Type     = Helper
Trigger1 = time = 0
OwnPal   = 1
PosType  = P1
Pos      = 0, const(size.mid.pos.y)
ID       = 8800
StateNo  = 8800
Name     = "Spell-time"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999

[State a, エフェクト] ;カットイン表示
Type     = Helper
Trigger1 = !time
OwnPal   = 1
PosType  = back
Pos      = 0, -180
ID       = Ifelse(TeamSide=1,9800,9801)
StateNo  = 9800
Name     = "Cut-In"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999

;-------------------------------------------------[演出]

[State a, ボイス再生]
type       = PlaySnd
trigger1   = !time
value      = s1200, 2
channel    = 5

[State a, 効果音]
type       = PlaySnd
trigger1   = Animelem = 8
value      = s50, 1

[State 2100];排莢
Type     = Helper
Trigger1 = Animelem = 8
Name     = "sord off"
Stateno  = 11100
ID       = 11100
Pos      = 20, -95
PosType  = P1
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State 2100, リロード判定]
type     = Varset
Trigger1 = !time
var(50)  = 1

;-------------------------------------------------[終了]

[State 2100, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 / クイックリロード
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2150]
type     = A
movetype = A
physics  = N
ctrl     = 0
anim     = 2150
sprpriority = 2

[State 2150, 速度保存]
type     = varset
Trigger1 = !time
var(2) = floor(vel X)

[State 2150, 速度]
Type     = VelSet
Trigger1 = !time
X = 0
Y = 0

[State 2150, 速度]
Type     = VelSet
Trigger1 = Animelem = 8
X = var(2) * 0.2
Y = -6

[State 2150, 速度]
Type     = VelAdd
Trigger1 = Animelemtime(9) >= 0
Y = 0.45

;-------------------------------------------------[キャンセル補正]

[State 2150, 変数]  ;Chain spell補正
Type           = VarSet
Trigger1       = !time
Trigger1       = PrevStateNo = [200,1900]
Persistent     = 0
IgnoreHitPause = 1
fvar(4)        = 0.925

;-----------------------------------------------------[ゲージ管理]

[State 2150, ゲージ減少]
Type           = PowerAdd
Trigger1       = !time
Persistent     = 0
IgnoreHitPause = 1
Value          = -1000

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = !time
value    = s60, 2

[state a, nothitby]
type     = nothitby
trigger1 = !time
value    = SCA, AA, AT, AP
time     = 48
Persistent     = 0
ignorehitpause = 1

[State a, 背景用]
type     = VarSet
Trigger1 = !time
var(1)   = 0

[State a, 背景用]
type     = VarAdd
Trigger1 = Animelemtime(1) = [1, 5]
var(1)   = 20

[State a, 背景用]
type     = VarAdd
Trigger1 = Animelemtime(1) = [44, 48]
var(1)   = -20

[State a];背景色
type      = BGPalFX
trigger1  = Animelemtime(1) = [0, 48]
time      = 1
mul       = 255-var(1),255-var(1),255-var(1)
invertall = 0

[State a, 暗転処理]
type     = SuperPause
trigger1 = !time
anim     = -1
sound    = -1
darken   = 0
time     = 48
movetime = 48
P2DefMul = 1

;-----------------------------------------------------[エフェクト]

[State a, エフェクト] ;スペル発動エフェクト
Type     = Helper
Trigger1 = time = 0
OwnPal   = 1
PosType  = P1
Pos      = 0, const(size.mid.pos.y)
ID       = 8800
StateNo  = 8800
Name     = "Spell-time"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999

[State a, エフェクト] ;カットイン表示
Type     = Helper
Trigger1 = !time
OwnPal   = 1
PosType  = back
Pos      = 0, -180
ID       = Ifelse(TeamSide=1,9800,9801)
StateNo  = 9800
Name     = "Cut-In"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999

;-------------------------------------------------[演出]

[State a, ボイス再生]
type       = PlaySnd
trigger1   = !time
value      = s1200, 2
channel    = 5

[State a, 効果音]
type       = PlaySnd
trigger1   = Animelem = 8
value      = s50, 1

[State 2150];排莢
Type     = Helper
Trigger1 = Animelem = 8
Name     = "sord off"
Stateno  = 11100
ID       = 11100
Pos      = 20, -95
PosType  = P1
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State 2150, リロード判定]
type     = Varset
Trigger1 = !time
var(50)  = 1

;-------------------------------------------------[終了]

[State 2150, 行動可能]
type     = CtrlSet
trigger1 = Animelem = 10
value    = 1

[State 2150, 着地終了]
Type     = ChangeState
Trigger1 = (Vel Y > 0) && (pos y >= 0)
Value    = 52
Ctrl     = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / ゴートハンティング / 開始
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2200]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 2200
sprpriority = 2

;-------------------------------------------------[キャンセル補正]

[State 2200, 変数]  ;Chain spell補正
Type           = VarSet
Trigger1       = !time
Trigger1       = PrevStateNo = [200,1900]
Persistent     = 0
IgnoreHitPause = 1
fvar(4)        = 0.925

;-----------------------------------------------------[ゲージ管理]

[State 2200, ゲージ減少]
Type           = PowerAdd
Trigger1       = !time
Persistent     = 0
IgnoreHitPause = 1
Value          = -2000

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = !time
value    = s60, 2

[state a, nothitby]
type     = nothitby
trigger1 = !time
value    = SCA, AA, AT, AP
time     = 40
Persistent     = 0
ignorehitpause = 1

[State a, 背景用]
type     = VarSet
Trigger1 = !time
var(1)   = 0

[State a, 背景用]
type     = VarAdd
Trigger1 = Animelemtime(1) = [1, 5]
var(1)   = 20

[State a, 背景用]
type     = VarAdd
Trigger1 = Animelemtime(1) = [36, 40]
var(1)   = -20

[State a];背景色
type      = BGPalFX
trigger1  = Animelemtime(1) = [0, 40]
time      = 1
mul       = 255-var(1),255-var(1),255-var(1)
invertall = 0

[State a, 暗転処理]
type     = SuperPause
trigger1 = !time
anim     = -1
sound    = -1
darken   = 0
time     = 40
movetime = 40
P2DefMul = 1

;-----------------------------------------------------[エフェクト]

[State a, エフェクト] ;スペル発動エフェクト
Type     = Helper
Trigger1 = !time
OwnPal   = 1
PosType  = P1
Pos      = 0, const(size.mid.pos.y)
ID       = 8800
StateNo  = 8800
Name     = "Spell-time"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999

;-------------------------------------------------[演出]

[State a, ボイス再生]
type       = PlaySnd
triggerAll = Alive
trigger1   = !time
value      = s2000, 0
;channel    = 5

[State 2200, 速度]
type     = Velset
Trigger1 = !Animtime
X        = 12

;-------------------------------------------------[次へ]

[State 2200, ステート変更]
type     = ChangeState
trigger1 = Animtime = 0
value    = 2201
ctrl     = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / ゴートハンティング / 移動
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2201]
type     = S
movetype = A
physics  = N
ctrl     = 0
anim     = 2201
sprpriority = 2

[state a, nothitby]
type     = nothitby
trigger1 = !time
value    = SCA, AA, AT, AP
time     = 7
Persistent     = 0
ignorehitpause = 1

[State 100, ダッシュエフェクトA]
type     = Helper
trigger1 = !Time
ID       = 8100
postype  = p1
pos      = 30, 0
name     = "Dash-Efect"
stateno  = 8100
helpertype = normal
keyctrl  = 0
ownpal   = 1
PauseMoveTime = 99999
supermovetime = 99999

;-------------------------------------------------[ヒット定義]

[State 2200, HitDef]
type                = HitDef
Trigger1            = 1
attr                = S, HA
hitflag             = MAF
guardflag           = M
damage              = 0, 0
animtype            = Hard
air.animtype        = Back
ground.type         = High
priority            = 3, Hit
pausetime           = 0, 0
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = -1
guardsound          = s1, 2
ground.slidetime    = 25
ground.hittime      = 25
guard.slidetime     = 25
guard.hittime       = 25
air.hittime         = 25
ground.velocity     = 0
guard.velocity      = -7.5
air.velocity        = 0, 0
airguard.velocity   = -5, -3
yaccel              = 0.45
fall                = 0
air.fall            = 1
fall.recover        = 0
fall.recovertime    = Ceil(6000*(1+(0.5*var(7))))
getpower            = 0, 0
givepower           = 0, 0
Kill                = 0
Guard.Kill          = 0
ID                  = 2200
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7025
ID       = 7025
Pos      = 30, -70
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 10, -60
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State 2200, 相手を拘束]
type     = TargetState
trigger1 = movehit
trigger1 = NumTarget
value    = 2250
ID       = 2200
persistent = 0
ignorehitpause = 1

[State 2200]
type     = TargetBind
Trigger1 = MoveHit
Pos      = 40, 0
ID       = 2200
IgnoreHitPause = 1

;-------------------------------------------------[次へ]

[State 2201, ステート変更];乱舞へ
type     = ChangeState
trigger1 = MoveHit = 1
Trigger1 = Numtarget
value    = 2210
ctrl     = 0

[State 2201, ステート変更];失敗
type     = ChangeState
trigger1 = Time > 15
Trigger2 = Moveguarded
value    = 2202
ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / ゴートハンティング / 停止
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[StateDef 2202]
Type     = S
MoveType = I
Physics  = N
anim     = 2202
SprPriority = 1
ctrl     = 0

[State 2202, AssertSpecial];特殊な状況
Type      = AssertSpecial
Trigger1  = 1
Flag      = NoWalk		;歩けない

;-------------------------------------------------[速度設定]

[State 2202, 減速]
type     = VelMul
trigger1 = vel x > 0
X        = 0.88

[State 2202, 効果音]
type     = PlaySnd
trigger1 = !time
value    = s40, 1

;--------------------------------------------------[終了]

[State 2202, ステート変更]
type       = ChangeState
Trigger1   = Animtime = 0
value      = 0
Ctrl = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / ゴートハンティング / 攻撃
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2210]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 2210
sprpriority = 2

[State 2210]
type     = NotHitby
Trigger1 = 1
value    = SCA,AA,AT,AP

;---------------------------------------------------[演出]

[State 2210, 速度]
type     = Velset
trigger1 = !time
X = 0
Y = 0

[State 2210, 速度]
type     = PosAdd
trigger1 = !time
X = 5

[State 2210, ボイス再生];てぇい！
type       = PlaySnd
triggerAll = Alive
trigger1   = Animelem = 6
value      = s200, 8
;channel    = 5

[State 2210, ボイス再生];てやっ！
type       = PlaySnd
triggerAll = Alive
trigger1   = Animelem = 12
value      = s200, 13
channel    = 5

[State 2210, ボイス再生];このぉ！
type       = PlaySnd
triggerAll = Alive
trigger1   = Animelem = 20
value      = s200, 5
channel    = 5

[State 2210, 効果音]
Type       = playsnd
Trigger1   = Animelem = 6
Trigger2   = Animelem = 12
Trigger3   = Animelem = 21
value      = s2,1

[State 2210]
type     = TargetBind
Trigger1 = MoveHit
Pos      = 40, 0
ID       = 2200
Time     = 2
IgnoreHitPause = 1

;-------------------------------------------------[ヒット定義]

[State 2210, HitDef]
type                = HitDef
trigger1            = AnimElem = 7
trigger2            = AnimElem = 13
attr                = S, HA
hitflag             = MAF
guardflag           = M
damage              = 30, 0
animtype            = Hard
ground.type         = Low
priority            = 3, Hit
pausetime           = 25, 60
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 7
guardsound          = s1, 2
ground.slidetime    = 20
ground.hittime      = 20
air.hittime         = 20
guard.slidetime     = 18
guard.hittime       = 18
ground.velocity     = 0
guard.velocity      = -1
air.velocity        = -0, 0
airguard.velocity   = -2, -3
yaccel              = 0.45
Kill                = 0
air.fall            = 1
fall.recovertime    = Ceil(6000*(1+(0.5*var(7))))
getpower            = 0, 0
givepower           = Floor(20*Fvar(5)), 0
envshake.time       = 5
envshake.freq       = 70
envshake.ampl       = 20
envshake.phase      = 80 
ID                  = 2200
P2StateNo           = 2250
Ground.CornerPush.VelOff   = 0
Guard.CornerPush.VelOff    = 0

[State 2210, HitDef]
type                = HitDef
trigger1            = AnimElem = 22
attr                = S, HA
hitflag             = MAF
guardflag           = M
damage              = 30, 0
animtype            = Hard
ground.type         = low
priority            = 3, Hit
pausetime           = 25, 25
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 7
guardsound          = s1, 2
ground.slidetime    = 60
ground.hittime      = 60
air.hittime         = 60
guard.slidetime     = 18
guard.hittime       = 18
ground.velocity     = -8
guard.velocity      = -6
air.velocity        = -4, -3
airguard.velocity   = -2, -3
yaccel              = 0.45
Kill                = 0
air.fall            = 1
fall.recovertime    = Ceil(6000*(1+(0.5*var(7))))
getpower            = 0, 0
givepower           = Floor(20*Fvar(5)), 0
envshake.time       = 5
envshake.freq       = 70
envshake.ampl       = 20
envshake.phase      = 80 
ID                  = 2250
Ground.CornerPush.VelOff   = 0
Guard.CornerPush.VelOff    = 0

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Trigger1 = animelemtime(7) = [0,3]
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Trigger1 = animelemtime(13) = [0,3]
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Trigger1 = animelemtime(22) = [0,3]
Name     = "hit"
Stateno  = 7020
ID       = 7000
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0


[State a]
Type     = Helper
Trigger1 = Moveguarded = 1
Trigger1 = animelemtime(7) = [0,3]
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = Moveguarded = 1
Trigger1 = animelemtime(13) = [0,3]
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = Moveguarded = 1
Trigger1 = animelemtime(22) = [0,3]
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;--------------------------------------------------[終了]

[State 2210, ステート変更]
type     = ChangeState
Trigger1 = Animtime = 0
value    = 2215
Ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / ゴートハンティング / 攻撃2
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2215]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 2215
sprpriority = 2

[State 2215]
type     = NotHitby
Trigger1 = 1
value    = SCA,AA,AT,AP

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = !time
value    = s60, 2

[State a, 背景用]
type     = VarSet
Trigger1 = !time
var(1)   = 0

[State a, 背景用]
type     = VarAdd
Trigger1 = Animelemtime(1) = [1, 5]
var(1)   = 20

[State a, 背景用]
type     = VarAdd
Trigger1 = Animelemtime(1) = [36, 40]
var(1)   = -20

[State a];背景色
type      = BGPalFX
trigger1  = Animelemtime(1) = [0, 40]
time      = 1
mul       = 255-var(1),255-var(1),255-var(1)
invertall = 0

[State a, 暗転処理]
type     = SuperPause
trigger1 = !time
anim     = -1
sound    = -1
darken   = 0
time     = 40
movetime = 40
P2DefMul = 1

;-----------------------------------------------------[エフェクト]

[State a, エフェクト] ;スペル発動エフェクト
Type     = Helper
Trigger1 = !time
OwnPal   = 1
PosType  = P1
Pos      = 0, const(size.mid.pos.y)
ID       = 8800
StateNo  = 8800
Name     = "Spell-time"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999

[State a, エフェクト] ;カットイン表示
Type     = Helper
Trigger1 = !time
OwnPal   = 1
PosType  = back
Pos      = 0, -180
ID       = Ifelse(TeamSide=1,9800,9801)
StateNo  = 9800
Name     = "Cut-In"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999


;-------------------------------------------------[演出]

[State 2215, 相手識別]
Type     = Varset
Trigger1 = !time
var(0)   = 0

[State 2215, 相手識別];分からない魔女
Type     = Varset
trigger1 = Enemynear,Name = "beatrice"
trigger2 = Enemynear,Name = "Alice_Margatroid"
trigger3 = Enemynear,Name = "Alice Margatroid"
trigger4 = Enemynear,Name = "Alice"
trigger5 = Enemynear,Name = "Alice-R"
trigger6 = Enemynear,Name = "Fallen Alice"
trigger7 = Enemynear,Name = "AliceDolls"
trigger8 = Enemynear,Name = "Marisa Kirisame"
trigger9 = Enemynear,Name = "Marisa_Kirisame"
trigger10= Enemynear,Name = "Marisa_K"
trigger11= Enemynear,Name = "Marisa_S"
trigger12= Enemynear,Name = "MegaMari"
trigger13= Enemynear,Name = "Marisa_S"
trigger14= Enemynear,Name = "Patchouli"
trigger15= Enemynear,Name = "Patchouli_Knowledge"
trigger16= Enemynear,Name = "Patchouli Knowledge"
trigger17= Enemynear,Name = "C_Patchouli"
trigger18= Enemynear,Name = "metal_patchouli"
trigger19= Enemynear,Name = "Orochi Marisa"
trigger20= Enemynear,Name = "Patchouli - S"
var(0)   = 1

[State 2215, 相手識別];分からない人
Type     = Varset
trigger1 = Enemynear,Name = "Furudo_Erika"
trigger2 = Enemynear,Name = "Furudo Erika"
trigger3 = Enemynear,Name = "Erika_Frudo"
trigger4 = Enemynear,Name = "Erika Furudo"
trigger5 = Enemynear,Name = "Dlanor A.Knox"
trigger6 = Enemynear,Name = "Dlanor_A.Knox"
trigger7 = Enemynear,Name = "Dlanor-A.Knox"
trigger8 = Enemynear,Name = "Dlanor A Knox"
trigger9 = Enemynear,Name = "Dlanor_A_Knox"
trigger10= Enemynear,Name = "B.Battler"
var(0)   = 2

[State 2215, 相手識別];分からない男
Type     = Varset
trigger1 = Enemynear,Name = "Ronove"
var(0)   = 3

[State 2215, 相手識別];分からない女
Type     = Varset
trigger1 = Enemynear,Name = "Rosa_Ushiromiya"
trigger2 = Enemynear,Name = "Rosa Ushiromiya"
trigger3 = Enemynear,Name = "Ushiromiya_Rosa"
trigger4 = Enemynear,Name = "Ushiromiya Rosa"
trigger5 = Enemynear,Name = "Eva_Beatrice"
trigger6 = Enemynear,Name = "Eva-Beatrice"
trigger7 = Enemynear,Name = "Eva Beatrice"
var(0)   = 4

[State 2210, ボイス再生]
Type       = playsnd
Trigger1   = Animelem = 5
value      = s2000, 4 + var(0)
channel    = 5

[State 2210, 効果音]
Type       = playsnd
Trigger1   = Animelem = 3
value      = s50, 1

[State 2210, 効果音]
Type       = playsnd
Trigger1   = Animelem = 15
value      = s50, 0

[State 2210, Explod]
type     = Explod
trigger1 = Animelemtime(15) = 0
id       = 2
anim     = 11011
pos      = 82, -98
postype  = p1
ownpal   = 1
bindtime = -1
supermove = 1
sprpriority = 9
scale    = 0.7, 0.7
ignorehitpause = 1
removeongethit = 1

[State 50, 煙エフェクト]
type     = Helper
Trigger1 = Animelem = 15
ID       = 8042
postype  = p1
pos      = 82, -98
name     = "jamp-Smoke"
stateno  = 8042
helpertype = normal
keyctrl  = 0
ownpal   = 1
PauseMoveTime = 99999
supermovetime = 99999

[State 2210, リロード判定]
type     = Varset
Trigger1 = AnimelemTime(15) = 0
var(50)  = 0

;-------------------------------------------------[ヒット定義]

[State 2215, HitDef]
type                = HitDef
trigger1            = AnimElem = 15
attr                = S, HA
hitflag             = MAF
guardflag           = M
damage              = Floor(180*Fvar(5)*(1.0+var(7)*0.33)), 40
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 9, 8
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 6
guardsound          = s1, 2
ground.slidetime    = 25
ground.hittime      = 25
air.hittime         = 25
guard.slidetime     = 22
guard.hittime       = 22
ground.velocity     = -8, -5
guard.velocity      = -8
air.velocity        = -8, -4
airguard.velocity   = -4, -3
yaccel              = 0.45
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(60*(1+(0.5*var(7))))
getpower            = 0, 0
givepower           = Floor(180*Fvar(5)), 0
envshake.time       = 5
envshake.freq       = 70
envshake.ampl       = 20
envshake.phase      = 80 
ID                  = 2200
Ground.CornerPush.VelOff   = 0
Guard.CornerPush.VelOff    = 0

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7015
ID       = 7000
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded = 1
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 2215, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.80

[State 2215, 変数]  ;smash attack補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 0.80


;-------------------------------------------------[終了]

[State 2215, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1






;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 相手制御ステート / ゴートハンティング / 専用やられ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[Statedef 2250]
Type     = S
Movetype = H
Physics  = S
Velset   = 0, 0
Ctrl     = 0

[State 2250, 座標]
Type     = Posset
Trigger1 = !time
Y = 0

[State 2250, 0] ;ヘルパー対策
type     = DestroySelf
trigger1 = ishelper

[State 2050, 1]
type     = HitFallSet
Trigger1 = !Time
value    = 0

[State 2250]
type     = ChangeAnim2
trigger1 = !time
value    = 2250

[State 2250]
type     = SelfState
trigger1 = time >= 100
value    = 0







;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / フライングネックカット
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2300]
type     = S
movetype = A
physics  = N
ctrl     = 0
anim     = 2300
sprpriority = 2

[State 2300]
Type     = Velset
Trigger1 = !time
X = 0

[State 2300, 状態変化]
type      = StateTypeSet
Trigger1  = Animelem = 2
Statetype = A

;-------------------------------------------------[キャンセル補正]

[State 2300, 変数]  ;Chain spell補正
Type           = VarSet
Trigger1       = !time
Trigger1       = PrevStateNo = [200,1900]
Persistent     = 0
IgnoreHitPause = 1
fvar(4)        = 0.925

;-----------------------------------------------------[ゲージ管理]

[State 2300, ゲージ減少]
Type           = PowerAdd
Trigger1       = !time
Persistent     = 0
IgnoreHitPause = 1
Value          = -1000

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = !time
value    = s60, 2

[state a, nothitby]
type     = nothitby
trigger1 = !time
value    = SCA, AA, AT, AP
time     = 44
Persistent     = 0
ignorehitpause = 1

[State a, 背景用]
type     = VarSet
Trigger1 = !time
var(1)   = 0

[State a, 背景用]
type     = VarAdd
Trigger1 = Animelemtime(1) = [1, 5]
var(1)   = 10

[State a, 背景用]
type     = VarAdd
Trigger1 = Animelemtime(1) = [36, 40]
var(1)   = -10

[State a];背景色
type      = BGPalFX
trigger1  = Animelemtime(1) = [0, 40]
time      = 1
mul       = 255-var(1),255-var(1),255-var(1)
invertall = 0

[State a, 暗転処理]
type     = SuperPause
trigger1 = Animelemtime(1) = 0
anim     = -1
sound    = -1
darken   = 0
time     = 40
movetime = 40
P2DefMul = 1

;-----------------------------------------------------[エフェクト]

[State a, エフェクト] ;スペル発動エフェクト
Type     = Helper
Trigger1 = AnimelemTime(1) = 0
OwnPal   = 1
PosType  = P1
Pos      = 0, const(size.mid.pos.y)
ID       = 8800
StateNo  = 8800
Name     = "Spell-time"
Persistent= 0
PauseMoveTime = 999999
SuperMoveTime = 999999

[State a, エフェクト] ;カットイン表示
Type     = null;Helper
Trigger1 = AnimelemTime(1) = 0
OwnPal   = 1
PosType  = back
Pos      = 0, -200;const(size.mid.pos.y)
ID       = Ifelse(TeamSide=1,9800,9801)
StateNo  = 9800
Name     = "Cut-In"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999


;-------------------------------------------------[演出]

[State a, ボイス再生];慣れたものよ
type       = PlaySnd
triggerAll = Alive
trigger1   = !time
value      = s2300, 0
channel    = 5

[State a, 効果音]
type       = PlaySnd
trigger1   = Animelemtime(2) = 0
value      = s40, 5

[State 2300, 速度]
type     = Velset
Trigger1 = Animelemtime(2) = 0
X = 5
Y = -4

[State 2300, 速度]
type     = VelMul
Trigger1 = Animelemtime(3) >= 0
Trigger1 = Vel X > 0
X = 0

[State 2300, 速度]
type     = VelAdd
Trigger1 = Animelemtime(3) >= 0
Y = 0.4

;-------------------------------------------------[ヒット定義]

[State 2300, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = A, HA
hitflag             = MAF
guardflag           = M
damage              = Floor(150*Fvar(5)*(1.0+var(7)*0.33)), 30
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 5, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 2
ground.slidetime    = 25
ground.hittime      = 25
air.hittime         = 25
guard.slidetime     = 22
guard.hittime       = 22
ground.velocity     = -4, -7
guard.velocity      = -6
air.velocity        = -4, -7
airguard.velocity   = -4, -3
yaccel              = 0.48
fall                = 1
air.fall            = 1
fall.recover        = 0
fall.recovertime    = 9999;Ceil(45*(1+(0.5*var(7))))
getpower            = 0, 0
givepower           = Floor(150*Fvar(5)), 0
envshake.time       = 5
envshake.freq       = 70
envshake.ampl       = 20
envshake.phase      = 80 
ID                  = 2300
Ground.CornerPush.VelOff   = 0
Guard.CornerPush.VelOff    = 0

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7035
ID       = 7000
Pos      = 35, -75
PosType  = P1
OwnPal   = 1
size.xscale   = 1.5
size.yscale   = 1.5
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded = 1
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 2300, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.80

[State 2300, 変数]  ;Rift attack補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = 0.80

;-------------------------------------------------[終了]

[State 2300, 行動可能]
type     = CtrlSet
trigger1 = Animelem = 14
value    = 1

[State 2300, 着地終了]
Type     = ChangeState
Trigger1 = (Vel Y > 0) && (pos y >= 0)
Value    = 52
Ctrl     = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / シューティングジャスティス / 初段
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2400]
type     = S
movetype = A
physics  = N
ctrl     = 0
anim     = 2300
sprpriority = 2

[State 2400]
Type     = Velset
Trigger1 = !time
X = 0

[State 2400, 状態変化]
type      = StateTypeSet
Trigger1  = Animelem = 2
Statetype = A

;-------------------------------------------------[キャンセル補正]

[State 2400, 変数]  ;Chain spell補正
Type           = VarSet
Trigger1       = !time
Trigger1       = PrevStateNo = [200,1900]
Persistent     = 0
IgnoreHitPause = 1
fvar(4)        = 0.925

;-----------------------------------------------------[ゲージ管理]

[State 2400, ゲージ減少]
Type           = PowerAdd
Trigger1       = !time
Persistent     = 0
IgnoreHitPause = 1
Value          = -1000

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = !time
value    = s60, 2

[state a, nothitby]
type     = nothitby
trigger1 = !time
value    = SCA, AA, AT, AP
time     = 44
Persistent     = 0
ignorehitpause = 1

[State a, 背景用]
type     = VarSet
Trigger1 = !time
var(1)   = 0

[State a, 背景用]
type     = VarAdd
Trigger1 = Animelemtime(1) = [1, 5]
var(1)   = 10

[State a, 背景用]
type     = VarAdd
Trigger1 = Animelemtime(1) = [36, 40]
var(1)   = -10

[State a];背景色
type      = BGPalFX
trigger1  = Animelemtime(1) = [0, 40]
time      = 1
mul       = 255-var(1),255-var(1),255-var(1)
invertall = 0

[State a, 暗転処理]
type     = SuperPause
trigger1 = Animelemtime(1) = 0
anim     = -1
sound    = -1
darken   = 0
time     = 40
movetime = 40
P2DefMul = 1

;-----------------------------------------------------[エフェクト]

[State a, エフェクト] ;スペル発動エフェクト
Type     = Helper
Trigger1 = AnimelemTime(1) = 0
OwnPal   = 1
PosType  = P1
Pos      = 0, const(size.mid.pos.y)
ID       = 8800
StateNo  = 8800
Name     = "Spell-time"
Persistent= 0
PauseMoveTime = 999999
SuperMoveTime = 999999

[State a, エフェクト] ;カットイン表示
Type     = null;Helper
Trigger1 = AnimelemTime(1) = 0
OwnPal   = 1
PosType  = back
Pos      = 0, -200;const(size.mid.pos.y)
ID       = Ifelse(TeamSide=1,9800,9801)
StateNo  = 9800
Name     = "Cut-In"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999


;-------------------------------------------------[演出]

[State a, ボイス再生];慣れたものよ
type       = PlaySnd
triggerAll = Alive
trigger1   = !time
value      = s2400, 0
channel    = 5

[State a, 効果音]
type       = PlaySnd
trigger1   = Animelemtime(2) = 0
value      = s40, 5

[State 2400, 速度]
type     = Velset
Trigger1 = Animelemtime(2) = 0
X = 5
Y = -4

[State 2400, 速度]
type     = VelMul
Trigger1 = Animelemtime(3) >= 0
Trigger1 = Vel X > 0
X = 0.8

[State 2400, 速度]
type     = VelAdd
Trigger1 = Animelemtime(3) >= 0
Y = 0.4

;-------------------------------------------------[ヒット定義]

[State 2400, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = A, HA
hitflag             = MAF
guardflag           = M
damage              = Floor(80*Fvar(5)*(1.0+var(7)*0.33)), 20
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 10, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 2
ground.slidetime    = 25
ground.hittime      = 25
air.hittime         = 25
guard.slidetime     = 22
guard.hittime       = 22
ground.velocity     = -4
guard.velocity      = -6
air.velocity        = -3, -6
airguard.velocity   = -4, -3
yaccel              = 0.45
air.fall            = 1
fall.recover        = 0
fall.recovertime    = 9999;Ceil(60*(1+(0.5*var(7))))
getpower            = 0, 0
givepower           = Floor(80*Fvar(5)), 0
envshake.time       = 5
envshake.freq       = 70
envshake.ampl       = 20
envshake.phase      = 80 
ID                  = 2400
Ground.CornerPush.VelOff   = 0
Guard.CornerPush.VelOff    = 0

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7025
ID       = 7000
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
size.xscale   = 1.5
size.yscale   = 1.5
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded = 1
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 2400, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.92

[State 2400, 変数]  ;Rift attack補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = 0.80

;-------------------------------------------------[終了]

[State 2400, ステート変更];銃撃へ
type     = ChangeState
trigger1 = MoveHit = 1
Trigger1 = Numtarget
value    = 2410
ctrl     = 0

[State 2400, 行動可能]
type     = CtrlSet
trigger1 = Animelem = 14
value    = 1

[State 2400, 着地終了]
Type     = ChangeState
Trigger1 = (Vel Y > 0) && (pos y >= 0)
Value    = 52
Ctrl     = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / シューティングジャスティス / 銃撃
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2410]
type     = A
movetype = A
physics  = N
ctrl     = 0
sprpriority = 2

[State 2410]
Type     = VelSet
Trigger1 = !time
X = 0
Y = 0
Persistent     = 0
ignorehitpause = 1

[State 2410]
Type     = VelSet
Trigger1 = Time = 4
X = -0.5
Y = -2

[State 2410]
type     = VelAdd
Trigger1 = StateTime < 67
Trigger1 = Time%2 = 0
Y  = 0.12

[State 2410]
Type     = ChangeAnim
Trigger1 = !time
value    = 2400
Persistent     = 0
ignorehitpause = 1

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = !time
value    = s60, 2

[state a, nothitby]
type     = nothitby
trigger1 = Time = [0, 67]
value    = SCA, AA, AT, AP
time     = 1
Persistent     = 0
ignorehitpause = 1

[State a, 背景用]
type     = VarSet
Trigger1 = !time
var(1)   = 0

[State a, 背景用]
type     = VarAdd
Trigger1 = Time = [1, 5]
var(1)   = 10

[State a, 背景用]
type     = VarAdd
Trigger1 = Time = [63, 67]
var(1)   = -10

[State a];背景色
type      = BGPalFX
trigger1  = Time = [0, 67]
time      = 2
mul       = 255-var(1),255-var(1),255-var(1)
invertall = 0

[State a, 暗転処理]
type     = SuperPause
Trigger1 = Animelemtime(7) < 0
trigger1 = Statetime%2 = 0
anim     = -1
sound    = -1
darken   = 0
time     = 2
movetime = 2
P2DefMul = 1

;-----------------------------------------------------[エフェクト]

[State a, エフェクト] ;スペル発動エフェクト
Type     = Helper
Trigger1 = Time = 0
OwnPal   = 1
PosType  = P1
Pos      = 0, const(size.mid.pos.y)
ID       = 8800
StateNo  = 8800
Name     = "Spell-time"
Persistent= 0
PauseMoveTime = 999999
SuperMoveTime = 999999

[State a, エフェクト] ;カットイン表示
Type     = Helper
Trigger1 = Time = 0
OwnPal   = 1
PosType  = back
Pos      = 0, -180
ID       = Ifelse(TeamSide=1,9800,9801)
StateNo  = 9810
Name     = "Cut-In"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999


;-------------------------------------------------[演出]

[State a, ボイス再生];頭を抉りてよねぇ
type       = PlaySnd
triggerAll = Alive
trigger1   = Time = 12
value      = s2400, 1
;channel    = 5

[State a, 効果音]
type       = PlaySnd
trigger1   = Animelem = 6
value      = s50, 1

[State a, 効果音]
type       = PlaySnd
trigger1   = Animelem = 7
value      = s50, 0

[State 2400, 速度]
type     = Velset
Trigger1 = Animelem = 7
X = -3
Y = -6

[State 2410, 速度]
type     = VelAdd
Trigger1 = AnimelemTime(7) >= 0
Y = 0.45

[State 2400, 速度]
type     = Velset
Trigger1 = Pos Y > 0
Y = 0

[State 2400, 速度]
type     = PosSet
Trigger1 = Pos Y > 0
Y = 0

[State 2410, エフェクト]
Type     = Helper
Trigger1 = Animelem = 7
Name     = "Effect"
Stateno  = 11010
ID       = 11010
Pos      = 70, -83
PosType  = P1
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State 50, 煙エフェクト]
type     = Helper
Trigger1 = Animelem = 7
ID       = 8042
postype  = p1
pos      = 70, -80
name     = "jamp-Smoke"
stateno  = 8042
helpertype = normal
keyctrl  = 0
ownpal   = 1
PauseMoveTime = 99999
supermovetime = 99999

[State 2410, リロード判定]
type     = Varset
Trigger1 = AnimelemTime(7) = 0
var(50)  = 0

;-------------------------------------------------[弾幕展開]

[State 2410]
Type     = Helper
Trigger1 = Animelemtime(7) = 0
Name     = "sord off"
Stateno  = 12400
ID       = 12400
Pos      = 35, -75
PosType  = P1
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[ヒット定義]

[State 2400, HitDef]
type                = null;HitDef
trigger1            = AnimElem = 7
attr                = A, HA
hitflag             = MAF
guardflag           = M
damage              = Floor(160*Fvar(5)*(1.0+var(7)*0.33)), 40
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 10, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 6
guardsound          = s1, 2
ground.slidetime    = 25
ground.hittime      = 25
air.hittime         = 25
guard.slidetime     = 22
guard.hittime       = 22
ground.velocity     = -8, -4
guard.velocity      = -8
air.velocity        = -8, -4
airguard.velocity   = -4, -3
yaccel              = 0.45
fall                = 1
air.fall            = 1
fall.recovertime    = Ceil(60*(1+(0.5*var(7))))
getpower            = 0, 0
givepower           = Floor(160*Fvar(5)), 0
envshake.time       = 5
envshake.freq       = 70
envshake.ampl       = 20
envshake.phase      = 80 
ID                  = 2410
Ground.CornerPush.VelOff   = 0
Guard.CornerPush.VelOff    = 0

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7015
ID       = 7000
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded = 1
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 2410, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.80

[State 2410, 変数]  ;Smash attack補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 0.80

;-------------------------------------------------[終了]

[State 2410, 相手制御]
type     = targetstate
trigger1 = NumTarget(2410) >= 1
trigger1 = Target(2410),ishelper = 0
trigger1 = Movehit = 1
value    = 8020
ID       = 2410
persistent = 0

[State 2410, 行動可能]
type     = CtrlSet
trigger1 = Animelem = 12
value    = 1

[State 2410, 着地終了]
Type     = ChangeState
Trigger1 = Animelemtime(7) > 0
Trigger1 = (Vel Y > 0) && (pos y >= 0)
Value    = 52
Ctrl     = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[エフェクト] シューティングジャスティス / 弾丸
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[statedef 12400]
type        = A
Physics     = N
Movetype    = A
Anim        = 12400
SprPriority = 4

[State 12400, 速度用]
type     = VarAdd
trigger1 = Time > 2
var(1)   = 5

[State 12400, 速度]
type     = Velset
Trigger1 = ISHelper(12400)
Trigger1 = time > 0
X        = 50 + var(1)

;-------------------------------------------------[ヒット定義]

[State 2400, HitDef]
type                = HitDef
trigger1            = Time > 0
attr                = A, HP
hitflag             = MAF
guardflag           = MA
damage              = Floor(160*root,Fvar(5)), 40
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 0, 9
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 6
guardsound          = s1, 2
ground.slidetime    = 25
ground.hittime      = 25
air.hittime         = 25
guard.slidetime     = 22
guard.hittime       = 22
ground.velocity     = -8, -4
guard.velocity      = -8
air.velocity        = -8, -4
airguard.velocity   = -4, -3
yaccel              = 0.45
fall                = 1
air.fall            = 1
fall.recovertime    = 60
getpower            = 0, 0
givepower           = Floor(160*root,Fvar(5)), 0
envshake.time       = 5
envshake.freq       = 70
envshake.ampl       = 20
envshake.phase      = 80 
ID                  = 2410
Ground.CornerPush.VelOff   = 0
Guard.CornerPush.VelOff    = 0

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7015
ID       = 7000
Pos      = 0, 0
PosType  = P1
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = Moveguarded = 1
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 0, 0
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, 変数]  ;Rate補正
Type           = ParentVarSet
Trigger1       = MoveHit
Trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = Root,FVar(0) * 0.80

[State a, 変数]  ;smash attck補正
Type           = ParentVarSet
Trigger1       = MoveHit
Trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 0.80

[State 2410, 相手制御]
type     = targetstate
trigger1 = NumTarget(2410) >= 1
trigger1 = Target(2410),ishelper = 0
trigger1 = Movehit = 1
value    = 8020
ID       = 2410
persistent = 0

;-------------------------------------------------[終了]

[State 12410]
Type     = DestroySelf
Trigger1 = MoveContact = 1
Trigger2 = time > 10





;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ゴールデンドリーム
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2500]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 2500
sprpriority = 2

[State 2500]
Type     = Velset
Trigger1 = !time
X = 0
y = 0

;-------------------------------------------------[キャンセル補正]

[State 2500, 変数]  ;Chain spell補正
Type           = VarSet
Trigger1       = !time
Trigger1       = PrevStateNo = [200,1900]
Persistent     = 0
IgnoreHitPause = 1
fvar(4)        = 0.925

;-----------------------------------------------------[ゲージ管理]

[State 2500, ゲージ減少]
Type           = PowerAdd
Trigger1       = !time
Persistent     = 0
IgnoreHitPause = 1
Value          = -1000

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = !time
value    = s60, 2

[state a, nothitby]
type     = nothitby
trigger1 = !time
value    = SCA, AA, AT, AP
time     = 50
Persistent     = 0
ignorehitpause = 1

[State a, 背景用]
type     = VarSet
Trigger1 = !time
var(1)   = 0

[State a, 背景用]
type     = VarAdd
Trigger1 = Animelemtime(1) = [1, 5]
var(1)   = 10

[State a, 背景用]
type     = VarAdd
Trigger1 = Animelemtime(1) = [51, 55]
var(1)   = -10

[State a];背景色
type      = BGPalFX
trigger1  = Animelemtime(1) = [0, 55]
time      = 1
mul       = 255-var(1),255-var(1),255-var(1)
invertall = 0

[State a, 暗転処理]
type     = SuperPause
trigger1 = !time
anim     = -1
sound    = -1
darken   = 0
time     = 55
movetime = 55
P2DefMul = 1

;-----------------------------------------------------[エフェクト]

[State a, エフェクト] ;スペル発動エフェクト
Type     = Helper
Trigger1 = !time
OwnPal   = 1
PosType  = P1
Pos      = 0, const(size.mid.pos.y)
ID       = 8800
StateNo  = 8800
Name     = "Spell-time"
Persistent= 0
PauseMoveTime = 999999
SuperMoveTime = 999999

[State a, エフェクト] ;カットイン表示
Type     = Helper
Trigger1 = !time
OwnPal   = 1
PosType  = back
Pos      = 0, -180
ID       = Ifelse(TeamSide=1,9800,9801)
StateNo  = 9850
Name     = "Cut-In"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999

;-------------------------------------------------[演出]

[State a, ボイス再生];ﾐｾﾃﾔﾙﾖ
type       = PlaySnd
triggerAll = Alive
trigger1   = !time
value      = s2200, 0
channel    = 5

[State a, ボイス再生];黄金の夢ってヤツを！
type       = PlaySnd
triggerAll = Alive
trigger1   = Animelemtime(13) = 0
value      = s2200, 1
channel    = 5

[State 2500, 画面振動]
type     = EnvShake
trigger1 = AnimelemTime(10) = 0
time     = 15
ampl     = -6
freq     = 120
phase    = 120

[State a, 効果音]
type       = PlaySnd
trigger1   = Animelem = 8
value      = s10, 0

[State 2500, 速度]
Type     = Velset
Trigger1 = Animelem = 12
X = 5

[State a, 効果音]
type       = PlaySnd
trigger1   = Animelem = 12
value      = s50, 5

[State 2500, 速度]
Type     = Velset
Trigger1 = Animelem = 16
X = 6

[State 2500, 速度]
Type     = Velset
Trigger1 = Animelem = 21
X = 6

[State 2500, 速度]
Type     = Velset
Trigger1 = Animelem = 25
X = 5

[State 1100, エフェクト];砂煙
type        = Helper
trigger1    = Animelem = 12
trigger2    = Animelem = 16
trigger3    = Animelem = 21
name        = "Skill-smoke"
ID          = 8125
postype     = P1
pos         = 30, 0
Stateno     = 8125
ownpal      = 1
ignorehitpause = 1

[State 1100, エフェクト];砂煙
type        = Helper
trigger1    = Animelem = 12
trigger2    = Animelem = 16
trigger3    = Animelem = 27
name        = "Skill-smoke"
ID          = 8126
postype     = P1
pos         = -30, 0
Stateno     = 8125
ownpal      = 1
ignorehitpause = 1


[State 2500];インゴット
Type     = Helper
Trigger1 = Animelem = 4
Name     = "Gold"
Stateno  = 12500
ID       = 12500
Pos      = 0, -300
PosType  = P1
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State 2500];インゴット(投擲)
Type     = Helper
Trigger1 = Animelem = 26
Name     = "Gold"
Stateno  = 12505
ID       = 12505
Pos      = 0, 0
PosType  = P1
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[ヒット定義]

[State 2600, HitDef]
type                = HitDef
trigger1            = AnimElem = 13
trigger2            = AnimElem = 16
trigger3            = AnimElem = 18
trigger4            = AnimElem = 21
trigger5            = AnimElem = 23
attr                = S, HA
hitflag             = MAF
guardflag           = M
damage              = Floor(70*Fvar(5)*(1.0+var(7)*0.33)), 10
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 15, 14
sparkno             = -1
sparkxy             = 0, -55
guard.sparkno       = -1
hitsound            = s0, 7
guardsound          = s1, 2
ground.slidetime    = 25
ground.hittime      = 25
air.hittime         = 25
guard.slidetime     = 20
guard.hittime       = 20
ground.velocity     = -4
guard.velocity      = -4
air.velocity        = -3, -4
airguard.velocity   = -2, -3
yaccel              = 0.45
air.fall            = 1
fall.recover        = 0
getpower            = 0, 0
givepower           = Floor(70*Fvar(5)), 0
ID                  = 2500
envshake.time       = 8
envshake.freq       = 70
envshake.ampl       = 5
envshake.phase      = 80 
Ground.CornerPush.VelOff   = 0
Guard.CornerPush.VelOff    = 0

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Trigger1 = animelemtime(13) = [0,4]
Name     = "hit"
Stateno  = 7015
ID       = 7000
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Trigger1 = animelemtime(16) = [0,4]
Name     = "hit"
Stateno  = 7015
ID       = 7000
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Trigger1 = animelemtime(18) = [0,4]
Name     = "hit"
Stateno  = 7015
ID       = 7000
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Trigger1 = animelemtime(21) = [0,4]
Name     = "hit"
Stateno  = 7015
ID       = 7000
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Trigger1 = animelemtime(23) = [0,4]
Name     = "hit"
Stateno  = 7015
ID       = 7000
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = Moveguarded = 1
Trigger1 = animelemtime(13) = [0,4]
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = Moveguarded = 1
Trigger1 = animelemtime(16) = [0,4]
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = Moveguarded = 1
Trigger1 = animelemtime(18) = [0,4]
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = Moveguarded = 1
Trigger1 = animelemtime(21) = [0,4]
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = Moveguarded = 1
Trigger1 = animelemtime(23) = [0,4]
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 2500, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Trigger1       = animelemtime(13) = [0,4]
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.92

[State 2500, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Trigger1       = animelemtime(16) = [0,4]
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.92

[State 2500, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Trigger1       = animelemtime(18) = [0,4]
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.92

[State 2500, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Trigger1       = animelemtime(21) = [0,4]
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.92

[State 2500, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Trigger1       = animelemtime(23) = [0,4]
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.92

;-------------------------------------------------[終了]

[State 2500, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[エフェクト] ゴールデンドリーム / 金塊
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[statedef 12500]
Physics     = N
Anim        = 12500
SprPriority = 9

[State 12500]
Type     = AngleDraw
trigger1 = 1
scale    = 0.5, 0.5

[State 12500]
type     = bindtoparent
Trigger1 = var(0)
Pos      = 0, 0

;-------------------------------------[落下]

[State 12500]
type     = Velset
Trigger1 =!time
Y        = 10.7

[State 12500]
Type     = Velset
Trigger1 = root,Animelem = 8
Trigger2 = Pos Y > 0
Y = 0

[State 12500]
Type     = Posset
Trigger1 = root,Animelem = 8
Trigger2 = Pos Y > 0
Y = 0

[State 12500]
type     = varset
Trigger1 = root,Animelem = 8
var(0)   = 1

;-------------------------------------[回転]

[State 12500]
Type     = ChangeAnim
Trigger1 = root,Animelem = 8
value    = Anim
elem     = 2

[State 12500]
Type     = ChangeAnim
Trigger1 = root,Animelem = 9
value    = Anim
elem     = 3

[State 12500]
Type     = ChangeAnim
Trigger1 = root,Animelem = 11
value    = Anim
elem     = 4

[State 12500]
Type     = ChangeAnim
Trigger1 = root,Animelem = 12
value    = Anim
elem     = 5

[State 12500]
Type     = ChangeAnim
Trigger1 = root,Animelem = 13
value    = Anim
elem     = 6

[State 12500]
Type     = null;SprPriority
Trigger1 = root,Animelem = 13
Value    = -1

[State 12500]
Type     = ChangeAnim
Trigger1 = root,Animelem = 14
value    = Anim
elem     = 7

[State 12500]
Type     = ChangeAnim
Trigger1 = root,Animelem = 15
value    = Anim
elem     = 8

[State 12500]
Type     = null;SprPriority
Trigger1 = root,Animelem = 16
Value    = 9

[State 12500]
Type     = ChangeAnim
Trigger1 = root,Animelem = 16
value    = Anim
elem     = 9

[State 12500]
Type     = null;SprPriority
Trigger1 = root,Animelem = 17
Value    = -1

[State 12500]
Type     = ChangeAnim
Trigger1 = root,Animelem = 17
value    = Anim
elem     = 10

[State 12500]
Type     = ChangeAnim
Trigger1 = root,Animelem = 18
value    = Anim
elem     = 6

[State 12500]
Type     = ChangeAnim
Trigger1 = root,Animelem = 19
value    = Anim
elem     = 7

[State 12500]
Type     = null;SprPriority
Trigger1 = root,Animelem = 20
Value    = 9

[State 12500]
Type     = ChangeAnim
Trigger1 = root,Animelem = 20
value    = Anim
elem     = 8

[State 12500]
Type     = ChangeAnim
Trigger1 = root,Animelem = 21
value    = Anim
elem     = 9

[State 12500]
Type     = ChangeAnim
Trigger1 = root,Animelem = 22
value    = Anim
elem     = 10

[State 12500]
Type     = ChangeAnim
Trigger1 = root,Animelem = 23
value    = Anim
elem     = 11

[State 12500]
Type     = ChangeAnim
Trigger1 = root,Animelem = 24
value    = Anim
elem     = 12

[State 12500]
Type     = ChangeAnim
Trigger1 = root,Animelem = 25
value    = Anim
elem     = 13

[State 12500]
Type     = DestroySelf
Trigger1 = Root,StateNo != 2500
Trigger2 = Root,Movetype = H
Trigger3 = (root,Anim=2500)&&(root,Animelem = 26)



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[エフェクト] ゴールデンドリーム / 金塊(投擲用)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[statedef 12505]
Type        = A
Physics     = N
Movetype    = A
Anim        = 12505
SprPriority = 9

[State 12505]
Type     = AngleDraw
trigger1 = 1
scale    = 0.5, 0.5

[State 12505]
type     = bindtoparent
Trigger1 = AnimelemTime(3) < 0
Pos      = 0, 0

[State 12505]
type     = Velset
Trigger1 = Animelem = 3
X = 30

;-------------------------------------------------[ヒット定義]

[State 12505, HitDef]
type                = HitDef
trigger1            = Animelem = 3
attr                = A, HP
hitflag             = MAF
guardflag           = MA
damage              = Floor(80*root,Fvar(5)), 15
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 0, 5
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 7
guardsound          = s1, 2
ground.slidetime    = 20 + ((p2movetype=A)*5)
ground.hittime      = 20 + ((p2movetype=A)*5)
air.hittime         = 20 + ((p2movetype=A)*5)
guard.slidetime     = 18
guard.hittime       = 18
ground.velocity     = -5, -6
guard.velocity      = -10
air.velocity        = -5, -6
airguard.velocity   = -5, -3
yaccel              = 0.47
fall                = 1
air.fall            = 1
ID                  = 2500
fall.recovertime    = Ceil(60*root,FVar(0)*(1+(0.5*root,var(7))))
getpower            = 0, 0
givepower           = Floor(80*root,Fvar(5)), 0
Ground.CornerPush.VelOff   = 0
Guard.CornerPush.VelOff    = 0

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7015
ID       = 7000
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = Moveguarded = 1
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 0, -55
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0


;-------------------------------------------------[補正]

[State a, 変数]  ;Rate補正
Type           = ParentVarSet
Trigger1       = MoveHit
Trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = Root,FVar(0) * 0.80

[State a, 変数]  ;Rift attck補正
Type           = ParentVarSet
Trigger1       = MoveHit
Trigger1       = P2Movetype = H
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = 0.80

;-------------------------------------------------[カウンターヒット]

[State a, 変数]
type     = Varset
trigger1 = P2Movetype = A
var(7)   = 1

[State a, 攻撃力補正] 
type     = AttackMulSet 
trigger1 = 1
value    = 1.0+(0.33*(var(7)=1))

[State a, エフェクト]
Type     = Helper
Trigger1 = var(7) = 1
Trigger1 = MoveHit
trigger1 = enemynear,movetype = H
Name     = "counter-hit"
Stateno  = 8500
ID       = 8500
Pos      = 0, -50
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0


[State 12500]
Type     = DestroySelf
Trigger1 = frontedgedist < -50
Trigger2 = Time > 240










;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 真理亞の込めてくれた弾丸
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2600]
type     = S
movetype = A
physics  = N
ctrl     = 0
anim     = 2600
sprpriority = 2

[State 2600]
Type     = Velset
Trigger1 = !time
X = 0
y = 0

;-------------------------------------------------[キャンセル補正]

[State 2600, 変数]  ;Chain spell補正
Type           = VarSet
Trigger1       = !time
Trigger1       = PrevStateNo = [200,1900]
Persistent     = 0
IgnoreHitPause = 1
fvar(4)        = 0.925

;-----------------------------------------------------[ゲージ管理]

[State 2600, ゲージ減少]
Type           = null;PowerAdd
Trigger1       = !time
Persistent     = 0
IgnoreHitPause = 1
Value          = -3000

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = !time
value    = s60, 2

[state a, nothitby]
type     = nothitby
trigger1 = !time
value    = SCA, AA, AT, AP
time     = 80
Persistent     = 0
ignorehitpause = 1

[State a, エフェクト] ;特殊暗転用
Type     = Helper
Trigger1 = !time
OwnPal   = 1
PosType  = P1
Pos      = 0, const(size.mid.pos.y)
ID       = 12600
StateNo  = 12600
Name     = "Spell-time"
Persistent= 0
PauseMoveTime = 999999
SuperMoveTime = 999999

[State a, 暗転処理]
type     = SuperPause
trigger1 = !time
anim     = -1
sound    = -1
darken   = 0
time     = 80
movetime = 80
P2DefMul = 1

;-----------------------------------------------------[エフェクト]

[State a, エフェクト] ;スペル発動エフェクト
Type     = Helper
Trigger1 = !time
PosType  = P1
Pos      = 0, const(size.mid.pos.y)
ID       = 8800
StateNo  = 8800
Name     = "Spell-time"
Persistent= 0
ownpal   = 1
PauseMoveTime = 999999
SuperMoveTime = 999999

[State a, エフェクト] ;カットイン表示
Type     = Helper
Trigger1 = Time = 30
PosType  = back
Pos      = 0, -180
ID       = Ifelse(TeamSide=1,9800,9801)
StateNo  = 9830
ownpal   = 1
Name     = "Cut-In"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999

;-------------------------------------------------[演出]

[State a, ボイス再生];真理亞！
type       = PlaySnd
triggerAll = Alive
trigger1   = !time
value      = s2100, 0
channel    = 5

[State a, ボイス再生];受け取って！ママ！
type       = PlaySnd
triggerAll = Alive
trigger1   = Time = 0
value      = s2100, 1
channel    = 4

[State a, エフェクト] ;ライフル
Type     = Helper
Trigger1 = Time = 30
PosType  = P1
Pos      = -200, -400
ID       = 12605
StateNo  = 12605
ownpal   = 1
Name     = "Cut-In"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999

[State a, ボイス再生];上出来！
type       = PlaySnd
triggerAll = Alive
trigger1   = Animelem = 12
value      = s2100, 2
channel    = 5

[State a, 効果音];キャッチ
type       = PlaySnd
trigger1   = Animelemtime(10) = 0
value      = s10, 0

[State a, ボイス再生];うをおおおおおおおおおおオオオォオオオォオッ！！！
type       = PlaySnd
triggerAll = Alive
trigger1   = Animelem = 16
value      = s2100, 3

[State a, 効果音];銃撃
type       = PlaySnd
trigger1   = Animelemtime(17) = 0
trigger2   = Animelemtime(24) = 0
trigger3   = Animelemtime(33) = 0
trigger4   = Animelemtime(41) = 0
trigger5   = Animelemtime(49) = 0
trigger6   = Animelemtime(57) = 0
trigger7   = Animelemtime(65) = 0
trigger8   = Animelemtime(73) = 0
value      = s50, 0

[State a, 効果音];リロード
type       = PlaySnd
trigger1   = Animelemtime(21) = 0
trigger2   = Animelemtime(28) = 0
trigger3   = Animelemtime(37) = 0
trigger4   = Animelemtime(45) = 0
trigger5   = Animelemtime(53) = 0
trigger6   = Animelemtime(61) = 0
trigger7   = Animelemtime(69) = 0
trigger8   = Animelemtime(78) = 0
value      = s50, 1

[State 2600, リロード判定]
type     = Varset
Trigger1 = AnimelemTime(17) = 0
var(50)  = 0

[State 2410, エフェクト]
Type     = Helper
trigger1 = Animelemtime(17) = 0
trigger2 = Animelemtime(24) = 0
trigger3 = Animelemtime(33) = 0
trigger4 = Animelemtime(41) = 0
trigger5 = Animelemtime(49) = 0
trigger6 = Animelemtime(57) = 0
trigger7 = Animelemtime(65) = 0
trigger8 = Animelemtime(73) = 0
Name     = "Effect"
Stateno  = 11010
ID       = 11010
Pos      = 55, -96
PosType  = P1
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1

[State 2600, Explod]
type     = Explod
trigger1 = Animelemtime(17) = 0
trigger2 = Animelemtime(24) = 0
trigger3 = Animelemtime(33) = 0
trigger4 = Animelemtime(41) = 0
trigger5 = Animelemtime(49) = 0
trigger6 = Animelemtime(57) = 0
trigger7 = Animelemtime(65) = 0
trigger8 = Animelemtime(73) = 0
id       = 2
anim     = 11012
pos      = 55, -96
postype  = p1
vel      = 40, 0
ownpal   = 1
supermove = 1
sprpriority = 9
scale    = 0.5, 0.5
ignorehitpause = 1
removeongethit = 1

[State 2600, エフェクト]
type     = Explod
trigger1 = Animelemtime(17) = 0
trigger2 = Animelemtime(24) = 0
trigger3 = Animelemtime(33) = 0
trigger4 = Animelemtime(41) = 0
trigger5 = Animelemtime(49) = 0
trigger6 = Animelemtime(57) = 0
trigger7 = Animelemtime(65) = 0
trigger8 = Animelemtime(73) = 0
id       = 5
anim     = 8125
pos      = 55, -96
Random   = 10, 10
postype  = p1
ownpal   = 1
bindtime = -1
supermove = 1
sprpriority = 9
scale    = 0.5, 0.5
ignorehitpause = 1
removeongethit = 1

;相手はワイヤーダメージ

;-------------------------------------------------[ヒット定義]

[State 2600, HitDef]
type                = HitDef
trigger1            = AnimElem = 17
trigger2            = AnimElem = 24
trigger3            = AnimElem = 33
trigger4            = AnimElem = 41
trigger5            = AnimElem = 49
trigger6            = AnimElem = 57
trigger7            = AnimElem = 65
trigger8            = AnimElem = 73
attr                = S, HA
hitflag             = MAF
guardflag           = M
damage              = Floor(50*Fvar(5)*(1.0+var(7)*0.33)), 5
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 2, 1
sparkno             = s7015
sparkxy             = 0, -55
guard.sparkno       = s7110
hitsound            = -1
guardsound          = s1,2
ground.slidetime    = 20
ground.hittime      = 20
air.hittime         = 20
guard.slidetime     = 18
guard.hittime       = 18
ground.velocity     = -3, -4
guard.velocity      = -3
air.velocity        = -3, -4
airguard.velocity   = -2, -3
yaccel              = 0.45
Kill                = 1
fall                = 1
air.fall            = 1
fall.recover        = 0
getpower = 30,15
givepower           = Floor(50*Fvar(5)), 0
ID                  = 2600
P2Facing            = 1
envshake.time       = 8
envshake.freq       = 70
envshake.ampl       = 5
envshake.phase      = 80 
Ground.CornerPush.VelOff   = 0
Guard.CornerPush.VelOff    = 0

[State 2600, HitDef]
type                = HitDef
trigger1            = AnimElem = 84
attr                = S, HA
hitflag             = MAF
guardflag           = M
damage              = Floor(80*Fvar(5)*(1.0+var(7)*0.33)), 5
animtype            = Hard
ground.type         = high
priority            = 3, Hit
pausetime           = 2, 1
sparkno             = s7015
sparkxy             = 0, -50
guard.sparkno       = s7110
hitsound            = -1
guardsound          = -1
ground.slidetime    = 20
ground.hittime      = 20
air.hittime         = 20
guard.slidetime     = 18
guard.hittime       = 18
ground.velocity     = -3, -4
guard.velocity      = -3
air.velocity        = -3, -2
airguard.velocity   = -2, -3
yaccel              = 0.45
Kill                = 1
fall                = 1
air.fall            = 1
fall.recover        = 0
getpower = 30,15
givepower           = Floor(50*Fvar(5)), 0
ID                  = 2600
P2Facing            = 1
envshake.time       = 8
envshake.freq       = 80
envshake.ampl       = 5
envshake.phase      = 80 
Ground.CornerPush.VelOff   = 0
Guard.CornerPush.VelOff    = 0

;-------------------------------------------------[補正]

[State 2600, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
trigger1       = Animelemtime(17) = [0,2]
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.98

[State 2600, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
trigger1       = Animelemtime(24) = [0,2]
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.98

[State 2600, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
trigger1       = Animelemtime(33) = [0,2]
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.98

[State 2600, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
trigger1       = Animelemtime(41) = [0,2]
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.98

[State 2600, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
trigger1       = Animelemtime(49) = [0,2]
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.98

[State 2600, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
trigger1       = Animelemtime(57) = [0,2]
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.98

[State 2600, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
trigger1       = Animelemtime(65) = [0,2]
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.98

[State 2600, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
trigger1       = Animelemtime(73) = [0,2]
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.98

[State 2600, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
trigger1       = Animelemtime(84) = [0,2]
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.50

[State 2600, 変数]  ;Smash attack補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(2)        = 0.80

;-------------------------------------------------[終了]

[State 2600]
type     = TargetState
trigger1 = NumTarget(2600) >= 1
trigger1 = Target(2600),ishelper = 0
trigger1 = Movehit = 1
value    = 2650
ID       = 2600
ctrl     = 0

;-----------------------------------------------------[演出２]

[State 2600, 相手識別]
Type     = Varset
Trigger1 = !time
var(0)   = 0

[State 2600, 相手識別];狼
Type     = Varset
trigger1 = Enemynear,Name = "battler"
trigger2 = Enemynear,Name = "battler_ushiromiya"
trigger3 = Enemynear,Name = "battler ushiromiya"
trigger4 = Enemynear,Name = "ushiromiya_battler"
trigger5 = Enemynear,Name = "ushiromiya battler"
trigger6 = Enemynear,Name = "George"
trigger7 = Enemynear,Name = "George_ushiromiya"
trigger8 = Enemynear,Name = "George ushiromiya"
trigger9 = Enemynear,Name = "ushiromiya_George"
trigger10= Enemynear,Name = "ushiromiya George"
trigger11= Enemynear,Name = "Jessica"
trigger12= Enemynear,Name = "Jessica_ushiromiya"
trigger13= Enemynear,Name = "Jessica ushiromiya"
trigger14= Enemynear,Name = "ushiromiya_Jessica"
trigger15= Enemynear,Name = "ushiromiya Jessica"
trigger16= Enemynear,Name = "Jessica"
trigger17= Enemynear,Name = "Jessica_ushiromiya"
trigger18= Enemynear,Name = "Jessica ushiromiya"
trigger19= Enemynear,Name = "ushiromiya_Jessica"
trigger20= Enemynear,Name = "ushiromiya Jessica"
trigger21= Enemynear,Name = "Kanon"
trigger22= Enemynear,Name = "Shanon"
var(0)   = 1

[State 2600, 相手識別];ウサギの音楽隊
Type     = Varset
trigger1 = Enemynear,Name = "chiester410"
trigger2 = Enemynear,Name = "chiester 410"
trigger3 = Enemynear,Name = "chiester_410"
trigger4 = Enemynear,Name = "chiester-410"
trigger5 = Enemynear,Name = "chiester410_S"

trigger6 = Enemynear,Name = "Reisen Udongein Inaba"
trigger7 = Enemynear,Name = "miminashi-udonge"
trigger8 = Enemynear,Name = "Reisen Deadpool Inaba"
trigger9 = Enemynear,Name = "REIsen U Inaba"
trigger10= Enemynear,Name = "Reisen U Inaba"
trigger11= Enemynear,Name = "TEOC REISEN"
trigger12= Enemynear,Name = "Reisen Udongein Inaba blazer"

trigger13= Enemynear,Name = "shirousagi"
trigger14= Enemynear,Name = "Tewi Inaba"
trigger15= Enemynear,Name = "tewi?"
trigger16= Enemynear,Name = "Inaba Tei"
trigger17= Enemynear,Name = "Inaba Tewi"
var(0)   = 2

[State 2600, 相手識別];土産の文鎮
Type     = Varset
trigger1 = Enemynear,Name = "lucifer"
var(0)   = 3

[State 2600, 相手識別];EVA叔母さん
Type     = Varset
trigger1 = Enemynear,Name = "eva beatrice"
trigger2 = Enemynear,Name = "eva_beatrice"
trigger3 = Enemynear,Name = "eva-beatrice"
var(0)   = 5

[State a, ボイス再生];私だって真剣なのよ！ 他
type       = PlaySnd
triggerAll = Alive
trigger1   = Animelem = 83
value      = s2100, 4 + var(0)

[State 2410, エフェクト]
Type     = Helper
trigger1 = Animelemtime(84) = 0
Name     = "Effect"
Stateno  = 11010
ID       = 11010
Pos      = 45, -65
PosType  = P1
OwnPal   = 1
size.xscale   = 1.5
size.yscale   = 1.5
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1

[State a, 効果音];銃撃
type       = PlaySnd
trigger1   = Animelem = 84
value      = s50, 0

[State 2600, 速度]
Type     = Velset
Trigger1 = Animelem = 84
X = -8

[State 2600, 速度]
Type     = VelMul
Trigger1 = Vel X < 0
X = 0.92

;-----------------------------------------------------[暗転演出]

[State a, 効果音]; 暗転音
type     = playsnd
trigger1 = Animelem = 83
value    = s60, 2

[state a, nothitby]
type     = nothitby
trigger1 = Animelem = 83
value    = SCA, AA, AT, AP
time     = 40
Persistent     = 0
ignorehitpause = 1

[State a, 背景用]
type     = VarSet
Trigger1 = Animelem = 83
var(1)   = 0

[State a, 暗転処理]
type     = SuperPause
trigger1 = Animelem = 83
anim     = -1
sound    = -1
darken   = 0
time     = 40
movetime = 40
P2DefMul = 1

;-----------------------------------------------------[エフェクト]

[State a, エフェクト] ;スペル発動エフェクト
Type     = Helper
Trigger1 = Animelem = 83
OwnPal   = 1
PosType  = P1
Pos      = 0, const(size.mid.pos.y)
ID       = 8800
StateNo  = 8800
Name     = "Spell-time"
Persistent= 0
PauseMoveTime = 999999
SuperMoveTime = 999999

[State a, エフェクト] ;カットイン表示
Type     = Helper
Trigger1 = Animelem = 83
OwnPal   = 1
PosType  = back
Pos      = 0, -180
ID       = Ifelse(TeamSide=1,9800,9801)
StateNo  = 9820
Name     = "Cut-In"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999

;-------------------------------------------------[終了]

[State 2600, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 真理亞の投げてくれたライフル
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 12605]
type     = A
movetype = I
physics  = N
ctrl     = 0
anim     = 12605
sprpriority = 4

[State 12605, 速度]
type     = Velset
trigger1 = 1
X        = (parentdist X-45) / 8
Y        = (parentdist Y - 100) / 8

[State 12605, 重力加速]
type     = Gravity
trigger1 = 1

;--------------------------------[相殺判定]

[State 12605, 無敵]
type     = Nothitby
trigger1 = 1
value    = SCA,AA,AP,AT
time     = 1

[State 12605, 角度設定]
type     = AngleDraw
trigger1 = 1
value    = 65

;--------------------------------[次へ]

[State 126050, ステート変更];ノーマルタッチ
Type     = destroyself
Trigger1 = (root,Anim=2600)&&(root,AnimelemTime(10)=1)
Trigger2 = Root,Movetype = H
Trigger3 = Root,StateNo != [2600,2605]
Trigger4 = time > 100




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;	[相手] 壁バウンドやられ(メタ必殺技専用) / 硬直
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2650]
Type     = A
MoveType = H
Physics  = N
Anim     = 5030
Ctrl     = 0
VelSet   = 0, 0

;------------------------------------------

[State 8020, 0] ;ヘルパー対策
type     = DestroySelf
trigger1 = ishelper

[State 8020]
type     = VelSet
trigger1 = 1
X = 0
Y = 0

[State 8020, 角度設定]
type     = Angleset
trigger1 = 1
value    = 0

[State 8020, アニメ変更]
Type     = ChangeAnim2
Trigger1 = Time = 0
Value    = 7500

[State 8020, ステート変更]
Type     = ChangeState
Trigger1 = HitShakeOver = 1
Value    = 2651


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;	[相手] 壁バウンドやられ(メタ必殺技専用) / 吹き飛び
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2651]
Type     = A
MoveType = H
Physics  = N
Anim     = IfElse(SelfAnimExist(5035), 5035, 5050)

[State 8021, アニメ変更]
Type     = ChangeAnim2
Trigger1 = Anim != 5035
Trigger1 = !Time
Value    = 7501

;------------------------------------------[速度処理]

[State 8021, HitVelSet]
Type     = HitVelSet
Trigger1 = Time = 0
X        = 1
Y        = 1

[State 8021, 速度]
Type     = VelSet
Trigger1 = 1
X        = -8
Y        = 0

[State 8021, 速度]  ;Y加速度
Type     = null;VelAdd
Trigger1 = 1
Y        = Ifelse(GetHitVar(YAccel)!=0 , GetHitVar(YAccel), 0.5)

;------------------------------------------[ステート変更]

[State 8021, ステート復帰]  ;着地
Type     = SelfState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value    = 5100

[State 8021, ステート変更]  ;壁に衝突
Type       = ChangeState
TriggerAll = Time > 0
Trigger1   = (Vel X >0) && (FrontEdgeBodyDist < 3)
Trigger2   = (Vel X <0) && (BackEdgeBodyDist  < 3)
Value      = 2652


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;	[相手]壁バウンドやられ(メタ必殺技専用) / 壁に激突
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[StateDef 2652]
Type     = A
MoveType = H
Physics  = N
Anim     = 5030

;------------------------------------------

[State 8022, アニメ変更]
Type     = ChangeAnim
Trigger1 = !Time
Value    = 5030

[State 8022, 速度]
Type     = VelSet
Trigger1 = !Time
Y        = 0

[State 8022, 座標固定]
Type     = PosFreeze
Trigger1 = 1

[State 8022, 画面振動]
type     = EnvShake
trigger1 = !time
time     = 10
ampl     = -6
freq     = 120
phase    = 120

[State 8022, ステート変更]
type     = ChangeState
trigger1 = Time = 5
value    = 2653


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;	[相手] 壁バウンドやられ(メタ必殺技専用) / 壁バウンド後
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[StateDef 2653]
Type     = A
MoveType = H
Physics  = N

;------------------------------------------

[State 8023, アニメ変更]
Type     = ChangeAnim
Trigger1 = Time = 2
Value    = 5050

[state 8023, 速度]
type     = velset
trigger1 = !time
X        = 1
Y        = -3

[state 8023, 速度]
type     = veladd
trigger1 = time > 2
Y        = 0.38

;------------------------------------------[ステート変更]

[State 8023, ステート復帰]  ;着地
Type = SelfState
Trigger1 = Vel Y > 0 && Pos Y >= 0
Value    = 5100














;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; メタ展開
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2900]
type     = S
movetype = I
physics  = S
ctrl     = 0
anim     = 2900
sprpriority = 2

[State 2900, 無敵]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,At,AP
time     = 1

;----------------------------------------[内部処理]

[State -2];相手の向き判定～解除
type     = VarSet
trigger1 = !time
var(17)  = 0

[State -2];相手の向き判定～右向き
type       = VarSet
triggerall = !time
triggerall = enemynear,alive = 1
trigger1   = facing = 1
trigger1   = enemynear,facing = 1
var(17)     = 1

[State -2];相手の向き判定～左向き
type       = VarSet
triggerall = !time
triggerall = enemynear,alive = 1
trigger1   = facing = -1
trigger1   = enemynear,facing = -1
var(17)     = 2

[State 2900, 相手識別]
Type     = Varset
Trigger1 = !time
var(0)   = 0

[State 2900, 変数] ;VSベアトリーチェ
type     = VarSet
Trigger1 = !time
trigger1 = Enemynear,Name = "beatrice"
var(0)   = 1

[State 2900, 変数] ;VSロノウェ、ワルギリア、シエスタ、ルシファー
type       = VarSet
TriggerAll = !time
trigger1   = Enemynear,Name = "Ronove"
trigger2   = Enemynear,Name = "Lucifer"
trigger3   = Enemynear,Name = "Virgilia"
trigger4   = Enemynear,Name = "chiester410"
trigger5   = Enemynear,Name = "chiester 410"
trigger6   = Enemynear,Name = "chiester_410"
trigger7   = Enemynear,Name = "chiester-410"
trigger8   = Enemynear,Name = "chiester410_S"
var(0)     = 2

[State 2900, VS魔女]
Type     = Varset
TriggerAll = !time
trigger1 = Enemynear,Name = "beatrice"
trigger2 = Enemynear,Name = "Alice_Margatroid"
trigger3 = Enemynear,Name = "Alice Margatroid"
trigger4 = Enemynear,Name = "Alice"
trigger5 = Enemynear,Name = "Alice-R"
trigger6 = Enemynear,Name = "Fallen Alice"
trigger7 = Enemynear,Name = "AliceDolls"
trigger8 = Enemynear,Name = "Marisa Kirisame"
trigger9 = Enemynear,Name = "Marisa_Kirisame"
trigger10= Enemynear,Name = "Marisa_K"
trigger11= Enemynear,Name = "Marisa_S"
trigger12= Enemynear,Name = "MegaMari"
trigger13= Enemynear,Name = "Marisa_S"
trigger14= Enemynear,Name = "Patchouli"
trigger15= Enemynear,Name = "Patchouli_Knowledge"
trigger16= Enemynear,Name = "Patchouli Knowledge"
trigger17= Enemynear,Name = "C_Patchouli"
trigger18= Enemynear,Name = "metal_patchouli"
trigger19= Enemynear,Name = "Orochi Marisa"
trigger20= Enemynear,Name = "Patchouli - S"
trigger21= Enemynear,Name = "Hiziri_Byakuren"
trigger22= Enemynear,Name = "Hiziri"
var(0)   = 2


[State 2900, 変数] ;VS EVA叔母さん
type       = VarSet
TriggerAll = !time
trigger1   = Enemynear,Name = "Eva Beatrice"
trigger2   = Enemynear,Name = "Eva_Beatrice"
trigger3   = Enemynear,Name = "Eva-Beatrice"
trigger4   = Enemynear,Name = "EvaBeatrice"
var(0)     = 3

[State 192, VS縁寿]
Type     = Varset
TriggerAll = !time
trigger1 = Enemynear,Name = "ange"
trigger2 = Enemynear,Name = "ange_ushiromiya"
trigger3 = Enemynear,Name = "ange ushiromiya"
trigger4 = Enemynear,Name = "ushiromiya_ange"
trigger5 = Enemynear,Name = "ushiromiya ange"
var(0)   = 4

[State 2900, VSコスプレ]
Type     = Varset
TriggerAll = !time
trigger1 = Enemynear,Name = "TrapSatoko"
trigger2 = Enemynear,Name = "oyashirorika"
var(0)   = 5

;----------------------------------------[ゲージ処理]

[State 2900]
type     = Poweradd
trigger1 = animelem = 1
value    = -1000

[State 2900, メタ宣言判定]
type     = Varset
trigger1 = animelem = 8
var(19)  = 1

[State 2900];メタゲージ増減制御
type     = Varadd
trigger1 = time = 1
fvar(19) = 1

[State 2900];メタゲージ増減制御解除
type     = Varset
Trigger1 = AnimTime = 0
fvar(19) = 0

;----------------------------------------[演出]

[State 2900, 効果音];展開
type     = PlaySnd
trigger1 = animelem = 1
value    = s60, 0

[State 2900, 効果音];パリーン
type     = PlaySnd
trigger1 = animelem = 8
value    = s60, 1

[State 2900, ガラスエフェクト]
type     = Explod
trigger1 = animelem = 8
anim     = 12900
id       = 12900
postype  = back
pos      = 0, 0
bindtime = -1
sprpriority = -9
PauseMoveTime = 999999
SuperMoveTime = 999999
trans    = addalpha
alpha    = 245,100

[State 2900, ボイス];真理亞を愛しているのよ！ 他
type     = PlaySnd
Trigger1 = var(0) != [4, 5]
trigger1 = animelem = 1
value    = s3000, 0 + var(0)
channel  = 5

[State 2900, ボイス];さくたろうは死んでしまいました！
type     = PlaySnd
Trigger1 = var(0)  = 4
trigger1 = animelem = 1
value    = s2100, 8
channel  = 5

[State 2900, ボイス];コスプレとか
type     = PlaySnd
Trigger1 = var(0)  = 5
trigger1 = animelem = 1
value    = s190, 10
channel  = 5

;-----------------------------------------------------[暗転演出]

[State 2900]
type     = Pause
trigger1 = animelemtime(26) <= 2
time     = 2
movetime = 2
EndCmdBufTime = 1

[State 2900]
type     = Pause
trigger1 = AnimTime = 0
time     = 4
movetime = 4

[State a, エフェクト] ;スペル発動エフェクト
Type     = Helper
Trigger1 = AnimelemTime(8) = 0
OwnPal   = 1
PosType  = P1
Pos      = 5, -140
ID       = 8800
StateNo  = 8800
Name     = "Spell-time"
Persistent= 0
PauseMoveTime = 999999
SuperMoveTime = 999999

[State 1840, カットイン呼び出し]
type = Helper
triggerall = animelem = 1
trigger1 = facing = 1
trigger1 = var(17) = 0
trigger2 = var(17) = 2
helpertype = normal
name = "catin"
ID = 9860
pos = -340, 0
postype = left
facing = 1
stateno = 9860
keyctrl = 0
ownpal = 0
pausemovetime = 9999999
supermovetime = 9999999

[State 1840, カットイン呼び出し反対]
type = Helper
triggerall = animelem = 1
trigger1 = facing = -1
trigger1 = var(17) = 0
trigger2 = var(17) = 1
helpertype = normal
name = "catin"
ID = 9860
pos = 340, 0
postype = right
facing = -1
stateno = 9860
keyctrl = 0
ownpal = 0
pausemovetime = 9999999
supermovetime = 9999999


[State a, 背景用]
type     = VarSet
Trigger1 = !time
var(1)   = 0

[State a, 背景用]
type     = VarAdd
Trigger1 = Time = [1, 5]
var(1)   = 20

[State a];背景色
type      = BGPalFX
trigger1  = Time = [1, 42]
time      = 1
mul       = 255-var(1),255-var(1),255-var(1)
invertall = 0

;-----------------------------------------------------[メタ返し判定]

[State -2, meta];メタ返し判定
type       = Varset
triggerall = animelemtime(7) >= 8 && animelemtime(18) <= 2
triggerall = enemynear,power >= floor(enemynear,powermax/5)*2
trigger1   = enemynear,command = "a"
trigger2   = enemynear,command = "b"
trigger3   = enemynear,command = "c"
trigger4   = enemynear,command = "x"
trigger5   = enemynear,command = "y"
trigger6   = enemynear,command = "z"
trigger7   = enemynear,command = "recovery"
var(21)    = 1

[State 2900]
type       = ChangeState
triggerall = animelem = 17
trigger1   = var(21) = 1
value      = 2910

;-----------------------------------------------------[終了]

[State 2900]
type     = ChangeState
Trigger1 = AnimTime = 0
value    = 0
ctrl     = 1




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; メタ返し
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2910]
type     = S
movetype = I
physics  = S
ctrl     = 0
anim     = 2901
sprpriority = 2

[State 2910, 無敵]
type     = NotHitBy
trigger1 = var(21) = 0
trigger1 = animelemtime(1) <= 60
value    = SCA,AA,AP,AT
time     = 1

[State 2910,無敵時間]
type     = NotHitBy
trigger1 = var(21) = 1
value    = SCA,AA,AP,AT
time     = 1

;----------------------------------------[内部処理]

[State -2];相手の向き判定～解除
type     = VarSet
trigger1 = !time
var(17)  = 0

[State -2];相手の向き判定～右向き
type       = VarSet
triggerall = !time
triggerall = enemynear,alive = 1
trigger1   = facing = 1
trigger1   = enemynear,facing = 1
var(17)     = 1

[State -2];相手の向き判定～左向き
type       = VarSet
triggerall = !time
triggerall = enemynear,alive = 1
trigger1   = facing = -1
trigger1   = enemynear,facing = -1
var(17)     = 2

[State -2];相手がメタ返しに対応しているか判定解除
type     = Varset
trigger1 = time = 0
var(2)   = 0

[State -2];相手がメタ返しに対応しているか判定
type     = Varset
trigger1 = enemynear,numexplod(19864) = 1
var(2)   = 1

[State -2];メタ返し判定解除
type     = Varset
trigger1 = time = 0
var(21)  = 0

;----------------------------------------[ゲージ処理]

[State 2910];メタ世界展開
type     = Varset
trigger1 = animelemtime(1) = 43
var(19)  = 0

[State 2910];メタゲージ増減制御
type     = Varadd
trigger1 = time = 1
fvar(19) = 1

[State 2910];メタゲージ増減制御解除
type     = Varset
Trigger1 = AnimTime = 0
fvar(19) = 0

[State -2];メタゲージ再増加用
type     = Varset
trigger1 = !time
fvar(18) = fvar(17) - 90

[State -2];メタゲージ減少
type     = Varadd
trigger1 = fvar(17) > 0
trigger1 = animelemtime(1) <= 59
fvar(17) = -20

[State -2];メタゲージ減少(下限)
type     = Varset
trigger1 = fvar(17) < 0
fvar(17) = 0

;----------------------------------------[演出]

[State 2910]
type     = Pause
trigger1 = time = 0
time     = 1
movetime = 1

[State 2910]
type     = Pause
trigger1 = time >= 2
trigger1 = animelemtime(1) <= 60
time     = 2
movetime = 2

[State 2910, 効果音]
type     = PlaySnd
trigger1 = animelem = 1
value    = s60, 6

[State 2910, 効果音]
type     = PlaySnd
trigger1 = AnimelemTime(1) = 43
value    = s60, 1

[State 2910, ガラスエフェクト]
type     = Explod
trigger1 = AnimelemTime(1) = 43
anim     = 12900
id       = 12900
postype  = back
pos      = 0, 0
bindtime = -1
sprpriority = -9
PauseMoveTime = 999999
SuperMoveTime = 999999
trans    = addalpha
alpha    = 245,100

[State a, エフェクト] ;スペル発動エフェクト
Type     = Helper
Trigger1 = AnimelemTime(1) = 43
OwnPal   = 1
PosType  = P1
Pos      = 5, -140
ID       = 8800
StateNo  = 8800
Name     = "Spell-time"
Persistent= 0
PauseMoveTime = 999999
SuperMoveTime = 999999

[State a, 背景用]
type     = VarSet
Trigger1 = !time
var(1)   = 0

[State a, 背景用]
type     = VarAdd
Trigger1 = Time = [1, 5]
var(1)   = 20

[State a];背景色
type      = BGPalFX
trigger1  = Time = [1, 42]
time      = 1
mul       = 255-var(1),255-var(1),255-var(1)
invertall = 0

;-------------------------------------------[再展開へ]

[State 2910];メタ再展開判定
type       = Varset
triggerall = animelemtime(1) <= 60
triggerall = power >= 2000
trigger1   = command = "メタ世界"
var(21)    = 1

[State 2910, メタ返し(未対応)呼び出し]
type       = Helper
trigger1   = Animelemtime(2) = 2
trigger1   = var(2) = 0
helpertype = normal
name       = "meta mitaiou"
ID         = 2950
pos        = 0, 0
postype    = p2
stateno    = 2950
keyctrl    = 0
ownpal     = 0
pausemovetime = 999999
supermovetime = 999999

[State 2910]
type       = ChangeState
triggerall = animelem = 2
trigger1   = var(21) = 1
value      = 2920

;-------------------------------------------[終了へ]

[State 2910, 終了]
type     = ChangeState
Trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; メタ再展開
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2920]
type     = S
movetype = I
physics  = S
ctrl     = 0
anim     = 2901
sprpriority = 2

[State 2920, 無敵]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AP,AT
time     = 1

;----------------------------------------[内部処理]

[State -2];相手の向き判定～解除
type     = VarSet
trigger1 = !time
var(17)  = 0

[State -2];相手の向き判定～右向き
type       = VarSet
triggerall = !time
triggerall = enemynear,alive = 1
trigger1   = facing = 1
trigger1   = enemynear,facing = 1
var(17)     = 1

[State -2];相手の向き判定～左向き
type       = VarSet
triggerall = !time
triggerall = enemynear,alive = 1
trigger1   = facing = -1
trigger1   = enemynear,facing = -1
var(17)     = 2

;----------------------------------------[ゲージ処理]

[State 2920]
type     = Poweradd
trigger1 = animelem = 1
value    = -2000

[State 2920, メタ宣言判定]
type     = Varset
trigger1 = animelemTime(1) = 43
var(19)  = 1

[State 2920];メタゲージ一度空に
type     = Varset
trigger1 = time <= 29
fvar(27) = 0

[State 2920];メタゲージ増加
type     = Varadd
trigger1 = time >= 30
fvar(17) = 20

[State 2920];メタゲージ増加
type     = Varset
trigger1 = fvar(17) >= floor(fvar(18))
fvar(17) = floor(fvar(18))

[State 2920];メタゲージ増減制御
type     = Varadd
trigger1 = time = 1
fvar(19) = 1

[State 2920];メタゲージ増減制御解除
type     = Varset
Trigger1 = AnimTime = 0
fvar(19) = 0

;----------------------------------------[演出]

[State 2920, 効果音];展開
type     = PlaySnd
trigger1 = animelem = 1
value    = s60, 0

[State 2920, 効果音];パリーン
type     = PlaySnd
trigger1 = animelemTime(1) = 43
value    = s60, 1

[State 2910, ガラスエフェクト]
type     = Explod
trigger1 = AnimelemTime(1) = 43
anim     = 12900
id       = 12900
postype  = back
pos      = 0, 0
bindtime = -1
sprpriority = -9
PauseMoveTime = 999999
SuperMoveTime = 999999
trans    = addalpha
alpha    = 245,100

[State 2920, ボイス];うーうー言うのをやめなさい！
type     = PlaySnd
trigger1 = animelem = 1
value    = s3000, 5
channel  = 5

;-----------------------------------------------------[暗転演出]

[State 2920]
type     = Pause
Trigger1 = Time >= 2
trigger1 = animelemtime(6) <= 5
time     = 2
movetime = 2

[State 2920]
type     = Pause
trigger1 = AnimTime = 0
time     = 4
movetime = 4

[State a, エフェクト] ;スペル発動エフェクト
Type     = Helper
Trigger1 = AnimelemTime(1) = 43
OwnPal   = 1
PosType  = P1
Pos      = 5, -140
ID       = 8800
StateNo  = 8800
Name     = "Spell-time"
Persistent= 0
PauseMoveTime = 999999
SuperMoveTime = 999999

[State 2920, カットイン呼び出し]
type = Helper
triggerall = animelem = 1
trigger1 = facing = 1
trigger1 = var(17) = 0
trigger2 = var(17) = 2
helpertype = normal
name = "catin"
ID = 9860
pos = -340, 0
postype = left
facing = 1
stateno = 9860
keyctrl = 0
ownpal = 0
pausemovetime = 9999999
supermovetime = 9999999

[State 2920, カットイン呼び出し反対]
type = Helper
triggerall = animelem = 1
trigger1 = facing = -1
trigger1 = var(17) = 0
trigger2 = var(17) = 1
helpertype = normal
name = "catin"
ID = 9860
pos = 340, 0
postype = right
facing = -1
stateno = 9860
keyctrl = 0
ownpal = 0
pausemovetime = 9999999
supermovetime = 9999999

[State a, 背景用]
type     = VarSet
Trigger1 = !time
var(1)   = 0

[State a, 背景用]
type     = VarAdd
Trigger1 = Time = [1, 5]
var(1)   = 20

[State a];背景色
type      = BGPalFX
trigger1  = Time = [1, 42]
time      = 1
mul       = 255-var(1),255-var(1),255-var(1)
invertall = 0

[State 2920, メタ返し(未対応)呼び出し]
type       = Helper
trigger1   = Animtime = 0
trigger1   = var(2) = 0
helpertype = normal
name       = "meta mitaiou"
ID         = 2950
pos        = 0, 0
postype    = p2
stateno    = 2950
keyctrl    = 0
ownpal     = 0
pausemovetime = 999999
supermovetime = 999999

;-----------------------------------------------------[メタ再反論判定]

[State -2];メタ再反論判定(未対応)
type       = Varset
triggerall = var(2) = 0
triggerall = animelemtime(1) <= 60
;triggerall = enemynear,power >= floor(enemynear,powermax/5)*4
trigger1   = enemynear,command = "a"
trigger2   = enemynear,command = "b"
trigger3   = enemynear,command = "c"
trigger4   = enemynear,command = "x"
trigger5   = enemynear,command = "y"
trigger6   = enemynear,command = "z"
trigger7   = enemynear,command = "recovery"
var(21)  = 2

[State -2];メタ再反論判定(対応)
type       = Varset
triggerall = var(2) = 1
triggerall =  animelemtime(1) <= 60
triggerall = enemynear,power >= floor(enemynear,powermax/5)*2
trigger1   = enemynear,command = "a"
trigger2   = enemynear,command = "b"
trigger3   = enemynear,command = "c"
trigger4   = enemynear,command = "x"
trigger5   = enemynear,command = "y"
trigger6   = enemynear,command = "z"
trigger7   = enemynear,command = "recovery"
var(21)  = 2

[State 2920]
type = ChangeState
triggerall = animelem = 2
trigger1 = var(21) = 2
value = 2930

;-----------------------------------------------------[終了]

[State 2920]
type     = ChangeState
Trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; メタ再反論
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2930]
type     = S
movetype = I
physics  = S
ctrl     = 0
anim     = 2901
sprpriority = 2

[State 2930, 無敵]
type     = NotHitBy
trigger1 = var(21) = 0
trigger1 = animelemtime(1) <= 60
value    = SCA,AA,AP,AT
time     = 1

[State 2930,無敵時間]
type     = NotHitBy
trigger1 = var(21) = 1
value    = SCA,AA,AP,AT
time     = 1

;----------------------------------------[内部処理]

[State -2];相手の向き判定～解除
type     = VarSet
trigger1 = !time
var(17)  = 0

[State -2];相手の向き判定～右向き
type       = VarSet
triggerall = !time
triggerall = enemynear,alive = 1
trigger1   = facing = 1
trigger1   = enemynear,facing = 1
var(17)     = 1

[State -2];相手の向き判定～左向き
type       = VarSet
triggerall = !time
triggerall = enemynear,alive = 1
trigger1   = facing = -1
trigger1   = enemynear,facing = -1
var(17)     = 2

[State -2];相手がメタ返しに対応しているか判定解除
type     = Varset
trigger1 = time = 0
var(2)   = 0

[State -2];相手がメタ返しに対応しているか判定
type     = Varset
trigger1 = enemynear,numexplod(19864) = 1
var(2)   = 1

[State -2];メタ返し判定解除
type     = Varset
trigger1 = time = 0
var(21)  = 0

;----------------------------------------[ゲージ処理]

[State 2930];メタ世界展開
type     = Varset
trigger1 = animelemtime(1) = 43
var(19)  = 0

[State 2930];メタゲージ増減制御
type     = Varadd
trigger1 = time = 1
fvar(19) = 1

[State 2930];メタゲージ増減制御解除
type     = Varset
Trigger1 = AnimTime = 0
fvar(19) = 0

[State -2];メタゲージ再増加用
type     = Varset
trigger1 = !time
fvar(18) = fvar(17) - 90

[State -2];メタゲージ減少
type     = Varadd
trigger1 = fvar(17) > 0
trigger1 = animelemtime(1) <= 59
fvar(17) = -20

[State -2];メタゲージ減少(下限)
type     = Varset
trigger1 = fvar(17) < 0
fvar(17) = 0

;----------------------------------------[演出]

[State 2930]
type     = Pause
trigger1 = time = 0
time     = 1
movetime = 1

[State 2930]
type     = Pause
trigger1 = time >= 2
trigger1 = animelemtime(1) <= 60
time     = 2
movetime = 2

[State 2930, 効果音]
type     = PlaySnd
trigger1 = animelem = 1
value    = s60, 6

[State 2930, 効果音]
type     = PlaySnd
trigger1 = AnimelemTime(1) = 43
value    = s60, 1

[State 2910, ガラスエフェクト]
type     = Explod
trigger1 = AnimelemTime(1) = 43
anim     = 12900
id       = 12900
postype  = back
pos      = 0, 0
bindtime = -1
sprpriority = -9
PauseMoveTime = 999999
SuperMoveTime = 999999
trans    = addalpha
alpha    = 245,100

[State a, エフェクト] ;スペル発動エフェクト
Type     = Helper
Trigger1 = AnimelemTime(1) = 43
OwnPal   = 1
PosType  = P1
Pos      = 5, -140
ID       = 8800
StateNo  = 8800
Name     = "Spell-time"
Persistent= 0
PauseMoveTime = 999999
SuperMoveTime = 999999

[State a, 背景用]
type     = VarSet
Trigger1 = !time
var(1)   = 0

[State a, 背景用]
type     = VarAdd
Trigger1 = Time = [1, 5]
var(1)   = 20

[State a];背景色
type      = BGPalFX
trigger1  = Time = [1, 42]
time      = 1
mul       = 255-var(1),255-var(1),255-var(1)
invertall = 0

;-------------------------------------------[強制展開へ]

[State 2930];メタ再展開判定
type       = Varset
triggerall = animelemtime(1) <= 60
triggerall = power >= 2000
trigger1   = command = "メタ世界"
var(21)    = 1

[State 2930, メタ返し(未対応)呼び出し]
type       = Helper
trigger1   = Animelemtime(2) = 2
trigger1   = var(2) = 0
helpertype = normal
name       = "meta mitaiou"
ID         = 2950
pos        = 0, 0
postype    = p2
stateno    = 2950
keyctrl    = 0
ownpal     = 0
pausemovetime = 999999
supermovetime = 999999

[State 2930]
type       = ChangeState
triggerall = animelem = 2
trigger1   = var(21) = 1
value      = 2940

;-------------------------------------------[終了へ]

[State 2930, 終了]
type     = ChangeState
Trigger1 = AnimTime = 0
value    = 0
ctrl     = 1





;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; メタ強制展開
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2940]
type     = S
movetype = I
physics  = S
ctrl     = 0
anim     = 2901
sprpriority = 2

[State 2940, 無敵]
type     = NotHitBy
trigger1 = 1
value    = SCA,AA,AP,AT
time     = 1

[State 2940];メタゲージ反論判定
type     = Varset
Trigger1 = Time = 0
var(21)  = 0

;----------------------------------------[内部処理]

[State -2];相手の向き判定～解除
type     = VarSet
trigger1 = !time
var(17)  = 0

[State -2];相手の向き判定～右向き
type       = VarSet
triggerall = !time
triggerall = enemynear,alive = 1
trigger1   = facing = 1
trigger1   = enemynear,facing = 1
var(17)     = 1

[State -2];相手の向き判定～左向き
type       = VarSet
triggerall = !time
triggerall = enemynear,alive = 1
trigger1   = facing = -1
trigger1   = enemynear,facing = -1
var(17)     = 2

;----------------------------------------[ゲージ処理]

[State 2940]
type     = Poweradd
trigger1 = animelem = 1
value    = -2000

[State 2940, メタ宣言判定]
type     = Varset
trigger1 = animelemTime(1) = 43
var(19)  = 1

[State 2940];メタゲージ一度空に
type     = Varset
trigger1 = time <= 29
fvar(27) = 0

[State 2940];メタゲージ増加
type     = Varadd
trigger1 = time >= 30
fvar(17) = 20

[State 2940];メタゲージ増加
type     = Varset
trigger1 = fvar(17) >= floor(fvar(18))
fvar(17) = floor(fvar(18))

[State 2940];メタゲージ増減制御
type     = Varadd
trigger1 = time = 1
fvar(19) = 1

[State 2940];メタゲージ増減制御解除
type     = Varset
Trigger1 = AnimTime = 0
fvar(19) = 0

;----------------------------------------[演出]

[State 2940, 効果音];展開
type     = PlaySnd
trigger1 = animelem = 1
value    = s60, 0

[State 2940, 効果音];パリーン
type     = PlaySnd
trigger1 = animelemTime(1) = 43
value    = s60, 1

[State 2910, ガラスエフェクト]
type     = Explod
trigger1 = AnimelemTime(1) = 43
anim     = 12900
id       = 12900
postype  = back
pos      = 0, 0
bindtime = -1
sprpriority = -9
PauseMoveTime = 999999
SuperMoveTime = 999999
trans    = addalpha
alpha    = 245,100

[State 2940, ボイス];これがお父様の黄金郷よ！
type     = PlaySnd
trigger1 = animelem = 1
value    = s3000, 8
channel  = 5

;-----------------------------------------------------[暗転演出]

[State 2940]
type     = Pause
Trigger1 = Time >= 2
trigger1 = animelemtime(6) <= 5
time     = 2
movetime = 2

[State 2940]
type     = Pause
trigger1 = AnimTime = 0
time     = 4
movetime = 4

[State a, エフェクト] ;スペル発動エフェクト
Type     = Helper
Trigger1 = AnimelemTime(1) = 43
OwnPal   = 1
PosType  = P1
Pos      = 5, -140
ID       = 8800
StateNo  = 8800
Name     = "Spell-time"
Persistent= 0
PauseMoveTime = 999999
SuperMoveTime = 999999

[State 2940, カットイン呼び出し]
type = Helper
triggerall = animelem = 1
trigger1 = facing = 1
trigger1 = var(17) = 0
trigger2 = var(17) = 2
helpertype = normal
name = "catin"
ID = 9860
pos = -340, 0
postype = left
facing = 1
stateno = 9860
keyctrl = 0
ownpal = 0
pausemovetime = 9999999
supermovetime = 9999999

[State 2940, カットイン呼び出し反対]
type = Helper
triggerall = animelem = 1
trigger1 = facing = -1
trigger1 = var(17) = 0
trigger2 = var(17) = 1
helpertype = normal
name = "catin"
ID = 9860
pos = 340, 0
postype = right
facing = -1
stateno = 9860
keyctrl = 0
ownpal = 0
pausemovetime = 9999999
supermovetime = 9999999

[State a, 背景用]
type     = VarSet
Trigger1 = !time
var(1)   = 0

[State a, 背景用]
type     = VarAdd
Trigger1 = Time = [1, 5]
var(1)   = 20

[State a];背景色
type      = BGPalFX
trigger1  = Time = [1, 42]
time      = 1
mul       = 255-var(1),255-var(1),255-var(1)
invertall = 0

[State 2940, メタ返し(未対応)呼び出し]
type       = Helper
trigger1   = Animtime = 0
trigger1   = var(2) = 0
helpertype = normal
name       = "meta mitaiou"
ID         = 2970
pos        = 0, 0
postype    = p2
stateno    = 2970
keyctrl    = 0
ownpal     = 0
pausemovetime = 999999
supermovetime = 999999

;-----------------------------------------------------[終了]

[State 2940]
type     = ChangeState
Trigger1 = AnimTime = 0
value    = 0
ctrl     = 1




;=====================================================================
;[HELPER] メタ返し (未対応)
;=====================================================================

[Statedef 2950]
type     = A
movetype = A
physics  = S
anim     = 2902
ctrl     = 0

[State 2950]
type     = AssertSpecial
trigger1 = 1
flag     = unguardable
flag2    = noshadow
ignorehitpause=1

[State 2950];当て身投げ回避
type     = HitOverride
trigger1 = 1
attr     = SCA, AA,AP,AT
ignorehitpause = 1

[State 2950]
type     = PosSet
trigger1 = 1
X = enemynear,pos x
Y = enemynear,pos y

[State 2950, HitDef]
type                = HitDef
trigger1            = !time
attr                = C, HT
hitflag             = MAFD
guardflag           = 
damage              = 0, 0
ground.type         = Low
priority            = 3, Hit
pausetime           = 0, 0
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = -1
guardsound          = -1
air.velocity        = -enemynear,vel x,enemynear,vel y
yaccel              = 0.48
fall                = 0
air.fall            = 0
fall.recovertime    = 9999
getpower            = 0, 0
givepower           = 0, 0
p2stateno           = 2960
Ground.CornerPush.VelOff   = 0
Guard.CornerPush.VelOff    = 0

[State 2950, 消える]
type     = DestroySelf
trigger1 = movecontact


;=====================================================================
;[相手制御] メタ返し (未対応)
;=====================================================================

[Statedef 2960]
type     = U
movetype = U
physics  = U

[State 2960]
type       = PowerAdd
trigger1   = time = 0
value      = -1*(floor(PowerMax)/5)*2

[State 2960]
type     = SelfState
trigger1 = time = 0
value    = Prevstateno



;=====================================================================
;[HELPER] メタ再反論 (未対応)
;=====================================================================

[Statedef 2970]
type     = A
movetype = A
physics  = S
anim     = 2902
ctrl     = 0

[State 2970]
type     = AssertSpecial
trigger1 = 1
flag     = unguardable
flag2    = noshadow
ignorehitpause=1

[State 2970];当て身投げ回避
type     = HitOverride
trigger1 = 1
attr     = SCA, AA,AP,AT
ignorehitpause = 1

[State 2970]
type     = PosSet
trigger1 = 1
X = enemynear,pos x
Y = enemynear,pos y

[State 2970, HitDef]
type                = HitDef
trigger1            = !time
attr                = C, HT
hitflag             = MAFD
guardflag           = 
damage              = 0, 0
ground.type         = Low
priority            = 3, Hit
pausetime           = 0, 0
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = -1
guardsound          = -1
air.velocity        = -enemynear,vel x,enemynear,vel y
yaccel              = 0.48
fall                = 0
air.fall            = 0
fall.recovertime    = 9999
getpower            = 0, 0
givepower           = 0, 0
p2stateno           = 2980
Ground.CornerPush.VelOff   = 0
Guard.CornerPush.VelOff    = 0

[State 2970, 消える]
type     = DestroySelf
trigger1 = movecontact


;=====================================================================
;[相手制御] メタ再反論 (未対応)
;=====================================================================

[Statedef 2980]
type     = U
movetype = U
physics  = U

[State 2980]
type       = PowerAdd
triggerall = time = 0
trigger1   = powermax < 5000
value      = -1*floor((PowerMax/5))*4

[State 2980]
type     = SelfState
trigger1 = time = 0
value    = Prevstateno

