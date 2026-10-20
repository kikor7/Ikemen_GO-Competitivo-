; _________________________________________
;| Character by JStudios2k/John Anonymous, Edited from Doug1105                |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;========================================<NORMAL MOVES>========================================
;==============================================================================================

;---------------------------------------------------------------------------
; Standing Light Punch
[Statedef 200]
type    = S
physics = S
movetype= A
ctrl = 0
velset = 0,0
sprpriority = 1
poweradd = 0
facep2 = 1

[State 200, Anim]
type=changeanim
trigger1=!time
value=200

[State 200,Posset]
type=posset
trigger1=!time
y=0

[State 200, Snd]
type=playsnd
trigger1= !time && random<200
value= 4, ifElse(Random < 500, 0, 1)
channel=0

[State 200, Snd]
type=playsnd
trigger1= !time
value=1,0
channel=1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifelse(var(20), -2.41, -4.49), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.41, -4.49)
guard.cornerpush.veloff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 0)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -70
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 200, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Medium Punch
[Statedef 210]
type    = S
physics = S
movetype= A
ctrl = 0
velset = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[State 210, Anim]
type=changeanim
trigger1=!time
value=210

[State 210,Posset]
type=posset
trigger1=!time
y=0

[State 210, Snd]
type=playsnd
trigger1= animelem=2 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 210, Snd]
type=playsnd
trigger1= animelem=2
value=1,1
channel=1

[State 210, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=66), var(36):=-61
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 200, Type]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Far Strong Punch
[Statedef 220]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
facep2 = 1

[State 220, Anim]
type=changeanim
trigger1=!time
value=220

[State 220,Posset]
type=posset
trigger1=!time
y=0

[State 220, Reset]
type = VarSet
trigger1= animelemtime(2)<0
var(10) = 0
ignorehitpause=1
[State 220, Reset]
type = VarSet
trigger1= animelemtime(2)<0
var(11) = 0
ignorehitpause=1

[State 220, Add]
type = VarAdd
triggerall=  animelemtime(2)>0
trigger1=!(AILevel) && (command="holdz")  
trigger2=AILevel
var(11) = Ifelse(var(20),2,1)
ignorehitpause=1

[State 1000, Anim]
type = ChangeAnim
triggerall = animelemtime(2)>0 && animelemtime(3) < 0
trigger1 = Ifelse(var(20),var(11)=15,var(11)=25)
trigger2 = !(AILevel) && (command!="holdz")  
trigger3 = AILevel && numenemy 
trigger3 = enemynear,movetype=A || enemynear,vel x>0 
value = 220
elem = 3
ignorehitpause=1

[State 0, VarSet]
type = VarSet
trigger1 = Ifelse(var(20),var(11)=15,var(11)=25)
v = 10    ;fv = 10
value = 1
ignorehitpause = 1
;persistent = 

[State Nope]
type=ChangeState
triggerall = animelemtime(3)<0 && Ifelse(var(20),var(11)<15,var(11)<25)
trigger1= !AILevel && command = "FF"
trigger2= AILevel && random<250 && numenemy
trigger2=(enemynear,movetype =A && enemynear,time>5) || p2bodydist x <- 10
value=710
ctrl=0

[State Nope]
type=ChangeState
triggerall = animelemtime(3)<0 && Ifelse(var(20),var(11)<15,var(11)<25)
trigger1= !AILevel && command = "BB"
trigger2= AILevel && random<100 && numenemy
trigger2=(enemynear,movetype =A && enemynear,time>5) || p2bodydist x > 240
value=715
ctrl=0

[State 220, Snd]
type=playsnd
trigger1= animelem=3
value=1,2
channel=1
[State 220, Snd]
type=playsnd
trigger1= animelem=3
value=1,8
channel=4

[State 0, Width]
type = Width
trigger1 = animelemtime(4)>0 && animelemtime(7)<0
player = 60,-5
ignorehitpause = 1

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<3 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*75<7, 7, fvar(11)*75)), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 10
air.hittime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=100), var(36):=-69
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 6
envshake.freq = 120
envshake.ampl = 6

[State 200, Type]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 220, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Second Strong Punch
[Statedef 221]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
facep2 = 1

[State 220, Anim]
type=changeanim
trigger1=!time
value=221

[State 220,Posset]
type=posset
trigger1=!time
y=0

[State 220,Inching]
type=posadd
trigger1=animelem=2
x=ifelse(var(10)=1,12,6)
[State 220,Inching]
type=posadd
trigger1=animelem=3
x=ifelse(var(10)=1,33,18)
[State 220,Inching]
type=posadd
trigger1=animelem=4
x=11

[State 220, Snd]
type=playsnd
trigger1= animelem=3
value=1,2
channel=1
[State 220, Snd]
type=playsnd
trigger1= animelem=3
value=1,10
channel=4

[State 0, Width]
type = Width
trigger1 = animelemtime(4)>0 && animelemtime(8)<0
player = 25,-5
ignorehitpause = 1

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<4 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*IfElse(var(10)=1,55,40)<7, 7, fvar(11)*IfElse(var(10)=1,55,40))), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 10
air.hittime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=8)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=83), var(36):=-69
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 6
envshake.freq = 120
envshake.ampl = 6

[State 200, Type]
type=statetypeset
trigger1= animelemtime(6)>=0
movetype=I

[State 220, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Third Strong Punch
[Statedef 222]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
facep2 = 1

[State 220, Anim]
type=changeanim
trigger1=!time
value=222

[State 220,Posset]
type=posset
trigger1=!time
y=0

[State 220,Inching]
type=posadd
trigger1=animelem=2
x=ifelse(var(10)=1,8,4)
[State 220,Inching]
type=posadd
trigger1=animelem=3
x=ifelse(var(10)=1,13,7)
[State 220,Inching]
type=posadd
trigger1=animelem=4
x=ifelse(var(10)=1,24,10)
[State 220,Inching]
type=posadd
trigger1=animelem=5
x=5

[State 0, Woosh]
type = Explod
trigger1 = animelem = 2
anim = 2220
ID = 2220
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .75*(const(size.xscale)),.5*(const(size.yscale))
sprpriority = 0
ontop = 1
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 220, Snd]
type=playsnd
trigger1= animelem=2 && random<500
value= 4, 3+(random%3)
channel=0

[State 220, Snd]
type=playsnd
trigger1= animelem=2
value=1,2
channel=1
[State 220, Snd]
type=playsnd
trigger1= animelem=2
value=1,11
channel=4

[State 0, Width]
type = Width
trigger1 = animelemtime(4)>0 && animelemtime(8)<0
player = 75,-9
ignorehitpause = 1

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<5 || var(20))
trigger1= !Time
forcenofall = !var(20)
ID = 220
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*IfElse(var(10)=1,60,50)<7, 7, fvar(11)*IfElse(var(10)=1,60,50))), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 10
air.hittime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=120), var(36):=-69
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 6
envshake.freq = 120
envshake.ampl = 6

