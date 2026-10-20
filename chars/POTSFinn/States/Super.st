; _________________________________________
;| Character by JStudios2k/John Anonymous, Edited from Doug1105                |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SUPER MOVES>========================================
;==============================================================================================

;---------------------------------------------------------------------------
;Bravest Warrior
[Statedef 3000]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=ifelse(var(53),0,-1000)
facep2=1

[State not angery]
type=VarSet
trigger1=!time
var(41)=2

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3000

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 3000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 0
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 0 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, Superpause FX]
type = helper
trigger1 = Time = 0
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = -2, -75
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = Time = 0
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1100, DustExplod]
type = Explod
trigger1 = animelemtime(7) >= 0 && !(time % 2)
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

[State 3311, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1,14

[State 0, PosAdd]
type = PosAdd
trigger1 = animelemtime(7) = 0
x = 11

[State 3310, Velocity]
type = VelSet
trigger1 = AnimElem = 7
x = 8

[State 3310, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 = !time
attr = S, HA
damage = ceil(ifElse(fvar(11) * 0 < 0, 0, fvar(11) * 0)), 0
hitflag = MAF
guardflag = M
priority = 7, Hit
pauseTime = 0,1
guard.pauseTime = 11,1
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -63
getpower = 30,15
givepower = 24,24
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -1.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 0
air.fall = 1
fall.recover = 0
air.recover = 0
forcestand = 1
ID = 3010
envshake.time = 5
envshake.ampl = 2
kill = 0

[State 3310,1]
type = TargetBind
trigger1 = time > 1 && numtarget && movehit
pos = 40, 0
postype = P1
time = -1
id = 3010

[State 3310, 2]
type = ChangeState
trigger1 = time > 1 && numtarget && movehit
value = 3001
persistent = 0

[State 3310, FAIL]
type = ChangeState
triggerall = AnimElemTime(4) > 0
trigger1 = AnimTime = 0
trigger2 = Frontedgebodydist <= 0
trigger3 = P2statetype = L
trigger3 = P2BodyDist X <= 10
trigger4 = moveguarded
value = 3009
ctrl = 1

;HERE WE GO
[Statedef 3001]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3002

[State 3311, Dust]
type = helper
trigger1 = animelem = 1
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3311, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 5,7
channel = 0

[State 3311, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 40,0

[State 3311, 0]
type = TargetFacing
trigger1 = time = 0
value = -1

[State 3311, Throw]
type = TargetState
trigger1 = time = 0
value = 3010

[State 3311,1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 55, -63
postype = P1
time = -1
id = 3010

[State 3311, SLAM!]
type = ChangeState
trigger1 = FrontEdgeBodyDist <= 10
value = 3003

[State 3311, KEEP GOING]
type = ChangeState
trigger1 = Pos Y >= 0 && Time > 5
value = 3002

;nyooOOOm
[Statedef 3002]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3002
sprpriority = 0

[State 3312, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 100,2
channel = 4

[State 3312, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 52,0
channel = 5

[State 3312, Explod]
type = Explod
trigger1 = time =0
anim = 3005
ID = 3005
pos = 55,-65
postype = p1
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3312, Explod]
type = Explod
trigger1 = time =0
anim = 8104
ID = 8104
pos = -15,-5
postype = p1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3312, Velocity]
type = VelSet
trigger1 = Time = 0
x = 16

[State 3312,1]
type = TargetBind
trigger1 = time%10=0
pos = 55, -65
postype = P1
time = -1
id = 3010

[State 3312,1]
type = TargetBind
trigger1 = time%10=5
pos = 52, -65
postype = P1
time = -1
id = 3010

[State 3312, DEAD]
type = ChangeState
trigger1 = FrontEdgeBodyDist <= 10
trigger2 = Time = 150
value = 3003

;DEAD
[Statedef 3003]
type = S
movetype = A
physics = S
juggle = ifelse(target,gethitvar(fall),0,0)
velset = 0,0
ctrl = 0
anim = 3003

[State 0, Balance addition]
type = VarAdd
trigger1 = !time
var(27) = 30000

[State 3313, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id =  6100

[State 3313, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id =  3005

[State 3313, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id =  8104

[State 3313, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,17

[State 3313, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 2,22

[State 3313, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 5,8+random%2
channel = 0

[State 3313, Effect]
type = PlaySnd
trigger1 = AnimElemTime(2) = 8
value = 1,18

[State 3313, Effect]
type = PlaySnd
trigger1 = AnimElemTime(2) = 8
value = 2,3000

[State 3011, Effect]
Type = Explod
Trigger1 = AnimElemTime(2) = 0
Anim = 3006
ID = 7210
Pos = FrontEdgeBodyDist,0
PosType = P1
BindTime = 1
ReMoveTime = -2
Scale = 0.7, 0.7
SprPriority = 5
OwnPal = 1

[State 3313, Position]
type = PosSet
trigger1 = time = 0
y = 0

[State 3313, width]
type = width
trigger1 = animelem = 1
edge = 40,0

[State 3313, width]
type = width
trigger1 = animelem = 2
edge = 75,0

[State 3313, width]
type = width
trigger1 = animelem = 3
edge = 90,0

[State 3313,1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 55, -65
Time = -1
postype = P1
id = 3010

[State 3313,1]
type = TargetBind
trigger1 = AnimElem = 2
pos = 50, -65
Time = -1
postype = P1
ignorehitpause=1
id = 3010

[State 3313, EnvShake]
type = EnvShake
trigger1 = AnimElem = 2
time = 25

[State 3313, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = AnimElem = 2
attr = S, HA
hitflag = MAF
guardflag = M
damage = Ifelse(enemy,gethitvar(hitcount) > 6,100,180)
getpower = 30,15
givepower = 24,24
snap = 95,0
priority = 7,Hit
pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 8)
guard.pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 8)
hitSound = -1 + 0 * (var(31) := 1001)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -66
guard.dist = 0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 0
chainID = 3010

[State 3313, ChangeState]
type = ChangeState
Trigger1 = AnimTime = 0
value = 3004
ctrl = 1

;Ending
[StateDef 3004]
type = A
physics = N
moveType = I
velSet = 0,0
anim = 3004
ctrl = 0
sprPriority = 1

[State 105, Back Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 105,0

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 105, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = const(velocity.run.back.x)/2
y = const(velocity.run.back.y)

[State 105, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.65

[State 105, End]
type = ChangeState
trigger1 = AnimElemTime(2) >= 0
trigger1 = pos y > -vel y
value = 106

;YOU FAIL AT Bravest Warrior
[Statedef 3009]
type = S
movetype = I
physics = S
anim = 3009
poweradd = 0
ctrl = 0
facep2 = 0

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id =  6100

[State 1215, Dust Helper]
type = Helper
trigger1 = time = 0
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
pos = 15,-5
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1215, Velocity]
type = VelSet
trigger1 = AnimElemTime(1)>=1
trigger1 = AnimElemTime(3)<= 0
x = ifelse(var(10)=2, 2.75, ifelse(var(10)=1, 2.25, 1.75))

[State 1215, Velocity]
type = VelSet
trigger1 = AnimElemTime(3)>=1
trigger1 = AnimElemTime(4)<= 3
x = ifelse(var(10)=2, 1.75, ifelse(var(10)=1, 1.25, 0.75))

[State 1000, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;OUCH!
[Statedef 3010]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0
sprpriority = 2

[State 1, Ex Flash]
type = palfx
trigger1 = !(gametime%3)
time = 2
add = 170,0,0
color = 32
mul = 512,256,128
sinadd = 80,25,0,8
ignorehitpause = 1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 1510,1]
type = changeanim2
trigger1 = time = 0
value = 3010

;---------------------------------------------------------------------------
;MAX Bravest Warrior
[StateDef 3050]
type=S
movetype=A
physics=N
poweradd=ifelse(var(53),-1000,-2000)
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State not angery]
type=VarSet
trigger1=!time
var(41)=2

[State 3050, Anim]
type=changeanim
trigger1=!time
value=3000

[state 3050,Posset]
type=posset
trigger1=!time
y=0

[State 3050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 3050, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3050, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3050, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3050, Corner Push]
type = VarSet
trigger1 = Time = 0
fvar(5) = 0

[State 3050, Unguardable]
type = VarSet
trigger1 = Time = 0 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3050, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3050, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 0
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -2, -75
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time =0
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1100, DustExplod]
type = Explod
trigger1 = animelemtime(7) >= 0 && !(time % 2)
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

[State 3311, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1,14
[State 3311, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1,15

[State 0, PosAdd]
type = PosAdd
trigger1 = animelemtime(7) = 0
x = 11

[State 3310, Velocity]
type = VelSet
trigger1 = AnimElem = 7
x = 14.5

[State 3310, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 = !time
attr = S, HA
damage = ceil(ifElse(fvar(11) * 0 < 0, 0, fvar(11) * 0)), 0
hitflag = MAF
guardflag = M
priority = 7, Hit
pauseTime = 0,1
guard.pauseTime = 11,1
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -63
getpower = 20,10
givepower = 24,24
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -1.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 0
air.fall = 1
fall.recover = 0
air.recover = 0
forcestand = 1
ID = 3010
envshake.time = 5
envshake.ampl = 2
kill = 0

[State 3310,1]
type = TargetBind
trigger1 = time > 1 && numtarget && movehit
pos = 40, 0
postype = P1
time = -1
id = 3010

[State 3310, 2]
type = ChangeState
trigger1 = time > 1 && numtarget && movehit
value = 3051
persistent = 0

[State 3310, FAIL]
type = ChangeState
triggerall = AnimElemTime(4) > 0
trigger1 = AnimTime = 0
trigger2 = Frontedgebodydist <= 0
trigger3 = P2statetype = L
trigger3 = P2BodyDist X <= 10
trigger4 = moveguarded
value = 3009
ctrl = 1

;HERE WE GO
[Statedef 3051]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3002

[State 3311, Dust]
type = helper
trigger1 = animelem = 1
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3311, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 40,0

[State 3311, 0]
type = TargetFacing
trigger1 = time = 0
value = -1

[State 3311, Throw]
type = TargetState
trigger1 = time = 0
value = 3010

[State 3311,1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 55, -63
postype = P1
time = -1
id = 3010

[State 3311, SLAM!]
type = ChangeState
trigger1 = FrontEdgeBodyDist <= 10
value = 3053

[State 3311, KEEP GOING]
type = ChangeState
trigger1 = Pos Y >= 0 && Time > 5
value = 3052

;nyooOOOm
[Statedef 3052]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3002
sprpriority = 0

[State 3312, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 100,2
channel = 4

[State 3312, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 52,0
channel = 5

[State 3312, Explod]
type = Explod
trigger1 = time =0
anim = 3005
ID = 3005
pos = 55,-65
postype = p1
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3312, Explod]
type = Explod
trigger1 = time =0
anim = 8104
ID = 8104
pos = -15,-5
postype = p1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3312, Velocity]
type = VelSet
trigger1 = Time = 0
x = 16

[State 3312,1]
type = TargetBind
trigger1 = time%10=0
pos = 55, -65
postype = P1
time = -1
id = 3010

[State 3312,1]
type = TargetBind
trigger1 = time%10=5
pos = 52, -65
postype = P1
time = -1
id = 3010

[State 3312, DEAD]
type = ChangeState
trigger1 = FrontEdgeBodyDist <= 10
trigger2 = Time = 150
value = 3053

;DEAD
[Statedef 3053]
type = S
movetype = A
physics = S
juggle = ifelse(target,gethitvar(fall),0,0)
velset = 0,0
ctrl = 0
anim = 3003

[State 0, Balance addition]
type = VarAdd
trigger1 = !time
var(27) = 20000

[State 3313, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id =  6100

[State 3313, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id =  3005

[State 3313, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id =  8104

[State 3313, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 2,22

[State 3313, Effect]
type = PlaySnd
trigger1 = AnimElemTime(2) = 8
value = 1,18

[State 3313, Position]
type = PosSet
trigger1 = time = 0
y = 0

[State 3313, width]
type = width
trigger1 = animelem = 1
edge = 40,0

[State 3313, width]
type = width
trigger1 = animelem = 2
edge = 75,0

[State 3313, width]
type = width
trigger1 = animelem = 3
edge = 90,0

[State 3313,1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 55, -65
Time = -1
postype = P1
id = 3010

[State 3313, EnvShake]
type = EnvShake
trigger1 = AnimElem = 2
time = 25

[State 3313, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = AnimElem = 2
attr = S, HA
hitflag = MAF
guardflag = M
damage = Ifelse(enemy,gethitvar(hitcount) > 6,100,180)
getpower = 20,10
givepower = 24,24
snap = 95,0
priority = 7,Hit
pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 8)
guard.pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 8)
hitSound = -1 + 0 * (var(31) := 1001)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -66
guard.dist = 0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 0
ID = 3010

[State of NO ESCAPE]
type = TargetState
trigger1 = MoveHit && NumTarget(3010)
trigger1 = !(target(3010),ishelper)
value = 3060
ignorehitpause = 1
persistent = 0

[State 3313, ChangeState]
type = ChangeState
Trigger1 = AnimTime = 0
value = 3054

;Jump
[Statedef 3054]
type    = A
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3054
poweradd = 0
sprpriority = 1
facep2 = 0

[State 3054, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 41, 0

[State 3054, Vel]
type = VelSet
trigger1 = Anim = 3054
x = P2Dist X / ((14 + ((14 ** 2) -(4 * 0.15 * (EnemyNear(0), Const(Size.Height)))) ** 0.5) / 0.75)
y = -14
persistent = 0

[State 3054, Velocity]
type = Turn
trigger1 = Anim = 3054 && Vel X < 0
persistent = 0

[State 3054, Velocity]
type = VelSet
trigger1 = Anim = 3054 && Vel X > 10
x = 10

[State 3054, Velocity]
type = VelSet
trigger1 = Anim = 3054 && Vel X < 0
x = 0

[State 3054, Accel]
type = VelAdd
trigger1 = 1
y = 1.1

[State 3054, ScreenBound]
type = ScreenBound
trigger1 = 1 
value = 1
movecamera = 1,0

[State 3054, ChangeState]
type = ChangeState
trigger1 = Pos Y > -Vel Y;Vel Y > 0 && Pos Y >= -Ceil(Vel Y)
value = 3055

; DEADER
[Statedef 3055]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3055
poweradd = 0
sprpriority = 1
facep2 = 0

[State 3313, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = AnimElem = 1
attr = S, HA
hitflag = MAF
guardflag = M
damage = Ifelse(enemy,gethitvar(hitcount) > 6,75,145)
getpower = 20,10
givepower = 24,24
snap = 95,0
priority = 7,Hit
pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 8)
guard.pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 8)
hitSound = -1 + 0 * (var(31) := 1001)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -66
guard.dist = 0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 0
chainID = 3010
envshake.time = 16
envshake.ampl = -12
envshake.freq = 255

[State Muteki]
type = NotHitBy
trigger1 = NumTarget(3010) || AnimElemTime(2) < 0
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time = 1

[State Grounded]
type = PosSet
trigger1 = !Time
Y = 0

[State 3313, Effect]
type = PlaySnd
trigger1 = !Time
value = 1,17

[State 3313, Effect]
type = PlaySnd
trigger1 = !Time
value = 2,22

[State 3313, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 5,8+random%2
channel = 0

[State 3313, Effect]
type = PlaySnd
trigger1 = !Time
value = 1,18

[State 3313, Effect]
type = PlaySnd
trigger1 = !Time
value = 2,3000

[State 3011, Effect]
Type = Explod
Trigger1 = !Time
Anim = 3006
ID = 7210
Pos = FrontEdgeBodyDist,0
PosType = P1
BindTime = 1
ReMoveTime = -2
Scale = 0.7, 0.7
SprPriority = 5
OwnPal = 1

[State 3313, Position]
type = PosSet
trigger1 = time = 0
y = 0

[State 3152, TargetBind]
type = TargetBind
trigger1 = !Time && NumTarget(3010)
time = 1
pos = 0,0

[State 3152, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
movetype = I

[State 3152, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3004
ctrl = 1

;Super Target Custom 2
[Statedef 3060]
type=S
movetype=H
physics=N
ctrl=0
velset=0,0
sprpriority=0
facep2=1

[State 3021, Remove Explods]
type=RemoveExplod
trigger1=IsHelper
[State 3321, Destroy Helpers]
type=DestroySelf
trigger1=IsHelper
[State 3021, VelSet]
type = VelSet
trigger1 =!time 
x = -1
[State 3021, VelMul]
type = VelMul
trigger1 = 1
x = .5
[State 3021, VelSet]
type = VelSet
trigger1 =time>12
x = 0

[State 3021, HitBy]
type=HitBy
trigger1=1
value=SA,HA,HP
time=1
ignorehitpause =1

[State 3021, HitFallSet]
type=HitFallSet
trigger1=1
value=0
[State 3021, PosSet]
type=PosSet
trigger1=!time
y=0
[State 3021, Width]
type = Width
trigger1 = 1
edge = 0,10
[State 3021, ChangeAnim]
type=ChangeAnim2
trigger1=!time
value=3060

[State 3021, SelfState]
type=SelfState
trigger1=!animtime
value=0
ctrl=1

;---------------------------------------------------------------------------
;Sky High Swordsman
[Statedef 3100]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=ifelse(var(53),0,-1000)
facep2=1

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State not angery]
type=VarSet
trigger1=!time
var(41)=2

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3000, Anim]
type=changeanim
trigger1=!time
value=ifElse(var(10) = 0, 3100, ifElse(var(10) = 1, 3110, 3120))

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 0
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 0 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, Superpause FX]
type = helper
trigger1 = Time = 0
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 75, -60
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = Time = 0
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 620, Snd]
type=playsnd
trigger1= animelem=7
value=5,40
channel=0

[State 620, Snd]
type=playsnd
trigger1= animelem=7
value=1,5
channel=1
[State 620, Snd]
type=playsnd
trigger1= animelem=11
value=1,10
channel=1
[State 620, Snd]
type=playsnd
trigger1= animelem=16
value=1,11
channel=1

[State 3100, StateTypeSet]
type = StateTypeSet
trigger1 =animelem=11
statetype = A   

[State 3100]
type = Velset
triggerall = var(10) < 2
trigger1 = AnimElem = 6
x = 4

[State 3100]
type = VelSet
triggerall = var(10)>=1
trigger1 = AnimElem = 11
y = -4.86

[State 3100]
type = VelAdd
triggerall = var(10)=1
trigger1 = AnimElem = 11,> 2
y = 0.6

[State 3110, StateTypeSet]
type = StateTypeSet
triggerall = var(10)=2
trigger1 =animelem=6
statetype = A   

[State 3110]
type = Velset
triggerall = var(10)=2
trigger1 = AnimElem = 6
x = 8

[State 0, Width]
type = Width
trigger1 = animelemtime(13)>0
value = 20,-9
ignorehitpause = 1
;persistent = 

[State 3100, Hit]
type=HitDef
triggerall = var(10) != 2
trigger1 = time = 0
id=3100
attr=A, HA
damage=28,6
priority=4, hit
animtype=Hard
getpower = 8,4
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2,5
guardsound=S3,0
pauseTime=9,12
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8014)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-56
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = -2
guard.velocity = -9
air.velocity = -4,-7
airguard.velocity = -5,-4
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
air.fall=1
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3110, Hit]
type=HitDef
triggerall = var(10) = 2
trigger1 = time = 0
id=3100
attr=A, HA
damage=28,6
priority=4, hit
animtype=Hard
getpower = 8,4
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2,5
guardsound=S3,0
pauseTime=9,12
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8014)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-56
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = -1,-6
guard.velocity = -9
air.velocity = -1,-6
airguard.velocity = -5,-4
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
fall = 0
air.fall=1
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3110, Hit]
type=HitDef
;triggerall = var(10)=1
trigger1 = time = 50
id=3100
attr=A, HA
damage=28,6
priority=4, hit
animtype=Hard
getpower = 8,4
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2,9
guardsound=S3,0
pauseTime=9,14
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8017)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-54
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = -1,-6
guard.velocity = -9
air.velocity = -1,-6
airguard.velocity = -5,-4
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
fall = 1
air.fall=1
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3110, Hit]
type=HitDef
;triggerall = var(10)=1
trigger1 = time = 69
id=3100
attr=A, HA
damage=28,6
priority=4, hit
animtype=Hard
getpower = 8,4
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2,9
guardsound=S3,0
pauseTime=9,14
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8014)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-52
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = -1,-9
guard.velocity = -9
air.velocity = -1,-9
airguard.velocity = -5,-4
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.56
fall = 1
air.fall=1
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 15
x = ifelse(var(10)>=1, 6.6, 3.8)
y = ifelse(var(10)>=1, -6.9, -5)

[State 3110]
type = VelAdd
trigger1 = AnimElemTime(18) >= 2
y = 1.2

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=3101

;Transition to UPPERCUT!
[Statedef 3101]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 3101
ctrl = 0
sprpriority = 2

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3102]
type = PlaySnd
trigger1 = Animelem = 5
value = s3100,1
channel=0

[State 3100, Voice]
type=PlaySnd
trigger1 =animelem=4
value=1,11
channel=1

[State 3102]
type = PlaySnd
trigger1 = AnimElem = 5
value = s1100,1
channel=2

[State 3102]
type = PosAdd
triggerall = var(10)=0
trigger1 = AnimElem = 2
x = 10

[State 3102]
type = PosAdd
triggerall = var(10)>=1
trigger1 = AnimElem = 2
x = 30

[State 0, Width]
type = Width
trigger1 = animelemtime(3)>0
value = 30,-9
ignorehitpause = 1
;persistent = 

[State 3100, Hit]
type=HitDef
triggerall = var(10)=0
trigger1 = animelem = 4
id=3100
attr=A, HA
damage=28,6
priority=4, hit
animtype=Hard
getpower = 8,4
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2+10*var(44),5
guardsound=S3,0
pauseTime=3,3
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8014)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-70
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = 0
guard.velocity = -7
air.velocity = -2,-7
airguard.velocity = -5,-4
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
air.fall=1
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3100, Hit]
type=HitDef
triggerall = var(10)>=1
trigger1 = animelem = 4
id=3100
attr=A, HA
damage=28,6
priority=4, hit
animtype=Hard
getpower = 8,4
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2+10*var(44),5
guardsound=S3,0
pauseTime=3,3
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8014)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-70
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = 0
guard.velocity = -7
air.velocity = -2,-6
airguard.velocity = -5,-4
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
air.fall=1
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3100, Hit]
type=HitDef
triggerall = var(10)=0
trigger1 = animelem = 5
id=3100
attr=A, HA
damage=28,6
priority=4, hit
animtype=Hard
getpower = 8,4
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2+10*var(44),5
guardsound=S3,0
pauseTime=3,3
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8014)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-88
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = 0,-8
guard.velocity = -7
air.velocity = 0,-8
fall = 1
air.fall = 1
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3100, Hit]
type=HitDef
triggerall = var(10)>=1
trigger1 = animelem = 5
id=3100
attr=A, HA
damage=28,6
priority=4, hit
animtype=Hard
getpower = 8,4
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2+10*var(44),5
guardsound=S3,0
pauseTime=3,3
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8014)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-88
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = 0,-7
guard.velocity = -7
air.velocity = 0,-7
fall = 1
air.fall = 1
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3102]
type = ChangeState
trigger1 = !AnimTime
value = 3102

