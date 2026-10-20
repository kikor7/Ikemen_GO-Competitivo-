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
name = "super5"
command = ~D,DF,F,D,F,s
time = 30
buffer.time = 3

[Command]
name = "super1"
command = ~D,DF,F,D,F,x
time = 30
buffer.time = 3

[Command]
name = "super1"
command = ~D,DF,F,x+y
buffer.time = 3

[Command]
name = "super1"
command = ~D,DF,F,z
buffer.time = 3

[Command]
name = "super2"
command = ~D,DF,F,D,F,a
time = 30
buffer.time = 3

[Command]
name = "super2"
command = ~D,DF,F,a+b
buffer.time = 3

[Command]
name = "super2"
command = ~D,DF,F,c
buffer.time = 3

[Command]
name = "super3"
command = ~D,DF,F,D,F,y
time = 30
buffer.time = 3

[Command]
name = "super3"
command = ~D,DF,F,D,F,z
time = 30
buffer.time = 3

[Command]
name = "super4"
command = ~D,DF,F,D,F,b
time = 30
buffer.time = 3

[Command]
name = "super4"
command = ~D,DF,F,D,F,c
time = 30
buffer.time = 3

[Command]
name = "silver_crystal"
command = ~D,DB,B,D,B,x
time = 30
buffer.time = 3

[Command]
name = "silver_crystal"
command = ~D,DB,B,D,B,y
time = 30
buffer.time = 3

[Command]
name = "silver_crystal"
command = ~D,DB,B,x+y
buffer.time = 3

[Command]
name = "silver_crystal"
command = ~D,DB,B,z
buffer.time = 3

[Command]
name = "guruguru_punch_1"
command = ~F,D,DF,x
buffer.time = 3

[Command]
name = "guruguru_punch_2"
command = ~F,D,DF,y
buffer.time = 3

[Command]
name = "tiara_action_1"
command = ~D,DF,F,x
buffer.time = 3

[Command]
name = "tiara_action_2"
command = ~D,DF,F,y
buffer.time = 3

[Command]
name = "tiara_action_3"
command = ~D,DB,B,x
buffer.time = 3

[Command]
name = "tiara_action_4"
command = ~D,DB,B,y
buffer.time = 3

[Command]
name = "gorgeous_meditation"
command = ~D,B,F,a
time = 20
buffer.time = 3

[Command]
name = "gorgeous_meditation"
command = ~D,B,F,b
time = 20
buffer.time = 3

[Command]
name = "healing_escalation"
command = ~F,D,DF,a
buffer.time = 3

[Command]
name = "healing_escalation"
command = ~F,D,DF,b
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
time = 8

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
name = "holdDF";Required (do not remove)
command = /$DF
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
name = "holdc"
command = /$c
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

[State -1, 通信可否判断]
type = VarSet
trigger1 = 1
sysvar(3) = 0
[State -1, 通信可否判断]
type = VarSet
trigger1 = !NumHelper(4005) && var(26) <= 0
trigger1 = P2Name != "Sailor Jupiter" && P2Name != "Sailor_J upiter" && P2Name != "SailorJupiter"
trigger1 = P3Name != "Sailor Jupiter" && P3Name != "Sailor_Jupiter" && P3Name != "SailorJupiter"
trigger1 = P4Name != "Sailor Jupiter" && P4Name != "Sailor_Jupiter" && P4Name != "SailorJupiter"
trigger2 = !NumHelper(6000) && var(27) <= 0
trigger2 = P2Name != "Sailor Venus" && P2Name != "Sailor_Venus" && P2Name != "SailorVenus"
trigger2 = P3Name != "Sailor Venus" && P3Name != "Sailor_Venus" && P3Name != "SailorVenus"
trigger2 = P4Name != "Sailor Venus" && P4Name != "Sailor_Venus" && P4Name != "SailorVenus"
trigger3 = !NumHelper(7000) && var(25) <= 0
trigger3 = P2Name != "Sailor Mars" && P2Name != "Sailor_Mars" && P2Name != "SailorMars"
trigger3 = P3Name != "Sailor Mars" && P3Name != "Sailor_Mars" && P3Name != "SailorMars"
trigger3 = P4Name != "Sailor Mars" && P4Name != "Sailor_Mars" && P4Name != "SailorMars"
trigger4 = !NumHelper(8000) && var(24) <= 0
trigger4 = P2Name != "Sailor Mercury" && P2Name != "Sailor_Mercury" && P2Name != "SailorMercury"
trigger4 = P3Name != "Sailor Mercury" && P3Name != "Sailor_Mercury" && P3Name != "SailorMercury"
trigger4 = P4Name != "Sailor Mercury" && P4Name != "Sailor_Mercury" && P4Name != "SailorMercury"
sysvar(3) = 1
[State -1, Stand Light Punch]
type = ChangeState
value = 3000
triggerall = command = "super5"
triggerall = power >= 5000 && sysvar(3) = 1
triggerall = var(24) <= 0 && var(25) <= 0 && var(26) <= 0 && var(27) <= 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = 1957 || stateno = [1951,1954]
trigger4 = stateno = 108 && time = [10,19]