[State BLAM]
type = Explod
trigger1 = movehit = 1 
trigger1 = NumTarget(220)
trigger1 = p2statetype = A
anim = 229
ID = 229
pos = 120, -69
postype = p1
removetime = -2
supermovetime = 65535
pausemovetime = 65535
scale = 1,1
sprpriority = 12
ontop = 1
ownpal = 1

[State 220, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(220)
trigger1 = !(target(220),ishelper)
value = Ifelse(p2statetype=A,255,229)
ID = 220
ignoreHitPause = 1
persistent = 0

[State Wall WHAM]
type = PlaySnd
trigger1 = target,stateno = 227
trigger1 = target,time = 1
value = S1,18

[State 200, Type]
type=statetypeset
trigger1= animelemtime(6)>=0
movetype=I

[State 220, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Forward Overhead Punch
[Statedef 223]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
facep2 = 1

[State 220, Anim]
type=changeanim
trigger1=!time
value=223

[State 220,Posset]
type=posset
trigger1=!time
y=0

[State 220, Reset]
type = VarSet
trigger1= animelemtime(2)<0
var(10) = 0
ignorehitpause=1
[State 220, Reset]
type = VarSet
trigger1= animelemtime(2)<0
var(11) = 0
ignorehitpause=1

[State 220, Add]
type = VarAdd
triggerall=  animelemtime(2)>0
trigger1=!(AILevel) && (command="holdz")  
trigger2=AILevel
var(11) = 1
ignorehitpause=1

[State 1000, Anim]
type = ChangeAnim
triggerall = animelemtime(2)>0 && animelemtime(3) < 0
trigger1 = Ifelse(var(20),var(11)=15,var(11)=25)
trigger2 = !(AILevel) && (command!="holdz")  
trigger3 = AILevel && numenemy 
trigger3 = enemynear,movetype=A || enemynear,vel x>0 
value = 223
elem = 3
ignorehitpause=1

[State 0, VarSet]
type = VarSet
trigger1 = Ifelse(var(20),var(11)=15,var(11)=25)
v = 10    ;fv = 10
value = 1
ignorehitpause = 1
;persistent = 

[State Nope]
type=ChangeState
triggerall = animelemtime(3)<0 && Ifelse(var(20),var(11)<15,var(11)<25)
trigger1= !AILevel && command = "FF"
trigger2= AILevel && random<250 && numenemy
trigger2=(enemynear,movetype =A && enemynear,time>5) || p2bodydist x <- 10
value=710
ctrl=0

[State Nope]
type=ChangeState
triggerall = animelemtime(3)<0 && Ifelse(var(20),var(11)<15,var(11)<25)
trigger1= !AILevel && command = "BB"
trigger2= AILevel && random<100 && numenemy
trigger2=(enemynear,movetype =A && enemynear,time>5) || p2bodydist x > 240
value=715
ctrl=0

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = prevstateno != 100
x = 0
y = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 4
x = 20
[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 3
statetype = A       ;S,A,C,L
physics = A         ;A,C,S,N
[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = ifelse(var(10)=1, 6.6, 3.8)
y = ifelse(var(10)=1, -6.9, -5)

[State 220, Snd]
type=playsnd
trigger1= animelem=3 && (random<500 || var(10))
value= 4, 3+(random%3)
channel=0

[State 220, Snd]
type=playsnd
trigger1= animelem=3
value=1,2
channel=1
[State 220, Snd]
type=playsnd
trigger1= animelem=3
value=1,10
channel=4

[State 0, Width]
type = Width
trigger1 = animelemtime(4)>0 && animelemtime(7)<0
player = 20,0
ignorehitpause = 1

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<8 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*IfElse(var(10)=1,95,ifelse(var(13),60,80))<7, 7, fvar(11)*IfElse(var(10)=1,95,ifelse(var(13),60,80)))), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 10
air.hittime = 120
ground.velocity = ifElse(var(20), -4.86, -8.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -8.52)
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=63), var(36):=-69
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 6
envshake.freq = 120
envshake.ampl = 6

[State 200, Type]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Backwards Low Punch
[Statedef 224]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
facep2 = 1

[State 250, Anim]
type=changeanim
trigger1=!time
value=224

[State 250,Posset]
type=posset
trigger1=!time
y=0

[State 220, Reset]
type = VarSet
trigger1= anim=224 && animelemtime(2)<0
var(10) = 0
ignorehitpause=1
[State 220, Reset]
type = VarSet
trigger1= anim=224 && animelemtime(2)<0
var(11) = 0
ignorehitpause=1

[State 220, Add]
type = VarAdd
triggerall= anim=224 && animelemtime(2)>0
trigger1=!(AILevel) && (command="holdz")  
trigger2=AILevel
var(11) = 1
ignorehitpause=1

[State 1000, Anim]
type = ChangeAnim
triggerall = anim=224 && animelemtime(2)>0 && animelemtime(3) < 0
trigger1 = Ifelse(var(20),var(11)=15,var(11)=25)
trigger2 = !(AILevel) && (command!="holdz")  
trigger3 = AILevel && numenemy 
trigger3 = enemynear,movetype=A || enemynear,vel x>0 
value = 224
elem = 3
ignorehitpause=1

[State 0, VarSet]
type = VarSet
trigger1 = Ifelse(var(20),var(11)=15,var(11)=25)
v = 10    ;fv = 10
value = 1
ignorehitpause = 1
;persistent = 

[State Nope]
type=ChangeState
triggerall = animelemtime(3)<0 && Ifelse(var(20),var(11)<15,var(11)<25)
trigger1= !AILevel && command = "FF"
trigger2= AILevel && random<250 && numenemy
trigger2=(enemynear,movetype =A && enemynear,time>5) || p2bodydist x <- 10
value=710
ctrl=0

[State Nope]
type=ChangeState
triggerall = animelemtime(3)<0 && Ifelse(var(20),var(11)<15,var(11)<25)
trigger1= !AILevel && command = "BB"
trigger2= AILevel && random<100 && numenemy
trigger2=(enemynear,movetype =A && enemynear,time>5) || p2bodydist x > 240
value=715
ctrl=0

[State 220, Snd]
type=playsnd
trigger1= animelem=3 && (random<500 || var(10)) && anim = 224
value= 4, 3+(random%3)
channel=0

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 224
trigger1 = animelem = 3
statetype = A
physics = N
[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = anim = 2239
statetype = S
physics = S
persistent = 0
[State 0, PosSet]
type = PosSet
trigger1 = anim = 2239
y = 0
persistent = 0
[State 0, VelSet]
type = VelSet
trigger1 = anim = 2239
x = 0
y = 0
persistent = 0
[State 0, VelSet]
type = VelSet
trigger1 = anim = 224
trigger1 = animelem = 3
x = ifelse(var(10)=1,8,4.45)
y = -4.6
[State 0, Gravity]
type = Gravity
trigger1 = anim = 224
trigger1 = animelemtime(3) >= 0
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 224
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 2239

[State 0, It's actually a projectile]
type = Helper
trigger1 = anim = 2239 && animelem = 2
helpertype = normal
name = "Low blow"
ID = 2240
stateno = ifelse(var(10), 2241, 2240)
pos = 60,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
sprpriority = 5
size.xscale =.5
size.yscale =.5

[State 200, 1]
type = PlaySnd
trigger1 = anim = 224 && animelem = 3
value = 1,9
persistent = 0

[State 200, 7]
type = ChangeState
trigger1 = anim = 2239
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;------------------
; Hit by Fast Kung Fu Palm - shaking from the hit
; (a custom gethit state)
; See State 1020 for details
[Statedef 225]
type    = A
movetype= H
physics = N
velset = 0,0

[State 1025, Anim] ;Custom animation
type = ChangeAnim2
trigger1 = 1
value = 225

[State 1025, State]
type = ChangeState
trigger1 = HitShakeOver = 1
value = 226

;------------------
; Hit by Fast Kung Fu Palm - flying through the air
; (a custom gethit state)
[Statedef 226]
type    = A
movetype= H
physics = N

[State 1026, Velocity]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 1026, Gravity]
type = VelAdd
trigger1 = 1
y = .45

[State 1026, No scroll]
type = ScreenBound
triggerall = Pos y < -15
trigger1 = BackEdgeBodyDist < 65
trigger2 = FrontEdgeBodyDist < 65
value = 1
movecamera = 0,1

[State 1026, Hit wall]
type = ChangeState
triggerall = Pos y < -15
trigger1 = BackEdgeBodyDist <= 20
trigger2 = FrontEdgeBodyDist <= 20
value = 227

[State 1026, Hit ground]
type = SelfState
trigger1 = vel y + pos y >= 10
value = 5100

;------------------
; Hit by Fast Kung Fu Palm - hit wall
; (a custom gethit state)
[Statedef 227]
type    = A
movetype= H
physics = N

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 8
freq = 240
ampl = -8

[State 1027, Turn]
type = Turn
trigger1 = (Time = 0) && (FrontEdgeBodyDist <= 30)

[State 1027, Pos]
type = PosAdd
trigger1 = Time = 0
x = 15 - BackEdgeBodyDist

[State 1027, Stop moving]
type = PosFreeze
trigger1 = 1
x = 1
y = 1

[State 1027, No scroll]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 1027, Spark]
type = Explod
trigger1 = Time = 0
anim = F72
pos = 0, floor (screenpos y) - 50
postype = back
sprpriority = 3

[State 1027, Anim]
type = ChangeAnim2
trigger1 = Time = 0
value = 227

[State 1027, Sound]
type = PlaySnd
trigger1 = Time = 0
value = F7,1
[State 1027, Sound]
type = PlaySnd
trigger1 = Time = 0
value = F7,2
[State 1027, Sound]
type = PlaySnd
trigger1 = Time = 0
value = F5,4
freqmul = 1.2

[State 1027, State]
type = ChangeState
trigger1 = AnimTime = 0
value = 228

;------------------
; Hit by Fast Kung Fu Palm - bounce off wall
; (a custom gethit state)
[Statedef 228]
type    = A
movetype= H
physics = N

;[State 1028, 1]
;type = NotHitBy
;trigger1 = 1
;value = , NA, NP

[State 1028, Vel Y]
type = VelSet
trigger1 = Time = 0
y = -6

[State 1028, Vel X]
type = VelSet
trigger1 = Time = 0
x = 1.6

[State 1028, Turn]
type = Turn
trigger1 = (Time = 0) && (BackEdgeDist < 30)

[State 1028, Gravity]
type = VelAdd
trigger1 = 1
y = .35

[State 1028, Anim 5050] ;Self falling animation
type = ChangeAnim
trigger1 = Time = 0
trigger1 = !SelfAnimExist(5052)
value = 5050

[State 1028, Anim 5052] ;Self falling animation (diagup type)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5052)
value = 5052

