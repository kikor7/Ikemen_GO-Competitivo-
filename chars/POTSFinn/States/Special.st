; _________________________________________
;| Character by JStudios2k/John Anonymous, Edited from Doug1105                |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SPECIAL MOVES>========================================
;==============================================================================================

;---------------------------------------------------------------------------
;High Five, Dude!
[Statedef 1000]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0*!var(20)
facep2=1

[state 1000,Posset]
type=posset
trigger1=!time
y=0

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1000, ifElse(var(10) = 1, 1010, 1020))

[State 1000, Inching]
type = PosAdd
trigger1 = animelem = 3
x = ifElse(var(10) = 0, 10, ifElse(var(10) = 1, 15, 20))

[State 1000, Cha cha real smooth]
type = VelSet
trigger1 = animelemtime(3)=0
x = const(velocity.run.fwd.x)-ifElse(var(10) = 0, 7, ifElse(var(10) = 1, 3.5, 0))
[State put on the brakes]
type = VelMul
trigger1 = animelemtime(4)>2
x = 0.8

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1,21
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = 1,22
channel = 1

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 4,5
channel = 3

[State 0, Width]
type = Width
trigger1 = animelemtime(4)>0 && animelemtime(8)<0
edge = 39,-10
ignorehitpause = 1

[State spy]
type= Helper
trigger1= AnimElem = 5
helpertype= Normal
stateno= 1004
ID= 1005
name= "slap my hand"
postype= p1
ownpal= 1

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 1000
attr = S,SA
hitflag =  MAF
guardflag = MA
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 112, ifElse(var(10), 105, 98)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 112, ifElse(var(10), 105, 98)))), 7
getpower = 60,30
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 14
air.hittime = 120
ground.velocity = ifelse(var(20), -3.61, -6.89), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -6.89)
guard.cornerpush.veloff = 0
air.velocity = -3, -4
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = S1,19
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=92), var(36):=-77
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time= 16
envshake.freq= 60
envshake.ampl= 4

[State 1000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX High Five
[Statedef 1050]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1050

[State 1050,Posset]
type=posset
trigger1=!time
y=0

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1050, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -31, -86
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1000, Inching]
type = PosAdd
trigger1 = animelem = 3
x = 20

[State 1000, Cha cha real smooth]
type = VelSet
trigger1 = animelemtime(3)=0
x = const(velocity.run.fwd.x)+3
[State put on the brakes]
type = VelMul
trigger1 = animelemtime(4)>2
x = 0.85

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1,21
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = 1,22
channel = 1

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2 && random<700
value = 5,2+random%2

[State 0, Width]
type = Width
trigger1 = animelemtime(4)>0 && animelemtime(8)<0
edge = 39,-10
ignorehitpause = 1

[State spy]
type= Helper
trigger1= AnimElem = 5
helpertype= Normal
stateno= 1004
ID= 1005
name= "slap my hand"
postype= p1
ownpal= 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(5)>0 && animelemtime(7)<0
value = SCA,NP,SP,HP
time = 1
ignorehitpause = 1

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20)) && !numtarget(1050)
trigger1= !Time
ID = 1050
attr = S,SA
hitflag =  MAF
guardflag = MA
damage = ceil(ifElse(fvar(11) * 102 < 7, 7, fvar(11) * 102)), 7
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -3.61, -6.89), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -6.89)
guard.cornerpush.veloff = 0
air.velocity = -3, -4
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = S1,20
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=92), var(36):=-77
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time= 16
envshake.freq= 60
envshake.ampl= 4

[State 220, TargetState]
type = TargetState
trigger1 = !var(16) && (var(15)<1)
trigger1 = MoveHit && NumTarget(1050)
trigger1 = !(target(1050),ishelper)
value = 1051
ID = 1050
ignoreHitPause = 1
persistent = 0