;U P P E R C U T !
[Statedef 3102]
type    = A
movetype= A
physics = N
velset = 3,-11.6
anim = 3102

[State 620, Snd]
type=playsnd
trigger1= animelem=1
value=1,13
channel=1
[State 620, Snd]
type=playsnd
trigger1= animelem=1
value=41,0

[State 0, Width]
type = Width
trigger1 = animelemtime(1) >= 0 && animelemtime(12) < 0
value = 50,-9
ignorehitpause = 1
;persistent = 

[State 3103, 1]
type = VelAdd
trigger1 = 1
y = .45

[State 3100, Hit]
type=HitDef
triggerall = var(10)=0
trigger1 = Animelem = 2
trigger2 = Animelem = 4
trigger3 = Animelem = 6
trigger4 = Animelem = 8
trigger5 = Animelem = 10
id=3100
attr=A, HA
damage=8,6
priority=4, hit
animtype=Hard
getpower = 8,4
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2,9
guardsound=S3,0
pauseTime=3,2
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8017)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-76
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = -3,-8.6
guard.velocity = -7
air.velocity = -3,-8
airguard.velocity = -5,-4
fall = 1
air.fall = 1
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3100, Hit]
type=HitDef
triggerall = var(10)>=1
trigger1 = Animelem = 2
trigger2 = Animelem = 4
trigger3 = Animelem = 6
trigger4 = Animelem = 8
trigger5 = Animelem = 10
id=3100
attr=A, HA
damage=8,6
priority=4, hit
animtype=Hard
getpower = 8,4
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2,9
guardsound=S3,0
pauseTime=3,2
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8017)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-76
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = -3,-4
guard.velocity = -7
air.velocity = -3,-4
airguard.velocity = -5,-4
fall = 1
air.fall = 1
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3100, Hit]
type=HitDef
trigger1 = Animelem = 11
id=3100
attr=A, HA
damage=8,6
priority=4, hit
animtype=Hard
getpower = 8,4
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2,3000
guardsound=S3,0
pauseTime=28,30
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8014)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-80
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = -2.8,-5
guard.velocity = -7
air.velocity = -2.8,-5
airguard.velocity = -5,-4
fall = 1
air.fall = 1
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3103, 4]
type = VelSet
trigger1 = Animelem = 11
x = 0.8

