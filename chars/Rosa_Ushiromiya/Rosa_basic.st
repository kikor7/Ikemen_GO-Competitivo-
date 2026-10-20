;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
; 通常攻撃 管理ステート
;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 立ち / 近距離Ａ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 200]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 200
sprpriority = 2

;-------------------------------------------------[演出]

[State 200, 効果音]
type     = PlaySnd
trigger1 = AnimElem = 2
value    = s2, 0

[State 200, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 2
Trigger1 = Random < 400
value    = s200, 0
channel  = 5

;-------------------------------------------------[ヒット定義]

[State 200, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = S, NA
hitflag             = MAF
guardflag           = M
damage              = Floor(25*Fvar(5)*(1.0+var(7)*0.33)),0
animtype            = Light
ground.type         = High
priority            = 3, Hit
pausetime           = 9, 10
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 0
guardsound          = s1, 0
ground.slidetime    = 8
ground.hittime      = 8 + (5*var(7))
air.hittime         = 8 + (5*var(7))
guard.slidetime     = 6
guard.hittime       = 6
ground.velocity     = -4
guard.velocity      = -4
air.velocity        = -3, -4
airguard.velocity   = -3, -4
yaccel              = 0.48
air.fall            = 0
fall.recover        = 0 + ifelse(var(19)=1,0,1)
fall.recovertime    = 10
getpower = 30,15
givepower           = Floor(20*Fvar(5)), 0
Ground.CornerPush.VelOff   = -6
Guard.CornerPush.VelOff    = -6

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7000
ID       = 7000
Pos      = 45, -95
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded = 1
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 45, -95
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 200, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.93

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
Pos      = 10,-50
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State a]  ;キャンセルジャンプ
Type       = ChangeState
Value      = 40
TriggerAll = !Var(59);		AI不可
Trigger1   = Command  = "holdup"
trigger1   = movecontact
trigger1   = HitPauseTime >= 1

[State 200, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 立ち / 遠距離Ａ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 210]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 210
sprpriority = 2

;-------------------------------------------------[演出]

[State 210, 移動]
type     = Velmul
trigger1 = !time
X = 0.25

[State 210, 移動]
type     = Velset
trigger1 = Animelemtime(4) = 0
X = 4

[State 210, 効果音]
type     = PlaySnd
trigger1 = AnimElem = 3
value    = s2, 1

[State 210, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 3
Trigger1 = Random < 400
value    = s200, 1
channel  = 5

;-------------------------------------------------[ヒット定義]

[State 210, HitDef]
type                = HitDef
trigger1            = AnimElem = 5
attr                = S, NA
hitflag             = MAF
guardflag           = L
damage              = Floor(27*Fvar(5)*(1.0+var(7)*0.33)),0
animtype            = Midium
ground.type         = High
priority            = 3, Hit
pausetime           = 9, 8
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 0
guardsound          = s1, 0
ground.slidetime    = 8
ground.hittime      = 8 + (5*var(7))
air.hittime         = 8 + (5*var(7))
guard.slidetime     = 6
guard.hittime       = 6
ground.velocity     = -7
guard.velocity      = -7
air.velocity        = -3, -2
airguard.velocity   = -3, -2
yaccel              = 0.48
air.fall            = 0
fall.recover        = 0 + ifelse(var(19)=1,0,1)
fall.recovertime    = 10
getpower = 30,15
givepower           = Floor(25*Fvar(5)), 0
Ground.CornerPush.VelOff   = -8
Guard.CornerPush.VelOff    = -8

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7000
ID       = 7000
Pos      = 75, -60
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded = 1
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 75, -60
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 210, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.93

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
Pos      = 10,-50
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State a]  ;キャンセルジャンプ
Type       = ChangeState
Value      = 40
TriggerAll = !Var(59);		AI不可
Trigger1   = Command  = "holdup"
trigger1   = movecontact
;trigger1   = HitPauseTime >= 1

[State 210, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 立ち / 近距離Ｂ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 220]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 220
sprpriority = 2

;-------------------------------------------------[演出]

[State 220, 移動]
type     = PosAdd
trigger1 = Animelemtime(5) = 0
X = 20

[State 220, 効果音]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = s2, 1

[State 220, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 3
Trigger1 = Random < 400
value    = s200, 10
channel  = 5

;-------------------------------------------------[ヒット定義]

[State 220, HitDef]
type                = HitDef
trigger1            = AnimElem = 6
attr                = S, NA
hitflag             = MAF
guardflag           = M
damage              = Floor(55*Fvar(5)*(1.0+var(7)*0.33)),0
animtype            = Midium
ground.type         = High
priority            = 3, Hit
pausetime           = 11, 12
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 1
guardsound          = s1, 1
ground.slidetime    = 11
ground.hittime      = 14 + (5*var(7))
air.hittime         = 14 + (5*var(7))
guard.slidetime     = 12
guard.hittime       = 12
ground.velocity     = -7
guard.velocity      = -7
air.velocity        = -3, -4.5
airguard.velocity   = -3, -4.5
yaccel              = 0.48
air.fall            = 0
fall.recover        = 0 + ifelse(var(19)=1,0,1)
fall.recovertime    = 15
getpower = 30,15
givepower           = Floor(25*Fvar(5)), 0
Ground.CornerPush.VelOff   = -8
Guard.CornerPush.VelOff    = -8

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 45, -75
PosType  = P1
OwnPal   = 1
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
Pos      = 45, -74
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 220, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.87

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
Pos      = 10,-50
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State a]  ;キャンセルジャンプ
Type       = ChangeState
Value      = 40
TriggerAll = !Var(59);		AI不可
Trigger1   = Command  = "holdup"
trigger1   = movecontact
;trigger1   = HitPauseTime >= 1

[State 220, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 立ち / 遠距離Ｂ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 230]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 230
sprpriority = 2

;-------------------------------------------------[演出]

[State 230, 効果音]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = s2, 1

[State 230, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 4
Trigger1 = Random < 500
value    = s200, 3
channel  = 5

;-------------------------------------------------[ヒット定義]

[State 230, HitDef]
type                = HitDef
trigger1            = AnimElem = 5
attr                = S, NA
hitflag             = MAF
guardflag           = M
damage              = Floor(50*Fvar(5)*(1.0+var(7)*0.33)),0
animtype            = Midium
ground.type         = High
priority            = 3, Hit
pausetime           = 11, 12
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 1
guardsound          = s1, 1
ground.slidetime    = 11
ground.hittime      = 14 + (5*var(7))
air.hittime         = 14 + (5*var(7))
guard.slidetime     = 12
guard.hittime       = 12
ground.velocity     = -7
guard.velocity      = -7
air.velocity        = -3, -4.5
airguard.velocity   = -3, -4.5
yaccel              = 0.48
air.fall            = 0
fall.recover        = 0 + ifelse(var(19)=1,0,1)
fall.recovertime    = 15
getpower = 30,15
givepower           = Floor(40*Fvar(5)), 0
Ground.CornerPush.VelOff   = -8
Guard.CornerPush.VelOff    = -8

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 85, -65
PosType  = P1
OwnPal   = 1
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
Pos      = 85, -65
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 230, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.80

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
Pos      = 10,-50
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State 230, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 立ち / 近距離Ｃ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 240]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 240
sprpriority = 2

;-------------------------------------------------[演出]

[State 240, 移動]
type     = VelAdd
trigger1 = Animelemtime(3) = 0
X = 2

[State 240, 効果音]
type     = PlaySnd
trigger1 = AnimElem = 3
value    = s2, 2

[State 240, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 3
Trigger1 = Random < 500
value    = s200, 11
channel  = 5

;-------------------------------------------------[ヒット定義]

[State 240, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = S, NA
hitflag             = MAF
guardflag           = M
damage              = Floor(80*Fvar(5)*(1.0+var(7)*0.33)),0
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 13, 14
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 2
ground.slidetime    = 14
ground.hittime      = 23 + (5*var(7))
air.hittime         = 23 + (5*var(7))
guard.slidetime     = 21
guard.hittime       = 21
ground.velocity     = -9
guard.velocity      = -11
air.velocity        = -3, -5
airguard.velocity   = -3, -5
yaccel              = 0.48
air.fall            = 0
fall.recover        = 0 + ifelse(var(19)=1,0,1)
fall.recovertime    = 15
getpower = 30,15
givepower           = Floor(80*Fvar(5)), 0
Ground.CornerPush.VelOff   = -8
Guard.CornerPush.VelOff    = -8

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 85, -75
PosType  = P1
OwnPal   = 1
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
Pos      = 85, -75
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 240, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.87

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
Pos      = 10,-50
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State 240, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 立ち / 遠距離Ｃ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 250]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 250
sprpriority = 2

;-------------------------------------------------[演出]

[State 250, 移動]
type     = VelSet
trigger1 = Animelemtime(3) = 0
X = 5

[State 250, 移動]
type     = Velset
trigger1 = Animelemtime(10) = 0
X = 5

[State 250, 効果音]
type     = PlaySnd
trigger1 = AnimElem = 3
value    = s2, 2

[State 250, 効果音]
type     = PlaySnd
trigger1 = AnimElem = 9
value    = s2, 2

[State 250, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 3
Trigger1 = Random < 500
value    = s200, 9
channel  = 5

;-------------------------------------------------[ヒット定義]

[State 250, HitDef]
type                = HitDef
trigger1            = AnimElemTime(4) >= 0
trigger1            = AnimElemTime(5) <  0
attr                = S, NA
hitflag             = MAF
guardflag           = M
damage              = Floor(45*Fvar(5)*(1.0+var(7)*0.33)),0
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 9, 10
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 2
ground.slidetime    = 11
ground.hittime      = 16
air.hittime         = 16
guard.slidetime     = 11
guard.hittime       = 11
ground.velocity     = -5
guard.velocity      = -5
air.velocity        = -2.4, -5.5
airguard.velocity   = -2.4, -5.5
yaccel              = 0.48
air.fall            = 0
fall.recover        = 0 + ifelse(var(19)=1,0,1)
fall.recovertime    = 15
Persistent          = 0
getpower = 15,7
givepower           = Floor(45*Fvar(5)), 0
Ground.CornerPush.VelOff   = -5
Guard.CornerPush.VelOff    = -5

[State 250, HitDef]
type                = HitDef
trigger1            = AnimElemTime(10) >= 0
trigger1            = AnimElemTime(11) <  0
attr                = S, NA
hitflag             = MAF
guardflag           = M
damage              = Floor(55*Fvar(5)*(1.0+var(7)*0.33)),0
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 13, 14
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 2
ground.slidetime    = 14
ground.hittime      = 23 + (5*var(7))
air.hittime         = 23 + (5*var(7))
guard.slidetime     = 21
guard.hittime       = 21
ground.velocity     = -9
guard.velocity      = -9
air.velocity        = -3, -3
airguard.velocity   = -3, -3
yaccel              = 0.48
fall.recover        = 0 + ifelse(var(19)=1,0,1)
fall.recovertime    = 15
Persistent          = 0
getpower = 15,7
givepower           = Floor(55*Fvar(5)), 0
Ground.CornerPush.VelOff   = -8
Guard.CornerPush.VelOff    = -8

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
trigger1 = AnimElemTime(5) <  1
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 90, -80
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a];ヒットスパーク
Type     = Helper
trigger1 = AnimElemTime(10) >=  0
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 90, -80
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
trigger1 = AnimElemTime(5) <  1
Trigger1 = Moveguarded = 1
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 90, -80
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
trigger1 = AnimElemTime(10) >=  0
Trigger1 = Moveguarded = 1
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 90, -80
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 250, 変数]  ;Rate補正
Type           = VarSet
trigger1       = AnimElemTime(5) <  0
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.92

[State 250, 変数]  ;Rate補正
Type           = VarSet
trigger1       = AnimElemTime(10) >=  0
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.92

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
Pos      = 10,-50
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State a];エフェクト制御
Type     = MoveHitreset
Trigger1 = Animelemtime(9) = 0