[State 1000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;OUCH!
[Statedef 1051]
type    = C
movetype= H
physics = N
ctrl = 0
sprpriority = 2

[State Hitoverride if hit by non-fall move]
type = HitOverride
trigger1 = stateno = 1051
attr = SCA,NA,SA,HA,NP,SP,HP
stateno = 5020
time = 1
forceair = 1

[State 0, Explod]
type = Explod
triggerall = life = 0
;triggerall = statetype != L
triggerall = (time%6)=0
trigger1 = anim = 1051
trigger2 = animtime <= -1
trigger3 = animelemtime(animelemno(0)) < time
trigger4 = floor(const(size.mid.pos.y) + ((time-31)/2) )<0
anim = F11
pos = const(size.mid.pos.x),floor(const(size.mid.pos.y) + ((time-31)/2) )
postype = p1
bindtime = 1
facing = ifelse(random<500,-1,1)
vfacing = ifelse(random<500,-1,1)
removetime = -2
supermovetime = 65535
pausemovetime = 65535
scale = 2,.5
sprpriority = -2
ownpal = 1
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = anim = 1051
trigger1 = animelem = 12
x = -6.777
[State 0, VelSet]
type = VelMul
trigger1 = anim = 1051
trigger1 = animelemtime(12) >= 0
x = 0.9

[State 0, VelSet]
type = VelSet
trigger1 = anim != 1051
x = 0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 1051
trigger1 = animelem = 22
trigger1 = selfanimexist(5950)
value = 5950
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 1051
trigger1 = animelem = 22
trigger1 = selfanimexist(5930)
value = 5930
[State 0, ChangeAnim]
type = SelfState
trigger1 = anim = 1051
trigger1 = animelem = 22
trigger1 = selfanimexist(5130)
trigger1 = selfanimexist(5131)
value = 5130
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 1051
trigger1 = animelem = 22
trigger1 = selfanimexist(6040)
value = 6040
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 5130
trigger1 = animtime = 0
value = 5131

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 1051

[State 0, VarSet]
type = VarSet
trigger1 = anim != 1051
sysvar(0) = 1

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 5950 || anim = 5330
trigger1 = animtime = 0 || animelemtime(animelemno(0)) >= 30
;trigger1 = selfanimexist(5950)
value = ifelse(selfanimexist(5112),5112,ifelse(selfanimexist(5111),5111,5110))

[State 0, SelfState]
type = SelfState
trigger1 = anim = 1051
trigger1 = animtime = 0
trigger2 = anim != 1051
trigger2 = time >= 149
trigger3 = anim = 6040
trigger3 = animtime = 0
value = ifelse(anim!=3325&&(!alive),5150,ifelse((anim=[5110,5119]),5120,5110))

;---------------------------------------------------------------------------
;Get Skronked!
[Statedef 1100]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0*!var(20)
facep2=1

[state 1000,Posset]
type=posset
trigger1=!time
y=0

[State 1000, Reset Timevar]
type = VarSet
trigger1= !time
var(11) = 0
ignorehitpause=1
[State 1000, Reset Hitvar]
type = VarSet
trigger1= !time
var(12) = 0
ignorehitpause=1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1100

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = !time && random<700
value = 5,5

[State 1100, Woosh dust]
type = Explod
triggerall = !numexplod(1102)
trigger1 = animtime=0
anim = 1102
ID = 1102
pos = ceil(10*const(size.xscale)),ceil(5*const(size.yscale))
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = .5 * const(size.xscale), .5 * const(size.yscale)
sprpriority = 5
ontop = 1
shadow = 0,0,0
removeongethit = 0
supermovetime = 0
trans=addalpha
alpha=256,256
ignorehitpause = 1
persistent = 0

[State 220, Voice]
type = PlaySnd
trigger1 = animelem = 3
value = 1100,0
channel = 7

[State 1100, PlaySnd]
type = PlaySnd
trigger1 = !animtime
value = S1,25

[State 1000, 7]
type = ChangeState
trigger1 = !AnimTime
value = 1101
ctrl = 0

;---------------------------------------------------------------------------
;The attack itself
[Statedef 1101]
type    = S
movetype= A
physics = N
juggle  = 4
poweradd= 0
velset = 5.5,0
anim = 1101
ctrl = 0
sprpriority = 2
hitdefpersist = 1

[state 1100, Stopwatch]
type = varadd
trigger1 = (gametime%2)
v = 12
value = 1
ignorehitpause = 0

[State 1100, Hitvar]
type = varadd
trigger1 = !time
var(11) = 1

[State HAHA SUPER ARMOR GO BRRR]
type = HitOverRide
trigger1 = 1
;time=-1
attr=SCA,NP,SP
stateno= 1101
ignorehitpause=1

[State 0, Width]
type = Width
trigger1 = 1
value = 30,0
ignorehitpause = 1
;persistent =

[State 0, VelSet]
type = VelSet
trigger1 = time=0
x = ifelse(var(10)=0,7,ifelse(var(10)=1,8.4,10.5))

[State 1100, Charging woosh]
type = Explod
triggerall = !numexplod(21100)
trigger1 = time=0
anim = 1103
ID = 21100
pos = ceil(170*const(size.xscale)),ceil(-75*const(size.yscale))
postype = p1
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
scale = .5 * const(size.xscale), .7 * const(size.yscale)
sprpriority = 5
ontop = 1
shadow = 0,0,0
removeongethit = 1
supermovetime = 99999
pausemovetime = 99999
trans=addalpha
alpha=256,256
ignorehitpause = 1
persistent = 0

[State 1100, Speed woosh]
type = Explod
triggerall = !numexplod(21101)
trigger1 = time=0
anim = 1104
ID = 21101
pos = ceil(60*const(size.xscale)),ceil(0*const(size.yscale))
postype = p1
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
scale = .5 * const(size.xscale), .7 * const(size.yscale)
sprpriority = 3
ontop = 1
shadow = 0,0,0
removeongethit = 1
supermovetime = 99999
pausemovetime = 99999
trans=addalpha
alpha=256,256
ignorehitpause = 1
persistent = 0

[State 1100, DustExplod]
type = Explod
triggerall = anim = 1101
trigger1 = animelemtime(1) >= 0 && !(time % 2)
anim = 8104
ID = 8104
pos = ceil(-25*const(size.xscale)),0
postype = p1
facing = 1
bindtime = 1
vel = -2,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1 * const(size.xscale), 1 * const(size.yscale)
sprpriority = 4
ontop = 1
shadow = 0,0,0
removeongethit = 1
supermovetime = 0
trans=addalpha
alpha=256,256
ignorehitpause = 1

[State 1100, PlaySnd]
type = PlaySnd
trigger1 = time=0 && prevstateno=1101
trigger1 = var(10)!=2
value = S1,25

[State 200, 1]
type = HitDef
triggerall = var(11)<=(ifelse(var(10)=2,2,1))
trigger1 = 1
attr = S, SA
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 48, ifElse(var(10), 90, 80)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 45, ifElse(var(10), 90, 80)))), 7
getpower = 60,30
animtype = Hard
guardflag = MA
hitflag = MAF
priority=4,Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8013);-1 * (var(10):=7010)**0
sparkxy = -10 + 0 * (var(35) := 155), var(36) := -73
hitsound =  -1 + 0*(var(31):=1001)
guard.sparkno = -1 + 0 * (var(34) := 8000)
guardsound = -1 + 0*(var(32):=0)
ground.type = High
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = -7,-4
air.velocity = -7,-3.5
air.hittime = 30
air.type = Low
airguard.velocity = -2,-.8
envshake.time=16
envshake.freq=60
envshake.ampl=4
fall = 1
fall.recover = 0
yaccel = .5

[State 1000, 7]
type = ChangeState
trigger1 = var(12)>=(ifelse(var(10)=0,7,ifelse(var(10)=1,9,10)))
value = 1105
ctrl = 0
ignorehitpause = 1

[State 1015, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(11) < ifelse(var(10)=2,2,1), 1101, 1105)

;---------------------------------------------------------------------------
; dude stop
[Statedef 1105]
type    = S
movetype= I
physics = S
juggle  = 4
poweradd= 0
;velset = 6,0
anim = 1105
ctrl = 0
sprpriority = 2

[State 0, RemoveExplod-Charging Star]
type = RemoveExplod
trigger1 = !time;animelemtime(1)=0
id = 21100
ignorehitpause = 1
persistent = 1
[State 0, RemoveExplod-Charging Star]
type = RemoveExplod
trigger1 = !time;animelemtime(1)=0
id = 21101
ignorehitpause = 1
persistent = 1

