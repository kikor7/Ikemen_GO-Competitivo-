;----------------------------
; Danmaku Bar
;----------------------------

[Statedef 999]
Physics=N
anim=9999
sprpriority = 9999

[State -2]
Type=ParentVarAdd
Trigger1=parent,var(41)!=GameTime
Trigger1=parent,stateno!=1400
var(40)=1
ignorehitpause=1

[State -2]
Type=ParentVarAdd
Trigger1=Gametime %20=1
var(40)=-1
ignorehitpause=1

[State 7801]
Type=Explod
Trigger1=1
anim=19999-10*(Teamside=2)
ID = 19999
Postype=left
pos= ifelse(TeamSide=1, GameWidth/2 - 93*ifelse(GameWidth > 330, 1, 0.75), GameWidth/2 + 93*ifelse(GameWidth > 330, 1, 0.75)), ifelse(GameWidth > 330, 38, 29) ;debajo de la barra de super
bindtime=1
removetime=1
vel=0,0
sprpriority=990
ownpal=1
scale= (0.5)*0.61*ifelse(GameWidth > 330, 1, 0.75),(0.5)*0.7
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7801]
Type=Explod
Trigger1=root,var(16)<=400
anim=19990-10*(Teamside=2)
ID = 19999
Postype=left
pos= ifelse(TeamSide=1, GameWidth/2 - 93*ifelse(GameWidth > 330, 1, 0.75), GameWidth/2 + 93*ifelse(GameWidth > 330, 1, 0.75)), ifelse(GameWidth > 330, 38, 29) ;debajo de la barra de super
bindtime=1
removetime=1
vel=0,0
sprpriority=999
ownpal=1
scale= (1.385*(0.01+0.49*(1000-root,var(16))*0.001))*0.61*ifelse(GameWidth > 330, 1, 0.75),(0.7)*0.7
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7801]
Type=Explod
Trigger1=root,var(16)=[401,600]
anim=19991-10*(Teamside=2)
ID = 19999
Postype=left
pos= ifelse(TeamSide=1, GameWidth/2 - 93*ifelse(GameWidth > 330, 1, 0.75), GameWidth/2 + 93*ifelse(GameWidth > 330, 1, 0.75)), ifelse(GameWidth > 330, 38, 29) ;debajo de la barra de super
bindtime=1
removetime=1
vel=0,0
sprpriority=999
ownpal=1
scale= (1.385*(0.01+0.49*(1000-root,var(16))*0.001))*0.61*ifelse(GameWidth > 330, 1, 0.75),(0.7)*0.7
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7801]
Type=Explod
Trigger1=root,var(16)=[601,800]
anim=19992-10*(Teamside=2)
ID = 19999
Postype=left
pos= ifelse(TeamSide=1, GameWidth/2 - 93*ifelse(GameWidth > 330, 1, 0.75), GameWidth/2 + 93*ifelse(GameWidth > 330, 1, 0.75)), ifelse(GameWidth > 330, 38, 29) ;debajo de la barra de super
bindtime=1
removetime=1
vel=0,0
sprpriority=999
ownpal=1
scale= (1.385*(0.01+0.49*(1000-root,var(16))*0.001))*0.61*ifelse(GameWidth > 330, 1, 0.75),(0.7)*0.7
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7801]
Type=Explod
Trigger1=root,var(16)=[801,1000]
anim=19992-10*(Teamside=2)+6*(gametime %20<10)
ID = 19999
Postype=left
pos= ifelse(TeamSide=1, GameWidth/2 - 93*ifelse(GameWidth > 330, 1, 0.75), GameWidth/2 + 93*ifelse(GameWidth > 330, 1, 0.75)), ifelse(GameWidth > 330, 38, 29) ;debajo de la barra de super
bindtime=1
removetime=1
vel=0,0
sprpriority=999
ownpal=1
scale= (1.385*(0.01+0.49*(1000-root,var(16))*0.001))*0.61*ifelse(GameWidth > 330, 1, 0.75),(0.7)*0.7
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7801]
Type=Explod
Trigger1=root,var(16)>=5000
anim=19998-10*(Teamside=2)
ID = 19999
Postype=left
pos= ifelse(TeamSide=1, GameWidth/2 - 93*ifelse(GameWidth > 330, 1, 0.75), GameWidth/2 + 93*ifelse(GameWidth > 330, 1, 0.75)), ifelse(GameWidth > 330, 38, 29) ;debajo de la barra de super
bindtime=1
removetime=1
vel=0,0
sprpriority=999
ownpal=1
scale= (1.385*(0.01+0.49*(6000-root,var(16))/1000))*0.61*ifelse(GameWidth > 330, 1, 0.75),(0.7)*0.7
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