[State 1028, Anim 5060] ;Coming down - normal
type = ChangeAnim
trigger1 = Vel Y > -2
trigger1 = Anim = 5050
trigger1 = SelfAnimExist(5060)
persistent = 0
value = 5060

[State 1028, Anim 5062] ;Coming down - diagup type
type = ChangeAnim
trigger1 = Vel Y > -2
trigger1 = Anim = 5052
trigger1 = SelfAnimExist(5062)
persistent = 0
value = 5062

[State 1028, Hit ground]
type = SelfState
trigger1 = vel y + pos y >= 10
value = 5100

;---------------------------------------------------------------------------
;OUCH! (fly away w/hitboxes)
[Statedef 229]
type    = A
movetype= H
physics = N
velset = -4.25,-6.5

[State 816, Gravity] 
type = VelAdd
Trigger1 = 1
y = .5

[State 816, ChangeAnim2]
type = ChangeAnim2
Trigger1 = !Time
value = 228

[State 816, recover]
type = Null;SelfState
triggerall = (Pos Y = [-20,5])&& alive && CanRecover
trigger1 = Command = "recovery"
value = Ifelse(pos y>=0,5200,5210)

[State 816, End] 
type = SelfState
trigger1=pos y > -vel y
value = 5100 

;---------------------------------------------------------------------------
; Standing Light Kick
[Statedef 230]
type    = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
facep2 = 1

[State 230, Anim]
type=changeanim
trigger1=!time
value=230

[State 230,Posset]
type=posset
trigger1=!time
y=0

[State 230, Snd]
type=playsnd
trigger1= !time && random<500
value= 4, ifelse(random<500, 0, 1)
channel=0

[State 230, Snd]
type=playsnd
trigger1= !time
value=1,3
channel=1

[State 230, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*35<7, 7, fvar(11)*35)), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=61), var(36):=-12
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 200, Type]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 230, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Medium Kick
[Statedef 240]
type    = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[State 240, Anim]
type=changeanim
trigger1=!time
value=240

[State 240,Posset]
type=posset
trigger1=!time
y=0

[State 240, Snd]
type=playsnd
trigger1= animelem=2 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 240, Snd]
type=playsnd
trigger1= animelem=3
value=1,4
channel=1

[State 240, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*63<7, 7, fvar(11)*63)), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=85), var(36):=-58
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 200, Type]
type=statetypeset
trigger1= animelemtime(6)>=0
movetype=I