[State 0, ChangeAnim Light]
type = ChangeAnim
triggerall = var(10)=0
trigger1 = animelemtime(2)=10
value = 1105
elem = 3
ignorehitpause = 1

[State 0, ChangeAnim Medium]
type = ChangeAnim
triggerall = var(10)=1
trigger1 = animelemtime(2)=14
value = 1105
elem = 3
ignorehitpause = 1

[State 0, ChangeAnim Heavy]
type = ChangeAnim
triggerall = var(10)=2
trigger1 = animelemtime(2)=18
value = 1105
elem = 3
ignorehitpause = 1

[State 0, ChangeAnim EX]
type = ChangeAnim
triggerall = var(10)=3
trigger1 = animelemtime(2)=8
value = 1105
elem = 3
ignorehitpause = 1

[State 1000, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX Skronked
[Statedef 1150]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 5,4

[State 1000, Reset Timevar]
type = VarSet
trigger1= !time
var(11) = 0
ignorehitpause=1
[State 1000, Reset Hitvar]
type = VarSet
trigger1= !time
var(12) = 0
ignorehitpause=1

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1150

[State 1050,Posset]
type=posset
trigger1=!time
y=0

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1050, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -31, -86
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1050, woosh]
type = playsnd
trigger1 = !time
value = 101, 0

[State 1000, 7]
type = ChangeState
trigger1 = !AnimTime
value = 1151
ctrl = 0

;---------------------------------------------------------------------------
;The attack itself
[Statedef 1151]
type    = S
movetype= A
physics = N
juggle  = 4
poweradd= 0
velset = 5.5,0
anim = 1101
ctrl = 0
sprpriority = 2
hitdefpersist = 1

[state 1100, Stopwatch]
type = varadd
trigger1 = (gametime%2)
v = 12
value = 1
ignorehitpause = 0

[State 1100, Hitvar]
type = varadd
trigger1 = !time
var(11) = 1

[State HAHA SUPER ARMOR GO BRRR]
type = HitOverRide
trigger1 = 1
;time=-1
attr=SCA,NP,SP
stateno= 1151
ignorehitpause=1

[State 0, Width]
type = Width
trigger1 = 1
value = 30,0
ignorehitpause = 1
;persistent =

[State 0, VelSet]
type = VelSet
trigger1 = time=0
x = 11

[State 1100, Charging woosh]
type = Explod
triggerall = !numexplod(21100)
trigger1 = time=0
anim = 1103
ID = 21100
pos = ceil(170*const(size.xscale)),ceil(-75*const(size.yscale))
postype = p1
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
scale = .5 * const(size.xscale), .7 * const(size.yscale)
sprpriority = 5
ontop = 1
shadow = 0,0,0
removeongethit = 1
supermovetime = 99999
pausemovetime = 99999
trans=addalpha
alpha=256,256
ignorehitpause = 1
persistent = 0

[State 1100, Speed woosh]
type = Explod
triggerall = !numexplod(21101)
trigger1 = time=0
anim = 1104
ID = 21101
pos = ceil(60*const(size.xscale)),ceil(0*const(size.yscale))
postype = p1
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
scale = .5 * const(size.xscale), .7 * const(size.yscale)
sprpriority = 3
ontop = 1
shadow = 0,0,0
removeongethit = 1
supermovetime = 99999
pausemovetime = 99999
trans=addalpha
alpha=256,256
ignorehitpause = 1
persistent = 0

[State 1100, DustExplod]
type = Explod
triggerall = anim = 1101
trigger1 = animelemtime(1) >= 0 && !(time % 2)
anim = 8104
ID = 8104
pos = ceil(-25*const(size.xscale)),0
postype = p1
facing = 1
bindtime = 1
vel = -2,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1 * const(size.xscale), 1 * const(size.yscale)
sprpriority = 4
ontop = 1
shadow = 0,0,0
removeongethit = 1
supermovetime = 0
trans=addalpha
alpha=256,256
ignorehitpause = 1

[State 1100, PlaySnd]
type = PlaySnd
trigger1 = time=0 && prevstateno=1151
value = S1,25

[State 200, 1]
type = HitDef
triggerall = var(11)<=3
trigger1 = 1
attr = S, SA
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 5
animtype = Hard
guardflag = MA
hitflag = MAF
priority=4,Hit
pausetime = 4, 10
sparkno = -1 + 0 * (var(33) := 8013);-1 * (var(10):=7010)**0
sparkxy = -10 + 0 * (var(35) := 155), var(36) := -73
hitsound =  -1 + 0*(var(31):=1001)
guard.sparkno = -1 + 0 * (var(34) := 8000)
guardsound = -1 + 0*(var(32):=0)
ground.type = High
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = -7,-4
air.velocity = -7,-3.5
air.hittime = 30
air.type = Low
airguard.velocity = -2,-.8
envshake.time=16
envshake.freq=60
envshake.ampl=4
fall = 1
fall.recover = 0
yaccel = .5

[State 1000, 7]
type = ChangeState
trigger1 = var(12)>=13
value = 1105
ctrl = 0
ignorehitpause = 1

[State 1015, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(11) < 3, 1151, 1105)

;---------------------------------------------------------------------------
;Backpack Attack!
[Statedef 1200]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0*!var(20)
facep2=1

[state 1000,Posset]
type=posset
trigger1=!time
y=0

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1200, ifElse(var(10) = 1, 1210, 1220))

[State 1500, Woosh]
type = Explod
trigger1 = AnimElem = 3
anim = 1205
pos = 0, -80*const(size.yscale)
scale = 1.2,1
postype = p1
sprpriority = 4
bindtime = -1
ownpal = 1
removetime = 24
ignorehitpause = 0
removeongethit = 1
id = 1500

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = S1,26

[State 0, Width]
type = Width
trigger1 = animelemtime(3)>0 && animelemtime(13)<0
player = 10,10
ignorehitpause = 1
;persistent = 

