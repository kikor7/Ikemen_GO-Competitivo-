
;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
;アルカナハート３ システム制御ステート
;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝




;=================================================================================
 | ホ ー ミ ン グ|
;=================================================================================

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;ニュートラルホーミング / 開始
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 900]
type     = A
movetype = I
physics  = N
ctrl     = 0
velset   = 0, 0

[State 900]
Type     = turn
Trigger1 = !Time
Trigger1 = P2Dist X<0

[State 900, 速度]
type     = velset
trigger1 = time = 2
Y        = -0.1

;-------------------------------------------------[アニメ変更]

[state 900]
type     = changeanim
trigger1 = !time
trigger1 = Pos Y < 0
value    = 901

[state 900]
type     = changeanim
trigger1 = !time
trigger1 = Pos Y >= 0
value    = 900

[State 900]
Type     = PlaySnd
Trigger1 = !Time
value    = s10, 0

;------------------------------------------[ステート変更]

[State a]
Type     = Helper
Trigger1 = !time
Name     = "Homing"
Stateno  = 8900
ID       = 8900
Pos      = 0, -50
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 0;99999
PauseMoveTime = 0;99999
IgnoreHitPause = 1
Persistent = 0

[State 900, a]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 910



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;キャンセルホーミング / 開始
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 905]
type     = A
movetype = I
physics  = N
ctrl     = 0

[State 905]
Type = turn
Trigger1 = !Time
Trigger1 = P2Dist X<0

[State 905, 速度]
type     = VelSet
Trigger1 = !time
X = 0
Y = -0.1

;-------------------------------------------------[アニメ変更]

[state 905]
type     = changeanim
trigger1 = !time
trigger1 = Pos Y < 0
value    = 901

[state 905]
type     = changeanim
trigger1 = !time
trigger1 = Pos Y >= 0
value    = 900

[State 905]
Type     = PlaySnd
Trigger1 = !Time
value    = s10, 0

[State 905, 判定リセット]
type     = Varset
Trigger1 = !time
var(0)   = 0

;------------------------------------------[変数処理]

[State 905, キャンセル判定]
type       = Varset
TriggerAll = !time
trigger1 = prevstateno = [200,240]		;立ち
trigger2 = prevstateno = [400,440]		;しゃがみ
trigger3 = prevstateno = [600,620]		;空中
trigger4 = prevstateno = [300,320]		;吹っ飛ばし
trigger5 = prevstateno = [1000,1020]	;ミサイル系統
trigger6 = prevstateno = [1100,1170]	;ラリアット系統
trigger7 = prevstateno = [1200,1240]	;押しつぶし系統
trigger8 = prevstateno = [1300,1310]	;どんけつ系統
trigger9 = prevstateno = [800,846]		;投げ系統
var(0)   = 1

[state 905, 回復停止];キャンセル判定
type       = Varset
triggerAll = !time
TriggerAll = fvar(22) < 30
trigger1   = var(0) = 1
fVar(22)   = 30

[state 905, ゲージ消費];キャンセル判定
type     = VarAdd
trigger1 = !time
trigger1 = var(0) = 1
fVar(20) = -1000

[State a];ホーミング補正
type     = VarAdd
trigger1 = !time
trigger1 = var(0) = 1
fvar(3)  = (1.0-fvar(3))*0.3

;------------------------------------------[ステート変更]

[State a]
Type     = Helper
Trigger1 = !time
Name     = "Homing"
Stateno  = 8900
ID       = 8900 + var(0)
Pos      = 0, -50
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 0;99999
PauseMoveTime = 0;99999
IgnoreHitPause = 1
Persistent = 0

[State 905, a]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 910






;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ニュートラルホーミング / 移動中
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 910]
type     = A
movetype = I
physics  = N
ctrl     = 0
sprpriority = 1

[State 910, 効果音]
type     = PlaySnd
trigger1 = animelem = 1
trigger2 = gametime%18 = 0
value    = s10, 1

[State a]
Type     = Helper
trigger1 = time != 0
trigger1 = gametime % 17 = 0
Name     = "hit"
Stateno  = 8910
ID       = 8910
Pos      = 0, -60
PosType  = P1
OwnPal   = 1
size.xscale = 0.5
size.yscale = 0.5
SuperMoveTime = 999
PauseMoveTime = 999

;-----------------------------------------------[アニメ変更]

[State 910, アニメ変更];上
Type     = Changeanim
Trigger1 = anim != 905
Trigger1 = command != "holddown"
Trigger1 = Vel Y < -3.0
value    = 905

[State 910, アニメ変更];横
Type     = Changeanim
Trigger1 = anim != 906
Trigger1 = (command != "holdup")||(command != "holddown")
Trigger1 = (Vel Y = [-3.0, 3.0])
value    = 906

[State 910, アニメ変更];下
Type     = Changeanim
Trigger1 = anim != 907
Trigger1 = command != "holdup"
Trigger1 = Vel Y > 3.0
value    = 907

;=====================================[加速制御]

[State 910, リセット]
type     = Varset
trigger1 = !time
fvar(18) = 1.0

[State 910, 加速1]
type     = Varset
Trigger1 = Command = "z"
Trigger1 = fvar(27) = 1.0
fvar(18) = 1.3

[State 910, 加速2]
type     = Varset
Trigger1 = Command = "z"
Trigger1 = fvar(27) = 1.3
fvar(18) = 1.5

;--------------------------------------[レバー操作感度]

[State 910, リセット]
Type     = VarSet
Trigger1 = !time
fvar(17) = 0

[State 910, 変数]
type     = VarAdd
trigger1 = FVar(17) <= 6.0
trigger1 = time = [1,6]
fvar(17) = 0.03

[State 910, 変数]
type     = VarAdd
trigger1 = FVar(17) <= 6.0
trigger1 = time = [7,12]
fvar(17) = 0.05

[State 910, 変数]
type     = VarAdd
trigger1 = FVar(17) <= 6.0
trigger1 = time >= 13
fvar(17) = 0.6

;--------------------------------------

[State -2, 相手のＸ座標]
type     = VarSet
trigger1 = 1
fvar(25) = (P2Dist X *1.01) / 10

[State -2, 相手のY座標]
type     = VarSet
trigger1 = 1
fvar(26) = (P2Dist Y *1.01)/ 10

[State -2, 速度管理]
type     = VarSet
trigger1 = 1
fvar(24) = (Vel X)+(Vel Y)

;=====================================[旋回パターン]

[State 910, X速度]
type       = VelAdd
trigger1   = 1
X          = (0.65 * Cos(Atan(fvar(26)/fvar(25))))*(FVar(18)) + 0.000001

