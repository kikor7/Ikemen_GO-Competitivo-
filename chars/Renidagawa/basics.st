;---------------------------------------------------------------------------
; Standing Light Attack
[Statedef 200]
type = S
movetype = A
physics = S
anim = 200
velset = 0,0
ctrl = 0
hitcountpersist = 1
poweradd = ifelse(!numhelper(3045),35,0)
juggle = 3
facep2 = 1

[State ProRation]
type = VarSet
trigger1 = movehit = 1
fvar(13) = fvar(13) * 0.95
ignorehitpause = 1
persistent = 0

[State 220, 0]
type = playsnd
trigger1 = time = 0
trigger1 = random >= 400
value = 1,30+random%3
channel = 0
lowpriority = 1

[State 200, 0]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 200, 1]
type = HitDef
trigger1 = AnimElem = 2
attr = S, NA
hitflag = MAF
guardflag = MA
animtype = Light
priority = 4, Hit
damage = 28
pausetime = 8,8
sparkno = S800
guard.sparkno = S806
sparkxy = 0,-70
hitsound = S1,1
guardsound = S2,3
ground.type = low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5
air.velocity = -3,-3
guard.velocity = -7.5
getpower = 30,15
givepower = 34
air.fall = 1
fall.recovertime = 40
yaccel = fvar(12)

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = Animelem >= 3
statetype = S
movetype = I
physics = S


[State 200, 2]
type = PlaySnd
trigger1 = time = 0
value = 1,0

;---------------------------------------------------------------------------
; Standing Medium Attack
[Statedef 210]
type = S
movetype = A
physics = S
anim = 210
velset = 0,0
ctrl = 0
poweradd = ifelse(!numhelper(3045),50,0)
hitcountpersist = 1
juggle = 1
facep2 = 1

[State ProRation]
type = VarSet
trigger1 = movehit = 1
fvar(13) = fvar(13) * 0.90
ignorehitpause = 1
persistent = 0

;[State 0, Can info]
;type = Null
;trigger1 = 1
;trigger1 = (var(20):=-13) ; min x
;trigger1 = (var(21):=-71) ; min y
;trigger1 = (var(22):=68) ; max x
;trigger1 = (var(23):=-53) ; max y
;trigger1 = (var(24):=35) ; damage
;trigger1 = (var(26):=16) ; hitcount?
;trigger1 = (fvar(20):=5)
;trigger1 = (fvar(21):=-3)
;trigger1 = (fvar(23):=-1.7)
;trigger1 = (fvar(24):=-3.3)
;ignorehitpause = 1

;[State 0, Can Check]
;type = VarSet
;trigger1 = time >= 2
;var(25) = (anim=210) && (AnimElemTime(5) = [0,3]) && (prevstateno!=[200,310])


[State 220, 0]
type = playsnd
trigger1 = time = 0
trigger1 = random >= 400
value = 1,27+random%3
channel = 0
lowpriority = 1

[State 210, 0]
type = ChangeAnim
trigger1 = prevstateno = 200
value = 210
elem = 3
persistent = 0

[State 210, 0]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 210, 2]
type = HitDef
trigger1 = AnimElem = 4
attr = S, NA
hitflag = MAF
guardflag = MA
animtype = medium
priority = 5, Hit
damage = 44
pausetime = 12,12
sparkno = S808
guard.sparkno = S806
sparkxy = -10,-60
hitsound = S01,3
guardsound = S2,3
ground.type = Low
ground.slidetime = 20
ground.hittime = 15
ground.velocity = -7
air.velocity = -4,-3
guard.velocity = -8.5
getpower = 30,15
givepower = 40
air.fall = 1
fall.recovertime = 40
yaccel = fvar(12)

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = Animelem >= 6
statetype = S
movetype = I
physics = S

[State 210, 3]
type = velset
trigger1 = AnimElem = 4
x = 7.4

[State 210, 3]
type = velmul
trigger1 = AnimElem >= 4
trigger1 = vel x <=2
trigger1 = vel x >0
vel = 0.45

[State 210, 3]
type = PlaySnd
trigger1 = time = 0
value = 1,2

;---------------------------------------------------------------------------
; Standing Heavy Attack
[Statedef 220]
type = S
movetype = A
physics = S
anim = 220
velset = 0,0
ctrl = 0
poweradd = ifelse(!numhelper(3045),55,0)
hitcountpersist = 1
juggle = 1
facep2 = 1

