; _________________________________________
;| Queen Bee by varo_hades                 |
; ｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯ
;==============================================================================================
;========================================<SPECIAL MOVES>=======================================
;==============================================================================================

;=====================<SXP>==========================
[StateDef 1000]
type = U
physics = N
moveType = I
anim = 1000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1020, ifElse(var(10) = 1, 1010, 1000))

[State 1000]
type = PosAdd
triggerall = var(46) = 0
triggerall = time = 0
triggerall = Pos Y <= -40
trigger1 = StateType = A
y = 40

[State 1000]
type = PosSet
triggerall = var(46) = 0
triggerall = time = 0
triggerall = Pos Y > -40
trigger1 = StateType = A
y = 0

[State 1000]
type = ChangeState
trigger1 = AnimTime = 0
value = 1005

;Stinger Attack
[Statedef 1005]
type = U
movetype = A
physics = N
poweradd = 0
ctrl = 0
velset = 0,0
anim = 1005
sprpriority = 1
facep2 = 1
hitcountpersist = 1

[State 1005, 音声]
type = PlaySnd
trigger1 = TimeMod = 16, 1
value = 4, 3
channel = 0

[State 1005]
type = VelSet
triggerall = var(46) = 0
triggerall = StateType = A
trigger1 = Pos Y < 0
y = 1

[State 1005]
type = VelSet
triggerall = var(46) = 0
triggerall = StateType = A
trigger1 = Pos Y >= 0
y = 0

[State 1005]
type = VarAdd
trigger1 = command = "a"
trigger2 = command = "b"
trigger3 = command = "c"
var(45) = 1

[State 1005]
type = ChangeState
triggerall = var(45) = 0
trigger1 = AnimTime = 0
value = 1010

[State 1005]
type = VarSet
triggerall = var(45) >= 1
trigger1 = AnimTime = 0
var(45) = 0

[State 1005, Hitdef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
triggerall = StateType != A
trigger1 = TimeMod = 9, 1
attr = S, SA
damage = Ceil((5*6.67)+((3*6.67)*fvar(11))), 3 ;(5,3)
animtype = Hard
ground.type = Low
air.type = Low
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 10, 10
sparkNo=-1 + 0 * (var(33) :=8016)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=100), var(36) :=-45
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
ground.slidetime = 30
guard.slidetime = 29
ground.hittime  = 30
guard.hittime  = 29
air.hittime = 30
ground.velocity = -16
air.velocity = -2.5,-4
getpower = 60,30
givePower = 36, 36
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1005, Hitdef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
triggerall = StateType = A
trigger1 = TimeMod = 9, 1
attr = S, SA
damage = Ceil((5*6.67)+((3*6.67)*fvar(11))), 3 ;(5,3)
animtype = Hard
ground.type = Low
air.type = Low
guardflag = MA
hitflag = MA
priority = 4, Hit
pausetime = 10, 10
sparkNo=-1 + 0 * (var(33) :=8016)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=100), var(36) :=-45
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
ground.slidetime = 16
guard.slidetime = 15
ground.hittime  = 16
guard.hittime  = 15
air.hittime = 16
ground.velocity = -14
air.velocity = -2.5,-4
getpower = 60,30
givePower = 36, 36
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

;Sxp拾nd
[Statedef 1010]
type = U
movetype = I
physics = N
poweradd = 0
ctrl = 0
velset = 0,0
anim = 1026
sprpriority = 1
facep2 = 1
hitcountpersist = 1

[State 804]
type = VelSet
triggerall = var(46) = 0
triggerall = StateType = A
trigger1 = Pos Y < 0
y = 1

[State 804]
type = VelSet
triggerall = var(46) = 0
triggerall = StateType = A
trigger1 = Pos Y >= 0
y = 0

[State 804]
type = ChangeState
triggerall = StateType != A
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 804]
type = ChangeState
triggerall = var(46) = 0
triggerall = StateType = A
trigger1 = AnimTime = 0
value = 50
ctrl = 0

[State 804]
type = ChangeState
triggerall = var(46) = 1
triggerall = StateType = A
trigger1 = AnimTime = 0
value = 1005
ctrl = 1

;========================<EX SXP>=============================
[StateDef 1030]
type = U
physics = N
moveType = I
anim = 1000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1030, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1030, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 44

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1000]
type = PosAdd
triggerall = time = 0
triggerall = Pos Y <= -40
trigger1 = StateType = A
y = 40

[State 1000]
type = PosSet
triggerall = time = 0
triggerall = Pos Y > -40
trigger1 = StateType = A
y = 0

[State 1000]
type = ChangeState
trigger1 = AnimTime = 0
value = 1035

;EX Stinger Attack
[Statedef 1035]
type = U
movetype = A
physics = N
poweradd = 0
ctrl = 0
velset = 0,0
anim = 1005
sprpriority = 1
facep2 = 1
hitcountpersist = 1

[State 1005, 音声]
type = PlaySnd
trigger1 = TimeMod = 16, 1
value = 4, 3
channel = 0

[State 1005]
type = VelSet
triggerall = StateType = A
trigger1 = Pos Y < 0
y = 1

[State 1005]
type = VelSet
triggerall = StateType = A
trigger1 = Pos Y >= 0
y = 0

