; FileName : Super.st
;------------------------------------------------------------------------------;
;■■■■■■■■■■■■■■■■■■■目次■■■■■■■■■■■■■■■■■■;
; 必殺技
; ・ハマドリュアスバスター（地上）     : State 1000
; ・ハマドリュアスバスター（空中）     : State 1100
; ・弱ネプチューンキラー               : State 1200
; ・強ネプチューンキラー               : State 1250
; ・モーニングスターアタック           : State 1300
; ・モーニングスタークラッシュ         : State 1350
; ・弱ライオンズシールド               : State 1400
; ・強ライオンズシールド               : State 1450
; ・プカプカホバリング                 : State 1500
; ・ユニコーンホーン                   : State 1550
; ・テュポーンスイング                 : State 1560
; ・ライフフラワー                     : State 1600
;
;■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■;
;==============================================================================;
; 必殺技
;==============================================================================;
;------------------------------------------------------------------------------;
; ハマドリュアスバスター（地上）
;------------------------------------------------------------------------------;
[Statedef 1000]
  Type        = S
poweradd = 0
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1000
  SprPriority = 2

;--------------------------[ キャンセル ]----------------------------;

[State 1000]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(30) = [1,5]
  Time       = 5
  Add        = 230,230,230
  IgnoreHitPause = 1

;---------------------------[ 変数定義 ]-----------------------------;

[State 1000]
  Type       = VarAdd
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(31) > 0
  V          = 31
  Value      = -150
  IgnoreHitPause = 1

[State 1000 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 1000 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 1000 : ボタン判定]
  Type       = VarSet
  TriggerAll = Time = 0
  Trigger1   = Command = "x" || Command = "y"
  V          = 14
  Value      = IfElse(Command = "y",1,0)
  IgnoreHitPause = 1

[State 1000 : 溜め時間リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 15
  Value    = 0
  IgnoreHitPause = 1

[State 1000 : 溜め時間カウント]
  Type       = VarAdd
  TriggerAll = Time >= 18
  Trigger1   = Var(14) = 0
  Trigger1   = Command = "hold_x"
  Trigger2   = Var(14) = 1
  Trigger2   = Command = "hold_y"
  V          = 15
  Value      = 1
  IgnoreHitPause = 1

;---------------------------[ サウンド ]-----------------------------;

[State 1000 : Voice]
  Type     = PlaySnd
  Trigger1 = Time = 0
  Value    = s1000, 0
  Channel  = 4

[State 1000 : SE]
  Type       = PlaySnd
  TriggerAll = Var(14) = 0
  Trigger1   = Var(15) = 28
  Value      = s1005, 2
  Loop       = 1
  Channel    = 2

[State 1000 : SE]
  Type       = PlaySnd
  TriggerAll = Var(14) = 1
  Trigger1   = Var(15) >= 28
  Trigger1   = Time%12 = 0
  Value      = s1005, 2
  Channel    = 2

[State 1000 : SE]
  Type       = PlaySnd
  TriggerAll = Var(14) = 1
  Trigger1   = Var(15) >= 28
  Trigger1   = Time%12 = 0
  Value      = s1005, 2
  Channel    = 3

;--------------------------[ エフェクト ]----------------------------;

[State 1000]
  Type        = Explod
  Trigger1    = AnimElem = 5
  Anim        = 1005
  ID          = 1000
  Pos         = 10, -46
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  RemoveTime  = -1
  OwnPal      = 1
  IgnoreHitPause = 1

[State 1000]
  Type        = Explod
  Trigger1    = Time = 50
  Anim        = 1015
  ID          = 1000
  Pos         = 10, -46
  PosType     = P1
  SprPriority = 4
  BindTime    = -1
  RemoveTime  = -1
  OwnPal      = 1
  VFacing     = -1
  IgnoreHitPause = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 1000]
  Type     = ChangeState
  Trigger1 = Var(14) = 0
  Trigger1 = Command != "hold_x"
  Trigger1 = Time >= 26
  Trigger2 = Var(14) = 1
  Trigger2 = Command != "hold_y"
  Trigger2 = Time >= 26
  Trigger3 = Time >= 222
  Value    = 1010

;------------------------------------------------------------------------------;
; ハマドリュアスバスター（発射）
;------------------------------------------------------------------------------;
[Statedef 1010]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1010
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 1010 : キャンセル判定セット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 4
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 1010]
  Type     = PlaySnd
  Trigger1 = Time = 0
  Value    = s1005, 0

;--------------------------[ エフェクト ]----------------------------;

[State 1010]
  Type     = RemoveExplod
  Trigger1 = Time = 0
  ID       = 1000

;---------------------------[ ヘルパー ]-----------------------------;

[State 1010]
  Type       = Helper
  Trigger1   = Time = 0
  Name       = "Arrow"
  StateNo    = 1050
  ID         = 1000
  Pos        = 10,-46
  PosType    = P1
  HelperType = Normal
  OwnPal     = 1
  KeyCtrl    = 1
  IgnoreHitPause = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 1010]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; ハマドリュアスバスター（地上，ヘルパー１）
;------------------------------------------------------------------------------;
[Statedef 1050]
  Type        = A
  MoveType    = A
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1050
  SprPriority = 2

;----------------------------[ ゲージ ]------------------------------;

[State 1050]
  Type     = PowerAdd
  Trigger1 = MoveHit = 1
  Value    = IfElse(Root,Var(15)>=28,40,68); 110, 135
  IgnoreHitPause = 1
  Persistent     = 0

[State 1050]
  Type     = PowerAdd
  Trigger1 = MoveGuarded = 1
  Value    = IfElse(Root,Var(15)>=28,6, 3); 10, 20
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ 変数定義 ]-----------------------------;

[State 1050 : 相手のステートタイプ]
  Type     = ParentVarSet
  Trigger1 = P2BodyDist X > 10
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 1050 : 追撃判定]
  Type       = ParentVarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Root,Var(9) = 1
  V          = 11
  Value      = 20
  IgnoreHitPause = 1
  Persistent     = 0

[State 1050 : ボタン判定]; ヘルパー内の変数へ代入
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 14
  Value    = Root, Var(14)
  IgnoreHitPause = 1

[State 1050 : 溜め判定]; ヘルパー内の変数へ代入
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 15
  Value    = IfElse(Root,Var(15)>=28,1,0)
  IgnoreHitPause = 1

[State 1050 : ヒット判定（HB）]; ヘルパー内の変数へ代入
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 16
  Value    = 0
  IgnoreHitPause = 1

[State 1050 : ヒット判定（HB）]; ヘルパー内の変数へ代入
  Type     = VarSet
  Trigger1 = MoveContact
  V        = 16
  Value    = 1
  IgnoreHitPause = 1

;--------------------------[ エフェクト ]----------------------------;

[State 1050]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 1055+Var(14)*10
  ID          = 1050
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  RemoveTime  = -1
  OwnPal      = 1
  IgnoreHitPause = 1

[State 1050]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Root,Var(15) >= 28
  Anim        = 1015
  ID          = 1055
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 4
  BindTime    = -1
  RemoveTime  = -1
  OwnPal      = 1
  IgnoreHitPause = 1

[State 1050]
  Type     = RemoveExplod
  Trigger1 = MoveContact
  ID       = 1050
  IgnoreHitPause = 1

[State 1050]
  Type     = RemoveExplod
  Trigger1 = MoveContact
  ID       = 1055
  IgnoreHitPause = 1

[State 1050]
  Type        = Explod
  Trigger1    = MoveContact
  Anim        = 1075
  ID          = 1050
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  IgnoreHitPause = 1

;---------------------------[ 移動関連 ]-----------------------------;

[State 1050]
  Type     = VelSet
  Trigger1 = Time = 0
  X        = IfElse(Var(14)=0,7,8)+IfElse(Var(15)=1,0.75,0)
  Y        = IfElse(Var(14)=0,-2,-3.5)

[State 1050]
  Type     = VelAdd
  Trigger1 = Time >= 4
  X        = -0.045
  Y        = 0.2

[State 1050]
  Type     = VelAdd
  Trigger1 = Time >= 15
  X        = -0.015
  Y        = 0.15

