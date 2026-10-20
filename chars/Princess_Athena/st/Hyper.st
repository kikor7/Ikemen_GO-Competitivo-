; FileName : Hyper.st
;------------------------------------------------------------------------------;
;■■■■■■■■■■■■■■■■■■■目次■■■■■■■■■■■■■■■■■■;
; 超必殺技
; ・ポセインドン・レイジ               : State 3000
; ・ヘブンズ･ゲイト                    : State 3100
; ・炎の杖／風の杖                     : State 3200
; ・フライングファイヤー               : State 3210
; ・フライングハリケーン               :     〃
; ・ファイヤーストーム                 : State 3220
; ・ストームファイヤー                 :     〃
; ・ペガサス☆ファンタジー             : State 3300
;
;■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■;
;==============================================================================;
; 超必殺技
;==============================================================================;
;------------------------------------------------------------------------------;
; ポセインドン・レイジ
;------------------------------------------------------------------------------;
[Statedef 3000]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 3000
  SprPriority = 2

;----------------------------[ ゲージ ]------------------------------;

[State 3000]
  Type     = PowerAdd
  Trigger1 = Time = 0
  Value    = IfElse(Var(31)>0,0,-1000)
  IgnoreHitPause = 1

[State 3000]
  Type       = PowerAdd
  TriggerAll = Var(30) = 1
  Trigger1   = Var(10) = [4,5]
  Trigger1   = Time = 0
  Value      = -1000
  IgnoreHitPause = 1

;-------------------------[ 超必殺技演出 ]---------------------------;

[State 3000 : NBC,02UM]
  Type       = Pause
  TriggerAll = Var(30) = [0,1]
  Trigger1   = AnimElem = 5
  MoveTime   = 28
  Time       = 28
  IgnoreHitPause = 1

[State 3000 : XI,ARRANGE]
  Type       = Pause
  TriggerAll = Var(30) = [2,5]
  Trigger1   = AnimElem = 5
  MoveTime   = 30
  Time       = 30
  IgnoreHitPause = 1

[State 3000 : NBC,02UM]
  Type     = AssertSpecial
  Trigger1 = Var(30) = [0,1]
  Trigger1 = Time = [12,39]
  Flag     = NoFG
  Flag2    = NoBG
  Flag3    = NoBarDisplay
  IgnoreHitPause = 1

[State 3000 : XI,ARRANGE]
  Type     = AssertSpecial
  Trigger1 = Var(30) = [2,5]
  Trigger1 = Time = [12,42]
  Flag     = NoFG
  Flag2    = NoBG
  Flag3    = NoBarDisplay
  IgnoreHitPause = 1

[State 3000 : 超必エフェクト(NBC)]
  Type        = Explod
  TriggerAll  = Var(30) = 0
  Trigger1    = AnimElem = 5
  Anim        = 7000
  Pos         = -18, -145
  SprPriority = 10
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3000 : 超必エフェクト(02UM)]
  Type        = Explod
  TriggerAll  = Var(30) = 1
  Trigger1    = AnimElem = 5, = 2
  Anim        = 7010
  Pos         = -18, -145
  SprPriority = -3
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3000 : 超必エフェクト(02UM)]
  Type        = Explod
  TriggerAll  = Var(30) = 1
  Trigger1    = AnimElem = 5, = 12
  Anim        = 7011
  Pos         = -18, -145
  SprPriority = 10
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3000 : 超必エフェクト1-1(XI)]
  Type        = Explod
  TriggerAll  = Var(30) = [2,5]
  Trigger1    = AnimElem = 5
  Anim        = 7020
  Pos         = -18, -145
  SprPriority = -3
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3000 : 超必エフェクト1-2(XI)]
  Type        = Explod
  TriggerAll  = Var(30) = [2,5]
  Trigger1    = AnimElem = 5
  Anim        = 7021
  Pos         = -18, -145
  SprPriority = 10
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;--------------------------[ キャンセル ]----------------------------;

[State 3000 : スーパーキャンセル（NBC）]
  Type       = PalFx
  TriggerAll = Time = 12
  Trigger1   = Var(10)%10 = 4
  Trigger1   = Var(30) = 0
  Time       = 5
  Add        = 30,0,12
  Mul        = 180,0,60
  IgnoreHitPause = 1

[State 3000]
  Type       = PalFx
  TriggerAll = Time = 12
  Trigger1   = Var(10)%10 = 4
  Trigger1   = Var(30) = [1,5]
  Time       = 5
  Add        = 230,230,230
  IgnoreHitPause = 1

[State 3200 : SC(NBC), 1]
  Type        = Explod
  TriggerAll  = Time = 12
  Trigger1    = Var(10)%10 = 4
  Trigger1    = Var(30) = 0
  Anim        = 7100
  ID          = 7100
  Pos         = 10, 60
  PosType     = Left
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  Scale       = 0.5,0.5
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3000 : SC(NBC), 2]
  Type        = Explod
  TriggerAll  = Time = 12
  Trigger1    = Var(10)%10 = 4
  Trigger1    = Var(30) = 0
  Anim        = 7101
  ID          = 7100
  Pos         = 10, 60
  PosType     = Left
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  Scale       = 0.5,0.5
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3000 : SC(XI), 1]
  Type        = Explod
  TriggerAll  = Time = 12
  Trigger1    = Var(10)%10 = [4,5]
  Trigger1    = Var(30) = [2,5]
  Anim        = 7120
  SprPriority = 50
  PosType     = Left
  Pos         = 0, 80
  BindTime    = -1
  scale       = 0.5, 0.5
  under       = 0
  OwnPal      = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3000 : SC(XI), 2]
  Type        = Explod
  TriggerAll  = Time = 12
  Trigger1    = Var(10)%10 = [4,5]
  Trigger1    = Var(30) = [2,5]
  Anim        = 7121
  SprPriority = 51
  PosType     = Right
  Pos         = 0, 78
  BindTime    = -1
  under       = 0
  OwnPal      = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3000 : SC(XI), 3]
  Type        = Explod
  TriggerAll  = Time = 12
  Trigger1    = Var(10)%10 = [4,5]
  Trigger1    = Var(30) = [2,5]
  Anim        = 7122
  SprPriority = 49
  PosType     = Left
  Pos         = 0, 74
  BindTime    = -1
  under       = 0
  OwnPal      = 1
  Trans       = AddAlpha
  Alpha       = 340-120,120
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;---------------------------[ 変数定義 ]-----------------------------;

[State 3000]
  Type       = VarSet
  TriggerAll = Time = 0
  Trigger1   = Var(31) > 0
  V          = 31
  Value      = 0
  IgnoreHitPause = 1

[State 3000 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 3000 : キャンセル判定セット]
  Type       = VarSet
  TriggerAll = Time = 0
  Trigger1   = Var(10)%10 = [4,5]
  V          = 10
  Value      = 10+Var(10)%10
  IgnoreHitPause = 1

[State 3000 : ボタン判定]
  Type       = VarSet
  TriggerAll = Time = 0
  Trigger1   = Command = "a" || Command = "b"
  V          = 14
  Value      = IfElse(Command = "b",1,0)
  IgnoreHitPause = 1

;--------------------------[ エフェクト ]----------------------------;

[State 3000 : ]
  Type        = Explod
  Trigger1    = AnimElem = 2
  Anim        = 3005
  ID          = 3000
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  IgnoreHitPause = 1

[State 3000 : ]
  Type        = Explod
  Trigger1    = AnimElem = 11
  Anim        = 3015
  ID          = 3000
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 4
  BindTime    = -1
  OwnPal      = 1
  IgnoreHitPause = 0

[State 3000 : ]
  Type        = Explod
  Trigger1    = AnimElem = 9
  Anim        = 3025
  ID          = 3005
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 4
  BindTime    = -1
  OwnPal      = 1
  IgnoreHitPause = 1

[State 3000 : ]
  Type        = Explod
  Trigger1    = AnimElem = 9, >= 0
  Trigger1    = NumExplod(3005) = 0
  Anim        = 3035
  ID          = 3005
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 0
  BindTime    = -1
  RemoveTime  = -1
  OwnPal      = 1
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ 移動関連 ]-----------------------------;

[State 3000 : 移動速度]
  Type     = VelSet
  Trigger1 = AnimElem = 11, >= 0 && AnimElem = 14, < 0
  X        = IfElse(Var(14)=0,4,5.5)

[State 3000 : 移動速度]
  Type     = VelSet
  Trigger1 = AnimElem = 14, >= 0 && AnimElem = 18, < 0
  X        = IfElse(Var(14)=0,5,8)

[State 3000 : 移動速度]
  Type     = VelSet
  Trigger1 = AnimElem = 18, >= 0 && AnimElem = 21, < 0
  X        = 3

;---------------------------[ サウンド ]-----------------------------;

[State 3000 : SE]
  Type     = PlaySnd
  Trigger1 = AnimElem = 5
  Value    = s7000, IfElse(Var(30)>=2,20,Var(30)*10)
[State 3000 : SE]
  Type     = PlaySnd
  Trigger1 = AnimElem = 8
  Value    = s1205, 0

;--------------------------[ ヒット定義 ]----------------------------;

[State 3000]
  Type             = HitDef
  Trigger1         = Time = 0
  Attr             = S, HA
  Damage           = 0, 0
getpower = 60,30
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 8, 8
  SparkNo          = 6002
  Guard.SparkNo    = 6402
  SparkXY          = -10, -76
  HitSound         = s3, Var(1)%3+3
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 5
  Ground.HitTime   = 12
  Ground.Velocity  = 0
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = 0, 0
  P1Facing         = 1
  P2Facing         = 1
  P1StateNo        = IfElse(Var(14)=0,3050,3060)
  P2StateNo        = 3070
  Fall             = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 3000]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 3090

;------------------------------------------------------------------------------;
; 弱ポセイドン・レイジ（攻撃）
;------------------------------------------------------------------------------;
[Statedef 3050]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 3050
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 3050 : コンボ数カウント]
  Type     = Null;VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1

[State 3050 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 3050 : キャンセル判定セット]
  Type       = VarSet
  TriggerAll = MoveContact
  Trigger1   = Var(30) = [2,5]
  V          = 10
  Value      = 7
  IgnoreHitPause = 1
  Persistent     = 0

;--------------------------[ エフェクト ]----------------------------;

[State 3050]
  Type     = RemoveExplod
  Trigger1 = Time = 0
  ID       = 3000

[State 3050]
  Type           = Explod
  Trigger1       = Time = 0
  Anim           = 3055
  ID             = 3000
  Pos            = 0, 0
  PosType        = P1
  SprPriority    = 3
  BindTime       = -1
  OwnPal         = 1
  IgnoreHitPause = 0

[State 3050]
  Type           = Explod
  Trigger1       = Time >= 0
  Trigger1       = NumExplod(3005) = 0
  Anim           = 3035
  ID             = 3005
  Pos            = 0, 0
  PosType        = P1
  SprPriority    = 0
  BindTime       = -1
  RemoveTime     = -1
  OwnPal         = 1
  IgnoreHitPause = 1
  Persistent     = 0

;--------------------------[ ヒット定義 ]----------------------------;