[State 240, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Rising First Kick
[StateDef 241]
type = S
physics = S
moveType = A
anim = 241
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
facep2 = 1

[State 245, Voice]
type = PlaySnd
trigger1 = Animelem = 4 && Random < 500
value = 4, 2
channel = 0

[State 245, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,3
channel = 1

[State 245, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8100
ID = 8100
name = "Dust"
posType = P1
ownPal = 1

[State 245, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 2
stateType = A
physics = N

[State 251, Velocity]
type = VelSet
trigger1 = AnimElem = 2
x = 3.8
y = -4

[state 245, Gravity]
type = VelAdd
trigger1 = Animelem = 3,>= 0
y = 0.6

[State 245, HitDef]
type = HitDef
trigger1 = !numtarget(240) && !numtarget(220)
trigger1 = !var(16) && (var(15)<7 || var(20))
trigger1 = !time
forceNoFall = !var(20)
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 6, Hit
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 0
getpower = 30,15
givePower = 36, 36
pausetime = ifelse(var(20), 5, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 5, 12), ifelse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 6 + 2 * var(9)
ground.slideTime = 6 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 6
ground.velocity = ifElse(var(20), -2.41, -2.49), -6.8
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.41, -6.49)
guard.cornerPush.velOff = 0
air.velocity = -2.46, -5.05
air.cornerPush.velOff = 0
yAccel = 0.54
fall = 1
air.fall = 1
fall.recover = 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkXY = -10 + 0 * (var(35) := 66), var(36) := -47
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envshake.time = 6
envshake.ampl = 6
envshake.freq = 120

[State 245, ChangeState Blocked]
type = ChangeState
trigger1 = MoveGuarded
value = 243

[State 245, ChangeState Hit]
type = ChangeState
trigger1 = Vel Y > 5 && Pos Y >= 5
value = 244

;---------------------------------------------------------------------------
; Rising Second Kick
[StateDef 242]
type = S
physics = S
moveType = A
anim = 242
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
facep2 = 1

[State 245, Voice]
type = PlaySnd
trigger1 = Animelem = 4 && Random < 500
value = 4, 3
channel = 0

[State 245, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,5
channel = 1

[State 245, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 2
stateType = A
physics = N

[State 251, Velocity]
type = VelSet
trigger1 = AnimElem = 2
x = 3.8
y = -4

[state 245, Gravity]
type = VelAdd
trigger1 = Animelem = 4,>= 0
y = 0.6

[State 245, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15)<8 || var(20))
trigger1 = !time
forceNoFall = !var(20)
ID = 240
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 6, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 0
getpower = 30,15
givePower = 36, 36
pausetime = ifelse(var(20), 5, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 5, 12), ifelse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 6 + 2 * var(9)
ground.slideTime = 6 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 6
ground.velocity = ifElse(var(20), -2.41, -2.49), -6.8
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.41, -6.49)
guard.cornerPush.velOff = 0
air.velocity = -2.46, -5.05
air.cornerPush.velOff = 0
yAccel = 0.54
fall = 1
air.fall = 1
fall.recover = 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkXY = -10 + 0 * (var(35) := 66), var(36) := -47
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envshake.time = 6
envshake.ampl = 6
envshake.freq = 120

[State BLAM]
type = Explod
trigger1 = movehit = 1 
trigger1 = NumTarget(240)
trigger1 = p2statetype = A
anim = 229
ID = 229
pos = 66, -47
postype = p1
removetime = -2
supermovetime = 65535
pausemovetime = 65535
scale = 1,1
sprpriority = 12
ontop = 1
ownpal = 1

[State 450, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(240)
trigger1 = !(target(240),ishelper)
value = 258
ID = 240
ignoreHitPause = 1
persistent = 0

[State 245, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 243
ctrl = 1

[State 245, ChangeState Landing]
type = ChangeState
trigger1 = Vel Y > 5 && Pos Y >= 5
value = 244

;--------------------------------------------------------------
; Fall
[Statedef 243]
type     = A
movetype = I
physics  = N
juggle   = 1
poweradd = 0
ctrl     = 0
anim     = 243
sprpriority = 2

[State 246, Velocity]
type = VelSet
trigger1 = time = 0
x = ifelse(prevstateno=242,-1.5,-3)
y = -3

[state 246, Gravity]
type = VelAdd
trigger1 = Animelem = 2>= 0
y = 0.6

[State 246, ChangeState Land]
type = ChangeState
trigger1 = Vel Y > 5 && Pos Y >= 5
value = 244

;--------------------------------------------------------------
; Landing
[Statedef 244]
type     = S
movetype = I
physics  = S
juggle   = 1
poweradd = 0
ctrl     = 0
anim     = 244
sprpriority = 2

[State 247, Land Sound]
type = PlaySnd
trigger1 = Time = 0
value = 52, 0

[State 247, Velocity]
type = VelSet
trigger1 = time = 0
x = 0
y = 0

[State 247, PosSet]
type = PosSet
trigger1 = Pos Y >= 0
y = 0

[state 247, Changestate]
type = Changestate
trigger1 = Animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Strong Kick
[Statedef 250]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[State 250, Anim]
type=changeanim
trigger1=!time
value=250

[State 250,Posset]
type=posset
trigger1=!time
y=0

[State 250, Snd]
type=playsnd
trigger1= animelem=1 && random<500
value= 4, ifelse(random<500, 5, 3)
channel=0

[State 250, Snd]
type=playsnd
trigger1= animelem=2
value=1,5
channel=1

[State 250, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*91<7, 7, fvar(11)*91)), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(PrevStateNo = 700, -6.46, ifElse(var(20), -4.86, -10.52)), ifElse(PrevStateNo = 700, -5.25, 0)
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yaccel = 0.58
fall = ifElse(PrevStateNo = 700, 1, 0)
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=81), var(36):=-85
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 6
envshake.freq = 120
envshake.ampl = 6

[State 200, Type]
type=statetypeset
trigger1= animelemtime(6)>=0
movetype=I

[State 250, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;----------------------------------------------------------------------
; Hit by Spiral Attack - custom gethit state
[Statedef 255]
type = A
movetype = H
physics = N
poweradd = 40
velset = -3,-4.5

[State 0, SelfAnim]
type = ChangeAnim
trigger1 = !time && anim != 5050
trigger2 = !SelfAnimExist(5050 + (anim % 10))
value = 5050

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 821, 1] ;Gravity
type = Gravity
Trigger1 = 1
;y = .61

[State 1026, Hit wall]
type = ChangeState
triggerall = Pos y < -15
trigger1 = BackEdgeBodyDist <= 20
trigger2 = FrontEdgeBodyDist <= 20
value = 227

[State 821, 4] ;Hit ground
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 256 ;Hit ground

;---------------------------------------------------------------------------
; THIS PARTY'S GETTING BOUNCY!
[Statedef 256]
type    = A
movetype= H
physics = N

[State 5100, 1]
type = VelSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
trigger1 = vel x > 1
x = 1
[State COLLISION DAMAGE]
type = EnvShake
trigger1 = time = 0
time = 12
freq = 255
ampl = -7
[State 5100, Var] ;Save fall velocity
type = VarSet
trigger1 = Time = 0
sysvar(1) = floor(vel y)
[State 5100, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = !selfanimexist(5101)
value = 5100
[State 5100, 3]
type = ChangeAnim
trigger1 = time = 0
trigger1 = selfanimexist(5101)
value = 5101

[State 5100, 4]
type = PosSet
trigger1 = Time = 0
y = 0
[State 5100, 5]
type = VelSet
trigger1 = Time = 0
y = 0
[State 5100, 6] ;Reduce speed
type = VelMul
trigger1 = Time = 0
x = 0.75

[State 5100, 8]
type = Explod
trigger1 = Time = 1
anim = F60
pos = 0, 0
sprpriority = -2
supermovetime = 65535
pausemovetime = 65535
scale = 0.5,3
[State 5100, 8]
type = Explod
trigger1 = Time = 1
anim = F61
pos = 0, 0
sprpriority = -2
supermovetime = 65535
pausemovetime = 65535
scale = 1,2
[State 5100, 8]
type = Explod
trigger1 = Time = 1
anim = F62
pos = 0, 0
sprpriority = -2
supermovetime = 65535
pausemovetime = 65535
scale = 2,2

[State 5100, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7, 2
[State 5100, 11]
type = PosFreeze
trigger1 = 1
[State 5100, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 257

[State 5100, 13]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

;---------------------------------------------------------------------------
; HIT_BOUNCE (bounce into air)
[Statedef 257]
type    = A
movetype= H
physics = N

[State 5101, 1] ;Coming hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim != [5101,5109]
trigger2 = !SelfAnimExist(5160 + (anim % 10))
value = 5160
[State 5101, 2] ;Coming hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [5101,5109]
trigger1 = SelfAnimExist(5160 + (anim % 10))
value = 5160 + (anim % 10)

[State 5101, 3]
type = VelSet
trigger1 = Time = 0
x = -3
y = -10.12
[State 5101, 5] ;Acceleration
type = VelAdd
trigger1 = 1
y = .69

[State 5101, 6] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 6
type = SelfState
value = 5110

;HIT_SPIN (with fall damage)
[Statedef 258]
type = A
movetype = H
physics = N
velset = -3.5,-14.4
poweradd = 40

[State 820, 1]
type = ChangeAnim2
Trigger1 = !Time
value = 251

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0
ignorehitpause = 1

[State Decelerattle]
type = VelMul
trigger1 = 1
x = 0.98
[State 821, 1] ;Gravity
type = VelAdd
Trigger1 = 1
y = .713

[State FALL DAMAGE]
type = LifeAdd
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = -35
kill = 1
[State 810, EnvShake]
type = EnvShake
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 14
freq = 120
ampl = 15

[State 821, 4] ;Hit ground
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100 ;Hit ground

;---------------------------------------------------------------------------
; Crouching Light Punch
[Statedef 400]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 400, Anim]
type=changeanim
trigger1=!time
value=400

[State 400,Posset]
type=posset
trigger1=!time
y=0

[State 400, Snd]
type=playsnd
trigger1= !Time && random<200
value= 4, ifelse(random<500, 0, 1)
channel=0

[State 400, Snd]
type=playsnd
trigger1= !time
value=1,0
channel=1

[State 400, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*21<7, 7, fvar(11)*21)), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=0)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=62), var(36):=-45
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 400, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Medium Punch
[Statedef 410]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[State 410, Anim]
type=changeanim
trigger1=!time
value=410

[State 410,Posset]
type=posset
trigger1=!time
y=0

[State 410, Snd]
type=playsnd
trigger1= !time && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 410, Snd]
type=playsnd
trigger1= !time
value=1,1
channel=1

[State 410, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*63<7, 7, fvar(11)*63)), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=60), var(36):=-52
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 410, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 410, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Strong Punch
[Statedef 420]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[State 420, Anim]
type=changeanim
trigger1=!time
value=420

