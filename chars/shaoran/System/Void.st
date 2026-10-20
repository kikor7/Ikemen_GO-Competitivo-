; Stargun
[StateDef 500]
Type        = U
MoveType    = A
Physics     = N
Anim        = 300
SprPriority = 1
VelSet      = 0,0
ctrl=0

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
Type=ChangeState
Triggerall=time>8
Trigger1=command !="holda"
Trigger1=fvar(22)!=1
Trigger1=var(59)=0
Trigger2=time >83
Trigger3=var(16)>=1000
Trigger4=var(59)!=0
Trigger4=(var(16)>900) || (random<10)
Trigger5=command !="holdx"
Trigger5=fvar(22)=1
Trigger5=var(59)=0
value=50*(StateType=A)
ctrl=1

[State 500]
Type=VarAdd
Trigger1=time %10=3
v=16
value=50

[State 500]
Type=Helper
Trigger1=time %10=3
StateNo = 501
ID = 501
Name = "Star"
Pos = 45,-60
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Size.xscale=0.25
Size.yscale=0.25

[StateDef 501]
Type        = A
MoveType    = A
Physics     = N
Anim        = 6130+random %9
SprPriority = 2
VelSet      = 0,0
Poweradd    = 0

[State 502]
Type=Attackdist
Trigger1=1
value=45

[State 501]
Type=VelSet
Trigger1=time=0
X=3
Y=(random %10-5)*0.2

[State 501]
Type = AssertSpecial
Trigger1       = 1
Flag           = Noshadow

[State 501]
Type=PlaySnd
Trigger1=time=0
value=S501,0

[State 4202]
Type= VarSet
Trigger1=time=0
v=0
value=64+random %192

[State 4202]
Type= VarSet
Trigger1=time=0
v=1
value=64+random %192

[State 4202]
Type= VarSet
Trigger1=time=0
v=2
value=64+random %192

[State 4202]
Type=PalFX
Trigger1=1
mul=var(0),var(1),var(2)
time=1

[State 4202]
Type=Trans
trigger1=1
Trans = Add

[State 501]
Type=Explod
Trigger1=random<200
Trigger1=movecontact || movereversed
anim=6130+random %9
ID=502
vel=vel X*0.5,vel Y*0.5
pos=floor(-vel X*3),floor(-vel Y*3)
removetime=-2
bindtime=1
scale=0.05,0.05
trans=add

[State 221]
Type = hitdef
Trigger1 = !movecontact
Trigger1 = !Movereversed
Attr              = A, NP
Damage            = floor(20*root,fvar(39)),0
GetPower          = 50,10
GivePower = 0,50
AnimType          = Hard
HitFlag           = MAF
GuardFlag         = MA
Priority          = 4,Hit
PauseTime         = 0,0
SparkNo           = -1
guard.sparkno = S4040
SparkXY           = 10,0
HitSound          = S501,1
GuardSound        = S0,201
Ground.Type       = High
Air.Type          = Low
Ground.SlideTime  = 14
Ground.HitTime    = 14
Air.HitTime       = 14
Ground.Velocity   = -6,0
Air.Velocity      = -6,0
AirGuard.Velocity = -3,0
Air.Fall = 1
Fall.Recover = 1
Guard.Kill = 0
Guard.dist=45
ID = 502

[State 521]
Type=TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=movehit=1
value=43816

[State 501]
Type=ParentVarSet
Trigger1=movehit=1
fvar(39)=parent,fvar(39)*0.86

[State 501]
Type=ChangeAnim
Trigger1=movecontact || movereversed
Trigger1=Anim!=20001
value=20001

[State 501]
Type=DestroySelf
Trigger1=Movecontact || Movereversed
Trigger1=Animtime=0
Trigger2=Time>150


; Starfall
[StateDef 510]
Type        = U
MoveType    = A
Physics     = N
Anim        = 370
SprPriority = 1
VelSet      = 0,0
ctrl=0

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
Type=ChangeState
Trigger1=Time>30
value=50*(StateType=A)
ctrl=1