[State ProRation]
type = VarSet
trigger1 = movehit = 1
fvar(13) = fvar(13) * 0.85
ignorehitpause = 1
persistent = 0

; 44, -153, 125, -24
[State 0, Can info]
type = Null
trigger1 = 1
trigger1 = (var(20):=22) ; min x
trigger1 = (var(21):=-130) ; min y
trigger1 = (var(22):=130) ; max x
trigger1 = (var(23):=-24) ; max y
trigger1 = (var(24):=50) ; damage
trigger1 = (var(26):=16) ; hitcount?
trigger1 = (fvar(20):=7)
trigger1 = (fvar(21):=-2)
trigger1 = (fvar(23):=-2)
trigger1 = (fvar(24):=-4)
ignorehitpause = 1

[State 0, Can Check]
type = VarSet
trigger1 = time >= 2
var(25) = (AnimElemTime(6) = [0,2])

[State 220, 0]
type = playsnd
trigger1 = time = 0
trigger1 = random >= 400
value = 0,ifelse(random >=500, 0, 1)
channel = 0

[State 220, 0]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 220, 0]
type = ChangeAnim
trigger1 = prevstateno = 210 || prevstateno = 310
value = 220
elem = 2
persistent = 0

[State 220, 2]
type = HitDef
trigger1 = AnimElem = 4
attr = S, NA
hitflag = MAF
guardflag = MA
animtype = Heavy
priority = 5, Hit
damage = 70
pausetime = 12,12
sparkno = S809
guard.sparkno = S806
sparkxy = -15,-50
hitsound = S1,5
guardsound = S2,3
ground.type = high
ground.slidetime = 50
ground.hittime = 20
ground.velocity = -8
air.velocity = -3.5,-3
guard.velocity = -10
getpower = 30,15
givepower = 40
air.fall = 1
fall.recovertime = 40
yaccel = fvar(12)

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = Animelem >= 7
statetype = S
movetype = I
physics = S

[State 210, 3]
type = velset
trigger1 = AnimElem = 4
x = 7

[State 210, 3]
type = velmul
trigger1 = AnimElem >= 4
trigger1 = vel x <=2
trigger1 = vel x >0
vel = 0.45

[State 210, 3]
type = PlaySnd
trigger1 = animelem = 3
value = 1,4

;---------------------------------------------------------------------------
; Standing Overhead
[Statedef 225]
type = S
movetype = A
physics = S
anim = 225
velset = 0,0
ctrl = 0
poweradd = ifelse(!numhelper(3045),55,0)
hitcountpersist = 1
juggle = 3
facep2 = 1

[State ProRation]
type = VarSet
trigger1 = movehit = 1
fvar(13) = fvar(13) * 0.80
ignorehitpause = 1
persistent = 0

[State 1120]
type = explod
trigger1 = Animelem = 4
id = 804
anim = 804
pos = 0,0
vel = -1,0
sprpriority = 2
ignorehitpause = 1
persistent = 0

[State 0, ]
type = Helper
trigger1 = animelem = 3
helpertype = normal
name = "Superpulser"
ID = 999
stateno = 999
ownpal = 1
supermovetime = 65535
pausemovetime = 65535

[State 195, hah]
type = playsnd
trigger1 = animelem = 3
value = 3,1

[State 220, 0]
type = playsnd
trigger1 = animelemtime(4) >= 0
value = 1,ifelse(random<500,16,41)
channel = 0
ignorehitpause = 1
persistent = 0

[State 220, 0]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 0, VarSet]
type = VarSet
trigger1 = animelemtime(4) = -1
var(0) = (p2statetype=A)

[State 210, 2]
type = HitDef
trigger1 = AnimElem = 4
attr = S, NA
hitflag = MAF
guardflag = H
animtype = medium
priority = 5, Hit
damage = 90
pausetime = 12,12
sparkno = S809
guard.sparkno = S806
sparkxy = -15,-60
hitsound = S01,47
guardsound = S2,3
ground.type = Low
ground.slidetime = 20
ground.hittime = 15
ground.velocity = ifelse(!var(0),-12,-1.5),ifelse(!var(0),-5.5,-4)
air.velocity = ifelse(!var(0),-12,-1.5),ifelse(!var(0),-5.5,-4)
guard.velocity = -8.5
getpower = 60,30
givepower = 40
fall = 1
fall.recovertime = 40
air.fall = 1
p2facing = 1
id = 225
nochainid = 1240,225
yaccel = fvar(12)+0.1

