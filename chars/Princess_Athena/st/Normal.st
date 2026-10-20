; FileName : Normal.st
;------------------------------------------------------------------------------;
;■■■■■■■■■■■■■■■■■■■目次■■■■■■■■■■■■■■■■■■;
; 通常攻撃（立ち）
; ・遠距離弱パンチ                     : State 200
; ・近距離弱パンチ                     : State 205
; ・遠距離強パンチ                     : State 210
; ・近距離強パンチ                     : State 215
; ・遠距離弱キック                     : State 230
; ・近距離弱キック                     : State 235
; ・遠距離強キック                     : State 240
; ・近距離強キック                     : State 245
;
; 通常攻撃（屈み）
; ・屈み弱パンチ                       : State 400
; ・屈み強パンチ                       : State 410
; ・屈み弱キック                       : State 430
; ・屈み強キック                       : State 440
;
; 通常攻撃（空中）
; ・空中弱パンチ                       : State 600
; ・空中強パンチ                       : State 610
; ・空中弱キック                       : State 630
; ・空中強キック                       : State 640
;
; 特殊攻撃
; ・イカルスの靴                       : State 250
; ・特殊技                             : State 260
;
; 投げ
; ・シルキースルー                     : State 800
;
;■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■;
;==============================================================================;
; 通常攻撃（立ち）
;==============================================================================;
;------------------------------------------------------------------------------;
; 遠距離弱パンチ
;------------------------------------------------------------------------------;
[Statedef 200]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 200
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 200 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 200 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 200 : キャンセル判定セット]
  Type       = VarSet
  TriggerAll = MoveContact
  Trigger1   = Var(30) = 5
  V          = 10
  Value      = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 200 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 3, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 200 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 10
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 200 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 2
  Value    = s200, Var(1)%6

[State 200 : SE]
  Type     = PlaySnd
  Trigger1 = AnimElem = 2
  Value    = s1, 2

;--------------------------[ ヒット定義 ]----------------------------;

[State 200]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = Var(11) < 10
  Attr             = S, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(20*FVar(4))<1,1,Floor(20*FVar(4))),30),0
  getpower = 30,15
  GivePower        = 5,10
  AnimType         = Light
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 7, 8
  SparkNo          = s6100
  Guard.SparkNo    = s6400
  SparkXY          = -10, -35
  HitSound         = s4, IfElse(Var(30)>=2,2,Var(30))*10
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10
  Ground.Type      = High
  Ground.SlideTime = 8
  Ground.HitTime   = 9
  Ground.Velocity  = -4
  Air.Type         = High
  Air.Velocity     = -1.4, -3
  Air.HitTime      = 12
  ID               = 200
  NoChainID        = 800

;-------------------------[ ステート変更 ]---------------------------;

[State 200]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; 近距離弱パンチ
;------------------------------------------------------------------------------;
[Statedef 205]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 205
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 205 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 205 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 205 : キャンセル判定セット]
  Type     = VarSet
  Trigger1 = MoveContact
  V        = 10
  Value    = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 205 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 3, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 205 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 10
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 205 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 1
  Value    = s200, Var(1)%6

[State 205 : SE : NBC, 02UM]
  Type       = PlaySnd
  TriggerAll = Var(30) = [0,1]
  Trigger1   = AnimElem = 1
  Value      = s1, Var(30)*10

[State 205 : SE : XI, ARRANGE]
  Type       = PlaySnd
  TriggerAll = Var(30) = [2,5]
  Trigger1   = AnimElem = 1
  Value      = s1, 20

;--------------------------[ ヒット定義 ]----------------------------;

[State 205]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = Var(11) < 10
  Attr             = S, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(20*FVar(4))<1,1,Floor(20*FVar(4))),30),0
  getpower = 30,15
  GivePower        = 5,10
  AnimType         = Light
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 7, 8
  SparkNo          = s6000
  Guard.SparkNo    = s6400
  SparkXY          = -10, -65
  HitSound         = s2, IfElse(Var(30)>=2,20,IfElse(Var(30)=1,10,Var(1)%3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10
  Ground.Type      = High
  Ground.SlideTime = 5
  Ground.HitTime   = 6
  Ground.Velocity  = -5.5
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3
  ID               = 200
  NoChainID        = 800

;-------------------------[ ステート変更 ]---------------------------;

[State 205]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; 遠距離強パンチ
;------------------------------------------------------------------------------;
[Statedef 210]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 210
  PowerAdd    = 0
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 210 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 210 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 210 : キャンセル判定セット]
  Type       = VarSet
  TriggerAll = MoveContact
  Trigger1   = Var(30) = 0 || Var(30) = 5
  V          = 10
  Value      = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 210 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 3, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 210 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 10
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 210 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 3
  Value    = s210, Var(1)%6

[State 210 : SE]
  Type     = PlaySnd
  Trigger1 = AnimElem = 3
  Value    = s1, 2

;--------------------------[ エフェクト ]----------------------------;

[State 210 : ]
  Type        = Explod
  Trigger1    = AnimElem = 4
  Anim        = 211
  ID          = 200
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  IgnoreHitPause = 1

;--------------------------[ ヒット定義 ]----------------------------;

[State 210]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = Var(11) < 10
  Attr             = S, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(70*FVar(4))<1,1,Floor(70*FVar(4))),80),0
  getpower = 30,15
  GivePower        = 5,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 10, 11
  SparkNo          = s6100
  Guard.SparkNo    = s6401
  SparkXY          = 0, -60
  HitSound         = s4, IfElse(Var(30)>=2,2,Var(30))*10+1
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10
  Ground.Type      = High
  Ground.SlideTime = 17
  Ground.HitTime   = 18
  Ground.Velocity  = -4
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3
  ID               = 200
  NoChainID        = 800

