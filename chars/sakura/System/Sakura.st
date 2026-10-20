; Whirlwind
[Statedef 500] 
Type     = U
MoveType = A
Physics  = N
Anim     = 500
Ctrl     = 0
Facep2   = 1
PowerAdd = 20

[State 500]
Type=Gravity
Trigger1=StateType=A
Trigger1=var(17)!=1

[State 500]
Type=StateTypeSet
Trigger1=pos Y>=0
StateType=S
Physics=S

[State 500]
Type=VelSet
Trigger1=StateType=S
Y=0

[State 500]
Type=VarAdd
Trigger1=time=4
v=16
value=200

[State 220]
Type= PlaySnd
Trigger1= time=4
value=7000,2

[State 220]
Type= PlaySnd
Trigger1= Time=0
Value=310,0

[State 500]
Type=VelSet
Trigger1=StateType=A
Trigger1=time=4
X=-4

[State 220]
Type = Helper
Trigger1 = time=4
StateNo = 501
ID = 501
Name = "Windy"
Pos = 40,0
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 0.6
Size.YScale = 0.6

[State 220]
Type = ChangeState
Trigger1 = Time>40;AnimTime=0
Value = 50*(StateType=A)
Ctrl = 1

[Statedef 501]
type = A
MoveType = A
Physics  = N
Anim     = 10010
SprPriority = 4

[State 221]
Type = HitDef
Trigger1 = time>=1
Trigger1 = !Movehit
Trigger1 = !Movecontact
Attr              = A, NP
Damage            = floor(root,fvar(39)*50),1
getpower = 30,15
GivePower = 0,50
AnimType          = Hard
HitFlag           = MA
GuardFlag         = MA
Priority          = 4,Hit
PauseTime         = 0,0
SparkNo           = S6001
guard.sparkno = S4040
SparkXY           = 25,-40
HitSound          = S0,200
GuardSound        = S0,201
Ground.Type       = High
Air.Type          = Low
Ground.SlideTime  = 35
Ground.HitTime    = 35
Guard.hittime = 7
Air.HitTime       = 35
Ground.Velocity   = -8
Air.Velocity      = -8,-4
AirGuard.Velocity = -8,-4
Air.Fall = 1
Fall.Recover = 1
ID = 501

[State 501]
Type=Parentvarset
Trigger1=movehit=1
fvar(39)=parent,fvar(39)*0.85

[State 1001]
Type = TargetState
Triggerall = NumTarget(501)>0
Triggerall=target,stateno!=[120,160]
Triggerall = (Target(501),StateType != A)
Triggerall = (MoveHit = 1)
trigger1 = target,authorname="Seravy"
Trigger1 = target,selfanimexist(5800)
Trigger2 = target,authorname="GU"
Trigger2 = target,selfanimexist(5800)
Trigger3 = target,authorname="Kurogane"
Trigger3 = target,selfanimexist(5300)
Value = Cond(root,var(39)=43816,899,root,var(39))

[State 501]
Type=Targetstate
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=Cond(numtarget(501),target(501),stateno!=899,1)
Trigger1=MoveHit=1
value=43816

[State 221]
Type = VarSet
Trigger1 = Time = 0
fvar(0) = 8

[State 221]
Type = VarAdd
Trigger1 = Time = [1,21]
fvar(0) = -.325

[State 221]
Type = VelSet
Trigger1 = 1
X = (fvar(0)*Cos(30*(Pi/180.0)))
Y = -fvar(0)*Sin(30*(Pi/180.0))

[State 221]
Type = DestroySelf
Trigger1 = AnimTime=0

[State 221]
Type = AssertSpecial
Trigger1 = 1
Flag = Noshadow
IgnoreHitPause = 1

[State 221]
Type = Trans
Trigger1 = 1
Trans = AddAlpha
Alpha = 136,256

[State 501]
Type=StateTypeSet
Trigger1=movecontact>1
movetype=I


; Fireball
[Statedef 520]
Type     = U
MoveType = A
Physics  = N
Anim     = 560
Ctrl     = 0
Facep2   = 1
PowerAdd = 20

[State 500]
Type=Gravity
Trigger1=StateType=A
Trigger1=var(17)!=1

[State 500]
Type=StateTypeSet
Trigger1=pos Y>=0
StateType=S
Physics=S