[State 500]
Type=VarAdd
Trigger1=time=0
v=16
value=200

[State 500]
Type=Helper
Trigger1=time=0
StateNo = 511
ID = 511
Name = "Star"
Pos = 0,-250
PosType = P2
Ownpal = 1
IgnoreHitPause = 1
Size.xscale=0.5
Size.yscale=0.5

[StateDef 511]
Type        = A
MoveType    = A
Physics     = N
anim        = 6130+random %9
SprPriority = 2
VelSet      = 0,0
poweradd    = 0

[State 501]
Type=VelAdd
Trigger1=1
X=0
Y=0.1

[State 501]
Type=Explod
Trigger1=Pos Y<-50
anim=6130+random %9
ID=502
vel=vel X*0.1,vel Y*0.1
pos=random %21-10,-10
removetime=-2
bindtime=1
scale=0.1,0.1
trans=add

[State 501]
Type=PlaySnd
Trigger1=time=0
value=S511,0

[State 501]
Type = AssertSpecial
Trigger1       = 1
Flag           = Noshadow

[State 501]
Type=Null;AngleSet
Trigger1=1
value=time*3

[State 4202]
Type= VarSet
Trigger1=time=0
v=0
value=64+random %192

[State 4202]
Type= VarSet
Trigger1=time=0
v=1
value=64+random %192

[State 4202]
Type= VarSet
Trigger1=time=0
v=2
value=64+random %192

[State 4202]
Type=PalFX
Trigger1=1
mul=var(0),var(1),var(2)
time=1

[State 4202]
Type=Trans
trigger1=1
Trans = Add

[State 500]
Type=Helper
Trigger1=movehit=1
;Trigger2=root,ProjGuardedTime(var(21))=0
StateNo = 513
ID = 513
Name = "StarHitspark"
Pos = 0,0
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Size.xscale=1
Size.yscale=1

[State 221]
Type = Hitdef
Trigger1 = !movecontact
Trigger1 = !movereversed
Trigger2 = movehit=6
Trigger2 = hitcount<3
Attr              = A, NP
Damage            = floor(35*root,fvar(27)),0
GetPower          = 50,10
AnimType          = Hard
HitFlag           = MAF
GuardFlag         = MA
Priority          = 4,Hit
PauseTime         = 0,0
SparkNo           = -1
guard.sparkno = S4040
SparkXY           = 0,20
HitSound          = S12200,1
GuardSound        = S0,201
Ground.Type       = High
Air.Type          = Low
Ground.SlideTime  = 16
Ground.HitTime    = 16
Air.HitTime       = 16
Ground.Velocity   = 0,-3
Air.Velocity      = 0,-3
AirGuard.Velocity = 0,-3
Fall=1
Air.Fall = 1
Fall.Recover = 1
Guard.Kill = 0
palfx.add=200,200,200
Palfx.mul=var(0),var(1),var(2)
palfx.time=15
ID=512

[State 521]
Type=TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=movehit=1
value=43816

[State 501]
Type=ParentVarSet
Trigger1=movehit=1
fvar(39)=parent,fvar(39)*0.8

[State 501]
Type=DestroySelf
Trigger1=Pos Y>=0

[Statedef 513]
Type=A
MoveType=I
Physics=N
Anim=20001
Sprpriority=3
velset=0,0

[State 513]
Type=Assertspecial
Trigger1=1
flag=noshadow

[State 4202]
Type=PalFX
Trigger1=1
mul=parent,var(0),parent,var(1),parent,var(2)
time=1

[State 513]
Type=Destroyself
Trigger1=animtime=0

; Laser
[StateDef 520]
Type        = U
MoveType    = A
Physics     = N
Anim        = 300
SprPriority = 1
VelSet      = 0,0
ctrl=0

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

[State 520]
Type=AttackDist
Trigger1=1
value=999

[State 500]
Type=ChangeState
Trigger1=Time>80
value=50*(StateType=A)
ctrl=1

