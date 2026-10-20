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
name = "S_Sonic_Boom"
command = ~D,DF,F,D,DF,F,x
time = 30
buffer.time = 3

[Command]
name = "teleport1"
command = ~D,D, x
time = 15

[Command]
name = "teleport2"
command = ~D,D, y
time = 15

[Command]
name = "teleport3"
command = ~D,D, a
time = 15

[Command]
name = "teleport4"
command = ~D,D, b
time = 15

[Command]
name = "crystal_l"
command = ~D,B,F,a
time = 20

[Command]
name = "crystal_h"
command = ~D,B,F,b
time = 20

[Command]
name = "energy_l"
command = ~D,DF,F,a

[Command]
name = "energy_h"
command = ~D,DF,F,b

[Command]
name = "sonic_boom_l"
command = ~D,B,F,x

[Command]
name = "sonic_boom_h"
command = ~D,B,F,y

[Command]
name = "screen"
command = ~D,DB,B,x

[Command]
name = "screen"
command = ~D,DB,B,y

[Command]
name = "sleep_l"
command = ~D,DF,F,x

[Command]
name = "sleep_h"
command = ~D,DF,F,y

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

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

[Command]
name = "nage"
command = z
time = 1

[Command]
name = "kaihi"
command = x+a
time = 1

[Command]
name = "kaihi"
command = y+b
time = 1

[Command]
name = "kaihi"
command = z+c
time = 1

;ハイジ??プ
[Command]
name = "HJ"
command = ~$D, $U
time = 8

[Command];ハイジ??プ暴発阻止
name = "NHJ"
command = ~12$D, $U
time = 12

[Command];ハイジ??プ暴発阻止
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

[State VarAdd];EXディフェ?ス
type = VarAdd
trigger1 = var(0) < 8 && (Command != "holdback" || var(0) < 0)
var(0) = 1

[State VarSet];EXディフェ?ス
type = VarSet
trigger1 = Ctrl && Command = "holdback" && var(0) >= 0
trigger2 = StateNo = 125
var(0) = -12 * (var(0) = 8)

[State HitOverride];EXディフェ?ス
type = HitOverride
trigger1 = Ctrl && var(0) < 0 && StateType = S && StateNo != [150,155]
attr = SA, AA, AP
stateno = 125
ignorehitpause = 1

[State HitOverride];EXディフェ?ス
type = HitOverride
trigger1 = Ctrl && var(0) < 0 && StateType = C && StateNo != [150,155]
attr = CA, AA, AP
stateno = 125
ignorehitpause = 1

[State HitOverride];EXディフェ?ス
type = HitOverride
trigger1 = Ctrl && var(0) < 0 && StateType = A && StateNo != [150,155]
attr = SCA, AA, AP
stateno = 125
ignorehitpause = 1

[State VarAdd];EXディフェ?ス
type = VarAdd
trigger1 = var(1) > 0
var(1) = -1

[State -1, Stand Light Punch]
type = ChangeState
value = 3000
triggerall = command = "S_Sonic_Boom"
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = 1957 || stateno = [1951,1954]
trigger4 = stateno = 108 && time = [10,19]

[State -1, ク?セ?ト・ビー?]
type = ChangeState
value = 1000
triggerall = command = "sonic_boom_l"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ク?セ?ト・ビー?]
type = ChangeState
value = 1050
triggerall = command = "sonic_boom_h"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ク?セ?ト・ビー?]
type = ChangeState
value = 1100
triggerall = command = "screen"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ク?セ?ト・ビー?]
type = ChangeState
value = 1200
triggerall = command = "sleep_l"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ク?セ?ト・ビー?]
type = ChangeState
value = 1250
triggerall = command = "sleep_h"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ク?セ?ト・ビー?]
type = ChangeState
value = 1400
triggerall = command = "teleport1"
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ク?セ?ト・ビー?]
type = ChangeState
value = 1401
triggerall = command = "teleport2"
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ク?セ?ト・ビー?]
type = ChangeState
value = 1402
triggerall = command = "teleport3"
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ク?セ?ト・ビー?]
type = ChangeState
value = 1403
triggerall = command = "teleport4"
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ク?セ?ト・ビー?]
type = ChangeState
value = 1600
triggerall = command = "crystal_l"
triggerall = !NumProjID(1610)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ク?セ?ト・ビー?]
type = ChangeState
value = 1650
triggerall = command = "crystal_h"
triggerall = !NumProjID(1610)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ク?セ?ト・ビー?]
type = ChangeState
value = 1300
triggerall = command = "energy_l"
triggerall = !NumProjID(1300)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