[State 1500, 5]
type = HitDef
trigger1 = time = 8
trigger2 = time = 16
attr = S, SA
animtype  = Medium
damage    = ceil(ifelse(fvar(11)*30<7, 7, fvar(11)*30)),5
guardflag = M
pausetime = 2, 4
sparkxy = -10+ 0*(var(35):=30), var(36):=-69
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
hitsound =  -1 + 0*(var(31):=1002)
guardsound = -1 + 0*(var(32):=0)
ground.type = High
ground.slidetime = 18
ground.hittime  = 18
guard.hittime = 18
ground.velocity = 0,0
air.velocity = 0,0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 30,15
givepower = 5,5
envshake.time = 4
envshake.freq = 60
envshake.ampl = 6

[State 1500, 5]
type = HitDef
trigger1 = time = 24
attr = S, SA
animtype  = Medium
damage=ceil(ifelse(fvar(11)*ifelse(var(10)=2,50,ifelse(var(10)=1,40,30))<7, 7, fvar(11)*ifelse(var(10)=2,50,ifelse(var(10)=1,40,30)))),5
guardflag = M
pausetime = 2, 4
sparkxy = -10+ 0*(var(35):=30), var(36):=-69
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
hitsound =  -1 + 0*(var(31):=1002)
guardsound = -1 + 0*(var(32):=0)
ground.type = High
ground.slidetime = 10
ground.hittime  = 25
guard.hittime = 10
ground.velocity = -7,-4.5
air.velocity = -7,-4.5
fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 30,15
givepower = 5,5
envshake.time = 6
envshake.freq = 120
envshake.ampl = 6

[State 0, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(13)<0
value = SCA,NP,SP,HP
time = 1
ignorehitpause = 1
;persistent = 

[State Type Switch]
type = statetypeset
trigger1 = animelemtime(13) >= 0
movetype = I
persistent = 0
ignorehitpause = 1

[State 1500, 10]
type = ChangeState
trigger1 = Animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Soarin' Backpack Attack!
[Statedef 1210]
type=A
physics=S
movetype=A
ctrl=0
velset = Vel X / 2, Vel Y / 3
sprpriority=1
poweradd=0*!var(20)
facep2=1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1200, ifElse(var(10) = 1, 1210, 1220))

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = S1,26

[State 1500, Woosh]
type = Explod
trigger1 = AnimElem = 3
anim = 1205
pos = 0, -80*const(size.yscale)
scale = 1.2,1
postype = p1
sprpriority = 4
bindtime = -1
ownpal = 1
removetime = 24
ignorehitpause = 0
removeongethit = 1
id = 1500

[State 1500, 5]
type = HitDef
trigger1 = time = 8
trigger2 = time = 16
attr = S, SA
animtype  = Medium
damage    = ceil(ifelse(fvar(11)*30<7, 7, fvar(11)*30)),5
guardflag = M
pausetime = 2, 4
sparkxy = -10+ 0*(var(35):=30), var(36):=-69
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
hitsound =  -1 + 0*(var(31):=1002)
guardsound = -1 + 0*(var(32):=0)
ground.type = High
ground.slidetime = 18
ground.hittime  = 18
guard.hittime = 18
ground.velocity = 0,0
air.velocity = 0,0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 30,15
givepower = 5,5
envshake.time = 4
envshake.freq = 60
envshake.ampl = 6

[State 1500, 5]
type = HitDef
trigger1 = time = 24
attr = S, SA
animtype  = Medium
damage=ceil(ifelse(fvar(11)*ifelse(var(10)=2,50,ifelse(var(10)=1,40,30))<7, 7, fvar(11)*ifelse(var(10)=2,50,ifelse(var(10)=1,40,30)))),5
guardflag = M
pausetime = 2, 4
sparkxy = -10+ 0*(var(35):=30), var(36):=-69
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
hitsound =  -1 + 0*(var(31):=1002)
guardsound = -1 + 0*(var(32):=0)
ground.type = High
ground.slidetime = 10
ground.hittime  = 25
guard.hittime = 10
ground.velocity = -7,-4.5
air.velocity = -7,-4.5
fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 30,15
givepower = 5,5
envshake.time = 6
envshake.freq = 120
envshake.ampl = 6

[State Type Idle]
type = statetypeset
trigger1 = animelemtime(13) >= 0
movetype = I
persistent = 0
ignorehitpause = 1

[State 1071, 5]
type = ChangeState
trigger1 = !animtime
value = 243
ctrl = 0

[State 1071, 5]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 244
ctrl = 0

;---------------------------------------------------------------------------
;EX Backpack
[Statedef 1250]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1250

[State 1050,Posset]
type=posset
trigger1=!time
y=0

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1050, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -31, -86
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S1,26

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 4,3+random%3

[State Inching]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
x = 14

[State Inching]
type = PosAdd
trigger1 = AnimElem = 4
x = 25

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = 1
ignorehitpause = 1
;persistent = 

[State 1070, 4]
type = HitDef
trigger1= !numtarget(1070)
trigger1= !var(16) && (var(15)<9 || var(20))
trigger1 = !Time
attr = A, SA
animtype  = Medium
getpower  = 0
damage    = 55, 3
priority  = 5
hitflag   = MAFD
guardflag = M
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
sparkxy = -10+ 0*(var(35):=30), var(36):=-70
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
hitsound =  -1 + 0*(var(31):=3000)
guardsound = -1 + 0*(var(32):=0)
ground.type = Low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -2,-6
guard.velocity = -7
air.velocity = -2,-6
fall = 1
fall.animtype = Med
fall.recovertime = 30
givepower = 50,50
envshake.time=9
envshake.ampl=14
envshake.freq=255

[State YEET]
type = ChangeState
trigger1 = AnimTime = 0
value = 1251

;---------------------------------------------------------------------------
;YEET
[Statedef 1251]
type    = A
movetype= A
physics = N
velset = .5,-12
anim = 1251

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S1,26

[State 1500, 4]
type = Explod
trigger1 = AnimElem = 1
anim = 1206
pos = 0, 0
postype = p1
sprpriority = 3
bindtime = -1
ownpal = 1
removetime = 24
ignorehitpause = 0
scale = 1.1,.8
removeongethit = 1
id = 1071

