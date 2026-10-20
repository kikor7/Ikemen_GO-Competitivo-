[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


;-| Special Motions |------------------------------------------------------

[Command]
name = "s_loveme_chain"
command = ~D,DF,F,D,F,x
time = 30
buffer.time = 3

[Command]
name = "s_loveme_chain"
command = ~D,DF,F,x+y
buffer.time = 3

[Command]
name = "s_loveme_chain"
command = ~D,DF,F,z
buffer.time = 3

[Command]
name = "s_venus_kick"
command = ~D,DF,F,D,F,a
time = 30
buffer.time = 3

[Command]
name = "s_venus_kick"
command = ~D,DF,F,a+b
buffer.time = 3

[Command]
name = "s_venus_kick"
command = ~D,DF,F,c
buffer.time = 3

[Command]
name = "s_heart"
command = ~D,DF,F,D,F,y
time = 30
buffer.time = 3

[Command]
name = "s_heart"
command = ~D,DF,F,D,F,z
time = 30
buffer.time = 3

[Command]
name = "s_beam"
command = ~D,DF,F,D,F,b
time = 30
buffer.time = 3

[Command]
name = "s_beam"
command = ~D,DF,F,D,F,c
time = 30
buffer.time = 3

[Command]
name = "venus_charm_illusion"
command = ~D,DF,F,D,F,s
time = 30
buffer.time = 3

[Command]
name = "chain_explosion"
command = ~D,DB,B,D,B,x
time = 30
buffer.time = 3

[Command]
name = "chain_explosion"
command = ~D,DB,B,D,B,y
time = 30
buffer.time = 3

[Command]
name = "chain_explosion"
command = ~D,DB,B,x+y
buffer.time = 3

[Command]
name = "chain_explosion"
command = ~D,DB,B,z
buffer.time = 3

[Command]
name = "heart"
command = ~D,DB,B,x
buffer.time = 3

[Command]
name = "heart_h"
command = ~D,DB,B,y
buffer.time = 3

[Command]
name = "love_and_beauty"
command = ~F,D,DF,a
buffer.time = 3

[Command]
name = "love_and_beauty_h"
command = ~F,D,DF,b
buffer.time = 3

[Command]
name = "loveme_chain"
command = ~F,D,DF,x
buffer.time = 3

[Command]
name = "loveme_chain_h"
command = ~F,D,DF,y
buffer.time = 3

[Command]
name = "crescent_beam"
command = ~D,DF,F,x
buffer.time = 3

[Command]
name = "crescent_beam_h"
command = ~D,DF,F,y
buffer.time = 3

[Command]
name = "wink_chain_sword"
command = ~D,DB,B,a
buffer.time = 3

[Command]
name = "wink_chain_sword_h"
command = ~D,DB,B,b
buffer.time = 3

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10
buffer.time = 3

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10
buffer.time = 3

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery"
command = a
time = 1

[Command]
name = "recovery"
command = b
time = 1

[Command]
name = "recovery"
command = c
time = 1

[Command]
name = "recovery"
command = x
time = 1

[Command]
name = "recovery"
command = y
time = 1

[Command]
name = "recovery"
command = z
time = 1

[Command]
name = "nage"
command = x+y
time = 1
buffer.time = 3

[Command]
name = "nage"
command = z
time = 1
buffer.time = 3

[Command]
name = "kaihi"
command = x+a
time = 1
buffer.time = 3

[Command]
name = "kaihi"
command = y+b
time = 1
buffer.time = 3

[Command]
name = "kaihi"
command = z+c
time = 1
buffer.time = 3

;ハイジャンプ
[Command]
name = "HJ"
command = ~$D, $U
time = 8

[Command];ハイジャンプ暴発阻止
name = "NHJ"
command = ~12$D, $U
time = 12

[Command];ハイジャンプ暴発阻止
name = "NHJ"
command = /$D
time = 12

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

[Command]
name = "holda"
command = /$a
time = 1

[Command]
name = "holdb"
command = /$b
time = 1

[Command]
name = "holdx"
command = /$x
time = 1

[Command]
name = "holdy"
command = /$y
time = 1

[Command]
name = "holdz"
command = /$z
time = 1

[Statedef -1]

[State VarAdd];EXディフェンス
type = VarAdd
trigger1 = var(0) < 8 && (Command != "holdback" || var(0) < 0)
var(0) = 1

[State VarSet];EXディフェンス
type = VarSet
trigger1 = Ctrl && Command = "holdback" && var(0) >= 0
trigger2 = StateNo = 125
var(0) = -12 * (var(0) = 8)

[State HitOverride];EXディフェンス
type = HitOverride
trigger1 = Ctrl && var(0) < 0 && StateType = S && StateNo != [150,155]
attr = SA, AA, AP
stateno = 125
ignorehitpause = 1

[State HitOverride];EXディフェンス
type = HitOverride
trigger1 = Ctrl && var(0) < 0 && StateType = C && StateNo != [150,155]
attr = CA, AA, AP
stateno = 125
ignorehitpause = 1

[State HitOverride];EXディフェンス
type = HitOverride
trigger1 = Ctrl && var(0) < 0 && StateType = A && StateNo != [150,155]
attr = SCA, AA, AP
stateno = 125
ignorehitpause = 1

[State VarAdd];EXディフェンス
type = VarAdd
trigger1 = var(1) > 0
var(1) = -1

[State -1, ヴィーナス・チャーム・イリュージョン]
type = ChangeState
value = 3400
triggerall = command = "venus_charm_illusion"
triggerall = power >= 5000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, クレセント・ビーム]
type = ChangeState
value = 3300
triggerall = command = "s_beam"
triggerall = power >= 4000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ローリング・ハート・バイブレーション]
type = ChangeState
value = 3200
triggerall = command = "s_heart"
triggerall = !Numhelper(3205)
triggerall = power >= 3000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ヴィーナス・キック]
type = ChangeState
value = 3100
triggerall = command = "s_venus_kick"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ヴィーナス・ラブ・ミー・チェーン]
type = ChangeState
value = 3000
triggerall = command = "s_loveme_chain"
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, チェーン・エクスプロシブ]
type = ChangeState
value = 2000
triggerall = command = "chain_explosion"
triggerall = NumProjID(2000) = 0
triggerall = (100 * life / const(data.life)) <= 30
triggerall = power >= 500
trigger1 = statetype != A && statetype != L
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ヴィーナス・ラブ・ミー・チェーン]
type = ChangeState
value = 1350
triggerall = command = "loveme_chain"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ヴィーナス・ラブ・ミー・チェーン]
type = ChangeState
value = 1360
triggerall = command = "loveme_chain_h"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ヴィーナス・ラブ・アンド・ビューティ・ショック]
type = ChangeState
value = 1400
triggerall = command = "love_and_beauty"
triggerall = NumProjID(1400) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ヴィーナス・ラブ・アンド・ビューティ・ショック]
type = ChangeState
value = 1450
triggerall = command = "love_and_beauty_h"
triggerall = NumProjID(1400) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ヴィーナス・ウインク・チェーン・ソード]
type = ChangeState
value = 1500
triggerall = command = "wink_chain_sword"
triggerall = NumProjID(1500) = 0
trigger1 = statetype != A && statetype != L
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ヴィーナス・ウインク・チェーン・ソード]
type = ChangeState
value = 1550
triggerall = command = "wink_chain_sword_h"
triggerall = NumProjID(1500) = 0
trigger1 = statetype != A && statetype != L
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ローリング・ハート・バイブレーション]
type = ChangeState
value = 1000
triggerall = command = "heart" || command = "heart_h"
triggerall = !Numhelper(1005)
triggerall = !Numhelper(3205)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, クレセント・ビーム]
type = ChangeState
value = 1100
triggerall = command = "crescent_beam"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, クレセント・ビーム・シャワー]
type = ChangeState
value = 1200
triggerall = command = "crescent_beam_h"
triggerall = !Numhelper(1250)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