[State 250, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 立ち / ６Ｂ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 260]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 260
sprpriority = 2

;-------------------------------------------------[演出]

[State 260, 速度]
type     = Velset
Trigger1 = Animelem = 5
X = 3

[State 260, 速度]
type     = Velset
Trigger1 = Animelem = 8
X = 0

[State 260, 効果音]
type     = PlaySnd
trigger1 = AnimElem = 5
value    = s2, 1

[State 260, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 5
Trigger1 = Random < 700
value    = s200, 2
channel  = 5

;-------------------------------------------------[ヒット定義]

;空中ヒット後、一回だけ6Bで追撃可能

[State 260, HitDef]
type                = HitDef
Trigger1            = Var(8) < 2
trigger1            = AnimElem = 6
attr                = S, NA
hitflag             = MAF
guardflag           = M
damage              = Floor(70*Fvar(5)*(1.0+var(7)*0.33)),0
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 11, 12
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 2
ground.slidetime    = 11
ground.hittime      = 14 + (5*var(7))
air.hittime         = 14 + (5*var(7))
guard.slidetime     = 12
guard.hittime       = 12
ground.velocity     = -6
guard.velocity      = -6
air.velocity        = -0.5, -13
airguard.velocity   = -3, -4
yaccel              = 0.48
air.fall            = 1
fall.recover        = 0
fall.recovertime    = 9999
getpower = 30,15
givepower           = Floor(70*Fvar(5)), 0
Ground.CornerPush.VelOff   = -8
Guard.CornerPush.VelOff    = -8

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7005
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
Trigger1 = MoveGuarded = 1
Name     = "Guard"
Stateno  = 7105
ID       = 7100
Pos      = 0, -55
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 260, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.87

[State 260, 変数]  ;RIft attack補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = 0.8

[State 260, 変数]  ;グレイブシュート判定
Type           = VarAdd
Trigger1       = P2Statetype = A
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
var(8)         = 1

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
Pos      = 10,-50
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State 260, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 立ち / ６Ｃ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 270]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 280
sprpriority = 2