[State 3050]
  Type             = HitDef
  Trigger1         = AnimElem = 2
  Trigger2         = AnimElem = 6
  Trigger3         = AnimElem = 8
  Trigger4         = AnimElem = 12
  Trigger5         = AnimElem = 14
  Trigger6         = AnimElem = 18
  Trigger7         = AnimElem = 20
  Attr             = S, HA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(25*FVar(5))<1,1,Floor(25*FVar(5))),35),0
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 3, 10
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -10, -76
  HitSound         = s3, Root,IfElse(Var(30)>=2,21,IfElse(Var(30)=1,11,Var(1)%3+3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 20
  Ground.HitTime   = 21
  Ground.Velocity  = 0
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = 0, 0
  P2StateNo        = 3075

[State 3050]
  Type             = HitDef
  Trigger1         = AnimElem = 24
  Attr             = S, HA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(30*FVar(5))<1,1,Floor(30*FVar(5))),40),0
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 4, 10
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -10, -76
  HitSound         = s3, Root,IfElse(Var(30)>=2,21,IfElse(Var(30)=1,11,Var(1)%3+3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 20
  Ground.HitTime   = 21
  Ground.Velocity  = -4
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3
  P2StateNo        = 3080

[State 3050]
  Type     = MoveHitReset
  Trigger1 = MoveContact
  IgnoreHitPause = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 3050]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 3090

;------------------------------------------------------------------------------;
; 強ポセイドン・レイジ（攻撃）
;------------------------------------------------------------------------------;
[Statedef 3060]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 3060
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 3060 : コンボ数カウント]
  Type     = Null;VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1

[State 3060 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 3060 : キャンセル判定セット]
  Type       = VarSet
  TriggerAll = MoveContact
  Trigger1   = Var(30) = [2,5]
  V          = 10
  Value      = 7
  IgnoreHitPause = 1
  Persistent     = 0

;--------------------------[ エフェクト ]----------------------------;

[State 3060]
  Type     = RemoveExplod
  Trigger1 = Time = 0
  ID       = 3000
  IgnoreHitPause = 1

[State 3060]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 3065
  ID          = 3000
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  IgnoreHitPause = 0

[State 3060]
  Type        = Explod
  Trigger1    = Time >= 0
  Trigger1    = NumExplod(3005) = 0
  Anim        = 3035
  ID          = 3005
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 0
  BindTime    = -1
  RemoveTime  = -1
  OwnPal      = 1
  IgnoreHitPause = 1
  Persistent     = 0

;--------------------------[ ヒット定義 ]----------------------------;

[State 3060]
  Type             = HitDef
  Trigger1         = AnimElem = 2
  Trigger2         = AnimElem = 6
  Trigger3         = AnimElem = 8
  Trigger4         = AnimElem = 12
  Trigger5         = AnimElem = 14
  Trigger6         = AnimElem = 18
  Trigger7         = AnimElem = 20
  Trigger8         = AnimElem = 24
  Trigger9         = AnimElem = 26
  Trigger10        = AnimElem = 30
  Trigger11        = AnimElem = 32
  Trigger12        = AnimElem = 36
  Trigger13        = AnimElem = 38
  Attr             = S, HA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(25*FVar(5))<1,1,Floor(25*FVar(5))),35),0
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 2, 10
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -10, -76
  HitSound         = s3, Root,IfElse(Var(30)>=2,21,IfElse(Var(30)=1,11,Var(1)%3+3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 20
  Ground.HitTime   = 21
  Ground.Velocity  = 0
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = 0, 0
  P2StateNo        = 3075

[State 3060]
  Type             = HitDef
  Trigger1         = AnimElem = 42
  Attr             = S, HA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(40*FVar(5))<1,1,Floor(40*FVar(5))),50),0
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 2, 10
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -10, -76
  HitSound         = s3, Root,IfElse(Var(30)>=2,21,IfElse(Var(30)=1,11,Var(1)%3+3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 20
  Ground.HitTime   = 21
  Ground.Velocity  = -4
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3
  P2StateNo        = 3080

[State 3060]
  Type     = MoveHitReset
  Trigger1 = MoveContact
  IgnoreHitPause = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 3060]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 3090

;------------------------------------------------------------------------------;
; ポセイドン･レイジ（やられ１）
;------------------------------------------------------------------------------;
[Statedef 3070]
  Type        = S
  MoveType    = H
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  SprPriority = 2

;--------------------------[ アニメ変更 ]----------------------------;

[State 3070]
  type     = ChangeAnim
  trigger1 = Time = 0
  value    = 5012
  ctrl     = 1

[State 3070]
  Type     = PosAdd
  Trigger1 = Time = 0
  X        = P2BodyDist X - 15

[State 3070]
  Type     = PosSet
  Trigger1 = Time = 0
  Y        = 0

;-------------------------[ ステート変更 ]---------------------------;

[State 3070]
  type     = SelfState
  trigger1 = Time = 30
  value    = 0
  ctrl     = 1

;------------------------------------------------------------------------------;
; ポセイドン･レイジ（やられ２）
;------------------------------------------------------------------------------;
[Statedef 3075]
  Type        = S
  MoveType    = H
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  SprPriority = 2

;--------------------------[ アニメ変更 ]----------------------------;

[State 3075]
  type     = ChangeAnim2
  trigger1 = Time = 0
  value    = 3075
  ctrl     = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 3075]
  type     = SelfState
  trigger1 = AnimTime = 0
  value    = 0
  ctrl     = 1

;------------------------------------------------------------------------------;
; ポセイドン・レイジ（やられ，吹っ飛び）
;------------------------------------------------------------------------------;
[Statedef 3080]
  Type        = A
  MoveType    = H
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  SprPriority = 2

;--------------------------[ アニメ変更 ]----------------------------;

[State 3080]
  type     = ChangeAnim2
  trigger1 = Time = 0
  value    = 3080

;---------------------------[ 移動関連 ]-----------------------------;

[State 3080]
  type = VelSet
  trigger1 = Time = 1
  X        = -1
  Y        = -15

[State 3080]
  type     = VelAdd
  trigger1 = Time >= 0
  Y        = 0.45

;-------------------------[ ステート変更 ]---------------------------;

[State 3080]
  type     = SelfState
  trigger1 = Vel Y > 0 && Pos Y > 0
  value    = 5100
  ctrl     = 0

;------------------------------------------------------------------------------;
; ポセイドン・レイジ（終了）
;------------------------------------------------------------------------------;
[Statedef 3090]
  Type        = A
  MoveType    = A
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 3090
  SprPriority = 2

;---------------------------[ 移動関連 ]-----------------------------;

[State 3090 : 移動速度]
  Type     = VelSet
  Trigger1 = AnimElem = 1
  X        = -3
  Y        = -8

[State 3090 : 移動速度]
  Type     = VelAdd
  Trigger1 = AnimElem = 1, >= 0
  X        = 0.025
  Y        = 0.25

[State 3090 : 移動速度]
  Type     = VelAdd
  Trigger1 = AnimElem = 4, >= 0
  Y        = 0.15

;--------------------------[ エフェクト ]----------------------------;

[State 3090]
  Type     = RemoveExplod
  Trigger1 = Time = 0
  ID       = 3005

[State 3090]
  Type           = Explod
  Trigger1       = Time = 0
  Anim           = 3045
  ID             = 3005
  Pos            = 0, 0
  PosType        = P1
  SprPriority    = 6
  OwnPal         = 1
  IgnoreHitPause = 1

[State 3090]
  Type           = Explod
  Trigger1       = Time = 0
  Anim           = 3095
  ID             = 3000
  Pos            = 0, 0
  PosType        = P1
  SprPriority    = 4
  BindTime       = -1
  OwnPal         = 1
  IgnoreHitPause = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 3090]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Trigger1 = Vel Y > 0 && Pos Y >= 0
  Value    = 52

;------------------------------------------------------------------------------;
; ヘブンズ･ゲイト
;------------------------------------------------------------------------------;
[Statedef 3100]
  Type        = S
poweradd = 20
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 3100
  SprPriority = 2

;----------------------------[ ゲージ ]------------------------------;

[State 3100]
  Type     = PowerAdd
  Trigger1 = Time = 0
  Value    = IfElse(Var(31)>0,0,-1000)
  IgnoreHitPause = 1

[State 3100]
  Type       = PowerAdd
  TriggerAll = Var(30) = 1
  Trigger1   = Var(10) = [4,5]
  Trigger1   = Time = 0
  Value      = -1000
  IgnoreHitPause = 1

;-------------------------[ 超必殺技演出 ]---------------------------;

[State 3100 : NBC, 02UM]
  Type       = Pause
  TriggerAll = Var(30) = [0,1]
  Trigger1   = Time = 0
  MoveTime   = 28
  Time       = 28
  IgnoreHitPause = 1

[State 3100 : XI, ARRANGE]
  Type       = Pause
  TriggerAll = Var(30) = [2,5]
  Trigger1   = Time = 0
  MoveTime   = 30
  Time       = 30
  IgnoreHitPause = 1

[State 3100 : NBC, 02UM]
  Type       = AssertSpecial
  TriggerAll = Var(30) = [0,1]
  Trigger1   = Time = [0,28]
  Flag       = NoFG
  Flag2      = NoBG
  Flag3      = NoBarDisplay
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3100 : XI, ARRANGE]
  Type       = AssertSpecial
  TriggerAll = Var(30) = [2,5]
  Trigger1   = Time = [0,30]
  Flag       = NoFG
  Flag2      = NoBG
  Flag3      = NoBarDisplay
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3100 : 超必エフェクト(NBC)]
  Type        = Explod
  TriggerAll  = Var(30) = 0
  Trigger1    = Time = 0
  Anim        = 7000
  Pos         = 1, -66
  SprPriority = 10
  OwnPal      = 1
  BindTime    = 1
  Persistent  = 0
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3100 : 超必エフェクト1-1(02UM)]
  Type        = Explod
  TriggerAll  = Var(30) = 1
  Trigger1    = Time = 2
  Anim        = 7010
  Pos         = 1, -66
  SprPriority = -3
  OwnPal      = 1
  BindTime    = 1
  Persistent  = 0
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3100 : 超必エフェクト1-2(02UM)]
  Type        = Explod
  TriggerAll  = Var(30) = 1
  Trigger1    = Time = 12
  Anim        = 7011
  Pos         = 1, -66
  SprPriority = 10
  OwnPal      = 1
  BindTime    = 1
  Persistent  = 0
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3100 : 超必エフェクト1-1(XI)]
  Type        = Explod
  TriggerAll  = Var(30) = [2,5]
  Trigger1    = Time = 0
  Anim        = 7020
  Pos         = 1, -66
  SprPriority = -3
  OwnPal      = 1
  BindTime    = 1
  Persistent  = 0
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3100 : 超必エフェクト1-2(XI)]
  Type        = Explod
  TriggerAll  = Var(30) = [2,5]
  Trigger1    = Time = 0
  Anim        = 7021
  Pos         = 1, -66
  SprPriority = 10
  OwnPal      = 1
  BindTime    = 1
  Persistent  = 0
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;--------------------------[ キャンセル ]----------------------------;

[State 3100 : スーパーキャンセル（NBC）]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = 4
  Trigger1   = Var(30) = 0
  Time       = 5
  Add        = 30,0,12
  Mul        = 180,0,60
  IgnoreHitPause = 1