;--------------------------[ ヒット定義 ]----------------------------;

[State 1050]
  Type             = HitDef
  TriggerAll       = Var(15) = 0
  Trigger1         = Time = 0
  Attr             = A, SP
  Damage           = IfElse(Root,Var(3)=0,IfElse(Floor(60*Root,FVar(4))<1,1,Floor(60*Root,FVar(4))),70),10
getpower = 15,7
  GivePower        = 10,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 9, 10
  SparkNo          = s6101
  Guard.SparkNo    = s6401
  SparkXY          = 0, 0
  HitSound         = s4, IfElse(Root,Var(30)>=2,2,Root,Var(30))*10+1
  GuardSound       = s120, IfElse(Root,Var(30)>=2,2,Root,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 16
  Ground.HitTime   = 18
  Ground.Velocity  = -4
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3

[State 1050]
  Type             = HitDef
  TriggerAll       = Var(15) = 1
  Trigger1         = Time = 0
  Attr             = A, SP
  Damage           = IfElse(Root,Var(3)=0,IfElse(Floor(135*Root,FVar(4))<1,1,Floor(135*Root,FVar(4))),145),20
getpower = 15,7
  GivePower        = 10,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 9, 10
  SparkNo          = s6001
  Guard.SparkNo    = s6401
  SparkXY          = 0, 0
  HitSound         = s1005, 4
  GuardSound       = s120, IfElse(Root,Var(30)>=2,2,Root,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 16
  Ground.HitTime   = 18
  Ground.Velocity  = -4
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3
  PalFx.Time       = 60
  PalFx.Add        = 30,-40,-140
  PalFx.SinAdd     = 60,60,50,10
  PalFx.Color      = 0
  PalFx.Invertall  = 1

[State 1050]
  Type     = MoveHitReset
  Trigger1 = MoveContact
  IgnoreHitPause = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 1050]
  Type     = HitOverRide
  Trigger1 = Time = 0
  Attr     = SCA, NT, ST, HT, NA, SA, HA, NP, SP, HP
  StateNo  = 1070
  Time     = -1

[State 1050]
  Type     = ChangeState
  Trigger1 = MoveContact = 1
  Trigger2 = Vel Y > 0 && Pos Y >= -10
  Value    = 1070

;------------------------------------------------------------------------------;
; ハマドリュアスバスター（ヘルパー２）
;------------------------------------------------------------------------------;
[Statedef 1070]
  Type        = S
  MoveType    = I
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1070
  SprPriority = 2

[State 1070]
  Type     = AssertSpecial
  Trigger1 = 1
  Flag     = NoShadow
  IgnoreHitPause = 1

[State 1070]
  Type       = StateTypeSet
  TriggerAll = Time = 0
  Trigger1   = Var(15) = 1
  MoveType   = A
  IgnoreHitPause = 1

;---------------------------[ サウンド ]-----------------------------;

[State 1070]
  Type       = PlaySnd
  TriggerAll = Time = 0
  Trigger1   = Var(16) = 0
  Value      = s1005, IfElse(Var(15)=0,1,3)

;---------------------------[ 移動関連 ]-----------------------------;

[State 1070]
  Type       = Null;VelSet
  TriggerAll = Time = 0
  Trigger1   = Var(16) = 1
  X          = 0
  Y          = 0

[State 1070]
  Type       = PosSet
  TriggerAll = Time = 0
  Trigger1   = Var(16) = 0
  Y          = 0

;--------------------------[ エフェクト ]----------------------------;

[State 1070]
  Type     = RemoveExplod
  Trigger1 = Time = 0
  ID       = 1050

[State 1070]
  Type     = RemoveExplod
  Trigger1 = Time = 0
  ID       = 1055

[State 1070]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(15) = 0
  Trigger1    = Var(16) = 0
  Anim        = 1075
  ID          = 1070
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  RemoveTime  = IfElse(Var(16)=1,12,-1)
  OwnPal      = 1
  IgnoreHitPause = 1

[State 1070]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Var(15) = 1
  Trigger1    = Var(16) = 0
  Anim        = 1085
  ID          = 1070
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  IgnoreHitPause = 1

[State 1070]
  Type     = RemoveExplod
  Trigger1 = Var(15) = 0
  Trigger1 = Time = 12
  ID       = 1070

;--------------------------[ ヒット定義 ]----------------------------;

[State 1070]
  Type             = HitDef
  TriggerAll       = Var(15) = 1
  TriggerAll       = Var(16) = 0
  Trigger1         = AnimElem = 1
  Trigger2         = AnimElem = 2
  Trigger3         = AnimElem = 3
  Trigger4         = AnimElem = 4
  Attr             = S, SP
  Damage           = 50, 5
getpower = 15,7
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 2, 8
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -10, -35
  HitSound         = s1005, 4
  GuardSound       = s120, IfElse(Root,Var(30)>=2,2,Root,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 11
  Ground.HitTime   = 12
  Ground.Velocity  = 0
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3
  PalFx.Time       = 60
  PalFx.Add        = 30,-40,-140
  PalFx.SinAdd     = 60,60,50,10
  PalFx.Color      = 0
  PalFx.Invertall  = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 1070]
  Type     = DestroySelf
  Trigger1 = Time = 12
  Trigger1 = Var(15) = 0
  Trigger2 = Time = 24
  Trigger2 = Var(15) = 1

;------------------------------------------------------------------------------;
; ハマドリュアスバスター（空中）
;------------------------------------------------------------------------------;
[Statedef 1100]
  Type        = A
poweradd = 0
  MoveType    = A
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1100
  SprPriority = 2

;--------------------------[ キャンセル ]----------------------------;

[State 1100]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(30) = [1,5]
  Time       = 5
  Add        = 230,230,230
  IgnoreHitPause = 1

;---------------------------[ 変数定義 ]-----------------------------;

[State 1100]
  Type       = VarAdd
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(31) > 0
  V          = 31
  Value      = -150
  IgnoreHitPause = 1

[State 1100 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 1100 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0

[State 1100 : ボタンの強弱判定]
  Type           = VarSet
  TriggerAll     = Time = 0
  Trigger1       = Command = "x" || Command = "y"
  V              = 14
  Value          = IfElse(Command = "y",1,0)
  IgnoreHitPause = 1

[State 1100 : 溜め時間リセット]
  Type           = VarSet
  Trigger1       = Time = 0
  V              = 15
  Value          = 0
  IgnoreHitPause = 1

[State 1100 : 溜め時間カウント]
  Type           = VarAdd
  TriggerAll     = Time >= 32
  Trigger1       = Var(14) = 0
  Trigger1       = Command = "hold_x"
  Trigger2       = Var(14) = 1
  Trigger2       = Command = "hold_y"
  V              = 15
  Value          = 1
  IgnoreHitPause = 1

;---------------------------[ サウンド ]-----------------------------;

[State 1100 : Voice]
  Type     = PlaySnd
  Trigger1 = Time = 0
  Value    = s1000, 0

[State 1100 : SE]
  Type       = PlaySnd
  TriggerAll = Var(14) = 0
  Trigger1   = Var(15) = 32
  Value      = s1005, 2
  Loop       = 1
  Channel    = 2

[State 1100 : SE]
  Type       = PlaySnd
  TriggerAll = Var(14) = 1
  Trigger1   = Var(15) >= 32
  Trigger1   = Time%12 = 0
  Value      = s1005, 2
  Channel    = 2

;--------------------------[ エフェクト ]----------------------------;

[State 1100 : Arrow]
  Type        = Explod
  Trigger1    = AnimElem = 5
  Anim        = 1105
  ID          = 1000
  Pos         = 10, -64
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  RemoveTime  = -1
  OwnPal      = 1
  IgnoreHitPause = 1

[State 1100 : Fire]
  Type        = Explod
  Trigger1    = Time = 56
  Anim        = 1115
  ID          = 1000
  Pos         = 10, -64
  PosType     = P1
  SprPriority = 4
  BindTime    = -1
  RemoveTime  = -1
  OwnPal      = 1
  VFacing     = -1
  IgnoreHitPause = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 1100]
  Type     = ChangeState
  Trigger1 = Var(14) = 0
  Trigger1 = Command != "hold_x"
  Trigger1 = Time >= 30
  Trigger2 = Var(14) = 1
  Trigger2 = Command != "hold_y"
  Trigger2 = Time >= 30
  Trigger3 = Time = 228
  Value    = 1110

;------------------------------------------------------------------------------;
; ハマドリュアスバスター（空中，発射）
;------------------------------------------------------------------------------;
[Statedef 1110]
  Type        = A
  MoveType    = A
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1110
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 1110 : キャンセル判定セット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 4
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 1110]
  Type     = PlaySnd
  Trigger1 = Time = 0
  Value    = s1005, 0