;-------------------------------------------------[演出]

[State 270, 効果音]
type     = PlaySnd
trigger1 = AnimElem = 5
value    = s2, 2

[State 270, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 3
value    = s200, 5
channel  = 5

;-------------------------------------------------[ヒット定義]

[State 270, HitDef]
type                = HitDef
TriggerAll          = var(11) < 6   ;ダウン追い打ち回数
trigger1            = AnimElem = 6
attr                = S, NA
hitflag             = MFD
guardflag           = H
damage              = Floor(65*Fvar(5)*(1.0+var(7)*0.33)),0
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 11, 12
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 2
ground.slidetime    = 14
ground.hittime      = 23 + (5*var(7))
air.hittime         = 23 + (5*var(7))
guard.slidetime     = 21
guard.hittime       = 21
ground.velocity     = -9
guard.velocity      = -9
air.velocity        = -3, -3
airguard.velocity   = -3, -3
yaccel              = 0.48
air.fall            = 0
fall.recover        = 0 + ifelse(var(19)=1,0,1)
fall.recovertime    = 15
getpower = 30,15
givepower           = Floor(65*Fvar(5)), 0
Ground.CornerPush.VelOff   = -8
Guard.CornerPush.VelOff    = -8
Id = 270

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 65, -45
PosType  = P1
OwnPal   = 1
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
Pos      = 65, -45
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 270, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.80

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
Pos      = 10,-50
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[ダウン追い打ち]

[State a];ダウン攻撃
type     = TargetState
trigger1 = Numtarget(270) >= 1
Trigger1 = (MoveHit) && (var(10) = 1)
trigger1 = Target,Stateno != [8030,8031]
value    = 8030
ignorehitpause=1

;-------------------------------------------------[終了]

[State 270, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1










;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / しゃがみＡ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 400]
type     = C
movetype = A
physics  = C
ctrl     = 0
anim     = 400
sprpriority = 2

;-------------------------------------------------[演出]

[State 400, 効果音]
type     = PlaySnd
trigger1 = AnimElem = 2
value    = s2, 0

[State 400, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 2
Trigger1 = Random < 400
value    = s200, 19
channel  = 5

;-------------------------------------------------[ヒット定義]

[State 400, HitDef]
type                = HitDef
TriggerAll          = var(11) < 6   ;ダウン追い打ち回数
trigger1            = AnimElem = 3
attr                = C, NA
hitflag             = MAFD
guardflag           = L
damage              = Floor(25*Fvar(5)*(1.0+var(7)*0.33)),0
animtype            = Light
ground.type         = low
priority            = 3, Hit
pausetime           = 8, 7
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 0
guardsound          = s1, 0
ground.slidetime    = 8
ground.hittime      = 8 + (5*var(7))
air.hittime         = 8 + (5*var(7))
guard.slidetime     = 6
guard.hittime       = 6
ground.velocity     = -5.5
guard.velocity      = -5.5
air.velocity        = -3, -4
airguard.velocity   = -3, -4
fall.yvelocity      = -4.5
yaccel              = 0.48
air.fall            = 0
fall.recover        = 0 + ifelse(var(19)=1,0,1)
fall.recovertime    = 10
fall.recovertime    = Ceil(25*(1+(0.5*var(7))))
getpower = 30,15
givepower           = Floor(25*Fvar(5)), 0
Ground.CornerPush.VelOff   = -7
Guard.CornerPush.VelOff    = -7
down.cornerpush.veloff     = -10
ID = 400

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7000
ID       = 7000
Pos      = 55, -10
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded = 1
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 55, -10
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 400, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.92 * (1-(var(10)*0.3))

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
Pos      = 10,-50
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[ダウン追い打ち]

[State a];ダウン攻撃
type     = TargetState
trigger1 = Numtarget(400) >= 1
Trigger1 = (MoveHit) && (var(10) = 1)
trigger1 = Target,Stateno != [8030,8031]
value    = 8030
ignorehitpause=1

;-------------------------------------------------[終了]

[State 400, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / しゃがみＢ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 410]
type     = C
movetype = A
physics  = C
ctrl     = 0
anim     = 410
sprpriority = 2

;-------------------------------------------------[演出]

[State 410, 効果音]
type     = PlaySnd
trigger1 = AnimElem = 2
value    = s2, 1

[State 410, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 2
Trigger1 = Random < 400
value    = s200, 13
channel  = 5

;-------------------------------------------------[ヒット定義]

[State 410, HitDef]
type                = HitDef
TriggerAll          = var(11) < 6   ;ダウン追い打ち回数
trigger1            = AnimElem = 3
attr                = C, NA
hitflag             = MAFD
guardflag           = L
damage              = Floor(50*Fvar(5)*(1.0+var(7)*0.33)),0
animtype            = Midium
ground.type         = Low
priority            = 3, Hit
pausetime           = 12, 11
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 1
guardsound          = s1, 1
ground.slidetime    = 11
ground.hittime      = 14 + (5*var(7))
air.hittime         = 14 + (5*var(7))
guard.slidetime     = 12
guard.hittime       = 12
ground.velocity     = -6
guard.velocity      = -6
air.velocity        = -3, -4
airguard.velocity   = -3, -4
fall.yvelocity      = -4.5
yaccel              = 0.48
air.fall            = 0
fall.recover        = 0 + ifelse(var(19)=1,0,1)
fall.recovertime    = 15
getpower = 30,15
givepower           = Floor(35*Fvar(5)), 0
Ground.CornerPush.VelOff   = -8
Guard.CornerPush.VelOff    = -8
down.cornerpush.veloff = -10
Id =410

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 75, -10
PosType  = P1
OwnPal   = 1
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
Pos      = 75, -10
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 410, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.90* (1-(var(10)*0.3))

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
Pos      = 10,-50
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[ダウン追い打ち]

[State a];ダウン攻撃
type     = TargetState
trigger1 = Numtarget(410) >= 1
Trigger1 = (MoveHit) && (var(10) = 1)
trigger1 = Target,Stateno != [8030,8031]
value    = 8030
ignorehitpause=1

;-------------------------------------------------[終了]

[State 410, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / しゃがみＣ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 420]
type     = C
movetype = A
physics  = C
ctrl     = 0
anim     = 420
sprpriority = 2

;-------------------------------------------------[演出]

[State 420, 効果音]
type     = PlaySnd
trigger1 = AnimElem = 3
value    = s2, 2

[State 420, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 3
Trigger1 = Random < 500
value    = s200, 8
channel  = 5

;-------------------------------------------------[ヒット定義]

[State 420, HitDef]
type                = HitDef
TriggerAll          = var(11) < 6   ;ダウン追い打ち回数
trigger1            = AnimElem = 4
attr                = C, NA
hitflag             = MAFD
guardflag           = L
damage              = Floor(90*Fvar(5)*(1.0+var(7)*0.33)),0
animtype            = Hard
ground.type         = Low
priority            = 3, Hit
pausetime           = 14, 13
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 2
ground.slidetime    = 14
ground.hittime      = 23 + (5*var(7))
air.hittime         = 23 + (5*var(7))
guard.slidetime     = 21
guard.hittime       = 21
ground.velocity     = -8
guard.velocity      = -8
air.velocity        = -3, -5
airguard.velocity   = -3, -5
fall.yvelocity      = -4.5
yaccel              = 0.48
air.fall            = 0
fall.recover        = 0 + ifelse(var(19)=1,0,1)
fall.recovertime    = 15
getpower = 30,15
givepower           = Floor(90*Fvar(5)), 0
Ground.CornerPush.VelOff   = -8
Guard.CornerPush.VelOff    = -8
down.cornerpush.veloff = -10
Id =420

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 60, -35
PosType  = P1
OwnPal   = 1
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
Pos      = 60, -35
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 420, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.80* (1-(var(10)*0.3))

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
Pos      = 10,-50
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[ダウン追い打ち]

[State a];ダウン攻撃
type     = TargetState
trigger1 = Numtarget(420) >= 1
Trigger1 = (MoveHit) && (var(10) = 1)
trigger1 = Target,Stateno != [8030,8031]
value    = 8030
ignorehitpause=1

;-------------------------------------------------[終了]

[State 420, ステート変更]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / しゃがみ / ３Ｃ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 430]
type     = C
movetype = A
physics  = C
ctrl     = 0
anim     = 270
sprpriority = 2

;-------------------------------------------------[演出]

[State 430, 効果音]
type     = PlaySnd
trigger1 = AnimElem = 3
value    = s2, 2

[State 430, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 2
Trigger1 = Random < 800
value    = s200, 14
channel  = 5

[State 430, 属性変更]
type      = StateTypeSet
Trigger1  = Animelem = 4
Statetype = A
physics   = N

[State 430, 速度]
type     = Velset
Trigger1 = Animelem = 4
X = 5
Y = -3

[State 430, 速度]
Type     = VelAdd
Trigger1 = Statetype =A
Y =  0.45

;-------------------------------------------------[ヒット定義]

[State 430, HitDef]
type                = HitDef
trigger1            = AnimElem = 5
attr                = A, NA
hitflag             = MAF
guardflag           = M
damage              = Floor(70*Fvar(5)*(1.0+var(7)*0.33)),0
getpower = 30,15
animtype            = Hard
ground.type         = Low
priority            = 3, Hit
pausetime           = 13, 14
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 2
ground.slidetime    = 14
ground.hittime      = 23 + (5*var(7))
air.hittime         = 23 + (5*var(7))
guard.slidetime     = 21
guard.hittime       = 21
ground.velocity     = -2, -8
guard.velocity      = -7
air.velocity        = -3, -5
airguard.velocity   = -3, -5
down.velocity       = -3, 0
yaccel              = IfElse(Var(10)=0,0.48,0.8)
fall                = 1
air.fall            = 0
fall.recover        = 0; + ifelse(var(19)=1,0,1)
fall.recovertime    = 15
givepower           = Floor(70*Fvar(5)), 0
Ground.CornerPush.VelOff   = 0
Guard.CornerPush.VelOff    = 0

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 85, -55
PosType  = P1
OwnPal   = 1
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
Pos      = 80, -55
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 430, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.88 * (1-(var(10)*0.3))

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
Pos      = 10,-50
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State 430, ステート変更]
type     = ChangeState
;trigger1 = Vel y > 0 && Pos Y >= 0
Trigger1 = Animtime = 0
value    = 431
ctrl     = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; しゃがみ３Ｃ / 終了
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 431]
type     = C
movetype = I
physics  = C
ctrl     = 0
anim     = 271
sprpriority = 2

[State 431, 速度]
type     = Velset
Trigger1 = !time
Y = 0

[State 431, 座標]
type     = Posset
Trigger1 = !time
Y = 0

[State 431, ステート変更]
type     = ChangeState
Trigger1 = Animtime = 0
value    = 11
Ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 /  ＮＪＡ
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
trigger1 = AnimElem = 3
value    = s2, 0

[State 600, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 3
Trigger1 = Random < 500
value    = s200, 15
channel  = 5

;-------------------------------------------------[ヒット定義]

[State 600, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = A, NA
hitflag             = MAF
guardflag           = HA
damage              = Floor(30*Fvar(5)*(1.0+var(7)*0.33)),0
animtype            = light
ground.type         = High
priority            = 3, Hit
pausetime           = 12, 11
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 0
guardsound          = s1, 0
ground.slidetime    = 8
ground.hittime      = 8 + (5*var(7))
air.hittime         = 8 + 10 + (5*var(7))
guard.slidetime     = 6
guard.hittime       = 6
ground.velocity     = -6
guard.velocity      = -8
air.velocity        = -3, -4.3
airguard.velocity   = -3, -4.3
yaccel              = 0.48
air.fall            = 0
fall.recover        = 0 + ifelse(var(19)=1,0,1)
fall.recovertime    = 15
getpower = 30,15
givepower           = Floor(25*Fvar(5)), 0
Ground.CornerPush.VelOff   = -4
Guard.CornerPush.VelOff    = -4

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7000
ID       = 7000
Pos      = 45, -75
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded = 1
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 45, -75
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 600, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.95

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
Pos      = 10,-50
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State 600, 行動可能]
type     = CtrlSet
trigger1 = Animelem = 12
value    = 1

[State 600, 着地終了]
Type     = ChangeState
Trigger1 = (Vel Y > 0) && (pos y >= 0)
Value    = 52
Ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 /  ＮＪＢ
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
trigger1 = AnimElem = 3
value    = s2, 1

[State 610, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 3
Trigger1 = Random < 500
value    = s200, 16
channel  = 5

;-------------------------------------------------[ヒット定義]

[State 610, HitDef]
type                = HitDef
trigger1            = AnimElem = 4
attr                = A, NA
hitflag             = MAF
guardflag           = HA
damage              = Floor(45*Fvar(5)*(1.0+var(7)*0.33)),0
animtype            = Midium
ground.type         = High
priority            = 3, Hit
pausetime           = 11, 12
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 1
guardsound          = s1, 1
ground.slidetime    = 11
ground.hittime      = 14 + (5*var(7))
air.hittime         = 14 + (5*var(7))
guard.slidetime     = 12
guard.hittime       = 12
ground.velocity     = -7
guard.velocity      = -7
air.velocity        = -2, -4.3
airguard.velocity   = -2, -4.3
yaccel              = 0.48
air.fall            = 0
fall.recover        = 0 + ifelse(var(19)=1,0,1)
fall.recovertime    = 30
getpower = 30,15
givepower           = Floor(45*Fvar(5)), 0
Ground.CornerPush.VelOff   = -5
Guard.CornerPush.VelOff    = -5

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 0, -60
PosType  = P2
OwnPal   = 1
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
Pos      = 0, -60
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 610, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.90

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
Pos      = 10,-50
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State 610, 行動可能]
type     = CtrlSet
trigger1 = Animelem = 7
value    = 1

[State 610, 着地終了]
Type     = ChangeState
Trigger1 = (Vel Y > 0) && (pos y >= 0)
Value    = 52
Ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 /  ＮＪＣ
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
trigger1 = AnimElem = 4
value    = s2, 2

[State 620, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 4
Trigger1 = Random < 700
value    = s200, 18
channel  = 5

;-------------------------------------------------[ヒット定義]

[State 620, HitDef]
type                = HitDef
trigger1            = AnimElem = 5
attr                = A, NA
hitflag             = MAF
guardflag           = HA
damage              = Floor(70*Fvar(5)*(1.0+var(7)*0.33)),0
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 13, 14
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 2
ground.slidetime    = 14
ground.hittime      = 23 + (5*var(7))
air.hittime         = 23 + (5*var(7))
guard.slidetime     = 21
guard.hittime       = 21
ground.velocity     = -8
guard.velocity      = -8
air.velocity        = -2, -5
airguard.velocity   = -2, -5
yaccel              = 0.48
air.fall            = 0
fall.recover        = 0 + ifelse(var(19)=1,0,1)
fall.recovertime    = 45
getpower = 30,15
givepower           = Floor(70*Fvar(5)), 0
Ground.CornerPush.VelOff   = -6
Guard.CornerPush.VelOff    = -6

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 0, -60
PosType  = P2
OwnPal   = 1
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
Pos      = 0, -60
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 620, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.80

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
Pos      = 10,-50
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State 620, 行動可能]
type     = CtrlSet
trigger1 = Animelem = 9
value    = 1

[State 620, 着地終了]
Type     = ChangeState
Trigger1 = (Vel Y > 0) && (pos y >= 0)
Value    = 52
Ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 /  ＪＡ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 630]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 630
sprpriority = 2

;-------------------------------------------------[演出]

[State 630, 効果音]
type     = PlaySnd
trigger1 = AnimElem = 2
value    = s2, 0

[State 630, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 2
Trigger1 = Random < 500
value    = s200, 12
channel  = 5

;-------------------------------------------------[ヒット定義]

[State 600, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = A, NA
hitflag             = MAF
guardflag           = HA
damage              = Floor(35*Fvar(5)*(1.0+var(7)*0.33)),0
animtype            = light
ground.type         = High
priority            = 3, Hit
pausetime           = 12, 11
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 0
guardsound          = s1, 0
ground.slidetime    = 8
ground.hittime      = 8 + (5*var(7))
air.hittime         = 8 + (5*var(7))
guard.slidetime     = 6
guard.hittime       = 6
ground.velocity     = -6
guard.velocity      = -6
air.velocity        = -2.5, -3.5
airguard.velocity   = -2.5, -2.5
yaccel              = 0.48
air.fall            = 0
fall.recover        = 0 + ifelse(var(19)=1,0,1)
fall.recovertime    = 15
getpower = 30,15
givepower           = Floor(35*Fvar(5)), 0
Ground.CornerPush.VelOff   = -4
Guard.CornerPush.VelOff    = -4

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7000
ID       = 7000
Pos      = 85, -65
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State a]
Type     = Helper
Trigger1 = MoveGuarded = 1
Name     = "Guard"
Stateno  = 7100
ID       = 7100
Pos      = 85, -65
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 630, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.95

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
Pos      = 10,-50
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State 630, 行動可能]
type     = CtrlSet
trigger1 = Animelem = 7
value    = 1

[State 630, 着地終了]
Type     = ChangeState
Trigger1 = (Vel Y > 0) && (pos y >= 0)
Value    = 52
Ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 /  ＪＢ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 640]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 640
sprpriority = 2

;-------------------------------------------------[演出]

[State 640, 効果音]
type     = PlaySnd
trigger1 = AnimElem = 2
value    = s2, 1

[State 640, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 2
Trigger1 = Random < 500
value    = s200, 17
channel  = 5

;-------------------------------------------------[ヒット定義]

[State 6140, HitDef]
type                = HitDef
trigger1            = AnimElem = 3
attr                = A, NA
hitflag             = MAF
guardflag           = HA
damage              = Floor(45*Fvar(5)*(1.0+var(7)*0.33)),0
animtype            = Midium
ground.type         = High
priority            = 3, Hit
pausetime           = 11, 12
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 1
guardsound          = s1, 1
ground.slidetime    = 11
ground.hittime      = 14 + (5*var(7))
air.hittime         = 14 + (5*var(7))
guard.slidetime     = 12
guard.hittime       = 12
ground.velocity     = -7
guard.velocity      = -7
air.velocity        = -2, -4.5
airguard.velocity   = -2, -4.5
yaccel              = 0.48
air.fall            = 0
fall.recover        = 0 + ifelse(var(19)=1,0,1)
fall.recovertime    = 30
getpower = 30,15
givepower           = Floor(45*Fvar(5)), 0
Ground.CornerPush.VelOff   = -5
Guard.CornerPush.VelOff    = -5

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7005
ID       = 7000
Pos      = 0, -60
PosType  = P2
OwnPal   = 1
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
Pos      = 0, -60
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 640, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.94

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
Pos      = 10,-50
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State 640, 行動可能]
type     = CtrlSet
trigger1 = Animelem = 6
value    = 1

[State 640, 着地終了]
Type     = ChangeState
Trigger1 = (Vel Y > 0) && (pos y >= 0)
Value    = 52
Ctrl     = 0


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 /  ＪＣ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 650]
type     = A
movetype = A
physics  = A
ctrl     = 0
anim     = 650
sprpriority = 2