[State 1005, Hitdef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
triggerall = StateType != A
trigger1 = Hitcount < 5
attr = S, SA
damage = ceil(ifElse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 7
animtype = Hard
ground.type = Low
air.type = Low
guardflag = M
hitflag = MA
priority = 4, Hit
pausetime = 10, 10
sparkNo=-1 + 0 * (var(33) :=8016)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=100), var(36) :=-45
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
ground.slidetime = 30
guard.slidetime = 29
ground.hittime  = 30
guard.hittime  = 29
air.hittime = 30
ground.velocity = -3
air.velocity = -2.5,-4
getPower = 0,0
givePower = 36, 36
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1005, Hitdef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
triggerall = StateType = A
trigger1 = Hitcount < 5
attr = S, SA
damage = ceil(ifElse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 7
animtype = Hard
ground.type = Low
air.type = Low
guardflag = MA
hitflag = MA
priority = 4, Hit
pausetime = 10, 10
sparkNo=-1 + 0 * (var(33) :=8016)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=100), var(36) :=-45
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
ground.slidetime = 16
guard.slidetime = 15
ground.hittime  = 16
guard.hittime  = 15
air.hittime = 16
ground.velocity = -3
air.velocity = -2.5,-4
getPower = 0,0
givePower = 36, 36
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;========================<TRIANGLE A>=============================
[StateDef 1100]
type = A
movetype = I
physics = N
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 810]
type = ChangeAnim
triggerall = time = 0
trigger1 = Pos Y < 0
trigger2 = BackEdgeDist > 150
value = 1101

[State 810]
type = turn
trigger1 = AnimElem = 2

[State 810]
type = VelSet
trigger1 = time >= 2
x = (FrontEdgeBodyDist+100)*0.04
y = ifelse(Pos Y<=-100,0,(-150 - Pos Y)*0.04)

[State 810]
type = ChangeState
trigger1 = Pos Y <= -100
trigger1 = FrontEdgeBodyDist < 10
value = 1105

;Attack
[Statedef 1105]
type = A
movetype = A
physics = N
poweradd = 0
ctrl = 0
velset = 0,0
anim = 1103
sprpriority = 2
hitcountpersist = 1

[State 803, 音声]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4, 4
channel = 0

[State 815, 粉]
type = Explod
trigger1 = TimeMod = 2, 1
anim = ifelse(NumExplod%2=1,1106,1105)
pos = -10, -65
postype = p1
scale = 0.9, 1
sprpriority = -1

[State 815]
type = VelAdd
trigger1 = time > 10
x = -0.5
y = 0.5

[State 815]
type = ChangeState
trigger1 = Pos Y >= 0
value = 52

[State 815, Hitdef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 6
attr = A, SA
damage = Ceil(((12+var(10))*6.67)+((((4+var(10))*6.67)*fvar(11)))), 0 ;(15+x,4+x)
animtype  = Hard
ground.type = Low
air.type = Low
guardflag = MA
hitflag = MA
priority = 4, Hit
pausetime = 10, 10
sparkNo=-1 + 0 * (var(33) :=8016)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=200), var(36) :=-40
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
ground.slidetime = 16
guard.slidetime = 15
ground.hittime  = 16
guard.hittime  = 15
air.hittime = 16
ground.velocity = 14
getpower = 60,30
givePower = 36, 36
air.velocity = 2.5,-4
air.fall = 1
fall.recover = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 815]
type = ChangeAnim
triggerall = var(10) = 0
trigger1 = time = 0
value = 1102

[State 815]
type = VelSet
triggerall = var(10) = 0
trigger1 = AnimElem = 6
x = -6
y = 10

[State 815]
type = VelSet
triggerall = var(10) = 1
trigger1 = AnimElem = 6
x = -10
y = 7

[State 815]
type = VelSet
triggerall = var(10) = 2
trigger1 = AnimElem = 6
x = -14
y = 4

;========================<EX TRIANGLE A>=============================
[StateDef 1130]
type = A
movetype = I
physics = N
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1130, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1130, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1130, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 61

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 813]
type = ChangeAnim
triggerall = time = 0
trigger1 = Pos Y < 0
trigger2 = BackEdgeDist > 150
value = 1101

[State 813]
type = turn
trigger1 = AnimElem = 2

[State 813]
type = VelSet
trigger1 = time >= 2
x = (FrontEdgeBodyDist+100)*0.04
y = ifelse(Pos Y<=-100,0,(-150 - Pos Y)*0.04)

[State 813]
type = ChangeState
trigger1 = Pos Y <= -100
trigger1 = FrontEdgeBodyDist < 10
value = 1135

;EX Attack
[Statedef 1135]
type = A
movetype = A
physics = N
poweradd = 0
ctrl = 0
velset = 0,0
anim = 1103
sprpriority = 2
hitcountpersist = 1

[State 803, 音声]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4, 4
channel = 0

[State 815, 粉]
type = Explod
trigger1 = TimeMod = 2, 1
anim = ifelse(NumExplod%2=1,1106,1105)
pos = -10, -65
postype = p1
scale = 0.9, 1
sprpriority = -1

[State 815]
type = VelAdd
trigger1 = time > 10
x = -0.5
y = 0.5

