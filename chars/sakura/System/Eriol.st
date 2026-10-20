; Earth Drive
[Statedef 500] 
Type     = U
MoveType = A
Physics  = N
Anim     = 520
Ctrl     = 0
Facep2   = 1

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
Trigger1=time=10
v=16
value=200

[State 710, Explod]
type = helper
trigger1 = time=10
postype = P1
pos = 90,0
stateno=501
ID=501
ownpal = 1
size.xscale=.5
size.yscale=.6

[State 220]
Type = ChangeState
Trigger1 = time>=35
Value = 50*(Statetype=A)
Ctrl = 1

[Statedef 501]
type = C
movetype = A
physics = N
anim = 10561
ctrl = 0
velset = 0,0
sprpriority = 5
poweradd=0

[State 501]
Type=Posset
Trigger1=1
Y=6

[State 501]
Type=Explod
Trigger1=time=0
anim=10561
postype=P1
pos=20,0
bindtime=-1
removetime=-2
scale=.5,.6
sprpriority = 5

[State 501]
Type=Explod
Trigger1=time=0
anim=10561
postype=P1
pos=40,0
bindtime=-1
removetime=-2
scale=.5,.6
sprpriority = 5

[State 501]
Type=Explod
Trigger1=time=0
anim=10561
postype=P1
pos=60,0
bindtime=-1
removetime=-2
scale=.5,.6
sprpriority = 5

[State 501]
Type=Explod
Trigger1=time=0
anim=10561
postype=P1
pos=80,0
bindtime=-1
removetime=-2
scale=.5,.6
sprpriority = 5

[State 11000, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 11000, Hitdef]
type = Hitdef
trigger1 = !MoveContact && !MoveReversed
attr = C,SP
hitflag = M
guardflag = L
animtype = up
air.animtype = back
fall.animtype = back
ground.type = high
air.type = high
damage = ceil(root,fvar(39)*90),3
getpower = 120,0
givepower = 0,150
pausetime = 0,10
guard.pausetime = 0,10
sparkno = S6001
guard.sparkno = S4040
sparkxy = 0,floor(enemynear,pos Y-25)
hitsound = S0,200
guardsound = S0,201
ground.slidetime = 10
ground.hittime = 10
guard.hittime = 10
air.hittime = 10
guard.ctrltime = 10
airguard.ctrltime = 10
down.hittime = 12
down.velocity=0,0
ground.velocity = 0,-7
guard.velocity = 0
air.velocity = 0,-4
airguard.velocity = -1,-3
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
fall=1

[State 1011]
Type=ParentvarSet
Trigger1=Movehit=1
fvar(39)=parent,fvar(39)*0.91

[State 501]
Type=Targetstate
Trigger1=MoveHit=1
value=43816

[State 11000, DestroySelf]
type = DestroySelf
trigger1 = Animtime=0

[State 710, Explod]
type = Playsnd
trigger1 = time=0
value=S18,4



; Comet
[Statedef 510] 
Type     = U
MoveType = A
Physics  = N
Anim     = 520
Ctrl     = 0
Facep2   = 1

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
Trigger1=time=20
v=16
value=200

[State 450]
Type = Helper
Trigger1 = Time=20
StateNo = 511
ID = 511
Name = "Meteor"
Pos = 48,-240
PosType = P2
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 1
Size.YScale = 1
facing=-1

[State 220]
Type = ChangeState
Trigger1 = time>=40
Value = 50*(StateType=A)
Ctrl = 1

[Statedef 511]
Type = A
MoveType = A
Physics  = N
Anim     = 10240
SprPriority = 4
PowerAdd = 0

[State 541]
Type=Assertspecial
trigger1=1
flag=noshadow

[State 441]
Type=velset
Trigger1=1
X=2
Y=10

[State 441]
Type=AngleSet
Trigger1=1
Value=-Time*25

[State 441]
Type = AngleDraw
Trigger1 = 1

[State 441]
Type = Playsnd
Trigger1 = Pos Y>=0
value = 14351,0

