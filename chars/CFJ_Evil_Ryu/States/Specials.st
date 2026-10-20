; _______________________
;| Evil Ryu by chuchoryu |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;============================================================================================
;=====================================<SPECIAL STATES>=======================================
;============================================================================================

;======================<HADOU KEN>=============================
[Statedef 1000]
type=S
physics=S
movetype=A
anim=1000
ctrl=0
velset=0,0
poweradd=20*!var(20)
sprpriority=1
facep2=1

[State 0, Explod]
type = Explod
triggerall=statetype=L
trigger1 =stateno=1000
anim =8904+random%4
ID =185
pos = 0,-20
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,-1+(random<500)
accel = 0,0
random = 100,20
removetime = -2
supermove
pausemove
scale = 1.25,1.25
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 0
removeongethit = 0
;ignorehitpause =

[State 0, Explod]
type = Explod
trigger1 =stateno=1000
anim =8900+random%8
ID =185
pos = 0,-10
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,-1+(random<500)
accel = 0,0
random = 100,40
removetime = -2
supermove
pausemove
scale = 1,1
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 0
;ignorehitpause =
;persistent =

[State 1000, strengthvar]
type=varset
trigger1= !time && var(59)<=0
var(10)=ifelse(command="qcfz",3,ifelse(command="qcfy",2,1))
[State 1000, strengthvarAI]
type=varset
trigger1= !time && var(59)>=1
var(10)= ifelse((p2movetype=H || random<500), 3, ifelse(random<500, 2, 1))

[State 1000, width]
type=width
trigger1= animelemtime(5)=0
value=30,0

[State 1000, Hadouken]
type=helper
trigger1= animelemtime(5)=1
helpertype=normal
stateno=1005
ID=1005
name="Hadouken"
postype=p1
pos=80,-68
size.xscale=.5
size.yscale=.5
ownpal=1

[State 1000, Snd]
type=playsnd
trigger1= animelem=3
value=4+(var(1)=2)*10,0
channel=0
[State 1000, Snd]
type=playsnd
trigger1= animelemtime(5)=1
value=5,0

[State 1000, End]
type=changestate
trigger1= !animtime
value=0
ctrl=1


;======================<SHAKUNETSU HADOU KEN>=============================
[Statedef 1020]
type=S
physics=S
movetype=A
anim=1000
ctrl=0
velset=0,0
poweradd=20*!var(20)
sprpriority=1
facep2=1

[State 1020, strengthvar]
type=varset
trigger1= !time && var(59)<=0
var(10)=ifelse(command="qcfz",3,ifelse(command="qcfy",2,1))
[State 1020, strengthvarAI]
type=varset
trigger1= !time && var(59)>=1
var(10)= ifelse((p2movetype=H || random<500), 3, ifelse(random<500, 2, 1))

[State 1020, width]
type=width
trigger1= animelemtime(5)=0
value=30,0

[State 1020, Hadouken]
type=helper
trigger1= animelemtime(5)=1
helpertype=normal
stateno=1025
ID=1025
name="Shakunetsu Hadouken"
postype=p1
pos=80,-68
ownpal=1

[State 1020, Snd]
type=playsnd
trigger1= animelem=3
value=14,4
channel=0
[State 1020, Snd]
type=playsnd
trigger1= animelemtime(5)=1
value=5,0

[State 1020, End]
type=changestate
trigger1= !animtime
value=0
ctrl=1

;======================<SHORYUU KEN>=============================
[Statedef 1100]
type=S
physics=S
movetype=A
anim=1100
ctrl=0
velset=0,0
poweradd=0*(!var(20) && prevstateno!=750)
juggle=ifelse(var(1)=1,8,ifelse((p2movetype=H && p2statetype=A),7,9))
sprpriority=1
facep2=1

[State 1100, strengthvar]
type=varset
trigger1= !time && var(59)<=0
var(10)=ifelse((command="dfz" || prevstateno=750),3,ifelse(command="dfy",2,1))
[State 1100, strengthvarAI]
type=varset
trigger1= !time && var(59)>=1
var(10)= ifelse((p2movetype=H || prevstateno=750 || random<333), 3, ifelse(random<500, 2, 1))