; Burden Bar
[State 7801,z]
Type=Explod
Trigger1=RoundState=2
anim=9001
ID = 19999
Postype=left
pos= ifelse(TeamSide=1, GameWidth/2 - 93*ifelse(GameWidth > 330, 1, 0.75), GameWidth/2 + 93*ifelse(GameWidth > 330, 1, 0.75)), ifelse(GameWidth > 330, 38, 29)+5 ;debajo de la barra de super
bindtime=1
removetime=1
vel=0,0
sprpriority=990
ownpal=1
scale= (0.5)*0.61*ifelse(GameWidth > 330, 1, 0.75),(0.5)*0.7
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999
facing=1-2*(Teamside=2)

[State 7801,q]
Type=Explod
Trigger1=RoundState=2
anim=19990+(root,fvar(39)<0.75)+(root,fvar(39)<0.5)+6*(root,fvar(39)<0.25)
ID = 19999
Postype=left
pos= ifelse(TeamSide=1, GameWidth/2 - 93*ifelse(GameWidth > 330, 1, 0.75), GameWidth/2 + 93*ifelse(GameWidth > 330, 1, 0.75)), ifelse(GameWidth > 330, 38, 29)+5 ;debajo de la barra de super
bindtime=1
removetime=1
vel=0,0
sprpriority=1020
ownpal=1
scale= (1.385*0.5*(1-root,fvar(39)))*0.61*ifelse(GameWidth > 330, 1, 0.75),(0.25)*0.7
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999
facing=1-2*(Teamside=2)

;Run FWD
[Statedef 100]
Type    = S
MoveType= I
Physics = N
Anim    = 100
Ctrl    = 0
VelSet  = 0,0
SprPriority = 1

;[State 100]
;Type=NotHitBy
;Trigger1=1
;value=,NP,SP

[State 100]
Type = VelSet
Trigger1 = Time = 6
X = Const(Velocity.Run.Fwd.X)

[State 100]
Type = AssertSpecial
Trigger1 = 1
Flag = NoWalk
Flag2 = NoAutoTurn

[State 100]
Type = AfterImage
Trigger1 = Time = 1
Trans = Add
Time = 2
Length = 10
PalBright = 0,0,0
PalContrast = 0,0,150
PalAdd = 0,0,25
PalMul = .5,.5,.5

[State 3560, Effect]
type = Explod
trigger1 = time = 0
anim = 6104
scale = 0.5,0.5
postype = p1
pos = 0,const(size.mid.pos.y)-5
sprpriority = -4
ownpal = 1
removeongethit = 1
facing = 1

[State -1]
Type        = Explod
Trigger1    = Time >=5
Anim        = 6118
ID          = 6118
Pos         = -20,-70+Random%60
PosType     = P1
Vel         = -4,0
Ownpal      = 1
SprPriority = -1
Persistent=4

[State 100]
Type = PlaySnd
Trigger1 = Time = 0
Value = s0,100

[State 100, 3]
type = ChangeState
triggerall = time>=10
trigger1 = Command ="holddown"
trigger1 = var(59)=0
value=10
ctrl=1

[State 100, 3]
type = ChangeState
triggerall = time>=10
trigger1 = Command ="holdup"
trigger1 = var(59)=0
value=40

[State 100, 3]
type = ChangeState
triggerall = time>=10
trigger1 = Command !="holdfwd"
trigger1 = var(59)=0
trigger2 = P2BodyDist X<30
trigger2 = var(59)=1
Trigger2 = helper(991),var(8)=0
Trigger2 = helper(991),var(9)=0
trigger3 = roundstate>2
Trigger4 = time>=75
value = 99
ctrl=1

; Run Back
[Statedef 105]
Type    = S
MoveType= I
Physics = N
Anim    = 105
Ctrl    = 0
VelSet  = 0,0
SprPriority = 1

[State 100]
Type = AfterImage
Trigger1 = Time = 1
Trans = Add
Time = 2
Length = 10
PalBright = 0,0,0
PalContrast = 0,0,150
PalAdd = 0,0,25
PalMul = .5,.5,.5

[State 105, 1]
type = VelSet
trigger1 = time=0
x = const(velocity.run.back.x)

;[State 100]
;Type=NotHitBy
;Trigger1=1
;value=,NP,SP

[State 100]
Type = AssertSpecial
Trigger1 = 1
Flag = NoWalk
Flag2 = NoAutoTurn

