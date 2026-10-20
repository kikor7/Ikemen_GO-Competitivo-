;--- SPECIALS ---
;States 1500 - 2499
;Reserved for Special Attacks
;Examples, Ryu's Hadouken, Shoryuken, and Tatsumaki Senpukyaku.
;Examples, Mario's Fireball, Cape, Tornado Spin, Coin Uppercut

;---------------------------------------------------------------------------
; Power Wave
[Statedef 1000]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 1000
poweradd = 20
sprpriority = 2
facep2 = 1

[State 1000, VarSet]
type = VarSet
trigger1 = !time
var(0) = ifelse(command = "y", 1, 0)
ignorehitpause = 1

[State 1000, Helper]
type = Helper
trigger1 = AnimElem = 3
helpertype = Normal
stateno = 1001
ID = 1001
pos = 50,0
postype = p1
ownpal = 1
size.xscale = 0.5
size.yscale = 0.5
ignorehitpause = 1

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = s210,0
channel = 0

[State 1000, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Power Wave Projectile
[Statedef 1001]
type = A
movetype = A
physics = N
ctrl = 0
sprpriority = 3

[State 1001, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1001
value = 1001

[State 1001, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1001, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
stateno = 1002
time = -1
ignorehitpause = 1

[State 1001, HitBy]
type = HitBy
trigger1 = 1
value = SCA,SP,HP
time = -1
ignorehitpause = 1

[State 1001, VelSet]
type = VelSet
trigger1 = ishelper
trigger1 = !time
x = ifelse(root,var(0) = 1, 4.46927374302, 3.35195530726)

[State 1001, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s1001,0

[State 1001, HitDef]
type = HitDef
trigger1 = !time
attr = S, SP
damage = ceil(80*root,fvar(11)),20
animtype = Medium
hitflag = MAFD
guardflag = M
pausetime = 0,12
sparkno = s6001
guard.sparkno = s6003
sparkxy = -10,-10
hitsound = s0,4
guardsound = s0,10
ground.type = High
ground.slidetime = 23
ground.hittime = 23
ground.velocity = -6,0
down.velocity = -6,0
air.type = High
air.velocity = -3,-4
air.hittime = 23
air.fall = 1
fall.recover = 0
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
getpower = 30,15
givepower = 0,0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 1001, PowerAdd]
type = PowerAdd
trigger1 = movecontact = 1
trigger1 = numtarget
value = 0
ignorehitpause = 1

[State 1001, Damage Dampen]
type = ParentVarSet
trigger1 = movehit
fvar(10) = root,fvar(10)*0.925
ignorehitpause = 1
persistent = 0

[State 1001, ChangeState]
type = ChangeState
trigger1 = MoveContact || MoveReversed
value = 1002
ignorehitpause = 1

[State 1001, DestroySelf]
type = DestroySelf
trigger1 = FrontEdgeDist <= -100

;---------------------------------------------------------------------------
; Projectile Hit
[Statedef 1002]
type = A
movetype = I
physics = N
velset = 0,0
ctrl = 0
anim = 1002
sprpriority = 3

[State 1002, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1002, DestroySelf]
type = DestroySelf
trigger1 = !AnimTime
ignorehitpause = 1

;---------------------------------------------------------------------------
; Burn Knuckle
[Statedef 1010]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = 2
facep2 = 1

[State 1010, VarSet]
type = VarSet
trigger1 = !time
var(0) = ifelse(command = "y", 1, 0)
ignorehitpause = 1

[State 1010, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 1010+5 * var(0)

[State 1010, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 2
statetype = A

[State 1010, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = ifelse(var(0) = 1, 10, 8)
y = -4.5

[State 1010, VelAdd]
type = VelAdd
trigger1 = AnimElemNo(0) >= 2
y = .58

[State 1010, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 6025
ID = 6025
pos = 30,floor(-vel y)
postype = p1
ownpal = 1
scale = 0.275,0.225
sprpriority = 10

[State 1010, HitDef]
type = HitDef
trigger1 = !time
attr = A, SA
damage = ceil(120*fvar(11)),20
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
getpower = 60,30
givepower = 0,0

[State 1010, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.925
ignorehitpause = 1
persistent = 0

[State 1010, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = s240,0
channel = 0

[State 1010, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = s40,0

[State 1010, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = s1011,0

[State 1010, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y > -Vel Y
value = 1011
ctrl = 0

;---------------------------------------------------------------------------
; Landing
[Statedef 1011]
type = S
movetype = I
physics = S
velset = 0,0
ctrl = 0
anim = 1011

[State 1011, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s52,0

[State 1011, Explod]
type = Explod
trigger1 = !time
anim = 6022
sprpriority = -3
postype = p1
scale = 0.5,0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1011, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 1011, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Sonic Boom
[Statedef 1020]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 1020
poweradd = 20
sprpriority = 2
facep2 = 1

[State 1020, VarSet]
type = VarSet
trigger1 = !time
var(0) = ifelse(command = "y", 1, 0)
ignorehitpause = 1

[State 1020, Helper]
type = Helper
trigger1 = AnimElem = 3
helpertype = Normal
stateno = 1021
ID = 1021
pos = ceil(59*const(size.xscale)),ceil(-60*const(size.yscale))
postype = p1
ownpal = 1
size.xscale = 0.5
size.yscale = 0.5
ignorehitpause = 1

[State 1020, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = s210,0
channel = 0

[State 1020, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Sonic Boom Projectile
[Statedef 1021]
type = A
movetype = A
physics = N
ctrl = 0
sprpriority = 3

[State 1021, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1021
value = 1021

[State 1021, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1021, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
stateno = 1022
time = -1
ignorehitpause = 1

[State 1021, HitBy]
type = HitBy
trigger1 = 1
value = SCA,SP,HP
time = -1
ignorehitpause = 1

[State 1021, VelSet]
type = VelSet
trigger1 = ishelper
trigger1 = !time
x = ifelse(root,var(0) = 1, 5.25, 3.25)

[State 1021, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s1021,0

[State 1021, HitDef]
type = HitDef
trigger1 = !time
attr = S, SP
damage = ceil(80*root,fvar(11)),20
animtype = Medium
hitflag = MAF
guardflag = MA
pausetime = 0,12
sparkno = s6001
guard.sparkno = s6003
sparkxy = -10,0
hitsound = s0,4
guardsound = s0,10
ground.type = High
ground.slidetime = 23
ground.hittime = 23
ground.velocity = -6,0
air.type = High
air.velocity = -3,-4
air.hittime = 23
air.fall = 1
fall.recover = 0
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
getpower = 30,15
givepower = 0,0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 1021, PowerAdd]
type = PowerAdd
trigger1 = movecontact = 1
trigger1 = numtarget
value = 0
ignorehitpause = 1

[State 1021, Damage Dampen]
type = ParentVarSet
trigger1 = movehit
fvar(10) = root,fvar(10)*0.925
ignorehitpause = 1
persistent = 0

[State 1021, ChangeState]
type = ChangeState
trigger1 = MoveContact || MoveReversed
value = 1022
ignorehitpause = 1

[State 1021, DestroySelf]
type = DestroySelf
trigger1 = FrontEdgeDist <= -100

;---------------------------------------------------------------------------
; Projectile Hit
[Statedef 1022]
type = A
movetype = I
physics = N
velset = 0,0
ctrl = 0
anim = 1022
sprpriority = 3

[State 1022, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1022, DestroySelf]
type = DestroySelf
trigger1 = !AnimTime
ignorehitpause = 1

;---------------------------------------------------------------------------
; Somersault Kick Shell
[Statedef 1030]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 1030
poweradd = 0
sprpriority = 2
facep2 = 1

[State 1030, VarSet]
type = VarSet
trigger1 = !time
var(0) = ifelse(command = "b", 1, 0)
ignorehitpause = 1

[State 1030, PosAdd]
type = PosAdd
trigger1 = (AnimElemTime(2) = [0,5])
x = 5.0

[State 1030, VelSet]
type = VelSet
trigger1 = AnimElemTime(2) = 0
x = 1.0
y = ifelse(var(0) = 1, -9.333, -7.5)

[State 1030, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 2
statetype = A

[State 1030, Gravity]
type = Gravity
trigger1 = StateType = A

[State 1030, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
ignorehitpause = 1

[State 1030, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 6021
pos = -15,floor(-vel y)
postype = p1
ownpal = 1
scale = 0.4,0.4
sprpriority = 10

[State 1030, Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 1032
ID = 1032
pos = -30,0
postype = p1
ownpal = 1
scale = 0.4*const(size.xscale),0.4
bindtime = -1
sprpriority = 10
removeongethit = 1

[State 1030, HitDef]
type = HitDef
trigger1 = !time
attr = A, SA
damage = ceil(120*fvar(11)),20
animtype = Up
air.animtype = Back
hitflag = MAF
guardflag = M
pausetime = 12,12
sparkno = s6001
guard.sparkno = s6003
sparkxy = -10,-55
hitsound = s0,4
guardsound = s0,10
ground.type = High
ground.slidetime = 25
ground.hittime = 25
ground.velocity = -2,-7.5
guard.velocity = -10.0
air.type = High
air.velocity = -2,-7.5
air.hittime = 25
fall = 1
fall.recover = 0
yaccel = 0.5
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
getpower = 60,30
givepower = 0,0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 1030, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.925
ignorehitpause = 1
persistent = 0

[State 1030, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = s230,0
channel = 0

[State 1030, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = s1031,0

[State 1030, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 5
movetype = I

[State 1030, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y > -Vel Y
value = 1031
ctrl = 0

;---------------------------------------------------------------------------
; Landing
[Statedef 1031]
type = S
movetype = I
physics = S
velset = 0,0
ctrl = 0
anim = 1031

[State 1031, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s52,0

[State 1031, Explod]
type = Explod
trigger1 = !time
anim = 6022
sprpriority = -3
postype = p1
scale = 0.5,0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1031, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 1031, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Marine Dive
[Statedef 1040]
type = A
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 1040
poweradd = 0
sprpriority = 2

[State 1040, VarSet]
type = VarSet
trigger1 = !time
var(0) = ifelse(command = "b", 1, 0)
ignorehitpause = 1

[State 1040, Helper]
type = Helper
trigger1 = AnimElem = 2
helpertype = Normal
stateno = 1050
ID = 1050
pos = -11,-74
postype = p1
ownpal = 1
ignorehitpause = 1

[State 1040, Helper]
type = Helper
trigger1 = AnimElem = 2
helpertype = Normal
stateno = 1051
ID = 1051
pos = -11,-74
postype = p1
ownpal = 1
ignorehitpause = 1

[State 1040, VelAdd]
type = VelAdd
trigger1 = AnimElem = 2
x = ifelse(var(0) = 1, 12, 10)
y = 8

[State 1040, HitDef]
type = HitDef
trigger1 = !time
attr = A, SA
damage = ceil(120*fvar(11)),20
animtype = Heavy
hitflag = MAF
guardflag = HA
pausetime = 12,12
sparkno = s6002
guard.sparkno = s6004
sparkxy = -10,-30
hitsound = s0,5
guardsound = s0,10
ground.type = High
ground.slidetime = 33
ground.hittime = 33
ground.velocity = -3,-5
guard.velocity = -6.0
air.type = High
air.velocity = -3,-5
air.hittime = 33
fall = 1
fall.recover = 0
yaccel = 0.5
envshake.time = 14
envshake.ampl = 8
getpower = 60,30
givepower = 0,0

[State 1040, Damage Dampen]
type = VarSet
trigger1 = movehit
fvar(10) = fvar(10)*0.925
ignorehitpause = 1
persistent = 0

[State 1040, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s1040,0
channel = 0

[State 1040, PlaySnd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = s1041,0

[State 1040, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1041

[State 1040, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y > -Vel Y
value = 1042
ctrl = 0

;---------------------------------------------------------------------------
; Hop Back
[Statedef 1041]
type = A
movetype = I
physics = A
velset = -4,-4
ctrl = 0
anim = 1041
movehitpersist = 1

[State 1041, CtrlSet]
type = CtrlSet
trigger1 = time = 8
value = (movehit && !movereversed)

[State 1041, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y > -Vel Y
value = 1042
ctrl = 0

;---------------------------------------------------------------------------
; Landing
[Statedef 1042]
type = S
movetype = I
physics = S
velset = 0,0
ctrl = 0
anim = 1042

[State 1042, PlaySnd]
type = PlaySnd
trigger1 = !time
value = s52,0

[State 1042, Explod]
type = Explod
trigger1 = !time
anim = 6022
sprpriority = -3
postype = p1
scale = 0.5,0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1042, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 1042, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Marine Dive Helper
[Statedef 1050]
ctrl = 0
anim = 6026
sprpriority = 5

[State 1050, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1050, Trans]
type = Trans
trigger1 = 1
trans = Add

[State 1050, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 1,1
value = 40
ignorehitpause = 1

[State 1050, DestroySelf]
type = DestroySelf
trigger1 = !AnimTime
ignorehitpause = 1

;---------------------------------------------------------------------------
; Marine Dive Helper 2
[Statedef 1051]
ctrl = 0
anim = 6024
sprpriority = 5

[State 1051, VarSet]
type = VarSet
trigger1 = time = 0
fv = 1
value = 1.00
ignorehitpause = 1
persistent = 0

[State 1051, VarAdd]
type = VarAdd
trigger1 = time > 0
fv = 1
value = 0.20
ignorehitpause = 1

[State 1051, VarSet]
type = VarSet
trigger1 = time = 0
v = 16
value = 192
ignorehitpause = 1
persistent = 0

[State 1051, VarAdd]
type = VarAdd
trigger1 = time >= 4
v = 16
value = -24
ignorehitpause = 1

[State 1051, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1051, Trans]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 64+var(16),256

[State 1051, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 0.06*fvar(1),0.36*fvar(1)
value = -50
ignorehitpause = 1

[State 1051, DestroySelf]
type = DestroySelf
trigger1 = time >= 12
ignorehitpause = 1