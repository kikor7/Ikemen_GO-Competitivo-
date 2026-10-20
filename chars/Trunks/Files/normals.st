;---------------------------------------------------------------------------
; Stand Light attack
[Statedef 200]
type = s
movetype = a
physics = s
ctrl = 0
anim = 200
poweradd = 0
sprpriority = 2
facep2 = 1

[state voice]
type = playsnd
trigger1 = !animelemtime(1)
trigger1 = random < 300
value = s0,200 + ((random%2)*10)
channel = 0

[state swing snd]
type = playsnd
trigger1 = !animelemtime(2)
value = s4,0

[State HitDef]
type = HitDef
;Estos triggers son para reactivar el hitdef asi se aplica el damage scaling
;colocando solamente animelem = 2 se activaria por 1 tick y el resto no tendria efecto
Triggerall=!movecontact
Triggerall=!movereversed
Trigger1=time>0
attr = s,na
hitflag = maf
guardflag = ma
animtype = light
damage = 23
pausetime = 10,10
sparkno = -1 + 0*(var(3) := 8010)
guard.sparkno = -1 + 0*(var(6) := 8000)
sparkxy = var(4):=80, var(5):=-82
hitsound = S5,0
guardsound = S6,0
ground.type = High
ground.slidetime = 10
ground.hittime = 10
air.hittime = 10
yaccel = .5
ground.velocity = -3
air.velocity = -2,-2
ground.cornerpush.veloff = 0
getpower = 30,15
givepower = 35,35

[state idle]
type = statetypeset
trigger1 = !animelemtime(3)
movetype = i

[State end]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Stand Medium attack
[Statedef 210]
type = s
movetype = a
physics = s
ctrl = 0
anim = 210
poweradd = 0
sprpriority = 2
facep2 = 1

[state voice]
type = playsnd
trigger1 = !animelemtime(2)
trigger1 = random < 400
value = s0,210 + ((random%2)*10)
channel = 0

[state swing snd]
type = playsnd
trigger1 = !animelemtime(2)
value = s4,1

[State HitDef]
type = HitDef
Triggerall=!movecontact
Triggerall=!movereversed
Trigger1=time>0
attr = s,na
hitflag = maf
guardflag = ma
animtype = medium
damage = 42
pausetime = 11,11
sparkno = -1 + 0*(var(3) := 8011)
guard.sparkno = -1 + 0*(var(6) := 8000)
sparkxy = var(4):=75, var(5):=-67
hitsound = S5,1
guardsound = S6,0
ground.type = High
ground.slidetime = 14
ground.hittime = 15
air.hittime = 20
yaccel = .5
ground.velocity = -5
air.velocity = -3,-2
ground.cornerpush.veloff = 0
getpower = 30,15
givepower = 35,35

[state idle]
type = statetypeset
trigger1 = !animelemtime(4)
movetype = i

[State end]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Stand strong attack
[Statedef 220]
type = s
movetype = a
physics = s
ctrl = 0
anim = 220
poweradd = 0
sprpriority = 2
facep2 = 1

[state voice]
type = playsnd
trigger1 = !animelemtime(2)
trigger1 = random < 650
value = s0,230 + ((random%2)*10)
channel = 0

[State posadd]
type = posadd
trigger1 = !animelemtime(4)
x = floor(20 * const(size.xscale))

[state swing snd]
type = playsnd
trigger1 = !animelemtime(4)
value = s4,2

[State HitDef]
type = HitDef
Triggerall=!movecontact
Triggerall=!movereversed
Trigger1=time>0
attr = s,na
hitflag = maf
guardflag = ma
animtype = hard
damage = 64
pausetime = 13,13
sparkno = -1 + 0*(var(3) := 8012)
guard.sparkno = -1 + 0*(var(6) := 8000)
sparkxy = var(4):=98, var(5):=-50
hitsound = S5,2
guardsound = S6,0
ground.type = low
ground.slidetime = 17
ground.hittime = 21
air.hittime = 20
yaccel = .5
ground.velocity = -10
air.velocity = -8,-2
ground.cornerpush.veloff = 0
getpower = 30,15
givepower = 35,35