;-------------------------[ ステート変更 ]---------------------------;

[State 210]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; 近距離強パンチ
;------------------------------------------------------------------------------;
[Statedef 215]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 215
  PowerAdd    = 0
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 215 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 215 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 215 : キャンセル判定セット]
  Type     = VarSet
  Trigger1 = MoveContact
  V        = 10
  Value    = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 215 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 3, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 215 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 10
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 215 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 3
  Value    = s210, Var(1)%6

[State 215 : SE : NBC]
  Type       = PlaySnd
  TriggerAll = Var(30) = 0
  Trigger1   = AnimElem = 3
  Value      = s1, 0

[State 215 : SE : 02UM]
  Type       = PlaySnd
  TriggerAll = Var(30) = 1
  Trigger1   = AnimElem = 3
  Value      = s1, 11

[State 215 : SE : XI, ARRANGE]
  Type       = PlaySnd
  TriggerAll = Var(30) = [2,5]
  Trigger1   = AnimElem = 3
  Value      = s1, 21

;--------------------------[ ヒット定義 ]----------------------------;

[State 215]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = Var(11) < 10
  Attr             = S, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(55*FVar(4))<1,1,Floor(55*FVar(4))),65),0
  getpower = 30,15
  GivePower        = 5,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 11, 12
  SparkNo          = s6001
  Guard.SparkNo    = s6401
  SparkXY          = -10, -76
  HitSound         = s2, IfElse(Var(30)>=2,21,IfElse(Var(30)=1,11,Var(1)%3+3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10
  Ground.Type      = High
  Ground.SlideTime = 16
  Ground.HitTime   = 18
  Ground.Velocity  = -8
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -8, -3
  ID               = 200
  NoChainID        = 800

;-------------------------[ ステート変更 ]---------------------------;

[State 215]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; 遠距離弱キック
;------------------------------------------------------------------------------;
[Statedef 230]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 230
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 230 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 230 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 230 : キャンセル判定セット]
  Type     = VarSet
  Trigger1 = MoveContact
  V        = 10
  Value    = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 230 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 3, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 230 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 10
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 230 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 1
  Value    = s200, Var(1)%6

[State 230 : SE : NBC]
  Type       = PlaySnd
  TriggerAll = Var(30) = 0
  Trigger1   = AnimElem = 1
  Value      = s1, 1

[State 230 : SE : 02UM]
  Type       = PlaySnd
  TriggerAll = Var(30) = 1
  Trigger1   = AnimElem = 1
  Value      = s1, 10

[State 230 : SE : XI, ARRANGE]
  Type       = PlaySnd
  TriggerAll = Var(30) = [2,5]
  Trigger1   = AnimElem = 1
  Value      = s1, 22

;--------------------------[ ヒット定義 ]----------------------------;

[State 230]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = Var(11) < 10
  Attr             = S, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(40*FVar(4))<1,1,Floor(40*FVar(4))),50),0
  getpower = 30,15
  GivePower        = 5,10
  AnimType         = Light
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 8, 9
  SparkNo          = s6000
  Guard.SparkNo    = s6400
  SparkXY          = -10, -25
  HitSound         = s3, IfElse(Var(30)>=2,20,IfElse(Var(30)=1,10,Var(1)%3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10
  Ground.Type      = High
  Ground.SlideTime = 10
  Ground.HitTime   = 12
  Ground.Velocity  = -5.5
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3
  ID               = 200
  NoChainID        = 800

;-------------------------[ ステート変更 ]---------------------------;

[State 230]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; 近距離弱キック
;------------------------------------------------------------------------------;
[Statedef 235]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 235
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 235 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 235 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 235 : キャンセル判定セット]
  Type       = VarSet
  TriggerAll = MoveContact
  Trigger1   = Var(30) != 0
  V          = 10
  Value      = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 235 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 3, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 235 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 10
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 235 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 2
  Value    = s200, Var(1)%6

[State 235 : SE : NBC, 02UM]
  Type       = PlaySnd
  TriggerAll = Var(30) = [0,1]
  Trigger1   = AnimElem = 2
  Value      = s1, Var(30)*10+1

[State 235 : SE : XI, ARRANGE]
  Type       = PlaySnd
  TriggerAll = Var(30) = [2,5]
  Trigger1   = AnimElem = 2
  Value      = s1, 22

;--------------------------[ ヒット定義 ]----------------------------;

[State 235]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = Var(11) < 10
  Attr             = S, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(20*FVar(4))<1,1,Floor(20*FVar(4))),30),0
  getpower = 30,15
  GivePower        = 5,10
  AnimType         = Light
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 7, 8
  SparkNo          = s6000
  Guard.SparkNo    = s6400
  SparkXY          = -10, -60
  HitSound         = s3, IfElse(Var(30)>=2,20,IfElse(Var(30)=1,10,Var(1)%3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10
  Ground.Type      = High
  Ground.SlideTime = 6
  Ground.HitTime   = 7
  Ground.Velocity  = -6
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3
  ID               = 200
  NoChainID        = 800

;-------------------------[ ステート変更 ]---------------------------;

[State 235]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; 遠距離強キック
;------------------------------------------------------------------------------;
[Statedef 240]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 240
  PowerAdd    = 0
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 240 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 240 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 240 : キャンセル判定セット]
  Type       = VarSet
  TriggerAll = MoveContact
  Trigger1   = Var(30) = 5
  V          = 10
  Value      = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 240 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 3, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 240 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 10
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 240 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 3
  Value    = s210, Var(1)%6

[State 240 : SE : NBC, 02UM]
  Type       = PlaySnd
  TriggerAll = Var(30) = [0,1]
  Trigger1   = AnimElem = 3
  Value      = s1, Var(30)*10+1

[State 240 : SE : XI, ARRANGE]
  Type       = PlaySnd
  TriggerAll = Var(30) = [2,5]
  Trigger1   = AnimElem = 3
  Value      = s1, 23

;--------------------------[ ヒット定義 ]----------------------------;

[State 240]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = Var(11) < 10
  Attr             = S, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(65*FVar(4))<1,1,Floor(65*FVar(4))),75),0
  getpower = 30,15
  GivePower        = 5,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 10, 11
  SparkNo          = s6001
  Guard.SparkNo    = s6401
  SparkXY          = -10, -76
  HitSound         = s3, IfElse(Var(30)>=2,21,IfElse(Var(30)=1,11,Var(1)%3+3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10
  Ground.Type      = High
  Ground.SlideTime = 16
  Ground.HitTime   = 18
  Ground.Velocity  = -6
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3
  ID               = 200
  NoChainID        = 800

;-------------------------[ ステート変更 ]---------------------------;

[State 240]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; 近距離強キック
;------------------------------------------------------------------------------;
[Statedef 245]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 245
  PowerAdd    = 0
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 245 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 245 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 245 : キャンセル判定セット]
  Type     = VarSet
  Trigger1 = MoveContact
  V        = 10
  Value    = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 245 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 3, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 245 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 10
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 245 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 3
  Value    = s210, Var(1)%6

[State 245 : SE : NBC, 02UM]
  Type       = PlaySnd
  TriggerAll = Var(30) = [0,1]
  Trigger1   = AnimElem = 3
  Value      = s1, Var(30)*10+1

[State 245 : SE : XI, ARRANGE]
  Type       = PlaySnd
  TriggerAll = Var(30) = [2,5]
  Trigger1   = AnimElem = 3
  Value      = s1, 23

;--------------------------[ ヒット定義 ]----------------------------;

[State 245]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = Var(11) < 10
  Attr             = S, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(55*FVar(4))<1,1,Floor(55*FVar(4))),65),0
  getpower = 30,15
  GivePower        = 5,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 10, 11
  SparkNo          = s6001
  Guard.SparkNo    = s6401
  SparkXY          = -10, -76
  HitSound         = s3, IfElse(Var(30)>=2,21,IfElse(Var(30)=1,11,Var(1)%3+3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10
  Ground.Type      = High
  Ground.SlideTime = 16
  Ground.HitTime   = 18
  Ground.Velocity  = -5.5
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3
  ID               = 200
  NoChainID        = 800

;-------------------------[ ステート変更 ]---------------------------;

[State 245]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;==============================================================================;
; 通常攻撃（屈み）
;==============================================================================;
;------------------------------------------------------------------------------;
; 屈み弱パンチ
;------------------------------------------------------------------------------;
[Statedef 400]
  Type        = C
  MoveType    = A
  Physics     = C
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 400
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 400 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 400 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 400 : キャンセル判定セット]
  Type     = VarSet
  Trigger1 = MoveContact
  V        = 10
  Value    = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 400 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 3, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 400 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 10
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 400 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 1
  Value    = s200, Var(1)%6

[State 400 : SE : NBC, 02UM]
  Type       = PlaySnd
  TriggerAll = Var(30) = [0,1]
  Trigger1   = AnimElem = 1
  Value      = s1, Var(30)*10

[State 400 : SE : XI, ARRANGE]
  Type       = PlaySnd
  TriggerAll = Var(30) = [2,5]
  Trigger1   = AnimElem = 1
  Value      = s1, 20

;--------------------------[ ヒット定義 ]----------------------------;

[State 400]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = Var(11) < 10
  Attr             = C, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(20*FVar(4))<1,1,Floor(20*FVar(4))),30),0
  getpower = 30,15
  GivePower        = 5,10
  AnimType         = Light
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 7, 8
  SparkNo          = s6000
  Guard.SparkNo    = s6400
  SparkXY          = -10, -30
  HitSound         = s2, IfElse(Var(30)>=2,20,IfElse(Var(30)=1,10,Var(1)%3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10
  Ground.Type      = High
  Ground.SlideTime = 10
  Ground.HitTime   = 12
  Ground.Velocity  = -6
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3
  ID               = 200
  NoChainID        = 800

;-------------------------[ ステート変更 ]---------------------------;

[State 400]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 11
  Ctrl     = 1

;------------------------------------------------------------------------------;
; 屈み強パンチ
;------------------------------------------------------------------------------;
[Statedef 410]
  Type        = C
  MoveType    = A
  Physics     = C
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 410
  PowerAdd    = 0
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 410 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 410 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 410 : キャンセル判定セット]
  Type     = VarSet
  Trigger1 = MoveContact
  V        = 10
  Value    = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 410 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 3, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 410 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 10
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 410 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 5
  Value    = s210, Var(1)%6

[State 410]
  Type     = PlaySnd
  Trigger1 = AnimElem = 5
  Value    = s1, 2

;--------------------------[ エフェクト ]----------------------------;

[State 410]
  Type        = Explod
  Trigger1    = AnimElem = 4
  Anim        = 411
  ID          = 200
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  IgnoreHitPause = 1

;--------------------------[ ヒット定義 ]----------------------------;

[State 410]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = Var(11) < 10
  Attr             = C, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(60*FVar(4))<1,1,Floor(60*FVar(4))),70),0
  getpower = 30,15
  GivePower        = 5,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = L
  Priority         = 3, Hit
  PauseTime        = 10, 11
  SparkNo          = s6100
  Guard.SparkNo    = s6401
  SparkXY          = -10, -15
  HitSound         = s4, IfElse(Var(30)>=2,2,Var(30))*10+1
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10
  Ground.Type      = Low
  Ground.SlideTime = 21
  Ground.HitTime   = 22
  Ground.Velocity  = -11
  Air.Type         = Low
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3
  ID               = 200
  NoChainID        = 800

