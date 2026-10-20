; Ice Shard
[Statedef 500] 
Type     = U
MoveType = A
Physics  = N
Anim     = 505
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
Trigger1= time=12
v=16
value=200

[State 500]
Type=PlaySnd
Trigger1=time=8
Value=S500,0

[State 500]
Type=PlaySnd
Trigger1=time=4
Value=S505,0

[State 500]
Type=VelSet
Trigger1=StateType=A
Trigger1=time=12
Y=-2
X=-3

[State 500]
Type = Projectile
Trigger1 = time= 12
Attr              = A, NP
Damage            = floor(Cond(Ishelper,root,fvar(39),fvar(39))*(70+20*(Numhelper(12901)+Numhelper(12911)))),5+10*(Numhelper(12901)+Numhelper(12911))
getpower = 30,15
AnimType          = Hard
PauseTime         = 0,10
Guard.PauseTime   = 0,10
Offset            = 50,-50
Velocity          = 5,2
ProjID            = 500
ProjAnim          = 500
ProjHitAnim       = 501
ProjRemanim       = 501
ProjHits          = 1
ProjMissTime      = 1
ProjScale         = 0.5,0.5
ProjPriority      = 3
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

;Lightning Bolt (short range)
[Statedef 510] 
Type     = S
MoveType = A
Physics  = S
Anim     = 504
Ctrl     = 0
Facep2   = 1
PowerAdd = 20

[State 500]
Type=VarAdd
Trigger1=time=6
v=16
value=200

[State 500]
Type=PlaySnd
Trigger1=time=4
Value=S505,0

[State 500]
Type=PlaySnd
Trigger1=time=6
Value=S510,0

[State 500]
Type = Projectile
Trigger1 = time= 6
Attr              = S, SP
Damage            = floor(Cond(Ishelper,root,fvar(39),fvar(39))*85),15
getpower = 30,15
AnimType          = DiagUp
PauseTime         = 0,5
Guard.PauseTime   = 0,19
Offset            = 60,-Pos Y
Velocity          = 1,0
ProjID            = 510
ProjAnim          = 10211
ProjHitAnim       = -1
ProjRemanim       = -1
ProjHits          = 1
ProjMissTime      = 1
ProjScale         = 0.5,0.5
ProjPriority      = 10
ProjRemove        = 0
ProjRemoveTime    = 25
ProjHeightBound   = -240,10
HitFlag           = MA
GuardFlag         = MA
SparkNo           = S6015
guard.sparkno = S4040
SparkXY           = 0,-35
HitSound          = S12600,1
GuardSound        = S0,201
Ground.Type       = Low
Air.Type          = Low
Ground.SlideTime  = 5
Ground.HitTime    = 5
Air.HitTime       = 5
Ground.Velocity   = 0,-4
Guard.Velocity    = 0
Air.Velocity      = 0,-4
AirGuard.Velocity = 0,-2
Fall.Recover = 0
ID = 510
Fall=1
P2StateNo=IfElse(var(39)=43816,519,43816)
PalFx.time=30
Palfx.add=80,80,80
PalFx.Sinadd=50,50,50,10

[State 500]
Type=ChangeState
Trigger1=time>40
value=0
ctrl=1

[Statedef 519]
Movetype=H
Type=U
Physics=N
ctrl=0
velset=0,0

[State 529]
Type=PalFx
Trigger1=time=0
add=0,0,0
mul=256,256,256
sinadd=0,0,0,30
time=30

[State 519]
Type=ChangeState
Trigger1=time=0
Trigger1=!Selfanimexist(7696)
value=43816

[State 519]
Type=ChangeAnim
Trigger1=time=0
value=7696

[State 6660]
Type=VelSet
Trigger1=time>=9
X=0
Y=-4

[State 6660]
Type=SelfState
Trigger1=time>=9
value=5030

[Statedef 529]
Movetype=H
Type=A
Physics=N
ctrl=0
velset=0,0

[State 519]
Type=ChangeState
Trigger1=time=0
Trigger1=!Selfanimexist(7696)
value=43816

[State 529]
Type=PalFx
Trigger1=time=0
add=0,0,0
mul=256,256,256
sinadd=0,0,0,30
time=30

[State 519]
Type=ChangeAnim
Trigger1=time=0
value=7696

[State 6660]
Type=VelSet
Trigger1=time=0
X=-2
Y=-4

[State 6660]
Type=SelfState
Trigger1=time>=20
value=5030

; Thunderbolt (long range)
[Statedef 520] 
Type     = U
MoveType = A
Physics  = N
Anim     = 504
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
Trigger1=time=6
v=16
value=200

[State 500]
Type=PlaySnd
Trigger1=time=6
Value=S520,0

[State 500]
Type=PlaySnd
Trigger1=time=4
Value=S505,0

[State 500]
Type=VelSet
Trigger1=StateType=A
Trigger1=time=19
X=-4

