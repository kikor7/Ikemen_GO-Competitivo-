;====================================================
;================ESPECIALS===========================
;====================================================

;-----------------------------------------------------------------------------------
[Statedef 1000, YAKKOUDORI - start]
type = S
physics = S
ctrl = 0
anim = 1000
poweradd = 20
sprpriority = 2


[State 100, Explod]
type = Explod
trigger1 = time = 18
anim = 6050
ID = 6050
pos = -20,-5
postype = p1
bindtime = 1
removetime = -2
scale = 0.25,0.25
sprpriority = 4
ownpal = 1
[State 0, Explod smallRocks] 
type = Explod
trigger1 = time>18 && time <45 
anim = 7145
id = 7145
postype = p1
pos = -30,floor(pos y)
facing = ifelse(random%2,1,-1)
vel = Random/(-120),Random/(-120)
accel = 0,.5
scale = IfElse(Random <= 499,.02,.01),IfElse(Random <= 499,.02,.01)
sprpriority = ifelse(random%2,3,ifelse(random%2,27,ifelse(random%2,25,ifelse(random%2,10,-1))))
pausemovetime = 9999
supermovetime = 9999
removeongethit = 1

[State 1000, bird FX]
type = Helper
trigger1 = animelem = 5
helpertype = Normal
id = 1001
name="bird FX"
pos = 50,0
postype	= p1
facing = 1
stateno	= 1001
keyctrl	= 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .5
size.yscale = .5

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 5
anim = 800
ID = 800
pos = -8,42
postype = p1
bindtime = 1
removetime = -2
scale = .7,.9
sprpriority = 4
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = S4,33
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = S2,0

[State 0, ChangeState]
type = ChangeState
trigger1 = time=50
value = 203
ctrl = 0

;-------------------------------------------------------------------------------
[Statedef 1001,--- helper projectile]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 840
sprpriority = 5

[State 0, EnvShake]
type = EnvShake
trigger1 = time%8=0
time = 5
freq = 120
ampl = -2
;phase = 90
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 6
y = 0

[State -1]
Type = AfterImage
Trigger1 =(!Time)
Time =150
palcolor = 256
palinvertall = 0
palbright = 30,30,30
palcontrast = 100,100,100
palpostbright = 0,0,0
paladd = 10,10,25
palmul = .55,.55,.65
timegap = 1
framegap = 1
length = 10
trans = add

[State 3000, polvo Rush - FX]
type = Explod
triggerall = time <150
trigger1 = time%4=0
anim = 7140
ID = 7140
pos = 10,0
vel = 0, 0
sprpriority = 4
removetime = -2
bindtime = 1
ownpal = 1
scale = .3,.2
removeongethit = 1
ontop = 0
supermovetime = 0;999
ignorehitpause  = 1
facing=-1

[State 0, Explod bigRocks] 
type = Explod
triggerall = time <150
trigger1 = time%4=0
anim = 7145
id = 7145
postype = p1
pos = 30,0
facing = ifelse(random%2,1,-1)
vel = Random/(-120),Random/(-120)
accel = 0,.5
scale = IfElse(Random <= 499,.1,.03),IfElse(Random <= 499,.1,.03)
sprpriority = ifelse(random%2,3,ifelse(random%2,27,ifelse(random%2,25,ifelse(random%2,10,-1))))
pausemovetime = 0;9999
supermovetime = 0;9999
removeongethit = 1

[State 0, PlaySnd rocks]
type = PlaySnd
trigger1=time >= 0 && time <= 150
trigger1=time%17=0
value = S7,4;
volumescale = 50