;---------------------------------------------------------------------------
;Run Fwd
;ダッシュ
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
;後退ダッシュ
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;回避
[State -1, Run Back]
type = ChangeState
value = 108
triggerall = command = "kaihi"
trigger1 = statetype != A
trigger1 = ctrl || StateNo = 135 || stateno = [150,153]
;---------------------------------------------------------------------------
;Kung Fu Throw
;投げ
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = statetype != A
triggerall = ctrl
trigger1 = command = "nage"

[State -1, ダッシュ弱攻撃]
type = ChangeState
value = 700
triggerall = command = "x"
trigger1 = stateno = 100 || stateno = 105
trigger1 = ctrl

[State -1, ダッシュ強攻撃]
type = ChangeState
value = 710
triggerall = command = "b"
trigger1 = stateno = 100 || stateno = 105
trigger1 = ctrl

[State -1, ヴィーナス・ラブ・ミー・チェーン]
type = ChangeState
value = 1301
triggerall = command = "x"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype != A && StateNo != 100
trigger1 = ctrl
trigger2 = stateno = 220 || Stateno = 200 || stateno = 400 || stateno = 420
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ヴィーナス・ラブ・ミー・チェーン]
type = ChangeState
value = 1300
triggerall = command = "y"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype != A && StateNo != 100
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ヴィーナス・ラブ・ミー・チェーン]
type = ChangeState
value = 1302
triggerall = command = "a"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype != A && StateNo != 100
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