[State 910, Y速度]
type       = VelAdd
trigger1   = 1
Y          = (0.65 * Sin(Atan(fvar(26)/fvar(25))))*(FVar(18)) + 0.000001

[State 910, Ｘ軸減速、移動速度]
type     = VelAdd
Trigger1 = FVar(18) = 1.0            ;加速無し
Trigger1 = (fvar(24)) > 13.0   ;加速度 * 2
Trigger2 = FVar(18) = 2            ;加速+1
Trigger2 = (fvar(24)) > 26.0   ;加速度 * 4
Trigger3 = FVar(18) = 3            ;加速+1
Trigger3 = (fvar(24)) > 39.0   ;加速度 * 6
X        = (-0.65*cos(Atan(FVar(26)/FVar(25))))*(FVar(18)) + 0.000001

[State 910, Ｙ軸減速、移動速度]
type     = null;VelAdd
triggerAll = P2BodyDist X  >= 20
Trigger1 = FVar(18) = 1.0            ;加速無し
Trigger1 = (fvar(24)) > 13.0   ;加速度 * 2
Trigger2 = FVar(18) = 2            ;加速+1
Trigger2 = (fvar(24)) > 26.0   ;加速度 * 4
Trigger3 = FVar(18) = 3            ;加速+1
Trigger3 = (fvar(24)) > 39.0   ;加速度 * 6
Y        = (-0.65*Sin(Atan(FVar(26)/FVar(25))))*(FVar(18)) + 0.000001

[state 910, 速度減速] ;停止用
type     = VelSet
trigger1 = P2bodydist X <= 10                   ;相手にここまで近寄って
trigger1 = P2bodydist Y = [-300,300]            ;ここまでの高さになったらリセット
X        = 0

[state 910, 速度減速] ;停止用
type     = VelSet
trigger1 = P2bodydist X <= 100                  ;相手にここまで近寄って
trigger1 = P2bodydist Y = [-30,0]               ;ここまでの高さになったらリセット
Y        = 0

;-------------------------------------------------[減速処理]

[State 910, 移動速度Ｘ軸] ;正面の距離が離れている。後ろ方向レバー入力
type       = VelSet
TriggerAll = FVar(25) >= abs(FVar(26))
TriggerAll = P2BodyDist X >= 20
Trigger1   = Command = "holdback"
Trigger1   = time <= 13
X          = 1.0 + FVar(17)

[state 910, 移動速度Y軸] ;真下の相手に対し、上方向
Type       = Velset
Trigger1   = P2BodyDist X  <= 20
Trigger1   = P2BodyDist Y = [0,150]
Trigger1   = Command = "holdup"
Y          = 2.5

[State 910, 移動速度Ｙ軸] ;下方向減速
Type       = VelSet
Trigger1   = abs(FVar(26)) > FVar(25)+10
Trigger1   = P2BodyDist X >= 120
Trigger1   = P2BodyDist Y <= -100
Trigger1   = Command = "holddown"
Trigger1   = !(Vel X > 0)
Trigger1   = time <= 13
Y          = -1.0 + FVar(17)

[State 910, 移動速度Ｙ軸] ;上方向減速
Type       = VelSet
Trigger1   = abs(FVar(26)) > FVar(25)+10
Trigger1   = P2BodyDist X >= 120
Trigger1   = P2BodyDist Y >= 100
Trigger1   = Command = "holdup"
Trigger1   = !(Vel X < 0)
Trigger1   = time <= 13
Y          = 1.0 + FVar(17)

;-------------------------------------------------[加速処理]

[State 910, 移動速度] ;レバー入力Ｙ軸制御、下方向（密着以上以上）
Type       = VelSet
TriggerAll = FVar(25) >= abs(FVar(26))
Trigger1   = P2BodyDist X >= 21
Trigger1   = Command = "holddown"
Y          = 4.0 / FVar(18)

[state 910, 移動速度-Y1] ;レバー入力Ｙ軸制御1
type       = Velset
TriggerAll = FVar(25) > abs(FVar(26))
TriggerAll = (P2BodyDist Y >= 150) || (P2BodyDist Y <= -150)
trigger1   = P2BodyDist X >= 20
trigger1   = P2BodyDist X  <= 199
Trigger1   = command = "holdup"
Y          = (P2BodyDist X / 50) / FVar(18)

[state 910, 移動速度-Y2] ;レバー入力Ｙ軸制御2
Type       = Velset
TriggerAll = FVar(25) >= abs(FVar(26))
Trigger1   = P2BodyDist X  >= 200
Trigger1   = Command = "holdup"
Y          = -(P2BodyDist X / 100) / FVar(18)

[state 910, 移動速度-Y3] ;レバー入力Ｙ軸制御3
type       = Velset
triggerAll = FVar(25) >= abs(FVar(26))
trigger1   = P2BodyDist X  = [400,599]
trigger1   = Command = "holdup"
Y          = -(P2BodyDist X / 200) / FVar(18)

[state 910, 移動速度-Y4] ;レバー入力Ｙ軸制御4
type       = Velset
triggerAll = FVar(25) >= abs(FVar(26))
trigger1   = P2BodyDist X  = [600,799]
trigger1   = Command = "holdup"
Y          = -(P2BodyDist X / 300) / FVar(18)

[state 910, 移動速度-Y3] ;レバー入力Ｙ軸制御5
type       = Velset
triggerAll = FVar(25) >= abs(FVar(26))
trigger1   = P2BodyDist X  = [800,999]
trigger1   = Command = "holdup"
Y          = -(P2BodyDist X / 400) / FVar(18)


[State 910, 移動速度] ;レバー入力Ｘ軸制御（遠距離）
Type       = VelSet
Triggerall = abs(FVar(26)) > FVar(25)+10
Trigger1   = (P2BodyDist Y >= 151) || (P2BodyDist Y <= -151)
Trigger1   = Command = "holdfwd"
X          = -(P2BodyDist Y / 500) / FVar(18)

[state 910, 移動速度] ;レバー入力Ｘ軸制御（遠距離）
Type       = VelSet
Triggerall = abs(FVar(26)) > FVar(25)+10
Trigger1   = (P2BodyDist Y >= 151) || (P2BodyDist Y <= -151)
Trigger1   = Command = "holdback"
X          = (P2BodyDist Y / 500) / FVar(18)


;-------------------------------------------------[ゴールしてもいいよね]


[state 910, 振り向き]
type     = Turn
trigger1 = P2Dist X < 0

[state 910, ステート変更] ;地面めりこみ防止
type     = ChangeState
trigger1 = Pos Y >= 0
value    = 52
ctrl     = 0