[State 240]
Type = Helper
Trigger1 = Pos Y=[-50,-41]
StateNo = 512
ID = 512
Name = "FlamePillar"
Pos = 11, 55
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Size.XScale = 1
Size.YScale = 1

[State 441]
Type = HitDef
Trigger1 = time>=1
Trigger1 = !Movecontact
Trigger1 = !Movereversed=[1,5]
Attr              = A, NP
Damage            = floor(root,fvar(39)*60),7
GetPower          = 50,10
AnimType          = Hard
HitFlag           = MAFDP
GuardFlag         = MA
Priority          = 4,Hit
PauseTime         = 0,0
SparkNo           = S6003
guard.sparkno = S4040
SparkXY           = 0,0
HitSound          = S0,202
GuardSound        = S0,201
Ground.Type       = High
Air.Type          = Low
Ground.SlideTime  = 18
Ground.HitTime    = 18
Air.HitTime       = 18
Ground.Velocity   = 0,3
Air.Velocity      = 0,3
AirGuard.Velocity = 0,3
Fall = 1
Fall.Recover = 1
ID = 14351

[State 501]
Type=Parentvarset
Trigger1=movehit=1
fvar(39)=parent,fvar(39)*0.87

[State 501]
Type=Targetstate
Trigger1=MoveHit=1
value=43816

[State 441]
Type = DestroySelf
Trigger1 = Pos Y>=0

[Statedef 512]   
Type     = C
MoveType = A
Physics  = N
Anim     = 10050
sprpriority = 5
;Facep2=1

[State 541]
Type=Assertspecial
trigger1=1
flag=noshadow

[State 271, PosSet]
type = ChangeAnim
trigger1 = time = 0
value = 10050
elem = 2

[State 14352]
type=Null;turn
trigger1=time=0

[State 14352]
Type=angleset
Trigger1=1
value=18

[State 14352]
Type=AngleDraw
Trigger1=1
scale=0.8,0.8

[State 271]
Type = Trans
Trigger1 = 1
Trans = Add

[State 271]
Type = DestroySelf
Trigger1 = AnimTime=0

;Hot Laser
[Statedef 560] 
Type     = S
MoveType = A
Physics  = S
Anim     = 520
Ctrl     = 0
Facep2   = 1
PowerAdd = 0

[State 500]
Type=VarAdd
Trigger1=NumHelper(521)>0
Trigger1=time %2=1
v=16
value=5

[State 450]
Type = Helper
Trigger1 = Time=10
StateNo = 561
ID = 521
Name = "Laser"
Pos = 33,-165
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 1
Size.YScale = 1

[State 520]
Type=PowerAdd
Trigger1=1
value=0

[State 520]
Type=Turn
trigger1=time>=10
trigger1=facing!=Helper(521),facing

[State 220]
Type = ChangeState
Triggerall = time>=20
Trigger1 = time>=185
Trigger2 = var(16)>1000
Trigger3 = var(59)=0
Trigger3 = command="holdfwd"
Trigger3 = fvar(22)!=1
Trigger4 = var(59)=0
Trigger4 = command="holddown"
Trigger4 = fvar(22)!=1
Trigger5 = var(59)>0
Trigger5 = P2Dist X<helper(521),var(9)-40
Trigger6 = command!="holddown"
Trigger6 = fvar(22)=1
Trigger6 = var(59)=0
Value = 0
Ctrl = 1

[Statedef 561] 
Type     = S
MoveType = A
Physics  = S
Anim     = 10520
Ctrl     = 0
Facep2   = 1
sprpriority=10

[State 521]
Type=Trans
Trigger1=1
trans=addalpha
alpha=256,256

[State 532]
Type = BindToParent
Trigger1 = 1
Pos = 33,-165

[State 520]
Type=AngleDraw
Trigger1=1
Scale=var(9)*0.00446,-Pos Y*0.00446

[State 520]
Type=VarSet
Trigger1=time=0
V=9
value=10

[State 520]
Type=VarAdd
Trigger1=time>0
V=9
value=IfElse(time % 25<18,3,-3)