[State continue anim on hit]
type = ChangeAnim
triggerall = AnimElemTime(4) <= 1
trigger1 = movecontact = 1
value = anim
elem = (animelemno(0))+1
ignorehitpause = 1

[state idle]
type = statetypeset
trigger1 = !animelemtime(5)
movetype = i

[state sheathe snd]
type = playsnd
trigger1 = !animelemtime(8)
value = s700,1

[State end]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Light attack
[Statedef 400]
type = c
movetype = a
physics = c
ctrl = 0
anim = 400
poweradd = 0
sprpriority = 2
facep2 = 1

[state voice]
type = playsnd
trigger1 = !animelemtime(1)
trigger1 = random < 300
value = s0,200 + ((random%2)*10)
channel = 0

[state swing snd]
type = playsnd
trigger1 = !animelemtime(2)
value = s4,0

[State HitDef]
type = HitDef
Triggerall=!movecontact
Triggerall=!movereversed
Trigger1=time>0
attr = c,na
hitflag = maf
guardflag = ma
animtype = light
damage = 23
pausetime = 10,10
sparkno = -1 + 0*(var(3) := 8010)
guard.sparkno = -1 + 0*(var(6) := 8000)
sparkxy = var(4):=80, var(5):=-64
hitsound = S5,0
guardsound = S6,0
ground.type = low
ground.slidetime = 10
ground.hittime = 11
air.hittime = 11
yaccel = .5
ground.velocity = -2.85
air.velocity = -2,-2
ground.cornerpush.veloff = 0
getpower = 30,15
givepower = 35,35

[state idle]
type = statetypeset
trigger1 = !animelemtime(3)
movetype = i

[State end]
type = ChangeState
trigger1 = !animtime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching medium attack
[Statedef 410]
type = c
movetype = a
physics = c
ctrl = 0
anim = 410
poweradd = 0
sprpriority = 2
facep2 = 1

[state voice]
type = playsnd
trigger1 = !animelemtime(1)
trigger1 = random < 350
value = s0,210 + ((random%2)*10)
channel = 0

[state swing snd]
type = playsnd
trigger1 = !animelemtime(2)
value = s4,1

[State HitDef]
type = HitDef
Triggerall=!movecontact
Triggerall=!movereversed
Trigger1=time>0
attr = c,na
hitflag = maf
guardflag = ma
animtype = medium
damage = 42
pausetime = 11,11
sparkno = -1 + 0*(var(3) := 8011)
guard.sparkno = -1 + 0*(var(6) := 8000)
sparkxy = var(4):=80, var(5):=-64
hitsound = S5,1
guardsound = S6,0
ground.type = low
ground.slidetime = 13
ground.hittime = 14
air.hittime = 11
yaccel = .5
ground.velocity = -4.55
air.velocity = -2,-2
ground.cornerpush.veloff = 0
getpower = 30,15
givepower = 35,35

[state idle]
type = statetypeset
trigger1 = !animelemtime(3)
movetype = i

[State end]
type = ChangeState
trigger1 = !animtime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching strong attack
[Statedef 420]
type = c
movetype = a
physics = c
ctrl = 0
anim = 420
poweradd = 0
sprpriority = 2
facep2 = 1

[state voice]
type = playsnd
trigger1 = !animelemtime(1)
trigger1 = random < 500
value = s0,230 + ((random%2)*10)
channel = 0

[state swing snd]
type = playsnd
trigger1 = !animelemtime(3)
value = s4,2

[State HitDef]
type = HitDef
Triggerall=!movecontact
Triggerall=!movereversed
Trigger1=time>0
attr = c,na
hitflag = mf
guardflag = L
animtype = hard
damage = 56
pausetime = 12,12
sparkno = -1 + 0*(var(3) := 8012)
guard.sparkno = -1 + 0*(var(6) := 8000)
sparkxy = var(4):=100, var(5):=-10
hitsound = S5,2
guardsound = S6,0
ground.type = trip
fall = 1
ground.slidetime = 14
ground.hittime = 15
air.hittime = 11
yaccel = .5
ground.velocity = -2,-2
air.velocity = -2,-2
ground.cornerpush.veloff = 0
getpower = 30,15
givepower = 35,35

[state idle]
type = statetypeset
trigger1 = !animelemtime(5)
movetype = i