[state 910, ステート変更]
type     = changestate
trigger1 = P2bodydist X <= 30        ;相手に接触で解除
trigger1 = P2bodydist Y = [-20,20]
trigger2 = RoundState != 2           ;ラウンド終了後に解除
value    = 915

[State 910, 終了]
type = ChangeState
trigger1 = p2bodydist x <= 10
trigger1 = p2dist y + var(21) = [-5,5]
trigger2 = abs(P2bodyDist X) <= 20 && abs(P2bodyDist Y) <= 30;50
trigger3 = p2bodydist x < 0 && P2bodyDist Y = [-50,50]
value = 915


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; ニュートラルホーミング / 終了
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[Statedef 915]
type     = A
movetype = I
physics  = N
anim     = 915
ctrl     = 1

[State 915]
type     = Turn
trigger1 = p2dist x < -10

[State 915]
Type     = Velmul
Trigger1 = 1
X        = 0.82

[state 915]
type     = Velmul
trigger1 = time < 6
Y        = 0.92

[state 915]
type     = veladd
trigger1 = time >= 6
Y        = 0.45

[State 915]
type     = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value    = 52




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; レバー入れホーミング / 開始
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 920]
type     = A
movetype = I
physics  = N
ctrl     = 0
velset   = 0, 0

[State 920]
Type = turn
Trigger1 = !Time
Trigger1 = P2Dist X<0

;------------------------------------------[開始処理]

[State 920]
Type     = PlaySnd
Trigger1 = !Time
value    = s10, 0

;-------------------------------------------------[アニメ変更]

[state 920, up];上入力
type     = changeanim
trigger1 = !time
trigger1 = command = "holdup"
trigger1 = (command != "holdfwd") && (command != "holdback")
value    = 918

[state 920, fwdup];前上入力
type     = changeanim
trigger1 = !time
trigger1 = (command = "holdup") && (command = "holdfwd")
trigger1 = (command != "holdback")
value    = 919

[state 920, backup];後上入力
type     = changeanim
trigger1 = !time
trigger1 = (command = "holdup") && (command = "holdback")
trigger1 = (command != "holdfwd")
value    = 917

[state 920, back];後入力
type     = changeanim
trigger1 = !time
trigger1 = command = "holdback"
trigger1 = (command != "holdup") && (command != "holddown")
value    = 914

[state 920, fwd];前入力
type     = changeanim
trigger1 = !time
trigger1 = command = "holdfwd"
trigger1 = (command != "holdup") && (command != "holddown")
value    = 916

[state 920, down];下入力
type     = changeanim
trigger1 = !time
trigger1 = command = "holddown"
trigger1 = (command != "holdfwd") && (command != "holdback")
value    = 912

[state 920, fwddown];前下入力
type     = changeanim
trigger1 = !time
trigger1 = (command = "holddown") && (command = "holdfwd")
trigger1 = (command != "holdback")
value    = 913

[state 920, backdown];後下入力
type     = changeanim
trigger1 = !time
trigger1 = (command = "holddown") && (command = "holdback")
trigger1 = (command != "holdfwd")
value    = 912

;-------------------------------------------------[速度変更]

[state 920]
type     = VelSet
trigger1 = !time
trigger1 = (anim = 911)||(Anim = 912)||(Anim = 913)
X = ifelse(Anim=911, -5.5, ifelse(Anim=912, 0, 5.5))
Y = 5.5

[state 920]
type     = VelSet
trigger1 = !time
trigger1 = (anim = 914)||(Anim = 916)
X        = ifelse(Anim=914, -5.5, 5.5)

[state 920]
type     = VelSet
trigger1 = !time
trigger1 = (anim = 917)||(Anim = 918)||(Anim = 919)
X = ifelse(Anim=917, -5.5, ifelse(Anim=918, 0, 5.5))
Y = -5.5

[state 920, 減速]
type     = Velmul
trigger1 = vel x < 0
x        = 0.95

[state 920, 減速]
type     = Velmul
trigger1 = vel y != 0
y        = 0.95

[State 920, Nothit];完全無敵
type     = Nothitby
Trigger1 = (Anim=911)||(Anim=914)||(Anim=917)
Trigger1 = Time = [1,7]
value    = SCA,AA,AT,AP
time     = 1

;-------------------------------------------------[速度変更]

[State 920]
type     = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value    = 52

[State 920, a]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 910




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 前ホーミングダッシュ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 930]
type     = S
movetype = I
physics  = N
anim     = 930
ctrl     = 0

;-------------------------------------------------[]

[State 930]
Type     = AssertSpecial
Trigger1 = 1
flag     = NoWalk
flag2    = NoAutoTurn

[State 930]
Type     = PosSet
Trigger1 = StateType=S
y        = 0

[state 930, explod];砂煙
Type     = Explod
trigger1 = time = 1
trigger2 = gametime % 8 = 0
anim     = 8105
sprpriority = 3
pos      = -30,0
OwnPal   = 1
Scale    = 0.75, 0.75
id       = 8105

[State 940, バーニア表示]
type     = Explod
Trigger1 = AnimelemTime(3) = 0
anim     = 4058
ID       = 4059
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
removetime  = -1
RemoveOnGetHit = 1

[State 940, バーニア表示]
type     = Explod
Trigger1 = AnimelemTime(3) = 0
anim     = 4059
ID       = 4059
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -2
removetime  = -1
RemoveOnGetHit = 1

;------------------------------------------[開始処理]

[State 930]
Type     = turn
Trigger1 = !Time
Trigger1 = P2Dist X<0

[State 930]
Type     = PlaySnd
Trigger1 = !Time
value    = s10, 0

[State 930, 効果音]
type     = null;PlaySnd
trigger1 = animelemtime(3) = 0
trigger2 = animelemtime(3) >0 && gametime%18 = 0
value    = s10, 0

[state 930];速度
type     = velset
trigger1 = AnimelemTime(3)>=0
X        = 5

;------------------------------------------[変数処理]

[State 930, 判定リセット]
type     = Varset
Trigger1 = !time
var(0)   = 0

[State 930, キャンセル判定]
type       = Varset
TriggerAll = !time
trigger1 = prevstateno = [200,240]		;立ち
trigger2 = prevstateno = [400,440]		;しゃがみ
trigger3 = prevstateno = [600,620]		;空中
trigger4 = prevstateno = [300,320]		;吹っ飛ばし
trigger5 = prevstateno = [1000,1020]	;ミサイル系統
trigger6 = prevstateno = [1100,1170]	;ラリアット系統
trigger7 = prevstateno = [1200,1240]	;押しつぶし系統
trigger8 = prevstateno = [1300,1310]	;どんけつ系統
var(0)   = 1