[State 500]
Type=VarAdd
Trigger1=time=0
v=16
value=200

[State 500]
Type=Helper
Trigger1=time=0
StateNo = 521
ID = 521
Name = "Laser"
Pos = 45,-60
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Size.xscale=1
Size.yscale=1

[State 460]
Type = PlaySnd
Trigger1 = Time=25
Value = S12200,0

[StateDef 521]
MoveType = A
Physics  = N
Anim     = 10091
SprPriority = 4
Poweradd = 20

[State 520]
Type=AttackDist
Trigger1=1
value=999

[State 461]
Type = VarAdd
Trigger1 = (Time < 10) || (Time > 55)
fvar(0) = IfElse(Time<10,.125,-.25)

[State 461]
Type = VarSet
Trigger1 = (Time = [10,55])
fvar(0) = IfElse(Time=40,1,IfElse(Time=60,1,.5+Random/666.0))

[State 461]
Type = VarSet
Trigger1 = Time = 26 || Time = 36
fvar(1) = 0

[State 461]
Type = VarAdd
Trigger1 = (Time = [16,55])
fvar(1) = .25

[State 461]
Type = Trans
Trigger1 = 1
Trans = Add

[State 461]
Type = AssertSpecial
Trigger1 = 1
Flag = Noshadow

[State 461]
Type = EnvShake
Trigger1 = Time = 26 || Time = 36
Time  = 10
Ampl  = -3
Freq  = 90
Phase = 90

[State 461]
Type = BindToParent
Trigger1 = 1
Time = 1
Pos = 45,-72
IgnoreHitPause = 1

[State 461]
Type = AngleDraw
Trigger1 = 1
Scale = fvar(0),fvar(0)

[State 461]
Type = Explod
Trigger1 = Time = 26 || Time = 36
Anim = 10092
ID = 462
Pos = -3,0
Facing = IfElse(Facing=1,1,-1)
Ownpal = 1
SprPriority = IfElse(Facing=1,5,-5)
IgnoreHitPause = 1

[State 461]
Type = Explod
Trigger1 = Time = 26 || Time = 36
Anim = 10093
ID = 462
Pos = -3,0
Facing = IfElse(Facing=1,1,-1)
Ownpal = 1
SprPriority = IfElse(Facing=1,-5,5)
IgnoreHitPause = 1

[State 461]
Type = Helper
Trigger1 = Time = 2
StateNo = 524
ID = 464
Name = "Laser"
Pos = 0,0
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 1
Size.YScale = 1

[State 461]
Type = Helper
Trigger1 = Time = 2
StateNo = 524
ID = 465
Name = "Laser"
Pos = 0,0
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 1
Size.YScale = 1

[State 461]
Type = Helper
Trigger1 = Time = 2
StateNo = 524
ID = 466
Name = "Laser"
Pos = 0,0
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 1
Size.YScale = 1

[State 461]
Type = Helper
Trigger1 = Time = 2
StateNo = 524
ID = 467
Name = "Laser"
Pos = 0,0
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 1
Size.YScale = 1

[State 461]
Type = Helper
Trigger1 = Time = 2
StateNo = 524
ID = 468
Name = "Laser"
Pos = 0,0
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 1
Size.YScale = 1

[State 461]
Type = ModifyExplod
Trigger1 = NumExplod(462) > 0
ID = 462
Scale = .35+fvar(1)/3.0,1+fvar(1)

[State 461]
Type = RemoveExplod
TriggerAll = NumExplod(462) > 0
trigger1 = Root,stateno!=520
ID = 462
IgnoreHitPause = 1