[State 420,Posset]
type=posset
trigger1=!time
y=0

[State 420, Snd]
type=playsnd
trigger1= !time && random<500
value= 4, ifelse(random<500, 3, 5)
channel=0

[State 420, Snd]
type=playsnd
trigger1= !time
value=1,10
channel=1

[State 0, Width]
type = Width
trigger1 = animelemtime(2) >= 0 && animelemtime(7) < 0
value = 50,-9
ignorehitpause = 1
;persistent = 

[State 420, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*84<7, 7, fvar(11)*84)), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=95), var(36):=-74
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
forceStand = 1
envshake.time = 6
envshake.freq = 120
envshake.ampl = 6

[State 420, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 420, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Light Kick
[Statedef 430]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 430, Anim]
type=changeanim
trigger1=!time
value=430

[State 430,Posset]
type=posset
trigger1=!time
y=0

[State 430, Snd]
type=playsnd
trigger1= !time && random<200
value= 4, ifelse(random<500, 0, 1)
channel=0
[State 430, Snd]
type=playsnd
trigger1= !time
value=1,3
channel=1

[State 430, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1=  !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = L
damage = ceil(ifelse(fvar(11)*28<7, 7, fvar(11)*28)), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=64), var(36):=-1
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 430, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 430, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1


;---------------------------------------------------------------------------
; Crouching Medium Kick
[Statedef 440]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[State 440, Anim]
type=changeanim
trigger1=!time
value=440

[State 440,Posset]
type=posset
trigger1=!time
y=0

[State 440, Snd]
type=playsnd
trigger1= animelem=2 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 440, Snd]
type=playsnd
trigger1= animelem=2
value=1,4
channel=1

[State 440, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = L
damage = ceil(ifelse(fvar(11)*56<7, 7, fvar(11)*56)), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=76), var(36):=-13
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 440, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
movetype = I

[State 440, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Strong Kick
[Statedef 450]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0 * !var(20)
faceP2 = 1

[State 450, Anim]
type=changeanim
trigger1=!time
value=450

[State 450,Posset]
type=posset
trigger1=!time
y=0

[State 450, Snd]
type=playsnd
trigger1= animelem=2
value=1,5
channel=1

[State 450, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
ID = 450
attr = C,NA
hitflag = MAF
guardflag = L
damage = ceil(ifelse(fvar(11)*91<7, 7, fvar(11)*91)), 0
getpower = 30,15
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
guard.hittime = 18
air.hittime = 120
ground.velocity = -1, -6.25
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -1, -8.24
air.cornerPush.velOff = 0
yAccel = 0.677
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=83), var(36):=-10
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 6
envshake.freq = 120
envshake.ampl = 6

[State 450, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(450)
value = 455
ID = 450
ignoreHitPause = 1
persistent = 0

[State 450, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 450, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1


;---------------------------------------------------------------------------
; Tripped get-hit (shaking)
[Statedef 455]
type    = A
movetype= H
physics = N
velset = 0,0

[State 5070, 1]
type = ChangeAnim
trigger1 = 1
value = 5070

[State 5070, 2]
type = ChangeState
trigger1 = HitShakeOver
value = 456

[State 5070, 3]
type = ForceFeedback
trigger1 = time = 0
time = 12
waveform = sinesquare
ampl = 140


; Tripped get-hit (knocked away)
[Statedef 456]
type    = A
movetype= H
physics = N

[State 5071, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5071, 2] ;Acceleration
type = VelAdd
trigger1 = time > 0
y = GetHitVar(yaccel)

[State 5071, 3] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= Const(movement.air.gethit.trip.groundlevel)
type = SelfState
value = 5110


;---------------------------------------------------------------------------
; Jump Light Punch
[Statedef 600]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 600, Anim]
type=changeanim
trigger1=!time
value=600

[State 600, Snd]
type=playsnd
trigger1= animelem=2 && random<200
value= 4, ifelse(random<500, 0, 1)
channel=0

[State 600, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 600, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1 = AnimElem = 2
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*35<7, 7, fvar(11)*35)), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=0)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=47), var(36):=-65
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 600, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 2, 6)
value = 600
elem = 3
ignoreHitPause = 1