[State 1100, nothitby]
type=nothitby
trigger1= anim=1100 && animelemtime(4)<0 && prevstateno!=750
value=SCA
time=1
ignorehitpause=1
[State NHB-ZC]
type=nothitby
triggerall= prevstateno=750
trigger1= var(1)=1 && animelemtime(3)<0
trigger2= var(1)!=1 && animelemtime(2)<0
value=SCA
time=1

[State 1100, Vel]
type=velset
trigger1= anim=1100 && animelem=4
x=ifelse(var(10)=3,12,ifelse(var(10)=2,9,6))
y=ifelse(var(10)=3,-11,ifelse(var(10)=2,-8.5,-6))
[State 1100, Vel]
type=velmul
trigger1= 1
x=.88
[State 1100, Vel]
type=velmul
trigger1= vel y>0
x=0

[State 1100, Snd]
type=playsnd
trigger1= anim=1100 && animelem=4
value=0,41
[State 1100, Dust]
type=helper
trigger1= anim=1100 && animelem=4
helpertype=normal
stateno=7100
ID=7100
name="Dust"
postype=p1
ownpal=1

[State 1100, Snd]
type=playsnd
trigger1= anim=1100 && animelem=2
value= 4+(var(1)=2)*10, 1
channel=0
ignorehitpause=1
persistent=0

[State 1100, Hit]
type=hitdef
trigger1= animelem=3 && anim=1100 && var(1)=1
attr=S,SA
damage=ifelse(var(20), 60+var(10)*7, 111+var(10)*7),15
animtype=Back
guardflag=M
hitflag=MAF
priority=4,Hit
pausetime= ifelse(var(20),6,12), ifelse(var(20),6,12)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 80), var(36):=-79
hitsound=s2,3
guardsound=s2,0
ground.type=Low
ground.slidetime=16
ground.hittime=16
ground.velocity=-2,-10
ground.cornerpush.veloff = 0
air.type=Low
air.velocity=-2,-10
guard.velocity= -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 30,15
givepower=36,36
envshake.time=16
envshake.freq=120
envshake.ampl=4
fall=1
fall.recover=0;!var(20)
;fall.recovertime=ifelse(var(10)=3, 61, ifelse(var(10)=2, 51, 41))
fall.animtype=Medium
yaccel=.5
forcestand=1

[State 1100, hit2]
type=hitdef
trigger1= animelem=4 && anim=1100 && var(1)=1
trigger1= !movecontact && !movereversed
attr=A,SA
damage=28,7
animtype=Back
guardflag=MA
hitflag=MAF
priority=4,Hit
pausetime= ifelse(var(20),6,12), ifelse(var(20),6,12)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 80), var(36):=-106
hitsound=s2,3
guardsound=s2,0
ground.type=High
ground.slidetime=16
ground.hittime=16
ground.velocity=-2,-10
ground.cornerpush.veloff = 0
air.type=Low
air.velocity=-2,-10
guard.cornerpush.veloff = 0
guard.velocity= -10.52
getpower = 30,15
givepower=36,36
envshake.time=16
envshake.freq=120
envshake.ampl=4
fall=1
fall.recover=0;!var(20)
;fall.recovertime=ifelse(var(10)=3, 60, ifelse(var(10)=2, 50, 40))
yaccel=.5
airguard.ctrltime= 16
airguard.velocity= ifelse(var(20),-4,-8), -1.5
forcestand=1
airguard.cornerpush.veloff = 0

[State 1100, Hit]
type=hitdef
trigger1= animelem=2 && anim=1100 && var(1)!=1
trigger2= animelem=3 && anim=1100 && var(1)!=1
attr=S,SA
damage= 45+var(10)*7, 7
animtype=Medium
fall.animtype=Medium
guardflag=M
hitflag=MAF
priority=4,Hit
pausetime= ifelse(var(20),6,12), ifelse(var(20),5,11)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 80), var(36):=-52
hitsound=s2,3
guardsound=s2,0
ground.type=Low
ground.slidetime=16
ground.hittime=16
ground.velocity=-2,-10
ground.cornerpush.veloff = 0
air.type=Low
air.velocity=-2,-10
guard.cornerpush.veloff = 0
guard.velocity= -10.52
getpower = 30,15
givepower=36,36
envshake.time=16
envshake.freq=120
envshake.ampl=4
fall=1
fall.recover=0;!var(20)
;fall.recovertime=ifelse(var(10)=3, 89, ifelse(var(10)=2, 79, 69))
fall.animtype=Medium
yaccel=.5
forcestand=1