[State continue anim on hit]
type = ChangeAnim
triggerall = AnimElemTime(4) <= 1
trigger1 = movecontact = 1
value = anim
elem = (animelemno(0))+1
ignorehitpause = 1

[state sheathe snd]
type = playsnd
trigger1 = !animelemtime(8)
value = s700,1

[State end]
type = ChangeState
trigger1 = !animtime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Jump Light attack
[Statedef 600]
type = a
movetype = a
physics = a
ctrl = 0
anim = 600
poweradd = 0
sprpriority = 2

[state voice]
type = playsnd
trigger1 = !animelemtime(1)
trigger1 = random < 300
value = s0,200 + ((random%2)*10)
channel = 0

[state swing snd]
type = playsnd
trigger1 = !animelemtime(2)
value = s4,0

[State HitDef]
type = HitDef
Triggerall=!movecontact
Triggerall=!movereversed
Trigger1=time>0
attr = a,na
hitflag = maf
guardflag = ha
animtype = light
damage = 23
pausetime = 10,10
sparkno = -1 + 0*(var(3) := 8010)
guard.sparkno = -1 + 0*(var(6) := 8000)
sparkxy = var(4):=70, var(5):=-95
hitsound = S5,0
guardsound = S6,0
ground.type = High
ground.slidetime = 10
ground.hittime = 11
air.hittime = 11
yaccel = .5
ground.velocity = -4
air.velocity = -2,-2
ground.cornerpush.veloff = 0
getpower = 30,15
givepower = 35,35

[state idle]
type = statetypeset
trigger1 = !animelemtime(4)
movetype = i

[State end]
type = ChangeState
trigger1 = !animtime
value = 50
ctrl = 1

;---------------------------------------------------------------------------
; Jump medium attack
[Statedef 610]
type = a
movetype = a
physics = a
ctrl = 0
anim = 610
poweradd = 0
sprpriority = 2

[state voice]
type = playsnd
trigger1 = !animelemtime(2)
trigger1 = random < 350
value = s0,210 + ((random%2)*10)
channel = 0

[state swing snd]
type = playsnd
trigger1 = !animelemtime(1)
value = s4,1

[State HitDef]
type = HitDef
Triggerall=!movecontact
Triggerall=!movereversed
Trigger1=time>0
attr = a,na
hitflag = maf
guardflag = ha
animtype = medium
damage = 42
pausetime = 10,10
sparkno = -1 + 0*(var(3) := 8011)
guard.sparkno = -1 + 0*(var(6) := 8000)
sparkxy = var(4):=65, var(5):=-70
hitsound = S5,1
guardsound = S6,0
ground.type = High
ground.slidetime = 14
ground.hittime = 15
air.hittime = 11
yaccel = .5
ground.velocity = -4
air.velocity = -2,-2
ground.cornerpush.veloff = 0
getpower = 30,15
givepower = 35,35

[state idle]
type = statetypeset
trigger1 = !animelemtime(5)
movetype = i

[State end]
type = ChangeState
trigger1 = !animtime
value = 50
ctrl = 1

;---------------------------------------------------------------------------
; Jump strong attack
[Statedef 620]
type = a
movetype = a
physics = a
ctrl = 0
anim = 620
poweradd = 0
sprpriority = 2

[state voice]
type = playsnd
trigger1 = !animelemtime(2)
trigger1 = random < 500
value = s0,230 + ((random%2)*10)
channel = 0

[state swing snd]
type = playsnd
trigger1 = !animelemtime(3)
value = s4,2

[State HitDef]
type = HitDef
Triggerall=!movecontact
Triggerall=!movereversed
Trigger1=time>0
attr = a,na
hitflag = maf
guardflag = ha
animtype = hard
damage = 56
pausetime = 10,10
sparkno = -1 + 0*(var(3) := 8012)
guard.sparkno = -1 + 0*(var(6) := 8000)
sparkxy = var(4):=96, var(5):=-40
hitsound = S5,2
guardsound = S6,0
ground.type = High
ground.slidetime = 17
ground.hittime = 18
air.hittime = 11
yaccel = .5
ground.velocity = -4
air.velocity = -2,-2
ground.cornerpush.veloff = 0
getpower = 30,15
givepower = 35,35