[State 500]
Type=VelSet
Trigger1=StateType=S
Y=0

[State 500]
Type=VarAdd
Trigger1=time=16
v=16
value=200

[State 220]
Type= PlaySnd
Trigger1= time=16
value=10020,0

[State 560]
Type=VelSet
Trigger1=time=16
X=-6

[State 220]
Type= PlaySnd
Trigger1= time=3
value=7000,1

[State 250]
Type = Helper
Trigger1 = time=16
StateNo = 521
ID = 521
Name = "FireBall"
Pos = 62,-60
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 0.75
Size.YScale = 0.75

[State 220]
Type = ChangeState
Trigger1 = time>44
Value = 50*(StateType=A)
Ctrl = 1

[Statedef 521]
Type = A
MoveType = A
Physics  = N
Anim     = 10020
SprPriority = 3
Velset = 6.6,0

[State 1071]
Type=AttackDist
Trigger1=1
value=120

[State 1031]
Type=Assertspecial
Trigger1=1
flag=noshadow

[State 1031]
Type = VelSet
Trigger1 = (Anim = 10020) && (MoveContact || MoveReversed)
X=0

[State 1031]
Type = ChangeAnim
Trigger1 = (Anim = 10020) && (MoveContact || MoveReversed)
Value = 10021
IgnoreHitPause = 1
Persistent = 1

[State 1031]
Type = RemoveExplod
Trigger1 = (Anim = 10021) && (AnimTime = 0)
Trigger2 = (FrontEdgeBodyDist < -30)
Trigger3 = pos Y>0

[State 1031]
Type = Destroyself
Trigger1 = (Anim = 10021) && (AnimTime = 0)
Trigger2 = (FrontEdgeBodyDist < -30)
Trigger3 = pos Y>0

[State 1031]
Type = Explod
Trigger1 = anim=10020
Anim = 2028
ID = 2028
Pos = -25+Random%10,-20+Random%40
postype = P1
bindtime=1
removetime=-2
Scale = 1,1
Ownpal = 1
SprPriority = 1
IgnoreHitPause = 1
Persistent = 5

[State 225, 1]
type = Hitdef
Triggerall = !MoveContact
Triggerall = !MoveReversed
Trigger1 = time>=1
attr = A, NP
damage    = floor(root,fvar(39)*95),0
animtype  = Hard
getpower = 30,15
givepower = 0,180
hitflag = MAFP
guardflag = MA
pausetime = 0,0
sparkno=-1
guard.sparkno = S4040
Sparkxy = 20,0
hitsound   = s10020,1
guardsound = S0,201
ground.type = low
ground.slidetime = 6
ground.hittime  = 6
ground.velocity = -4
airguard.velocity = -2,0
air.velocity = -2,-6
air.juggle = 6
fall = 1
fall.recover=0
ID=521

[State 501]
Type=Parentvarset
Trigger1=movehit=1
fvar(39)=parent,fvar(39)*0.8

[State -2]
Type = TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=MoveHit=1
value=43816

[State -2]
Type = Explod
Trigger1=NumTarget(521)>0
Trigger1=MoveHit=1
anim = 6003
ID = 521
Pos = Ceil(target(521),Pos X - Pos X)*Facing,Ceil((target(521),Pos Y - Pos Y))+(target(521),Const(Size.Mid.Pos.Y))
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
SuperMoveTime = 100
PauseMoveTime = 100
Sprpriority=5

[State 2700,Spark]
Type=Helper
Trigger1=NumTarget(521)>0
Trigger1=MoveHit=1
Stateno=6055
ID=6055
Name="Hitspark"
Pos = Ceil(target(521),Pos X - Pos X)*Facing,Ceil((target(521),Pos Y - Pos Y))+(target(521),Const(Size.Mid.Pos.Y))
PosType=P1
ownpal=1
size.xscale=0.5
size.yscale=0.5

[State 2007]
Type = EnvShake
Trigger1 = movehit=1
Time  = 15
Ampl  = 6
Freq  = 100
Phase = 100

; Rain
[Statedef 510]
Type     = U
MoveType = A
Physics  = N
Anim     = 550
Ctrl     = 0
Facep2   = 1
PowerAdd = 20
velset = 0,0

[State 500]
Type=Gravity
Trigger1=StateType=A
Trigger1=var(17)!=1

[State 500]
Type=StateTypeSet
Trigger1=pos Y>=0
StateType=S
Physics=S

