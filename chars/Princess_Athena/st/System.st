; FileName : System.st
;------------------------------------------------------------------------------;
;==============================================================================;
; システム
;==============================================================================;
;------------------------------------------------------------------------------;
; タクティカルステップ
;------------------------------------------------------------------------------;
[Statedef 4000]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 4000
  PowerAdd    = -500
  SprPriority = 2

[State 4000]
  Type     = NotHitBy
  Trigger1 = 1
  Value    = SCA

;----------------------------[ ゲージ ]------------------------------;

[State 4000]
  Type       = PowerAdd
  TriggerAll = Time = 0
  Trigger1   = prevstateno = 150
  Trigger2   = prevstateno = 151
  Trigger3   = Var(10) = [2,3]
  Value      = -500

;--------------------------[ エフェクト ]----------------------------;

[State 4000]
  Type          = AfterImage
  Trigger1      = Time = 0
  Trans         = add1
  TimeGap       = 3
  FrameGap      = 2
  Time          = 15
  Length        = 6
  PalBright     = 16,16,16
  PalContrast   = 255,255,255
  PalPostBright = 0,0,0
  PalAdd        = 0,0,0
  PalMul        = 1,1,1

[State 4000]
  Type       = Palfx
  TriggerAll = Time = 0
  Trigger1   = PrevStateNo = 150
  Trigger2   = PrevStateNo = 151
  Trigger3   = Var(10) = [2,3]
  Time       = 6
  Add        = 0,0,176
  Mul        = 0,0,176
  Color      = 1
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ 変数定義 ]-----------------------------;

[State 4000]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 4000]
  Type     = VarSet
  Trigger1 = AnimElem = 2
  V        = 10
  Value    = 1
  IgnoreHitPause = 1

;---------------------------[ サウンド ]-----------------------------;

[State 4000]
  Type     = PlaySnd
  Trigger1 = Time = 0
  Value    = s4000, 0

;---------------------------[ 移動関連 ]-----------------------------;

[State 4000]
  Type     = VelSet
  Trigger1 = AnimElem = 2, >= 0 && AnimElem = 5, < 0
  X        = 6.5

;-------------------------[ ステート変更 ]---------------------------;

[State 4000]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; ふっとばし攻撃
;------------------------------------------------------------------------------;
[Statedef 4100]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 4100
  SprPriority = 2

;--------------------------[ アニメ変更 ]----------------------------;

[State 4000]
  Type     = ChangeAnim
  Trigger1 = PrevStateNo = [150,151]
  Trigger1 = Time = 0
  Value    = 4110
  IgnoreHitPause = 1

;---------------------------[ 変数定義 ]-----------------------------;

[State 4100 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 4100 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 4100 : キャンセル判定セット]
  Type     = Null;VarSet
  Trigger1 = MoveContact
  V        = 10
  Value    = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 4100 : 追撃判定]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 11
  Value    = 60
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 4100 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 3
  Value    = s210, Var(1)%3

[State 4100 : SE : NBC]
  Type       = PlaySnd
  TriggerAll = Var(30) = 0
  Trigger1   = AnimElem = 3
  Value      = s1, 1

[State 4100 : SE : 02UM]
  Type       = PlaySnd
  TriggerAll = Var(30) = 1
  Trigger1   = AnimElem = 3
  Value      = s1, 11

[State 4100 : SE : XI, ARRANGE]
  Type       = PlaySnd
  TriggerAll = Var(30) = [2,5]
  Trigger1   = AnimElem = 3
  Value      = s1, 24

;--------------------------[ エフェクト ]----------------------------;

[State 4100]
  Type     = PalFx
  Trigger1 = PrevStateNo = [150,151]
  Trigger1 = Time = 0
  Time     = 5
  Add      = 230,230,230

