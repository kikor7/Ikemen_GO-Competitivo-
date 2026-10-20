; Spinning Slash
[Statedef 1000]
Type= S
Physics =S
MoveType= A
velset=0,0
ctrl=0
anim=1001
poweradd=0

[State x]
Type=Attackdist
Trigger1=1
value=180

[State 1100]
Type=Velset
Trigger1=animelem=3
X=5
Y=-6
persistent=0

[State 1100]
Type=Nothitby
Trigger1=animelem=3,>=0
value=,NP,SP

[State 1100]
Type=Varadd
Trigger1=animelem=3
var(16)=200
persistent=0

[State 1100]
Type=StatetypeSet
Trigger1=animelem=3
statetype=A
Physics=N
persistent=0

[State x]
Type=Gravity
Trigger1=animelem=3,>=0

[State x]
Type=Changestate
Trigger1=animelem=3,>0
Trigger1=pos y>=0
value=1001

[State 0, HitDef]
type = HitDef
trigger1 = Animelem=3,>=0
attr = A,SA
hitflag = MAF      
guardflag = MA        
animtype = Medium
priority = 4,Hit
damage = floor(fvar(39)*20),1
getpower = 60,30
pausetime= 4,4
guard.pausetime=0,0
sparkno = S205
guard.sparkno = S4040
sparkxy = 0,floor(P2dist Y/2+enemynear,const(size.mid.pos.y))
hitsound = S200,0
guardsound = S2000,2
ground.type = High      ;Low,Trip,None
ground.slidetime = 8
ground.hittime = 22
air.hittime = 20
ground.velocity = -2,0
air.velocity = -2,0
id = 1001
persistent=12

[State 200]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.9


[Statedef 1001]
Type=S
Movetype=I
Physics=S
anim=47

[State x]
Type=Posset
Trigger1=1
Y=0

[State x]
Type=Changestate
Trigger1=time>=15
value=0
ctrl=1

; Silent Wall
[Statedef 1010]
Type= S
Physics =S
MoveType= I
velset=0,0
ctrl=0
anim=1010
poweradd=80

[State 1100,1]
Type=PlaySnd
Trigger1=time=4
value=1100,2

[State 1100]
Type=VarAdd
Trigger1=time=4
var(16)=400

[State 1100,2]
Trigger1= Time=4
;Trigger1= NumHelper(1012)=0
Type=Helper
StateNo = 1011
ID = 1011
Name = "Wall"
Pos = 0,0
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 1
Size.YScale = 1

[State x]
Type=Nothitby
Trigger1=1
value=,NP,SP

[State 1100,3]
Type=changeState
Trigger1=Animtime=0
Value=0
ctrl=1

[Statedef 1011]
Type= A
MoveType= H
Physics =N
velset=0,0
ctrl=0
anim=1032

[State 1011]
Type=BindtoParent
Trigger1=1
pos=0,-30
time=1

[State 1011]
Type=Sprpriority
Trigger1=1
value=3

[State x]
Type=Angledraw
Trigger1=1
value=90

[State x]
Type=Trans
Trigger1=1
trans=add

[State 1101]
Type=VarAdd
Trigger1=1
v=0
value=1

[State 1101]
type = HitOverride
trigger1 = 1
attr = SAC,NP,SP
stateno = 1011
time = -1

[State 1101]
Type=Assertspecial
Trigger1=1
Flag=NoShadow

[State 1101]
Type= NotHitBy
Trigger1=1
value= ,AA,AT,HP

[State 1101]
Type=DestroySelf
Trigger1=var(0)>180


; Dimensional Absorber
[Statedef 1020]
Type= S
Physics =S
MoveType= I
velset=0,0
ctrl=0
anim=1020
poweradd=80

[State 1100,1]
Type=PlaySnd
Trigger1=time=4
value=S105,5

[State 1100]
Type=VarAdd
Trigger1=time=4
var(16)=600

[State 1100,2]
Trigger1= Time=4
Type=Helper
StateNo = 1021
ID = 1021
Name = "Spacetime Link"
Pos = 0,0
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = .5
Size.YScale = .2
Supermovetime=9999999
Pausemovetime=9999999

[State 1100,3]
Type=changeState
Trigger1=Animtime=0
Value=0
ctrl=1


[Statedef 1021]
Type=A
MoveType=I
Physics=N
anim=9999
sprpriority=-2

[State x]
Type=Varadd
Trigger1=1
var(0)=1