[State 500]
Type=VelSet
Trigger1=StateType=S
Y=0

[State 500]
Type=VarAdd
Trigger1=time=12
v=16
value=200

[State 220]
Type= PlaySnd
Trigger1= Time=0
Value=7000,27

[State 220]
Type = Helper
Trigger1 = time=12
StateNo = 511
ID = 511
Name = "RainCloud"
Pos = -25,-180
PosType = Back
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 1
Size.YScale = 1

[State 220]
Type = ChangeState
Trigger1 = time>=45
Value = 50*(StateType=A)
Ctrl = 1

[Statedef 511]
Type=A
MoveType=A
Physics=N
anim=13301
velset=3,0

[State 511]
Type=Hitoverride
Trigger1=1
attr=SAC,AP
stateno=512
time=-1

[State 511]
Type=NotHitBy
Trigger1=1
value=,AA,AT
time=-1

[State 221]
Type = AssertSpecial
Trigger1 = 1
Flag = Noshadow
IgnoreHitPause = 1

[State 541]
Type = Projectile
Trigger1 = gametime %3=0
Attr              = A, NP
Damage            = floor(root,fvar(39)*10),0
getpower = 30,15
AnimType          = Hard
PauseTime         = 0,0
Guard.PauseTime   = 0,4
Offset            = random %21-10,15
Velocity          = 0,5
ProjID            = 511
ProjAnim          = 10131
ProjHitAnim       = -1
ProjRemanim       = -1
ProjHits          = 1
ProjMissTime      = 1
ProjScale         = 0.2,0.2
ProjPriority      = 1
Projheightbound   = -240,1
HitFlag           = MAF
GuardFlag         = MA
SparkNo           = S20003
Guard.SparkNo      = S20003
SparkXY           = 0,5
HitSound          = S13300,0
GuardSound        = S13300,0
Ground.Type       = High
Air.Type          = High
Guard.Dist = 40
Fall.Recover = 0
ID = 511
P2StateNo=43816

[State 511]
Type=Destroyself
Trigger1=FrontEdgeDist <-60

[Statedef 512]

[State 512]
Type=VarAdd
Trigger1=1
var(1)=GetHitVar(damage)

[State 512]
Type=Destroyself
Trigger1=var(1)>=50

[State 512]
Type=ChangeState
Trigger1=1
value=511

; Acceleration
[Statedef 530]
Type     = S
poweradd = 0
MoveType = A
Physics  = N
Anim     = 530
Ctrl     = 0
Facep2   = 1
velset   = 0,0

[State 530]
Type=Playerpush
Trigger1=1
value=0

[State 530]
Type=Poweradd
Trigger1=1
value=0

[State 500]
Type=VarAdd
Trigger1=1
v=16
value=3

[State 220]
Type = Helper
Trigger1 = Time=15
StateNo = 531
ID = 531
Name = "Windy"
Pos = 0,0
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 0.4
Size.YScale = 0.24

[State 530]
Type=VelAdd
Trigger1=Vel X<15
X=0.1

[State 530]
Type=Velset
Trigger1=FrontEdgeBodyDist<10
X=-Vel X

[State 530]
Type=Turn
Trigger1=FrontEdgeBodyDist<10

[State 220]
Type = ChangeAnim
Triggerall = anim!=531
Trigger1 = var(16)>=900
Trigger2 = command="holddown"
Trigger2 = var(59)=0
Trigger3 = Roundstate!=2
Value = 531

[State 220]
Type=PlaySnd
Trigger1= anim=530
Trigger1= time %15=3
value=S310,0

[State 530]
Type=NotHitby
Trigger1=1
value2=,NP

[State 220]
Type = ChangeState
Trigger1 = var(16)>=990
Trigger2 = anim=531
Trigger2 = animtime=0
Value = 0
Ctrl = 1

[Statedef 531]
Type=S
MoveType=A
Physics=N
anim=533
ctrl=0
sprpriority=2

[State 531]
Type=BindToParent
Trigger1=1

[State 531]
Type=Trans
Trigger1=1
trans=addalpha
alpha=192,256

[State 531]
Type=Changeanim
Triggerall = anim!=12061
Trigger1 =parent,stateno!=530
Trigger2 =parent,var(16)>=920
Trigger3 = Roundstate!=2
Trigger4 = parent,anim=531
value=12061