[State 3103, 5]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 244

;---------------------------------------------------------------------------
;MAX Sky High Swordsman
[StateDef 3150]
type=S
movetype=A
physics=N
poweradd=ifelse(var(53),-1000,-2000)
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State not angery]
type=VarSet
trigger1=!time
var(41)=2

[State 3050, Anim]
type=changeanim
trigger1=!time
value=3120

[state 3050,Posset]
type=posset
trigger1=!time
y=0

[State 3050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 3050, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3050, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3050, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3050, Corner Push]
type = VarSet
trigger1 = Time = 0
fvar(5) = 0

[State 3050, Unguardable]
type = VarSet
trigger1 = Time = 0 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3050, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3050, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 0
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 75, -60
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time =0
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 620, Snd]
type=playsnd
trigger1= animelem=1
value=5,41
channel=0

[State 620, Snd]
type=playsnd
trigger1= animelem=7
value=1,5
channel=1
[State 620, Snd]
type=playsnd
trigger1= animelem=11
value=1,10
channel=1
[State 620, Snd]
type=playsnd
trigger1= animelem=16
value=1,11
channel=1

[State 3150, NotHitBy]
type=NotHitBy
trigger1=AnimElemTime(9) < 0
time=1
value=SCA

[State 3150, Dust Helper]
type = Helper
trigger1 = animelem=6
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3150, StateTypeSet]
type = StateTypeSet
trigger1 =animelem=11
statetype = A  

