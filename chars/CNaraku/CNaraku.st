
;---------------------------------------------------------------------------
; Variable usage:
; This is a record of the variables that KFM uses. Keeping a record of your
; variable usage helps you avoid careless mistakes later.
; var(1)  - Used in kfm.cmd for combo condition (updated every tick)
; Var(2), (3), & (4) - Purple Tile Drop
; Var(5)  - Shield Status
;        0 = No Shield
;        1 = Shield Enabled
;        2 = Shield Destroyed
; Var(6)  - Shield Strength (max: 500)
; Var(7)  - Gethit timer (5 seconds)
; Var(8)  - Variable for Randomized Stuff
; Var(9)  - Lose Intro
; Var(20) - Subtank Use (0 - not used, 1 - used)
; Var(21) - Red Shield use
; Var(56) - Nightmare Mode Enabler
;        0 = Nightmare Mode Disabled
;        1 = Nightmare Mode Enabled
; Var(59) - Used for Form 2

; AI Variables:
; Var(0) - Simplifier
; Var(57) - Gametime
; Var(58) - Primary AI Variable


;---------------------------------------------------------------------------
; Lose by Time Over
; CNS difficulty: basic
; CNS レベル: 基本
[Statedef 170]
type = S

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 180, 1]
type = ChangeState
trigger1 = Time = 0
value = 181

;---------------------------------------------------------------------------
; Win state decider
; CNS difficulty: basic
; CNS レベル: 基本
[Statedef 180]
type = S

[State 180, 1]
type = ChangeState
trigger1 = Time = 0
value = 181

;---------------------------------------------------------------------------
; Win pose
[Statedef 181]
type = S
ctrl = 0
anim = 0
velset = 0,0

[State 5050, CS]
type = changeanim
trigger1 = var(59) = 2
trigger1 = anim != 10000
value = 10000

[State 181, VR]
type = varrandom
trigger1 = time = 0
v = 8
range = 0,3

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 181, PSND]
type = playsnd
trigger1 = time = 0
value = 181,var(8)

[State 181, ASS]
type = assertspecial
trigger1 = time <= 120
flag = roundnotover

;---------------------------------------------------------------------------
; Introduction
; CNS difficulty: basic
; CNS レベル: 基本
[Statedef 191]
type = S
ctrl = 0
anim = 0
velset = 0,0

[State 5150, VS]
type = varset
trigger1 = name = "Cyber_Naraku_MkII"
v = 58
value = 1

[State 5150, VS]
type = varset
trigger1 = name = "Cyber_Naraku_MkII"
v = 59
value = 2

[State 191, CS]
type = changestate
trigger1 = name = "Cyber_Naraku_MkII"
value = 193