[State 221]
Type = HitDef
Trigger1 = time %3=0
Trigger1 = parent,anim!=531
Trigger1 = anim!=12061
Attr              = S, SA
Damage            = ceil(root,fvar(39)*5),1
getpower = 30,15
AnimType          = Hard
HitFlag           = MA
GuardFlag         = MA
Priority          = 4,Hit
PauseTime         = 0,0
sparkno           = S6001
guard.sparkno = S4040
SparkXY           = 0,-40
HitSound          = S0,200
GuardSound        = S0,201
Ground.Type       = High
Air.Type          = Low
Ground.SlideTime  = 5
Ground.HitTime    = 5
Air.HitTime       = 5
Ground.Velocity   = -7
Air.Velocity      = -7,0
AirGuard.Velocity = -7,0
p1sprpriority=2
p2sprpriority=1
ID = 531

[State 501]
Type=Parentvarset
Trigger1=movehit=1
fvar(39)=parent,fvar(39)*0.97

[State 501]
Type=Targetstate
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=MoveHit=1
value=43816

[State 0, TargetBind]
type = Null;TargetBind
triggerall = NumTarget
Triggerall=target,stateno!=[120,160]
Trigger1=MoveHit=1
time = 3
ID = 531
pos = 10,0
;ignorehitpause = 
;persistent = 


[State 531]
Type=Destroyself
Trigger1=anim=12061
Trigger1=animtime=0


; Sword
[Statedef 540]

[State 540]
Type=Changestate
Trigger1=1
value=600

; Sword
[Statedef 600]
Type= S
Physics =N
MoveType= A
velset=0,0
juggle  = 1
ctrl=0
anim=1020
poweradd=0
facep2=1

[State 300,1]
Type=PlaySnd
Trigger1=time=0
value=7000,15

[State 300]
Type=Null;VarAdd
Trigger1=time=0
var(16)=200

[State 300]
Type=StateTypeSet
Trigger1=AnimElem=10
StateType=A

[State 300]
Type=VelSet
Trigger1=AnimElem=10
X=6
Y=-7

[State 300]
Type=Gravity
Trigger1=StateType=A

[State 221]
Type=Attackdist
Trigger1 = time=0
value=0

[State 221]
Type=HitDef
Trigger1 = time=1
attr = A, SA 
damage = floor(Cond(Ishelper,root,fvar(39),fvar(39))*91*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13221)>0))),0
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag =                     ;Flags on how move is to be guarded against
hitflag = MA                    ;Flags of conditions that move can hit
priority = 7, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
getpower = 60,30
;Hit/Miss/Dodge type (Def: Hit)
sparkno = -1                      ;Spark anim no (Def: set above)
guard.sparkno=-1
;Y-offset for the spark rel. to p1
hitsound =  S12700,1
ground.slidetime = 15             ;Time that the opponent slides back
ground.hittime  = 15             ;Time opponent is in hit state
ground.velocity = -3,-3             ;Velocity at which opponent is pushed
ground.cornerpush.veloff = -4.8
guard.cornerpush.veloff = -5.5
fall=1
ID=540

[State 501]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.8

[State 301]
Type=TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=NumTarget(540)>0
Trigger1=MoveHit=1
value=43816

[State -2]
Type = Helper
Trigger1 = !Ishelper
Trigger1 = NumEnemy != 0
Trigger1 = (Enemy(0),Movetype = H)
Trigger1 = (Enemy(0),StateNo != [5100,5150])
Trigger1 = (Enemy(0),StateNo != [120,160])
Trigger1 = Enemy(0),GetHitvar(chainID) = 540
Trigger1=NumTarget(540)>0
Trigger1=MoveHit=1
StateNo = 6005
ID = 6005
Name = "HitSpark"
Pos = Ceil(Enemy(0),Pos X - Pos X)*Facing,Ceil(Enemy(0),Pos Y - Pos Y)+(Enemy(0),Const(Size.Mid.Pos.Y))
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
SuperMoveTime = 100
PauseMoveTime = 100
Size.XScale = 1
Size.YScale = 1

[State 300,3]
Type=changeState
Trigger1=time>=61
Trigger1=StateType=A
Trigger1=Pos Y>0
Value=601

[Statedef 601]
Type=S
Physics=S
MoveType=I
anim=1022
velset=0,0