;-------------------------------------------------[演出]

[State 650, 効果音]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = s2, 2

[State 650, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 4
Trigger1 = Random < 500
value    = s200, 6
channel  = 5

;-------------------------------------------------[ヒット定義]

[State 650, HitDef]
type                = HitDef
trigger1            = AnimElem = 5
attr                = A, NA
hitflag             = MAF
guardflag           = HA
damage              = Floor(80*Fvar(5)*(1.0+var(7)*0.33)),0
animtype            = Hard
ground.type         = High
priority            = 3, Hit
pausetime           = 13, 14
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = s0, 2
guardsound          = s1, 2
ground.slidetime    = 14
ground.hittime      = 23 + (5*var(7))
air.hittime         = 23 + (5*var(7))
guard.slidetime     = 21
guard.hittime       = 21
ground.velocity     = -8
guard.velocity      = -8
air.velocity        = -3, -4.5
airguard.velocity   = -3, -4.5
yaccel              = 0.48
air.fall            = 0
fall.recover        = 0 + ifelse(var(19)=1,0,1)
fall.recovertime    = 45
getpower = 30,15
givepower           = Floor(80*Fvar(5)), 0
Ground.CornerPush.VelOff   = -6
Guard.CornerPush.VelOff    = -6

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit = 1
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 0, -60
PosType  = P2
OwnPal   = 1
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
Pos      = 0, -60
PosType  = P2
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State 620, 変数]  ;Rate補正
Type           = VarSet
Trigger1       = MoveHit = 1
Persistent     = 0
IgnoreHitPause = 1
fvar(0)        = FVar(0) * 0.75

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
Pos      = 10,-50
PosType  = P2
OwnPal   = 1
size.xscale   = 1
size.yscale   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[終了]