[State 3150]
type = VelSet
trigger1 = AnimElem = 6
x = 6.7

[State 3150]
type = Velset
trigger1 = AnimElem = 11
x = 6.6
y = -4.2

[State 3150]
type = VelAdd
trigger1 = AnimElemTime(18) >= 2
y = 1.2

[State 0, Width]
type = Width
trigger1 = animelemtime(13)>0
value = 20,-9
ignorehitpause = 1

[State 3110, Hit]
type=HitDef
trigger1 = time = 0
;trigger2 = time = 53
id=3100
attr=A, HA
damage=28,6
priority=4, hit
animtype=Hard
getpower = 12,6
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2,5
guardsound=S3,0
pauseTime=7,7
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8014)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-56
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = -1,-8
guard.velocity = -9
air.velocity = -1,-8
airguard.velocity = -5,-4
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
fall = 0
air.fall=1
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3110, Hit]
type=HitDef
trigger1 = time = 53
id=3100
attr=A, HA
damage=28,6
priority=4, hit
animtype=Hard
getpower = 12,6
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2,9
guardsound=S3,0
pauseTime=7,7
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8017)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-56
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = -1,-8
guard.velocity = -9
air.velocity = -1,-8
airguard.velocity = -5,-4
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
fall = 0
air.fall=1
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3110, Hit]
type=HitDef
trigger1 = time = 70
id=3100
attr=A, HA
damage=28,6
priority=4, hit
animtype=Hard
getpower = 12,6
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2,9
guardsound=S3,0
pauseTime=9,14
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8017)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-72
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = -2,-9
guard.velocity = -9
air.velocity = -2,-9
airguard.velocity = -5,-4
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
fall = 1
air.fall=1
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3150]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= -2
value = 3151
ctrl = 0