[State -1, Stand Light Punch]
type = ChangeState
value = 3400
triggerall = !numhelper(3402)
triggerall = !numHelper(1100)
triggerall = command = "super1"
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = 1957 || stateno = [1951,1954]
trigger4 = stateno = 108 && time = [10,19]

[State -1, Stand Light Punch]
type = ChangeState
value = 3100
triggerall = command = "super2"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = 1957 || stateno = [1951,1954]
trigger4 = stateno = 108 && time = [10,19]

[State -1, Stand Light Punch]
type = ChangeState
value = 3200
triggerall = !NumExplod(3202)
triggerall = !NumHelper(3203)
triggerall = command = "super3"
triggerall = power >= 3000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = 1957 || stateno = [1951,1954]
trigger4 = stateno = 108 && time = [10,19]

[State -1, Stand Light Punch]
type = ChangeState
value = 3300
triggerall = !NumHelper(3304)
triggerall = !NumHelper(3305)
triggerall = !NumHelper(3306)
triggerall = !NumHelper(3307)
triggerall = !NumHelper(3308)
triggerall = !NumHelper(3309)
triggerall = command = "super4"
triggerall = power >= 4000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = 1957 || stateno = [1951,1954]
trigger4 = stateno = 108 && time = [10,19]

[State -1, Stand Light Punch]
type = ChangeState
value = 2000
triggerall = command = "silver_crystal"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = 1957 || stateno = [1951,1954]
trigger4 = stateno = 108 && time = [10,19]

[State -1, Stand Light Punch]
type = ChangeState
value = 1000
triggerall = command = "guruguru_punch_1"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = 1957 || stateno = [1951,1954]
trigger4 = stateno = 108 && time = [10,19]

[State -1, Stand Light Punch]
type = ChangeState
value = 1005
triggerall = command = "guruguru_punch_2"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = 1957 || stateno = [1951,1954]
trigger4 = stateno = 108 && time = [10,19]

[State -1, Stand Light Punch]
type = ChangeState
value = 1400
triggerall = command = "healing_escalation"
triggerall = !numexplod(1400)
triggerall = var(3) < 3
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = 1957 || stateno = [1951,1954]
trigger4 = stateno = 108 && time = [10,19]

[State -1, Stand Light Punch]
type = ChangeState
value = 1300
triggerall = command = "gorgeous_meditation"
triggerall = !numprojID(1300)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = 1957 || stateno = [1951,1954]
trigger4 = stateno = 108 && time = [10,19]

[State -1, Stand Light Punch]
type = ChangeState
value = 1100
triggerall = command = "tiara_action_1"
triggerall = !numhelper(3402)
triggerall = !numHelper(1100)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = 1957 || stateno = [1951,1954]
trigger4 = stateno = 108 && time = [10,19]

[State -1, Stand Light Punch]
type = ChangeState
value = 1105
triggerall = command = "tiara_action_2"
triggerall = !numhelper(3402)
triggerall = !numHelper(1100)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = 1957 || stateno = [1951,1954]
trigger4 = stateno = 108 && time = [10,19]

[State -1, Stand Light Punch]
type = ChangeState
value = 1150
triggerall = command = "tiara_action_3"
triggerall = !numhelper(3402)
triggerall = !numHelper(1100)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = 1957 || stateno = [1951,1954]
trigger4 = stateno = 108 && time = [10,19]