[State 191, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = 1
flag = Intro
flag2 = nobardisplay

[State 5000, PFX]
type = palfx
trigger1 = time < 60
trigger1 = time%7=0
time = 3
invertall = 1

[State 5000, PSND]
type = playsnd
trigger1 = time = 60
value = 190,0
channel = 0

[State 5000, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT

[State 200, PF]
type = palfx
trigger1 = time < 60
time = 1
add = 0,128,0
mul = 0,256,0

[State 5000, PSND]
type = playsnd
trigger1 = time = 0
value = 900,2

[State 200, ASS]
type = assertspecial
triggerall = time <= 60
trigger1 = time%4=[0,2]
;trigger2 = time%4=1
flag = invisible

[State 200, AD]
type = angledraw
trigger1 = time < 60
scale = (61-time)/2.0,1.0

[State 191, 3] ;Change to stand state when done
type = ChangeState
trigger1 = time >= 180
value = 0

;---------------------------------------------------------------------------
; Round 2 - No Boss Mode
[Statedef 192]
type = S
ctrl = 0
anim = 0
velset = 0,0

[State 5150, VS]
type = varset
trigger1 = palno = 7
trigger2 = palno = 8
trigger3 = palno = 9
trigger4 = palno = 10
trigger5 = palno = 11
trigger6 = palno = 12
trigger7 = name = "Cyber_Naraku_MkII"
v = 59
value = ifelse(var(58)=0,0,2)

[State 191, Boss Mode]
type = ChangeState
trigger1 = var(59) = 2
trigger1 = time = 0
value = 193

[State 191, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = 1
flag = Intro
flag2 = nobardisplay
flag3 = nomusic

[State 5000, PFX]
type = palfx
trigger1 = time < 60
trigger1 = time%7=0
time = 3
invertall = 1

[State 5000, PSND]
type = playsnd
trigger1 = time = 60
value = 181,1
channel = 0

[State 5000, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT

[State 200, PF]
type = palfx
trigger1 = time < 60
time = 1
add = 0,128,0
mul = 0,256,0

[State 5000, PSND]
type = playsnd
trigger1 = time = 0
value = 900,2

[State 200, ASS]
type = assertspecial
triggerall = time <= 60
trigger1 = time%4=[0,2]
;trigger2 = time%4=1
flag = invisible

[State 200, AD]
type = angledraw
trigger1 = time < 60
scale = (61-time)/2.0,1.0

[State 191, 3] ;Change to stand state when done
type = ChangeState
trigger1 = time >= 180
value = 0

;---------------------------------------------------------------------------
; Round 2 - With Boss Mode
[Statedef 193]
type = S
ctrl = 0
anim = 1200
velset = 0,0

[State 15100, REX]
type = removeexplod
trigger1 = time = 0
ID = 10000

[State 15100, REX]
type = removeexplod
trigger1 = time = 0
ID = 10003

[State 15100, REX]
type = removeexplod
trigger1 = time = 0
ID = 10004

[State 15100, REX]
type = removeexplod
trigger1 = time = 0
ID = 10005

[State 5000, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT

[State 5000, PSND]
type = playsnd
trigger1 = time = 30
value = 181,1
channel = 0
pan = -1

[State 5000, PSND]
type = playsnd
trigger1 = time >= 90
trigger1 = time <= 400
value = 190,2
channel = 1
lowpriority = 1

[State 193, EC]
type = envshake
trigger1 = time = 90
time = 310
freq = 90
ampl = -8

[State 193, EC]
type = envcolor
trigger1 = time = 130
trigger2 = time = 190
trigger3 = time = 235
trigger4 = time = 265
trigger5 = time = 280
trigger6 = time = 285
trigger7 = time = 290
trigger8 = time = 295
trigger9 = time = 300
trigger10 = time = 305
time = 3

[State 5000, PSND]
type = playsnd
trigger1 = time = 130
value = 181,3
channel = 0
pan = -1

[State 5000, PSND]
type = playsnd
trigger1 = time = 130
trigger2 = time = 190
trigger3 = time = 235
trigger4 = time = 265
trigger5 = time = 280
trigger6 = time = 285
trigger7 = time = 290
trigger8 = time = 295
trigger9 = time = 300
trigger10 = time = 305
value = 190,1

[State 193, APFX]
type = allpalfx
trigger1 = time >= 310
trigger1 = time < 326
time = 1
add = (time-310)*16,(time-310)*16,(time-310)*16

[State 193, APFX]
type = allpalfx
trigger1 = time >= 326
trigger1 = time < 450
add = 256,256,256

[State 193, APFX]
type = allpalfx
trigger1 = time >= 450
trigger1 = time < 482
time = 1
add = (482-time)*8,(482-time)*8,(482-time)*8

[State 193, CA]
type = changeanim
trigger1 = time = 330
value = 10000

[State 2000, Jukebox]
type = Helper
trigger1 = NumHelper(10000) = 0
trigger1 = time = 330
helpertype = Normal
name = "Jukebox"
id = 10000
pos = 0,0
postype = p1
facing = -1
stateno = 10000
keyctrl = 0
ownpal = 1
supermovetime = 999999999
pausemovetime = 999999999

[State -2, Explod]
type = Explod
trigger1 = time = 330
trigger1 = numexplod(10000) = 0
anim = 10001
ID = 10000
pos = 0,0
bindtime = -1
removetime = -1
sprpriority = -1
ownpal = 0;1
shadow = -1,-1,-1

[State -2, Core]
type = Explod
trigger1 = time = 330
trigger1 = numexplod(10003) = 0
anim = 10003
ID = 10003
pos = -131,0
bindtime = -1
removetime = -1
sprpriority = 0
ownpal = 0
shadow = -1,-1,-1

[State -2, Explod]
type = Explod
trigger1 = time = 330
trigger1 = numexplod(10004) = 0
anim = 10004
ID = 10004
pos = -65,0
bindtime = -1
removetime = -1
sprpriority = -2
ownpal = 0;1

[State -2, Explod]
type = Explod
trigger1 = time = 330
trigger1 = numexplod(10005) = 0
anim = 10005
ID = 10005
pos = 0,0
bindtime = -1
removetime = -1
sprpriority = 0
ownpal = 1

[State 5000, PSND]
type = playsnd
trigger1 = time = 483
value = 190,3
channel = 0

[State 191, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = 1
flag = Intro
flag2 = nobardisplay
flag3 = nomusic

[State 191, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = time < 330
flag = invisible

[State -2, Explod]
type = Explod
trigger1 = time = 600
trigger1 = numexplod(193) = 0
anim = 193
ID = 193
pos = 160,120
postype = left
bindtime = -1
removetime = 156
sprpriority = -1
ownpal = 1
ontop = 1

[State 193, MEX]
type = modifyexplod
trigger1 = time >= 600
trigger1 = time <= 609
id = 193
scale = (611-time)/2.0,1.0

[State 193, APFX]
type = bgpalfx
trigger1 = time = 600
;trigger1 = time < 756
time = 159
add = 256,0,0
mul = 290,0,0
sinadd = 256,0,0,53

[State 195, PSND]
type = playsnd
trigger1 = time = 600
value = 190,4
channel = 0

[State 193, CS]
type = changestate
trigger1 = time >= 756;600
value = 0

;---------------------------------------------------------------------------
; Shield Activate
[Statedef 195]
type = A
physics = S
ctrl = 0
anim = 195
velset = 0,0
movetype = I
sprpriority = 2

[State 195, VS]
type = varset
trigger1 = time = 0
v = 6
value = 500

[State 195, PSND]
type = playsnd
trigger1 = time = 0
value = 0,0
channel = 0

[State 195, PSND]
type = playsnd
trigger1 = time = 6
value = 900,0

[State 195, Shield]
type = helper
trigger1 = time = 18
helpertype = normal
name = "shield"
ID = 900
pos = 0,-73
postype = p1
stateno = 900
ownpal = 1
supermovetime = 999999
pausemovetime = 999999

[State 195, 2]
type = ChangeState
trigger1 = Time = 60
value = ifelse(life<=500,200,0)
ctrl = 1

;---------------------------------------------------------------------------
; Red Shield Activate
[Statedef 196]
type = A
physics = S
ctrl = 0
velset = 0,0
movetype = I
sprpriority = 2

[State 195, PSND]
type = playsnd
trigger1 = time = 0
value = 0,0
channel = 0

[State 195, PSND]
type = playsnd
trigger1 = time = 6
value = 900,0

[State 195, Shield]
type = helper
trigger1 = time = 18
helpertype = normal
name = "red_shield"
ID = 950
pos = 0,-73
postype = p1
stateno = 950
ownpal = 1
supermovetime = 999999
pausemovetime = 999999

[State 196, VS]
type = varset
trigger1 = time = 0
v = 21
value = 1

[State 195, 2]
type = ChangeState
trigger1 = Time = 60
value = 0
ctrl = 1

;--------------
; Teleport
;--------------
[Statedef 200]
velset = 0,0
ctrl = 0

[State 200, CA]
type = changeanim
trigger1 = anim = 5
value = 0

[State 200, PF]
type = palfx
trigger1 = time <= 20
time = 1
add = 0,128,0
mul = 0,256,0

[State 200, AD]
type = angledraw
trigger1 = time <= 20
scale = (20-time)/20.0,1.0

[State 200, VS]
type = varset
trigger1 = prevstateno = 5000
v = 5
value = 0

[State 200, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT

[State 200, PlaySnd]
type = PlaySnd
trigger1 = time = 0
trigger1 = prevstateno = 5000
value = 5000,4
channel = 0

[State 200, PlaySnd]
type = PlaySnd
trigger1 = time = 0
trigger1 = prevstateno != 5000
value = 0,1
channel = 0

[State 200, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 200,0

[State 200, ASS]
type = assertspecial
trigger1 = time > 20
trigger1 = time < 60
trigger2 = time <= 20
trigger2 = time%2=0
flag = invisible

[State 200, Teleport Grab - AI Only]
type = ChangeState
trigger1 = time = 59
trigger1 = life <= 500
trigger1 = prevstateno = 195
trigger1 = var(58) > 0
value = 800

[State 200, PosAdd]
type = PosAdd
trigger1 = time = 60
x = (P2Dist X) + 240;(ifelse(facing=1,240,-240))

[State 200, PS]
type = posset
trigger1 = time = 60
trigger1 = var(58) > 0
y = -(random%100);(P2dist Y)

[State 200, End]
type = ChangeState
trigger1 = Time > 60
value = 0
ctrl = 1

;--------------------------
; Teleport Grab
;--------------------------
[Statedef 800]
type = A
movetype = A
physics = S
ctrl = 0
anim = 800
velset = 0,0
sprpriority = 2

[State 800, PP]
type = playerpush
trigger1 = 1
value = 0

[State 800, HD]
type = hitdef
getpower = 60,30
trigger1 = 1
attr = A, NT
hitflag = MAF
guardflag = L
priority = 7,Miss
sparkno = -1
guard.sparkno = -1
hitsound = -1
p1facing = 1
p2facing = 1
p1stateno = 801
p2stateno = 820
ID = 800

[State 800, PS]
type = posset
trigger1 = 1
x = enemynear,pos x
y = enemynear,pos y

[State 800, ASS]
type = assertspecial
trigger1 = 1
flag = invisible
flag2 = noshadow

[State 800, CS]
type = changestate
trigger1 = time >= 180
trigger1 = movecontact = 0
value = 810

;--------------------------
; Teleport Grab Successful
;--------------------------
[Statedef 801]
type = A
movetype = A
physics = S
ctrl = 0
velset = 0,0
sprpriority = 0

[State 800, ASS]
type = assertspecial
trigger1 = 1
flag = invisible
flag2 = noshadow

[State 800, PP]
type = playerpush
trigger1 = 1
value = 0

[State 181, VR]
type = varrandom
trigger1 = time < 60
v = 8
range = 0,2

[State 800, PSND]
type = playsnd
trigger1 = time = 60
value = s801,var(8)
channel = 0

[State 810, Bind 1]
type = TargetBind
trigger1 = 1
pos = 50, -87

[State 810, Move to Center]
type = posadd
trigger1 = time >= 180
x = ifelse(pos x=0,0,ifelse(pos x>0,-1,1))
y = ifelse(pos y=-50,0,ifelse(pos y>-50,-1,1))

[State 800, PSND]
type = playsnd
trigger1 = time = 180
value = s0,1
channel = 0

[State 801, CS]
type = changestate
trigger1 = time >= 180
trigger1 = target(800),stateno != 820
value = 810

[State 802, Explod]
type = Explod
;trigger1 = target,stateno = 820
trigger1 = time = 120
;trigger1 = time < 240
;trigger1 = numexplod(801) = 0
anim = 801
ID = 801
pos = 0,-8
postype = p2
facing = ifelse((target,facing=1),1,-1)
bindtime = -1
removetime = 120;10
sprpriority = 5
ownpal = 1

[State 801, CS]
type = changestate
trigger1 = time >= 240
trigger1 = target,stateno = 820
value = 802

;--------------------------
; Teleport Grab Blast
;--------------------------
[Statedef 802]
type = A
movetype = A
physics = S
ctrl = 0
velset = 0,0
sprpriority = 0

[State 200, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 200,0

[State 200, ASS]
type = assertspecial
trigger1 = time <= 20
trigger1 = time%2=0
flag = invisible

[State 200, PF]
type = palfx
trigger1 = time <= 20
time = 1
add = 0,128,0
mul = 0,256,0

[State 200, AD]
type = angledraw
trigger1 = time <= 20
scale = (time)/20.0,1.0

[State 200, PlaySnd]
type = PlaySnd
trigger1 = time = 30
value = 800,1

[State 810, Bind 1]
type = TargetBind
trigger1 = time < 65
pos = 50, -87

[State 802, CA]
type = changeanim
trigger1 = time = 65
value = 0

[State 802, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT

[State 802, TLA]
type = targetlifeadd
trigger1 = time = 65
value = -150

[State 802, TS]
type = targetstate
trigger1 = time = 65
value = 821

[State 802, PSND]
type = playsnd
trigger1 = time = 65
value = 800,2

[State 802, Explod]
type = Explod
trigger1 = time = 65
anim = 802
ID = 802
pos = 50,-78
bindtime = -1
removetime = 22
sprpriority = 5
ownpal = 1

[State 1100, Shake]
type = EnvShake
trigger1 = time = 65
time  = 22
ampl  = 20
freq  = 180

[State 802, PSND]
type = playsnd
trigger1 = time = 95
value = 181,3

[State 802, CS]
type = changestate
trigger1 = time >= 180
value = 0
ctrl = 1

;--------------------------
; Teleport Grab Failed
;--------------------------
[Statedef 810]
type = A
movetype = A
physics = S
ctrl = 0
anim = 0
velset = 0,0
sprpriority = 0

[State 801, REX]
type = removeexplod
trigger1 = numexplod(801) > 0
trigger1 = time <= 0
ID = 801

[State 200, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 200,0

[State 200, ASS]
type = assertspecial
trigger1 = time <= 20
trigger1 = time%2=0
flag = invisible

[State 200, PF]
type = palfx
trigger1 = time <= 20
time = 1
add = 0,128,0
mul = 0,256,0

[State 200, AD]
type = angledraw
trigger1 = time <= 20
scale = (time)/20.0,1.0

[State 802, CA]
type = changeanim
trigger1 = time = 0
value = 0

[State 802, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT

[State 802, CS]
type = changestate
trigger1 = time > 20
value = 0
ctrl = 1

;----------------------------------------------------------------------
[Statedef 820]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 2

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 820

[State 820, 1]
type = ChangeAnim2
triggerall = Time >= 120
trigger1 = (command = "a") || (command = "b") || (command = "c")
trigger2 = (command = "x") || (command = "y") || (command = "z")
value = ifelse(anim=820,821,820)

[State 821, 3] ; Recover in mid air (use SelfState)
type = SelfState
triggerall = Time >= 180
triggerall = time < 240
triggerall = random <= 100
trigger1 = (command = "a") || (command = "b") || (command = "c")
trigger2 = (command = "x") || (command = "y") || (command = "z")
value = 50;5210
ctrl = 1

;----------------------------------------------------------------------
[Statedef 821]
type = A
movetype = H
physics = N
velset = -15,0
poweradd = 40

[State 200, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 11,0

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 820

[State 821, PFX]
type = palfx
trigger1 = time = 0
palfx.time = 14
palfx.mul = 512,128,0

[State 821, 1]
type = VelAdd
Trigger1 = 1
y = .4

[State 821, 4]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100 ;Hit ground

;--------------------------
; Laser Camera
;--------------------------
[Statedef 1000]
type = A
poweradd = 0
movetype = A
physics = S
ctrl = 0
anim = 1000
velset = 0,0
sprpriority = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1000,0

[State 2200, VR]
type = varrandom
trigger1 = time = 0
trigger2 = time = 15
trigger3 = time = 30
trigger4 = time = 45
v = 12
range = 0,320

[State 1000, Vertical Laser]
type = helper
trigger1 = time = 15
trigger2 = time = 30
trigger3 = time = 45
helpertype = normal
name = "Lazergun_Vertical"
ID = 1000
pos = var(12),-240
postype = left
stateno = 1010
ownpal = 1
supermovetime = 999999
pausemovetime = 999999

[State 1000, Horizontal Laser]
type = helper
triggerall = life <= 500
trigger1 = time = 0
trigger2 = time = 30
helpertype = normal
name = "Lasergun_Horizontal"
ID = 1000
pos = 0,-250
postype = left
stateno = 1020
ownpal = 1
supermovetime = 999999
pausemovetime = 999999

[State 1000, Trick Laser]
type = helper
triggerall = life <= 500
trigger1 = time = 60
helpertype = normal
name = "Lasergun_Tricky"
ID = 1000
pos = 0,-250
postype = right
stateno = 1030
ownpal = 1
facing = -1
supermovetime = 999999
pausemovetime = 999999

[State 1000, CS]
type = changestate
trigger1 = numhelper(1000) = 0
trigger1 = time > 15
value = ifelse(var(58)>0,200,0)
ctrl = ifelse(var(58)>0,0,1)

;----------------------------
; Cyber Saimyosho Spawn
;----------------------------
[Statedef 1100]
type = A
poweradd = 0
movetype = A
physics = S
velSet = 0,0
sprPriority = 0
anim = 1000
ctrl = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1100,2

[State 1100, Insects]
type = Helper
trigger1 = time = 30
helpertype = normal
name = "Insect_Spawner"
ID = 1102
pos = 100,-50
postype = p1
stateno = 1102
ownpal = 1
pausemovetime = 999999

[State 1100, Change]
type = changestate
trigger1 = life <= 500
trigger1 = time >= 90
trigger2 = life > 500
trigger2 = time >= 120
value = ifelse(var(58)>0,200,0)
ctrl = ifelse(var(58)>0,0,1)

;----------------------------
; Soul Body - Tabuu Version
;----------------------------
[Statedef 1200]
type = A
poweradd = 20
movetype = A
physics = S
velSet = 0,0
sprPriority = 0
anim = 1200
ctrl = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 2000,3

[State 1100, SB]
type = Helper
trigger1 = time >= 60
trigger1 = time <= 210
trigger1 = (time-60)%15=0
helpertype = normal
name = "Soul Body"
ID = 1200
pos = 0,0
postype = p1
stateno = 1201
ownpal = 1
pausemovetime = 999999

[State 1100, Shake]
type = EnvShake
trigger1 = time >= 60
trigger1 = time <= 210
trigger1 = (time-60)%15=0
time  = 10
ampl  = 10
freq  = 90

[State 5000, PSND]
type = playsnd
trigger1 = time >= 60
trigger1 = time <= 210
trigger1 = (time-60)%15=0
value = 1200,0
channel = 4

[State 1100, Change]
type = changestate
trigger1 = time > 210
value = ifelse(var(58)>0,200,0)
ctrl = ifelse(var(58)>0,0,1)

;----------------------------
; Palm Laser
;----------------------------
[Statedef 1300]
type = A
poweradd = 20
movetype = A
physics = S
velSet = 0,0
sprPriority = 0
anim = 1000
ctrl = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 2000,3

[State 13000, Laser Beam 1]
type = helper
trigger1 = time = 45
helpertype = normal
name = "Laser Eyes 1"
ID = 14001
pos = 45,-85
postype = p1
stateno = 14001
ownpal = 1

[State 13000, Laser Beam 2]
type = helper
trigger1 = time = 45
helpertype = normal
name = "Laser Eyes 2"
ID = 14011
pos = 45,-85
postype = p1
stateno = 14001
ownpal = 1

[State 193, EC]
type = envshake
trigger1 = time = 45
time = 300
freq = 90
ampl = -4

[State 14000, Projectile]
type = projectile
trigger1 = time >= 45
trigger1 = numprojID(14000) = 0
attr = A, SP
ProjID = 14000
projanim = 14001
projremovetime = 12
projsprpriority = 5
offset = 45,-85
animtype  = hard
damage    = 30,0
priority  = 5
hitflag = MAF-
guardflag = M
pausetime = 3,3
sparkxy = -10,0
hitsound   = s2000,2
guardsound = 6,0
ground.type = high
ground.slidetime = 40
ground.hittime  = 40
ground.velocity = -3,-0.5
air.velocity = -3,-1
getpower = 30,15
bindtime = -1

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time >= 45
trigger1 = time%4=0
value = 14000,0;1000,2
channel = 1

[State 11000, 1]
type = ChangeState
trigger1 = time >= 345
trigger1 = numhelper(14001) = 0
trigger1 = numhelper(14011) = 0
value = ifelse(var(58)>0,200,0)
ctrl = ifelse(var(58)>0,0,1)

;----------------------------
; Light Beam
;----------------------------
[Statedef 1400]
type = A
movetype = A
physics = S
velSet = 0,0
sprPriority = 0
anim = 1200
ctrl = 0

[State 1400, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT

[State 9800, SP]
type = superpause
trigger1 = time = 0
trigger1 = var(58) = 0
time = 60
movetime = 30
anim = -1
sound = S9800,0
p2defmul = 1
unhittable = 1

[State 195, SuperPortrait]
type = helper
trigger1 = time = 0
trigger1 = var(58) = 0
helpertype = normal
name = "superpor"
ID = 9800
pos = 0,0
postype = left
facing = ifelse(teamside=1,1,-1)
stateno = 9800
ownpal = 1
supermovetime = 999999
pausemovetime = 999999

[State 2000, Powadd]
type = poweradd
trigger1 = time = 0
trigger1 = var(58) = 0
value = -3000

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 801,1
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 90
value = 0,1
channel = 0

[State 33334, Homing XBox]
type = Helper
trigger1 = time = 60
helpertype = normal
pausemovetime = 999999
supermovetime = 999999
name = "Heal Beam"
id = 1401
pos = 0,-400;floor(pos y)
postype = P1
stateno = 1401
ownpal = 1

[State 1400, LA]
type = lifeadd
trigger1 = time >= 60
trigger1 = time%4=0
value = 8

[State 11000, 1]
type = ChangeState
trigger1 = time >= 240
trigger1 = numhelper(14001) = 0
trigger1 = numhelper(14011) = 0
value = ifelse(var(58)>0,200,0)
ctrl = ifelse(var(58)>0,0,1)

;---------------------------
;Nova Strike
;Don't you get tired of all these Megaman moves?
[statedef 1500]
statetype = A
movetype = A
physics = N
velset = 0,0
anim = 1200
ctrl = 0

[State 9800, SP]
type = superpause
trigger1 = time = 0
trigger1 = var(58) = 0
time = 60
movetime = 30
anim = -1
sound = S9800,0
p2defmul = 1
unhittable = 1

[State 195, SuperPortrait]
type = helper
trigger1 = time = 0
trigger1 = var(58) = 0
helpertype = normal
name = "superpor"
ID = 9800
pos = 0,0
postype = left
facing = ifelse(teamside=1,1,-1)
stateno = 9800
ownpal = 1
supermovetime = 999999
pausemovetime = 999999

[State 1500, SB]
type = screenbound
trigger1 = 1
value = 0

[State 2000, Powadd]
type = poweradd
trigger1 = time = 0
trigger1 = var(58) = 0
value = -1000

[State 1500, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 800,1
channel = 0

[State 902, PSND]
type = playsnd
trigger1 = time = 0
value = 900,2

[State 193, EC]
type = envshake
trigger1 = time = 60
time = 180
freq = 90
ampl = -4

[State 1500, ASS]
type = assertspecial
trigger1 = 1
flag = unguardable
ignorehitpause = 1

[State 1500, PSND]
type = playsnd
trigger1 = time >=60
trigger1 = time%6=0
trigger1 = frontedgedist > -120
trigger1 = backedgedist > -120
value = 800,2
channel = 5

[State 1500, AI]
type = afterimage
trigger1 = time = 60
time = 30
TimeGap  = 1
FrameGap = 5
length = 15
palbright = 30,30,30
palcontrast = 100,100,220
palpostbright = 0,0,0
paladd = 15,15,40
palmul = .65,.65,.80

[State 1500, PFX]
type = palfx
trigger1 = time >= 60
trigger1 = time%4=2
time = 2
invertall = 1

[State 5000, Explod]
type = explod
trigger1 = time >= 60
trigger1 = numexplod(1500) = 0
anim = 1501
pos = 50,-34
ID = 1500
bindtime = -1
removetime = 4
sprpriority = 0
ownpal = 1
scale = 4.0,2.5

[State 1500, PA]
type = posadd
trigger1 = time = 60
y = -30

[State 1101, HD]
type = Hitdef
trigger1 = time = 60
trigger2 = frontedgedist <= -300
attr = A, HA
priority = 7,Hit
hitflag = MAFD
animtype  = Hard
damage    = 150, 70
guardflag = M
pausetime = 0,5
sparkxy = -10,-50
hitsound   = -1;s800,2
guardsound = -1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -22,-3.5
air.velocity = -25,-3
fall = 1
fall.recover = 0
getpower = 0,0

[State 1500, CA]
type = changeanim
trigger1 = time = 60
value = 1500

[State 1101, VS]
type = velset
trigger1 = time >= 60
x = 20;20.0*(fvar(7)/fvar(9))
y = 0;20.0*(fvar(8)/fvar(9))

[State 1500, T]
type = turn
trigger1 = frontedgedist <= -360

[State 1500, Posset]
type = posset
trigger1 = frontedgedist <= -150
trigger1 = var(58) > 0
y = enemynear,pos y;ifelse(random<=499,0,-85)

[State 11000, 1]
type = ChangeState
trigger1 = time >= 240
trigger1 = frontedgedist > 80
trigger1 = backedgedist > 80
;trigger1 = numhelper(14001) = 0
;trigger1 = numhelper(14011) = 0
value = ifelse(var(58)>0,200,0)
ctrl = ifelse(var(58)>0,0,1)

;---------------------------
; Sigma's Purple Xbox Drop
[Statedef 2000]
movetype = A
velset = 0,0
anim = 1000
ctrl = 0

[State 2000, CA]
type = changeanim
trigger1 = var(59) = 2
trigger1 = anim != 10000
value = 10000

[State 9800, SP]
type = superpause
trigger1 = time = 0
trigger1 = var(58) = 0
time = 60
movetime = 30
anim = -1
sound = S9800,0
p2defmul = 1
unhittable = 1

[State 195, SuperPortrait]
type = helper
trigger1 = time = 0
trigger1 = var(58) = 0
helpertype = normal
name = "superpor"
ID = 9800
pos = 0,0
postype = left
facing = ifelse(teamside=1,1,-1)
stateno = 9800
ownpal = 1
supermovetime = 999999
pausemovetime = 999999

[State 2000, Powadd]
type = poweradd
trigger1 = time = 0
trigger1 = var(58) = 0
value = -1000

[State 181, VR]
type = varrandom
trigger1 = time = 0
v = 8
range = 3,4

[State 2000, PSND]
type = PlaySnd
trigger1 = Time = 0
value = 2000, var(8)
channel = 0

[State 33334, Homing XBox]
type = Helper
trigger1 = time = 60
trigger2 = time = 120
trigger3 = time = 180
trigger4 = time = 240
helpertype = normal
pausemovetime = 999999
supermovetime = 999999
name = "Purple_XBox"
id = 2000
pos = 0,0;floor((Pos X)+(P2Dist X)), floor((Pos Y)+(P2Dist Y))
postype = p2;P1
stateno = 2010
ownpal = 1

[State 33334, Shifting XBox]
type = Helper
trigger1 = time = 300
helpertype = normal
pausemovetime = 999999
supermovetime = 999999
name = "Purple_XBox_2"
id = 2000
pos = 0,0;floor((Pos X)+(P2Dist X)), floor((Pos Y)+(P2Dist Y))
postype = p2;P1
stateno = 2011
ownpal = 1

[State 33334, State]
type = ChangeState
trigger1 = time > 300
trigger1 = NumHelper(2000) = 0
value = ifelse(var(59)=2,0,ifelse(var(58)>0,200,0))
ctrl = ifelse(var(59)=2,1,ifelse(var(58)>0,0,1))

;---------------------------
; Nuclear Blitzkrieg - Alpha
[Statedef 11000]
movetype = I;A
velset = 0,0
ctrl = 0

[State 11000, CS]
type = changestate
; Change to Beta Version of Nuclear Blitzkrieg
triggerall = Var(21) = 1
trigger1 = time = 0
trigger1 = random%3 = [0,1]
trigger2 = time = 170
trigger2 = random%2 = 0
value = 11050

[State 11000, PSND]
type = playsnd
trigger1 = time = 0
value = 2000,4
channel = 0

[State 5000, PSND]
type = playsnd
trigger1 = time = 10
value = 11000,0

[State 5000, PSND]
type = playsnd
trigger1 = time >= 40
trigger1 = time <= 140
trigger1 = time%10 = 0
value = 11000,1
channel = 0

[State 11000, Missle Going Up]
type = projectile
trigger1 = time >= 40
trigger1 = time <= 140
trigger1 = time%10 = 0
projanim = 11000
projscale = 0.5,0.5
projremovetime = 30
velocity = 0,-10
projsprpriority = -2
offset = (15-(random%30)), -138

[State 1000, Missle Coming Down]
type = helper
trigger1 = time >= 50
trigger1 = time <= 150
trigger1 = time%10 = 0
helpertype = normal
name = "Missile"
ID = 11000
pos = (20+(random%280)),-600
postype = left
stateno = 11001
ownpal = 1

[State 11000, 1]
type = ChangeState
trigger1 = time >= 170
value = 0
ctrl = 1

;---------------------------
; Nuclear Blitzkrieg - Beta
[Statedef 11050]
movetype = I;A
velset = 0,0
ctrl = 0

[State 11000, PSND]
type = playsnd
trigger1 = time = 0
value = 2000,4
channel = 0

[State 5000, PSND]
type = playsnd
trigger1 = time = 10
value = 11000,0

[State 5000, PSND]
type = playsnd
trigger1 = time >= 40
trigger1 = time <= 170
trigger1 = (time-10)%30 = 0
value = 11000,1
channel = 0

[State 11000, Missle Going Up]
type = projectile
trigger1 = time >= 40
trigger1 = time <= 170
trigger1 = (time-10)%30 = 0
projanim = 11000
projscale = 0.5,0.5
projremovetime = 30
velocity = 0,-10
projsprpriority = -2
offset = -14, -138

[State 11000, Missle Going Up]
type = projectile
trigger1 = time >= 40
trigger1 = time <= 170
trigger1 = (time-10)%30 = 0
projanim = 11000
projscale = 0.5,0.5
projremovetime = 30
velocity = 0,-10
projsprpriority = -2
offset = -14, -138

[State 1000, Missle Coming Down]
type = helper
trigger1 = time >= 50
trigger1 = time <= 180
trigger1 = (time-20)%30 = 0
helpertype = normal
name = "Missile"
ID = 11050
pos = -250,-500
postype = p2
stateno = 11051
ownpal = 1
facing = 1

[State 1000, Missle Coming Down]
type = helper
trigger1 = time >= 50
trigger1 = time <= 180
trigger1 = (time-20)%30 = 0
helpertype = normal
name = "Missile"
ID = 11051
pos = 250,-500
postype = p2
stateno = 11051
ownpal = 1
facing = -1

[State 11000, 1]
type = ChangeState
trigger1 = time >= 220
value = 0
ctrl = 1

;---------------------------
; Bio Drain
[Statedef 12000]
movetype = A
velset = 0,0
ctrl = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1000,0

[State 12000, Target]
type = helper
trigger1 = time = 10
helpertype = normal
name = "Drain Target"
ID = 12000
pos = 51,-138
stateno = 12010
ownpal = 1

[State 12000, LA]
type = lifeadd
triggerall = numhelper(12000) >= 1
triggerall = helper(12000),stateno = 12011
trigger1 = (helper(12000),time)%20 = 0
trigger1 = (helper(12000),time) > 0
value = 10
absolute = 1

[State 5000, PFX]
type = palfx
triggerall = numhelper(12000) >= 1
triggerall = helper(12000),stateno = 12011
trigger1 = (helper(12000),time)%20 = 0
trigger1 = (helper(12000),time) > 0
time = 3
add = 256,256,256

[State 5000, Explod]
type = explod
triggerall = numhelper(12000) >= 1
triggerall = helper(12000),stateno = 12011
trigger1 = numexplod(12000) = 0
anim = 12001
pos = 14,-78
ID = 12000
bindtime = -1
removetime = 200
sprpriority = 1
ownpal = 1
scale = 2.0,2.0
persistent = 0

[State 12000, Pipe 1]
type = helper
triggerall = numhelper(12000) >= 1
triggerall = helper(12000),stateno = 12011
trigger1 = numhelper(12050) = 0
helpertype = normal
name = "Organic Pipe 1"
ID = 12050
pos = 14,-78
stateno = 12050
ownpal = 1

[State 12000, Pipe 2]
type = helper
triggerall = numhelper(12000) >= 1
triggerall = helper(12000),stateno = 12011
trigger1 = numhelper(12051) = 0
helpertype = normal
name = "Organic Pipe 2"
ID = 12051
pos = 14,-78
stateno = 12051
ownpal = 1

[State 12000, Pipe 3]
type = helper
triggerall = numhelper(12000) >= 1
triggerall = helper(12000),stateno = 12011
trigger1 = numhelper(12052) = 0
helpertype = normal
name = "Organic Pipe 3"
ID = 12052
pos = 14,-78
stateno = 12052
ownpal = 1

[State 12000, Pipe 4]
type = helper
triggerall = numhelper(12000) >= 1
triggerall = helper(12000),stateno = 12011
trigger1 = numhelper(12053) = 0
helpertype = normal
name = "Organic Pipe 4"
ID = 12053
pos = 14,-78
stateno = 12053
ownpal = 1

[State 11000, 1]
type = ChangeState
trigger1 = time >= 11
trigger1 = numhelper(12000) = 0
trigger1 = numhelper(12050) = 0
trigger1 = numhelper(12051) = 0
trigger1 = numhelper(12052) = 0
trigger1 = numhelper(12053) = 0
value = ifelse(prevstateno=12000,0,12000)
ctrl = ifelse(prevstateno=12000,1,0)

;---------------------------
; Omega Satellite Laser
[Statedef 13000]
movetype = A
velset = 0,0
ctrl = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 801,0

[State 13000, Laser Beam]
type = helper
trigger1 = time = 0
helpertype = normal
name = "Huge Ass Laser"
ID = 13001
pos = 0,0
stateno = 13001
ownpal = 1

[State 13000, Eye Laser]
type = ChangeState
trigger1 = var(56) = 1
trigger1 = life <= 500
trigger1 = time = 285
value = 14000

[State 11000, 1]
type = ChangeState
trigger1 = time >= 60
trigger1 = numhelper(13001) = 0
value = 0
ctrl = 1

;---------------------------
; I got Laser Eyes
; And I know what you're thinkin
; It comes as no surprise that x-mas lights are blinkin
; AND I'M SO CURIOUS! AND I'M So CURIOUS! AND I'M SO CURIOUS
; AND I GOT LASER EYES! HEY!
[Statedef 14000]
movetype = A
velset = 0,0
ctrl = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 801,0
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 60
value = 181,3
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time >= 45
trigger1 = time%4=0
value = 14000,0;1000,2
channel = 1
;lowpriority = 1

[State 13000, Laser Beam 1]
type = helper
trigger1 = time = 45
helpertype = normal
name = "Laser Eyes 1"
ID = 14001
pos = 38,-100
postype = p1
stateno = 14001
ownpal = 1

[State 13000, Laser Beam 2]
type = helper
trigger1 = time = 45
helpertype = normal
name = "Laser Eyes 2"
ID = 14011
pos = 38,-100
postype = p1
stateno = 14001
ownpal = 1

[State 193, EC]
type = envshake
trigger1 = time = 45
time = 300
freq = 90
ampl = -4

[State 14000, Projectile]
type = projectile
trigger1 = time >= 45
trigger1 = numprojID(14000) = 0
attr = A, SP
ProjID = 14000
projanim = 14001
projremovetime = 12
projsprpriority = 5
offset = 38,-100
animtype  = hard
damage    = 30,0
priority  = 5
hitflag = MAF-
guardflag = M
pausetime = 3,3
sparkxy = -10,0
hitsound   = s2000,2
guardsound = 6,0
ground.type = high
ground.slidetime = 40
ground.hittime  = 40
ground.velocity = -3,-0.5
air.velocity = -3,-1
getpower = 0,0

[State 11000, 1]
type = ChangeState
trigger1 = time >= 345
trigger1 = numhelper(14001) = 0
trigger1 = numhelper(14011) = 0
value = 0
ctrl = 1