;Transition to UPPERCUT!
[Statedef 3151]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 3151
ctrl = 0
sprpriority = 2

[State 3151]
type = VelSet
trigger1 = AnimElem = 1
x = 0
y = 0

[State 3151]
type = PosSet
trigger1 = AnimElem = 1
y = 0

[State 3151]
type = ChangeState
trigger1 = !AnimTime
value = 3152
ctrl = 0

; >:)
[Statedef 3152]
type    = S
movetype= A
physics = S
velset = 0,0
anim = ifelse(prevstateno = 3155,3152,3101)
ctrl = 0
sprpriority = 2

[State 3152]
type = PosAdd
trigger1 = AnimElem = 2
x = 30

[State 0, Width]
type = Width
trigger1 = animelemtime(3)>0
value = 30,-9
ignorehitpause = 1

[State 3152, Hit]
type=HitDef
triggerall = prevstateno != 3155
trigger1 = Animelem = 4
id=3100
attr=A, HA
damage=28,6
priority=4, hit
animtype=Up
getpower = 12,6
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2,9
guardsound=S3,0
pauseTime=6,16
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8017)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-80
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = 0,-9
guard.velocity = -7
air.velocity = 0,-9
airguard.velocity = -5,-4
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
fall = 1
air.fall=1
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3152, Hit]
type=HitDef
trigger1 = Animelem = 5
id=3100
attr=A, HA
damage=28,6
priority=4, hit
animtype=Up
getpower = 12,6
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2,9
guardsound=S3,0
pauseTime=8,8
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8017)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-90
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = 0,-9
guard.velocity = -7
air.velocity = 0,-9
airguard.velocity = -5,-4
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
fall = 1
air.fall=1
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3152]
type = PlaySnd
trigger1 = AnimElem = 5
value = s1100,1