[State 0, Explod]
type = Explod
trigger1 = 1
postype=P1
pos = random %31-15,-random %90
sprpriority=random %11-5
anim=2011
scale=0.1,0.1
vel=0,-1
accel=0,-0.3
pausemovetime=999999
supermovetime=999999
removetime=-2
bindtime=1

[State 2114]
Type=NotHitBy
Trigger1=1
value=SAC

[State 2112]
Type=PowerAdd
Triggerall=parent,stateno!=2000
Triggerall=parent,stateno!=2200
Triggerall=parent,stateno!=2300
Triggerall=parent,stateno!=2607
Triggerall=Numhelper(2601)=0
Trigger1=GameTime!=root,var(41)
;Trigger1=parent,stateno!=1400
value=16

[State 2112]
Type=AssertSpecial
Trigger1=1
flag=NoShadow

[State 2112]
Type=VarAdd
Triggerall=parent,stateno!=2000
Triggerall=parent,stateno!=2200
Triggerall=parent,stateno!=2300
Triggerall=parent,stateno!=2607
Triggerall=Numhelper(2601)=0
Trigger1=GameTime!=root,var(41)
;Trigger1=parent,stateno!=1400
var(9)=1

[State 2114]
Type=BindToRoot
Trigger1=1
pos=0,0

[State 1010]
Type=Explod
Triggerall=parent,stateno!=2000
Triggerall=parent,stateno!=2200
Triggerall=parent,stateno!=2300
Triggerall=parent,stateno!=2607
Triggerall=Numhelper(2601)=0
Trigger1=GameTime!=root,var(41)
postype=P1
pos = random %31-15,-random %90
sprpriority=random %11-5
anim=2011
scale=1,1
vel=0,0
accel=0,0
pausemovetime=999999
supermovetime=999999
removetime=-2
bindtime=1

[State 2112]
Type=ChangeState
Triggerall=time>120
Trigger1=root,command="Time"
Trigger1=root,var(59)=0
Trigger2=root,var(59)>0
Trigger2=(enemy,power<1000) || (root,var(40)=0)
Trigger2=root,var(40)<=50
Trigger3=RoundState!=2
value=1023

[Statedef 1023]

[State x]
Type=Angledraw
Trigger1=1
scale=1-0.0333*time,1-0.0333*time

[State 2113]
Type=Destroyself
Trigger1=time>30


; Ribbon Revolution
[Statedef 1030]
Type= S
poweradd = 20
Physics =S
MoveType= I
velset=0,0
ctrl=0
anim=1030

[State 1100]
Type=VarAdd
Trigger1=Animelem=2
var(16)=200

[State 1100,2]
Type=Helper
Trigger1= time=[1,21]
persistent=4
StateNo = 1031
ID = 1031
Name = "Ribbon"
Pos = 100+random %50,0
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = .5
Size.YScale = .5

[State 1100,3]
Type=changeState
Trigger1=Animtime=0
Value=0
ctrl=1

[Statedef 1031]
type = C
movetype = A
physics = N
ctrl=0
anim=1005
poweradd=0
sprpriority=2

[State 1300, 1]
type = PlaySnd
trigger1 = time=0
value = S1401,0

[State Hitdef]
type = HitDef
triggerall = !movecontact && !movereversed
trigger1=time
attr = C,  NP
damage = floor(root,fvar(39)*30),3
getpower = 30,15
animtype = Light
guardflag = LA
hitflag = MAF
priority = 4, Hit
pausetime = 0,0
guard.pausetime = 0,0
sparkno = -1
guard.sparkno= S4040
sparkxy = 0,floor(P2dist Y)
hitsound = S0,104
guardsound = S2000,2
ground.type = Low
air.type = Low
ground.hittime= 15
guard.hittime=8
ground.velocity = -4,0
guard.velocity=-4
air.velocity =-3,-3
airguard.velocity=-3,-3

[State x]
Type=Helper
Trigger1=movehit=1
pos=0,floor(P2dist Y)
postype=P1
stateno=1032
ID=1032
ownpal=1
size.xscale=1
size.yscale=1

[State Dampener]
Type=ParentVarset
Trigger1=movehit=1
fvar(39)=parent,fvar(39)*0.92
ignorehitpause=1
persistent=0

[State RemoveHelper]
type = Statetypeset
Trigger1=animelem=24
movetype=I

[State RemoveHelper]
type = Destroyself
trigger1 = Animtime=0

[Statedef 1032]
anim=205

[State x]
Type=Angledraw
Trigger1=1
scale=1,1
value=90