;-------------------------[ ステート変更 ]---------------------------;

[State 410]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 11
  Ctrl     = 1

;------------------------------------------------------------------------------;
; 屈み弱キック
;------------------------------------------------------------------------------;
[Statedef 430]
  Type        = C
  MoveType    = A
  Physics     = C
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 430
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 430 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 430 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 430 : キャンセル判定セット]
  Type     = VarSet
  Trigger1 = MoveContact
  V        = 10
  Value    = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 430 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 3, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 430 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 10
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 430 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 1
  Value    = s200, Var(1)%6

[State 430 : SE : NBC, 02UM]
  Type       = PlaySnd
  TriggerAll = Var(30) = 0
  Trigger1   = AnimElem = 1
  Value      = s1, 1

[State 430 : SE : NBC, 02UM]
  Type       = PlaySnd
  TriggerAll = Var(30) = 1
  Trigger1   = AnimElem = 1
  Value      = s1, 10

[State 430 : SE : XI, ARRANGE]
  Type       = PlaySnd
  TriggerAll = Var(30) = [2,5]
  Trigger1   = AnimElem = 1
  Value      = s1, 22

;--------------------------[ ヒット定義 ]----------------------------;

[State 430]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = Var(11) < 10
  Attr             = C, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(20*FVar(4))<1,1,Floor(20*FVar(4))),30),0
  getpower = 30,15
  GivePower        = 5,10
  AnimType         = Light
  HitFlag          = MAF
  GuardFlag        = L
  Priority         = 3, Hit
  PauseTime        = 6, 7
  SparkNo          = s6000
  Guard.SparkNo    = s6400
  SparkXY          = -10, -15
  HitSound         = s3, IfElse(Var(30)>=2,20,IfElse(Var(30)=1,10,Var(1)%3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10
  Ground.Type      = High
  Ground.SlideTime = 14
  Ground.HitTime   = 15
  Ground.Velocity  = -5.5
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3
  ID               = 200
  NoChainID        = 800

;-------------------------[ ステート変更 ]---------------------------;

[State 430]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 11
  Ctrl     = 1

;------------------------------------------------------------------------------;
; 屈み強キック
;------------------------------------------------------------------------------;
[Statedef 440]
  Type        = C
  MoveType    = A
  Physics     = C
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 440
  PowerAdd    = 0
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 440 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 440 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 440 : キャンセル判定セット]
  Type       = VarSet
  TriggerAll = MoveContact
  Trigger1   = Var(30) = 5
  V          = 10
  Value      = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 440 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 3, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 440 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 30
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 440 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 1
  Value    = s210, Var(1)%6

[State 440 : SE : NBC, 02UM]
  Type       = PlaySnd
  TriggerAll = Var(30) = [0,1]
  Trigger1   = AnimElem = 1
  Value      = s1, Var(30)*10+1

[State 440 : SE : XI, ARRANGE]
  Type       = PlaySnd
  TriggerAll = Var(30) = [2,5]
  Trigger1   = AnimElem = 1
  Value      = s1, 23

[State 440 : SE]
  Type     = PlaySnd
  Trigger1 = AnimElem = 2
  Value    = s440, 0

;---------------------------[ 移動関連 ]-----------------------------;

[State 440]
  Type     = VelSet
  Trigger1 = AnimElem = 2
  Trigger2 = AnimElem = 3
  X        = 7.5

;--------------------------[ ヒット定義 ]----------------------------;

[State 440]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = Var(11) < 10
  Attr             = C, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(55*FVar(4))<1,1,Floor(55*FVar(4))),65),0
  getpower = 30,15
  GivePower        = 5,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = L
  Priority         = 3, Hit
  PauseTime        = 10, 11
  SparkNo          = s6001
  Guard.SparkNo    = s6401
  SparkXY          = -10, -15
  HitSound         = s3, IfElse(Var(30)>=2,21,IfElse(Var(30)=1,11,Var(1)%3+3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10
  Ground.Type      = Trip
  Ground.SlideTime = 20
  Ground.HitTime   = 21
  Ground.Velocity  = -1.5, -7.4
  Air.Type         = Trip
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3
  YAccel           = 0.58
  Fall             = 1
  Fall.Recover     = 0
  ID               = 200
  NoChainID        = 800

;-------------------------[ ステート変更 ]---------------------------;

[State 440]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 11
  Ctrl     = 1

;==============================================================================;
; 通常攻撃（空中）
;==============================================================================;
;------------------------------------------------------------------------------;
; 空中弱パンチ
;------------------------------------------------------------------------------;
[Statedef 600]
  Type        = A
  MoveType    = A
  Physics     = A
  Juggle      = 0
  ;Commonly-used controllers:
  Ctrl        = 0
  Anim        = 600
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 600 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 600 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 600 : キャンセル判定セット]
  Type     = VarSet
  Trigger1 = MoveContact
  V        = 10
  Value    = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 600 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 3, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 600 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 10
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 600 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 2
  Value    = s200, Var(1)%6

[State 600 : SE]
  Type     = PlaySnd
  Trigger1 = AnimElem = 2
  Value    = s1, 2

;--------------------------[ ヒット定義 ]----------------------------;

[State 600]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = Var(11) < 10
  Attr             = A, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(20*FVar(4))<1,1,Floor(20*FVar(4))),30),0
  getpower = 30,15
  GivePower        = 5,10
  AnimType         = Light
  HitFlag          = MAF
  GuardFlag        = HA
  Priority         = 3, Hit
  PauseTime        = 7, 8
  SparkNo          = s6100
  Guard.SparkNo    = s6400
  SparkXY          = -10, -45
  HitSound         = s4, IfElse(Var(30)>=2,2,Var(30))*10
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10
  Ground.Type      = High
  Ground.SlideTime = 10
  Ground.HitTime   = 12
  Ground.Velocity  = -4.5
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3
  ID               = 200
  NoChainID        = 800

