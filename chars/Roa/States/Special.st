; _________________________________________
;| Roa by varo_hades                       |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<SPECIAL MOVES>=======================================
;==============================================================================================

;=====================<FLASH SPARK>==========================
[StateDef 1000]
type = S
physics = S
moveType = A
anim = 1000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 20 * !var(20)
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
value = ifElse(var(10) = 2, 1002, ifElse(var(10) = 1, 1001, 1000))

[state 1300,bolii]
type=playsnd
trigger1=!animelemtime(5)
value= 1200,5
volumescale=100
channel=0

[state 1300,avaaz]
type=playsnd
trigger1=!animelemtime(5)
value= 1,2
volumescale=100

[state 1300,Spark]
type=helper
trigger1=!animelemtime(6)
helpertype=normal
name="Flash Spark proyectile"
ID=1005
stateno=1005
postype=p1
pos=40,-40
facing=1
ownpal=1
keyctrl=0
size.xscale= ifElse(var(10) = 2, 0.5, ifElse(var(10) = 1, 0.45, 0.4))
size.yscale= ifElse(var(10) = 2, 0.5, ifElse(var(10) = 1, 0.45, 0.4))

[state 1300,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[state 1300,bekaar]
type=statetypeset
trigger1=!animelemtime(9)
movetype=I

[state 1300,badalna]
type=changestate
trigger1=!animtime
value=0
ctrl=1

;========================<EX FLASH SPARK>=============================
[StateDef 1030]
type = S
physics = S
moveType = A
anim = 1003
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
var(25) = 34

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

[state 1300,bolii]
type=playsnd
trigger1=!animelemtime(5)
value= 1200,5
volumescale=100
channel=0

[state 1300,avaaz]
type=playsnd
trigger1=!animelemtime(5)
value= 1,2
volumescale=100

[state 1300,avaaz]
type=playsnd
trigger1=!animelemtime(6)
value= 1,4
volumescale=100

[state 1300,hilaav]
type=envshake
trigger1=!animelemtime(6)
time=10
ampl=5

[state 1300,Spark]
type=helper
trigger1=!animelemtime(6)
helpertype=normal
name="Flash Spark proyectile"
ID=1035
stateno=1035
postype=p1
pos=40,-40
facing=1
ownpal=1
keyctrl=0
size.xscale= 0.75
size.yscale= 0.75

[state 1300,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[state 1300,bekaar]
type=statetypeset
trigger1=!animelemtime(9)
movetype=I

[state 1300,badalna]
type=changestate
trigger1=!animtime
value=0
ctrl=1

;========================<RISING SHOCK>=============================
[StateDef 1100]
type = S
physics = S
moveType = A
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[State 1100, Button Detect]
type = VarSet
trigger1 = PrevStateNo = 751
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" || command = "rlsz"), 1, ifElse((command = "y" || command = "rlsy"), 1, 1))

[State 1100, Button Detect]
type = VarSet
trigger1 = PrevStateNo != 751
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1102, ifElse(var(10) = 1, 1101, 1100))

[state 1400,murna]
type=varset
trigger1=!time
var(12)=2+(var(10)=3)

[state 1400,murna]
type=varadd
trigger1=var(10)=[2,3]
trigger1=!animelemtime(6)
var(12)=-1

[state 1400,murna]
type=changeanim
trigger1=var(10)=[2,3]
trigger1=var(12)
trigger1=!animelemtime(6)
value=anim
elem=4

[state 1400,murna]
type=varset
trigger1=!animelemtime((5*(var(10)=0))+(6*(var(10)>0)))
var(12)=2

[state 1400,murna]
type=varadd
trigger1=!animelemtime((8*(var(10)=0))+(9*(var(10)>0)))
var(12)=-1

[state 1400,murna]
type=changeanim
trigger1=var(12)
trigger1=!animelemtime((8*(var(10)=0))+(9*(var(10)>0)))
value=anim
elem=(6*(var(10)=0))+(7*(var(10)>0))

[state 1400,ajay]
type=nothitby
trigger1=var(10)=[2,3]
trigger1=animelemtime(2+(var(10)=3))<0
value=SCA
time=1

[state 1400,roop]
type=statetypeset
trigger1=!animelemtime(3)
statetype=A
physics=N

[state 1400,bolii]
type=playsnd
trigger1=!animelemtime(3)
value= 1100,0
volumescale=100
channel=0

[state 1400,avaaz]
type=playsnd
trigger1=!animelemtime((5*(var(10)=0))+(6*(var(10)>0)))
value= 1,2
volumescale=100

[state 1400,avaaz]
type=playsnd
trigger1=!animelemtime((5*(var(10)=0))+(6*(var(10)>0)))
value= 811,0
volumescale=100

[state 1400,avaaz]
type=playsnd
trigger1=!animelemtime(3)
value= 40,0
volumescale=100

[state 1400,shiighrataa]
type=velset
trigger1=!animelemtime(3)
x=(5.859375*(var(10)=0))+(7.03125*(var(10)=1))+(8.203125*(var(10)=2))+(9.375*(var(10)=3))
y=(-8.59375*(var(10)=0))+(-9.765625*(var(10)=1))+(-10.9375*(var(10)=2))+(-12.109375*(var(10)=3))

[state 1400,shiighrataa]
type=veladd
trigger1=animelemno(0)=[3,5]
x=-0.390625

[state 1400,shiighrataa]
type=velset
trigger1=!animelemtime((8*(var(10)=0))+(6*(var(10)>0)))
x=1.953125
persistent=0

[state 1400,shiighrataa]
type=veladd
trigger1=animelemtime(3)>0
y=0.546875

;[state 1400,Energy]
;type=helper
;trigger1=!animelemtime(3)
;helpertype=normal
;name="Energy"
;ID=1115
;stateno=10000
;facing=1
;ownpal=1
;keyctrl=0
;size.xscale=0.5
;size.yscale=0.5

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 1
ID = 1115
pos = 0,0
scale = 0.5,0.5
posType = P1
bindTime = 2

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 2
ID = 1115
pos = 0,0
scale = 0.5,0.5
posType = P1
bindTime = 2

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 3
ID = 1115
pos = 0,0
scale = 0.5,0.5
posType = P1
bindTime = 2

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 4
ID = 1115
pos = 0,0
scale = 0.5,0.5
posType = P1
bindTime = 2

[State 1100, Shoryuken Flames Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 1115
ID = 1115
sprPriority = 3
bindTime = 2
posType = P1
pos = 0,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 6
ID = 1115
pos = 0,0
scale = 0.5,0.5
posType = P1
bindTime = 2

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 7
ID = 1115
pos = 0,0
scale = 0.5,0.5
posType = P1
bindTime = 2

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 9
ID = 1115
pos = 0,0
scale = 0.5,0.5
posType = P1
bindTime = 19

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 10
ID = 1115
pos = 0,0
scale = 0.5,0.5
posType = P1
bindTime = 19

[State 1100, Dust Helper]
type = Helper
trigger1 = !animelemtime(3)
helperType = Normal
stateNo = 8100
ID = 8100
name = "Dust"
posType = P1
ownPal = 1

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 28, ifElse(var(10), 28, 28)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 28, ifElse(var(10), 28, 28)))), 10
getpower = 15,7
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 8)
guard.pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 12)
animType = Hard
air.animType = back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifelse(var(20), -1.36, -2.5), -8.5
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -1.36, -2.5), -7.5
air.cornerPush.velOff = 0
yaccel = Ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -70
envshake.time=10
envshake.ampl=4
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=32