[State 3100]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [4,5]
  Trigger1   = Var(30) = [1,5]
  Time       = 5
  Add        = 230,230,230
  IgnoreHitPause = 1

[State 3100 : SC(NBC), 1]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = 4
  Trigger1    = Var(30) = 0
  Anim        = 7100
  ID          = 7100
  Pos         = 10, 60
  PosType     = Left
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  Scale       = 0.5,0.5
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3100 : SC(NBC), 2]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = 4
  Trigger1    = Var(30) = 0
  Anim        = 7101
  ID          = 7100
  Pos         = 10, 60
  PosType     = Left
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  Scale       = 0.5,0.5
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3100 : SC(XI), 1]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = [4,5]
  Trigger1    = Var(30) = [2,5]
  Anim        = 7120
  SprPriority = 50
  PosType     = Left
  Pos         = 0, 80
  BindTime    = -1
  scale       = 0.5, 0.5
  under       = 0
  OwnPal      = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3100 : SC(XI), 2]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = [4,5]
  Trigger1    = Var(30) = [2,5]
  Anim        = 7121
  SprPriority = 51
  PosType     = Right
  Pos         = 0, 78
  BindTime    = -1
  under       = 0
  OwnPal      = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3100 : SC(XI), 3]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = [4,5]
  Trigger1    = Var(30) = [2,5]
  Anim        = 7122
  SprPriority = 49
  PosType     = Left
  Pos         = 0, 74
  BindTime    = -1
  under       = 0
  OwnPal      = 1
  Trans       = AddAlpha
  Alpha       = 340-120,120
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;---------------------------[ 変数定義 ]-----------------------------;

[State 3100]
  Type       = VarSet
  TriggerAll = Time = 0
  Trigger1   = Var(31) > 0
  V          = 31
  Value      = 0
  IgnoreHitPause = 1

[State 3100]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 3100 : キャンセル判定セット]
  Type       = VarSet
  TriggerAll = MoveContact
  Trigger1   = Var(30) = 2 || Var(30) = 5
  V          = 10
  Value      = 7
  IgnoreHitPause = 1
  Persistent     = 0

[State 3100 : ボタン判定]
  Type       = VarSet
  TriggerAll = Time = 0
  Trigger1   = Command = "x" || Command = "y"
  V          = 14
  Value      = IfElse(Command = "y",1,0)
  IgnoreHitPause = 1

;---------------------------[ サウンド ]-----------------------------;

[State 3100 : SE]
  Type     = PlaySnd
  Trigger1 = Time = 0
  Value    = s7000, IfElse(Var(30)>=2,20,Var(30)*10)
  Channel  = 8

[State 3100]
  Type     = PlaySnd
  Trigger1 = AnimElem = 8
  Value    = s3100, 0

[State 3100]
  Type     = PlaySnd
  Trigger1 = AnimElem = 7
  Value    = s3105, 0

[State 3100]
  Type     = PlaySnd
  Trigger1 = AnimElem = 13
  Value    = s1405, 0

;---------------------------[ ヘルパー ]-----------------------------;

[State 3100]
  Type        = Helper
  Trigger1    = AnimElem = 9
  Name        = "Heven's Gate_1"
  StateNo     = 3110
  ID          = 3100
  HelperType  = Normal
  Pos         = 126, -77
  PosType     = P1
  Facing      = 1
  KeyCtrl     = 0
  OwnPal      = 1
  SprPriority = 10
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3100]
  Type        = Helper
  Trigger1    = AnimElem = 11
  Name        = "Heven's Gate_2"
  StateNo     = 3120
  ID          = 3100
  HelperType  = Normal
  Pos         = 126, -77
  PosType     = P1
  Facing      = 1
  KeyCtrl     = 0
  OwnPal      = 1
  SprPriority = 12
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;-------------------------[ ステート変更 ]---------------------------;

[State 3100]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; ヘブンズ･ゲイト１（ヘルパー）
;------------------------------------------------------------------------------;
[Statedef 3110]
  Type        = A
  MoveType    = A
  Physics     = N
  Juggle      = 0
  PowerAdd    = 0
  VelSet      = 0, 0
  Anim        = 3110
  Ctrl        = 0
  SprPriority = 10

[State 3110 : 相手の特定の攻撃属性無効]
  Type     = NotHitBy
  Trigger1 = 1
  Value    = SCA

[State 3110]
  Type     = AssertSpecial
  Trigger1 = 1
  Flag     = NoShadow
  IgnoreHitPause = 1

;---------------------------[ サウンド ]-----------------------------;

[State 3110 : SE]
  Type     = PlaySnd
  Trigger1 = Var(22) = 0
  Trigger1 = MoveHit = 1
  Value    = s1005, 4

;---------------------------[ 変数定義 ]-----------------------------;

[State 3110 : ヒット数カウント]
  Type     = ParentVarAdd
  Trigger1 = MoveContact
  V        = 2
  Value    = 1
  IgnoreHitPause = 1

[State 3110 : キャンセル判定セット]
  Type       = ParentVarSet
  TriggerAll = MoveContact
  Trigger1   = Root,Var(30) = 2 || Root,Var(30) = 5
  V          = 10
  Value      = 7
  IgnoreHitPause = 1
  Persistent     = 0

[State 3110]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 14
  Value    = Root,Var(14)
  IgnoreHitPause = 1

[State 3110]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 22
  Value    = 0
  IgnoreHitPause = 1

[State 3110]
  Type     = VarAdd
  Trigger1 = MoveContact = 1
  V        = 22
  Value    = 1
  IgnoreHitPause = 1

;---------------------------[ 移動関連 ]-----------------------------;

[State 3110]
  Type     = VelSet
  Trigger1 = Time = 0
  X        = IfElse(Root,Var(14)=0,2,6)

[State 3110]
  Type     = VelAdd
  Trigger1 = 1
  X        = IfElse(Root,Var(14)=0,0.15,0.35)

;--------------------------[ ヒット定義 ]----------------------------;

[State 3110]
  Type             = HitDef
  Trigger1         = Var(14) = 0
  Trigger1         = Var(22) < 3
  Trigger2         = Var(14) = 1
  Trigger2         = Var(22) < 4
  Attr             = A, HP
  Damage           = IfElse(Root,Var(3)=0,IfElse(Floor(30*Root,FVar(5))<1,1,Floor(30*Root,FVar(5))),40),0
  getpower = 15,7
  AnimType         = Hard
  HitFlag          = MAFP
  GuardFlag        = M
  Priority         = 3, Hit
  PauseTime        = 0, 15
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -25, 0
;  HitSound        = s1005,4
  GuardSound       = s120,IfElse(Root,Var(30)>=2,2,Root,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 22
  Ground.HitTime   = 23
  Ground.Velocity  = -5,-5.5
  Air.Velocity     = -5,-6.5
  Air.Type         = High
  Air.HitTime      = 12
  Fall             = 1
  Fall.Recover     = 0
  PalFx.Time       = 60
  PalFx.Add        = 30,-40,-140
  PalFx.SinAdd     = 60,60,50,10
  PalFx.Color      = 0
  PalFx.Invertall  = 1
  Ground.CornerPush.VelOff = 0
  Air.CornerPush.VelOff    = 0

[State 3110]
  Type     = MoveHitReset
  Trigger1 = MoveContact
  IgnoreHitPause = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 3110 : 攻撃を受けたら消滅ステートに移動]
  Type     = Null;HitOverRide
  Trigger1 = Time = 0
  Attr     = SCA, NT, ST, HT, NA, SA, HA, NP, SP, HP
  StateNo  = 3125
  Time     = -1

[State 3110 : このヘルパーを消す]
  Type     = DestroySelf
  Trigger1 = Root,StateNo != 3100

;------------------------------------------------------------------------------;
; ヘブンズ･ゲイト２（ヘルパー）
;------------------------------------------------------------------------------;
[Statedef 3120]
  Type        = A
  MoveType    = A
  Physics     = N
  Juggle      = 0
  PowerAdd    = 0
  VelSet      = 0, 0
  Anim        = 3110
  Ctrl        = 0
  SprPriority = 10

[State 3120 : 相手の特定の攻撃属性無効]
  Type     = NotHitBy
  Trigger1 = 1
  Value    = SCA

[State 3120]
  Type     = AssertSpecial
  Trigger1 = 1
  Flag     = NoShadow
  IgnoreHitPause = 1

;---------------------------[ サウンド ]-----------------------------;

[State 3120 : SE]
  Type     = PlaySnd
  Trigger1 = Var(23) = 0
  Trigger1 = MoveHit = 1
  Value    = s1005, 4

;---------------------------[ 変数定義 ]-----------------------------;

[State 3120 : ヒット数カウント]
  Type     = ParentVarAdd
  Trigger1 = MoveContact
  V        = 2
  Value    = 1
  IgnoreHitPause = 1

[State 3120 : キャンセル判定セット]
  Type       = ParentVarSet
  TriggerAll = MoveContact
  Trigger1   = Root,Var(30) = 2 || Root,Var(30) = 5
  V          = 10
  Value      = 7
  IgnoreHitPause = 1
  Persistent     = 0

[State 3120]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 23
  Value    = 0
  IgnoreHitPause = 1

[State 3120]
  Type     = VarAdd
  Trigger1 = MoveContact = 1
  V        = 23
  Value    = 1
  IgnoreHitPause = 1

;---------------------------[ 移動関連 ]-----------------------------;

[State 3120]
  Type     = VelSet
  Trigger1 = Time = 0
  X        = IfElse(Root,Var(14)=0,1,3)

[State 3120]
  Type     = VelAdd
  Trigger1 = 1
  X        = IfElse(Root,Var(14)=0,0.15,0.35)

;--------------------------[ ヒット定義 ]----------------------------;

[State 3120]
  Type             = HitDef
  Trigger1         = Var(23) < 3
  Attr             = A, HP
  Damage           = IfElse(Root,Var(3)=0,IfElse(Floor(30*Root,FVar(5))<1,1,Floor(30*Root,FVar(5))),40),0
  getpower = 15,7
  AnimType         = Hard
  HitFlag          = MAFP
  GuardFlag        = M
  Priority         = 3, Hit
  PauseTime        = 0, 15
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -25, 0
;  HitSound        = s1005,4
  GuardSound       = s120,IfElse(Root,Var(30)>=2,2,Root,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 22
  Ground.HitTime   = 23
  Ground.Velocity  = -5,-5.5
  Air.Velocity     = -5,-6.5
  Air.Type         = High
  Air.HitTime      = 12
  Fall             = 1
  Fall.Recover     = 0
  PalFx.Time       = 60
  PalFx.Add        = 30,-40,-140
  PalFx.SinAdd     = 60,60,50,10
  PalFx.Color      = 0
  PalFx.Invertall  = 1
  Ground.CornerPush.VelOff = 0
  Air.CornerPush.VelOff    = 0

[State 3120]
  Type     = MoveHitReset
  Trigger1 = MoveContact
  IgnoreHitPause = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 3120 : 攻撃を受けたら消滅ステートに移動]
  Type     = Null;HitOverRide
  Trigger1 = Time = 0
  Attr     = SCA, NT, ST, HT, NA, SA, HA, NP, SP, HP
  StateNo  = 3125
  Time     = -1

[State 3120 : このヘルパーを消す]
  Type     = DestroySelf
  Trigger1 = Root,StateNo != 3100