[State 501]
Type=VarAdd
Trigger1=root,ProjContactTime(521)=[0,10]
Trigger2=root,ProjHitTime(521)=[0,10]
Trigger3=root,ProjCancelTime(521)=[0,10]
Trigger4=root,ProjGuardedTime(521)=[0,10]
v=21
value=1

[State 501]
Type=VarSet
Trigger1=root,ProjContactTime(521)!=[0,10]
Trigger1=root,ProjHitTime(521)!=[0,10]
Trigger1=root,ProjCancelTime(521)!=[0,10]
Trigger1=root,ProjGuardedTime(521)!=[0,10]
v=21
value=0

[State 521]
Type=PlaySnd
Trigger1=var(21)=1
Trigger2=var(21)=100
value=S520,0

[State 539]
Type = Projectile
Trigger1 = time>0
Attr              = C, SP
Damage            = 1,0
GetPower          = 1
AnimType          = Hard
PauseTime         = 0,0
Guard.PauseTime   = 0,0
Offset            = var(9),- Pos Y
Velocity          = 0,0
ProjID            = 521
ProjAnim          = 9997
ProjHitAnim       = 10021
ProjRemanim       = -1
ProjHits          = 1
ProjMissTime      = 1
ProjScale         = 1,1
ProjPriority      = 9999
ProjRemove        = 1
ProjRemoveTime    = 2
ProjHeightBound   = -400,50
HitFlag           = MD
GuardFlag         = L
SparkNo           = -1
Guard.sparkno = -1
SparkXY           = 0,0
HitSound          = -1,0
GuardSound        = -1,0
Ground.Type       = Low
Air.Type          = Low
Ground.SlideTime  = 15
Ground.HitTime    = 15
Air.HitTime       = 15
Ground.Velocity   = -2.2,0
P2StateNo=43816
ID=521

[State 521]
Type=DestroySelf
Trigger1=time>180
Trigger2=parent,StateNo!=560

;
; Power Conversion
[Statedef 530]
Type     = U
MoveType = I
Physics  = N
Ctrl     = 0
Velset	 =0,0
;anim=0

[State 530]
Type=ChangeAnim
Trigger1=1
value=41*(StateType=A)

[State 13360]
Type=PlaySnd
Trigger1=time=0
value=13350,0
volume = 128

[State 530]
Type=PowerAdd
Trigger1=var(24)>0
value=1500

[State 530]
Type=Poweradd
Trigger1=IsHelper
Trigger1=time>0
value=1000

[State 530]
Type=Destroyself
Trigger1=IsHelper
Trigger1=time>0

[State 530]
Type=VarSet
Trigger1=1
v=24
value=0

[State 4000]
Type=VarSet
Trigger1=Time=0
v=56
value=80

[State 530]
Type=PowerAdd
Trigger1=var(16)<990
value=10

[State 530]
Type=VarAdd
Trigger1=var(16)<990
v=16
value=10

[State 3009, pause]
type = SuperPause
trigger1 = time<100
darken = 1
time = 2
anim = -1
movetime = 2
p2defmul = 1

[State 13360]
Type=PalFX
Trigger1=1
add= time,-2*time,time
time=1

[State 13360]
Type=NotHitBy
Trigger1=1
value=SAC

[State 705, 2]
type = Explod
trigger1 = ((Time + 12) % 12) = 0
anim = f130
ID = 311
sprpriority = 3
postype = p1
pos = 0,0
bindtime = -1
Supermovetime=9999

[State 3009, pause]
type = ChangeState
Trigger1=time>=100
Trigger2=var(16)>=990
value=50*(StateType=A)
ctrl=1

; Asteroid Zone
[Statedef 540] 
Type     = U
MoveType = A
Physics  = N
Anim     = 520
Ctrl     = 0
Facep2   = 1

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
value=400

[State 450]
Type = Helper
Trigger1 = Time=[15,35]
StateNo = 511
ID = 511
Name = "Meteor"
Pos = random %250,-240
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Size.XScale = 1
Size.YScale = 1
facing=1
persistent=4

[State 220]
Type = ChangeState
Trigger1 = time>=55
Value = 50*(StateType=A)
Ctrl = 1

