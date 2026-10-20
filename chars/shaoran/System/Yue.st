
; Lunar Arrow
[Statedef 510]
Type=U
MoveType=A
Physics=N
poweradd=20
anim=500
velset=0,0
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
Type=PlaySnd
Trigger1=AnimElem=2
value=510,0

[State 500]
Type=VarAdd
Trigger1=animelem=2
v=16
value=200

[State 500]
Type = Projectile
trigger1=AnimElem=2
Attr              = A, NP
Damage            = floor(Cond(Ishelper,root,fvar(39),fvar(39))*45)
GetPower          = 90,20
AnimType          = Hard
PauseTime         = 0,0
Guard.PauseTime   = 0,0
Offset            = 10,-107
Velocity          = 8,0
ProjID            = 510
ProjAnim          = 501
ProjHitAnim       = -1
ProjRemanim       = -1
ProjHits          = 1
ProjMissTime      = 1
ProjScale         = 1,1
ProjPriority      = 9999
ProjRemove        = 0
ProjRemoveTime    = 200
ProjHeightBound   = -400,50
HitFlag           = MAF
GuardFlag         = M
SparkNo           = -1
guard.sparkno = S4040
SparkXY           = 50,0
HitSound          = S0,200
GuardSound        = S0,201
Ground.Type       = High
Air.Type          = High
Ground.SlideTime  = 20
Ground.HitTime    = 20
Air.HitTime       = 20
Guard.Kill=0
fall=1
P2StateNo=43816
palfx.time=40
palfx.add=50,50,100
palfx.sinadd=30,30,60,10

[State 500]
Type = Projectile
trigger1=AnimElem=2
Attr              = A, NP
Damage            = floor(Cond(Ishelper,root,fvar(39),fvar(39))*55),0
GetPower          = 60,20
AnimType          = Light
PauseTime         = 0,3
Guard.PauseTime   = 0,3
Offset            = 70,-103
Velocity          = 8,0
ProjID            = 510
ProjAnim          = 502
ProjHitAnim       = -1
ProjRemanim       = -1
ProjHits          = 1
ProjMissTime      = 1
ProjScale         = 1,2
ProjPriority      = 9999
ProjRemove        = 0
ProjRemoveTime    = 200
ProjHeightBound   = -400,50
HitFlag           = MAF
GuardFlag         = MA
SparkNo           = S6015
guard.sparkno = S4040
SparkXY           = 0,0
HitSound          = S530,0
GuardSound        = S0,201
Ground.Type       = High
Air.Type          = High
Ground.SlideTime  = 20
Ground.HitTime    = 20
Air.HitTime       = 20
Guard.Kill=0
P2StateNo=43816

[State 220]
Type = ChangeState
Trigger1 = AnimTime=0
Value = 50*(StateType=A)
Ctrl = 1

; Ice Shower
[StateDef 500]
Type        = U
MoveType    = A
Physics     = N
Anim        = 510
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
Triggerall = time>20
Trigger1=command !="holda"
Trigger1=var(59)=0
Trigger1=fvar(22)!=1
Trigger2=time >80
Trigger3=var(16)>=1000
Trigger4=var(59)!=0
Trigger4=(var(16)>850) || (random<10)
Trigger4=time>20
Trigger5=command !="holdx"
Trigger5=var(59)=0
Trigger5=fvar(22)=1
value=50*(StateType=A)
ctrl=1

[State 500]
Type=VarAdd
Trigger1=time %20=10
v=16
value=50

[State 500]
Type=PlaySnd
Trigger1=AnimElem=2
Value=500,0

[State 500]
Type=Poweradd
trigger1=time %20=10
value=0

[State 500]
Type = Projectile
trigger1=time %20=10
Attr              = A, NP
Damage            = floor(Cond(Ishelper,root,fvar(39),fvar(39))*(10+5*(Numhelper(12901)+Numhelper(12911)))),1+3*(Numhelper(12901)+Numhelper(12911))
GetPower          = 20
AnimType          = DiagUp
PauseTime         = 0,13
Guard.PauseTime   = 0,0
Offset            = 50,-105
Velocity          = 5,0
ProjID            = 500
ProjAnim          = 511
ProjHitAnim       = -1
ProjRemanim       = -1
ProjHits          = 1
ProjMissTime      = 1
ProjScale         = 0.2,0.2
ProjPriority      = 1
ProjRemove        = 1
ProjRemoveTime    = 200
ProjHeightBound   = -400,50
HitFlag           = MAF
GuardFlag         = M
SparkNo           = S20000
guard.sparkno = S4040
SparkXY           = 15,0
HitSound          = S15000,0
GuardSound        = S0,201
Ground.Type       = High
Air.Type          = High
Ground.SlideTime  = 15
Ground.HitTime    = 20
Air.HitTime       = 20
Guard.Kill=0
Ground.Velocity   = -3,-2
Guard.Velocity    = -3
Air.Velocity      = -3,-1
AirGuard.Velocity = -3,-1
P2StateNo=43816