[State 1100, hithard2]
type=hitdef
trigger1= animelem=4 && anim=1100 && var(1)!=1
attr=A,SA
damage=28,7
animtype=Up
guardflag=MA
hitflag=MAF
priority=4,Hit
pausetime= 8,16
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 80), var(36):=-106
hitsound=s2,3
guardsound=s2,0
ground.type=High
ground.slidetime=16
ground.hittime=16
ground.velocity=-2,-10
ground.cornerpush.veloff = 0
air.type=Low
air.velocity=-2,-10
guard.cornerpush.veloff = 0
guard.velocity= -10.52
getpower = 30,15
givepower=36,36
envshake.time=16
envshake.freq=120
envshake.ampl=4
fall=1
fall.recover=0;!var(20)
;fall.recovertime=ifelse(var(10)=3, 64, ifelse(var(10)=2, 54, 44))
yaccel=.5
airguard.ctrltime= 16
airguard.velocity= ifelse(var(20),-4,-8), -1.5
forcestand=1
airguard.cornerpush.veloff = 0

[State 1100, statetype]
type=statetypeset
trigger1= anim=1100 && animelemtime(4)>=0
trigger2= anim=1101
statetype=A
physics=A
[State 1100, Anim]
type=changeanim
trigger1= anim=1100 && animelemtime(4)>0 && vel y>(ifelse(var(10)=3,-5.3,ifelse(var(10)=2,-4,-2.7)))
value=1101
persistent=0

[State Idle]
type=statetypeset
trigger1= anim=1101
movetype=I

;======================<TATSUMAKI SENPUU KYAKU>=============================
[Statedef 1200]
type=A
physics=N
movetype=A
anim=1200
ctrl=0
velset=0,0
poweradd=0*!var(20)
juggle=8
sprpriority=1
facep2=1

[State 1200, strengthvar]
type=varset
trigger1= !time && var(59)<=0
var(10)=ifelse((command="qcbc"),3,ifelse(command="qcbb",2,1))
[State 1200, strengthvarAI]
type=varset
trigger1= !time && var(59)>=1
var(10)= ifelse((p2movetype=H || random<333), 1, ifelse(random<500, 2, 3))

[State 1200, Snd]
type=playsnd
trigger1= anim=1200 && animelem=1
value=4+(var(1)=2)*10,2
channel=0
[State 1200, Snd]
type=playsnd
trigger1= anim=1200 && animelem=1
value=0,40
[State 1200, Dust]
type=helper
trigger1= anim=1200 && animelem=1
helpertype=normal
stateno=7100
ID=7100
name="Dust"
postype=p1
ownpal=1

[State 1200, Anim]
type=changeanim
trigger1= anim=1200 && !animtime
value=1201

[State 1200, statetype]
type=statetypeset
trigger1= anim=1200 || anim=1205
statetype=A
physics=A
[State 1200, statetype]
type=statetypeset
trigger1= anim=1201
statetype=A
physics=N

[State 1200, Vel]
type=velset
trigger1= anim=1200 && animelem=1
x=3.5
y=-4

[State 1200, Vel]
type=velset
trigger1= anim=1201
x=3.5
y=0

[State 1200, spin]
type=playsnd
trigger1= anim=1201 && !(animelemtime(1)%9)
value=1,6
channel=1

[State 1200, Anim]
type=changeanim
trigger1= var(1)!=2
trigger1= anim=1201 && ifelse(var(10)=3,animelemtime(18)>=0,ifelse(var(10)=2,animelemtime(12)>=0,animelemtime(6)>=0))
value=1205
persistent=0
[State 1200, Anim]
type=changeanim
trigger1= var(1)!=1
trigger1= anim=1201 && ifelse(var(10)=3,!animtime,ifelse(var(10)=2,animelemtime(12)>=0,animelemtime(6)>=0))
value=1205
persistent=0

[State 1200, missed]
type=movehitreset
triggerall= var(1)=1
trigger1= movehit=1 && !numtarget
trigger2= movehit=1 && numtarget
trigger2= target,hitshakeover