[State WallBounce]
type = TargetState
trigger1 = !var(0)
trigger1 = numtarget(225)
trigger1 = movehit = 1
trigger1 = !(target(225),ishelper)
value = 1150
ID = 225
ignorehitpause = 1

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = Animelem >= 6
statetype = S
movetype = I
physics = S

[State 210, 3]
type = velset
trigger1 = AnimElem = 4
x = 12.5

[State 210, 3]
type = velmul
trigger1 = AnimElem >= 4
trigger1 = vel x <=2
trigger1 = vel x >0
vel = 0.45

[State 210, 3]
type = PlaySnd
trigger1 = animelemtime(4) >= 0
value = 1,2
ignorehitpause = 1
persistent = 0

[State 200, coding this again]
type = Changestate
trigger1 = !var(55)
trigger1 = movecontact && command = "holdup"
value = 40
ctrl = 1

;---------------------------------------------
; Standing Sweep
[Statedef 202]
type = S
movetype = A
physics = S
ctrl = 0
anim = 202
velset = 0,0
juggle = ifelse(p2statetype=L,6,3)
poweradd = ifelse(!numhelper(3045),50,0)

[State ProRation]
type = VarSet
trigger1 = movehit = 1
fvar(13) = fvar(13) * 0.80
ignorehitpause = 1
persistent = 0