; Thunderstaff
[Statedef 550] 
Type     = S
MoveType = A
Physics  = S
Anim     = 520
Ctrl     = 0
Facep2   = 1

[State 500]
Type=VarAdd
Trigger1=time=7
v=16
value=200

[State 500]
Type=PlaySnd
Trigger1=time=7
value=S550,0

[State 450]
Type = Helper
Trigger1 = Time=7
StateNo = 551
ID = 551
Name = "Lightning"
Pos = 33,-165
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 1
Size.YScale = 1

[State 220]
Type = ChangeState
Trigger1 = time>7
Trigger1 = NumHelper(551)=0
Value = 0
Ctrl = 1

[Statedef 551]
anim=20080
MoveType=A
Physics=N
Type=A
sprpriority=3
PowerAdd = 0

[State 1061]
Type=Attackdist
Trigger1=1
value=180

[State 541]
Type=Assertspecial
trigger1=1
flag=noshadow

[State 550]
Type=BindToParent
Trigger1=1
Pos = 33,-165

[State 221]
Type=HitDef
Trigger1 = time>0
Trigger1 = animtime!=-1
attr = A, SP
damage = floor(root,fvar(39)*12),0
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MAFP                    ;Flags of conditions that move can hit
priority = 7, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 0, 9
sparkno = -1                     ;Spark anim no (Def: set above)
guard.sparkno = S4040
hitsound = S550,1                  ;Sound to play on hit
guardsound = S0,201               ;Sound to play on guard
ground.hittime  = 10             ;Time opponent is in hit state
ground.velocity = -2,-2             ;Velocity at which opponent is pushed
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.velocity = -2,-2           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 10                 ;Time before opponent regains control in air
fall=1
PalFx.time=30
Palfx.add=80,80,80
PalFx.Sinadd=50,50,50,10
persistent=6
ID=551

[State 501]
Type=Parentvarset
Trigger1=movehit=1
fvar(39)=parent,fvar(39)*0.95

[State 301]
Type=TargetState
Trigger1=NumTarget(551)>0
Trigger1=MoveHit=1
value=43816

[State 301]
Type=TargetState
Trigger1=NumTarget(551)>0
Trigger1=MoveHit=1
Trigger1=target(551),selfanimexist(7696)
value=6660

[State 551]
Type=Destroyself
Trigger1=animtime=0
Trigger2=parent,stateno!=550

; Thunder hit state
[Statedef 6660]
Movetype=H
Type=U
Physics=N
ctrl=0
anim=7696
velset=0,0

[State 529]
Type=PalFx
Trigger1=time=0
add=0,0,0
mul=256,256,256
sinadd=0,0,0,30
time=30

[State 6660]
Type=VelSet
Trigger1=time>=9
X=-2
Y=-2

[State 6660]
Type=SelfState
Trigger1=time>=9
value=5030




[Statedef 520]
Type= S
Physics =S
MoveType= A
velset=0,0
juggle  = 1
ctrl=0
anim=320
poweradd=0
facep2=1

[State 221]
Type=Attackdist
triggerall = var(23)=[1,9000]
Trigger1 = time=0
value=0

[State 520]
Type=VarAdd
Trigger1=time=0
var(16)=200

[State 320,1]
Type=PlaySnd
Trigger1=time=3
value=320,0

[State -2]
type = AfterImage
Trigger1=time=0
time = 36
FrameGap = 1
length = 12
PalContrast = 255,0,255
PalBright = 255,0,255
TimeGap = 2
PalColor = 255
paladd = -15,0,-15
palmul=1,1,1
persistent = 0
ignorehitpause=1

[State 221]
Type=HitDef
Trigger1 = (time=5)
Trigger2 = (time=17)
Trigger3 = (time=29)
triggerall = var(23)!=[1,9000]
attr = S, HA                     ;Attribute: Standing, Normal Attack
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*48*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13221)>0))),floor(3*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13221)>0)))
getpower = 60,30
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MAFP                    ;Flags of conditions that move can hit
priority = 5, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 6, 9                 ;Time attacker pauses, time opponent shakes
sparkno = -1                      ;Spark anim no (Def: set above)
guard.sparkno=-1
hitsound = S320,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.slidetime = 8             ;Time that the opponent slides back
ground.hittime  = 14             ;Time opponent is in hit state
ground.velocity = -1,0
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.velocity = -1,0
air.hittime = 14                 ;Time before opponent regains control in air
ground.cornerpush.veloff = -3
guard.cornerpush.veloff = -4
guard.kill=0
ID=320