[State 500]
Type = Projectile
trigger1=time %20=10
Attr              = A, NP
Damage            = floor(Cond(Ishelper,root,fvar(39),fvar(39))*(10+5*(Numhelper(12901)+Numhelper(12911)))),1+3*(Numhelper(12901)+Numhelper(12911))
GetPower          = 20
AnimType          = DiagUp
PauseTime         = 0,13
Guard.PauseTime   = 0,0
Offset            = 30,-125
Velocity          = 5,0
ProjID            = 500
ProjAnim          = 511
ProjHitAnim       = -1
ProjRemanim       = -1
ProjHits          = 1
ProjMissTime      = 1
ProjScale         = 0.2,0.2
ProjPriority      = 1
ProjRemove        = 1
ProjRemoveTime    = 200
ProjHeightBound   = -400,50
HitFlag           = MAF
GuardFlag         = M
SparkNo           = S20000
guard.sparkno = S4040
SparkXY           = 15,0
HitSound          = S15000,0
GuardSound        = S0,201
Ground.Type       = High
Air.Type          = High
Ground.SlideTime  = 15
Ground.HitTime    = 20
Air.HitTime       = 20
Guard.Kill=0
Ground.Velocity   = -3,-2
Guard.Velocity    = -3
Air.Velocity      = -3,-2
AirGuard.Velocity = -3,-1
P2StateNo=43816

[State 500]
Type = Projectile
trigger1=time %20=10
Attr              = A, NP
Damage            = floor(Cond(Ishelper,root,fvar(39),fvar(39))*(10+5*(Numhelper(12901)+Numhelper(12911)))),1+3*(Numhelper(12901)+Numhelper(12911))
GetPower          = 20
AnimType          = DiagUp
PauseTime         = 0,13
Guard.PauseTime   = 0,0
Offset            = 10,-65
Velocity          = 5,0
ProjID            = 500
ProjAnim          = 511
ProjHitAnim       = -1
ProjRemanim       = -1
ProjHits          = 1
ProjMissTime      = 1
ProjScale         = 0.2,0.2
ProjPriority      = 1
ProjRemove        = 1
ProjRemoveTime    = 200
ProjHeightBound   = -400,50
HitFlag           = MAF
GuardFlag         = M
SparkNo           = S20000
guard.sparkno = S4040
SparkXY           = 15,0
HitSound          = S15000,0
GuardSound        = S0,201
Ground.Type       = High
Air.Type          = High
Ground.SlideTime  = 15
Ground.HitTime    = 20
Air.HitTime       = 20
Guard.Kill=0
Ground.Velocity   = -3,-2
Guard.Velocity    = -3
Air.Velocity      = -3,-2
AirGuard.Velocity = -3,-1
P2StateNo=43816

[State 500]
Type = Projectile
trigger1=time %20=10
Attr              = A, NP
Damage            = floor(Cond(Ishelper,root,fvar(39),fvar(39))*(10+5*(Numhelper(12901)+Numhelper(12911)))),1+3*(Numhelper(12901)+Numhelper(12911))
GetPower          = 20
AnimType          = DiagUp
PauseTime         = 0,13
Guard.PauseTime   = 0,0
Offset            = 30,-85
Velocity          = 5,0
ProjID            = 500
ProjAnim          = 511
ProjHitAnim       = -1
ProjRemanim       = -1
ProjHits          = 1
ProjMissTime      = 1
ProjScale         = 0.2,0.2
ProjPriority      = 1
ProjRemove        = 1
ProjRemoveTime    = 200
ProjHeightBound   = -400,50
HitFlag           = MAF
GuardFlag         = M
SparkNo           = S20000
guard.sparkno = S4040
SparkXY           = 15,0
HitSound          = S15000,0
GuardSound        = S0,201
Ground.Type       = High
Air.Type          = High
Ground.SlideTime  = 15
Ground.HitTime    = 20
Air.HitTime       = 20
Guard.Kill=0
Ground.Velocity   = -3,-2
Guard.Velocity    = -3
Air.Velocity      = -3,-2
AirGuard.Velocity = -3,-1
P2StateNo=43816

[State 500]
Type = Projectile
trigger1=time %20=10
Attr              = A, NP
Damage            = floor(Cond(Ishelper,root,fvar(39),fvar(39))*(10+5*(Numhelper(12901)+Numhelper(12911)))),1+3*(Numhelper(12901)+Numhelper(12911))
GetPower          = 20
AnimType          = DiagUp
PauseTime         = 0,13
Guard.PauseTime   = 0,0
Offset            = 10,-145
Velocity          = 5,0
ProjID            = 500
ProjAnim          = 511
ProjHitAnim       = -1
ProjRemanim       = -1
ProjHits          = 1
ProjMissTime      = 1
ProjScale         = 0.2,0.2
ProjPriority      = 1
ProjRemove        = 1
ProjRemoveTime    = 200
ProjHeightBound   = -400,50
HitFlag           = MAF
GuardFlag         = M
SparkNo           = S20000
guard.sparkno = S4040
SparkXY           = 15,0
HitSound          = S15000,0
GuardSound        = S0,201
Ground.Type       = High
Air.Type          = High
Ground.SlideTime  = 15
Ground.HitTime    = 20
Air.HitTime       = 20
Guard.Kill=0
Ground.Velocity   = -3,-2
Guard.Velocity    = -3
Air.Velocity      = -3,-2
AirGuard.Velocity = -3,-1
P2StateNo=43816