[State 1040, Explod]
type = Explod
trigger1 = AnimElem = 1
anim = 1205
pos = 0, -80*const(size.yscale)
postype = p1
sprpriority = 4
bindtime = -1
ownpal = 1
removetime = 20
ignorehitpause = 0
id = 1071

[State 1251, Gravity]
type = VelAdd
trigger1 = 1
y = .5

[State 1251, 2]
type = VelAdd
trigger1 = Vel Y >= -1
y = .2

[State 1251, 3]
type = HitDef
trigger1 = Time = 0
trigger2 = Time = 8
trigger3 = Time = 16
attr = A, SA
animtype  = Medium
getpower  = 0
damage    = ceil(ifelse(fvar(11)*25<7, 7, fvar(11)*25)), 4
priority  = 5
guardflag = M
pausetime = 2,2;12,12
sparkxy = -10+ 0*(var(35):=30), var(36):=-69
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
hitsound =  -1 + 0*(var(31):=1002)
guardsound = -1 + 0*(var(32):=0)
ground.type = Low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -2,-7
guard.velocity = -7
air.velocity = -2,-7
fall = 1
fall.recovertime = 30
givepower = 50,50
envshake.time=6
envshake.ampl=4
envshake.freq=255

[State 1071, 3]
type = HitDef
trigger1 = Time = 24
attr = A, SA
animtype  = Medium
getpower  = 0
damage    = ceil(ifelse(fvar(11)*34<7, 7, fvar(11)*34)), 4
priority  = 5
guardflag = MA
pausetime = 10,10;12,12
sparkxy = -10+ 0*(var(35):=30), var(36):=-69
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
hitsound =  -1 + 0*(var(31):=1002)
guardsound = -1 + 0*(var(32):=0)
ground.type = Low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -10,-3.5
guard.velocity = -7
air.velocity = -10,-3.5
fall = 1
fall.recovertime = 30
givepower = 50,50
envshake.time=9
envshake.ampl=1
id = 1070
envshake.time=6
envshake.ampl=6
envshake.freq=255

[State 220, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1070)
trigger1 = !(target(1070),ishelper)
value = 225
ID = 1070 
ignoreHitPause = 1
persistent = 0

[State Wall WHAM]
type = PlaySnd
trigger1 = target,stateno = 227
trigger1 = target,time = 1
value = S1,18

[State 1071, 5]
type = ChangeState
trigger1 = !animtime
value = 52

[State 1071, 5]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 244

;---------------------------------------------------------------------------
;Aerial EX Backpack
[Statedef 1260]
type=A
physics=S
movetype=A
ctrl=0
velset=3,-12
sprpriority=1
poweradd=-500
facep2=1

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1251

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1050, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -31, -86
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S1,26

[State 1500, 4]
type = Explod
trigger1 = AnimElem = 1
anim = 1206
pos = 0, 0
postype = p1
sprpriority = 3
bindtime = -1
ownpal = 1
removetime = 24
ignorehitpause = 0
scale = 1.1,.8
removeongethit = 1
id = 1071

[State 1040, Explod]
type = Explod
trigger1 = AnimElem = 1
anim = 1205
pos = 0, -80*const(size.yscale)
postype = p1
sprpriority = 4
bindtime = -1
ownpal = 1
removetime = 20
ignorehitpause = 0
id = 1071

[State 1251, Gravity]
type = VelAdd
trigger1 = 1
y = .5

[State 1251, 2]
type = VelAdd
trigger1 = Vel Y >= -1
y = .2

[State 1251, 3]
type = HitDef
trigger1 = Time = 0
trigger2 = Time = 8
trigger3 = Time = 16
attr = A, SA
animtype  = Medium
getpower  = 0
damage    = ceil(ifelse(fvar(11)*25<7, 7, fvar(11)*25)), 4
priority  = 5
guardflag = M
pausetime = 2,2;12,12
sparkxy = -10+ 0*(var(35):=30), var(36):=-69
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
hitsound =  -1 + 0*(var(31):=1002)
guardsound = -1 + 0*(var(32):=0)
ground.type = Low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -2,-7
guard.velocity = -7
air.velocity = -2,-7
fall = 1
fall.recovertime = 30
givepower = 50,50
envshake.time=6
envshake.ampl=4
envshake.freq=255

[State 1071, 3]
type = HitDef
trigger1 = Time = 24
attr = A, SA
animtype  = Medium
getpower  = 0
damage    = ceil(ifelse(fvar(11)*34<7, 7, fvar(11)*34)), 4
priority  = 5
guardflag = MA
pausetime = 10,10;12,12
sparkxy = -10+ 0*(var(35):=30), var(36):=-69
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
hitsound =  -1 + 0*(var(31):=1002)
guardsound = -1 + 0*(var(32):=0)
ground.type = Low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -10,-3.5
guard.velocity = -7
air.velocity = -10,-3.5
fall = 1
fall.recovertime = 30
givepower = 50,50
envshake.time=9
envshake.ampl=1
id = 1070
envshake.time=6
envshake.ampl=6
envshake.freq=255

[State 220, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1070)
trigger1 = !(target(1070),ishelper)
value = 225
ID = 1070 
ignoreHitPause = 1
persistent = 0

[State Wall WHAM]
type = PlaySnd
trigger1 = target,stateno = 227
trigger1 = target,time = 1
value = S1,18

[State 1071, 5]
type = ChangeState
trigger1 = !animtime
value = 52
ctrl = 0

[State 1071, 5]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 244
ctrl = 0

;---------------------------------------------------------------------------
;Sweet Deals!
[Statedef 1300]
type=C
physics=S
movetype=I
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1000,Posset]
type=posset
trigger1=!time
y=0

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1300

[State SHOP]
type=helper
trigger1 = !numhelper(1310)
trigger1 = time = 0
name = "SHOPPING CART! :D"
id = 1310
stateno= 1310
size.xScale=0.5
size.yScale=0.5
facing=facing
ownpal=1

[State 1071, ohhh YEAH!!]
type = ChangeState
triggerall = animelemtime(3) > 0
trigger1 = numhelper(1310)
trigger1 = helper(1310),stateno=1311
value = 1301