[State 620, Type]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 600, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Medium Punch
[Statedef 610]
type = A
physics  = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 0 * !var(20)

[State 610, Anim]
type=changeanim
trigger1=!time
value=610

[State 610, Snd]
type=playsnd
trigger1= animelem=2 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 610, Snd]
type=playsnd
trigger1= animelem=2
value=1,1
channel=1

[State 610, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=3
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*63<7, 7, fvar(11)*63)), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 14 + 3*var(9)
ground.slidetime = 14 + 3*var(9)
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=1)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=42), var(36):=-75
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 610, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) <= 0
trigger1 = HitPauseTime <= ifElse(var(20), 3, 8)
value = 610
elem = 4
ignoreHitPause = 1

[State 610, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 610, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Strong Punch
[Statedef 620]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 0 * !var(20)

[State 0, VelAdd]
type = VelSet
trigger1 = !time
y = -.2

[State 620, Anim]
type=changeanim
trigger1=!time
value=620

[State 620, Snd]
type=playsnd
trigger1= animelem=2 && random<500
value= 4, ifelse(random<500, 3, 4)
channel=0

[State 620, Snd]
type=playsnd
trigger1= animelem=5
value=1,11
channel=1

[State 620, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1= !time
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*84<7, 7, fvar(11)*84)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 15 + 4*var(9)
ground.slidetime = 16 + 4*var(9)
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=55), var(36):=-20
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 6
envshake.freq = 120
envshake.ampl = 6

[State 620, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 620, Gravity]
type = VelSet
trigger1 = animelem = 6
y = 30
x = 11

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Forward Jump First Punch
[Statedef 621]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 0 * !var(20)

[State 0, VelAdd]
type = VelSet
trigger1 = !time
y = -.2

[State 620, Anim]
type=changeanim
trigger1=!time
value=621

[State 620, Snd]
type=playsnd
trigger1= animelem=2
value=1,8
channel=1

[State 620, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1= !time
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = MA
damage = ceil(ifelse(fvar(11)*ifelse(var(13),60,84)<7, 7, fvar(11)*ifelse(var(13),60,84))), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 4*var(9)
ground.slidetime = 12 + 4*var(9)
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=55), var(36):=-67
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 6
envshake.freq = 120
envshake.ampl = 6

[State 620, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 620, Gravity]
type = Gravity
trigger1 = AnimElemTime(5) >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Forward Jump Second Punch
[Statedef 622]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 0 * !var(20)

[State 0, VelAdd]
type = VelSet
trigger1 = !time
y = -.2

[State 620, Anim]
type=changeanim
trigger1=!time
value=622

[State 620, Snd]
type=playsnd
trigger1= animelem=2
value=1,10
channel=1

[State 620, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1= !time
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = MA
damage = ceil(ifelse(fvar(11)*50<7, 7, fvar(11)*50)), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 4*var(9)
ground.slidetime = 12 + 4*var(9)
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=55), var(36):=-67
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 6
envshake.freq = 120
envshake.ampl = 6

[State 620, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 620, Gravity]
type = Gravity
trigger1 = AnimElemTime(5) >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Forward Jump Third Punch
[Statedef 623]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 0 * !var(20)

[State 0, VelAdd]
type = VelSet
trigger1 = !time
y = -.2

[State 620, Anim]
type=changeanim
trigger1=!time
value=623

[State 620, Snd]
type=playsnd
trigger1= animelem=2 && random<700
value= 4, 3+(random%3)
channel=0

[State 620, Snd]
type=playsnd
trigger1= animelem=2
value=1,11
channel=1

[State 620, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1= !time
forcenofall = !var(20)
ID = 220
attr = A,NA
hitflag = MAF
guardflag = MA
damage = ceil(ifelse(fvar(11)*59<7, 7, fvar(11)*59)), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 4*var(9)
ground.slidetime = 12 + 4*var(9)
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=55), var(36):=-67
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 6
envshake.freq = 120
envshake.ampl = 6

[State BLAM]
type = Explod
trigger1 = movehit = 1 
trigger1 = NumTarget(220)
trigger1 = p2statetype = A
anim = 229
ID = 229
pos = 55, -67
postype = p1
removetime = -2
supermovetime = 65535
pausemovetime = 65535
scale = 1,1
sprpriority = 12
ontop = 1
ownpal = 1

[State 620, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
moveType = I

[State 220, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(220)
trigger1 = !(target(220),ishelper)
value = Ifelse(p2statetype=A,255,229)
ID = 220
ignoreHitPause = 1
persistent = 0

[State Wall WHAM]
type = PlaySnd
trigger1 = target,stateno = 227
trigger1 = target,time = 1
value = S1,18

[State 620, Gravity]
type = VelSet
trigger1 = animelem = 5
x = 11

[State 620, Gravity]
type = Gravity
trigger1 = animelemtime(5) >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Light Kick
[Statedef 630]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 630, Anim]
type=changeanim
trigger1=!time
value=630

[State 630, Snd]
type=playsnd
trigger1= animelem=2 && random<200
value= 4, ifelse(random<500, 0, 1)
channel=0

[State 630, Snd]
type=playsnd
trigger1= animelem=2
value=1,3
channel=1

[State 630, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1 = !time
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*35<7, 7, fvar(11)*35)), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=66), var(36):=-38
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 630, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 630, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52


;---------------------------------------------------------------------------
; Jump Medium Kick
[Statedef 640]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 0 * !var(20)

[State 640, Anim]
type=changeanim
trigger1=!time
value=640

[State 640, Snd]
type=playsnd
trigger1= animelem=2 && random<350
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 640, Snd]
type=playsnd
trigger1= animelem=2
value=1,4
channel=1

[State 640, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !time
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*56<7, 7, fvar(11)*56)), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 14 + 3*var(9)
ground.slidetime = 14 + 3*var(9)
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=54), var(36):=-36
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 640, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 640, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 640, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Strong Kick
[Statedef 650]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 0 * !var(20)

[State 650, Anim]
type=changeanim
trigger1=!time
value=650

[State 650, Snd]
type=playsnd
trigger1= animelem=3 && random<500
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 650, Snd]
type=playsnd
trigger1= animelem=3
value=1,5
channel=1

[State 650, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !time
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = ceil(ifelse(fvar(11)*98<7, 7, fvar(11)*98)), 0
getpower = 30,15
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 16 + 4*var(9)
ground.slidetime = 15 + 4*var(9)
guard.hittime = 18
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=64), var(36):=-80
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 6
envshake.freq = 120
envshake.ampl = 6

[State 650, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 650, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 650, End]
type=changestate
trigger1= pos y>-vel y
value=52

;===========<Throw Attempt>==========
[Statedef 800]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=0*!var(20)
facep2=1

[State 800, Anim]
type=changeanim
trigger1=!time
value=800

