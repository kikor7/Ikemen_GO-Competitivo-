; _________________________________________
;| Roa by varo_hades                       |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<HELPER STATES>========================================
;==============================================================================================

;====================<PARRY HELPER>=========================
[StateDef 765]
type = A
physics = N
moveType = I
anim = ifElse(Root, StateType = C, 766, ifElse(Root, StateType = A, 767, 765))
velSet = 0,0
ctrl = 0

[State 765, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 765, BindToRoot]
type = BindToRoot
trigger1 = 1
time = -1

[State 765, Change to Crouching]
type = ChangeAnim
triggerAll = !Time
trigger1 = !(Root, AILevel) && Root, command = "down"
trigger2 = Root, AILevel && (Root, StateType != A) && P2StateType = C
value = 766

[State 765, Change to Standing / Jumping]
type = ChangeAnim
triggerAll = !Time
trigger1 = !(Root, AILevel) && Root, command = "fwd"
trigger2 = Root, AILevel && Anim != 766
value = ifElse((Root, StateType = A), 767, 765)

[State 765, Change to Standing / Jumping]
type = ChangeAnim
trigger1 = Anim = 765 || Anim = 767
value = ifElse((Root, StateType = A), 767, 765)

[State 765, Disable]
type = VarSet
trigger1 = Time >= ifElse((Root, StateType = A), 7, 8)
trigger2 = Facing != (Root, Facing)
trigger3 = !(Root, ctrl)
trigger3 = (Root, StateNo != [760,762]) && (Root, StateNo != 5120)
var(0) = 1

[State 765, Disable]
type = VarSet
triggerAll = !(Root, AILevel)
trigger1 = (Root, command = "holdback")
trigger2 = Time < 4 && (Root, command = "holdfwd" + Root, command = "holddown") > 1
trigger3 = Time >= 4 && (Root, command = "holdfwd" || Root, command = "holddown")
trigger4 = Time >= 1 && (((Anim = 765 || Anim = 767) && Root, command = "fwd") || (Anim = 766 && Root, command = "down"))
var(0) = 1

[State 765, Disable]
type = ChangeAnim
trigger1 = var(0) = 1
value = 1

[State 765, Standing/Air]
type = ReversalDef
trigger1 = !var(0) && (Anim = 765 || Anim = 767)
trigger1 = (Root, StateNo != 5120) || !(Root, AnimTime)
reversal.attr = SCA,AA
p1StateNo = 766
pauseTime = 0,0
sparkNo = -1
numHits = 0

[State 765, Crouching]
type = ReversalDef
trigger1 = !var(0) && Anim = 766
reversal.attr = SC,AA
p1StateNo = 766
pauseTime = 0,0
sparkNo = -1
numHits = 0

[State 765, Disable]
type = ReversalDef
trigger1 = var(0) = 1
reversal.attr =
pauseTime = 0,0
sparkNo = -1
numHits = 0

[State 765, End]
type = DestroySelf
trigger1 = Time >= 18
trigger2 = (Root, MoveType != I)
trigger3 = !(Root, ctrl) && (Root, StateNo != [760,762]) && (Root, StateNo != 5120)
trigger4 = (Root, StateNo = [760,762]) && (Root, Time <= 1)

;Success
[StateDef 766]
moveType = I
ctrl = 0

[State 766, Disable]
type = VarSet
trigger1 = 1
var(0) = 1

[State 766, End]
type = DestroySelf
trigger1 = Root, StateNo = [760,762]
trigger2 = Time >= 2

;=====================<MAX MODE BAR HELPER>============================
[Statedef 780]
type = S
movetype = I
physics = N
anim = 1
sprpriority = 0
ignorehitpause = 1

[State 780, BindToRoot]
type = BindToRoot
trigger1 = 1
time = -1
pos = 0,-15

[State 780, Meter BG]
type = Explod
trigger1 = !Time
anim = 780
id = 780
pos = 2,0
postype = p1
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = -1
ontop = 1
ownpal = 1
removeongethit = 0

[State 780, Meter Fill]
type = Explod
trigger1 = Time = 2
anim = 781
id = 781
pos = 24,0
postype = p1
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = 2
ontop = 1
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 780, Meter Container]
type = Explod
trigger1 = Time = 2
anim = 782
id = 782
pos = 0,0
postype = p1
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = 4
ontop = 1
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 780, ModifyExplod]
type = ModifyExplod
trigger1 = root, Var(20) > 0
id = 781
scale = (5 + root, Var(20)) / 2000.0,.5
ignorehitpause = 1

[State 780, RemoveExplod]
type = RemoveExplod
trigger1 = root, Var(20) <= 0
id = 780
ignorehitpause = 1

[State 780, RemoveExplod]
type = RemoveExplod
trigger1 = root, Var(20) <= 0
id = 781
ignorehitpause = 1

[State 780, RemoveExplod]
type = RemoveExplod
trigger1 = root, Var(20) <= 0
id = 782
ignorehitpause = 1

[State 780, DestroySelf]
type = DestroySelf
trigger1 = root, Var(20) <= 0
ignorehitpause = 1

;=========================================================================
;Floor - Shake
;=========================================================================
[statedef 915]
type=A
movetype=H
physics=N
ctrl=0
velset=0,0
sprpriority=-1

[state 915,marna]
type=removeexplod
trigger1=ishelper
[state 915,marna]
type=destroyself
trigger1=ishelper

[state 915,anim]
type=changeanim
trigger1=!time
trigger1=gethitvar(animtype)!=[3,5]
value=cond((gethitvar(groundtype)=1),5000,5010)+gethitvar(animtype)

[state 915,anim]
type=changeanim
trigger1=!time
trigger1=gethitvar(animtype)=[3,5]
value=5030

[state 915,anim]
type=changeanim
trigger1=!time
trigger1=(gethitvar(animtype)=[4,5])&&(selfanimexist(5047+gethitvar(animtype)))
value=5047+gethitvar(animtype)

[state 915,anim]
type=changeanim
trigger1=!hitshakeover
value=anim

[state 915,anim]
type=changeanim2
trigger1=hitshakeover
value=910
persistent=0

[state 915,anim]
type=changeanim
trigger1=selfanimexist(5061)
trigger1=hitshakeover
value=5061
persistent=0

[state 915,fall]
type=hitfallset
trigger1=!time
value=1

[state 915,roop]
type=screenbound
trigger1=1
value=1
movecamera=1,1

[state 915,roop]
type=playerpush
trigger1=1
value=0

[state 915,shiighrataa]
type=velset
trigger1=hitshakeover
x=gethitvar(xvel)*facing
y=gethitvar(yvel)
persistent=0

[state 915,shiighrataa]
type=veladd
triggerall=hitshakeover
trigger1=gethitvar(chainid)=621
y=gethitvar(yaccel)

[state 915,badalna]
type=changestate
trigger1=hitshakeover
trigger1=pos y>=0
trigger1=vel y>0
value=920

[state 915,phir_lana]
type=selfstate
trigger1=hitshakeover
trigger1=!gethitvar(isbound)
trigger1=time>100
value=5050

;=========================================================================
;Floor - Impact
;=========================================================================
[Statedef 920]
type=A
movetype=H
physics=N
ctrl=0
sprpriority=-1

[state 920,dharna]
type=posset
trigger1=!time
y=0

[state 920,anim]
type=changeanim2
trigger1=!time
value=920

[state 920,anim]
type=changeanim
trigger1=selfanimexist(5100)
trigger1=!time
value=5100

[state 920,avaaz]
type=playsnd
trigger1=!time
value=f8,0
volumescale=100

[state 920,hilaav]
type=envshake
trigger1=!time
time=10
ampl=-10

[state 920,jodo]
type=posadd
trigger1=!animtime
trigger2=time>=7
y=-pos y

[state 920,shiighrataa]
type=velset
trigger1=!time
y=0.0

[state 920,shiighrataa]
type=velset
triggerall=!animtime||time>=7
trigger1=gethitvar(chainid)=621
y=-14.109375

[state 905,shiighrataa]
type=velset
triggerall=!animtime
trigger1=gethitvar(chainid)=1035
x=-0.9765625
y=-8.59375

[state 920,prakash]
type=explod
trigger1=!time
anim=f62
postype=p1
pos=0,0
bindtime=1
random=0,0
velocity=0.0,0.0
accel=0,0
ownpal=1
scale=1.0,1.0
sprpriority=5
supermovetime=-1
pausemovetime=-1

[state 920,badalna]
type=changestate
trigger1=!animtime
trigger2=time>=7
value=925

[state 920,phir_lana]
type=selfstate
trigger1=!gethitvar(isbound)
trigger1=time>100
value=5050

;=========================================================================
;Floor - Fall
;=========================================================================
[Statedef 925]
type=A
movetype=H
physics=N
ctrl=0
sprpriority=-1

[state 925,anim]
type=changeanim2
trigger1=!time
value=910

[state 925,shiighrataa]
type=veladd
trigger1=1
y=gethitvar(yaccel)

[State 5200, 1] ;Recover Near Ground
type = SelfState
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = Alive
trigger1 = Command = "recovery"
value = 5200 ;HITFALL_GROUND RECOVER

[state 925,phir_lana]
type=selfstate
trigger1=pos y>=0
trigger1=vel y>0
value=5100

[state 925,phir_lana]
type=selfstate
trigger1=!gethitvar(isbound)
trigger1=time>300
value=5050

;=========================================================================
;Wall - Shake
;=========================================================================
[statedef 1050]
type=A
movetype=H
physics=N
ctrl=0
velset=0,0
sprpriority=-1

[state 900,marna]
type=removeexplod
trigger1=ishelper

[state 900,marna]
type=destroyself
trigger1=ishelper

[state 900,anim]
type=changeanim
trigger1=!time
trigger1=gethitvar(animtype)!=[3,5]
value=cond((gethitvar(groundtype)=1),5000,5010)+gethitvar(animtype)

[state 900,anim]
type=changeanim
trigger1=!time
trigger1=gethitvar(animtype)=[3,5]
value=5030

[state 900,anim]
type=changeanim
trigger1=!time
trigger1=(gethitvar(animtype)=[4,5])&&(selfanimexist(5047+gethitvar(animtype)))
value=5047+gethitvar(animtype)

[state 900,anim]
type=changeanim
trigger1=!hitshakeover
value=anim

[state 900,anim]
type=changeanim2
trigger1=hitshakeover
value=910
persistent=0

[state 900,fall]
type=hitfallset
trigger1=!time
value=1

[state 900,roop]
type=screenbound
trigger1=1
value=0
movecamera=1,1

[state 900,roop]
type=playerpush
trigger1=1
value=0

[state 900,shiighrataa]
type=velset
trigger1=hitshakeover
x=gethitvar(xvel)*facing
y=gethitvar(yvel)
persistent=0

;[state 900,shiighrataa]
;type=velset
;triggerall=hitshakeover
;trigger1=gethitvar(chainid)=4010
;x=-10.9375
;y=0.0
;persistent=0

[state 900,shiighrataa]
type=veladd
triggerall=alive
triggerall=hitshakeover
trigger1=gethitvar(chainid)=-1
y=gethitvar(yaccel)*0.9859375

[state 900,shiighrataa]
type=veladd
trigger1=!alive
trigger1=hitshakeover
y=gethitvar(yaccel)

[state 900,hilaav]
type=envshake
triggerall=hitshakeover
trigger1=cond(vel x>0,frontedgebodydist<=0,backedgebodydist<=0)
trigger2=pos y>=0
trigger2=vel y>0
time=10
ampl=10
persistent=0

[state 900,badalna]
type=changestate
trigger1=hitshakeover
trigger1=cond(vel x>0,frontedgebodydist<=0,backedgebodydist<=0)
value=1055
ctrl=0

[state 900,phir_lana]
type=selfstate
trigger1=hitshakeover
trigger1=pos y>=0
trigger1=vel y>0
value=5100

[state 900,phir_lana]
type=selfstate
trigger1=hitshakeover
trigger1=!gethitvar(isbound)
trigger1=time>100
value=5050

;=========================================================================
;Wall - Impact
;=========================================================================
[statedef 1055]
type=A
movetype=H
physics=N
ctrl=0
velset=0,0
sprpriority=-1

[state 905,anim]
type=changeanim2
trigger1=!time
value=915

[state 905,roop]
type=screenbound
trigger1=1
value=0
movecamera=1,1

[state 905,roop]
type=playerpush
trigger1=1
value=0

[state 905,roop]
type=turn
trigger1=backedgedist<frontedgedist
trigger1=!animtime

[state 905,avaaz]
type=playsnd
trigger1=!time
value=f8,0
volumescale=100

[state 905,todo]
type=posadd
trigger1=!time
x=const(size.ground.back)

[state 905,shiighrataa]
type=velset
triggerall=!animtime
trigger1=gethitvar(chainid)=1035
;trigger2=gethitvar(chainid)=1130
trigger2=gethitvar(chainid)=3005
;trigger3=gethitvar(chainid)=3055
trigger3=gethitvar(chainid)=4010
x=-2.9765625
y=-11.79375

[state 905,prakash]
type=explod
trigger1=backedgedist<frontedgedist
trigger1=!time
anim=f72
postype=back
pos=0,ceil(screenpos y+(const(size.mid.pos.y)))
facing=1
bindtime=2
random=0,0
velocity=0.0,0.0
accel=0,0
ownpal=1
scale = 0.6,0.6
sprpriority=5
supermovetime=-1
pausemovetime=-1

[state 905,prakash]
type=explod
trigger1=frontedgedist<backedgedist
trigger1=!time
anim=f72
postype=front
pos=0,ceil(screenpos y+(const(size.mid.pos.y)))
facing=-facing
bindtime=2
random=0,0
velocity=0.0,0.0
accel=0,0
ownpal=1
scale = 0.6,0.6
sprpriority=5
supermovetime=-1
pausemovetime=-1

[state 905,phir_lana]
type=changestate
trigger1=!animtime
value=1060
ctrl=0

[state 905,phir_lana]
type=selfstate
trigger1=!gethitvar(isbound)
trigger1=time>100
value=5050

;=========================================================================
;Wall - Fall
;=========================================================================
[Statedef 1060]
type=A
movetype=H
physics=N
ctrl=0
sprpriority=-1

[state 910,anim]
type=changeanim2
trigger1=!time
value=910

[state 910,roop]
type=screenbound
trigger1=1
value=1
movecamera=1,1

[state 910,shiighrataa]
type=veladd
trigger1=1
y=gethitvar(yaccel)

[state 910,hilaav]
type=envshake
trigger1=pos y>=0
trigger1=vel y>0
time=10
ampl=10

[State 5210, 2] ;Recover In Air
type = SelfState
triggerall = Vel Y > 0
triggerall = Pos y < -20
triggerall = alive
triggerall = power >= 2000
trigger1 = Command = "recovery"
value = 5210 ;HITFALL_AIR RECOVER

[state 910,phir_lana]
type=selfstate
trigger1=pos y>=0
trigger1=vel y>0
value=5100

[state 910,phir_lana]
type=selfstate
trigger1=!gethitvar(isbound)
trigger1=time>300
value=5050

;=========================================================================
;Floor - Shake
;=========================================================================
[statedef 1065]
type=A
movetype=H
physics=N
ctrl=0
velset=0,0
sprpriority=-1

[state 915,marna]
type=removeexplod
trigger1=ishelper

[state 915,marna]
type=destroyself
trigger1=ishelper

[state 915,anim]
type=changeanim
trigger1=!time
trigger1=gethitvar(animtype)!=[3,5]
value=cond((gethitvar(groundtype)=1),5000,5010)+gethitvar(animtype)

[state 915,anim]
type=changeanim
trigger1=!time
trigger1=gethitvar(animtype)=[3,5]
value=5030

[state 915,anim]
type=changeanim
trigger1=!time
trigger1=(gethitvar(animtype)=[4,5])&&(selfanimexist(5047+gethitvar(animtype)))
value=5047+gethitvar(animtype)

[state 915,anim]
type=changeanim
trigger1=!hitshakeover
value=anim

[state 915,anim]
type=changeanim2
trigger1=hitshakeover
value=910
persistent=0