[State 4100]
  Type          = AfterImage
  Trigger1      = PrevStateNo = [150,151]
  Trigger1      = Time = 0
  Time          = 38
  Trans         = Add1
  TimeGap       = 2
  FrameGap      = 2
  Length        = 5
  PalBright     = 12,12,12
  PalContrast   = 220,220,220
  PalPostBright = 0,0,0
  PalAdd        = 0,0,0
  PalMul        = 1,1,1

;--------------------------[ ヒット定義 ]----------------------------;

[State 4100]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = Anim = 4110
  Attr             = S, NA
  Damage           = 10
  GetPower         = 30,15
  GivePower        = 5,10
  AnimType         = Diagup
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 13, 14
  SparkNo          = s6001
  Guard.SparkNo    = s6401
  SparkXY          = -20, -75
  HitSound         = sIfElse(Var(30)>0,5,3), IfElse(Var(30)>=2,20,IfElse(Var(30)=1,10,Var(1)%3+3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10
  Ground.Type      = High
  Ground.SlideTime = 15
  Ground.HitTime   = 15
  Ground.Velocity  = -5, -5
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -5, -5
  Fall             = 1
  Fall.Recover     = 0
  ID               = 200
  NoChainID        = 800
  Ground.CornerPush.VelOff = 0
  Air.CornerPush.VelOff    = 0

[State 4100]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = Anim = 4100
  Trigger1         = Var(11) < 60
  Attr             = S, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(140*FVar(4))<1,1,Floor(140*FVar(4))),180),0
  GetPower         = 30,15
  GivePower        = 5,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 13, 14
  SparkNo          = s6001
  Guard.SparkNo    = s6401
  SparkXY          = -20, -75
  HitSound         = sIfElse(Var(30)>0,5,3), IfElse(Var(30)>=2,20,IfElse(Var(30)=1,10,Var(1)%3+3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10
  Ground.Type      = High
  Ground.SlideTime = 15
  Ground.HitTime   = 15
  Ground.Velocity  = -5, -5
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -5, -5
  Fall             = 1
  Fall.Recover     = 0
  NoChainID        = 800
  Ground.CornerPush.VelOff = 0
  Air.CornerPush.VelOff    = 0

;-------------------------[ ステート変更 ]---------------------------;

[State 4100]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; ふっとばし攻撃
;------------------------------------------------------------------------------;
[Statedef 4150]
  Type        = A
  MoveType    = A
  Physics     = A
  Juggle      = 0
  ;Commonly-used controllers:
  Ctrl        = 0
  Anim        = 4150
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 4150 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 4150 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 4150 : キャンセル判定セット]
  Type     = VarSet
  Trigger1 = MoveContact
  V        = 10
  Value    = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 4150 : 追撃判定]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 11
  Value    = 60
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 4150 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 3
  Value    = s210, Var(1)%3

[State 4150 : SE : NBC]
  Type       = PlaySnd
  TriggerAll = Var(30) = 0
  Trigger1   = AnimElem = 3
  Value      = s1, 1

[State 4150 : SE : 02UM]
  Type       = PlaySnd
  TriggerAll = Var(30) = 1
  Trigger1   = AnimElem = 3
  Value      = s1, 11

[State 4150 : SE : XI, ARRANGE]
  Type       = PlaySnd
  TriggerAll = Var(30) = [2,5]
  Trigger1   = AnimElem = 3
  Value      = s1, 24

;--------------------------[ ヒット定義 ]----------------------------;

[State 4150]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = PrevStateNo != [150,151]
  Trigger1         = Var(11) < 60
  Attr             = A, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(140*FVar(4))<1,1,Floor(140*FVar(4))),180),0
  getpower = 30,15
  GivePower        = 5,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 13, 14
  SparkNo          = s6001
  Guard.SparkNo    = s6401
  SparkXY          = -20, -45
  HitSound         = s1305, 1
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10
  Ground.Type      = High
  Ground.SlideTime = 15
  Ground.HitTime   = 15
  Ground.Velocity  = -5, -5
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -5, -5
  Fall             = 1
  Fall.Recover     = 0
  NoChainID        = 800

