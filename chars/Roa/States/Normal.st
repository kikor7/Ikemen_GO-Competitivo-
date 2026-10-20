; _________________________________________
;| Roa by varo_hades                       |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<NORMAL MOVES>========================================
;==============================================================================================

;===========<STANDING LIGHT PUNCH>==========
[StateDef 200]
type = S
physics = S
moveType = A
anim = 200
ctrl = 0
velset = 0,0
sprPriority = 1
powerAdd = 0
facep2 = 1

[State 200, Voice]
type = PlaySnd
trigger1 = !Time && Random < 200
trigger1 = random < 600
value= 4, 0 + random % 5
channel = 0

[State 200, Woosh]
type = PlaySnd
trigger1 = !Time
value = 1,0
channel = 1

[State 200, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
getpower = 30,15
givepower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.41, -3), -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 0)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 111), var(36):= -70
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 200, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;===========<STANDING FAR MEDIUM PUNCH>==========
[StateDef 210]
type = S
physics = S
moveType = A
anim = 210
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[State 210, Voice]
type = PlaySnd
trigger1 = !Time && Random < 350
trigger1 = random < 800
value= 4, 5 + random % 4
channel = 0

[State 210, Woosh]
type = PlaySnd
trigger1 = !Time
value = 1,1
channel = 1

[State 210, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 46 < 7, 7, fvar(11) * 46)), 0
getpower = 30,15
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ifElse(var(20), -3.66, -6.25), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -6.25)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.66, -3.5), -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 90), var(36) := -38
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 210, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 210, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;===========<STANDING FAR HEAVY PUNCH>==========
[StateDef 220]
type = S
physics = S
moveType = A
anim = 220
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
facep2 = 1

[state 232,jodo]
type=posadd
trigger1 = animelem = 2
x=15

[State 220, Voice]
type = PlaySnd
trigger1 = AnimElem = 4 && Random < 500
trigger1 = random < 1000
value= 4, 9 + random % 3
channel = 0

[State 220, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,2
channel = 1

[State 220, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 5
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 62 < 7, 7, fvar(11) * 62)), 0
getpower = 15,7
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.36, -8.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 109), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 220, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5 && prevstateno = 700
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 62 < 7, 7, fvar(11) * 62)), 0
getpower = 15,7
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifelse(var(20), -2.36, -4), -8
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerpush.veloff = 0
air.velocity = ifelse(var(20), -2.36, -4), -7.5
air.cornerpush.veloff = 0
yaccel = ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 109), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 220, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
movetype = I

[State 220, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;===========<STANDING LIGHT KICK>==========
[StateDef 230]
type = S
physics = S
moveType = A
anim = 230
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
facep2 = 1

[State 230, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && Random < 200
trigger1 = random < 600
value= 4, 0 + random % 5
channel = 0

[State 230, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,3
channel = 1

[State 230, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
getpower = 30,15
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.41, -3), -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0*(var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 119), var(36) := -30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 230, StateTypeSet: Idle]
type = StateTypeSet
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 230, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;===========<SWK EXTRA>==========
[StateDef 231]
type = S
physics = S
moveType = A
anim = 231
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
facep2 = 1

[state 232,jodo]
type=posadd
trigger1 = animelem = 2
x=30

[State 231, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 200
trigger1 = random < 600
value= 4, 0 + random % 5
channel = 0

[State 231, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,3
channel = 1

[State 231, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
getpower = 30,15
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = low
air.type = Low
ground.hitTime = 18 + 2 * var(9)
ground.slideTime = 17 + 2 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.36, -8.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -7.5
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0*(var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 119), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 231, StateTypeSet: Idle]
type = StateTypeSet
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 231, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;===========<SWK EXTRA 2>==========
[StateDef 232]
type = S
physics = S
moveType = A
anim = 232
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[state 232,jodo]
type=posadd
trigger1 = animelem = 2
x=30

[State 232, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 200
value= 4, 9 + random % 3
channel = 0

[State 232, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,3
channel = 1

[State 232, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
getpower = 30,15
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = High
air.type = Low
ground.hitTime = 18 + 2 * var(9)
ground.slideTime = 17 + 2 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.36, -4), -8
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -7.5
air.cornerPush.velOff = 0
yaccel = ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0*(var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 119), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 232, StateTypeSet: Idle]
type = StateTypeSet
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 232, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;===========<STANDING FAR MEDIUM KICK>==========
[StateDef 240]
type = S
physics = S
moveType = A
anim = 240
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[State 240, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && Random < 350
trigger1 = random < 800
value= 4, 5 + random % 4
channel = 0

[State 240, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,4
channel = 1

[State 240, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 46 < 7, 7, fvar(11) * 46)), 0
getpower = 30,15
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ifElse(var(20), -3.66, -6.25), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -6.25)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.66, -3.5), -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 90), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 240, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 240, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;===========<STANDING FAR HEAVY KICK>==========
[StateDef 250]
type = S
physics = N
moveType = A
anim = 250
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[state 232,jodo]
type=posadd
trigger1 = animelem = 2
x=23

[state 232,jodo]
type=posadd
trigger1 = animelem = 9
x=33

[State 250, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && Random < 500
trigger1 = random < 1000
value= 4, 9 + random % 3
channel = 0

[State 250, Voice]
type = PlaySnd
trigger1 = AnimElem = 9 && Random < 500
trigger1 = random < 1000
value= 4, 9 + random % 3
channel = 0

[State 250, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 1

[State 250, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1,5
channel = 1

[State 250, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4,Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 0
getpower = 15,7
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.36, -4.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.36, -4.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -2.36, -4), -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 103), var(36) := -72
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 250, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 11
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4,Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 0
getpower = 15,7
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.36, -8.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -2.36, -4), -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 103), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 250, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(13) >= 0
moveType = I

[State 250, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;===========<CROUCHING LIGHT PUNCH>==========
[StateDef 400]
type = C
physics = C
moveType = A
anim = 400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 400, Voice]
type = PlaySnd
trigger1 = !Time && Random < 200
trigger1 = random < 600
value= 4, 0 + random % 5
channel = 0

[State 400, Woosh Sound]
type = PlaySnd
trigger1 = !Time
value = 1,0
channel = 1

[State 400, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = C, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
getpower = 30,15
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.41, -3), -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 0)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 111), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 400, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;===========<CROUCHING MEDIUM PUNCH>==========
[StateDef 410]
type = C
physics = C
moveType = A
anim = 410
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[State 410, Voice]
type = PlaySnd
trigger1 = !Time && Random < 350
trigger1 = random < 800
value= 4, 5 + random % 4
channel = 0

[State 410, Woosh Sound]
type = PlaySnd
trigger1 = !Time
value = 1,1
channel = 1

[State 410, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = C, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 46 < 7, 7, fvar(11) * 46)), 0
getpower = 30,15
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ifElse(var(20), -3.66, -6.25), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -6.25)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.66, -3.5), -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0*(var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 119), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 410, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 410, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;===========<CROUCHING HEAVY PUNCH>==========
[StateDef 420]
type = C
physics = C
moveType = A
anim = 420
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[State 420, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 500
trigger1 = random < 1000
value= 4, 9 + random % 3
channel = 0

[State 420, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2
channel = 1

[State 420, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = C, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 62 < 7, 7, fvar(11) * 62)), 0
getpower = 30,15
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.36, -8.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -2.36, -4), -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 116), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
forceStand = 1