[state 915,anim]
type=changeanim
trigger1=selfanimexist(5061)
trigger1=hitshakeover
value=5061
persistent=0

[state 915,fall]
type=hitfallset
trigger1=!time
value=1

[state 915,roop]
type=screenbound
trigger1=1
value=1
movecamera=1,1

[state 915,roop]
type=playerpush
trigger1=1
value=0

[state 915,shiighrataa]
type=velset
trigger1=hitshakeover
x=gethitvar(xvel)*facing
y=gethitvar(yvel)
persistent=0

[state 915,shiighrataa]
type=veladd
triggerall=hitshakeover
trigger1=gethitvar(chainid)=621
y=gethitvar(yaccel)

[state 915,badalna]
type=changestate
trigger1=hitshakeover
trigger1=pos y>=0
trigger1=vel y>0
value=1070

[state 915,phir_lana]
type=selfstate
trigger1=hitshakeover
trigger1=!gethitvar(isbound)
trigger1=time>100
value=5050

;=========================================================================
;Floor - Impact
;=========================================================================
[Statedef 1070]
type=A
movetype=H
physics=N
ctrl=0
sprpriority=-1

[state 920,dharna]
type=posset
trigger1=!time
y=0

[state 920,anim]
type=changeanim2
trigger1=!time
value=920

[state 920,anim]
type=changeanim
trigger1=selfanimexist(5100)
trigger1=!time
value=5100

[state 920,avaaz]
type=playsnd
trigger1=!time
value=f7,0
volumescale=100

[state 920,hilaav]
type=envshake
trigger1=!time
time=10
ampl=-10

[state 920,jodo]
type=posadd
trigger1=!animtime
trigger2=time>=7
y=-pos y

[state 920,shiighrataa]
type=velset
trigger1=!time
y=0.0

[state 920,shiighrataa]
type=velset
triggerall=!animtime||time>=7
trigger1=gethitvar(chainid)=621
y=-13.109375

[state 920,badalna]
type=changestate
trigger1=!animtime
trigger2=time>=7
value=1075

[state 920,phir_lana]
type=selfstate
trigger1=!gethitvar(isbound)
trigger1=time>100
value=5050

;=========================================================================
;Floor - Fall
;=========================================================================
[Statedef 1075]
type=A
movetype=H
physics=N
ctrl=0
sprpriority=-1

[state 925,anim]
type=changeanim2
trigger1=!time
value=910

[state 925,shiighrataa]
type=veladd
trigger1=1
y=gethitvar(yaccel)

[State 5200, 1] ;Recover Near Ground
type = SelfState
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = Alive
trigger1 = Command = "recovery"
value = 5200 ;HITFALL_GROUND RECOVER

[state 925,phir_lana]
type=selfstate
trigger1=pos y>=0
trigger1=vel y>0
value=5100

[state 925,phir_lana]
type=selfstate
trigger1=!gethitvar(isbound)
trigger1=time>300
value=5050

;=====================<FLASH SPARK PROJECTILE>=========================
[StateDef 1005]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1005
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1007
ignoreHitPause = 1

[state 1350,avaaz]
type=playsnd
trigger1=!time
value= 811,0
volumescale=100

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[state 1350,roop]
type=assertspecial
trigger1=1
flag=noshadow

;[State 1005, ChangeAnim]
;type = ChangeAnim
;trigger1 = Anim != 1005
;value = 1005

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(Root,var(10) = 2, 1007, ifElse(Root,var(10) = 1, 1006, 1005))

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[state 1350,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[State 1005, Miss]
type = HitDef
getpower = 15,7
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 2 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 58, ifElse(var(10), 58, 58)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 58, ifElse(var(10), 58, 58)))), ifElse(var(10) >= 2, 15, 15)
getpower = 15,7
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 20
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
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
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
envshake.time=10
envshake.ampl=4
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=32

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1006
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1007
ignoreHitPause = 1

[state 1350,bekaar]
type=statetypeset
trigger1=!animelemtime(11)
movetype=I

[state 1350,marna]
type=destroyself
trigger1=!animtime

;Hit Pause
[StateDef 1006]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

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
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[state 1355,maar]
type=targetstate
trigger1=var(10)=3
trigger1=movecontact=1
trigger1=numtarget
trigger1=!MoveGuarded
value=1050
ignorehitpause=1
persistent=0

[State 1006, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1006, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1000,1030]
var(18) = 1

[State 1006, End]
type = ChangeState
trigger1 = Time >= 0
value = 1007

;Disappear
[StateDef 1007]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1007, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,7
channel = 3
volume = -128
lowPriority = 1

[State 1007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1007, End]
type = ChangeState
trigger1 = !AnimTime
value = 1008

;Wait
[StateDef 1008]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=====================<EX FLASH SPARK PROJECTILE>=========================
[StateDef 1035]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1008
sprPriority = 3