[State 815]
type = ChangeState
trigger1 = Pos Y >= 0
value = 52

[State 815]
type = VelSet
triggerall = var(10) = 3
trigger1 = AnimElem = 6
x = -11.5
y = 5.5

[State 815, Hitdef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 6
attr = A, SA
damage = Ceil((15*6.67)+((8*6.67)*fvar(11))), 0 ;(20,8)
animtype  = Hard
ground.type = Low
air.type = Low
guardflag = MA
hitflag = MA
priority = 4, Hit
pausetime = 10, 10
sparkNo=-1 + 0 * (var(33) :=8016)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=100), var(36) :=-40
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
ground.slidetime = 16
guard.slidetime = 15
ground.hittime  = 16
guard.hittime  = 15
air.hittime = 16
ground.velocity = 14
air.velocity = 2.5,-4
getpower=0, 0
givepower=35, 35
p2stateno = 1136
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

;Player 2
[Statedef 1136]
type = A
movetype = H
physics = N
poweradd = 0
ctrl = 0
velset = 0,0
anim = 5030

[State 816]
type = PalFX
trigger1 = 1
time = 1
mul = 200, 0, 200
color = 200

[State 816]
type = VelSet
trigger1 = time = 8
x = -1
y = -3

[State 816]
type = ChangeAnim
trigger1 = time = 10
value = 5210

[State 816]
type = VelAdd
trigger1 = Time >= 14
y = .35

[State 816] ;Land on ground
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 1137

;Player 2 finish
[Statedef 1137]
type = S
movetype = H
physics = N
poweradd = 0
ctrl = 0
velset = 0, 0
anim = 5300

[State 817]
type = PalFX
trigger1 = 1
time = 1
mul = 200, 0, 200
color = 200

[State 817]
type = PosSet
trigger1 = 1
y = 0

[State 817]
type = SelfState
trigger1 = time >= 31
value = 0
ctrl = 1

;=====================<C->R>==========================
[StateDef 1200]
type = U
physics = N
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1202, ifElse(var(10) = 1, 1201, 1200))

[State 820, 音声]
type = PlaySnd
trigger1 = AnimElem = 5
value = 800, 0
channel = 0

[State 820]
type = VelSet
trigger1 = var(10) = 0
trigger1 = AnimElem = 4
x = 4.75

[State 820]
type = VelSet
trigger1 = var(10) = 1
trigger1 = AnimElem = 4
x = 5

[State 820]
type = VelSet
trigger1 = var(10) = 2
trigger1 = AnimElem = 4
x = 6

[State 820]
type = VelSet
trigger1 = var(46) = 0
trigger1 = Statetype = A
trigger1 = AnimElem = 5
x = 2.375

[State 820]
type = VelSet
trigger1 = Statetype != A
trigger1 = AnimElem = 5
trigger2 = var(46) = 1
trigger2 = Statetype = A
trigger2 = AnimElem = 5
x = 0

[State 820]
type = StateTypeSet
triggerall = var(46) = 0
triggerall = Statetype = A
trigger1 = AnimElem = 5
physics = A

[State 820]
type = ChangeState
triggerall = Statetype != A
trigger1 = AnimElem = 8, = 3
value = 0
ctrl = 1

[State 820]
type = ChangeState
triggerall = var(46) = 1
triggerall = Statetype = A
trigger1 = AnimElem = 8, = 3
value = 1210
ctrl = 1

[State 820, Hitdef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 4
attr = A, SA
damage = Ceil(((0.1+var(10))*6.67)+((((4+var(10))*6.67)*fvar(11)))), 0
animtype  = Hard
ground.type = Low
air.type = Low
guardflag = MA
hitflag = MA
priority = 4, Hit
pausetime = 10, 10
sparkNo=-1 + 0 * (var(33) :=0)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -50
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
ground.slidetime = 26
guard.slidetime = 25
ground.hittime  = 26
guard.hittime  = 25
air.hittime = 26
ground.velocity = -6
air.velocity = -2.5,-4
getpower = 60,30
givepower=35, 35
fall = 1
down.bounce = 1
fall.xvelocity = -2.5
fall.yvelocity = -9
p1stateno = ifelse(StateType=A,1205,1203)
p2stateno = ifelse(StateType=A,1206,1204)
kill = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 820]
type = ChangeState
trigger1 = MoveGuarded = 3
value = 1209

;C->R
[Statedef 1203]
type = U
movetype = A
physics = N
poweradd = 0
ctrl = 0
velset = 0,0
anim = 1203
sprpriority = 1
facep2 = 1
hitcountpersist = 1

[State 823]
type = PosAdd
trigger1 = AnimElem = 1
x = (P2Dist X-60)

[State 823]
type = TargetFacing
trigger1 = AnimElem = 30
value = 1