[State 420, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 420, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;===========<CROUCHING LIGHT KICK>==========
[StateDef 430]
type = C
physics = C
moveType = A
anim = 430
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 430, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 200
trigger1 = random < 600
value= 4, 0 + random % 5
channel = 0

[State 430, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,3
channel = 1

[State 430, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = C, NA
hitFlag = MA
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
getpower = 30,15
givepower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.41, -3), -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 116), var(36) := -5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinadd= -255, -255, -255, 48

[State 430, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 430, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;===========<CROUCHING MEDIUM KICK>==========
[StateDef 440]
type = C
physics = C
moveType = A
anim = 440
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[state 232,jodo]
type=null;posadd
trigger1 = animelem = 2
x=15

[State 440, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 350
trigger1 = random < 800
value= 4, 5 + random % 4
channel = 0

[State 440, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,4
channel = 1

[State 440, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = C, NA
hitFlag = MA
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 46 < 7, 7, fvar(11) * 46)), 0
getpower = 30,15
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ifElse(var(20), -3.66, -6.25), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -6.25)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.66, -3.5), -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 116), var(36) := -5
palFX.time = 12*var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 440, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
movetype = I

[State 440, End]
type = Changestate
trigger1 = !AnimTime
value = 11
ctrl = 1

;===========<CROUCHING HEAVY KICK>==========
[StateDef 450]
type = C
physics = C
moveType = A
anim = 450
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[state 232,jodo]
type=posadd
trigger1 = animelem = 3
x=25

[State 450, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 500
trigger1 = random < 1000
value= 4, 9 + random % 3
channel = 0

[State 450, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 450, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 3
attr = C, NA
hitFlag = MA
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 62 < 7, 7, fvar(11) * 62)), 0
getpower = 30,15
givepower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
ground.type = Trip
air.type = Trip
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.5, -6
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = -1.5, -6
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 96), var(36) := -35
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48

[State 450, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 450, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;===========<JUMPING LIGHT PUNCH>==========
[StateDef 600]
type = A
physics = N
moveType = A
anim = 600
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 600, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 200
trigger1 = random < 600
value= 4, 0 + random % 5
channel = 0

[State 600, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,0
channel = 1

[State 600, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
getpower = 30,15
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.41, -3), -7.5
airguard.velocity = -3, -1.5
air.cornerPush.velOff = 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 0)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 600, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 600, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 600, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;===========<NEUTRAL JUMPING MEDIUM PUNCH>==========
[StateDef 610]
type = A
physics  = N
moveType = A
anim = 610
ctrl = 0
sprPriority = 1
powerAdd = 0 * !var(20)

[State 610, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 350
trigger1 = random < 800
value= 4, 5 + random % 4
channel = 0

[State 610, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,1
channel = 1

[State 610, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 46 < 7, 7, fvar(11) * 46)), 0
getpower = 30,15
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12 + 3 * var(9)
ground.slideTime = 12 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -6.25)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.41, -3.5), -7.5
airguard.velocity = -4, -1.5
air.cornerPush.velOff = 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 610, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
movetype = I