[State 210, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = movehit=0
trigger2 = movehit>1
attr = S, SP
animtype  = hard
damage    = 40,8
getpower = 30,15
guardflag = MA
pausetime = 0,10
sparkno = -1
guard.sparkno = -1;s7000
sparkxy = 0,-40
hitsound   = S3,23
guardsound = S3,25
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -5,-2
air.velocity = -3,-2
fall = 0
envshake.time = 15
envshake.ampl = 5
envshake.freq = 110
envshake.phase = 110

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-25
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.5,0.5
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 1
persistent = 0


[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 6,-33
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .65,.65
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8101) = 0
trigger1 = Movehit = 1 && p2movetype=H
helpertype = normal
name = "HitSpark"
ID = 8101
stateno =ifelse(random>500,8101,8001)
pos = 30-10+random%20, 0-30+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .55
size.yscale = .55

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 1002
time = 1
forceair = 0
ignorehitpause = 1

[State 0, ChangeState]
type = ChangeState
trigger1 =  movecontact = 1
value = 1002
ctrl = 0

[State 0, DestroySelf]
type = DestroySelf
trigger1 =time>=150
;-------------------------------------------------------------------------------
[Statedef 1002,--- helper spark]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 841
sprpriority = 5

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 =  time = 0
x = 10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 1
y = 0

[State 40 dust]
type = Explod
trigger1 = !Time
anim = 7105
ID = 7105
pos = 40-10+random%20, 0-10+random%20
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = 30
scale = .85,.85
sprpriority = 10
ownpal = 1
removeongethit = 0

[State -1]
Type = AfterImage
Trigger1 =(!Time)
Time =40
palcolor = 256
palinvertall = 0
palbright = 30,30,30
palcontrast = 100,100,100
palpostbright = 0,0,0
paladd = 10,10,25
palmul = .55,.55,.65
timegap = 1
framegap = 1
length = 10
trans = add

[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
;------------------------------------------------------------------



;===============================================================================
;===============================================================================
[Statedef 1100, 360PH - start]
type = S
physics = S
velset = 0,0
ctrl = 0
anim = 1100
sprpriority = 2

;***********------"mugshot"-----------**********
[State 0, Helper]
type = Helper
triggerall = !numhelper(50003) 
trigger1 = time = 13;!time
helpertype = normal ;player
name = "mugshot"
ID = 50003
stateno = 50003
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
;***********------"mugshot"-----------**********

[State 0, Helper]
type = Helper
triggerall = !numhelper(50037) 
trigger1 = time >= 13 & timemod = 15,0
helpertype = normal ;player
name = "AfterImage6Blue"
ID = 50037
stateno = 50037
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
[State 0, Veladd] 
type = Veladd
trigger1 = 1
x = -1.5
[State 0, VelSet]
type = VelSet
trigger1 = vel x < 0.05
x = 0
ignorehitpause = 1
[State 0, VelSet]
type = VelSet
trigger1 = 1
y = 0
ignorehitpause = 1
[State 0, EnvShake]
type = EnvShake
trigger1 = time >= 13 & timemod = 10,0
time = 5
freq = 90
ampl = -4
phase = 10
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = numhelper(50038)=0 
trigger1 = time >= 13 & timemod = 5,0
helpertype = normal ;player
name = "AfterImage7 glow"
ID = 50038
stateno = 50038
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
remappal = 1,3
supermovetime = 9999
pausemovetime = 9999

[State 0, PalFX]
Type = PalFX
trigger1 = time >= 13
time = 1
ADD = 0,25+Floor(Sin(Time/15.0*PI)*25),80+Floor(Sin(Time/15.0*PI)*80)

[State 0, Helper]
Type = Helper
Trigger1 = !NumHelper(1105)
trigger1 = time >= 13
HelperType = Normal
Name = "Power"
Pos = 0,0
PosType = p1
Facing = 1
OwnPal = 1
Size.Ground.Back = 0
Size.Ground.Front = 0
StateNO = 1105
ID = 1105

[State 0, BGPalFX]
type = BGPalFX
trigger1 = Time > 34
time =1
add = -80,-80,-80

[State 0, AllPalFX]
type = BGPalFX
trigger1 = Time > 34
trigger1 = time%3=0
time = 2
add = -50,-50,-50
mul = 256,256,256
color=128

[State 1000, EnvColor]
type = EnvColor
triggerall =  time = 13 && !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, PowerAdd]
type = PowerAdd
trigger1 = 1 && !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
value = -3;

[State 100, Explod]
type = Explod
trigger1 = time = 13 && !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
anim = 6074
ID = 6074
pos = 0,2
postype = p1
bindtime = -1
removetime = -1
scale = 0.4,0.4
sprpriority = -4
ownpal = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=50;60;70
id =6074

[State 60, pound hou chargeFX]
type = Explod
trigger1 = time = 13 && !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
anim = 872
ID =  872
pos = -18,-21
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermovetime = 0
pausemovetime =0
scale = 0.33, 0.33
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=50;60;70
id =872

[State 100, Explod]
type = Explod
trigger1 = time = ifelse(!(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263),50,15)
anim = 6050
ID = 6050
pos = -25,-5
postype = p1
bindtime = 1
removetime = -2
scale = 0.25,0.25
sprpriority = 4
ownpal = 1


[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0 && !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
value = S4,36
channel=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =13
value = S8,6
channel=2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =13
value = S8,19
channel=10


[State -2, varsetCombo]
type = varset
trigger1 =1
var(24) = ifelse(var(23)=1,1,0)
ignorehitpause = 1


[State 1500, off]
type = ChangeState
triggerall=!AIlevel
trigger1 = command != "hold_a" & time <=50;60;70
value = 1102

[State 1500,attack combo]
type = ChangeState
triggerall = !AIlevel && (prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
trigger1=command = "hold_a" & time >=15
value = 1101

[State 1500, attack]
type = ChangeState
triggerall = !AIlevel
trigger1=command = "hold_a" & time >=50;60;70
value = 1101
ctrl = 0


;para la IA
[State 1500, off]
type = ChangeState
triggerall= AIlevel
trigger1 =  p2life = 0
value = 1102

[State 1500, attack combo]
type = ChangeState
triggerall = AIlevel && (prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
trigger1=time >=15
value = 1101

[State 1500, attack]
type = ChangeState
triggerall = AIlevel
trigger1= time >=50;60;70
value = 1101


;-------------------------------------------------------------------------------
[Statedef 1101,--- attack]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 1101

[State 0, BGPalFX]
type = BGPalFX
trigger1 = Time > 0
time =1
add = -80,-80,-80

[State 0, AllPalFX]
type = BGPalFX
trigger1 = Time > 0
trigger1 = time%3=0
time = 2
add = -50,-50,-50
mul = 256,256,256
color=128


;---retira carga
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=0
id =872

[State 100, Explod]
type = Explod
trigger1 = animelem = 2
anim = 6050
ID = 6050
pos = -20,-5
postype = p1
bindtime = 1
removetime = -2
scale = 0.25,0.25
sprpriority = 4
ownpal = 1
facing = 1
supermovetime=9999
pausemovetime=9999

[State 0, Explod smallRocks] 
type = Explod
trigger1 = time>3 && time <30 
anim = 7145
id = 7145
postype = p1
pos = -30,floor(pos y)
facing = ifelse(random%2,1,-1)
vel = Random/(-120),Random/(-120)
accel = 0,.5
scale = IfElse(Random <= 499,.02,.01),IfElse(Random <= 499,.02,.01)
sprpriority = ifelse(random%2,3,ifelse(random%2,27,ifelse(random%2,25,ifelse(random%2,10,-1))))
pausemovetime = 9999
supermovetime = 9999
removeongethit = 1

[State -3, Helper]
type = Helper
trigger1 = animelem = 2
helpertype = normal
name = "floor I"
ID = 5633
stateno = 5633
pos = 0,-3
postype = p1
facing = 1
ownpal = 1
supermovetime =9999
pausemovetime =9999
ignorehitpause =1
persistent=0

[State 1000: projectile]
type = Helper
trigger1 = animelem = 2
helpertype = Normal
name = "projectile"
id = 1103
pos = 0,-25
postype = p1
facing = 1
stateno	= 1103
keyctrl	= 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale =ifelse(var(24)=1,.27,.34)
size.yscale = ifelse(var(24)=1,.27,.34)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S4,112
;channel=0

;espada
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S3,15

[State 200, hit]
type = ChangeState
trigger1=time=45
value = 1102
ctrl = 0

;-------------------------------------------------------------------------------
[StateDef 1102,--- end/off]
type = S
movetype= I
physics = S
velset = 0,0
ctrl = 0
anim = 1102
poweradd = 0
sprpriority = 2

[State 0, AfterImageTime]
type = AfterImageTime
trigger1 =time=0
time = 0
ignorehitpause = 1
persistent = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S3,33

[State 10, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 0

[State 10, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 2

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=0
id =872

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=0
id =6074

[State 1503, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;-------------------------------------------------------------------------------
[StateDef 1103,--- helper projectile]
type    = S
movetype= A
physics = S
ctrl = 0
velset = 0,0
anim =873
sprpriority = 5

[State 0, EnvShake]
type = EnvShake
trigger1 = time%8=0
time = 5
freq = 120
ampl = -3
;phase = 90
ignorehitpause = 1

[State 3101, Anim]
type = changeanim
trigger1 = anim != 873
value = 873

[State 0, VelSet]
type = VelSet
trigger1 = time >0
x = 15

[State 0, VelMul]
type = VelMul
trigger1 = movehit = 1 
x = 0.75

[State -1]
Type = AfterImage
Trigger1 = (!Time)
Time =100
palcolor = 256
palinvertall = 0
palbright = 30,30,30
palcontrast = 100,100,100
palpostbright = 0,0,0
paladd = 10,10,25
palmul = .55,.55,.65
timegap = 2
framegap = 2
length = 20
trans = add

[State 210, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = movehit=0
trigger2 = movehit>1
attr = S, SA
animtype  = hard
damage    = ifelse(parent,var(24)=1,120,240),ifelse(parent,var(24)=1,24,48)
pausetime = 6,5
guard.pausetime = 6,10
guardflag = MA
guard.sparkno = -1
sparkno = -1
hitsound = S3,26
guardsound = S3,25
ground.type = low
getpower = 0,0
fall=1
ground.hittime = 10
ground.slidetime = 30
ground.velocity =  ifelse(parent,var(24)=1,-9,-13),ifelse(parent,var(24)=1,-2,-3)
guard.hittime = 15
guard.slidetime = 23
guard.velocity = -15

air.hittime = 10
air.velocity =  ifelse(parent,var(24)=1,-9,-13),ifelse(parent,var(24)=1,-2,-3)
envshake.time = 15
envshake.ampl = 5
envshake.freq = 130
envshake.phase = 130
fall.recover =0

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numexplod(8200) = 0
trigger1 = moveguarded=1 && numenemy
helpertype =normal
name = "sparkGuard"
ID = 8200
stateno = ifelse(random>500,8200,8201)
pos = 20, -28
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
persistent =0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8102) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8002
stateno =ifelse(random>500,8102,8002)
pos = 5, -25
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .85
size.yscale = .85

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 3,-26
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .8,.8
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 3000, Corte Rush - FX]
type = Explod
triggerall = time <80
trigger1 = time%2=0
anim = 809
ID = 809
pos = 10,25
vel = 1, 0
sprpriority = 3
removetime = -2
bindtime = 1
ownpal = 1
scale = .6,.3
removeongethit = 1
ontop = 0
supermovetime = 0
ignorehitpause  = 1
facing=1

[State 3000, polvo Rush - FX]
type = Explod
triggerall = time <80
trigger1 = time%2=0
anim = 7140
ID = 7140
pos = 50,26
vel = 0, 0
sprpriority = 6
removetime = -2
bindtime = 1
ownpal = 1
scale = .3,.2
removeongethit = 1
ontop = 0
supermovetime = 0;999
ignorehitpause  = 1
facing=-1

[State 0, Explod bigRocks] 
type = Explod
triggerall = time <80
trigger1 = time%3=0
anim = 7145
id = 7145
postype = p1
pos = 70,10
facing = ifelse(random%2,1,-1)
vel = Random/(-120),Random/(-120)
accel = 0,.5
scale = IfElse(Random <= 499,.1,.03),IfElse(Random <= 499,.1,.03)
sprpriority = ifelse(random%2,3,ifelse(random%2,27,ifelse(random%2,25,ifelse(random%2,10,-1))))
pausemovetime = 0;9999
supermovetime = 0;9999
removeongethit = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = moveguarded
time = 30
freq = 60
ampl = -4
phase = 90
ignorehitpause = 1

[State 0, PlaySnd rocks]
type = PlaySnd
trigger1 = time=0
value = S7,4;

;proyectile
[State 0, PlaySnd ]
type = PlaySnd
trigger1 = time = 0
value =S2,17

[State 0, VelSet]
type = VelSet
trigger1 = MoveGuarded 
x = 1

[State 3101, hitvar]
type = varadd
trigger1 = !time
var(5) = 1

[State 0, AfterImageTime]
type = AfterImageTime
trigger1 = var(5) >= 5 
trigger2 = MoveGuarded
time = 0
ignorehitpause = 1
persistent = 1

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno= ifelse(var(5) < 5, 1103, 1104)
time = 1
forceair = 0
ignorehitpause = 1

[State 0, guard]
type = ChangeState
trigger1 =!Movehit && movecontact
value = 1104
ctrl = 0

[State 0, DestroySelf]
type = DestroySelf
trigger1=  time >=100;
;-------------------------------------------------------------------------------

;------------------------------------------------------------------------------
[Statedef 1104,--- spark]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 9997
sprpriority = 5

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 50
freq = 60
ampl = -4
phase = 90
ignorehitpause = 1

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "HitSpark"
ID = 8001
stateno =8001
pos = 50-10+random%20, -5-10+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .8
size.yscale = .8

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "HitSpark"
ID = 8107
stateno = 8107
pos = 0, 0
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .8
size.yscale = .8

[State 40 dust]
type = Explod
trigger1 = !Time
anim = 7105
ID = 7105
pos =  50-10+random%20, -5-10+random%20
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = 30
scale = 1.1,1.1
sprpriority = 10
ownpal = 1
removeongethit = 0

[State 60, dust]
type = Explod
trigger1 = time = 0
anim = 7132
ID =  7132
pos = 25,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
supermovetime = 0;9999
pausemovetime = 0;9999
scale = 0.7, 0.7
sprpriority = 1
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 =  time=0
value = S7,5

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time>70
;===============================================================================

[Statedef 1105,--- helper power]
type = S
movetype = I
physics = S
juggle = 0
ctrl = 0
velset = 0,0
anim = 9999

[State 0, BindToRoot]
type = BindToRoot
trigger1 =Time%5=0
pos = -100+Random%201,-80+Random%161

[State 0, Explod]
type = Explod
trigger1 = Time%5=1
anim = 6018
ID = 6018
vel=((RootDist X)/20.0),((RootDist Y - 25)/20.0)
scale=.5,.5
bindtime = 1
removetime = -2
sprpriority = 2
ownpal = 1

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = 1
ID = 6018
vel=((RootDist X)/20.0),((RootDist Y - 25)/20.0)
RemoveTime = 20

[State 0, DestroySelf]
type = DestroySelf
trigger1 = Root,StateNO != 1100
;---------------------------------------------------------------------------------------------------------------------


;===============================================================================
;===============================================================================
[Statedef 1140, 72PH - start]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 1140
sprpriority = 2

[State 0, Helper]
type = Helper
triggerall = !numhelper(50037) 
trigger1 = time >= 18 && timemod = 15,0
helpertype = normal ;player
name = "AfterImage6Blue"
ID = 50037
stateno = 50037
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 0, Helper]
type = Helper
triggerall = numhelper(50038)=0 
trigger1 = time >= 18 && timemod = 5,0
helpertype = normal ;player
name = "AfterImage7 glow"
ID = 50038
stateno = 50038
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
remappal = 1,3
supermovetime = 9999
pausemovetime = 9999

[State 0, Veladd] 
type = Veladd
trigger1 = 1
x = -1.5
[State 0, VelSet]
type = VelSet
trigger1 = vel x < 0.05
x = 0
ignorehitpause = 1
[State 0, VelSet]
type = VelSet
trigger1 = 1
y = 0
ignorehitpause = 1
[State 0, EnvShake]
type = EnvShake
trigger1 = time >= 18 & timemod = 10,0
time = 5
freq = 90
ampl = -4
phase = 10
ignorehitpause = 1

[State 0, PalFX]
Type = PalFX
trigger1 = time >= 18
time = 1
ADD = 0,25+Floor(Sin(Time/15.0*PI)*25),80+Floor(Sin(Time/15.0*PI)*80)

[State 0, Helper]
Type = Helper
Trigger1 = !NumHelper(1146)
trigger1 = time >= 18
HelperType = Normal
Name = "Power"
Pos = 0,0
PosType = p1
Facing = 1
OwnPal = 1
Size.Ground.Back = 0
Size.Ground.Front = 0
StateNO = 1146
ID = 1146

[State 0, PowerAdd]
type = PowerAdd
trigger1 = 1 && !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
value = -1;

[State 0, BGPalFX]
type = BGPalFX
trigger1 = Time > 0
time =1
add = -80,-80,-80

[State 0, AllPalFX]
type = BGPalFX
trigger1 = time%3=0
time = 2
add = -50,-50,-50
mul = 256,256,256
color=128

[State 1000, EnvColor]
type = EnvColor
triggerall =  time = 18 && !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 100, Explod]
type = Explod
trigger1 = time = 18 && !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
anim = 6074
ID = 6074
pos = 0,2
postype = p1
bindtime = -1
removetime = -1
scale = 0.3,0.3
sprpriority = -4
ownpal = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=50;60;70
id =6074

[State 60, pound hou start - FX]
type = Explod
trigger1 = time = 18 && !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
anim = 872
ID =  872
pos = -8,-56
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermovetime = 0
pausemovetime = 0
scale = 0.25, 0.25
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 60, pound hou start - FX]
type = Explod
trigger1 = time = 18 && !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
anim = 872
ID =  872
pos = -14,-25
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermovetime = 0
pausemovetime = 0
scale = 0.25, 0.25
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=50;60;70
id =872

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0 && !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
value = S4,61
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =5
value = S3,7

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =15
value = S8,6
channel=2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =15
value = S8,19
channel=10


[State -2, varsetCombo]
type = varset
trigger1 =1
var(24) = ifelse(var(23)=1,1,0)
ignorehitpause = 1

[State 1500, off]
type = ChangeState
triggerall=!AIlevel
trigger1 = command != "hold_b" & time <=50;60;70
value = 1142

[State 1500,attack combo]
type = ChangeState
triggerall = !AIlevel && (prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
trigger1=command = "hold_b" & time >=15
value = 1141

[State 1500, attack]
type = ChangeState
triggerall = !AIlevel
trigger1=command = "hold_b" & time >=50;60;70
value = 1141
ctrl = 0

;para la IA

[State 1500, off]
type = ChangeState
triggerall= AIlevel
trigger1 =  p2life = 0
value = 1142

[State 1500, attack combo]
type = ChangeState
triggerall = AIlevel && (prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
trigger1=time >=15
value = 1141

[State 1500, attack]
type = ChangeState
triggerall = AIlevel
trigger1= time >=50;60;70
value = 1141


;-------------------------------------------------------------------------------
[Statedef 1141,--- attack]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 1141

[State 0, BGPalFX]
type = BGPalFX
trigger1 = Time > 0
time =1
add = -80,-80,-80

[State 0, AllPalFX]
type = BGPalFX
trigger1 = Time > 0
trigger1 = time%3=0
time = 2
add = -50,-50,-50
mul = 256,256,256
color=128

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=0
id =872

[State 10, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 2

[State 100, Explod]
type = Explod
trigger1 = animelem = 2
anim = 6050
ID = 6050
pos = -20,-5
postype = p1
bindtime = 1
removetime = -2
scale = 0.25,0.25
sprpriority = 4
ownpal = 1
facing = 1
supermovetime=9999
pausemovetime=9999

[State 0, Explod smallRocks] 
type = Explod
trigger1 = time>3 && time <30 
anim = 7145
id = 7145
postype = p1
pos = -30,floor(pos y)
facing = ifelse(random%2,1,-1)
vel = Random/(-120),Random/(-120)
accel = 0,.5
scale = IfElse(Random <= 499,.02,.01),IfElse(Random <= 499,.02,.01)
sprpriority = ifelse(random%2,3,ifelse(random%2,27,ifelse(random%2,25,ifelse(random%2,10,-1))))
pausemovetime = 9999
supermovetime = 9999
removeongethit = 1

[State -3, Helper]
type = Helper
trigger1 = animelem = 2
helpertype = normal
name = "floor I"
ID = 5633
stateno = 5633
pos = 0,-3
postype = p1
facing = 1
ownpal = 1
supermovetime =9999
pausemovetime =9999
ignorehitpause =1
persistent=0

[State 1000: helper attack]
type = Helper
trigger1 = animelem=2
helpertype = Normal
name = "projectile1"
id = 1143
pos = 20,-35
postype = p1
facing = 1
stateno	= 1143
keyctrl	= 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .8
size.yscale = .8

[State 1000: helper attack]
type = Helper
trigger1 = animelem=7
helpertype = Normal
name = "projectile2"
id = 1144
pos = 20,-20
postype = p1
facing = 1
stateno	= 1144
keyctrl	= 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .8
size.yscale = .8

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = S4,111
channel=0
;
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=2 || animelem=7
value = S2,4

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=1 || animelem=6
value = S3,31

[State 200, hit]
type = ChangeState
trigger1=time=70
value = 213
ctrl = 0

;-------------------------------------------------------------------------------
[StateDef 1142,--- end/off]
type = S
movetype= I
physics = S
velset = 0,0
ctrl = 0
anim = 213
poweradd = 0
sprpriority = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S3,33

[State 10, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 0

[State 10, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 2

[State 0, AfterImageTime]
type = AfterImageTime
trigger1 =time=0
time = 0
ignorehitpause = 1
persistent = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=0
id =872

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=0
id =6074

[State 1503, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
[Statedef 1143,--- helper projectile 1]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim =875;
sprpriority = 5

[State 0, EnvShake]
type = EnvShake
trigger1 = time%8=0
time = 5
freq = 120
ampl = -2
;phase = 90
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 10
y = 0

[State -1]
Type = AfterImage
Trigger1 =(!Time)
Time =100
palcolor = 256
palinvertall = 0
palbright = 30,30,30
palcontrast = 100,100,100
palpostbright = 0,0,0
paladd = 10,10,25
palmul = .55,.55,.65
timegap = 2
framegap = 2
length = 20
trans = add

[State 210, 1]
type = HitDef
triggerall = hitcount <1
trigger1 = movehit=0
trigger2 = movehit>1
attr = S, SA
animtype  = hard
damage    =ifelse(parent,var(24)=1,30,60), ifelse(parent,var(24)=1,6,12)
guardflag = MA
pausetime = 0,10
sparkno = -1
guard.sparkno = -1;s7000
guard.velocity= -10
guard.slidetime=6
hitsound   = S3,23 
guardsound = S3,25
ground.type = high
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -4,-2
air.velocity = -4,-2
fall = 0
envshake.time = 15
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120
getpower=0

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numexplod(8200) = 0
trigger1 = moveguarded=1 && numenemy
helpertype =normal
name = "sparkGuard"
ID = 8200
stateno = ifelse(random>500,8200,8201)
pos = 20,-30
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
persistent =0

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 6,-30
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .65,.65
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
persistent = 0

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 0
value =  60

[State 0, Trans]
type = Trans
trigger1 = 1
trans = add
;
[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 1145
time = 1
forceair = 0
ignorehitpause = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = movecontact = 1
value = 1145
ctrl = 0

[State 0, DestroySelf]
type = DestroySelf
trigger1 = movecontact || time >= 120
;-------------------------------------------------------------------------------
[Statedef 1144,--- helper projectile 2]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim =876;
sprpriority = 5

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x =10
y = 0

[State -1]
Type = AfterImage
Trigger1 =(!Time)
Time =100
palcolor = 256
palinvertall = 0
palbright = 30,30,30
palcontrast = 100,100,100
palpostbright = 0,0,0
paladd = 10,10,25
palmul = .55,.55,.65
timegap = 2
framegap = 2
length = 20
trans = add

[State 210, 1]
type = HitDef
triggerall = hitcount <1
trigger1 = movehit=0
trigger2 = movehit>1
attr = S, SA
animtype  = hard
damage    = ifelse(parent,var(24)=1,30,60), ifelse(parent,var(24)=1,6,12)
guardflag = MA
pausetime = 0,10
sparkno = -1
guard.sparkno = -1;s7000
guard.velocity= -10
guard.slidetime=6
hitsound   = S3,23 
guardsound = S3,25
ground.type = low
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -4,-2
air.velocity = -4,-2
fall = 1
envshake.time = 15
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120
getpower=0

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numexplod(8200) = 0
trigger1 = moveguarded=1 && numenemy
helpertype =normal
name = "sparkGuard"
ID = 8200
stateno = ifelse(random>500,8200,8201)
pos = 20,-5
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
persistent =0

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 6,-5
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .65,.65
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
persistent = 0

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 0
value =  30

[State 0, Trans]
type = Trans
trigger1 = 1
trans = add

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 1145
time = 1
forceair = 0
ignorehitpause = 1

[State 0, ChangeState spark]
type = ChangeState
trigger1 = movecontact = 1
value = 1145
ctrl = 0

[State 0, DestroySelf]
type = DestroySelf
trigger1 = movecontact || time >= 120


;-------------------------------------------------------------------------------
[Statedef 1145,--- spark]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 9997
sprpriority = 5

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 30
freq = 60
ampl = -4
phase = 90
ignorehitpause = 1

[State 40 dust]
type = Explod
trigger1 = !Time
anim = 7105
ID = 7105
pos = 40-10+random%20, 0-10+random%20
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = 30
scale = .85,.85
sprpriority = 10
ownpal = 1
removeongethit = 0
; 
[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "HitSpark"
ID = 8101
stateno =ifelse(random>500,8101,8001)
pos = 40-10+random%20, 0-10+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1

[State 0, PlaySnd]
type = PlaySnd
trigger1 =  time=0
value = S7,7

[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;----------------------------------------------------------------
[Statedef 1146,--- helper power]
type = S
movetype = I
physics = S
juggle = 0
ctrl = 0
velset = 0,0
anim = 9999

[State 0, BindToRoot]
type = BindToRoot
trigger1 =Time%5=0
pos = -100+Random%201,-80+Random%161

[State 0, Explod]
type = Explod
trigger1 = Time%5=1
anim = 6018
ID = 6018
vel=((RootDist X)/20.0),((RootDist Y - 25)/20.0)
scale=.5,.5
bindtime = 1
removetime = -2
sprpriority = 2
ownpal = 1

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = 1
ID = 6018
vel=((RootDist X)/20.0),((RootDist Y - 25)/20.0)
RemoveTime = 20

[State 0, DestroySelf]
type = DestroySelf
trigger1 = Root,StateNO != 1140
;------------------------------------------------------------



;===============================================================================
;===============================================================================
[Statedef 1150, 108PH - start]
type = S
physics = S
velset = 0,0
ctrl = 0
anim = 1150
poweradd = 0
sprpriority = 2

;***********------"mugshot"-----------**********
[State 0, Helper]
type = Helper
triggerall = !numhelper(50003) 
trigger1 = time = 13;!time
helpertype = normal ;player
name = "mugshot"
ID = 50003
stateno = 50003
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
;***********------"mugshot"-----------**********

[State 0, Helper]
type = Helper
triggerall = !numhelper(50037) 
trigger1 = time >= 10 & timemod = 15,0
helpertype = normal ;player
name = "AfterImage6Blue"
ID = 50037
stateno = 50037
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
[State 0, Veladd] 
type = Veladd
trigger1 = 1
x = -1.5
[State 0, VelSet]
type = VelSet
trigger1 = vel x < 0.05
x = 0
ignorehitpause = 1
[State 0, VelSet]
type = VelSet
trigger1 = 1
y = 0
ignorehitpause = 1
[State 0, EnvShake]
type = EnvShake
trigger1 = time >= 10 & timemod = 10,0
time = 5
freq = 90
ampl = -4
phase = 10
ignorehitpause = 1
[State 0, Helper]
type = Helper
triggerall = numhelper(50038)=0 
trigger1 = time >= 10 & timemod = 5,0
helpertype = normal ;player
name = "AfterImage7 glow"
ID = 50038
stateno = 50038
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
remappal = 1,3
supermovetime = 9999
pausemovetime = 9999

[State 0, PalFX]
Type = PalFX
trigger1 = time >= 10
time = 1
ADD = 0,25+Floor(Sin(Time/15.0*PI)*25),80+Floor(Sin(Time/15.0*PI)*80)

[State 0, Helper]
Type = Helper
Trigger1 = !NumHelper(1155)
trigger1 = time >= 10
HelperType = Normal
Name = "Power"
Pos = 0,0
PosType = p1
Facing = 1
OwnPal = 1
Size.Ground.Back = 0
Size.Ground.Front = 0
StateNO = 1155
ID = 1155

[State 0, BGPalFX]
type = BGPalFX
trigger1 = Time > 0
time =1
add = -80,-80,-80

[State 0, AllPalFX]
type = BGPalFX
trigger1 = time%3=0
time = 2
add = -50,-50,-50
mul = 256,256,256
color=128

[State 0, PowerAdd]
type = PowerAdd
trigger1 = 1 && !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
value = -2


[State 1000, EnvColor]
type = EnvColor
triggerall =  time = 10 && !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 100, Explod]
type = Explod
trigger1 = time = 10 && !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
anim = 6074
ID = 6074
pos = 0,2
postype = p1
bindtime = -1
removetime = -1
scale = 0.35,0.35
sprpriority = -4
ownpal = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=50;60;70
id =6074

[State 60, pound hou start - FX]
type = Explod
trigger1 = time = 19
anim = 872
ID =  872
pos = -10,-55
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermovetime = 0
pausemovetime = 0
scale = 0.25, 0.25
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 60, pound hou start - FX]
type = Explod
trigger1 = time = 10
anim = 872
ID =  872
pos = -12,-45
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermovetime = 0
pausemovetime = 0
scale = 0.25, 0.25
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 60, pound hou start - FX]
type = Explod
trigger1 = time = 16
anim = 872
ID =  872
pos = -8,-39
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermovetime = 0
pausemovetime = 0
scale = 0.25, 0.25
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=50;60;70
id =872

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=2
value = S4,96
channel=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=3
value =  S3,7;S3,31

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =10
value = S8,6
channel=2;

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =10
value = S8,19
channel=10

[State -2, varsetCombo]
type = varset
trigger1 =1
var(24) = ifelse(var(23)=1,1,0)
ignorehitpause = 1


[State 1500, off]
type = ChangeState
triggerall= !AIlevel
trigger1 = command != "hold_c" & time <=50;60;70
value = 1152

[State 1500,attack combo]
type = ChangeState
triggerall = !AIlevel && (prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
trigger1=command = "hold_c" & time >=15
value = 1151

[State 1500,  attack]
type = ChangeState
triggerall = !AIlevel
trigger1=command = "hold_c" & time >=50;60;70
value = 1151
ctrl = 0

;para la IA

[State 1500, off]
type = ChangeState
triggerall= AIlevel
trigger1 =  p2life = 0
value = 1152

[State 1500, attack combo]
type = ChangeState
triggerall = AIlevel && (prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
trigger1=time >=15
value = 1151

[State 1500, attack]
type = ChangeState
triggerall = AIlevel
trigger1= time >=50;60;70
value = 1151

;-------------------------------------------------------------------------------
[Statedef 1151,--- attack]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 1151

[State 0, BGPalFX]
type = BGPalFX
trigger1 = Time > 0
time =1
add = -80,-80,-80

[State 0, AllPalFX]
type = BGPalFX
trigger1 = Time > 0
trigger1 = time%3=0
time = 2
add = -50,-50,-50
mul = 256,256,256
color=128

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=0
id =872

;-----------------
[State 1000: helper attack]
type = Helper
trigger1 = time=9 || time=19 || time=29|| time=39
helpertype = Normal
name = "projectile"
id = 1153
pos = 20,-75
postype = p1
facing = 1
stateno	= 1153
keyctrl	= 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = 1
size.yscale = .9

[State 100, Explod]
type = Explod
trigger1 = animelem = 3
anim = 6050
ID = 6050
pos = -20,-5
postype = p1
bindtime = 1
removetime = -2
scale = 0.25,0.25
sprpriority = 4
ownpal = 1
facing = 1
supermovetime=9999
pausemovetime=9999

[State 0, Explod smallRocks] 
type = Explod
trigger1 = time>8 && time <35 
anim = 7145
id = 7145
postype = p1
pos = -30,floor(pos y)
facing = ifelse(random%2,1,-1)
vel = Random/(-120),Random/(-120)
accel = 0,.5
scale = IfElse(Random <= 499,.02,.01),IfElse(Random <= 499,.02,.01)
sprpriority = ifelse(random%2,3,ifelse(random%2,27,ifelse(random%2,25,ifelse(random%2,10,-1))))
pausemovetime = 9999
supermovetime = 9999
removeongethit = 1

[State -3, Helper]
type = Helper
trigger1 = animelem = 3
helpertype = normal
name = "floor I"
ID = 5633
stateno = 5633
pos = 0,-3
postype = p1
facing = 1
ownpal = 1
supermovetime =9999
pausemovetime =9999
ignorehitpause =1
persistent=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=1
value = S4,113
channel=0

;estela
[State 0, PlaySnd ]
type = PlaySnd
trigger1 = time = 0
value =S8,0;

;viento
[State 1, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
trigger2 = animelem = 6
value = S2,10

;espada viento
[State 0, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 1|| Animelem = 2
value = S2,0


[State 200, hit]
type = ChangeState
trigger1=time=80;100
value = 1152
ctrl = 0

;-------------------------------------------------------------------------------
[StateDef 1152,--- end/off]
type = S
movetype= I
physics = S
velset = 0,0
ctrl = 0
anim = 221
poweradd = 0
sprpriority = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S3,33

[State 10, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 2

[State 10, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 0

[State 0, AfterImageTime]
type = AfterImageTime
trigger1 =time=0
time = 0
ignorehitpause = 1
persistent = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=0
id =872

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=0
id =6074


[State 1503, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;-------------------------------------------------------------------------------
[Statedef 1153,--- helper projectile]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim =874
sprpriority = 5

[State 0, EnvShake]
type = EnvShake
trigger1 = time%8=0
time = 5
freq = 120
ampl = -4
;phase = 90
ignorehitpause = 1

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 1154
time = 1
forceair = 0
ignorehitpause = 1

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 0
value =  -30

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 8
y = 0

[State -1]
Type = AfterImage
Trigger1 =(!Time)
Time =100
palcolor = 256
palinvertall = 0
palbright = 30,30,30
palcontrast = 100,100,100
palpostbright = 0,0,0
paladd = 10,10,25
palmul = .55,.55,.65
timegap = 2
framegap = 2
length = 20
trans = add

[State 210, 1]
type = HitDef
triggerall = hitcount <1
trigger1 = movehit=0
trigger2 = movehit>1
attr = S, SA
animtype  = hard
damage    =ifelse(parent,var(24)=1,22,45),ifelse(parent,var(24)=1,4,9)
guardflag = MA
pausetime = 3,6
sparkno = -1
guard.pausetime=3,15
guard.sparkno = -1
guard.slidetime=8
guard.velocity= -15
hitsound   = S3,21
guardsound = S3,25
sparkxy = 0,30
ground.type = high
ground.slidetime = 6
ground.hittime  = 1
ground.velocity = -3,-1.8
air.velocity = -3,-1.8
fall =1
envshake.time = 15
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120
getpower=0

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numexplod(8200) = 0
trigger1 = moveguarded=1 && numenemy
helpertype =normal
name = "sparkGuard"
ID = 8200
stateno = ifelse(random>500,8200,8201)
pos = 20-5+random%20, -37-10+random%20;9,-30
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
persistent =0

[State 0, Helper]
type = Helper
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8001
stateno =ifelse(random>500,8101,8001)
pos = 40-10+random%20, 30-10+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale =  IfElse(Random <= 499,.7,.9)
size.yscale =  IfElse(Random <= 499,.7,.9)


[State 200, Spark blood]
type = Explod
trigger1 = movehit  && p2movetype=H
trigger1 = target,time=0
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos =  5-20+random%20, 10-40+random%20
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = IfElse(Random <= 499,.55,.65),IfElse(Random <= 499,.55,.65)
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
;persistent = 0

[State 0, Trans]
type = Trans
trigger1 = 1
trans = add
; ;
[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
; 
[State 3000, viento Rush - FX]
type = Explod
trigger1 = time=3
anim = 7118
ID = 7118
pos = 60,95
vel =6, 0
sprpriority = 5
removetime = -1
bindtime = -1
ownpal = 1
scale = .5,.5
removeongethit = 1
ontop = 0
supermovetime=0
pausemovetime=0
ignorehitpause  = 1
facing=1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = movecontact || time >= 120
id = 7118

[State 3000, polvo Rush - FX]
type = Explod
triggerall = time <110
trigger1 = time%6=0
anim = 7140
ID = 7140
pos = 75,80
vel = 0, 0
sprpriority = 5
removetime = -2
bindtime = 1
ownpal = 1
scale = .3,.2
removeongethit = 1
ontop = 0
supermovetime = 0;999
ignorehitpause  = 1
facing=-1

[State 0, Explod bigRocks] 
type = Explod
triggerall = time <110
trigger1 = time%5=0
anim = 7145
id = 7145
postype = p1
pos = 90,80
facing = ifelse(random%2,1,-1)
vel = Random/(-120),Random/(-120)
accel = 0,.5
scale = IfElse(Random <= 499,.17,.07),IfElse(Random <= 499,.17,.07)
sprpriority = ifelse(random%2,3,ifelse(random%2,27,ifelse(random%2,25,ifelse(random%2,10,-1))))
pausemovetime = 0;9999
supermovetime = 0;9999
removeongethit = 1

[State 0, Explod smallRocks] 
type = Explod
trigger1 = time>0
anim = 7145
id = 7145
postype = p1
pos = 35,0
facing = ifelse(random%2,1,-1)
vel = Random/(-120),Random/(-120)
accel = 0,.5
scale = IfElse(Random <= 499,.02,.01),IfElse(Random <= 499,.02,.01)
sprpriority = ifelse(random%2,3,ifelse(random%2,27,ifelse(random%2,25,ifelse(random%2,10,-1))))
pausemovetime = 0;9999
supermovetime = 0;9999
removeongethit = 1

[State 0,floor]
type = Explod
triggerall = time <90
trigger1 = time%4=0
anim = 7144
ID = 7144
pos = 70,78
postype = p1
bindtime = 1
removetime = 90
scale = 0.2,0.2
sprpriority = -2
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, PlaySnd rocks]
type = PlaySnd
trigger1 = time=0
value = S7,4;

[State 0, ChangeState sparkGuard]
type = ChangeState
trigger1 = movecontact = 1 && !movehit
value = 1154
ctrl = 0

[State 0, DestroySelf]
type = DestroySelf
trigger1 = movecontact || time >= 120

;-------------------------------------------------------------------------------
[Statedef 1154,--- spark]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 9997
sprpriority = 5

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 40
freq = 60
ampl = -4
phase = 90
ignorehitpause = 1

[State 40 dust]
type = Explod
trigger1 = !Time
anim = 7105
ID = 7105
pos = 40-10+random%20, 30-10+random%20
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = 30
scale = .9,.9
sprpriority = 10
ownpal = 1
removeongethit = 0

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "HitSpark"
ID = 8001
stateno =ifelse(random>500,8101,8001)
pos = 40-10+random%20, 30-10+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1

[State 0, PlaySnd]
type = PlaySnd
trigger1 =  time=0
value = S7,6

[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;----------------------------------------------------------------
[Statedef 1155,--- helper power]
type = S
movetype = I
physics = S
juggle = 0
ctrl = 0
velset = 0,0
anim = 9999

[State 0, BindToRoot]
type = BindToRoot
trigger1 =Time%5=0
pos = -100+Random%201,-80+Random%161

[State 0, Explod]
type = Explod
trigger1 = Time%5=1
anim = 6018
ID = 6018
vel=((RootDist X)/20.0),((RootDist Y - 25)/20.0)
scale=.5,.5
bindtime = 1
removetime = -2
sprpriority = 2
ownpal = 1

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = 1
ID = 6018
vel=((RootDist X)/20.0),((RootDist Y - 25)/20.0)
RemoveTime = 20

[State 0, DestroySelf]
type = DestroySelf
trigger1 = Root,StateNO != 1150
;------------------------------------------------------------



;===============================================================================
;===============================================================================
[Statedef 1200, SHISHI SONSON - start]
type = S
physics = S
velset = 0,0
ctrl = 0
anim = 1200
poweradd = 100
sprpriority = 2

[State 0, AllPalFX]
type = BGPalFX
trigger1 = time%3=0
time = 2
add = -50,-50,-50
mul = 256,256,256
color=128

[State 0, Helper]
type = Helper
triggerall = !numhelper(50037) 
trigger1 = time >= 0 & timemod = 15,0
helpertype = normal ;player
name = "AfterImage6Blue"
ID = 50037
stateno = 50037
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
[State 0, Veladd] 
type = Veladd
trigger1 = 1
x = -1.5
[State 0, VelSet]
type = VelSet
trigger1 = vel x < 0.05
x = 0
ignorehitpause = 1
[State 0, VelSet]
type = VelSet
trigger1 = 1
y = 0
ignorehitpause = 1

[State 200, Viento Rashomon]
type = Explod
trigger1 =  animelem = 2
anim = 7111
ID = 7111
postype = P1
pos = 30,10
facing = -1
sprpriority = 10
removetime = -1
bindtime = 1
ownpal = 1
scale = .33,.33
removeongethit = 1
ontop =0
supermovetime  = 999
ignorehitpause  = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = S4,42

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S3,33

[State -2, varsetCombo]
type = varset
trigger1 =1
var(24) = ifelse(var(23)=1,1,0)
ignorehitpause = 1

[State 1500, off]
type = ChangeState
triggerall= !AIlevel
trigger1 = command != "hold_a" & time <=25
value = 1205

[State 1500, Rashoumon attack]
type = ChangeState
triggerall = !AIlevel
trigger1=command = "hold_a" & time >=25
value = 1201

[State 1500, Rashoumon attack-combo]
type = ChangeState
triggerall = !AIlevel && (prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
trigger1=command = "hold_a" & time >=15
value = 1201

[State 1500, off]
type = ChangeState
triggerall= AIlevel
trigger1 =  p2life = 0
value = 1205

[State 1500, attack]
type = ChangeState
triggerall = AIlevel
trigger1= time >=25
value = 1201


;-------------------------------------------------------------------------------
[Statedef 1201,--- attack]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim =1201

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = [9, 16]
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

[State -3, AfterImage]
type = AfterImage
trigger1 = time =4
time = 30
length = 4
palcolor = 256
palinvertall = 0
palbright = 30,30,30
palcontrast = 120,120,220
palpostbright = 0,0,0
paladd = 10,10,25
palmul = .65,.65,.75
timegap = 1
framegap = 1
trans = add

;------rush---------------
[State 0, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 8;10

[State 0, Trans]
type = Trans
trigger1 = time = [4, 8]
trans = addalpha
alpha = (time-21)*32, 256-(time-21)*32
ignorehitpause=1

[State 0, VelSet]
type = VelSet
trigger1 = time = [6, 16]
x = 22;28;34

[State 702, VelAdd]
type = Veladd
trigger1 = time = [6, 16]
x = 0.6

[State 2750, PlayerPush]
type = PlayerPush
trigger1 = time = [9, 16]
value = 0
ignorehitpause = 1

[State 702, VelAdd]
type = Veladd
triggerall = vel x > 0
trigger1 = animelem = 6
x = -0.05
;------rush---------------

[State 200, 1]
type = HitDef
triggerall = hitcount < 1 
trigger1 =  AnimElem = 4 || AnimElem = 5
attr = S, SA
guard.pausetime=4,4
damage = ifelse(var(24)=1,25,50),ifelse(var(24)=1,4,8);8,16)
animtype  = medium;Hard
guardflag = MA
hitflag = MAF
priority = 6, Hit
pausetime = 0, 0;
sparkno = -1
guard.sparkno = -1;s7000
sparkxy = -20,-30
hitsound   = S3,21
guardsound = S3,6
ground.type = low
ground.slidetime = 5
ground.hittime  = 20
ground.velocity = 0, 0
airguard.velocity = -3,-2
air.type =low
air.velocity = 0, 0
air.hittime = 25
fall=0
p2facing = 1
kill=0
envshake.time = 20
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120
p2stateno=5875

[State 0, NotHitBy]
type = NotHitBy
trigger1 = movehit
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-30
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.5,0.5
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8102) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8002
stateno =ifelse(random>500,8102,8002)
pos = 0, -25
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .85
size.yscale = .85

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = -3,-28
postype = p2
facing = -1
sprpriority = IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .7,.7
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

;-------rush-FX-------------
[State 100, Explod]
type = Explod
trigger1 = time=0
anim = 6050
ID = 6050
pos = -20,-5
postype = p1
bindtime = 1
removetime = -2
scale = 0.25,0.25
sprpriority = 4
ownpal = 1

[State 100, Dash]
type = Explod
trigger1 = time=0
anim = 6005
id = 6005
pos = -44,-35
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 100, Dash]
type = Explod
trigger1 = time=0
anim = 6005
id = 6005
pos = -40,-8
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 0, Explod smallRocks] 
type = Explod
trigger1 = time <30
anim = 7145
id = 7145
postype = p1
pos = 35,floor(pos y)
facing = ifelse(random%2,1,-1)
vel = Random/(-120),Random/(-120)
accel = 0,.5
scale = IfElse(Random <= 499,.02,.01),IfElse(Random <= 499,.02,.01)
sprpriority = ifelse(random%2,3,ifelse(random%2,27,ifelse(random%2,25,ifelse(random%2,10,-1))))
pausemovetime = 9999
supermovetime = 9999
removeongethit = 1

[State 3000, Rush - FX]
type = Explod
triggerall = time>5 && time <18
trigger1 = time%1=0
anim = 809
ID = 809
pos = 0,-19
sprpriority = -2
removetime = -2
bindtime = 1
ownpal = 1
scale = 0.9,0.9
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1

[State 3000, polvo Rush - FX]
type = Explod
triggerall = time>5 && time <18
trigger1 = time%1=0
anim = 7140
ID = 7140
pos = 20,floor(pos y)
vel = 0, 0
sprpriority = 4
removetime = -2
bindtime = 1
ownpal = 1
scale = .3,.2
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
facing=-1

[State 0, Explod]
type = Explod
trigger1 = time>5 && time <18
anim = 6019
ID = 6019
pos=0,-20
vel =-3,0
Random=40,40
bindtime = 1
sprpriority = 11
RemoveTime = -2
ownpal = 1
scale = 0.1,.1

[State 0, Explod]
type = Explod
trigger1 = Time<7
anim = 6021
ID = 6021
pos=0,-20
vel =-2,0
Random=40,40
bindtime = 1
sprpriority = -5+Random%11
RemoveTime = -2
ownpal = 1
scale = 0.1+((Random/1500.0)*0.3),0.3*(0.1-Time/10.0)

;-------rush-FX-------------
[State 0, Explod]
type = Explod
trigger1 = movehit = 1  && p2movetype=H
anim = ifelse(random>=500,6182,6183)
ID = 6182
pos = 0,145
postype = front
facing = -facing
bindtime = 1
removetime = -2
scale = .7,.5
sprpriority = 7
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

;***********------"mugshot hit"-----------**********
[State 0, Helper]
type = Helper
triggerall = !numhelper(50004) 
trigger1 = movehit = 1  && p2movetype=H
helpertype = normal ;player
name = "mugshot"
ID = 50004
stateno = 50004
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
;***********------"mugshot hit"-----------**********

[State 0, Helper]
type = Helper
triggerall = !numhelper(1206) 
trigger1 = (movehit = 1  && p2movetype=H)
helpertype = normal
name = "Add"
ID = 1206
stateno =1206
pos = 0,0
postype = p1
facing = 1
ownpal = 1
supermovetime=9999
pausemovetime=9999

[State 0, AfterImageTime]
type = AfterImageTime
trigger1 =animelem=8
time = 0
ignorehitpause = 1
persistent = 1

[State 3000, PlaySnd - Shishi Sonson]
type = PlaySnd
trigger1 = time = 0
value = S2,4

[State 3000, PlaySnd - Shishi Sonson]
type = PlaySnd
trigger1 = time = 0
value = S3,25

[State 0, PlaySnd - Shishi Sonson]
type = PlaySnd
trigger1 = time=34;
value = S4,31
channel = 0

[State 0, changestate-final attack]
type = changestate
triggerall = movehit && p2movetype=H
trigger1 = time>=80;
value = 1202

[State 0, ChangeState-fail]
type = ChangeState
triggerall = time>=30 
trigger1= !movehit 
trigger2= (movehit && !p2movetype=H)
value = 1203


;-------------------------------------------------------------------------------
[StateDef 1202,--- final attack]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 1202

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

[State 0, Helper]
type = Helper
trigger1= time=25
helpertype = normal
name = "slice"
ID = 1204
stateno = 1204
pos = 0, -20
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1

[State 4000, Explod]
type = Explod
trigger1 = animelem = 2
anim = 8506
ID = 8506
pos =6,-15
postype = p1
removetime = -2
scale = .1,.1
ownpal = 1
supermovetime = 9999
pausemovetime=9999
sprpriority = 3
removeOnGetHit = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S3,33
volumescale=300

[State 1210, off]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;-------------------------------------------------------------------------------
[StateDef 1203,--- end fail]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 1203

[State 10, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S3,33

[State 0, changestate]
type = changestate
trigger1 = animtime=0
value = 0
ctrl = 1


;--------------------------------------------------------------------
[Statedef 1204,--- slice]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3603
sprpriority = 3

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

[State 3000, 1]
type = HitDef
trigger1 =time= 0
attr = S, SA
animtype  = Hard
damage    = ifelse(parent,var(24)=1,15,30),0
getpower  = 0
priority = 7, Hit
guardflag =
pausetime = 0,8
sparkno = -1;S6111
guard.sparkno = s7000
sparkxy = -5, -31
hitsound = S1,25
guardsound = S0,8
ground.type = low
ground.slidetime = 30
guard.slidetime = 10
ground.hittime = 30
guard.hittime = 1
air.hittime = 30
ground.velocity = 0, -9
air.velocity = 0, -8
fall = 1
fall.recover=0

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 15
freq = 80
ampl = -6

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S3,22
channel = 4
ignorehitpause=1

[State 0, Helper]
type = Helper
trigger1 = time=0
helpertype = normal
name = "HitSpark"
ID = 8103
stateno = 8103
pos = 5,-35;0,
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale=2
size.yscale=2

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = 7164
ID = 7160
pos = -10,-31
postype = p2
facing = -1
sprpriority = IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .25,.25
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 30010, DestroySelf]
type = DestroySelf
trigger1 = time = 2

;-------------------------------------------------------------------------------
[StateDef 1205,--- end/off]
type = S
movetype= I
physics = S
velset = 0,0
ctrl = 0
anim = 1205
poweradd = 0
sprpriority = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S3,33

[State 10, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 0

[State 0, AfterImageTime]
type = AfterImageTime
trigger1 =time=0
time = 0
ignorehitpause = 1
persistent = 1

[State 1503, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
[Statedef 1206,---fx]
type    = A
movetype = H
physics = N
velset = 0,0
anim = 999
ctrl = 0
sprpriority = 3


[State 0, EnvShake]
type = EnvShake
trigger1 = time>34;
time = 1
freq = 60
ampl = -4

[State 0, VarSet]
type = VarSet
trigger1 = !Time
v = 41
value = 0

[State 0, VarSet]
type = VarSet
trigger1 = Var(41)>=256
v = 41
value = 256

[State 0, VarAdd]
type = VarAdd
trigger1 = time>34 && Var(41)<256
v = 41
value = 4

[State 0, AllPalFX]
type = AllPalFX
trigger1 = time>34
time = 1
color = Var(41)


[State 1650, DestroySelf]
type = DestroySelf
trigger1 =parent,stateno!=1201;
;-------------------------------------------------------------------------------


;===============================================================================
;===============================================================================
[Statedef 1300, NIGORI ZAKE - start]
type = S
movetype = I
physics = S
velset = 0,0
ctrl = 0
anim = 1300
poweradd= 150
sprpriority = 2

;[State 0, SuperPause]
;type = SuperPause
;trigger1 = time=0
;time = 55
;movetime = 55
;anim = -1
;sound = -1
;pos = 0,0
;darken = 0
;p2defmul = 1
;poweradd = 0
;unhittable = 1

[State 0, Pause]
type = Pause
trigger1 = time=0
time = 55
movetime = 55

[State 3000: EnvShake]
type = EnvShake
trigger1 = (AnimElem = 1)
time = 20
freq = 120
ampl = -2
phase = 50

;***********------"mugshot"-----------**********
[State 0, Helper]
type = Helper
triggerall = !numhelper(50003) 
trigger1 = !time
helpertype = normal ;player
name = "mugshot"
ID = 50003
stateno = 50003
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
;***********------"mugshot"-----------*********

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "EX"
ID = 6010
stateno = 6010
pos = -8,-64
postype = p1
facing = 1
ownpal = 1
supermovetime=9999
pausemovetime=9999

[State 0, BGPalFX]
type = BGPalFX
trigger1 = Time > 0
time =1
add = -80,-80,-80

[State 0, Explod]
type = Explod
trigger1 = time=28
anim = 8504
ID = 8504
pos = -9,-64
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -2
supermovetime = 9999
pausemovetime = 9999
sprpriority = 3
ontop = 0
ownpal = 1
removeongethit = 1
scale = .75,.75

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=28
value = S8,6

[State 1330, PlaySnd]
type = PlaySnd
trigger1 = TIME=14
value = S4,55
channel=0

;espadas
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=10
value = S3,31

[State 1500, attack]
type = ChangeState
triggerall = !AIlevel
trigger1=time >=50
value = 1301

;para la IA
[State 1500, off]
type = ChangeState
triggerall= AIlevel
trigger1 = p2life = 0
value = 1701
ctrl = 0

[State 1500, attack]
type = ChangeState
triggerall = AIlevel
trigger1= time >=50
value = 1301

;-------------------------------------------------------------------------------
[Statedef 1301,--- attack]
type    = S
movetype= A
physics = S
ctrl = 0
velset = 0,0
anim = 1301
sprpriority = 2

[State 0, BGPalFX]
type = BGPalFX
trigger1 = Time > 0
time =1
add = -80,-80,-80

[State 0, PosAdd]
type = PosAdd
triggerall = p2bodydist x <250
trigger1 =  time=10
x = p2bodydist x+5
y =  -18

[State 0, PosAdd]
type = PosAdd
triggerall = p2bodydist x >= 250
trigger1 =  time=10
x = 250
y = -18

[State -3, Helper]
type = Helper
triggerall =  pos Y >= -10
trigger1 = time=9
helpertype = normal
name = "floor II"
ID = 5643
stateno = 5643
pos = 0,-4
postype = p1
facing = 1
ownpal = 1
supermovetime=9999
pausemovetime=9999
ignorehitpause=1
persistent=0

[State 200, Viento Soru]
type = Explod
trigger1 = time=9
anim = 7121
ID = 7121
postype = P1
pos = 30,-3
facing = 1
sprpriority = 10
removetime = -2
bindtime = 1
ownpal = 1
scale = 1,1
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
;
[State 3000, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = AnimElem = 6
attr = A, SA
animtype  = Hard
damage    = 140,28
getpower  = 0
priority = 5, Hit
guardflag = MA
sparkno = -1;S6111
guard.sparkno = -1;s7000
sparkxy = 0,-30
ground.type = high
hitsound = S3,23
guardsound = S3,25
pausetime = 13,15
guard.pausetime = 6,10
guard.hittime = 25
guard.slidetime = 23
guard.velocity = -15
ground.hittime = 30
air.hittime = 30
ground.slidetime = 30
ground.velocity = -25,-5
air.velocity = -25,-5
fall = 1
p2stateno=5602
yaccel =19
envshake.time = 15
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numexplod(8200) = 0
trigger1 = moveguarded=1 && numenemy
helpertype =normal
name = "sparkGuard"
ID = 8200
stateno = ifelse(random>500,8200,8201)
pos = 20,-53
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
persistent =0

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 3,-33
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .7,.7
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8102) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8002
stateno =ifelse(random>500,8102,8002)
pos = 0, -45
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = 1
size.yscale = 1

[State -3, Helper]
type = Helper
triggerall = Numhelper(1302) = 0
trigger1= movehit=1  && p2movetype=H
helpertype = normal
name = " Wave"
ID = 1302
stateno = 1302
pos = 45,-45;floor(enemy,screenpos x+10*enemy,facing),floor(enemy,pos y-30)
postype = p1;left
facing = 1
ownpal = 1
supermovetime=9999
pausemovetime=9999
ignorehitpause=1
persistent = 0
size.xscale = .5
size.yscale = .5

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 6
anim = 802
ID = 802
pos = 10,-47
postype = p1
bindtime = -1
removetime =-2
scale = .3,.4
sprpriority = 4
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 6
anim = 802
ID = 802
pos = 10,-38
postype = p1
bindtime = -1
removetime =-2
scale = .3,.4
sprpriority = 4
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Time = 0
value = S4,83
channel = 0

;fast
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem= 4
value = S0,0

[State 1000, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 1303
ctrl = 0

;---------------------------------------------------------------------------
[Statedef 1302,--- wave helper]
Type     = A
MoveType = H
Physics  = N
Ctrl     = 0
anim     = 99999
VelSet   = 0,0
sprpriority=3

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 7123
ID = 7123
pos = 0,0
postype = p1  ;p2,front,back,left,right
removetime = -2
scale = 0.4,0.4
sprpriority = 3
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = time = 5
anim = 7124
ID = 7124
pos = 0,0
postype = p1  ;p2,front,back,left,right
removetime = -2
scale = 1,1
sprpriority =3
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = time = 5
anim = 7131
ID = 7131
pos = 0,5
postype = p1  ;p2,front,back,left,right
removetime = -2
scale = 0.4,0.4
sprpriority = 3
ownpal = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

[State 213, Sound]
type = PlaySnd
trigger1 = Time = 0
value = S7,0

[State 0, DestroySelf]
type = DestroySelf
trigger1 = !Animtime


;-------------------------------------------------------------------------------
[Statedef 1303,--- end]
type    = S
movetype = I
physics = S
ctrl = 0
velset = 0,0
anim = 1303
sprpriority = 2

[State 600, End]
type = ChangeState
trigger1 = animtime=0
value = 50
ctrl = 1
;-------------------------------------------------------------------------------



;===============================================================================
;===============================================================================
[Statedef 1400, NIGIRI - start]
type = S
physics = S
velset = 0,0
ctrl = 0
anim =1400
sprpriority = 2

;[State 0, SuperPause]
;type = SuperPause
;trigger1 = time=0
;time = 43
;anim = -1
;sound = -1
;pos = 0,0
;movetime = 43
;darken = 0
;p2defmul = 1
;poweradd = 0
;unhittable = 1

[State 0, Pause]
type = Pause
trigger1 = time=0
time = 43
movetime = 43

[State 3000: EnvShake]
type = EnvShake
trigger1 = (AnimElem = 1)
time = 20
freq = 120
ampl = -2
phase = 50

;***********------"mugshot"-----------**********
[State 0, Helper]
type = Helper
triggerall = !numhelper(50003) 
trigger1 = !time
helpertype = normal ;player
name = "mugshot"
ID = 50003
stateno = 50003
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
;***********------"mugshot"-----------**********

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "EX"
ID = 6010
stateno = 6010
pos = 3,-30
postype = p1
facing = 1
ownpal = 1
supermovetime=9999
pausemovetime=9999

[State 0, BGPalFX]
type = BGPalFX
trigger1 = Time > 0
time =1
add = -80,-80,-80

;espadas
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=5
value = S3,31

[State 210, 2]
type = PlaySnd
trigger1 = time = 0
value = S4,53
channel = 0

[State 1500, attack]
type = ChangeState
triggerall = !AIlevel
trigger1 = time >=40
value = 1401
ctrl = 0

;IA
[State 1500, off]
type = ChangeState
triggerall= AIlevel
trigger1 = p2life = 0
value = 213
ctrl = 0

[State 1500, attack]
type = ChangeState
triggerall = AIlevel
trigger1=time>=40
value = 1401


;-------------------------------------------------------------------------------
[Statedef 1401,--- Combo I]
type    = S
movetype = A
physics = S
poweradd = 0
ctrl = 0
velset = 0,0
anim = 1401
sprpriority = 2

[State -3, AfterImage]
type = AfterImage
trigger1 = time =0
time = 40
length = 5
palcolor = 256
palinvertall = 0
palbright = 30,30,30
palcontrast = 120,120,220
palpostbright = 0,0,0
paladd = 10,10,25
palmul = .65,.65,.75
timegap = 1
framegap = 1
trans = add

[State 0, AllPalFX]
type = BGPalFX
trigger1 = time%3=0
time = 2
add = -50,-50,-50
mul = 256,256,256
color=128

[State 0, PosAdd]
type = velset
trigger1 = time = [9,17]
x = 8

[State 3000, polvo Rush - FX]
type = Explod
triggerall = time >=9 && time <=18
trigger1 = time%6=0
anim = 7140
ID = 7140
pos = 15,0
vel = 0, 0
sprpriority = 3
removetime = -2
bindtime = 1
ownpal = 1
scale = .3,.2
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
facing=-1

[State 100, Explod]
type = Explod
trigger1 = time=10
anim = 6050
ID = 6050
pos = -20,-5
postype = p1
bindtime = 1
removetime = -2
scale = 0.25,0.25
sprpriority = 4
ownpal = 1

[State 100, Dash]
type = Explod
trigger1 = time=10
anim = 6005
id = 6005
pos = -44,-35
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 100, Dash]
type = Explod
trigger1 = time=10
anim = 6005
id = 6005
pos = -40,-8
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 230, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = animelem = 4 || animelem = 5
attr = S, SA
animtype  = Medium
damage    = 30,5;10
guardflag = MA
pausetime = 10,12
sparkno = -1;s6000
guard.sparkno = -1;s7000
sparkxy = -25,-25
hitsound   = S3,22
guardsound = S3,25
ground.type = Low
ground.slidetime =0;
ground.hittime  = 25
ground.velocity = -4,0
air.velocity = -4,-5.5
fall = 0

envshake.time = 15
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-30
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.5,0.5
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8101) = 0
trigger1 = Movehit = 1 && p2movetype=H
helpertype = normal
name = "HitSpark"
ID = 8101
stateno =ifelse(random>500,8101,8001)
pos = 50-10+random%20, 0-20+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .9
size.yscale = .9

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 3,-30
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .65,.65
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
persistent = 0

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 4
anim = 801
ID = 801
pos = 32,-30
postype = p1
bindtime = -1
removetime =-2
scale = .6,.3
sprpriority = 4
ownpal = 1

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 4
anim = 801
ID = 801
pos = 32,-20
postype = p1
bindtime = -1
removetime =-2
scale = .6,.3
sprpriority = 4
ownpal = 1

[State 210, 2]
type = PlaySnd
trigger1 = animelem = 4
value = S3,20
; 
[State 600, Nigiri Combo II]
type = ChangeState
trigger1 = time=22 
value = 1402
ctrl = 0


;-------------------------------------------------------------------------------
[Statedef 1402,--- Combo II]
type    = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 1402
sprpriority = 2

[State -3, AfterImage]
type = AfterImage
trigger1 = time =0
time = 40
length = 5
palcolor = 256
palinvertall = 0
palbright = 30,30,30
palcontrast = 120,120,220
palpostbright = 0,0,0
paladd = 10,10,25
palmul = .65,.65,.75
timegap = 1
framegap = 1
trans = add

[State 0, AllPalFX]
type = BGPalFX
trigger1 = time%3=0
time = 2
add = -50,-50,-50
mul = 256,256,256
color=128

[State 0, velset]
type = velset
trigger1 = time = [7,15]
x = 3

[State 211, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = animelem = 4 || animelem = 5
attr = S, SA
animtype  = Medium
damage    = 30,5;10
guardflag = MA
pausetime = 8,10
sparkno = -1;s6000
guard.sparkno = -1;s7000
sparkxy = -20,-25
hitsound   = S3,21
guardsound = S3,25
ground.type = low
ground.slidetime = 12
ground.hittime  = 25
ground.velocity = -4,0
air.velocity = -2.5,-4
kill=0

envshake.time = 15
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-33
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.5,0.5
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8101) = 0
trigger1 = Movehit = 1 && p2movetype=H
helpertype = normal
name = "HitSpark"
ID = 8101
stateno =ifelse(random>500,8101,8001)
pos = 50-10+random%20, 0-30+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .9
size.yscale = .9

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 3,-30
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .65,.65
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
persistent = 0

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 4
anim = 801
ID = 801
pos = 50,-15
postype = p1
bindtime = -1
removetime =-2
scale = .7,.4
sprpriority = 4
ownpal = 1

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 4
anim = 801
ID = 801
pos = 32,-8
postype = p1
bindtime = -1
removetime =-2
scale = .7,.35
sprpriority = 4
ownpal = 1

[State 210, 2]
type = PlaySnd
trigger1 = animelem = 4
value = S3,20

[State Change,Nigiri Combo III]
type = ChangeState
trigger1 = time=24
value = 1403
ctrl = 0

;-------------------------------------------------------------------------------
[Statedef 1403,--- Combo III]
type = A
movetype = A
physics = N
anim = 1403
velset = 0,0
ctrl = 0

[State -3, AfterImage]
type = AfterImage
trigger1 = time =0
time = 40
length = 5
palcolor = 256
palinvertall = 0
palbright = 30,30,30
palcontrast = 120,120,220
palpostbright = 0,0,0
paladd = 10,10,25
palmul = .65,.65,.75
timegap = 1
framegap = 1
trans = add

[State 0, AllPalFX]
type = BGPalFX
trigger1 = time%3=0
time = 2
add = -50,-50,-50
mul = 256,256,256
color=128

[State 0, VelSet]
type = VelSet
trigger1 = time =[13,24]
x = ifelse(movecontact,15,5)
y = 0
ignorehitpause = 1

[State 211, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = animelem = 4 || animelem = 5 || animelem = 6
attr = S, SA
animtype  = Medium
damage    = 30,3;10
guardflag = MA
pausetime = 8,10
sparkno = -1;s6000
guard.sparkno = -1;s7000
sparkxy = -20,-25
hitsound   = S3,21
guardsound = S3,25
ground.type =high
ground.slidetime = 12
ground.hittime  = 30
ground.velocity = -4,0
air.velocity = -2.5,-4
kill=0

envshake.time = 15
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-30
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.5,0.5
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 1
persistent = 1

[State 0, Helper]
type = Helper
triggerall = Numhelper(8101) = 0
trigger1 = Movehit = 1 && p2movetype=H
helpertype = normal
name = "HitSpark"
ID = 8101
stateno =ifelse(random>500,8101,8001)
pos = 30-10+random%20, 0-30+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .9
size.yscale = .9

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 3,-25
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .65,.65
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
persistent = 0

[State 1000: helper rush]
type = Helper
trigger1 = animelem = 4
helpertype = Normal
id = 1408
pos = 0,0
postype = p1
facing = 1
stateno	= 1408
keyctrl	= 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = 1
size.yscale = 1

[State 100, Dash]
type = Explod
trigger1 = animelem=4
anim = 6005
id = 6005
pos = -44,-38
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 100, Dash]
type = Explod
trigger1 = animelem=4
anim = 6005
id = 6005
pos = -40,-11
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 210, 2]
type = PlaySnd
trigger1 = Time = 5
value = S4,15
channel=0;;

;.....................................
;--------------combo------------------
;.....................................
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000  && life < 300
trigger1 = command = "Ashura Makyuusen"
trigger1 = time > 25
value = 3800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000
trigger1 = command = "Daisen Sekai"
trigger1 = time > 25
value = 3000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3500
trigger1 = command = "Daishinkan"
trigger1 = time > 25
value = 3710
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Rokudou no Tsuji"
trigger1 = time > 25
value = 3510
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Ashura Ichibugin"
trigger1 = time > 25
value = 3100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Kokujou Tatsumaki"
trigger1 = time > 25
value = 3200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Rengoku Onigiri"
trigger1 = time > 25 
value = 3410
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Shi-Shishi Sonson"
trigger1 = time > 25 
value = 3600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2000
trigger1 = command = "Hiryuu Kaen"
trigger1 = time > 25
value = 3310
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Dai Butsu Giri"
trigger1 = time > 25
value = 1900
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Ushi Bari"
trigger1 = time > 25
value = 1600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Hyou Kin Dama" 
trigger1 = time > 25
value = 1800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Nigori Zake" 
trigger1 = time > 25
value = 1300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 2000 
trigger1 = command = "1080 Pound Hou"
trigger1 = time > 25
value = 2400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Ultra Tora Gari" 
trigger1 = time > 25
value = 2300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500
trigger1 = command = "Tatsumaki"
trigger1 = time > 25
value = 2000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command =  "108 Pound Hou"
trigger1 = time > 25
value = 1150
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 1000
trigger1 = command = "onigiri"
trigger1 = time > 25
value = 1700
ctrl = 0

[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Nigiri Combo"
trigger1 = time > 25
value = 1400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500 
trigger1 = command = "72 Pound Hou"
trigger1 = time > 25
value = 1140
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 800
trigger1 = command = "Rashoumon"
trigger1 = time > 25
value = 1500
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "360 Pound Hou"
trigger1 = time > 25
value = 1100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 500
trigger1 = command = "Shishi Sonson"
trigger1 = time > 25
value = 1200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 300 
trigger1 = command = "Yakkoudori"
trigger1 = time > 25
value = 1000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Yasha Karasu"
trigger1 = time > 25
value = 2202
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Gazami Dori"
trigger1 = time > 25
value = 2100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel  
trigger1 = command = "Maguma"
trigger1 = time > 25
value = 214
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Needle"
trigger1 = time > 25
value = 205
ctrl = 0
[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = movehit && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 30
value = 263
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel
trigger1 = command = "a"
trigger1 = time > 25
value = 200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel
trigger1 = command = "b"
trigger1 = time > 25
value = 210
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel
trigger1 = command = "c"
trigger1 = time > 25
value = 220
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel
trigger1 = command = "x"
trigger1 = time > 25
value = 224
ctrl = 0

[State Change,Nigiri Combo IV]
type = ChangeState
triggerall = !AIlevel
triggerall = movecontact
trigger1 = command = "up" && time>=25
value = 1404
ctrl = 0

[State 211, off]
triggerall= !AIlevel || AIlevel ||  p2life = 0
type = ChangeState
trigger1 = time>=39
value = 1406
ctrl = 0

;IA
[State Change,Nigiri Combo IV]
type = ChangeState
triggerall = AIlevel
triggerall=movecontact
trigger1 =time=30
value = 1404
ctrl = 0



;-------------------------------------------------------------------------------
[Statedef 1404,--- Combo IV]
type = A
movetype = A
physics = N
anim = 1404
velset = 0,0
ctrl = 0

[State 0, AllPalFX]
type = BGPalFX
trigger1 = time%3=0
time = 2
add = -50,-50,-50
mul = 256,256,256
color=128

[State -3, AfterImage]
type = AfterImage
trigger1 = time =0
time = 40
length = 5
palcolor = 256
palinvertall = 0
palbright = 30,30,30
palcontrast = 120,120,220
palpostbright = 0,0,0
paladd = 10,10,25
palmul = .65,.65,.75
timegap = 1
framegap = 1
trans = add

[State 1100, 2]
type = VelSet
trigger1 = Time = 11
X = 1
Y = -14

[State 1100, 3]
type = VelAdd
trigger1 = Time >= 11
Y = .4

[State 211, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 =  animelem = 4
attr = A, SA
damage    = 30,10
guardflag =
animtype= up
priority = 3
pausetime = 8,7
sparkno = -1
sparkxy = -25,-40
guard.sparkno = -1;s7000
hitsound   = S3,2
guardsound = S3,13
ground.type = High
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = -1, -10
air.velocity = -2,-4 
guard.velocity = -7
airguard.velocity =-2.,-6.5
air.hittime = 30
Fall = 1
kill=0
fall.recover=0

envshake.time = 15
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8101) = 0
trigger1 = Movehit = 1 && p2movetype=H
helpertype = normal
name = "HitSpark"
ID = 8101
stateno =ifelse(random>500,8101,8001)
pos = 20-10+random%20, 0-40+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .9
size.yscale = .9

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 6,-35
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .65,.65
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
persistent = 0

[State 60, corte FX]
type = Explod
trigger1 = AnimElem = 4 || AnimElem = 6
anim = 813
ID =  813
pos = 9,-3
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
supermovetime = 0
pausemovetime = 0
scale = .9,.9
sprpriority = 1
ownpal = 1
removeongethit = 0
ignorehitpause = 1
persistent = 1

[State 60, corte FX]
type = Explod
trigger1 = AnimElem = 4 || AnimElem = 6
anim = 813
ID =  813
pos = 17,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
supermovetime = 0
pausemovetime = 0
scale = .9,.9
sprpriority = 4
ownpal = 1
removeongethit = 0
ignorehitpause = 1
persistent = 1

[State 3250: helper camara lenta]
type = Helper
triggerall = Numhelper(999) < 1
triggerall = p2movetype=H
trigger1 = time=[27,45]
helpertype = Normal
id = 999
pos = 0,0
postype	= p1
facing = 1
stateno	= 999
keyctrl	= 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = 1
size.yscale = 1

[State 1100, 1]
type = PlaySnd
trigger1 = time = 11
value = S2,0
channel=7

[State 210, 2]
type = PlaySnd
trigger1 =time=10
value = S4,56
channel=0

[State 600, Nigiri Combo V]
type = ChangeState
triggerall = !AIlevel
trigger1 =Command = "hold_b" &&  time>=33
value = 1405
ctrl = 0

[State 1100, off]
type = Changestate
triggerall= !AIlevel ||  p2life = 0
trigger1 = Time >= 45
value = 241
ctrl = 0

;IA
[State 600, Nigiri Combo V]
type = ChangeState
triggerall = AIlevel
trigger1=time>=33
value = 1405
ctrl = 0

[State 1100, off]
type = Changestate
triggerall= AIlevel
triggerall = time>=32
trigger1 =p2bodydist y >80
value = 241
ctrl = 0


;-------------------------------------------------------------------------------
[Statedef 1405,--- Combo V]
type = A
movetype = A
physics = A
ctrl = 0
anim = 1405

[State -3, AfterImage]
type = AfterImage
trigger1 = time =0
time = 40
length = 5
palcolor = 256
palinvertall = 0
palbright = 30,30,30
palcontrast = 120,120,220
palpostbright = 0,0,0
paladd = 10,10,25
palmul = .65,.65,.75
timegap = 1
framegap = 1
trans = add

[State 0, AllPalFX]
type = BGPalFX
trigger1 = time%3=0
time = 2
add = -50,-50,-50
mul = 256,256,256
color=128

[State 1330, VelMul]
type = Velset
trigger1 = Time = 0
x = ifelse(vel x < 0, -1, 1)
y = 0

[State 1330, 1]
type = HitDef
Triggerall = hitcount < 1
trigger1 = AnimElem = 5
attr = A, SA
air.animtype=diagUp
damage    = 70,10
pausetime = 25,20
sparkno = -1
guard.sparkno = -1;s7000
sparkxy = 0,-40
hitsound   = S3,23
guardsound = S3,25
ground.type = High
air.type=high
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -6,6
air.velocity = -10,15
yaccel =25
down.bounce =1
p2stateNo=5630

envshake.time = 15
envshake.ampl = 5
envshake.freq = 130
envshake.phase = 130

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8103) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8103
stateno = ifelse(random>500,8103,8003)
pos = 35,0; 
postype = p1
facing = 1
ownpal = 1
supermovetime=9999
pausemovetime=9999
ignorehitpause=1

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 6,-30
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .75,.75
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
persistent = 0

[State 60, corte FX]
type = Explod
trigger1 = AnimElem = 5
anim = 804
ID =  804
pos = 25,-10
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
supermovetime = 0
pausemovetime = 0
scale = .9,.7
sprpriority = 4
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 60, corte FX]
type = Explod
trigger1 = AnimElem = 5
anim = 804
ID =  804
pos = 20,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
supermovetime = 0
pausemovetime = 0
scale = .9,.7
sprpriority = 5
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = AnimElem = 1
anim = 8504
ID = 8504
pos = -14,-58
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -2
supermovetime = 0
pausemovetime = 0
sprpriority = 5
ontop = 0
ownpal = 1
removeongethit = 1
scale=.7,.7

[State 1330, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S8,6

[State 1330, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S4,59
channel=0

[State 1100, end]
type = Changestate
trigger1 = animtime=0
value = 241
ctrl = 0

;-------------------------------------------------------------------------------
[Statedef 1406,--- end]
type = A
movetype = A
physics = N
ctrl = 0
anim = 1406

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime=0
value = 213
ctrl = 0


;-------------------------------------------------------------------------------
[Statedef 1408,--- helper]
type = S
movetype = A
physics = S
ctrl = 0
anim =809;
sprpriority = 4

[State 0, Trans]
type = Trans
trigger1 = 1
trans = add
;
[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 6
y = 0

[State 3000, polvo Rush - FX]
type = Explod
triggerall = time <30
trigger1 = time%5=0
anim = 7140
ID = 7140
pos = 21,0
vel = 0, 0
sprpriority = 3
removetime = -2
bindtime = 1
ownpal = 1
scale = .3,.2
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
facing=-1

[State 0, Helper]
type = Helper
triggerall = time <30
trigger1 = time%3=0
helpertype = normal
name = "HitSpark"
ID = 8106
stateno = 8106
pos = 0,-floor(pos y)
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .3
size.yscale = .3

[State 211, 2]
type = PlaySnd
triggerall = time <30
trigger1 = time%3=0
value = S3,0

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time=30 || parent,stateNo!= 1403
;---------------------------------------------------------------



;===============================================================================
;===============================================================================
[Statedef 1500, RASHOMON - start]
type = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 1500
sprpriority = 2

[State 0, AllPalFX]
type = BGPalFX
trigger1 = time%3=0
time = 2
add = -50,-50,-50
mul = 256,256,256
color=128

[State 0, Helper]
type = Helper
triggerall = !numhelper(50037) 
trigger1 = time >= 0 & timemod = 15,0
helpertype = normal ;player
name = "AfterImage6Blue"
ID = 50037
stateno = 50037
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 0, Veladd] 
type = Veladd
trigger1 = 1
x = -1.5
[State 0, VelSet]
type = VelSet
trigger1 = vel x < 0.05
x = 0
ignorehitpause = 1
[State 0, VelSet]
type = VelSet
trigger1 = 1
y = 0
ignorehitpause = 1

[State -1]
Type = AfterImage
Trigger1 = animelem = 3
Time = -1
Trans = Add
Length = 16
TimeGap = 1
FrameGap = 4
PalBright = 0 , 0 , 0
PalContrast = 240 , 240 , 0
PalAdd = 0 , 0 , 0
PalMul = .75 , .75 , 1

[State 200, Viento Rashomon]
type = Explod
trigger1 =  animelem = 2
anim = 7111
ID = 71111
postype = P1
pos = 30,10
facing = -1
sprpriority = 10
removetime = -1
bindtime = 1
ownpal = 1
scale = .33,.33
removeongethit = 1
ontop =0
supermovetime 	= 999
ignorehitpause  = 1

[State -2, varsetCombo]
type = varset
trigger1 =1
var(24) = ifelse(var(23)=1,1,0)
ignorehitpause = 1

[State 0, PlaySnd - Rashomon Eff]
type = PlaySnd
triggerall = !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
trigger1 = time = 0
value = S4,58
channel=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=45;55
value = S3,31

[State 0, PlaySnd - Rashomon]
type = PlaySnd
trigger1 = time=ifelse((prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263),15,50)
value = S4,54
channel=0

[State 1500, off]
type = ChangeState
triggerall= !AIlevel
trigger1 = command != "hold_b" & time <=50
value = 1502

[State 1500, Rashoumon attack]
type = ChangeState
triggerall = !AIlevel
trigger1=command = "hold_b" & time >=50
value = 1501

[State 1500, Rashoumon attack-combo]
type = ChangeState
triggerall = !AIlevel && (prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
trigger1=command = "hold_b" & time >=15
value = 1501

;para la IA
[State 1500, Rashoumon attack-combo]
type = ChangeState
triggerall = AIlevel && (prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
trigger1=time >=15
value = 1501

[State 1500, off]
type = ChangeState
triggerall= AIlevel
trigger1 =  p2life = 0
value = 1502

[State 1500, attack]
type = ChangeState
triggerall = AIlevel
trigger1= time >=50
value = 1501

;-------------------------------------------------------------------------------
[Statedef 1501,--- attack]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 1501
poweradd = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = [9, 16]
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

;------rush---------------
[State 0, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 8;10

[State 0, Trans]
type = Trans
trigger1 = time = [4, 8]
trans = addalpha
alpha = (time-21)*32, 256-(time-21)*32
ignorehitpause=1

[State 0, VelSet]
type = VelSet
trigger1 = time = [6, 16]
x = 22;28;34

[State 702, VelAdd]
type = Veladd
trigger1 = time = [6, 16]
x = 0.6

[State 2750, PlayerPush]
type = PlayerPush
trigger1 = time = [9, 16]
value = 0
ignorehitpause = 1

[State 702, VelAdd]
type = Veladd
triggerall = vel x > 0
trigger1 = animelem = 6
x = -0.05
;------rush---------------


[State 210, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = AnimElem = 4 || AnimElem = 5
attr = S, SA
animtype  = hard
damage    = ifelse(var(24)=1,70,140),ifelse(var(24)=1,7,14);14,28)
guardflag = MA
hitflag = MAF
pausetime = 0,25
guard.pausetime = 0,10
sparkno = -1
guard.sparkno = -1;s7000
sparkxy = -20,-30
hitsound   = S3,15
guardsound = S3,13
ground.type = low
ground.slidetime = 12
ground.hittime  = 20
ground.velocity = 0,0
air.velocity = 0,0
fall = 1
p2stateno=5860
fall.recover=0

envshake.time = 20
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120


[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = movehit
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-28
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.5,0.5
removeongethit = 1
ontop = 0
supermovetime = 9999
pausemovetime = 9999
ignorehitpause  = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8103) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8003
stateno =ifelse(random>500,8103,8003)
pos = 0, -25
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .85
size.yscale = .85

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = -3,-28
postype = p2
facing = -1
sprpriority = IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .7,.7
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

;;-------rush-FX-------------
[State 100, Explod]
type = Explod
trigger1 = time=0
anim = 6050
ID = 6050
pos = -20,-5
postype = p1
bindtime = 1
removetime = -2
scale = 0.25,0.25
sprpriority = 4
ownpal = 1

[State 100, Dash]
type = Explod
trigger1 = time=0
anim = 6005
id = 6005
pos = -44,-35
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 100, Dash]
type = Explod
trigger1 = time=0
anim = 6005
id = 6005
pos = -40,-8
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 0, Explod smallRocks] 
type = Explod
trigger1 = time <30
anim = 7145
id = 7145
postype = p1
pos = 35,floor(pos y)
facing = ifelse(random%2,1,-1)
vel = Random/(-120),Random/(-120)
accel = 0,.5
scale = IfElse(Random <= 499,.02,.01),IfElse(Random <= 499,.02,.01)
sprpriority = ifelse(random%2,3,ifelse(random%2,27,ifelse(random%2,25,ifelse(random%2,10,-1))))
pausemovetime = 9999
supermovetime = 9999
removeongethit = 1

[State 3000, polvo Rush - FX]
type = Explod
triggerall = time>5 && time < 18
trigger1 = time%1=0
anim = 7140
ID = 7140
pos = 20,floor(pos y)
vel = 0, 0
sprpriority = 4
removetime = -2
bindtime = 1
ownpal = 1
scale = .3,.2
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
facing=-1

[State 3000, Rush - FX]
type = Explod
triggerall = time>5 && time < 18
trigger1 = time%1=0
anim = 809
ID = 809
pos = 0,-25
sprpriority = -2
removetime = -2
bindtime = 1
ownpal = 1
scale = 0.9,0.9
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1

[State 0, Explod]
type = Explod
trigger1 = time>5 && time < 18
anim = 6019
ID = 6019
pos=0,-20
vel =-3,0
Random=40,40
bindtime = 1
sprpriority = 11
RemoveTime = -2
ownpal = 1
scale = 0.1,.1

[State 0, Explod]
type = Explod
trigger1 = Time<7
anim = 6021
ID = 6021
pos=0,-20
vel =-2,0
Random=40,40
bindtime = 1
sprpriority = -5+Random%11
RemoveTime = -2
ownpal = 1
scale = 0.1+((Random/1500.0)*0.3),0.3*(0.1-Time/10.0)

;-------rush-FX-------------

[State 0, Explod]
type = Explod
trigger1 = movehit = 1  && p2movetype=H
anim = ifelse(random>=500,6182,6183)
ID = 6182
pos = 0,145
postype = front
facing = -facing
bindtime = 1
removetime = -2
scale = .7,.5
sprpriority = 7
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 0, AfterImageTime]
type = AfterImageTime
trigger1 =animelem=8
time = 0
ignorehitpause = 1
persistent = 1

;***********------"mugshot hit"-----------**********
[State 0, Helper]
type = Helper
triggerall = !numhelper(50004) 
trigger1 = movehit = 1  && p2movetype=H
helpertype = normal ;player
name = "mugshot"
ID = 50004
stateno = 50004
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
;***********------"mugshot hit"-----------**********

[State 0, PlaySnd - Rashomon]
type = PlaySnd
trigger1 = time = 0
value = S2,11

[State 0, PlaySnd - Rashomon]
type = PlaySnd
trigger1 = movehit
value = S2,12
volumescale = 50
persistent=0

[State 200, hit]
type = ChangeState
triggerall = movehit && p2movetype=H
trigger1=time>=80
value = 1502

[State 200, no hit]
type = ChangeState
triggerall = time>=30 
trigger1= !movehit 
trigger2= (movehit && !p2movetype=H)
value = 1502



;-------------------------------------------------------------------------------
[StateDef 1502,--- end/off]
type = S
movetype= I
physics = S
velset = 0,0
ctrl = 0
anim = 1502
poweradd = 0
sprpriority = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S3,33

[State 10, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 0

[State 0, AfterImageTime]
type = AfterImageTime
trigger1 =time=0
time = 0
ignorehitpause = 1
persistent = 1

[State 1503, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;-------------------------------------------------------------------------------
[Statedef 1503,--- fx]
type    = A
movetype = H
physics = N
velset = 0,0
anim = 999
ctrl = 0
sprpriority = 3

[state 6000, BG,Background]
type = BGpalfx
trigger1 = time = 0
add=0,0,0
sinadd = -256,-256,-256, 60
time = 15
invertall = 0
persistent = 0
ignorehitpause = 1
SuperMoveTime = 9999
PauseMoveTime = 9999

[state 6000, BG]
type = BGpalfx
trigger1 = time = 15
add=-256,-256,-256
time = 35
invertall = 0
persistent = 0
ignorehitpause = 1
SuperMoveTime = 9999
PauseMoveTime = 9999

[state 6000, BG]
type = BGpalfx
trigger1 = time = 50
add=-256,-256,-256
sinadd = 256,256,256, 60
time = 15
invertall = 0
persistent = 0
ignorehitpause = 1
SuperMoveTime = 9999
PauseMoveTime = 9999

[State 1650, DestroySelf]
type = DestroySelf
trigger1 = parent,stateno!=1501

;-------------------------------------------------------------------------------



;===============================================================================
;===============================================================================
[Statedef 1600, USHI BARI - start]
type = S
movetype = I
physics = S
anim = 1600
velset = 0,0
ctrl = 0
poweradd= 150
sprpriority = 2

[State 0, SuperPause]
type = SuperPause
trigger1 = time=0
time = 45
anim = -1
sound = -1
pos = 0,0
movetime = 45
darken = 0
p2defmul = 1
poweradd = 0
unhittable = 1

[State 3000:EnvShake]
type = EnvShake
trigger1 = (AnimElem = 1)
time = 20
freq = 120
ampl = -2
phase = 50

;***********------"mugshot"-----------**********
[State 0, Helper]
type = Helper
triggerall = !numhelper(50003) 
trigger1 = !time
helpertype = normal ;player
name = "mugshot"
ID = 50003
stateno = 50003
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
;***********------"mugshot"-----------**********

[State 0, Helper]
type = Helper
trigger1 = time = 0;10
helpertype = normal
name = "EX"
ID = 6010
stateno = 6010
pos = 23,-54
postype = p1
facing = 1
ownpal = 1
supermovetime=9999
pausemovetime=9999

[State 0, BGPalFX]
type = BGPalFX
trigger1 = Time > 34
time =1
add = -80,-80,-80

[State 1100, 1]
type = PlaySnd
trigger1 = time = 0
value = S4,71
channel=0

;espadas
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=18
value = S3,7

[State 1500, attack]
type = ChangeState
trigger1= time >=43
value = 1601

;-------------------------------------------------------------------------------
[Statedef 1601,--- attack]
type = S
movetype = A
physics = S
anim = 1601
ctrl = 0
;juggle  = 1

[State 0, AllPalFX]
type = BGPalFX
trigger1 = time%3=0
time = 2
add = -50,-50,-50
mul = 256,256,256
color=128

[State 1100, 2]
type = VelSet
trigger1 = Time = [0, 5]
x = 7

[State 1100, 3]
type = Velset
trigger1 = Time >= 10
x = 2

[State 1100, 2]
type = HitDef
trigger1 =animelem=  3 || animelem =  8
attr = A, NA
hitflag = MAF
damage = 15, 3
guardflag = HA
priority = 4
pausetime = ifelse(hitcount < 2,5,ifelse(hitcount < 5,3,0)),10
guard.pausetime=2,2
sparkno = -1
sparkxy = -25,-40
guard.sparkno = -1;s7000
hitsound = S3,2
guardsound = S3,6
ground.type = high
animtype = medium
ground.slidetime = 10
ground.hittime  = 30
ground.velocity = -7
air.velocity = -7,0
guard.velocity = -3
airguard.velocity =-3,0
kill=0
p2stateno=  5862
envshake.freq = ifelse(hitcount < 2,30,ifelse(hitcount < 5,40,70))
envshake.phase = ifelse(hitcount < 2,30,ifelse(hitcount < 5,40,70))
envshake.time=15


[State 0, TargetBind]
type = TargetBind
trigger1 = movecontact=1
time = 1
pos = 63,0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded && numenemy;
trigger1 = animelem=  3
anim =4080
ID = 4080
pos = 9,-45
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.3,0.3
removeongethit = 1
ontop = 0
supermovetime = 9999
pausemovetime = 9999
ignorehitpause  = 1
persistent = 1

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4081) = 0
trigger1 = moveguarded && numenemy;
trigger1 = animelem=  8
anim = 4080
ID = 4081
pos = 9,-25
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.3,0.3
removeongethit = 1
ontop = 0
supermovetime = 9999
pausemovetime = 9999
ignorehitpause  = 1
persistent = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = moveguarded
trigger1 = time%15=10
time = 5
freq = 90
ampl = -5
phase = 20
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8001
stateno =ifelse(random>500,8101,8001)
pos = -20+random/25, -28-20+random/25
postype = p2
facing = 1
ownpal = 1
pausemovetime=9999
supermovetime = 9999
ignorehitpause=1
size.xscale = IfElse(Random < 500,.8,1)
size.yscale = IfElse(Random < 500,.8,1)


[State 200, Spark blood]
type = Explod
trigger1 = movehit  && p2movetype=H
trigger1 = target,time=0
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 5-10+random%20, -Random%EnemyNear,Const(size.height);10-40+random%20
postype = p2
facing = IfElse(Random <= 499,1,-1)
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = IfElse(Random <= 499,.6,.7),IfElse(Random <= 499,.6,.7)
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
;persistent = 0

;----rush-FX----------
[State 100, Explod]
type = Explod
trigger1 = !Time
anim = 6050
ID = 6050
pos = 0,-5
postype = p1
bindtime = 1
removetime = -2
scale = 0.25,0.25
sprpriority = 4
ownpal = 1

[State 100, Dash]
type = Explod
trigger1 = !Time
anim = 6005
id = 6005
pos = -44,-47
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 100, Dash]
type = Explod
trigger1 = !Time
anim = 6005
id = 6005
pos = -40,-20
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 60, Cortes multiples]
type = Explod
trigger1=time=2
anim = 815
ID =  815
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 1,1
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
supermovetime=0
pausemovetime=0

[State 100, Explod]
type = Explod
trigger1=animelem=2 || animelem=7
anim = 6050
ID = 6050
pos = -10,floor(pos y)
postype = p1
bindtime = 1
removetime = -2
scale = 0.15,0.15
sprpriority = 4
ownpal = 1

[State 1100, 1]
type = PlaySnd
trigger1 = time = 0
value = S4,91
channel=0

[State 1100, 1]
type = PlaySnd
trigger1 = time = 0
value =S3,11

[State 1100, 1]
type = PlaySnd
trigger1 = animelem = 2 || animelem = 7
value = S3,10

[State 200, attack - 2]
type = ChangeState
triggerall = movecontact
trigger1=time>100
value = ifelse(random<500,1802,1602);;
ctrl = 0

[State 200, off]
type = ChangeState
triggerall = !movecontact
trigger1=time>=50
value = 1804
ctrl = 0
;
;-------------------------------------------------------------------------------
[Statedef 1602,--- remate]
type = S
movetype = A
physics = S
anim = 1602
ctrl = 0

[State 0, PosSet]
type = Posset
trigger1 = time = 0
y = 0

[State 1100, 3]
type = Velset
trigger1 = Time = 0
X = 10

[State 100, Explod]
type = Explod
trigger1 = Animelem = 3
anim = 6050
ID = 6050
pos = -15,-5
postype = p1
bindtime = 1
removetime = -2
scale = 0.25,0.25
sprpriority = 4
ownpal = 1
;
[State 0, PosAdd]
type = PosAdd
trigger1 = Animelem = 4
x =  -3

[State 1100, 2]
type = HitDef
triggerall = hitcount < 1
trigger1 =  animelem = 3
attr = A, NA
damage    = 50, 10
guardflag = HA
priority = 4
pausetime = 12, 12;10,8
sparkno = -1
sparkxy = -25,-40
guard.sparkno = -1;s7000
hitsound   = s3,21
guardsound = s3,25
guard.velocity= -13
guard.slidetime=8
ground.type = high
animtype=hard
ground.slidetime = 1
ground.hittime  = 1
ground.velocity = -2.5, -5.5
air.velocity = -2,-5
airguard.velocity =-2,-5.5
Fall = 1
p2stateno=5604
envshake.time = 50
envshake.freq = 150
envshake.ampl = 3*ifelse(random<500,1,-1)
envshake.phase = 90

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numexplod(8200) = 0
trigger1 = moveguarded=1 && numenemy
helpertype =normal
name = "sparkGuard"
ID = 8200
stateno = ifelse(random>500,8200,8201)
pos = 20,-35
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
persistent =0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8103) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8003
stateno =ifelse(random>500,8103,8003)
pos = -10, -25
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = 1
size.yscale = 1

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 6,-33
postype = p2
facing = 1
sprpriority = IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .8,.8
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 60, Corte FX]
type = Explod
trigger1 = time=12
anim = 807
ID =  807 
pos = 50,-20
postype = p1 
facing = 1
vfacing = 1
bindtime = -1
removetime =-2
supermovetime = 999
pausemovetime = 999
scale = .9,.9
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1100, 1]
type = PlaySnd
trigger1 = animelem=2
value = S3,7

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=2
value = S4,ifelse(random<500,4,21)
channel=0

[State 1100, 1]
type = PlaySnd
trigger1 =animelem=3
value = S3,24

[State 0, PlaySnd]
type = PlaySnd
trigger1 =  animelem=3
value = S3,25

[State 200, hit]
type = ChangeState
trigger1 = movehit
trigger1=time=55
value = 221
ctrl = 0

[State 200, no hit]
type = ChangeState
trigger1 = !movehit
trigger1=time=25
value = 221
ctrl = 0
;-------------------------------------------------------------------------------



;===============================================================================
;===============================================================================
[StateDef 1700, ONIGIRI - Start]
type = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 1700
poweradd = 0
sprpriority = 2

[State 0, Helper]
type = Helper
triggerall = !numhelper(50037) 
trigger1 = 1
helpertype = normal ;player
name = "AfterImage6Blue"
ID = 50037
stateno = 50037
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 0, Veladd] 
type = Veladd
trigger1 = 1
x = -1.5
[State 0, VelSet]
type = VelSet
trigger1 = vel x < 0.05
x = 0
ignorehitpause = 1
[State 0, VelSet]
type = VelSet
trigger1 = 1
y = 0
ignorehitpause = 1

[State 0, AllPalFX]
type = BGPalFX
trigger1 = time%3=0
time = 2
add = -50,-50,-50
mul = 256,256,256
color=128

[State 200, Viento Rashomon]
type = Explod
trigger1 =  animelem = 2
anim = 7111
ID = 711111
postype = P1
pos = 30,10
facing = -1
sprpriority = 10
removetime = -1
bindtime = 1
ownpal = 1
scale = .33,.33
removeongethit = 1
ontop =0
supermovetime 	= 999
ignorehitpause  = 1


;enbima
[State 200, PlaySnd]
type = PlaySnd
trigger1 = time%30=0
value = S8,17
channel= 5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = S3,7

[State 200, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = S4,71
channel= 0

[State -2, varsetCombo]
type = varset
trigger1 =1
var(24) = ifelse(var(23)=1,1,0)
ignorehitpause = 1

;State
[State 900, off]
type = ChangeState
triggerall= !AIlevel
trigger1 = command != "hold_c" && time <= 57
value = 1701

;onigiri I
[State 900, onigiri I]
type = ChangeState
triggerall = !AIlevel
trigger1 = command = "hold_c" && time >=57
value = 1702

[State 900, onigiri Icombo]
type = ChangeState
triggerall = !AIlevel && (prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
trigger1 = command = "hold_c" && time >=15
value = 1702


;IA
[State 900, onigiri Icombo]
type = ChangeState
triggerall = AIlevel && (prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
trigger1 = time >=15
value = 1702

 ;State
[State 900, off]
type = ChangeState
triggerall= AIlevel
trigger1 =  p2life = 0
value = 1701

;onigiri I
[State 900, onigiri I]
type = ChangeState
triggerall = AIlevel
trigger1 = time = 57
value = 1702



;-------------------------------------------------------------------------------
[StateDef 1701,--- Off ]
type = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = 2
anim=1701

[State 0, AfterImageTime]
type = AfterImageTime
trigger1 =time=0
time = 0
ignorehitpause = 1
persistent = 1

[State 10, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S3,33

[State 10, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id = 822

[State 10, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id = 823

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=0
id =  8504

[State 901, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
[Statedef 1702,--- attack]
type = S
movetype = A
physics = S
ctrl = 0
anim = 1702
poweradd = 0

[State 20, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = [9, 16]
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

[State -3, AfterImage]
type = AfterImage
trigger1 = time =4
time = 34
length = 4
palcolor = 256
palinvertall = 0
palbright = 30,30,30
palcontrast = 120,120,220
palpostbright = 0,0,0
paladd = 10,10,25
palmul = .65,.65,.75
timegap = 1
framegap = 1
trans = add

;------rush---------------
[State 0, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 8;10

[State 0, Trans]
type = Trans
trigger1 = time = [4, 8]
trans = addalpha
alpha = (time-21)*32, 256-(time-21)*32
ignorehitpause=1

[State 0, VelSet]
type = VelSet
trigger1 = time = [6, 16]
x = 22;28;34

[State 702, VelAdd]
type = Veladd
trigger1 = time = [6, 16]
x = 0.6

[State 2750, PlayerPush]
type = PlayerPush
trigger1 = time = [9, 16]
value = 0
ignorehitpause = 1

[State 702, VelAdd]
type = Veladd
triggerall = vel x > 0
trigger1 = animelem = 6
x = -0.05
;------rush---------------


[State 903, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 =  AnimElem = 4 || AnimElem = 5
attr = S, SA
animtype  = hard
damage    = ifelse(var(24)=1,80,160),ifelse(var(24)=1,9,18);18,36)
guardflag = MA
pausetime = 0,8
guard.pausetime = 0,10
sparkno = -1
guard.sparkno = -1;s7000
sparkxy = 0,-40
hitsound   = S3,27
guardsound = S3,25
ground.type = low
ground.slidetime = 10
ground.hittime  = 15
ground.velocity = 5,-9;
guard.velocity = -3
air.velocity = 5,-9
envshake.freq = 150
envshake.time = 80
fall = 1
p2stateno= 5800;
fall.damage = ifelse(var(24)=1,10,20)
fall.recover=0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-35
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.7,0.7
removeongethit = 1
ontop = 0
supermovetime = 9999
pausemovetime = 9999
ignorehitpause  = 1
persistent = 0

[State 5100, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 0, NotHitBy]
type = NotHitBy
trigger1 = movehit
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

[State 0, Helper]
type = Helper
triggerall = Numhelper(8103) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8003
stateno =ifelse(random>500,8103,8003)
pos = 0, -40
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .9
size.yscale = .9

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = -3,-28
postype = p2
facing = -1
sprpriority = IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .7,.7
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0


;;-------rush-FX-------------
[State 100, Explod]
type = Explod
trigger1 = time=0
anim = 6050
ID = 6050
pos = -20,-5
postype = p1
bindtime = 1
removetime = -2
scale = 0.25,0.25
sprpriority = 4
ownpal = 1

[State 100, Dash]
type = Explod
trigger1 = time=0
anim = 6005
id = 6005
pos = -44,-35
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 100, Dash]
type = Explod
trigger1 = time=0
anim = 6005
id = 6005
pos = -40,-8
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 0, Explod smallRocks] 
type = Explod
trigger1 = time <30
anim = 7145
id = 7145
postype = p1
pos = 35,floor(pos y)
facing = ifelse(random%2,1,-1)
vel = Random/(-120),Random/(-120)
accel = 0,.5
scale = IfElse(Random <= 499,.02,.01),IfElse(Random <= 499,.02,.01)
sprpriority = ifelse(random%2,3,ifelse(random%2,27,ifelse(random%2,25,ifelse(random%2,10,-1))))
pausemovetime = 9999
supermovetime = 9999
removeongethit = 1

[State 3000, polvo Rush - FX]
type = Explod
triggerall = time>5 && time < 18;
trigger1 = time%1=0
anim = 7140
ID = 7140
pos = 20,floor(pos y)
vel = 0, 0
sprpriority = 4
removetime = -2
bindtime = 1
ownpal = 1
scale = .3,.2
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
facing=-1

[State 3000, Rush - FX]
type = Explod
triggerall = time>5 && time < 18
trigger1 = time%1=0
anim = 809
ID = 809
pos = 0,-25
sprpriority = -2
removetime = -2
bindtime = 1
ownpal = 1
scale = 0.9,0.9
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1

[State 0, Explod]
type = Explod
trigger1 = time>5 && time < 18
anim = 6019
ID = 6019
pos=0,-20
vel =-3,0
Random=40,40
bindtime = 1
sprpriority = 11
RemoveTime = -2
ownpal = 1
scale = 0.1,.1

[State 0, Explod]
type = Explod
trigger1 = Time<7
anim = 6021
ID = 6021
pos=0,-20
vel =-2,0
Random=40,40
bindtime = 1
sprpriority = -5+Random%11
RemoveTime = -2
ownpal = 1
scale = 0.1+((Random/1500.0)*0.3),0.3*(0.1-Time/10.0)
;-------rush-FX-------------

[State 60, Corte FX]
type = Explod
trigger1 = animelem=5
anim = 807
ID =  807 
pos = 50,-50 
postype = p1  
facing = 1
vfacing = 1
bindtime = -1
removetime =-2
supermovetime = 9999
pausemovetime = 9999
scale = .9,.9
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = movehit = 1  && p2movetype=H
anim = ifelse(random>=500,6182,6183)
ID = 6182
pos = 0,145
postype = front
facing = -facing
bindtime = 1
removetime = -2
scale = .7,.5
sprpriority = 7
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 0, AfterImageTime]
type = AfterImageTime
trigger1 =animelem=8
time = 0
ignorehitpause = 1
persistent = 1

;***********------"mugshot hit"-----------**********
[State 0, Helper]
type = Helper
triggerall = !numhelper(50004) 
trigger1 = movehit = 1  && p2movetype=H
helpertype = normal ;player
name = "mugshot"
ID = 50004
stateno = 50004
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
;***********------"mugshot hit"-----------**********

[State 3000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S2,18
;onigiri---
[State 3000, PlaySnd]
type = PlaySnd
trigger1 = time = 6
value = S4,80
channel=0

[State 3000, PlaySnd]
type = PlaySnd
trigger1 = time=6
value = S3,23

[State 200, hit]
type = ChangeState
triggerall = movehit && p2movetype=H
trigger1 = time>=80
value = 1701

[State 200, no hit]
type = ChangeState
triggerall = time>=30 
trigger1= !movehit 
trigger2= (movehit && !p2movetype=H)
value = 1804
;-------------------------------------------------------------------------------



;===============================================================================
;===============================================================================
[StateDef 1800, HYOU KIN DAMA - start]
type = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 1800
poweradd = 0
sprpriority = 2

[State 0, SuperPause]
type = SuperPause
trigger1 = time=0
time = 45
anim = -1
sound = -1
pos = 0,0
movetime = 45
darken = 0
p2defmul = 1
poweradd = 0
unhittable = 1

[State 3000:EnvShake]
type = EnvShake
trigger1 = (AnimElem = 1)
time = 20
freq = 120
ampl = -2
phase = 50

;***********------"mugshot"-----------**********
[State 0, Helper]
type = Helper
triggerall = !numhelper(50003) 
trigger1 = !time
helpertype = normal ;player
name = "mugshot"
ID = 50003
stateno = 50003
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
;***********------"mugshot"-----------*********

[State 0, Helper]
type = Helper
trigger1 = time = 0;
helpertype = normal
name = "EX"
ID = 6010
stateno = 6010
pos = 13,-18
postype = p1
facing = 1
ownpal = 1
supermovetime=9999
pausemovetime=9999

[State 0, BGPalFX]
type = BGPalFX
trigger1 = Time > 34
time =1
add = -80,-80,-80

[State 1100, 1]
type = PlaySnd
trigger1 = time = 0
value = S4,71
channel=0

;espadas
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=28
value = S3,7;

[State 1500, attack]
type = ChangeState
trigger1= time >=43
value = 1801


;-------------------------------------------------------------------------------
[Statedef 1801,--- attack]
type = A
movetype = A
physics = N
velset =6,0
ctrl = 0
anim = 1801

[State 0, AllPalFX]
type = BGPalFX
trigger1 = time%3=0
time = 2
add = -50,-50,-50
mul = 256,256,256
color=128

[State 0, PosAdd]
type = PosAdd
trigger1 = time = 0
y = -5

[State 210, 1]
type = HitDef
triggerall = hitcount < 10
trigger1 = animelem=1 ||animelem=3||animelem=5 || animelem=7 ||animelem=9||animelem=11 ||animelem=13||animelem=15 || animelem=17 ||animelem=19
attr = A, SA
animtype  = medium
damage    =15,2
guardflag = MA
pausetime =ifelse(hitcount < 2,9,ifelse(hitcount < 5,6,1)),10
guard.pausetime=2,2
sparkno = -1
guard.sparkno = -1;s7000
sparkxy = -20,-30
hitsound   = S3,12
guardsound = S3,25
ground.type = High
ground.slidetime =0
ground.hittime  = 30
ground.velocity =-3,-6
air.velocity = -3,-4
fall = 0
p2stateno=  5862
envshake.freq = ifelse(hitcount < 2,30,ifelse(hitcount < 5,50,90));30
envshake.ampl =  ifelse(hitcount < 2,-4,ifelse(hitcount < 4,-6,ifelse(hitcount <7,-8,-8)))
envshake.time = 15
kill=0
fall.recover=0

[State 0, TargetBind]
type = TargetBind
trigger1 = movecontact=1
time = 1
pos = 5,5

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 5-15+random%20, 10-55+random%20
postype = p2
facing = -1
sprpriority = 21
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.6,0.6
removeongethit = 1
ontop = 0
supermovetime = 9999
pausemovetime = 9999
ignorehitpause  = 1
persistent = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = moveguarded
trigger1 = time%15=10
time = 5
freq = 90
ampl = -6
phase = 20
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8001;8101
stateno =ifelse(random>500,8101,8001)
pos = 5-Random%11,-Random%EnemyNear,Const(size.height);5-10+random%20, -30-10+random%20
postype = p2
facing = 1
ownpal = 1
pausemovetime=9999
supermovetime = 9999
ignorehitpause=1
size.xscale = IfElse(Random < 500,.8,1)
size.yscale = IfElse(Random < 500,.8,1)

[State 200, Spark blood]
type = Explod
trigger1 = movehit  && p2movetype=H
trigger1 = target,time=0
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 5-10+random%20, -Random%EnemyNear,Const(size.height);10-40+random%20
postype = p2
facing = IfElse(Random <= 499,1,-1)
sprpriority = IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = IfElse(Random <= 499,.6,.7),IfElse(Random <= 499,.6,.7)
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
;persistent = 0

;-------rush-FX-------------
[State 100, Explod]
type = Explod
trigger1 = time = 0
anim = 6050
ID = 6050
pos = 0,-5
postype = p1
bindtime = 1
removetime = -2
scale = 0.25,0.25
sprpriority = 4
ownpal = 1

[State 100, Dash]
type = Explod
trigger1 = time = 0
anim = 6005
id = 6005
pos = -44,-47
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 100, Dash]
type = Explod
trigger1 = time = 0
anim = 6005
id = 6005
pos = -40,-20
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 60, Arena Grande atras]
type = Explod
trigger1 = time=0
anim = 7129
ID =  7129
pos = 50,-7
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
supermovetime = 0;9999
pausemovetime =0;9999
scale = .8, .8
sprpriority = 3
ontop = 0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 60, Arena]
type = Explod
triggerall=time<100
trigger1 = time%8 = 0
anim = 7102
ID =  7102
pos = 50,10
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
supermovetime = 0;9999
pausemovetime =0;9999
scale = 0.5, 0.5
sprpriority = 1
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, Explod viento]
type = Explod
trigger1 = time%10 = 0
anim = 7136
ID = 7136
pos =27,5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
supermovetime = 0;9999
pausemovetime = 0;9999
scale = .5,.5
sprpriority = -2
ownpal = 1
removeongethit = 1
ignorehitpause =1

[State 0, Explod smallRocks] 
type = Explod
trigger1 = time>0
anim = 7145
id = 7145
postype = p1
pos = 35,0
facing = ifelse(random%2,1,-1)
vel = Random/(-120),Random/(-120)
accel = 0,.5
scale = IfElse(Random <= 499,.02,.01),IfElse(Random <= 499,.02,.01)
sprpriority = ifelse(random%2,3,ifelse(random%2,27,ifelse(random%2,25,ifelse(random%2,10,-1))))
pausemovetime = 9999
supermovetime = 9999
removeongethit = 1

[State 3000, corte - FX]
type = Explod
triggerall=time<94
trigger1 = time%6 = 0
anim = 804
ID = 804
pos = 10,-10
facing = 1
vfacing = 1
sprpriority = 1
removetime = 20
bindtime = 1
ownpal = 1
scale = 0.3,0.65
removeongethit = 1
ontop = 0
ignorehitpause  = 1
supermovetime = 0;9999
pausemovetime =0;9999
;
[State 3000, corte - FX]
type = Explod
triggerall=time<92
trigger1 = time%6 = 5
anim = 804
ID = 804
pos = 10,-70
facing = -1
vfacing = -1
sprpriority = 20
removetime = 20
bindtime = 1
ownpal = 1
scale = 0.3,0.65
removeongethit = 1
ontop = 0
ignorehitpause  = 1
supermovetime = 0;9999
pausemovetime =0;9999

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = S4,92
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = S0,4

[State 0, PlaySnd]
type = PlaySnd
trigger1= time>0
trigger1 = time%10=0
value = S3,0

[State 210, 2]
type = PlaySnd
trigger1 = time>4
trigger1 = time%10=0
value = S2,2

[State 200, attack - 2]
type = ChangeState
triggerall = movecontact 
trigger1 = animtime=0 
value = ifelse(random<500,1602,1802)
ctrl = 0

[State 200, off]
type = ChangeState
triggerall = !movecontact 
trigger1 =  time>=50 
value = 1804
ctrl = 0

;-------------------------------------------------------------------------------
[Statedef 1802,--- remate]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 1802

[State 0, PosSet]
type = Posset
trigger1 = time = 0
y = 0

[State 100, Explod]
type = Explod
trigger1 = Animelem = 3
anim = 6050
ID = 6050
pos = -10,-5
postype = p1
bindtime = 1
removetime = -2
scale = 0.25,0.25
sprpriority = 4
ownpal = 1

[State 1100, 3]
type = Velset
trigger1 = Animelem = 3
x = 1

[State 1100, 3]
type = Velset
trigger1 = Animelem = 4
x = 0
;
[State 0, PosAdd]
type = PosAdd
trigger1 = Animelem = 5
x =  -3

[State 210, 1]
type = HitDef
trigger1 = AnimElem = 4
attr = S, SA
animtype  = hard
damage    = 50, 10
guardflag = MA
pausetime = 13,13
sparkno = -1
guard.sparkno = -1
sparkxy = -20,-30
hitsound   = S3,23
guardsound = S3,25
guard.velocity= -13
guard.slidetime=8
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -4,-6
air.velocity = -4,-4
fall = 1
p2stateno=5604
envshake.time = 50
envshake.freq = 150
envshake.ampl = 3*ifelse(random<500,1,-1)
envshake.phase = 90

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numexplod(8200) = 0
trigger1 = moveguarded=1 && numenemy
helpertype =normal
name = "sparkGuard"
ID = 8200
stateno = ifelse(random>500,8200,8201)
pos = 20,-35
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
persistent =0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8103) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8003
stateno =ifelse(random>500,8103,8003)
pos = 0, -40
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = 1
size.yscale = 1

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 6,-33
postype = p2
facing = 1
sprpriority = IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .8,.8
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 4
anim = 810
ID = 810
pos = 7,28
postype = p1
bindtime = -1
removetime = -2
scale = .6,.6
sprpriority = 4
ownpal = 1
supermovetime = 0;9999
pausemovetime =0;9999

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=2
value = S4,ifelse(random<500,4,21)
channel=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=4
value = S3,20

[State 1100, 1]
type = PlaySnd
trigger1 =animelem=4
value = S3,24

[State 200, hit]
type = ChangeState
trigger1 = movehit
trigger1=time=60
value = 221
ctrl = 0

[State 200, no hit]
type = ChangeState
trigger1 = !movehit
trigger1=time=25
value = 221
ctrl = 0

;-------------------------------------------------------------------------------
[Statedef 1804,--- off]
type = A
movetype = A
physics = N
ctrl = 0
anim = 1804

[State 0, PosAdd]
type = Posset
trigger1 = time = 0
y = 0

;-------RUN--------------
[State 0, VelSet]
type = VelSet
triggerall = prevstateno = 1601 || prevstateno = 1801;
trigger1 = time=0
x = 7

[State 0, VelMul]
type = VelMul
triggerall = prevstateno = 1601 || prevstateno = 1801
trigger1 = time > 0
x = 0.85
;-----------------------

[State 101, PlaySnd]
type =  PlaySnd
trigger1 = Animelem = 1
value =S1,4
persistent = 0

[State 101, Dust]
type = Explod
trigger1 = !Time
anim = 8104
sprpriority = 3
postype = p1
pos = 20, 0
vel = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime=0
value = 221
ctrl = 0
;----------------------------------------------------------



;===============================================================================
;===============================================================================
[Statedef 1900, DAI BUTSU GIRI - start]
type    = S
physics = N
velset = 0,0
anim =1902
ctrl = 0
sprpriority = 2


[State 702, off]
type = ChangeState
trigger1 = animtime=0
value = 1902
ctrl = 0

;----------------------------------------------------------
[Statedef 1902,--- jump]
type  = A
movetype = I
physics = C
anim = 41
velset = 0,-13
ctrl = 0
poweradd = 0
juggle = 0
facep2 = 0
hitdefpersist = 0
movehitpersist = 0
hitcountpersist= 0
sprpriority  = 2

[state 60, VelSetFwd]
type = VelSet
trigger1 = command = "holdfwd"
x = 3

[state 60, VelSetBack]
type = VelSet
trigger1 = command = "holdback"
x = -3

[state 60, VelAdd]
type = VelAdd
trigger1 = Time > 10
x  = 0
y  = .40
;---------------

[State -3, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "floor II"
ID = 5643
stateno = 5643
pos = 0,-4
postype = p1
facing = 1
ownpal = 1
supermovetime=9999
pausemovetime=9999
ignorehitpause=1
persistent=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = S4,5
channel=0

[State 60, PlaySnd]
type = PlaySnd
trigger1 =  time = 1
value = S0,5
channel = -1

[State 200, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = S4,71
channel= 0

[State 50, 3]
type = Changeanim
trigger1 = Vel y > -2
trigger1 = SelfAnimExist(anim + 3)
persistent = 0
value =  Anim + 3

[State 50, 30]
type = Changestate
triggerall= !AIlevel
trigger1=command !="hold_c"  && (time > 20 &&  time < 77)
trigger2= time >=77
value = 1903

;for the IA
[state 60, End]
type = ChangeState
triggerall= AIlevel 
trigger1 =  P2bodydist x <= 250 && (time > 20 &&  time < 77)
trigger2= time >=77
value=1903

[State 50, Landing]
type = ChangeState
trigger1 = pos y > -vel y
value = 52


;====================================================
[StateDef 1903,--- attack]
type = A
movetype = A
physics = C
velset = 0,0
ctrl = 0
anim = 1900
poweradd=0

;***********------"mugshot"-----------**********
[State 0, Helper]
type = Helper
triggerall = !numhelper(50003) 
trigger1 = !time
helpertype = normal ;player
name = "mugshot"
ID = 50003
stateno = 50003
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
;***********------"mugshot"-----------*********

[State 0, Helper]
type = Helper
trigger1 = time = 9
helpertype = normal
name = "EX"
ID = 6010
stateno = 6010
pos = 0,-30
postype = p1
facing = 1
ownpal = 1
supermovetime=9999
pausemovetime=9999
ignorehitpause=1

[State 100, SuperPause]
type = SuperPause
trigger1 = time = 9
time = 50
anim = -1
sound = -1
darken = 0
unhittable = 1
p2defmul = 1

[State 3000:EnvShake]
type = EnvShake
trigger1 = (AnimElem = 1)
time = 20
freq = 120
ampl = -2
phase = 50

[State -3, AfterImage]
type = AfterImage
trigger1 = time = 20
time = 80
length = 5
palcolor = 256
palinvertall = 0
palbright = 30,30,30
palcontrast = 120,120,220
palpostbright = 0,0,0
paladd = 10,10,25
palmul = .65,.65,.75
timegap = 1
framegap = 1
trans = add

[State 0, PosSet]
type = PosSet
trigger1 = animelem = 6
y = -120

[State 0, PosSet]
type = PosSet
trigger1 = animelem = 8
y = -90

[State 0, PosSet]
type = PosSet
trigger1 = animelem = 10
y = -60

[State 0, PosSet]
type = PosSet
trigger1 = animelem = 12
y = 0

[State 702, VelSet]
type = VelSet
trigger1 = animelem = 6
trigger2=  animelem = 10
x = 90

[State 702, VelSet]
type = VelSet
trigger1 = animelem = 8
trigger2= animelem = 12
x = -90

;------FX cortes
[State 0, Helper]
type = Helper
triggerall=time%2=0 
trigger1 = time=[20,36]
trigger2 = time=[59,75]
helpertype = normal
name = "Slice"
ID = 40000
stateno = 40000
pos =0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
size.xscale = 1.2
size.yscale = 1.2

[State 702, 1]
type = HitDef
triggerall = hitcount < 4
trigger1 = AnimElem = 6 || AnimElem = 8 ||AnimElem = 10 || AnimElem = 12
attr = A, SA
animtype  = hard
damage    = 90,18
hitflag = MAF
guardflag = MA
pausetime = 2,5
sparkno = -1
guard.sparkno = s7000
sparkxy = -20,-30
hitsound   = S3,21
guardsound = S3,25
ground.type = high
air.Type=high
ground.slidetime = 10
ground.hittime  = 20
air.hittime =  20
ground.velocity = 4,-2
air.velocity = -3,-5
envshake.freq = 150
envshake.time = 70
fall = 1

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numexplod(8200) = 0
trigger1 = moveguarded=1 && numenemy
helpertype =normal
name = "sparkGuard"
ID = 8200
stateno = ifelse(random>500,8200,8201)
pos = 20,-45
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
persistent =0

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = -15,-33
postype = p2
facing = -1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .7,.7
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8101) = 0
trigger1 = Movehit = 1 && p2movetype=H
helpertype = normal
name = "HitSpark"
ID = 8101
stateno =ifelse(random>500,8101,8001)
pos = 20-10+random%20, 0-35+random%20
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6

[State 200, Viento]
type = Explod
trigger1 = AnimElem = 6 ||  AnimElem = 10
anim = 7200
ID = 7200
postype = P1
pos = 0,0
facing = 1
sprpriority = 3
removetime = -2
bindtime = 1
ownpal = 1
scale = 1,1
removeongethit = 1
ontop = 0
supermovetime  = 999
ignorehitpause  = 1

[State 200, Viento]
type = Explod
trigger1 = AnimElem = 8  || AnimElem = 12
anim = 7201
ID = 7201
postype = P1
pos = 0,0
facing = 1
sprpriority = 3
removetime = -2
bindtime = 1
ownpal = 1
scale = 1,1
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=1
value = S4,85
channel=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=8 || animelem=10
value = S4,86

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem= 12
value = S4,87

[State 702, off]
type = ChangeState
trigger1 = animtime=0
value = 221
ctrl = 0

;-------------------------------------------------------------------------------
[Statedef 2000, TATSUMAKI - attack]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 2000
juggle  = 7
poweradd=0
sprpriority = 2

[State 3000: EnvShake]
type = EnvShake
trigger1 = !movehit
trigger1 = AnimElem = 4
time = 20
freq = 120
ampl = -2
phase = 50

[State 3250, Atracción]
type = Helper
triggerall = time > 18
trigger1 = time %10 = 0
helpertype = Normal
name=  "Atracción"
id = 2001
pos = 100,0
postype	= p1
facing = 1
stateno	= 2001
keyctrl	= 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
size.xscale = 1
size.yscale = 1

[State 3250, Atracción]
type = Helper
triggerall = time > 18
trigger1 = time %10 = 0
helpertype = Normal
name=  "Atracción"
id = 2001
pos = -100,0
postype	= p1
facing = -1
stateno	= 2001
keyctrl	= 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
size.xscale = 1
size.yscale = 1

[State 60, Espiral Dragón]
type = Explod
trigger1 = time = 9
anim =824
ID =  824
pos = 0,-75;
accel = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = 0.76,0.76
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
supermovetime = 0;9999
pausemovetime = 0;9999

[State 60, Espiral Dragón]
type = Explod
trigger1 = time = 14
anim = 7126
ID =  7126
pos = 0,5
accel = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = 0.7,1
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
supermovetime = 0;9999
pausemovetime = 0;9999

[State 60, Espiral Dragón]
type = Explod
trigger1 = time = 18
anim = 7126
ID =  7126
pos = 0,-5
accel = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
scale = 0.7,1
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0
supermovetime = 0;9999
pausemovetime = 0;9999

[State -3, Helper]
type = Helper
trigger1 = time = 14
helpertype = normal
name = "floor I"
ID = 5633
stateno = 5633
pos = 0,-3
postype = p1
facing = 1
ownpal = 1
supermovetime =9999
pausemovetime =9999
ignorehitpause =1
persistent=0

[State 0, PalFX]
Type = PalFX
trigger1 = Time > 10 && Time < 38
time = 1
ADD = 0,25+Floor(Sin(Time/15.0*PI)*25),80+Floor(Sin(Time/15.0*PI)*80)

[State 0, Helper]
type = Helper
trigger1 = Time=18
name = "Particles"
stateno = 2002
id=2002
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 3000, 1]
type = HitDef
triggerall = hitcount < 6
trigger1 = movehit=0
trigger2 = movehit>1
attr = S, SA
animtype  = up
damage    = 17,1
getpower  = 0
priority = 5, Hit
guardflag = MA
pausetime =  ifelse(hitcount<1,9,ifelse(hitcount<3 ,6,ifelse(hitcount<5,3,1)))  ,  ifelse(hitcount<1,10,ifelse(hitcount<3,7,ifelse(hitcount<5,4,2)));5,6
guard.pausetime=2,2
sparkno = -1;S6111
guard.sparkno = -1;s7000
sparkxy = 0,-30
hitsound = S3,21
guardsound = S3,25
ground.type = low
ground.slidetime = 30
guard.slidetime = 1
ground.hittime = 30
guard.hittime = 1
air.hittime = 30
fall = 1
ground.velocity = 0,-10.4
air.velocity =-1,-10.4
airguard.velocity = -1.9,-5
air.type = high

envshake.time = 10
envshake.freq =  ifelse(hitcount < 1,15,ifelse(hitcount < 3,30,ifelse(hitcount <5,45,60)))
envshake.ampl =  ifelse(hitcount < 1,-3,ifelse(hitcount < 3,-5,ifelse(hitcount <5,-7,-9)))

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-35
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.7,0.7
removeongethit = 1
ontop = 0
supermovetime = 9999
pausemovetime = 9999
ignorehitpause  = 1
persistent = 1

[State 0, Helper]
type = Helper
trigger1 = movehit=1 && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8101
stateno =ifelse(random>500,8101,8001)
pos = 5-10+random%20, -30-10+random%20
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = IfElse(Random < 500,.7,.9)
size.yscale = IfElse(Random < 500,.7,.9)

[State 200, Spark blood]
type = Explod
trigger1 = movehit  && p2movetype=H
trigger1 = target,time=0
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 5-10+random%20, -40-20+random%20
postype = p2
facing = IfElse(Random <= 499,1,-1);1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = IfElse(Random <= 499,.5,.6),IfElse(Random <= 499,.5,.6)
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
;persistent = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = S4,89
channel=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 4|| Animelem = 6
value = S2,0

[State 200, off]
type = ChangeState
trigger1=animtime=0
value = 221
ctrl = 0

;-------------------------------------------------------------------------------
[Statedef 2001,--- Atracción]
anim = 2001
ctrl= 0
poweradd= 0
juggle	= 0
facep2	= 0
hitdefpersist= 1;
movehitpersist= 1;
hitcountpersist= 1;
sprpriority= 2
velset = -9

[State 3104, playerpush]
type=PlayerPush
trigger1=1
value=1
ignorehitpause=1

[State 0, VelAdd]
type = VelAdd
trigger1 =1
x = -.2
y = 0

[STate 3104: NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3104, DestroySelf]
type = DestroySelf
trigger1 = time=10;
trigger2 = parent, stateno != 2000


;-------------------------------------------------------------------------------
[StateDef 2002,--- particles]
type = S
movetype = I
physics = S
juggle = 4
poweradd = 0
ctrl = 0
velset = 0,0
anim = 9999

[State 0, GeralSet]
type = Null
trigger1 = Var(41):= 0+Random%32
trigger1 = Var(42):= (1+Random%4)*-1
trigger1 = Var(43):= 2+Random%20
trigger1 = Var(44):= Ceil(0+Random%5 * Cond(Random<500,1,-1))

[State 0, Explod]
type = Explod
trigger1 = 1
anim = 6018
postype = p1
pos = Var(41), 0
vel = Var(44), Var(2)
accel = -var(44)*0.025, 0
scale = (Var(43)*0.0125), (Var(43)*0.0125)
Removetime = -2
SprPriority = 15

supermovetime = 9999
pausemovetime = 9999


[State 0, PosSet]
type = PosSet
trigger1 = 1
y = Root, Pos Y - Random%110

[State 0, DestroySelf]
type = DestroySelf
trigger1 = Root,stateno!=2000
trigger2 = NumHelper(2002)>1
;----------------------------------------------------------------------



;===============================================================================
;===============================================================================
[StateDef 2100, GAZAMI DORI - start]
type = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = 2
anim=2100

[State 0, VelSet]
type = VelSet
trigger1 = time=3
x = 20
y = 0

[State 0, NotHitBy]
type = NotHitBy
triggerall = p2stateno!=[3000,4000]
trigger1 =time =[0,18]
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

[State 100, Explod]
type = Explod
trigger1 = !Time
anim = 6050
ID = 6050
pos = -27,-5
postype = p1
bindtime = 1
removetime = -2
scale = 0.25,0.25
sprpriority = 4
ownpal = 1

[State 100, Dash]
type = Explod
trigger1 = !Time
anim = 6005
id = 6005
pos = -44,-35
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 100, Dash]
type = Explod
trigger1 = !Time
anim = 6005
id = 6005
pos = -40,-8
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = S4,15

[State 0, PlaySnd]
type = PlaySnd
trigger1 =  animelem=7
value = S4,97
channel = 0

[State 901, off]
type = ChangeState
trigger1 = AnimTime = 0
value = 2101
ctrl = 0

;-------------------------------------------------------------------------------
[StateDef 2101,--- attack 1]
type =S
movetype= A
physics = S
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = 2
anim=2101

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem= 2
x = ifelse(p2bodydist x > 10,40,0)
y = -10

[State 230, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = animelem = 3
attr = A, SA
animtype  = medium;hard
damage    = 25,5
getpower = 30,15
guardflag = MA
pausetime = 6,7
sparkno = -1;s6000
guard.sparkno = -1;s7000
sparkxy = -25,-25
hitsound   = S3,21
guardsound = S3,16
ground.type = low
ground.slidetime = 100
ground.hittime  = 20
ground.velocity = 0,0
air.velocity = 0,0
fall = 0
envshake.time = 15
envshake.ampl = 5
envshake.freq = 110
envshake.phase = 110

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0
; 
[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-38
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.7,0.7
removeongethit = 1
ontop = 0
supermovetime = 9999
pausemovetime = 9999
ignorehitpause  = 1
persistent = 1

[State 0, Helper]
type = Helper
triggerall = Numhelper(8102) = 0
trigger1 = Movehit = 1 && p2movetype=H
helpertype = normal
name = "HitSpark"
ID = 8102
stateno =ifelse(random>500,8102,8002)
pos = 45, -24
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = 1
size.yscale = 1

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = -3,-29
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .7,.7
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 3
anim = 808
ID = 808
pos = 50,-40
postype = p1
bindtime = 1
removetime = -2
scale = .7,.7
sprpriority = 4
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 201, 2]
type = PlaySnd
trigger1 = animelem=3
value = S3,0

[State Change]
type = ChangeState
trigger1 = time= 20
value = 2102
ctrl = 0


;-------------------------------------------------------------------------------
[StateDef 2102,--- attack 2]
type = A
movetype= A
physics = S
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = 2
anim=2102

[State 0, VelSet]
type = VelSet
trigger1 = time=0
x = ifelse(p2bodydist x >15,10,0)
y = 0

[State 230, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = animelem = 2
attr = A, SA
damage    = 25,5
getpower = 30,15
guardflag = HA
priority = 4
pausetime = 12, 12
sparkno = -1
sparkxy = -25,-40
guard.sparkno = -1;s7000
hitsound   = s3,21
guardsound = s3,25
ground.type = high
animtype=hard
ground.slidetime = 1
ground.hittime  = 1
ground.velocity = -1, -3
air.velocity = -.5,-3.5
guard.velocity = -7
airguard.velocity =-.5,-3.5
Fall = 1
p2stateno=5604
envshake.time = 50
envshake.freq = 150
envshake.ampl = 3*ifelse(random<500,1,-1)
envshake.phase = 90

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numexplod(8200) = 0
trigger1 = moveguarded=1 && numenemy
helpertype =normal
name = "sparkGuard"
ID = 8200
stateno = ifelse(random>500,8200,8201)
pos = 20,-38
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
persistent =0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8107) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8107
stateno =ifelse(random>500,8107,8007)
pos = 45, -24
postype = p1
facing = 1
ownpal = 1
supermovetime =9999
pausemovetime =9999
ignorehitpause=1
size.xscale = .8
size.yscale = .8

[State 0, Helper]
type = Helper
triggerall = Numhelper(8102) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8102
stateno =ifelse(random>500,8102,8002)
pos = 45, -24
postype = p1
facing = 1
ownpal = 1
supermovetime =9999
pausemovetime =9999
ignorehitpause=1
size.xscale = .8
size.yscale = .8

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 6,-33
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .7,.7
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 0, Helper]
type = Helper
trigger1 = animelem = 1
helpertype = normal ;player
name = "Claws"
ID =2104
stateno = 2104
pos = 30,-20
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime =9999
pausemovetime =9999

[State 0, Helper]
type = Helper
trigger1 = time=0
helpertype = normal ;player
name = "Claws"
ID =2104
stateno = 2104
pos = 30,-20
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime =9999
pausemovetime =9999

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 2
anim = 807
ID = 807
pos = 60,-20
postype = p1
bindtime = -1
removetime =-2
scale = 1,1
sprpriority =4
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 0, PlaySnd]
type = PlaySnd
trigger1 =  animelem=2
value = S3,25

[State 0, PlaySnd]
type = PlaySnd
trigger1 =  animelem=1
value = S4,98
channel = 0

[State 901, off]
type = ChangeState
trigger1 = time=19
value = 2103
ctrl = 0


;-------------------------------------------------------------------------------
[StateDef 2103,--- off]
type = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = 2
anim=2103

[State 0, PosSet]
type = PosSet
trigger1 = animelem= 2
;x = 0
y = 0

[State 901, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
[Statedef 2104,--- FX Claws]
type = S
movetype = A
physics = N
juggle  = 0
velset = 0,0
ctrl = 0
anim = 868
sprpriority = -1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time < 10
scale = (2.0-time/10.0)/2.0,(2.0-time/10.0)/2.0

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 10
scale = 0.5,0.5

[State 0, Trans]
type = Trans
trigger1 = time <= 10
trans = addalpha
alpha = time*6, 256;-time*6

[State 0, Trans]
type = Trans
trigger1 = time > 10
trigger1 = time <= 23
trans = addalpha
alpha = 128, 256

[State 0, Trans]
type = Trans
trigger1 = time > 23
trans = addalpha
alpha = 256-(time-23)*10, 256;(time-23)*10

[State 0, Explod]
type = Explod
trigger1 = time = 10
anim = 869
ID = 869
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 12
scale = 0.5,0.5
sprpriority = 5
ontop = 0
shadow = 0,0,0
ownpal =1
removeongethit = 1
supermovetime= 9999
pausemovetime= 9999

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time >= 10
ID = 869
scale = (1.0+(time-10)/8.0)/2.0,(1.0+(time-10)/8.0)/2.0
trans = addalpha
alpha = 128-(time-10)*16,256;128+(time-10)*16

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time = 60
trigger2 = parent,movetype = H

;-------------------------------------------------------------------------------




;===============================================================================
;===============================================================================
[StateDef 2202, YASHA KARASU - start]
type = S
movetype= I
physics = N;S
velset = 0,0
ctrl = 0
anim = 2202
poweradd = 0
sprpriority = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = S4,93
channel=0

;espadas
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = S3,7

[State 1500, attack]
type = ChangeState
trigger1= animtime=0
value = 2200
;-------------------------------------------------------------------------------



;===============================================================================
[Statedef 2200,--- attack]
type = S
physics = S
movetype=A
ctrl = 0
anim = 2200

[State 20, 1]
type = VelSet
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 3000: EnvShake]
type = EnvShake
trigger1 = !movehit
trigger1 = AnimElem = 1
time = 20
freq = 120
ampl = -2
phase = 50

[State 0, PosAdd]
type = PosAdd
trigger1 =animelem= 4 ||animelem= 5||animelem= 6||animelem= 7
x = 0
y = ifelse(movehit,-50,0)


[State 0, TargetBind]
type = TargetBind
trigger1 = movehit=1
time = 1
pos =20,-20

[State 230, 1]
type = HitDef
trigger1 = movehit=0
trigger2 = movehit>1
attr = S, SA
animtype  = Medium
damage    = 3,1
getpower = 30,15
guardflag = MA
pausetime =  ifelse(hitcount<1,9,ifelse(hitcount<4 ,7,ifelse(hitcount<8,5,3)))  ,  ifelse(hitcount<1,9,ifelse(hitcount<4,7,ifelse(hitcount<8,5,3)))
guard.pausetime=3,3
sparkno = -1
guard.sparkno = -1;s7000
sparkxy = -25,-25
hitsound   = S3,21
guardsound = S3,25
ground.type = Low
ground.slidetime = 0
ground.hittime  = 20
ground.velocity = 0,0
air.velocity = -2,-7
fall =1
kill=0
fall.recover = 0
envshake.time=10
envshake.freq =  ifelse(hitcount < 1,20,ifelse(hitcount < 4,40,ifelse(hitcount <8,60,80)))
envshake.ampl =  ifelse(hitcount < 1,-3,ifelse(hitcount < 4,-5,ifelse(hitcount <8,-7,-9)))

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-35
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.7,0.7
removeongethit = 1
ontop = 0
supermovetime = 9999
pausemovetime = 9999
ignorehitpause  = 1
persistent = 1

[State 0, Helper]
type = Helper
triggerall = Numexplod(8200) = 0
trigger1 = moveguarded=1 && numenemy
helpertype =normal
name = "sparkGuard"
ID = 8200
stateno = ifelse(random>500,8200,8201)
pos = 20,-35
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
persistent =0

[State 0, Helper spark]
type = Helper
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8001;8101
stateno =IfElse(Random <= 499,8001,8101)
pos = 5-10+random%20, -30-10+random%20
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = IfElse(Random <= 499,.5,.9)
size.yscale = IfElse(Random <= 499,.5,.9)

[State 200, Spark blood]
type = Explod
trigger1 = movehit  && p2movetype=H
trigger1 = target,time=0
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 5-20+random%20, 10-45+random%20
postype = p2
facing = IfElse(Random <= 499,1,-1);1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = IfElse(Random <= 499,.5,.6),IfElse(Random <= 499,.5,.6)
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
;persistent = 0

[State 60, Arena Grande atras]
type = Explod
trigger1 = time=0
anim = 7129
ID =  7129
pos = 50,-7
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
supermovetime = 0;9999
pausemovetime =0;9999
scale = .6, .6
sprpriority = 4
ontop = 0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 60, spiral]
type = Explod
trigger1 = time=0
anim = 843
ID =  843
pos = 5,-27
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermovetime = 0;9999
pausemovetime =0;9999
scale = .51, .51
sprpriority = 4
ontop = 0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall =pos y =0
triggerall = time <110
trigger1 = time%3=0
helpertype = normal
name = "HitSpark"
ID = 8106
stateno = 8106
pos = 25,-floor(pos y)
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .3
size.yscale = .3

[State 211, 2]
type = PlaySnd
triggerall =pos y =0
triggerall = time <110
trigger1 = time%3=0
value = S3,0

[State 0, Explod bigRocks] 
type = Explod
triggerall =pos y =0
triggerall = time <110
trigger1 = time%4=0
anim = 7145
id = 7145
postype = p1
pos = 35,0
facing = ifelse(random%2,1,-1)
vel = Random/(-120),Random/(-120)
accel = 0,.5
scale = IfElse(Random <= 499,.13,.05),IfElse(Random <= 499,.13,.05)
sprpriority = ifelse(random%2,3,ifelse(random%2,27,ifelse(random%2,25,ifelse(random%2,10,-1))))
pausemovetime = 0;9999
supermovetime = 0;9999
removeongethit = 1

[State 0, Explod smallRocks] 
type = Explod
triggerall = pos y =0
trigger1 = time>0
anim = 7145
id = 7145
postype = p1
pos = 35,0
facing = ifelse(random%2,1,-1)
vel = Random/(-120),Random/(-120)
accel = 0,.5
scale = IfElse(Random <= 499,.02,.01),IfElse(Random <= 499,.02,.01)
sprpriority = ifelse(random%2,3,ifelse(random%2,27,ifelse(random%2,25,ifelse(random%2,10,-1))))
pausemovetime = 0;9999
supermovetime = 0;9999
removeongethit = 1

[State 0, PlaySnd rocks]
type = PlaySnd
trigger1 = time=0
value = S7,4

[State 0,floor]
type = Explod
triggerall = pos y =0
triggerall = time <110
trigger1 = time%4=0
anim = 7144
ID = 7144
pos = 20,2
postype = p1
bindtime = 1
removetime = 90
scale = 0.15,0.15
sprpriority = -2
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 60, Arena Grande atras]
type = Explod
triggerall = pos y =0
trigger1 = time%9 = 0
anim = 7102
ID =  7102
pos = 35,6;10
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
supermovetime = 0;1
pausemovetime =0;1
scale = 0.5, 0.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, Helper]
type = Helper
triggerall = pos y =0
trigger1 =  time%5=0
helpertype = normal
name = "garras"
ID = 2203
stateno = 2203
pos =0,-floor(pos y)
postype = p1
facing = 1
ownpal = 1
supermovetime = 0;9999
pausemovetime = 0;9999
ignorehitpause=1
size.xscale = .4
size.yscale = .4

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = S3,31

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S8,14

[State 200, attack]
type = ChangeState
triggerall= movehit && !AIlevel
trigger1 = animtime = 0 &&  command != "hold_x" &&  command != "hold_c" &&  command != "hold_z" &&  command != "hold_y"
value = 2201
ctrl = 0
[State Change]
type = ChangeState
triggerall= movehit && !AIlevel
trigger1 = command = "hold_x" && animtime = 0
value = 255
ctrl = 0
[State Change]
type = ChangeState
triggerall= movehit && !AIlevel
trigger1 = command = "hold_c" && animtime = 0
value = 250
ctrl = 0
[State Change]
type = ChangeState
triggerall= movehit && !AIlevel
trigger1 =  command = "hold_z" && animtime = 0
value = 280
ctrl = 0
[State Change]
type = ChangeState
triggerall= movehit && !AIlevel
trigger1 =  command = "hold_y" && animtime = 0
value = 270
ctrl = 0

;---- AI
[State 200, attack]
type = ChangeState
triggerall= movehit && AIlevel
trigger1 = animtime = 0
value = ifelse(random%2,2201,ifelse(random%2,280,ifelse(random%2,270,ifelse(random%2,250,255))))
ctrl = 0
;----

[State 200,fail]
type = ChangeState
trigger1=animtime=0 &&(!movecontact && !movehit)
trigger2=animtime=0 && moveguarded
value = 1804
ctrl = 0


[State 600, off air]
type = ChangeState
triggerall= pos y != 0 && moveguarded
trigger1 = animtime=0 
value = 251
ctrl = 0


;-------------------------------------------------------------------------------
[Statedef 2201,--- Remate]
type    = A
physics = A;N
movetype=A
velset = 0,0
anim =2201
ctrl = 0
sprpriority = 2

[State 60, Corte FX]
type = Explod
trigger1 = time=2
anim = 807
ID =  807 
pos = 50,-40 
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime =-2
supermovetime = 9999
pausemovetime = 9999
scale = .9,.9
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1100, 2]
type = HitDef
trigger1 =  animelem = 2
attr = A, NA
damage    = 25, 10
getpower = 30,15
guardflag = HA
priority = 4
pausetime = 12, 12
sparkno = -1
sparkxy = -25,-40
guard.sparkno = -1;s7000
hitsound   = s3,21
guardsound = s3,25
ground.type = high
animtype=hard
ground.slidetime = 1
ground.hittime  = 1
ground.velocity = -1, -3
air.velocity = -.5,-2
guard.velocity = -1
airguard.velocity =-.5,-2
Fall = 1
p2stateno=5604
envshake.time = 50
envshake.freq = 150
envshake.ampl = 3*ifelse(random<500,1,-1)
envshake.phase = 90

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numexplod(8200) = 0
trigger1 = moveguarded=1 && numenemy
helpertype =normal
name = "sparkGuard"
ID = 8200
stateno = ifelse(random>500,8200,8201)
pos = 20,-35
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
persistent =0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8107) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8107
stateno =ifelse(random>500,8107,8007)
pos = 70-10+random%20, 0-40+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime =9999
pausemovetime =9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6

[State 0, Helper]
type = Helper
triggerall = Numhelper(8102) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8102
stateno =ifelse(random>500,8102,8002)
pos = 70-10+random%20, 0-40+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .7
size.yscale = .7

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 6,-33
postype = p2
facing = 1
sprpriority = IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .8,.8
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=2
value = S3,10

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=5
value = S4,13

[State 3290, end]
type = changestate
trigger1 = animtime=0
value=50

;-------------------------------------------------------------------------------
[Statedef 2203,--- helper_garras]
type = S
physics = S
ctrl = 0
anim = 834
sprpriority = 3

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >= 0
value =  -35

[State 0, DestroySelf]
type = DestroySelf
trigger1 =(parent, stateno != 2200 )
;-------------------------------------------------------------------------------



;===============================================================================
;===============================================================================
[Statedef 2300, U TORA GARI - start]
type    = S
movetype= A;I
physics = S
velset = 0,0
ctrl = 0
anim = 2300
sprpriority = 2
poweradd = 0

[State 0, SuperPause]
type = SuperPause
trigger1 = time=0
time = 70
anim = -1
sound = -1
pos = 0,0
movetime = 70
darken = 0
p2defmul = 1
poweradd = 0
unhittable = 1

[State 3000: EnvShake]
type = EnvShake
trigger1 = (AnimElem = 1)
time = 20
freq = 120
ampl = -2
phase = 50

;***********------"mugshot"-----------**********
[State 0, Helper]
type = Helper
triggerall = !numhelper(50003) 
trigger1 = !time
helpertype = normal ;player
name = "mugshot"
ID = 50003
stateno = 50003
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
;;***********------"mugshot"-----------**********

[State 0, Helper]
type = Helper
trigger1 = time = 0;10
helpertype = normal
name = "EX"
ID = 6010
stateno = 6010
pos = 20,-45
postype = p1
facing = 1
ownpal = 1
supermovetime=9999
pausemovetime=9999

[State 0, BGPalFX]
type = BGPalFX
trigger1 = Time > 0
time =1
add = -80,-80,-80

[State 0, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 8504
ID = 8504
pos = -4,-62
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -2
supermovetime = 9999
pausemovetime = 9999
sprpriority = 3
ontop = 0
ownpal = 1
removeongethit = 1
scale = .75,.75

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = S4,99
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=42
value = S8,6
channel = -1

;espadas
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=9
value = S3,31

[State 1500, attack]
type = ChangeState
triggerall = !AIlevel
trigger1= time >=70
value = 2301

;para la IA
[State 1500, off]
type = ChangeState
triggerall = !AIlevel
trigger1 =  p2life = 0;
value = 1701

[State 1500, attack]
type = ChangeState
triggerall = AIlevel
trigger1= time >=70
value = 2301


;-------------------------------------------------------------------------------
[Statedef 2301,--- attack]
type    = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
anim = 2301
sprpriority = 2

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=0
id =  8504

[State 230, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = animelem = 1 || animelem = 2
attr = S, SA
hitflag = MAFD
animtype  = hard
damage    = 130,14;28
guardflag = MA
pausetime =5,6
guard.pausetime = 25,45
sparkno = -1;s6000
guard.sparkno = -1;s7000
sparkxy = -25,-25
hitsound   = S2,1
guardsound = S3,25
ground.type = high
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -7,1
air.velocity = -6,-5.5
fall =1
p2stateNo=5651

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 200, Spark blood]
type = Explod
trigger1 = animelem = 1 || animelem = 2
trigger1 = movehit  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 6,-30
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .7,.7
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numexplod(8200) = 0
trigger1 = moveguarded && numenemy
helpertype =normal
name = "sparkGuard"
ID = 8200
stateno = ifelse(random>500,8200,8201)
pos = 20,-40
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
persistent =0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4081) = 0
trigger1 = moveguarded && numenemy
trigger1 = animelem = 2
anim = 4080
ID = 4081
pos = 9,-33
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.7,0.7
removeongethit = 1
ontop = 0
supermovetime = 9999
pausemovetime = 9999
ignorehitpause  = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall =  target,GetHitVar(animtype) = 3
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8107
stateno = ifelse(random>500,8107,8007)
pos = 50, -24
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6

[State 0, Helper]
type = Helper
triggerall =  target,GetHitVar(animtype) = 3
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8103
stateno = ifelse(random>500,8103,8003)
pos = 50, -24
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1

[State 230, 1]
type = HitDef
trigger1 = animelem = 4
attr = S, NA
animtype  = light
damage    = 5
guardflag = MA
pausetime =0,0
sparkno = -1;s6000
guard.sparkno = -1;s7000
sparkxy = -25,-25
hitsound   = S7,1
guardsound = S1,1
ground.type = trip
ground.slidetime = 100
ground.hittime  = 20
ground.velocity = -7,1
air.velocity = -6,-5.5
fall =0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4082) = 0
trigger1 = moveguarded && numenemy
trigger1 = animelem = 4
anim = 4080
ID = 4082
pos = 9,-5
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.4,0.4
removeongethit = 1
ontop = 0
supermovetime = 9999
pausemovetime = 9999
ignorehitpause  = 1
persistent = 0

[State 3000: EnvShake]
type = EnvShake
trigger1 = time=10
time = 30
freq = 120
ampl = -7
phase = 60
ignorehitpause=1

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 1
anim = 803
ID = 803
pos = 3,-35
postype = p1
bindtime = -1
removetime =-2
scale = .8,.9
sprpriority = 4
ownpal = 1
supermovetime=9999
pausemovetime=9999

[State -3, Helper]
type = Helper
triggerall = !movehit
trigger1 = time = 10
helpertype = normal
name = "floor III"
ID = 5653
stateno = 5653
pos = 51,0
postype = p1
facing = 1
ownpal = 1
supermovetime=9999
pausemovetime=9999
ignorehitpause=1
persistent=0

[State 0, Explod viento]
type = Explod
trigger1 =time=10
anim = 7136
ID = 7136
pos =60,5
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
supermovetime = 9999
pausemovetime=9999
scale = .7,.7
sprpriority = -1
ownpal = 1
removeongethit = 1
ignorehitpause =0

[State 210, 2]
type = PlaySnd
trigger1 = Time = 0
value = S3,20

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=11
value = S2,2

[State 600, End]
type = ChangeState
trigger1 = time= 50
value = 221
ctrl = 0

;-------------------------------------------------------------------------------



;===============================================================================
;===============================================================================
[Statedef 2400, 1080PH - start]
type = S
physics = S
velset = 0,0
ctrl = 0
anim = 2400
poweradd = 0
sprpriority = 2

[State 0, BGPalFX]
type = BGPalFX
trigger1 = Time > 0
time =1
add = -80,-80,-80

[State 0, AllPalFX]
type = BGPalFX
trigger1 = time%3=0
time = 2
add = -50,-50,-50
mul = 256,256,256
color=128

[State 0, Helper]
type = Helper
triggerall = !numhelper(50037) 
trigger1 = time >= 10 & timemod = 15,0
helpertype = normal ;player
name = "AfterImage6Blue"
ID = 50037
stateno = 50037
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
[State 0, Veladd] 
type = Veladd
trigger1 = 1
x = -1.5
[State 0, VelSet]
type = VelSet
trigger1 = vel x < 0.05
x = 0
ignorehitpause = 1
[State 0, VelSet]
type = VelSet
trigger1 = 1
y = 0
ignorehitpause = 1
[State 0, EnvShake]
type = EnvShake
trigger1 = time >= 10 & timemod = 10,0
time = 5
freq = 90
ampl = -4
phase = 10
ignorehitpause = 1
[State 0, Helper]
type = Helper
triggerall = numhelper(50038)=0 
trigger1 = time >= 10 & timemod = 5,0
helpertype = normal ;player
name = "AfterImage7 glow"
ID = 50038
stateno = 50038
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
remappal = 1,3
supermovetime = 9999
pausemovetime = 9999

[State 0, PalFX]
Type = PalFX
trigger1 = time >= 10
time = 1
ADD = 0,25+Floor(Sin(Time/15.0*PI)*25),80+Floor(Sin(Time/15.0*PI)*80)

[State 0, Helper]
Type = Helper
Trigger1 = !NumHelper(2406)
trigger1 = time >= 10
HelperType = Normal
Name = "Power"
Pos = 0,0
PosType = p1
Facing = 1
OwnPal = 1
Size.Ground.Back = 0
Size.Ground.Front = 0
StateNO = 2406
ID = 2406

[State 0, PowerAdd]
type = PowerAdd
trigger1 = 1 && !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
value = -4;

[State 100, Explod]
type = Explod
trigger1 =time = ifelse(!(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263),60,15)
anim = 6050
ID = 6050
pos = 20,-5
postype = p1
bindtime = 1
removetime = -2
scale = 0.25,0.25
sprpriority = -4
ownpal = 1
facing=-1
supermovetime=9999
pausemovetime=9999

[State 100, Explod]
type = Explod
trigger1 =time = ifelse(!(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263),60,15)
anim = 6050
ID = 6050
pos = -20,-5
postype = p1
bindtime = 1
removetime = -2
scale = 0.25,0.25
sprpriority = -4
ownpal = 1
facing = 1
supermovetime=9999
pausemovetime=9999

[State 0, Explod smallRocks] 
type = Explod
trigger1 = time>10 && time <20 && !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
anim = 7145
id = 7145
postype = p1
pos = 35,floor(pos y)
facing = ifelse(random%2,1,-1)
vel = Random/(-120),Random/(-120)
accel = 0,.5
scale = IfElse(Random <= 499,.02,.01),IfElse(Random <= 499,.02,.01)
sprpriority = ifelse(random%2,3,ifelse(random%2,27,ifelse(random%2,25,ifelse(random%2,10,-1))))
pausemovetime = 9999
supermovetime = 9999
removeongethit = 1

[State -3, Helper]
type = Helper
trigger1 = time = 10 && !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
helpertype = normal
name = "floor I"
ID = 5633
stateno = 5633
pos = 0,-3
postype = p1
facing = 1
ownpal = 1
supermovetime =9999
pausemovetime =9999
ignorehitpause =1
persistent=0

[State 1000, EnvColor]
type = EnvColor
triggerall =  time = 10 && !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 100, Explod]
type = Explod
trigger1 = time = 10 && !(prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
anim = 6074
ID = 6074
pos = 0,2
postype = p1
bindtime = -1
removetime = -1
scale = 0.4,0.4
sprpriority = -4
ownpal = 1
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=60;70;80
id =6074

[State 60, pound hou start - FX]
type = Explod
trigger1 = time = 19
anim = 872
ID =  872
pos = -10,-55
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermovetime = 0
pausemovetime = 0
scale = 0.28, 0.28
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 60, pound hou start - FX]
type = Explod
trigger1 = time = 10
anim = 872
ID =  872
pos = -12,-45
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermovetime = 0
pausemovetime = 0
scale = 0.28, 0.28
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 60, pound hou start - FX]
type = Explod
trigger1 = time = 16
anim = 872
ID =  872
pos = -8,-39
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermovetime = 0
pausemovetime = 0
scale = 0.28, 0.28
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

;blue fire
[State 0, Explod]
type = Explod
trigger1 = time = 10
anim = 8503
ID = 85030
pos = 0,2
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = 80
removeongethit = 1
supermovetime=9999
pausemovetime=9999
scale = 0.45,0.33;1,1
sprpriority = 5
ownpal = 1

;***********------"mugshot"-----------**********
[State 0, Helper]
type = Helper
triggerall = !numhelper(50003) 
trigger1 = time = 10;!time
helpertype = normal ;player
name = "mugshot"
ID = 50003
stateno = 50003
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
;***********------"mugshot"-----------**********


[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=60;70;80
id =872

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =10
value = S8,6
channel=2;

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time =10
value = S8,19
channel=10

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=2
value = S4,107
channel=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=3
value = S3,7;

[State -2, varsetCombo]
type = varset
trigger1 =1
var(24) = ifelse(var(23)=1,1,0)
ignorehitpause = 1

[State 1500, off]
type = ChangeState
triggerall= !AIlevel
trigger1 = command != "hold_x" & time <=60;70;80
value = 1152

[State 1500,attack combo]
type = ChangeState
triggerall = !AIlevel && (prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
trigger1=command = "hold_x" & time >=15
value = 2401

[State 1500,  attack]
type = ChangeState
triggerall = !AIlevel
trigger1=command = "hold_x" & time >=60;70;80
value = 2401
ctrl = 0


;para la IA
[State 1500, off]
type = ChangeState
triggerall= AIlevel
trigger1 =  p2life = 0
value = 1152

[State 1500, attack combo]
type = ChangeState
triggerall = AIlevel && (prevstateno=200 || prevstateno=201 || prevstateno=202 || prevstateno=205 || prevstateno=210 || prevstateno=211 || prevstateno=212 || prevstateno=214 ||prevstateno=220 || prevstateno=222 || prevstateno=223 || prevstateno=263)
trigger1=time >=15
value = 2401

[State 1500, attack]
type = ChangeState
triggerall = AIlevel
trigger1= time >=60;70;80
value = 2401

;-------------------------------------------------------------------------------
[Statedef 2401,--- attack]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 2401

[State 0, BGPalFX]
type = BGPalFX
trigger1 = Time > 0
time =1
add = -80,-80,-80

[State 0, AllPalFX]
type = BGPalFX
trigger1 = Time > 0
trigger1 = time%3=0
time = 2
add = -50,-50,-50
mul = 256,256,256
color=128

;---retira carga
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=0
id =872
;-----------------

[State -3, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "floor II"
ID = 5643
stateno = 5643
pos = 0,-4
postype = p1
facing = 1
ownpal = 1
supermovetime=9999
pausemovetime=9999
ignorehitpause=1
persistent=0

[State 0, VelSet]
type = VelSet
trigger1 =time=[8,15]
x = 1

[State 0, VelSet]
type = VelSet
trigger1 =animelem=3
y = -3

[State 0, VelSet]
type = VelSet
trigger1 =animelem=6
y = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time=[14,40]
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 =time = 54;62;70
statetype = A       ;S,A,C,L
movetype = A        ;I,A,H
physics = A         ;A,C,S,N

[State 0]
type = Helper
trigger1 = Animelem = 5
helpertype = Normal
name = "Slasher"
id = 2405
pos = 20,-50
postype = p1
facing = 1
stateno = 2405
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = 0.5
size.yscale = 0.5

[State 1000: helper proyectile]
type = Helper
trigger1 = time=40
helpertype = Normal
id = 2403
pos = 20,-62
postype = p1
facing = 1
stateno	=2403
keyctrl	= 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .7
size.yscale = 1

[State 1000: helper hitdef]
type = Helper
trigger1 = time=40
helpertype = Normal
id = 2413
pos = 20,-62
postype = p1
facing = 1
stateno	=2413
keyctrl	= 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .7
size.yscale = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=2
value = S4,113
channel=0

;;viento
[State 1, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4 
trigger2 = animelem = 6
trigger3 = animelem = 8
trigger4 = animelem = 10
value = S2,2
;
;espada viento
[State 0, PlaySnd]
type = PlaySnd
trigger1 =  Animelem = 14
value = S2,0

;proyectile
[State 0, PlaySnd]
type = PlaySnd
trigger1 =  time=40
value = S2,9

[State 200, hit]
type = ChangeState
trigger1=time=84
value = 1152
ctrl = 0


;-------------------------------------------------------------------------------
[StateDef 2402,--- end/off]
type = S
movetype= I
physics = S
velset = 0,0
ctrl = 0
anim = 221
poweradd = 0
sprpriority = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S3,33

[State 10, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 0

[State 10, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 2

[State 0, AfterImageTime]
type = AfterImageTime
trigger1 =time=0
time = 0
ignorehitpause = 1
persistent = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=0
id =872

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time=0
id =6074

[State 1503, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;-------------------------------------------------------------------------------
[Statedef 2403,--- proyectile]
type = A
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim =842
sprpriority = 5

[State 0, EnvShake]
type = EnvShake
trigger1 = time%8=0
time = 5
freq = 120
ampl = -4
;phase = 90
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 18;20
y = 0

[State 1000, ScreenBound]
type = ScreenBound
trigger1 =time > 0
movecamera = 1,0
value	= 0

[State 3000, polvo Rush - FX]
type = Explod
triggerall = time <120
trigger1 = time%2=0
anim = 7140
ID = 7140
pos = 60,100
vel = 0, 0
sprpriority = 5
removetime = -2
bindtime = 1
ownpal = 1
scale = .3,.2
removeongethit = 1
ontop = 0
supermovetime = 0;999
ignorehitpause  = 1
facing=-1

[State 0, Explod bigRocks] 
type = Explod
triggerall = time <120
trigger1 = time%2=0
anim = 7145
id = 7145
postype = p1
pos = 70,90
facing = ifelse(random%2,1,-1)
vel = Random/(-120),Random/(-120)
accel = 0,.5
scale = IfElse(Random <= 499,.15,.05),IfElse(Random <= 499,.15,.05)
sprpriority = ifelse(random%2,3,ifelse(random%2,27,ifelse(random%2,25,ifelse(random%2,10,-1))))
pausemovetime = 0;9999
supermovetime = 0;9999
removeongethit = 1

[State 0, PlaySnd rocks]
type = PlaySnd
trigger1 = time=0
value = S7,4

; Wall Slam1
[State -3, Helper]
type = Helper
triggerall = numhelper(3704)=0
TriggerAll = FrontEdgeDist <= 0
Trigger1 = 1
helpertype =normal
name = "wall"
ID = 3704
stateno = 3704
pos = floor(target,screenpos x+10*target,facing),floor(target,pos y-10);-30
postype = p1
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
supermovetime=9999
pausemovetime=9999
ignorehitpause=1

[State -1]
Type = Width
Trigger1 = 1
Edge = 0,-Const(Size.Air.Back)
IgnoreHitPause = 1
SuperMoveTime = 9999
PauseMoveTime = 9999

;proyectile
[State 0, PlaySnd]
type = PlaySnd
trigger1 =  time=0
value = S2,17

[State 0, DestroySelf]
type = DestroySelf
trigger1 = root,var(26) = 1 || FrontEdgeDist <= 0 


;-------------------------------------------------------------------------------
[Statedef 2404,--- spark]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 9997
sprpriority = 5

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 60
freq = 60
ampl = -4
phase = 90
ignorehitpause = 1

[State 40 dust]
type = Explod
trigger1 = !Time
anim = 7105
ID = 7105
pos =  40-10+random%20, 30-10+random%20
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = 30
scale = 1.5,1.5
sprpriority = 10
ownpal = 1
removeongethit = 0

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "HitSpark"
ID = 8001
stateno =8001
pos = 40-10+random%20, 30-10+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .9
size.yscale = .9

[State 0, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "HitSpark"
ID = 8107
stateno = 8107
pos = 0, 0
postype = p1
facing = 1
ownpal = 1
supermovetime=9999
pausemovetime=9999
ignorehitpause=1
size.xscale = 1
size.yscale = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 =  time=0
value = S7,5

[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
;===============================================================================
[Statedef 2405,--- slashes]
type    = S
movetype = A
physics = S
velset = 0,0
anim = 2405
ctrl = 0
sprpriority = 4

[State 0, cortes multiples II]
type = Explod
trigger1 = time = 0
anim = 6251
ID = 50
pos = 0,-10
postype = front
facing = -facing
vfacing = 1
bindtime = 1
removetime = -2
scale = .9,.6
sprpriority = 11
ontop = 0
ownpal = 1

[State 1100, Slash]
type = Explod
trigger1 = time%8 = 0
anim = 806
ID = 806
postype = p1
pos = -10,-20
sprpriority = 15
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.7,0.7
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 0

[State 1100, Slash]
type = Explod
trigger1 = time%8 = 0
anim = 806
ID = 806
postype = p1
pos = -25,-20
facing = -1
vfacing = -1
sprpriority = 15
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.7,0.7
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 0

[State 1100, Slash]
type = Explod
trigger1 = time%8 = 0
anim = 801
ID = 801
postype = p1
pos = -20+(random%40),-40+(random%40)
sprpriority = 15
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.6,0.6
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 0
;
[State 1100, Slash]
type = Explod
trigger1 = time%10 = 0
anim = 802
ID = 802
postype = p1
pos = -90+(random%40),-40+(random%40)
facing = 1
sprpriority =15
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.95,0.65
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 0
;
[State 1100, Slash]
type = Explod
trigger1 = time%11 = 0
anim = 804
ID = 804
postype = p1
pos = -60+(random%40),-40+(random%20)
facing = -1
vfacing = -1
sprpriority = 15
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.6,0.6
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 0
;
[State 1100, Slash]
type = Explod
trigger1 = time%13 = 0
anim = 800
ID = 800
postype = p1
pos = -40+(random%40),-80-(random%40)
facing = -1
vfacing = -1
sprpriority = 15
removetime = -2
bindtime = -1
ownpal = 1
scale = 1,1
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 0

[State 210, 1]
type = HitDef
triggerall =parent,stateno!=3103
triggerall = hitcount <3
trigger1 = movehit=0
trigger2 = movehit>1
attr = S, NA
animtype  = Medium
damage    = 10,5
guardflag = MA
pausetime = 0,3
sparkno = -1;s6000
guard.sparkno = -1;s7000
sparkxy = -20,-25
hitsound   = S3,12
guardsound = S3,25
ground.type = High
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -1.5,-4.5
air.velocity = -0.5,-3.5
fall = 1
fall.recover =0

[State 0, Helper]
type = Helper
trigger1 = Movehit = 1 && p2movetype=H
helpertype = normal
name = "HitSpark"
ID = 8101
stateno =ifelse(random>500,8101,8001)
pos = 5-10+random%20, 0-30+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .5
size.yscale = .5

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-25
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.35,0.35
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 1
persistent = 0

[State 200, Spark blood]
type = Explod
trigger1 = movehit  && p2movetype=H
trigger1 = target,time=0
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 5-10+random%20, -40-20+random%20
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = IfElse(Random <= 499,.4,.5),IfElse(Random <= 499,.4,.5)
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
;persistent = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time%8 = 0
value = S3,16

[State 0, ChangeState]
type = Destroyself
trigger1 = time > ifelse(parent,stateno!=3103,25,20)
 
;-------------------------

;----------------------------------------------------------------
[Statedef 2406,--- helper power]
type = S
movetype = I
physics = S
juggle = 0
ctrl = 0
velset = 0,0
anim = 9999

[State 0, BindToRoot]
type = BindToRoot
trigger1 =Time%5=0
pos = -100+Random%201,-80+Random%161

[State 0, Explod]
type = Explod
trigger1 = Time%5=1
anim = 6018
ID = 6018
vel=((RootDist X)/20.0),((RootDist Y - 25)/20.0)
scale=.5,.5
bindtime = 1
removetime = -2
sprpriority = 2
ownpal = 1

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = 1
ID = 6018
vel=((RootDist X)/20.0),((RootDist Y - 25)/20.0)
RemoveTime = 20

[State 0, DestroySelf]
type = DestroySelf
trigger1 = Root,StateNO != 2400
;------------------------------------------------------------
;-------------------------------------------------------------------------------
[Statedef 2413,--- hitDef]
type = A
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 2406
sprpriority = 5

[State 3101, Anim]
type = changeanim
trigger1 = anim != 2406
value = 2406

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 18
y = 0

[State 210, 1]
type = HitDef
triggerall = hitcount <1
trigger1 = movehit=0
trigger2 = movehit>1
attr = S, SA
animtype  = hard
damage    =ifelse(parent,var(24)=1,150,300);,ifelse(parent,var(24)=1,30,60)
guardflag = ;MA
pausetime = 0,10
sparkno = -1
guard.sparkno = -1
guard.pausetime = 0,10
hitsound   = S3,26;21
guardsound = S3,25
ground.type = high
ground.slidetime = 60
ground.hittime  = 100
ground.velocity = -6,-2.8
air.velocity = -8,-3
fall =1
envshake.freq = 30
envshake.time = 70
fall.recover =0
guard.hittime = 25
guard.slidetime = 50
guard.velocity = -40
getpower=0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-30
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.5,0.5
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 1
persistent = 0

[State 0, Spark Helper]
type = Helper
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8103
stateno =ifelse(random>500,8103,8003)
pos = 0, -40
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 9,-33
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .9,.9
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 3101, hitvar]
type = varadd
trigger1 = !time
var(5) = 1

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno= ifelse(var(5) < 6, 2413, 2404)
time = 1
forceair = 0
ignorehitpause = 1


[State 0, DestroySelf]
type = DestroySelf
trigger1 =FrontEdgeDist <= 0
;-------------------------------------------------------------------------------
;===============================================================================0