[State 3152]
type = ChangeState
trigger1 = !AnimTime
value = ifelse(prevstateno = 3155,3154,3153)
ctrl = 0

;UPPERCUT!
[Statedef 3153]
type    = A
movetype= A
physics = N
velset = 2.5,-7
anim = 3102

[State 3153]
type = VelAdd
trigger1 = 1
y = .45

[State 620, Snd]
type=playsnd
trigger1= animelem=1
value=1,13
channel=1
[State 620, Snd]
type=playsnd
trigger1= animelem=1
value=41,0

[State 3153]
type = PlaySnd
trigger1 = Animelem = 1
value = s3150,1

[State 0, Width]
type = Width
trigger1 = animelemtime(1) >= 0 && animelemtime(12) < 0
value = 50,-9
ignorehitpause = 1
;persistent = 

[State 3152, Hit]
type=HitDef
trigger1 = Animelem = 2
trigger2 = Animelem = 4
id=3100
attr=A, HA
damage=18,6
priority=4, hit
animtype=Up
getpower=0,0
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2,9
guardsound=S3,0
pauseTime=2,2
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8017)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-100
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = -1,-13
guard.velocity = -7
air.velocity = -1,-13
airguard.velocity = -5,-4
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
fall = 1
air.fall=1
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3152, Hit]
type=HitDef
trigger1 = Animelem = 6
id=3100
attr=A, HA
damage=18,6
priority=4, hit
animtype=Up
getpower=0,0
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2,9
guardsound=S3,0
pauseTime=2,2
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8017)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-100
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = -1,-12
guard.velocity = -7
air.velocity = -1,-12

airguard.velocity = -5,-4
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
fall = 1
air.fall=1
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3153]
type = VelSet
trigger1 = Animelem = 7
x = ifelse(FrontEdgeDist < 34,0,1.6)

[State 3153]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= -5
value = 3155

;U P P E R C U T ! ! !
[Statedef 3154]
type    = A
movetype= A
physics = N
velset = 2.4,-11.8
anim = 3154

[State 3154]
type = PlaySnd
trigger1 = Animelem = 1
value = s3150,1

[State 620, Snd]
type=playsnd
trigger1= animelem=1
value=1,13
channel=1
[State 620, Snd]
type=playsnd
trigger1= animelem=1
value=1,14
[State 620, Snd]
type=playsnd
trigger1= animelem=1
value=1,11

[State 3154]
type = VelAdd
trigger1 = 1
y = .44

[State 0, Woosh]
type = Explod
trigger1 = animelem = 1
anim = 2220
ID = 2220
pos = -40,0
postype = p1
facing = 1
vfacing = 1
removetime = -2
scale = 1*(const(size.xscale)),1*(const(size.yscale))
sprpriority = 0
ontop = 1
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, Width]
type = Width
trigger1 = animelemtime(1) >= 0 && animelemtime(12) < 0
value = 50,-9
ignorehitpause = 1
;persistent = 

[State 3154, Hit]
type=HitDef
trigger1 = Time = 0
id=3100
attr=A, HA
damage=18,6
priority=4, hit
animtype=Up
getpower=0,0
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2,9
guardsound=S3,0
pauseTime=5,4
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8017)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-70
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = -1,-8
guard.velocity = -7
air.velocity = -1,-8
airguard.velocity = -5,-4
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
fall = 1
air.fall=1
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3154, Hit]
type=HitDef
trigger1 = Time = 1
trigger2 = Time = 2
trigger3 = Time = 3
trigger4 = Time = 4
trigger5 = Time = 5
id=3100
attr=A, HA
damage=10,6
priority=4, hit
animtype=Up
getpower=0,0
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2,9
guardsound=S3,0
pauseTime=5,4
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8017)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-70
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = -2,-3
guard.velocity = -7
air.velocity = -2,-3
airguard.velocity = -5,-4
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
fall = 1
air.fall=1
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3154, Hit]
type=HitDef
trigger1 = Time = 6
trigger2 = Time = 7
trigger3 = Time = 8
trigger4 = Time = 9
trigger5 = Time = 10
trigger6 = Time = 11
id=3100
attr=A, HA
damage=10,6
priority=4, hit
animtype=Up
getpower=0,0
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2,9
guardsound=S3,0
pauseTime=5,5
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8017)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-70
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = -2,-3
guard.velocity = -7
air.velocity = -2,-3
airguard.velocity = -5,-4
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
fall = 1
air.fall=1
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=8
envshake.ampl=4
envShake.freq=120

[State 3154, Hit]
type=HitDef
trigger1 = Time = 12
id=3100
attr=A, HA
damage=30,6
priority=4, hit
animtype=Up
getpower=0,0
givepower=20,20
guardflag=MA
hitflag=MAF
hitsound=S2,3000
guardsound=S3,0
pauseTime=34,34
guard.pauseTime=8,8
sparkNo=-1 + 0 * (var(33) :=8014)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=155), var(36) :=-70
air.animtype=Back
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=18
ground.velocity = -2.8,-12
guard.velocity = -7
air.velocity = -2.8,-12
airguard.velocity = -5,-4
airguard.ctrlTime=10
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.5
fall = 1
air.fall=1
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time = 16
envshake.ampl = -12
envshake.freq = 255

[State 3154, 7]
type = VelSet
trigger1 = AnimElem = 14
x = ifelse(FrontEdgeDist < 40,0,1.6)

[State 3154, 8]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= -5
value = 244

;Run that shit back
[Statedef 3155]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 3151
ctrl = 0
sprpriority = 2

[State 3155, 1]
type = VelSet
trigger1 = AnimElem = 1
x = 0
y = 0