; Frost Repulsor
[StateDef 520]
Type        = S
MoveType    = A
Physics     = S
Anim        = 181
SprPriority = 1
VelSet      = 0,0
ctrl=0
poweradd=20

[State 520]
Type=NothitBy
Trigger1=time<=20
value2=,NA,NT

[State 520]
Type=ChangeState
Trigger1=time>60
value=0
ctrl=1

[State 600]
Type = Helper
Trigger1 = time=0
StateNo = 521
ID = 521
Name = "Crystal"
Pos = 55,0
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 1
Size.YScale = 1
Facing = 1

[State 600]
Type = Helper
Trigger1 = Time = 0
StateNo = 521
ID = 522
Name = "Crystal"
Pos = -55,0
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 1
Size.YScale = 1
facing = -1

[State 500]
Type=VarAdd
Trigger1=time=0
v=16
value=200

[State 500]
Type=PlaySnd
Trigger1=time=0
value=520,0

[Statedef 521]
Type=S
MoveType=A
Physics=N
anim=10541
poweradd = 0

[State -1]
Type        = Explod
Trigger1    = (Time = [1,12])
Anim        = 529
ID          = 529
Postype     = P1
Pos         = -25,0;30,0
Vel         = Cos(Random%80*Pi/180)*6,Sin(Random%80*Pi/180)*-6
Accel       = 0,.11
OwnPal      = 0
SprPriority = 8

[State 240]
Type = Helper
Trigger1 = time=[0,8]
StateNo = 522
ID = 522
Name = "FreezeIcicle"
Pos = 0,0
PosType = P1
Ownpal = 1
IgnoreHitPause = 1

[State 1091]
Type=Destroyself
Trigger1=parent,movetype=H
Trigger1=parent,stateno!=[120,160]
Trigger2=var(40)>=256

[State 1091]
Type=Angledraw
Trigger1=time>=10
scale=0.5,0.5

[State 1091]
Type=Angledraw
Trigger1=time<10
scale=0.5,0.05*time

[State 601]
Type=Assertspecial
Trigger1=1
flag=noshadow

[State 221]
Type = HitDef
Trigger1 = time=5
Attr              = S, SA
Damage            = floor(root,fvar(39)*35)
GetPower          = 60,0
GivePower         = 0,60
AnimType          = DiagUp
HitFlag           = MA
GuardFlag         = MA
Priority          = 7,Hit
PauseTime         = 0,8
SparkNo           = S6001
guard.sparkno = S4040
SparkXY           = -20,floor(enemynear,pos Y)-20
HitSound          = S12700,1
GuardSound        = S0,201
Ground.Type       = Low
Air.Type          = Low
Air.HitTime       = 28
ground.velocity = -5,-9
ground.cornerpush.veloff=0
air.velocity = -5,-9
fall = 1
fall.recover=0
ID=1091

[State 501]
Type=Parentvarset
Trigger1=movehit=1
fvar(39)=parent,fvar(39)*0.8

[State 521]
Type=TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=movehit=1
value=43816

[State 1091]
Type=Trans
Trigger1=time>=44
trans=add

[State -1]
Type     = VarAdd
Trigger1 = Time >= 44
Trigger1 = Var(40) < 256
V        = 40
Value    = 16

[State -1]
Type     = VarSet
Trigger1 = Var(40) >= 256
V        = 40
Value    = 256

[State -1]
Type     = PalFx
Trigger1 = 1
Time     = 1
Add      = 0,0,0
;Mul      = floor(128-Var(40)/2),floor(128-var(40)/2),256-Var(40)
Mul      = 256-Var(40),256-Var(40),256-Var(40)

[State -2]
Type = Null;Explod
Trigger1=NumTarget(1091)>0
Trigger1=MoveHit=1
anim = 6001
ID = 1091
Pos = Ceil(target(1091),Pos X - Pos X)*Facing,Ceil((target(1091),Pos Y - Pos Y))+(target(1091),Const(Size.Mid.Pos.Y))
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
SuperMoveTime = 100
PauseMoveTime = 100
Sprpriority=5

[State 1091]
Type=StatetypeSet
Trigger1=time>=16
MoveType=I

[Statedef 522]
Type=A
Movetype=I
Physics=N
anim=13960
sprpriority=5

[State 13962]
Type=Varset
Trigger1=time=0
var(0)=parent,time

[State 13962]
Type=Angleset
Trigger1=time=0
value=165-(var(0)+time)*18

[State 13962]
Type=Angledraw
Trigger1=1
;scale=1.4**(4-abs(var(0)-4))-0.8,1
scale=.75*(1.15**(4-abs(var(0)-4))-0.8),.75*.5