[State 650, 行動可能]
type     = CtrlSet
trigger1 = Animelem = 10
value    = 1

[State 650, 着地終了]
Type     = ChangeState
Trigger1 = (Vel Y > 0) && (pos y >= 0)
Value    = 52
Ctrl     = 0



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;投げ / 開始
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 900]
type    = S
movetype= A
physics = S
ctrl    = 0
anim    = 900

[State 900, 座標]
type     = PosSet
Trigger1 = !Time
Y        = 0

[State 900, 攻撃範囲]
Type     = AttackDist
Trigger1 = 1
value    = 0

;-------------------------------------------------[ヒット定義]

[State 900, HitDef]
type          = HitDef
Trigger1      = AnimElem = 1
Trigger1      = P2StateNo!=150&&151&&152&&153&&130&&131&&140
Trigger1      = P2StateType=S
attr          = S, NT
damage        = 0
getpower = 60,30
hitflag       = M-
priority      = 3, miss
pausetime     = 1, 1
sparkno       = -1
sparkxy       = 0, 0
hitsound      = s10, 0
guard.sparkno = -1
guardsound    = s0, 12
yaccel        = 0.48
P1stateno     = 901
P2stateno     = 905
P1facing      = 1
P2facing      = 1
Fall          = 1
Fall.recover  = 0
Kill          = 0