;------------------------------------------------------------------------------;
; 緊急回避（前方）
;------------------------------------------------------------------------------;
[Statedef 4200]
  Type        = S
  MoveType    = I
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 4200
  SprPriority = -2

[State 4200]
  Type     = HitBy
  Trigger1 = AnimElem = 8, <= 0
  Value    = SC, NT, ST, HT

[State 4200]
  Type     = PlayerPush
  Trigger1 = AnimElem = 1, > 0
  Value    = 0

;---------------------------[ 変数定義 ]-----------------------------;

[State 4200]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 10+Var(10)
  IgnoreHitPause = 1

;----------------------------[ ゲージ ]------------------------------;

[State 4200]
  Type       = PowerAdd
  TriggerAll = Time = 0
  Trigger1   = PrevStateNo = [150,151]
  Trigger2   = Var(30) = 1 || Var(30) = 5
  Trigger2   = Var(10)%10 = [2,3]
  Value      = -1000

;---------------------------[ サウンド ]-----------------------------;

[State 4200]
  Type     = PlaySnd
  Trigger1 = AnimElem = 2
  Value    = s195, 0
  Channel  = 4

;--------------------------[ エフェクト ]----------------------------;

[State 4200]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = PrevStateNo = [150,151]
  Trigger2   = Var(30) = 1 || Var(30) = 5
  Trigger2   = Var(10)%10 = [2,3]
  Time       = 5
  Add        = 230,230,230

[State 4200]
  Type        = AfterImage
  Trigger1    = AnimElem = 2
  Time        = 24
  Length      = 6
  TimeGap     = 2
  FrameGap    = 2
  PalBright   = 1, 1, 1
  PalContrast = 128, 128, 128
  PalAdd      = 0, 0, 0
  PalMul      = 1, 1, 1
  Trans       = Add1

;---------------------------[ 移動関連 ]-----------------------------;

[State 4200]
  Type     = VelSet
  Trigger1 = AnimElem = 2, >= 0 && AnimElem = 8, < 0
  X        = 6.5

[State 4200]
  Type     = VelSet
  Trigger1 = AnimElem = 8
  X        = 0

;-------------------------[ ステート変更 ]---------------------------;

[State 4200]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; 緊急回避（後方）
;------------------------------------------------------------------------------;
[Statedef 4250]
  Type        = S
  MoveType    = I
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 4250
  SprPriority = -2

[State 4250]
  Type     = HitBy
  Trigger1 = AnimElem = 8, <= 0
  Value    = SC, NT, ST, HT

[State 4250]
  Type     = PlayerPush
  Trigger1 = AnimElem = 1, > 0
  Value    = 0

;---------------------------[ 変数定義 ]-----------------------------;

[State 4250]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 10+Var(10)
  IgnoreHitPause = 1

;----------------------------[ ゲージ ]------------------------------;

[State 4250]
  Type       = PowerAdd
  TriggerAll = Time = 0
  Trigger1   = PrevStateNo = [150,151]
  Trigger2   = Var(30) = 1 || Var(30) = 5
  Trigger2   = Var(10)%10 = [2,3]
  Value      = -1000

;---------------------------[ サウンド ]-----------------------------;

[State 4250]
  Type     = PlaySnd
  Trigger1 = AnimElem = 2
  Value    = s195, 0
  Channel  = 4

;--------------------------[ エフェクト ]----------------------------;

[State 4250]
  Type       = PalFx
  Triggerall = Time = 0
  Trigger1   = PrevStateNo = [150,151]
  Trigger2   = Var(30) = 1 || Var(30) = 5
  Trigger2   = Var(10)%10 = [2,3]
  Time       = 5
  Add        = 230,230,230
  IgnoreHitPause = 1