[State -1, Stand Light Punch]
type = ChangeState
value = 1155
triggerall = command = "tiara_action_4"
triggerall = !numhelper(3402)
triggerall = !numHelper(1100)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger2 = MoveContact
trigger3 = stateno = 1957 || stateno = [1951,1954]
trigger4 = stateno = 108 && time = [10,19]

[State -1, Stand Light Punch];ムーン・スパイラル・ハートアタック
type = ChangeState
value = 1200
triggerall = command = "tiara_action_1"
triggerall = !numprojID(1200)
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 40 || stateno = 199
trigger3 = stateno = 230 || stateno = 245 || stateno = 251 || stateno = 600 || stateno = 610 || stateno = 630
trigger3 = MoveContact
trigger4 = stateno = 631 && time > 5
trigger5 = stateno = [1955,1956]

[State -1, Stand Light Punch];ムーン・スパイラル・ハートアタック
type = ChangeState
value = 1205
triggerall = command = "tiara_action_2"
triggerall = !numprojID(1200)
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 40 || stateno = 199
trigger3 = stateno = 230 || stateno = 245 || stateno = 251 || stateno = 600 || stateno = 610 || stateno = 630
trigger3 = MoveContact
trigger4 = stateno = 631 && time > 5
trigger5 = stateno = [1955,1956]

;---------------------------------------------------------------------------
;Run Fwd
;ダッシュ
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
;後退ダッシュ
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype != A
trigger1 = ctrl

;回避
[State -1, Run Back]
type = ChangeState
value = 108
triggerall = command = "kaihi"
trigger1 = statetype != A
trigger1 = ctrl || StateNo = 135 || stateno = [150,153]
trigger2 = stateno = 1001 || stateno = 1002
trigger2 = animelemtime(1) >= 0 && animelemtime(4) < 0
trigger2 = !MoveContact
;---------------------------------------------------------------------------
;Kung Fu Throw
;投げ
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = statetype != A
triggerall = ctrl
trigger1 = command = "nage"

[State -1, Jump Strong Punch]
type = ChangeState
value = 700
triggerall = command = "x"
trigger1 = stateno = 100 || stateno = 105
trigger1 = ctrl

[State -1, Jump Strong Punch]
type = ChangeState
value = 710
triggerall = command = "b"
trigger1 = stateno = 100 || stateno = 105
trigger1 = ctrl

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
value = 220
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = stateno = 205
trigger1 = MoveContact

;コンビネーション4
[State -1, Stand Strong Punch]
type = ChangeState
value = 225
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = command = "x"
trigger1 = stateno = 220
trigger1 = MoveContact

;コンビネーション5
[State -1, Standing Strong Kick]
type = ChangeState
value = 235
triggerall = command != "holddown"
triggerall = command = "x"
trigger1 = stateno = 225
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
trigger3 = stateno = 210
trigger3 = time > 8

;立ち強パンチ
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 400
trigger2 = MoveContact

[State -1, 中段攻撃]
type = ChangeState
value = 250
triggerall = command = "b" && command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 240 || stateno = 400 || stateno = 410
trigger2 = MoveContact

;立ち強キック
[State -1, Standing Strong Kick]
type = ChangeState
value = 230
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 240 || stateno = 400 || stateno = 410
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
triggerall = command = "a"
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

[State -1, 空中強攻撃]
type = ChangeState
value = 630
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
trigger2 = stateno = 200 || stateno = 400
trigger2 = time > 3

[State -1, しゃがみ強パンチ]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 400
trigger2 = MoveContact

[State -1, しゃがみ強キック]
type = ChangeState
value = 420
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 210 || stateno = 240 || stateno = 400 || stateno = 410
trigger2 = MoveContact

;ハイジャンプ
[State -1]
type = ChangeState
value = 199
triggerall = command = "HJ"
triggerall = command != "NHJ"
trigger1 = statetype != A
trigger1 = ctrl

;ジャンプ
[State -1]
type = ChangeState
value = 40
triggerall = command = "holdup"
triggerall = statetype != A
trigger1 = stateno = 200 || stateno = 210 || stateno = 240 || stateno = 400 || stateno = 410 || stateno = 420 || stateno = 700
trigger1 = MoveContact
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