[State 1100, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = var(10) != 0
trigger1 = AnimElem = 4 && anim = [1101,1102]
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 18, ifElse(var(10), 18, 18)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 18, ifElse(var(10), 18, 18)))), 8
getpower = 15,7
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Hard
air.animType = back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifelse(var(20), -1.36, -2.5), -8
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -1.36, -2.5), -7.5
air.cornerPush.velOff = 0
yaccel = Ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -70
envshake.time=10
envshake.ampl=4
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=32

[State 1100, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = var(10) = 2
trigger1 = AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 18, ifElse(var(10), 18, 18)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 18, ifElse(var(10), 18, 18)))), 6
getpower = 15,7
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Hard
air.animType = back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifelse(var(20), -1.36, -2.5), -8.5
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -1.36, -2.5), -7.5
air.cornerPush.velOff = 0
yaccel = Ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -70
envshake.time=10
envshake.ampl=4
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=32

[State 1100, HitDef 4]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 5 && anim = 1100
trigger2 = AnimElem = 6 && anim = [1101,1102]
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 18, ifElse(var(10), 18, 18)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 18, ifElse(var(10), 18, 18)))), 6
getpower = 15,7
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Hard
air.animType = back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifelse(var(20), -1.36, -2), -11.5
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -1.36, -2), -11.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -70
envshake.time=10
envshake.ampl=4
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=32

[state 1355,Target_ID]
type=parentvarset
trigger1=movecontact=1
trigger1=numtarget
trigger1=!MoveGuarded
trigger1=var(55):=target,id
var(55)=target,id
ignorehitpause=1
persistent=0

[state 1355,electricity]
type=helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = !MoveGuarded
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[state 1400,bekaar]
type=statetypeset
trigger1=!animelemtime((8*(var(10)=0))+(9*(var(10)>0)))
movetype=I

[state 1400,badalna]
type=changestate
trigger1=pos y>=0
trigger1=vel y>0
value=1101
ctrl=0

;Landing
[StateDef 1101]
type = S
anim = 1105
physics = N
moveType = I
velSet = 0,0

[state 1405,dharna]
type=posset
trigger1=!time
y=0

[State 1101, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1101, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1101, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1101, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1101, End]
type = null;ChangeState
trigger1 = AnimElemTime(2) = 2 && command = "holddown"
value = 11
ctrl = 1

[State 1101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;========================<EX RISING SHOCK>=============================
[StateDef 1130]
type = S
physics = S
moveType = A
anim = 1103
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
var(25) = 41

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

[state 1400,murna]
type=varset
trigger1=!time
var(12)=2+(var(10)=3)

[state 1400,murna]
type=varadd
trigger1=var(10)=[2,3]
trigger1=!animelemtime(6)
var(10)=-1

[state 1400,murna]
type=changeanim
trigger1=var(10)=[2,3]
trigger1=var(12)
trigger1=!animelemtime(6)
value=anim
elem=4

[state 1400,murna]
type=varset
trigger1=!animelemtime((5*(var(10)=0))+(6*(var(10)>0)))
var(12)=2

[state 1400,murna]
type=varadd
trigger1=!animelemtime((8*(var(10)=0))+(9*(var(10)>0)))
var(12)=-1

[state 1400,murna]
type=changeanim
trigger1=var(12)
trigger1=!animelemtime((8*(var(10)=0))+(9*(var(10)>0)))
value=anim
elem=(6*(var(10)=0))+(7*(var(10)>0))

[state 1400,ajay]
type=nothitby
trigger1=var(10)=[2,4]
trigger1=animelemtime(2+(var(10)=3))<0
value=SCA
time=1

[state 1400,roop]
type=statetypeset
trigger1=!animelemtime(3)
statetype=A
physics=N

[state 1400,bolii]
type=playsnd
trigger1=!animelemtime(3)
value= 1200,0
volumescale=100
channel=0

[state 1400,avaaz]
type=playsnd
trigger1=!animelemtime((5*(var(10)=0))+(6*(var(10)>0)))
value= 1,2
volumescale=100

[state 1400,avaaz]
type=playsnd
trigger1=!animelemtime((5*(var(10)=0))+(6*(var(10)>0)))
value= 811,0
volumescale=100

[state 1400,avaaz]
type=playsnd
trigger1=!animelemtime(3)
value= 40,0
volumescale=100

[state 1400,shiighrataa]
type=velset
trigger1=!animelemtime(3)
x=(5.859375*(var(10)=0))+(7.03125*(var(10)=1))+(8.203125*(var(10)=2))+(9.375*(var(10)=3))
y=(-8.59375*(var(10)=0))+(-9.765625*(var(10)=1))+(-10.9375*(var(10)=2))+(-12.109375*(var(10)=3))

[state 1400,shiighrataa]
type=veladd
trigger1=animelemno(0)=[3,5]
x=-0.390625

[state 1400,shiighrataa]
type=velset
trigger1=!animelemtime((8*(var(10)=0))+(6*(var(10)>0)))
x=1.953125
persistent=0

[state 1400,shiighrataa]
type=veladd
trigger1=animelemtime(3)>0
y=0.546875

;[state 1400,Energy]
;type=helper
;trigger1=!animelemtime(3)
;helpertype=normal
;name="Energy"
;ID=1020
;stateno=1000
;facing=1
;ownpal=1
;keyctrl=0
;size.xscale=0.5
;size.yscale=0.5

[State 1130, Dust Helper]
type = Helper
trigger1 = !animelemtime(3)
helperType = Normal
stateNo = 8100
ID = 8100
name = "Dust"
posType = P1
ownPal = 1

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 1
ID = 1115
pos = 0,0
scale = 0.5,0.5
posType = P1
bindTime = 2

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 2
ID = 1115
pos = 0,0
scale = 0.5,0.5
posType = P1
bindTime = 2

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 3
ID = 1115
pos = 0,0
scale = 0.5,0.5
posType = P1
bindTime = 2

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 4
ID = 1115
pos = 0,0
scale = 0.5,0.5
posType = P1
bindTime = 2

[State 1100, Shoryuken Flames Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 1115
ID = 1115
sprPriority = 3
bindTime = 2
posType = P1
pos = 0,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 6
ID = 1115
pos = 0,0
scale = 0.5,0.5
posType = P1
bindTime = 2

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 7
ID = 1115
pos = 0,0
scale = 0.5,0.5
posType = P1
bindTime = 2

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 9
ID = 1115
pos = 0,0
scale = 0.5,0.5
posType = P1
bindTime = 19

[State 1100, ModifyExplod]
type = ModifyExplod
trigger1 = AnimElem = 10
ID = 1115
pos = 0,0
scale = 0.5,0.5
posType = P1
bindTime = 19

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 8)
guard.pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 12)
animType = Hard
air.animType = back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -10.5
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -70
envshake.time=10
envshake.ampl=4
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=32