[State 13962]
Type=Trans
Trigger1=1
trans=add

[State 261]
Type = AssertSpecial
Trigger1 = 1
Flag = Noshadow

[State 13962]
Type=destroyself
Trigger1=animtime=0


; Moonbolt Shower
[Statedef 530]
Type     = U
MoveType = A
Physics  = N
Anim     = 510
Ctrl     = 0
Facep2   = 1
PowerAdd = 0

[State 530]
Type=VarSet
Trigger1=1
v=21
value=-1

[State 530]
Type=ChangeState
Trigger1=1
value=537

[Statedef 537]
Type     = U
MoveType = A
Physics  = N
facep2=1

[State 500]
Type=Gravity
Trigger1=StateType=A
Trigger1=var(17)!=1

[State 537]
TYpe=Turn
Trigger1=P2Dist X<0

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
Type=VelSet
Trigger1=1
X=0

[State 537]
Type=StateTypeSet
Trigger1=var(44)>0
MoveType=I

[State 537]
Type=StateTypeSet
Trigger1=var(44)=0
MoveType=H

[State 592]
type = HitOverride
Trigger1=var(16)<997
Trigger1=RoundState=2
attr = SCA, AA, AP, AT
stateno = 537
time = 1

[State 12007]
Type=HitFallSet
Trigger1=1
Value=0

[State 537]
Type=VarAdd
Trigger1=1
v=21
value=1

[State 500]
Type=ChangeState
Trigger1=var(16)>=997
Trigger2=RoundState>2
value=50*(StateType=A)
ctrl=1

[State 500]
Type=VarAdd
Trigger1=1
v=16
value=3

[State 530]
Type=VarSet
Trigger1=var(21)=0
var(9)=99

[State 530]
Type=VarSet
Trigger1=var(21)>30
var(9)=IfElse(var(21) %10=1,(var(21)/10)%3+1,99)

[State 220]
Type= PlaySnd
Trigger1= var(9)=[1,15]
value=530,0

[State 250]
Type = Helper
Trigger1 = var(9)=1
StateNo = 531
ID = 254
Name = "Moon Bolt"
Pos = 58,-105
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 1
Size.YScale = 1

[State 250]
Type = Helper
Trigger1 = var(9)=2
StateNo = 531
ID = 252
Name = "Moon Bolt"
Pos = 58,-105
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 1
Size.YScale = 1

[State 250]
Type = Helper
Trigger1 = var(9)=3
StateNo = 531
ID = 253
Name = "Moon Bolt"
Pos = 58,-105
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 1
Size.YScale = 1

[StateDef 531]
Type = A
MoveType = A
Physics  = N
Anim     = 502
SprPriority = 4

[State 251]
Type = PlaySnd
Trigger1 = (Anim = 502) && (movecontact || movereversed)
Value = 530,0

[State 251]
Type = VarSet
Trigger1 = (Anim = 502) && (movecontact || movereversed)
v=9
Value = 1

[State 251]
Type = ChangeAnim
Trigger1 = (Anim = 502) && (movecontact || movereversed)
Value = 9999

[State 251]
Type = VarSet
Trigger1 = 1
fvar(0) = IfElse((P2Dist X=[0,1]),1,IfElse((P2Dist X=[-1,0]),-1,P2Dist X))

[State 251]
Type = VarSet
Trigger1 = 1
fvar(1) = P2Dist Y+IfElse((EnemyNear,StateType=C),-20,(EnemyNear,Const(Size.Mid.Pos.Y)))

[State 251]
Type = VarSet
Trigger1 = 1
fvar(2) = IfElse((fvar(1)=[0,1]),1,IfElse((fvar(1)=[-1,0]),-1,fvar(1)))

[State 251]
Type = VarSet
Trigger1 = 1
fvar(3) = ATan(fvar(0)/fvar(2))-((.5*Pi)*IfElse((fvar(2)<0),-1,1))

[State 251]
Type = VarSet
Trigger1 = Time = 0
fvar(4) = fvar(3)

[State 251]
Type = VarAdd
Trigger1 = Time = 0
Trigger1 = IsHelper(252) 
fvar(4) = -45*(Pi/180.0)

[State 251]
Type = VarAdd
Trigger1 = Time = 0
Trigger1 = IsHelper(254)
fvar(4) = 45*(Pi/180.0)

[State 251]
Type = VarAdd
Trigger1 = Time > 0
Trigger1 = (fvar(3) <= .5*Pi) && (fvar(3) >= -.5*Pi)
fvar(4) = IfElse(fvar(3)>fvar(4),IfElse(fvar(3)-fvar(4)<2.0*(Pi/180.0),fvar(3)-fvar(4),2.0*(Pi/180.0)),IfElse(fvar(3)-fvar(4)>-2.0*(Pi/180.0),fvar(3)-fvar(4),-2.0*(Pi/180.0)))