;------------------------------------------------------------------------------;
; ヘルパー消滅
;------------------------------------------------------------------------------;
[Statedef 3125]
  Type        = A
  MoveType    = I
  Physics     = N
  Juggle      = 0
  PowerAdd    = 0
  VelSet      = 0, 0
  Anim        = 9999
  Ctrl        = 0
  SprPriority = 0

[State 3125 : 相手の特定の攻撃属性無効]
  Type     = NotHitBy
  Trigger1 = 1
  Value    = SCA

[State 3125]
  Type     = AssertSpecial
  Trigger1 = 1
  Flag     = NoShadow
  IgnoreHitPause = 1

[State 3125 : このヘルパーを消す]
  Type     = DestroySelf
  Trigger1 = AnimTime = 0
  Trigger2 = PrevStateNo != 3110 && Time = 0

;------------------------------------------------------------------------------;
; 炎の杖／風の杖
;------------------------------------------------------------------------------;
[Statedef 3200]
  Type        = U
poweradd = 20
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 3200
  SprPriority = 2

[State 3200]
  Type       = StateTypeSet
  TriggerAll = Time = 0
  Trigger1   = StateType = A
  Physics    = N
  IgnoreHitPause = 1

;--------------------------[ アニメ変更 ]----------------------------;

[State 3200]
  Type       = ChangeAnim
  TriggerAll = Time = 0
  Trigger1   = StateType = A
  Value      = 3201
  IgnoreHitPause = 1

;----------------------------[ ゲージ ]------------------------------;

[State 3200]
  Type     = PowerAdd
  Trigger1 = Time = 0
  Value    = IfElse(Var(31)>0,0,-1000)
  IgnoreHitPause = 1

[State 3200]
  Type       = PowerAdd
  TriggerAll = Var(30) = 1
  Trigger1   = Var(10) = [4,5]
  Trigger1   = Time = 0
  Value      = -1000
  IgnoreHitPause = 1

;-------------------------[ 超必殺技演出 ]---------------------------;

[State 3200 : NBC, 02UM]
  Type       = Pause
  TriggerAll = Var(30) = [0,1]
  Trigger1   = Time = 0
  MoveTime   = 28
  Time       = 28
  IgnoreHitPause = 1

[State 3200 : XI, ARRANGE]
  Type       = Pause
  TriggerAll = Var(30) = [2,5]
  Trigger1   = Time = 0
  MoveTime   = 30
  Time       = 30
  IgnoreHitPause = 1

[State 3200 : NBC, 02UM]
  Type       = AssertSpecial
  TriggerAll = Var(30) = [0,1]
  Trigger1   = Time = [0,28]
  Flag       = NoFG
  Flag2      = NoBG
  Flag3      = NoBarDisplay
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3200 : XI, ARRANGE]
  Type     = AssertSpecial
  Trigger1 = Var(30) = [2,5]
  Trigger1 = Time = [0,30]
  Flag     = NoFG
  Flag2    = NoBG
  Flag3    = NoBarDisplay
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3200 : 超必エフェクト(NBC)]
  Type        = Explod
  TriggerAll  = Var(30) = 0
  Trigger1    = Time = 0
  Anim        = 7000
  Pos         = 12, -87
  SprPriority = 10
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3200 : 超必エフェクト1-1(02UM)]
  Type        = Explod
  TriggerAll  = Var(30) = 1
  Trigger1    = Time = 2
  Anim        = 7010
  Pos         = 12, -87
  SprPriority = -3
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3200 : 超必エフェクト1-2(02UM)]
  Type        = Explod
  TriggerAll  = Var(30) = 1
  Trigger1    = Time = 12
  Anim        = 7011
  Pos         = 12, -87
  SprPriority = 10
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3200 : 超必エフェクト1-1(XI)]
  Type        = Explod
  TriggerAll  = Var(30) = [2,5]
  Trigger1    = Time = 0
  Anim        = 7020
  Pos         = 12, -87
  SprPriority = -3
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3200 : 超必エフェクト1-2(XI)]
  Type        = Explod
  TriggerAll  = Var(30) = [2,5]
  Trigger1    = Time = 0
  Anim        = 7021
  Pos         = 12, -87
  SprPriority = 10
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;--------------------------[ キャンセル ]----------------------------;

[State 3200 : スーパーキャンセル（NBC）]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = 4
  Trigger1   = Var(30) = 0
  Time       = 5
  Add        = 30,0,12
  Mul        = 180,0,60
  IgnoreHitPause = 1

[State 3200]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [4,5]
  Trigger1   = Var(30) = [1,5]
  Time       = 5
  Add        = 230,230,230
  IgnoreHitPause = 1

[State 3200 : スーパーキャンセル]
  Type        = Null;Helper
  TriggerAll  = Var(10) = 4
  Trigger1    = Var(30) = 0
  Trigger1    = Time = 0
  Name        = "SuperCancel"
  StateNo     = 7100
  ID          = 7100
  HelperType  = Normal
  Pos         = 0, 0
  PosType     = front
  Facing      = 1
  KeyCtrl     = 0
  OwnPal      = 1
  SprPriority = 6
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3200 : SC(NBC), 1]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = 4
  Trigger1    = Var(30) = 0
  Anim        = 7100
  ID          = 7100
  Pos         = 10, 60
  PosType     = Left
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  Scale       = 0.5,0.5
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3200 : SC(NBC), 2]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = 4
  Trigger1    = Var(30) = 0
  Anim        = 7101
  ID          = 7100
  Pos         = 10, 60
  PosType     = Left
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  Scale       = 0.5,0.5
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3200 : SC(XI), 1]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = [4,5]
  Trigger1    = Var(30) = [2,5]
  Anim        = 7120
  SprPriority = 50
  PosType     = Left
  Pos         = 0, 80
  BindTime    = -1
  scale       = 0.5, 0.5
  under       = 0
  OwnPal      = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3200 : SC(XI), 2]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = [4,5]
  Trigger1    = Var(30) = [2,5]
  Anim        = 7121
  SprPriority = 51
  PosType     = Right
  Pos         = 0, 78
  BindTime    = -1
  under       = 0
  OwnPal      = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3200 : SC(XI), 3]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = [4,5]
  Trigger1    = Var(30) = [2,5]
  Anim        = 7122
  SprPriority = 49
  PosType     = Left
  Pos         = 0, 74
  BindTime    = -1
  under       = 0
  OwnPal      = 1
  Trans       = AddAlpha
  Alpha       = 340-120,120
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;---------------------------[ 変数定義 ]-----------------------------;

[State 3200]
  Type       = VarSet
  TriggerAll = Time = 0
  Trigger1   = Var(31) > 0
  V          = 31
  Value      = 0
  IgnoreHitPause = 1

[State 3200]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 3200 : ボタン判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 24
  Value    = 0
  IgnoreHitPause = 1

[State 3200 : ボタン判定]
  Type       = VarSet
  TriggerAll = Time = 0
  Trigger1   = Command = "x" || Command = "y"
  V          = 24
  Value      = IfElse(Command = "y",2,1)
  IgnoreHitPause = 1

;---------------------------[ サウンド ]-----------------------------;

[State 3200 : SE]
  Type     = PlaySnd
  Trigger1 = Time = 0
  Value    = s7000, IfElse(Var(30)>=2,20,Var(30)*10)

[State 3200 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 3
  Trigger1 = Var(24) = 1
  Value    = s3200, 0

[State 3200 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 3
  Trigger1 = Var(24) = 2
  Value    = s3200, 1

;---------------------------[ 移動関連 ]-----------------------------;

[State 3200]
  Type       = VelAdd
  TriggerAll = Anim = 3201
  Trigger1   = AnimElem = 5, >= 0
  Y          = 0.47

;---------------------------[ ヘルパー ]-----------------------------;

[State 3200]
  Type        = Helper
  TriggerAll  = Var(24) = 1
  Trigger1    = AnimElem = 4
  Trigger1    = NumHelper(3250) = 0
  Name        = "Honoo"
  StateNo     = 3250
  ID          = 3250
  HelperType  = Normal
  Pos         = 30, -60
  PosType     = P1
  Facing      = 1
  KeyCtrl     = 0
  OwnPal      = 1
  SprPriority = 6
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3200]
  Type        = Helper
  TriggerAll  = Var(24) = 2
  Trigger1    = AnimElem = 4
  Trigger1    = NumHelper(3260) = 0
  Name        = "Kaze"
  StateNo     = 3260
  ID          = 3260
  HelperType  = Normal
  Pos         = 30, -60
  PosType     = P1
  Facing      = 1
  KeyCtrl     = 0
  OwnPal      = 1
  SprPriority = 6
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;-------------------------[ ステート変更 ]---------------------------;

[State 3200]
  Type     = ChangeState
  Trigger1 = Anim = 3200
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

[State 3200]
  Type     = ChangeState
  Trigger1 = Anim = 3201
  Trigger1 = Vel Y > 0 && Pos Y >= 0
  Value    = 52

;------------------------------------------------------------------------------;
; フライングファイヤー／フライングハリケーン
;------------------------------------------------------------------------------;
[Statedef 3210]
  Type        = U
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 3210
  SprPriority = 2

[State 3210]
  Type       = StateTypeSet
  TriggerAll = Time = 0
  Trigger1   = StateType = A
  Physics    = N
  IgnoreHitPause = 1

;--------------------------[ アニメ変更 ]----------------------------;

[State 3210]
  Type       = ChangeAnim
  TriggerAll = Time = 0
  Trigger1   = StateType = A
  Value      = 3211
  IgnoreHitPause = 1

;--------------------------[ キャンセル ]----------------------------;

[State 3210 : スーパーキャンセル（NBC）]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = 4
  Trigger1   = Var(30) = 0
  Time       = 5
  Add        = 30,0,12
  Mul        = 180,0,60
  IgnoreHitPause = 1

[State 3210]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [4,5]
  Trigger1   = Var(30) = [1,5]
  Time       = 5
  Add        = 230,230,230
  IgnoreHitPause = 1

[State 3210 : SC(NBC), 1]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = 4
  Trigger1    = Var(30) = 0
  Anim        = 7100
  ID          = 7100
  Pos         = 10, 60
  PosType     = Left
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  Scale       = 0.5,0.5
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3210 : SC(NBC), 2]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = 4
  Trigger1    = Var(30) = 0
  Anim        = 7101
  ID          = 7100
  Pos         = 10, 60
  PosType     = Left
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  Scale       = 0.5,0.5
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3210 : SC(XI), 1]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = [4,5]
  Trigger1    = Var(30) = [2,5]
  Anim        = 7120
  SprPriority = 50
  PosType     = Left
  Pos         = 0, 80
  BindTime    = -1
  scale       = 0.5, 0.5
  under       = 0
  OwnPal      = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3210 : SC(XI), 2]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = [4,5]
  Trigger1    = Var(30) = [2,5]
  Anim        = 7121
  SprPriority = 51
  PosType     = Right
  Pos         = 0, 78
  BindTime    = -1
  under       = 0
  OwnPal      = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3210 : SC(XI), 3]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = [4,5]
  Trigger1    = Var(30) = [2,5]
  Anim        = 7122
  SprPriority = 49
  PosType     = Left
  Pos         = 0, 74
  BindTime    = -1
  under       = 0
  OwnPal      = 1
  Trans       = AddAlpha
  Alpha       = 340-120,120
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;---------------------------[ 変数定義 ]-----------------------------;