[State 1100, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 4
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Hard
air.animType = back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -10.5
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -70
envshake.time=10
envshake.ampl=4
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=32

[State 1100, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = AnimElem = 5
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Hard
air.animType = back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -10.5
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -70
envshake.time=10
envshake.ampl=4
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=32

[State 1100, HitDef 4]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = AnimElem = 6
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 6
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Hard
air.animType = back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -10.5
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -70
envshake.time=10
envshake.ampl=4
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=32

[State 1100, HitDef 5]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = AnimElem = 7
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 6
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -10.5
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -2, -10.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -70
envshake.time=10
envshake.ampl=4
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=32
id=1130
;p2stateno=1050

[state 1355,Target_ID]
type=parentvarset
trigger1=movecontact=1
trigger1=numtarget
trigger1=!MoveGuarded
trigger1=var(55):=target,id
var(55)=target,id
ignorehitpause=1
persistent=0

[state 1355,electricity]
type=helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = !MoveGuarded
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[state 1400,bekaar]
type=statetypeset
trigger1=!animelemtime((8*(var(10)=0))+(9*(var(10)>0)))
movetype=I

[state 1400,badalna]
type=changestate
trigger1=pos y>=0
trigger1=vel y>0
value=1101
ctrl=0

;=====================<LIGHTNING TRAP>==========================
[StateDef 1200]
type = S
physics = S
moveType = I
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 20 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[state 1500,shakti]
type=varset
trigger1=!time
trigger1=ailevel
trigger1=numhelper(1210)
trigger1=helper(1210),parentdist x-p2dist x=[-15,15]
var(10)=0

[state 1500,shakti]
type=varset
trigger1=!time
trigger1=ailevel
trigger1=numhelper(1211)
trigger1=helper(1211),parentdist x-p2dist x=[-15,15]
var(10)=1

[state 1500,shakti]
type=varset
trigger1=!time
trigger1=ailevel
trigger1=numhelper(1212)
trigger1=helper(1212),parentdist x-p2dist x=[-15,15]
var(10)=2

[state 1500,dharna]
type=posset
trigger1=!time
y=0

[state 1500,anim]
type=changeanim
trigger1=!time
value=1200

[state 1500,anim]
type=changeanim
triggerall=!time
trigger1=var(10)=0
trigger1=numhelper(1210)
trigger1=helper(1210),animelemtime(10)<=0
trigger2=var(10)=1
trigger2=numhelper(1211)
trigger2=helper(1211),animelemtime(10)<=0
trigger3=var(10)=2
trigger3=numhelper(1212)
trigger3=helper(1212),animelemtime(10)<=0
value=1205

[state 1500,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[state 1500,roop]
type=statetypeset
triggerall=!time
trigger1=var(10)=0
trigger1=numhelper(1210)
trigger1=helper(1210),animelemtime(10)<=0
trigger2=var(10)=1
trigger2=numhelper(1211)
trigger2=helper(1211),animelemtime(10)<=0
trigger3=var(10)=2
trigger3=numhelper(1212)
trigger3=helper(1212),animelemtime(10)<=0
movetype=A

[state 1500,bolii]
type=playsnd
trigger1=!animelemtime(5)
value= 1200,7+(2*(anim=1205))
volumescale=100
channel=0

[state 1500,avaaz]
type=playsnd
trigger1=!animelemtime(5)
value= 1,2
volumescale=100

[state 1500,Trap]
type=helper
trigger1=anim=1200
trigger1=!animelemtime(6)
helpertype=normal
name="Trap"
ID=1210+var(10)
stateno=1210+var(10)
postype=p1
pos=(40*(var(10)=0))+(121*(var(10)=1))+(202*(var(10)=2)),-16
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5

[state 1500,bekaar]
type=statetypeset
trigger1=!animelemtime(9)
movetype=I

[state 1500,badalna]
type=changestate
trigger1=!animtime
value=0
ctrl=1

;========================<EX LIGHTNING TRAP>=============================
[StateDef 1230]
type = S
physics = S
moveType = I
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
var(25) = 34

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

[state 1500,shakti]
type=varset
trigger1=!time
trigger1=ailevel
trigger1=numhelper(1260)
trigger1=helper(1260),parentdist x-p2dist x=[-15,15]
var(10)=3

[state 1500,dharna]
type=posset
trigger1=!time
y=0

[state 1500,anim]
type=changeanim
trigger1=!time
value=1200

[state 1500,anim]
type=changeanim
triggerall=!time
trigger1=var(10)=3
trigger1=numhelper(1260)
trigger1=helper(1260),animelemtime(10)<=0
value=1205

[state 1500,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[state 1500,roop]
type=statetypeset
triggerall=!time
trigger1=var(10)=3
trigger1=numhelper(1260)
trigger1=helper(1260),animelemtime(10)<=0
movetype=A

[state 1500,bolii]
type=playsnd
trigger1=!animelemtime(5)
value= 1200,7+(2*(anim=1205))
volumescale=100
channel=0

[state 1500,avaaz]
type=playsnd
trigger1=!animelemtime(5)
value= 1,2
volumescale=100

[state 1500,Trap]
type=helper
trigger1=anim=1200
trigger1=!animelemtime(6)
helpertype=normal
name="Trap"
ID=1260
stateno=1260
postype=p1
pos=ceil(P2BodyDist X * const(size.yScale)),-16
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5

[state 1500,bekaar]
type=statetypeset
trigger1=!animelemtime(9)
movetype=I

[state 1500,badalna]
type=changestate
trigger1=!animtime
value=0
ctrl=1

;=====================<LIGHTNING TRAP>==========================
[StateDef 1250]
type = A
physics = N
moveType = I
anim = 1250
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 20 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[state 1600,anim]
type=changeanim
trigger1=!time
value=1250

[state 1600,anim]
type=changeanim
triggerall=!time
trigger1=var(10)=0
trigger1=numhelper(1210)
trigger1=helper(1210),animelemtime(10)<=0
trigger2=var(10)=1
trigger2=numhelper(1211)
trigger2=helper(1211),animelemtime(10)<=0
trigger3=var(10)=2
trigger3=numhelper(1212)
trigger3=helper(1212),animelemtime(10)<=0
value=1255

[state 1600,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[state 1600,roop]
type=statetypeset
triggerall=!time
trigger1=var(10)=0
trigger1=numhelper(1210)
trigger1=helper(1210),animelemtime(10)<=0
trigger2=var(10)=1
trigger2=numhelper(1211)
trigger2=helper(1211),animelemtime(10)<=0
trigger3=var(10)=2
trigger3=numhelper(1212)
trigger3=helper(1212),animelemtime(10)<=0
movetype=A

[state 1600,bolii]
type=playsnd
trigger1=!animelemtime(4)
value= 1200,7+(2*(anim=1255))
volumescale=100
channel=0

[state 1600,avaaz]
type=playsnd
trigger1=!animelemtime(4)
value= 1,2
volumescale=100

[state 1600,shiighrataa]
type=veladd
trigger1=animelemtime(9)>0
y=0.5625

[state 1600,Trap]
type=helper
trigger1=anim=1250
trigger1=!animelemtime(5)
helpertype=normal
name="Trap"
ID=1210+var(10)
stateno=1280+var(10)
postype=p1
pos=40,-40
facing=1
ownpal=1
Persistent = 0
keyctrl=0
size.xscale=0.5
size.yscale=0.5

[state 1500,bekaar]
type=statetypeset
trigger1=!animelemtime(8)
movetype=I

[state 1600,badalna]
type=changestate
trigger1=pos y>=0
trigger1=vel y>0
value=1251
ctrl=0

;Landing
[StateDef 1251]
type = S
anim = 1105
physics = N
moveType = I
velSet = 0,0

[state 1405,dharna]
type=posset
trigger1=!time
y=0

[State 1101, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1101, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1101, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1101, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1101, End]
type = null;ChangeState
trigger1 = AnimElemTime(2) = 2 && command = "holddown"
value = 11
ctrl = 1

[State 1101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;========================<EX LIGHTNING TRAP AIR>=============================
[StateDef 1270]
type = A
physics = N
moveType = I
anim = 1250
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
var(25) = 34

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

[state 1500,anim]
type=changeanim
trigger1=!time
value=1250

[state 1500,anim]
type=changeanim
triggerall=!time
trigger1=var(10)=3
trigger1=numhelper(1260)
trigger1=helper(1260),animelemtime(10)<=0
value=1255

[state 1500,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[state 1500,roop]
type=statetypeset
triggerall=!time
trigger1=var(10)=3
trigger1=numhelper(1260)
trigger1=helper(1260),animelemtime(10)<=0
movetype=A

[state 1500,bolii]
type=playsnd
trigger1=!animelemtime(5)
value= 1200,7+(2*(anim=1255))
volumescale=100
channel=0

[state 1500,avaaz]
type=playsnd
trigger1=!animelemtime(5)
value= 1,2
volumescale=100

[state 1600,shiighrataa]
type=veladd
trigger1=animelemtime(9)>0
y=0.5625

[state 1500,Trap]
type=helper
trigger1=anim=1250
trigger1=!animelemtime(6)
helpertype=normal
name="Trap"
ID=1260
stateno=1290
postype=p1
pos=40,-40
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5

[state 1500,bekaar]
type=statetypeset
trigger1=!animelemtime(8)
movetype=I

[state 1600,badalna]
type=changestate
trigger1=pos y>=0
trigger1=vel y>0
value=1251
ctrl=0

;========================<STATIC SLASH>=============================
[StateDef 1300]
type = S
physics = S
moveType = A
anim = 1300
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

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1302, ifElse(var(10) = 1, 1301, 1300))

[state 1700,murna]
type=varset
trigger1=var(10)=3
trigger1=!time
var(12)=4

[state 1700,murna]
type=varadd
trigger1=var(10)=3
trigger1=!animelemtime(11)
var(12)=-1

[state 1700,murna]
type=changeanim
trigger1=var(10)=3
trigger1=var(12)
trigger1=!animelemtime(11)
value=anim
elem=9

[state 1700,bolii]
type=playsnd
trigger1=!animelemtime(4-(1*(var(10)>0)))
value= 1300,(var(10)>0)
volumescale=100
channel=0

[state 1700,avaaz]
type=playsnd
trigger1=!animelemtime(4+(2*(var(10)>0)))
value= 1,2
volumescale=100

[state 1700,avaaz]
type=playsnd
trigger1=var(10)!=3
trigger1=!animelemtime(4-(1*(var(10)>0)))
value= 1300,2
volumescale=100

[state 1700,avaaz]
type=playsnd
trigger1=!animelemtime(4+(2*(var(10)>0)))
value= 1300,3
volumescale=100

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 6
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

;[state 1700,Energy]
;type=helper
;trigger1=var(10)!=3
;trigger1=!animelemtime(6+(2*(var(10)>0)))
;helpertype=normal
;name="Energy"
;ID=1035
;stateno=1000
;postype=p1
;facing=1
;ownpal=1
;keyctrl=0
;size.xscale=0.5
;size.yscale=0.5

[state 1900,prakash]
type=explod
trigger1=!animelemtime(6+(2*(var(10)>0)))
id=1035
anim=1035
postype=p1
facing=1
pos=0,0
ownpal=1
scale=0.5,0.5
sprpriority=5
supermovetime=0
pausemovetime=0

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = animelem = 4
x = 15

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = animelem = 3
x = 25

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = animelem = 3
x = 35

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = animelem = 7
x = 0

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = [1,2]
trigger1 = animelem = 9
x = 0

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = var(10) = 0
trigger1 = !animelemtime(2)
time = 1
value = SCA

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = var(10) = 1
trigger1 = !animelemtime(5)
time = 1
value = SCA

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = var(10) = 2
trigger1 = !animelemtime(6)
time = 1
value = SCA

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = !animelemtime(7+(2*(var(10)>0)))
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 58, ifElse(var(10), 58, 58)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 58, ifElse(var(10), 58, 58)))), 15
getpower = 60,30
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 11), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 11)
animType = Hard
air.animType = back
fall.animType = back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 16
air.hitTime = 120
ground.velocity = ifelse(var(20), -4.36, -8.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -7.5
air.cornerPush.velOff = 0
yaccel = Ifelse(var(20),.5,.6)
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -75
envshake.time=12
envshake.ampl=6
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=32

[state 1355,Target_ID]
type=parentvarset
trigger1=movecontact=1
trigger1=numtarget
trigger1=!MoveGuarded
trigger1=var(55):=target,id
var(55)=target,id
ignorehitpause=1
persistent=0

[state 1355,electricity]
type=helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = !MoveGuarded
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[state 1700,bekaar]
type=statetypeset
trigger1=var(10)!=3
trigger1=!animelemtime(10+(2*(var(11)>0)))
trigger2=var(10)=3
trigger2=!animelemtime(11)
movetype=I

[state 1700,badalna]
type=changestate
trigger1=!animtime
value=0
ctrl=1

;========================<EX STATIC SLASH>=============================
[StateDef 1330]
type = S
physics = S
moveType = A
anim = 1303
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
var(25) = 34

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

[state 1700,murna]
type=varset
trigger1=var(10)=3
trigger1=!time
var(12)=4

[state 1700,murna]
type=varadd
trigger1=var(10)=3
trigger1=!animelemtime(11)
var(12)=-1

[state 1700,murna]
type=changeanim
trigger1=var(10)=3
trigger1=var(12)
trigger1=!animelemtime(11)
value=anim
elem=9

[state 1700,bolii]
type=playsnd
trigger1=!animelemtime(4-(1*(var(10)>0)))
value= 1300,(var(10)>0)
volumescale=100
channel=0

[state 1700,avaaz]
type=playsnd
trigger1=!animelemtime(4+(2*(var(10)>0)))
value= 1,2
volumescale=100

[state 1700,avaaz]
type=playsnd
trigger1=var(10)!=3
trigger1=!animelemtime(4-(1*(var(10)>0)))
value= 1300,2
volumescale=100

[state 1700,avaaz]
type=playsnd
trigger1=!animelemtime(4+(2*(var(10)>0)))
value= 1300,3
volumescale=100

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 7
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pos = -15, 0
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

;[state 1700,Energy]
;type=helper
;trigger1=var(10)!=3
;trigger1=!animelemtime(6+(2*(var(10)>0)))
;helpertype=normal
;name="Energy"
;ID=1035
;stateno=1000
;postype=p1
;facing=1
;ownpal=1
;keyctrl=0
;size.xscale=0.5
;size.yscale=0.5

[state 1900,prakash]
type=explod
trigger1=!animelemtime(7)
id=1040
anim=1040
postype=p1
facing=1
pos=0,0
ownpal=1
scale=0.5,0.5
sprpriority=5
supermovetime=0
pausemovetime=0

[State 1100, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 28

[State 1100, VelSet]
type = VelSet
trigger1 = animelem = 8
x = 0

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = !animelemtime(7)
time = 1
value = SCA

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = !animelemtime(8)
attr = S, SA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 68 < 7, 7, fvar(11) * 68)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 6)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 11)
animType = Hard
ground.type = Trip
air.type = Trip
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 16
air.hitTime = 60
ground.velocity = -0, 10.07
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -0, 10.07
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -35
envshake.time=12
envshake.ampl=6
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=32