[State 4250]
  Type        = AfterImage
  Trigger1    = AnimElem = 3
  Time        = 24
  Length      = 6
  TimeGap     = 2
  FrameGap    = 2
  PalBright   = 1, 1, 1
  PalContrast = 128, 128, 128
  PalAdd      = 0, 0, 0
  PalMul      = 1, 1, 1
  Trans       = Add1
  IgnoreHitPause = 1

;---------------------------[ 移動関連 ]-----------------------------;

[State 4250]
  Type     = VelSet
  Trigger1 = AnimElem = 3, >= 0 && AnimElem = 4, < 0
  X        = -5.5

[State 4250]
  Type     = VelSet
  Trigger1 = AnimElem = 8
  X        = 0

;-------------------------[ ステート変更 ]---------------------------;

[State 4250]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; MAX発動
;------------------------------------------------------------------------------;
[Statedef 4400]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 4400
  SprPriority = 2

;--------------------------[ アニメ変更 ]----------------------------;

[State 4400 : クイックMAX]
  Type     = ChangeAnim
  Trigger1 = Time = 0
  Trigger1 = Var(10) = [2, 3]
  Value    = 4410

;----------------------------[ ゲージ ]------------------------------;

[State 4400]
  Type     = PowerAdd
  Trigger1 = Time = 0
  Value    = -1000+IfElse(Anim = 4410, -1000, 0)
  IgnoreHitPause = 1

;---------------------------[ 変数定義 ]-----------------------------;

[State 4400]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1
  Persistent     = 0

[State 4400]
  Type           = VarSet
  Trigger1       = Time = 0
  V              = 31
  Value          = 900
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 4400 : SE]
  Type     = PlaySnd
  Trigger1 = Anim = 4400
  Trigger1 = AnimElem = 4
  Trigger2 = Anim = 4410
  Trigger2 = Time = 0
  Value    = s4400, IfElse(Anim=4400,0,1)

;-------------------------[ ステート変更 ]---------------------------;

[State 4400]
  Type       = ChangeState
  TriggerAll = Var(30) = 5
  Trigger1   = Anim = 4410
  Trigger1   = AnimTime = 0
  Trigger1   = Command = "holdfwd"
  Value      = 100

[State 4400]
  Type       = ChangeState
  TriggerAll = AnimTime = 0
  Trigger1   = Var(30) = 1
  Trigger2   = Var(30) = 5
;  Trigger2   = Command != "holdfwd"
  Value      = 0
  Ctrl       = 1

;------------------------------------------------------------------------------;
; スーパーキャンセル
;------------------------------------------------------------------------------;
[Statedef 7100]
  Type        = A
  MoveType    = I
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 9999
  SprPriority = 2

;--------------------------[ エフェクト ]----------------------------;

[State 7100 : SC(NBC), 1]
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

[State 7100 : SC(NBC), 2]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(10) = 4
  Trigger1    = Var(30) = 0
  Anim        = 7101
  ID          = 7100
  Pos         = -10, -60
  PosType     = Left
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  Scale       = 0.5,0.5
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;-------------------------[ ステート変更 ]---------------------------;

[State 7100]
  Type     = DestroySelf
  Trigger1 = Var(30) = 0
  Trigger1 = NumExplod(7100) = 0

[State 7100]
  Type     = Null;ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; MAX2演出用ヘルパー
;------------------------------------------------------------------------------;
[Statedef 7500]
  Type        = A
  MoveType    = I
  Physics     = N
  ;Commonly-used controllers:
  Ctrl        = 0
  Anim        = 9999
  SprPriority = -50

[State 7500]
  Type     = AssertSpecial
  Trigger1 = 1
  Flag     = NoBG
  Flag2    = NoFG
  Flag3    = NoShadow
  IgnoreHitPause = 1