[State ]
type = Assertspecial
Trigger1=1
flag=Noshadow

[State 0, Trans]
type = Trans
trigger1 = 1
trans =add 

[State x]
Type=destroyself
Trigger1=animtime=0


; 
[Statedef 1040]
type    = U
poweradd = 20
movetype= A
physics = N
velset = 0,0
anim = 1040
ctrl = 0
sprpriority = 1
facep2=1

[State 1100]
Type=VarAdd
Trigger1=Animelem=3
var(16)=200

[State 1000]
Type=VelAdd
Trigger1=Statetype=A
Y=const(movement.yaccel)

[State 1000]
Type=StateTypeSet
Trigger1=Pos Y>=0
Statetype=S

[State 1000]
Type=VelSet
Trigger1=Statetype=S
X=0
Y=0

[State 1000]
Type=PosSet
Trigger1=Statetype=S
Y=0

[State 1300, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S1400,0

[State 220, 2]
type = Helper
trigger1 = time=0
id = 1041
name = "Saturn"
pos = 80,-70
postype = p1
stateno = 1041
keyctrl = 0
ownpal = 1
size.xscale=0.2
size.yscale=0.2

[State 1300, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 50*(Statetype=A)
ctrl = 1

[Statedef 1041]
Type=C
MoveType=A
Physics=N
velset=0,0
anim=1301
poweradd=0
sprpriority=3

[State 1041]
Type=Bindtoparent
Trigger1=time<15
pos=80,-70

[State 1041]
Type=Velset
Trigger1=time=15
X=5

[State x]
Type=Angledraw
Trigger1=1
value=time*4
scale=Cond(time<15,time/15.0,1),Cond(time<15,time/15.0,1)

[State 1101]
Type=Assertspecial
Trigger1=1
Flag=NoShadow

[State 1200, 2]
type = HitDef
trigger1 = time>=1
trigger1 = !Movecontact
trigger1 = !Movereversed
attr = A, NP
damage    = floor(parent,fvar(39)*80),0
getpower = 30,15
givepower = 0,100-350*(root,var(54)=1)
hitflag = MAP
guardflag = MA
pausetime = 0,10
sparkno = S6015
guard.sparkno=S4040
sparkxy = 0,0
hitsound   = S6,0
guardsound = S2000,2
ground.type = High
ground.slidetime = 5
ground.hittime  = 5
ground.velocity = -3
guard.velocity = 0
airguard.velocity = 0,0
air.velocity = -3,0
air.juggle = 3

[State 200]
Type=ParentVarset
Trigger1=movehit=1
fvar(39)=parent,fvar(39)*0.82
ignorehitpause=1
persistent=0

[State 1301]
Type=Assertspecial
Trigger1=1
flag=noshadow

[State 1301]
Type=Trans
Trigger1=1
trans=add

[State 1042]
type = HitOverride
Trigger1=1
attr = SCA, AA,AP,AT
stateno = 1042
time = -1

[State 1001]
Type=DestroySelf
Trigger1=FrontEdgeDist<-30
Trigger2=MoveContact
Trigger3=MoveReversed
Trigger4=time<15
Trigger4=parent,stateno!=1040

[Statedef 1042]
Type=C
MoveType=I
Physics=N
velset=0,0
anim=6015

[State 1301]
Type=Assertspecial
Trigger1=1
flag=noshadow

[State 1301]
Type=Trans
Trigger1=1
trans=add

[State 1001]
Type=DestroySelf
Trigger1=animtime=0


; DFX - Skydome
[Statedef 1050]
type    = S
poweradd = 20
movetype= A
physics = S
velset = 0,0
anim = 1050
ctrl = 0
sprpriority = 1
facep2=1

[State 1100]
Type=VarAdd
Trigger1= time=7
var(16)=200

[State 2000]
Type=Helper
Trigger1=time=[7,40]
StateNo=1051
ID=1051+ floor(time/3)
pos=0,0
PosType=P1
persistent=3

[State 2000]
Type=PlaySnd
Trigger1=time=7
value=S2000,1
channel=0

[State 0, Explod]
type = Explod
trigger1 = time>=7
anim = 1000
ID = 1050
pos = floor(75*cos((Pi/180.0)*15*(time/3.0-2))),-floor(75*sin((Pi/180.0)*15*(time/3.0-2)))-57
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 8
scale = 0.05,0.05
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 0


[State 2000]
Type=ChangeState
Trigger1=animtime=0
value=0
ctrl=1

[Statedef 1051]
type=A
movetype=A
Physics=N
poweradd= 0
anim=2020

[State 2001]
Type=HitOverRide
Trigger1=1
attr=SAC,AA,AP,AT
Stateno=1052
time=-1

[State 2003]
Type = VarSet
Trigger1 = Time = 0
fvar(0) = (Pi/180.0)*floor(parent,time/3-2)*15

[State 2003]
Type = VelSet
Trigger1 = 1
X = 5*Cos(fvar(0))
Y = -5*Sin(fvar(0))

[State 2003]
Type = Trans
Trigger1 = 1
Trans = Add

[State 2003]
Type = AssertSpecial
Trigger1 = 1
Flag = Noshadow
IgnoreHitPause = 1

[State 2003]
Type = AngleSet
Trigger1 = (Vel X != 0)
Value = ATan(Vel Y/Vel X)*(-180.0/Pi)+((Vel X<0)*180)

[State 2003]
Type = AngleSet
Trigger1 = (Vel X = 0)
Value = IfElse(Vel Y<0,90,-90)

[State 2001]
Type=PosAdd
Trigger1=time=0
X=15*vel X
Y=15*vel Y-57

[State 2003]
Type = AngleAdd
Trigger1=1
value=90

[State 2003]
Type = AngleDraw
Trigger1 = 1
Scale = 0.5-(time<10)*0.05*(10-time),0.5-(time<10)*0.05*(10-time)

[State 200,2]
type = HitDef
trigger1 = time>=1
attr = A, NP                     ;Attribute: Standing, Normal Attack
getpower = 30,15
damage = floor(parent,fvar(39)*60),0
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MAFP                   ;Flags of conditions that move can hit
priority = 6, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 0, 5                 ;Time attacker pauses, time opponent shakes
sparkno = S6015                    ;Spark anim no (Def: set above)
guard.sparkno=S4040
SparkXY = 0,0
hitsound = S2000,0                  ;Sound to play on hit
guardsound = S2000,2
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 5             ;Time opponent is in hit state
ground.velocity = 0,0             ;Velocity at which opponent is pushed
airguard.velocity = -2,-4     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = Low                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -2,-4           ;X-velocity at which opponent is pushed,
air.hittime = 5                 ;Time before opponent regains control in air
guard.kill=0

[State 2001]
Type=ParentVarSet
Trigger1=Movehit=1
fvar(39)=parent,fvar(39)*0.75

[State 2001]
Type=destroyself
Trigger1=time>=100
Trigger2=movecontact
Trigger3=MoveReversed

[Statedef 1052]
anim=6015

[State 2002]
Type=AngleDraw
Trigger1=1
scale=0.3,0.3

[State 2002]
Type=Trans
Trigger1=1
trans=Add

[State 2002]
Type=Destroyself
Trigger1=animtime=0




; Cosmic Debris
[Statedef 1060]
type    = A
movetype= I
physics = A
anim = 41
ctrl = 0
sprpriority = 1
velset = -2,-8

[State 1499,1]
type= ChangeState
Trigger1= Pos Y<-90
Trigger2= time>20
value=1061

[Statedef 1061]
type    = A
movetype= A
physics = A
anim = 620
velset = 0,0
ctrl = 0
sprpriority = 1
facep2=1

[State 1500,1 ]
type = PlaySnd
trigger1 = AnimElem = 3
value = 105,4

[State 1500,3]
type = VelSet
trigger1 = animelem = 3
x = -2.2
y = -5

[State 1500,4]
type = Null;SuperPause
time = 20
anim = S20000
trigger1 = AnimElem = 3
sound = S5,1
unhittable = 1
poweradd = -1000

[State 1100]
Type=VarAdd
Trigger1=Animelem=3
var(16)=200

[State 1500, 6]
type = Projectile
trigger1 = AnimElem = 3
ProjID = 1501
projanim = 1501
projhitanim = 1501
projhits = 1
projscale = 0.5,0.5
offset = 30,-30
projremove = 1
projremovetime=100
projpriority=2
velocity = 4, 3
attr = A, NP
damage    = floor(fvar(39)*35),0
getpower  = 42
guardflag = MA
hitflag = MAF
pausetime = 0,6
sparkno = S6015
guard.sparkno = S4040
sparkxy = 0,0
hitsound   = S12,3
guardsound = S5500,2
ground.type = High
ground.slidetime = 8
ground.hittime  = 8
ground.velocity = -8
airguard.velocity = -3.5,0
air.velocity = -2.5,-5.5
air.juggle = 3
ID=2001

[State 1500, 7]
type = Projectile
trigger1 = AnimElem = 3
ProjID = 1501
projanim = 1501
projpriority=2
projhitanim = 1501
projhits = 1
projscale = 0.5,0.5
offset = 30,-30
projremove = 1
projremovetime=100
velocity = 3, 3
attr = A, NP
damage    = floor(fvar(39)*35),0
getpower  = 42
guardflag = MA
hitflag = MAF
pausetime = 0,12
sparkno = S6015
guard.sparkno = S4040
sparkxy = 0,0
hitsound   = S5500,2
guardsound = S6,0
ground.type = High
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -8
airguard.velocity = -3.5,0
air.velocity = -2.5,-5.5
air.juggle = 3
ID=2001

[State 1500, 8]
type = Projectile
trigger1 = AnimElem = 3
ProjID = 1501
projanim = 1501
projpriority=2
projhitanim = 1501
projhits = 1
projscale = 0.5,0.5
offset = 30,-30
projremove = 1
projremovetime=100
velocity = 5, 3
attr = A, NP
damage    = floor(fvar(39)*35),0
getpower  = 42
guardflag = MA
hitflag = MAF
pausetime = 0,12
sparkno = S6015
guard.sparkno = S4040
sparkxy = 0,0
hitsound   = S5500,2
guardsound = S6,0
ground.type = High
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -8
airguard.velocity = -3.5,0
air.velocity = -2.5,-5.5
air.juggle = 3
ID=2001

[State 1500, 9]
type = ChangeState
trigger1 =animtime=0
value = 50
ctrl = 1


; Planetary Rain
[Statedef 1070]
Type= S
Physics =S
MoveType= I
velset=0,0
ctrl=0
anim=1010
poweradd=20

[State 1100]
Type=VarAdd
Trigger1=time=4
var(16)=200

[State 1100,2]
Trigger1= Time=[4,20]
Type=Helper
StateNo = 1071
ID = 1071
Name = "Saturn"
Pos = -10,-110
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 2
Size.XScale = .125
Size.YScale = .125

[State 1100,3]
Type=changeState
Trigger1=Animtime=0
Value=0
ctrl=1

[Statedef 1071]
type = A
movetype = A
physics = N
ctrl=0
anim=1301
poweradd=0
sprpriority=2
velset=0,-8

[State x]
Type=Nothitby
Trigger1=1
value=SAC

[State 1100]
Type=Playsnd
Trigger1=time=4
value=S1,3

[State x]
Type=Varset
Trigger1=time=0
var(2)=random %61-30

[State x]
Type=PalFX
Trigger1=1
mul=512,512,512
time=-1

[State x]
Type=Varset
Trigger1=time=0
var(0)=random %360

[State x]
Type=Varset
Trigger1=time=0
var(1)=random %50

[State x]
Type=Posadd
Trigger1=time=0
X=floor(sin(var(0)*pi/180.0)*var(1))
Y=floor(cos(var(0)*pi/180.0)*var(1)*0.3)

[State 3560, Effect]
type = Explod
trigger1 = 1
anim = 2011
postype = p1
pos = floor(12*sin(time*pi/25)),0
scale=.25,.25
vel = 0,0
bindtime=1
removetime=-2
sprpriority = 4

[State 3560, Effect]
type = Explod
trigger1 = 1
anim = 2011
scale=.25,.25
postype = p1
pos = -floor(12*sin(time*pi/25)),0
vel = 0,0
bindtime=1
removetime=-2
sprpriority = 4

[State x]
Type=Velset
Trigger1=pos Y<=-300
Trigger1=random<50
X=(random %11-5)*0.1
Y=3

[State Hitdef]
type = HitDef
triggerall = !movecontact && !movereversed
trigger1=time
attr = A,  NP
damage = floor(root,fvar(39)*50)
getpower = 30,15
animtype = Light
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 0,0
guard.pausetime = 0,0
sparkno = S6015
guard.sparkno= S4040
sparkxy = 0,0
hitsound = S2000,0
guardsound = S2000,2
ground.type = High
air.type = High
ground.hittime  = 18
guard.hittime= 9
ground.velocity = 0,0
guard.velocity=0
air.velocity =0,0
airguard.velocity=0,0

[State Dampener]
Type=ParentVarset
Trigger1=movehit=1
fvar(39)=parent,fvar(39)*0.8
ignorehitpause=1
persistent=0

[State RemoveHelper]
type = Destroyself
trigger1 = movecontact
Trigger2 = movereversed
Trigger3 = pos Y>=0