;---------------------------[ 移動関連 ]-----------------------------;

[State 1110]
  Type     = VelSet
  Trigger1 = Time = 0
  X        = -4

[State 1110]
  Type     = VelAdd
  Trigger1 = 1
  X        = 0.015
  Y        = 0.47

;--------------------------[ エフェクト ]----------------------------;

[State 1110]
  Type     = RemoveExplod
  Trigger1 = Time = 0
  ID       = 1000

;---------------------------[ ヘルパー ]-----------------------------;

[State 1110]
  Type       = Helper
  Trigger1   = Time = 0
  Name       = "Arrow"
  StateNo    = 1150
  ID         = 1000
  Pos        = 10,-64
  PosType    = P1
  HelperType = Normal
  OwnPal     = 1
  KeyCtrl    = 1
  IgnoreHitPause = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 1110]
  Type     = ChangeState
  Trigger1 = Vel Y > 0 && Pos Y >= 0
  Value    = 52

;------------------------------------------------------------------------------;
; ハマドリュアスバスター（空中，ヘルパー１）
;------------------------------------------------------------------------------;
[Statedef 1150]
  Type        = A
  MoveType    = A
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1050
  SprPriority = 2

;----------------------------[ ゲージ ]------------------------------;

[State 1150]
  Type     = PowerAdd
  Trigger1 = MoveHit = 1
  Value    = IfElse(Root,Var(15)>=28,40,68); 110, 135
  IgnoreHitPause = 1
  Persistent     = 0

[State 1150]
  Type     = PowerAdd
  Trigger1 = MoveGuarded = 1
  Value    = IfElse(Root,Var(15)>=28,6, 3); 10, 20
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ 変数定義 ]-----------------------------;

[State 1150 : 相手のステートタイプ]
  Type     = ParentVarSet
  Trigger1 = P2BodyDist X > 10
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 1150 : 追撃判定]
  Type       = ParentVarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Root,Var(9) = 1
  V          = 11
  Value      = 20
  IgnoreHitPause = 1
  Persistent     = 0

[State 1150 : ボタン判定]; ヘルパー内の変数へ代入
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 14
  Value    = Root, Var(14)
  IgnoreHitPause = 1

[State 1150 : 溜め判定]; ヘルパー内の変数へ代入
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 15
  Value    = IfElse(Root,Var(15)>=28,1,0)
  IgnoreHitPause = 1

[State 1150 : ヒット判定（HB）]; ヘルパー内の変数へ代入
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 16
  Value    = 0
  IgnoreHitPause = 1

[State 1150 : ヒット判定（HB）]; ヘルパー内の変数へ代入
  Type     = VarSet
  Trigger1 = MoveContact
  V        = 16
  Value    = 1
  IgnoreHitPause = 1

;--------------------------[ エフェクト ]----------------------------;

[State 1150]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 1055+Var(14)*10+IfElse(Var(15)=0,0,100)
  ID          = 1050
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  RemoveTime  = -1
  OwnPal      = 1
  IgnoreHitPause = 1

[State 1150]
  Type        = Explod
  TriggerAll  = Time = 0
  Trigger1    = Root,Var(15) >= 28
  Anim        = 1015
  ID          = 1055
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 4
  BindTime    = -1
  RemoveTime  = -1
  OwnPal      = 1
  IgnoreHitPause = 1

[State 1150]
  Type     = RemoveExplod
  Trigger1 = MoveContact
  ID       = 1050
  IgnoreHitPause = 1

[State 1150]
  Type     = RemoveExplod
  Trigger1 = MoveContact
  ID       = 1055
  IgnoreHitPause = 1

[State 1150]
  Type        = Explod
  Trigger1    = MoveContact
  Anim        = 1075
  ID          = 1050
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  IgnoreHitPause = 1

;---------------------------[ 移動関連 ]-----------------------------;

[State 1150 : 弱ハマドリュアス]
  Type     = VelSet
  Trigger1 = Time = 0
  X        = 7+IfElse(Var(15)=1,0.75,0)
  Y        = -1.5

[State 1150 : 弱ハマドリュアス]
  Type       = VelAdd
  TriggerAll = Var(14) = 0
  Trigger1   = Time >= 4
  X          = -0.125
  Y          = 0.25

[State 1150 : 弱ハマドリュアス]
  Type       = VelAdd
  TriggerAll = Var(14) = 0
  Trigger1   = Time >= 15
  X          = -0.025
  Y          = 0.15

[State 1150 : 強ハマドリュアス]
  Type     = VelSet
  Trigger1 = Time = 0
  X        = 8+IfElse(Var(15)=1,3.5,0)
  Y        = -2

[State 1150 : 強ハマドリュアス]
  Type       = VelAdd
  TriggerAll = Var(14) = 1
  Trigger1   = Time >= 4
  X          = -0.05
  Y          = 0.2

[State 1150 : 強ハマドリュアス]
  Type       = VelAdd
  TriggerAll = Var(14) = 1
  Trigger1   = Time >= 15
  X          = -0.015
  Y          = 0.15

;--------------------------[ ヒット定義 ]----------------------------;

[State 1150]
  Type             = HitDef
  TriggerAll       = Var(15) = 0
  Trigger1         = Time = 0
  Attr             = A, SP
  Damage           = IfElse(Root,Var(3)=0,IfElse(Floor(60*Root,FVar(4))<1,1,Floor(60*Root,FVar(4))),70),10