;------------------------------------------------------------------------------;
; 空中強パンチ
;------------------------------------------------------------------------------;
[Statedef 610]
  Type        = A
  MoveType    = A
  Physics     = A
  Juggle      = 0
  ;Commonly-used controllers:
  Ctrl        = 0
  Anim        = 610
  PowerAdd    = 0
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 610 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 610 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 610 : キャンセル判定セット]
  Type     = VarSet
  Trigger1 = MoveContact
  V        = 10
  Value    = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 610 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 3, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 610 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 10
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 610 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 3
  Value    = s210, Var(1)%6

[State 610 : SE]
  Type     = PlaySnd
  Trigger1 = AnimElem = 3
  Value    = s1, 2

;--------------------------[ エフェクト ]----------------------------;

[State 610]
  Type        = Explod
  Trigger1    = AnimElem = 4
  Anim        = 611
  ID          = 200
  Pos         = 0, 0
  PosType     = P1
  SprPriority = 3
  BindTime    = -1
  OwnPal      = 1
  IgnoreHitPause = 1

;--------------------------[ ヒット定義 ]----------------------------;

[State 610]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = Var(11) < 10
  Attr             = A, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(60*FVar(4))<1,1,Floor(60*FVar(4))),70),0
  getpower = 30,15
  GivePower        = 5,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = HA
  Priority         = 3, Hit
  PauseTime        = 11, 12
  SparkNo          = s6100
  Guard.SparkNo    = s6401
  SparkXY          = -10, -40
  HitSound         = s4, IfElse(Var(30)>=2,2,Var(30))*10+1
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10
  Ground.Type      = High
  Ground.SlideTime = 18
  Ground.HitTime   = 19
  Ground.Velocity  = -4
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -4, -3
  ID               = 200
  NoChainID        = 800