[State 1071, damn]
type = ChangeState
triggerall = animelemtime(3) > 0
trigger1 = numhelper(1310)
trigger1 = (helper(1310),stateno=1315)
value = 1302

[State 1071, never mind...]
type = ChangeState
triggerall = animelemtime(3) > 0
trigger1 = !AILevel && command = "SHOP"
trigger2 = !numhelper(1310)
trigger3 = AILevel && NumEnemy
trigger3 = inguarddist && (p2bodydist x < 40 || random < (200 * (AILevel ** 2/64.0)))
value = 1303

;DEAL!
[StateDef 1301]
type = S
physics = S
moveType = I
velSet = 0,0
sprPriority = 0

[State 12, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1301

[State 0, VarAdd]
type = VarAdd
triggerAll = !time
trigger1 = fvar(1) < 3
trigger2 = fvar(2) < 3
trigger3 = fvar(3) < 1
fv = var(10)
value = 1
ignorehitpause = 1

[State 0, Balance deduction]
type = VarAdd
trigger1 = !time
trigger1 = var(10) = 1
var(27) = -100000
ignorehitpause = 1

[State 0, Balance deduction]
type = VarAdd
trigger1 = !time
trigger1 = var(10) = 2
var(27) = -200000
ignorehitpause = 1

[State 0, Balance deduction]
type = VarAdd
trigger1 = !time
trigger1 = var(10) = 3
var(27) = -300000
ignorehitpause = 1

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = !time && var(10)=1
value = 5,9+fvar(1)
[State 1000, PlaySnd]
type = PlaySnd
trigger1 = !time && var(10)=2
value = 5,19+fvar(2)
[State 1000, PlaySnd]
type = PlaySnd
trigger1 = !time && var(10)=3
value = 5,30+random%3

[State 1006, Text FX]
type = Helper
trigger1 = !time
helperType = Normal
stateNo = 1312
ID = 1319+var(10)
name = "Text FX"
posType = P1
pos = 0, -20
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 12, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;NOT ENOUGH CASH
[Statedef 1302]
type=C
physics=S
movetype=I
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[state 1000,Posset]
type=posset
trigger1=!time
y=0

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1302

[State SHOP]
type=helper
trigger1 = !numhelper(1310)
trigger1 = time = 0
name = "SHOPPING CART! :D"
id = 1310
stateno= 1310
size.xScale=0.5
size.yScale=0.5
facing=facing
ownpal=1

[State 1071, ohhh YEAH!!]
type = ChangeState
triggerall = animelemtime(4) > 0
trigger1 = numhelper(1310)
trigger1 = helper(1310),stateno=1311
value = 1301

[State 1071, damn]
type = ChangeState
triggerall = animelemtime(4) > 0
trigger1 = numhelper(1310)
trigger1 = (helper(1310),stateno=1315) && (helper(1310),time=0)
value = 1302

[State 1071, never mind...]
type = ChangeState
triggerall = animelemtime(4) > 0
trigger1 = !AILevel && command = "SHOP"
trigger2 = !numhelper(1310)
trigger3 = AILevel && NumEnemy
trigger3 = inguarddist && (p2bodydist x < 40 || random < (200 * (AILevel ** 2/64.0)))
value = 1303

;No deal.
[StateDef 1303]
type = S
physics = S
moveType = I
velSet = 0,0
sprPriority = 0

[State 12, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1303

[State 12, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;BMO Chop!
[Statedef 1320]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0*!var(20)
facep2=1

[state 1000,Posset]
type=posset
trigger1=!time
y=0

[State BMO]
type = VarSet
trigger1 = !time
trigger1 = fvar(3)
fvar(3) = 0
ignorehitpause = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && Anim !=1330
value = 1330

[State 1000, Inching]
type = PosAdd
trigger1 = animelemtime(3) = 0 || animelemtime(3) = 2 || animelemtime(3) = 4
x = ifElse(var(10) = 0, 8, ifElse(var(10) = 1, 12, 16))

[State 1000, Cha cha real smooth]
type = VelSet
trigger1 = animelemtime(3)=1
x = const(velocity.run.fwd.x)+ifElse(var(10) = 2, 7, ifElse(var(10) = 2, 3.5, 0))
[State put on the brakes]
type = VelMul
trigger1 = animelemtime(5)>0
x = 0.7

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelemtime(3) = 4
value = 5,ifelse(random<500, 4, 32)
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelemtime(3) = 4
value = 1,32
channel = 1

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1,34
[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) = [1,10]
time = 1
add = 256-(time-124)*16,256-(time-124)*16,256-(time-124)*16

[State NOPE]
type=ReversalDef
trigger1=animelemTime(2) >= 0 && animelemTime(4) < 0
reversal.attr= SCA, NA, SA
pauseTime=4,6
sparkNo=-1 + 0 * (var(33) := Ifelse(prevstateno=1320,0,8001))
sparkXY=-10 + 0 * (var(35) := 30), (var(36) := -60)
hitSound=S3,0
numHits=0
p1stateno=1320
ignorehitpause=1

[State BMO: KILL]
type=hitdef
trigger1= !var(16) && (var(15)<6 || var(20))
trigger1= animelem = 4
ID = 1330
attr = S,SA
hitflag =  MAF
guardflag = MA
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 112, ifElse(var(10), 105, 98)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 112, ifElse(var(10), 105, 98)))), 7
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 14-(var(10)*3)
air.hittime = 120
ground.velocity = -1.33,9.5
ground.cornerpush.veloff = 0
guard.velocity = -6
guard.cornerpush.veloff = 0
air.velocity = -1 ,-3
air.cornerPush.velOff = 0
yaccel = .58
fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=22)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=92), var(36):=-77
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time= 16
envshake.freq= 120
envshake.ampl= 4

[State SPIKED]
type = PlaySnd
trigger1 = MoveHit = 1 && NumTarget(1330)
value = S1,33
ignorehitpause = 0

[State 1000, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1330)
value = 1330
ID = 1330
ignoreHitPause = 1
persistent = 0

