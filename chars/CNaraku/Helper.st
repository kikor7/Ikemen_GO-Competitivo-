;===============================
; Helper States
;===============================

;------------
; AI Helper
;------------
[StateDef 9741]
type = S
movetype = I
physics = N
anim = 9741
ctrl = 0

[State 9741, Safety]; Just in case your opponent is very poorly coded.
type = SelfState
trigger1 = !IsHelper
value = 5050

[State 9741, UglyHack]
type = VarSet
trigger1 = !var(1)
var(2) = 2

[State 9741, PauseCheck]
type = VarSet
trigger1 = GameTime > Parent,var(57)
trigger2 = !(Parent,Alive)
trigger3 = RoundState != 2
trigger4 = Parent,var(58)
trigger5 = var(3):=0
var(2) = (var(3):=1)+(var(4):=0)

[State 9741, Facing]
type = Turn
trigger1 = var(9):=(Facing != Parent,Facing)
trigger1 = !(var(4):=0)

[State 9741, DirTurnOnAI]
type = ParentVarSet
triggerall = !(var(3) || var(9))
trigger1 = Parent,command = "holdfwd"
trigger2 = Parent,command = "holdback"
trigger3 = Parent,command = "holdup"
trigger4 = Parent,command = "holddown"
trigger5 = !(var(4):=1)
var(58) = var(4)

[State 9741, DirTurnOffAI]
type = ParentVarSet
triggerall = !var(3)
triggerall = Parent,var(58)
trigger1 = command = "holdfwd"
trigger1 = Parent,command = "holdfwd"
trigger2 = command = "holdback"
trigger2 = Parent,command = "holdback"
trigger3 = command = "holdup"
trigger3 = Parent,command = "holdup"
trigger4 = command = "holddown"
trigger4 = Parent,command = "holddown"
var(58) = var(4):=0

[State 9741, ButtonTurnOnAI]
type = ParentVarSet
triggerall = !var(2)
trigger1 = Parent,command = "a"
trigger2 = Parent,command = "b"
trigger3 = Parent,command = "c"
trigger4 = Parent,command = "x"
trigger5 = Parent,command = "y"
trigger6 = Parent,command = "z"
trigger7 = Parent,command = "start"
var(58) = 1

[State 9741, ButtonTurnOffAI]
type = ParentVarSet
triggerall = !var(2)
trigger1 = command = "a"
trigger1 = Parent,command = "a"
trigger2 = command = "b"
trigger2 = Parent,command = "b"
trigger3 = command = "c"
trigger3 = Parent,command = "c"
trigger4 = command = "x"
trigger4 = Parent,command = "x"
trigger5 = command = "y"
trigger5 = Parent,command = "y"
trigger6 = command = "z"
trigger6 = Parent,command = "z"
trigger7 = command = "start"
trigger7 = Parent,command = "start"
var(58) = -1

[State 9741, UnPauseCheck]
type = VarSet
triggerall = var(2)
trigger1 = Parent,command = "a"
trigger2 = Parent,command = "b"
trigger3 = Parent,command = "c"
trigger4 = Parent,command = "x"
trigger5 = Parent,command = "y"
trigger6 = Parent,command = "z"
trigger7 = Parent,command = "start"
trigger8 = var(2) = 2
trigger8 = var(2):=0
var(2) = 2

[State 9741, Goodbye]
type = DestroySelf
triggerall = var(1):=1
trigger1 = Parent,var(58)
trigger2 = !(Parent,Alive)
trigger3 = RoundState != 2

[StateDef 9742]
type = S
movetype = I
physics = N
anim = 9741
ctrl = 0

[State 9742, Safety]; Just in case your opponent is very poorly coded.
type = SelfState
trigger1 = !IsHelper
value = 5050

[State 9742, UglyHack]
type = VarSet
trigger1 = !var(1)
var(2) = var(3):=2

[State 9742, PauseCheck]
type = VarSet
trigger1 = GameTime > Parent,var(57)
trigger2 = !(Parent,Alive)
trigger3 = RoundState != 2
trigger4 = Parent,var(58)
trigger5 = var(1)
trigger5 = var(3):=0
var(2) = var(3):=1

[State 9742, Facing]
type = Turn
trigger1 = var(9):=(Facing != Parent,Facing)

[State 9742, ParentDirCheck]
type = VarSet
trigger1 = Parent,command = "holdfwd"
trigger2 = Parent,command = "holdback"
trigger3 = Parent,command = "holdup"
trigger4 = Parent,command = "holddown"
trigger5 = var(6):=0
var(6) = 1

[State 9742, BufferCheck]
type = VarSet
trigger1 = var(3) || var(4) || var(10)
var(10) = var(6)

[State 9742, ParentButtonCheck]
type = VarSet
trigger1 = Parent,command = "a"
trigger2 = Parent,command = "b"
trigger3 = Parent,command = "c"
trigger4 = Parent,command = "x"
trigger5 = Parent,command = "y"
trigger6 = Parent,command = "z"
trigger7 = Parent,command = "start"
trigger8 = var(7):=0
var(7) = 1

[State 9742, SameButtonCheck]
type = VarSet
triggerall = var(7)
triggerall = !var(2)
triggerall = NumPartner
trigger1 = Parent,command = "a"
trigger1 = Partner,command = "a"
trigger2 = Parent,command = "b"
trigger2 = Partner,command = "b"
trigger3 = Parent,command = "c"
trigger3 = Partner,command = "c"
trigger4 = Parent,command = "x"
trigger4 = Partner,command = "x"
trigger5 = Parent,command = "y"
trigger5 = Partner,command = "y"
trigger6 = Parent,command = "z"
trigger6 = Partner,command = "z"
trigger7 = Parent,command = "start"
trigger7 = Partner,command = "start"
trigger8 = var(8):=0
var(8) = 1

[State 9742, DirTurnOnAI]
type = ParentVarSet
trigger1 = var(6)
trigger1 = !(var(9) || var(10))
var(58) = 1

[State 9742, DirTurnOffAI]
type = ParentVarSet
triggerall = var(6)
triggerall = !var(3)
triggerall = Parent,var(58)
trigger1 = command = "holdfwd"
trigger1 = Parent,command = "holdfwd"
trigger2 = command = "holdback"
trigger2 = Parent,command = "holdback"
trigger3 = command = "holdup"
trigger3 = Parent,command = "holdup"
trigger4 = command = "holddown"
trigger4 = Parent,command = "holddown"
var(58) = 0

[State 9742, ButtonTurnOnAI]
type = ParentVarSet
trigger1 = var(5) && var(7)
trigger1 = !(var(2) || var(8))
var(58) = 1

[State 9742, ButtonTurnOffAI]
type = ParentVarSet
triggerall = var(7)
triggerall = !(var(2) || var(8))
trigger1 = command = "a"
trigger1 = Parent,command = "a"
trigger2 = command = "b"
trigger2 = Parent,command = "b"
trigger3 = command = "c"
trigger3 = Parent,command = "c"
trigger4 = command = "x"
trigger4 = Parent,command = "x"
trigger5 = command = "y"
trigger5 = Parent,command = "y"
trigger6 = command = "z"
trigger6 = Parent,command = "z"
trigger7 = command = "start"
trigger7 = Parent,command = "start"
var(58) = -1

[State 9742, UnPauseCheck]
type = VarSet
triggerall = var(2)
triggerall = !var(4)
trigger1 = var(7)
trigger2 = var(2) = 2
trigger2 = var(2):=0
var(2) = 2

[State 9742, Goodbye]
type = DestroySelf
trigger1 = Parent,var(58)
trigger2 = !(Parent,Alive)
trigger3 = RoundState != 2