;コンビネーション2
[State -1, Stand Light Punch]
type = ChangeState
value = 205
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = stateno = 200 || stateno = 700
trigger1 = MoveContact

;コンビネーション3
[State -1, Stand Light Kick]
type = ChangeState
value = 225
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = stateno = 205
trigger1 = MoveContact

;コンビネーション4
[State -1, Stand Strong Punch]
type = ChangeState
value = 226
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = command = "x"
trigger1 = stateno = 225
trigger1 = MoveContact

;コンビネーション5
[State -1, Standing Strong Kick]
type = ChangeState
value = 230
triggerall = command != "holddown"
triggerall = command = "x"
trigger1 = stateno = 226
trigger1 = MoveContact

;立ち弱パンチ
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 400
trigger2 = time > 3

;立ち弱キック
[State -1, Stand Light Kick]
type = ChangeState
value = 210
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 400
trigger2 = MoveContact

;立ち強パンチ
[State -1, Stand Strong Punch]
type = ChangeState
value = 220
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 400
trigger2 = MoveContact

[State -1, 中段攻撃]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = command = "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410
trigger2 = MoveContact

;立ち強キック
[State -1, Standing Strong Kick]
type = ChangeState
value = 230
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410
trigger2 = MoveContact


;---------------------------------------------------------------------------
;Taunt
;挑発
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

[State -1, 振り向き攻撃]
type = ChangeState
value = 640
triggerall = command = "holdback"
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, 空中弱攻撃]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, 空中中攻撃]
type = ChangeState
value = 610
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = MoveContact

[State -1, ドリルキック]
type = ChangeState
value = 630
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 215 || stateno = 600 || stateno = 610
trigger2 = MoveContact

[State -1, 空中強攻撃]
type = ChangeState
value = 620
triggerall = command = "b" || command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 610
trigger2 = MoveContact

[State -1, しゃがみ弱攻撃]
type = ChangeState
value = 400
triggerall = command = "x" || command = "a"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = 200
trigger2 = time > 3

[State -1, しゃがみ強パンチ]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = 200
trigger2 = MoveContact

[State -1, スライディングキック]
type = ChangeState
value = 430
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = 200 || stateno = 220 || stateno = 410
trigger2 = MoveContact

[State -1, しゃがみ強キック]
type = ChangeState
value = 420
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = 200 || stateno = 220 || stateno = 410
trigger2 = MoveContact

;ハイジャンプ
[State -1]
type = ChangeState
value = 199
trigger1 = command = "HJ"
trigger1 = command != "NHJ"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------

[State -1, setting];kao;アクション顔画像
type = varset
trigger1 = 1
v = 46
value = 0

[State -1, setting];ero;脱衣KO ON(1)/OFF(0)
type = varset
trigger1 = 1
v = 39
value = 0;1