getpower = 30,15
  GivePower        = 10,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 9, 10
  SparkNo          = s6101
  Guard.SparkNo    = s6401
  SparkXY          = 0, 0
  HitSound         = s4, IfElse(Root,Var(30)>=2,2,Root,Var(30))*10+1
  GuardSound       = s120, IfElse(Root,Var(30)>=2,2,Root,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 16
  Ground.HitTime   = 18
  Ground.Velocity  = -4
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3

[State 1150]
  Type             = HitDef
  TriggerAll       = Var(15) = 1
  Trigger1         = Time = 0
  Attr             = A, SP
  Damage           = IfElse(Root,Var(3)=0,IfElse(Floor(135*Root,FVar(4))<1,1,Floor(135*Root,FVar(4))),145),20
getpower = 30,15
  GivePower        = 10,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 9, 10
  SparkNo          = s6001
  Guard.SparkNo    = s6401
  SparkXY          = 0, 0
  HitSound         = s1005, 4
  GuardSound       = s120, IfElse(Root,Var(30)>=2,2,Root,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 16
  Ground.HitTime   = 18
  Ground.Velocity  = -4
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3
  PalFx.Time       = 60
  PalFx.Add        = 30,-40,-140
  PalFx.SinAdd     = 60,60,50,10
  PalFx.Color      = 0
  PalFx.Invertall  = 1

[State 1150]
  Type     = MoveHitReset
  Trigger1 = MoveContact
  IgnoreHitPause = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 1150]
  Type     = HitOverRide
  Trigger1 = Time = 0
  Attr     = SCA, NT, ST, HT, NA, SA, HA, NP, SP, HP
  StateNo  = 1070
  Time     = -1

[State 1150]
  Type     = ChangeState
  Trigger1 = MoveContact = 1
  Trigger2 = Vel Y > 0 && Pos Y >= -10
  Value    = 1070

;------------------------------------------------------------------------------;
; 弱ネプチューンキラー
;------------------------------------------------------------------------------;
[Statedef 1200]
  Type        = A
  MoveType    = A
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
;  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1200
  PowerAdd    = 0
  SprPriority = 2

[State 1200]
  Type     = NotHitBy
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 4, < 0
  Value    = SCA
  IgnoreHitPause = 1

;--------------------------[ キャンセル ]----------------------------;

[State 1200]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(30) = [1,5]
  Time       = 5
  Add        = 230,230,230
  IgnoreHitPause = 1

;---------------------------[ 変数定義 ]-----------------------------;

[State 1200]
  Type       = VarAdd
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(31) > 0
  V          = 31
  Value      = -150
  IgnoreHitPause = 1

[State 1200 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 1200 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 1200 : キャンセル判定セット]
  Type       = VarSet
  TriggerAll = MoveContact
  Trigger1   = Var(30) = 1 || Var(30) = 5
  Trigger1   = Var(31) > 0
  V          = 10
  Value      = 6
  IgnoreHitPause = 1
  Persistent     = 1

[State 1200 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 6, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 1200 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 3
  IgnoreHitPause = 1
  Persistent     = 0

[State 1200 : ]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 16
  Value    = 0
  IgnoreHitPause = 1

[State 1200 : ]
  Type     = VarAdd
  Trigger1 = MoveContact
  V        = 16
  Value    = 1
  IgnoreHitPause = 1

;---------------------------[ サウンド ]-----------------------------;

[State 1200]
  Type     = PlaySnd
  Trigger1 = Time = 0
  Value    = s1205, 0

;--------------------------[ エフェクト ]----------------------------;

[State 1200]
  Type        = Explod
  Trigger1    = AnimElem = 3
  Anim        = 1205
  ID          = 1200
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  Shadow      = 230,230,230
  IgnoreHitPause = 0

;---------------------------[ 移動関連 ]-----------------------------;

[State 1200]
  Type     = VelSet
  Trigger1 = AnimElem = 5
  X        = 3
  Y        = -7

[State 1200]
  Type     = VelAdd
  Trigger1 = AnimElem = 5, >= 0
  Y        = 0.25

[State 1200]
  Type     = VelAdd
  Trigger1 = AnimElem = 10, >= 0
  X        = -0.1
  Y        = 0.15

;--------------------------[ ヒット定義 ]----------------------------;

[State 1200]
  Type             = HitDef
  TriggerAll       = Var(11) < 20
  TriggerAll       = Var(16) < 2
  Trigger1         = AnimElem = 6
  Trigger2         = AnimElem = 7
  Trigger3         = AnimElem = 8
  Attr             = A, SA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(50*FVar(4))<1,1,Floor(50*FVar(4))),60),10
  getpower = 60,30
  GivePower        = 10,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 10, 11
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -10, -45
  HitSound         = s3, IfElse(Var(30)>=2,21,IfElse(Var(30)=1,11,Var(1)%3+3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 19
  Ground.HitTime   = 20
  Ground.Velocity  = -4, -5
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -4, -5
  Fall             = 1
  Fall.Recover     = 0

[State 1200]
  Type     = MoveHitReset
  Trigger1 = MoveContact
  IgnoreHitPause = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 1200]
  Type     = ChangeState
  Trigger1 = Vel Y > 0 && Pos Y >= 0
  Value    = 52

;------------------------------------------------------------------------------;
; 強ネプチューンキラー
;------------------------------------------------------------------------------;
[Statedef 1250]
  Type        = A
  MoveType    = A
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
;  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1250
  PowerAdd    = 0
  SprPriority = 2

[State 1250]
  Type     = NotHitBy
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 4, < 0
  Value    = SCA
  IgnoreHitPause = 1

;--------------------------[ キャンセル ]----------------------------;

[State 1250]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(30) = [1,5]
  Time       = 5
  Add        = 230,230,230
  IgnoreHitPause = 1

;---------------------------[ 変数定義 ]-----------------------------;

[State 1250]
  Type       = VarAdd
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(31) > 0
  V          = 31
  Value      = -150
  IgnoreHitPause = 1

[State 1250 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 1250 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0

[State 1250 : キャンセル判定セット]
  Type       = VarSet
  TriggerAll = MoveContact
  Trigger1   = Var(30) = 1 || Var(30) = 5
  Trigger1   = Var(31) > 0
  V          = 10
  Value      = 5
  IgnoreHitPause = 1
  Persistent     = 0

[State 1250 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 4, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 1250 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 6
  IgnoreHitPause = 1
  Persistent     = 0

[State 1250]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 16
  Value    = 0
  IgnoreHitPause = 1

[State 1250]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 16
  Value    = 1
  IgnoreHitPause = 1

;---------------------------[ サウンド ]-----------------------------;

[State 1250]
  Type     = PlaySnd
  Trigger1 = Time = 0
  Value    = s1205, 0

;--------------------------[ エフェクト ]----------------------------;

[State 1250]
  Type        = Explod
  Trigger1    = AnimElem = 3
  Anim        = 1255
  ID          = 1200
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  Shadow      = 230,230,230
  IgnoreHitPause = 0

;---------------------------[ 移動関連 ]-----------------------------;

[State 1250]
  Type     = VelSet
  Trigger1 = AnimElem = 3
  X        = 4.5
  Y        = -8

[State 1250]
  Type     = VelAdd
  Trigger1 = AnimElem = 3, >= 0
  Y        = 0.25

[State 1250]
  Type     = VelAdd
  Trigger1 = AnimElem = 9, >= 0
  X        = -0.1
  Y        = 0.15

;--------------------------[ ヒット定義 ]----------------------------;

[State 1250]
  Type             = HitDef
  TriggerAll       = Var(11) < 20
  TriggerAll       = Var(16) < 1
  Trigger1         = AnimElem = 4
  Trigger2         = AnimElem = 5
  Attr             = A, SA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(120*FVar(4))<1,1,Floor(120*FVar(4))),130),24
  getpower = 60,30
  GivePower        = 10,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 11, 12
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -10, -55
  HitSound         = s3, IfElse(Var(30)>=2,21,IfElse(Var(30)=1,11,Var(1)%3+3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 20
  Ground.HitTime   = 22
  Ground.Velocity  = -4, -5.5
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -4, -5.5
  Fall             = 1
  Fall.Recover     = 0
  NoChainID        = IfElse(Var(30)=0,1550,0)

[State 1250]
  Type     = MoveHitReset
  Trigger1 = MoveContact
  IgnoreHitPause = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 1250]
  Type     = ChangeState
  Trigger1 = Vel Y > 0 && Pos Y >= 0
  Value    = 52

;------------------------------------------------------------------------------;
; モーニングスターアタック
;------------------------------------------------------------------------------;
[Statedef 1300]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1300
  PowerAdd    = 0
  SprPriority = 2

[State 1300]
  Type      = StateTypeSet
  Trigger1  = AnimElem = 2
  StateType = A
  Physics   = N

;--------------------------[ キャンセル ]----------------------------;

[State 1300]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(30) = [1,5]
  Time       = 5
  Add        = 230,230,230
  IgnoreHitPause = 1

;----------------------------[ ゲージ ]------------------------------;

[State 1300]
  Type     = PowerAdd
  Trigger1 = MoveHit = 1
  Value    = 0; 165
  IgnoreHitPause = 1

[State 1300]
  Type     = PowerAdd
  Trigger1 = MoveGuarded = 1
  Value    = 0; 20
  IgnoreHitPause = 1

;---------------------------[ 変数定義 ]-----------------------------;

[State 1300]
  Type       = VarAdd
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(31) > 0
  V          = 31
  Value      = -150
  IgnoreHitPause = 1

[State 1300 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 1300 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 1300 : キャンセル判定セット]
  Type       = VarSet
  TriggerAll = MoveContact
  Trigger1   = Var(30) = 5
  V          = 10
  Value      = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 1300 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 10, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 1300 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  Trigger1   = AnimElem = 10, = [0,3]
  V          = 11
  Value      = 4
  IgnoreHitPause = 1
  Persistent     = 0

[State 1300 : 追撃判定]
  Type       = VarSet
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  Trigger1   = AnimElem = 11, = [0,4]
  V          = 11
  Value      = 30
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 1300 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 8
  Value    = s1300, 0

;---------------------------[ 移動関連 ]-----------------------------;

[State 1300]
  Type     = VelSet
  Trigger1 = AnimElem = 2
  X        = 3
  Y        = -8.5

[State 1300]
  Type     = VelSet
  Trigger1 = AnimElem = 8
  Y        = 2.5

[State 1300]
  Type     = VelAdd
  Trigger1 = AnimElem = 2, >= 0
  Y        = 0.35

[State 1300]
  Type     = VelAdd
  Trigger1 = AnimElem = 10, >= 0
  X        = -0.1
  Y        = 0.15

;--------------------------[ ヒット定義 ]----------------------------;

[State 1300]
  Type             = HitDef
  TriggerAll       = Var(11) < 20
  Trigger1         = AnimElem = 10
  Attr             = A, SA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(70*FVar(4))<1,1,Floor(70*FVar(4))),80),14
  getpower = 30,15
  GivePower        = 10,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 11, 12
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -10, -76
  HitSound         = s1305, 0
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 19
  Ground.HitTime   = 20
  Ground.Velocity  = -4
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -4, 0
  Fall             = 1
  Fall.Recover     = 0