[state idle]
type = statetypeset
trigger1 = !animelemtime(5)
movetype = i

[State continue anim on hit]
type = ChangeAnim
triggerall = AnimElemTime(4) <= 1
trigger1 = movecontact = 1
value = anim
elem = (animelemno(0))+1
ignorehitpause = 1

[state sheathe snd]
type = playsnd
trigger1 = !animtime
value = s700,1

[State end]
type = ChangeState
trigger1 = !animtime
value = 50
ctrl = 0

;---------------------------------------------------------------------------
; Throw attempt
[statedef 800]
type = s
movetype = a
physics = s
ctrl = 0
velset = 0,0
anim = 800

[state no guard]
type = attackdist
trigger1 = 1
value = 0

[State HitDef]
type = HitDef
getpower = 60,30
trigger1 = !time
attr = s,nt
hitflag = m-
priority = 1, miss
sparkno = -1
hitsound = S800,0
numhits = 0
fall = 1
fall.recover = 0
p1stateno = 801
p1facing = ifelse(command = "holdback", -1, 1)
p2facing = 1

[state voice]
type = playsnd
trigger1 = !animelemtime(2)
value = s0,800
channel = 0

[state idle]
type = statetypeset
trigger1 = animelemtime(2) >= 0
movetype = i

[state changestate]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Throw success
[statedef 801]
type = s
movetype = a
physics = n

[state targetdrop]
type = targetdrop
triggerall = !time && numtarget
trigger1 = target, ishelper
trigger2 = numtarget > 1
keepone = 1

[state safe]
type = changestate
trigger1 = !time && !numtarget
value = 0
ctrl = 1

[state tech hit]
type = changestate
trigger1 = numtarget
trigger1 = target, command = "holdfwd" || target, command = "holdback"
trigger1 = target, command = "x" || target, command = "y" || target, command = "z"
trigger1 = time < 8
value = 850

;start

[State TargetBind]
type = TargetBind
trigger1 = numtarget
trigger1 = animelemtime(5) <= 0
pos = floor(55*const(size.xscale)),0

[state targetstate]
type = targetstate
trigger1 = !time && numtarget
value = 810

[state changeanim]
type = changeanim
trigger1 = !time
value = 801

[state targetfacing]
type = targetfacing
trigger1 = !time && numtarget
value = -1

[State Width]
type = Width
trigger1 = !time && numtarget
edge = floor(60*const(size.xscale)),0

;hit

[state targetstate]
type = targetstate
trigger1 = !animelemtime(4)
value = 811

[State Hit Spark]
type = Helper
trigger1 = !animelemtime(4)
stateno = 8012
ID = 8000
name = "Spark"
postype = P1
pos = floor(42*const(size.xscale)), floor(-72*const(size.xscale))
facing = -1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State EnvShake]
type = EnvShake
trigger1 = !animelemtime(4)
time = 12
freq = 120
ampl = -4

[State HitAdd]
type = HitAdd
trigger1 = !animelemtime(4)
value = 1

[state sound]
type = playsnd
trigger1 = !animelemtime(4)
value = s1000,1

[State TargetLifeAdd]
type = TargetLifeAdd
trigger1 = numtarget
trigger1 = !animelemtime(4)
value = -80
kill = 1

[State TargetPowerAdd]
type = TargetPowerAdd
trigger1 = numtarget
trigger1 = !animelemtime(4)
value = 35

[State PowerAdd]
type = PowerAdd
trigger1 = !animelemtime(4)
value = 0


;to ground

[state targetstate]
type = targetstate
trigger1 = !animelemtime(5)
value = 812

[state ground snd]
type = playsnd
trigger1 = numtarget
trigger1 = target, stateno = 812
value = s40,2
persistent = 0

[State dust]
type = Explod
trigger1 = numtarget
trigger1 = target, stateno = 812
trigger1 = !(time%6)
anim = 7100
id = 7100
pos = floor((target,pos x + (target,const(size.ground.back)*facing) - pos x)*facing), 0
postype = p1
bindtime = 1
sprpriority = 3
scale = .4*const(size.xscale), .25*const(size.yscale)
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[state dust]
type = explod
trigger1 = numtarget
trigger1 = target, stateno = 813
anim = 8102
id = 8102
postype = p1
pos = floor((target,pos x + (target,const(size.ground.back)*facing) - pos x)*facing), 0
sprpriority = -5
ownpal = 1
scale = .75*const(size.xscale), .75*const(size.yscale)
bindtime = 1
supermovetime = 9999
pausemovetime = 9999
persistent = 0