[State 461]
Type = Projectile
Trigger1 = Time = 26 || Time = 36
Attr              = A, SP
Damage            = floor(65*root,fvar(39)),5
GetPower          = 50,10
AnimType          = Hard
PauseTime         = 0,4
Guard.PauseTime   = 0,4
Offset            = 0,0
Velocity          = 0,(Root,Vel Y)
ProjID            = 521
ProjAnim          = 10095
ProjHitAnim       = -1
ProjRemanim       = -1
ProjHits          = 1
ProjMissTime      = 1
ProjScale         = .5,.5
ProjPriority      = 9999
ProjRemove        = 0
ProjRemoveTime    = 3
ProjHeightBound   = -1000,50
ProjEdgeBound     = 9999
ProjStageBound    = 9999
HitFlag           = MAF
GuardFlag         = MA
SparkNo           = -1
Guard.SparkNo      = -1
SparkXY           = 0,999
HitSound          = S12200,1
GuardSound        = S0,201
Ground.Type       = High
Air.Type          = High
Ground.SlideTime  = 19
Ground.HitTime    = 19
Air.HitTime       = 19
Ground.Velocity   = -6.5,-4
Guard.Velocity    = -4
Air.Velocity      = -6.5,-3.5
AirGuard.Velocity = -6,-.25
Guard.Kill=0
Fall = 1
Fall.Recover = 1
ID = 521
P2StateNo=43816

[State -2]
Type = Helper
Trigger1 = NumEnemy != 0
Trigger1 = (Enemy(0),Movetype = H)
Trigger1 = (Enemy(0),StateNo != [5100,5150])
Trigger1 = (Enemy(0),StateNo != [120,160])
Trigger1 = Enemy(0),GetHitvar(chainID) = 521
Trigger1 = (time = 27) || (time=37)
StateNo = 6010
ID = 6012
Name = "HitSpark"
Pos = Ceil(Enemy(0),Pos X - Pos X)*Facing,Ceil(Enemy(0),Pos Y - Pos Y)+(Enemy(0),Const(Size.Mid.Pos.Y))
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
SuperMoveTime = 100
PauseMoveTime = 100
Size.XScale = 0.5
Size.YScale = 0.5

[State 6005]
Type = Helper
Trigger1 = NumEnemy > 1
Trigger1 = (Enemy(1),Movetype = H)
Trigger1 = (Enemy(1),StateNo != [5100,5150])
Trigger1 = (Enemy(1),StateNo != [120,160])
Trigger1 = Enemy(1),GetHitvar(chainID) = 521
Trigger1 = (time = 27) || (time=37)
StateNo = 6010
ID = 6012
Name = "HitSpark"
Pos = Ceil(Enemy(1),Pos X - Pos X)*Facing,Ceil(Enemy(1),Pos Y - Pos Y)+(Enemy(1),Const(Size.Mid.Pos.Y))
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
SuperMoveTime = 100
PauseMoveTime = 100
Size.XScale = 0.5
Size.YScale = 0.5

[State 461]
Type = DestroySelf
Trigger1 = Time > 0
Trigger1 = fvar(0) <= 0
trigger2 = Root,stateno!=520

[Statedef 524]
Type= A
MoveType=A
Physics  = N
Anim     = 10094
SprPriority = 3

[State 464]
Type = VarAdd
Trigger1 = Time = [1,23]
fvar(0) = IfElse(Time<14,.00625,IfElse(Time<15,2.8,IfElse(Time<24,-.29,-.02)))

[State 464]
Type = VarSet
Trigger1 = Time = 24 || Time = 34
fvar(0) = 2.85

[State 464]
Type = VarAdd
Trigger1 = (Time = [25,33]) || (Time > 34)
fvar(0) = IfElse(Time<44,-.29,-.02)

[State 464]
Type = VarAdd
Trigger1 = Time > 34
fvar(1) = IfElse(IsHelper(467),.1,IfElse(IsHelper(468),.1,.07))

[State 464]
Type = Trans
Trigger1 = 1
Trans = Add

[State 464]
Type = AssertSpecial
Trigger1 = 1
Flag = Noshadow

[State 464]
Type = BindToRoot
Trigger1 = 1
Time = 1
Pos = 45,-72
IgnoreHitPause = 1

[State 4202]
Type= VarSet
Trigger1=time=0
v=0
value=-random %100

[State 4202]
Type= VarSet
Trigger1=time=0
v=1
value=random %100