;-------------------------------------------------[終了]

[State 900, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 7
value    = s400, 10
channel  = 5

[State 900, ステート変更] ;失敗
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;投げ / 万年筆
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 901]
type     = S
movetype = A
physics  = S
ctrl     = 0
anim     = 901
sprpriority = 1

[State 901, 無敵]
Type     = NotHitby
trigger1 = 1
value    = SCA
Type     = 1

;-------------------------------------------------[演出]

[State 901, 相手識別]
Type     = Varset
Trigger1 = !time
var(0)   = 0

[State 901, 相手識別];戦人
Type     = Varset
trigger1 = Enemynear,Name = "battler"
trigger2 = Enemynear,Name = "battler_ushiromiya"
trigger3 = Enemynear,Name = "battler ushiromiya"
trigger4 = Enemynear,Name = "ushiromiya_battler"
trigger5 = Enemynear,Name = "ushiromiya battler"
var(0)   = 1

[State 901, 相手識別];縁寿
Type     = Varset
trigger1 = Enemynear,Name = "ange"
trigger2 = Enemynear,Name = "ange_ushiromiya"
trigger3 = Enemynear,Name = "ange ushiromiya"
trigger4 = Enemynear,Name = "ushiromiya_ange"
trigger5 = Enemynear,Name = "ushiromiya ange"
var(0)   = 2