[State 541]
Type=ChangeState
Trigger1=animtime=0
value=0
ctrl=1

; Geyser
[Statedef 550]
Type= U
Physics =N
MoveType= I
velset=0,0
ctrl=0
anim=550
poweradd=20
facep2=1

[State 500]
Type=Gravity
Trigger1=StateType=A
Trigger1=var(17)!=1

[State 500]
Type=StateTypeSet
Trigger1=pos Y>=0
StateType=S
Physics=S

[State 500]
Type=VelSet
Trigger1=StateType=S
Y=0

[State 300,1]
Type=PlaySnd
Trigger1=time=0
value=7000,3

[State 300]
Type=VarAdd
Trigger1=time=10
var(16)=200

[State 220]
Type = Helper
Trigger1 = time=10
StateNo = 551
ID = 551
Name = "Water"
Pos = floor(P2Dist X*0.5),floor(-pos Y)
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 1
Size.YScale = 1

[State 220]
Type = ChangeState
Trigger1 = time>=20
Value = 50*(StateType=A)
Ctrl = 1

[Statedef 551]
anim=551
Physics=N
Type=C
MoveType=I
Sprpriority=-12

;**** Burden Relocator
[State 1081]
Type=Parentvarset
Trigger1=time>0
fvar(39)=parent,fvar(39)*fvar(39)

[State 1081]
Type=VarSet
Trigger1=1
fvar(39)=1

[State 551]
Type=AngleDraw
Trigger1=1
scale=0.7,0.3

[State 551]
Type=trans
Trigger1=1
trans=add

[State 300,1]
Type=PlaySnd
Trigger1=time=59
value=550,0

[State 551]
Type = Helper
Trigger1 = Time = [60,72]
StateNo = 552
ID = 552
Name = "WaterDrop"
Pos = 0,-10
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Size.XScale = .25
Size.YScale = .25

[State 2003]
Type = AssertSpecial
Trigger1 = 1
Flag = Noshadow

[State 2003]
Type = AssertSpecial
Trigger1 = time>=73
Flag = Invisible

[State 551]
Type=Destroyself
Trigger1=time>=73
Trigger1=NumHelper(552)=0

[Statedef 552]
Type = A
MoveType = A
Physics  = N
Anim     = 10130
SprPriority = 4

[State 2003]
Type = VelSet
Trigger1 = Time=0
X = (5-random %10)*0.4
Y = -6-random %3

[State 2003]
Type=VelAdd
Trigger1=time>0
Y=0.22

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

[State 2003]
Type = AngleDraw
Trigger1 = 1
Scale = abs(vel Y)*0.125,0.5

[State 221]
Type = Hitdef
Trigger1 = time>=1
Trigger1 = !MoveContact
Trigger1 = !MoveReversed
Attr              = C, NP
Damage            = floor(18*root,fvar(39)*parent,fvar(39))
getpower = 30,15
AnimType          = Medium
HitFlag           = MAF
GuardFlag         = MA
Priority          = 4,Hit
PauseTime         = 0,0
SparkNo           = S20003
Guard.SparkNo     = S20003
SparkXY           = 0,0
HitSound          = S13300,0
GuardSound        = S0,201
Ground.Type       = High
Air.Type          = High
Ground.SlideTime  = 7
Ground.HitTime    = 7
Air.HitTime       = 7
Ground.Velocity   = 0,0
Air.Velocity      = 0,0
AirGuard.Velocity = 0,0
Ground.CornerPush.VelOff = 0
Air.CornerPush.VelOff = 0
Guard.CornerPush.VelOff = 0
AirGuard.CornerPush.VelOff = 0
ID = 2003

[State x]
Type=Parentvarset
Trigger1=movehit=1
fvar(39)=0.82*parent,fvar(39)

[State 501]
Type=Targetstate
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=MoveHit=1
value=43816

[State 2003]
Type = DestroySelf
Trigger1 = MoveContact
Trigger2 = MoveReversed
Trigger3 = (Pos Y > 0)
IgnoreHitPause = 1

[State 2003]
Type = DestroySelf
Trigger1 = (FrontEdgeDist < -100)

; Flameburst
[Statedef 560]
Type     = U
MoveType = A
Physics  = N
Anim     = 560
Ctrl     = 0
Facep2   = 1
PowerAdd = 20