[state 1355,Target_ID]
type=parentvarset
trigger1=movecontact=1
trigger1=numtarget
trigger1=!MoveGuarded
trigger1=var(55):=target,id
var(55)=target,id
ignorehitpause=1
persistent=0

[state 1355,electricity]
type=helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = !MoveGuarded
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[state 1700,bekaar]
type=statetypeset
trigger1=var(10)!=3
trigger1=!animelemtime(10+(2*(var(11)>0)))
trigger2=var(10)=3
trigger2=!animelemtime(11)
movetype=I

[state 1700,badalna]
type=changestate
trigger1=!animtime
value=0
ctrl=1

;=====================<LIGHTNING ROD>==========================
[StateDef 1400]
type = S
physics = S
moveType = I
anim = 1400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 20 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[state 1800,anim]
type=changeanim
triggerall=!time
trigger1=var(10)=0
trigger1=var(42)>=9
trigger2=var(10)=1
trigger2=var(42)>=7
trigger3=var(10)=2
value=1402

[state 1800,anim]
type=changeanim
trigger1=var(10)<2
trigger1=anim=stateno
trigger1=!animtime
value=1405+var(10)

[state 1800,murna-Hold]
type=varset
trigger1=var(10)=0
trigger1=!time
var(12)=1

[state 1800,murna-Hold]
type=varset
trigger1=!time
var(11)=0