[State 251]
Type = VarAdd
Trigger1 = Time > 0
Trigger1 = fvar(4) >= 0
Trigger1 = (fvar(3) >= .5*Pi)
fvar(4) = IfElse(fvar(3)>fvar(4),IfElse(fvar(3)-fvar(4)<2.0*(Pi/180.0),fvar(3)-fvar(4),2.0*(Pi/180.0)),IfElse(fvar(3)-fvar(4)>-2.0*(Pi/180.0),fvar(3)-fvar(4),-2.0*(Pi/180.0)))

[State 251]
Type = VarAdd
Trigger1 = Time > 0
Trigger1 = fvar(4) <= 0
Trigger1 = (fvar(3) >= .5*Pi)
fvar(4) = IfElse(fvar(3)>fvar(4),-2.0*(Pi/180.0),2.0*(Pi/180.0))

[State 251]
Type = VarAdd
Trigger1 = Time > 0
Trigger1 = fvar(4) <= 0
Trigger1 = (fvar(3) <= -.5*Pi)
fvar(4) = IfElse(fvar(3)>fvar(4),IfElse(fvar(3)-fvar(4)<2.0*(Pi/180.0),fvar(3)-fvar(4),2.0*(Pi/180.0)),IfElse(fvar(3)-fvar(4)>-2.0*(Pi/180.0),fvar(3)-fvar(4),-2.0*(Pi/180.0)))

[State 251]
Type = VarAdd
Trigger1 = Time > 0
Trigger1 = fvar(4) >= 0
Trigger1 = (fvar(3) <= -.5*Pi)
fvar(4) = IfElse(fvar(3)>fvar(4),-2.0*(Pi/180.0),2.0*(Pi/180.0))

[State 251]
Type = VarAdd
Trigger1 = fvar(4) >= 1*Pi || fvar(4) <= -1*Pi
fvar(4) = IfElse(fvar(4)>=1*Pi,-2*Pi,2*Pi)

[State 251]
Type = VarAdd
Trigger1 = (Time = [0,50])
fvar(5) = IfElse(Time=0,3,.10)

[State 251]
Type = VelSet
Trigger1 = Anim=502
X = fvar(5)*Cos(fvar(4))
Y = -fvar(5)*Sin(fvar(4))

[State 251]
Type = VelSet
Trigger1 = Anim = 9999
X = 0
Y = 0

[State 251]
Type = StateTypeSet
Trigger1 = movecontact || movereversed
MoveType = I

[State 251]
Type = Trans
Trigger1 = 1
Trans = Add

[State 251]
Type = AssertSpecial
Trigger1 = 1
Flag = Noshadow
IgnoreHitPause = 1

[State 251]
Type = AngleSet
Trigger1 = (Vel X != 0)
Trigger1 = Anim=502
Value = ATan(Vel Y/Vel X)*(-180.0/Pi)+((Vel X<0)*180)

[State 251]
Type = AngleSet
Trigger1 = (Vel X = 0)
Trigger1 = Anim=502
Value = IfElse(Vel Y<0,90,-90)

[State 251]
Type = AngleSet
Trigger1 = Anim=9999
Value = 0

[State 251]
Type = AngleDraw
Trigger1 = Anim=502
Scale = 1,1

[State 251]
Type = AngleDraw
Trigger1 = Anim=9999
Scale = 1,1

[State 221]
Type = hitdef
Trigger1 = !time
Trigger1 = !movecontact
Trigger1 = !Movereversed
Attr              = A, NP
Damage            = floor(13*root,fvar(39))+2,1
GetPower          = 50,20
GivePower = 10,20
AnimType          = Hard
HitFlag           = MAF
GuardFlag         = MA
Priority          = 4,Hit
PauseTime         = 0,3
SparkNo           = S6015
guard.sparkno = S4040
SparkXY           = 0,0
HitSound          = S12600,1
GuardSound        = S0,201
Ground.Type       = High
Air.Type          = Low
Ground.SlideTime  = 5
Ground.HitTime    = 16
Air.HitTime       = 16
Ground.Velocity   = -3*(1-2*(vel X<0)*(time>10)),-2
Guard.Velocity    = -6*(1-2*(vel X<0)*(time>10))
Air.Velocity      = -3*(1-2*(vel X<0)*(time>10)),-2
AirGuard.Velocity = -6*(1-2*(vel X<0)*(time>10)),-2
palfx.time=40
palfx.add=50,50,100
palfx.sinadd=30,30,60,10
Guard.Kill=0

[State 521]
Type=TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=movehit=1
value=43816

[State 501]
Type=Parentvarset
Trigger1=movehit=1
fvar(39)=parent,fvar(39)*0.92

[State 251]
Type = DestroySelf
Trigger1 = (Time > 80) && (Vel X >= 0)
Trigger1 = (FrontEdgeBodyDist < -30)
Trigger2 = (Time > 80) && (Vel X <= 0)
Trigger2 = (BackEdgeBodyDist < -30)
Trigger3 = (Time > 80) && (Vel Y >= 0)
Trigger3 = (Pos Y > 30)
Trigger4 = (Time > 80) && (Vel Y <= 0)
Trigger4 = (ScreenPos Y < -100)
Trigger5 = (Anim = 9999)
Trigger5 = (AnimTime= 0)