[State 500]
Type = Projectile
Trigger1 = time= 19
Attr              = A, SP
Damage            = floor(Cond(Ishelper,root,fvar(39),fvar(39))*75),10
getpower = 30,15
AnimType          = DiagUp
PauseTime         = 0,5
Guard.PauseTime   = 0,5
Offset            = 75,-50
Velocity          = 8,0
ProjID            = 520
ProjAnim          = 10220
ProjHitAnim       = 6015
ProjRemanim       = 6015
ProjHits          = 1
ProjMissTime      = 10
ProjScale         = 1,1
ProjPriority      = 2
ProjRemove        = 1
ProjRemoveTime    = -1
ProjHeightBound   = -240,10
HitFlag           = MA
GuardFlag         = MA
SparkNo           = -1
guard.sparkno = S4040
SparkXY           = 0,0
HitSound          = S12600,1
GuardSound        = S0,201
Ground.Type       = Low
Air.Type          = Low
Ground.SlideTime  = 5
Ground.HitTime    = 5
Air.HitTime       = 5
Ground.Velocity   = -2,-4
Guard.Velocity    = 0
Air.Velocity      = -2,-4
AirGuard.Velocity = -2,-2
Fall.Recover = 0
ID = 510
P2StateNo=IfElse(var(39)=43816,529,43816)
PalFx.time=30
Palfx.add=80,80,80
PalFx.Sinadd=50,50,50,10
Guard.Kill=0

[State 500]
Type=ChangeState
Trigger1=time>45
value=50*(StateType=A)
ctrl=1

; Ground Freeze
[Statedef 530] 
Type     = C
MoveType = A
Physics  = C
Anim     = 505
Ctrl     = 0
Facep2   = 1
PowerAdd = 0

[State 500]
Type=VarAdd
Trigger1=time=5
v=16
value=400

[State 500]
Type=PlaySnd
Trigger1=time=4
Value=S505,0

[State 240]
Type = Helper
Trigger1 = time=25
StateNo = 531
ID = 531
Name = "Groundfreeze"
Pos = 25, -floor( Pos Y)
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Size.XScale = 1
Size.YScale = 1

[State 500]
Type=ChangeState
Trigger1=time>60
value=0
ctrl=1

[Statedef 531]
anim=9999
Type=C
Movetype=I
Physics=N

;**** Burden Relocator
[State 1081]
Type=Parentvarset
Trigger1=time>0
fvar(39)=parent,fvar(39)*fvar(39)

[State 1081]
Type=VarSet
Trigger1=1
fvar(39)=1

[State 530]
Type=playsnd
Trigger1=time %10=1
value=S13950,0

[State 530]
Type=VarSet
Trigger1=random<20+25*(Numhelper(12901)+Numhelper(12911))
Trigger1=time %20=1
v=9
value=1

[State 531]
Type=Helper
Triggerall=time<150
Trigger1=time %20=1
ID=532
name="Cold"
ownpal=1
stateno=532
size.xscale=0.8
size.yscale=0.8
pos=2*time,-floor(Pos Y)

[State 531]
Type=Destroyself
Trigger1=time>=150
Trigger1=numhelper(532)=0

[Statedef 532]
Type=C
MoveType=A
anim=531
Physics=N

[State 541]
Type=Assertspecial
trigger1=1
flag=noshadow

[State 500]
Type = HitDef
Trigger1 = time>=1
Trigger1 = !Movecontact
Trigger1 = !Movereversed
Attr              = C, SP
Damage            = floor(root,fvar(39)*parent,fvar(39)*31),0
getpower = 30,15
AnimType          = DiagUp
PauseTime         = 0,0
Guard.PauseTime   = 0,0
HitFlag           = MFD
GuardFlag         = M
SparkNo           = S6001
guard.sparkno = S4040
SparkXY           = 20,-40
HitSound          = S13950,1
GuardSound        = S0,201
Ground.Type       = Low
Air.Type          = Low
Ground.SlideTime  = 5
Ground.HitTime    = 5
Air.HitTime       = 5
Ground.Velocity   = -2,-8
Guard.Velocity    = 0
Air.Velocity      = -2,-8
AirGuard.Velocity = -2,-8
ID = 531
Fall=1
Fall.Recover = 1
PalFx.time=30
Palfx.add=-80,0,80
PalFx.Sinadd=50,50,50,10

[State 501]
Type=Parentvarset
Trigger1=movehit=1
fvar(39)=parent,fvar(39)*0.87

[State 1031]
Type=TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=NumTarget(531)>0
Trigger1=(parent,var(9)=1) && (target,name!="Cirno")
Trigger1=movehit=1
value=IFElse(root,var(39)=13744,13744,13951)

[State 1031]
Type=ChangeState
Trigger1=NumTarget(531)>0
trigger1=target,stateno=[13951,13952]
value=6868

[State 532]
Type=Destroyself
Trigger1=animtime=0

; Chain Lightning
[Statedef 540] 
Type     = U
MoveType = A
Physics  = N
Anim     = 504
Ctrl     = 0
Facep2   = 1
PowerAdd = 0

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
Trigger1=time=6
v=16
value=200