[State 901, 相手識別];譲治
Type     = Varset
trigger1 = Enemynear,Name = "George"
trigger2 = Enemynear,Name = "George_ushiromiya"
trigger3 = Enemynear,Name = "George ushiromiya"
trigger4 = Enemynear,Name = "ushiromiya_George"
trigger5 = Enemynear,Name = "ushiromiya George"
var(0)   = 3

[State 901, 相手識別];紗音
Type     = Varset
trigger1 = Enemynear,Name = "Shanon"
var(0)   = 4

[State 901, 相手識別];EVA叔母さん
Type     = Varset
trigger1 = Enemynear,Name = "eva beatrice"
trigger2 = Enemynear,Name = "eva_beatrice"
trigger3 = Enemynear,Name = "eva-beatrice"
var(0)   = 5

[State 901, 相手識別];ベアト
Type     = Varset
trigger1 = Enemynear,Name = "Beatrice"
var(0)   = 6

[State 901, ボイス]
type     = PlaySnd
trigger1 = AnimElem = 5
value    = s400, 2 + var(0)
channel  = 5

[State 901, 効果音]
type     = PlaySnd
trigger1 = AnimElem = 10
value    = s2, 4

[State 901, 効果音];ヒット音
type     = PlaySnd
trigger1 = AnimElem = 11
value    = s0, 5