[state 1800,murna-Hold]
type=varadd
trigger1=anim=1405
trigger1=!animelemtime(8)
trigger1=command="holda"
trigger1=var(11)<999999999
trigger1=var(11):=var(11)+1
var(12)=1

[state 1800,murna-Hold]
type=varadd
trigger1=anim=1405
trigger1=!animelemtime(8)
var(12)=-1

[state 1800,murna-Hold]
type=changeanim
trigger1=anim=1405
trigger1=var(12)
trigger1=!animelemtime(8)
value=anim
elem=2

[state 1800,murna-Hold]
type=changeanim
triggerall=anim=1405
triggerall=var(11)>0
trigger1=command!="holda"
trigger2=ailevel
trigger2=p2bodydist x<100||enemy,numproj||inguarddist
value=anim
elem=8
persistent=0

[state 1800,murna]
type=varset
trigger1=var(10)=1
trigger1=!time
var(12)=5

[state 1800,murna]
type=varadd
trigger1=anim=1406
trigger1=!animelemtime(5)
var(12)=-1

[state 1800,murna]
type=changeanim
trigger1=anim=1406
trigger1=var(12)
trigger1=!animelemtime(5)
value=anim
elem=2

[state 1800,bolii]
type=playsnd
trigger1=anim=[1405,1406]
trigger1=!animelemtime(1)
value= 4,2
volumescale=100
channel=0

[state 1800,avaaz]
type=playsnd
trigger1=anim=[1405,1406]
trigger1=!animelemtime(1)
value= 1,2
volumescale=100

[state 1800,power]
type=varadd
trigger1=anim=[1405,1406]
trigger1=!animelemtime(1)
var(42)=1+(2*(anim=1406))
persistent=0

[state 1800,power]
type=varadd
trigger1=anim=1405
trigger1=animelemno(0)=[2,7]
trigger1=!(time%35)
var(42)=1

[state 1800,Energy]
type=helper
trigger1=anim=[1405,1406]
trigger1=!animelemtime(1)
helpertype=normal
name="Energy"
ID=1410
stateno=1410
postype=p1
pos=-40,0
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5

[state 1800,badalna]
type=changestate
trigger1=var(10)=0
trigger1=var(42)>=(10-(var(11)>0))
trigger1=!animelemtime(2)
trigger2=anim=1402
trigger2=!animtime
value=1415
ctrl=0

[state 1800,badalna]
type=changestate
trigger1=!animtime
value=0
ctrl=1

;Lightning Rod Summon Lightning
[Statedef 1415]
type=S
movetype=A
physics=S
ctrl=0
velset=0,0
poweradd=0
sprpriority=1

[state 1815,dharna]
type=posset
trigger1=!time
y=0

[state 1815,anim]
type=changeanim
trigger1=anim=1405
trigger1=!time
value=1410

[state 1815,anim]
type=changeanim
trigger1=anim=1410
trigger1=!animtime
value=1415

[state 1815,anim]
type=changeanim
trigger1=anim=1402
trigger1=!time
value=1415