[State 221]
Type=HitDef
Trigger1 = (time=5)
Trigger2 = (time=17)
Trigger3 = (time=29)
triggerall = var(23)=[1,9000]
attr = S, HA                     ;Attribute: Standing, Normal Attack
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*48*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13221)>0))),3*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13221)>0))
getpower = 60,30
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag =                     ;Flags on how move is to be guarded against
hitflag = MAFP                    ;Flags of conditions that move can hit
priority = 5, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 6, 9                 ;Time attacker pauses, time opponent shakes
sparkno = -1                      ;Spark anim no (Def: set above)
guard.sparkno=-1
hitsound = S320,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.slidetime = 8             ;Time that the opponent slides back
ground.hittime  = 14             ;Time opponent is in hit state
ground.velocity = -1,0
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.velocity = -1,0
air.hittime = 14                 ;Time before opponent regains control in air
ground.cornerpush.veloff = -3
guard.cornerpush.veloff = -4
ID=320

[State 300]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.78

[State 301]
Type=TargetState
Trigger1=NumTarget(320)>0
Trigger1=MoveHit=1
value=43816

[State -2]
Type = Explod
Triggerall=Name!="Void"
Trigger1 = NumTarget(320)>0
Trigger1 = movehit=1
Trigger1 = Hitpausetime=6
anim= 20005
ID = 9300
Pos = random %10-5+Ceil(target(320),Pos X - Pos X)*Facing,Ceil(target(320),Pos Y - Pos Y)-60+random %20-10
Sprpriority=2
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
SuperMoveTime = 100
PauseMoveTime = 100
scale = 0.3,0.3

[State -2]
Type = Explod
Trigger1 = NumTarget(320)>0
Trigger1 = moveguarded=1
Trigger1 = Hitpausetime=6
anim = 4040
ID = 6011
Pos = random %10-5+Ceil(target(320),Pos X - Pos X)*Facing,Ceil(target(320),Pos Y - Pos Y)-60+random %20-10
Sprpriority=2
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
SuperMoveTime = 100
PauseMoveTime = 100

[State 320,3]
Type=changeState
Trigger1=Animtime=0
ctrl=1
Value=0


; Darkness Pillar
[Statedef 570] 
Type     = U
MoveType = A
Physics  = N
Anim     = 520
Ctrl     = 0
Facep2   = 1

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
value=400

[State 710, Explod]
type = Playsnd
trigger1 = time=0
value=S7000,6

[State 710, Explod]
type = helper
trigger1 = time=16
postype = P2
pos = 5-random %10,0
stateno=571
ownpal = 1

[State 220]
Type = ChangeState
Trigger1 = time>=50
Value = 50*(Statetype=A)
Ctrl = 1

[Statedef 571]
Type=C
Movetype=A
Physics=N
anim=571
sprpriority=-20
PowerAdd = 0

[State 571]
Type=Attackdist
Trigger1=1
value=0

[State 571]
Type=Posset
Trigger1=1
Y=0

[State 571]
Type=Angledraw
Trigger1=1
scale=0.1,0.02

[State 571]
Type=Palfx
Trigger1=1
add=255,255,255
time=1

[State 571]
Type=Trans
Trigger1=1
trans=sub

[State 11000, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 710, Explod]
type = helper
trigger1 = time=120
postype = P1
pos = 0,0
stateno=572
ownpal = 1