; Wind of Repulse
[Statedef 540]
Type        = U
MoveType    = A
Physics     = N
Anim        = 510
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

[State 3121]
Type     = Helper
Trigger1 = time=12
Trigger1 = NumHelper(548)=0
Stateno  = 548
ID       = 548
Pos      = -Floor(BackEdgeDist),0
PosType  = P1
Facing   = 1
OwnPal   = 1
Size.Height = 999

[State 500]
Type=VarAdd
Trigger1=time=12
v=16
value=300

[State 500]
Type=ChangeState
Trigger1=time >20
value=50*(StateType=A)
ctrl=1

; >Pushback Wind
[Statedef 548]
Physics = N
Anim    = 548

[State 9010]
Type=PlaySnd
Trigger1=random <50
value=S540,0

[State 110, 8]
type = Explod
trigger1 = gametime%45 = 1
anim = 549
ID = 549
sprpriority = 3
postype = back
pos = -75,random %80-40
vel = 4+ random %2,0
ownpal = 1

[State 409]
Type     = PlayerPush
Trigger1 = 1
Value    = 1

[State 409]
Type     = PosSet
Trigger1 = 1
Y        = 0

[State 409]
Type     = NotHitBy
Trigger1 = 1
Time     = 9999
Value    = SCA

[State 409]
Type     = VelSet
Trigger1 = 1
X        = 1.52+5*(P2BodyDist X>10)

[State 409]
Type     = VelSet
Trigger1 = P2MoveType=H
X        = 0

[State 409]
Type     = PosAdd
Trigger1 = P2BodyDist X < -20
X        = -20

[State 409]
Type     = DestroySelf
Trigger1 = time>=600

; Ice Bolt
[Statedef 550]
Type=U
Physics=N
MoveType=A
facep2=1
anim=510
ctrl=0
poweradd=20

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

[State 0, Helper]
type = Helper
trigger1 = time=8
name = "Icicle"
ID = 551
stateno = 551
pos = 10,-200
postype = p2
ownpal=1
size.xscale=1
size.yscale=1

[State 0, Helper]
type = Helper
trigger1 = time=10
name = "Icicle"
ID = 551
stateno = 551
pos = 0,-190
postype = p2
ownpal=1
size.xscale=1
size.yscale=1

[State 0, Helper]
type = Helper
trigger1 = time=12
name = "Icicle"
ID = 551
stateno = 551
pos = -10,-200
postype = p2
ownpal=1
size.xscale=1
size.yscale=1

[State 0, Helper]
type = VarAdd
trigger1 = Time=8
var(16)=200

[State 0, Helper]
type = PlaySnd
trigger1 = time=8
trigger2 = time=10
trigger3 = time=12
value= S550,0

[State 1000]
Type=ChangeState
Trigger1=time>=20
value=(StateType=A)*50
ctrl=1


[Statedef 551]
Type=A
MoveType=A
Physics=N
anim=550
velset=0,0
sprpriority=3

[State 551]
Type=HitOverride
Trigger1=1
attr=SAC,AA,AP,AT
time=-1
stateno=559

[State 551]
Type=Attackdist
Trigger1=1
value=30

[State 0, Explod]
type = Null;Explod
trigger1 = time<60
anim = 10002+100*(random %2)
ID = 10000
pos = random %40-20,random %40-20
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2

[State 0, Explod]
type = Null;Explod
trigger1 = time<60
anim = 10002+100*(random %2)
ID = 10000
pos = random %40-20,random %40-20
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2

[State 0, Explod]
type = Null;Explod
trigger1 = time<60
anim = 10002+100*(random %2)
ID = 10000
pos = random %40-20,random %40-20
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2

[State 1031]
Type=StateTypeSet
Trigger1=P2StateNo=13951
MoveType=I

[State 1031]
Type=StateTypeSet
Trigger1=P2StateNo!=13951
MoveType=A

[State 1031]
Type=AngleAdd
Trigger1=time<48
value=15

[State 1030]
Type=AngleDraw
Trigger1=time<48
scale=0.0196*time,0.0196*time

[State 1031]
Type=AngleSet
Trigger1=time>=48
value=0

[State 1030]
Type=AngleDraw
Trigger1=time>48

[State 1031]
Type=VelAdd
Trigger1=time>=48
X=0
Y=0.5

[State 1031]
Type=Trans
Trigger1=1
trans=add

[State 1031]
Type=Assertspecial
Trigger1=1
flag=noshadow

[State 0, HitDef]
type = HitDef
trigger1 = time>=57
trigger1 = !Movecontact
Trigger1 = !Movereversed
attr = A,NP
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
animtype = medium          ;light,medium,hard,back,up,diagup
damage = floor(root,fvar(39)*(37+12*(Numhelper(12901)+Numhelper(12911)))),4+4*(Numhelper(12901)+Numhelper(12911))
getpower = 99,77
sparkno = S555
guard.sparkno = S4040
sparkxy = 20,20
hitsound = S0,550
guardsound = S0,201
ground.type = Low      ;Low,Trip,None
ground.hittime=30
guard.hittime=0
id = 550