[State 800,Posset]
type=posset
trigger1=!time
y=0

[State 800, Button]
type=varset
trigger1= !time && !AILevel
var(10)= (command="kk")

[State 800, Button AI]
type=varset
trigger1= !time && AILevel
var(10)= (random<500)

[State 800, Tech Hit]
type = varset
trigger1 = 1
var(19) = 0

[State 800, Tech Hit]
type = varset
trigger1 = numenemy
trigger1 = enemynear, statetype != A
trigger1 = (enemynear, stateno = [0, 999]) && (enemynear, stateno != [100, 119]) && (enemynear, stateno != [200, 799])
var(19) = 7

[State 800, Guard Dist]
type=attackdist
trigger1= 1
value=0

[State 800, Hit]
type=hitdef
trigger1= animelem=2
trigger1 = P2BodyDist x < 55
trigger1= !var(38)
attr=S,NT
hitflag=M-
priority = 1, Miss
getpower = 30,15
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=ifelse(command="holdback",805,810)

[State 800, Hit]
type=hitdef
trigger1= animelem=2 && var(10)
trigger1= !var(38)
trigger1 = P2BodyDist x < 55
attr=S,NT
hitflag=M-
priority = 1, Miss
getpower = 30,15
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=ifelse(command="holdback",820,805)

[State 800, Hit]
type=hitdef
trigger1= animelem=2
trigger1 = P2BodyDist x < 55
trigger1= !var(38) && numtarget(3200)
attr=S,NT
hitflag=M
priority = 1, Miss
getpower = 30,15
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=ifelse(command="holdback",805,810)

[State 800, Hit]
type=hitdef
trigger1= animelem=2 && var(10)
trigger1= !var(38) && numtarget(3200)
trigger1 = P2BodyDist x < 55
attr=S,NT
hitflag=M
priority = 1, Miss
getpower = 30,15
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=ifelse(command="holdback",820,805)

[State 800, Snd]
type=playsnd
trigger1= animelem=4
value=800,0
channel=0

[State 800, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 800, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 800, End]
type=changestate
trigger1= !animtime
value=0
ctrl=1


;---PLAYER TURNS---
[Statedef 805]
type=S
movetype=A
physics=S
ctrl=0
sprpriority=0

[State 805, Anim]
type=changeanim
trigger1=!time
value=805

[State 805,Posset]
type=posset
trigger1=!time
y=0

[State 805, Throw]
type=targetstate
trigger1= !time && numtarget
value=806

[State 805, Throw]
type=targetfacing
trigger1= !time && numtarget
value=-1

[State 805, Width]
type=width
trigger1= 1
edge=24,24
ignoreHitPause = 1

[State 805, Turn]
type=turn
trigger1 = AnimElem = 4

[State 805, facing]
type=targetfacing
trigger1= 1
value=-1

[State 805, Escape]
type=changestate
trigger1= numtarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback") && Target, command != "holdup" && Target, command != "holddown"
trigger1= (target,command="b" || target,command="c" || target,command="y" || target,command="z")
value=890

[State 805, Escape]
type=varadd
trigger1= var(19)>0
var(19)=-1

[State 805, TargetBind 1]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = 42,0

[State 805, TargetBind 2]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
trigger2 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 11,0

[State 805, TargetBind 3]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 0,0

[State 805, SprPriority 1]
type = SprPriority
trigger1 = AnimElemTime(2) < 0 || AnimElemTime(5) >= 0
value = 1

[State 805, SprPriority 2]
type = SprPriority
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(5) < 0
value = -1

[State 805, End]
type=changestate
trigger1= !numtarget
value=0
ctrl=1

[State 805, End]
type=changestate
trigger1= animelemtime(5)>=0
value=ifelse(var(10),820,810)



;---TARGET---
[Statedef 806]
type = S
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 806, Turn]
type = Turn
trigger1 = !Time
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 806, NHB]
type=nothitby
trigger1= 1
value=SCA
time=1

[State 806, Anim]
type=changeanim2
trigger1= !time
value=806

[State 806, Camera]
type=screenbound
trigger1= 1
value=0
movecamera=1,1
ignoreHitPause = 1

[State 806, Safety]
type=selfstate
trigger1= time>=60
value= ifelse(pos y<0, 5040, 0)
ctrl=1

;---------------------------------------------------------------------------
;Chiromalpractice
[Statedef 810]
type    = S
movetype= A
physics = N
anim = 810
poweradd = 0

[State 810, Safety]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 820, More Safety]
type = NotHitBy
trigger1 = 1
value = SCA

[State 820, Throw Escape]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback")
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 820, Throw Escape]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 820, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 811

[State 810, 0]
type = TargetBind
trigger1 = time = [0,24]
pos = 0, 0

[State 810, 1]
type = TargetBind
trigger1 = time = [25,29]
pos = 0, ceil(-240*const(size.yscale))

[State 810, 2]
type = TargetBind
trigger1 = time = [30,49]
pos = 0, ceil(-200*const(size.yscale))

[State 810, 3]
type = TargetBind
trigger1 = time = [50,54]
pos = 0, ceil(-120*const(size.yscale))

[State 810, 4]
type = TargetBind
trigger1 = time = [55,84]
pos = 0, ceil(-150*const(size.yscale))

[State 810, 5]
type = VelSet
trigger1 = animelem = 3
y = -13

[State 810, 6]
type = VelAdd
trigger1 = time > 29
trigger1 = time < 50
trigger1 = pos y <= 0
y = 1.7

[State 810, 7]
type = VelSet
trigger1 = animelem = 5
y = 0

[State 810, 8]
type = Width
trigger1 = time = 0
edge = 60,0

[State 810, 9]
type = ScreenBound
trigger1 = 1
movecamera = 1,0

[State 810, 10]
type = PosSet
trigger1 = animelem = 5
y = 0

[State 810, 11]
type = PlaySnd
trigger1 = animelem = 3
value = S40,0

[State 810, 13]
type = PlaySnd
trigger1 = !time && random<300
value = S5,0

[State 810, 12]
type = PlaySnd
trigger1 = animelem = 5
value = S100,0

[State 810, 13]
type = PlaySnd
trigger1 = animelem = 5
value = S2,45

[State 810, 14]
type = TargetLifeAdd
trigger1 = animelem = 5
value = floor(-120*fvar(11))

[State 820, PowerAdd]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 5 && !var(20)
value = 0