[State 823, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 3
pos = 45, 0

[State 823, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 4
pos = 25, 0

[State 823, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 5
pos = 20, 0

[State 823, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 23
pos = 0, 0

[State 823, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 30
pos = -50, 0

[State 823, 画面揺れ]
type = EnvShake
trigger1 = AnimElem = 30, = 2
time = 17
freq = 60
ampl = 10
phase= 10

[State 823, 掴んだ相手のライフ増減]
type = TargetLifeAdd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 14
trigger3 = AnimElem = 20
value =-ceil(((2*6.67)+((1*6.67)*fvar(11)))*const(data.attack)*0.01) ;(2,1)
kill = 0

[State 823, 掴んだ相手のライフ増減]
type = TargetLifeAdd
trigger1 = AnimElem = 30, = 2
value =-ceil(((8*6.67)+((3*6.67)*fvar(11)))*const(data.attack)*0.01) ;(8,3)

[State 823,針]
type = Explod
trigger1 = AnimElem = 9
anim = 1205
pos = 0, 0
postype = p1
sprpriority = -3
bindtime =  999

[State 1006, HitSpark]
type = Helper
trigger1 = AnimElem = 9
trigger2 = AnimElem = 14
trigger3 = AnimElem = 20
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8016)
ID = 8000
name = "Spark"
posType = P1
pos = 35, -30
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1432, Dust]
type=helper
trigger1 = AnimElem = 30, = 2
helpertype=normal
stateno=8110
ID=8110
name="Impact Dust"
postype=p1
pos= -30,5
ownpal=1
persistent=0

[State 823, 音声]
type = PlaySnd
trigger1 = AnimElem = 8
trigger2 = AnimElem = 13
trigger3 = AnimElem = 19
value = 2, 12
channel = 0

[State 823, 音声]
type = PlaySnd
trigger1 = AnimElem = 30
value = 5000, 2
channel = 0

[State 823, ステート変更]
type = ChangeState
trigger1 = time = 114
value = 0
ctrl = 1

;C->R
[Statedef 1204]
type = U
movetype = H
physics = N
ctrl = 0
velset = 0,0
facep2 = 1

[State 824, 軸位置移動]
type = PosSet
trigger1 = 1
y = 0

[State 824]
type = ChangeAnim2
trigger1 = time = 0
value = 1207

[State 824]
type = SelfState
trigger1 = time = 99
value = 5100

;C->R
[Statedef 1205]
type = U
movetype = A
physics = N
anim = 1204
ctrl = 0
poweradd = 0
velset = 0,0

[State 825]
type = PosAdd
trigger1 = AnimElem = 1
x = (P2Dist X-60)

[State 825, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 3
pos = 45, 0

[State 825, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 4
pos = 25, 0

[State 825, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 5
pos = 20, 0

[State 825, 掴んだ相手の位置]
type = TargetBind
trigger1 = time >= 74
pos = 0, 0

[State 825,針]
type = Explod
trigger1 = AnimElem = 9
anim = 1206
ID = 862
pos = 0, 0
postype = p1
sprpriority = -3
bindtime =  999

[State 825, 掴んだ相手のライフ増減]
type = TargetLifeAdd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 14
trigger3 = AnimElem = 20
value =-ceil(((3*6.67)+((2*6.67)*fvar(11)))*const(data.attack)*0.01) ;(2,1)

[State 1006, HitSpark]
type = Helper
trigger1 = AnimElem = 9
trigger2 = AnimElem = 14
trigger3 = AnimElem = 20
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8016)
ID = 8000
name = "Spark"
posType = P1
pos = 35, -30
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 825]
type = Gravity
trigger1 = time >= 80

[State 825, 音声]
type = PlaySnd
trigger1 = AnimElem = 8
trigger2 = AnimElem = 13
trigger3 = AnimElem = 19
value = 2, 12
channel = 0

[State 825, 音声]
type = PlaySnd
trigger1 = Pos Y >= 0
value = 5000, 2
channel = 0

[State 825, ステート変更]
type = ChangeState
trigger1 = Pos Y >= 0
value = 861
ctrl = 0

;C->R
[Statedef 1206]
type = U
movetype = H
physics = N
ctrl = 0
velset = 0,0
facep2 = 1

[State 826]
type = ChangeAnim2
trigger1 = time = 0
value = 1207

[State 826]
type = SelfState
trigger1 = time >= 120
value = 5100

;C->R
[Statedef 1209]
type = A
movetype = I
physics = A
poweradd = 0
ctrl = 0
velset = -2,-7
anim = 1209
sprpriority = 1

[State 829]
type = Null
trigger1 = 1

;浮遊
[Statedef 1210]
type    = A
movetype= I
physics = S
ctrl = 1
velset = 0,0
anim = 60
sprpriority = 1

[State 1005, 粉]
type = Explod
trigger1 = TimeMod = 6, 1
anim = ifelse(NumExplod%2=1,1221,1220)
pos = -20, -60
postype = p1
scale = 0.9, 1
sprpriority = 2

[State 1005, 振り返り]
type = turn
trigger1 = p2dist x < -2

[State 1005, 前進]
type = VelSet
trigger1 = command = "holdfwd"
x = 5

[State 1005, 後退]
type = VelSet
trigger1 = command = "holdback"
x = -5

[State 1005, 上昇]
type = VelAdd
triggerall = Vel Y > -3
trigger1 = command = "holdup"
y = -0.5

[State 1005, 下降]
type = VelAdd
triggerall = Vel Y < 3
trigger1 = command = "holddown"
y = 0.5

[State 1005, 停止]
type = VelSet
trigger1 = command != "holdup"
trigger1 = command != "holddown"
trigger2 = Pos Y < -90
trigger2 = Vel Y < 0
y = 0

[State 1005]
type = ChangeState
trigger1 = Pos Y > 0
value = 52
ctrl = 0

;続空中投げ
[Statedef 1211]
type = U
movetype = A
physics = N
anim = 1211
ctrl = 0
velset = 0,0

[State 723]
type = PosSet
trigger1 = 1
y = 0

[State 723]
type = RemoveExplod
trigger1 = time = 0
ID = 710

[State 723,針]
type = Explod
trigger1 = AnimElem = 1
anim = 1212
pos = 0, 0
postype = p1
sprpriority = -3
bindtime =  999

[State 723]
type = TargetFacing
trigger1 = AnimElem = 1
value = 1

[State 723, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 1
pos = -50, 0

[State 723]
type = TargetState
trigger1 = AnimElem = 1
value = 726

[State 723, 画面揺れ]
type = EnvShake
trigger1 = AnimElem = 1, = 2
time = 17
freq = 60
ampl = 10
phase= 10

[State 723, 掴んだ相手のライフ増減(C→R)]
type = TargetLifeAdd
triggerall = prevstateno = 825
trigger1 = AnimElem = 1, = 2
value =-ceil(((8*6.67)+((3*6.67)*fvar(11)))*const(data.attack)*0.01) ;(8,3)

[State 723, 掴んだ相手のライフ増減,通常]
type = TargetLifeAdd
triggerall = prevstateno = 722
trigger1 = AnimElem = 1, = 2
value =-ceil(((6*6.67)+((3*6.67)*fvar(1)))*const(data.attack)*0.01) ;(6,3)

[State 723, ステート変更]
type = ChangeState
trigger1 = Animtime = 0
value = 0
ctrl = 1

;========================<EX C->R>=============================
[StateDef 1230]
type = U
movetype = A
physics = N
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1130, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1130, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1130, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 161

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-55 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 820, 音声]
type = PlaySnd
trigger1 = AnimElem = 5
value = 800, 0
channel = 0

[State 820]
type = VelSet
trigger1 = AnimElem = 4
x = 7

[State 820]
type = VelSet
trigger1 = var(46) = 0
trigger1 = Statetype = A
trigger1 = AnimElem = 5
x = 2.375

[State 820]
type = VelSet
trigger1 = Statetype != A
trigger1 = AnimElem = 5
trigger2 = var(46) = 1
trigger2 = Statetype = A
trigger2 = AnimElem = 5
x = 0

[State 820]
type = StateTypeSet
triggerall = var(46) = 0
triggerall = Statetype = A
trigger1 = AnimElem = 5
physics = A

[State 820]
type = ChangeState
triggerall = Statetype != A
trigger1 = AnimElem = 8, = 3
value = 0
ctrl = 1

[State 820]
type = ChangeState
triggerall = var(46) = 1
triggerall = Statetype = A
trigger1 = AnimElem = 8, = 3
value = 1210
ctrl = 1

[State 820, ヒット定義]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 4
attr = A, SA
damage = Ceil(((0.1+var(10))*6.67)+((((4+var(10))*6.67)*fvar(10)))), 0
animtype  = Hard
ground.type = Low
air.type = Low
guardflag = MA
hitflag = MA
priority = 4, Hit
pausetime = 10, 10
sparkNo=-1 + 0 * (var(33) :=0)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -50
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
ground.slidetime = 26
guard.slidetime = 25
ground.hittime  = 26
guard.hittime  = 25
air.hittime = 26
ground.velocity = -6
air.velocity = -2.5,-4
getpower=0,0
givepower=35, 35
fall = 1
down.bounce = 1
fall.xvelocity = -2.5
fall.yvelocity = -9
p1stateno = ifelse(StateType=A,1235,1233)
p2stateno = ifelse(StateType=A,1236,1234)
kill = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 820]
type = ChangeState
trigger1 = MoveGuarded = 3
value = 1209

;EX C->R
[Statedef 1233]
type = U
movetype = A
physics = N
poweradd = 0
ctrl = 0
velset = 0,0
anim = 1213
sprpriority = 1
facep2 = 1
hitcountpersist = 1

[State 823]
type = PosAdd
trigger1 = AnimElem = 1
x = (P2Dist X-60)

[State 823]
type = TargetFacing
trigger1 = AnimElem = 36
value = 1

[State 823, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 3
pos = 45, 0

[State 823, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 4
pos = 25, 0

[State 823, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 5
pos = 20, 0

[State 823, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 29
pos = 0, 0

[State 823, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 36
pos = -50, 0

[State 823, 画面揺れ]
type = EnvShake
trigger1 = AnimElem = 36, = 2
time = 17
freq = 60
ampl = 10
phase= 10

[State 823, 掴んだ相手のライフ増減]
type = TargetLifeAdd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 14
trigger3 = AnimElem = 20
trigger4 = AnimElem = 26
value =-ceil(((2*6.67)+((1*6.67)*fvar(11)))*const(data.attack)*0.01) ;(2,1)
kill = 0

[State 823, 掴んだ相手のライフ増減]
type = TargetLifeAdd
trigger1 = AnimElem = 36, = 2
value =-ceil(((5*6.67)+((3*6.67)*fvar(11)))*const(data.attack)*0.01) ;(8,3)

[State 823,針]
type = Explod
trigger1 = AnimElem = 9
anim = 1215
pos = 0, 0
postype = p1
sprpriority = -3
bindtime =  999

[State 1006, HitSpark]
type = Helper
trigger1 = AnimElem = 9
trigger2 = AnimElem = 14
trigger3 = AnimElem = 20
trigger4 = AnimElem = 26
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8016)
ID = 8000
name = "Spark"
posType = P1
pos = 35, -30
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1432, Dust]
type=helper
trigger1 = AnimElem = 36, = 2
helpertype=normal
stateno=8110
ID=8110
name="Impact Dust"
postype=p1
pos= -30,5
ownpal=1
persistent=0

[State 823, 音声]
type = PlaySnd
trigger1 = AnimElem = 8
trigger2 = AnimElem = 13
trigger3 = AnimElem = 19
trigger4 = AnimElem = 25
value = 2, 12
channel = 0

[State 823, 音声]
type = PlaySnd
trigger1 = AnimElem = 36
value = 5000, 2
channel = 0

[State 823, ステート変更]
type = ChangeState
trigger1 = time = 133
value = 0
ctrl = 1

;EX C->R
[Statedef 1234]
type = U
movetype = H
physics = N
ctrl = 0
velset = 0,0
facep2 = 1

[State 824, 軸位置移動]
type = PosSet
trigger1 = 1
y = 0

[State 824]
type = ChangeAnim2
trigger1 = time = 0
value = 1217

[State 824]
type = SelfState
trigger1 = time = 118
value = 5100

;C->R
[Statedef 1235]
type = U
movetype = A
physics = N
anim = 1214
ctrl = 0
poweradd = 0
velset = 0,0

[State 825]
type = PosAdd
trigger1 = AnimElem = 1
x = (P2Dist X-60)

[State 825, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 3
pos = 45, 0

[State 825, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 4
pos = 25, 0

[State 825, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 5
pos = 20, 0

[State 825, 掴んだ相手の位置]
type = TargetBind
trigger1 = time >= 93
pos = 0, 0

[State 825,針]
type = Explod
trigger1 = AnimElem = 9
anim = 1216
ID = 862
pos = 0, 0
postype = p1
sprpriority = -3
bindtime =  999

[State 825, 掴んだ相手のライフ増減]
type = TargetLifeAdd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 14
trigger3 = AnimElem = 20
trigger4 = AnimElem = 26
value =-ceil(((2*6.67)+((2*6.67)*fvar(11)))*const(data.attack)*0.01) ;(2,1)

[State 1006, HitSpark]
type = Helper
trigger1 = AnimElem = 9
trigger2 = AnimElem = 14
trigger3 = AnimElem = 20
trigger4 = AnimElem = 26
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8016)
ID = 8000
name = "Spark"
posType = P1
pos = 35, -30
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 825]
type = Gravity
trigger1 = time >= 99

[State 825, 音声]
type = PlaySnd
trigger1 = AnimElem = 8
trigger2 = AnimElem = 13
trigger3 = AnimElem = 19
trigger4 = AnimElem = 25
value = 2, 12
channel = 0

[State 825, 音声]
type = PlaySnd
trigger1 = Pos Y >= 0
value = 5000, 2
channel = 0

[State 825, ステート変更]
type = ChangeState
trigger1 = Pos Y >= 0
value = 861
ctrl = 0

;C->R
[Statedef 1236]
type = U
movetype = H
physics = N
ctrl = 0
velset = 0,0
facep2 = 1

[State 826]
type = ChangeAnim2
trigger1 = time = 0
value = 1217

[State 826]
type = SelfState
trigger1 = time >= 139
value = 5100

;=====================<O.M.>==========================
[StateDef 1300]
type = U
movetype = A
physics = N
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 850, ムテキング]
trigger1 = time <= 27
type = NotHitBy
value = SCA

[State 850, Hitdef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
triggerall = (StateType != A)
trigger1 = Time = 0
attr = S, ST
hitflag = M-
priority = 1, Miss
sparkNo=-1 + 0 * (var(33) :=0)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -50
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sprpriority = 1
getpower = 60,30
givepower = 35, 35
ID = 1300
p1stateno = 1301
p2stateno = 1305
guard.dist = 0
fall = 1
air.fall = 1
fall.recover = 0
p2facing = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 823, 音声]
type = PlaySnd
trigger1 = AnimElem = 4
value = 800, 0
channel = 0

[State 850, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;O.M
[Statedef 1301]
type = U
movetype = A
physics = N
anim = 1301
ctrl = 0
poweradd = 0
velset = 0,0

[State 851]
type = PosSet
trigger1 = AnimElem = 3
x = ifelse(target(1300),Facing=-1,target(1300),Pos X + target(1300),const(size.ground.back),target(1300),Pos X - target(1300),const(size.ground.back))
y = target(1300),const(size.head.pos.y)

[State 851]
type = TargetVelSet
triggerall = target(1300),BackEdgeBodyDist < 60
trigger1 = AnimElem = 7
x = (60-target(1300),BackEdgeBodyDist)/4

[State 851]
type = TargetVelSet
trigger1 = AnimElem = 9
x = 0

[State 851]
type = VelSet
trigger1 = AnimElem = 7
x = 2

[State 851]
type = VelAdd
trigger1 = time >= 19
y = 0.5

[State 851]
type = PosAdd
trigger1 = AnimElem = 8
x = 10
y = 10

[State 851]
type = PosSet
trigger1 = Pos Y > 0
y = 0

[State 851]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 1302

;O.M
[Statedef 1302]
type = U
movetype = A
physics = N
anim = 1302
ctrl = 0
velset = 0,0

[State 852, 音声]
type = PlaySnd
trigger1 = AnimElem = 5
value = 5000, 2
channel = 2

[State 852]
type = TargetState
trigger1 = time = 0
ID = 1300
value = 1306

[State 852]
type = TargetState
trigger1 = AnimElem = 4, = 1
ID = 1300
value = 1307

[State 852]
type = BindToTarget
trigger1 = time = 1
ID = 1300
pos = 65, 0, Foot

[State 852, 相手位置]
type = VarSet
trigger1 = 1
fvar(3) = target(1300),Pos x

[State 852, 相手位置]
type = VarSet
trigger1 = 1
fvar(4) = target(1300),Pos y

[State 852]
type = Helper
trigger1 = AnimElem = 5
stateno = 1338
pos = Ceil(fvar(3)), Ceil(fvar(4))
postype = p1
ID = 1302

[State 1006, HitSpark]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8016)
ID = 8000
name = "Spark"
posType = P1
pos = -55, -30
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 861, 音声]
type = PlaySnd
trigger1 = AnimElem = 5
value = 2, 12
channel = 0

[State 852, 掴んだ相手のライフ増減,通常]
type = TargetLifeAdd
triggerall = prevstateno = 1301
trigger1 = var(10) = 0
trigger1 = AnimTime = -5
value =-ceil(((10*6.67)+((8*6.67)*fvar(11)))*const(data.attack)*0.01) ;(19,8)

[State 852, 掴んだ相手のライフ増減,通常]
type = TargetLifeAdd
triggerall = prevstateno = 1301
trigger1 = var(10) = 1
trigger1 = AnimTime = -5
value =-ceil(((12*6.67)+((8*6.67)*fvar(11)))*const(data.attack)*0.01) ;(19,8)

[State 852, 掴んだ相手のライフ増減,通常]
type = TargetLifeAdd
triggerall = prevstateno = 1301
trigger1 = var(10) = 2
trigger1 = AnimTime = -5
value =-ceil(((13*6.67)+((8*6.67)*fvar(11)))*const(data.attack)*0.01) ;(19,8)

[State 852, 掴んだ相手のライフ増減,ＥＳ]
type = TargetLifeAdd
triggerall = prevstateno = 1332
trigger1 = AnimTime = -5
value =-ceil(((9*6.67)+((4*6.67)*fvar(11)))*const(data.attack)*0.01) ;(9,4)

[State 852]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;Player 2
[Statedef 1305]
type = U
movetype = H
physics = N
anim = 5000
ctrl = 0
poweradd = 0
velset = 0,0

[State 855]
type = ChangeAnim2
trigger1 = time = 0
value = 1305

[State 855]
type = SelfState
trigger1 = time >= 180
value = 5100

;Player 2
[Statedef 1306]
type = U
movetype = H
physics = N
anim = 5
ctrl = 0
poweradd = 0
velset = 0,0

[State 856]
type = NotHitBy
trigger1 = 1
value = SCA

[State 856]
type = PlayerPush
trigger1 = 1
value = 0

[State 856]
type = turn
trigger1 = time = 0

[State 856]
type = ChangeAnim
triggerall = anim != 1306
trigger1 = AnimTime = 0
value = 0

[State 856]
type = SelfState
trigger1 = time >= 180
value = 5100

;M.O
[Statedef 1307]
type = U
movetype = H
physics = N
anim = 5010
ctrl = 0
poweradd = 0
velset = -23, -6

[State 857]
type = PosSet
trigger1 = time = 0
y = -50

[State 857]
type = ChangeAnim2
trigger1 = time = 0
value = 1306

[State 857, カメラ固定]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 857]
type = ChangeState
trigger1 = BackEdgeBodyDist <= 5
value = 1308

;Player 2
[Statedef 1308]
type = U
movetype = H
physics = N
anim = 5010
ctrl = 0
poweradd = 0
velset = 0, 0

[State 858]
type = ChangeAnim2
trigger1 = time = 0
value = 1306

[State 858, カメラ固定]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 858]
type = ChangeState
trigger1 = time >= 19
value = 1309

;Player 2
[Statedef 1309]
type = A
movetype = H
physics = N
poweradd = 0
ctrl = 0
velset = 0,0
anim = 5050

[State 859]
type = PosAdd
trigger1 = time = 0
y = -Const(size.mid.pos.y)

[State 859]
type = VelSet
trigger1 = time = 0
x = -1
y = -3

[State 859]
trigger1 = 1
type = NotHitBy
value = SCA

[State 859]
type = ChangeAnim2
trigger1 = time = 0
value = 3209

[State 859]
type = VelAdd
trigger1 = Time >= 6
y = .35

[State 859]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;========================<EX O.M.>=============================
[StateDef 1330]
type = U
movetype = A
physics = N
anim = 1330
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1130, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1130, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1130, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 161

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-55 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 860, ムテキング]
trigger1 = time <= 36
type = NotHitBy
value = SCA

[State 860, Hitdef]
type = HitDef
triggerall = (StateType != A)
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = Time = 0
attr = S, ST
hitflag = M-
priority = 1, Miss
pausetime = 10, 10
sparkNo=-1 + 0 * (var(33) :=0)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -50
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sprpriority = 1
getpower=0, 0
givepower=35, 35
ID = 1300
p1stateno = 1331
p2stateno = 1204
guard.dist = 0
fall = 1
air.fall = 1
fall.recover = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 823, 音声]
type = PlaySnd
trigger1 = AnimElem = 4
value = 800, 0
channel = 0

[State 860, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;EX O.M.
[Statedef 1331]
type = U
movetype = A
physics = N
poweradd = 0
ctrl = 0
velset = 0,0
anim = 1203
sprpriority = 1
facep2 = 1
hitcountpersist = 1

[State 861]
type = PosAdd
trigger1 = AnimElem = 1
x = (P2Dist X-60)

[State 861, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 3
pos = 45, 0

[State 861, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 4
pos = 25, 0

[State 861, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 5
pos = 20, 0

[State 861, 掴んだ相手のライフ増減]
type = TargetLifeAdd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 14
value =-ceil(((2*6.67)+((3*6.67)*fvar(11)))*const(data.attack)*0.01) ;(7,3)
kill = 0

[State 861,針]
type = Explod
trigger1 = AnimElem = 9
anim = 1205
ID = 1205
pos = 0, 0
postype = p1
sprpriority = -3
bindtime =  999

[State 1006, HitSpark]
type = Helper
trigger1 = AnimElem = 9
trigger2 = AnimElem = 14
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8016)
ID = 8000
name = "Spark"
posType = P1
pos = 35, -30
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 861, 音声]
type = PlaySnd
trigger1 = AnimElem = 8
trigger2 = AnimElem = 13
value = 2, 12
channel = 0

[State 861, ステート変更]
type = RemoveExplod
trigger1 = AnimElem = 17
ID = 1205

[State 861, ステート変更]
type = ChangeState
trigger1 = AnimElem = 17
value = 1332

;EX O.M.
[Statedef 1332]
type = U
movetype = A
physics = N
anim = 1331
ctrl = 0
velset = 0,0

[State 861]
type = TargetState
trigger1 = AnimElem = 2
value = 1305

[State 861]
type = PosSet
trigger1 = AnimElem = 3
x = ifelse(target(1300),Facing=-1,target(1300),Pos X + target(1300),const(size.ground.back),target(1300),Pos X - target(1300),const(size.ground.back))
y = target(1300),const(size.head.pos.y)

[State 861]
type = TargetVelSet
triggerall = target(1300),BackEdgeBodyDist < 60
trigger1 = AnimElem = 7
x = (60-target(1300),BackEdgeBodyDist)/4

[State 861]
type = TargetVelSet
trigger1 = AnimElem = 9
x = 0

[State 861]
type = VelSet
trigger1 = AnimElem = 7
x = 2

[State 861]
type = VelAdd
trigger1 = time >= 19
y = 0.5

[State 861]
type = PosAdd
trigger1 = AnimElem = 8
x = 10
y = 10

[State 861]
type = PosSet
trigger1 = Pos Y > 0
y = 0

[State 861]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 1302

;Sting
[Statedef 1338]
type = A
movetype = I
physics = N
anim = 1337
ctrl = 0
poweradd = 0
velset = 0,0
sprpriority = 5

[State 868]
type = Explod
trigger1 = time = 0
anim = 1339
pos = 0, 0
postype = p1
bindtime = 9999
scale = 0.9, 1
sprpriority = -1
ID = 1339

[State 868]
type = PosSet
trigger1 = 1
x = Root,fvar(3)
y = Root,fvar(4)

[State 868]
type = ChangeState
trigger1 = Enemynear,BackEdgeBodyDist <= 5
value = 1339

;Sting
[Statedef 1339]
type = A
movetype = I
physics = N
anim = 1338
ctrl = 0
poweradd = 0
velset = 0,0
sprpriority = 5

[State 869]
type = RemoveExplod
trigger1 = time >= 20
ID = 1339

[State 869]
type = DestroySelf
trigger1 = time >= 20

;========================<PUNCH ZERO COUNTER>=============================
[StateDef 2900]
type = S
physics = N
moveType = A
anim = 2900
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 2900, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2900, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 2900, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2
channel = 1

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = Time = 0
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getpower = 0,0
givePower = 36, 36
pauseTime = 12, 12
guard.pauseTime = 12, 12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.54, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.54, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 2900, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;========================<KICK ZERO COUNTER>=============================
[StateDef 2910]
type = S
physics = N
moveType = A
anim = 2910
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 2910, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4, 4
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 440]
type = VelSet
trigger1 = AnimElem = 4
x = 3

[State 440]
type = VelSet
trigger1 = AnimElem = 6
x = 8.5

[State 440]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 6
attr = C, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 72 < 7, 7, fvar(11) * 72)), 0
getpower = 0,0
givepower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.54, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.54, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 12)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 96), var(36) := -5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(7) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