[State 610, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 610, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;===========<NEUTRAL JUMPING HEAVY PUNCH>==========
[StateDef 620]
type = A
physics = N
moveType = A
anim = 620
ctrl = 0
sprPriority = 1
powerAdd = 0 * !var(20)

[State 620, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && Random < 500
trigger1 = random < 1000
value= 4, 9 + random % 3
channel = 0

[State 620, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2
channel = 1

[State 620, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 62 < 7, 7, fvar(11) * 62)), 0
getpower = 30,15
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 11), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 11), ifElse(var(20), 6, 12)
animtype = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12 + 4 * var(9)
ground.slideTime = 12 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.41, -4), -7.5
airguard.velocity = -5, -1.5
air.cornerPush.velOff = 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 620, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 620, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;===========<ANGLED JUMPING HEAVY PUNCH>==========
[StateDef 621]
type = A
physics = N
moveType = A
anim = 621
ctrl = 0
sprPriority = 1
powerAdd = 0 * !var(20)

[State 621, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && Random < 500
trigger1 = random < 1000
value= 4, 9 + random % 3
channel = 0

[State 621, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2
channel = 1

[state 620,roop]
type=palfx
trigger1=anim=621
triggerall=animelemtime(2)>=5
triggerall=animelemtime(3)<0
time=2
add=64,64,64

[state 620,avaaz]
type=playsnd
trigger1=anim=621
trigger1=!animelemtime(4)
value= 811,0
volumescale=100

[state 620,avaaz]
type=playsnd
trigger1=anim=621
trigger1=!animelemtime(4)
value= 1,4
volumescale=100

[state 620,hilaav]
type=envshake
trigger1=anim=621
trigger1=!animelemtime(4)
time=10
ampl=5

;[state 620,Energy]
;type=helper
;trigger1=anim=621
;trigger1=!animelemtime(4)
;helpertype=normal
;name="Energy"
;ID=1005
;stateno=1000
;postype=p1
;facing=1
;ownpal=1
;keyctrl=0
;size.xscale=0.5
;size.yscale=0.5

[state 620,Energy]
type=helper
trigger1=anim=621
trigger1=!animelemtime(4)
helpertype=normal
name="Energy"
ID=622
stateno=622
postype=p1
pos = -40, -70
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5

[state 620,fasla]
type=attackdist
trigger1=movetype=A
value=const(size.attack.dist)

[state 620,fasla]
type=attackdist
trigger1=anim=621
trigger1=animelemtime(3)<0
value=0

[State 621, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 48 < 7, 7, fvar(11) * 48)), 0
getpower = 30,15
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 11), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 11), ifElse(var(20), 6, 12)
animtype = hard
air.animType = Back
fall.animType = Back
ground.type = low
air.type = Low
ground.hitTime = 12 + 4 * var(9)
ground.slideTime = 12 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = -1.5625*(vel x>0), 12.109375
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = -1.5625*(vel x>0), 12.109375
air.cornerPush.velOff = 0
airguard.velocity = -5, -1.5
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 113), var(36) := 12
envshake.time=10
envshake.ampl=5
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=32
id=621
p2stateno=1065

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

[State 621, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 621, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 621, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;Thunder
[Statedef 622]
type=A
movetype=I
physics=N
anim = 622
ctrl=0
sprpriority=5

[state 1000,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 1000,roop]
type=sprpriority
trigger1=0
value=0

[state 1000,roop]
type=angledraw
trigger1=1
value=-130

[state 1000,roop]
type=trans
trigger1=1
trans=addalpha
alpha=256,256

[state 1000,marna]
type=destroyself
trigger1=!animtime

;===========<NEUTRAL JUMPING LIGHT KICK>==========
[StateDef 630]
type = A
physics = N
moveType = A
anim = 630
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 630, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && Random < 200
trigger1 = random < 600
value= 4, 0 + random % 5
channel = 0

[State 630, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,3
channel = 1

[State 630, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = Time = 0
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
getpower = 30,15
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.41, -3), -7.5
airguard.velocity = -3, -1.5
air.cornerPush.velOff = 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 630, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 630, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 630, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;===========<NEUTRAL JUMPING MEDIUM KICK>==========
[StateDef 640]
type = A
physics = N
moveType = A
anim = 640
ctrl = 0
sprPriority = 1
powerAdd = 0 * !var(20)

[State 640, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && Random < 350
trigger1 = random < 800
value= 4, 5 + random % 4
channel = 0

[State 640, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,4
channel = 1

[State 640, Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 46 < 7, 7, fvar(11) * 46)), 0
getpower = 30,15
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12 + 3 * var(9)
ground.slideTime = 12 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -6.25)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.41, -3.5), -7.5
airguard.velocity = -4, -1.5
air.cornerPush.velOff = 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 118), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 640, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 640, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 640, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;===========<JUMPING HEAVY KICK>==========
[StateDef 650]
type = A
physics = N
moveType = A
anim = 650
ctrl = 0
sprPriority = 1
powerAdd = 0 * !var(20)