[State 4202]
Type= VarSet
Trigger1=time=0
v=2
value=-random %100

[State 4202]
Type=PalFX
Trigger1=1
add=var(0),var(1),var(2)
time=1

[State 464]
Type = AngleDraw
Trigger1 = 1
Value = IfElse(IsHelper(464),0,IfElse(IsHelper(465),4.5+fvar(1),IfElse(IsHelper(466),-4.5-fvar(1),IfElse(IsHelper(467),9+fvar(1),-9-fvar(1)))))
Scale = IfElse(Time<14,.2+Time*.115,1.5),.05+fvar(0)

[State 464]
Type = DestroySelf
Trigger1 = Time > 5
Trigger1 = fvar(0) <= -0.05
Trigger2 = Root,StateNo != 520

; Absorption
[Statedef 530]
Type     = U
MoveType = I
Physics  = N
Ctrl     = 0
Velset	 =0,0
anim=310
poweradd=-2000

[State 530]
Type=HitFallSet
Trigger1=1
value=0

[State 13360]
Type=PlaySnd
Trigger1=time=0
value=13350,0
volume = 128

[State 13360]
Type=VarSet
Trigger1=time=0
v=35
value=1

[State 13360]
Type=VarSet
Trigger1=time=0
v=24
value=0

[State 13360]
Type=VarSet
Trigger1=time=0
v=16
value=1200

[State 13360]
Type=NotHitBy
Trigger1=time<60
value=SAC

[State 3009, pause]
type = SuperPause
trigger1 = time=0
darken = 1
time = 60
anim = -1
movetime = 60
p2defmul = 1

[State 13360]
Type=PalFX
Trigger1=1
add= -time*3,-time*3,-time*3
time=1
ignorehitpause=1

[State 3009, pause]
type = ChangeState
Trigger1=time>=60
value=50
ctrl=1

[Statedef 531]
Physics=A
Movetype=I
Type=A
ctrl=0

[State 531]
Type=ChangeState
Trigger1=var(35)=0
value=50
ctrl=1

[Statedef 532]
Physics=S
Movetype=I
Type=S
ctrl=0

[State 532]
Type=ChangeState
Trigger1=var(35)=0
value=0
ctrl=1

; Explode
[Statedef 540]
Type= S
Physics =S
MoveType= A
velset=0,0
juggle  = 2
ctrl=0
anim=317
poweradd=0
facep2=1

[State 541]
Type=Varadd
Trigger1=time=0
v=16
value=200

[State 540]
Type=NotHitBy
Trigger1=time=[8,40]
value=SAC

[State 540]
Type=PalFx
Trigger1=1
add=time*3,time*3,time*3
time=1

[State 300,Void]
Type=Explod
Trigger1=time=8
ID=540
anim=10730
bindtime=-1
removetime=-2
vfacing=1-2*IsHelper(13151)
postype=p1
pos=-10,5
pausemovetime=9999999
scale=1.2,1.2
sprpriority=4
ownpal=1
ignorehitpause=1
trans=add

[State 310,1]
Type=PlaySnd
Trigger1=time=12
value=310,0

[State 221]
Type = HitDef
Trigger1 = time >=12
Trigger1 = !MoveContact
Trigger1 = !MoveReversed
attr = S, ST
damage = floor(Cond(Ishelper,root,fvar(39),fvar(39))*105),0
getpower = 200,100
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MAP                    ;Flags of conditions that move can hit
priority = 7, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 0, 8     ;Time attacker pauses, time opponent shakes
SparkNo           = S6015
guard.sparkno = S4040
SparkXY           = 25,-50
hitsound = S13860,3                  ;Sound to play on hit
guardsound = S0,201             ;Sound to play on guard
ground.slidetime = 15             ;Time that the opponent slides back
ground.hittime  = 15             ;Time opponent is in hit state
ground.velocity = -6,-8             ;Velocity at which opponent is pushed
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.velocity = -6,-8           ;X-velocity at which opponent is pushed,
air.hittime = 15                 ;Time before opponent regains control in air
ID=310