[State 501]
Type=Parentvarset
Trigger1=movehit=1
fvar(39)=parent,fvar(39)*0.9

[State 1031]
Type=TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=movehit=1
Trigger1=NumTarget(550)>0
Trigger1=(random<100+50*(Numhelper(12901)+Numhelper(12911))) && (target,name!="Cirno")
value=IFElse(root,var(39)=13744,13744,13951)
persistent=0

[State 1031]
Type=ChangeState
Trigger1=NumTarget(550)>0
trigger1=target(550),stateno=[13951,13952]
value=6868

[State 1031]
Type=PlaySnd
Trigger1=Pos Y>=0
value=S550,1

[State 1031]
Type=DestroySelf
Trigger1=Pos Y>=0
Trigger2=MoveContact
Trigger3=MoveReversed

[Statedef 559]

[State 1031]
Type=DestroySelf
Trigger1=1

; Ice Shard
[Statedef 560] 
Type     = U
MoveType = A
Physics  = N
Anim     = 510
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
Trigger1= time=8
v=16
value=120

[State 500]
Type=PlaySnd
Trigger1=time=14
Value=S13950,0

[State 500]
Type=VelSet
Trigger1=StateType=A
Trigger1=time=14
Y=-2
X=-3

[State 500]
Type = Projectile
Trigger1 = time= 14
Attr              = A, NP
Damage            = floor(Cond(Ishelper,root,fvar(39),fvar(39))*(70+20*(Numhelper(12901)+Numhelper(12911)))),5+10*(Numhelper(12901)+Numhelper(12911))
GetPower          = 90,50
AnimType          = Hard
PauseTime         = 0,10
Guard.PauseTime   = 0,10
Offset            = 50,-107
Velocity          = 5,1
ProjID            = 560
ProjAnim          = 560
ProjHitAnim       = 561
ProjRemanim       = 561
ProjHits          = 1
ProjMissTime      = 1
ProjScale         = 0.5,0.5
ProjPriority      = 4
ProjRemove        = 1
ProjRemoveTime    = 999
ProjHeightBound   = -999,-20
HitFlag           = MA
GuardFlag         = MA
SparkNo           = S20000
guard.sparkno = S4040
SparkXY           = 80,20
HitSound          = S0,205
GuardSound        = S0,201
Ground.Type       = Low
Air.Type          = Low
Ground.SlideTime  = 22
Ground.HitTime    = 22
Air.HitTime       = 22
Ground.Velocity   = 0,0
Guard.Velocity    = 0
Air.Velocity      = 0,0
AirGuard.Velocity = 0,0
Fall.Recover = 0
ID = 500
P2StateNo=43816
Palfx.time=10
Palfx.add=-50,-50,150
Guard.Kill=0


[State 500]
Type=ChangeState
Trigger1=time>40
value=50
ctrl=1

; Moonbolt Impulse
[Statedef 570]
Type     = U
MoveType = A
Physics  = N
Anim     = 510
Ctrl     = 0
Facep2   = 1
PowerAdd = 0

[State 530]
Type=VarSet
Trigger1=1
v=21
value=-1

[State 530]
Type=VarSet
Trigger1=1
fvar(29)=1

[State 530]
Type=ChangeState
Trigger1=1
value=577

[Statedef 577]
Type     = U
MoveType = A
Physics  = N

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
Type=VelSet
Trigger1=1
X=0

[State 537]
Type=StateTypeSet
Trigger1=var(44)>0
MoveType=I

[State 537]
Type=StateTypeSet
Trigger1=var(44)=0
MoveType=H

[State 592]
type = HitOverride
Trigger1=var(21)<120
Trigger1=RoundState=2
attr = SCA, AA, AP, AT
stateno = 577
time = 1

[State 12007]
Type=HitFallSet
Trigger1=1
Value=0

[State 537]
Type=VarAdd
Trigger1=1
v=21
value=1

[State 500]
Type=ChangeState
Trigger1=var(21)>=120
Trigger2=RoundState>2
value=50*(StateType=A)
ctrl=1

[State 500]
Type=VarAdd
Trigger1=gametime %3=0
v=16
value=10

[State 220]
Type= PlaySnd
Trigger1= var(21)>=12
value=530,0
persistent=5

[State 577]
Type=Helper
Trigger1= var(21)=[12,105]
pos = 100+random %50,-250
ID=571
stateno=571
ownpal=1
persistent=5

[Statedef 571]
anim=571
velset = 0,4
Type=A
MoveType=A
Physics=N

[State 751]
Type=Angleset
Trigger1=1
value=-90

[State 571]
Type=Angledraw
Trigger1=1

[State 571]
Type=VelAdd
Trigger1=1
Y=0.3