[state 1815,murna]
type=varset
trigger1=!time
var(12)=5

[state 1815,murna]
type=varadd
trigger1=anim=stateno
trigger1=!animelemtime(7)
var(12)=-1

[state 1815,murna]
type=changeanim
trigger1=anim=stateno
trigger1=var(12)
trigger1=!animelemtime(7)
value=anim
elem=3

[state 1815,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[state 1815,power]
type=varset
trigger1=var(12)=4
trigger1=!animelemtime(3)
var(42)=0

[state 1815,power]
type=varset
trigger1=!time
var(43)=var(42)

[state 1815,bolii]
type=playsnd
trigger1=var(12)=4
trigger1=!animelemtime(3)
value= 1200,var(43)

[state 1815,Lightning]
type=helper
trigger1=var(12)=4
trigger1=!animelemtime(3)
helpertype=normal
name="Lightning"
ID=1405
stateno=1405
postype=p1
pos=ceil(cond(var(43)>=7,p2dist x,50)),0
facing=1
ownpal=1
keyctrl=0
size.xscale=0.25+(0.1*var(43))
size.yscale=0.5+(0.05*var(43))

[state 1815,badalna]
type=changestate
trigger1=!animtime
value=0
ctrl=1

;========================<EX LIGHTNING ROD>=============================
[StateDef 1430]
type = S
physics = S
moveType = A
anim = 1415
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
var(25) = 34

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

[state 1815,bolii]
type=playsnd
trigger1=!animelemtime(3)
value= 1200,0

[state 1815,dharna]
type=posset
trigger1=!time
y=0

[state 1815,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[state 1815,Lightning]
type=helper
trigger1=!animelemtime(3)
helpertype=normal
name="Lightning"
ID=1435
stateno=1435
postype=p1
pos=ceil(p2dist x),0
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5

[state 1800,badalna]
type=changestate
trigger1=!animtime
value=0
ctrl=1

;=====================<BLINK SHOCK>==========================
[StateDef 1500]
type = S
physics = S
moveType = A
anim = 1500
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
value = ifElse(var(10) = 2, 1502, ifElse(var(10) = 1, 1501, 1500))

[state 1900,murna]
type=varset
trigger1=!time
var(12)=(2*(var(10)=0))+(3*(var(10)=1))+(4*(var(10)=2))+(5*(var(10)=3))

[state 1900,murna]
type=varadd
trigger1=var(10)>0
trigger1=!animelemtime(7)
var(12)=-1

[state 1900,murna]
type=changeanim
trigger1=var(10)>0
trigger1=var(12)
trigger1=!animelemtime(7)
value=anim
elem=5

[state 1900,roop]
type=angledraw
trigger1=!var(10)||var(10)=3
trigger1=animelemno(0)=[8,10]
trigger2=var(10)=[1,2]
trigger2=animelemno(0)=[9,11]
scale=0.65,0.55
ignorehitpause=1

[state 1900,roop]
type=trans
trigger1=!var(10)||var(10)=3
trigger1=animelemno(0)=[8,10]
trigger2=var(10)=[1,2]
trigger2=animelemno(0)=[9,11]
trans=addalpha
alpha=256,256
ignorehitpause=1

[state 1900,ajay]
type=nothitby
trigger1=!var(10)||var(10)=3
trigger1=animelemno(0)=[9,11]
trigger2=var(10)=[1,2]
trigger2=animelemno(0)=[10,12]
value=SCA

[state 1900,bolii]
type=playsnd
trigger1=!animelemtime(7+(var(10)=[1,2]))
value= 1500,0
volumescale=100
channel=0

[state 1900,avaaz]
type=playsnd
trigger1=!animelemtime(7+(var(10)=[1,2]))
value= 1500,2
volumescale=100

[state 1900,prakash]
type=explod
trigger1=!animelemtime(7+(var(10)=[1,2]))
id=1065
anim=1065
postype=back
pos=128,215
bindtime=-1
removetime=-2
random=0,0
velocity=0,0
accel=0,0
ownpal=1
scale=0.5,0.5
sprpriority=5
supermovetime=0
pausemovetime=0

[state 1900,Energy]
type=helper
trigger1=!animelemtime(3)
helpertype=normal
name="Energy"
ID=1505
stateno=1505
postype=p1
pos=0,0
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5

;[state 1900,Energy]
;type=helper
;trigger1=!animelemtime(11+(var(10)=[1,2]))
;helpertype=normal
;name="Energy"
;ID=1070
;stateno=1000
;postype=p1
;facing=1
;ownpal=1
;keyctrl=0
;size.xscale=0.65
;size.yscale=0.55

[state 1900,prakash]
type=explod
trigger1=!animelemtime(7+(var(10)=[1,2]))
id=1070
anim=1070
postype=p1
facing=1
pos=0,0
ownpal=1
scale=0.65,0.65
sprpriority=5
supermovetime=0
pausemovetime=0

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = animelem = 7
x = 25

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = animelem = 8
x = 40

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = animelem = 8
x = 70

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = animelem = 11
x = 0

[State 1100, VelSet]
type = VelSet
trigger1 = var(10) = [1,2]
trigger1 = animelem = 12
x = 0

[State 1100, NotHitBy]
type = NotHitBy
triggerall = var(10) = 0
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 1100, NotHitBy]
type = NotHitBy
triggerall = var(10) = 1
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 1100, NotHitBy]
type = NotHitBy
triggerall = var(10) = 2
trigger1 = AnimElemTime(8) < 0
time = 1
value = SCA

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !animelemtime(7+(1*(var(10)>0)))
attr = S, SA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 58, ifElse(var(10), 58, 58)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 58, ifElse(var(10), 58, 58)))), 15
getpower = 60,30
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 12)
animType = Hard
ground.type = Trip
air.type = Trip
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.25, 10.75
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -0.25, 10.75
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -25
envshake.time=12
envshake.ampl=6
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=32

[state 1355,Target_ID]
type=parentvarset
trigger1=movecontact=1
trigger1=numtarget
trigger1=!MoveGuarded
trigger1=var(55):=target,id
var(55)=target,id
ignorehitpause=1
persistent=0

[state 1355,electricity]
type=helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = !MoveGuarded
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[state 1900,bekaar]
type=statetypeset
trigger1=!animelemtime(12+(var(10)=[1,2]))
movetype=I

[state 1900,badalna]
type=changestate
trigger1=!animtime
value=0
ctrl=1

;========================<EX BLINK SHOCK>=============================
[StateDef 1530]
type = S
physics = S
moveType = A
anim = 1500
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
var(25) = 34

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

[state 1900,murna]
type=varset
trigger1=!time
var(12)=(2*(var(10)=0))+(3*(var(10)=1))+(4*(var(10)=2))+(5*(var(10)=3))