[State 1300]
  Type             = HitDef
  Trigger1         = AnimElem = 11
  Attr             = A, SA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(70*FVar(4))<1,1,Floor(70*FVar(4))),80),14
  getpower = 30,15
  GivePower        = 10,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = HA
  Priority         = 3, Hit
  PauseTime        = 11, 12
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -25, -35
  HitSound         = s1305, 0
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10+1
  Ground.Type      = Low
  Ground.SlideTime = 19
  Ground.HitTime   = 20
  Ground.Velocity  = 0
  Air.Type         = Low
  Air.HitTime      = 12
  Air.Velocity     = 0, 15
  Fall             = 1
  Fall.Recover     = 0

[State 1300]
  Type     = MoveHitReset
  Trigger1 = MoveContact
  IgnoreHitPause = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 1300]
  Type     = ChangeState
  Trigger1 = Vel Y > 0 && Pos Y >= 0
  Value    = 52

;------------------------------------------------------------------------------;
; モーニングスタークラッシュ
;------------------------------------------------------------------------------;
[Statedef 1350]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1350
  PowerAdd    = 0
  SprPriority = 2

[State 1350]
  Type      = StateTypeSet
  Trigger1  = AnimElem = 2
  StateType = A
  Physics   = N

;--------------------------[ キャンセル ]----------------------------;

[State 1350]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(30) = [1,5]
  Time       = 5
  Add        = 230,230,230
  IgnoreHitPause = 1

;---------------------------[ 変数定義 ]-----------------------------;

[State 1350]
  Type       = VarAdd
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(31) > 0
  V          = 31
  Value      = -150
  IgnoreHitPause = 1

[State 1350 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 1350 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 1350 : キャンセル判定セット]
  Type       = VarSet
  TriggerAll = MoveContact
  Trigger1   = Var(30) = 5
  V          = 10
  Value      = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 1350 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 10, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 1350 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 30
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 1350 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 8
  Value    = s1300, 1

;---------------------------[ 移動関連 ]-----------------------------;

[State 1350]
  Type     = VelSet
  Trigger1 = AnimElem = 2
  X        = 4.5
  Y        = -10

[State 1350]
  Type     = VelSet
  Trigger1 = AnimElem = 8
  Y        = 3.5

[State 1350]
  Type     = VelAdd
  Trigger1 = AnimElem = 2, >= 0
  Y        = 0.35

[State 1350]
  Type     = VelAdd
  Trigger1 = AnimElem = 10, >= 0
  X        = -0.15
  Y        = 0.15

;--------------------------[ ヒット定義 ]----------------------------;

[State 1350]
  Type             = HitDef
  TriggerAll       = Var(11) < 20
  Trigger1         = AnimElem = 11
  Attr             = A, SA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(125*FVar(4))<1,1,Floor(125*FVar(4))),135),25
  getpower = 60,30
  GivePower        = 10,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = HA
  Priority         = 3, Hit
  PauseTime        = 11, 12
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -25, -35
  HitSound         = s1305, 1
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10+1
  Ground.Type      = Low
  Ground.SlideTime = 21
  Ground.HitTime   = 22
  Ground.Velocity  = 0
  Air.Type         = Low
  Air.HitTime      = 12
  Air.Velocity     = 0, 15
  Fall             = 1
  Fall.Recover     = 0

;-------------------------[ ステート変更 ]---------------------------;

[State 1350]
  Type     = ChangeState
  Trigger1 = Vel Y > 0 && Pos Y >= 0
  Value    = 52

;------------------------------------------------------------------------------;
; 弱ライオンズシールド
;------------------------------------------------------------------------------;
[Statedef 1400]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1400
  PowerAdd    = 0
  SprPriority = 2

[State 1400]
  Type     = Null;HitBy
  Trigger1 = AnimElem = 4, >= 0 && AnimElem = 5, < 0
  Value    = SCA, NT, ST

;--------------------------[ キャンセル ]----------------------------;

[State 1400]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(30) = [1,5]
  Time       = 5
  Add        = 230,230,230
  IgnoreHitPause = 1

;---------------------------[ 変数定義 ]-----------------------------;

[State 1400]
  Type       = VarAdd
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(31) > 0
  V          = 31
  Value      = -150
  IgnoreHitPause = 1

[State 1400 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 1400 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 1400 : キャンセル判定セット]
  Type       = VarSet
  TriggerAll = MoveContact
  Trigger1   = Var(30) = 1 || Var(30) = 5
  Trigger1   = Var(31) > 0
  V          = 10
  Value      = 6
  IgnoreHitPause = 1
  Persistent     = 0

[State 1400 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 4, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 1400 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 4
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 1400 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 3
  Value    = s1400, 0

[State 1400 : SE]
  Type     = PlaySnd
  Trigger1 = AnimElem = 4
  Value    = s1405, 0

;--------------------------[ エフェクト ]----------------------------;

[State 1400]
  Type        = Explod
  Trigger1    = AnimElem = 4
  Anim        = 1405
  ID          = 1400
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  IgnoreHitPause = 0

;--------------------------[ ヒット定義 ]----------------------------;

[State 1400]
  Type             = HitDef
  TriggerAll       = Var(11) < 20
  Trigger1         = Time = 0
  Attr             = S, SA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(50*FVar(4))<1,1,Floor(50*FVar(4))),60),10
  getpower = 60,30
  GivePower        = 10,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 10, 11
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -10, -55
  HitSound         = s1405, 1
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 18
  Ground.HitTime   = 19
  Ground.Velocity  = -4
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3

;-------------------------[ ステート変更 ]---------------------------;

[State 1400]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; 強ライオンズシールド
;------------------------------------------------------------------------------;
[Statedef 1450]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1450
  SprPriority = 2

[State 1450]
  Type     = Null;HitBy
  Trigger1 = AnimElem = 4, >= 0 && AnimElem = 5, < 0
  Value    = SCA, NT, ST

;--------------------------[ キャンセル ]----------------------------;

[State 1450]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(30) = [1,5]
  Time       = 5
  Add        = 230,230,230
  IgnoreHitPause = 1

;---------------------------[ 変数定義 ]-----------------------------;

[State 1450]
  Type       = VarAdd
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(31) > 0
  V          = 31
  Value      = -150
  IgnoreHitPause = 1

[State 1450 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 1450 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 1450 : キャンセル判定セット]
  Type       = VarSet
  TriggerAll = MoveContact
  Trigger1   = Var(30) = 1 || Var(30) = 5
  Trigger1   = Var(31) > 0
  V          = 10
  Value      = 6
  IgnoreHitPause = 1
  Persistent     = 0