[State 3210]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 3210 : ボタン判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 24
  Value    = 0
  IgnoreHitPause = 1

[State 3210 : ボタン判定]
  Type       = VarSet
  TriggerAll = Time = 0
  Trigger1   = NumHelper(3250) = 1
  Trigger1   = Command = "x"
  Trigger2   = NumHelper(3260) = 1
  Trigger2   = Command = "y"
  V          = 24
  Value      = IfElse(Command = "y",4,3)
  IgnoreHitPause = 1

;---------------------------[ サウンド ]-----------------------------;

[State 3210]
  Type     = PlaySnd
  Trigger1 = Time = 0
  Value    = s3200, 2

;---------------------------[ 移動関連 ]-----------------------------;

[State 3210]
  Type       = VelAdd
  TriggerAll = Anim = 3211
  Trigger1   = AnimElem = 4, >= 0
  Y          = 0.47

;-------------------------[ ステート変更 ]---------------------------;

[State 3210]
  Type     = ChangeState
  Trigger1 = Anim = 3210
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

[State 3210]
  Type     = ChangeState
  Trigger1 = Anim = 3211
  Trigger1 = Vel Y > 0 && Pos Y >= 0
  Value    = 52

;------------------------------------------------------------------------------;
; ファイヤーストーム／ストームファイヤー
;------------------------------------------------------------------------------;
[Statedef 3220]
  Type        = U
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 3220
  SprPriority = 2

[State 3220]
  Type       = StateTypeSet
  TriggerAll = Time = 0
  Trigger1   = StateType = A
  Physics    = N
  IgnoreHitPause = 1

;--------------------------[ アニメ変更 ]----------------------------;

[State 3220]
  Type       = ChangeAnim
  TriggerAll = Time = 0
  Trigger1   = StateType = A
  Value      = 3221
  IgnoreHitPause = 1

;----------------------------[ ゲージ ]------------------------------;

[State 3220]
  Type     = PowerAdd
  Trigger1 = Time = 0
  Value    = IfElse(Var(31)>0,0,-1000)
  IgnoreHitPause = 1

[State 3220]
  Type       = PowerAdd
  TriggerAll = Var(30) = 1
  Trigger1   = Var(10) = [4,5]
  Trigger1   = Time = 0
  Value      = -1000
  IgnoreHitPause = 1

;-------------------------[ 超必殺技演出 ]---------------------------;

[State 3220 : NBC, 02UM]
  Type       = Pause
  TriggerAll = Var(30) = [0,1]
  Trigger1   = Time = 0
  MoveTime   = 28
  Time       = 28
  IgnoreHitPause = 1

[State 3220 : XI, ARRANGE]
  Type       = Pause
  TriggerAll = Var(30) = [2,5]
  Trigger1   = Time = 0
  MoveTime   = 30
  Time       = 30
  IgnoreHitPause = 1

[State 3220 : NBC, 02UM]
  Type       = AssertSpecial
  TriggerAll = Var(30) = [0,1]
  Trigger1   = Time = [0,28]
  Flag       = NoFG
  Flag2      = NoBG
  Flag3      = NoBarDisplay
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3220 : XI, ARRANGE]
  Type       = AssertSpecial
  TriggerAll = Var(30) = [2,5]
  Trigger1   = Time = [0,30]
  Flag       = NoFG
  Flag2      = NoBG
  Flag3      = NoBarDisplay
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3220 : 超必エフェクト(NBC)]
  Type        = Explod
  TriggerAll  = Var(30) = 0
  Trigger1    = Time = 0
  Anim        = 7000
  Pos         = 12, -87
  SprPriority = 10
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3220 : 超必エフェクト1-1(02UM)]
  Type        = Explod
  TriggerAll  = Var(30) = 1
  Trigger1    = Time = 2
  Anim        = 7010
  Pos         = 12, -87
  SprPriority = -3
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3220 : 超必エフェクト1-2(02UM)]
  Type        = Explod
  TriggerAll  = Var(30) = 1
  Trigger1    = Time = 12
  Anim        = 7011
  Pos         = 12, -87
  SprPriority = 10
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3220 : 超必エフェクト1-1(XI)]
  Type        = Explod
  TriggerAll  = Var(30) = [2,5]
  Trigger1    = Time = 0
  Anim        = 7020
  Pos         = 12, -87
  SprPriority = -3
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3220 : 超必エフェクト1-2(XI)]
  Type        = Explod
  TriggerAll  = Var(30) = [2,5]
  Trigger1    = Time = 0
  Anim        = 7021
  Pos         = 12, -87
  SprPriority = 10
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;--------------------------[ キャンセル ]----------------------------;

[State 3220 : スーパーキャンセル（NBC）]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = 4
  Trigger1   = Var(30) = 0
  Time       = 5
  Add        = 30,0,12
  Mul        = 180,0,60
  IgnoreHitPause = 1

[State 3220]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [4,5]
  Trigger1   = Var(30) = [1,5]
  Time       = 5
  Add        = 230,230,230
  IgnoreHitPause = 1

[State 3220 : SC(NBC), 1]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = 4
  Trigger1    = Var(30) = 0
  Anim        = 7100
  ID          = 7100
  Pos         = 10, 60
  PosType     = Left
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  Scale       = 0.5,0.5
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3220 : SC(NBC), 2]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = 4
  Trigger1    = Var(30) = 0
  Anim        = 7101
  ID          = 7100
  Pos         = 10, 60
  PosType     = Left
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  Scale       = 0.5,0.5
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3220 : SC(XI), 1]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = [4,5]
  Trigger1    = Var(30) = [2,5]
  Anim        = 7120
  SprPriority = 50
  PosType     = Left
  Pos         = 0, 80
  BindTime    = -1
  scale       = 0.5, 0.5
  under       = 0
  OwnPal      = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3220 : SC(XI), 2]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = [4,5]
  Trigger1    = Var(30) = [2,5]
  Anim        = 7121
  SprPriority = 51
  PosType     = Right
  Pos         = 0, 78
  BindTime    = -1
  under       = 0
  OwnPal      = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3220 : SC(XI), 3]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = [4,5]
  Trigger1    = Var(30) = [2,5]
  Anim        = 7122
  SprPriority = 49
  PosType     = Left
  Pos         = 0, 74
  BindTime    = -1
  under       = 0
  OwnPal      = 1
  Trans       = AddAlpha
  Alpha       = 340-120,120
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;---------------------------[ 変数定義 ]-----------------------------;

[State 3220]
  Type       = VarSet
  TriggerAll = Time = 0
  Trigger1   = Var(31) > 0
  V          = 31
  Value      = 0
  IgnoreHitPause = 1

[State 3220]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 3220 : ボタン判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 24
  Value    = 0
  IgnoreHitPause = 1

[State 3220 : ボタン判定]
  Type       = VarSet
  TriggerAll = Time = 0
  Trigger1   = NumHelper(3250) = 1
  Trigger1   = Command = "y"
  Trigger2   = NumHelper(3260) = 1
  Trigger2   = Command = "x"
  V          = 24
  Value      = IfElse(Command = "x",6,5)
  IgnoreHitPause = 1

;---------------------------[ サウンド ]-----------------------------;

[State 3220]
  Type     = PlaySnd
  Trigger1 = Time = 0
  Value    = s7000, IfElse(Var(30)>= 2,20,Var(30)*10)

[State 3220]
  Type     = PlaySnd
  Trigger1 = AnimElem = 3
  Value    = s3200, 3

;---------------------------[ 移動関連 ]-----------------------------;

[State 3220]
  Type       = VelAdd
  TriggerAll = Anim = 3221
  Trigger1   = AnimElem = 5, >= 0
  Y          = 0.47

;---------------------------[ ヘルパー ]-----------------------------;

[State 3220]
  Type        = Helper
  TriggerAll  = Var(24) = 5
  Trigger1    = AnimElem = 4
  Trigger1    = NumHelper(3250) = 1
  Trigger1    = NumHelper(3260) = 0
  Name        = "Kaze"
  StateNo     = 3260
  ID          = 3260
  HelperType  = Normal
  Pos         = 60, 0
  PosType     = P1
  Facing      = 1
  KeyCtrl     = 0
  OwnPal      = 1
  SprPriority = 6
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999


[State 3220]
  Type        = Helper
  TriggerAll  = Var(24) = 6
  Trigger1    = AnimElem = 3
  Trigger1    = NumHelper(3260) = 1
  Trigger1    = NumHelper(3250) = 0
  Name        = "Honoo"
  StateNo     = 3250
  ID          = 3250
  HelperType  = Normal
  Pos         = 30, -100
  PosType     = P1
  Facing      = 1
  KeyCtrl     = 0
  OwnPal      = 1
  SprPriority = 6
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;-------------------------[ ステート変更 ]---------------------------;

[State 3220]
  Type     = ChangeState
  Trigger1 = Anim = 3220
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

[State 3220]
  Type     = ChangeState
  Trigger1 = Anim = 3221
  Trigger1 = Vel Y > 0 && Pos Y >= 0
  Value    = 52

;------------------------------------------------------------------------------;
; 炎の杖ヘルパー
;------------------------------------------------------------------------------;
[Statedef 3250]
  Type        = A
  MoveType    = A
  Physics     = N
  Juggle      = 0
  PowerAdd    = 0
  VelSet      = 0, 0
  Anim        = 3250
  Ctrl        = 0
  SprPriority = 10

[State 3250 : 相手の特定の攻撃属性無効]
  Type     = NotHitBy
  Trigger1 = 1
  Value    = SCA

[State 3250]
  Type     = AssertSpecial
  Trigger1 = 1
  Flag     = NoShadow
  Flag2    = NoAutoTurn
  IgnoreHitPause = 1

;---------------------------[ 変数定義 ]-----------------------------;

[State 3250]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 24
  Value    = Root,Var(24)
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3250]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 25
  Value    = 0
  IgnoreHitPause = 1

[State 3250 : フライングファイヤーのヒット判定]
  Type       = VarSet
  TriggerAll = MoveContact
  Trigger1   = Var(24) = 3
  V          = 25
  Value      = 1
  IgnoreHitPause = 1

[State 3250 : ヒット数カウント]
  Type       = ParentVarAdd
  TriggerAll = Var(24) = 1
  Trigger1   = MoveContact
  V          = 2
  Value      = 1
  IgnoreHitPause = 1

[State 3250 : ヒット数カウント]
  Type       = ParentVarAdd
  TriggerAll = Var(24) = 3
  Trigger1   = MoveContact
  V          = 2
  Value      = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 3250 : キャラ本体に引っ付く位置]
  Type     = BindToParent
  Trigger1 = Var(24) = 1
  Pos      = 30, -60

[State 3250 : キャラ本体に引っ付く位置]
  Type     = BindToParent
  Trigger1 = Time = 0
  Trigger1 = Var(24) = 6
  Pos      = 30, -100

;---------------------------[ サウンド ]-----------------------------;

[State 3250 : SE]
  Type       = PlaySnd
  TriggerAll = Time = 0
  Trigger1   = Var(24) = 1
  Value      = s3205, 0