[State 9742, HitPauseCheck]
type = VarSet
trigger1 = var(6) || var(7)
trigger2 = !(Parent,HitPauseTime)
var(4) = Parent,HitPauseTime

[State 9742, Delay]
type = VarSet
trigger1 = var(1):=1
var(5) = !var(7)


;------------------
; XOR Method's Helper State for Recent Custom State Check

[StateDef 9743]
type = S
movetype = I
physics = N
anim = 9741
ctrl = 0

[State 9743, Safety]; Just in case your opponent is very poorly coded.
type = SelfState
trigger1 = !IsHelper
value = 0

[State 9743, fiXOR]
type = VarAdd
trigger1 = !(Parent,HitPauseTime)
trigger1 = var(1) > 0
var(1) = -1

[State 9743, fuXOR]
type = VarSet
trigger1 = Parent,var(57) < GameTime
var(1) = 31
IgnoreHitPause = 1

[State 9743, Goodbye]
type = DestroySelf
trigger1 = Parent,var(58) = 1
trigger2 = !(Parent,Alive)
trigger3 = RoundState != 2

;-------------
; The Jukebox
;-------------
[Statedef 10000]
anim = 820

[State 800, ASS]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = NoShadow
flag3 = NoMusic

[State 800, NHB]
type = NotHitBy
trigger1 = 1
value = SCA

[State 800, PP]
type = PlayerPush
trigger1 = 1
value = 0

[State 800, PSND]
type = PlaySnd
trigger1 = time = 0
value = 10000,0
channel = 5
persistent = 0
loop = 1

[State 10000, SSND]
type = stopsnd
trigger1 = time = 602
channel = 5

[State 10000, CS]
type = changestate
trigger1 = time > 602
value = 10001

[State 10000, CS]
type = changestate
trigger1 = parent,alive = 0
value = 10002

;-----------------
[Statedef 10001]
anim = 820

[State 800, ASS]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = NoShadow
flag3 = NoMusic

[State 800, NHB]
type = NotHitBy
trigger1 = 1
value = SCA

[State 800, PP]
type = PlayerPush
trigger1 = 1
value = 0

[State 800, PSND]
type = PlaySnd
trigger1 = time = 0
value = 10000,1
channel = 5
loop = 1
persistent = 0

[State 10000, CS]
type = changestate
trigger1 = parent,alive = 0
value = 10002

; Stop Music
[Statedef 10002]
anim = 820

[State 10000, SSND]
type = stopsnd
trigger1 = 1
channel = 5

[State 800, ASS]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = NoShadow
flag3 = NoMusic

[State 800, NHB]
type = NotHitBy
trigger1 = 1
value = SCA

[State 800, PP]
type = PlayerPush
trigger1 = 1
value = 0

;---------------------------------
; Shield Helper
[Statedef 900]
anim = 900
velset = 0,0
sprpriority = 5

[State 900, Trans]
type = trans
trigger1 = 1
trans = add

[State 900, Scale]
type = angledraw
trigger1 = 1
scale = 0.8,0.8

[State 900, ASS]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 900, BTP]
type = bindtoparent
trigger1 = 1
pos = 0,-73

[State 900, PVS]
type = parentvarset
trigger1 = time = 0
trigger1 = parent,var(5) != 1
v = 5
value = 1

[State 900, NHB]
type = nothitby
trigger1 = parent,stateno != 200
trigger1 = parent,stateno != [800,810]
trigger1 = parent,stateno != 1500
value = SCA, AP, AT

[State 900, HB]
type = hitby
trigger1 = parent,stateno != 200
trigger1 = parent,stateno != [800,810]
trigger1 = parent,stateno != 1500
value = SCA, AA

[State 900, RD]
type = reversaldef
trigger1 = parent,stateno != 200
trigger1 = parent,stateno != [800,810]
trigger1 = parent,stateno != 1500;movecontact = 0
attr = A,NT
reversal.attr = SCA,AP
hitsound = s900,1
;p1stateno = 900
p2stateno = 910
sparkno = -1
ID = 900
NoChainID = 900
numhits = 0

[State 900, HOR]
type = hitoverride
trigger1 = parent,stateno != 200
trigger1 = parent,stateno != [800,810]
trigger1 = parent,stateno != 1500
attr = SCA, AA, AP, AT
stateno = 901
forceair = 1

[State 900, NHB]
type = nothitby
trigger1 = parent,stateno = 200
trigger2 = parent,stateno = [800,810]
trigger3 = parent,stateno = 1500
value = SCA, AA, AP, AT

[State 900, ASS]
type = assertspecial
trigger1 = parent,stateno = 200
trigger2 = parent,stateno = [800,810]
trigger3 = parent,stateno = 1500
flag = invisible

[State 900, Zeeky]
type = changestate
trigger1 = parent,var(6) <= 0
value = 902

[State 900, Zeeky]
type = destroyself
trigger1 = parent,alive = 0

;---------------------------------
; Shield Gethit
[Statedef 901]
movetype = H
velset = 0,0
sprpriority = 5

[State 900, Trans]
type = trans
trigger1 = 1
trans = add

[State 900, Scale]
type = angledraw
trigger1 = 1
scale = 0.8,0.8

[State 900, ASS]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 900, BTP]
type = bindtoparent
trigger1 = 1
pos = 0,-73

[State 900, NHB]
type = nothitby
trigger1 = 1
value = SCA, AP, AT

[State 900, HB]
type = hitby
trigger1 = 1
value = SCA, AA

[State 900, PVS]
type = parentvaradd
trigger1 = time = 0
v = 6
value = -gethitvar(damage)

[State 900, RD]
type = reversaldef
trigger1 = movecontact = 0
attr = A,HT
reversal.attr = SCA,AP
hitsound = s900,1
p1stateno = 900
p2stateno = 910
sparkno = -1

[State 900, HOR]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
stateno = 901
forceair = 1

[State 900, NHB]
type = nothitby
trigger1 = root,stateno = 200
value = SCA,AA,AP,AT

[State 900, CS]
type = changestate
trigger1 = time >= 15
trigger1 = parent,var(6) > 0
value = 900

[State 900, Zeeky]
type = changestate
trigger1 = parent,var(6) <= 0
value = 902

;---------------------------------
; Shield Destroy
[Statedef 902]
movetype = H
velset = 0,0
sprpriority = 5

[State 900, Trans]
type = trans
trigger1 = 1
trans = add

[State 900, Scale]
type = angledraw
trigger1 = 1
scale = 0.8,0.8

[State 900, ASS]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 900, BTP]
type = bindtoparent
trigger1 = 1
pos = 0,-73