[State 3155, 2]
type = PosSet
trigger1 = AnimElem = 1
y = 0

[State 3155, 3]
type = ChangeState
trigger1 = !AnimTime 
value = 3152
ctrl = 0

;---------------------------------------------------------------------------
;Giant Jake
[Statedef 3200]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=ifelse(var(53),0,-1000)
facep2=1

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3000, Anim]
type=changeanim
trigger1=!time
value=1500

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 0
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 0 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, Superpause FX]
type = helper
trigger1 = Time = 0
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 75, -60
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = Time = 1
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,32

[State 0, CtrlSet]
type = CtrlSet
trigger1 = animelemtime(8) > 0
value = 1
ignorehitpause = 1

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Arithmetic Blaster
[StateDef 3250]
type=S
movetype=A
physics=N
poweradd=ifelse(var(53) || var(20),-1000,-2000)
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = ifElse(var(20), 1, ifElse(var(53), 2, ifElse(var(41)=1, 3, 0)))

[State not angery]
type=VarSet
trigger1=!time
var(41)=2

[State 3050, Anim]
type=changeanim
trigger1=!time
value= 3250

[state 3050,Posset]
type=posset
trigger1=!time
y=0

[State 3050, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3050, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3050, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3050, Corner Push]
type = VarSet
trigger1 = Time = 0
fvar(5) = 0

[State 3050, Unguardable]
type = VarSet
trigger1 = Time = 0 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3050, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3050, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 0
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -25, -55
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time =0
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500, IfElse(var(10)=0, 0, 2)
darken = 0

[State Space for the attack]
type = Width
trigger1 = AnimElem = 4;AnimElemTime(4) >= 0
value = 75,0
;player = 75,0
ignorehitpause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5 && (var(10) = [0,1])
value = S1,35

[State LAZOR]
type = Helper
trigger1 = Time = 34 && var(10) = 0
helperType = Normal
stateNo = 3255
ID = 3255
name = "BEEMU"
posType = P1
pos = 100,-67
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5 && (var(10) = 1)
value = S1,14

[State FIREBALL]
type = Helper
trigger1 = Time = 40 && var(10) = 1
helperType = Normal
stateNo = 3265
ID = 3265
name = "SHINKUU"
posType = P1
pos = 80,-67
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5 && (var(10) = 2)
value = S1,36

[State SNOWBALL 1]
type = Projectile
trigger1 = (time = [40, 100]) && var(10) = 2
trigger1 = timemod = 9,0
ProjID = 3270
projanim = 3270
projscale = 1,1
projremove = 1
projremovetime = 25
velocity = 14,0
offset = 75,-58
postype = p1
attr = S, NA
damage = 5, 2
getpower = 1,0
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 8, 8
sparkno = -1
sparkxy = -5, -25
hitsound = s2, 6
guardsound = s3, 0
ground.type = High
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = -4
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -1.4,-3
air.hittime = 12
p2stateno = 6003
[State SNOWBALL 2]
type = Projectile
trigger1 = (time = [40, 100]) && var(10) = 2
trigger1 = timemod = 9,3
ProjID = 3270
projanim = 3270
projscale = 1,1
projremove = 1
projremovetime = 25
velocity = 14,-3
offset = 75,-58
postype = p1
attr = S, NA
damage = 5, 2
getpower = 1,0
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 8, 8
sparkno = -1
sparkxy = -5, -25
hitsound = s2, 6
guardsound = s3, 0
ground.type = High
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = -4
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -1.4,-3
air.hittime = 12
p2stateno = 6003
[State SNOWBALL 3]
type = Projectile
trigger1 = (time = [40, 100]) && var(10) = 2
trigger1 = timemod = 9,6
ProjID = 3270
projanim = 3270
projscale = 1,1
projremove = 1
projremovetime = 25
velocity = 14,3
offset = 75,-58
postype = p1
attr = S, NA
damage = 5, 2
getpower = 1,0
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 8, 8
sparkno = -1
sparkxy = -5, -25
hitsound = s2, 6
guardsound = s3, 0
ground.type = High
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = -4
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -1.4,-3
air.hittime = 12
p2stateno = 6003

[State COMING THROUGH]
type = Helper
trigger1 = Time = 40 && var(10) = 3
helperType = Normal
stateNo = 3280
ID = 3280
name = ":)"
posType = back
pos = -180,0
size.xscale = 1
size.yscale = 1
ownpal = 1
facing = 1
persistent = 0
ignorehitpause = 1

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;OUCH!
[Statedef 4058]
type    = S
movetype= H
physics = S
ctrl = 0

[State 0, HitFallSet]
type = HitFallSet
trigger1 = 1
value = 0
[State 0, HitVelSet]
type = HitVelSet
trigger1 =!time 
x = 1
[State 0, VelMul] 
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6
[State 0, Velset]
type = VelSet
trigger1 = HitOver
x = 0
[State 0, PosSet]
type = PosSet
trigger1 = 1
y = 0
ignorehitpause = 1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = !time
value = 4058  ;<=======custom animation

[State 0, SelfState]
type = SelfState
trigger1 = animtime=0
value = 0
ctrl = 1

;OUCH!
[Statedef 4059]
type    = S
movetype= H
physics = S
ctrl = 0

[State 0, HitFallSet]
type = HitFallSet
trigger1 = 1
value = 0
[State 0, HitVelSet]
type = HitVelSet
trigger1 =!time 
x = 1
[State 0, VelMul] 
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6
[State 0, Velset]
type = VelSet
trigger1 = HitOver
x = 0

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = 0
ignorehitpause = 1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = !time
value = 4059  ;<=======custom animation

[State 0, SelfState]
type = SelfState
trigger1 = animtime=0
value = 0
ctrl = 1

;LET IT GO
[Statedef 6003]
type = S
movetype = H
velset = 0,0

[State 6003, 0]
type = ChangeAnim
trigger1 = time = 0
trigger1 = selfanimexist(7990) = 1
value = 7990

[State 6003, 1]
type = ChangeAnim
trigger1 = selfanimexist(7990) = 0
value = 5000