[State BLAM]
type = Explod
trigger1 = movehit = 1 
trigger1 = NumTarget(1330)
anim = 229
ID = 229
pos = 100, -77
postype = p1
removetime = -2
supermovetime = 65535
pausemovetime = 65535
scale = 1.5,1.5
sprpriority = 12
ontop = 1
ownpal = 1

[State 1000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;OUCH!
[Statedef 1330]
type = A
movetype = H
physics = N
velset = -1.5,8

[State 1390, Width]
type = Width
trigger1 = 1
edge = 25,-25
player = 25,0

[State 1390, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5030

[State 1390, Muteki]
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause = 1

[State 1390, Bounce]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0;pos y > -vel y
value = 1331

;this is getting BOUNCY
[Statedef 1331]
type = A
movetype = H
physics = N
velset = 0,0

[State 1391, On Ground]
type = PosSet
trigger1 = !Time
y = 0

[State 1391, Muteki]
type = NotHitBy
trigger1 = AnimElemTime(2)<0
value = SCA

;[State 1391, SFX]
;type = PlaySnd
;trigger1 = Time=1
;value = F7, (sysvar(1) > 5) + (sysvar(1) > 14)

[State 1391, EnvShake]
type = EnvShake
trigger1 = Time=1
time = 14
ampl = 5

[State 1391, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1331;5160

[State 1391, Velset]
type = VelSet
trigger1 = AnimElemTime(2)=0;Time=0
x = -0.8
y = -9.5

[State 1391, Gravity]
type = VelAdd
trigger1 = 1
y = 0.38
;------------------
[State 1391, AngleAdd];special thanks to Zzyzzyxx
type = AngleAdd
trigger1 = Time > 2
value = ifelse((facing != enemynear, facing), 22, -22)

[State 1391, AngleDraw]
type = AngleDraw
trigger1 = Time > 2

[State 1391, AngleSet]
type = AngleSet
trigger1 = (pos y-16)>-vel y;pos y > -vel y
value = 0
ignorehitpause = 1
;------------------
[State 1391, End]
type = SelfState
trigger1 = (pos y-16)>-vel y
value = 5100

;---------------------------------------------------------------------------
;Throwin' Stones!
[Statedef 1400]
type=A
physics=S
movetype=A
ctrl=0
velset = 0, -.1
sprpriority=1
poweradd=20*!var(20)
facep2=1

[State 0, VelAdd]
type = VelSet
trigger1 = !time
y = -.1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 0, ifElse(Random < 500, 1, 2))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1400, ifElse(var(10) = 1, 1410, 1420))

[State 1000, Yeetum Skeetum]
type = helper
trigger1 = animelemtime(3) = 0
helpertype = normal
stateno = 1405
ID =  ifelse(var(27) >= 30000, 1405, 1406)
name = "the spare change in my pocket"
postype = p1
pos = 5, -90
size.xscale = 0.6
size.yscale = 0.6
ownpal = 1

[State 0, Balance deduction]
type = VarAdd
trigger1 = animelemtime(3) = 1
trigger1 = var(27) >= 30000
var(27) = -30000
ignorehitpause = 1

[State 1100, Glide]
type = VelAdd
triggerall = Vel X >= -1
trigger1 = command = "holdback"
trigger2 = Vel X >= 1
x = -.2

[State 1100, Glide]
type = VelAdd
triggerall = Vel X <= 1
trigger1 = command = "holdfwd"
trigger2 = Vel X <= -1
x = .2

[State 1000, NOCTIS.exe]
type = ChangeState
trigger1 = numhelper(1405)
trigger1 = helper(1405),movecontact
value = 1410
ctrl = 0

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 50
ctrl = 0

;WARP STRIKE
[Statedef 1410]
type=A
physics=S
movetype=A
ctrl=0
velset = 0, -.1
sprpriority=1
anim=1430
facep2=1

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 2
x = 50

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
fvar(4) = 0.1
[State 0, VarSet]
type = VarAdd
trigger1 = animelemtime(4) >= 0
trigger1 = animelemtime(5) < 0
trigger1 = fvar(0) < 1
fvar(4) = 0.1
[State 0, AngleDraw]
type = AngleDraw
trigger1 = animelemtime(4) >= 0
trigger1 = animelemtime(5) < 0
trigger1 = fvar(4) < 1
value = 0
scale = 1/fvar(4),1
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 4
x = p2bodydist x - 80 + (enemynear,vel x)
y = p2bodydist y - 10
[State 0, PosAdd]
type = VelSet
trigger1 = animelemtime(4) >= 0
trigger1 = animelemtime(5) < 0
x = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S1,12
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S1,31

[State 1410, Hit]
type=hitdef
trigger1= !Time
forcenofall = !var(20)
attr = S,SA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*55<7, 7, fvar(11)*55)), 7
getpower = 10,5
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 14, 20)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -2.86, -4.52), -8.67
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -4.39, -8.67
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=10)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8016)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=120), var(36):=-50
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 6
envshake.freq = 120
envshake.ampl = 6

[State BLAM]
type = PlaySnd
trigger1 = movehit = 1
value = S2,45
ignorehitpause = 1
persistent = 0
[State BLAM]
type = PlaySnd
trigger1 = movehit = 1
value = S2,9
ignorehitpause = 1
persistent = 0

[State BLAM]
type = Explod
trigger1 = movehit = 1 
trigger1 = p2statetype = A
anim = 229
ID = 229
pos = 120, -50
postype = p1
removetime = -2
supermovetime = 65535
pausemovetime = 65535
scale = 1.5,1.5
sprpriority = 12
ontop = 1
ownpal = 1

[State 200, Type]
type=statetypeset
trigger1= animelemtime(6)>=0
movetype=I

[State 3000, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 0

;---------------------------------------------------------------------------
; Assist Me!
[Statedef 1500]
type    = S
movetype= A
physics = S
juggle  = 1
velset = 0,0
ctrl = 1
poweradd=0*!var(20)
sprpriority = 2

[state 1000,Posset]
type=posset
trigger1=!time
y=0

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx" || command = "y" || command = "rlsy" || command = "z" || command = "rlsz"), 0, 1)

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(Random < 500, 1, 0)

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1500

[State 0, CtrlSet]
type = CtrlSet
trigger1 = time = 2
value = 1
ignorehitpause = 1

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Ragedrive: Angry BMO Chop!
[Statedef 1600]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1050, Rage spent]
type = VarSet
trigger1 = !Time
trigger1 = var(41) = 1
var(41) = 2