[State 650, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && Random < 500
trigger1 = random < 1000
value= 4, 9 + random % 3
channel = 0

[State 650, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 1

[State 650, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 62 < 7, 7, fvar(11) * 62)), 0
getpower = 30,15
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 11), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 11), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12 + 4 * var(9)
ground.slideTime = 12 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.41, -4), -7.5
airguard.velocity = -5, -1.5
air.cornerPush.velOff = 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 115), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 650, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 650, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 650, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;===========<THROW ATTEMPT>==========
[StateDef 800]
type = S
physics = S
movetype = A
anim = 800
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[State 800, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = (command = "kk")

[State 800, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = (Random < 500)

[State 800, Tech Hit Reset]
type = VarSet
trigger1 = 1
var(19) = 0

[State 800, Tech Hit]
type = VarSet
trigger1 = NumEnemy
trigger1 = EnemyNear, StateType != A
trigger1 = (EnemyNear, StateNo = [0,999]) && (EnemyNear, StateNo != [100,119]) && (EnemyNear, StateNo != [200,799])
var(19) = 7

[State 800, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 800, HitDef: PP Throw]
type = HitDef
trigger1 = AnimElem = 2
trigger1 = !var(38)
attr = S, NT
hitFlag = M-
priority = 1, Miss
getpower = 30,15
givePower = 0,0
sparkNo = -1 +0 * (var(33) := 0)
guard.sparkNo = -1 +0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -50
hitSound = -1 +0 * (var(31) := 800)
guardSound = -1 +0 * (var(32) := 0)
fall = 1
fall.recover = 1
numHits = 0
p1StateNo = ifElse(command = "holdback", 810, 805)

[State 800, HitDef: KK Throw]
type = HitDef
trigger1 = AnimElem = 2 && var(10)
trigger1 = !var(38)
attr = S, NT
hitFlag = M-
priority = 1, Miss
getpower = 30,15
givePower = 0,0
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 +0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -50
hitSound = -1 +0 * (var(31) := 800)
guardSound = -1 +0 * (var(32) := 0)
fall = 1
fall.recover = 1
numhits = 0
p1StateNo = ifElse(command = "holdback", 820, 805)

[State 800, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 3
value = 800,0
channel = 0

[State 800, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,0
channel = 1

[State 800, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 800, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;===========<THROW SWITCHING SIDES>==========
[StateDef 805]
type = S
moveType = A
physics = S
anim = 805
ctrl = 0
sprPriority = 0

[State 805, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 806

[State 805, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 805, Width]
type = Width
trigger1 = 1
edge = 24,24
ignoreHitPause = 1

[State 805, Turn]
type = Turn
trigger1 = AnimElem = 3

[State 805, Facing]
type = TargetFacing
trigger1 = 1
value = -1

[State 805, Tech Hit]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback") && Target, command != "holdup" && Target, command != "holddown"
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 805, Tech Hit Countdown]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 805, TargetBind 1]
type = TargetBind
trigger1 = AnimElemTime(2) < 0 || AnimElemTime(4) >= 0
pos = ceil(35 * const(size.xScale)), 0

[State 805, TargetBind 2]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4) < 0
pos = ceil(11 * const(size.xScale)), 0

[State 805, SprPriority 1]
type = SprPriority
trigger1 = AnimElemTime(2) < 0 || AnimElemTime(4) >= 0
value = 1

[State 805, SprPriority -1]
type = SprPriority
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4)< 0
value = -1

[State 805, End]
type = ChangeState
trigger1 = !NumTarget
value = 0
ctrl = 1

[State 805, End]
type = ChangeState
trigger1 = AnimElemTime(4) >= 0
value = ifElse(var(10), 820, 810)

;===========<THROW SWITCHING SIDES (TARGET)>==========
[StateDef 806]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 806, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 806, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 806

[State 806, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,1
ignoreHitPause = 1

[State 806, SelfState]
type = SelfState
trigger1 = Time >= 60
value = ifElse(pos y < 0, 5040, 0)
ctrl = 1

;===========<ELECTROCUTE>==========
[Statedef 810]
type = A
physics = N
moveType = A
anim = 810
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 810, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 810, Tech Hit]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback")
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 810, Throw Escape]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[state 805,roop]
type=width
trigger1=!animelemtime(8)
edge=50,0

[state 805,roop]
type=turn
trigger1=!animelemtime(8)

[state 805,avaaz]
type=playsnd
trigger1=animelemtime(4)=6
value= 2,7
volumescale=100
channel=0

[state 805,bolii]
type=playsnd
trigger1=!animelemtime(5)
value= 810,0+random%2
volumescale=100
channel=1

[state 805,avaaz]
type=playsnd
trigger1=!animelemtime(7)
value= 1,3
volumescale=100
channel=2

[state 805,fasla]
type=attackdist
trigger1=1
value=0

[state 805,naash]
type=targetstate
trigger1=!Time && NumTarget
value=815

[state 805,naash]
type=targetbind
trigger1=animelemtime(1)>=0&&animelemtime(2)<0
pos=40,0

[state 805,naash]
type=targetbind
trigger1=animelemtime(2)>=0&&animelemtime(3)<0
pos=45,-90

[state 805,naash]
type=targetbind
trigger1=animelemtime(3)>=0&&animelemtime(4)<0
pos=40,-95

[state 805,naash]
type=targetbind
trigger1=animelemtime(4)>=0&&animelemtime(5)<0
pos=40,-105

[state 805,naash]
type=targetbind
trigger1=animelemtime(5)>=0&&animelemtime(6)<0
pos=32,-105

[state 805,naash]
type=targetbind
trigger1=animelemtime(6)>=0&&animelemtime(7)<0
pos=28,-105

[state 805,naash]
type=targetbind
trigger1=animelemtime(7)>=0&&animelemtime(8)<0
pos=21,-105

[state 805,naash]
type=targetbind
trigger1=!animelemtime(8)
pos=70,-85

[state 805,naash]
type=playsnd
trigger1=animelemtime(4)=6
value= 811,0
volumescale=100
channel=3

[state 805,naash]
type=envshake
trigger1=animelemtime(4)=6
time=10
ampl=5

[state 805,naash]
type=hitadd
trigger1=animelemtime(4)=6
value=1

[State 871, Hit Spark]
type = Helper
trigger1 = animelemtime(4)=6
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = ceil(45 * const(size.xScale)), ceil(-90 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[state 805,electricity]
type=helper
trigger1=animelemtime(4)=6
trigger1=var(55):=(target,ID)
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
pausemovetime=65536
supermovetime=65536

[state 805,target]
type=targetstate
trigger1=!animelemtime(8)
value=816

[State 810, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && animelemtime(4)=6
value = floor(ifElse(88 * fvar(11) < 7, -7, -88 * fvar(11)))
kill=1

[State 810, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && animelemtime(4)=6
value = 36

[State 810, Power]
type = PowerAdd
trigger1 = NumTarget && animelemtime(4)=6 && !var(20)
value = 0

[State 810, HitAdd]
type = HitAdd
trigger1 = NumTarget && animelemtime(4)=6
value = 1

[State 810, HitCount]
type = VarAdd
trigger1 = NumTarget && animelemtime(4)=6
var(13) = 1

[State 810, Juggle]
type = VarAdd
trigger1 = NumTarget && animelemtime(4)=6
var(15) = 1
ignoreHitPause = 1

[State 810, Juggle]
type = VarSet
trigger1 = NumTarget && animelemtime(4)=6
var(16) = 1
ignoreHitPause = 1

[state 805,badalna]
type=changestate
trigger1=!animtime
value=0
ctrl=1

;===========<ELECTROCUTE (TARGET)>==========
;Being Thrown
[StateDef 815]
type=S
movetype=H
physics=N
ctrl=0
velset=0,0
sprpriority=-1

[State 815, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 815

[state 810,roop]
type=screenbound
trigger1=1
value=0
movecamera=1,0

[state 810,roop]
type=angledraw
trigger1=animelemno(0)=5
value=-45

[state 810,roop]
type=angledraw
trigger1=animelemno(0)=6
value=-60

[state 810,roop]
type=angledraw
trigger1=animelemno(0)=7
value=-75

[state 810,roop]
type=angledraw
trigger1=animelemno(0)=8
value=-90

[state 810,roop]
type=palfx
trigger1=animelemtime(4)=6
time=32
color=256
mul=128,128,128
add=0,0,0
sinadd=256,256,256,4

[state 810,phir_lana]
type=selfstate
trigger1=!gethitvar(isbound)
trigger1=time>100
value=5050

;After Throw
[StateDef 816]
type=A
movetype=H
physics=N
sprpriority=-1

[state 811,roop]
type=palfx
trigger1=!time
time=32
color=256
mul=128,128,128
add=0,0,0
sinadd=256,256,256,4

[state 811,fall]
type=hitfallset
trigger1=!time
value=1

[state 811,anim]
type=changeanim2
trigger1=!time
value=816

[state 811,shiighrataa]
type=velset
trigger1=!time
x=4.0
y=-7.5

[state 811,shiighrataa]
type=veladd
trigger1=1
y=0.6

[state 811,hilaav]
type=envshake
trigger1=pos y>=0
trigger1=vel y>0
time=15
ampl=12

[State 5550, 4] ;Recover near ground
type = SelfState
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = alive
trigger1 = Command = "recovery"
value = 5200 ;HITFALL_RECOVER

[State 811,phir_lana]
type=selfstate
trigger1=pos y>=0
trigger1=vel y>0
value=5100

[state 811,phir_lana]
type=selfstate
trigger1=!gethitvar(isbound)
trigger1=time>300
value=5050

;===========<ELECTROCUTE>==========
[StateDef 820]
type = S
physics = N
moveType = A
anim = 810
ctrl = 0
velset = 0,0
sprpriority = 1

[State 820, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 820, Tech Hit]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback")
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 820, Throw Escape]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[state 805,roop]
type=width
trigger1=!animelemtime(8)
edge=50,0

[state 805,roop]
type=turn
trigger1=!animelemtime(8)

[state 805,avaaz]
type=playsnd
trigger1=animelemtime(4)=6
value= 2,7
volumescale=100
channel=0

[state 805,bolii]
type=playsnd
trigger1=!animelemtime(5)
value= 810,0+random%2
volumescale=100
channel=1

[state 805,avaaz]
type=playsnd
trigger1=!animelemtime(7)
value= 1,3
volumescale=100
channel=2

[state 805,fasla]
type=attackdist
trigger1=1
value=0

[state 805,naash]
type=targetstate
trigger1=!Time && NumTarget
value=825

[state 805,naash]
type=targetbind
trigger1=animelemtime(1)>=0&&animelemtime(2)<0
pos=40,0

[state 805,naash]
type=targetbind
trigger1=animelemtime(2)>=0&&animelemtime(3)<0
pos=45,-90

[state 805,naash]
type=targetbind
trigger1=animelemtime(3)>=0&&animelemtime(4)<0
pos=40,-95

[state 805,naash]
type=targetbind
trigger1=animelemtime(4)>=0&&animelemtime(5)<0
pos=40,-105

[state 805,naash]
type=targetbind
trigger1=animelemtime(5)>=0&&animelemtime(6)<0
pos=32,-105

[state 805,naash]
type=targetbind
trigger1=animelemtime(6)>=0&&animelemtime(7)<0
pos=28,-105

[state 805,naash]
type=targetbind
trigger1=animelemtime(7)>=0&&animelemtime(8)<0
pos=21,-105

[state 805,naash]
type=targetbind
trigger1=!animelemtime(8)
pos=70,-85

[state 805,naash]
type=playsnd
trigger1=animelemtime(4)=6
value= 811,0
volumescale=100
channel=3

[state 805,naash]
type=envshake
trigger1=animelemtime(4)=6
time=10
ampl=5

[state 805,naash]
type=hitadd
trigger1=animelemtime(4)=6
value=1

[State 871, Hit Spark]
type = Helper
trigger1 = animelemtime(4)=6
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = ceil(45 * const(size.xScale)), ceil(-90 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[state 805,electricity]
type=helper
trigger1=animelemtime(4)=6
trigger1=var(55):=(target,ID)
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
pausemovetime=65536
supermovetime=65536

[state 805,target]
type=targetstate
trigger1=!animelemtime(8)
value=826

[State 810, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && animelemtime(4)=6
value = floor(ifElse(88 * fvar(11) < 7, -7, -88 * fvar(11)))
kill=1

[State 810, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && animelemtime(4)=6
value = 36

[State 810, Power]
type = PowerAdd
trigger1 = NumTarget && animelemtime(4)=6 && !var(20)
value = 0

[State 810, HitAdd]
type = HitAdd
trigger1 = NumTarget && animelemtime(4)=6
value = 1

[State 810, HitCount]
type = VarAdd
trigger1 = NumTarget && animelemtime(4)=6
var(13) = 1

[State 810, Juggle]
type = VarAdd
trigger1 = NumTarget && animelemtime(4)=6
var(15) = 1
ignoreHitPause = 1

[State 810, Juggle]
type = VarSet
trigger1 = NumTarget && animelemtime(4)=6
var(16) = 1
ignoreHitPause = 1

[state 805,badalna]
type=changestate
trigger1=!animtime
value=0
ctrl=1

;===========<ELECTROCUTE (TARGET)>==========
;Being Thrown
[StateDef 825]
type=S
movetype=H
physics=N
ctrl=0
velset=0,0
sprpriority=-1

[State 815, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 815

[state 810,roop]
type=screenbound
trigger1=1
value=0
movecamera=1,0

[state 810,roop]
type=angledraw
trigger1=animelemno(0)=5
value=-45

[state 810,roop]
type=angledraw
trigger1=animelemno(0)=6
value=-60

[state 810,roop]
type=angledraw
trigger1=animelemno(0)=7
value=-75

[state 810,roop]
type=angledraw
trigger1=animelemno(0)=8
value=-90

[state 810,roop]
type=palfx
trigger1=animelemtime(4)=6
time=32
color=256
mul=128,128,128
add=0,0,0
sinadd=256,256,256,4

[state 810,phir_lana]
type=selfstate
trigger1=!gethitvar(isbound)
trigger1=time>100
value=5050

;After Throw
[StateDef 826]
type=A
movetype=H
physics=N
sprpriority=-1

[state 811,roop]
type=palfx
trigger1=!time
time=32
color=256
mul=128,128,128
add=0,0,0
sinadd=256,256,256,4

[state 811,fall]
type=hitfallset
trigger1=!time
value=1

[state 811,anim]
type=changeanim2
trigger1=!time
value=816

[state 811,shiighrataa]
type=velset
trigger1=!time
x=1.0
y=-9.5

[state 811,shiighrataa]
type=veladd
trigger1=1
y=0.6

[state 811,hilaav]
type=envshake
trigger1=pos y>=0
trigger1=vel y>0
time=15
ampl=12

[State 5550, 4] ;Recover near ground
type = SelfState
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = alive
trigger1 = Command = "recovery"
value = 5200 ;HITFALL_RECOVER

[State 811,phir_lana]
type=selfstate
trigger1=pos y>=0
trigger1=vel y>0
value=5100

[state 811,phir_lana]
type=selfstate
trigger1=!gethitvar(isbound)
trigger1=time>300
value=5050

;===========<AIR THROW ATTEMPT>==========
[StateDef 850]
type = A
physics = N
moveType = A
anim = 850
ctrl = 0
sprPriority = 1
powerAdd = 0 * !var(20)

[State 850, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = (Random < 500)

[State 850, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 850

[State 850, Tech Hit Reset]
type = VarSet
trigger1 = 1
var(19) = 0

[State 850, Tech Hit]
type = VarSet
trigger1 = NumEnemy
trigger1 = EnemyNear, StateType = A
trigger1 = (EnemyNear, StateNo = [0,999]) && (EnemyNear, StateNo != [100,119]) && (EnemyNear, StateNo != [200,799])
var(19) = 7

[State 850, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 850, HitDef: PP Throw]
type = HitDef
;trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 1
;trigger1 = !var(38)
attr = A,NT
hitFlag = AF
priority = 1,Miss
getpower = 60,30
givePower = 0,0
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -50
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
fall = 1
fall.recover = 0
numHits = 0
p1StateNo = 860

[State 850, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 3
value = 800,0
channel = 0

[State 850, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,0
channel = 1

[State 850, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 850, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 850, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;===========<AIR ELECTROCUTE>==========
[StateDef 860]
type = A
physics = N
moveType = A
anim = 860
ctrl = 0
sprPriority = 1

[State 860, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 51
ctrl = 1

[State 860, Throw Escape]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback")
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 892

[State 860, Throw Escape]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 860, Turn]
type = Turn
triggerAll = !Time
trigger1 = !AILevel && command = "holdback"
trigger2 = AILevel && BackEdgeDist < FrontEdgeDist

[State 860, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 865

[State 860, TargetFacing]
type = TargetFacing
trigger1 = Time <= 1
value = -1

[state 845,roop]
type=width
trigger1=!animelemtime(1)
edge=60,0

[state 845,avaaz]
type=playsnd
trigger1=animelemtime(3)=5
value= 2,7
volumescale=100
channel=0

[state 845,bolii]
type=playsnd
trigger1=!animelemtime(5)
value= 860,0+random%2
volumescale=100
channel=1

[state 845,avaaz]
type=playsnd
trigger1=!animelemtime(7)
value= 1,3
volumescale=100
channel=2

[State 860, PosFreeze]
type = PosFreeze
trigger1 = AnimElemTime(7) < 0
value = 1

[state 845,shiighrataa]
type=velset
trigger1=!animelemtime(7)
x=-3.0
y=-6.9375

[state 845,shiighrataa]
type=veladd
trigger1=animelemtime(7)>0
y=0.5625

[state 845,fasla]
type=attackdist
trigger1=1
value=0

[state 845,naash]
type=targetbind
trigger1=animelemtime(1)>=0&&animelemtime(2)<0
pos=30,-80

[state 845,naash]
type=targetbind
trigger1=animelemtime(2)>=0&&animelemtime(3)<0
pos=30,-80

[state 845,naash]
type=targetbind
trigger1=animelemtime(3)>=0&&animelemtime(4)<0
pos=28,-80

[state 845,naash]
type=targetbind
trigger1=animelemtime(4)>=0&&animelemtime(5)<0
pos=15,-55

[state 845,naash]
type=targetbind
trigger1=animelemtime(5)>=0&&animelemtime(6)<0
pos=-15,-70

[state 845,naash]
type=targetbind
trigger1=animelemtime(6)>=0&&animelemtime(7)<0
pos=-15,-85

[state 845,naash]
type=targetbind
trigger1=!animelemtime(7)
pos=30,-65

[state 845,naash]
type=playsnd
trigger1=animelemtime(3)=5
value= 811,0
volumescale=100
channel=3

[state 845,naash]
type=envshake
trigger1=animelemtime(3)=5
time=10
ampl=5

[state 845,naash]
type=hitadd
trigger1=animelemtime(3)=5
value=1

[State 871, Hit Spark]
type = Helper
trigger1 = animelemtime(3)=5
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = ceil(35 * const(size.xScale)), ceil(-80 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[state 845,electricity]
type=helper
trigger1=animelemtime(3)=5
trigger1=var(55):=(target,ID)
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
pausemovetime=65536
supermovetime=65536

[state 845,naash]
type=targetstate
trigger1=!animelemtime(7)
value=866

[State 810, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && animelemtime(3)=5
value = floor(ifElse(139 * fvar(11) < 7, -7, -139 * fvar(11)))
kill=1

[State 810, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && animelemtime(3)=5
value = 36

[State 810, Power]
type = PowerAdd
trigger1 = NumTarget && animelemtime(3)=5 && !var(20)
value = 0

[State 810, HitAdd]
type = HitAdd
trigger1 = NumTarget && animelemtime(3)=5
value = 1

[State 810, HitCount]
type = VarAdd
trigger1 = NumTarget && animelemtime(3)=5
var(13) = 1

[State 810, Juggle]
type = VarAdd
trigger1 = NumTarget && animelemtime(3)=5
var(15) = 1
ignoreHitPause = 1

[State 810, Juggle]
type = VarSet
trigger1 = NumTarget && animelemtime(3)=5
var(16) = 1
ignoreHitPause = 1

[state 845,badalna]
type=changestate
trigger1=pos y>=0
trigger1=vel y>0
value=861
ctrl=0

;Landing
[StateDef 861]
type = S
anim = 861
physics = N
moveType = I
velSet = 0,0

[state 1405,dharna]
type=posset
trigger1=!time
y=0

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

;===========<BODY SLAM (TARGET)>==========
;In Air
[StateDef 865]
type=A
movetype=H
physics=N
ctrl=0
velset=0,0
sprpriority=-1

[state 850,bound]
type=screenbound
trigger1=1
value=0
movecamera=1,0

[state 850,anim]
type=changeanim2
trigger1=!time
value=865

[state 850,roop]
type=palfx
trigger1=time=7
time=32
color=256
mul=128,128,128
add=0,0,0
sinadd=256,256,256,4

[state 850,roop]
type=sprpriority
trigger1=time=17
value=2

[state 850,phir_lana]
type=selfstate
trigger1=!gethitvar(isbound)
trigger1=time>100
value=5050

;Finish
[StateDef 866]
type=A
movetype=H
physics=N
ctrl=0
velset=0,0
sprpriority=-1

[state 851,roop]
type=palfx
trigger1=!time
time=32
color=256
mul=128,128,128
add=0,0,0
sinadd=256,256,256,4

[state 851,bound]
type=screenbound
trigger1=1
value=1
movecamera=1,0

[state 851,fall]
type=hitfallset
trigger1=!time
value=1

[state 851,anim]
type=changeanim2
trigger1=!time
value=816

[state 851,shiighrataa]
type=velset
trigger1=!time
x=-3.75
y=6.75

[state 851,shiighrataa]
type=veladd
trigger1=time
y=0.5625

[state 851,Hilaav]
type=envshake
trigger1=pos y>=0&&vel y>0
time=10
ampl=5

[State 851,phir_lana]
type=selfstate
trigger1=pos y>=0&&vel y>0
value=5110
ctrl=0

;===========<THROW ESCAPED>==========
[StateDef 890]
type = S
physics = N
movetype = I
anim = 5945
ctrl = 0
velset = 0,0
sprPriority = 1

[State 890, TargetBind]
type = TargetBind
trigger1 = !Time && NumTarget
pos = 0,0

[State 890, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 895

[State 890, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 890, PosAdd]
type = PosAdd
trigger1 = !Time
x = 24

[State 890, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 890, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 890, SprPriority 1]
type = SprPriority
trigger1 = AnimElemTime(6) >= 0
value = 1

[State 890, SprPriority -1]
type = SprPriority
trigger1 = AnimElemTime(2) <= 0
value = -1

[State 890, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 890, VelSet]
type = VelSet
trigger1 = 1
x = -2.425
y = 0

[State 890, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 5000,2
channel = 0

[State 890, Escape Sound]
type = PlaySnd
trigger1= !Time
value = 2,800

[State 890, Throw Escape FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8000
ID = 8000
name = "Spark"
PosType = P1
pos = 0, -68
facing = -1
ownPal = 1
size.xScale = 0.5
size.yScale = 0.5
pauseMoveTime = 65535
superMoveTime = 65535

[State 890, End]
type = ChangeState
trigger1 = Time >= 27
value = 0
ctrl = 1

;Target Escape
[StateDef 895]
type = S
physics = N
moveType = I
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 895, ChangeAnim]
type = ChangeAnim
trigger1= !Time
value = ifElse(SelfAnimExist(5940), 5940, 130)

[State 895, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && !SelfAnimExist(5945) && SelfAnimExist(5940)
value = 5940

[State 895, ChangeAnim]
type = ChangeAnim
trigger1= !Time && !SelfAnimExist(5945) && !SelfAnimExist(5940) && SelfAnimExist(5910)
value = 5910

[State 895, ChangeAnim]
type = ChangeAnim
trigger1 = Time >= 20 && Anim = 130
value = 140

[State 895, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 895, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 895, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 895, VelSet]
type = VelSet
trigger1 = 1
x = -2.425
y = 0

[State 895, End]
type = SelfState
trigger1 = Time >= 27
value = 0
ctrl = 1

;===========<THROW ESCAPE MIDAIR>==========
[StateDef 892]
type = A
physics = N
moveType = I
anim = 892
ctrl = 0
velSet = 0, 0
sprPriority = 1

[State 892, TargetBind]
type = TargetBind
trigger1 = !Time && NumTarget
pos = 48, 0

[State 892, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 897

[State 892, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 892, PosAdd]
type = PosAdd
trigger1 = !Time
x = 24

[State 892, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 892, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 892, PosFreeze]
type = PosFreeze
trigger1 = Time < 18
value = 1

[State 892, VelSet]
type = VelSet
trigger1 = Time = 18
x = -2
y = -4

[State 892, VelAdd]
type = VelAdd
trigger1 = Time > 18
y = 0.5

[State 892, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 5000,2
channel = 0

[State 892, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,800

[State 892, Throw Escape FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8000
ID = 8000
name = "Spark"
posType = P1
pos = 24,-64
facing = -1
ownPal = 1
size.xScale = 0.5
size.yScale = 0.5
pauseMoveTime = 65535
superMoveTime = 65535

[State 892, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52

;Target Escape
[StateDef 897]
type = A
physics = N
moveType = I
ctrl = 0
velSet = 0, 0
sprPriority = 1

[State 897, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 152

[State 897, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 18
value = 142

[State 897, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 897, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 897, PosFreeze]
type = PosFreeze
trigger1 = Time < 18
value = 1

[State 897, VelSet]
type = VelSet
trigger1 = Time = 18
x = -2
y = -4

[State 897, VelAdd]
type = VelAdd
trigger1 = Time >= 18
y = 0.5

[State 897, SelfState]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52