[State 3560, Effect]
type = Explod
trigger1 = time = 0
anim = 6104
scale = 0.5,0.5
postype = p1
pos = 0,const(size.mid.pos.y)-5
sprpriority = -4
ownpal = 1
removeongethit = 1
facing = -1

[State -1]
Type        = Explod
Trigger1    = Time >=5
Anim        = 6118
ID          = 6118
Pos         = 20,-70+Random%60
PosType     = P1
Vel         = 4,0
Ownpal      = 1
SprPriority = -1
Persistent=4

[State 100]
Type = PlaySnd
Trigger1 = Time = 0
Value = s0,100

[State 100, 3]
type = ChangeState
triggerall = time>=10
trigger1 = Command ="holddown"
trigger1 = var(59)=0
value=10
ctrl=1

[State 100, 3]
type = ChangeState
triggerall = time>=10
trigger1 = Command ="holdup"
trigger1 = var(59)=0
value=40

[State 100, 3]
type = ChangeState
triggerall = time>=10
trigger1 = Command !="holdback"
trigger1 = var(59)=0
trigger2 = BackEdgeDist<30
trigger2 = var(59)=1
trigger3 = roundstate>2
Trigger4 = time>=75
Trigger5 = var(59)>0
Trigger5 = P2dist X<0
value = 99
ctrl=1

; Air Run FWD
[Statedef 110]
type = A
MoveType= I
ctrl = 0
physics = N
anim = 110
velset = 0,0

[State 110]
Type=PlayerPush
Trigger1=1
value=!(P2StateType=S)

[State 100]
Type = AfterImage
Trigger1 = Time = 1
Trans = Add
Time = 2
Length = 10
PalBright = 0,0,0
PalContrast = 0,0,150
PalAdd = 0,0,25
PalMul = .5,.5,.5

[State 650, 1]
type = VarAdd
trigger1 = Time = 0
var(1) = 1

[State 3560, Effect]
type = Explod
trigger1 = time = 0
anim = 6104
scale = 0.5,0.5
postype = p1
pos = 0,const(size.mid.pos.y)-5
sprpriority = -4
ownpal = 1
removeongethit = 1
facing = 1

[State -1]
Type        = Explod
Trigger1    = Time >=5
Anim        = 6118
ID          = 6118
Pos         = -20,-70+Random%60
PosType     = P1
Vel         = -4,0
Ownpal      = 1
SprPriority = -1
Persistent=4

;[State 100]
;Type=NotHitBy
;Trigger1=1
;value=,NP,SP

[State 110]
type = PlaySnd
trigger1 = time = 0
value = s0,100

[State 115]
type = velset
trigger1 = time = 0
x = const(velocity.run.fwd.x)*0.9

[State 100, 3]
type = ChangeState
Triggerall = time>=10
trigger1 = Command !="holdfwd"
trigger1 = var(59)=0
trigger2 = P2BodyDist X<30
trigger2 = var(59)=1
Trigger2 = helper(991),var(8)=0
Trigger2 = helper(991),var(9)=0
trigger3 = roundstate>2
trigger4 = time>=75
value = 99
ctrl=1

; Air Run Back
[Statedef 115]
type = A
MoveType= I
ctrl = 0
physics = N
anim = 115
velset = 0,0

;[State 100]
;Type=NotHitBy
;Trigger1=1
;value=,NP,SP

[State 650, 1]
type = VarAdd
trigger1 = Time = 0
var(1) = 1

[State 100]
Type = AfterImage
Trigger1 = Time = 1
Trans = Add
Time = 2
Length = 10
PalBright = 0,0,0
PalContrast = 0,0,150
PalAdd = 0,0,25
PalMul = .5,.5,.5

[State 3560, Effect]
type = Explod
trigger1 = time = 0
anim = 6104
scale = 0.5,0.5
postype = p1
pos = 0,const(size.mid.pos.y)-5
sprpriority = -4
ownpal = 1
removeongethit = 1
facing = -1

[State -1]
Type        = Explod
Trigger1    = Time >=5
Anim        = 6118
ID          = 6118
Pos         = 20,-70+Random%60
PosType     = P1
Vel         = 4,0
Ownpal      = 1
SprPriority = -1
Persistent=4

[State 110]
type = PlaySnd
trigger1 = time = 0
value = s0,100

[State 115]
type = velset
trigger1 = time = 0
x = const(velocity.run.back.x)*0.9

[State 100, 3]
type = ChangeState
triggerall = time>=10
trigger1 = Command !="holdback"
trigger1 = var(59)=0
trigger2 = BackEdgeDist<30
trigger2 = var(59)=1
trigger3 = roundstate>2
trigger4=time>=75
Trigger5 = var(59)>0
Trigger5 = P2dist X<0
value = 99
ctrl = 1