[State 500]
Type=Gravity
Trigger1=StateType=A
Trigger1=var(17)!=1

[State 500]
Type=StateTypeSet
Trigger1=pos Y>=0
StateType=S
Physics=S

[State 500]
Type=VelSet
Trigger1=StateType=S
Y=0

[State 500]
Type=VarAdd
Trigger1=time=15
v=16
value=200

[State 220]
Type= PlaySnd
Trigger1= time=3
value=7000,1

[State 220]
Type= PlaySnd
Trigger1= time=15
value=S560,0

[State 560]
Type=VelAdd
Trigger1=time=[15,39]
X=-0.5
persistent=3

[State 250]
Type = Helper
Trigger1 = time=[15,39]
StateNo = 561
ID = 561
Name = "Flameburst"
Pos = 62,-60
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 3

[State 220]
Type = ChangeState
Trigger1 = time>52
Value = 50*(StateType=A)
Ctrl = 1

[Statedef 561]
anim=1012+random %3
Type=A
Physics=N
MoveType=A
poweradd = 0

[State 1061]
Type=VelSet
Trigger1=time=0
X=0.5*(5+random %7)

[State 1061]
Type=VarSet
Trigger1=time=0
fvar(9)=(random %100)*0.001

[State 1061]
Type=VelAdd
Trigger1=1
Y=-fvar(9)

[State 221]
Type = HitDef
Trigger1 = time=1
Attr              = A, SP
Damage            = floor(root,fvar(39)*10)
getpower = 30,15
givepower = 0,25
AnimType          = Hard
HitFlag           = MAF
GuardFlag         = MA
Priority          = 4,Hit
PauseTime         = 0,0
SparkNo           = S10021
guard.sparkno = S4040
SparkXY           = 15,0
HitSound          = S560,1
GuardSound        = S0,201
Ground.Type       = High
Air.Type          = Low
ground.slidetime = 14
ground.hittime = 14
ground.velocity = -2,0
air.velocity = -2,0
fall = 0
ID=561

[State 501]
Type=Parentvarset
Trigger1=movehit=1
fvar(39)=parent,fvar(39)*0.96

[State -2]
Type = TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=NumTarget(561)>0
Trigger1=MoveHit=1
value=43816

[State 1061]
Type=StateTypeSet
Trigger1=time>=24
Movetype=I

[State 1061]
Type=destroyself
Trigger1=animtime=0

[State 601]
Type=Assertspecial
Trigger1=1
flag=noshadow

;---------------------------------------------------------------------------
; LOSE (Time over)
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0,0

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;---------------------------------------------------------------------------
; DRAWGAME (Time over)
[Statedef 175]
type = S
ctrl = 0
velset = 0,0

[State 175, 1] ; If no anim, use go to lose state.
type = ChangeState
trigger1 = Time = 0
trigger1 = !SelfAnimExist(175)
value = 170

[State 175, 2]
type = ChangeAnim
trigger1 = Time = 0
value = 175

[State 175, 3]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;---------------------------------------------------------------------------
; PREINTRO
[Statedef 190]
type = S
ctrl = 0
velset = 0,0

[State 190, 1]
type = ChangeAnim
trigger1 = SelfAnimExist(190)
value = 190

[State 190, 2] ;Go straight to intro.
type = ChangeState
trigger1 = Time = 0
value = 191

;---------------------------------------------------------------------------
; INTRO (override this state to give character an intro)
[Statedef 191]
type = S
ctrl = 0
anim= 190

[State 191]
Type=PlaySnd
Trigger1=time=0
value=190,0