[State 3250 : SE]
  Type       = PlaySnd
  TriggerAll = Time = 0
  Trigger1   = Var(24) = 5
  Value      = s3205, 1

;--------------------------[ エフェクト ]----------------------------;

[State 3250]
  Type     = RemoveExplod
  Trigger1 = Time = 0
  ID       = 3250
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3250]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(24) = 1
  Trigger2    = Var(24) = 3
  Trigger3    = Var(24) = [5,6]
  Anim        = 3205
  ID          = 3250
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  RemoveTime  = -1
  OwnPal      = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3250]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(24) = 5
  Anim        = 3206
  ID          = 3250
  Pos         = 0, 20
  PosType     = P1
  SprPriority = 4
  OwnPal      = 1
  Scale       = 0.5,0.5
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;---------------------------[ 移動関連 ]-----------------------------;

[State 3250 : 移動速度]; Flying Fire
  Type     = VelSet
  Trigger1 = Var(24) = 3
  X        = 5.5

[State 3250 : 移動速度]
  Type       = VelSet
  TriggerAll = Var(24) = 3
  Trigger1   = AnimElem = 1, >= 0 && AnimElem = 6, < 0
  Trigger2   = AnimElem = 16, >= 0 && AnimElem = 26, < 0
  Trigger3   = AnimElem = 36, >= 0 && AnimElem = 46, < 0
  Trigger4   = AnimElem = 56, >= 0 && AnimElem = 66, < 0
  Y          = -2.5

[State 3250 : 移動速度]
  Type       = VelSet
  TriggerAll = Var(24) = 3
  Trigger1   = AnimElem = 6, >= 0 && AnimElem = 16, < 0
  Trigger2   = AnimElem = 26, >= 0 && AnimElem = 36, < 0
  Trigger3   = AnimElem = 46, >= 0 && AnimElem = 56, < 0
  Trigger4   = AnimElem = 66, >= 0 && AnimElem = 76, < 0
  Y          = 2.5

[State 3250 : 移動速度]
  Type       = VelAdd
  TriggerAll = Var(24) = 3
  Trigger1   = AnimElem = 1, >= 0 && AnimElem = 6, < 0
  Trigger2   = AnimElem = 16, >= 0 && AnimElem = 26, < 0
  Trigger3   = AnimElem = 36, >= 0 && AnimElem = 46, < 0
  Trigger4   = AnimElem = 56, >= 0 && AnimElem = 66, < 0
  Y          = 0.1

[State 3250 : 移動速度]
  Type       = VelAdd
  TriggerAll = Var(24) = 3
  Trigger1   = AnimElem = 6, >= 0 && AnimElem = 16, < 0
  Trigger2   = AnimElem = 26, >= 0 && AnimElem = 36, < 0
  Trigger3   = AnimElem = 46, >= 0 && AnimElem = 56, < 0
  Trigger4   = AnimElem = 66, >= 0 && AnimElem = 76, < 0
  Y          = -0.1

;--------------------------[ ヒット定義 ]----------------------------;

[State 3250]
  Type             = HitDef
  TriggerAll       = Var(24) = 1
  Trigger1         = Time = 0
  Trigger2         = AnimElem = 16
  Trigger3         = AnimElem = 31
  Trigger4         = AnimElem = 46
  Trigger5         = AnimElem = 61
  Trigger6         = AnimElem = 76
  Attr             = A, HP
  Damage           = IfElse(Root,Var(3)=0,IfElse(Floor(60*Root,FVar(5))<1,1,Floor(60*Root,FVar(5))),70),0
  getpower = 6,3
  AnimType         = Hard
  HitFlag          = MAFP
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 0, 10
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -10, 0
  HitSound         = s1005,4
  GuardSound       = s120,IfElse(Root,Var(30)>=2,2,Root,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 22
  Ground.HitTime   = 23
  Ground.Velocity  = -5
  Air.Velocity     = -2.5,-6.5
  Air.Type         = High
  Air.HitTime      = 12
  Air.Fall         = 1
  Fall.Recover     = 0
  PalFx.Time       = 60
  PalFx.Add        = 30,-40,-140
  PalFx.SinAdd     = 60,60,50,10
  PalFx.Color      = 0
  PalFx.Invertall  = 1
  Ground.CornerPush.VelOff = 0
  Air.CornerPush.VelOff    = 0

[State 3250 : Flying Fire]
  Type             = HitDef
  TriggerAll       = Var(24) = 3
  Trigger1         = Time = 0
  Attr             = A, HP
  Damage           = IfElse(Root,Var(3)=0,IfElse(Floor(220*Root,FVar(5))<1,1,Floor(220*Root,FVar(5))),230),0
  getpower = 6,3
  AnimType         = Hard
  HitFlag          = MAFP
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 0, 15
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -10, 0
  HitSound         = s1005,4
  GuardSound       = s120,IfElse(Root,Var(30)>=2,2,Root,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 20
  Ground.HitTime   = 21
  Ground.Velocity  = -5
  Air.Velocity     = -5,-6.5
  Air.Type         = High
  Air.HitTime      = 12
  Air.Fall         = 1
  Fall.Recover     = 0
  PalFx.Time       = 60
  PalFx.Add        = 30,-40,-140
  PalFx.SinAdd     = 60,60,50,10
  PalFx.Color      = 0
  PalFx.Invertall  = 1
  Ground.CornerPush.VelOff = 0
  Air.CornerPush.VelOff    = 0

[State 3250]
  Type     = MoveHitReset
  Trigger1 = MoveContact
  IgnoreHitPause = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 3250]
  Type       = ChangeState
  TriggerAll = Var(24) = 1
  Trigger1   = Root, StateNo = 3210
  Trigger2   = Root, StateNo = 3220
  Value      = 3250

[State 3250]
  Type       = ChangeState
  TriggerAll = Var(24) = 1
  Trigger1   = AnimTime = 0
  Trigger2   = Root,StateNo = 800
  Trigger3   = Root,StateNo = [1200,1450]
  Trigger4   = Root,StateNo = [1550,1560]
  Trigger5   = (Root,StateNo = [3000,3100]) || (Root,StateNo = [3300,3500])
  Value      = 3255

[State 3250]
  Type     = ChangeState
  Trigger1 = Var(24) = 3
  Trigger1 = Var(25) = 1
  Trigger2 = Var(24) = 3
  Trigger2 = (ScreenPos X != [0,320]) || (ScreenPos Y != [0,240])
  Trigger3 = Var(24) = 5
  Trigger3 = Time = 12
  Trigger4 = Var(24) = 6
  Trigger4 = Time = 0
  Value    = 3255

;------------------------------------------------------------------------------;
; 炎の杖ヘルパー（削除）
;------------------------------------------------------------------------------;
[Statedef 3255]
  Type        = A
  MoveType    = I
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 3215
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 3255]
  Type       = ParentVarSet
  TriggerAll = Time = 0
  Trigger1   = Var(24) = 1
  Trigger2   = Var(24) = 3
  V          = 24
  Value      = 0
  IgnoreHitPause = 1

;--------------------------[ アニメ変更 ]----------------------------;

[State 3255]
  Type     = ChangeAnim
  Trigger1 = Time = 0
  Trigger1 = Var(24) = [5,6]
  Value    = 3205
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;---------------------------[ サウンド ]-----------------------------;

[State 3255]
  Type       = PlaySnd
  TriggerAll = Time = 0
  Trigger1   = Var(24) = 1
  Trigger2   = Var(24) = 3
  Value      = s3205, 2

;--------------------------[ エフェクト ]----------------------------;

[State 3255]
  Type     = RemoveExplod
  Trigger1 = Time = 0
  ID       = 3250
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3255 : フェードアウト]
  Type     = Trans
  Trigger1 = Var(24) = [5,6]
  trans    = addalpha
  alpha    = 256-Time*8, Time*8
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;---------------------------[ 移動関連 ]-----------------------------;

[State 3255 : 移動速度]; Flying Fire
  Type     = VelSet
  Trigger1 = Var(24) = 3
  X        = 5.5

[State 3255 : 移動速度]; Fire Storm/Storm Fire
  Type     = VelSet
  Trigger1 = Var(24) = [5,6]
  Y        = 1.5

;-------------------------[ ステート変更 ]---------------------------;

[State 3255 : このヘルパーを消す]
  Type     = DestroySelf
  Trigger1 = Var(24) = 1 || Var(24) = 3
  Trigger1 = AnimTime = 0
  Trigger2 = Var(24) = [5,6]
  Trigger2 = Time >= 32

;------------------------------------------------------------------------------;
; 風の杖ヘルパー
;------------------------------------------------------------------------------;
[Statedef 3260]
  Type        = A
  MoveType    = A
  Physics     = N
  Juggle      = 0
  PowerAdd    = 0
  VelSet      = 0, 0
  Anim        = 3250
  Ctrl        = 0
  SprPriority = 10

[State 3260 : 相手の特定の攻撃属性無効]
  Type     = NotHitBy
  Trigger1 = 1
  Value    = SCA

[State 3260]
  Type     = AssertSpecial
  Trigger1 = 1
  Flag     = NoShadow
  Flag2    = NoAutoTurn
  IgnoreHitPause = 1

;---------------------------[ 変数定義 ]-----------------------------;

[State 3260]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 24
  Value    = Root,Var(24)
  IgnoreHitPause = 1

[State 3260]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 25
  Value    = 0
  IgnoreHitPause = 1

[State 3260 : フライングハリケーンのヒット判定]
  Type     = VarAdd
  Trigger1 = MoveContact
  V        = 25
  Value    = 1
  IgnoreHitPause = 1

[State 3260 : ヒット数カウント]
  Type       = ParentVarAdd
  TriggerAll = Var(24) = 2 || Var(24) = 4
  Trigger1   = MoveContact
  V          = 2
  Value      = 1
  IgnoreHitPause = 1

[State 3260 : ヒット数カウント]
  Type       = ParentVarAdd
  TriggerAll = Var(24) = [5,6]
  Trigger1   = MoveContact
  V          = 2
  Value      = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 3260 : キャラ本体に引っ付く位置]
  Type     = BindToParent
  Trigger1 = Var(24) = 2
  Pos      = 30, -60

;--------------------------[ アニメ変更 ]----------------------------;

[State 3260]
  Type     = ChangeAnim
  Trigger1 = Time = 0
  Trigger1 = Var(24) = [5,6]
  Value    = 3260

;---------------------------[ サウンド ]-----------------------------;

[State 3260 : SE]
  Type       = PlaySnd
  TriggerAll = Time = 0
  Trigger1   = Var(24) = 2
  Value      = s3205, 1

;--------------------------[ エフェクト ]----------------------------;

[State 3260]
  Type     = RemoveExplod
  Trigger1 = Time = 0
  ID       = 3260
  IgnoreHitPause = 1

[State 3260]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(24) = 2
  Trigger2    = Var(24) = 4
  Trigger3    = Var(24) = 6
  Anim        = 3206
  ID          = 3260
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  RemoveTime  = -1
  OwnPal      = 1
  Scale       = 0.5,0.5
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3260]
  Type     = RemoveExplod
  Trigger1 = Var(24) = 6
  Trigger1 = Time = 25
  ID       = 3260
  IgnoreHitPause = 1
  Persistent     = 0