[state 930, 回復停止];キャンセル判定
type       = Varset
TriggerAll = fvar(22) < 30
trigger1   = var(0) = 1
fVar(22)   = 30

[state 930, ゲージ消費];キャンセル判定
type     = VarAdd
trigger1 = !time
trigger1 = var(0) = 1
fVar(20) = -1000

[State a];ホーミング補正
type     = VarAdd
trigger1 = !time
trigger1 = var(0) = 1
fvar(3)  = (1.0-fvar(3))*0.3

;---------------------------------------------

[State 930];強制終了
Type       = ChangeState
TriggerAll = AnimelemTime(4) >= 0
Trigger1   = RoundState = 3
value      = 935
Ctrl       = 1

[State 930];相手に接触後に停止
Type       = ChangeState
TriggerAll = AnimelemTime(4) >= 0
TriggerAll = command != "holdz"
Trigger1   = p2bodydist x <= 10
value      = 935
Ctrl       = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上/ホーミングダッシュ・停止
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[StateDef 935]
Type     = S
Movetype = I
Physics  = S
anim     = 935
SprPriority = 2

[State 935]
type     = VelSet
trigger1 = !time
Y        = 0

[State a]
type     = Posset
trigger1 = 1
Y        = 0

[State a, AssertSpecial];特殊な状況
Type     = AssertSpecial
Trigger1 = 1
Flag     = NoWalk		;歩けない
Flag2    = NoAutoTurn	;ターンしない

[State a, AssertSpecial];特殊な状況
Type     = AssertSpecial
Trigger1 = Time < 17
Flag     = NoStandGuard
Flag2    = NoCrouchGuard
Flag3    = NoAirGuard

[State a, VelMul]
Type     = VelMul
Trigger1 = 1
X        = 0.88

[State a, ChangeState]
Type     = ChangeState
Trigger1 = AnimTime = 0
Value    = 0
Ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / 後ホーミングダッシュ
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 940]
type     = S
movetype = I
physics  = N
anim     = 940
ctrl     = 0

[state a]
type      = Statetypeset
trigger1  = pos y < 0
statetype = A

[State 940, nothit];完全無敵
type     = Nothitby
Trigger1 = Time = [1,10]
value    = SCA,AA,AT,AP
time     = 1

;------------------------------------------[変数処理]

[State 940, 判定リセット]
type     = Varset
Trigger1 = !time
var(0)   = 0

[State 940, キャンセル判定]
type       = Varset
TriggerAll = !time
trigger1 = prevstateno = [200,240]		;立ち
trigger2 = prevstateno = [400,440]		;しゃがみ
trigger3 = prevstateno = [600,620]		;空中
trigger4 = prevstateno = [300,320]		;吹っ飛ばし
trigger5 = prevstateno = [1000,1020]	;ミサイル系統
trigger6 = prevstateno = [1100,1170]	;ラリアット系統
trigger7 = prevstateno = [1200,1240]	;押しつぶし系統
trigger8 = prevstateno = [1300,1310]	;どんけつ系統
var(0)   = 1

[state 940, 回復停止];キャンセル判定
type       = Varset
triggerAll = !time
TriggerAll = fvar(22) < 30
trigger1   = var(0) = 1
fVar(22)   = 30

[state 940, ゲージ消費];キャンセル判定
type     = VarAdd
trigger1 = !time
trigger1 = var(0) = 1
fVar(20) = -1000

[State a];ホーミング補正
type     = VarAdd
trigger1 = !time
trigger1 = var(0) = 1
fvar(3)  = (1.0-fvar(3))*0.3

;-------------------------------------------------[演出]

[State 940]
Type     = AssertSpecial
Trigger1 = 1
flag     = NoWalk
flag2    = NoAutoTurn

[State 940]
Type     = PosSet
Trigger1 = StateType  =S
Y        = 0

[state 940, explod];砂煙
Type       = Explod
triggerall = time > 18 
trigger1   = gametime % 10 = 0
anim       = 8105
pos        = 0,0
OwnPal     = 1
Scale      = 0.75, 0.75
id         = 8105
sprpriority = 3

[State 940, バーニア表示]
type     = Explod
Trigger1 = AnimelemTime(1) = 0
anim     = 4056
ID       = 4056
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1

[State 940, バーニア表示]
type     = Explod
Trigger1 = AnimelemTime(1) = 0
anim     = 4057
ID       = 4056
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
RemoveOnGetHit = 1

[State 940, バーニア表示]
type     = Explod
Trigger1 = AnimelemTime(6) = 0
anim     = 4058
ID       = 4058
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
removetime  = -1
RemoveOnGetHit = 1

[State 940, バーニア表示]
type     = Explod
Trigger1 = AnimelemTime(6) = 0
anim     = 4059
ID       = 4058
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -2
removetime  = -1
RemoveOnGetHit = 1

;------------------------------------------[開始処理]

[State 940]
Type     = turn
Trigger1 = !Time
Trigger1 = P2Dist X<0

[State 940]
Type     = PlaySnd
Trigger1 = !Time
value    = s10, 0

[State 940, 効果音]
type     =null; PlaySnd
trigger1 = animelemtime(4) = 0
trigger2 = animelemtime(4) >0 && gametime%18 = 0
value    = 10, 52

[State 940, velset]
Type     = VelSet
Trigger1 = !Time
X        = -5.5

[State 940, velset]
Type     = Velmul
Trigger1 = animelem = 2
X        = 0.85

[state 940];速度
type     = velset
trigger1 = AnimelemTime(6)>=0
X        = 5

[State 940];相手に接触後に停止
Type       = ChangeState
TriggerAll = AnimelemTime(7) >= 0 
Trigger1   = p2bodydist x <= 5
value      = 935
Ctrl       = 1





;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / ガードキャンセル (前)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 950]
type     = S
movetype = I
physics  = N
ctrl     = 0

[state 950]
type     = Turn
Trigger1 = (!time) && (Prevstateno != 955)
trigger1 = p2dist x < 0

;-------------------------------------------------[アニメ変更]

[State 950, アニメ]
type     = ChangeAnim
trigger1 = (!time) && (PrevStateNo != 955)
Trigger1 = Anim != 950
value    = 950

;-------------------------------------------------[演出]

[State 950]
Type     = AssertSpecial
Trigger1 = 1
flag     = NoWalk
flag2    = NoAutoTurn

[State 950]
Type     = PosSet
Trigger1 = StateType = S
Trigger2 = Pos y >= 0
Y        = 0