[state 1900,murna]
type=varadd
trigger1=var(10)>0
trigger1=!animelemtime(7)
var(12)=-1

[state 1900,murna]
type=changeanim
trigger1=var(10)>0
trigger1=var(12)
trigger1=!animelemtime(7)
value=anim
elem=5

[state 1900,roop]
type=angledraw
trigger1=!var(10)||var(10)=3
trigger1=animelemno(0)=[8,10]
trigger2=var(10)=[1,2]
trigger2=animelemno(0)=[9,11]
scale=0.65,0.55
ignorehitpause=1

[state 1900,roop]
type=trans
trigger1=!var(10)||var(10)=3
trigger1=animelemno(0)=[8,10]
trigger2=var(10)=[1,2]
trigger2=animelemno(0)=[9,11]
trans=addalpha
alpha=256,256
ignorehitpause=1

[State 1900, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(10) < 0
time = 1
value = SCA

[state 1900,ajay]
type=null;nothitby
trigger1=!var(10)||var(10)=3
trigger1=animelemno(0)=[9,11]
trigger2=var(10)=[1,2]
trigger2=animelemno(0)=[10,12]
value=SCA

[state 1900,bolii]
type=playsnd
trigger1=!animelemtime(7+(var(10)=[1,2]))
value= 1500,0
volumescale=100
channel=0

[state 1900,avaaz]
type=playsnd
trigger1=!animelemtime(7+(var(10)=[1,2]))
value= 1500,2
volumescale=100

[state 1900,prakash]
type=explod
trigger1=!animelemtime(7+(var(10)=[1,2]))
id=1065
anim=1065
postype=back
pos=128,215
bindtime=-1
removetime=-2
random=0,0
velocity=0,0
accel=0,0
ownpal=1
scale=0.5,0.5
sprpriority=5
supermovetime=0
pausemovetime=0

[state 1900,Energy]
type=helper
trigger1=!animelemtime(3)
helpertype=normal
name="Energy"
ID=1505
stateno=1505
postype=p1
pos=0,0
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5

;[state 1900,Energy]
;type=helper
;trigger1=!animelemtime(11+(var(10)=[1,2]))
;helpertype=normal
;name="Energy"
;ID=1070
;stateno=1000
;postype=p1
;facing=1
;ownpal=1
;keyctrl=0
;size.xscale=0.65
;size.yscale=0.55

[state 1900,prakash]
type=explod
trigger1=!animelemtime(7+(var(10)=[1,2]))
id=1070
anim=1070
postype=p1
facing=1
pos=0,0
ownpal=1
scale=0.65,0.65
sprpriority=5
supermovetime=0
pausemovetime=0

[State 0, PosSet]
type = PosAdd
trigger1 = animelem = 7
x = P2Dist X
persistent = 1

[State 1100, VelSet]
type = VelSet
trigger1 = animelem = 11
x = 0

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = !animelemtime(7)
attr = S, SA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 58 < 7, 7, fvar(11) * 58)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 12)
animType = Hard
air.animType = back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.25, 0
ground.cornerPush.velOff = 0
guard.velocity = -0.25
guard.cornerPush.velOff = 0
air.velocity = -0.25, -3.75
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -25
envshake.time=12
envshake.ampl=6
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=32

[State 1100, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = animelemtime(7) = 4
attr = S, SA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 48 < 7, 7, fvar(11) * 48)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
ground.type = Trip
air.type = Trip
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.25, 10.75
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -0.25, 10.75
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -25
envshake.time=12
envshake.ampl=6
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=32

[state 1355,Target_ID]
type=parentvarset
trigger1=movecontact=1
trigger1=numtarget
trigger1=!MoveGuarded
trigger1=var(55):=target,id
var(55)=target,id
ignorehitpause=1
persistent=0

[state 1355,electricity]
type=helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = !MoveGuarded
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[state 1900,bekaar]
type=statetypeset
trigger1=!animelemtime(12+(var(10)=[1,2]))
movetype=I

[state 1900,badalna]
type=changestate
trigger1=!animtime
value=0
ctrl=1

;=====================<THUNDER CLOUD>==========================
[StateDef 1600]
type = A
physics = N
moveType = A
anim = 1600
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
value = ifElse(var(10) = 2, 1602, ifElse(var(10) = 1, 1601, 1600))

[state 2000,murna]
type=varset
trigger1=!time
var(12)=1+var(10)

[state 2000,murna]
type=varadd
trigger1=!animelemtime(8)
var(12)=-1

[state 2000,murna]
type=changeanim
trigger1=var(12)
trigger1=!animelemtime(8)
value=anim
elem=6

[state 2000,bolii]
type=playsnd
trigger1=!animelemtime(5)
value= 1600,0
volumescale=100
channel=0

[state 2000,avaaz]
type=playsnd
trigger1=!animelemtime(4)
value= 1,2
volumescale=100

[state 2000,avaaz]
type=playsnd
trigger1=!animelemtime(4)
value= 811,0
volumescale=100

[state 2000,shiighrataa]
type=veladd
trigger1=animelemno(0)=[5,8]
y=0.03125

[state 2000,shiighrataa]
type=veladd
trigger1=animelemtime(9)>0
y=0.5859375

;[state 2000,Energy]
;type=helper
;trigger1=!animelemtime(4)
;helpertype=normal
;name="Energy"
;ID=1075
;stateno=1000
;postype=p1
;facing=1
;ownpal=1
;keyctrl=0
;size.xscale=0.5
;size.yscale=0.5

[State 1100, Shoryuken Flames Explod]
type = Explod
trigger1 = !animelemtime(4)
anim = 1075
ID = 1075
sprPriority = 3
bindTime = 2
posType = P1
facing = 1
pos = 0,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1 = !animelemtime(6)
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 5, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 25, ifElse(var(10), 25, 25)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 25, ifElse(var(10), 25, 25)))), 10
getpower = 60,30
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 3), ifElse(var(20), 1, 3)
guard.pauseTime = ifElse(var(20), 1, 3), ifElse(var(20), 1, 12)
animType = Hard
air.animType = back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifelse(var(20), -0.36, -0.52), -8
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -0.36, -0.52), -7.5
air.cornerPush.velOff = 0
airguard.velocity = -5, -1.5
airguard.ctrlTime = 16
airguard.cornerPush.velOff = 0
yaccel = Ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := ceil(p2dist y-55)
envshake.time=12
envshake.ampl=6
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=48

[state 1355,Target_ID]
type=parentvarset
trigger1=movecontact=1
trigger1=numtarget
trigger1=!MoveGuarded
trigger1=var(55):=target,id
var(55)=target,id
ignorehitpause=1
persistent=0

[state 1355,electricity]
type=helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = !MoveGuarded
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[state 2000,bekaar]
type=statetypeset
trigger1=!animelemtime(8)
movetype=I