;------------------------------------------------------------------------------;
; 空中弱キック
;------------------------------------------------------------------------------;
[Statedef 630]
  Type        = A
  MoveType    = A
  Physics     = A
  Juggle      = 0
  ;Commonly-used controllers:
  Ctrl        = 0
  Anim        = 630
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 630 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 630 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 630 : キャンセル判定セット]
  Type       = VarSet
  TriggerAll = MoveContact
  Trigger1   = Var(30) != 0
  V          = 10
  Value      = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 630 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 3, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 630 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 10
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 630 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 1
  Value    = s200, Var(1)%6

[State 630 : SE : NBC]
  Type       = PlaySnd
  TriggerAll = Var(30) = 0
  Trigger1   = AnimElem = 1
  Value      = s1, 1

[State 630 : SE : NBC, 02UM]
  Type       = PlaySnd
  TriggerAll = Var(30) = 1
  Trigger1   = AnimElem = 1
  Value      = s1, 10

[State 630 : SE : XI, ARRANGE]
  Type       = PlaySnd
  TriggerAll = Var(30) = [2,5]
  Trigger1   = AnimElem = 1
  Value      = s1, 22

;--------------------------[ ヒット定義 ]----------------------------;

[State 630]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = Var(11) < 10
  Attr             = A, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(22*FVar(4))<1,1,Floor(22*FVar(4))),32),0
  getpower = 30,15
  GivePower        = 5,10
  AnimType         = Light
  HitFlag          = MAF
  GuardFlag        = HA
  Priority         = 3, Hit
  PauseTime        = 7, 8
  SparkNo          = s6000
  Guard.SparkNo    = s6400
  SparkXY          = -10, -35
  HitSound         = s3, IfElse(Var(30)>=2,20,IfElse(Var(30)=1,10,Var(1)%3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10
  Ground.Type      = High
  Ground.SlideTime = 10
  Ground.HitTime   = 12
  Ground.Velocity  = -4
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3
  ID               = 200
  NoChainID        = 800

;------------------------------------------------------------------------------;
; 空中強キック
;------------------------------------------------------------------------------;
[Statedef 640]
  Type        = A
  MoveType    = A
  Physics     = A
  Juggle      = 0
  ;Commonly-used controllers:
  Ctrl        = 0
  Anim        = 640
  PowerAdd    = 0
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 640 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 640 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 640 : キャンセル判定セット]
  Type       = VarSet
  TriggerAll = MoveContact
  Trigger1   = Var(30) != 0
  V          = 10
  Value      = 2
  IgnoreHitPause = 1
  Persistent     = 0

[State 640 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 3, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 640 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 10
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 640 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 1
  Value    = s210, Var(1)%6

[State 640 : SE : NBC, 02UM]
  Type       = PlaySnd
  TriggerAll = Var(30) = [0,1]
  Trigger1   = AnimElem = 1
  Value      = s1, Var(30)*10+1

[State 640 : SE : XI, ARRANGE]
  Type       = PlaySnd
  TriggerAll = Var(30) = [2,5]
  Trigger1   = AnimElem = 1
  Value      = s1, 23

;--------------------------[ ヒット定義 ]----------------------------;

[State 640]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = Var(11) < 10
  Attr             = A, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(70*FVar(4))<1,1,Floor(70*FVar(4))),80),0
  getpower = 30,15
  GivePower        = 5,10
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = HA
  Priority         = 3, Hit
  PauseTime        = 11, 12
  SparkNo          = s6001
  Guard.SparkNo    = s6401
  SparkXY          = -10, -45
  HitSound         = s3, IfElse(Var(30)>=2,21,IfElse(Var(30)=1,11,Var(1)%3+3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10
  Ground.Type      = High
  Ground.SlideTime = 18
  Ground.HitTime   = 19
  Ground.Velocity  = -4
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -1.4, -3
  ID               = 200
  NoChainID        = 800

;==============================================================================;
; 特殊攻撃
;==============================================================================;
;------------------------------------------------------------------------------;
; イカルスの靴
;------------------------------------------------------------------------------;
[Statedef 250]
  Type        = S
  MoveType    = I
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 250
  SprPriority = 2

[State 250]
  Type      = StateTypeSet
  Trigger1  = AnimElem = 2
  StateType = A
  Physics   = N

;---------------------------[ 変数定義 ]-----------------------------;

[State 250 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

;---------------------------[ サウンド ]-----------------------------;

[State 250]
  Type       = PlaySnd
  TriggerAll = Var(30) = [0,1]
  Trigger1   = AnimElem = 2
  Value      = s40, Var(30)*10

[State 250]
  Type       = PlaySnd
  TriggerAll = Var(30) = [2,5]
  Trigger1   = AnimElem = 2
  Value      = s40, 21

;---------------------------[ 移動関連 ]-----------------------------;

[State 250]
  Type     = VelSet
  Trigger1 = AnimElem = 2
  X        = 9
  Y        = -7.5

[State 250]
  Type     = VelAdd
  Trigger1 = AnimElem = 2, >= 0
  X        = -0.075
  Y        = 0.275

[State 250]
  Type     = VelAdd
  Trigger1 = AnimElem = 7, >= 0
  Y        = 0.0275

;-------------------------[ ステート変更 ]---------------------------;

[State 250]
  Type     = ChangeState
  Trigger1 = Vel Y > 0 && Pos Y >= 0
  Value    = 52

;------------------------------------------------------------------------------;
; 特殊技
;------------------------------------------------------------------------------;
[Statedef 260]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 260
  SprPriority = 2

;--------------------------[ アニメ変更 ]----------------------------;

[State 260]
  Type       = ChangeAnim
  TriggerAll = Time = 0
  Trigger1   = Var(10) = 2
  Value      = 265
  IgnoreHitPause = 1

;---------------------------[ 変数定義 ]-----------------------------;

[State 260 : コンボ数カウント]
  Type     = VarAdd
  Trigger1 = MoveHit = 1
  V        = 2
  Value    = 1
  IgnoreHitPause = 1
  Persistent     = 0

[State 260 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 260 : キャンセル判定セット]
  Type       = VarSet
  TriggerAll = MoveContact
  Trigger1   = Var(30) != 0
  V          = 10
  Value      = 3
  IgnoreHitPause = 1
  Persistent     = 0

[State 260 : 相手のステートタイプ]
  Type     = VarSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 9, < 0
  V        = 9
  Value    = IfElse(P2StateType=A,1,0)
  IgnoreHitPause = 1
  Persistent     = 1

[State 260 : 追撃判定]
  Type       = VarAdd
  TriggerAll = MoveHit = 1
  Trigger1   = Var(9) = 1
  V          = 11
  Value      = 10
  IgnoreHitPause = 1
  Persistent     = 0

;---------------------------[ サウンド ]-----------------------------;

[State 260 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 8
  Value    = s210, Var(1)%3

[State 260 : SE : NBC, 02UM]
  Type       = PlaySnd
  TriggerAll = Var(30) = 0
  Trigger1   = AnimElem = 8
  Value      = s1, 0

[State 260 : SE : NBC, 02UM]
  Type       = PlaySnd
  TriggerAll = Var(30) = 1
  Trigger1   = AnimElem = 8
  Value      = s1, 11

[State 260 : SE : XI, ARRANGE]
  Type       = PlaySnd
  TriggerAll = Var(30) = [2,5]
  Trigger1   = AnimElem = 8
  Value      = s1, 21

;---------------------------[ 移動関連 ]-----------------------------;

[State 250]
  Type     = VelSet
  Trigger1 = AnimElem = 1, >= 0 && AnimElem = 6, < 0
  X        = 2.5

[State 250]
  Type     = PosAdd
  Trigger1 = AnimElem = 8
  X        = 25

;--------------------------[ ヒット定義 ]----------------------------;

[State 260]
  Type             = HitDef
  TriggerAll       = Time = 0
  Trigger1         = Var(11) < 10
  Attr             = S, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(70*FVar(4))<1,1,Floor(70*FVar(4))),80),0
getpower = 30,15
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = HA
  Priority         = 3, Hit
  PauseTime        = 9, 10
  SparkNo          = s6001
  Guard.SparkNo    = s6401
  SparkXY          = -10, -76
  HitSound         = s2, IfElse(Var(30)>=2,21,IfElse(Var(30)=1,11,Var(1)%3+3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10+1
  Ground.Type      = High
  Ground.Slidetime = 16
  Ground.HitTime   = 17
  Ground.Velocity  = -4
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -4, -7.5
  Air.Fall         = 1
  Fall.Recover     = 0
  ID               = 200

[State 260]
  Type             = HitDef
  Trigger1         = Time = 0
  Attr             = S, NA
  Damage           = IfElse(Var(3)=0,IfElse(Floor(50*FVar(4))<1,1,Floor(50*FVar(4))),60),0
getpower = 30,15
  AnimType         = Hard
  HitFlag          = MAF
  GuardFlag        = MA
  Priority         = 3, Hit
  PauseTime        = 9, 10
  SparkNo          = s6001
  Guard.SparkNo    = s6401
  SparkXY          = -10, -76
  HitSound         = s2, IfElse(Var(30)>=2,21,IfElse(Var(30)=1,11,Var(1)%3+3))
  GuardSound       = s120, IfElse(Var(30)>=2,2,Var(30))*10+1
  Ground.Type      = High
  Ground.Slidetime = 16
  Ground.HitTime   = 17
  Ground.Velocity  = -4
  Air.Type         = High
  Air.HitTime      = 12
  Air.Velocity     = -4, -4.5
  Air.Fall         = 1
  Fall.Recover     = 0
  ID               = 200

;-------------------------[ ステート変更 ]---------------------------;

[State 260]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;==============================================================================;
; 投げ
;==============================================================================;
;------------------------------------------------------------------------------;
; シルキースルー
;------------------------------------------------------------------------------;
[Statedef 800]
  Type        = S
  MoveType    = A
  Physics     = S
  Juggle      = 0
  ;Commonly-used controllers:
  VelSet      = 0, 0
  Ctrl        = 0
  Anim        = 800
  SprPriority = 2

;---------------------------[ 変数定義 ]-----------------------------;

[State 800 : キャンセル判定リセット]
  Type     = VarSet
  Trigger1 = Time = 0
  V        = 10
  Value    = 0
  IgnoreHitPause = 1

[State 800 : ボタン判定]
  Type       = VarSet
  TriggerAll = Var(30) = [1,2]
  TriggerAll = Time = 0
  Trigger1   = Command = "y" || Command = "b"
  V          = 14
  Value      = IfElse(Command = "b",1,0)
  IgnoreHitPause = 1

;---------------------------[ サウンド ]-----------------------------;

[State 800 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 3
  Value    = s800, 0

;--------------------------[ ヒット定義 ]----------------------------;

[State 800]
  Type          = HitDef
getpower = 60,30
  TriggerAll    = Var(30) = 0 || Var(30) = 5
  Trigger1      = Time = 0
  Attr          = S, NT
  HitFlag       = M-
  Priority      = 1, Miss
  SparkNo       = s6300
  SparkXY       = -14, -45
  P1SprPriority = 1
  P2SprPriority = 0
  P1Facing      = IfElse(Command="holdback",1,-1)
  P2Facing      = 1
  P1StateNo     = 810
  P2StateNo     = 820
  Fall          = 1
  ID            = 800
  NoChainID     = 200

[State 800]
  Type          = HitDef
getpower = 60,30
  TriggerAll    = Var(30) = [1,2]
  Trigger1      = Time = 0
  Attr          = S, NT
  HitFlag       = M-
  Priority      = 1, Miss
  SparkNo       = s6300
  SparkXY       = -14, -45
  P1SprPriority = 1
  P2SprPriority = 0
  P1Facing      = IfElse(Var(14)=0,-1,1)
  P2Facing      = 1
  P1StateNo     = 810
  P2StateNo     = 820
  Fall          = 1
  ID            = 800
  NoChainID     = 200

;-------------------------[ ステート変更 ]---------------------------;

[State 800]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; 投げている自分
;------------------------------------------------------------------------------;
[Statedef 810]
  Type     = S
  MoveType = A
  Physics  = N
  Anim     = 810

;---------------------------[ サウンド ]-----------------------------;

[State 810 : Voice]
  Type     = PlaySnd
  Trigger1 = AnimElem = 7
  Value    = s800, 1

[State 810 : SE]
  Type     = PlaySnd
  Trigger1 = AnimElem = 1
  Value    = s805, IfElse(Var(30)>=2,2,Var(30))*10

;---------------------------[ 相手制御 ]-----------------------------;

[State 810]
  Type     = TargetBind
  Trigger1 = AnimElem = 2, < 0
  pos      = 30, 0

[State 810]
  Type     = TargetBind
  Trigger1 = AnimElem = 2, >= 0 && AnimElem = 3, < 0
  pos      = 20, 0

[State 810]
  Type     = TargetBind
  Trigger1 = AnimElem = 3, >= 0 && AnimElem = 4, < 0
  pos      = 10, 0

[State 810]
  Type     = TargetBind
  Trigger1 = AnimElem = 4, >= 0 && AnimElem = 6, < 0
  pos      = -10, 0

[State 810]
  Type     = TargetBind
  Trigger1 = AnimElem = 6 >= 0 && AnimElem = 7, < 0
  pos      = -20, 0

[State 810]
  Type     = TargetLifeAdd
  Trigger1 = AnimElem = 7
  Value    = -150

[State 810]
  Type     = TargetState
  Trigger1 = AnimElem = 7
  Value    = 825

;-------------------------[ ステート変更 ]---------------------------;

[State 810]
  Type     = ChangeState
  Trigger1 = AnimTime = 0
  Value    = 0
  Ctrl     = 1

;------------------------------------------------------------------------------;
; 投げられている相手
;------------------------------------------------------------------------------;
[Statedef 820]
  Type     = A
  MoveType = H
  Physics  = N
  VelSet   = 0, 0

;--------------------------[ アニメ変更 ]----------------------------;

[State 820]
  Type     = ChangeAnim2
  Trigger1 = Time = 0
  Value    = 820

;------------------------------------------------------------------------------;
; 投げ・相手の空中の状態
;------------------------------------------------------------------------------;
[Statedef 825]
  Type     = A
  MoveType = H
  Physics  = N
  VelSet   = 2.8, -7
  PowerAdd = 40

;---------------------------[ 移動関連 ]-----------------------------;

[State 825] ;これは重力これは毎フレーム事に0.4の力が加わります
  Type     = VelAdd
  Trigger1 = 1
  Y        = 0.4

;-------------------------[ ステート変更 ]---------------------------;

[State 825]
  Type       = ChangeState
  Triggerall = Vel Y > 0
  Triggerall = Pos Y >= -20
  Triggerall = alive
  Triggerall = CanRecover
  Trigger1   = Command = "recovery"
  Value      = 5200

[State 825]
  Type       = SelfState
  Triggerall = Vel Y > 0
  Triggerall = alive
  Triggerall = CanRecover
  Trigger1   = Command = "recovery"
  Value      = 5210 

[State 825]
  Type     = SelfState
  Trigger1 = Vel Y > 0
  Trigger1 = Pos Y >= 0
  Value    = 5100 