[State 901, エフェクト] ;ヒットスパーク
Type     = Helper
Trigger1 = AnimElem = 11
Name     = "hit"
Stateno  = 7026
ID       = 7000
Pos      = 53, -59
PosType  = P1
OwnPal   = 1
IgnoreHitPause = 1
Persistent     = 0
SuperMoveTime  = 99999
PauseMoveTime  = 99999

[State 901, エフェクト] ;ヒットスパーク
Type     = Helper
Trigger1 = AnimElem = 11
Name     = "hit"
Stateno  = 7027
ID       = 7000
Pos      = 53, -59
PosType  = P1
OwnPal   = 1
IgnoreHitPause = 1
Persistent     = 0
SuperMoveTime  = 99999
PauseMoveTime  = 99999

[State 901, 速度]
type     = velset
Trigger1 = Animelem = 11
X = 4

[State 901, 速度]
type     = velset
Trigger1 = Animelem = 12
X = 0

[State 901, 接触判定]
type     = playerpush
Trigger1 = Animelem = 11, > 0
value    = 0

;------------------------------------[ダメージ処理]

[State 901, ヒット回数制御]
Type     = HitAdd
Trigger1 = AnimElem=11
value    = 1

[State 901, ダメージ処理]
Type     = TargetLifeAdd
Trigger1 = AnimElem = 11
value    = -floor(100 * fvar(5))
absolute = 1  ;防御力を反映する

[State 901, ゲージ増加]
type     = PowerAdd
trigger1 = animelem = 11
value    = 0

;------------------------------------[相手制御2]

[State 901, 相手ステート奪取]
Type     = TargetState
Trigger1 = AnimElem = 1
value    = 905

[State 901, 相手ステート奪取]
Type     = TargetState
Trigger1 = AnimElem = 11
value    = 906

[State 901, 相手ステート奪取]
Type     = TargetState
Trigger1 = AnimElem = 12
value    = 907

;------------------------------------[終了]

[State 901, ステート変更] 
Type     = ChangeState
Trigger1 = !AnimTime
value    = 0
Ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[相手制御] 投げ / 掴まれている
;━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 905]
Type     = S
MoveType = H
PhySics  = N
VelSet   = 0,0
Sprpriority = 5

[State 907, 速度]
Type     = VelSet
Trigger1 = !time
X        = 3

[State 907, 速度]
Type     = VelSet
Trigger1 = time =10
X        = 0

[State 905, アニメ変更]
Type     = ChangeAnim2
Trigger1 = !Time
value    = 905

[State 905, カメラ固定]
Type       = screenbound
Trigger1   = 1
value      = 1
Movecamera = 1

[State 905, 無敵] 			;邪魔されないように
type     = NotHitBy
trigger1 = 1
value    = SCA

[State 905, ステート返却]	;もしものために
Type     = SelfState
Trigger1 = Time >= 200
value    = 0

;━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[相手制御] 投げ / 刺された
;━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 906]
Type     = S
MoveType = H
PhySics  = N
VelSet   = 0,0
Sprpriority = 9

[State 906, アニメ変更]
Type     = ChangeAnim2
Trigger1 = !Time
value    = 906

[State 907, 速度]
Type     = VelSet
Trigger1 = time > 4
X        = 3

[State 906, カメラ固定]
Type       = screenbound
Trigger1   = 1
value      = 1
Movecamera = 1

[State 906, 無敵] 			;邪魔されないように
type     = NotHitBy
trigger1 = 1
value    = SCA

[State 906, ステート返却]	;もしものために
Type     = SelfState
Trigger1 = Time >= 200
value    = 0

;━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[相手制御] 投げ / オワタ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 907]
Type     = A
MoveType = H
PhySics  = N
VelSet   = 0,0
Sprpriority = 9

[State 907, 表示優先度]
Type     = Sprpriority
Trigger1 = AnimElem = 5
value    = 5

[State 907, 無敵]
Type     = NotHitBy
Trigger1 = 1
value    = SCA

[State 907, アニメ変更]
Type     = ChangeAnim
Trigger1 = !Time
value    = 5050

[State 907, 速度]
Type     = VelSet
Trigger1 = AnimElem = 1
X        = 0
Y        = -1

[State 907, 速度]
Type     = VelAdd
Trigger1 = 1
Y        = 0.48

[State 907, ステート返却]
Type       = SelfState
TriggerAll = Vel Y > 0
Trigger1   = Pos Y >= 0
value      = 5100