[state 1000,Posset]
type=posset
trigger1=!time
y=0

[State BMO]
type = VarSet
trigger1 = !time
trigger1 = fvar(3)
fvar(3) = 0
ignorehitpause = 1

[State 1500, RageFX]
type = varset
trigger1 = !time
var(45) = 44

[State 1500, RageFX]
type = explod
trigger1 = !time
anim = 8211
sprpriority = 3
postype = p1
pos = 0, 0
scale = 0.6, 0.6
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1300, Ragesnd]
type=PlaySnd
trigger1 =!time
value=0,1002

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && Anim !=1330
value = 1330

[State 1000, Inching]
type = PosAdd
trigger1 = animelemtime(3) = 0 || animelemtime(3) = 2 || animelemtime(3) = 4
x = ifElse(var(10) = 0, 8, ifElse(var(10) = 1, 12, 16))

[State 1000, Cha cha real smooth]
type = VelSet
trigger1 = animelemtime(3)=1
x = const(velocity.run.fwd.x)+ifElse(var(10) = 2, 7, ifElse(var(10) = 2, 3.5, 0))
[State put on the brakes]
type = VelMul
trigger1 = animelemtime(5)>0
x = 0.7

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelemtime(3) = 4
value = 5,ifelse(random<500, 4, 2)
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelemtime(3) = 4
value = 1,32
channel = 1

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1,34
[State 0, PalFX]
type = PalFX
trigger1 = animelemtime(1) = [1,10]
time = 1
add = 256-(time-124)*16,256-(time-124)*16,256-(time-124)*16

[State NOPE]
type=ReversalDef
trigger1=animelemTime(2) >= 0 && animelemTime(4) < 0
reversal.attr= SCA, NA, SA
pauseTime=4,6
sparkNo=-1 + 0 * (var(33) := Ifelse(prevstateno=1320,0,8001))
sparkXY=-10 + 0 * (var(35) := 30), (var(36) := -60)
hitSound=S3,0
numHits=0
p1stateno=1320
ignorehitpause=1

[State BMO: KILL]
type=hitdef
trigger1= !var(16) && (var(15)<6 || var(20))
trigger1= animelem = 4
ID = 1330
attr = S,SA
hitflag =  MAF
guardflag = MA
damage = ceil(ifElse(fvar(11) * 133 < 7, 7, fvar(11) * 133)), 7
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 16
air.hittime = 120
ground.velocity = -1.33,-3.5
ground.cornerpush.veloff = 0
guard.velocity = -6
guard.cornerpush.veloff = 0
air.velocity = -1 ,-3
air.cornerPush.velOff = 0
yaccel = .58
fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=22)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=92), var(36):=-77
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time= 16
envshake.freq= 120
envshake.ampl= 4

[State SPIKED]
type = PlaySnd
trigger1 = MoveHit = 1 && NumTarget(1330)
value = S1,33
ignorehitpause = 0

[State 1000, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1330)
value = 1330
ID = 1330
ignoreHitPause = 1
persistent = 0

[State BLAM]
type = Explod
trigger1 = movehit = 1 
trigger1 = NumTarget(1330)
anim = 229
ID = 229
pos = 100, -77
postype = p1
removetime = -2
supermovetime = 65535
pausemovetime = 65535
scale = 1.5,1.5
sprpriority = 12
ontop = 1
ownpal = 1

[State 1000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1






;PUNCH ZERO COUNTER
[STATEDEF 2900]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0
faceP2 = 1

[STATE 2900,POSSET]
type=posset
trigger1=!time
y=0

[STATE 2900,ANIM]
type=changeanim
trigger1=!time
value=2900

[STATE 2900,DUST]
type = helper
trigger1 = Animelem=3
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[STATE 2900,WIDTH]
type = Width
trigger1 = 1
edge = 30,0

[STATE 2900,NOT HIT BY]
type = NotHitBy
trigger1 = Anim = 2900
trigger1 = AnimElemNo(0) = [1,5]
value = SCA
time = 1

[STATE 2900,HIT]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 2900
attr = S,SA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
getpower = 0
givepower = 0, 0
pausetime = ceil(13*(2-(var(20)>0))/2),ceil(13*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Heavy
air.animtype = Heavy
fall.animtype = Diagup
ground.type = hIGH
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 9 - var(10)
air.hittime = 120
ground.velocity = -3,-7.5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2,-7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = S-1 + 0*(var(33):=8016)
guard.sparkno = S-1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=92), var(36):=-77
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[STATE 2900,IDLE]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[STATE 2900,CHANGE STATE]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
 
;KICK ZERO COUNTER
[STATEDEF 2910]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0

[STATE 2910,POSSET]
type=posset
trigger1=!time
y=0

[STATE 2910,ANIM]
type=changeanim
trigger1=!time
value=2910

[STATE 2910,NOT HIT BY]
type = nothitby
trigger1 = animelemtime(6) < 0
value = SCA
time = 1
ignorehitpause = 1

[STATE 2910,WIDTH]
type = Width
trigger1 = 1
edge = 40,0

[STATE 2910,HIT]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
ID = 2910
attr = S, SA
hitFlag = MAF
guardFlag = M
damage =ceil(ifelse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
getPower = 0, 0
givePower = 0, 0
pausetime = ceil(13*(2-(var(20)>0))/2),ceil(13*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animType = Back
air.animType = Back
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6,-5.5
ground.cornerPush.velOff = 0
guard.velocity = -6
guard.cornerPush.velOff = 0
air.velocity = -6.46, -4.25
air.cornerPush.velOff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = S-1 + 0*(var(33):=8013)
guard.sparkno = S-1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=40), var(36):=-83
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[STATE 2910,IDLE]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
movetype = I

[STATE 2910,CHANGE STATE]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1