[State 1200, Hit]
type=hitdef
trigger1= var(1)=1 && (!movehit || var(20))
trigger1= anim=1201 && (animelem=2 || animelem=8 || animelem=14)
attr=A,SA
damage= ifelse(movehit, 21, 98), 7
animtype=Hard
guardflag=MA
hitflag=MAF
priority=4,Hit
pausetime= ifelse(var(20),7,14), ifelse(var(20),7,14)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 80), var(36):=-70
hitsound=s2,6
guardsound=s2,0
ground.type=High
ground.slidetime=16
ground.hittime=16
ground.velocity=-4,-7.5
air.type=Low
air.velocity=-4,-7.5
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity= -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 15,7
givepower=36,36
envshake.time=16
envshake.freq=120
envshake.ampl=4
fall=1
fall.recover=0;!var(20)
;fall.recovertime=37
yaccel=.5
airguard.ctrltime= 16
airguard.velocity= ifelse(var(20),-4,-8), -1.5
forcestand=1
airguard.cornerpush.veloff = 0

[State 1200, hitb]
type=hitdef
trigger1= var(1)=1 && (!movehit || var(20))
trigger1= anim=1201 && (animelem=5 || animelem=11 || animelem=17)
attr=A,SA
damage= ifelse(movehit, 21, 98), 7
animtype=Hard
guardflag=MA
hitflag=MAF
priority=4,Hit
pausetime= ifelse(var(20),7,14), ifelse(var(20),7,14)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 80), var(36):=-70
hitsound=s2,6
guardsound=s2,0
ground.type=High
ground.slidetime=16
ground.hittime=16
ground.velocity=4,-7.5
air.type=Low
air.velocity=4,-7.5
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity= -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 15,7
givepower=36,36
envshake.time=16
envshake.freq=120
envshake.ampl=4
fall=1
fall.recover=0;!var(20)
;fall.recovertime=37
yaccel=.5
p2facing=-1
airguard.ctrltime= 16
airguard.velocity= ifelse(var(20),-4,-8), -1.5
forcestand=1
airguard.cornerpush.veloff = 0

[State 1200, Hit]
type=hitdef
trigger1= var(1)!=1 && hitcount<3
trigger1= anim=1201 && (animelem=2 || animelem=8 || animelem=14 || animelem=20)
attr=A,SA
damage=35,7
animtype=Hard
guardflag=MA
hitflag=MAF
priority=4,Hit
pausetime= ifelse(var(20),7,14), ifelse(var(20),7,14)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 80), var(36):=-70
hitsound=s2,6
guardsound=s2,0
ground.type=High
ground.slidetime=16
ground.hittime=16
ground.velocity=-2.5,-8
air.type=Low
air.velocity=-2.5,-6.5
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity= -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 15,7
givepower=36,36
envshake.time=16
envshake.freq=120
envshake.ampl=4
fall=1
fall.recover=0;!var(20)
;fall.recovertime=ifelse(var(10)=1, 37, 41)
yaccel=.5
airguard.ctrltime= 16
airguard.velocity= ifelse(var(20),-4,-8), -1.5
forcestand=1
airguard.cornerpush.veloff = 0

[State 1200, hitb]
type=hitdef
trigger1= var(1)!=1 && hitcount<3
trigger1= anim=1201 && (animelem=5 || animelem=11 || animelem=17 || animelem=23)
attr=A,SA
damage=35,7
animtype=Hard
guardflag=MA
hitflag=MAF
priority=4,Hit
pausetime= ifelse(var(20),7,14), ifelse(var(20),7,14)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 80), var(36):=-70
hitsound=s2,6
guardsound=s2,0
ground.type=High
ground.slidetime=16
ground.hittime=16
ground.velocity=2.5,-8
air.type=Low
air.velocity=2.5,-6.5
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity= -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 15,7
givepower=36,36
envshake.time=16
envshake.freq=120
envshake.ampl=4
fall=1
fall.recover=0;!var(20)
;fall.recovertime=ifelse(var(10)=1, 37, 41)
yaccel=.5
p2facing=-1
airguard.ctrltime= 16
airguard.velocity= ifelse(var(20),-4,-8), -1.5
forcestand=1
airguard.cornerpush.veloff = 0

[State Idle]
type=statetypeset
trigger1= anim=1205
movetype=I

;======================<JOUDAN SOKUTOU GERI>=============================
[Statedef 1300]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
poweradd=0*!var(20)
juggle=8
sprpriority=1
facep2=1