[State x]
Type=Statetypeset
Trigger1=time>=28
movetype=I

[State 501]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.6

[State 301]
Type=TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=MoveHit=1
value=43816

[State 310,3]
Type=changeState
Trigger1=time>=12
Trigger1=numexplod(540)=0
ctrl=1
Value=0

; Void Blaster
[StateDef 550]
Type        = S
MoveType    = A
Physics     = S
Anim        = 300
SprPriority = 1
VelSet      = 0,0
ctrl=0
facep2=1
poweradd=20

[State 500]
Type=ChangeState
Trigger1=Time>75
value=0
ctrl=1

[State 500]
Type=VarAdd
Trigger1=time=0
v=16
value=400

[State 14501]
Type=Helper
Triggerall=time=[5,50]
Trigger1=time %5=0
stateno = 551
ID = 551
name="BlackHole"
sprpriority = 10
ownpal=1
pausemovetime=9999999
Postype=p1
pos= 30+random %190,-(20+random %150)

[State -2]
Type = Null;Explod
Trigger1 = NumEnemy != 0
Trigger1 = (Enemy(0),Movetype = H)
Trigger1 = (Enemy(0),StateNo != [5100,5150])
Trigger1 = (Enemy(0),StateNo != [120,160])
Trigger1 = Enemy(0),GetHitvar(chainID) = 12322
Trigger1 = ProjHitTime(12322)=[0,1]
anim = 6018
ID = 6018
Pos = Ceil(Enemy(0),Pos X - Pos X)*Facing-15,Ceil((Enemy(0),Pos Y - Pos Y)*4/5)+(Enemy(0),Const(Size.Mid.Pos.Y))
PosType = P1
vel = enemy(0),vel x,enemy(0),vel y
scale=0.5,0.5
trans=sub
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
SuperMoveTime = 100
PauseMoveTime = 100
sprpriority=17

[Statedef 551]
Type = A
MoveType = A
Physics  = N
anim=10181

[State 12322]
Type=VarAdd
Trigger1=1
var(21)=1

[State 592]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP, AT
stateno = 551
time = -1

[State 1000, sound]
type = Playsnd
trigger1 = var(21)=1
value = 12320,0

[State 12322]
Type=AngleSet
Trigger1=1
Value=var(21)*4

[State 14502]
Type=angledraw
Trigger1=1
scale=0.2*(0.1+((var(21)+0.1)/10)*(var(21)<21)+(var(21)>=21)*(((41-var(21))+0.1)/10)),0.2*(0.1+((var(21)+0.1)/10)*(var(21)<21)+(var(21)>=21)*(((41-var(21))+0.1)/10))

[State 14502]
Type=Trans
Trigger1=1
trans=sub

[State 14502]
Type=DestroySelf
Trigger1=var(21)>=42

[State 221]
Type = Projectile
offset = 0,0
Projanim=10187
ProjID=551
Projremovetime=1
Projremanim=9919
ProjEdgeBound     = 9999
ProjStageBound    = 9999
Trigger1 = var(21) =21
Attr              = A, NP
Damage            = floor(root,fvar(39)*50),5
GetPower          = 100,10
AnimType          = DiagUp
HitFlag           = MAFD
GuardFlag         = MA
Priority          = 4,Hit
PauseTime         = 0,0
SparkNo           = S6018
guard.sparkno = S4040
SparkXY           = 0,0
HitSound          = S0,209
GuardSound        = S0,201
Ground.Type       = High
Air.Type          = Low
Ground.SlideTime  = 40
Ground.HitTime    = 40
Air.HitTime       = 40
Ground.Velocity   = random %10-5,-4
;Guard.Velocity   = 0,-3
Air.Velocity      = random %10-5,-4
AirGuard.Velocity = random %3-3,-4
;Air.Fall = 1
Fall.Recover = 1
;Guard.Kill = 0
ID = 12322
P2StateNo=43816
hitonce = 0

[State 12322]
Type=Assertspecial
Trigger1=1
flag=NoShadow