[State 950, 効果音];ホーミング発動
Type     = PlaySnd
Trigger1 = (!Time) && (Prevstateno != 955)
value    = s10, 0

[State 950, 速度]
type     = Velset
Trigger1 = 1
X        = 5.5

;-------------------------------------------------[キャンセル処理]

[State a];ホーミング補正
type       = VarAdd
TriggerAll = !Time
Trigger1   = (PrevstateNo = [200, 1900])&&(PrevStateNo != 955)
fvar(3)    = (1.0-fvar(3))*0.3

[state a, 回復停止];キャンセル判定
type     = Varset
trigger1 = fvar(22) < 60
trigger1 = (!time) && (PrevStateNo != 955)
fVar(22) = 60
IgnoreHitPause = 1
persistent = 0

[state a, ゲージ消費];キャンセル判定
type     = VarAdd
trigger1 = (!time) && (PrevStateNo != 955)
fVar(20) = -1000
IgnoreHitPause = 1
persistent = 0

;-------------------------------------------------[エフェクト]

[State a];エフェクト
Type     = Helper
Trigger1 = NumHelper(7950) = 0
Trigger1 = Animelemtime(12) < 0
Name     = "GuardC"
Stateno  = 7950
ID       = 7950
Pos      = 0, 0
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[state 950, explod];砂煙
Type     = Explod
trigger1 = Animelemtime(12) >= 0
trigger1 = gametime % 8 = 0
anim     = 8105
sprpriority = 5
pos      = -30,0
OwnPal   = 1
Scale    = 0.75, 0.75
id       = 8105

[State 950, バーニア表示]
type     = Explod
Trigger1 = (!time)&&(prevStateNo!=955)
Trigger1 = NumExplod(4054) = 0
Trigger1 = Animelemtime(12) < 0
anim     = 4054
ID       = 4054
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 950, バーニア表示]
type     = Explod
Trigger1 = (!time)&&(prevStateNo!=955)
Trigger1 = NumExplod(4055) = 0
Trigger1 = Animelemtime(12) < 0
anim     = 4055
ID       = 4055
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

;-------------------------------------------------[相殺設定]

[State a]
type     = HitOverRide
trigger1 = Animelemtime(12) < 0
stateno  = 955
time     = 0
attr     = SCA,AA,AP
ignorehitpause = 1

;------------------------------------------[終了]

[State 950];相手に接触後に停止
Type       = ChangeState
trigger1   = Animelemtime(12) >= 0 
Trigger1   = P2bodydist x <= 10
Trigger1   = command != "holdz"
value      = 935
Ctrl       = 0


;============================================================
; ガードキャンセル / 硬直
;============================================================
[Statedef 955]
type     = U
movetype = H
physics  = U
ctrl     = 0

[State 955, 特殊]
Type     = AssertSpecial
Trigger1 = 1
flag     = NoWalk
flag2    = NoAutoTurn

[State 955, 無敵]
type     = NotHitBy
trigger1 = 1
value    = SCA, AA,AT,AP

[State 955, アニメ固定]
type     = Changeanim
trigger1 = 1
value    = anim
elem     = animelemno(0)
ignorehitpause = 1
persistent = 1

[State 955, 座標]
type     = PosFreeze
trigger1 = 1
value    = 1
persistent = 1

;------------------------------------------[演出]

[State 955, 画面振動]
type     = EnvShake
trigger1 = !time
time     = 15
ampl     = 4

[State 955, ダメージ調整]
type     = Lifeadd
trigger1 = !time
trigger1 = Gethitvar(damage) > 0
value    = floor((gethitvar(damage)) *ifelse(life<(lifemax*0.50),fvar(30),1))
ignorehitpause = 1
persistent = 1

[State 相殺エフェクト]
Type     = Helper
Trigger1 = !time
Name     = "Sousai"
Stateno  = 7955
ID       = 7955
Pos      = 10, -55
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;------------------------------------------[終了]

[State 955, ステート変更]
type     = ChangeState
trigger1 = Alive
trigger1 = Statetime > gethitvar(hitshaketime)
value    = 950
ctrl     = 1
ignorehitpause = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 地上 / ガードキャンセル (後)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 960]
type     = S
movetype = I
physics  = N
ctrl     = 0

[State 960, アニメ]
type     = ChangeAnim
trigger1 = (!time) && (PrevStateNo != 965)
Trigger1 = Anim != 960
value    = 960

[State 960]
Type     = turn
Trigger1 = (!Time) && (prevStateNo != 965)
Trigger1 = P2Dist X < 0

[State a]
type     = NotHitBy
trigger1 = Animelemtime(1) < 17
value    = SCA,AA,AP
time     = 1

[state a]
type      = StateTypeSet
trigger1  = !time
statetype = A

[state a]
type      = StateTypeSet
trigger1  = time = 22
statetype = S

;-------------------------------------------------[演出]

[State 960]
Type     = AssertSpecial
Trigger1 = 1
flag     = NoWalk
flag2    = NoAutoTurn

[State 960]
Type     = PosSet
Trigger1 = StateType=S
Y        = 0

[State 960, 効果音]
Type     = PlaySnd
Trigger1 = !Time
value    = s10, 0

[State 960, velset]
Type     = VelSet
Trigger1 = !Time
X        = -5

[State 960, velset]
Type     = Velmul
Trigger1 = Time = [10, 26]
X        = 0.91

[state 960];速度
type     = Velset
trigger1 = AnimelemTime(4) >= 0
X        = 6

;-------------------------------------------------[キャンセル処理]

[State a];ホーミング補正
type       = VarAdd
TriggerAll = !Time
Trigger1   = (PrevstateNo = [200, 1900])&&(PrevStateNo != 965)
fvar(3)    = (1.0-fvar(3))*0.3

[state a, 回復停止];キャンセル判定
type     = Varset
trigger1 = fvar(22) < 60
trigger1 = (!time) && (PrevStateNo != 965)
fVar(22) = 60
IgnoreHitPause = 1
persistent = 0

[state a, ゲージ消費];キャンセル判定
type     = VarAdd
trigger1 = (!time) && (PrevStateNo != 965)
fVar(20) = -1000
IgnoreHitPause = 1
persistent = 0

;-------------------------------------------------[エフェクト]

[state 960, explod];砂煙
Type     = Explod
trigger1 = Animelemtime(4) >= 0
trigger1 = gametime % 8 = 0
anim     = 8105
sprpriority = 3
pos      = -30, 0
OwnPal   = 1
Scale    = 0.75, 0.75
id       = 8105

[State a]
Type     = Helper
Trigger1 = !time
Name     = "Homing"
Stateno  = 8900
ID       = 8901
Pos      = 0, -65
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 0;99999
PauseMoveTime = 0;99999
IgnoreHitPause = 1
Persistent = 0