[State 1035, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1007
ignoreHitPause = 1

[state 1350,avaaz]
type=playsnd
trigger1=!time
value= 811,0
volumescale=100

[State 1035, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1035, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1008
value = 1008

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1035, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1035, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1035, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[state 1350,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 1350,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[State 1035, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 68 < 7, 7, fvar(11) * 68)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = Hard
air.animType = back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -15, -1.5
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -15, -1.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
envshake.time=10
envshake.ampl=4
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=32
id=1035

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1006
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1007
ignoreHitPause = 1

[state 1350,bekaar]
type=statetypeset
trigger1=!animelemtime(11)
movetype=I

[state 1350,marna]
type=destroyself
trigger1=!animtime

;========================<LIGHTNING TRAP>=============================
[Statedef 1210]
type=S
movetype=I
physics=N
ctrl=0
velset=0,0
sprpriority=5

[state 1540,anim]
type=changeanim
trigger1=!time
value=1025

[state 1540,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 1550,avaaz]
type=playsnd
trigger1=!time
value= 1210,0
volumescale=100

[state 1540,roop]
type=angledraw
trigger1=animelemno(0)=[1,3]
scale=(0.25*(animelemno(0)=1))+(0.5*(animelemno(0)=2))+(1.0*(animelemno(0)=3)),(0.25*(animelemno(0)=1))+(0.5*(animelemno(0)=2))+(1.0*(animelemno(0)=3))

[state 1540,roop]
type=trans
trigger1=animelemno(0)=[1,3]
trans=addalpha
alpha=256,256

[state 1540,roop]
type=sprpriority
trigger1=!animelemtime(10)
value=-1
persistent=0

[state 1540,roop]
type=sprpriority
trigger1=!animelemtime(11)
value=5

[state 1540,murna]
type=varset
trigger1=!time
var(12)=49

[state 1540,murna]
type=varadd
trigger1=!animelemtime(10)
var(12)=-1

[state 1540,murna]
type=changeanim
trigger1=var(12)
trigger1=!animelemtime(10)
value=anim
elem=4

[state 1540,anim]
type=changeanim
trigger1=animelemtime(10)<=0
trigger1=parent,anim=1205||parent,anim=1255
trigger1=!parent,animelemtime(cond(parent,anim=1205,6,5))
trigger1=parent,var(10)=0
;trigger2=parent,stateno=1815
;trigger2=parent,anim=1815
;trigger2=!parent,animelemtime(3)
;trigger2=parent,var(12)=4
;trigger2=parent,var(33)>=4
value=anim
elem=10
persistent=0

[state 1540,ajay]
type=nothitby
trigger1=!time
value=SCA
time=-1

[state 1540,jodo]
type=posadd
trigger1=!time
trigger1=frontedgedist<0
x=frontedgedist-30

[state 1540,Lightning]
type=helper
trigger1=animelemtime(10)<=0
trigger1=parent,anim=1205||parent,anim=1255
trigger1=!parent,animelemtime(cond(parent,anim=1205,6,5))
trigger1=parent,var(10)=0
;trigger2=parent,stateno=1815
;trigger2=parent,anim=1815
;trigger2=!parent,animelemtime(3)
;trigger2=parent,var(12)=4
;trigger2=parent,var(33)>=4
helpertype=normal
name="Lightning"
ID=1205
stateno=1205
postype=p1
pos=0,0
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5
persistent=0

[state 1540,Juggle]
type=parentvaradd
trigger1=numhelper(1205)
trigger1=helper(1205),movehit=1
trigger1=helper(1205),numtarget
var(0)=1

[state 1540,Dampener]
type=parentvaradd
trigger1=numhelper(1205)
trigger1=helper(1205),movehit=1
trigger1=helper(1205),numtarget
fvar(0)=1

[state 1540,marna]
type=destroyself
trigger1=!animtime

;========================<LIGHTNING TRAP>=============================
[Statedef 1211]
type=S
movetype=I
physics=N
ctrl=0
velset=0,0
sprpriority=5

[state 1540,anim]
type=changeanim
trigger1=!time
value=1025

[state 1540,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 1540,roop]
type=angledraw
trigger1=animelemno(0)=[1,3]
scale=(0.25*(animelemno(0)=1))+(0.5*(animelemno(0)=2))+(1.0*(animelemno(0)=3)),(0.25*(animelemno(0)=1))+(0.5*(animelemno(0)=2))+(1.0*(animelemno(0)=3))

[state 1540,roop]
type=trans
trigger1=animelemno(0)=[1,3]
trans=addalpha
alpha=256,256

[state 1540,roop]
type=sprpriority
trigger1=!animelemtime(10)
value=-1
persistent=0

[state 1540,roop]
type=sprpriority
trigger1=!animelemtime(11)
value=5

[state 1540,murna]
type=varset
trigger1=!time
var(12)=49

[state 1540,murna]
type=varadd
trigger1=!animelemtime(10)
var(12)=-1

[state 1540,murna]
type=changeanim
trigger1=var(12)
trigger1=!animelemtime(10)
value=anim
elem=4

[state 1540,anim]
type=changeanim
trigger1=animelemtime(10)<=0
trigger1=parent,anim=1205||parent,anim=1255
trigger1=!parent,animelemtime(cond(parent,anim=1205,6,5))
trigger1=parent,var(10)=1
;trigger2=parent,stateno=1815
;trigger2=parent,anim=1815
;trigger2=!parent,animelemtime(3)
;trigger2=parent,var(12)=4
;trigger2=parent,var(33)>=4
value=anim
elem=10
persistent=0

[state 1540,ajay]
type=nothitby
trigger1=!time
value=SCA
time=-1

[state 1540,avaaz]
type=playsnd
trigger1=!time
value= 1210,0
volumescale=100

[state 1540,jodo]
type=posadd
trigger1=!time
trigger1=frontedgedist<0
x=frontedgedist-30

[state 1540,Lightning]
type=helper
trigger1=animelemtime(10)<=0
trigger1=parent,anim=1205||parent,anim=1255
trigger1=!parent,animelemtime(cond(parent,anim=1205,6,5))
trigger1=parent,var(10)=1
;trigger2=parent,stateno=1815
;trigger2=parent,anim=1815
;trigger2=!parent,animelemtime(3)
;trigger2=parent,var(12)=4
;trigger2=parent,var(33)>=4
helpertype=normal
name="Lightning"
ID=1205
stateno=1205
postype=p1
pos=0,0
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5
persistent=0

[state 1540,Juggle]
type=parentvaradd
trigger1=numhelper(1205)
trigger1=helper(1205),movehit=1
trigger1=helper(1205),numtarget
var(0)=1

[state 1540,Dampener]
type=parentvaradd
trigger1=numhelper(1205)
trigger1=helper(1205),movehit=1
trigger1=helper(1205),numtarget
fvar(0)=1

[state 1540,marna]
type=destroyself
trigger1=!animtime

;========================<LIGHTNING TRAP>=============================
[Statedef 1212]
type=S
movetype=I
physics=N
ctrl=0
velset=0,0
sprpriority=5

[state 1540,anim]
type=changeanim
trigger1=!time
value=1025

[state 1540,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 1540,roop]
type=angledraw
trigger1=animelemno(0)=[1,3]
scale=(0.25*(animelemno(0)=1))+(0.5*(animelemno(0)=2))+(1.0*(animelemno(0)=3)),(0.25*(animelemno(0)=1))+(0.5*(animelemno(0)=2))+(1.0*(animelemno(0)=3))

[state 1540,roop]
type=trans
trigger1=animelemno(0)=[1,3]
trans=addalpha
alpha=256,256

[state 1540,roop]
type=sprpriority
trigger1=!animelemtime(10)
value=-1
persistent=0

[state 1540,roop]
type=sprpriority
trigger1=!animelemtime(11)
value=5

[state 1540,murna]
type=varset
trigger1=!time
var(12)=49

[state 1540,murna]
type=varadd
trigger1=!animelemtime(10)
var(12)=-1

[state 1540,murna]
type=changeanim
trigger1=var(12)
trigger1=!animelemtime(10)
value=anim
elem=4

[state 1540,anim]
type=changeanim
trigger1=animelemtime(10)<=0
trigger1=parent,anim=1205||parent,anim=1255
trigger1=!parent,animelemtime(cond(parent,anim=1205,6,5))
trigger1=parent,var(10)=2
;trigger2=parent,stateno=1815
;trigger2=parent,anim=1815
;trigger2=!parent,animelemtime(3)
;trigger2=parent,var(12)=4
;trigger2=parent,var(33)>=4
value=anim
elem=10
persistent=0

[state 1540,ajay]
type=nothitby
trigger1=!time
value=SCA
time=-1

[state 1540,avaaz]
type=playsnd
trigger1=!time
value= 1210,0
volumescale=100

[state 1540,jodo]
type=posadd
trigger1=!time
trigger1=frontedgedist<0
x=frontedgedist-30

[state 1540,Lightning]
type=helper
trigger1=animelemtime(10)<=0
trigger1=parent,anim=1205||parent,anim=1255
trigger1=!parent,animelemtime(cond(parent,anim=1205,6,5))
trigger1=parent,var(10)=2
;trigger2=parent,stateno=1815
;trigger2=parent,anim=1815
;trigger2=!parent,animelemtime(3)
;trigger2=parent,var(12)=4
;trigger2=parent,var(33)>=4
helpertype=normal
name="Lightning"
ID=1205
stateno=1205
postype=p1
pos=0,0
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5
persistent=0

[state 1540,Juggle]
type=parentvaradd
trigger1=numhelper(1205)
trigger1=helper(1205),movehit=1
trigger1=helper(1205),numtarget
var(0)=1

[state 1540,Dampener]
type=parentvaradd
trigger1=numhelper(1205)
trigger1=helper(1205),movehit=1
trigger1=helper(1205),numtarget
fvar(0)=1

[state 1540,marna]
type=destroyself
trigger1=!animtime

;=====================<LIGHTNING TRAP PROJECTILE>=========================
[StateDef 1205]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1030
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1207
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[state 1350,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 1550,avaaz]
type=playsnd
trigger1=!time
value= 3600,5
volumescale=100

;[State 1005, ChangeAnim]
;type = ChangeAnim
;trigger1 = Anim != 1005
;value = 1005

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1030

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[state 1350,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[State 1005, Miss]
type = HitDef
getpower = 15,7
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 2 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 58 < 7, 7, fvar(11) * 58)), 15
getpower = 15,7
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = Hard
air.animType = back
fall.animType = back
ground.type = low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = 0, -13.109375
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = 0, -13.109375
air.cornerPush.velOff = 0
airGuard.velocity = -5, -1.5
airGuard.cornerPush.velOff = 0
yaccel = Ifelse(var(20),.4,.6)
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
envshake.time=10
envshake.ampl=4
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=48

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1206
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1207
ignoreHitPause = 1

[state 1350,bekaar]
type=statetypeset
trigger1=!animelemtime(11)
movetype=I

[state 1350,marna]
type=destroyself
trigger1=!animtime

;Hit Pause
[StateDef 1206]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), floor(p2bodydist y)+(enemy,Const(size.mid.pos.y))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

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
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[State 1006, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1006, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1200,1230]
var(18) = 1

[State 1006, End]
type = ChangeState
trigger1 = Time >= 0
value = 1207

;Disappear
[StateDef 1207]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1007, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,7
channel = 3
volume = -128
lowPriority = 1

[State 1007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1007, End]
type = ChangeState
trigger1 = !AnimTime
value = 1208

;Wait
[StateDef 1208]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;========================<EX LIGHTNING TRAP>=============================
[Statedef 1260]
type=S
movetype=I
physics=N
ctrl=0
velset=0,0
sprpriority=5

[state 1540,anim]
type=changeanim
trigger1=!time
value=1025

[state 1540,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 1540,roop]
type=angledraw
trigger1=animelemno(0)=[1,3]
scale=(0.25*(animelemno(0)=1))+(0.5*(animelemno(0)=2))+(1.0*(animelemno(0)=3)),(0.25*(animelemno(0)=1))+(0.5*(animelemno(0)=2))+(1.0*(animelemno(0)=3))

[state 1540,roop]
type=trans
trigger1=animelemno(0)=[1,3]
trans=addalpha
alpha=256,256

[state 1540,roop]
type=sprpriority
trigger1=!animelemtime(10)
value=-1
persistent=0

[state 1540,roop]
type=sprpriority
trigger1=!animelemtime(11)
value=5

[state 1540,murna]
type=varset
trigger1=!time
var(12)=49

[state 1540,murna]
type=varadd
trigger1=!animelemtime(10)
var(12)=-1

[state 1540,murna]
type=changeanim
trigger1=var(12)
trigger1=!animelemtime(10)
value=anim
elem=4

[state 1540,anim]
type=changeanim
trigger1=animelemtime(10)<=0
trigger1=parent,anim=1205||parent,anim=1255
trigger1=!parent,animelemtime(cond(parent,anim=1205,6,5))
trigger1=parent,var(10)=3
;trigger2=parent,stateno=1815
;trigger2=parent,anim=1815
;trigger2=!parent,animelemtime(3)
;trigger2=parent,var(12)=4
;trigger2=parent,var(33)>=4
value=anim
elem=10
persistent=0

[state 1540,ajay]
type=nothitby
trigger1=!time
value=SCA
time=-1

[state 1540,avaaz]
type=playsnd
trigger1=!time
value= 1210,0
volumescale=100

[state 1540,jodo]
type=posadd
trigger1=!time
trigger1=frontedgedist<0
x=frontedgedist-30

[state 1540,Lightning]
type=helper
trigger1=animelemtime(10)<=0
trigger1=parent,anim=1205||parent,anim=1255
trigger1=!parent,animelemtime(cond(parent,anim=1205,6,5))
trigger1=parent,var(10)=3
;trigger2=parent,stateno=1815
;trigger2=parent,anim=1815
;trigger2=!parent,animelemtime(3)
;trigger2=parent,var(12)=4
;trigger2=parent,var(33)>=4
helpertype=normal
name="Lightning"
ID=1235
stateno=1235
postype=p1
pos=0,0
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5
persistent=0

[state 1540,Juggle]
type=parentvaradd
trigger1=numhelper(1235)
trigger1=helper(1235),movehit=1
trigger1=helper(1235),numtarget
var(0)=1

[state 1540,Dampener]
type=parentvaradd
trigger1=numhelper(1235)
trigger1=helper(1235),movehit=1
trigger1=helper(1235),numtarget
fvar(0)=1

[state 1540,marna]
type=destroyself
trigger1=!animtime

;=====================<EX LIGHTNING TRAP PROJECTILE>=========================
[StateDef 1235]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1030
sprPriority = 3

[State 1035, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1207
ignoreHitPause = 1

[State 1035, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[state 1550,avaaz]
type=playsnd
trigger1=!time
value= 3600,5
volumescale=100

[State 1035, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1030
value = 1030

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1035, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1035, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1035, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[state 1350,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 1350,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[State 1035, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 58 < 7, 7, fvar(11) * 58)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = 0, -13.109375
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = 0, -13.109375
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
envshake.time=10
envshake.ampl=4
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=48

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1206
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1207
ignoreHitPause = 1

[state 1350,bekaar]
type=statetypeset
trigger1=!animelemtime(11)
movetype=I

[state 1350,marna]
type=destroyself
trigger1=!animtime

;========================<LIGHTNING TRAP AIR>=============================
[Statedef 1280]
type=A
movetype=I
physics=N
ctrl=0
velset=0,0
sprpriority=5

[state 1540,anim]
type=changeanim
trigger1=!time
value=1025

[state 1540,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 1540,roop]
type=angledraw
trigger1=animelemno(0)=[1,3]
scale=(0.25*(animelemno(0)=1))+(0.5*(animelemno(0)=2))+(1.0*(animelemno(0)=3)),(0.25*(animelemno(0)=1))+(0.5*(animelemno(0)=2))+(1.0*(animelemno(0)=3))

[state 1640,roop]
type=angledraw
trigger1=1
value=-90

[state 1540,roop]
type=sprpriority
trigger1=!animelemtime(10)
value=-1
persistent=0

[state 1540,roop]
type=sprpriority
trigger1=!animelemtime(11)
value=5

[state 1540,roop]
type=trans
trigger1=1
trans=addalpha
alpha=256,256
ignoreHitPause = 1

[State -1]
Type = Turn
Trigger1 = Time > 15
Trigger1 = P2Dist X < 0

[state 1540,murna]
type=varset
trigger1=!time
var(12)=49

[state 1540,murna]
type=varadd
trigger1=!animelemtime(10)
var(12)=-1

[state 1540,murna]
type=changeanim
trigger1=var(12)
trigger1=!animelemtime(10)
value=anim
elem=4

[state 1540,anim]
type=changeanim
trigger1=animelemtime(10)<=0
trigger1=parent,anim=1205||parent,anim=1255
trigger1=!parent,animelemtime(cond(parent,anim=1205,6,5))
trigger1=parent,var(10)=0
;trigger2=parent,stateno=1815
;trigger2=parent,anim=1815
;trigger2=!parent,animelemtime(3)
;trigger2=parent,var(12)=4
;trigger2=parent,var(33)>=4
value=anim
elem=10
persistent=0

[state 1540,ajay]
type=nothitby
trigger1=!time
value=SCA
time=-1

[state 1540,avaaz]
type=playsnd
trigger1=!time
value= 1210,0
volumescale=100

[state 1540,jodo]
type=posadd
trigger1=!time
trigger1=frontedgedist<0
x=frontedgedist-30

[state 1540,Lightning]
type=helper
trigger1=animelemtime(10)<=0
trigger1=parent,anim=1205||parent,anim=1255
trigger1=!parent,animelemtime(cond(parent,anim=1205,6,5))
trigger1=parent,var(10)=0
;trigger2=parent,stateno=1815
;trigger2=parent,anim=1815
;trigger2=!parent,animelemtime(3)
;trigger2=parent,var(12)=4
;trigger2=parent,var(33)>=4
helpertype=normal
name="Lightning"
ID=1205
stateno=1255
postype=p1
pos=0,0
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5
persistent=0

[state 1540,Juggle]
type=parentvaradd
trigger1=numhelper(1205)
trigger1=helper(1205),movehit=1
trigger1=helper(1205),numtarget
var(0)=1

[state 1540,Dampener]
type=parentvaradd
trigger1=numhelper(1205)
trigger1=helper(1205),movehit=1
trigger1=helper(1205),numtarget
fvar(0)=1

[state 1540,marna]
type=destroyself
trigger1=!animtime

;========================<LIGHTNING TRAP AIR>=============================
[Statedef 1281]
type=A
movetype=I
physics=N
ctrl=0
velset=0,0
sprpriority=5

[state 1540,anim]
type=changeanim
trigger1=!time
value=1025

[state 1540,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 1540,roop]
type=angledraw
trigger1=animelemno(0)=[1,3]
scale=(0.25*(animelemno(0)=1))+(0.5*(animelemno(0)=2))+(1.0*(animelemno(0)=3)),(0.25*(animelemno(0)=1))+(0.5*(animelemno(0)=2))+(1.0*(animelemno(0)=3))

[state 1640,roop]
type=angledraw
trigger1=1
value=-90

[state 1540,roop]
type=sprpriority
trigger1=!animelemtime(10)
value=-1
persistent=0

[state 1540,roop]
type=sprpriority
trigger1=!animelemtime(11)
value=5

[state 1540,roop]
type=trans
trigger1=1
trans=addalpha
alpha=256,256

[State -1]
Type = Turn
Trigger1 = Time > 15
Trigger1 = P2Dist X < 0

[state 1540,murna]
type=varset
trigger1=!time
var(12)=49

[state 1540,murna]
type=varadd
trigger1=!animelemtime(10)
var(12)=-1

[state 1540,murna]
type=changeanim
trigger1=var(12)
trigger1=!animelemtime(10)
value=anim
elem=4

[state 1540,anim]
type=changeanim
trigger1=animelemtime(10)<=0
trigger1=parent,anim=1205||parent,anim=1255
trigger1=!parent,animelemtime(cond(parent,anim=1205,6,5))
trigger1=parent,var(10)=1
;trigger2=parent,stateno=1815
;trigger2=parent,anim=1815
;trigger2=!parent,animelemtime(3)
;trigger2=parent,var(12)=4
;trigger2=parent,var(33)>=4
value=anim
elem=10
persistent=0

[state 1540,ajay]
type=nothitby
trigger1=!time
value=SCA
time=-1

[state 1540,avaaz]
type=playsnd
trigger1=!time
value= 1210,0
volumescale=100

[state 1540,jodo]
type=posadd
trigger1=!time
trigger1=frontedgedist<0
x=frontedgedist-30

[state 1540,Lightning]
type=helper
trigger1=animelemtime(10)<=0
trigger1=parent,anim=1205||parent,anim=1255
trigger1=!parent,animelemtime(cond(parent,anim=1205,6,5))
trigger1=parent,var(10)=1
;trigger2=parent,stateno=1815
;trigger2=parent,anim=1815
;trigger2=!parent,animelemtime(3)
;trigger2=parent,var(12)=4
;trigger2=parent,var(33)>=4
helpertype=normal
name="Lightning"
ID=1205
stateno=1255
postype=p1
pos=0,0
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5
persistent=0

[state 1540,Juggle]
type=parentvaradd
trigger1=numhelper(1205)
trigger1=helper(1205),movehit=1
trigger1=helper(1205),numtarget
var(0)=1

[state 1540,Dampener]
type=parentvaradd
trigger1=numhelper(1205)
trigger1=helper(1205),movehit=1
trigger1=helper(1205),numtarget
fvar(0)=1

[state 1540,marna]
type=destroyself
trigger1=!animtime

;========================<LIGHTNING TRAP AIR>=============================
[Statedef 1282]
type=A
movetype=I
physics=N
ctrl=0
velset=0,0
sprpriority=5

[state 1540,anim]
type=changeanim
trigger1=!time
value=1025

[state 1540,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 1540,roop]
type=angledraw
trigger1=animelemno(0)=[1,3]
scale=(0.25*(animelemno(0)=1))+(0.5*(animelemno(0)=2))+(1.0*(animelemno(0)=3)),(0.25*(animelemno(0)=1))+(0.5*(animelemno(0)=2))+(1.0*(animelemno(0)=3))

[state 1640,roop]
type=angledraw
trigger1=1
value=-90

[state 1540,roop]
type=sprpriority
trigger1=!animelemtime(10)
value=-1
persistent=0

[state 1540,roop]
type=sprpriority
trigger1=!animelemtime(11)
value=5

[state 1540,roop]
type=trans
trigger1=1
trans=addalpha
alpha=256,256

[State -1]
Type = Turn
Trigger1 = Time > 15
Trigger1 = P2Dist X < 0

[state 1540,murna]
type=varset
trigger1=!time
var(12)=49

[state 1540,murna]
type=varadd
trigger1=!animelemtime(10)
var(12)=-1

[state 1540,murna]
type=changeanim
trigger1=var(12)
trigger1=!animelemtime(10)
value=anim
elem=4

[state 1540,anim]
type=changeanim
trigger1=animelemtime(10)<=0
trigger1=parent,anim=1205||parent,anim=1255
trigger1=!parent,animelemtime(cond(parent,anim=1205,6,5))
trigger1=parent,var(10)=2
;trigger2=parent,stateno=1815
;trigger2=parent,anim=1815
;trigger2=!parent,animelemtime(3)
;trigger2=parent,var(12)=4
;trigger2=parent,var(33)>=4
value=anim
elem=10
persistent=0

[state 1540,ajay]
type=nothitby
trigger1=!time
value=SCA
time=-1

[state 1540,avaaz]
type=playsnd
trigger1=!time
value= 1210,0
volumescale=100

[state 1540,jodo]
type=posadd
trigger1=!time
trigger1=frontedgedist<0
x=frontedgedist-30

[state 1540,Lightning]
type=helper
trigger1=animelemtime(10)<=0
trigger1=parent,anim=1205||parent,anim=1255
trigger1=!parent,animelemtime(cond(parent,anim=1205,6,5))
trigger1=parent,var(10)=2
;trigger2=parent,stateno=1815
;trigger2=parent,anim=1815
;trigger2=!parent,animelemtime(3)
;trigger2=parent,var(12)=4
;trigger2=parent,var(33)>=4
helpertype=normal
name="Lightning"
ID=1205
stateno=1255
postype=p1
pos=0,0
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5
persistent=0

[state 1540,Juggle]
type=parentvaradd
trigger1=numhelper(1205)
trigger1=helper(1205),movehit=1
trigger1=helper(1205),numtarget
var(0)=1

[state 1540,Dampener]
type=parentvaradd
trigger1=numhelper(1205)
trigger1=helper(1205),movehit=1
trigger1=helper(1205),numtarget
fvar(0)=1

[state 1540,marna]
type=destroyself
trigger1=!animtime

;=====================<LIGHTNING TRAP AIR PROJECTILE>=========================
[StateDef 1255]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1031
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1257
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[state 1350,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 1650,roop]
type=angledraw
trigger1=1
value=-90

[state 1550,avaaz]
type=playsnd
trigger1=!time
value= 3600,5
volumescale=100

;[State 1005, ChangeAnim]
;type = ChangeAnim
;trigger1 = Anim != 1005
;value = 1005

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1031

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[state 1350,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[State 1005, Miss]
type = HitDef
getpower = 15,7
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 2 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = A,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 58 < 7, 7, fvar(11) * 58)), 15
getpower = 15,7
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = Hard
air.animType = back
fall.animType = back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = 0, -13.109375
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = 0, -13.109375
air.cornerPush.velOff = 0
airGuard.velocity = -5, -1.5
airGuard.cornerPush.velOff = 0
yaccel = Ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
envshake.time=10
envshake.ampl=4
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=48

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1256
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1257
ignoreHitPause = 1

[state 1350,bekaar]
type=statetypeset
trigger1=!animelemtime(11)
movetype=I

[state 1350,marna]
type=destroyself
trigger1=!animtime

;Hit Pause
[StateDef 1256]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), floor(p2bodydist y)+(enemy,Const(size.mid.pos.y))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[state 1655,roop]
type=angledraw
trigger1=1
value=-90

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
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[State 1006, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1006, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1250,1280]
var(18) = 1

[State 1006, End]
type = ChangeState
trigger1 = Time >= 0
value = 1257

;Disappear
[StateDef 1257]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[state 1655,roop]
type=angledraw
trigger1=1
value=-90

[State 1007, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,7
channel = 3
volume = -128
lowPriority = 1

[State 1007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1007, End]
type = ChangeState
trigger1 = !AnimTime
value = 1258

;Wait
[StateDef 1258]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[state 1655,roop]
type=angledraw
trigger1=1
value=-90

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;========================<EX LIGHTNING TRAP AIR>=============================
[Statedef 1290]
type=A
movetype=I
physics=N
ctrl=0
velset=0,0
sprpriority=5

[state 1540,anim]
type=changeanim
trigger1=!time
value=1025

[state 1540,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 1540,roop]
type=angledraw
trigger1=animelemno(0)=[1,3]
scale=(0.25*(animelemno(0)=1))+(0.5*(animelemno(0)=2))+(1.0*(animelemno(0)=3)),(0.25*(animelemno(0)=1))+(0.5*(animelemno(0)=2))+(1.0*(animelemno(0)=3))

[state 1640,roop]
type=angledraw
trigger1=1
value=-90

[state 1540,roop]
type=trans
trigger1=animelemno(0)=[1,3]
trans=addalpha
alpha=256,256

[state 1540,roop]
type=sprpriority
trigger1=!animelemtime(10)
value=-1
persistent=0

[state 1540,roop]
type=sprpriority
trigger1=!animelemtime(11)
value=5

[state 1540,murna]
type=varset
trigger1=!time
var(12)=49

[state 1540,murna]
type=varadd
trigger1=!animelemtime(10)
var(12)=-1

[state 1540,murna]
type=changeanim
trigger1=var(12)
trigger1=!animelemtime(10)
value=anim
elem=4

[state 1540,anim]
type=changeanim
trigger1=animelemtime(10)<=0
trigger1=parent,anim=1205||parent,anim=1255
trigger1=!parent,animelemtime(cond(parent,anim=1205,6,5))
trigger1=parent,var(10)=3
;trigger2=parent,stateno=1815
;trigger2=parent,anim=1815
;trigger2=!parent,animelemtime(3)
;trigger2=parent,var(12)=4
;trigger2=parent,var(33)>=4
value=anim
elem=10
persistent=0

[state 1540,ajay]
type=nothitby
trigger1=!time
value=SCA
time=-1

[state 1540,avaaz]
type=playsnd
trigger1=!time
value= 1210,0
volumescale=100

[state 1540,jodo]
type=posadd
trigger1=!time
trigger1=frontedgedist<0
x=frontedgedist-30

[state 1540,Lightning]
type=helper
trigger1=animelemtime(10)<=0
trigger1=parent,anim=1205||parent,anim=1255
trigger1=!parent,animelemtime(cond(parent,anim=1205,6,5))
trigger1=parent,var(10)=3
;trigger2=parent,stateno=1815
;trigger2=parent,anim=1815
;trigger2=!parent,animelemtime(3)
;trigger2=parent,var(12)=4
;trigger2=parent,var(33)>=4
helpertype=normal
name="Lightning"
ID=1205
stateno=1275
postype=p1
pos=0,0
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5
persistent=0

[state 1540,Juggle]
type=parentvaradd
trigger1=numhelper(1205)
trigger1=helper(1205),movehit=1
trigger1=helper(1205),numtarget
var(0)=1

[state 1540,Dampener]
type=parentvaradd
trigger1=numhelper(1205)
trigger1=helper(1205),movehit=1
trigger1=helper(1205),numtarget
fvar(0)=1

[state 1540,marna]
type=destroyself
trigger1=!animtime

;=====================<EX LIGHTNING TRAP AIR PROJECTILE>=========================
[StateDef 1275]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1031
sprPriority = 3

[State 1035, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1257
ignoreHitPause = 1

[State 1035, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1035, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1031
value = 1031

[state 1550,avaaz]
type=playsnd
trigger1=!time
value= 3600,5
volumescale=100

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1035, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1035, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1035, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[state 1350,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 1350,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[state 1656,roop]
type=angledraw
trigger1=1
value=-90

[State 1035, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = A,SP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 68 < 7, 7, fvar(11) * 68)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = 0, -13.109375
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = 0, -13.109375
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
envshake.time=10
envshake.ampl=4
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=48

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1256
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1257
ignoreHitPause = 1

[state 1350,bekaar]
type=statetypeset
trigger1=!animelemtime(11)
movetype=I

[state 1350,marna]
type=destroyself
trigger1=!animtime

;=====================<SEAL>=========================
[Statedef 1410]
type=S
movetype=I
physics=N
ctrl=0
velset=0,0
sprpriority=0

[state 1840,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 1840,anim]
type=changeanim
trigger1=!time
value=1045

[state 1840,murna-Hold]
type=varset
trigger1=var(10)=0
trigger1=!time
var(12)=1

[state 1840,murna-Hold]
type=varset
trigger1=var(10)=0
trigger1=!time
var(11)=0

[state 1840,murna-Hold]
type=varadd
trigger1=var(10)=0
trigger1=!animelemtime(17)
trigger1=parent,command="holda"
trigger1=parent,stateno=1400
trigger1=var(11)<999999999
trigger1=var(11):=var(11)+1
var(12)=1

[state 1840,murna-Hold]
type=varadd
trigger1=var(10)=0
trigger1=!animelemtime(17)
var(12)=-1

[state 1840,murna-Hold]
type=changeanim
trigger1=var(10)=0
trigger1=var(12)
trigger1=!animelemtime(17)
value=anim
elem=6

[state 1840,murna]
type=varset
trigger1=var(10)=1
trigger1=!time
var(12)=2

[state 1840,murna]
type=varadd
trigger1=var(10)=1
trigger1=!animelemtime(17)
var(12)=-1

[state 1840,murna]
type=changeanim
trigger1=var(10)=1
trigger1=var(12)
trigger1=!animelemtime(17)
value=anim
elem=6

[state 1840,ajay]
type=nothitby
trigger1=!time
value=SCA
time=-1

[state 1840,avaaz]
type=playsnd
trigger1=!time
value= 1210,0
volumescale=100

[state 1840,marna]
type=destroyself
trigger1=!animtime

;=====================<LIGHTNING ROD PROJECTILE>=========================
[StateDef 1405]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1050
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1407
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[state 1550,avaaz]
type=playsnd
trigger1=!time
value= 3600,5
volumescale=100

[state 1350,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 1850,power]
type=varset
trigger1=!time
var(43)=parent,var(43)

;[State 1005, ChangeAnim]
;type = ChangeAnim
;trigger1 = Anim != 1005
;value = 1005

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1050

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[state 1850,hilaav]
type=envshake
trigger1=!time
time=12
ampl=6+var(43)

[state 1850,prakash]
type=explod
trigger1=!time
id=1055
anim=1055
postype=p1
pos=0,0
bindtime=-1
removetime=-2
random=0,0
velocity=0,0
accel=0,0
ownpal=1
scale=0.5,0.5
sprpriority=5
supermovetime=-1
pausemovetime=-1

[state 1350,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[State 1005, Miss]
type = HitDef
getpower = 15,7
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 2 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(cond((20+(20*var(43)))*fvar(11)<7,7,(20+(20*var(43)))*fvar(11))),15
getpower = 15,7
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = Hard
air.animType = back
fall.animType = back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = 0, -13.109375
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = 0, -13.109375
air.cornerPush.velOff = 0
airGuard.velocity = -5, -1.5
airGuard.cornerPush.velOff = 0
yaccel = Ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=48

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1406
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1407
ignoreHitPause = 1

[state 1350,bekaar]
type=statetypeset
trigger1=!animelemtime(11)
movetype=I

[state 1350,marna]
type=destroyself
trigger1=!animtime

;Hit Pause
[StateDef 1406]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), floor(p2bodydist y)+(enemy,Const(size.mid.pos.y))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

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
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[State 1006, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1006, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1400,1430]
var(18) = 1

[State 1006, End]
type = ChangeState
trigger1 = Time >= 0
value = 1407

;Disappear
[StateDef 1407]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1007, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,7
channel = 3
volume = -128
lowPriority = 1

[State 1007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1007, End]
type = ChangeState
trigger1 = !AnimTime
value = 1408

;Wait
[StateDef 1408]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=====================<EX LIGHTNING ROD PROJECTILE>=========================
[StateDef 1435]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1050
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1407
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[state 1550,avaaz]
type=playsnd
trigger1=!time
value= 3600,5
volumescale=100

[state 1350,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 1850,power]
type=varset
trigger1=!time
var(43)=parent,var(43)

;[State 1005, ChangeAnim]
;type = ChangeAnim
;trigger1 = Anim != 1005
;value = 1005

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1050

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[state 1850,hilaav]
type=envshake
trigger1=!time
time=12
ampl=6+var(43)

[state 1850,prakash]
type=explod
trigger1=!time
id=1055
anim=1055
postype=p1
pos=0,0
bindtime=-1
removetime=-2
random=0,0
velocity=0,0
accel=0,0
ownpal=1
scale=0.5,0.5
sprpriority=5
supermovetime=-1
pausemovetime=-1

[state 1350,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[State 1005, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 68 < 7, 7, fvar(11) * 68)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = 0, -13.109375
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = 0, -13.109375
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=48

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1406
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1407
ignoreHitPause = 1

[state 1350,bekaar]
type=statetypeset
trigger1=!animelemtime(11)
movetype=I

[state 1350,marna]
type=destroyself
trigger1=!animtime

;========================<BLINK SHOCK>=============================
[Statedef 1505]
type=A
movetype=I
physics=N
ctrl=0
sprpriority=5

[state 1950,Root-Level]
type=null
trigger1=!time
trigger1=var(10):=root,var(10)
ignorehitpause=1

[state 1950,anim]
type=changeanim
trigger1=!time
value=1060

[state 1950,bind]
type=bindtoparent
trigger1=0
pos=0,0

[state 1950,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 1950,roop]
type=trans
trigger1=var(10)
trigger1=animelemtime(7)>0
trans=addalpha
alpha=256-(26*(time-12)),256

[state 1950,marna]
type=destroyself
trigger1=!animtime
trigger2=var(10)=0
trigger2=!animelemtime(7)
trigger3=parent,stateno!=1500
trigger3=parent,movetype=H

;=====================<LIGHTNING TRAP PROJECTILE>=========================
[Statedef 1710]
type=A
movetype=I
physics=N
ctrl=0
sprpriority=5

[state 2165,bind]
type=bindtoparent
trigger1=1
pos=-170,-120

[state 2165,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 2165,roop]
type=angledraw
trigger1=1
value=-120

[state 2165,roop]
type=trans
trigger1=1
trans=addalpha
alpha=256,256

[state 2165,anim]
type=changeanim
trigger1=!time
value=1025

[state 2165,marna]
type=destroyself
trigger1=!animtime

;=====================<SURPRISE ROAR PROJECTILE>=========================
[StateDef 1705]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1032
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1707
ignoreHitPause = 1

[state 1550,avaaz]
type=playsnd
trigger1=!time
value= 3600,5
volumescale=100

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[state 1350,roop]
type=assertspecial
trigger1=1
flag=noshadow

;[State 1005, ChangeAnim]
;type = ChangeAnim
;trigger1 = Anim != 1005
;value = 1005

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1032

[state 2150,roop]
type=angledraw
trigger1=1
value=55

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[state 1350,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[state 2150,hilaav]
type=envshake
trigger1=!time
time=12
ampl=6

[state 2150,prakash]
type=explod
trigger1=!time
id=1055
anim=1055
postype=p1
pos=0,0
bindtime=-1
removetime=-2
random=0,0
velocity=0,0
accel=0,0
ownpal=1
scale=0.5,0.5
sprpriority=5
supermovetime=-1
pausemovetime=-1

[state 2150,Energy]
type=helper
trigger1=!time
helpertype=normal
name="Energy"
ID=1710
stateno=1710
postype=p1
pos=0,0
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5

[State 1005, Miss]
type = HitDef
getpower = 15,7
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 2 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 58 < 7, 7, fvar(11) * 58)), 15
getpower = 15,7
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = Hard
air.animType = back
fall.animType = back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = ifelse(var(20), -2.36, -4), -8
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -7.5
air.cornerPush.velOff = 0
yaccel = Ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
givepower=50,50
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=48

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1706
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1707
ignoreHitPause = 1

[state 1350,bekaar]
type=statetypeset
trigger1=!animelemtime(11)
movetype=I

[state 1350,marna]
type=destroyself
trigger1=!animtime

;Hit Pause
[StateDef 1706]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), floor(p2bodydist y)+(enemy,Const(size.mid.pos.y))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

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
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[state 2155,roop]
type=angledraw
trigger1=1
value=55
ignorehitpause=1

[State 1006, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1006, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1700,1730]
var(18) = 1

[State 1006, End]
type = ChangeState
trigger1 = Time >= 0
value = 1707

;Disappear
[StateDef 1707]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[state 2155,roop]
type=angledraw
trigger1=1
value=55
ignorehitpause=1

[State 1007, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,7
channel = 3
volume = -128
lowPriority = 1

[State 1007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1007, End]
type = ChangeState
trigger1 = !AnimTime
value = 1708

;Wait
[StateDef 1708]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[state 2155,roop]
type=angledraw
trigger1=1
value=55
ignorehitpause=1

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=====================<EX SURPRISE ROAR PROJECTILE>=========================
[StateDef 1735]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1032
sprPriority = 3

[State 1035, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1707
ignoreHitPause = 1

[State 1035, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1035, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1032
value = 1032

[state 2150,roop]
type=angledraw
trigger1=1
value=55

[state 1550,avaaz]
type=playsnd
trigger1=!time
value= 3600,5
volumescale=100

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1035, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1035, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1035, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[state 1350,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 1350,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[state 2150,hilaav]
type=envshake
trigger1=!time
time=12
ampl=6

[state 2150,prakash]
type=explod
trigger1=!time
id=1055
anim=1055
postype=p1
pos=0,0
bindtime=-1
removetime=-2
random=0,0
velocity=0,0
accel=0,0
ownpal=1
scale=0.5,0.5
sprpriority=5
supermovetime=-1
pausemovetime=-1

[state 2150,Energy]
type=helper
trigger1=!time
helpertype=normal
name="Energy"
ID=1710
stateno=1710
postype=p1
pos=0,0
facing=1
ownpal=1
keyctrl=0
size.xscale=0.5
size.yscale=0.5

[State 1035, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 68 < 7, 7, fvar(11) * 68)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = -0, -13.109375
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -0, -13.109375
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=48

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1706
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1707
ignoreHitPause = 1

[state 1350,bekaar]
type=statetypeset
trigger1=!animelemtime(11)
movetype=I

[state 1350,marna]
type=destroyself
trigger1=!animtime

;=====================<RAY PROJECTILE>=========================
[StateDef 1805]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1050
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1807
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[state 1550,avaaz]
type=playsnd
trigger1=!time
value= 3600,5
volumescale=100

[state 1350,roop]
type=assertspecial
trigger1=1
flag=noshadow

;[State 1005, ChangeAnim]
;type = ChangeAnim
;trigger1 = Anim != 1005
;value = 1005

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1050

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[state 1850,prakash]
type=explod
trigger1=!time
id=1055
anim=1055
postype=p1
pos=0,0
bindtime=-1
removetime=-2
random=0,0
velocity=0,0
accel=0,0
ownpal=1
scale=0.5,0.5
sprpriority=5
supermovetime=-1
pausemovetime=-1

[state 1350,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[State 1005, Miss]
type = HitDef
getpower = 15,7
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 2 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 58 < 7, 7, fvar(11) * 58)), 15
getpower = 15,7
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = Hard
air.animType = back
fall.animType = back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
airguard.ctrlTime = 16
ground.velocity = -0, -14.109375
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = -0, -14.109375
air.cornerPush.velOff = 0
yaccel = Ifelse(var(20),.4,.6)
airguard.velocity = -5, -1.5
airguard.cornerPush.velOff = 0
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=48

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1806
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1807
ignoreHitPause = 1

[state 1350,bekaar]
type=statetypeset
trigger1=!animelemtime(11)
movetype=I

[state 1350,marna]
type=destroyself
trigger1=!animtime

;Hit Pause
[StateDef 1806]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), floor(p2bodydist y)+(enemy,Const(size.mid.pos.y))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

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
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[State 1006, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1006, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1800,1830]
var(18) = 1

[State 1006, End]
type = ChangeState
trigger1 = Time >= 0
value = 1807

;Disappear
[StateDef 1807]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1007, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,7
channel = 3
volume = -128
lowPriority = 1

[State 1007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1007, End]
type = ChangeState
trigger1 = !AnimTime
value = 1808

;Wait
[StateDef 1808]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=====================<EX RAY PROJECTILE>=========================
[StateDef 1835]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1050
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1807
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[state 1550,avaaz]
type=playsnd
trigger1=!time
value= 3600,5
volumescale=100

[state 1350,roop]
type=assertspecial
trigger1=1
flag=noshadow

;[State 1005, ChangeAnim]
;type = ChangeAnim
;trigger1 = Anim != 1005
;value = 1005

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1050

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[state 1850,prakash]
type=explod
trigger1=!time
id=1055
anim=1055
postype=p1
pos=0,0
bindtime=-1
removetime=-2
random=0,0
velocity=0,0
accel=0,0
ownpal=1
scale=0.5,0.5
sprpriority=5
supermovetime=-1
pausemovetime=-1

[state 1350,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[State 1005, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 68 < 7, 7, fvar(11) * 68)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = -0, -13.109375
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -0, -13.109375
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=48

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1806
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1807
ignoreHitPause = 1

[state 1350,bekaar]
type=statetypeset
trigger1=!animelemtime(11)
movetype=I

[state 1350,marna]
type=destroyself
trigger1=!animtime

;=====================<SPARKS PROJECTILE>=========================
[Statedef 3010]
type=A
movetype=I
physics=N
ctrl=0
sprpriority=4

[state 3040,bind]
type=bindtoparent
trigger1=!time
pos=80,(-50*(ishelper(3010)))+(-55*(ishelper(3011)))+(-45*(ishelper(3012)))

[state 3040,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 3040,roop]
type=angledraw
trigger1=1
value=(0*(ishelper(3010)))+(15*(ishelper(3011)))+(-15*(ishelper(3012)))

[state 3040,roop]
type=trans
trigger1=1
trans=addalpha
alpha=256,256

[state 3040,anim]
type=changeanim
trigger1=!time
value=1016

[state 3040,murna]
type=varset
trigger1=!time
var(12)=2

[state 3040,murna]
type=varadd
trigger1=!animelemtime(6)
var(12)=-1

[state 3040,murna]
type=changeanim
trigger1=var(12)
trigger1=!animelemtime(6)
value=anim
elem=1

[state 3040,marna]
type=destroyself
trigger1=!animtime

;=====================<ILLUMINATIVE SPARKS PROJECTILE>=========================
[StateDef 3005]
type = S
physics = N
moveType = A
ctrl = 0
anim = 3050
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = ifelse(var(2) < 3, 3005, 3007)
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[state 1350,roop]
type=assertspecial
trigger1=1
flag=noshadow

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1

;[State 1005, ChangeAnim]
;type = ChangeAnim
;trigger1 = Anim != 1005
;value = 1005

[state 3050,anim]
type=changeanim
trigger1=!prevstateno
trigger1=!time
value=3050

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[state 3050,murna]
type=varset
trigger1=!prevstateno
trigger1=!time
var(11)=var(10)

[state 3050,murna]
type=varadd
trigger1=animelemtime(2)=5
var(11)=-1

[state 3050,murna]
type=changeanim
trigger1=var(11)
trigger1=animelemtime(2)=5
value=anim
elem=2

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[state 1350,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[State 1005, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 5 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,HP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 45 < 7, 7, fvar(11) * 45)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 3, 4
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = -4.5, -8.5
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4.5, -8.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
envshake.time=10
envshake.ampl=4
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=32
id=3005

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 3006
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 3007
ignoreHitPause = 1

[state 1350,marna]
type=destroyself
trigger1=!animtime

;Hit Pause
[StateDef 3006]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

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
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[state 1355,maar]
type=null;targetstate
trigger1=movecontact=1
trigger1=numtarget
trigger1=!MoveGuarded
value=1050
ignorehitpause=1
persistent=0

[State 1006, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1006, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [3000,3050]
var(18) = 1

[State 1006, End]
type = ChangeState
trigger1 = Time >= 0
value = ifElse(var(2) < 3, 3005, 3007)

;Disappear
[StateDef 3007]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1007, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,7
channel = 3
volume = -128
lowPriority = 1

[State 1007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1007, End]
type = ChangeState
trigger1 = !AnimTime
value = 3008

;Wait
[StateDef 3008]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=====================<MAX SPARKS PROJECTILE>=========================
[Statedef 3060]
type=A
movetype=I
physics=N
ctrl=0
sprpriority=4

[state 3040,bind]
type=bindtoparent
trigger1=!time
pos=80,(-50*(ishelper(3060)))+(-55*(ishelper(3061)))+(-45*(ishelper(3062)))

[state 3040,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 3040,roop]
type=angledraw
trigger1=1
value=(0*(ishelper(3060)))+(15*(ishelper(3061)))+(-15*(ishelper(3062)))

[state 3040,roop]
type=trans
trigger1=1
trans=addalpha
alpha=256,256

[state 3040,anim]
type=changeanim
trigger1=!time
value=1016

[state 3040,murna]
type=varset
trigger1=!time
var(12)=3

[state 3040,murna]
type=varadd
trigger1=!animelemtime(6)
var(12)=-1

[state 3040,murna]
type=changeanim
trigger1=var(12)
trigger1=!animelemtime(6)
value=anim
elem=1

[state 3040,marna]
type=destroyself
trigger1=!animtime

;=====================<MAX ILLUMINATIVE SPARKS PROJECTILE>=========================
[StateDef 3055]
type = S
physics = N
moveType = A
ctrl = 0
anim = 3050
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = ifelse(var(2) < 5, 3055, 3057)
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[state 1350,roop]
type=assertspecial
trigger1=1
flag=noshadow

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1

;[State 1005, ChangeAnim]
;type = ChangeAnim
;trigger1 = Anim != 1005
;value = 1005

[state 3050,anim]
type=changeanim
trigger1=!prevstateno
trigger1=!time
value=3050

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[state 3050,murna]
type=varset
trigger1=!prevstateno
trigger1=!time
var(11)=var(10)

[state 3050,murna]
type=varadd
trigger1=animelemtime(2)=5
var(11)=-1

[state 3050,murna]
type=changeanim
trigger1=var(11)
trigger1=animelemtime(2)=5
value=anim
elem=2

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[state 1350,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[State 1005, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 7 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,HP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 6
getPower = 0,0
givePower = 36, 36
pauseTime = 6, 12
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = -4.5, -8.5
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4.5, -8.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
envshake.time=10
envshake.ampl=4
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=32
id=3055

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 3056
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 3057
ignoreHitPause = 1

[state 1350,marna]
type=destroyself
trigger1=!animtime

;Hit Pause
[StateDef 3056]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

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
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[state 1355,maar]
type=null;targetstate
trigger1=movecontact=1
trigger1=numtarget
trigger1=!MoveGuarded
value=1050
ignorehitpause=1
persistent=0

[State 1006, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1006, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [3000,3050]
var(18) = 1

[State 1006, End]
type = ChangeState
trigger1 = Time >= 0
value = ifElse(var(2) < 5, 3055, 3057)

;Disappear
[StateDef 3057]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1007, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,7
channel = 3
volume = -128
lowPriority = 1

[State 1007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1007, End]
type = ChangeState
trigger1 = !AnimTime
value = 3058

;Wait
[StateDef 3058]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=====================<LIGHTNING STRIKE PROJECTILE>=========================
[StateDef 3405]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1051
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 3417
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[state 1350,roop]
type=assertspecial
trigger1=1
flag=noshadow

;[State 1005, ChangeAnim]
;type = ChangeAnim
;trigger1 = Anim != 1005
;value = 1005

[state 3350,anim]
type=changeanim
trigger1=!prevstateno
trigger1=!time
value=1051

[state 3350,roop]
type=sprpriority
trigger1=ishelper(3011)||ishelper(3013)
value=0

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[state 3350,hilaav]
type=envshake
trigger1=!prevstateno
trigger1=!time
time=12
ampl=6

[state 3350,shiighrataa]
type=varadd
trigger1=1
var(11)=1

[state 3350,shiighrataa]
type=velset
trigger1=ishelper(3405)||ishelper(3407)||ishelper(3410)
x=-6.0*cos(var(11)*pi/24.0)
y=1.5*sin(var(11)*pi/24.0)

[state 3350,shiighrataa]
type=velset
trigger1=ishelper(3406)||ishelper(3408)||ishelper(3409)
x=6.0*cos(var(11)*pi/24.0)
y=1.5*sin(var(11)*pi/24.0)

[state 3350,shiighrataa]
type=velset
trigger1=var(11)>=24
x=0.0
y=0.0

[state 3350,prakash]
type=explod
trigger1=!prevstateno
trigger1=!time
id=1055
anim=1055
postype=p1
pos=0,0
bindtime=-1
removetime=-2
random=0,0
velocity=0,0
accel=0,0
ownpal=1
scale=0.5,0.5
sprpriority=5
supermovetime=-1
pausemovetime=-1

[state 1550,avaaz]
type=playsnd
trigger1=!time
value= 3600,5
volumescale=100

[state 3350,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)
ignorehitpause=1

[State 1005, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 5 || Root, var(20))
trigger1 = !(var(11)%6)
attr = S,HP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 3
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -0.95, -14
ground.cornerPush.velOff = -8.52
guard.velocity = -8.52
guard.cornerPush.velOff = -8.52
air.velocity = -0.95, -14
air.cornerPush.velOff = -8.52
yAccel = 0.58
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=48

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 3416
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 3417
ignoreHitPause = 1

[state 1350,bekaar]
type=statetypeset
trigger1=!animelemtime(12)
movetype=I

[state 1350,marna]
type=destroyself
trigger1=!animtime

;Hit Pause
[StateDef 3416]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), floor(p2bodydist y)+(enemy,Const(size.mid.pos.y))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), floor(p2bodydist y)+(enemy,Const(size.mid.pos.y))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

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
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[State 1006, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1006, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [3400,3450]
var(18) = 1

[State 1006, End]
type = ChangeState
trigger1 = Time >= 0
value = 3405+(12*(var(12)>=4))

;Disappear
[StateDef 3417]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1007, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,7
channel = 3
volume = -128
lowPriority = 1

[State 1007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[state 3360,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 3360,ajay]
type=nothitby
trigger1=1
value=SCA
time=-1

[state 3360,shiighrataa]
type=varadd
trigger1=1
var(11)=1

[state 3360,shiighrataa]
type=velset
trigger1=ishelper(3405)||ishelper(3407)||ishelper(3410)
x=-6.0*cos(var(11)*pi/24.0)
y=1.5*sin(var(11)*pi/24.0)

[state 3360,shiighrataa]
type=velset
trigger1=ishelper(3406)||ishelper(3408)||ishelper(3409)
x=6.0*cos(var(11)*pi/24.0)
y=1.5*sin(var(11)*pi/24.0)

[state 3360,shiighrataa]
type=velset
trigger1=var(11)>=24
x=0.0
y=0.0

[State 1007, End]
type = ChangeState
trigger1 = !AnimTime
value = 3418

;Wait
[StateDef 3418]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=====================<MAX LIGHTNING STRIKE PROJECTILE>=========================
[StateDef 3455]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1051
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 3467
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[state 1350,roop]
type=assertspecial
trigger1=1
flag=noshadow

;[State 1005, ChangeAnim]
;type = ChangeAnim
;trigger1 = Anim != 1005
;value = 1005

[state 3350,anim]
type=changeanim
trigger1=!prevstateno
trigger1=!time
value=1051

[state 3350,roop]
type=sprpriority
trigger1=ishelper(3011)||ishelper(3013)
value=0

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[state 3350,hilaav]
type=envshake
trigger1=!prevstateno
trigger1=!time
time=12
ampl=6

[state 3350,shiighrataa]
type=varadd
trigger1=1
var(11)=1

[state 3350,shiighrataa]
type=velset
trigger1=ishelper(3455)||ishelper(3457)||ishelper(3460)
x=-6.0*cos(var(11)*pi/24.0)
y=1.5*sin(var(11)*pi/24.0)

[state 3350,shiighrataa]
type=velset
trigger1=ishelper(3456)||ishelper(3458)||ishelper(3459)
x=6.0*cos(var(11)*pi/24.0)
y=1.5*sin(var(11)*pi/24.0)

[state 3350,shiighrataa]
type=velset
trigger1=var(11)>=24
x=0.0
y=0.0

[state 3350,prakash]
type=explod
trigger1=!prevstateno
trigger1=!time
id=1055
anim=1055
postype=p1
pos=0,0
bindtime=-1
removetime=-2
random=0,0
velocity=0,0
accel=0,0
ownpal=1
scale=0.5,0.5
sprpriority=5
supermovetime=-1
pausemovetime=-1

[state 3350,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)
ignorehitpause=1

[state 1550,avaaz]
type=playsnd
trigger1=!time
value= 3600,5
volumescale=100

[State 1005, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 12 || Root, var(20))
trigger1 = !(var(11)%6)
attr = S,HP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 3
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -0.95, -14
ground.cornerPush.velOff = -8.52
guard.velocity = -8.52
guard.cornerPush.velOff = -8.52
air.velocity = -0.95, -14
air.cornerPush.velOff = -8.52
yAccel = 0.58
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palfx.color=256
palfx.mul=128,128,128
palfx.add=0,0,0
palfx.sinadd=256,256,256,4
palfx.time=48

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 3466
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 3467
ignoreHitPause = 1

[state 1350,bekaar]
type=statetypeset
trigger1=!animelemtime(12)
movetype=I

[state 1350,marna]
type=destroyself
trigger1=!animtime

;Hit Pause
[StateDef 3466]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), floor(p2bodydist y)+(enemy,Const(size.mid.pos.y))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), floor(p2bodydist y)+(enemy,Const(size.mid.pos.y))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

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
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[State 1006, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1006, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [3400,3450]
var(18) = 1

[State 1006, End]
type = ChangeState
trigger1 = Time >= 0
value = 3455+(12*(var(12)>=4))

;Disappear
[StateDef 3467]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1007, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,7
channel = 3
volume = -128
lowPriority = 1

[State 1007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[state 3360,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 3360,ajay]
type=nothitby
trigger1=1
value=SCA
time=-1

[state 3360,shiighrataa]
type=varadd
trigger1=1
var(11)=1

[state 3360,shiighrataa]
type=velset
trigger1=ishelper(3455)||ishelper(3457)||ishelper(3460)
x=-6.0*cos(var(11)*pi/24.0)
y=1.5*sin(var(11)*pi/24.0)

[state 3360,shiighrataa]
type=velset
trigger1=ishelper(3456)||ishelper(3458)||ishelper(3459)
x=6.0*cos(var(11)*pi/24.0)
y=1.5*sin(var(11)*pi/24.0)

[state 3360,shiighrataa]
type=velset
trigger1=var(11)>=24
x=0.0
y=0.0

[State 1007, End]
type = ChangeState
trigger1 = !AnimTime
value = 3468

;Wait
[StateDef 3468]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=====================<LIGHTNING STRIKE PROJECTILE>=========================
[StateDef 3640]
type = S
physics = N
moveType = A
ctrl = 0
anim = 3650
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 3647
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[state 1350,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 3550,prakash]
type=explod
trigger1=!time
id=1018
anim=1018
postype=p1
pos=0,0
bindtime=-1
removetime=-2
scale=0.5,0.5
ownpal=1
sprpriority=5

;[State 1005, ChangeAnim]
;type = ChangeAnim
;trigger1 = Anim != 1005
;value = 1005

[state 3050,anim]
type=changeanim
trigger1=!time
value=3650

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[state 1350,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[State 1005, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 2 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,HP
hitFlag = MAF
guardFlag =
priority = 4, Hit
damage = 0
getPower = 0,0
givePower = 36, 36
pauseTime = 4, 4
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = Hard
air.animType = back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = -3, -7.5
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -3, -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
envshake.time=10
envshake.ampl=4
p2facing=1
kill=0
numhits=0
id=3640

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 3646
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 3647
ignoreHitPause = 1

[state 3550,bekaar]
type=statetypeset
trigger1=!animelemtime(11)
movetype=I

[state 3550,marna]
type=removeexplod
trigger1=!animtime
id=-1

[state 1350,marna]
type=destroyself
trigger1=!animtime

;Hit Pause
[StateDef 3646]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

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
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[State 1006, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1006, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [3600,3650]
var(18) = 1

[state 3555,badalna]
type=changestate
trigger1= Time >= 0
value=3665
ctrl=0
ignorehitpause=1

[State 1006, End]
type = ChangeState
trigger1=!hitpausetime
value = 3647
ignorehitpause=1

;Disappear
[StateDef 3647]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1007, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,7
channel = 3
volume = -128
lowPriority = 1

[State 1007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1007, End]
type = ChangeState
trigger1 = !AnimTime
value = 3648

;Wait
[StateDef 3648]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;Millennium Clap Projectile Entrap
[Statedef 3665]
type=S
movetype=A
physics=N
ctrl=0
velset=0,0
sprpriority=5
movehitpersist=1

[state 3565,fasla]
type=attackdist
trigger1=1
value=0

[state 3565,anim]
type=changeanim
trigger1=!time
value=9999

[state 3565,target]
type=turn
trigger1=!time

[state 3565,target]
type=targetstate
trigger1=!time
trigger2=parent,time=281||parent,time=287
trigger3=parent,time=291||parent,time=297
;trigger4=parent,time=336||parent,time=342
;trigger5=parent,time=354||parent,time=360
value=3695

[state 3565,target]
type=bindtotarget
trigger1=!time
pos=0,0

[state 3565,target]
type=targetbind
;trigger1=parent,time<357
trigger1=parent,time<417
pos=0,0;abs(target(3550),const(size.mid.pos.y))

[state 3565,target]
type=targetstate
;trigger1=parent,time=357
trigger1=parent,time=417
value=3696

[state 3565,dharna]
type=posset
trigger1=!time
y=-55

[state 3565,jodo]
type=posadd
trigger1=!time
x=-backedgedist+40

[state 3565,shiighrataa]
type=null
trigger1=parent,animelemtime(4)>=0
trigger1=var(0)<240
trigger1=var(0):=var(0)+1

[state 3565,shiighrataa]
type=velset
trigger1=!parent,animelemtime(4)
x=(gamewidth*0.5-screenpos x)*facing/240
y=(ceil((1.33*gameheight/gamewidth)*100)-screenpos y)/240
persistent=0

[state 3565,shiighrataa]
type=velset
trigger1=var(0)=240
x=0.0
y=0.0

[state 3565,prakash]
type=modifyexplod
trigger1=!time
postype=p1
pos=0,0
bindtime=1
scale=0.5,0.5
id=1018

[state 3565,circles]
type=explod
trigger1=!time
ID=1
anim=1090
postype=p1
pos=0,80
facing=-1
removetime=-1
bindtime=-1
ontop=1
under=0
ownpal=1
scale=0.5,0.5
sprpriority=5

[state 3565,circles]
type=removeexplod
trigger1=parent,time=407
;trigger1=parent,time=407
id=1

[state 3565,avaaz]
type=playsnd
trigger1=parent,time=281||parent,time=287
trigger2=parent,time=291||parent,time=297
;trigger3=parent,time=336||parent,time=342
;trigger4=parent,time=354||parent,time=360
value= 2,7
channel=1

[state 3565,maar]
type=targetlifeadd
trigger1=parent,time=281||parent,time=287
trigger2=parent,time=291||parent,time=297
;trigger3=parent,time=336||parent,time=342
;trigger4=parent,time=354||parent,time=360
value=ceil(-33*fvar(11))
id=3640
kill=parent,time=297

[state 3565,maar]
type=targetpoweradd
trigger1=parent,time=281||parent,time=287
trigger2=parent,time=291||parent,time=297
;trigger3=parent,time=336||parent,time=342
;trigger4=parent,time=354||parent,time=360
value=21
id=3640

[state 3565,hilaav]
type=envshake
trigger1=parent,time=281||parent,time=287
trigger2=parent,time=291||parent,time=297
;trigger3=parent,time=336||parent,time=342
;trigger4=parent,time=354||parent,time=360
time=8
ampl=8

[state 3565,maar]
type=hitadd
trigger1=parent,time=281||parent,time=287
trigger2=parent,time=291||parent,time=297
;trigger3=parent,time=336||parent,time=342
;trigger4=parent,time=354||parent,time=360
value=1

[state 3555,Juggle]
type=parentvaradd
trigger1=parent,time=281||parent,time=287
trigger2=parent,time=291||parent,time=297
;trigger3=parent,time=336||parent,time=342
;trigger4=parent,time=354||parent,time=360
var(0)=1

[state 3555,Juggle]
type=parentvarset
trigger1=parent,time=281||parent,time=287
trigger2=parent,time=291||parent,time=297
;trigger3=parent,time=336||parent,time=342
;trigger4=parent,time=354||parent,time=360
var(1)=1

[state 3555,]
type=parentvaradd
trigger1=parent,time=281||parent,time=287
trigger2=parent,time=291||parent,time=297
;trigger3=parent,time=336||parent,time=342
;trigger4=parent,time=354||parent,time=360
fvar(0)=1

[State 1006, HitSpark]
type = Helper
trigger1=parent,time=281||parent,time=287
trigger2=parent,time=291||parent,time=297
;trigger3=parent,time=336||parent,time=342
;trigger4=parent,time=354||parent,time=360
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ceil((p2dist x+25)+(-random%25)),ceil((p2dist y)+(random%20))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[state 3565,electricity]
type=helper
trigger1=!time
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=0
pausemovetime=99999999999999999
supermovetime=99999999999999999
ignorehitpause=1

[state 3565,marna]
type=removeexplod
trigger1=!numtarget
trigger2=time
trigger2=parent,stateno!=3605
id=-1

[state 3565,marna]
type=destroyself
trigger1=!numtarget
trigger2=time
trigger2=parent,stateno!=3605

;=====================<MAX LIGHTNING STRIKE PROJECTILE>=========================
[StateDef 3670]
type = S
physics = N
moveType = A
ctrl = 0
anim = 3650
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 3677
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[state 1350,roop]
type=assertspecial
trigger1=1
flag=noshadow

[state 3550,prakash]
type=explod
trigger1=!time
id=1018
anim=1018
postype=p1
pos=0,0
bindtime=-1
removetime=-2
scale=0.5,0.5
ownpal=1
sprpriority=5

;[State 1005, ChangeAnim]
;type = ChangeAnim
;trigger1 = Anim != 1005
;value = 1005

[state 3050,anim]
type=changeanim
trigger1=!time
value=3650

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[state 1350,fasla]
type=attackdist
trigger1=1
value=const(size.proj.attack.dist)

[State 1005, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 2 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,HP
hitFlag = MAF
guardFlag =
priority = 4, Hit
damage = 0
getPower = 0,0
givePower = 36, 36
pauseTime = 4, 4
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = Hard
air.animType = back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = -3, -7.5
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -3, -7.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
envshake.time=10
envshake.ampl=4
p2facing=1
kill=0
numhits=0
id=3670

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 3676
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 3677
ignoreHitPause = 1

[state 3550,bekaar]
type=statetypeset
trigger1=!animelemtime(11)
movetype=I

[state 3550,marna]
type=removeexplod
trigger1=!animtime
id=-1

[state 1350,marna]
type=destroyself
trigger1=!animtime

;Hit Pause
[StateDef 3676]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 7)
channel = 3
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 200, ceil(P2Dist x), 200)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

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
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=1
ignorehitpause=1
persistent=0

[State 1006, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1006, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [3600,3650]
var(18) = 1

[state 3555,badalna]
type=changestate
trigger1= Time >= 0
value=3685
ctrl=0
ignorehitpause=1

[State 1006, End]
type = ChangeState
trigger1=!hitpausetime
value = 3677
ignorehitpause=1

;Disappear
[StateDef 3677]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1007, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,7
channel = 3
volume = -128
lowPriority = 1

[State 1007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1007, End]
type = ChangeState
trigger1 = !AnimTime
value = 3678

;Wait
[StateDef 3678]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;Millennium Clap Projectile Entrap
[Statedef 3685]
type=S
movetype=A
physics=N
ctrl=0
velset=0,0
sprpriority=5
movehitpersist=1

[state 3565,fasla]
type=attackdist
trigger1=1
value=0

[state 3565,anim]
type=changeanim
trigger1=!time
value=9999

[state 3565,target]
type=turn
trigger1=!time

[state 3565,target]
type=targetstate
trigger1=!time
trigger2=parent,time=281||parent,time=287
trigger3=parent,time=291||parent,time=297
trigger4=parent,time=336||parent,time=342
trigger5=parent,time=354||parent,time=360
value=3695

[state 3565,target]
type=bindtotarget
trigger1=!time
pos=0,0

[state 3565,target]
type=targetbind
trigger1=parent,time<417
pos=0,0;abs(target(3550),const(size.mid.pos.y))

[state 3565,target]
type=targetstate
trigger1=parent,time=417
value=3696

[state 3565,dharna]
type=posset
trigger1=!time
y=-55

[state 3565,jodo]
type=posadd
trigger1=!time
x=-backedgedist+40

[state 3565,shiighrataa]
type=null
trigger1=parent,animelemtime(4)>=0
trigger1=var(0)<240
trigger1=var(0):=var(0)+1

[state 3565,shiighrataa]
type=velset
trigger1=!parent,animelemtime(4)
x=(gamewidth*0.5-screenpos x)*facing/240
y=(ceil((1.33*gameheight/gamewidth)*100)-screenpos y)/240
persistent=0

[state 3565,shiighrataa]
type=velset
trigger1=var(0)=240
x=0.0
y=0.0

[state 3565,prakash]
type=modifyexplod
trigger1=!time
postype=p1
pos=0,0
bindtime=1
scale=0.5,0.5
id=1018

[state 3565,circles]
type=explod
trigger1=!time
ID=1
anim=1090
postype=p1
pos=0,80
facing=-1
removetime=-1
bindtime=-1
ontop=1
under=0
ownpal=1
scale=0.5,0.5
sprpriority=5

[state 3565,circles]
type=removeexplod
trigger1=parent,time=407
id=1

[state 3565,avaaz]
type=playsnd
trigger1=parent,time=281||parent,time=287
trigger2=parent,time=291||parent,time=297
trigger3=parent,time=336||parent,time=342
trigger4=parent,time=354||parent,time=360
value= 2,7
channel=1

[state 3565,maar]
type=targetlifeadd
trigger1=parent,time=281||parent,time=287
trigger2=parent,time=291||parent,time=297
trigger3=parent,time=336||parent,time=342
trigger4=parent,time=354||parent,time=360
value=ceil(-23*fvar(11))
id=3670
kill=parent,time=360

[state 3565,maar]
type=targetpoweradd
trigger1=parent,time=281||parent,time=287
trigger2=parent,time=291||parent,time=297
trigger3=parent,time=336||parent,time=342
trigger4=parent,time=354||parent,time=360
value=21
id=3670

[state 3565,hilaav]
type=envshake
trigger1=parent,time=281||parent,time=287
trigger2=parent,time=291||parent,time=297
trigger3=parent,time=336||parent,time=342
trigger4=parent,time=354||parent,time=360
time=8
ampl=8

[state 3565,maar]
type=hitadd
trigger1=parent,time=281||parent,time=287
trigger2=parent,time=291||parent,time=297
trigger3=parent,time=336||parent,time=342
trigger4=parent,time=354||parent,time=360
value=1

[state 3555,Juggle]
type=parentvaradd
trigger1=parent,time=281||parent,time=287
trigger2=parent,time=291||parent,time=297
trigger3=parent,time=336||parent,time=342
trigger4=parent,time=354||parent,time=360
var(0)=1

[state 3555,Juggle]
type=parentvarset
trigger1=parent,time=281||parent,time=287
trigger2=parent,time=291||parent,time=297
trigger3=parent,time=336||parent,time=342
trigger4=parent,time=354||parent,time=360
var(1)=1

[state 3555,]
type=parentvaradd
trigger1=parent,time=281||parent,time=287
trigger2=parent,time=291||parent,time=297
trigger3=parent,time=336||parent,time=342
trigger4=parent,time=354||parent,time=360
fvar(0)=1

[State 1006, HitSpark]
type = Helper
trigger1=parent,time=281||parent,time=287
trigger2=parent,time=291||parent,time=297
trigger3=parent,time=336||parent,time=342
trigger4=parent,time=354||parent,time=360
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ceil((p2dist x+25)+(-random%25)),ceil((p2dist y)+(random%20))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[state 3565,electricity]
type=helper
trigger1=!time
name="Electricity"
helpertype=normal
ID=8415
stateno=8415
ownpal=0
pausemovetime=99999999999999999
supermovetime=99999999999999999
ignorehitpause=1

[state 3565,marna]
type=removeexplod
trigger1=!numtarget
trigger2=time
trigger2=parent,stateno!=3655
id=-1

[state 3565,marna]
type=destroyself
trigger1=!numtarget
trigger2=time
trigger2=parent,stateno!=3655

;Millennium Clap Target State
[Statedef 3695]
type=a
movetype=H
physics=N
ctrl=0
velset=0,0
sprpriority=-1

[state 3595,roop]
type=screenbound
trigger1=1
value=0
movecamera=1,0

[state 3595,anim]
type=changeanim2
trigger1=!time
value=3695+(prevstateno=3695)

[state 3595,ajay]
type=nothitby
trigger1=1
value=SCA
time=1

[state 3595,roop]
type=palfx
trigger1=!time
time=407
color=256
mul=128,128,128
add=0,0,0
sinadd=256,256,256,4

[state 3595,shake]
type=offset
trigger1=!(gametime%2)
trigger1=prevstateno=3695
x=cond(random<500,-5,5)
y=cond(random<500,-5,5)

[state 3595,phir_lana]
type=selfstate
trigger1=!gethitvar(isbound)
trigger1=time>300
value=5050

;Millennium Clap Target State
[Statedef 3696]
type=A
movetype=H
physics=N
sprpriority=-1

[state 3596,roop]
type=screenbound
trigger1=1
value=1
movecamera=1,0

[state 3596,roop]
type=palfx
trigger1=!time
time=48
color=256
mul=128,128,128
add=0,0,0
sinadd=256,256,256,4

[state 3596,fall]
type=hitfallset
trigger1=!time
value=1

[state 3596,anim]
type=changeanim2
trigger1=!time
value=3697

[state 3596,shiighrataa]
type=velset
trigger1=!time
x=0.0
y=-12.5
[state 3596,shiighrataa]
type=veladd
trigger1=1
y=0.5

[state 3596,hilaav]
type=envshake
trigger1=pos y>=0
trigger1=vel y>0
time=15
ampl=12

[state 3596,phir_lana]
type=selfstate
trigger1=pos y>=0
trigger1=vel y>0
value=5100

;========================<SPARKS>=============================
;Guard Spark (Normal)
[StateDef 8000]
type = A
physics = N
moveType = I
anim = 8000
velset = 0,0
sprPriority = 5

[State 8000, Assert: No Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8000, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.125 + (0.046875 * Time), 0.125 + (0.046875 * Time)
ignoreHitPause = 1

[State 8000, Transparency]
type = Trans
trigger1 = Time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8000, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8000, End]
type = DestroySelf
trigger1 = Time >= 8

;Guard Spark (Special)
[StateDef 8001]
type = A
physics = N
moveType = I
anim = 8001
velSet = 0,0
sprPriority = 5

[State 8001, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8001, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
ignoreHitPause = 1

[State 8001, Transparency]
type = Trans
trigger1 = time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8001, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8001, End]
type = DestroySelf
trigger1 = Time >= 8

;Weak Hit Spark
[StateDef 8010]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8010, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8010, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8010, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8010, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.3 - (Time * 0.03), 0.3 - (Time * 0.03)
ignoreHitPause = 1

[State 8010, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8010, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8010, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.15 + (0.009375 * Time), 0.15 + (0.009375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time),256

[State 8010, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.15 + (0.009375 * Time), 0.15 + (0.009375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8010, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.3 - (0.0375 * Time), 0.3 - (0.0375 * Time)
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8010, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8010, End]
type = DestroySelf
trigger1 = Time >= 16

;Medium Hit Spark
[StateDef 8011]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8011, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8011, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8011, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8011, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.35 - (Time * 0.035), 0.35 - (Time * 0.035)
ignoreHitPause = 1

[State 8011, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8011, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8011, Center]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removetime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.175 + (0.0109375 * Time), 0.175 + (0.0109375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8011, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.175 + (0.0109375 * Time), 0.175 + (0.0109375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8011, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.35 - (0.04375 * Time), 0.35 - (0.04375 * Time)
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8011, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8011, End]
type = DestroySelf
trigger1 = Time >= 16

;Strong Hit Spark
[StateDef 8012]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8012, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8012, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8012, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8012, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.4 - (Time * 0.04), 0.4 - (Time * 0.04)
ignoreHitPause = 1

[State 8012, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8012, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8012, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.2 + (0.0125 * Time), 0.2 + (0.0125 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8012, Streaks Explod]
type = Explod
trigger1 = !time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.2 + (0.0125 * Time), 0.2 + (0.0125 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8012, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.4 - (0.05 * Time), 0.4 - (0.05 * Time)
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8012, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8012, End]
type = DestroySelf
trigger1 = Time >= 16

;Special Move Hit Spark
[StateDef 8013]
type = A
physics = N
moveType = I
anim = 8050
velSet = 0,0
sprPriority = 5

[State 8013, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8013, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8013, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8013, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.45 - (Time * 0.045), 0.45 - (Time * 0.045)
ignoreHitPause = 1

[State 8012, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8013, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8013, Center Explod]
type = Explod
trigger1 = !Time
anim = 8051
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.225 + (0.0140625 * Time), 0.225 + (0.0140625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8013, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8052
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.225 + (0.0140625 * Time), 0.225 + (0.0140625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8013, P2 Back Explod]
type = Explod
trigger1 = !Time
anim = 8053
ID = 3
posType = P1
facing = -1
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale P2 Back Explod]
type = ModifyExplod
trigger1= NumExplod(3)
ID = 3
scale = 0.4, 0.4
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8013, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(random < 500, -1, 1)
vFacing = ifElse(random < 500, -1, 1)
sprPriority=3
removeTime=8
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.45 - (0.05625 * Time), 0.45 - (0.05625 * Time)
trans = AddAlpha
alpha = 192 - (24 * Time), 256

[State 8013, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8013, End]
type = DestroySelf
trigger1 = Time >= 16

;Super Hit Spark
[StateDef 8014]
type = A
physics = N
moveType = I
anim = 8060
velSet = 0,0
sprPriority = 5

[State 8014, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8014, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8014, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8014, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.5 - (Time * 0.05), 0.5 - (Time * 0.05)
ignoreHitPause = 1

[State 8014, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8014, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8014, Center Explod]
type = Explod
trigger1 = !Time
anim = 8061
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8062
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, P2 Back Explod]
type = Explod
trigger1 = !Time
anim = 8063
ID = 3
posType = P1
facing = ifElse((Parent, StateNo = [3000,3999]), -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale P2 Back Explod]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 0.5,0.5
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8014, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.5 - (0.0625 * Time), 0.5 - (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (32 * Time),256

[State 8014, Remove Explods]
type = RemoveExplod
trigger1 = time >= 16

[State 8014, End]
type = DestroySelf
trigger1 = Time >= 16

;Reversal Spark
[StateDef 8020]
type = A
physics = N
moveType = I
anim = 8020
velSet = 0,0
sprPriority = 5

[State 8020, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8020, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.09375 * Time), 0.25 + (0.09375 * Time)
ignoreHitPause = 1

[State 8020, Transparency]
type = Trans
trigger1 = Time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8020, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8020, End]
type = DestroySelf
trigger1 = Time >= 8

;======================<JUMP DUST>===========================
[StateDef 8100]
type = S
anim = 1
velSet = 0,0

[State 8100, Bind]
type = BindToRoot
trigger1 = Time

[State 8100, Floor Dust]
type = Explod
trigger1 = !Time
anim = 8100
sprPriority = 3
posType = P1
pos = 0, ceil(pos y)
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1

[State 8100, Player Dust]
type = Explod
trigger1 = !Time || Time = 2 || Time = 6
anim = 8101
sprPriority = 3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1

[State 8100, End]
type = DestroySelf
trigger1 = Time >= 7

;======================<DASH DUST>===========================
[StateDef 8103]
type = A
anim = 1
velSet = 0,0
sprPriority = 5

[State 8103, posSet]
type = PosSet
trigger1 = !Time = 0
y = 0

[State 8103, Dash Dust]
type = Explod
trigger1 = Time = 0 || Time = 3 || Time = 6
anim = 8103
ID = ifElse((Time = 6), 3, ifElse((Time = 3), 2, 1))
posType = P1
pos = 0,-4
random = 8,8
vel = -3 - (Random / 1000.0), -2 - (Random / 2000.0)
facing = ifElse(Random < 500,-1,1)
vFacing = ifElse(Random < 500,-1,1)
removeTime = 16
sprPriority = 3
pauseMoveTime = -1
superMoveTime = -1

[State 8103, Scale Explod 1]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.1 + (0.025 * Time), 0.1 + (0.025 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8103, Scale Explod 2]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.1 + (0.025 * (Time - 3)), 0.1 + (0.025 * (Time - 3))
trans = AddAlpha
alpha = 256 - (16 * (Time - 3)), 256

[State 8103, Scale Explod 3]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 0.1 + (0.025 * (Time - 6)), 0.1 + (0.025 * (Time - 6))
trans = AddAlpha
alpha = 256 - (16 * (Time - 6)), 256

[State 8103, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 22

[State 8103, End]
type = DestroySelf
trigger1 = !NumExplod

;======================<IMPACT DUST>===========================
[StateDef 8110]
type = A
anim = 1
velSet = 0,0
sprPriority = 5

[State 8110, Impact Dust Explod 1]
type = Explod
trigger1 = !Time
anim = 8110
ID = ifElse(Time = 8, 3, ifElse(Time = 4, 2, 1))
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8110, Impact Dust Explod 2]
type = Explod
trigger1 = !Time
anim = 8120
ID = 2
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8110, Scale]
type = ModifyExplod
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 256, 256 - (64 * (Time - 4))), 256

[State 8110, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 8

[State 8110, End]
type = DestroySelf
trigger1 = !NumExplod

;======================<WALL IMPACT DUST>===========================
[StateDef 8111]
type = A
anim = 1
velSet = 0,0
sprPriority = 5

[State 8111, Impact Dust Explod 1]
type = Explod
trigger1 = !Time
anim = 8111
ID = ifElse(Time = 8, 3, ifElse(Time = 4, 2, 1))
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8111, Impact Dust Explod 2]
type = Explod
trigger1 = !Time
anim = 8121
ID = 2
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8111, Scale]
type = ModifyExplod
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 256, 256 - (64 * (Time - 4))), 256

[State 8111, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 8

[State 8111, End]
type = DestroySelf
trigger1 = !NumExplod

;========================<RECOVER FX>=============================
[StateDef 8200]
type = A
velSet = 0,0
anim = 8200
sprPriority = 5

[State 8200, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8200, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.017 * Time), 0.25 + (0.017 * Time)
ignoreHitPause = 1

[State 8200, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = ceil(256 - 17.1 * Time), 256
ignoreHitPause = 1

[State 8200, End]
type = DestroySelf
trigger1 = Time >= 15

;========================<COUNTER FX>=============================
[StateDef 8290]
type = A
physics = N
velSet = 0,0
anim = 1

[State 8290, "Counter!" Text Explod]
type = Explod
trigger1 = !NumExplod(8290)
anim = 8290
ID = 8290
sprPriority = 64
posType = P1
facing = Facing
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 8290, Scale]
type = ModifyExplod
trigger1 = Time < 8
ID = 8290
scale = 0.5, .5
trans = AddAlpha
alpha = 256,0

[State 8290, Scale]
type = ModifyExplod
trigger1 = Time >= 8
ID = 8290
scale = 0.5 + 0.0625 * (Time - 8), 0.5 + 0.0625 * (Time - 8)
trans = AddAlpha
alpha = 256 - 32 * (Time - 8), 32 * (Time - 8)

[State 8290, Safety]
type = RemoveExplod
trigger1 = Time >= 16

[State 8290, End]
type = DestroySelf
trigger1 = Time >= 16

;==================<POWER CHARGE FX>==================
;Aura and Dust
[StateDef 8330]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velset = 0,0

[State 8330, BindToRoot]
type = BindToRoot
trigger1 = (Root, StateNo = 730)
pos = 0,0

[State 8330, Charging Sound]
type = PlaySnd
trigger1 = !Time
value = 730,0
channel = 0

[State 8330, Power Charge Aura]
type = Explod
trigger1 = !NumExplod(8330)
ID = 8330
anim = 8330
sprPriority = 3
posType = P1
bindTime = -1
removeTime = -1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 8330, Power Charge Dust]
type = Explod
trigger1 = !(Time % 6)
anim = 8105
sprPriority = -3
posType = P1
pos = 0, -ceil(pos y)
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 8330, Modify Aura 1]
type = ModifyExplod
trigger1 = Numexplod(8330) && Root, Power < 3000
ID = 8330
scale = 0.5, 0.1 + 0.4 * (Root, Power / 3000.0)

[State 8330, Modify Aura 2]
type = ModifyExplod
trigger1 = NumExplod(8330) && Root, Power >= 3000
ID = 8330
scale = 0.5, 0.5

[State 8330, StopSnd]
type = StopSnd
trigger1 = Root, StateNo != 730
channel = 0

[State 8330, RemoveExplod]
type = RemoveExplod
trigger1 = Root, StateNo != 730

[State 8330, End]
type = DestroySelf
trigger1 = Root, StateNo != 730

;Particles
[StateDef 8331]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 8331, BindToRoot]
type = BindToRoot
trigger1 = !(Time % 8)
pos = ceil(-151 + (Random / 3.125)), ceil(98 - (Random / 3.125))

[State 8331, Particle]
type = Explod
trigger1 = (Time % 8) = 1
anim = 8331
sprPriority = ifElse(Random < 750, 5, -1)
posType = P1
vel = ((RootDist x - 9) / 32.0), ((RootDist y - 71) / 32.0)
scale = ifElse(Random < 500, 0.5, -0.5), ifElse(Random < 500, 0.5, -0.5)
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1

[State 8331, RemoveExplod]
type = RemoveExplod
trigger1 = Root, StateNo != 730

[State 8331, End]
type = DestroySelf
trigger1 = Root, StateNo != 730

;==================<VIOLENT WIN VS VEGA PARTICLES>==================
[StateDef 8332]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 8332, BindToRoot]
type = BindToRoot
trigger1 = !(Time % 4)
pos = ceil(-40 + (Random /10.25)), ceil(-17 - (Random / 10.25))

[State 8332, Particles]
type = Explod
trigger1 = (Time % 4) = 1
anim = 8332
sprPriority = ifElse(Random < 750,5,-1)
posType = P1
vel = (-(RootDist x + 4) / 10.0),(-(RootDist y - 85) / 10.0)
scale = ifElse(random < 500 ,0.5, -0.5),ifElse(random < 500, 0.5, -0.5)
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 8332, RemoveExplod]
type = RemoveExplod
trigger1 = Root, StateNo != 187 || Root, AnimElemTime(60) >= 0

[State 833, End]
type = DestroySelf
trigger1 = Root, StateNo != 187 || Root, AnimElemTime(60) >= 0

;==================<ZERO COUNTER FX>==================
[StateDef 8350]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 8350, bgPalFX]
type = bgPalFX
trigger1 = 1
time = 1
color = 16 * Time
mul = 16 * Time, 16 * Time, 16 * Time

[State 8350, Circle Explod]
type = Explod
trigger1 = !Time
anim = 8350
ID = 1
sprPriority = 3
posType = P1
removeTime = 16
superMoveTime = -1
ownPal = 1

[State 8350, Scale]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = (0.0625 * Time), (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8350, Lightning Explod]
type = Explod
trigger1 = !Time
anim = 8351
ID = 2
sprPriority = -2
posType = P1
pos = 0, -ceil(pos y)
superMoveTime = -1
ownPal = 1

[State 8350, End]
type = DestroySelf
trigger1 = Time >= 16

;========================<CUSTOM COMBO>=============================
[StateDef 8400]
type = A
physics = N
moveType = I
anim = 8400
ctrl = 0
velSet = 0,0
sprPriority = 5

[State 8400, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8400, BGpalFX]
type = BGpalFX
trigger1 = Time < 25
time = 1
mul = 128,128,128

[State 8400, Rotate]
type = AngleSet
trigger1 = !Time
value = 6 * (Random % 60)

[State 8400, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8400, Scale]
type = AngleDraw
trigger1 = Time < 8
scale = (0.0625 * Time), (0.0625 * Time)
ignoreHitPause = 1

[State 8400, Scale]
type = AngleDraw
trigger1 = Time >= 8
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8400, Transparency]
type = Trans
trigger1 = Time < 16
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8400, Transparency]
type = Trans
trigger1 = Time >= 16
trans = AddAlpha
alpha = ceil(256 - 25.6 * (Time - 16)), 256
ignoreHitPause = 1

[State 8400, Lines Explod]
type = Explod
trigger1 = !Time
anim = 8401
ID = 1
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 16
superMoveTime = -1

[State 8400, Scale Lines Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 2 - (0.125 * Time), 2 - (0.125 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8400, Circle Explod]
type = Explod
trigger1 = Time = 16
anim = 8402
ID = 2
sprPriority = 5
posType = P1
removeTime = 32
superMoveTime = -1

[State 8400, Scale Circle Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = (0.1 * (Time - 16)), (0.1 * (Time - 16))
trans = AddAlpha
alpha = ceil(256 - 25.6 * (Time - 16)), 256

[State 8400, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 26

[State 8400, End]
type = DestroySelf
trigger1 = Time >= 26

;Roa's Stock Sytem
[Statedef 7005]
type=A
movetype=I
physics=N
ctrl=0

[state 8005,Stock]
type=null
trigger1=var(42):=root,var(42)||var(43):=root,var(43)

[state 8005,ID]
type=varset
trigger1=root,numpartner
trigger1=root,id>partner,id
var(0)=partner,name="Michael Roa Valdamjong"

[state 8005,Vigor:_System-Display]
type=DisplayToClipboard
trigger1=time
text="Stock=%d/9 Set-Stock=%d/9 varo_hades"
params=var(42),var(43)

[state 8005,bind]
type=bindtoparent
trigger1=1
pos=0,-10

[state 8005,anim]
type=changeanim
trigger1=anim!=9999
value=9999

[state 8005,Player-1]
type=explod
trigger1=!numexplod(0)
trigger1=var(42)=0
id=0
anim=7005
postype=left
pos=cond(teamside=1,5,300),69+(9*(var(0)))
bindtime=-1
removetime=-1
ontop=1
ownpal=1
scale=0.5,0.5
sprpriority=5

[state 8005,Player-1]
type=explod
trigger1=!numexplod(1)
trigger1=var(42)=1
id=1
anim=7006
postype=left
pos=cond(teamside=1,5,300),69+(9*(var(0)))
bindtime=-1
removetime=-1
ontop=1
ownpal=1
scale=0.5,0.5
sprpriority=5

[state 8005,Player-1]
type=explod
trigger1=!numexplod(2)
trigger1=var(42)=2
id=2
anim=7007
postype=left
pos=cond(teamside=1,5,300),69+(9*(var(0)))
bindtime=-1
removetime=-1
ontop=1
ownpal=1
scale=0.5,0.5
sprpriority=5

[state 8005,Player-1]
type=explod
trigger1=!numexplod(3)
trigger1=var(42)=3
id=3
anim=7008
postype=left
pos=cond(teamside=1,5,300),69+(9*(var(0)))
bindtime=-1
removetime=-1
ontop=1
ownpal=1
scale=0.5,0.5
sprpriority=5

[state 8005,Player-1]
type=explod
trigger1=!numexplod(4)
trigger1=var(42)=4
id=4
anim=7009
postype=left
pos=cond(teamside=1,5,300),69+(9*(var(0)))
bindtime=-1
removetime=-1
ontop=1
ownpal=1
scale=0.5,0.5
sprpriority=5

[state 8005,Player-1]
type=explod
trigger1=!numexplod(5)
trigger1=var(42)=5
id=5
anim=7016
postype=left
pos=cond(teamside=1,5,300),69+(9*(var(0)))
bindtime=-1
removetime=-1
ontop=1
ownpal=1
scale=0.5,0.5
sprpriority=5

[state 8005,Player-1]
type=explod
trigger1=!numexplod(6)
trigger1=var(42)=6
id=6
anim=7011
postype=left
pos=cond(teamside=1,5,300),69+(9*(var(0)))
bindtime=-1
removetime=-1
ontop=1
ownpal=1
scale=0.5,0.5
sprpriority=5

[state 8005,Player-1]
type=explod
trigger1=!numexplod(7)
trigger1=var(42)=7
id=7
anim=7012
postype=left
pos=cond(teamside=1,5,300),69+(9*(var(0)))
bindtime=-1
removetime=-1
ontop=1
ownpal=1
scale=0.5,0.5
sprpriority=5

[state 8005,Player-1]
type=explod
trigger1=!numexplod(8)
trigger1=var(42)=8
id=8
anim=7013
postype=left
pos=cond(teamside=1,5,300),69+(9*(var(0)))
bindtime=-1
removetime=-1
ontop=1
ownpal=1
scale=0.5,0.5
sprpriority=5

[state 8005,Player-1]
type=explod
trigger1=!numexplod(9)
trigger1=var(42)=9
id=9
anim=7014
postype=left
pos=cond(teamside=1,5,300),69+(9*(var(0)))
bindtime=-1
removetime=-1
ontop=1
ownpal=1
scale=0.5,0.5
sprpriority=5

[state 8005,marna]
type=removeexplod
trigger1=numexplod(0)
trigger1=var(42)!=0
id=0

[state 8005,marna]
type=removeexplod
trigger1=numexplod(1)
trigger1=var(42)!=1
id=1

[state 8005,marna]
type=removeexplod
trigger1=numexplod(2)
trigger1=var(42)!=2
id=2

[state 8005,marna]
type=removeexplod
trigger1=numexplod(3)
trigger1=var(42)!=3
id=3

[state 8005,marna]
type=removeexplod
trigger1=numexplod(4)
trigger1=var(42)!=4
id=4

[state 8005,marna]
type=removeexplod
trigger1=numexplod(5)
trigger1=var(42)!=5
id=5

[state 8005,marna]
type=removeexplod
trigger1=numexplod(6)
trigger1=var(42)!=6
id=6

[state 8005,marna]
type=removeexplod
trigger1=numexplod(7)
trigger1=var(42)!=7
id=7

[state 8005,marna]
type=removeexplod
trigger1=numexplod(8)
trigger1=var(42)!=8
id=8

[state 8005,marna]
type=removeexplod
trigger1=numexplod(9)
trigger1=var(42)!=9
id=9

;=========================================================================
;Electricity
;=========================================================================
[Statedef 8415]
type=A
movetype=I
physics=N
ctrl=0
velset=0,0

[state 8415,shadow]
type=assertspecial
trigger1=1
flag=noshadow

[state 8415,anim]
type=changeanim
trigger1=anim!=9999
value=9999

[state 8415,position-detect]
type=varset
triggerall=!time
trigger1=parent,stateno=810||parent,stateno=820||parent,stateno=850
trigger2=root,numhelper(3640)
trigger2=parent,ishelper(3640)
trigger3=root,numhelper(3670)
trigger3=parent,ishelper(3670)
var(12)=1

[state 8415,player-Detect]
type=varset
trigger1=!time
var(55)=parent,var(55)

[state 8415,rahnaa]
type=posset
trigger1=playeridexist(var(55))
x=ceil(playerid(var(55)),pos x)
y=ceil(playerid(var(55)),pos y)+(playerid(var(55)),const(size.mid.pos.y)*!(var(12)))

[state 8415,rahnaa]
type=posset
trigger1=playeridexist(var(55))
trigger1=playerid(var(55)),statetype=L
x=ceil(playerid(var(55)),pos x)
y=ceil(playerid(var(55)),pos y)-20

[state 8415,face]
type=turn
trigger1=playeridexist(var(55))
trigger1=facing!=(playerid(var(55)),facing)

[state 8415,electricity]
type=explod
trigger1=playeridexist(var(55))
trigger1=!(time%1)
anim=7000
ID=7000
postype=p1
pos=0,0
random=50,50
facing=cond(random<500,1,-1)
vfacing=cond(random<500,1,-1)
removetime=-2
bindtime=-1
scale=0.25,0.25
ownpal=0
sprpriority=5
supermovetime=-1
pausemovetime=-1

[state 8415,marna]
type=destroyself
trigger1=time>600
trigger2=!playeridexist(var(55))

[state 8415,marna]
type=destroyself
triggerall=playeridexist(var(55))
trigger1=playerid(var(55)),ctrl
trigger2=playerid(var(55)),movetype!=H||playerid(var(55)),stateno=5300
trigger3=playerid(var(55)),statetype=L&&(playerid(var(55)),stateno!=[5080,5081])

;========================<SUPER PAUSE FX>=============================
;Level 1 Super FX
[StateDef 8500]
type = A
velSet = 0,0
anim = 8500
sprPriority = 5

[State 8500, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8500, BGpalFX]
type = BGpalFX
trigger1 = Time < 39
time = 1
color = 0
mul = 0,0,256

[State 8500, Rotate]
type = AngleSet
trigger1 = !Time
value = 6 * (Random % 60)

[State 8500, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8500, Scale]
type = AngleDraw
trigger1 = Time < 16
scale = (0.03125 * Time), (0.03125 * Time)
ignoreHitPause = 1

[State 8500, Scale]
type = AngleDraw
trigger1 = Time >= 16
scale = 0.5,0.5
ignoreHitPause = 1

[State 8500, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8500, Lines Explod]
type = Explod
trigger1 = Time = 0 || Time = 8 || Time = 16 || Time = 24
anim = 8501
ID = ifElse(Time = 24, 4, ifElse(Time = 16, 3, ifElse(Time = 8, 2, 1)))
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 16
superMoveTime = -1

[State 8500, Scale Lines Explod 1]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 1 - (0.0625 * Time), 1 - (0.0625 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8500, Scale Lines Explod 2]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 1 - (0.0625 * (Time - 8)), 1 - (0.0625 * (Time - 8))
trans = AddAlpha
alpha = ifElse((Time - 8) < 4, 64 * (Time - 8), 256), 256

[State 8500, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 1 - (0.0625 * (Time - 16)), 1 - (0.0625 * (Time - 16))
trans = AddAlpha
alpha = ifElse((Time - 16) < 4, 64 * (Time - 16), 256), 256

[State 8500, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 1 - (0.0625 * (Time - 24)), 1 - (0.0625 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8500, Circle Explod]
type = Explod
trigger1 = Time = 24
anim = 8502
ID = 10
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 32
superMoveTime = -1

[State 8500, Scale Circle Explod]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
scale = 2 - (0.125 * (Time - 24)), 2 - (0.125 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8500, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 40

[State 8500, End]
type = DestroySelf
trigger1 = Time >= 40

;Level 2 Super FX
[StateDef 8510]
type = A
velSet = 0,0
anim = 8510
sprPriority = 5

[State 8510, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8510, BGpalFX]
type = BGpalFX
trigger1 = Time < 39
time = 1
color = 0
mul = 192,0,256

[State 8510, Rotate]
type = AngleSet
trigger1 = !Time
value =6 * (Random % 60)

[State 8510, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8510, Scale]
type = AngleDraw
trigger1 = Time < 16
scale = (0.03125 * Time), (0.03125 * Time)
ignoreHitPause = 1

[State 8510, Scale]
type = AngleDraw
trigger1 = Time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8510, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8510, Lines Explod]
type = Explod
trigger1 = Time = 0 || Time = 8 || Time = 16 || Time = 24
anim = 8511
ID = ifElse(Time = 24, 4, ifElse(Time = 16, 3, ifElse(Time = 8, 2, 1)))
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 16
superMoveTime = -1

[State 8510, Scale Lines Explod 1]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 1 - (0.0625 * Time), 1 - (0.0625 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8510, Scale Lines Explod 2]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 1 - (0.0625 * (Time - 8)), 1 - (0.0625 * (Time - 8))
trans = AddAlpha
alpha = ifElse((Time - 8) < 4, 64 * (Time - 8), 256), 256

[State 8510, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 1 - (0.0625 * (Time - 16)), 1 - (0.0625 * (Time - 16))
trans = AddAlpha
alpha = ifElse((Time - 16) < 4, 64 * (Time - 16), 256), 256

[State 8510, Scale Lines Explod 4]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 1 -(0.0625 * (Time - 24)), 1 - (0.0625 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8510, Circle Explod]
type = Explod
trigger1 = Time = 24
anim = 8512
ID = 10
sprPriority = 5
posType = P1
facing = ifElse(Random < 500,-1,1)
vFacing = ifElse(Random < 500,-1,1)
removeTime = 32
superMoveTime = -1

[State 8510, Scale]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
scale = 2 - (0.125 * (Time - 24)), 2 - (0.125 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24)<4, 64 * (Time - 24), 256), 256

[State 8510, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 40

[State 8510, End]
type = DestroySelf
trigger1 = Time >= 40

;Level 3 Super FX
[StateDef 8520]
type = A
velset = 0,0
anim = 8520
sprPriority = 5

[State 8520, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8520, Assert: NoBarDisplay, NoBG, NoFG]
type = AssertSpecial
trigger1 = Time < 40
flag = NoBarDisplay
flag2 = NoBG
flag3 = NoFG

[State 8520, Rotate]
type = AngleSet
trigger1 = !Time
value = 6 * (Random % 60)

[State 8520, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8520, Scale]
type = AngleDraw
trigger1 = Time < 16
scale = (0.03125 * Time), (0.03125 * Time)
ignoreHitPause = 1

[State 8520, Scale]
type = AngleDraw
trigger1 = Time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8520, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8520, Portrait 1]
type = Explod
trigger1 = !Time
anim = 8525
ID = 20
sprPriority = -16
posType = Back
removeTime = 40
superMoveTime = -1

[State 8520, Portrait 2]
type = Explod
trigger1 = !Time
anim = 8525
ID = 21
sprPriority = -16
posType = Back
removeTime = 40
superMoveTime = -1

[State 8520, Scale Portrait 1a]
type = ModifyExplod
trigger1 = NumExplod(20) && Time < 16
ID = 20
posType = Back
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 1 - (0.03125 * Time), 1 - (0.03125 * Time)
trans = AddAlpha
alpha = (8 * Time), 256

[State 8520, Scale Portrait 2a]
type = ModifyExplod
trigger1 = NumExplod(21) && Time < 16
ID = 21
posType = Back
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 2 - (0.09375 * Time), 2 - (0.09375 * Time)
trans = AddAlpha
alpha = (8 * Time), 256

[State 8520, Scale Portrait 1b]
type = ModifyExplod
trigger1 = NumExplod(20) && (Time = [16,32])
ID = 20
posType = Back
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 256, 256

[State 8520, Scale Portrait 2b]
type = ModifyExplod
trigger1 = NumExplod(21) && (Time = [16,32])
ID = 21
scale = 0,0

[State 8520, Scale Portrait 1c]
type = ModifyExplod
trigger1 = NumExplod(20) && Time >= 32
ID = 20
posType = Back
pos = 160 + (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Scale Portrait 2c]
type = ModifyExplod
trigger1 = NumExplod(21) && Time >= 32
ID = 21
posType = Back
pos = 160 - (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Lines Explod]
type = explod
trigger1 = Time = 0 || Time = 8 || Time = 16 || Time = 24
anim = 8521
ID = ifElse(Time = 24, 4, ifElse(Time = 16, 3, ifElse(Time = 8, 2, 1)))
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 16
superMoveTime = -1

[State 8520, Scale Lines Explod 1]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 1 - (0.0625 * Time), 1 - (0.0625 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8520, Scale Lines Explod 2]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 1-(0.0625 * (Time - 8)), 1 - (0.0625 * (Time - 8))
trans = AddAlpha
alpha = ifElse((Time - 8) < 4, 64 * (Time - 8), 256), 256

[State 8520, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 1 - (0.0625 * (Time - 16)), 1 - (0.0625 * (Time - 16))
trans = AddAlpha
alpha = ifElse((Time - 16) < 4, 64 * (Time - 16), 256), 256

[State 8520, Scale Lines Explod 4]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 1 - (0.0625 * (Time - 24)), 1 - (0.0625 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8520, Circle Explod]
type = Explod
trigger1 = Time = 24
anim = 8522
ID = 10
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1 ,1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 32
superMoveTime = -1

[State 8520, Scale Circle Explod]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
scale = 2 - (0.125 * (Time - 24)), 2 - (0.125 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8520, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 40

[State 8520, End]
type = DestroySelf
trigger1 = Time >= 40

;========================<SUPER FINISH>=============================
[StateDef 8600]
type = A
velSet = 0,0
anim = 1

[State 8600, Sound]
type=playsnd
trigger1= !time
value=8600,2
channel = 0

[State 8600, SndPan]
type = SndPan
trigger1 = Time <= 80
channel = 1
absPan = ceil(sin(GameTime / 20.0 * pi) * 160)

[State 8600, BG PalFX]
type = BGpalFX
trigger1 = Time < 16
time = 1
mul = 0, 0, 0

[State 8600, BG PalFX]
type = BGpalFX
trigger1 = Time = [16,24)
time = 1
mul = 32 * (Time - 16), 32 * (Time - 16), 32 * (Time - 16)

[State 8600, Move Name: Custom Combo]
type = VarSet
trigger1= !Time && Root, var(23) = 900
var(0) = 1

[State 8600, Move Name: Illuminative Sparks]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3000,3099])
var(0) = 2

[State 8600, Move Name: Storm Cloud]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3100,3199])
var(0) = 3

[State 8600, Move Name: Serpent's Overload]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3200,3299])
var(0) = 4

[State 8600, Move Name: Slice'n Dice]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3300,3399])
var(0) = 5

[State 8600, Move Name: Lightning Storm]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3400,3499])
var(0) = 6

[State 8600, Move Name: Lightning Barrage]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3500,3599])
var(0) = 7

[State 8600, Move Name: Millennium Clap]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3600,3699])
var(0) = 8

[State 8600, Super Finish Explod]
type = Explod
trigger1 = !Time
anim = 8600
ID = 8600
ontop = 1
postype = Left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * GameHeight / GameWidth)
bindTime = -1
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Super Finish Explod Fade]
type = ModifyExplod
trigger1 = NumExplod(8600)
ID = 8600
trans = AddAlpha
alpha = ifElse(Time < 16, 256, 256 - 32 * (Time - 16)), 256

[State 8600, Text 1]
type = Explod
trigger1 = !Time && var(0)
anim = 8610 + var(0)
ID = 10
onTop = 1
posType = Left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * GameHeight / GameWidth)
bindTime = -1
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Text 2]
type = Explod
trigger1 = !Time && var(0)
anim = 8610 + var(0)
ID = 11
onTop = 1
posType = left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * GameHeight / GameWidth)
bindTime = -1
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Text 1 Fade]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
trans = AddAlpha
alpha = ifElse(Time < 16, 256, 256 - 32 * (Time - 16)), ifElse(Time < 16, 0, 32 * (Time - 16))

[State 8600, Text 2 Fade]
type = ModifyExplod
trigger1 = NumExplod(11)
ID = 11
scale = 0.5 + (0.0625 * Time), 0.5 + (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (32 * Time), 32 * Time

[State 8600, Circle Explod]
type = Explod
trigger1 = !Time
anim = 8601
ID = 8601
under = 1
posType = Left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
bindTime = -1
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Circle Fade]
type = ModifyExplod
trigger1 = NumExplod(8601)
ID = 8601
scale = (0.25 * Time) * (1.3333333 * GameHeight / GameWidth), (0.25 * Time) * (1.3333333 * GameHeight / GameWidth)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8600, Assert: NoFG]
type = AssertSpecial
trigger1 = Time < 16
flag = NoFG

[State 8600, Assert: NoBarDisplay]
type = AssertSpecial
trigger1 = Time < 24
flag = NoBarDisplay

[State 8600, RemoveExplod]
type = RemoveExplod
trigger1 = Time >= 24
trigger2 = RoundState < 3

[State 8600, End]
type = DestroySelf
trigger1 = RoundState < 3

;========================<CAMERA CONTROL>=============================
[StateDef 8999]
type = S
velSet = 0,0
anim = 1

[State 8999, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,1
ignoreHitPause = 1

[State 8999, End]
type = DestroySelf
trigger1 = RoundState = 2