[State 1120, Land Spark]
type = explod
trigger1 = animelemtime(4) >= 0
id = 805
anim = 805
pos = 65,0
scale = 1, 1
sprpriority = 3
ignorehitpause = 1
persistent = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S1,7

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelemtime(4) = -1
value = S1,0
ignorehitpause = 1
persistent = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelemtime(4) >= 0
value = S2,4
ignorehitpause = 1
persistent = 0

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 3
movetype = A
[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 5
movetype = I

[State 195, Sweepu]
type = HitDef
trigger1 = AnimElem = 4
attr = C, NA
hitflag = MFD
guardflag = L
animtype = medium
damage = 44
pausetime = 10,10
sparkno = S808
guard.sparkno = S806
sparkxy = -10,-10
hitsound = S1,3
guardsound = S2,3
ground.type = trip
ground.slidetime = 20
ground.hittime = 15
ground.velocity = -2.3,-7.9
air.velocity = -2.7,-7.9
guard.velocity = -8.5
getpower = 60,30
givepower = 44
id = 202
nochainid = 202
fall = 1
fall.recovertime = 40
yaccel = fvar(12) + 0.25

[State 195, gotta take a shit]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;------------------------------------------------------------
; Crouching Light Attack
[Statedef 300]
type = C
movetype = A
physics = C
anim = 300
velset = 0,0
ctrl = 0
hitcountpersist = 1
poweradd = ifelse(!numhelper(3045),35,0)
juggle = 1
facep2 = 1

[State ProRation]
type = VarSet
trigger1 = movehit = 1
fvar(13) = fvar(13) * 0.95
ignorehitpause = 1
persistent = 0

[State 220, 0]
type = playsnd
trigger1 = time = 0
trigger1 = random >= 400
value = 1,30+random%3
channel = 0
lowpriority = 1

[State 200, 0]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

[State 200, 1]
type = HitDef
trigger1 = AnimElem = 2
attr = S, NA
hitflag = MAF
guardflag = LA
animtype = Light
priority = 4, Hit
damage = 25
pausetime = 8,8
sparkno = S800
guard.sparkno = S806
sparkxy = 0,-10
hitsound = S1,1
guardsound = S2,3
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -5
air.velocity = -3,-3
guard.velocity = -7.5
getpower = 30,15
givepower = 7
air.fall = 1
fall.recovertime = 40
yaccel = fvar(12)

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = Animelem >= 4
statetype = C
movetype = I
physics = C

[State 200, 2]
type = PlaySnd
trigger1 = time = 0
value = 1,6

;----------------------------------------------------------------------------
; Crouching Medium Attack
[Statedef 310]
type = C
movetype = A
physics = C
anim = 310
velset = 0,0
ctrl = 0
hitcountpersist = 1
poweradd = ifelse(!numhelper(3045),35,0)
juggle = 1
facep2 = 1

[State ProRation]
type = VarSet
trigger1 = movehit = 1
fvar(13) = fvar(13) * 0.90
ignorehitpause = 1
persistent = 0

[State 220, 0]
type = playsnd
trigger1 = time = 0
trigger1 = random >= 400
value = 1,27+random%3
channel = 0
lowpriority = 1

; 35, -84, 142, -30
; 39, -48, 141, -38
[State 0, Can info]
type = Null
trigger1 = 1
trigger1 = (var(20):=30) ; min x
trigger1 = (var(21):=-50) ; min y
trigger1 = (var(22):=146) ; max x
trigger1 = (var(23):=-30) ; max y
trigger1 = (var(24):=30) ; damage
trigger1 = (var(26):=16) ; hitcount?
trigger1 = (fvar(20):=6)
trigger1 = (fvar(21):=-3.8)
trigger1 = (fvar(23):=-1.7)
trigger1 = (fvar(24):=-3.3)
ignorehitpause = 1

[State 0, Can Check]
type = VarSet
trigger1 = time >= 2
var(25) = (anim=310) && (AnimElemTime(3) = [0,4])

[State 210, 0]
type = ChangeAnim
trigger1 = prevstateno = 200
value = 310
elem = 2
persistent = 0

[State 200, 0]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

[State 200, 1]
type = HitDef
trigger1 = AnimElem = 3
attr = S, NA
hitflag = MAF
guardflag = MA
animtype = medium
priority = 4, Hit
damage = 50
pausetime = 8,8
sparkno = S808
guard.sparkno = S806
sparkxy = 0,-45
hitsound = S1,3
guardsound = S2,3
ground.type = low
ground.slidetime = 21
ground.hittime = 21
ground.velocity = -5
air.velocity = -3,-3
guard.velocity = -7.5
getpower = 30,15
givepower = 7
air.fall = 1
fall.recovertime = 40
yaccel = fvar(12)

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = Animelem >= 4
statetype = C
movetype = I
physics = C

[State 200, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,7

;----------------------------------------------------------------------------
; Crouching Hard Attack
[Statedef 320]
type = C
movetype = A
physics = C
anim = 320
velset = 0,0
ctrl = 0
hitcountpersist = 1
poweradd = ifelse(!numhelper(3045),35,0)
juggle = ifelse(numtarget(1140),4,3)
facep2 = 1

[State ProRation]
type = VarSet
trigger1 = movehit = 1
fvar(13) = fvar(13) * 0.85
ignorehitpause = 1
persistent = 0

[State 220, 0]
type = playsnd
trigger1 = time = 0
trigger1 = random >= 400
value = 0,ifelse(random >=500, 0, 1)
channel = 0
lowpriority = 1

[State 200, 0]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

[State 200, 1]
type = HitDef
trigger1 = AnimElem = 4
attr = S, NA
hitflag = MAF
guardflag = MA
animtype = up
priority = 4, Hit
damage = 66
pausetime = 8,8
sparkno = S809
guard.sparkno = S806
sparkxy = -20,-40
hitsound = S1,5
guardsound = S2,3
ground.type = High
ground.slidetime = 20
ground.hittime = 20
guard.hittime = 10
ground.velocity = -1, -9
air.velocity = -1, -9
guard.velocity = -12
ground.cornerpush.veloff = -12.5
fall = 1
bounce = 1
getpower = 30,15
givepower = 7
id = 320
nochainid = 320, 1240
fall.recovertime = 35
yaccel = fvar(12)

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = Animelem >= 5
statetype = C
movetype = I
physics = C

[State 200, 2]
type = PlaySnd
trigger1 = animelem = 3
value = 1,8

[State 200, coding this again]
type = Changestate
trigger1 = !var(55)
trigger1 = movecontact && command = "holdup"
value = 40
ctrl = 1

;---------------------------------------------
; Crouching Sweep
[Statedef 325]
type = C
movetype = A
physics = C
ctrl = 0
anim = 325
velset = 0,0
juggle = 4
poweradd = ifelse(!numhelper(3045),50,0)

[State ProRation]
type = VarSet
trigger1 = movehit = 1
fvar(13) = fvar(13) * 0.85
ignorehitpause = 1
persistent = 0

[State 0, Explod]
type = Explod
trigger1 = animelem = 4
anim = 804
pos = 25,0
postype = p1
facing = -1
bindtime = 1
vel = 1,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 2
x = 10
[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 3
x = 5
[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 7
x = -5
[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 8
x = -10

[State 220, 0]
type = playsnd
trigger1 = time = 0
trigger1 = random >= 400
value = 1,27+random%3
channel = 0
lowpriority = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S0,3

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 5
movetype = I

[State 195, Sweepu]
type = HitDef
trigger1 = AnimElem = 4
attr = C, NA
hitflag = MAF
guardflag = L
animtype = medium
damage = 62
pausetime = 10,10
sparkno = S809
guard.sparkno = S806
sparkxy = -10,-15
hitsound = S1,5
guardsound = S2,3
ground.type = trip
ground.slidetime = 20
ground.hittime = 15
ground.velocity = -2.3,-7.9
air.velocity = -2.7,-7.9
guard.velocity = -8.5
getpower = 60,30
givepower = 44
fall = 1
fall.recovertime = 40
yaccel = fvar(12) + 0.25

[State 195, gotta take a shit]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;-------------------------------------------------------------
; Jumping Light Attack
[Statedef 400]
type = A
movetype = A
physics = A
anim = 400
ctrl = 0
hitcountpersist = 1
poweradd = ifelse(!numhelper(3045),35,0)
juggle = 1

[State ProRation]
type = VarSet
trigger1 = movehit = 1
fvar(13) = fvar(13) * 0.95
ignorehitpause = 1
persistent = 0

[State 0, VelSet]
type = VelSet
trigger1 = numtarget
trigger1 = time = 1
trigger1 = prevstateno = [400,449]
trigger1 = p2statetype = A
trigger1 = p2movetype = H
;x = 0.5 + (target,vel x) * ifelse(facing=(target,facing),1.05,-1.05)
x = ifelse(abs(p2bodydist x / 15)>=4,4,abs(p2bodydist x / 15))
y = -2.5

[State 220, 0]
type = playsnd
trigger1 = time = 0
trigger1 = random >= 400
value = 1,30+random%3
channel = 0
lowpriority = 1

[State 400,0]
type = ChangeAnim
trigger1 = Animtime = 0
value =  44
elem = 6

[State 400, 1]
type = HitDef
trigger1 = AnimElem = 3
animtype = light
attr = A, NA
damage = 28
guardflag = HA
priority = 3
pausetime = 8,8
sparkno = S800
guard.sparkno = S806
sparkxy = -5,-35
hitsound   = S1,1
guardsound = S2,3
ground.type = High
ground.slidetime = 8
ground.hittime  = 8
ground.velocity = -4
guard.velocity = -4
air.velocity = -2,-3
air.fall = 1
air.hittime = 15
fall.recovertime = 40
yaccel = fvar(12)
getpower = 30,15

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = Animelem >= 4
statetype = A
movetype = I
physics = A

[State 400, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,0


;-------------------------------------------------------------------------------
; Jumping Medium Attack
[Statedef 410]
type = A
movetype = A
physics = A
anim = 410
ctrl = 0
hitcountpersist = 1
poweradd = ifelse(!numhelper(3045),35,0)
juggle = 1

[State ProRation]
type = VarSet
trigger1 = movehit = 1
fvar(13) = fvar(13) * 0.90
ignorehitpause = 1
persistent = 0

[State 0, VelSet]
type = VelSet
trigger1 = numtarget
trigger1 = time = 1
trigger1 = prevstateno = [400,449]
trigger1 = p2statetype = A
trigger1 = p2movetype = H
;x = 0.5 + (target,vel x) * ifelse(facing=(target,facing),1.05,-1.05)
x = ifelse(abs(p2bodydist x / 15)>=4,4,abs(p2bodydist x / 15))
y = -2

[State 220, 0]
type = playsnd
trigger1 = time = 0
trigger1 = random >= 400
value = 1,27+random%3
channel = 0
lowpriority = 1

[State 400,0]
type = ChangeAnim
trigger1 = Animtime = 0
value =  44
elem = 6

[State 410, 0]
type = ChangeAnim
trigger1 = prevstateno = 400
value = 410
elem = 3
persistent = 0

[State 400, 1]
type = HitDef
trigger1 = AnimElem = 4
animtype = medium
attr = A, NA
damage = 44
guardflag = HA
priority = 3
pausetime = 12,12
sparkno = S808
guard.sparkno = S806
sparkxy = -5,-79
hitsound   = S1,3
guardsound = S2,3
ground.type = High
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = -4
guard.velocity = -5
air.velocity = -3.5,-3
air.fall = 1
air.hittime = 20
fall.recovertime = 40
yaccel = fvar(12)
getpower = 30,15

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = Animelem >= 6
statetype = A
movetype = I
physics = A

[State 400, 2]
type = PlaySnd
trigger1 = AnimElem = 4
value = 2,1
[State 400, 2]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,8

;-----------------------------------------------------------------------------
; Jumping Heavy Attack
[Statedef 420]
type = A
movetype = A
physics = A
anim = 420
ctrl = 0
hitcountpersist = 1
poweradd = ifelse(!numhelper(3045),35,0)
juggle = 0

[State ProRation]
type = VarSet
trigger1 = movehit = 1
fvar(13) = fvar(13) * 0.85
ignorehitpause = 1
persistent = 0

[State 0, VelSet]
type = VelSet
trigger1 = numtarget
trigger1 = time = 1
trigger1 = prevstateno = [400,449]
trigger1 = p2statetype = A
trigger1 = p2movetype = H
;x = 0.5 + (target,vel x) * ifelse(facing=(target,facing),1.05,-1.05)
x = ifelse(abs(p2bodydist x / 15)>=4,4,abs(p2bodydist x / 15))
y = -3.7

[State 220, 0]
type = playsnd
trigger1 = time = 0
trigger1 = random >= 400
value = 0,ifelse(random >=500, 0, 1)
channel = 0

; -14, -81, 88, -3
[State 0, Can info]
type = Null
trigger1 = 1
trigger1 = (var(20):=-12) ; min x
trigger1 = (var(21):=-81) ; min y
trigger1 = (var(22):=88) ; max x
trigger1 = (var(23):=-3) ; max y
trigger1 = (var(24):=55) ; damage
trigger1 = (var(26):=16) ; hitcount?
trigger1 = (fvar(20):=7)
trigger1 = (fvar(21):=-1.1)
trigger1 = (fvar(23):=-2)
trigger1 = (fvar(24):=-4)
ignorehitpause = 1

[State 0, Can Check]
type = VarSet
trigger1 = time >= 2
var(25) = (anim=420) && (AnimElemTime(5) = [0,2])

[State 400,0]
type = ChangeAnim
trigger1 = Animtime = 0
value = 44
elem = 6

[State 410, 0]
type = ChangeAnim
trigger1 = prevstateno = 400
trigger2 = prevstateno = 410
value = 420
elem = 2
persistent = 0

[State 400, 1]
type = HitDef
trigger1 = AnimElem = 5
animtype = hard
attr = A, NA
damage = 70
guardflag = HA
priority = 3
pausetime = 12,12
sparkno = S809
guard.sparkno = S806
sparkxy = -5,-25
hitsound   = S1,5
guardsound = S2,3
ground.type = High
ground.slidetime = 50
ground.hittime  = 20
ground.velocity = -5
guard.velocity = -8
air.velocity = -2,7.5
air.fall = 1
air.hittime = 20
fall.recovertime = 40
yaccel = fvar(12)
getpower = 30,15

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = Animelem >= 6
statetype = A
movetype = I
physics = A

[State 400, 2]
type = PlaySnd
trigger1 = animelem = 3
value = 1,4

;---------------------------------------------------------------------------
;Throw
[Statedef 829]
type    = S
movetype= A
physics = S
juggle  = 0
velset = 0,0
ctrl = 0
anim = 829
sprpriority = 2

[State 800, 1]
type = HitDef
getpower = 60,30
Trigger1 = Time = 0
attr = S, NT
hitflag = M-
priority = 1, Miss
sparkno = S801
sparkxy = 0,-60
p1sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 830
;p2stateno = 831
guard.dist = 0
fall = 1

[State 800, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;Ball Throw - Throw Opponent
[Statedef 830]
type    = S
movetype= A
physics = S
anim = 830
poweradd = ifelse(!numhelper(3045),50,0)
velset = 0,0

[State 0, TargetState]
type = TargetState
trigger1 = time = 0
value = 835

[State 830]
type = playsnd
trigger1 = Time = 0
value = 1,33

[State 830]
type = playsnd
trigger1 = Time = 0
value = 1,41
channel = 0

[State 830, Holding back?]
type = VarSet
trigger1 = Time = 0
var(6) = command = "holdback"

[State 830, holdfwd - Turn 6]
type = Turn
trigger1 = var(6)
trigger1 = Time = 0

[State 830, holdfwd - Turn 6]
type = TargetFacing
trigger1 = var(6)
trigger1 = Time = 0
value = -1

[State 830, holdfwd - Pos 6]
type = PosAdd
trigger1 = var(6)
trigger1 = Time = 0
x = -37

[State 830, Grab Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 2, 1

[State 830, Bind 1]
type = TargetBind
trigger1 = animelemtime(2) < 0
pos = 38, -4

[State 830, Width 2-11]
type = Width
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(1) < 30
edge = 60,0

[State 830, Hurt 11]
type = TargetLifeAdd
trigger1 = AnimElem = 2
value = -70

[State 0, TargetVelSet]
type = TargetVelSet
trigger1 = animelem = 2
x = -0.8
y = -11.8

[State 830, Throw 11]
type = TargetState
trigger1 = AnimElem = 2
value = 836

[State 830]
type = velset
trigger1 = 1
x = 0

[State 830, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Thrown by Ball Throw
[Statedef 831]
type    = A
movetype= H
physics = N
velset = 0,-10
facep2 = 1

[State 831, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 832

[State 810, ChangeAnim2]
type = ChangeAnim2
Trigger1 = time = 0
trigger1 = name = "Gill"
trigger1 = facing = -1
value = 833;+(facing=-1)*100000

[State 833, AfterImage]
type = AfterImage
trigger1 = 1
time = 1
length = 20
palcolor = 256
palinvertall = 0
palbright = 30,30,30
palcontrast = 120,120,220
palpostbright = 0,0,0
paladd = 10,10,25
palmul = .65,.65,.75
timegap = 1
framegap = 4
trans = "add" ;"none","add1","sub"
ignorehitpause = 1
persistent = 0

;In case attacker loses binding on player for any reason, this controller
;guarantees that the player will never get stuck in this thrown state.
[State 820, 2]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

;---------------------------------------------------------------------------
;Ack
[Statedef 835]
type    = A
movetype= H
physics = N
velset = 0,0

[State 831, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 835

[State 810, ChangeAnim2]
type = ChangeAnim2
Trigger1 = time = 0
trigger1 = name = "Gill"
trigger1 = facing = -1
value = 833;+(facing=-1)*100000

[State 820, 2]
type = SelfState
trigger1 = time >= 60
trigger1 = !gethitvar(isbound)
value = 5050

;---------------------------------------------------------------------------
;Ack
[Statedef 836]
type    = A
movetype= H
physics = N

[State 0, VelMul]
type = VelMul
trigger1 = 1
x = 0.95

[State 0, Gravity]
type = VelAdd
trigger1 = 1
y = 0.48

[State 831, 1]
type = ChangeAnim
Trigger1 = Time = 0
value = ifelse(selfanimexist(5051),5051,5050)

[State 831, 1]
type = ChangeAnim
trigger1 = vel y >= -1
trigger1 = anim = 5051
trigger1 = selfanimexist(5061)
;Trigger1 = animTime = 0
value = 5061

;[State 810, ChangeAnim2]
;type = ChangeAnim2
;Trigger1 = time = 0
;trigger1 = name = "Gill"
;trigger1 = facing = -1
;value = 833;+(facing=-1)*100000

[State 833, AfterImage]
type = AfterImage
trigger1 = time = 0
time = 1
length = 20
palcolor = 256
palinvertall = 0
palbright = 30,30,30
palcontrast = 120,120,220
palpostbright = 0,0,0
paladd = 10,10,25
palmul = .65,.65,.75
timegap = 1
framegap = 4
trans = "add" ;"none","add1","sub"
ignorehitpause = 1
persistent = 0

[State 821, 2] ; Recover near ground (use ChangeState)
type = ChangeState
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5200 ;HITFALL_RECOVER


[State 820, 2]
type = SelfState
trigger1 = vel y + pos y >= 0
value = 5100

;------------------------------------------------------------------------
[Statedef 900]
type = S
movetype = A
physics = S
anim = 963
velset = 0,0
ctrl = 0
hitcountpersist = 1
facep2 = 1

[State 0, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 30
anim = S876
sound = S1,46
pos = 30, -66
;move =
darken = 0
p2defmul = 0
poweradd = -1000
unhittable = 1
;endcmdbuftime = (winmugen only)
;pausebg =  (winmugen only)
ignorehitpause = 1

[State 220, 0]
type = playsnd
trigger1 = time = 0
value = 1,17
channel = 0

[State 210, 3]
type = PlaySnd
trigger1 = animelem = 2
value = 1,4

[State 220]
type = assertspecial
trigger1 = 1
flag = unguardable

[State 220, 0]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 220, 0]
type = ChangeAnim
trigger1 = prevstateno = 210 || prevstateno = 310
value = 220
elem = 3
persistent = 0

[State 220, 2]
type = HitDef
trigger1 = AnimElem = 5
attr = S, NA
hitflag = MAF
guardflag = MA
animtype = up
priority = 5, Hit
damage = 75
pausetime = 9,9
sparkno = S809
guard.sparkno = S806
fall = 1
fall.recover = 0
sparkxy = -60,-50
hitsound = S1,5
guardsound = 6,0
ground.type = Low
ground.slidetime = 60
ground.hittime = 20
ground.velocity = 0,15
air.velocity = 0,15
getpower = 0
givepower = 0

[State 210, 3]
type = velset
trigger1 = AnimElem = 4
x = 1

[State 210, 3]
type = velset
trigger1 = AnimElem = 5
x = 6

[State 210, 3]
type = velmul
trigger1 = AnimElem >= 5
trigger1 = vel x <=2
trigger1 = vel x >0
vel = 0.45

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA;,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 60
ignorehitpause = 1
persistent = 0
;-------------------------------
;Power Charge
[Statedef 1500]
type = S
movetype = I
physics = S
anim = 1500
velset = 0,0
ctrl = 0
facep2 = 1

[State 9000, PowerAdd]
type = PowerAdd
trigger1 = Time < 60
trigger1 = ((GameTime%5) = 0) && (command = "holdc")
trigger1 = power != powermax
value = 15

[State 9000, PowerAdd]
type = PowerAdd
trigger1 = Time > 60
trigger1 = ((GameTime%5) = 0) && (command = "holdc")
trigger1 = power != powermax
value = 35

[State 1027, fire]
type = explod
trigger1 = Time%60 = 1
pos = 2,8
anim = 1505
id = 1504
removetime = -2
scale = 1,1
sprpriority = 2
bindtime = -1
removeongethit = 1

[State 1027, fire]
type = explod
trigger1 = power = powermax;5000
pos = 2,8
anim = 1511
id = 1511
removetime = -2
scale = 1.5,1.5
sprpriority = 2
bindtime = -1
removeongethit = 1

[State 1500,var]
type = varset
trigger1 = Time = 1
var(17) = 1

[State 1027, fire]
type = removeexplod
trigger1 = power = powermax;5000
id = 1504
;trans = addalpha
;alpha = 256 - (time * 4), time * 4

[State 9000, PlaySnd]
type = PlaySnd
trigger1 = time = 1 && random > 200
channel = 2
value = 1,15

[State 9000]
type = stopsnd
trigger1 = command != "holdc"
channel = 1

[State 9000, PlaySnd]
type = PlaySnd
trigger1 = time = 1
channel = 0
value = 9001,0

[State 9000, PlaySnd]
type = PlaySnd
trigger1 = time = 82
channel = 0
value = 9001,1
lowpriority = 0
loop = 1

[State 9000, PlaySnd]
type = PlaySnd
trigger1 = power = powermax;5000
channel = 1
value = 9001,2

[State 9000, PlaySnd]
type = playsnd
trigger1 = power = powermax;5000
channel = 2
value = 1,20

[State 9000, End]
type = ChangeState
trigger1 = (command != "holdc") && animtime = 0
trigger2 = power = powermax;5000
value = 1525
;------------------------------
[Statedef 1525]
type = S
movetype = I
physics = S
anim = 1515
velset = 0,0
hitcountpersist = 1
facep2 = 1

[State 1500,var]
type = varset
trigger1 = Time = 1
var(17) = 1

[State 9001, StopSnd]
type = StopSnd
trigger1 = Time = 0
channel = 0

[State 9001, StopSnd]
type = StopSnd
trigger1 = Time = 0
channel = 2

[State 9000, PlaySnd]
type = playsnd
trigger1 = power = 5000 && Time = 1
channel = 0
value = 1,20

[State 9001, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