[State 3260]
  Type        = Explod
  TriggerAll  = NumExplod(3260) = 0
  Trigger1    = Time = 0
  Trigger1    = Var(24) = 5
  Trigger2    = Time = 25
  Trigger2    = Var(24) = 6
  Anim        = 3265
  ID          = 3260
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;---------------------------[ 移動関連 ]-----------------------------;

[State 3260 : 移動速度]
  Type     = PosSet
  Trigger1 = Var(24) = 6
  Trigger1 = Time = 25
  Y        = Root,Pos Y

[State 3260 : 移動速度]
  Type     = VelSet
  Trigger1 = Var(24) = 4
  X        = 6

[State 3260 : 移動速度]
  Type     = VelSet
  Trigger1 = Time >= 25
  Trigger1 = Var(24) = 6
  X        = 6.5

;--------------------------[ ヒット定義 ]----------------------------;

[State 3260]
  Type             = HitDef
  TriggerAll       = Var(24) = 2
  Trigger1         = Time = 0
  Trigger2         = AnimElem = 16
  Trigger3         = AnimElem = 31
  Trigger4         = AnimElem = 46
  Trigger5         = AnimElem = 61
  Trigger6         = AnimElem = 76
  Attr             = A, HP
  Damage           = IfElse(Root,Var(3)=0,IfElse(Floor(60*Root,FVar(5))<1,1,Floor(60*Root,FVar(5))),70),0
  getpower = 6,3
  AnimType         = Hard
  HitFlag          = MAFP
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 0, 10
  SparkNo          = s6101
  Guard.SparkNo    = s6402
  SparkXY          = -10, 0
  HitSound         = s4,IfElse(Root,Var(30)>=2,2,Root,Var(30))*10+1
  GuardSound       = s120,IfElse(Root,Var(30)>=2,2,Root,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 22
  Ground.HitTime   = 23
  Ground.Velocity  = -5
  Air.Velocity     = -5,-6.5
  Air.Type         = High
  Air.HitTime      = 12
  Air.Fall         = 1
  Fall.Recover     = 0
  Ground.CornerPush.VelOff = 0
  Air.CornerPush.VelOff    = 0

[State 3260 : フライングハリケーン]
  Type             = HitDef
  TriggerAll       = Var(24) = 4
  Trigger1         = Time%6 = 0
  Trigger1         = Var(25) < 3
  Attr             = A, HP
  Damage           = IfElse(Root,Var(3)=0,IfElse(Floor(60*Root,FVar(5))<1,1,Floor(60*Root,FVar(5))),70),0
  getpower = 6,3
  AnimType         = DiagUp
  HitFlag          = MAFP
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 0, 9
  SparkNo          = s6101
  Guard.SparkNo    = s6402
  SparkXY          = -10, 0
  HitSound         = s4,IfElse(Root,Var(30)>=2,2,Root,Var(30))*10+1
  GuardSound       = s120,IfElse(Root,Var(30)>=2,2,Root,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 22
  Ground.HitTime   = 23
  Ground.Velocity  = -1.5
  Air.Velocity     = -1.5,-14
  Air.Type         = High
  Air.HitTime      = 12
  Fall             = 1
  Fall.Recover     = 0
  YAccel           = 0.52
  Ground.CornerPush.VelOff = 0
  Air.CornerPush.VelOff    = 0

[State 3260 : ファイヤーストーム／ストームファイヤー]
  Type             = HitDef
  TriggerAll       = Var(24) = [5,6]
  Trigger1         = Time%4 = 0
  Trigger1         = Var(25) < 5
  Attr             = A, HP
  Damage           = IfElse(Root,Var(3)=0,IfElse(Floor(60*Root,FVar(5))<1,1,Floor(60*Root,FVar(5))),70),0
  getpower = 6,3
  AnimType         = DiagUp
  HitFlag          = MAFP
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 0, 11
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -10, -55
  HitSound         = s1005,4
  GuardSound       = s120,IfElse(Root,Var(30)>=2,2,Root,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 22
  Ground.HitTime   = 23
  Ground.Velocity  = 0
  Air.Velocity     = 0, -15
  Air.Type         = High
  Air.HitTime      = 12
  Fall             = 1
  Fall.Recover     = 0
  YAccel           = 0.48
  PalFx.Time       = 60
  PalFx.Add        = 30,-40,-140
  PalFx.SinAdd     = 60,60,50,10
  PalFx.Color      = 0
  PalFx.Invertall  = 1
  Ground.CornerPush.VelOff = 0
  Air.CornerPush.VelOff    = 0

[State 3260]
  Type     = MoveHitReset
  Trigger1 = MoveContact
  IgnoreHitPause = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 3260]
  Type       = ChangeState
  TriggerAll = Var(24) = 2
  Trigger1   = Root, StateNo = 3210
  Trigger2   = Root, StateNo = 3220
  Value      = 3260

[State 3260]
  Type       = ChangeState
  TriggerAll = Var(24) = 2
  Trigger1   = AnimTime = 0
  Trigger2   = Root,StateNo = 800
  Trigger3   = Root,StateNo = [1200,1450]
  Trigger4   = Root,StateNo = [1550,1560]
  Trigger5   = (Root,StateNo = [3000,3100]) || (Root,StateNo = [3300,3500])
  Trigger6   = Root,MoveType = H
  Value      = 3265

[State 3260]
  Type     = ChangeState
  Trigger1 = Var(24) = 4 || Var(24) = 6
  Trigger1 = (ScreenPos X != [0,320]) || (ScreenPos Y != [0,240])
  Trigger2 = Var(24) = 5
  Trigger2 = AnimTime = 0
  Value    = 3265

;------------------------------------------------------------------------------;
; 風の杖ヘルパー（削除）
;------------------------------------------------------------------------------;
[Statedef 3265]
  Type        = A
  MoveType    = I
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 9999
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 3265]
  Type       = ParentVarSet
  TriggerAll = Time = 0
  Trigger1   = Var(24) = 2
  Trigger2   = Var(24) = 4
  Trigger3   = Var(24) = [5,6]
  V          = 24
  Value      = 0
  IgnoreHitPause = 1

;--------------------------[ アニメ変更 ]----------------------------;

[State 3265]
  Type     = Null;ChangeAnim
  Trigger1 = Time = 0
  Trigger1 = Var(24) = 2
  Value    = 3206

;--------------------------[ エフェクト ]----------------------------;

[State 3265]
  Type     = RemoveExplod
  Trigger1 = Time = 0
  ID       = 3260
  IgnoreHitPause = 1

[State 3260]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(24) = 2
  Anim        = 3206
  ID          = 3260
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  Scale       = 0.5,0.5
  IgnoreHitPause = 1
  SuperMoveTime = 999999
  PauseMoveTime = 999999

[State 3265 : フェードアウト]
  Type     = Trans
  Trigger1 = Var(24) = 2
  Trigger2 = Var(24) = [5,6]
  trans    = addalpha
  alpha    = 256-Time*8, Time*8

;---------------------------[ 移動関連 ]-----------------------------;

[State 3265 : 移動速度]
  Type     = VelSet
  Trigger1 = Var(24) = 4
  X        = 6

[State 3265 : 移動速度]
  Type     = VelSet
  Trigger1 = Var(24) = 6
  X        = 6.5

;-------------------------[ ステート変更 ]---------------------------;

[State 3265 : このヘルパーを消す]
  Type     = DestroySelf
  Trigger1 = Var(24) = 2
  Trigger1 = NumExplod(3260) = 0
  Trigger2 = Var(24) = 5
  Trigger2 = Time = 0
  Trigger3 = Var(24) = 4 || Var(24) = 6
  Trigger3 = (ScreenPos X != [0,320]) || (ScreenPos Y != [0,240])

;------------------------------------------------------------------------------;
; ペガサス☆ファンタジー
;------------------------------------------------------------------------------;
[Statedef 3300]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 3300
  SprPriority = 2

;----------------------------[ ゲージ ]------------------------------;

[State 3300]
  Type       = PowerAdd
  TriggerAll = Var(30) = [0,1]
  Trigger1   = Time = 0
  Value      = IfElse(Var(31)>0,-1000,-3000)
  IgnoreHitPause = 1

[State 3300]
  Type       = PowerAdd
  TriggerAll = Var(30) = [2,5]
  Trigger1   = Time = 0
  Value      = IfElse(Var(31)>0,-1000,-2000)
  IgnoreHitPause = 1

[State 3300]
  Type       = PowerAdd
  TriggerAll = Var(30) = 1
  Trigger1   = Var(10) = [4,5]
  Trigger1   = Time = 0
  Value      = -1000
  IgnoreHitPause = 1

;-------------------------[ 超必殺技演出 ]---------------------------;

[State 3300 : NBC, 02UM]
  Type       = Pause
  TriggerAll = Var(30) = [0,1]
  Trigger1   = Time = 0
  MoveTime   = 28
  Time       = 28
  IgnoreHitPause = 1

[State 3300 : XI, ARRANGE]
  Type       = Pause
  TriggerAll = Var(30) = [2,5]
  Trigger1   = Time = 0
  MoveTime   = 30
  Time       = 30
  IgnoreHitPause = 1

[State 3300 : NBC, 02UM]
  Type       = AssertSpecial
  TriggerAll = Var(30) = [0,1]
  Trigger1   = Time = [0,28]
  Flag       = NoFG
  Flag2      = NoBG
  Flag3      = NoBarDisplay
  IgnoreHitPause = 1

[State 3300 : XI, ARRANGE]
  Type       = AssertSpecial
  TriggerAll = Var(30) = [2,5]
  Trigger1   = Time = [0,30]
  Flag       = NoFG
  Flag2      = NoBG
  Flag3      = NoBarDisplay
  IgnoreHitPause = 1

[State 3300 : 超必エフェクト(NBC)]
  Type        = Explod
  TriggerAll  = Var(30) = 0
  Trigger1    = Time = 0
  Anim        = 7000
  Pos         = 12, -87
  SprPriority = 10
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3300 : 超必エフェクト3-1(02UM)]
  Type        = Explod
  TriggerAll  = Var(30) = 1
  Trigger1    = Time = 2
  Anim        = 7018
  Pos         = 12, -87
  SprPriority = -3
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3300 : 超必エフェクト3-2(02UM)]
  Type        = Explod
  TriggerAll  = Var(30) = 1
  Trigger1    = Time = 12
  Anim        = 7019
  Pos         = 12, -87
  SprPriority = 10
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3300 : 超必エフェクト1-1(XI)]
  Type        = Explod
  TriggerAll  = Var(30) = [2,5]
  Trigger1    = Time = 0
  Anim        = 7025
  Pos         = 12, -87
  SprPriority = -3
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3300 : 超必エフェクト1-2(XI)]
  Type        = Explod
  TriggerAll  = Var(30) = [2,5]
  Trigger1    = Time = 0
  Anim        = 7026
  Pos         = 12, -87
  SprPriority = 10
  OwnPal      = 1
  BindTime    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3300 : カットイン, 1]
  Type        = Explod
  TriggerAll  = Var(30) = 1 || Var(30) = 5
  Trigger1    = Time = 2
  Anim        = 7600
  Pos         = IfElse(Facing=1,-320,320),0
  OwnPal      = 1
  PosType     = Front
  BindTime    = -1
  SprPriority = -15
  Facing      = ifelse(Facing=-1,-1,1)
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3300 : カットイン, 2]
  Type        = Explod
  TriggerAll  = Var(30) = 1 || Var(30) = 5
  Trigger1    = Time = 2
  Anim        = 7610
  Pos         = IfElse(Facing=1,-320,320),0
  OwnPal      = 1
  PosType     = Front
  BindTime    = -1
  SprPriority = -10
  Facing      = ifelse(Facing=-1,-1,1)
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;--------------------------[ キャンセル ]----------------------------;