[State 1450 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 4, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 1450 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 4
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 1450 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 3
  Value    = s1400, 0

[State 1450 : SE]
  Type     = PlaySnd
  Trigger1 = AnimElem = 4
  Value    = s1405, 0

;--------------------------[ エフェクト ]----------------------------;

[State 1450]
  Type        = Explod
  Trigger1    = AnimElem = 4
  Anim        = 1455
  ID          = 1400
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  IgnoreHitPause = 0

;--------------------------[ ヒット定義 ]----------------------------;

[State 1450]
  Type             = HitDef
  TriggerAll       = Var(11) < 20
  Trigger1         = Time = 0
  Attr             = S, SA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(50*FVar(4))<1,1,Floor(50*FVar(4))),60),10
  getpower = 60,30
  GivePower        = 10,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 10, 11
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -10, -55
  HitSound         = s1405, 1
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 18
  Ground.HitTime   = 19
  Ground.Velocity  = -4
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3

;-------------------------[ ステート変更 ]---------------------------;

[State 1450]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; プカプカホバリング
;------------------------------------------------------------------------------;
[Statedef 1500]
  Type        = A
  MoveType    = A
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1500
  SprPriority = 2
  FaceP2       = 1

;--------------------------[ キャンセル ]----------------------------;

[State 1500]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(30) = [1,5]
  Time       = 5
  Add        = 230,230,230
  IgnoreHitPause = 1

;---------------------------[ 変数定義 ]-----------------------------;

[State 1500]
  Type       = VarAdd
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(31) > 0
  V          = 31
  Value      = -150
  IgnoreHitPause = 1

[State 1500 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0

[State 1500 : ボタン判定]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 14
  Value    = 0
  IgnoreHitPause = 1

[State 1500 : ユニコーンホーン]
  Type       = VarSet
  TriggerAll = Var(14) = 0
  TriggerAll = AnimElem = 4, >= 0 || (AnimElem = 3, > 0 && Var(31) > 0)
  Trigger1   = Command = "x" && Command != "y"
  Trigger2   = Command != "x" && Command = "y"
  V          = 14
  Value      = IfElse(Command="x",1,2)

[State 1500 : テュポーンスイング]
  Type       = VarSet
  TriggerAll = Var(14) = 0
  TriggerAll = AnimElem = 4, >= 0 || (AnimElem = 3, > 0 && Var(31) > 0)
  Trigger1   = Command = "a" && Command != "b"
  Trigger2   = Command != "a" && Command = "b"
  V          = 14
  Value      = IfElse(Command="a",3,4)

;--------------------------[ アニメ変更 ]----------------------------;

[State 1500]
  Type       = ChangeAnim
  TriggerAll = Anim = 1500
  Trigger1   = AnimTime = 0
  Trigger2   = AnimElem = 7, >= 0 || (AnimElem = 4, > 0 && Var(31) > 0)
  Trigger2   = Var(14) = 4
  Value      = 1510

;---------------------------[ サウンド ]-----------------------------;

[State 1500 : Voice]
  Type       = PlaySnd
  TriggerAll = Anim = 1500
  Trigger1   = AnimElem = 2
  Value      = s1500, 0

[State 1500 : SE]
  Type       = PlaySnd
  TriggerAll = Anim = 1500
  Trigger1   = AnimElem = 2
  Value      = s1505, 0

;---------------------------[ 移動関連 ]-----------------------------;

[State 1500]
  Type       = VelSet
  Triggerall = Anim = 1500
  Trigger1   = AnimElem = 7, >= 0 && AnimElem = 11, < 0
  Trigger2   = AnimElem = 15, >= 0 && AnimElem = 19, < 0
  Trigger3   = AnimElem = 23, >= 0
  Y          = -0.25

[State 1500]
  Type       = VelSet
  Triggerall = Anim = 1500
  Trigger1   = AnimElem = 11, >= 0 && AnimElem = 15, < 0
  Trigger2   = AnimElem = 19, >= 0 && AnimElem = 23, < 0
  Y          = 0.25

[State 1500]
  Type     = VelAdd
  Trigger1 = Anim = 1510
  Y        = 0.46

;-------------------------[ ステート変更 ]---------------------------;

[State 1500]
  Type     = ChangeState
  Trigger1 = Vel Y > 0 && Pos Y >= 0
  Value    = 52

[State 1500]
  Type       = ChangeState
  TriggerAll = Var(14) = [1,2]
  Trigger1   = Var(31) = 0
  Trigger1   = AnimElem = 6, >= 0
  Trigger2   = Var(31) > 0
  Trigger2   = AnimElem = 4, > 0
  Value      = 1550

[State 1500]
  Type       = ChangeState
  TriggerAll = Var(14) = 3
  Trigger1   = Var(31) = 0
  Trigger1   = AnimElem = 6, >= 0
  Trigger2   = Var(31) > 0
  Trigger2   = AnimElem = 4, > 0
  Value      = 1560

;------------------------------------------------------------------------------;
; ユニコーンホーン
;------------------------------------------------------------------------------;
[Statedef 1550]
  Type        = A
  MoveType    = A
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1550
  SprPriority = 2

;--------------------------[ アニメ変更 ]----------------------------;

[State 1550]
  Type       = ChangeAnim
  TriggerAll = Var(14) = 2
  Trigger1   = Anim = 1550
  Trigger1   = AnimElem = 4, = 4
  Value      = 1555

;---------------------------[ 変数定義 ]-----------------------------;

[State 1550 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 1550 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 1550 : キャンセル判定セット]
  Type       = VarSet
  TriggerAll = MoveContact
  Trigger1   = Var(30) = 1 || Var(30) = 5
  Trigger1   = Var(31) > 0
  V          = 10
  Value      = 6
  IgnoreHitPause = 1
  Persistent     = 0

[State 1550 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 4, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 1550 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 4
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 1550]
  Type     = PlaySnd
  Trigger1 = AnimElem = 3
  Value    = s1510, 0

;---------------------------[ 移動関連 ]-----------------------------;

[State 1550]
  Type       = VelSet
  TriggerAll = Anim = 1550
  Trigger1   = AnimElem = 1;, >= 0 && AnimElem = 3, < 0
  X          = -3
  Y          = -2

[State 1550]
  Type       = VelSet
  TriggerAll = Anim = 1550
  TriggerAll = Var(14) = 1
  Trigger1   = AnimElem = 3;, >= 0
  X          = 5
  Y          = 5

[State 1550]
  Type       = VelSet
  TriggerAll = Anim = 1555
  TriggerAll = Var(14) = 2
  Trigger1   = AnimElem = 1;, >= 0
  X          = 7.5
  Y          = 5

;--------------------------[ ヒット定義 ]----------------------------;

[State 1550]
  Type             = HitDef
  TriggerAll       = Var(11) < 20
  Trigger1         = Time = 0
  Attr             = A, SA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(140*FVar(4))<1,1,Floor(140*FVar(4))),150),10
  getpower = 30,15
  GivePower        = 10,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 11, 12
  SparkNo          = s6100
  Guard.SparkNo    = s6402
  SparkXY          = -10, -15
  HitSound         = s4, IfElse(Var(30)>=2,2,Var(30))*10+1
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 19
  Ground.HitTime   = 20
  Ground.Velocity  = -4.5, -5.5
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -4.5, -5.5
  Fall             = 1
  Fall.Recover     = 0
  ID               = 1550

;-------------------------[ ステート変更 ]---------------------------;

[State 1550]
  Type     = ChangeState
  Trigger1 = Vel Y > 0 && Pos Y >= 0
  Value    = 52

;------------------------------------------------------------------------------;
; テュポーンスイング
;------------------------------------------------------------------------------;
[Statedef 1560]
  Type        = A
  MoveType    = A
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1560
  PowerAdd    = 0
  SprPriority = 2

;---------------------------[ サウンド ]-----------------------------;

[State 1560]
  Type     = PlaySnd
  Trigger1 = AnimElem = 3
  Value    = 1510, 0

;---------------------------[ 移動関連 ]-----------------------------;

[State 1550]
  Type     = VelSet
  Trigger1 = AnimElem = 1;, >= 0 && AnimElem = 3, < 0
  X        = -3
  Y        = -3

[State 1550]
  Type     = VelSet
  Trigger1 = AnimElem = 4;, >= 0
  X        = 5
  Y        = 5

;--------------------------[ ヒット定義 ]----------------------------;