[State 500]
Type=PlaySnd
Trigger1=time=6
Value=S520,0

[State 500]
Type=PlaySnd
Trigger1=time=4
Value=S505,0

[State 500]
Type=VelSet
Trigger1=StateType=A
Trigger1=time=19
X=-2

[State 240]
Type = Helper
Trigger1 = time=19
StateNo = 541
ID = 541
Name = "ChainLightning"
Pos = 75,-50
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Size.XScale = 1
Size.YScale = 1

[State 500]
Type=ChangeState
Trigger1=time>45
value=50*(StateType=A)
ctrl=1

[Statedef 541]
Type=A
MoveType=A
Physics=N
anim=542

[State 541]
Type=VarSet
Trigger1=time=0
Trigger1=parent,ishelper(542)
var(0)=parent,var(0)

[State 541]
Type=AngleDraw
Trigger1=1
scale=0.01*(7-(abs(6-time))),0.01*(7-(abs(6-time)))

[State 541]
Type=Trans
Trigger1=1
trans=add

[State 541]
Type=Assertspecial
trigger1=1
flag=noshadow

[State 240]
Type = Helper
Trigger1 = time=6
StateNo = 543
ID = 542
Name = "Lightning"
Pos = 0,0
PosType = P1
IgnoreHitPause = 1
Size.XScale = 1
Size.YScale = 1

[State 541]
Type=Destroyself
Trigger1=time>=12

[Statedef 542]
Type=A
MoveType=A
Physics=N
anim=541

[State 251]
Type = AngleSet
Trigger1 = (fvar(1) != 0)
Trigger1 = time=0
Value = ATan(fvar(2)/fvar(1))*(-180.0/Pi)+((fvar(1)<0)*180)

[State 251]
Type = AngleSet
Trigger1 = (fvar(1) = 0)
Trigger1 = time=0
Value = IfElse(fvar(2)<0,90,-90)

[State 251]
Type = AngleAdd
Trigger1 = time=0
Value = -90

[State 251]
Type = AngleDraw
Trigger1 = 1
Scale = exp(ln(fvar(1)*fvar(1)+fvar(2)*fvar(2))*0.5)/224,exp(ln(fvar(1)*fvar(1)+fvar(2)*fvar(2))*0.5)/224

[State 541]
Type=Trans
Trigger1=1
trans=add

[State 541]
Type=Assertspecial
trigger1=1
flag=noshadow

[State 240]
Type = Helper
Trigger1 = var(0)<=10
Trigger1 = time=0
StateNo = 541
ID = 541
Name = "ChainLightning"
Pos = floor(fvar(1)),floor(fvar(2))
PosType = P1
IgnoreHitPause = 1
Size.XScale = 1
Size.YScale = 1

[State 541]
Type=Destroyself
Trigger1=time>=12

[Statedef 543]
anim=9999

[State 541]
Type=VarSet
Trigger1=time=0
var(0)=parent,var(0)+1

[State 541]
Type=VarSet
Trigger1=1
var(9)=0

[State 541]
Type=VarSet
Trigger1=1
fvar(1)=random %121-30

[State 541]
Type=VarSet
Trigger1=1
fvar(2)=random %51-40

[State 543]
Type=changestate
Trigger1=abs(fvar(1))+abs(fvar(2))>15
value=544

[Statedef 544]

[State 544]
Type = Projectile
Trigger1 = 1
Attr              = A, NP
Damage            = floor(root,fvar(39)*75),8*(P2statetype=A)
getpower = 30,15
AnimType          = DiagUp
PauseTime         = 0,0
Guard.PauseTime   = 0,0
Offset            = var(9)*fvar(1)*0.2,var(9)*fvar(2)*0.2
Velocity          = 0,0
ProjID            = 540
ProjAnim          = 543
ProjHitAnim       = -1
ProjRemanim       = -1
ProjHits          = 1
ProjMissTime      = 1
ProjScale         = 0.5,0.5
ProjPriority      = 10
ProjRemove        = 0
ProjRemoveTime    = 1
ProjHeightBound   = -240,10
HitFlag           = MAP
GuardFlag         = MA
SparkNo           = S6015
guard.sparkno = S4040
SparkXY           = 0,0
HitSound          = S12600,1
GuardSound        = S0,201
Ground.Type       = Low
Air.Type          = Low
Ground.SlideTime  = 5
Ground.HitTime    = 5
Air.HitTime       = 5
Ground.Velocity   = 0,-4
Guard.Velocity    = 0
Air.Velocity      = 0,-4
AirGuard.Velocity = 0,-2
Fall.Recover = 0
ID = 540
Fall=1
P2StateNo=529
PalFx.time=30
Palfx.add=80,80,80
PalFx.Sinadd=50,50,50,10

[State 541]
Type=VarAdd
Trigger1=1
var(9)=1

[State 541]
Type=ChangeState
Trigger1=1
value=544-2*(var(9)>=5)