[State 6003, 2]
type = PalFX
trigger1 = selfanimexist(7990) = 0
time = 1
add = 100,100,180
mul = 256,256,256
sinadd = -80,-80,-80,0
invertall = 0
color = 0

[State 6003, 3]
type = StateTypeSet
trigger1 = pos y < 0
statetype = A
movetype = H
physics = N

[State 6003, 4]
type = SelfState
trigger1 = time = 200
value = 5050


;-----------------------------------------------
;LVL 3 Super
[StateDef 3500]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = -3000
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=3500

[state 3500,Posset]
type=posset
trigger1=!time
y=0

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 0
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 0 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3500, Super Pause FX]
type = Helper
trigger1 = animelem = 1
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = -11, -100
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3400,BlackBG]
type=helper
trigger1 =animelem=1
helpertype=normal
stateno=3580
ID=3580
name="BlackBG"
postype=Back
supermovetime=99999
pausemovetime=99999
ownpal=1
ignorehitpause=1
size.xScale=5
size.yScale=5

[State 20000, 14]
type = PlaySnd
trigger1 = time = 0
value = S5,42
channel = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = S1,31

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = S1,9
[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
value = S1,17
[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
value = S1,18

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 5
time = 12
freq = 225
ampl = -24
ignorehitpause = 1

[State 1150, GROUND POUND]
Type = Helper
Trigger1 = AnimElem = 5
HelperType = Normal
Name = "Effect"
ID = 3505
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3505
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 450, Hit]
type=hitdef
;trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
ID = 3500
attr = C,HA
hitflag = MAFD
guardflag = L
damage = ceil(ifelse(fvar(11)*30<7, 7, fvar(11)*30)), 7
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Trip
air.type = Trip
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = -1, -6.25
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -1, -8.24
air.cornerPush.velOff = 0
yAccel = 0.677
fall = 1
fall.recover = 0
fall.recoverTime = 180
hitsound = -1 + 0*(var(31):=1001)
guardsound = -1 + 0*(var(32):=0)
sparkNo=-1 + 0 * (var(33) :=8014)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkxy = var(35):=200, var(36):=-10
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 16
envshake.ampl = -12
envshake.freq = 255

[State of DIE]
type = TargetState
trigger1 = MoveHit && NumTarget(3500)
trigger1 = !(target(3500),ishelper)
value = 3510
ignorehitpause = 1
persistent = 0

[State of DIE]
type = ChangeState
trigger1 = MoveHit && NumTarget(3500)
trigger1 = !(target(3500),ishelper)
value = 3501
ignorehitpause = 1
persistent = 0

[State 200, Type]
type=statetypeset
trigger1= animelemtime(6)>=0
movetype=I

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

; FINISHER
[Statedef 3501]
type    = S
movetype = A
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3501
poweradd = -5000

[State 3400,BlackBG]
type=helper
trigger1 =animelem=1
helpertype=normal
stateno=3580
ID=3580
name="BlackBG"
postype=Back
supermovetime=99999
pausemovetime=99999
ownpal=1
ignorehitpause=1
size.xScale=5
size.yScale=5

[State 20000, 3]
type = AllPalFX
trigger1 = animtime = 0
time = 5
add = 256,256,256
mul = 256,256,256
sinadd = 0,0,0,1
invertall = 0
color = 256

[State 20000, 6]
type = PlaySnd
trigger1 = time = 0
value = S20000,1
channel = 5

[State 20000, 8]
type = PlaySnd
trigger1 = animelem = 20
value = S20000,2

[State 20000, 9]
type = AllPalFX
trigger1 = time = 255
time = 10
add = 256,0,150
mul = 500,0,150
invertall = 0
color = 256

[State 20000, 10]
type = HitDef
trigger1 = time = 0
attr = S, HP
damage = 300, 300
animtype = Heavy
guardflag = MA
hitflag = MAFD
priority = 3, Hit
pausetime = 8, 8
sparkno = -1
sparkxy = -10, -76
hitsound = s2, 3100
guardsound = s3, 0
ground.type = High
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = -1,-20
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -4,-40
air.hittime = 12
fall = 1

[State 20000, 11]
type = PlaySnd
trigger1 = animelem = 36
value = S20000,4

[State 20000, 12]
type = EnvShake
trigger1 = animelem = 36
time = 20
freq = 60
ampl = -40
phase = 90

[State 20000, 13]
type = StopSnd
trigger1 = time = 0
channel = 1

[State 20000, 15]
type = PlaySnd
trigger1 = animelem = 19
value = S5,40
channel = 1

[State 0, StopSnd]
type = StopSnd
trigger1 = animtime = 0
channel = 5
;ignorehitpause = 
;persistent = 

[State 20000, 16]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;QUAKE
[Statedef 3505]
Physics = N
Ctrl = 0
Anim = 3505
SprPriority = -9

[State 1121, position]
Type = PosSet
Trigger1 = Time = 0
X = 0
Y = 0

[State 1121, end]
Type = DestroySelf
Trigger1 = IsHelper
Trigger1 = AnimTime = 0

;OUCH!
[Statedef 3510]
type=S
movetype=H
physics=N
ctrl=0
velset=0,0
sprpriority=0
facep2=1

[State 3021, Remove Explods]
type=RemoveExplod
trigger1=IsHelper
[State 3321, Destroy Helpers]
type=DestroySelf
trigger1=IsHelper
[State 3021, VelSet]
type = VelSet
trigger1 =!time 
x = -1
[State 3021, VelMul]
type = VelMul
trigger1 = 1
x = .5
[State 3021, VelSet]
type = VelSet
trigger1 =time>12
x = 0

[State 3021, HitBy]
type=HitBy
trigger1=1
value=SA,HA,HP
time=1
ignorehitpause =1

[State 3021, HitFallSet]
type=HitFallSet
trigger1=1
value=0
[State 3021, PosSet]
type=PosSet
trigger1=!time
y=0
[State 3021, Width]
type = Width
trigger1 = 1
edge = 0,10
[State 3021, ChangeAnim]
type=ChangeAnim2
trigger1=!time
value=3060

[State 3021, SelfState]
type=SelfState
trigger1 = time > 500
value=0
ctrl=1