[State 960, バーニア表示]
type     = Explod
Trigger1 = (!time)&&(prevStateNo!=965)
Trigger1 = Animelemtime(4) < 0
anim     = 4060
ID       = 4060
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 960, バーニア表示]
type     = Explod
Trigger1 = (!time)&&(prevStateNo!=965)
Trigger1 = Animelemtime(4) < 0
anim     = 4061
ID       = 4060
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 960, バーニア表示]
type     = Explod
Trigger1 = AnimelemTime(4) = 0
anim     = 4058
ID       = 4061
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
removetime  = -1
RemoveOnGetHit = 1

[State 960, バーニア表示]
type     = Explod
Trigger1 = AnimelemTime(4) = 0
anim     = 4059
ID       = 4061
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -2
removetime  = -1
RemoveOnGetHit = 1

;------------------------------------------[ステート変更]

[State 960];相手に接触後に停止
Type       = ChangeState
Trigger1   = AnimelemTime(4) >= 0 
Trigger1   = p2bodydist x <= 10
Trigger1   = command != "holdz"
value      = 935
Ctrl       = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 / ガードキャンセル (前)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 970]
type     = A
movetype = I
physics  = N
ctrl     = 0

[state 970]
type     = Turn
Trigger1 = (!time) && (Prevstateno != 975)
trigger1 = p2dist x < 0

;-------------------------------------------------[アニメ変更]

[State 970, アニメ]
type     = ChangeAnim
trigger1 = (!time) && (PrevStateNo != 975)
Trigger1 = Anim != 970
value    = 970

;-------------------------------------------------[演出]

[State 970]
Type     = AssertSpecial
Trigger1 = 1
flag     = NoWalk
flag2    = NoAutoTurn

[State 970, 効果音];ホーミング発動
Type     = PlaySnd
Trigger1 = (!Time) && (Prevstateno != 975)
value    = s10, 0

[State 970, 速度]
type     = Velset
Trigger1 = 1
X        = 5.5

;-------------------------------------------------[キャンセル処理]

[State a];ホーミング補正
type       = VarAdd
TriggerAll = !Time
Trigger1   = (PrevstateNo = [200, 1900])&&(PrevStateNo != 975)
fvar(3)    = (1.0-fvar(3))*0.3

[state a, 回復停止];キャンセル判定
type     = Varset
trigger1 = fvar(22) < 60
trigger1 = (!time) && (PrevStateNo != 975)
fVar(22) = 60
IgnoreHitPause = 1
persistent = 0

[state a, ゲージ消費];キャンセル判定
type     = VarAdd
trigger1 = (!time) && (PrevStateNo != 975)
fVar(20) = -1000
IgnoreHitPause = 1
persistent = 0

;-------------------------------------------------[エフェクト]

[State a];エフェクト
Type     = Helper
Trigger1 = NumHelper(7950) = 0
Trigger1 = Animelemtime(11) < 0
Name     = "GuardC"
Stateno  = 7950
ID       = 7950
Pos      = 0, 0
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

[State 950, バーニア表示]
type     = Explod
Trigger1 = (!time)&&(prevStateNo!=955)
Trigger1 = NumExplod(4054) = 0
Trigger1 = Animelemtime(11) < 0
anim     = 4054
ID       = 4054
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 950, バーニア表示]
type     = Explod
Trigger1 = (!time)&&(prevStateNo!=955)
Trigger1 = NumExplod(4055) = 0
Trigger1 = Animelemtime(11) < 0
anim     = 4055
ID       = 4055
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = -1
IgnoreHitPause = 0
RemoveOnGetHit = 1

;-------------------------------------------------[相殺設定]

[State a]
type     = HitOverRide
trigger1 = Animelemtime(11) < 0
stateno  = 975
time     = 0
attr     = SCA,AA,AP
ignorehitpause = 1

;------------------------------------------[終了]

[State 970];ホーミングへ
Type       = ChangeState
trigger1   = Animtime = 0
value      = 910
Ctrl       = 0


;============================================================
; 空中ガードキャンセル / 硬直
;============================================================
[Statedef 975]
type     = U
movetype = H
physics  = U
ctrl     = 0

[State 975, 特殊]
Type     = AssertSpecial
Trigger1 = 1
flag     = NoWalk
flag2    = NoAutoTurn

[State 975, 無敵]
type     = NotHitBy
trigger1 = 1
value    = SCA, AA,AT,AP

[State 975, アニメ固定]
type     = Changeanim
trigger1 = 1
value    = anim
elem     = animelemno(0)
ignorehitpause = 1
persistent = 1

[State 975, 座標]
type     = PosFreeze
trigger1 = 1
value    = 1
persistent = 1

;------------------------------------------[演出]

[State 975, 画面振動]
type     = EnvShake
trigger1 = !time
time     = 15
ampl     = 4

[State 975, ダメージ調整]
type     = Lifeadd
trigger1 = !time
trigger1 = Gethitvar(damage) > 0
value    = floor((gethitvar(damage)) *ifelse(life<(lifemax*0.50),fvar(30),1))
ignorehitpause = 1
persistent = 1

[State 相殺エフェクト]
Type     = Helper
Trigger1 = !time
Name     = "Sousai"
Stateno  = 7955
ID       = 7955
Pos      = 10, -55
PosType  = P1
OwnPal   = 1
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;------------------------------------------[終了]

[State 975, ステート変更]
type     = ChangeState
trigger1 = Alive
trigger1 = Statetime > gethitvar(hitshaketime)
value    = 970
ctrl     = 1
ignorehitpause = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 空中 / ガードキャンセル (後)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 980]
type     = A
movetype = I
physics  = N
ctrl     = 0

[State 980, アニメ]
type     = ChangeAnim
trigger1 = (!time)
Trigger1 = Anim != 980
value    = 980

[State 980]
Type     = turn
Trigger1 = (!Time)
Trigger1 = P2Dist X < 0

[State a]
type     = NotHitBy
trigger1 = Animelemtime(1) < 17
value    = SCA,AA,AP
time     = 1

;-------------------------------------------------[演出]

[State 980]
Type     = AssertSpecial
Trigger1 = 1
flag     = NoWalk
flag2    = NoAutoTurn

[State 980, 効果音]
Type     = PlaySnd
Trigger1 = !Time
value    = s10, 0

[State 980, velset]
Type     = VelSet
Trigger1 = !Time
X        = -5

[State 980, velset]
Type     = Velmul
Trigger1 = Time = [10, 26]
X        = 0.91