[state 2000,badalna]
type=changestate
trigger1=pos y>=0
trigger1=vel y>0
value=1601
ctrl=0

;Landing
[StateDef 1601]
type = S
anim = 1105
physics = N
moveType = I
velSet = 0,0

[state 1405,dharna]
type=posset
trigger1=!time
y=0

[State 1101, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1101, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1101, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1101, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1101, End]
type = null;ChangeState
trigger1 = AnimElemTime(2) = 2 && command = "holddown"
value = 11
ctrl = 1

[State 1101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;========================<EX THUNDER CLOUD>=============================
[StateDef 1630]
type = A
physics = N
moveType = A
anim = 1603
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
var(25) = 34

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

[state 2000,murna]
type=varset
trigger1=!time
var(12)=1+var(10)

[state 2000,murna]
type=varadd
trigger1=!animelemtime(8)
var(12)=-1

[state 2000,murna]
type=changeanim
trigger1=var(12)
trigger1=!animelemtime(8)
value=anim
elem=6

[state 2000,bolii]
type=playsnd
trigger1=!animelemtime(5)
value= 1600,0
volumescale=100
channel=0

[state 2000,avaaz]
type=playsnd
trigger1=!animelemtime(4)
value= 1,2
volumescale=100

[state 2000,avaaz]
type=playsnd
trigger1=!animelemtime(4)
value= 811,0
volumescale=100

[state 2000,shiighrataa]
type=veladd
trigger1=animelemno(0)=[5,8]
y=0.03125

[state 2000,shiighrataa]
type=veladd
trigger1=animelemtime(9)>0
y=0.5859375

;[state 2000,Energy]
;type=helper
;trigger1=!animelemtime(4)
;helpertype=normal
;name="Energy"
;ID=1075
;stateno=1000
;postype=p1
;facing=1
;ownpal=1
;keyctrl=0
;size.xscale=0.5
;size.yscale=0.5

[State 1100, Shoryuken Flames Explod]
type = Explod
trigger1 = !animelemtime(4)
anim = 1075
ID = 1075
sprPriority = 3
bindTime = 2
posType = P1
facing = 1
pos = 0,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1 = !animelemtime(6)
attr = A, SA
hitFlag = MAF
guardFlag = M
priority = 5, Hit
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 1, 3), ifElse(var(20), 1, 3)
guard.pauseTime = ifElse(var(20), 1, 3), ifElse(var(20), 1, 3)
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.52, -5.5
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -0.52, -5.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := ceil(p2dist y-55)
envshake.time=12
envshake.ampl=6
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=48

[state 1355,Target_ID]
type=parentvarset
trigger1=movecontact=1
trigger1=numtarget
trigger1=!MoveGuarded
trigger1=var(55):=target,id
var(55)=target,id
ignorehitpause=1
persistent=0

[state 1355,electricity]
type=helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = !MoveGuarded
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[state 2000,bekaar]
type=statetypeset
trigger1=!animelemtime(8)
movetype=I

[state 2000,badalna]
type=changestate
trigger1=pos y>=0
trigger1=vel y>0
value=1601
ctrl=0

;=====================<SURPRISE ROAR>==========================
[StateDef 1700]
type = S
physics = S
moveType = A
anim = 1700
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 20 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsx"), 0, ifElse((command = "b" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[state 2100,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[state 2100,bolii]
type=playsnd
trigger1=!animelemtime(5)
value= 1200,6
volumescale=100
channel=0

[state 2100,avaaz]
type=playsnd
trigger1=!animelemtime(5)
value= 1,2
volumescale=100

[state 2100,Lightning]
type=helper
trigger1=!animelemtime(6)
helpertype=normal
name="Lightning"
ID=1705
stateno=1705
postype=p1
pos=ceil(cond(var(10)=3,p2dist x-15,100+(50*var(10)))),0
facing=1
ownpal=1
keyctrl=0
size.xscale=0.4
size.yscale=0.4

[state 2100,bekaar]
type=statetypeset
trigger1=!animelemtime(9)
movetype=I

[state 2100,badalna]
type=changestate
trigger1=!animtime
value=0
ctrl=1

;========================<EX SURPRISE ROAR>=============================
[StateDef 1730]
type = S
physics = S
moveType = A
anim = 1703
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
var(25) = 34

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

[state 2100,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[state 2100,bolii]
type=playsnd
trigger1=!animelemtime(5)
value= 1200,6
volumescale=100
channel=0

[state 2100,avaaz]
type=playsnd
trigger1=!animelemtime(5)
value= 1,2
volumescale=100

[state 2100,Lightning]
type=helper
trigger1=!animelemtime(6)
helpertype=normal
name="Lightning"
ID=1735
stateno=1735
postype=p1
pos=ceil(cond(var(10)=3,p2dist x-15,100+(50*var(10)))),0
facing=1
ownpal=1
keyctrl=0
size.xscale=0.4
size.yscale=0.4

[state 2100,bekaar]
type=statetypeset
trigger1=!animelemtime(9)
movetype=I

[state 2100,badalna]
type=changestate
trigger1=!animtime
value=0
ctrl=1

;=====================<RAY TRAP>==========================
[StateDef 1800]
type = S
physics = S
moveType = A
anim = 1700
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 20 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsa"), 0, ifElse((command = "y" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[state 1500,Trap]
type=helper
trigger1=!animelemtime(6)
helpertype=normal
name="Trap"
ID=1805
stateno=1805
postype=p1
pos=(80*(var(10)=0))+(150*(var(10)=1))+(220*(var(10)=2)),-5
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5

[state 1815,bolii]
type=playsnd
trigger1=!animelemtime(3)
value= 1700,0

[state 1800,badalna]
type=changestate
trigger1=!animtime
value=0
ctrl=1

;========================<EX RAY TRAP>=============================
[StateDef 1830]
type = S
physics = S
moveType = A
anim = 1700
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
var(25) = 34

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

[state 1500,Trap]
type=helper
trigger1=!animelemtime(6)
helpertype=normal
name="Trap"
ID=1805
stateno=1835
postype=p1
pos=ceil(p2dist x),0
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5

[state 1815,bolii]
type=playsnd
trigger1=!animelemtime(3)
value= 1700,0

[state 1800,badalna]
type=changestate
trigger1=!animtime
value=0
ctrl=1

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
facep2 = 1

[State 2900, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2900, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4, ifElse(Random < 500, 10, 11)
channel = 0

[State 2900, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2
channel = 1

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 5
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 0
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
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -7.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
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
facep2 = 1

[State 2910, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1
ignoreHitPause = 1

[state 232,jodo]
type=posadd
trigger1 = animelem = 2
x=20

[state 232,jodo]
type=posadd
trigger1 = animelem = 9
x=30

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4, 11
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = Time = 0
attr = C, SA
hitFlag = MA
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 0
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
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -4
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -2, -4
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 96), var(36) := -35
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