[State -1, ク?セ?ト・ビー?]
type = ChangeState
value = 1350
triggerall = command = "energy_h"
triggerall = !NumProjID(1300)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 || stateno = 220 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = [1951,1956]
trigger4 = stateno = 108 && time = [10,27]

;---------------------------------------------------------------------------
;Run Fwd
;ダッシ?
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
;後退ダッシ?
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
;?げ
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = statetype != A
triggerall = ctrl
trigger1 = command = "nage"

[State -1, ダッシ?弱攻?]
type = ChangeState
value = 700
triggerall = command = "x"
trigger1 = stateno = 100 || stateno = 105
trigger1 = ctrl

[State -1, ダッシ?強攻?]
type = ChangeState
value = 710
triggerall = command = "b"
trigger1 = stateno = 100 || stateno = 105
trigger1 = ctrl

;コ?ビネーシ??2
[State -1, Stand Light Punch]
type = ChangeState
value = 205
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = stateno = 200 || stateno = 700
trigger1 = MoveContact

;コ?ビネーシ??3
[State -1, Stand Light Kick]
type = ChangeState
value = 225
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = stateno = 205
trigger1 = MoveContact

;コ?ビネーシ??4
[State -1, Stand Strong Punch]
type = ChangeState
value = 226
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = command = "x"
trigger1 = stateno = 225
trigger1 = MoveContact

;コ?ビネーシ??5
[State -1, Standing Strong Kick]
type = ChangeState
value = 230
triggerall = command != "holddown"
triggerall = command = "x"
trigger1 = stateno = 226
trigger1 = MoveContact

;立ち弱パ?チ
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 400
trigger2 = time > 3

;立ち強パ?チ
[State -1, Stand Strong Punch]
type = ChangeState
value = 220
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 400
trigger2 = MoveContact

;コ?ビネーシ??5
[State -1, Standing Strong Kick]
type = ChangeState
value = 221
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = stateno = 220
trigger1 = MoveContact

;コ?ビネーシ??5
[State -1, Standing Strong Kick]
type = ChangeState
value = 222
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = stateno = 221
trigger1 = MoveContact

;立ち強パ?チ
[State -1, Stand Strong Punch]
type = ChangeState
value = 240
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 400
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

[State -1, 振り向き攻?]
type = ChangeState
value = 640
triggerall = command = "holdback"
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, 空?弱攻?]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, 空??攻?]
type = ChangeState
value = 610
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = MoveContact

[State -1, 空?強攻?]
type = ChangeState
value = 620
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 610
trigger2 = MoveContact

[State -1, しゃがみ弱攻?]
type = ChangeState
value = 400
triggerall = command = "x" || command = "a"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = 200
trigger2 = time > 3

[State -1, しゃがみ強パ?チ]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = 200
trigger2 = MoveContact

[State -1, ス?イディ?グキック]
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

;ハイジ??プ
[State -1]
type = ChangeState
value = 199
trigger1 = command = "HJ"
trigger1 = command != "NHJ"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------

[State -1, setting];kao;アクシ??顔画?
type = varset
trigger1 = 1
v = 46
value = 0

[State -1, setting];ero;脱衣KO ON(1)/OFF(0)
type = varset
trigger1 = 1
v = 39
value = 0;1