[State 900, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT

[State 902, PSND]
type = playsnd
trigger1 = time = 0
value = 900,2

[State 902, PVS]
type = parentvarset
trigger1 = time >= 45
v = 5
value = 2

[State 902, PVS]
type = parentvarset
trigger1 = time >= 45
v = 7
value = 300

[State 902, Zeeky]
type = destroyself
trigger1 = time >= 45

;----------------------
; Deflected Projectile
;----------------------
[Statedef 910]
movetype = A
physics = N
ctrl = 0

[State 910, T]
type = turn
trigger1 = time = 0

[State 910, VelS]
type = velset
trigger1 = !time
x = -(vel x)
y = (vel y)

;[State 1010, HD]
;type = projectile
;trigger1 = time = 0
;projanim = anim
;velocity = vel x,vel y
;attr = A, HP
;affectteam = B;F
;animtype  = Hard
;damage    = 50,5
;priority  = 5
;hitflag = MAF
;guardflag = MA
;pausetime = 0,5
;sparkno = -1
;guard.sparkno = -1
;hitsound = -1;s1001,1
;guardsound = -1;6,0
;ground.type = High
;ground.slidetime = 12
;ground.hittime  = 15
;ground.velocity = -4,-3.5
;air.velocity = -4,-3
;fall = 1
;fall.recover = 0
;getpower = 0,0

;[State 195, Shield]
;type = helper
;trigger1 = time = 0
;helpertype = normal
;name = "hitbox"
;ID = 911
;pos = 0,0
;postype = p1
;stateno = 911
;ownpal = 1
;supermovetime = 999999
;pausemovetime = 999999

;[State 910, AD]
;type = angledraw
;trigger1 = !time
;trigger2 = 1
;scale = const(size.xscale),const(size.yscale)

[State 910, VelS]
type = velset
trigger1 = time
x = vel x
y = vel y

[State 910, HOR]
type = hitoverride
trigger1 = !time
attr = SCA,AA,AP,AT
slot = 7
stateno = -1
time = 999999

[State 910]
type = selfstate
trigger1= !ishelper
value = 50;00

[State 910]
type = selfstate
trigger1=time
trigger1=ishelper
value = prevstateno
ignorehitpause = 1

[State 910, Zeeky]
type = destroyself
trigger1 = frontedgedist < -20
trigger2 = pos y > 120
trigger3 = pos y < -300

;----------------------
; Deflected Projectile Attack Box
;----------------------
[Statedef 911]
movetype = A
physics = N
ctrl = 0

[State 911, CA]
type = changeanim
trigger1 = anim != parent,anim
value = parent,anim

[State 910, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 911, BTP]
type = bindtoparent
trigger1 = 1
pos = 0,0
facing = 1

[State 1010, HD]
type = hitdef
trigger1 = time = 0
attr = A, HP
affectteam = F
animtype  = Hard
damage    = 50,5
priority  = 5
hitflag = MAF
guardflag = MA
pausetime = 0,5
sparkno = -1
guard.sparkno = -1
hitsound = -1;s1001,1
guardsound = -1;6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -4,-3.5
air.velocity = -4,-3
fall = 1
fall.recover = 0
getpower = 0,0

[State 910, Zeeky]
type = destroyself
trigger1 = frontedgedist < -20
trigger2 = pos y > 120
trigger3 = pos y < -300
;trigger4 =

;---------------------------------
; Camera - Vertical
[Statedef 1010]
anim = 1010
velset = 0,0
sprpriority = 1

[State 1020, PosSet]
type = posset
trigger1 = 1
y = -240

[State 802, Explod]
type = Explod
trigger1 = numexplod(1020)=0
anim = 1020
ID = 1020
pos = 0,64
bindtime = -1
removetime = 12
sprpriority = 5
ownpal = 1
supermovetime = 999999
pausemovetime = 999999

[State 802, PSND]
type = playsnd
trigger1 = time = 0
value = 1000,1

[State 802, PSND]
type = playsnd
trigger1 = time >= 60
value = 1000,2
channel = 1
lowpriority = 1

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT

[State 1000, Laser]
type = helper
trigger1 = time = 60
helpertype = normal
name = "laser"
ID = 1011
pos = 0,64
stateno = 1011
ownpal = 1
supermovetime = 999999
pausemovetime = 999999

[State 1010, Zeeky]
type = destroyself
trigger1 = time >= 120

;---------------------------------
; Camera Laser - Vertical
[Statedef 1011]
movetype = A
anim = 1030
velset = 0,0
sprpriority = 1

[State 1021, BTP]
type = bindtoparent
trigger1 = 1
pos = 0,64

[State 2100, HOR]
type = hitoverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
slot = 6
ignorehitpause = 1

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT

[State 1011, AD]
type = angledraw
trigger1 = 1
scale = 1.0,3.0

[State 1011, ASS]
type = assertspecial
trigger1 = 1
flag = unguardable

[State 1010, HD]
type = hitdef
trigger1 = 1
attr = A, HP
animtype  = Hard
damage    = 50,50
priority  = 5
hitflag = MAF-
guardflag = M
pausetime = 0,5
sparkno = -1
guard.sparkno = -1
hitsound = s1001,1
guardsound = 6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -4,-3.5
air.velocity = -4,-3
fall = 1
fall.recover = 0
getpower = 10,5

[State 1010, Zeeky]
type = destroyself
trigger1 = time >= 60

;----------------------------------
; Camera - Horizontal (Normal Type)
[Statedef 1020]
anim = 1012
velset = 0,0
sprpriority = 1

[State 1020, PosSet]
type = posset
trigger1 = 1
x = -160

[State 1020, VS]
type = velset
trigger1 = 1
y = 1.5

[State 802, Explod]
type = Explod
trigger1 = numexplod(1020)=0
anim = 1020
ID = 1020
pos = 55,1
bindtime = -1
removetime = 12
sprpriority = 5
ownpal = 1
supermovetime = 999999
pausemovetime = 999999

[State 802, PSND]
type = playsnd
trigger1 = time = 0
value = 1000,1

[State 802, PSND]
type = playsnd
trigger1 = time >= 60
trigger1 = time <= 120
value = 1000,2
channel = 1
lowpriority = 1

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT

[State 1000, Laser]
type = helper
trigger1 = time = 60
helpertype = normal
name = "laser"
ID = 1011
pos = 55,1
stateno = 1021
ownpal = 1
supermovetime = 999999
pausemovetime = 999999

[State 1010, Zeeky]
type = destroyself
trigger1 = pos y > 75;time >= 120

;---------------------------------
; Camera Laser - Horizontal Normal
[Statedef 1021]
movetype = A
anim = 1031
velset = 0,0
sprpriority = 1

[State 2100, HOR]
type = hitoverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
slot = 6
ignorehitpause = 1

[State 1021, BTP]
type = bindtoparent
trigger1 = 1
pos = 55,1

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT

[State 1011, AD]
type = angledraw
trigger1 = 1
scale = 3.0,1.0

[State 1011, ASS]
type = assertspecial
trigger1 = 1
flag = unguardable

[State 1010, HD]
type = hitdef
trigger1 = 1
attr = A, HP
animtype  = Hard
damage    = 50,50
priority  = 5
hitflag = HAF-
guardflag = M
pausetime = 0,5
sparkno = -1
guard.sparkno = -1
hitsound = s1001,1
guardsound = 6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -4,-3.5
air.velocity = -4,-3
fall = 1
fall.recover = 0
getpower = 10,5

[State 1010, Zeeky]
type = destroyself
trigger1 = time >= 60

;---------------------------------
; Camera Laser - Horizontal Trick
[Statedef 1022]
movetype = A
anim = 1031
velset = 0,0
sprpriority = 1

[State 2100, HOR]
type = hitoverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
slot = 6
ignorehitpause = 1

[State 1021, BTP]
type = bindtoparent
trigger1 = 1
pos = 55,1

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT

[State 1011, AD]
type = angledraw
trigger1 = 1
scale = 3.0,1.0

[State 1011, ASS]
type = assertspecial
trigger1 = 1
flag = unguardable

[State 1010, HD]
type = hitdef
trigger1 = 1
attr = A, HP
animtype  = Hard
damage    = 50,50
priority  = 5
hitflag = MAF-
guardflag = M
pausetime = 0,5
sparkno = -1
guard.sparkno = -1
hitsound = s1001,1
guardsound = 6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -4,-3.5
air.velocity = -4,-3
fall = 1
fall.recover = 0
getpower = 10,5

[State 1010, Zeeky]
type = destroyself
trigger1 = time >= 60

;---------------------------------
; Camera - Horizontal (Trick Type)
[Statedef 1030]
anim = 1012
velset = 0,0
sprpriority = 1

[State 1020, PosSet]
type = posset
trigger1 = 1
x = 160

[State 1020, VS]
type = velset
trigger1 = 1
y = 1.5

[State 802, Explod]
type = Explod
trigger1 = numexplod(1020)=0
anim = 1020
ID = 1020
pos = 55,1
bindtime = -1
removetime = 12
sprpriority = 5
ownpal = 1
supermovetime = 999999
pausemovetime = 999999

[State 802, PSND]
type = playsnd
trigger1 = time = 0
value = 1000,1

[State 802, PSND]
type = playsnd
trigger1 = time >= 60
trigger1 = time <= 120
value = 1000,2
channel = 1
lowpriority = 1

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT

[State 1000, Laser]
type = helper
trigger1 = pos y >= (enemynear,pos y) - 30
trigger1 = numhelper(1011) = 0
helpertype = normal
name = "laser"
ID = 1011
pos = 55,1
stateno = 1022
ownpal = 1
supermovetime = 999999
pausemovetime = 999999

[State 1010, Zeeky]
type = destroyself
trigger1 = pos y > 75;time >= 120

;--------------------
; Sigma's Purple XBox 360 of Impending DOOM
[Statedef 2010]
sprpriority = 10
movetype = A
anim = 2000
ctrl = 0

[State 2011, Scale]
type = angledraw
trigger1 = 1
scale = 2.0,2.0

[State 3333, hitoverride]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AT, AP

[State 3333, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA, AA, AT, AP
time = 1

[State 3333, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 900, 2

[State 1011, ASS]
type = assertspecial
trigger1 = 1
flag = unguardable

[State 3333, HitDef]
type = HitDef
trigger1 = time = 0
attr = A, HP
damage = 50, 50
animtype = Heavy
guardflag = MA
hitflag = MAF-
priority = 5, Hit
pausetime = 0, 8
sparkno = -1
sparkxy = 0, 0
hitsound = S2000, 2
guardsound = S2000, 2
ground.type = High
ground.slidetime = 20
ground.hittime = 25
ground.velocity = -10
airguard.velocity = -5,-2
air.type = Low
air.velocity = -5,-2
air.hittime = 25
getpower = 0,0

[State 3333, Zeeky]
type = DestroySelf
trigger1 = Time >= 60
trigger2 = parent,stateno = 5000

;--------------------
; Sigma's Purple XBox 360 of Ludicrous SPEED!
[Statedef 2011]
sprpriority = 10
movetype = A
anim = 2000
ctrl = 0

[State 2011, Scale]
type = angledraw
trigger1 = 1
scale = 2.0,2.0

[State 3334, hitoverride]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AT, AP

[State 3334, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA, AA, AT, AP

[State 3334, PSND]
type = PlaySnd
trigger1 = time = 0
value = 900, 2

[State 1011, ASS]
type = assertspecial
trigger1 = 1
flag = unguardable

[State 3334, HitDef]
type = HitDef
trigger1 = time = 0
attr = A, HP
damage = 50, 50
animtype = Heavy
guardflag = MA
hitflag = MAF-
priority = 5, Hit
pausetime = 0, 8
sparkno = -1
sparkxy = 0, 0
hitsound = S2000, 2
guardsound = S2000, 2
ground.type = High
ground.slidetime = 20
ground.hittime = 30
ground.velocity = -10
airguard.velocity = -5,-2
air.type = Low
air.velocity = -5,-2
air.hittime = 30
getpower = 0,0

[State 2011, CS]
type = changestate
trigger1 = time >= 60
trigger1 = parent,stateno != 5000
value = 2012

[State 3334, Destroy]
type = DestroySelf
trigger1 = parent,stateno = 5000

;--------------------
; Sigma's Purple XBox 360 of Ludicrous SPEED!
[Statedef 2012]
;sprpriority = 10
movetype = A
anim = 2001
ctrl = 0

[State 2011, Scale]
type = angledraw
trigger1 = time > 0;1
scale = 2.0,2.0

[State 3334, hitoverride]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AT, AP

[State 3334, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA, AA, AT, AP

[State 1011, ASS]
type = assertspecial
trigger1 = 1
flag = unguardable

[State 3334, HitDef]
type = HitDef
trigger1 = EnemyNear, MoveType != H
attr = A, HP
damage = 50, 50
animtype = Heavy
guardflag = MA
hitflag = MAF-
priority = 5, Hit
pausetime = 0, 8
sparkno = -1
sparkxy = 0, 0
hitsound = S2000, 2
guardsound = S2000, 2
ground.type = High
ground.slidetime = 20
ground.hittime = 30
ground.velocity = -10
airguard.velocity = -5,-2
air.type = Low
air.velocity = -5,-2
air.hittime = 30
getpower = 0,0

;variable usage

;Var(0) holds the number of times you chased and reached an edge
;var(1) is "movement status":
;	0 => movement allowed
;	1 => currently moving
;	-1 => movement not allowed (hit an edge and has not yet waited for 60 ticks)
;var(2) holds the "time" and freezes whenever you hit an edge; used for waiting 60 ticks after reaching an edge

[state 3334, time]
type = varset
trigger1 = var(1) != -1; save "time" in var(2) until you reach an edge
var(2) = time

[state 3334, allow movement after break]
type = varset
triggerall = var(1) = -1; if you were moving and stopped
trigger1 = (time - var(2)) >= 60; wait 60 seconds
var(1) = 0; allows movement

[State 3334, Forward or backward]
type = Velset
triggerall = !vel x && !vel y; if not moving
triggerall = abs(P2BodyDist x) > 50; if p2 is not directly above/below.
trigger1 = !var(1); if movement is allowed
trigger1 = var(1) := 1; set "movement status" to "currently moving"
x = ifelse(P2BodyDist X > 0, 5, -5)

[State 3334, up or down]
type = Velset
triggerall = !vel x && !vel y; if not moving
triggerall = abs(P2BodyDist x) <= 50; if p2 is directly above/below you.
trigger1 = !var(1); if movement is allowed
trigger1 = var(1) := 1; set "movement status" to "currently moving"
y = ifelse(P2BodyDist Y > 0, 5, -5)

[State 3334, Stop Moving]
type = PlaySnd
triggerall = vel x || vel y; if moving in any direction
trigger1 = vel x > 0 && FrontEdgeBodyDist < 50; moving forward and at edge
trigger2 = vel x < 0 && BackEdgeBodyDist < 50; moving backward and at edge
trigger3 = vel y > 0 && Pos Y > 0; moving down and below ground
trigger4 = vel y < 0 && Pos Y <= -128; moving up and above "top" ... 220 pixels up is not actually "top"... this trigger might be changed to something better, dunno at the moment
value = 2000, 1

[State 3334, Stop Moving]
type = VelSet
triggerall = vel x || vel y; if moving in any direction
trigger1 = (vel x > 0 && FrontEdgeBodyDist < 50) || (vel x < 0 && BackEdgeBodyDist < 50) || (vel y > 0 && Pos Y > 0) || (vel y < 0 && Pos Y <= -128); same triggers as in the PlaySND sctrl, just condensed on one line
trigger1 = var(1) := -1; set "movement status" to "movement not allowed"
trigger1 = var(0) := var(0) + 1; count "chase times" 1 up
x = 0
y = 0

[State 3334, Destroy]
type = DestroySelf
trigger1 = Var(0) >= 5; die after having chased 5 times
trigger2 = parent,stateno = 5000

;---------------------------
; Saimyosho Spawner
[Statedef 1102]
type = A
movetype = A
physics = N
velSet = 0,0;-5
sprPriority = 0
anim = 1102

[State 1500, Random X]
type = VarRandom
trigger1 = 1
v = 7
range = 30,290

[State 1500, Random Y]
type = VarRandom
trigger1 = 1
v = 8
range = -200,-30

[State 1100, Insects]
type = Helper
trigger1 = time = 0
trigger2 = time = 60
trigger3 = time = 120
helpertype = normal
name = "Insect"
ID = 1101
pos = var(7),var(8)
postype = left
stateno = 1101
ownpal = 1
pausemovetime = 999999

[State 1100, Insects]
type = null;Helper
triggerall = parent,life <= 500
trigger1 = time = 1
trigger2 = time = 61
trigger3 = time = 121
helpertype = normal
name = "Insect"
ID = 1101
pos = var(7),var(8)
postype = left
stateno = 1101
ownpal = 1
pausemovetime = 999999

[State 1101, DestroySelf]
type = DestroySelf
trigger1 = time >= 122
trigger2 = parent,stateno = 5000

;---------------------------
; Recovery Beam
[Statedef 1401]
movetype = I
physics = N
velSet = 0,0
sprPriority = 3
anim = 1030

[State 1401, BTP]
type = bindtoparent
trigger1 = 1
pos = 0,-400
ignorehitpause = 1

[State 1401, AD]
type = angledraw
trigger1 = 1
scale = 15.0,10.0

[State 2100, HOR]
type = hitoverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
slot = 6
ignorehitpause = 1

[State 1103, PP]
type = playerpush
trigger1 = 1
value = 0

[State 1103, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT

[State 1401, PSND]
type = playsnd
trigger1 = time%4 = 0
value = 12000,0
channel = 5

[State 1401, Zeeky]
type = destroyself
trigger1 = time >= 180

;---------------------------
; Cyber Saimyosho
[Statedef 1101]
type = A
movetype = A
physics = N
velSet = 0,0
sprPriority = 3
anim = 1101

[State 1101, Turn]
type = turn
trigger1 = time < 40
trigger1 = p2dist x < 0

[State 802, Explod]
type = Explod
trigger1 = time = 0
anim = 1100
ID = 1100
pos = 0,0
bindtime = -1
removetime = 60
sprpriority = -2
ownpal = 1

[State 2100, HOR]
type = hitoverride
trigger1 = 1
attr = SCA,AA,AP
stateno = 1103
time = -1
slot = 6
ignorehitpause = 1

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 1010, NHB]
type = nothitby
trigger1 = time < 60
value = SCA,AA,AP,AT

[State 1010, NHB]
type = nothitby
trigger1 = time >= 60
value = SCA,AT

[State 1010, HB]
type = hitby
trigger1 = time >= 60
value = SCA,AA,AP

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
scale = (time)/60.0,1.0

[State 1101, ASS]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 1101, VS]
type = velset
trigger1 = time < 60
x = 0
y = 0

[State 1101, VS]
type = varset
trigger1 = time < 40
fv = 7
value = (enemynear(0),pos x - pos x)*facing

[State 1101, VS]
type = varset
trigger1 = time < 40
fv = 8
value = (enemynear(0),pos y + enemynear(0),const(size.mid.pos.y) - pos y)

[State 1101, VS]
type = varset
trigger1 = time < 40
fv = 9
value = ((fvar(7)**2)+(fvar(8)**2))**0.5

[State 1101, VS]
type = velset
trigger1 = root,life > 500
trigger1 = time >= 60
x = 3.5*(fvar(7)/fvar(9))
y = 3.5*(fvar(8)/fvar(9))

[State 1101, VS]
type = velset
trigger1 = root,life <= 500
trigger1 = time >= 60
x = 5.0*(fvar(7)/fvar(9))
y = 5.0*(fvar(8)/fvar(9))

[State 1101, PS]
type = playsnd
trigger1 = time = 0
value = 1100, 0
channel = 4

[State 1101, PS]
type = playsnd
trigger1 = time = 30
value = 1100, 1
channel = 4

[State 1101, HD]
type = Hitdef
trigger1 = time = 60
attr = A, SA
priority = 1,Miss
hitflag = MAF
animtype  = Hard
damage    = 40, 10
priority  = 5
guardflag = M
pausetime = 0,5
sparkxy = -10,0
hitsound   = -1
guardsound = -1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -4,-3.5
air.velocity = -4,-3
fall = 1
fall.recover = 0
getpower = 30,15
ID = 1101

[State 1101, PS]
type = stopsnd
trigger1 = time = 210
channel = 4

[State 1101, DestroySelf]
type = DestroySelf
trigger1 = time >= 240
trigger2 = parent,stateno = 5000

;---------------------------
; Cyber Saimyosho Hit
[Statedef 1103]
type = A
movetype = H
physics = N
sprPriority = 3
anim = 1103

[State 2100, HOR]
type = hitoverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
slot = 6
ignorehitpause = 1

[State 1103, PP]
type = playerpush
trigger1 = 1
value = 0

[State 1103, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT

[State 1103, ASS]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 1101, VS]
type = velset
trigger1 = time = 1
x = 2.0*gethitvar(xvel)*facing
y = 2.0*gethitvar(yvel)*facing

[State 1101, DestroySelf]
type = DestroySelf
trigger1 = time >= 120

;---------------------------
; Soul Body Projectile
[Statedef 1201]
type = A
movetype = A
physics = N
velSet = 0,0
sprPriority = 0
anim = 1201

[State 2100, HOR]
type = hitoverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
slot = 6
ignorehitpause = 1

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT

[State 3080, R.Skittles]
; Taste the Motherfuckin Rainbow :p
type = PalFX
trigger1 = ((gametime)%49)=0
time = 7
add = 256,256,256
mul = 512,0,0;256,256,0
color = 0
ignorehitpause = 1

[State 3080, O.Skittles]
; Taste the Motherfuckin Rainbow :p
type = PalFX
trigger1 = ((gametime-7)%49)=0
time = 7
add = 256,256,256
mul = 512,256,0
color = 0
ignorehitpause = 1

[State 3080, Y.Skittles]
; Taste the Motherfuckin Rainbow :p
type = PalFX
trigger1 = ((gametime-14)%49)=0
time = 7
add = 256,256,256
mul = 512,512,0
color = 0
ignorehitpause = 1

[State 3080, G.Skittles]
; Taste the Motherfuckin Rainbow :p
type = PalFX
trigger1 = ((gametime-21)%49)=0
time = 7
add = 256,256,256
mul = 0,512,0
color = 0
ignorehitpause = 1

[State 3080, B.Skittles]
; Taste the Motherfuckin Rainbow :p
type = PalFX
trigger1 = ((gametime-28)%49)=0
time = 7
add = 256,256,256
mul = 0,512,512
color = 0
ignorehitpause = 1

[State 3080, I.Skittles]
; Taste the Motherfuckin Rainbow :p
type = PalFX
trigger1 = ((gametime-35)%49)=0
time = 7
add = 256,256,256
mul = 0,0,512
color = 0
ignorehitpause = 1

[State 3080, V.Skittles]
; Taste the Motherfuckin Rainbow :p
type = PalFX
trigger1 = ((gametime-42)%49)=0
time = 7
add = 256,256,256
mul = 256,0,512
color = 0
ignorehitpause = 1

[State 1101, ASS]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 1201, VR]
type = varrandom
trigger1 = time = 0
v = 5
range = -100,100

[State 1201, VR]
type = varrandom
trigger1 = time = 0
v = 6
range = -100,100

[State 1101, VS]
type = varset
trigger1 = time = 0
fv = 7
value = (var(5) - pos x)*facing

[State 1101, VS]
type = varset
trigger1 = time = 0
fv = 8
value = (var(6) - pos y)

[State 1101, VS]
type = varset
trigger1 = time = 0
fv = 9
value = ((fvar(7)**2)+(fvar(8)**2))**0.5

[State 1101, VS]
type = velset
trigger1 = time > 0
x = 10.0*(fvar(7)/fvar(9))
y = 10.0*(fvar(8)/fvar(9))

[State 1101, HD]
type = Hitdef
trigger1 = time = 0
attr = A, HP
hitflag = MAF
animtype  = Hard
damage    = 30, 3
priority  = 5
guardflag = M
pausetime = 0,5
sparkxy = -10,0
sparkno = -1
hitsound   = -1
guardsound = -1
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -4,-3.5
air.velocity = -4,-3
fall = 1
fall.recover = 0
getpower = 30,15
ID = 1201

[State 1101, DestroySelf]
type = DestroySelf
trigger1 = time >= 120
trigger2 = parent,stateno = 500

;---------------------------------
; Second Form Hitbox
[Statedef 500]
ctrl = 1
anim = 10000
velset = 0,0
sprpriority = 5

[State -2, W]
type = width
trigger1 = 1
value = 32,32
ignorehitpause = 1

[State 500, LS]
type = lifeset
trigger1 = 1
value = 1000

[State 500, CA]
type = changeanim
trigger1 = anim != 10000
value = 10000

[State 500, BTP]
type = bindtoparent
trigger1 = 1

[State 500, ASS]
type = assertspecial
trigger1 = 1
flag = invisible

[State 500, NHB]
type = nothitby
trigger1 = root,var(21)=0
value = SCA, AT

[state 500, NHB]
type = nothitby
trigger1 = root,var(21)=1
value = SCA, AP, AT

[State 500, NHB]
type = hitby
trigger1 = root,var(21)=0
value = SCA, AA, AP

[State 500, NHB]
type = hitby
trigger1 = root,var(21)=1
value = SCA, AA

[State 500, HOR]
type = hitoverride
trigger1 = root,var(21)=0
attr = SCA, AA, AP
stateno = 501

[State 500, HOR]
type = hitoverride
trigger1 = root,var(21)=1
attr = SCA, AA
stateno = 501

[State 500, Zeeky]
type = destroyself
trigger1 = parent,alive = 0

;---------------------------------
; Hitbox Hit
[Statedef 501]
type = S
movetype = H
ctrl = 1
anim = 10000
velset = 0,0
sprpriority = 5

[State -2, W]
type = width
trigger1 = 1
value = 32,32
ignorehitpause = 1

[State 500, DMS]
type = defencemulset
trigger1 = 1
value = 1.33

[State 501, BTP]
type = bindtoparent
trigger1 = 1

[State 501, ASS]
type = assertspecial
trigger1 = 1
flag = invisible

[State 500, NHB]
type = nothitby
trigger1 = root,var(21)=0
value = SCA, AT

[state 500, NHB]
type = nothitby
trigger1 = root,var(21)=1
value = SCA, AP, AT

[State 500, NHB]
type = hitby
trigger1 = root,var(21)=0
value = SCA, AA, AP

[State 500, NHB]
type = hitby
trigger1 = root,var(21)=1
value = SCA, AA

[State 500, HOR]
type = hitoverride
trigger1 = root,var(21)=0
attr = SCA, AA, AP
stateno = 501

[State 500, HOR]
type = hitoverride
trigger1 = root,var(21)=1
attr = SCA, AA
stateno = 501

[State 501, CS]
type = changestate
trigger1 = hitover;time >= 75
value = 500

[State 500, Zeeky]
type = destroyself
trigger1 = parent,alive = 0

;---------------------------
; Rocket Coming Down - Alpha Type
[Statedef 11001]
movetype = A
anim = 11001

[State 11001, AD]
type = angledraw
trigger1 = 1
scale = 0.75,0.75

[State 4261, Vel]
type = velset
trigger1 = 1
y = 10

[State 4261, Changestate]
type = Changestate
trigger1 = pos Y >= 0
value = 11002

;---------------------------
; Rocket Coming Down - Beta Type
[Statedef 11051]
movetype = A
anim = 11051

[State 11001, AD]
type = angledraw
trigger1 = 1
scale = 0.75,0.75

[State 4261, Vel]
type = velset
trigger1 = 1
y = 6
x = 3

[State 11002, ASS]
type = assertspecial
trigger1 = 1
flag = unguardable

[State 11002, Explosion]
type = Hitdef
trigger1 = time = 0
attr = A, SP
animtype  = Hard
damage    = 30, 30
priority  = 1
hitflag = MAFD
guardflag = H
pausetime = 1,5
sparkxy = -10,0
hitsound   = -1
guardsound = -1
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -1,8
air.velocity = -2,8
fall = 1
fall.recover = 0
fall.yvelocity = 0

[State 11002, HOR]
type = hitoverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
slot = 6
stateno = 11002
ignorehitpause = 1

[State 4261, Changestate]
type = Changestate
trigger1 = pos Y >= 0
trigger2 = movecontact
value = 11002

;---------------------------
; Rocket Explosion
[Statedef 11002]
movetype = A
anim = 11002

[State 11002, ASS]
type = assertspecial
trigger1 = 1
flag = unguardable

[State 11002, T]
type = trans
trigger1 = 1
trans = add

[State 11001, AD]
type = angledraw
trigger1 = 1
scale = 0.5,0.5

[State 11002, PSND]
type = playsnd
trigger1 = time = 0
value = 11000,2

[State 11002, What the fuck?]
type = EnvShake
trigger1 = Time = 0
time = 5
freq = 100
ampl = -10

[State 11002, Vel]
type = velset
trigger1 = 1
x = 0
y = 0

[State 11002, Explosion]
type = Hitdef
trigger1 = time = 0
attr = A, SP
animtype  = Hard
damage    = 50, 10
priority  = 5
hitflag = MAFD
guardflag = MA
pausetime = 5,5
sparkxy = -10,0
hitsound   = -1
guardsound = -1
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -1,-8
air.velocity = -2,-8
fall = 1
fall.recover = 0

[State 11002, HOR]
type = hitoverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
slot = 6
ignorehitpause = 1

[State 11002, DestroySelf]
type = DestroySelf
trigger1 = time >= 11

;---------------------------
; Drain Target
[Statedef 12010]
type = A
movetype = A
physics = N
velSet = 0,0
sprPriority = 0
anim = 12000

[State 12010, ASS]
type = Assertspecial
trigger1 = 1
flag = noshadow
flag2 = unguardable

[State 2100, HOR]
type = hitoverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
slot = 6
ignorehitpause = 1

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT

[State 12010, VS]
type = varset
trigger1 = vel y != 0
trigger2 = time = 0
v = 1
value = ifelse(p2dist x > 0,5,-5)

[State 12010, VS]
type = velset
trigger1 = time = 0
x = var(1)
y = 0

[State 12010, VS]
type = velset
trigger1 = time > 0
trigger1 = vel y = 0
trigger1 = (p2dist y > 0)
trigger1 = (abs(p2dist x) < 10)
x = 0
y = 5

[State 800, HD]
type = hitdef
trigger1 = 1
attr = A, NT
hitflag = MAF
guardflag = L
priority = 7,Miss
sparkno = -1
hitsound = -1
p1facing = 1
p2facing = 1
p1stateno = 12011
p2stateno = 12020
ID = 12010

[state 12010, Zeeky]
type = destroyself
trigger1 = frontedgedist < -10
trigger2 = backedgedist < -10
trigger3 = pos y > 100

;---------------------------
; Draining
[Statedef 12011]
type = A
movetype = A
physics = N
velSet = 0,0
sprPriority = 3
anim = 12000

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 181,3
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = time%20 = 0
value = 12000,0

[State 12011, BTT]
type = bindtotarget
trigger1 = 1
ID = 12010
pos = 0,0,mid

[State 2100, HOR]
type = hitoverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
slot = 6
ignorehitpause = 1

[State 12011, TLA]
type = targetlifeadd
trigger1 = time%20 = 0
trigger1 = time > 0
value = -10
kill = 0
ID = 12010

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT

[state 12010, Zeeky]
type = destroyself
trigger1 = time > 180

;----------------------------------------------------------------------
[Statedef 12020]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 2

[State 5000, PFX]
type = palfx
trigger1 = time%20 = 0
trigger1 = time > 0
time = 3
mul = 256,0,0

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 822

[State 821, 3] ; Recover in mid air (use SelfState)
type = SelfState
trigger1 = Time > 180
value = 50;5210
ctrl = 1

;---------------------------
; Organic Drainpipe 1
[Statedef 12050]
sprPriority = 4
anim = 12001

[State 12050, AD]
type = angledraw
trigger1 = 1
scale = 2.0,2.0

[State 2100, HOR]
type = hitoverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
slot = 6
ignorehitpause = 1

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT

[State 1101, VS]
type = varset
trigger1 = time = 0
fv = 7
value = (helper(12000),pos x - pos x)*facing

[State 1101, VS]
type = varset
trigger1 = time = 0
fv = 8
value = (helper(12000),pos y - pos y)

[State 1101, VS]
type = velset
trigger1 = time <= 20
x = (fvar(7))/20.0
y = (fvar(8))/20.0

[State 1101, VS]
type = velset
trigger1 = time > 20
trigger1 = time < 180
x = 0
y = 0

[State 1101, VS]
type = velset
trigger1 = time >= 180
x = -(fvar(7))/20.0
y = -(fvar(8))/20.0

[State 12050, Zeeky]
type = destroyself
trigger1 = time >= 200

;---------------------------
; Organic Drainpipe 2
[Statedef 12051]
sprPriority = 4
anim = 12004

[State 12050, AD]
type = angledraw
trigger1 = 1
scale = 2.0,2.0

[State 2100, HOR]
type = hitoverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
slot = 6
ignorehitpause = 1

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT

[State 1101, VS]
type = varset
trigger1 = time = 0
fv = 7
value = (helper(12000),pos x - pos x)*facing

[State 1101, VS]
type = varset
trigger1 = time = 0
fv = 8
value = (helper(12000),pos y - pos y)

[State 1101, VS]
type = velset
trigger1 = time <= 20
x = 0.75*(fvar(7))/20.0
y = 0.75*(fvar(8))/20.0

[State 1101, VS]
type = velset
trigger1 = time > 20
trigger1 = time < 180
x = 0
y = 0

[State 1101, VS]
type = velset
trigger1 = time >= 180
x = -0.75*(fvar(7))/20.0
y = -0.75*(fvar(8))/20.0

[State 12050, Zeeky]
type = destroyself
trigger1 = time >= 200

;---------------------------
; Organic Drainpipe 3
[Statedef 12052]
sprPriority = 4
anim = 12003

[State 12050, AD]
type = angledraw
trigger1 = 1
scale = 2.0,2.0

[State 2100, HOR]
type = hitoverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
slot = 6
ignorehitpause = 1

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT

[State 1101, VS]
type = varset
trigger1 = time = 0
fv = 7
value = (helper(12000),pos x - pos x)*facing

[State 1101, VS]
type = varset
trigger1 = time = 0
fv = 8
value = (helper(12000),pos y - pos y)

[State 1101, VS]
type = velset
trigger1 = time <= 20
x = 0.5*(fvar(7))/20.0
y = 0.5*(fvar(8))/20.0

[State 1101, VS]
type = velset
trigger1 = time > 20
trigger1 = time < 180
x = 0
y = 0

[State 1101, VS]
type = velset
trigger1 = time >= 180
x = -0.5*(fvar(7))/20.0
y = -0.5*(fvar(8))/20.0

[State 12050, Zeeky]
type = destroyself
trigger1 = time >= 200

;---------------------------
; Organic Drainpipe 4
[Statedef 12053]
sprPriority = 4
anim = 12002

[State 12050, AD]
type = angledraw
trigger1 = 1
scale = 2.0,2.0

[State 2100, HOR]
type = hitoverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
slot = 6
ignorehitpause = 1

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT

[State 1101, VS]
type = varset
trigger1 = time = 0
fv = 7
value = (helper(12000),pos x - pos x)*facing

[State 1101, VS]
type = varset
trigger1 = time = 0
fv = 8
value = (helper(12000),pos y - pos y)

[State 1101, VS]
type = velset
trigger1 = time <= 20
x = 0.25*(fvar(7))/20.0
y = 0.25*(fvar(8))/20.0

[State 1101, VS]
type = velset
trigger1 = time > 20
trigger1 = time < 180
x = 0
y = 0

[State 1101, VS]
type = velset
trigger1 = time >= 180
x = -0.25*(fvar(7))/20.0
y = -0.25*(fvar(8))/20.0

[State 12050, Zeeky]
type = destroyself
trigger1 = time >= 200

;---------------------------
; IMA FIRIN MAH LAZOR!
[Statedef 13001]
movetype = A
velSet = 0,0
sprPriority = 1
anim = 13002

[State 13001, AD]
type = angledraw
trigger1 = 1
scale = 1.5,5.0

[State 13001, T]
type = trans
trigger1 = 1
trans = add1

[State -2, Explod]
type = Explod
trigger1 = time = 0
anim = 13000
ID = 13000
pos = 0,0
bindtime = -1
removetime = 630
sprpriority = -1

[State 15100, REX]
type = removeexplod
trigger1 = parent,alive = 0
trigger1 = numexplod(13000) > 0
ID = 13000

[State 12010, ASS]
type = Assertspecial
trigger1 = 1
flag = noshadow
;flag2 = unguardable

[State 13001, CA]
type = changeanim
triggerall = anim = 13002
trigger1 = time > 30
trigger1 = time <= 150
trigger2 = time > 270
trigger2 = time <= 390
trigger3 = time > 510
trigger3 = time <= 630
value = 13001

[State 5000, PSND]
type = playsnd
trigger1 = time > 30
trigger1 = time <= 150
trigger2 = time > 270
trigger2 = time <= 390
trigger3 = time > 510
trigger3 = time <= 630
value = 190,2
channel = 1
lowpriority = 1

[State 5000, PSND]
type = playsnd
trigger1 = time = 30
trigger2 = time = 270
trigger3 = time = 510
value = 13000,0

[State 13001, CA]
type = changeanim
triggerall = anim = 13001
trigger1 = time > 150
trigger1 = time <= 270
trigger2 = time > 390
trigger2 = time <= 510
value = 13002

[State 1100, Shake]
type = EnvShake
trigger1 = time = 31
trigger2 = time = 271
trigger3 = time = 511
time  = 120
ampl  = 20
freq  = 180

[State 2100, HOR]
type = hitoverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
slot = 6
ignorehitpause = 1

[State 3011, HD]
type = HitDef
trigger1 = 1
attr = A, HP
animtype  = Hard
damage    = 3, 2
priority  = 7, Hit
guardflag = M
pausetime = 0,2;10
sparkxy = 0,0
sparkno = -1
guard.sparkno = -1
hitsound   = -1
guardsound = -1
ground.type = High
ground.slidetime = 15
ground.hittime  = 18
ground.velocity = -1,14
guard.velocity = -1
air.velocity = -1.5,14
fall = 1
fall.recover = 0
fall.yvelocity = 0
getpower = 0,0

[State 3061, Explod]
type = Explod
trigger1 = movecontact = 1
pos = 0,-50
postype = p2
anim = F0
sprpriority = 6

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT

[State 12010, VS]
type = varset
trigger1 = parent,life >= 500
fv = 1
value = ifelse(p2dist x > 0,1.0,-1.0)

[State 12010, VS]
type = varset
trigger1 = parent,life < 500
fv = 1
value = ifelse(p2dist x > 0,1.25,-1.25)

[State 13001, VS]
type = velset
trigger1 = 1
x = fvar(1)
y = 0

[State 13001, Zeeky]
type = destroyself
trigger1 = time > 630
trigger2 = parent,alive = 0

;---------------------------
; IMA FIRIN MAH LAZOR!
[Statedef 14001]
movetype = I
velSet = 0,0
sprPriority = 3
anim = 1031;14000

[State 14001, BTP]
type = bindtoparent
trigger1 = 1
time = 1
pos = ifelse((root,var(59)=2),38,45),ifelse((root,var(59)=2),-100,-85);45,-85

[State 14001, ASS]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 14001, CA]
type = null;changeanim
trigger1 = time = 0
value = ifelse(teamside=1,1031,14001);14000,14001)

[State 14001, Laser Beam]
type = helper
trigger1 = time = 0
helpertype = normal
name = "Laser Endpoint"
ID = ifelse(ishelper(14001),14002,14012)
pos = 0,-floor(pos y)
stateno = 14002
ownpal = 1

[State 2100, HOR]
type = hitoverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
slot = 6
ignorehitpause = 1

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT

[State 14001, VS]
type = varset
trigger1 = numhelper(ifelse(ishelper(14001),14002,14012));1
fv = 7
value = (helper(ifelse(ishelper(14001),14002,14012)),pos x - pos x)*(facing)

[State 14001, VS]
type = varset
trigger1 = numhelper(ifelse(ishelper(14001),14002,14012));1
fv = 8
value = (helper(ifelse(ishelper(14001),14002,14012)),pos y - pos y)

[State 1640, Vector Length]
Type = VarSet
trigger1 = 1
fv = 9
value = Exp(0.5*ln((fvar(7) * fvar(7))+(fvar(8) * fvar(8))))

[State 14000, Projectile]
type = projectile
trigger1 = time%12 = 0
attr = A, SP
ProjID = 14001
projanim = 14002
projremovetime = 12
projsprpriority = 5
offset = 0,0
animtype  = hard
velocity = 0.5*fvar(7),0.5*fvar(8)
damage    = 30,0
priority  = 5
hitflag = MAF-
guardflag = M
pausetime = 0,3
sparkxy = -10,0
hitsound   = s2000,2
guardsound = 6,0
ground.type = high
ground.slidetime = 40
ground.hittime  = 40
ground.velocity = -3,-0.5
air.velocity = -3,-1
getpower = 35,0

[State 14001, AS]
type = angleset
trigger1 = 1
value = (270)+((asin(fvar(7)/fvar(9)))*(180/Pi))

[State 14001, AD]
type = angledraw
trigger1 = 1
scale = fvar(9),0.5
; angle in degrees

[State 14001, Zeeky]
type = destroyself
trigger1 = time >= 300
trigger2 = root,alive = 0
trigger3 = root,stateno = 5000

;---------------------------
; IMA FIRIN MAH LAZOR!
[Statedef 14002]
movetype = A
velSet = 0,0
sprPriority = 3
anim = 13002;1020

;[State 14002, VS]
;type = veladd;velset
;trigger1 = 1;time%30 = 0
;x = +((random/250.0)-1.5)

[State 14002, VS1]
type = velset
trigger1 = (time+(30*(1+ishelper(14002))))%(120*(1+ishelper(14002)))<=60*(1+ishelper(14002))
x = ifelse((root,life<500),4.0,3.0)*(1+ishelper(14012))+((random/250.0)-1.5)

;[State 14002, VS]
;type = velset
;trigger1 = (time >= 60) && (time < 120)
;x = 0

[State 14002, VS2]
type = velset
trigger1 = (time+(30*(1+ishelper(14002))))%(120*(1+ishelper(14002)))>60*(1+ishelper(14002))
x = ifelse((root,life<500),-4.0,-3.0)*(1+ishelper(14012))-((random/250.0)-1.5)


[State 14002, Zeeky]
type = destroyself
trigger1 = time >= 300
trigger2 = root,alive = 0
trigger3 = root,stateno = 5000

;---------------------------
; Super Portrait
[Statedef 9800]
movetype = I
velSet = 0,0
sprPriority = 1
anim = 1056

[State -2, Explod]
type = Explod
trigger1 = time = 0
anim = 9800
ID = 9800
pos = 0,72
postype = back
bindtime = -1
removetime = 60
sprpriority = 20
ontop = 1
ownpal = 1
supermovetime = 60
shadow = -1,-1,-1

[State -2, Explod]
type = Explod
trigger1 = time = 0
anim = 9800
ID = 9800
pos = 256,72
postype = back
bindtime = -1
removetime = 60
sprpriority = 20
ontop = 1
ownpal = 1
supermovetime = 60
shadow = -1,-1,-1

[State -2, Explod]
type = Explod
trigger1 = time = 0
anim = 9800
ID = 9800
pos = 512,72
postype = back
bindtime = -1
removetime = 60
sprpriority = 20
ontop = 1
ownpal = 1
supermovetime = 60
shadow = -1,-1,-1

[State -2, Explod]
type = Explod
trigger1 = time = 0
anim = 9801
ID = 9801
pos = 0,72
postype = back
bindtime = -1
removetime = 60
sprpriority = 21
ontop = 1
ownpal = 1
supermovetime = 60
shadow = -1,-1,-1

[State 9800, Zeeky]
type = destroyself
trigger1 = time >= 60

;---------------------------------
; Red Shield Helper
;---------------------------------
[Statedef 950]
anim = 950
velset = 0,0
sprpriority = 5

[State 900, Trans]
type = trans
trigger1 = 1
trans = add

[State 900, Scale]
type = angledraw
trigger1 = 1
scale = 0.8,0.8

[State 950, LS]
type = lifeset
trigger1 = 1
value = 1000

[State 900, ASS]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 900, BTP]
type = bindtoparent
trigger1 = 1
pos = 0,-73