[state changestate]
type = changestate
trigger1 = anim = 801
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Throw target
[statedef 810]
type = a
movetype = h
physics = n
sprpriority = -1
velset = 0,0

[state changeanim2]
type = changeanim2
trigger1 = !time
value = 810

[state safe]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

;---------------------------------------------------------------------------
; Throw target gethit
[statedef 811]
type = a
movetype = h
physics = n

[state changeanim2]
type = changeAnim2
trigger1 = !time
value = 811

[State PosAdd]
type = PosAdd
trigger1 = 1
x = ceil((14 - Time) / 4) * ifElse(Time % 2 = 1, -1, 1)

[state safe]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

;---------------------------------------------------------------------------
; Throw target grounded
[statedef 812]
type = a
movetype = h
physics = n

[state changeanim2]
type = changeAnim2
trigger1 = !time
value = 812

[state velset]
type = velset
trigger1 = !time
x = -10
y = 0

[state friction]
type = velAdd
trigger1 = vel x < 0
x = .5

[state stop vel]
type = velset
trigger1 = vel x != 0
trigger1 = vel x = [-.5,.5]
x = 0

[state to liedown]
type = changestate
trigger1 = vel x = 0
value = 813

;---------------------------------------------------------------------------
; Throw target lie down
[statedef 813]
type = a
movetype = h
physics = n
velset = 0,0

[state nothitby]
type = nothitby
trigger1 = 1
value = sca

[state changeanim]
type = changeanim
trigger1 = !time
trigger1 = selfanimexist(5110)
value = 5110

[state posset]
type = posset
trigger1 = !time
y = 0

[state end]
type = selfstate
trigger1 = time = 25
value = ifelse(alive, 5120, 5150)

;---------------------------------------------------------------------------
; Throw escape
; From KFM by DivineWolf
[statedef 850]
type = S
physics = N
movetype = I
anim = 5945
ctrl = 0
velset = 0,0
sprPriority = 1

[State TargetBind]
type = TargetBind
trigger1 = !Time && NumTarget
pos = 0,0

[State TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 855

[State TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State PosAdd]
type = PosAdd
trigger1 = !Time
x = 24

[state sound]
type = playsnd
trigger1 = !time
value = s800,1

[State FX]
type = Helper
trigger1 = !Time
stateNo = 8200
ID = 8200
name = "Recover FX"
posType = P1
pos = 0, const(size.mid.pos.y)
ownpal = 1

[State NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State SprPriority 1]
type = SprPriority
trigger1 = AnimElemTime(6) >= 0
value = 1

[State SprPriority -1]
type = SprPriority
trigger1 = AnimElemTime(2) <= 0
value = -1

[State PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 890, VelSet]
type = VelSet
trigger1 = 1
x = -1.425
y = 0

[State 890, End]
type = ChangeState
trigger1 = Time >= 27
value = 0
ctrl = 1

;Throw escape target
[StateDef 855]
type = S
physics = N
moveType = I
ctrl = 0
velSet = 0,0
sprPriority = 1

[State ChangeAnim]
type = ChangeAnim
trigger1= !Time
value = ifElse(SelfAnimExist(5940), 5940, 130)

[State ChangeAnim]
type = ChangeAnim
trigger1 = !Time && !SelfAnimExist(5945) && SelfAnimExist(5940)
value = 5940

[State ChangeAnim]
type = ChangeAnim
trigger1= !Time && !SelfAnimExist(5945) && !SelfAnimExist(5940) && SelfAnimExist(5910)
value = 5910

[State ChangeAnim]
type = ChangeAnim
trigger1 = Time >= 20 && Anim = 130
value = 140

[State NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State VelSet]
type = VelSet
trigger1 = 1
x = -1.425
y = 0

[State End]
type = SelfState
trigger1 = Time >= 27
value = 0
ctrl = 1