[State 3300 : スーパーキャンセル（NBC）]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = 4
  Trigger1   = Var(30) = 0
  Time       = 5
  Add        = 30,0,12
  Mul        = 180,0,60
  IgnoreHitPause = 1

[State 3300]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [4,5]
  Trigger1   = Var(30) = [1,5]
  Time       = 5
  Add        = 230,230,230
  IgnoreHitPause = 1

[State 3300 : SC(NBC), 1]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = 4
  Trigger1    = Var(30) = 0
  Anim        = 7100
  ID          = 7100
  Pos         = 10, 60
  PosType     = Left
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  Scale       = 0.5,0.5
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3300 : SC(NBC), 2]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = 4
  Trigger1    = Var(30) = 0
  Anim        = 7101
  ID          = 7100
  Pos         = 10, 60
  PosType     = Left
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  Scale       = 0.5,0.5
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3300 : SC(XI), 1]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = [4,5]
  Trigger1    = Var(30) = [2,5]
  Anim        = 7120
  SprPriority = 50
  PosType     = Left
  Pos         = 0, 80
  BindTime    = -1
  scale       = 0.5, 0.5
  under       = 0
  OwnPal      = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3300 : SC(XI), 2]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = [4,5]
  Trigger1    = Var(30) = [2,5]
  Anim        = 7121
  SprPriority = 51
  PosType     = Right
  Pos         = 0, 78
  BindTime    = -1
  under       = 0
  OwnPal      = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3300 : SC(XI), 3]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = [4,5]
  Trigger1    = Var(30) = [2,5]
  Anim        = 7122
  SprPriority = 49
  PosType     = Left
  Pos         = 0, 74
  BindTime    = -1
  under       = 0
  OwnPal      = 1
  Trans       = AddAlpha
  Alpha       = 340-120,120
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3300 : ドリームキャンセル(DC), 1]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = 7
  Trigger1    = Var(30) = 2
  Anim        = 7125
  SprPriority = 50
  PosType     = Left
  Pos         = 0, 80
  BindTime    = -1
  scale       = 0.5, 0.5
  under       = 0
  OwnPal      = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3300 : DC, 2]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = 7
  Trigger1    = Var(30) = 2
  Anim        = 7126
  SprPriority = 51
  PosType     = Right
  Pos         = 0, 78
  BindTime    = -1
  under       = 0
  OwnPal      = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3400 : DC, 3]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = 7
  Trigger1    = Var(30) = 2
  Anim        = 7127
  SprPriority = 49
  PosType     = Left
  Pos         = 0, 74
  BindTime    = -1
  under       = 0
  OwnPal      = 1
  Trans       = AddAlpha
  Alpha       = 340-120, 120
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;---------------------------[ 変数定義 ]-----------------------------;

[State 3300]
  Type       = VarSet
  TriggerAll = Time = 0
  Trigger1   = Var(31) > 0
  V          = 31
  Value      = 0
  IgnoreHitPause = 1

[State 3300 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 3300 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

;---------------------------[ サウンド ]-----------------------------;

[State 3300 : SE]
  Type       = PlaySnd
  TriggerAll = Var(30) = 0
  Trigger1   = Time = 0
  Value      = s7000, 0

[State 3300 : SE]
  Type       = PlaySnd
  TriggerAll = Var(30) = 1
  Trigger1   = Time = 0
  Value      = s7000, 12

[State 3300 : SE]
  Type       = PlaySnd
  TriggerAll = Var(30) = [2,5]
  Trigger1   = Time = 0
  Value      = s7000, 21

[State 3300 : Voice]
  Type     = PlaySnd
  Trigger1 = Time = 0
  Value    = s3300, 0

[State 3300 : SE]
  Type     = PlaySnd
  Trigger1 = Time = 0
  Value    = s3305, 0

;---------------------------[ 移動関連 ]-----------------------------;

[State 3300 : 移動速度]
  Type     = VelSet
  Trigger1 = Time >= 45
  X        = 12

[State 3300 : 軸]
  Type     = PosSet
  Trigger1 = Time = 45
  Y        = -70

;--------------------------[ ヒット定義 ]----------------------------;

[State 3300]
  Type             = HitDef
  Trigger1         = AnimElem = 11
  Trigger2         = AnimElem = 12
  Trigger3         = AnimElem = 13
  Attr             = S, HA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(40*FVar(5))<1,1,Floor(40*FVar(5))),50),10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 10, 11
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -10, -65
  HitSound         = s2, IfElse(Var(30)>=2,21,IfElse(Var(30)=1,11,Var(1)%3+3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 20
  Ground.HitTime   = 21
  Ground.Velocity  = -5, -5.5
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -5, -5.5
  Ground.CornerPush.VelOff = 0
  Air.CornerPush.VelOff    = 0

[State 3300]
  Type     = MoveHitReset
  Trigger1 = MoveContact
  IgnoreHitPause = 1

;---------------------------[ ヘルパー ]-----------------------------;

[State 3300]
  Type        = Helper
  Trigger1    = AnimElem = 14
  Name        = "Pegasus"
  StateNo     = 3350
  ID          = 3350
  HelperType  = Normal
  Pos         = 0, 0
  PosType     = P1
  Facing      = 1
  KeyCtrl     = 0
  OwnPal      = 1
  SprPriority = 6
  IgnoreHitPause =1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;--------------------------[ エフェクト ]----------------------------;

[State 3300]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 3305
  ID          = 3300
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  Shadow      = 192,192,192
  IgnoreHitPause = 0
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3300]
  Type        = Explod
  Trigger1    = AnimElem = 14, >= 0
  Trigger1    = NumHelper(3350) = 0
  Anim        = 3335
  ID          = 3300
  Pos         = 70, 20
  PosType     = P1
  SprPriority = 3
  IgnoreHitPause = 1
  Persistent     = 0
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;-------------------------[ ステート変更 ]---------------------------;

[State 3300]
  Type     = ChangeState
  Trigger1 = AnimElem = 14, >= 0
  Trigger1 = NumHelper(3350) = 0
  Value    = 3310

;------------------------------------------------------------------------------;
; ペガサス☆ファンタジー（終了）
;------------------------------------------------------------------------------;
[Statedef 3310]
  Type        = A
  MoveType    = A
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = -5, -3
  Ctrl        = 0
  Anim        = 3310
  SprPriority = 2

[State 3310]
  Type      = StateTypeSet
  Trigger1  = Anim = 3320
  StateType = S
  Physics   = S

;---------------------------[ 移動関連 ]-----------------------------;

[State 3310 : 移動速度]
  Type     = VelAdd
  Trigger1 = Anim = 3310
  X        = 0.04
  Y        = 0.2

[State 3310 : 移動速度]
  Type     = VelSet
  Trigger1 = Anim = 3320
  X        = 0
  Y        = 0
  Persistent = 0

[State 3310 : 移動速度]
  Type     = PosSet
  Trigger1 = Anim = 3320
  Y        = 0
  Persistent = 0

;--------------------------[ アニメ変更 ]----------------------------;

[State 3310]
  Type     = ChangeAnim
  Trigger1 = Anim = 3310
  Trigger1 = Vel Y > 0 && Pos Y >= 0
  Value    = 3320

;---------------------------[ サウンド ]-----------------------------;

[State 3300]
  Type     = PlaySnd
  Trigger1 = Anim = 3320
  Value    = s47, 0
  Persistent = 0

;--------------------------[ エフェクト ]----------------------------;

[State 3310]
  Type        = Explod
  Trigger1    = Anim = 3310
  Trigger1    = Time = 0
  Anim        = 3315
  ID          = 3310
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  IgnoreHitPause = 1
  Persistent     = 0
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 3300]
  Type     = RemoveExplod
  Trigger1 = Vel Y > 0 && Pos Y >= 0
  ID       = 3310
  IgnoreHitPause = 1
  Persistent     = 0

[State 3310]
  Type        = Explod
  Trigger1    = Anim = 3320
  Trigger1    = NumExplod(3310) = 0
  Anim        = 3325
  ID          = 3310
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  IgnoreHitPause = 1
  Persistent     = 0
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;-------------------------[ ステート変更 ]---------------------------;

[State 3310]
  Type     = ChangeState
  Trigger1 = Anim = 3320
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; ペガサス☆ファンタジー（ヘルパー）
;------------------------------------------------------------------------------;
[Statedef 3350]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 3350
  SprPriority = 2

;--------------------------[ エフェクト ]----------------------------;

[State 3350]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 3355
  ID          = 3350
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;---------------------------[ 移動関連 ]-----------------------------;

[State 3350 : 移動速度]
  Type     = VelSet
  Trigger1 = 1
  X        = 12

;--------------------------[ ヒット定義 ]----------------------------;

[State 3350]
  Type             = HitDef
  Trigger1         = Time = 0
  Attr             = S, HA
  Damage           = IfElse(Root,Var(3)=0,IfElse(Floor(280*Root,FVar(5))<1,1,Floor(280*Root,FVar(5))),290),60
  AnimType         = DiagUp
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 11, 12
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -10, -76
  HitSound         = s2, IfElse(Root,Var(30)>=2,21,IfElse(Root,Var(30)=1,11,Root,Var(1)%3+3))
  GuardSound       = s120, IfElse(Root,Var(30)>=2,2,Root,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 22
  Ground.HitTime   = 23
  Ground.Velocity  = -5.5, -12.5
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -5.5, -12.5
  Fall             = 1
  Fall.Recover     = 0
  Ground.CornerPush.VelOff = 0
  Air.CornerPush.VelOff    = 0

;-------------------------[ ステート変更 ]---------------------------;

[State 3350 : 攻撃を受けたら消滅ステートに移動]
  Type     = HitOverRide
  Trigger1 = Time = 0
  Attr     = SCA, NT, ST, HT, NA, SA, HA, NP, SP, HP
  StateNo  = 3355
  Time     = -1

[State 3350]
  Type     = ChangeState
  Trigger1 = ScreenPos X != [0,360]
  Trigger2 = Root,StateNo != 3300
  Trigger3 = Root,MoveType = H
  Value    = 3355

[State 3350 : このヘルパーを消す]
  Type     = Null;DestroySelf
  Trigger1 = ScreenPos X != [0,360]
  Trigger2 = Root,StateNo != 3300
  Trigger3 = Root,MoveType = H

;------------------------------------------------------------------------------;
; ペガサス☆ファンタジー（削除）
;------------------------------------------------------------------------------;
[Statedef 3355]
  Type        = S
  MoveType    = I
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 9999
  SprPriority = 2

;--------------------------[ エフェクト ]----------------------------;

[State 3355]
  Type     = RemoveExplod
  Trigger1 = Time = 0
  ID       = 3350
  IgnoreHitPause = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 3350 : このヘルパーを消す]
  Type     = DestroySelf
  Trigger1 = Time = 0