[State 820, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 5
value = 35

[State 830, EnvShake]
type = EnvShake
triggerall=NumTarget
trigger1=animelem=5
time = 10
ampl = 4

[State 820, HitSpark]
type=Helper
triggerall = numtarget
trigger1 =animelem=5
trigger1 =1||var(33):=8012
helperType=Normal
stateNo=8012
ID=8000
name="Spark"
posType=P1
pos=ceil(0 * const(size.xScale)), ceil(-150 * const(size.yScale))
facing=-1
ownPal=1
size.xScale=1
size.yScale=1
pauseMoveTime=65535
superMoveTime=65535
ignoreHitPause=1

[State 820, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 5
value = 1

[State 820, VarAdd]
type = VarAdd
trigger1 = NumTarget && AnimElem = 5
var(13) = 1

[State 820, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 5
var(15) = 1
ignoreHitPause = 1

[State 820, Juggle]
type = VarSet
trigger1 = NumTarget && AnimElem = 5
var(16) = 1
ignoreHitPause = 1

[State 820, CASH IN!]
type = VarAdd
trigger1 = NumTarget && AnimElem = 5
var(27) = 10000

[State 820, Throw 11]
type = TargetState
trigger1 = NumTarget && AnimElemTime(6) = 29
value = 812

[State 810, 16]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;OUCH!
[Statedef 811]
type    = A
movetype= H
physics = N
velset = 0,0

[State 811, 0]
type = ChangeAnim2
Trigger1 = Time = 0
value = 811

[State 811, 1]
type = VelSet
trigger1 = animtime = 0
y = -5

[State 811, 2]
type = PalFX
trigger1 = animelem = 8
time = 15
add = 256,0,0
mul = 256,0,0
sinadd = 0,0,0,1
invertall = 0
color = 256

[State 811, 3]
type = ScreenBound
trigger1 = 1
movecamera = 1,0

[State 815, SelfState]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

;---------------------------------------------------------------------------
;OUCH! (fly away)
[Statedef 812]
type    = A
movetype= H
physics = N
velset = 2.8,-7
poweradd = 40

[State 812, 1] ;Gravity
type = VelAdd
Trigger1 = 1
y = .4

[State 812, 2] ; Recover near ground (use ChangeState)
type = ChangeState
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5200 ;HITFALL_RECOVER

[State 812, 3] ; Recover in mid air (use SelfState)
type = SelfState
triggerall = Vel Y > 0
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5210 ;HITFALL_AIRRECOVER

[State 812, 4] ;Hit ground
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100 ;Hit ground

;---------------------------------------------------------------------------
;Skullcarver
[Statedef 820]
type = S
movetype = A
physics = S
anim = 820
velset = 0, 0
poweradd = 0
sprpriority = 2

[State 810, Safety]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 820, More Safety]
type = NotHitBy
trigger1 = 1
value = SCA

[State 820, Throw Escape]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback")
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 820, Throw Escape]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 820, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 821

[State 820, ChangeAnim]
type = Null;ChangeAnim
trigger1 = PrevStateNo = 805 && !Time
value = 820
elem = 2;1

[State 820, Target Facing]
type = TargetFacing
trigger1 = Time <= 1
value = -1

[State 820, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 812, Woosh]
type = Explod
trigger1 = AnimElem = 4
ID = 825
anim = 825
postype = p1
pos = ceil(150 * const(size.xScale)), ceil(-125 * const(size.yScale))
ontop = 1
facing = 1
ownpal = 1
scale=const(size.xscale),const(size.yscale)
;supermovetime = 999
;pausemovetime = 999
ignorehitpause = 1

[State 820, Swing Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1, 2
channel = 1

[State 820, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 999, random%2
channel = 0

[State 820, Bind 1]
type = TargetBind
trigger1 = AnimElemTime(4) < 0
trigger1 = NumTarget
pos = ceil(60 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 820, Bind 1]
type = TargetBind
trigger1 = AnimElemTime(4) = 0
trigger1 = NumTarget
pos = ceil(100 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 820, Width 1-5]
type = Width
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(5) < 0
edge = 72,0

[State 820, Damage 11]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 4
value = floor(-120*fvar(11))

[State 820, Throw 11]
type = TargetState
trigger1 = NumTarget && AnimElem = 4
value = 822

[State 820, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 4
value = 35

[State 830, EnvShake]
type = EnvShake
triggerall=NumTarget
trigger1=animelem=4
time = 10
ampl = 4

[State 820, HitSpark]
type=Helper
triggerall = numtarget
trigger1 =animelem=4
trigger1 =1||var(33):=8012
helperType=Normal
stateNo=8012
ID=8000
name="Spark"
posType=P1
pos=ceil(150 * const(size.xScale)), ceil(-125 * const(size.yScale))
facing=-1
ownPal=1
size.xScale=1
size.yScale=1
pauseMoveTime=65535
superMoveTime=65535
ignoreHitPause=1
[State 820, Hit Snd]
type = PlaySnd
trigger1=animelem=4
value = 2,22
channel=2

[State 810, 13]
type = PlaySnd
trigger1 = !time && random<300
value = S5,ifelse(random<500,1,6)

[State 820, PowerAdd]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 4 && !var(20)
value = 0

[State 820, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 4
value = 1

[State 820, VarAdd]
type = VarAdd
trigger1 = NumTarget && AnimElem = 4
var(13) = 1

[State 820, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 4
var(15) = 1
ignoreHitPause = 1

[State 820, Juggle]
type = VarSet
trigger1 = NumTarget && AnimElem = 4
var(16) = 1
ignoreHitPause = 1

[State 820, CASH IN!]
type = VarAdd
trigger1 = NumTarget && AnimElem = 4
var(27) = 10000

[State 820, AttackDist]
type=AttackDist
trigger1=1
value=0

[State 820, State End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;OUCH!
[Statedef 821]
type = A
movetype = H
physics = N
ctrl = 0
sprpriority = 1

[State 815, On Ground]
type = PosSet
trigger1 = !Time
y = 0

[State 815, Screenbound]
type = ScreenBound
Trigger1 = 1
value = 1
movecamera = 0,0

[State 815, ChangeAnim2]
type = ChangeAnim2
Trigger1 = !Time
value = 821

[State 815, ChangeAnim2]
type = Null;ChangeAnim2
trigger1 = !Time
trigger1 = PrevStateNo = 806
value = 815
elem = 2

;In case attacker loses binding on player for any reason, this controller
;guarantees that the player will never get stuck in this thrown state.
[State 815, SelfState]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050
;---------------------------------------------------------------------------
;OUCH! (fly away)
[Statedef 822]
type    = A
movetype= H
physics = N
velset = -4.25,-6.5

[State 816, Gravity] 
type = VelAdd
Trigger1 = 1
y = .5

[State 816, ChangeAnim2]
type = ChangeAnim2
Trigger1 = !Time
value = 822

[State 816, recover]
type = Null;SelfState
triggerall = (Pos Y = [-20,5])&& alive && CanRecover
trigger1 = Command = "recovery"
value = Ifelse(pos y>=0,5200,5210)

[State 816, End] 
type = SelfState
trigger1=pos y > -vel y
value = 5100 

;butterfingers
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
x = -1.425
y = 0

[State 890, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 800,2
channel = 0

[State 890, Escape Sound]
type = PlaySnd
trigger1= !Time
value = 130,0

[State 890, Throw Escape FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8000
ID = 8000
name = "Spark"
PosType = P1
pos = 0, -54
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

[State 895, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 895, VelSet]
type = VelSet
trigger1 = 1
x = -1.425
y = 0

[State 895, End]
type = SelfState
trigger1 = Time >= 27
value = 0
ctrl = 1