[State 191, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 0

[Statedef 180]
type = S

[State 180]
Type=VictoryQuote
Trigger1=1
value=1

[State 180]
Type=VictoryQuote
Trigger1=enemy,name="Void"
value=2

[State 180, 2]
type = ChangeState
trigger1 = Time = 0
value = 181
;--------------------------------------------------------------------------
; Win pose 1
[Statedef 181]
type = S
ctrl = 0
anim = 181
velset = 0,0

[State 181, end]
type = AssertSpecial
trigger1 = time <300
flag = RoundNotOver

[State 181]
Type= PlaySnd
Trigger1=time=0
Value=180,0

[Statedef 7800]
Physics=N
anim=9999

[State 7800]
Type=VarSet
Trigger1=1
var(0)=1   

[State 7800]
Type=VarSet
Trigger1=1
var(59)=1  

[State 7800]
Type=VarSet
Trigger1=1
var(1)=2001

[State 7800]
Type=VarSet
Trigger1=1
var(2)=2002

[State 7800]
Type=VarSet
Trigger1=1
var(3)=1001

[State 7800]
Type=VarSet
Trigger1=1
var(4)=2001  

[State 7800]
Type=VarSet
Trigger1=1
var(5)=5002

[State 7800]
Type=VarSet
Trigger1=1
var(6)=2002

[State 7800]
Type=VarSet
Trigger1=1
var(7)=9001

[State 7800]
Type=VarSet
Trigger1=1
var(8)=1501  

[State 7800]
Type=VarSet
Trigger1=1
var(9)=2002  

[State 7800]
Type=VarSet
Trigger1=1
var(10)=2001 

[State 7800]
Type=VarSet
Trigger1=1
var(11)=2001 

[State 7800]
Type=VarSet
Trigger1=1
var(12)=3001

[State 7800]
Type=VarSet
Trigger1=1
var(13)=0003

[State 7800]
Type=VarSet
Trigger1=1
var(14)=2501

[State 7800]
Type=VarSet
Trigger1=1
var(15)=1001

[State 7800]
Type=VarSet
Trigger1=1
var(16)=2001

[State 7800]
Type=VarSet
Trigger1=1
var(17)=6002

[State 7800]
Type=VarSet
Trigger1=1
var(18)=2001

[State 7800]
Type=VarSet
Trigger1=1
var(19)=2001 

[State 7800]
Type=VarSet
Trigger1=1
var(20)=3001

[State 7800]
Type=VarSet
Trigger1=1
var(21)=2001

[State 7800]
Type=VarSet
Trigger1=1
var(22)=1001

[State 7800]
Type=VarSet
Trigger1=1
var(23)=2001

[State 7800]
Type=VarSet
Trigger1=1
var(24)=2001 

[State 7800]
Type=VarSet
Trigger1=1
var(25)=1002

[State 7800]
Type=VarSet
Trigger1=1
var(26)=1501   

[State 7800]
Type=VarSet
Trigger1=1
var(27)=2001 

[State 7800]
Type=VarSet
Trigger1=1
var(28)=1002

[State 7800]
Type=VarSet
Trigger1=1
var(29)=1001 

[State 7800]
Type=VarSet
Trigger1=1
var(30)=2001 

[State 7800]
Type=VarSet
Trigger1=1
var(31)=3001

[State 7800]
Type=VarSet
Trigger1=1
var(32)=4001

[State 7800]
Type=VarSet
Trigger1=1
var(33)=2001  

[State 7800]
Type=VarSet
Trigger1=1
var(34)=1001

[State 7800]
Type=VarSet
Trigger1=1
var(35)=2001   

[State 7800]
Type=VarSet
Trigger1=1
var(36)=1001 

[State 7800]
Type=VarSet
Trigger1=1
var(37)=2001

[State 7800]
Type=VarSet
Trigger1=1
var(38)=3004

[State 7800]
Type=VarSet
Trigger1=1
var(39)=1001

[State 7800]
Type=VarSet
Trigger1=1
var(40)=1001

[State 7800]
Type=VarSet
Trigger1=1
var(41)=2001 

[State 7800]
Type=VarSet
Trigger1=1
var(42)=1002

[State 7800]
Type=VarSet
Trigger1=1
var(43)=1001  

[State 7800]
Type=VarSet
Trigger1=1
var(44)=1001

[State 7800]
Type=VarSet
Trigger1=1
var(45)=2001

[State 7800]
Type=VarSet
Trigger1=1
var(46)=5001 

[State 7800]
Type=VarSet
Trigger1=1
var(47)=1001 

[State 7800]
Type=VarSet
Trigger1=1
var(48)=4001

[State 7800]
Type=VarSet
Trigger1=1
var(49)=1001  

[State 7800]
Type=VarSet
Trigger1=1
var(50)=4001 

[State 7800]
Type=VarSet
Trigger1=1
var(51)=2002

[State 7800]
Type=VarSet
Trigger1=1
var(52)=3001 

[State 7800]
Type=VarSet
Trigger1=1
var(53)=1001 

[State 7800]
Type=ChangeState
Trigger1=1
Value=7801