[State 1300, strengthvar]
type=varset
trigger1= !time && var(59)<=0
var(10)=ifelse((command="qcfc"),3,ifelse(command="qcfb",2,1))

[State 1300, strengthvarAI]
type=varset
trigger1= !time && var(59)>=1
var(10)= ifelse((p2movetype=H || random<333), 1, ifelse(random<500, 2, 3))

[State 1300, Anim]
type=changeanim
trigger1= !time
value=ifelse(var(10)=3,1302,ifelse(var(10)=2,1301,1300))

[State 1300, Vel]
type=velset
trigger1= (anim=[1301,1302]) && animelemtime(4)<0
trigger2= anim=1300 && animelemtime(2)<0
x=4

[State 1300, Snd]
type=playsnd
triggerall= var(1)!=2
trigger1= (anim=[1301,1302]) && animelem=6
trigger2= anim=1300 && animelem=4
value=3,ifelse(var(10)=3,2,ifelse(var(10)=2,7,6))
channel=0
[State 1300, Snd]
type=playsnd
triggerall= var(1)=2
trigger1= (anim=[1301,1302]) && animelem=6
trigger2= anim=1300 && animelem=4
value=13,ifelse(var(10)=3,2,ifelse(var(10)=2,1,3))
channel=0

[State 1300, Snd]
type=playsnd
trigger1= (anim=[1301,1302]) && animelem=6
trigger2= anim=1300 && animelem=4
value=1,6
channel=1
[State 1300, Snd]
type=playsnd
trigger1= anim=1300 && animelem=3
trigger2= (anim=[1301,1302]) && animelem=5
value=0,100

[State 1300, Snd]
type=playsnd
trigger1=animelem=7
value=5,3

[State 1300, Hit]
type=hitdef
trigger1= (anim=[1301,1302]) && animelem=7
trigger2= anim=1300 && animelem=7
attr=S,SA
damage=(70+var(10)*14),7
animtype=Hard
air.animtype=Hard
fall.animtype=Hard
guardflag=M
hitflag=MAF
priority=4,Hit
pausetime= ifelse(var(20),6,12), ifelse(var(20),6,12)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 80), var(36):=-8
hitsound=s2,6
guardsound=s2,0
ground.type=High
ground.slidetime=18+4*var(29)
ground.hittime=18+4*var(29)
ground.velocity= ifelse(var(20), -5.77, -10.52), 0
ground.cornerpush.veloff = 0;ifelse(var(20), -6.82, -12.74)
air.type=Low
air.hittime=18
air.velocity= ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 60,30
givepower=36,36
yaccel=.5
fall.recover=0
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State 0, Shake Screen]
type = EnvShake
trigger1 = AnimElem = 7
time = 12
ampl = 3

[State 4111, spark]
type = explod
trigger1 = AnimElem = 4
anim = 7106
pos = -10,0
scale = .5,.5
sprpriority = 7
ownpal = 1

[State 4111, spark]
type = explod
trigger1 = AnimElem = 7
anim = 3211
scale = 1,1
scale = 1,1
sprpriority = 7
ownpal = 1

[State 1300, Pos]
type=posadd
trigger1= (anim=1300 && animelem=1) || ((anim=[1301,1302]) && animelem=6)
x=15

[State 1300, Pos]
type=posadd
trigger1= (anim=1300 && animelem=6) || ((anim=[1301,1302]) && animelem=7)
x=0

[State 1300, Pos]
type=posadd
trigger1= !animtime
x=5

[State Idle]
type=statetypeset
trigger1= anim=1300 && animelemtime(8)>=0
trigger2= anim=1301 && animelemtime(8)>=0
trigger3= anim=1302 && animelemtime(8)>=0
movetype=I

[State 1300, End]
type=changestate
trigger1= !animtime
value=0
ctrl=1

;======================<KUUCHUU TATSUMAKI SENPUU KYAKU>=============================
[Statedef 1250]
type=A
physics=A
movetype=A
anim=1250
ctrl=0
velset = (Vel x) + ifelse(Vel x >= 0, 1, -1), (Vel y) -1
poweradd=0*!var(20)
sprpriority=1
juggle=8

[State 1250, strengthvar]
type=varset
trigger1= !time && var(59)<=0
var(10)=ifelse((command="qcbc"),3,ifelse(command="qcbb",2,1))
[State 1250, strengthvarAI]
type=varset
trigger1= !time && var(59)>=1
var(10)=3