[Statedef 109]
Type=S
MoveType=I
Physics=N
anim=40
ctrl=0
velset=0,0

[State 109]
Type=CtrlSet
Trigger1=anim=41
value=(var(59)=0)
persistent=0

[State 109]
Type=Changeanim
Trigger1=anim=40
Trigger1=animtime=0
value=41

[State 109]
Type=StateTypeSet
Trigger1=anim=41
StateType=A
Physics=N
persistent=0

[State 109]
Type = velset
Trigger1= anim=41
X=0
Y=-12.5
persistent=0

[State 109]
Type=VelAdd
Trigger1=anim=41
Y=0.52

;[State 109]
;Type=NotHitBy
;Trigger1=1
;value2=,NP,SP

[State 100]
Type = PlaySnd
Trigger1 = Time = 0
Value = s0,3

[State 100]
Type = AfterImage
Trigger1 = Time = 1
Trans = Add
Time = 2
Length = 10
PalBright = 0,0,0
PalContrast = 0,0,150
PalAdd = 0,0,25
PalMul = .5,.5,.5

[State 3560, Effect]
type = Explod
trigger1 = time = 0
anim = 6017
scale = 1,1
postype = p1
pos = 0,0
sprpriority = -4
ownpal = 1
removeongethit = 1
facing = 1

[State 109]
Type=Changestate
Triggerall=anim=41
Trigger1=var(59)=0
Trigger1=inguarddist
Trigger1=command="holdback"
value=120

[State 109]
Type=Changestate
Trigger1=anim=41
Trigger1=vel Y>=-1
value=51
ctrl=1

[Statedef 162]
MoveType=I
Physics=N
anim=162

[State 162]
Type=BindToParent
Trigger1=1

[State 162]
Type=StateTypeSet
Trigger1=parent,StateType=S
StateType=S

[State 162]
Type=StateTypeSet
Trigger1=parent,StateType=A
StateType=A

[State 162]
Type=ReversalDef
Trigger1=1
reversal.attr = SCA,NP,SP
sparkno=-1
hitsound = S0,14
numhits=0

[State 162]
Type = Explod
Trigger1 = MoveHit = 1
Trigger2 = (Root,ProjCancelTime(162) = 1)
Trigger3 = root,NumProjId(162)=0
Trigger3 = time>0
Anim = 6111
ID = 6010
Pos = random %21-10,-60+random %30
Scale = .5,.5
Facing = 1-2*(random %2)
VFacing = 1-2*(random %2)
SprPriority = 5
PauseMoveTime = 99
Supermovetime = 99

[State 162]
Type = PowerAdd
Trigger1 = MoveHit = 1
Trigger2 = (Root,ProjCancelTime(162) = 1)
Trigger3 = root,NumProjId(162)=0
Trigger3 = time>0
value=6

[State 162]
Type = PlaySnd
Trigger1 = root,NumProjId(162)=0
Trigger1 = time>0
value=S0,14

[State 162]
Type = Projectile
Trigger1 = 1
Attr              = A, NP
GetPower          = 0
AnimType          = Back
PauseTime         = 0,0
OffSet            = 0,0
Velocity          = 0,0
ProjAnim          = 163
ProjRemAnim       = -1
ProjHits          = 0
ProjRemove        = 1
ProjRemoveTime    = 1
ProjPriority      = 1
ProjID            = 162
SuperMoveTime     = 1
PauseMoveTime     = 1
HitFlag           = P
GuardFlag         = MA
SparkNo           = -1
Guard.SparkNo      = -1
SparkXY           = 0,999
hitsound = S0,14
GuardSound        = -1
Guard.Dist = 0
ID=162

[State 162]
Type=ChangeState
Trigger1=time>=20
value=162

[State 162]
Type=Destroyself
Trigger1=parent,stateno!=[100,119]
Trigger1=parent,stateno!=1000 || parent,animelem=3,<0
Trigger1=parent,Stateno!=2000
Trigger1=parent,Stateno!=2107
Trigger1=parent,Stateno!=2200
Trigger1=parent,Stateno!=[2600,2607]

; Graze End
[Statedef 99]
facep2=1
Type=U
MoveType=I
Physics=U
anim=48
ctrl=1

[State 99]
Type=Assertspecial
Trigger1=1
flag=NoWalk

[State 99]
Type=VelMul
Trigger1=1
X=0.5
Y=0

[State 99]
Type=ChangeState
Trigger1=time>=10
value=50*(StateType=A)