[State 7500]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 7500
  ID          = 7500
  Pos         = 0,0
  PosType     = back
  OwnPal      = 1
  BindTime    = -1
  RemoveTime  = -1
  SprPriority = -100
  Trans       = AddAlpha
  Alpha       = 200,256
  SuperMoveTime = 999999
  PauseMoveTime = 999999


[State 7500]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 7500
  ID          = 7500
  Pos         = -320,0
  PosType     = back
  OwnPal      = 1
  BindTime    = -1
  RemoveTime  = -1
  SprPriority = -100
  Trans       = AddAlpha
  Alpha       = 200,256
  SuperMoveTime = 999999
  PauseMoveTime = 999999

[State 7500]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 7501
  ID          = 7500
  Pos         = 0,0
  PosType     = back
  OwnPal      = 1
  BindTime    = -1
  RemoveTime  = -1
  SprPriority = -100
  Trans       = AddAlpha
  Alpha       = 200,256
  SuperMoveTime = 999999
  PauseMoveTime = 999999

[State 7500]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 7501
  ID          = 7500
  Pos         = -320,0
  PosType     = back
  OwnPal      = 1
  BindTime    = -1
  RemoveTime  = -1
  SprPriority = -100
  Trans       = AddAlpha
  Alpha       = 200,256
  SuperMoveTime = 999999
  PauseMoveTime = 999999

[State 7500]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 7502
  ID          = 7500
  Pos         = 0,0
  PosType     = back
  OwnPal      = 1
  BindTime    = -1
  RemoveTime  = -1
  SprPriority = -100
  Trans       = AddAlpha
  Alpha       = 200,256
  SuperMoveTime = 999999
  PauseMoveTime = 999999

[State 7500]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 7502
  ID          = 7500
  Pos         = -320,0
  PosType     = back
  OwnPal      = 1
  BindTime    = -1
  RemoveTime  = -1
  SprPriority = -100
  Trans       = AddAlpha
  Alpha       = 200,256
  SuperMoveTime = 999999
  PauseMoveTime = 999999

[State 7500]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 7503
  ID          = 7500
  Pos         = 0,0
  PosType     = back
  OwnPal      = 1
  BindTime    = -1
  RemoveTime  = -1
  SprPriority = -100
  Trans       = AddAlpha
  Alpha       = 200,256
  SuperMoveTime = 999999
  PauseMoveTime = 999999

[State 7500]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 7503
  ID          = 7500
  Pos         = -320,0
  PosType     = back
  OwnPal      = 1
  BindTime    = -1
  RemoveTime  = -1
  SprPriority = -100
  Trans       = AddAlpha
  Alpha       = 200,256
  SuperMoveTime = 999999
  PauseMoveTime = 999999

[State 7500]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 7504
  ID          = 7500
  Pos         = 0,0
  PosType     = back
  OwnPal      = 1
  BindTime    = -1
  RemoveTime  = -1
  SprPriority = -100
  Trans       = AddAlpha
  Alpha       = 200,256
  SuperMoveTime = 999999
  PauseMoveTime = 999999

[State 7500]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 7504
  ID          = 7500
  Pos         = -320,0
  PosType     = back
  OwnPal      = 1
  BindTime    = -1
  RemoveTime  = -1
  SprPriority = -100
  Trans       = AddAlpha
  Alpha       = 200,256
  SuperMoveTime = 999999
  PauseMoveTime = 999999

[State 7500]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 7505
  ID          = 7500
  Pos         = 0,0
  PosType     = back
  OwnPal      = 1
  BindTime    = -1
  RemoveTime  = -1
  SprPriority = -100
  Trans       = AddAlpha
  Alpha       = 200,256
  SuperMoveTime = 999999
  PauseMoveTime = 999999

[State 7500]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 7505
  ID          = 7500
  Pos         = -320,0
  PosType     = back
  OwnPal      = 1
  BindTime    = -1
  RemoveTime  = -1
  SprPriority = -100
  Trans       = AddAlpha
  Alpha       = 200,256
  SuperMoveTime = 999999
  PauseMoveTime = 999999