[State 1360, Vel]
type = VelAdd
trigger1 = AnimElem = 1
x = IfElse(Vel x >= 0, 0.8, -0.8)
y = IfElse(Vel y <= 0, (-2 - var(10)) * 0.225, (2 + var(10))* 0.2)

[State 1260, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(15) >= 0
moveType = I

[State 1250, Snd]
type=playsnd
trigger1= animelem=1 && anim=1250 && vel y<=0
value=14,5
channel=0
[State 1250, Snd]
type=playsnd
trigger1= animelem=1 && anim=1250 && vel y>0
value=3+(var(1)=2)*10,2
channel=0

[State 1250, spin]
type=playsnd
trigger1= anim=1250 && !(animelemtime(4)%9) && animelemtime(26)<0
value=1,6
channel=1

[State 1250, Hit]
type=hitdef
trigger1= animelem=5 || animelem=11 || animelem=17 || animelem=23
trigger1= ifelse(var(1)!=2,!movehit,1)
attr=A,SA
damage=35,7
animtype=Hard
guardflag=HA
hitflag=MAF
priority=4,Hit
pausetime= ifelse(var(20),7,14), ifelse(var(20),7,14)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 80), var(36):=-69
hitsound=s2,6
guardsound=s2,0
ground.type=High
ground.slidetime=16
ground.hittime=16
ground.velocity=-2,-7
air.type=Low
air.velocity=-2,-6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity= -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 30,15
givepower=36,36
envshake.time=16
envshake.freq=120
envshake.ampl=4
fall=1
fall.recover=0;!var(20)
;fall.recovertime=25
yaccel=.5
airguard.ctrltime= 16
airguard.velocity= ifelse(var(20),-4,-8), -1.5
forcestand=1
airguard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0

[State 1250, hitb]
type=hitdef
trigger1= animelem=8 || animelem=14 || animelem=20 || animelem=26
trigger1= ifelse(var(1)!=2,!movehit,1)
attr=A,SA
damage=35,7
animtype=Hard
guardflag=HA
hitflag=MAF
priority=4,Hit
pausetime= ifelse(var(20),7,14), ifelse(var(20),7,14)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 80), var(36):=-70
hitsound=s2,6
guardsound=s2,0
ground.type=High
ground.slidetime=16
ground.hittime=16
ground.velocity=2,-7
air.type=Low
air.velocity=2,-6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity= -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 30,15
givepower=36,36
envshake.time=16
envshake.freq=120
envshake.ampl=4
fall=1
fall.recover=0;!var(20)
;fall.recovertime=25
yaccel=.5
airguard.ctrltime= 16
airguard.velocity= ifelse(var(20),-4,-8), -1.5
forcestand=1
airguard.cornerpush.veloff = 0

[State Idle]
type=statetypeset
trigger1= animelemtime(27)>=0
movetype=I

;======================<CLASSIC AERIAL TATSUMAKI>=============================
[Statedef 1270]
type=A
physics=N
movetype=A
anim=1270
ctrl=0
poweradd=0*!var(20)
sprpriority=1
juggle=8

[State 1270, strengthvar]
type=varset
trigger1= !time && var(59)<=0
var(10)=ifelse((command="hcbc"),3,ifelse(command="hcbb",2,1))
[State 1270, strengthvarAI]
type=varset
trigger1= !time && var(59)>=1
var(10)=3

[State 1270, Vel]
type=velset
trigger1= !time
x= ifelse(vel x<0, -3.5, 3.5)
y=0
[State 1270, Vel]
type=veladd
trigger1= var(10)=1 && time>=13
trigger2= var(10)=2 && time>=23
trigger3= time>=ifelse((backedgebodydist<=0 || frontedgebodydist<=0), 13, 33)
y=.4
[State 1270, Vel]
type=velmul
trigger1= vel y>0
x=.975

[State 1270, Snd]
type=playsnd
trigger1= !time
value=14,5
channel=0

[State 1270, spin]
type=playsnd
trigger1= animelem=5
value=1,6
channel=1