[State 500]
Type = HitDef
Trigger1= time=1
Attr              = A, SP
Damage            = floor(10*root,fvar(39))+1,1
GetPower          = 25,10
Givepower = 20,20
AnimType          = Hard
PauseTime         = 0,0
Guard.PauseTime   = 0,0
HitFlag           = MAF
GuardFlag         = HA
HitSound          = S12600,1
GuardSound        = S0,201
Ground.Type       = High
Air.Type          = High
Ground.SlideTime  = 5
Ground.HitTime    = 16
Air.HitTime       = 16
Ground.Velocity   = 0,0
Guard.Velocity    = 0
Air.Velocity      = 0,0
AirGuard.Velocity = 0,0
palfx.time=40
palfx.add=50,50,100
palfx.sinadd=30,30,60,10
Guard.Kill=0
ID=571

[State 570]
Type=ParentVarSet
Trigger1=movehit=1
fvar(39)=parent,fvar(39)*0.92

[State 571]
Type=TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=Movehit=1
value=43816

[State 571]
Type=Destroyself
Trigger1=MoveContact
Trigger2=MoveReversed
Trigger3=Pos Y>=5

[State 251]
Type = Trans
Trigger1 = 1
Trans = Add

[State 251]
Type = AssertSpecial
Trigger1 = 1
Flag = Noshadow
IgnoreHitPause = 1

;-----------------------------------
;Frost Barrier
[StateDef 580]
Type        = S
MoveType    = A
Physics     = S
Anim        = 181
SprPriority = 1
VelSet      = 0,0
ctrl=0

[State 600]
Type = Helper
Trigger1 = time=0
StateNo = 581
ID = 581
Name = "Crystal"
Pos = 55,0
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 1
Size.YScale = 1
Facing = 1

[State 600]
Type = Helper
Trigger1 = Time = 0
StateNo = 581
ID = 582
Name = "Crystal"
Pos = -55,0
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
Size.XScale = 1
Size.YScale = 1
facing = -1

[State 580]
Type=Varset
Trigger1=time=0
var(9)=0

[State 500]
Type=PlaySnd
Trigger1=time=0
value=520,0

[State 580]
Type=Changestate
Trigger1=1
value=587

[Statedef 581]
Type=S
MoveType=A
Physics=N
anim=10541
poweradd = 0

[State -1]
Type        = Explod
Trigger1    = (Time = [1,12])
Anim        = 529
ID          = 529
Postype     = P1
Pos         = -25,0;30,0
Vel         = Cos(Random%80*Pi/180)*6,Sin(Random%80*Pi/180)*-6
Accel       = 0,.11
OwnPal      = 0
SprPriority = 8

[State 240]
Type = Helper
Trigger1 = time=[0,8]
StateNo = 582
ID = 582
Name = "FreezeIcicle"
Pos = 0,0
PosType = P1
Ownpal = 1
IgnoreHitPause = 1

[State 1091]
Type=Destroyself
Trigger1=time>=20

[Statedef 582]
Type=A
Movetype=I
Physics=N
anim=581
sprpriority=-2

[State 13962]
Type=Angleset
Trigger1=time=0
value=200-parent,time*18

[State 13962]
Type=Varset
Trigger1=time=0
var(0)=parent,time

[State x]
Type=Changeanim
Trigger1=root,stateno!=587
value=582
persistent=0

[State 13962]
Type=Angledraw
Trigger1=1
scale=1.3**(4-abs(var(0)-4))-0.8,1.3**(4-abs(var(0)-4))-0.8

[State 13962]
Type=Trans
Trigger1=1
trans=add

[State 261]
Type = AssertSpecial
Trigger1 = 1
Flag = Noshadow

[State 13962]
Type=destroyself
Trigger1=anim=582
Trigger1=animtime=0

; >Frozen in ice barrier state
[Statedef 587]
Type     = U
MoveType = H
Physics  = N
facep2=1

[State 587]
Type=sprpriority
Trigger1=1
value=-3
ignorehitpause=1

[State 500]
Type=Gravity
Trigger1=StateType=A
Trigger1=var(17)!=1

[State 537]
TYpe=Turn
Trigger1=P2Dist X<0

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
Type=VelSet
Trigger1=1
X=0

[State 592]
type = HitOverride
Trigger1=var(16)<997
Trigger1=RoundState=2
Trigger1=((var(59)=0) && (command="holdy")) || ((var(59)>0) && ((time<120) || Inguarddist))
Trigger2=var(9)<=60
attr = SCA, AA, AP, AT
stateno = 587
time = 1

[State x]
Type=Playerpush
Trigger1=1
value=0

[State 12007]
Type=HitFallSet
Trigger1=1
Value=0

[State 500]
Type=ChangeState
Triggerall=var(9)>60
Trigger1=var(16)>=998
Trigger2=RoundState>2
Trigger3=command!="holdy"
Trigger3=var(59)=0
Trigger4=var(59)>0
Trigger4=time>=120
Trigger4=!Inguarddist
value=50*(StateType=A)
ctrl=1

[State 500]
Type=VarAdd
Trigger1=1
v=16
value=2

[State 500]
Type=VarAdd
Trigger1=1
v=9
value=1