[State 900, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AT

[State 900, HB]
type = hitby
trigger1 = 1
value = SCA, AP

[State 900, HOR]
type = hitoverride
trigger1 = 1
attr = SCA, AP
stateno = 951

[State 900, Zeeky]
type = changestate
trigger1 = parent,alive = 0
value = 952

;---------------------------------
; Red Shield Absorb
;---------------------------------
[Statedef 951]
movetype = H
velset = 0,0
sprpriority = 5

[State 950, PSND]
type = playsnd
trigger1 = time = 0
value = 12000,0

[State 900, Trans]
type = trans
trigger1 = 1
trans = add

[State 900, Scale]
type = angledraw
trigger1 = 1
scale = 0.8,0.8

[State 900, ASS]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 900, BTP]
type = bindtoparent
trigger1 = 1
pos = 0,-73

[State 900, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AT

[State 900, HB]
type = hitby
trigger1 = 1
value = SCA, AP

[State 900, HOR]
type = hitoverride
trigger1 = 1
attr = SCA, AP
stateno = 951
forceair = 1

[State 900, CS]
type = changestate
trigger1 = time >= 15
value = 950

[State 900, Zeeky]
type = changestate
trigger1 = parent,alive = 0
value = 952

;---------------------------------
; Red Shield Destroy
;---------------------------------
[Statedef 952]
movetype = H
velset = 0,0
sprpriority = 5

[State 900, Trans]
type = trans
trigger1 = 1
trans = add

[State 900, Scale]
type = angledraw
trigger1 = 1
scale = 0.8,0.8

[State 900, ASS]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 900, PP]
type = playerpush
trigger1 = 1
value = 0

[State 900, BTP]
type = bindtoparent
trigger1 = 1
pos = 0,-73

[State 900, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT

[State 902, PSND]
type = playsnd
trigger1 = time = 0
value = 900,2

[State 902, Zeeky]
type = destroyself
trigger1 = time >= 45