[State 1270, Hit]
type=hitdef
trigger1= animelem=5
trigger1= (!movehit || var(20))
attr=A,SA
damage=35,7
animtype=Hard
guardflag=HA
hitflag=MAF
priority=4,Hit
pausetime= ifelse(var(20),7,14), ifelse(var(20),7,14)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 80), var(36):=-69
hitsound=s2,6
guardsound=s2,0
ground.type=High
ground.slidetime=16
ground.hittime=16
ground.velocity=-3,-6
air.type=Low
air.velocity=-3,-6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity= -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 30,15
givepower=36,36
envshake.time=16
envshake.freq=120
envshake.ampl=4
fall=1
fall.recover=0
yaccel=.5
airguard.ctrltime= 16
airguard.velocity= ifelse(var(20),-4,-8), -1.5
forcestand=1
airguard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0

[State 1270, hitb]
type=hitdef
trigger1= animelem=8
trigger1= (!movehit || var(20))
attr=A,SA
damage=35,7
animtype=Hard
guardflag=HA
hitflag=MAF
priority=4,Hit
pausetime= ifelse(var(20),7,14), ifelse(var(20),7,14)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 80), var(36):=-70
hitsound=s2,6
guardsound=s2,0
ground.type=High
ground.slidetime=16
ground.hittime=16
ground.velocity=3,-6
air.type=Low
air.velocity=3,-6
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.velocity= -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 30,15
givepower=36,36
envshake.time=16
envshake.freq=120
envshake.ampl=4
fall=1
fall.recover=0
yaccel=.5
airguard.ctrltime= 16
airguard.velocity= ifelse(var(20),-4,-8), -1.5
forcestand=1
airguard.cornerpush.veloff = 0

[State 1270, End]
type=changestate
trigger1= pos y>-vel y
value=52

;======================<ASHURA SENKUU>=============================
[Statedef 1400]
type=S
physics=N
movetype=I
anim=1400
velset=0,0
ctrl=0
sprpriority=-1
facep2=1

[State 1400, strengthvar]
type=varset
trigger1= !time && var(59)<=0
var(10)=ifelse(command="df2p",3,ifelse(command="df2k",2,ifelse(command="db2p",-3,-2)))

[State 1400, afterimage]
type = AfterImage
trigger1 = AnimElem = 3
time = 40
TimeGap  = 3
FrameGap = 4
length = 10
PalBright = 1,1,1
PalContrast = ifelse(!var(5), 128, ifelse(var(5) = 1, 50, 150)),ifelse(!var(5), 128, ifelse(var(5) = 1, 50, 50)),ifelse(!var(5), 128, ifelse(var(5) = 1, 150, 50))
PalAdd = 0,0,0
PalMul = .5,.5,.5
trans = add1

[State 1400, Vel]
type=velset
trigger1= animelemtime(2)>0 && animelemtime(6)<0
x=ifelse(var(10)=3,-7,ifelse(var(10)=2,-4,ifelse(var(10)=-3,7,4)))*sin((time-2)/2)
[State 1400, Vel]
type=velset
trigger1= animelem=6
x=ifelse(var(10)=3,12,ifelse(var(10)=2,7.5,ifelse(var(10)=-3,-12,-7.5)))
[State 1400, Vel]
type=velmul
trigger1= animelemtime(6)>ifelse((var(10)=3 || var(10)=-3),16,9)
x=.9

[State 1400, Snd]
type=playsnd
trigger1= animelem=2
value=14,3
channel=0
[State 1400, Snd]
type=playsnd
trigger1= animelem=6
value=5,4
persistent=0

[State 1400, push]
type=playerpush
trigger1= animelemtime(3)>=0
value=0
[State 1400, nothitby]
type=nothitby
triggerall= animelemtime(6)<=ifelse((var(10)=3 || var(10)=-3),35,20)
trigger1= animelemtime(6)<0
trigger2= vel x<0 && backedgebodydist > ifelse((var(10)=3 || var(10)=-3), 12, 8)
trigger3= vel x>0 && frontedgebodydist> ifelse((var(10)=3 || var(10)=-3), 12, 8)
value=SCA,AA,AP,AT
time=1
ignorehitpause=1
[State 1400, Turn]
type=turn
trigger1= animelemtime(6)>0 && p2dist x<0

[State 1400, End]
type=changestate
trigger1= animelemtime(6)=ifelse((var(10)=3 || var(10)=-3),40,25)
trigger2= animelemtime(6)>0 && vel x<0 && backedgebodydist<=0
trigger3= animelemtime(6)>0 && vel x>0 && frontedgebodydist<=0
value=0
ctrl=1