[State 7500]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 7506
  ID          = 7500
  Pos         = 0,0
  PosType     = back
  OwnPal      = 1
  BindTime    = -1
  RemoveTime  = -1
  SprPriority = -100
  Trans       = AddAlpha
  Alpha       = 200,256
  SuperMoveTime = 999999
  PauseMoveTime = 999999

[State 7500]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 7506
  ID          = 7500
  Pos         = -320,0
  PosType     = back
  OwnPal      = 1
  BindTime    = -1
  RemoveTime  = -1
  SprPriority = -100
  Trans       = AddAlpha
  Alpha       = 200,256
  SuperMoveTime = 999999
  PauseMoveTime = 999999

[State 7500]
  Type     = RemoveExplod
  Trigger1 = Root,MoveType = H
  Trigger2 = Root,StateNo = 3310
  Trigger2 = Root,Anim = 3320
  Trigger2 = Root,AnimElem = 4
  ID       = 7500

[State 7500]
  Type     = ChangeState
  Trigger1 = Root,MoveType = H
  Trigger2 = Root,StateNo = 3310
  Trigger2 = Root,Anim = 3320
  Trigger2 = Root,AnimElem = 4
  Value    = 7510

[State 7500]
  Type     = Null;DestroySelf
  Trigger1 = Root,MoveType = H
  Trigger2 = Root,StateNo != 3300

;------------------------------------------------------------------------------;
; MAX2演出用ヘルパー
;------------------------------------------------------------------------------;
[Statedef 7510]
  Type        = A
  MoveType    = I
  Physics     = N
  ;Commonly-used controllers:
  Ctrl        = 0
  Anim        = 9999
  SprPriority = -50

[State 7510]
  Type     = PosSet
  Trigger1 = Time = 0
  X        = 0
  Y        = 0

[State 7510]
  Type     = AssertSpecial
  Trigger1 = Time = [0,6]
  Flag     = NoBG
  IgnoreHitPause = 1

[State 7510]
  Type     = AssertSpecial
  Trigger1 = 1
  Flag     = NoFG
  Flag2    = NoShadow
  IgnoreHitPause = 1

[State 7510]
  Type     = RemoveExplod
  Trigger1 = Time = 0
  ID       = 7500

[State 7510]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 7510
  ID          = 7510
  Pos         = 0, 0
  PosType     = back
  OwnPal      = 1
  BindTime    = -1
  SprPriority = -100
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 7510]
  Type     = PlaySnd
  Trigger1 = Time = 7
  Value    = s7000, 13
  Channel  = 3

[State 7510]
  Type     = DestroySelf
  Trigger1 = Time = 8

;------------------------------------------------------------------------------;
; モードセレクト
;------------------------------------------------------------------------------;
[Statedef 8900]
  Type        = A
  MoveType    = I
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 9999
  SprPriority = 2

[State 8900]
  Type     = AssertSpecial
  Trigger1 = 1
  Flag     = NoShadow
;  Flag2    = Intro

;---------------------------[ 変数定義 ]-----------------------------;

[State 8900]
  Type     = ParentVarAdd
  Trigger1 = Time = 0
  Trigger1 = Root,Command = "fwd"
  V        = 30
  Value    = 1

[State 8900]
  Type     = ParentVarAdd
  Trigger1 = Time = 0
  Trigger1 = Root,Command = "back"
  V        = 30
  Value    = -1

[State 8900]
  Type     = ParentVarSet
  Trigger1 = Time = 0
  Trigger1 = Root,Var(30) = 0 || Root,Var(30) = 5
  Trigger1 = Root,Command = "up" || Root,Command = "down"
  V        = 30
  Value    = IfElse(Root,Var(30)=0,5,0)