[State 11000, Hitdef]
type = Hitdef
Trigger1 = time=[120,129]
trigger1 = !MoveContact && !MoveReversed
attr = C,SP
hitflag = MAFD
guardflag = 
animtype = up
air.animtype = back
fall.animtype = back
ground.type = high
air.type = high
damage = ceil(root,fvar(39)*70),0
getpower = 60,0
givepower = -250,0
pausetime = 0,10
guard.pausetime = 0,10
sparkno = -1
guard.sparkno = S4040
sparkxy = 0,floor(enemynear,pos Y-25)
hitsound = S12250,0
guardsound = S0,201
ground.slidetime = 10
ground.hittime = 10
guard.hittime = 10
air.hittime = 10
guard.ctrltime = 10
airguard.ctrltime = 10
down.hittime = 12
down.velocity=0,0
ground.velocity = 0,-7
guard.velocity = 0
air.velocity = 0,-4
airguard.velocity = -1,-3
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
fall=1
ID=571

[State 1011]
Type=ParentvarSet
Trigger1=Movehit=1
fvar(39)=parent,fvar(39)*0.91

[State 501]
Type=Targetstate
Trigger1=MoveHit=1
value=43816

[State -2]
Type = Helper
Trigger1 = NumEnemy != 0
Trigger1 = (Enemy(0),Movetype = H)
Trigger1 = (Enemy(0),StateNo != [5100,5150])
Trigger1 = (Enemy(0),StateNo != [120,160])
Trigger1 = Enemy(0),GetHitvar(chainID) = 571
StateNo = 6010
ID = 6014
Name = "HitSpark"
Pos = Ceil(Enemy(0),Pos X - Pos X)*Facing,Ceil((Enemy(0),Pos Y - Pos Y)/2)+(Enemy(0),Const(Size.Mid.Pos.Y))
PosType = P1
;Ownpal = 1
IgnoreHitPause = 1
Persistent = 0
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
Trigger1 = Enemy(1),GetHitvar(chainID) = 571
StateNo = 6010
ID = 6014
Name = "HitSpark"
Pos = Ceil(Enemy(1),Pos X - Pos X)*Facing,Ceil((Enemy(1),Pos Y - Pos Y)/2)+(Enemy(1),Const(Size.Mid.Pos.Y))
PosType = P1
;Ownpal = 1
IgnoreHitPause = 1
Persistent = 0
SuperMoveTime = 100
PauseMoveTime = 100
Size.XScale = 0.5
Size.YScale = 0.5

[State 571]
Type=Statetypeset
Trigger1=time=130
movetype=I

[State 571]
Type=Destroyself
Trigger1=time>130
Trigger1=numhelper(572)=0


[Statedef 572]
Type=A
Movetype=A
anim=572
sprpriority=4

[State 572]
Type=Angledraw
Trigger1=1
scale=3,0.6
value=90

[State 572]
Type=Trans
Trigger1=1
trans=sub

[State 11000, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 572]
Type=Destroyself
Trigger1=animtime=0



; Light Bolt
[Statedef 580] 
Type     = U
MoveType = A
Physics  = N
Anim     = 520
Ctrl     = 0
Facep2   = 1

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
Trigger1=time=7
v=16
value=200

[State 710, Explod]
type = Playsnd
trigger1 = time=0
value=S7000,5

[State 450]
Type = Helper
Trigger1 = Time=[7,21]
StateNo = 581
ID = 581
Name = "Light"
Pos = 33,-165
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 3
Size.XScale = .5
Size.YScale = .5

[State 450]
Type = Playsnd
Trigger1 = Time=7
value=581,0

[State 220]
Type = ChangeState
Trigger1 = time>=30
Value = 50*(Statetype=A)
Ctrl = 1

[Statedef 581]
Type=A
Movetype=A
Physics=N
anim=581
poweradd=0
sprpriority=4
velset = -4,(random %91-40)*0.1

[State 1011]
Type=VelAdd
Trigger1=time=[5,15]
Y=(ParentDist Y-165)*0.007

[State 1011]
Type=VelAdd
Trigger1=time>15
Y=(P2dist Y+enemynear,const(size.mid.pos.y))*0.003

[State 1011]
Type=VelMul
Trigger1=time>5
Y=.96

[State 1011]
Type=VelAdd
Trigger1=time=[5,25]
X=0.6