;-------------------------------------------------[キャンセル処理]

[State a];ホーミング補正
type       = VarAdd
TriggerAll = !Time
Trigger1   = (PrevstateNo = [200, 1900])
fvar(3)    = (1.0-fvar(3))*0.3

[state a, 回復停止];キャンセル判定
type     = Varset
trigger1 = fvar(22) < 60
trigger1 = (!time) && (PrevStateNo != 965)
fVar(22) = 60
IgnoreHitPause = 1
persistent = 0

[state a, ゲージ消費];キャンセル判定
type     = VarAdd
trigger1 = (!time) && (PrevStateNo != 965)
fVar(20) = -1000
IgnoreHitPause = 1
persistent = 0

;-------------------------------------------------[エフェクト]

[State a]
Type     = Helper
Trigger1 = !time
Name     = "Homing"
Stateno  = 8900
ID       = 8901
Pos      = 0, -65
PosType  = P1
OwnPal   = 1
size.xscale = 1
size.yscale = 1
SuperMoveTime = 0;99999
PauseMoveTime = 0;99999
IgnoreHitPause = 1
Persistent = 0

[State 960, バーニア表示]
type     = Explod
Trigger1 = (!time)&&(prevStateNo!=965)
Trigger1 = Animelemtime(4) < 0
anim     = 4060
ID       = 4060
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
IgnoreHitPause = 0
RemoveOnGetHit = 1

[State 960, バーニア表示]
type     = Explod
Trigger1 = (!time)&&(prevStateNo!=965)
Trigger1 = Animelemtime(4) < 0
anim     = 4061
ID       = 4060
postype  = p1
pos      = 0, 0
scale    = 0.5, 0.5
bindtime = -1
ownpal   = 1
sprpriority = 4
IgnoreHitPause = 0
RemoveOnGetHit = 1

;------------------------------------------[ステート変更]

[State 980];ホーミングへ
Type       = ChangeState
trigger1   = Animtime = 0
value      = 910
Ctrl       = 0




;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; アルカナバースト / 地上
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2800]
type     = A
movetype = A
physics  = N
anim     = 2800
velset   = 0,0
ctrl     = 0
sprpriority = 2

[state 2800, 完全無敵]
type     = NotHitBy
trigger1 = Time < 42
value    = SCA
time     = 1
ignorehitpause = 1

[state 2800, 打撃無敵]
type     = Nothitby
trigger1 = Time >= 42
value    = ,NA,SA,HA
time     = 1
ignorehitpause = 1

;-------------------------------------------------[変数処理]

[state 2800, ゲージ消費] ;フォースゲージ
type     = Varset
trigger1 = !time
fVar(10) = 0
persistent = 0
IgnoreHitPause = 1

[state 2800, バースト使用フラグ]
type     = Varset
trigger1 = !time
var(16)  = 1
persistent = 0
IgnoreHitPause = 1

;-------------------------------------------------[演出]

[State 2810] ;効果音
Type     = PlaySnd
Trigger1 = Animelem = 2
value    = s210, 1

[State 2800, エフェクト]
Type     = Helper
Trigger1 = !time
OwnPal   = 1
PosType  = P1
Pos      = 0, const(size.mid.pos.y)
ID       = 12805
StateNo  = 12805
Name     = "Burst"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999

;-------------------------------------------------[移動]

[state 2800, velset]
type     = Veladd
trigger1 = Animelem = 4
y        = -1.5

[state 2800]
type     = velset
trigger1 = Animelem = 6
y        = 0

[State 2800]
type     = VelAdd
trigger1 = pos Y < 0
trigger1 = AnimElemTime(6) > 0
y        = 0.4

;-------------------------------------------------[ヒット定義]

[State 2800, HitDef]
type                = HitDef
trigger1            = Animelem = 4
attr                = , SA
hitflag             = MAF
guardflag           = MA
damage              = Floor(0*Fvar(0)), 0
getpower = 60,30
animtype            = hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(12*(1+0.5*var(7))), floor(11*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = -1
guardsound          = -1
ground.slidetime    = 15
ground.hittime      = 15
guard.slidetime     = 11
guard.hittime       = 11
guard.ctrltime      = 13
air.guard.slidetime = 13
air.guard.hittime   = 13
air.guard.ctrltime  = 15

ground.velocity     = -12, -5
guard.velocity      = -8
air.velocity        = -12, -5
airguard.velocity   = -6, -3
fall                = 1
air.fall            = 1
fall.recover        = 0
yaccel              = 0.48
kill                = 0
guard.kill          = 0
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0
AirGuard.CornerPush.VelOff = 0

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 20,IfElse(EnemyNear,StateType = A, -55,-50)
PosType  = P2
OwnPal   = 1
size.xscale = 1.0
size.yscale = 1.0
SuperMoveTime = 99999
PauseMoveTime = 99999
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
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * 0

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 1.00

;-------------------------------------------------[終了]

[State 2800, ChangeState]
type     = ChangeState
trigger1 = (Pos Y >= 0) && (Vel Y > 0)
value    = 52
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; アルカナバースト / 空中
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2850]
type     = A
movetype = A
physics  = N
anim     = 2850
velset   = 0,0
ctrl     = 0
sprpriority = 2

[state 2850, 完全無敵]
type     = NotHitBy
trigger1 = Time < 42
value    = SCA
time     = 1
ignorehitpause = 1

[state 2850, 打撃無敵]
type     = Nothitby
trigger1 = Time >= 42
value    = ,NA,SA,HA
time     = 1
ignorehitpause = 1

;-------------------------------------------------[変数処理]

[state 2850, ゲージ消費] ;フォースゲージ
type     = Varset
trigger1 = !time
fVar(10) = 0
persistent = 0
IgnoreHitPause = 1

[state 2850, バースト使用フラグ]
type     = Varset
trigger1 = !time
var(16)  = 1
persistent = 0
IgnoreHitPause = 1

;-------------------------------------------------[演出]

[State 2850] ;効果音
Type     = PlaySnd
Trigger1 = Animelem = 2
value    = s210, 1

[State 2850, エフェクト]
Type     = Helper
Trigger1 = !time
OwnPal   = 1
PosType  = P1
Pos      = 0, const(size.mid.pos.y)
ID       = 12805
StateNo  = 12805
Name     = "Burst"
Persistent    = 0
PauseMoveTime = 999999
SuperMoveTime = 999999

;-------------------------------------------------[移動]

[state 2850, velset]
type     = Veladd
trigger1 = Animelem = 4
y        = -1.5

[state 2850]
type     = velset
trigger1 = Animelem = 6
y        = 0