[State 8900]
  Type     = ParentVarSet
  Trigger1 = Time = 0
  Trigger1 = Root,Var(30) = 3
  V        = 30
  Value    = 0

[State 8900]
  Type     = ParentVarSet
  Trigger1 = Time = 0
  Trigger1 = Root,Var(30) = 6
  V        = 30
  Value    = 1

[State 8900]
  Type     = ParentVarSet
  Trigger1 = Time = 0
  Trigger1 = Root,Var(30) = -1 || Root,Var(30) = 4
  V        = 30
  Value    = 2

;---------------------------[ サウンド ]-----------------------------;

[State 8900]
  Type     = PlaySnd
  Trigger1 = Var(30) = 0 || Var(30) = 5
  Trigger1 = Root,Command = "fwd" || Root,Command = "back" || Root,Command = "up" || Root,Command = "down"
  Trigger2 = Var(30) = [1,2]
  Trigger2 = Root,Command = "fwd" || Root,Command = "back"
  Value    = s8900, 0
  Channel  = 3
  Persistent = 0

;--------------------------[ エフェクト ]----------------------------;

[State 8900]
  Type     = RemoveExplod
  Trigger1 = Time = 0
  ID       = 8900

[State 8900]
  Type           = Explod
  TriggerAll     = Time = 0
  Trigger1       = TeamSide = 1
  Anim           = 8900+Root,Var(30)
  ID             = 8900
  Pos            = 0, 0
  PosType        = P1
  BindTime       = -1
  OwnPal         = 1
  OnTop          = 1
  IgnoreHitPause = 1
  SuperMoveTime  = -1
  PauseMoveTime  = -1
  Scale = 0.5,0.5

[State 8900]
  Type           = Explod
  TriggerAll     = Time = 0
  Trigger1       = TeamSide = 2
  Anim           = 8900+Root,Var(30)
  ID             = 8900
  Pos            = 0, 0
  PosType        = P1
  BindTime       = -1
  OwnPal         = 1
  OnTop          = 1
  IgnoreHitPause = 1
  SuperMoveTime  = -1
  PauseMoveTime  = -1
  Facing         = -1
  Scale = 0.5,0.5

[State 8900]
  Type     = RemoveExplod
  Trigger1 = Root,Command = "a" || Root,Command = "b" || Root,Command = "c" || Root,Command = "x" || Root,Command = "y" || Root,Command = "z"
  Trigger2 = RoundState > 1
  ID       = 8900

;-------------------------[ ステート変更 ]---------------------------;

[State 8900]
  Type       = ChangeState
  TriggerAll = Time > 7
  Trigger1   = Root,Command = "fwd"
  Trigger2   = Root,Command = "back"
  Trigger3   = Root,Var(30) = 0 || Root,Var(30) = 5
  Trigger3   = Root,Command = "up" || Root,Command = "down"
  Value      = 8900

[State 8900]
  Type     = ChangeState
  Trigger1 = Root,Command = "a" || Root,Command = "b" || Root,Command = "c" || Root,Command = "x" || Root,Command = "y" || Root,Command = "z"
  Trigger2 = RoundState > 1
  Value    = 8910

[State 8900]
  Type     = Null;DestroySelf
  Trigger1 = Root,Command = "a" || Root,Command = "b" || Root,Command = "c" || Root,Command = "x" || Root,Command = "y" || Root,Command = "z"
  Trigger2 = RoundState > 1

;------------------------------------------------------------------------------;
; モードセレクト（決定）
;------------------------------------------------------------------------------;
[Statedef 8910]
  Type        = A
  MoveType    = I
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 9999
  SprPriority = 2

;---------------------------[ サウンド ]-----------------------------;

[State 8910]
  Type     = PlaySnd
  Trigger1 = Time = 0
  Value    = s8900, 1

;-------------------------[ ステート変更 ]---------------------------;

[State 8900]
  Type     = DestroySelf
  Trigger1 = Time = 1



