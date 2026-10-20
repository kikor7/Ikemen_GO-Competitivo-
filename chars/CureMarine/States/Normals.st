;--- NORMALS ---
;States 500 - 1499
;Reserved for Normal Attacks.
;Examples, Light Punch, Heavy Kick, Command Normals such as Street Fighter Ken's, "-> + Medium Kick"

;---------------------------------------------------------------------------
; Light Punch
[Statedef 200]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 200
poweradd = 0
sprpriority = 2
facep2 = 1

[State 200, HitDef]
type = HitDef
trigger1 = !time
attr = S, NA
damage = ceil(20*fvar(11)),0
animtype = Light
hitflag = MAF
guardflag = MA
pausetime = 8,8
sparkno = s6000
guard.sparkno = s6003
sparkxy = -10,-60
hitsound = s0,3
guardsound = s0,10
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -3,0
air.type = High
air.velocity = -1,-2.5
airguard.velocity = -3,0
air.hittime = 20
getpower = 30,15
givepower = 0,0

[State 200, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 200, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = s0,0

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
movetype = I

[State 200, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Heavy Punch
[Statedef 210]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 210
poweradd = 0
sprpriority = 2
facep2 = 1

[State 210, HitDef]
type = HitDef
trigger1 = !time
attr = S, NA
damage = ceil(60*fvar(11)),0
animtype = Heavy
hitflag = MAF
guardflag = MA
pausetime = 12,12
sparkno = s6002
guard.sparkno = s6004
sparkxy = -10,-60
hitsound = s0,5
guardsound = s0,10
ground.type = High
ground.slidetime = 25
ground.hittime = 25
ground.velocity = -5,0
air.type = High
air.velocity = -2,-3
airguard.velocity = -5,0
air.hittime = 25
envshake.time = 10
envshake.ampl = 3
getpower = 30,15
givepower = 0,0

[State 210, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 210, PlaySnd]
type = PlaySnd
trigger1 = random < 500
trigger1 = !AnimElemTime(2)
value = s210,0
channel = 0

[State 210, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(3)
value = s0,2

[State 210, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
movetype = I

[State 210, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Light Kick
[Statedef 220]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 220
poweradd = 0
sprpriority = 2
facep2 = 1

[State 220, HitDef]
type = HitDef
trigger1 = !time
attr = S, NA
damage = ceil(20*fvar(11)),0
animtype = Light
hitflag = MAF
guardflag = MA
pausetime = 8,8
sparkno = s6000
guard.sparkno = s6003
sparkxy = -10,-66
hitsound = s0,3
guardsound = s0,10
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -3,0
air.type = High
air.velocity = -1,-2.5
airguard.velocity = -3,0
air.hittime = 20
getpower = 30,15
givepower = 0,0

[State 220, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 220, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = s0,1

[State 220, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
movetype = I

[State 220, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Heavy Kick
[Statedef 230]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 230
poweradd = 0
sprpriority = 2
facep2 = 1

[State 230, HitDef]
type = HitDef
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
trigger3 = AnimElem = 5
trigger4 = AnimElem = 6
attr = S, NA
damage = ceil(40*fvar(11)),0
animtype = Heavy
hitflag = MAF
guardflag = MA
pausetime = 12,12
sparkno = s6002
guard.sparkno = s6004
sparkxy = -10,ifelse((AnimElem = 4), -55, ifelse((AnimElem = 5), -40, -18))
hitsound = s0,5
guardsound = s0,10
ground.type = High
ground.slidetime = 25
ground.hittime = 25
ground.velocity = -5,0
air.type = High
air.velocity = -2,-3
airguard.velocity = -5,0
air.hittime = 25
envshake.time = 10
envshake.ampl = 3
getpower = 30,15
givepower = 0,0

[State 230, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 230, PlaySnd]
type = PlaySnd
trigger1 = random < 500
trigger1 = !AnimElemTime(2)
value = s230,0
channel = 0

[State 230, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(3)
value = s0,2

[State 230, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 7
movetype = I

[State 230, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Marine Butt Punch
[Statedef 240]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 240
poweradd = 0
sprpriority = 2
facep2 = 1

[State 240, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A

[State 240, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 5.5
y = -5

[State 240, VelAdd]
type = VelAdd
trigger1 = AnimElemNo(0) >= 3
y = .4

[State 240, Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 6026
ID = 6026
pos = 0,floor(-vel y)
postype = p1
ownpal = 1
scale = 0.6,0.6
sprpriority = 10
trans = add

[State 240, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(3)
value = s240,0
channel = 0

[State 240, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(3)
value = s40,0

[State 240, HitDef]
type = HitDef
trigger1 = !time
attr = A, NA
damage = ceil(80*fvar(11)),0
animtype = Heavy
hitflag = MAF
guardflag = MA
pausetime = 12,12
sparkno = s6002
guard.sparkno = s6004
sparkxy = -10,-50
hitsound = s0,5
guardsound = s0,10
ground.type = High
ground.slidetime = 25
ground.hittime = 25
ground.velocity = -5,-5
guard.velocity = -8.0
air.type = High
air.velocity = -5,-5
air.hittime = 25
fall = 1
fall.recover = 0
yaccel = 0.5
envshake.time = 14
envshake.ampl = 8
getpower = 30,15
givepower = 0,0

[State 240, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 240, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
movetype = I

[State 240, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y > -Vel Y
value = 241
ctrl = 0

;---------------------------------------------------------------------------
; Landing
[Statedef 241]
type = S
movetype = I
physics = S
velset = 0,0
ctrl = 0
anim = 241

[State 241, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s52,0

[State 241, Explod]
type = Explod
trigger1 = !time
anim = 6022
sprpriority = -3
postype = p1
scale = 0.5,0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 241, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 241, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Dash Punch
[Statedef 250]
type = A
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 250
poweradd = 0
sprpriority = 2
facep2 = 1

[State 250, VelSet]
type = VelSet
trigger1 = !time
x = 5.5

[State 250, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 1

[State 250, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 0

[State 250, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s210,0
channel = 0

[State 250, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = s0,2

[State 250, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(5)
value = s52,0

[State 250, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 6022
sprpriority = -3
postype = p1
scale = 0.5,0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 250, HitDef]
type = HitDef
trigger1 = !time
attr = A, NA
damage = ceil(60*fvar(11)),0
animtype = Heavy
hitflag = MAF
guardflag = MA
pausetime = 12,12
sparkno = s6002
guard.sparkno = s6004
sparkxy = -10,-60
hitsound = s0,5
guardsound = s0,10
ground.type = High
ground.slidetime = 23
ground.hittime = 23
ground.velocity = -4,-5
guard.velocity = -6.0
air.type = High
air.velocity = -4,-5
air.hittime = 23
fall = 1
fall.recover = 0
yaccel = 0.5
envshake.time = 10
envshake.ampl = 3
getpower = 60,30
givepower = 0,0

[State 250, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 250, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
movetype = I

[State 250, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Dash Kick
[Statedef 251]
type = A
movetype = A
physics = A
velset = (P2BodyDist X - 2)/32.00,-9.5
ctrl = 0
anim = 251
poweradd = 0
sprpriority = 2
facep2 = 1

[State 251, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s40,0

[State 251, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(5)
value = s240,0
channel = 0

[State 251, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(5)
value = s0,2

[State 251, Explod]
type = Explod
trigger1 = !time
anim = 6026
ID = 6026
pos = 0,floor(-vel y)
postype = p1
ownpal = 1
scale = 0.6,0.6
sprpriority = 10
trans = add

[State 251, HitDef]
type = HitDef
trigger1 = !time
attr = A, NA
damage = ceil(80*fvar(11)),0
animtype = Heavy
hitflag = MAFD
guardflag = H
pausetime = 12,12
sparkno = s6002
guard.sparkno = s6004
sparkxy = 2,-5
hitsound = s0,5
guardsound = s0,10
ground.type = High
ground.slidetime = 30
ground.hittime = 30
ground.velocity = -6,0
down.velocity = -6,0
air.type = High
air.velocity = -3,-4
air.hittime = 30
air.fall = 1
fall.recover = 0
yaccel = 0.5
envshake.time = 10
envshake.ampl = 3
getpower = 30,15
givepower = 0,0

[State 251, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 251, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 252

[State 251, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y > -Vel Y
value = 52
ctrl = 0

;---------------------------------------------------------------------------
; Hop Back
[Statedef 252]
type = A
movetype = I
physics = A
velset = -3,-4
ctrl = 0
anim = 252

[State 252, CtrlSet]
type = CtrlSet
trigger1 = AnimElemTime(2) >= 0
value = 1

;---------------------------------------------------------------------------
; Crouch Light Punch
[Statedef 400]
type = C
movetype = A
physics = C
velset = 0,0
ctrl = 0
anim = 400
poweradd = 0
sprpriority = 2
facep2 = 1

[State 400, HitDef]
type = HitDef
trigger1 = !time
attr = C, NA
damage = ceil(20*fvar(11)),0
animtype = Light
hitflag = MAF
guardflag = MA
pausetime = 8,8
sparkno = s6000
guard.sparkno = s6003
sparkxy = -10,-33
hitsound = s0,3
guardsound = s0,10
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -2,0
air.type = High
air.velocity = -1,-2
airguard.velocity = -3,0
air.hittime = 20
getpower = 30,15
givepower = 0,0

[State 400, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 400, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = s0,0

[State 400, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
movetype = I

[State 400, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Heavy Punch
[Statedef 410]
type = C
movetype = A
physics = C
velset = 0,0
ctrl = 0
anim = 410
poweradd = 0
sprpriority = 2
facep2 = 1

[State 410, HitDef]
type = HitDef
trigger1 = !time
attr = C, NA
damage = ceil(60*fvar(11)),0
animtype = Heavy
hitflag = MAF
guardflag = MA
pausetime = 12,12
sparkno = s6002
guard.sparkno = s6004
sparkxy = -10,-50
hitsound = s0,5
guardsound = s0,10
ground.type = Low
ground.slidetime = 25
ground.hittime = 25
ground.velocity = -5,0
air.type = High
air.velocity = -2,-3
airguard.velocity = -5,0
air.hittime = 25
envshake.time = 10
envshake.ampl = 3
getpower = 30,15
givepower = 0,0

[State 410, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 410, PlaySnd]
type = PlaySnd
trigger1 = random < 500
trigger1 = !time
value = s210,0
channel = 0

[State 410, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = s0,2

[State 410, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
movetype = I

[State 410, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Light Kick
[Statedef 420]
type = C
movetype = A
physics = C
velset = 0,0
ctrl = 0
anim = 420
poweradd = 0
sprpriority = 2
facep2 = 1

[State 420, HitDef]
type = HitDef
trigger1 = !time
attr = C, NA
damage = ceil(20*fvar(11)),0
animtype = Light
hitflag = MAFD
guardflag = L
pausetime = 8,8
sparkno = s6000
guard.sparkno = s6003
sparkxy = -10,-5
hitsound = s0,3
guardsound = s0,10
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -2,0
down.velocity = -2,0
air.type = High
air.velocity = -1,-2
air.hittime = 20
getpower = 30,15
givepower = 0,0

[State 420, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 420, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = s0,1

[State 420, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
movetype = I

[State 420, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Heavy Kick
[Statedef 430]
type = C
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 430
poweradd = 0
sprpriority = 2
facep2 = 1

[State 430, VelSet]
type = VelSet
trigger1 = !time
x = 4

[State 430, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 1

[State 430, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 0

[State 430, HitDef]
type = HitDef
trigger1 = !time
attr = C, NA
damage = ceil(60*fvar(11)),0
animtype = Heavy
hitflag = MAFD
guardflag = L
pausetime = 12,12
sparkno = s6002
guard.sparkno = s6004
sparkxy = -10,-10
hitsound = s0,5
guardsound = s0,10
ground.type = Trip
ground.slidetime = 25
ground.hittime = 25
ground.velocity = -2,-6
guard.velocity = -6.0
air.type = High
air.velocity = -2,-6
air.hittime = 25
fall = 1
fall.recover = 0
yaccel = 0.5
envshake.time = 10
envshake.ampl = 3
getpower = 30,15
givepower = 0,0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 430, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 430, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s430,0
channel = 0

[State 430, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = s0,2

[State 430, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 4
movetype = I

[State 430, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Air Light Punch
[Statedef 600]
type = A
movetype = A
physics = A
ctrl = 0
anim = 600
poweradd = 0
sprpriority = 2

[State 600, HitDef]
type = HitDef
trigger1 = !time
attr = A, NA
damage = ceil(20*fvar(11)),0
animtype = Light
hitflag = MAF
guardflag = HA
pausetime = 8,8
sparkno = s6000
guard.sparkno = s6003
sparkxy = -10,-33
hitsound = s0,3
guardsound = s0,10
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -2,0
air.type = High
air.velocity = -1,-2.5
airguard.velocity = -3,0
air.hittime = 20
getpower = 30,15
givepower = 0,0

[State 600, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 600, PlaySnd]
type = PlaySnd
trigger1 = anim = 600
trigger1 = !AnimElemTime(2)
value = s0,0

[State 600, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 601
movetype = I

[State 600, ChangeAnim]
type = ChangeAnim
trigger1 = movecontact = 1
trigger1 = numtarget
value = 601

;---------------------------------------------------------------------------
; Air Heavy Punch
[Statedef 610]
type = A
movetype = A
physics = A
ctrl = 0
anim = 610
poweradd = 0
sprpriority = 2

[State 610, HitDef]
type = HitDef
trigger1 = !time
attr = A, NA
damage = ceil(60*fvar(11)),0
animtype = Heavy
hitflag = MAF
guardflag = HA
pausetime = 12,12
sparkno = s6002
guard.sparkno = s6004
sparkxy = -10,-40
hitsound = s0,5
guardsound = s0,10
ground.type = High
ground.slidetime = 25
ground.hittime = 25
ground.velocity = -5,0
air.type = High
air.velocity = -2,-3
airguard.velocity = -4,0
air.hittime = 25
envshake.time = 10
envshake.ampl = 3
getpower = 30,15
givepower = 0,0

[State 610, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 610, PlaySnd]
type = PlaySnd
trigger1 = random < 500
trigger1 = !time
value = s210,0
channel = 0

[State 610, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = s0,2

[State 610, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
movetype = I

;---------------------------------------------------------------------------
; Air Light Kick
[Statedef 620]
type = A
movetype = A
physics = A
ctrl = 0
anim = 620
poweradd = 0
sprpriority = 2

[State 620, HitDef]
type = HitDef
trigger1 = !time
attr = A, NA
damage = ceil(20*fvar(11)),0
animtype = Light
hitflag = MAF
guardflag = HA
pausetime = 8,8
sparkno = s6000
guard.sparkno = s6003
sparkxy = -10,-30
hitsound = s0,3
guardsound = s0,10
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -2,0
air.type = High
air.velocity = -1,-2.5
airguard.velocity = -3,0
air.hittime = 20
getpower = 30,15
givepower = 0,0

[State 620, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 620, PlaySnd]
type = PlaySnd
trigger1 = anim = 620
trigger1 = !AnimElemTime(2)
value = s0,1

[State 620, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 601
movetype = I

[State 620, ChangeAnim]
type = ChangeAnim
trigger1 = movecontact = 1
trigger1 = numtarget
value = 601

;---------------------------------------------------------------------------
; Alt Air Light Kick
[Statedef 621]
type = A
movetype = A
physics = A
ctrl = 0
anim = 621
poweradd = 0
sprpriority = 2

[State 621, HitDef]
type = HitDef
trigger1 = !time
attr = A, NA
damage = ceil(20*fvar(11)),0
animtype = Light
hitflag = MAF
guardflag = HA
pausetime = 8,8
sparkno = s6000
guard.sparkno = s6003
sparkxy = 0,-5
hitsound = s0,3
guardsound = s0,10
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -2,0
air.type = High
air.velocity = -1,-2.5
airguard.velocity = -3,0
air.hittime = 20
getpower = 30,15
givepower = 0,0

[State 621, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 621, PlaySnd]
type = PlaySnd
trigger1 = anim = 621
trigger1 = !AnimElemTime(2)
value = s0,1

[State 621, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 601
movetype = I

[State 621, ChangeAnim]
type = ChangeAnim
trigger1 = movecontact = 1
trigger1 = numtarget
value = 601

;---------------------------------------------------------------------------
; Air Heavy Kick
[Statedef 630]
type = A
movetype = A
physics = A
ctrl = 0
anim = 630
poweradd = 0
sprpriority = 2

[State 630, HitDef]
type = HitDef
trigger1 = !time
attr = A, NA
damage = ceil(60*fvar(11)),0
animtype = Heavy
hitflag = MAF
guardflag = HA
pausetime = 12,12
sparkno = s6002
guard.sparkno = s6004
sparkxy = -10,-50
hitsound = s0,5
guardsound = s0,10
ground.type = High
ground.slidetime = 25
ground.hittime = 25
ground.velocity = -5,0
air.type = High
air.velocity = -2,-3
airguard.velocity = -4,0
air.hittime = 25
envshake.time = 10
envshake.ampl = 3
getpower = 30,15
givepower = 0,0

[State 630, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 630, PlaySnd]
type = PlaySnd
trigger1 = random < 500
trigger1 = !time
value = s240,0
channel = 0

[State 630, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = s0,2

[State 630, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
movetype = I

;---------------------------------------------------------------------------
; Alt Air Heavy Kick
[Statedef 631]
type = A
movetype = A
physics = A
ctrl = 0
anim = 631
poweradd = 0
sprpriority = 2

[State 631, HitDef]
type = HitDef
trigger1 = !time
attr = A, NA
damage = ceil(60*fvar(11)),0
animtype = Heavy
hitflag = MAF
guardflag = HA
pausetime = 12,12
sparkno = s6002
guard.sparkno = s6004
sparkxy = -10,-35
hitsound = s0,5
guardsound = s0,10
ground.type = High
ground.slidetime = 25
ground.hittime = 25
ground.velocity = -5,0
air.type = High
air.velocity = -3,-3
airguard.velocity = -4,0
air.hittime = 25
air.fall = 1
fall.recover = 0
yaccel = 0.5
envshake.time = 10
envshake.ampl = 3
getpower = 30,15
givepower = 0,0

[State 631, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 631, PlaySnd]
type = PlaySnd
trigger1 = random < 500
trigger1 = !time
value = s240,0
channel = 0

[State 631, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = s0,2

[State 631, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
movetype = I

;---------------------------------------------------------------------------
; Air Dash Punch
[Statedef 670]
type = A
movetype = A
physics = N
ctrl = 0
anim = 670
poweradd = 0
sprpriority = 2

[State 670, HitDef]
type = HitDef
trigger1 = !time
attr = A, NA
damage = ceil(30*fvar(11)),0
animtype = Light
hitflag = MAF
guardflag = MA
pausetime = 8,8
sparkno = s6000
guard.sparkno = s6003
sparkxy = -10,-60
hitsound = s0,3
guardsound = s0,10
ground.type = High
ground.slidetime = 23
ground.hittime = 23
ground.velocity = -2,0
air.type = High
air.velocity = -1,-2.5
airguard.velocity = -3,0
air.hittime = 23
getpower = 30,15
givepower = 0,0
ID = 670

[State 670, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 670, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s210,0
channel = 0

[State 670, PlaySnd]
type = PlaySnd
trigger1 = anim = 670
trigger1 = !AnimElemTime(2)
value = s0,0

[State 670, StateTypeSet]
type = StateTypeSet
trigger1 = Anim = 671
movetype = I

[State 670, ChangeAnim]
type = ChangeAnim
trigger1 = movecontact = 1
value = 671

[State 670, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0-8*(anim = 670 && var(6) = 1)
value = 111

;---------------------------------------------------------------------------
; Air Dash Punch Follow-up
[Statedef 672]
type = A
movetype = A
physics = N
ctrl = 0
anim = 672
poweradd = 0
sprpriority = 2

[State 672, HitDef]
type = HitDef
trigger1 = !time
attr = A, NA
damage = ceil(30*fvar(11)),0
animtype = Light
hitflag = MAF
guardflag = MA
pausetime = 8,8
sparkno = s6000
guard.sparkno = s6003
sparkxy = -10,-58
hitsound = s0,3
guardsound = s0,10
ground.type = High
ground.slidetime = 23
ground.hittime = 23
ground.velocity = -2,0
air.type = High
air.velocity = -1,-2.5
airguard.velocity = -3,0
air.hittime = 23
getpower = 30,15
givepower = 0,0

[State 672, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 672, PlaySnd]
type = PlaySnd
trigger1 = anim = 672
trigger1 = !AnimElemTime(2)
value = s0,0

[State 672, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 111

;---------------------------------------------------------------------------
; Air Dash Kick
[Statedef 674]
type = A
movetype = A
physics = N
ctrl = 0
anim = 674
poweradd = 0
sprpriority = 2

[State 674, HitDef]
type = HitDef
trigger1 = !time
attr = A, NA
damage = ceil(60*fvar(11)),0
animtype = Light
hitflag = MAF
guardflag = MA
pausetime = 8,8
sparkno = s6000
guard.sparkno = s6003
sparkxy = -10,-60
hitsound = s0,3
guardsound = s0,10
ground.type = High
ground.slidetime = 23
ground.hittime = 23
ground.velocity = -2,0
air.type = High
air.velocity = -1,-2.5
airguard.velocity = -3,0
air.hittime = 23
getpower = 30,15
givepower = 0,0

[State 674, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.95
ignorehitpause = 1
persistent = 0

[State 674, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s240,0
channel = 0

[State 674, PlaySnd]
type = PlaySnd
trigger1 = anim = 674
trigger1 = !AnimElemTime(2)
value = s0,1

[State 674, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 675
movetype = I

[State 674, ChangeAnim]
type = ChangeAnim
trigger1 = movecontact = 1
value = 675

[State 674, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0-8*(anim = 674 && var(6) = 1)
value = 111

;---------------------------------------------------------------------------
; Dodge
;---------------------------------------------------------------------------
; Recuperacion tras esquivar/rodar: sin control y golpeable unos frames,
; para que no se pueda encadenar sin riesgo.
;---------------------------------------------------------------------------
[Statedef 1003]
type = S
movetype = I
physics = S
ctrl = 0
anim = 0
velset = 0,0

[State 1003, Fin de la recuperacion]
type = ChangeState
trigger1 = Time >= 12
value = 0
ctrl = 1

[Statedef 700]
type = S
movetype = I
physics = S
velset = 0,0
ctrl = 0
anim = 700

[State 700, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 700, AfterImage]
type = AfterImage
trigger1 = !time
time = 5
length = 15
palbright = 0,0,0
palcontrast = 128,128,128
paladd = 0,0,0
palmul = 1,1,1
framegap = 3
trans = Add1

[State 700, PalFX]
type = PalFX
trigger1 = AnimElem = 2
time = 30
mul = 170,170,170

[State 700, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause = 1

[State 700, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s700,0

[State 700, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 1003
ctrl = 0

;---------------------------------------------------------------------------
; Air Dodge
[Statedef 701]
type = A
movetype = I
physics = A
ctrl = 0
anim = 701

[State 701, PlayerPush]
type = PlayerPush
trigger1 = AnimElemTime(4) < 0
value = 0
ignorehitpause = 1

[State 701, AfterImage]
type = AfterImage
trigger1 = !time
time = 22
length = 8
palbright = 0,0,0
palcontrast = 128,128,128
paladd = 0,0,0
palmul = 1,1,1
framegap = 3
trans = Add1

[State 701, PalFX]
type = PalFX
trigger1 = time < 22
time = 1
mul = 170,170,170

[State 701, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
ignorehitpause = 1

[State 701, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s700,0

[State 701, CtrlSet]
type = CtrlSet
trigger1 = AnimElemTime(4) >= 0
value = 1

;---------------------------------------------------------------------------
; Roll
[Statedef 710]
type = S
movetype = I
physics = N
velset = 0,0
ctrl = 0

[State 710, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 710+var(6)

[State 710, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 710, VelSet]
type = VelSet
trigger1 = !time
x = ifelse(anim = 710, 5.5, -5.5)

[State 710, AfterImage]
type = AfterImage
trigger1 = !time
time = 20
length = 8
palbright = 0,0,0
palcontrast = 128,128,128
paladd = 0,0,0
palmul = 1,1,1
framegap = 3
trans = Add1

[State 710, PalFX]
type = PalFX
trigger1 = !time
time = 20
mul = 170,170,170

[State 710, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause = 1

[State 710, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s710,0

[State 710, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 1003
ctrl = 0

;---------------------------------------------------------------------------
; Throw
[Statedef 800]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 800
sprpriority = 2
facep2 = 1

[State 800, HitDef]
type = HitDef
Trigger1 = !time
attr = S, NT
hitflag = M-
priority = 1, Miss
getpower = 60,30
p1facing = ifelse(command = "holdfwd", 1, -1)
p2facing = 1
p1stateno = 810
sparkno = -1
fall = 1
fall.recover = 0

[State 800, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0 
value = 0
ctrl = 1

;----------------------------------------------------------------------------------
; Got you!
[Statedef 810]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 810
sprpriority = 2

[State 810, Width]
type = Width
trigger1 = 1
edge = 72,0

[State 810, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s810,0

[State 810, TargetState]
type = TargetState
trigger1 = NumTarget && !time
value = 820

[State 810, Helper]
type = Helper
trigger1 = AnimElemTime(3) = 1
stateno = 7021
ID = 7021
pos = 60,0
postype = p1
ownpal = 1
ignorehitpause = 1

[State 810, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(3)
value = s210,0
channel = 0

[State 810, PlaySnd]
type = PlaySnd
trigger1 = AnimElemTime(3) = 1
value = s810,1

[State 810, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(3) = 1
time = 12
freq = 60
ampl = 6
ignorehitpause = 1

[State 810, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) = [0,3]
pos = 25,0
time = 1

[State 810, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) = [4,7]
pos = 45,0
time = 1

[State 810, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(1) >= 8 && AnimElemTime(2) < 0
pos = 20,4
time = 1

[State 810, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) = [0,1]
pos = -20,-60
time = 1

[State 810, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) = [2,3]
pos = -18,-66
time = 1

[State 810, TargetBind]
type = TargetBind
trigger1 = AnimElemTime(2) >= 4 && AnimElemTime(3) < 0
pos = -16,-70
time = 1

[State 810, TargetBind]
type = TargetBind
trigger1 = AnimElem = 3
pos = 32,-64
time = 1

[State 810, TargetState]
type = TargetState
trigger1 = AnimElemTime(3) = 1
value = 821

[State 810, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElemTime(3) = 1
value = -100
absolute = 1

[State 810, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; OW
[Statedef 820]
type = A
movetype = H
physics = N
velset = 0,0

[State 820, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0

[State 820, Width]
type = Width
trigger1 = 1
edge = 24,0

[State 820, ChangeAnim2]
type = ChangeAnim2
trigger1 = !time
value = 820

[State 820, Offset]
type = Offset
trigger1 = AnimElemNo(0) = 3
x = 0+const(size.mid.pos.x)
y = 0+const(size.mid.pos.y)

[State 820, AngleDraw]
type = AngleDraw
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(9) < 0
scale = 1,1

[State 820, AngleSet]
type = AngleSet
trigger1 = AnimElem = 6
value = 0

[State 820, AngleAdd]
type = AngleAdd
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
value = 24

[State 820, AngleMul]
type = AngleMul
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(9) < 0
value = 1.04-(0.08*(AnimElemTime(8)%2))

[State 820, SelfState]
type = SelfState
trigger1 = Time >= 120
value = 5050

;---------------------------------------------------------------------------
; OW
[Statedef 821]
type = L
movetype = H
physics = N
velset = -22,0

[State 821, Offset]
type = Offset
trigger1 = !time
x = 0+const(size.head.pos.x)
y = 0+const(size.head.pos.y)

[State 821, ChangeAnim]
type = ChangeAnim2
trigger1 = !time
value = 821
persistent = 0

[State 821, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 821, VelMul]
type = VelMul
trigger1 = Anim = 821
x = 0.80

[State 821, VelMul]
type = VelSet
trigger1 = AnimElemTime(1) = 16
x = 0

[State 821, Offset]
type = Offset
trigger1 = Anim = 821
trigger1 = AnimElemTime(2) < 0
x = 0+(random%(8-(AnimElemTime(1)/6)))*ifelse(random<500,-1,1)
y = 0-(random%4)

[State 821, SelfState]
type = SelfState
trigger1 = AnimTime = 0
value = ifelse(alive, 5120, 5150)

;---------------------------------------------------------------------------
; Power Charge
[Statedef 900]
type = S
movetype = I
physics = S
velset = 0,0
ctrl = 0
anim = 900

[State 900, Helper]
type = Helper
trigger1 = !time
helpertype = Normal
stateno = 910
ID = 910
pos = 0,0
postype = p1
ownpal = 1
ignorehitpause = 1

[State 900, PowerAdd]
type = PowerAdd
trigger1 = time >= 0
value = 7 + ifelse(time < 40, 0, (time-40) / 9)

[State 900, PalFX]
type = PalFX
trigger1 = 1
time = 1
add = 0,100 + ceil(sin(time / 6.0 * pi) * 100), 100 + ceil(sin(time / 6.0 * pi) * 100)

[State 900, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s3030,1
channel = 2

[State 900, ChangeState]
type = ChangeState
trigger1 = power >= powermax
value = 901
ctrl = 1

[State 900, ChangeState]
type = ChangeState
triggerall = !var(59)
trigger1 = command != "holdc"
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Full Power
[Statedef 901]
type = S
movetype = I
physics = S
velset = 0,0
anim = 901

[State 901, EnvShake]
type = EnvShake
trigger1 = !time
time = 10
freq = 100
ampl = -5
ignorehitpause = 1

[State 901, PalFX]
type = PalFX
triggerall = time <= 20
trigger1 = GameTime%3 = 0
time = 1
add = -64,160,160
color = 124
ignorehitpause = 1

[State 901, PalFX]
type = PalFX
triggerall = time <= 20
trigger1 = GameTime%3 = 1
time = 1
add = -60,70,70
color = 256
ignorehitpause = 1

[State 901, Explod]
type = Explod
trigger1 = !time
anim = 6014
ID = 6014
pos = 0,0
postype = p1
scale = .45,.45
sprpriority = 10
ownpal = 1

[State 901, Explod]
type = Explod
trigger1 = !time
anim = 6015
ID = 6014
pos = 0,0
postype = p1
scale = .45,.45
sprpriority = -10
ownpal = 1

[State 901, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s181,1
channel = 0

[State 901, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s901,2

[State 901, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Power Charge Helper
[Statedef 910]
ctrl = 0
anim = 99999

[State 910, BindToRoot]
type = BindToRoot
trigger1 = (root,stateno = 900)
pos = 0,0
ignorehitpause = 1

[State 910, Explod]
type = Explod
trigger1 = !time
anim = 6013
ID = 6013
pos = 0,0
postype = p1
removetime = -1
ownpal = 1
scale = .40,.40
sprpriority = 10
removeongethit = 1

[State 910, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s901,0
channel = 1

[State 910, ChangeState]
type = ChangeState
trigger1 = root,stateno != 900
value = 911

;---------------------------------------------------------------------------
; Power Charge Helper 2
[Statedef 911]
ctrl = 0
anim = 99999

[State 911, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(6013) > 0
ID = 6013

[State 911, Explod]
type = Explod
trigger1 = !time
anim = 60133
ID = 60133
pos = 0,0
postype = p1
ownpal = 1
scale = .40,.40
sprpriority = 10
removeongethit = 1

[State 911, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s901,1
channel = 1

[State 911, DestroySelf]
type = DestroySelf
trigger1 = time >= 2
ignorehitpause = 1