[State 1560]
  Type        = HitDef
getpower = 30,15
  Trigger1    = Time = 0
  Attr        = S, ST
  HitFlag     = M-
  Priority    = 1, Miss
  SparkNo     = -1
  SparkXY     = -14, -45
  SprPriority = 1
  P1Facing    = 1
  P2Facing    = 1
  P1StateNo   = 1570
  P2StateNo   = 1580
  Fall        = 1

;-------------------------[ ステート変更 ]---------------------------;

[State 1560]
  Type     = ChangeState
  Trigger1 = Vel Y > 0 && Pos Y >= 0
  Value    = 52

;------------------------------------------------------------------------------;
; テュポーンスイング（投げ）
;------------------------------------------------------------------------------;
[Statedef 1570]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1570
  PowerAdd    = 0
  SprPriority = 3

[State 1570]
  Type     = SprPriority
  Trigger1 = AnimElem = 6
  Value    = 2

[State 1570]
  Type     = SprPriority
  Trigger1 = AnimElem = 7
  Value    = 3

;---------------------------[ 移動関連 ]-----------------------------;

[State 1570]
  Type     = PosSet
  Trigger1 = Time = 0
  Y        = 0

[State 1570]
  Type     = VelSet
  Trigger1 = AnimElem = 7
  X        = -6.5

[State 1570]
  Type     = VelSet
  Trigger1 = AnimElem = 8
  X        = -0

;---------------------------[ サウンド ]-----------------------------;

[State 1570 : SE]
  Type     = PlaySnd
  Trigger1 = Time = 0
  Value    = 805, 0

[State 1570 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 7
  Value    = 1510, 1

;--------------------------[ エフェクト ]----------------------------;

[State 1570]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 6301
  Pos         = 15, -45
  PosType     = P1
  BindTime    = -1
  OwnPal      = 1
  OnTop       = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

[State 1570]
  Type        = Explod
  Trigger1    = AnimElem = 3
  Anim        = 3206
  Pos         = 0, -15
  PosType     = P1
  BindTime    = -1
  OwnPal      = 1
  OnTop       = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999


;---------------------------[ 相手制御 ]-----------------------------;

[State 1570]
  Type     = TargetBind
  Trigger1 = AnimElem = 2, < 0
  Pos      = 5, 0

[State 1570]
  Type     = TargetBind
  Trigger1 = AnimElem = 2, >= 0 && AnimElem = 3, < 0
  Pos      = 15, 0

[State 1570]
  Type     = TargetBind
  Trigger1 = AnimElem = 3, >= 0 && AnimElem = 6, < 0
  Pos      = 0, 0

[State 1570]
  Type     = TargetBind
  Trigger1 = AnimElem = 6, >= 0 && AnimElem = 7, < 0
  Pos      = -10, 0

[State 1570]
  Type     = TargetBind
  Trigger1 = AnimElem = 7
  Pos      = 10, 0

[State 1570]
  Type     = TargetLifeAdd
  Trigger1 = AnimElem = 7
  Value    = -150

[State 1570]
  Type     = TargetState
  Trigger1 = AnimElem = 7
  Value    = 1590

;-------------------------[ ステート変更 ]---------------------------;

[State 1570]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; テュポーンスイング（やられ１）
;------------------------------------------------------------------------------;
[Statedef 1580]
  Type        = A
  MoveType    = H
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  SprPriority = 2

;--------------------------[ アニメ変更 ]----------------------------;

[State 1580]
  Type     = ChangeAnim2
  Trigger1 = Time = 0
  Value    = 1580

;------------------------------------------------------------------------------;
; テュポーンスイング（やられ２）
;------------------------------------------------------------------------------;
[Statedef 1590]
  Type        = A
  MoveType    = H
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = -4.5, -12
  SprPriority = 2

;--------------------------[ アニメ変更 ]----------------------------;

[State 1580]
  Type       = ChangeAnim2
  TriggerAll = Time = 0
  Trigger1   = SelfAnimExist(5052)
  Value      = 1590

[State 1580]
  Type       = ChangeAnim2
  TriggerAll = Time = 0
  Trigger1   = !SelfAnimExist(5052)
  Value      = 1595

;---------------------------[ 移動関連 ]-----------------------------;

[State 1590]
  Type     = VelAdd
  Trigger1 = 1
  Y        = 0.45

;-------------------------[ ステート変更 ]---------------------------;

[State 1590]
  Type       = ChangeState
  Triggerall = Vel Y > 0
  Triggerall = Pos Y >= -20
  Triggerall = alive
  Triggerall = CanRecover
  Trigger1   = Command = "recovery"
  Value      = 5200

[State 1590]
  Type       = SelfState
  Triggerall = Vel Y > 0
  Triggerall = alive
  Triggerall = CanRecover
  Trigger1   = Command = "recovery"
  Value      = 5210 

[State 1590]
  Type     = SelfState
  Trigger1 = Vel Y > 0
  Trigger1 = Pos Y >= 0
  Value    = 5100 

;------------------------------------------------------------------------------;
; ライフフラワー
;------------------------------------------------------------------------------;
[Statedef 1600]
  Type        = S
poweradd = 20
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1600
  SprPriority = 2

;--------------------------[ キャンセル ]----------------------------;

[State 1600]
  Type       = PalFx
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(30) = [1,5]
  Time       = 5
  Add        = 230,230,230
  IgnoreHitPause = 1

;---------------------------[ 変数定義 ]-----------------------------;

[State 1600]
  Type       = VarAdd
  TriggerAll = Time = 0
  Trigger1   = Var(10) = [5,6]
  Trigger1   = Var(31) > 0
  V          = 31
  Value      = -150
  IgnoreHitPause = 1

[State 1600 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 1600 : ライフフラワー判定]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 17
  Value    = IfElse(Command="22XY",0,IfElse(Command="22AB",1,2))
  IgnoreHitPause = 1

[State 1600 : リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 18
  Value    = 0
  IgnoreHitPause = 1

;---------------------------[ サウンド ]-----------------------------;

[State 1600]
  Type     = PlaySnd
  Trigger1 = AnimElem = 20
  Value    = s1600, 0

;---------------------------[ ヘルパー ]-----------------------------;

[State 1600]
  Type       = Helper
  Trigger1   = AnimElem = 19
  Name       = "LifeFlower"
  StateNo    = 1650
  ID         = 1600
  Pos        = 60, 5
  PosType    = P1
  HelperType = Normal
  OwnPal     = 1
  KeyCtrl    = 1
  IgnoreHitPause = 1
  SuperMoveTime  = 999999
  PauseMoveTime  = 999999

;-------------------------[ ステート変更 ]---------------------------;

[State 1600]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; ライフフラワー（ヘルパー）
;------------------------------------------------------------------------------;
[Statedef 1650]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1650
  SprPriority = 2

[State 1650]
  Type     = AssertSpecial
  Trigger1 = 1
  Flag     = NoAutoTurn

;---------------------------[ 変数定義 ]-----------------------------;

[State 1650 : ライフフラワー判定]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 17
  Value    = Root,Var(17)

[State 1650 : プレイヤーとの距離] ; ヘルパー内の変数に代入
  Type     = VarSet
  Trigger1 = AnimElem = 2, < 0
  V        = 18
  Value    = Abs(RootDist X)

[State 1600 : 敵との距離]         ; ヘルパー内の変数に代入
  Type     = VarSet
  Trigger1 = AnimElem = 2, < 0
  V        = 19
  Value    = Abs(P2Dist X)

[State 1650 : プレイヤーに効果を付加する]
  Type       = ParentVarSet
  TriggerAll = Root,Var(18) = 0
  TriggerAll = AnimElem = 2, >= 0
  Trigger1   = Abs(RootDist X) < 40
  Trigger1   = Var(18) < Var(19)
  V          = 18
  Value      = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 1650 : 敵に効果を付加する]
  Type       = ParentVarSet
  TriggerAll = Root,Var(18) = 0
  TriggerAll = AnimElem = 2, >= 0
  Trigger1   = Abs(P2Dist X) < 40
  Trigger1   = Var(18) > Var(19)
  V          = 18
  Value      = 2
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 1650]
  Type     = PlaySnd
  Trigger1 = Time = 32
  Value    = s1605, 0