[State 2850]
type     = Statetypeset
trigger1 = pos Y < 0
trigger1 = AnimElemTime(6) > 0
Physics  = A

;-------------------------------------------------[ヒット定義]

[State 2850, HitDef]
type                = HitDef
trigger1            = Animelem = 4
attr                = , SA
hitflag             = MAF
guardflag           = MA
damage              = Floor(0*Fvar(0)), 0
getpower = 60,30
animtype            = hard
ground.type         = High
priority            = 3, Hit
pausetime           = floor(12*(1+0.5*var(7))), floor(11*(1+1*var(7)))
sparkno             = -1
sparkxy             = 0, 0
guard.sparkno       = -1
hitsound            = -1
guardsound          = -1
ground.slidetime    = 15
ground.hittime      = 15
guard.slidetime     = 11
guard.hittime       = 11
guard.ctrltime      = 13
air.guard.slidetime = 13
air.guard.hittime   = 13
air.guard.ctrltime  = 15

ground.velocity     = -12, -5
guard.velocity      = -8
air.velocity        = -12, -5
airguard.velocity   = -6, -3
fall                = 1
air.fall            = 1
fall.recover        = 0
yaccel              = 0.48
kill                = 0
guard.kill          = 0
Ground.CornerPush.VelOff   = 0
Air.CornerPush.VelOff      = 0
Down.CornerPush.VelOff     = 0
Guard.CornerPush.VelOff    = 0
AirGuard.CornerPush.VelOff = 0

;=======================================[ヒット、ガードエフェクト]

[State a];ヒットスパーク
Type     = Helper
Trigger1 = MoveHit
Name     = "hit"
Stateno  = 7010
ID       = 7000
Pos      = 20,IfElse(EnemyNear,StateType = A, -55,-50)
PosType  = P2
OwnPal   = 1
size.xscale = 1.0
size.yscale = 1.0
SuperMoveTime = 99999
PauseMoveTime = 99999
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
SuperMoveTime = 99999
PauseMoveTime = 99999
IgnoreHitPause = 1
Persistent = 0

;-------------------------------------------------[補正]

[State a, VarSet];連続ヒット補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(1)        = FVar(1) * 0

[State a, VarSet];復帰不能補正
Type           = VarSet
Trigger1       = MoveHit
Persistent     = 0
IgnoreHitPause = 1
fvar(3)        = FVar(3) - 1.00

;-------------------------------------------------[終了]

[State 2850]
type     = CtrlSet
trigger1 = animelem = 7
value    = 1

[State 2850, ChangeState]
type     = ChangeState
trigger1 = (Pos Y >= 0) && (Vel Y > 0)
value    = 52
ctrl     = 1



;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;[エフェクト] アルカナ3バーストエフェクト
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[statedef 12805]
Physics     = N
Anim        = 12800
SprPriority = 4

[State 12805]
Type     = Trans
Trigger1 = 1
Trans    = Add

[State 12805]
type     = bindtoroot
trigger1 = 1
time     = -1
facing   = 1
pos      = 0, const(size.mid.pos.y)
ignorehitpause = 1

[State -1]
Type     = AngleDraw
Trigger1 = 1
scale    = 1.75, 1.75

[State -1]
Type     = null;AngleDraw
Trigger1 = animelemTime(5)>0
scale    = 0.15+time*0.1,0.15+time*0.1

[State a]
Type     = AssertSpecial
Trigger1 = 1
Flag     = NoShadow

[State 3350]
Type     = DestroySelf
Trigger1 = animTime =0
trigger2 = root,movetype = H










;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; エクステンドフォース / 通常
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2900]
type     = S
movetype = I
physics  = S
anim     = 2900
velset   = 0,0
ctrl     = 0
sprpriority = 2

;-------------------------------------------------[キャンセル補正]

[State a, 変数]  ;エクステンドフォース補正
Type           = Varset
triggerAll     = Numenemy > 0
Trigger1       = !time
Trigger1       = (Enemynear,Movetype = H)
Persistent     = 0
IgnoreHitPause = 1
fvar(4)        = 0.91

;-------------------------------------------------[演出]

[State 2900] ;効果音
Type     = PlaySnd
Trigger1 = !time
value    = s3, 3

[State 2900, Helper];発動エフェクト
Type       = null;Helper
Trigger1   = Time = 2
OwnPal     = 1
PosType    = P1
Pos        = 0, const(size.mid.pos.y)
ID         = 13400
StateNo    = 13400
PauseMoveTime = 999999
SuperMoveTime = 999999
Name       = "Extend"
Persistent = 0
IgnoreHitPause = 1

;-------------------------------------------------[変数処理]

[state 2900, EF判定]
type     = Varset
trigger1 = 1
var(15)  = 1
IgnoreHitPause = 1

[state 2900, フォースキャンセル判定]
type     = Varset
trigger1 = !time
var(14)  = 0
persistent     = 0
IgnoreHitPause = 1

;-------------------------------------------------[終了]

[State 2900, ChangeState]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; エクステンドフォース / キャンセル
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Statedef 2910]
type     = S
movetype = I
physics  = S
anim     = 2900
velset   = 0,0
ctrl     = 0
sprpriority = 2

;-------------------------------------------------[キャンセル補正]

[State a, 変数]  ;エクステンドフォース補正
Type           = Varset
triggerAll     = Numenemy > 0
Trigger1       = !time
Trigger1       = (Enemynear,Movetype = H)
Persistent     = 0
IgnoreHitPause = 1
fvar(4)        = 0.91

;-------------------------------------------------[演出]

[State 2910] ;効果音
Type     = PlaySnd
Trigger1 = !time
value    = s3, 3

[State 2910, Helper];発動エフェクト
Type       = Helper
Trigger1   = Time = 0
OwnPal     = 1
PosType    = P1
Pos        = 0, const(size.mid.pos.y)
ID         = 13400
StateNo    = 13400
PauseMoveTime = 999999
SuperMoveTime = 999999
Name       = "Extend"
Persistent = 0
IgnoreHitPause = 1

;-------------------------------------------------[変数処理]

[state 2910, EF判定]
type     = Varset
trigger1 = 1
var(15)  = 1
IgnoreHitPause = 1

[state 2910, フォースキャンセル判定]
type     = Varset
trigger1 = !time
var(14)  = 0
persistent     = 0
IgnoreHitPause = 1

;-------------------------------------------------[終了]

[State 2910, ChangeState] ;EFキャンセル簡単
type      = ChangeState
trigger1  = Command = "z"
value     = 900
ctrl      = 0

[State 2910, ChangeState]
type = ChangeState
trigger1 = Time = 1
value = 0
ctrl = 1