[State 16300, Explod]
type = Explod
trigger1 = 1
anim = 581
postype = p1
pos = 0,0
facing = 1
bindtime = 1
removetime = -2
ownpal = 1
scale = .25,.25
supermovetime = 0
pausemovetime = 0
sprpriority = 3

[State 200, Hitdef]
type = Hitdef
trigger1 = !movecontact
trigger1 = !Movereversed
attr = A,NP
hitflag = MAF
guardflag = MA
animtype = medium
air.animtype = back
fall.animtype = back
ground.type = high
air.type = high
damage = ceil(parent,fvar(39)*22),0
getpower = 32,0
;pausetime = 10,10
;guard.pausetime = 10,10
sparkno = S582
guard.sparkno = S4040
sparkxy = 0,0
hitsound = S581,1
guardsound = S0,201
ground.slidetime = 26
ground.hittime = 26
guard.hittime = 18
air.hittime = 26
ground.velocity = 0,0
guard.velocity = 0
air.velocity = -1,-1
airguard.velocity = -1,-1
fall=1

[State 1011]
Type=ParentvarSet
Trigger1=Movehit=1
fvar(39)=parent,fvar(39)*0.92

[State 1011]
Type=Assertspecial
Trigger1=1
flag=noshadow

[State 1011]
Type=Destroyself
Trigger1=Frontedgedist<-50
Trigger2=Movereversed
Trigger3=Movecontact

; Floating Light
[Statedef 590] 
Type     = U
MoveType = A
Physics  = N
Anim     = 520
Ctrl     = 0
Facep2   = 1

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
Trigger1=time=7
v=16
value=200

[State 710, Explod]
type = Playsnd
trigger1 = time=0
value=S7000,5

[State 450]
Type = Helper
Trigger1 = Time=[7,21]
StateNo = 591
ID = 591
Name = "Light"
Pos = 33,-165
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 3
Size.XScale = .5
Size.YScale = .5

[State 450]
Type = Playsnd
Trigger1 = Time=7
value=581,0

[State 220]
Type = ChangeState
Trigger1 = time>=30
Value = 50*(Statetype=A)
Ctrl = 1

[Statedef 591]
Type=A
Movetype=A
Physics=N
anim=581
poweradd=0
sprpriority=4
velset = -4,(random %91-40)*0.1

[State 1011]
Type=VelAdd
Trigger1=time=[5,15]
Y=(ParentDist Y-165)*0.007

[State 1011]
Type=VelAdd
Trigger1=time>15
Y=(P2dist Y+enemynear,const(size.mid.pos.y))*0.003

[State 1011]
Type=VelMul
Trigger1=time>5
Y=.96

[State 1011]
Type=VelAdd
Trigger1=time=[5,25]
X=0.3

[State 16300, Explod]
type = Explod
trigger1 = time %2=0
anim = 581
postype = p1
pos = 0,0
facing = 1
bindtime = 1
removetime = -2
ownpal = 1
scale = .25,.25
supermovetime = 0
pausemovetime = 0
sprpriority = 3

[State 200, Hitdef]
type = Hitdef
trigger1 = !movecontact
trigger1 = !Movereversed
attr = A,NP
hitflag = MAF
guardflag = MA
animtype = medium
air.animtype = back
fall.animtype = back
ground.type = high
air.type = high
damage = ceil(parent,fvar(39)*22),0
getpower = 32,0
;pausetime = 10,10
;guard.pausetime = 10,10
sparkno = S582
guard.sparkno = S4040
sparkxy = 0,0
hitsound = S581,1
guardsound = S0,201
ground.slidetime = 26
ground.hittime = 26
guard.hittime = 18
air.hittime = 26
ground.velocity = 0,0
guard.velocity = 0
air.velocity = -1,-1
airguard.velocity = -1,-1
fall=1

[State 1011]
Type=ParentvarSet
Trigger1=Movehit=1
fvar(39)=parent,fvar(39)*0.92

[State 1011]
Type=Assertspecial
Trigger1=1
flag=noshadow

[State 1011]
Type=Destroyself
Trigger1=Frontedgedist<-50
Trigger2=Movereversed
Trigger3=Movecontact