;--------------------------[ エフェクト ]----------------------------;

[State 1650]
  Type        = Explod
  Trigger1    = Time = 0
  Anim        = 1655
  ID          = 1650
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  IgnoreHitPause = 1

[State 1650]
  Type        = Explod
  TriggerAll  = Var(17) = 2
  Trigger1    = MoveContact
  Anim        = 1670
  ID          = 1670
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  OwnPal      = 1
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ ヘルパー ]-----------------------------;

[State 1650]
  Type       = Helper
  Trigger1   = Time = 60
  Name       = "Heart1"
  StateNo    = 1660
  ID         = 1660
  Pos        = 0, -40
  PosType    = P1
  HelperType = Normal
  OwnPal     = 1
  IgnoreHitPause = 1

[State 1650]
  Type       = Helper
  Trigger1   = Time = 60
  Name       = "Heart2"
  StateNo    = 1665
  ID         = 1660
  Pos        = 20, -20
  PosType    = P1
  HelperType = Normal
  OwnPal     = 1
  IgnoreHitPause = 1

[State 1650]
  Type       = Helper
  Trigger1   = Time = 60
  Name       = "Heart3"
  StateNo    = 1670
  ID         = 1660
  Pos        = -20, -20
  PosType    = P1
  HelperType = Normal
  OwnPal     = 1
  IgnoreHitPause = 1

;--------------------------[ ヒット定義 ]----------------------------;

[State 1650]
  Type             = HitDef
  TriggerAll       = Var(17) = 2
  Trigger1         = Root,Var(18) = [1,2]
  Trigger1         = AnimElem = 2
  Attr             = S, SA
  Damage           = 240, 0
getpower = 30,15
  AnimType         = DiagUp
  HitFlag          = MAF
;  GuardFlag       = MA
  AffectTeam       = B
  Priority         = 3, Hit
  PauseTime        = 9, 10
  SparkNo          = s6002
  Guard.SparkNo    = s6402
  SparkXY          = -25, -45
  HitSound         = s1005, 4
  GuardSound       = s120, IfElse(Root,Var(30)>=2,2,Root,Var(30))*10+1
  Ground.Type      = High
  Ground.SlideTime = 5
  Ground.HitTime   = 12
  Ground.Velocity  = 0, -15
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = 0, -15
  Fall             = 1
  Fall.Recover     = 0
; ガード不可の場合，GuardFlagを記述しない．

;-------------------------[ ステート変更 ]---------------------------;

[State 1650]
  Type     = ChangeState
  Trigger1 = AnimElem = 3
  Trigger2 = Var(17) = [0,1]
  Trigger2 = Root,Var(18) = [1,2]
  Trigger3 = Var(17) = 2
  Trigger3 = Root,Var(18) = [1,2]
  Trigger3 = MoveContact
  Value    = 1655

;------------------------------------------------------------------------------;
; ライフフラワー（ヘルパー，削除）
;------------------------------------------------------------------------------;
[Statedef 1655]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 1655 : ]
  Type       = ParentVarSet
  TriggerAll = Root,Var(18) != 0
  Trigger1   = Time = 2
  V          = 18
  Value      = 3
  IgnoreHitPause = 1

;---------------------------[ サウンド ]-----------------------------;

[State 1655 : SE]
  Type     = PlaySnd
  Trigger1 = Var(17) = 2
  Trigger1 = NumExplod(1670) = 1
  Value    = s1605, 2
  Persistent = 0

[State 1655 : SE]
  Type     = PlaySnd
  Trigger1 = Root,Var(18) = 3
  Trigger1 = Var(17) = [0,1]
  Value    = s1605, 1
  Persistent = 0

;-------------------------[ ステート変更 ]---------------------------;

[State 1655 : このヘルパーを消す]
  Type     = DestroySelf
  Trigger1 = AnimTime = 0
  Trigger2 = Root,Var(18) = 3

;------------------------------------------------------------------------------;
; ライフフラワー（ヘルパー，ハート１）
;------------------------------------------------------------------------------;
[Statedef 1660]
  Type        = A
  MoveType    = I
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1660
  SprPriority = 2

[State 1660]
  Type     = AssertSpecial
  Trigger1 = 1
  Flag     = NoShadow
  Flag2    = NoAutoTurn
  IgnoreHitPause = 1

;--------------------------[ エフェクト ]----------------------------;

[State 1660]
  Type     = Trans
  Trigger1 = Time >= 36
  Trans    = AddAlpha
  Alpha    = 256-(Time-36)*16, (Time-36)*16

;---------------------------[ 移動関連 ]-----------------------------;

[State 1660]
  Type     = VelSet
  Trigger1 = Time = [0, 14]
  Trigger2 = Time = [30,44]
  X        = 0.2*(Random%10+1)

[State 1660]
  Type     = VelSet
  Trigger1 = Time = [15,29]
  Trigger2 = Time = [45,59]
  X        = -0.2*(Random%10+1)

[State 1660]
  Type     = VelSet
  Trigger1 = 1
  Y        = -1.5

;-------------------------[ ステート変更 ]---------------------------;

[State 1660 : このヘルパーを消す]
  Type     = DestroySelf
  Trigger1 = AnimTime = 0
  Trigger2 = Root,Var(18) = 3

;------------------------------------------------------------------------------;
; ライフフラワー（ヘルパー，ハート２）
;------------------------------------------------------------------------------;
[Statedef 1665]
  Type        = A
  MoveType    = I
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1660
  SprPriority = 2

[State 1665]
  Type     = AssertSpecial
  Trigger1 = 1
  Flag     = NoShadow
  Flag2    = NoAutoTurn
  IgnoreHitPause = 1

;--------------------------[ エフェクト ]----------------------------;

[State 1665]
  Type     = Trans
  Trigger1 = Time >= 36
  Trans    = AddAlpha
  Alpha    = 256-(Time-36)*16, (Time-36)*16

;---------------------------[ 移動関連 ]-----------------------------;

[State 1665]
  Type     = VelSet
  Trigger1 = Time = [0, 14]
  Trigger2 = Time = [30,44]
  X        = 0.2*(Random%10+1)

[State 1665]
  Type     = VelSet
  Trigger1 = Time = [15,29]
  Trigger2 = Time = [45,59]
  X        = -0.2*(Random%10+1)

[State 1665]
  Type     = VelSet
  Trigger1 = 1
  Y        = -1.5

;-------------------------[ ステート変更 ]---------------------------;

[State 1665 : このヘルパーを消す]
  Type     = DestroySelf
  Trigger1 = AnimTime = 0
  Trigger2 = Root,Var(18) = 3

;------------------------------------------------------------------------------;
; ライフフラワー（ヘルパー，ハート３）
;------------------------------------------------------------------------------;
[Statedef 1670]
  Type        = A
  MoveType    = I
  Physics     = N
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 1660
  SprPriority = 2

[State 1670]
  Type     = AssertSpecial
  Trigger1 = 1
  Flag     = NoShadow
  Flag2    = NoAutoTurn
  IgnoreHitPause = 1

;--------------------------[ エフェクト ]----------------------------;

[State 1670]
  Type     = Trans
  Trigger1 = Time >= 36
  Trans    = AddAlpha
  Alpha    = 256-(Time-36)*16, (Time-36)*16

;---------------------------[ 移動関連 ]-----------------------------;

[State 1670]
  Type     = VelSet
  Trigger1 = Time = [0, 14]
  Trigger2 = Time = [30,44]
  X        = 0.2*(Random%10+1)

[State 1670]
  Type     = VelSet
  Trigger1 = Time = [15,29]
  Trigger2 = Time = [45,59]
  X        = -0.2*(Random%10+1)

[State 1670]
  Type     = VelSet
  Trigger1 = 1
  Y        = -1.5

;-------------------------[ ステート変更 ]---------------------------;

[State 1670 : このヘルパーを消す]
  Type     = DestroySelf
  Trigger1 = AnimTime = 0
  Trigger2 = Root,Var(18) = 3
