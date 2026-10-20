[Statedef 9900]
Type=U
MoveType=I
Physics=N
Anim=9900
sprpriority = -1
Facep2=1
velset = 0,0

[State 9900]
Type=DestroySelf
Trigger1=Parent,StateNo=[13551,13559]

[State 9900]
Type= AssertSpecial
Trigger1=1
flag=NoShadow

[State 9900]
Type=ChangeState
Trigger1=ParentDist X != [35,45]
value= IfElse(ParentDist X>35,9902,9901)

[Statedef 9901]
Type=U
MoveType=I
Physics=N
Anim=9901
sprpriority = -1
Facep2=1

[State 9901]
Type=Velset
Trigger1=1
X=-1

[State 9900]
Type=DestroySelf
Trigger1=Parent,StateNo=[13551,13559]

[State 9900]
Type= AssertSpecial
Trigger1=1
flag=NoShadow

[State 9901]
Type=ChangeState
Trigger1=ParentDist X > 35
value= 9900

[Statedef 9902]
Type=U
MoveType=I
Physics=N
Anim=9902
sprpriority = -1
Facep2=1

[State 9900]
Type=DestroySelf
Trigger1=Parent,StateNo=[13551,13559]

[State 9900]
Type= AssertSpecial
Trigger1=1
flag=NoShadow

[State 9902]
Type=Velset
Trigger1=1
X=2

[State 9902]
Type=ChangeState
Trigger1=ParentDist X < 35
;Trigger1=time>=15
value= 9900

[Statedef 7802]
Physics=N
anim=9999

[State -2]
Type=AssertSpecial
Trigger1=var(57)>0
flag=TimerFreeze
ignorehitpause=1

[State 7802]
Type=VarSet
Trigger1=var(56)>50
var(56)=50

[State 7802]
Type=VarSet
Trigger1=var(56)!=0
Trigger1=var(56)<5
var(56)=5

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
Type=AssertSpecial
Trigger1=1
flag=intro

[State 191]
Type=PlaySnd
Trigger1=time=0
value=190,0

[State 191]
Type=Helper
Trigger1=Roundno=1
Trigger1=name="Eriol Hiiragizawa" || name = "Void"
Trigger1=NumHelper(196)=0
Trigger1=Name!="Void" || (time>90)
StateNo = 196
ID = 196
Name = "CardIntro"
Pos = 0,-50
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
PauseMoveTime=9999999
supermovetime=9999999
Size.xscale=1
Size.yscale=1

[State 191, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 0

[Statedef 196]
anim=9999

[State 196]
Type=Helper
Trigger1=time<120
Trigger1=time %10=0
StateNo = 197
ID = 197
Name = "Card"
Pos = 0,0
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
PauseMoveTime=9999999
supermovetime=9999999
Size.xscale=0.166666
Size.yscale=0.166666

[State 192]
Type=Destroyself
Trigger1=RoundState>1
Trigger2=parent,Stateno!=191

[Statedef 197]
anim=7700+8+random %(53-8)

[State 193]
Type=ChangeState
Trigger1=time=0
Trigger1=parent,var(anim-7700)=1
value=197

[State 193]
Type=ParentVarSet
Trigger1=time=0
var(anim-7700)=1

[State 523]
Type=VarSet
Trigger1=1
var(17)=time-30

[State 523]
type = VarSet
trigger1 = 1
fv=0
value = 2*pi*(var(17)/120.0)

[State 523]
Type = BindToParent
Trigger1 = 1
Pos= 60*Cos(fvar(0))-10*(root,name="Void"),14*Sin(Fvar(0))-48+25*root,name="Void"

[State 523]
Type=Sprpriority
Trigger1=1
value=3-6*(((var(17)+120) %120)>=60)

[State 523]
Type=AngleDraw
Trigger1=1
scale=0.4-((var(17) %120)<=60)*abs((var(17) %120)-30)*0.005-((var(17) %120)>60)*(0.3-abs((var(17) %120)-90)*0.005),0.4-((var(17) %120)<=60)*abs((var(17) %120)-30)*0.005-((var(17) %120)>60)*(0.3-abs((var(17) %120)-90)*0.005)

[State 197]
Type=Assertspecial
Trigger1=1
flag=noshadow

[State 193]
Type=destroyself
Trigger1=roundstate>1
trigger2=root,stateno!=191
trigger3=time=360-120*(root,name="Void")

; RUN_BACK
[Statedef 105]
type    = A
physics = A
ctrl = 0
anim = 105
sprpriority = 1

[State 100]
Type=Playsnd
Trigger1=time=0
value=S0,3

[State 105, 1]
type = VelSet
trigger1 = Time = 0
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

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

[State 105, 3]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 99

;---------------------------------------------------------------------------
; RUN_FWD
[Statedef 100]
type    = S
physics = S
anim = 100
sprpriority = 1
ctrl=0

[State 100]
Type=Playsnd
Trigger1=time=0
value=S0,3

[State 100, 1]
type = VelSet
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, 2] ;Prevent run from canceling into walk
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

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

[State 100, 4]
type = ChangeState
triggerall=time>=10
trigger1 = command != "holdfwd"
trigger1 = var(59)=0
Trigger2 = var(59)>0
Trigger2 = abs(P2BodyDist X)<40
Trigger2 = helper(991),var(8)=0
Trigger2 = helper(991),var(9)=0
Trigger3 = Roundstate!=2
Trigger4 = time>=75
value = 99

[Statedef 192]
anim=9999
Physics=N
velset=0,0

[State 192]
Type=VarSet
Trigger1=1
var(1)=1

[State 192]
Type=VarSet
Trigger1=1
var(2)=50

[State 192]
Type=parentvarset
Trigger1=1
v=50
value=0

[State 192]
Type=parentvarset
Trigger1=1
v=51
value=0

[State 192]
Type=parentvarset
Trigger1=1
v=52
value=0

[State 192]
Type=parentvarset
Trigger1=1
v=53
value=0

[State 192]
Type=parentvarset
Trigger1=1
v=54
value=0

[State 192]
Type=Changestate
Trigger1=1
value=193

[Statedef 193]

[State 7703]
Type=Explod
Trigger1=1
anim=7700+var(1)
ID = 192
Postype=P1
pos= 0,0
bindtime=-1
removetime=-1
ontop=1
vel=0,0
sprpriority=99
ownpal=1
scale= 0.5/6.0,0.5/6.0
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7703]
Type=Explod
Trigger1=1
anim=7700+IfElse(var(1)=1,53,var(1)-1)
ID = 192
Postype=P1
pos= -30,0
bindtime=-1
removetime=-1
ontop=1
vel=0,0
sprpriority=99
ownpal=1
scale= 0.5/6.0,0.5/6.0
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7703]
Type=Explod
Trigger1=1
anim=7808
ID = 192
Postype=P1
pos= -30,0
bindtime=-1
removetime=-1
ontop=1
vel=0,0
sprpriority=199
ownpal=1
scale= 1,1
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7703]
Type=Explod
Trigger1=1
anim=7700+IfElse(var(1)<=2,var(1)+51,var(1)-2)
ID = 192
Postype=P1
pos= -60,0
bindtime=-1
removetime=-1
ontop=1
vel=0,0
sprpriority=99
ownpal=1
scale= 0.5/6.0,0.5/6.0
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7703]
Type=Explod
Trigger1=1
anim=7816
ID = 192
Postype=P1
pos= -60,0
bindtime=-1
removetime=-1
ontop=1
vel=0,0
sprpriority=199
ownpal=1
scale= 1,1
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7703]
Type=Explod
Trigger1=1
anim=7700+IfElse(var(1)=53,1,var(1)+1)
ID = 192
Postype=P1
pos= 30,0
bindtime=-1
removetime=-1
ontop=1
vel=0,0
sprpriority=99
ownpal=1
scale= 0.5/6.0,0.5/6.0
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7703]
Type=Explod
Trigger1=1
anim=7808
ID = 192
Postype=P1
pos= 30,0
bindtime=-1
removetime=-1
ontop=1
vel=0,0
sprpriority=199
ownpal=1
scale= 1,1
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7703]
Type=Explod
Trigger1=1
anim=7700+IfElse(var(1)>=52,var(1)-51,var(1)+2)
ID = 192
Postype=P1
pos= 60,0
bindtime=-1
removetime=-1
ontop=1
vel=0,0
sprpriority=99
ownpal=1
scale= 0.5/6.0,0.5/6.0
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7703]
Type=Explod
Trigger1=1
anim=7816
ID = 192
Postype=P1
pos= 60,0
bindtime=-1
removetime=-1
ontop=1
vel=0,0
sprpriority=199
ownpal=1
scale= 1,1
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 193]
Type=Changestate
Trigger1=1
value=194

[Statedef 194]

[State 194]
Type=assertspecial
Trigger1=var(2)<55
flag=intro

[State 194]
Type=Removeexplod
Trigger1=roundstate>1
ID=192

[State 194]
Type=Removeexplod
Trigger1=roundstate>1
ID=193

[State 194]
Type=destroyself
Trigger1=roundstate>1

[State 194]
Type=varadd
Trigger1=time>20
Trigger1=parent,command="holdback"
v=1
value=-1+2*(Teamside=2)

[State 194]
Type=varadd
Trigger1=time>20
Trigger1=parent,command="holddown"
v=1
value=-5

[State 194]
Type=varadd
Trigger1=time>20
Trigger1=parent,command="holdfwd"
v=1
value=1-2*(Teamside=2)

[State 194]
Type=varadd
Trigger1=time>20
Trigger1=parent,command="holdup"
v=1
value=5

[State 194]
Type=VarSet
Trigger1=var(1)<1
var(1)=var(1)+53

[State 194]
Type=VarSet
Trigger1=var(1)>53
var(1)=var(1)-53

[State 194]
Type=RemoveExplod
Triggerall=time>20
Trigger1=parent,command="holdfwd"
Trigger2=parent,command="holdback"
Trigger3=parent,command="holddown"
Trigger4=parent,command="holdup"
ID=192

[State 192]
Type=Changestate
Triggerall=time>20
Trigger1=parent,command="holdfwd"
Trigger2=parent,command="holdback"
Trigger3=parent,command="holddown"
Trigger4=parent,command="holdup"
value=193

[State 192]
Type=Changestate
Trigger1=parent,command="start"
Trigger1=time>20
Trigger1=var(2)=[50,54]
Trigger1=(var(1)!=7) || (name!="Void")
value=195

[Statedef 195]

[State 195]
Type=ParentvarSet
Trigger1=1
var(var(2))=var(1)

[State 195]
Type=VarAdd
Trigger1=1
v=2
value=1

[State 195]
Type=Explod
Trigger1=1
anim=7700+var(1)
ID = 193
Postype=P1
pos= -90+30*(var(2)-50),50
bindtime=-1
removetime=-1
ontop=1
vel=0,0
sprpriority=99
ownpal=1
scale= 0.5/6.0,0.5/6.0
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 193]
Type=Changestate
Trigger1=1
value=194

;
; Danmaku Bar Display
;
[Statedef 7600]
anim=9999
MoveType=I

[State 7801]
Type=Explod
Trigger1=RoundState=2
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
Trigger1=RoundState=2
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
Trigger1=RoundState=2
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
Trigger1=RoundState=2
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
Trigger1=RoundState=2
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
Trigger1=RoundState=2
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
scale= (1.385*(0.01+0.49*(6250-root,var(16))/1250))*0.61*ifelse(GameWidth > 330, 1, 0.75),(0.7)*0.7
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7801]
Type=Explod
Trigger1=RoundState=2
Trigger1=parent,var(17)=1
anim=20070
ID = 20070
Postype=left
pos= ifelse(TeamSide=1, GameWidth/2 - 93*ifelse(GameWidth > 330, 1, 0.75) - 20, GameWidth/2 + 93*ifelse(GameWidth > 330, 1, 0.75)), ifelse(GameWidth > 330, 38, 29)+5 ;debajo de la barra de super
bindtime=1
removetime=1
vel=0,0
sprpriority=990
ownpal=1
scale= 0.2,0.2
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7801]
Type=Explod
Trigger1=RoundState=2
Trigger1=parent,var(17)=2
anim=20071
ID = 20071
Postype=left
pos= ifelse(TeamSide=1, GameWidth/2 - 93*ifelse(GameWidth > 330, 1, 0.75) - 20, GameWidth/2 + 93*ifelse(GameWidth > 330, 1, 0.75)), ifelse(GameWidth > 330, 38, 29)+15 ;debajo de la barra de super
bindtime=1
removetime=1
vel=0,0
sprpriority=990
ownpal=1
scale= 0.2,0.2
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7801]
Type=Explod
Trigger1=RoundState=2
Trigger1=parent,var(19)=1
anim=20072
ID = 20072
Postype=left
pos= ifelse(TeamSide=1, GameWidth/2 - 93*ifelse(GameWidth > 330, 1, 0.75) - 15, GameWidth/2 + 93*ifelse(GameWidth > 330, 1, 0.75) + 5), ifelse(GameWidth > 330, 38, 29)+20 ;debajo de la barra de super
bindtime=1
removetime=1
vel=0,0
sprpriority=990
ownpal=1
scale= 0.2,0.2
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7801]
Type=Explod
Trigger1=RoundState=2
Trigger1=NumHelper(13111)>0
anim=13101
ID = 20073
Postype=left
pos= ifelse(TeamSide=1, GameWidth/2 - 93*ifelse(GameWidth > 330, 1, 0.75) - 15, GameWidth/2 + 93*ifelse(GameWidth > 330, 1, 0.75) + 5), ifelse(GameWidth > 330, 38, 29)+55 ;debajo de la barra de super
bindtime=1
removetime=1
vel=0,0
sprpriority=990
ownpal=1
scale= 0.15,0.15
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

;
; Spellcard Effect time left display
;
;  Fly Card - Evasive Action
;
; Helper(7600),var(19) time left to stay in air

[State 7600]
Type=VarAdd
Trigger1=root,stateno=14001
Trigger2=root,stateno=[120,160]
Trigger2=root,var(17)=1
Trigger2=root,stateType=A
var(19)=1

[State 7600]
Type=VarSet
Trigger1=root,stateno!=14001
Trigger1=root,statetype!=A
Trigger1=root,stateNo!=[120,160]
var(19)=0

[State 7600]
Type=VarSet
Trigger1=1
var(0)=7601

[State 7600]
Type=VarSet
Trigger1=1
var(30)=20023

[State 7600]
Type=VarSet
Trigger1=1
var(31)=720

[State 7600]
Type=VarSet
Trigger1=1
var(32)=var(19)

[State 7600]
Type=VarSet
Trigger1=1
var(33)=6

[State 7600]
Type=ChangeState
Trigger1=1
value=IFElse(var(19)>0,7699,7601)

;
; Voice Card - Eternal Command
;

[Statedef 7601]

[State 7600]
Type=VarSet
Trigger1=1
var(0)=7602

[State 7600]
Type=VarSet
Trigger1=1
var(30)=20025

[State 7600]
Type=VarSet
Trigger1=1
var(31)=900

[State 7600]
Type=VarSet
Trigger1=1
var(32)=900-root,var(24)

[State 7600]
Type=VarSet
Trigger1=1
var(33)=6+7*(var(19)>0)

[State 7600]
Type=ChangeState
Trigger1=1
value=IFElse(root,var(24)>0,7699,7602)

;
; Twin Card - Double Trouble
;

[Statedef 7602]

[State 7600]
Type=VarSet
Trigger1=1
var(0)=7603

[State 7600]
Type=VarSet
Trigger1=1
var(30)=20027

[State 7600]
Type=VarSet
Trigger1=1
var(31)=900

[State 7600]
Type=VarSet
Trigger1=NumHelper(12501)
var(32)=Helper(12501),var(6)

[State 7600]
Type=VarSet
Trigger1=1
var(33)=6+7*(var(19)>0)+7*(root,var(24)>0)

[State 7600]
Type=ChangeState
Trigger1=1
value=IFElse(NumHelper(12501)>0,7699,7603)

;
; Sleep Card - Lullaby
;

[Statedef 7603]

[State 7600]
Type=VarSet
Trigger1=1
var(0)=7604

[State 7600]
Type=VarSet
Trigger1=1
var(30)=20029

[State 7600]
Type=VarSet
Trigger1=1
var(31)=1200

[State 7600]
Type=VarSet
Trigger1=NumHelper(12951)
var(32)=Helper(12951),time

[State 7600]
Type=VarSet
Trigger1=1
var(33)=6+7*((var(19)>0)+(root,var(24)>0)+(NumHelper(12501)>0))

[State 7600]
Type=ChangeState
Trigger1=1
value=IFElse(NumHelper(12951)>0,7699,7604)

;
; Shield Card - Grand Shield
;

[Statedef 7604]

[State 7600]
Type=VarSet
Trigger1=1
var(0)=7605

[State 7600]
Type=VarSet
Trigger1=1
var(30)=20031

[State 7600]
Type=VarSet
Trigger1=1
var(31)=300

[State 7600]
Type=VarSet
Trigger1=NumHelper(4041)
var(32)=Helper(4041),var(1)

[State 7600]
Type=VarSet
Trigger1=1
var(33)=6+7*((var(19)>0)+(root,var(24)>0)+(NumHelper(12501)>0)+(NumHelper(12951)>0))

[State 7600]
Type=ChangeState
Trigger1=1
value=IFElse(NumHelper(4041)>0,7699,7605)

;
; Shadow Card - Twilight Stalker
;

[Statedef 7605]

[State 7600]
Type=VarSet
Trigger1=1
var(0)=7606

[State 7600]
Type=VarSet
Trigger1=1
var(30)=20033

[State 7600]
Type=VarSet
Trigger1=1
var(31)=840

[State 7600]
Type=VarSet
Trigger1=NumHelper(13151)
var(32)=Helper(13151),var(29)

[State 7600]
Type=VarSet
Trigger1=1
var(33)=6+7*((var(19)>0)+(root,var(24)>0)+(NumHelper(12501)>0)+(NumHelper(12951)>0)+(NumHelper(4041)>0))

[State 7600]
Type=ChangeState
Trigger1=1
value=IFElse(NumHelper(13151)>0,7699,7606)

; 20035 - Sand : Sandstone Skin

[Statedef 7606]

[State 7600]
Type=VarSet
Trigger1=1
var(0)=7607

[State 7600]
Type=VarSet
Trigger1=1
var(30)=20035

[State 7600]
Type=VarSet
Trigger1=1
var(31)=600

[State 7600]
Type=VarSet
Trigger1=NumHelper(13211)
var(32)=Helper(13211),var(20)

[State 7600]
Type=VarSet
Trigger1=1
var(33)=6+7*((var(19)>0)+(root,var(24)>0)+(NumHelper(12501)>0)+(NumHelper(12951)>0)+(NumHelper(4041)>0)+(NumHelper(13151)>0))

[State 7600]
Type=ChangeState
Trigger1=1
value=IFElse(NumHelper(13211)>0,7699,7607)

; 20037 - Rain : Weather Forecast

[Statedef 7607]

[State 7600]
Type=VarSet
Trigger1=1
var(0)=7608

[State 7600]
Type=VarSet
Trigger1=1
var(30)=20037

[State 7600]
Type=VarSet
Trigger1=1
var(31)=1800

[State 7600]
Type=VarSet
Trigger1=NumHelper(13301)
var(32)=Helper(13301),time

[State 7600]
Type=VarSet
Trigger1=1
var(33)=6+7*((var(19)>0)+(root,var(24)>0)+(NumHelper(12501)>0)+(NumHelper(12951)>0)+(NumHelper(4041)>0)+(NumHelper(13151)>0)+(NumHelper(13211)>0))

[State 7600]
Type=ChangeState
Trigger1=1
value=IFElse(NumHelper(13301)>0,7699,7608)

; 20039 - Power : Super Strength

[Statedef 7608]

[State 7600]
Type=VarSet
Trigger1=1
var(0)=7609

[State 7600]
Type=VarSet
Trigger1=1
var(30)=20039

[State 7600]
Type=VarSet
Trigger1=1
var(31)=900

[State 7600]
Type=VarSet
Trigger1=1
var(32)=900-root,var(25)

[State 7600]
Type=VarSet
Trigger1=1
var(33)=6+7*((var(19)>0)+(root,var(24)>0)+(NumHelper(12501)>0)+(NumHelper(12951)>0)+(NumHelper(4041)>0)+(NumHelper(13151)>0)+(NumHelper(13211)>0)+(NumHelper(13301)>0))

[State 7600]
Type=ChangeState
Trigger1=1
value=IFElse(root,var(25)>0,7699,7609)

; 20041 - Mirror : Mirror Image (HP)

[Statedef 7609]

[State 7600]
Type=VarSet
Trigger1=1
var(0)=7610

[State 7600]
Type=VarSet
Trigger1=1
var(30)=20041

[State 7600]
Type=VarSet
Trigger1=1
var(31)=350

[State 7600]
Type=VarSet
Trigger1=NumHelper(4141)
var(32)=350-Helper(4141),life

[State 7600]
Type=Varadd
Trigger1=1
var(33)=7*(root,var(25)>0)

[State 7600]
Type=ChangeState
Trigger1=1
value=IFElse(Cond((NumHelper(4141)>0),(Helper(4141),life>0),0),7699,7610)

; 20043 - Illusion : Mirage attack

[Statedef 7610]

[State 7600]
Type=VarSet
Trigger1=1
var(0)=7611

[State 7600]
Type=VarSet
Trigger1=1
var(30)=20043

[State 7600]
Type=VarSet
Trigger1=1
var(31)=1500

[State 7600]
Type=VarSet
Trigger1=NumHelper(13871)
var(32)=Helper(13871),time

[State 7600]
Type=Varadd
Trigger1=1
var(33)=7*(NumHelper(4141)>0)

[State 7600]
Type=ChangeState
Trigger1=1
value=IFElse((NumHelper(13871)>0),7699,7611)

; 20043 - Illusion : Haunt /20045 - Glow : Rain of light/

[Statedef 7611]

[State 7600]
Type=VarSet
Trigger1=1
var(0)=7612

[State 7600]
Type=VarSet
Trigger1=1
var(30)=20043

[State 7600]
Type=VarSet
Trigger1=1
var(31)=3600

[State 7600]
Type=VarSet
Trigger1=NumHelper(13881)
var(32)=Helper(13881),time

[State 7600]
Type=Varadd
Trigger1=1
var(33)=7*(NumHelper(13871)>0)

[State 7600]
Type=ChangeState
Trigger1=1
value=IFElse((NumHelper(13881)>0),7699,7612)

; 20047 - Float : Levitation

[Statedef 7612]

[State 7600]
Type=VarSet
Trigger1=1
var(0)=7613

[State 7600]
Type=VarSet
Trigger1=1
var(30)=20047

[State 7600]
Type=VarSet
Trigger1=1
var(31)=1500

[State 7600]
Type=VarSet
Trigger1=1
var(32)=1500-root,var(22) %10000

[State 7600]
Type=Varadd
Trigger1=1
var(33)=7*(NumHelper(13881)>0)

[State 7600]
Type=ChangeState
Trigger1=1
value=IFElse(root,var(22) %10000>0,7699,7613)

; 20049 - Fight (both)

[Statedef 7613]

[State 7600]
Type=VarSet
Trigger1=1
var(0)=7614

[State 7600]
Type=VarSet
Trigger1=1
var(30)=20049

[State 7600]
Type=VarSet
Trigger1=1
var(31)=720

[State 7600]
Type=VarSet
Trigger1=1
var(32)=720-root,var(23) %10000

[State 7600]
Type=Varadd
Trigger1=1
var(33)=7*(root,var(22) %10000>0)

[State 7600]
Type=ChangeState
Trigger1=1
value=IFElse(root,var(23) %10000>0,7699,7614)

; 20051 - Erase : Vanisher

[Statedef 7614]

[State 7600]
Type=VarSet
Trigger1=1
var(0)=7615

[State 7600]
Type=VarSet
Trigger1=1
var(30)=20051

[State 7600]
Type=VarSet
Trigger1=1
var(31)=900

[State 7600]
Type=VarSet
Trigger1=NumHelper(14201)
var(32)=Helper(14201),var(9)

[State 7600]
Type=Varadd
Trigger1=1
var(33)=7*(root,var(23) %10000>0)

[State 7600]
Type=ChangeState
Trigger1=1
value=IFElse(NumHelper(14201)>0,7699,7615)

; 20053 - Dream : Magical Dreams

[Statedef 7615]

[State 7600]
Type=VarSet
Trigger1=1
var(0)=7616

[State 7600]
Type=VarSet
Trigger1=1
var(30)=20053

[State 7600]
Type=VarSet
Trigger1=1
var(31)=750

[State 7600]
Type=VarSet
Trigger1=1
var(32)=root,var(9)

[State 7600]
Type=Varadd
Trigger1=1
var(33)=7*(NumHelper(14201)>0)

[State 7600]
Type=ChangeState
Trigger1=1
value=IFElse((root,StateNo=14251) || (root,StateNo=14252),7699,7616)

; 20055 - Cloud : Hiding Mists

[Statedef 7616]

[State 7600]
Type=VarSet
Trigger1=1
var(0)=7617

[State 7600]
Type=VarSet
Trigger1=1
var(30)=20055

[State 7600]
Type=VarSet
Trigger1=1
var(31)=1500

[State 7600]
Type=VarSet
Trigger1=1
var(32)=1500-root,var(41)

[State 7600]
Type=Varadd
Trigger1=1
var(33)=7*(root,StateNo=[14251,14252])

[State 7600]
Type=ChangeState
Trigger1=1
value=IFElse(root,var(41)>0,7699,7617)

; 20057 - Wood

[Statedef 7617]

[State 7600]
Type=VarSet
Trigger1=1
var(0)=7618

[State 7600]
Type=VarSet
Trigger1=1
var(30)=20057

[State 7600]
Type=VarSet
Trigger1=1
var(31)=2500

[State 7600]
Type=VarSet
Trigger1=NumHelper(14601)
var(32)=Helper(14601),time

[State 7600]
Type=VarSet
Trigger1=NumHelper(13301)>0
Trigger2=NumHelper(13311)>0
Trigger3=enemy,authorname="Seravy"
trigger3=NumHelper(13301)+NumHelper(13311)>0
var(32)=0

[State 7600]
Type=Varadd
Trigger1=1
var(33)=7*(root,var(41)>0)

[State 7600]
Type=ChangeState
Trigger1=1
value=IFElse(NumHelper(14601)>0,7699,7618)

; 20059 - Dash

[Statedef 7618]

[State 7600]
Type=VarSet
Trigger1=1
var(0)=7619

[State 7600]
Type=VarSet
Trigger1=1
var(30)=20059

[State 7600]
Type=VarSet
Trigger1=1
var(31)=1800-600*(root,var(18)>10000)

[State 7600]
Type=VarSet
Trigger1=1
var(32)=1800-(root,var(18) %10000)-600*(root,var(18)>10000)

[State 7600]
Type=Varadd
Trigger1=1
var(33)=7*(NumHelper(14601)>0)

[State 7600]
Type=ChangeState
Trigger1=1
value=IFElse(root,var(18)>0,7699,7619)

[Statedef 7619]

[State 7600]
Type=ChangeState
Trigger1=time>0
value=7600

; var(0) State NUmber to Return to
; var(30) = anim of the bar
; var(31) = max of value
; var(32) = value to display
; var(33) = Y position displacement

[Statedef 7699]

[State 7699]
Type=VarSet
Trigger1=var(32)>var(31)
var(32)=var(31)

[State 7699]
Type=VarSet
Trigger1=var(32)<0
var(32)=0

[State 7801]
Type=Explod
Trigger1=RoundState=2
anim=var(30)+(Teamside=2)
ID = 19999
Postype=left
pos= (TeamSide=1)*20+(TeamSide=2)*300,Helper(7800),var(55)+var(33)
bindtime=1
removetime=1
vel=0,0
sprpriority=990
ownpal=1
scale= 0.5,0.25
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999
Facing = 1-2*(Teamside=2)

[State 7801]
Type=Explod
Trigger1=RoundState=2
Trigger1=var(32)<ceil(0.25*var(31))
anim=19990-10*(Teamside=2)
ID = 19999
Postype=left
pos= (TeamSide=1)*20+(TeamSide=2)*300,Helper(7800),var(55)+var(33)
bindtime=1
removetime=1
vel=0,0
sprpriority=999
ownpal=1
scale= 1.385*(0.01+0.49*(var(31)-var(32))/var(31)),0.35
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7801]
Type=Explod
Trigger1=RoundState=2
Trigger1=var(32)>=ceil(0.25*var(31))
Trigger1=var(32)<ceil(0.5*var(31))
anim=19991-10*(Teamside=2)
ID = 19999
Postype=left
pos= (TeamSide=1)*20+(TeamSide=2)*300,Helper(7800),var(55)+var(33)
bindtime=1
removetime=1
vel=0,0
sprpriority=999
ownpal=1
scale= 1.385*(0.01+0.49*(var(31)-var(32))/var(31)),0.35
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7801]
Type=Explod
Trigger1=RoundState=2
Trigger1=var(32)>=ceil(0.5*var(31))
Trigger1=var(32)<ceil(0.75*var(31))
anim=19992-10*(Teamside=2)
ID = 19999
Postype=left
pos= (TeamSide=1)*20+(TeamSide=2)*300,Helper(7800),var(55)+var(33)
bindtime=1
removetime=1
vel=0,0
sprpriority=999
ownpal=1
scale= 1.385*(0.01+0.49*(var(31)-var(32))/var(31)),0.35
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7801]
Type=Explod
Trigger1=RoundState=2
Trigger1=var(32)>=ceil(0.75*var(31))
anim=19998-10*(Teamside=2)
ID = 19999
Postype=left
pos= (TeamSide=1)*20+(TeamSide=2)*300,Helper(7800),var(55)+var(33)
bindtime=1
removetime=1
vel=0,0
sprpriority=999
ownpal=1
scale= 1.385*(0.01+0.49*(var(31)-var(32))/var(31)),0.35
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999

[State 7699]
Type=ChangeState
Trigger1=1
value=var(0)

;
; Display Number
;
; var(13) = used by display procedure
; var(29) = number to display
; var(5) = Pos X
; var(6) = Pos Y
; var(7) = ExplodID
; var(8) = Removetime
; var(12) = Return State

[Statedef 799]

[State 999]
Type=Explod
Trigger1=1
anim=700+var(29)% 10
ID = var(7)
Postype=P1
pos= (var(5)-15*var(13))*(1-2*(Facing=-1)),var(6)
bindtime=var(8)
removetime=var(8)
vel=0,0
sprpriority=999
ownpal=1
scale= 0.4,0.4
Pausemovetime=9999
Supermovetime=9999
facing=1-2*(Facing=-1)

[State 999]
Type=Varset
trigger1= var(29)>0
v=29
Value= var(29)/10

[State 999]
Type=VarAdd
Trigger1=1
v=13
Value=1

[State 999]
Type=ChangeState
Trigger1=var(29)<=0
Value=var(12)

[State 999]
Type=ChangeState
Trigger1=1
Value=799

; Hitspark

[Statedef 6010]
Physics  = N
Anim     = 6006+IsHelper(6011)+IsHelper(6014)
SprPriority = 8

[State 6000]
Type = VarAdd
Trigger1 = Time > 20
var(0) = 25

[State 6000]
Type = VarSet
Trigger1 = Time = 0
fvar(0) = (.1+Random/9999.0)

[State 6000]
Type = AssertSpecial
Trigger1 = 1
Flag = Noshadow

[State 6000]
Type = AngleSet
Trigger1 = Time = 0
Value = -70+Random%140

[State 6000]
Type = AngleDraw
Trigger1 = 1
Scale = .1+Time*.035,.1+Time*fvar(0)

[State 6000]
Type = Trans
Trigger1 = !IsHelper(6014)
Trans = AddAlpha
Alpha = 256-var(0),256

[State 6000]
Type = Trans
Trigger1 = IsHelper(6014)
Trans = Sub
Alpha = 256-var(0),256

[State 6000]
Type = Explod
Trigger1 = Time = 0
Trigger1 = !IsHelper(6011)
Trigger1 = !IsHelper(6012)
Trigger1 = !IsHelper(6013)
Trigger1 = !IsHelper(6014)
Anim = 6008;+IsHelper(6011)
ID = 6007
Pos = 0,0
Scale = .5,.5
Facing = IfElse(Random<500,1,-1)
VFacing = IfElse(Random<500,1,-1)
Ownpal = 1
SprPriority = 5
SuperMove = 1
PauseMoveTime = -1

[State 6000]
Type = Explod
Trigger1 = Time = 0
Trigger1 = !IsHelper(6011)
Trigger1 = !IsHelper(6012)
Trigger1 = !IsHelper(6013)
Trigger1 = !IsHelper(6014)
Anim = 6015+100*IsHelper(6010)
ID = 6015
Pos = 0,0
Scale = .5,.5
Facing = IfElse(Random<500,1,-1)
VFacing = IfElse(Random<500,1,-1)
Ownpal = 1
SprPriority = 5
SuperMove = 1
PauseMoveTime = -1

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
Trigger1=IsHelper(6012)
add=var(0),var(1),var(2)
time=1

[State 4202]
Type=PalFX
Trigger1=IsHelper(6013)
add=-50,0,-100
time=1

[State 6010]
Type=Destroyself
Trigger1=time>30

[Statedef 6007]
Physics  = N
Anim     = 6003
MoveType=I
Physics=N
sprpriority=7

[State 2808]
Type=AngleAdd
Trigger1=1
value=5

[State 2808]
Type=Angledraw
Trigger1=1
scale=(time)*0.15,(time)*0.15

[State 2808]
Type=Trans
Trigger1=1
trans=add

[State 2808]
Type=Destroyself
Trigger1=animtime=0

[State 2808]
Type=AssertSpecial
Trigger1=1
flag=noshadow


; Hitspark
[Statedef 6005]
Physics  = N
Anim     = 6066
MoveType=I
Physics=N
sprpriority=7

[State 6005]
Type=BindToParent
Trigger1=IsHelper(1407)
Pos=0,0

[State 2808]
Type=AngleSet
Trigger1=time=0
value=random %360

[State 2808]
Type=AngleSet
Trigger1=IsHelper(1376)
value=75

[State 2808]
Type=Angledraw
Trigger1=1
scale=(20-time)*0.25,(20-time)*0.25

[State 2808]
Type=Trans
Trigger1=1
trans=add

[State 2808]
Type=Destroyself
Trigger1=time>=20

[State 2808]
Type=AssertSpecial
Trigger1=1
flag=noshadow

[Statedef 6026]
MoveType=I
Physics=N
anim=9999

[State -2]
Type = Helper
Trigger1 = Time %3=0
StateNo = 6010
ID = 6014
Postype=P1
Pos=0,0
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
SuperMoveTime = 100
PauseMoveTime = 100
Size.XScale = 0.1
Size.YScale = 0.1

[State 6026]
Type=DestroySelf
Trigger1=time>=7

; >GuardBreak Spark
[Statedef 6006]
Physics  = N
Anim     = 6120
MoveType=I
Physics=N
sprpriority=7

[State 2808]
Type=AngleAdd
Trigger1=1
value=5

[State 2808]
Type=Angledraw
Trigger1=1
scale=(time)*0.05,(time)*0.05

[State 2808]
Type=Trans
Trigger1=1
trans=add

[State 2808]
Type=Destroyself
Trigger1=time>=20

[State 2808]
Type=AssertSpecial
Trigger1=1
flag=noshadow


; Hitspark
[Statedef 6015]
Physics  = N
Anim     = 6015
MoveType=I
Physics=N
sprpriority=7

[State 2808]
Type=Trans
Trigger1=1
trans=add

[State 2808]
Type=Destroyself
Trigger1=Animtime=0

[State 2808]
Type=AssertSpecial
Trigger1=1
flag=noshadow

[Statedef 6027]
MoveType=I
Physics=N
anim=9999

[State -2]
Type = Helper
Trigger1 = Time %3=0
StateNo = 6010
ID = 6013
Postype=P1
Pos=0,0
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
SuperMoveTime = 100
PauseMoveTime = 100
Size.XScale = 0.1
Size.YScale = 0.1

[State 6026]
Type=DestroySelf
Trigger1=time>=7

; Frozen in ice state effect display
[Statedef 6868]
anim=6869
velset=0,0
movetype=I
sprpriority=3

[State 1038]
Type=VarSet
Trigger1=time=0
var(0)=target,ID

[State 1038]
Type=ChangeState
Trigger1=!(PlayerIDExist(var(0)))
value=6867

[State 1038]
Type=Turn
Trigger1=Facing!=PlayerID(var(0)),facing

[State 1037]
Type=PlaySnd
Trigger1=time=0
value=S0,550

[State 1038]
Type=PosSet
Trigger1=1
X=PlayerID(var(0)),pos X
Y=PlayerID(var(0)),pos Y

[State x]
Type=Targetstate
Trigger1=target,name="Cirno"
value=43816

[State 1038]
Type=ChangeState
;Trigger1=root,var(39)!=[13951,13952]
Trigger1=PlayerID(var(0)),stateno!=[13951,13952]
Trigger1=PlayerID(var(0)),stateno!=43816
Trigger2=var(0)=0
Trigger3=target,name="Cirno"
value=6867

[Statedef 6867]
anim=9999
movetype=I

[State 1037]
Type=PlaySnd
Trigger1=NumHelper(6867)=0
Trigger1=1
value=S0,551

[State 1037]
type = Helper
Trigger1=NumHelper(6867)=0
trigger1 = 1
name = "Ice"
ID = 6866
stateno = 6866
pos = 0,-50
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermovetime=9999
pausemovetime=9999

[State 1037]
type = Helper
Trigger1=NumHelper(6867)=0
trigger1 = 1
name = "Ice"
ID = 6866
stateno = 6866
pos = 0,-50
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermovetime=9999
pausemovetime=9999

[State 1037]
type = Helper
Trigger1=NumHelper(6867)=0
trigger1 = 1
name = "Ice"
ID = 6866
stateno = 6866
pos = 0,-50
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermovetime=9999
pausemovetime=9999

[State 1037]
type = Helper
Trigger1=NumHelper(6867)=0
trigger1 = 1
name = "Ice"
ID = 6866
stateno = 6866
pos = 0,-50
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermovetime=9999
pausemovetime=9999

[State 1037]
type = Helper
Trigger1=NumHelper(6867)=0
trigger1 = 1
name = "Ice"
ID = 6866
stateno = 6866
pos = 0,-50
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermovetime=9999
pausemovetime=9999

[State 1037]
type = Helper
Trigger1=NumHelper(6867)=0
trigger1 = 1
name = "Ice"
ID = 6866
stateno = 6866
pos = 0,-50
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermovetime=9999
pausemovetime=9999

[State 1037]
type = Helper
Trigger1=NumHelper(6867)=0
trigger1 = 1
name = "Ice"
ID = 6866
stateno = 6866
pos = 0,-50
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermovetime=9999
pausemovetime=9999

[State 1038]
Type=Helper
Trigger1=time=0
Trigger1=NumHelper(6867)=0
ID=6867
StateNo=6865

[State 1037]
Type=DestroySelf
Trigger1=1

[Statedef 6866]
anim=6867+random %2
MoveType=I
Physics=N
velset=(3+random %3)*(1-2*(random %2)),(3+random %3)*(1-2*(random %2))

[State 1002]
Type=Assertspecial
Trigger1=1
flag=noshadow

[State 1036]
Type=VarSet
Trigger1=time=0
var(0)=random %36+10

[State 1036]
Type=AngleAdd
Trigger1=1
value=var(0)

[State 1036]
Type=AngleDraw
Trigger1=1

[State 1036]
Type=DestroySelf
Trigger1=time>=25


[Statedef 6865]
anim=9999
movetype=I

[State 6865]
Type=Destroyself
Trigger1=root,var(39)!=[13951,13952]
Trigger1=time>0

[Statedef 6055]
Physics  = N
Anim     = 21110
SprPriority = 3

[State 6055]
Type = Helper
Trigger1 = (IsHelper(6055)) && (Time = 0)
StateNo = 6055
ID = 6056
Name = "Effect"

[State 6055]
Type = Helper
Trigger1 = (IsHelper(6055)) && (Time = 0)
StateNo = 6055
ID = 6056
Name = "Effect"

[State 6055]
Type = Helper
Trigger1 = (IsHelper(6055)) && (Time = 0)
StateNo = 6055
ID = 6056
Name = "Effect"

[State 6055]
Type = Helper
Trigger1 = (IsHelper(6055)) && (Time = 0)
StateNo = 6055
ID = 6056
Name = "Effect"

; Flame Hitspark

[State 6055]
Type = Helper
Trigger1 = (IsHelper(6055)) && (Time = 0)
StateNo = 6055
ID = 6056
Name = "Effect"

[State 6055]
Type = VarAdd
Trigger1 = Time > 20
var(0) = 12

[State 6055]
Type = VarSet
Trigger1 = Time = 0
fvar(0) = 1+Random/499.5

[State 6055]
Type = VarSet
Trigger1 = Time = 0
fvar(1) = Random/499.5*Pi

[State 6055]
Type = VelSet
Trigger1 = Time = 0
X = fvar(0)*Cos(fvar(1))
Y = -fvar(0)*Sin(fvar(1))

[State 6055]
Type = AssertSpecial
Trigger1 = 1
Flag = Noshadow

[State 6055]
Type = Trans
Trigger1 = 1
Trans = Add

[State 6055]
Type = PalFX
Trigger1 = IsHelper(6055)
Mul = 256-var(0),256-var(0),256-var(0)
Time = 1

[State 6055]
Type = AngleSet
Trigger1 = (Vel X != 0)
Value = ATan(Vel Y/Vel X)*(-180.0/Pi)+((Vel X<0)*180)

[State 6055]
Type = AngleSet
Trigger1 = (Vel X = 0)
Value = IfElse(Vel Y<0,90,-90)

[State 6055]
Type = AngleDraw
Trigger1 = 1
Scale = 1-Time*.02,.5-Time*.01

[State 6055]
Type = DestroySelf
Trigger1 = var(0) > 249


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
hitsound = S6110,0
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
value=6+3*(name="Eriol Hiiragizawa")+3*(name="Void")

[State 162]
Type = PlaySnd
Trigger1 = root,NumProjId(162)=0
Trigger1 = time>0
value=S6110,0

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
GuardSound        = -1,0
Guard.Dist = 0
ID=162

[State 162]
Type=ChangeState
Trigger1=time>=20
value=162

[State 162]
Type=Destroyself
Trigger1=parent,stateno!=[100,119]
Trigger1=!(name="Sakura Kinomoto") || (StateNo!=530)
Trigger2=NumHelper(4041)>0

; Graze End
[Statedef 99]
facep2=1
Type=U
MoveType=I
Physics=U
anim=47
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

; Dizzy state
[Statedef 899]
Type=S
MoveType=H
Physics=S
velset=-11,0
facep2=1

[State 1002]
Type=ChangeAnim
Trigger1=Authorname="Seravy" || Authorname="GU"
Trigger1=anim!=5800
value=5800

[State 1002]
Type=ChangeAnim
Trigger1=Authorname="Kurogane"
Trigger1=anim!=5300
value=5300

[State 1002]
Type=SelfState
Trigger1=time>=40
value=0
ctrl=1

;
; Card Use State Setup
;
[Statedef 380]
Type= S
Physics =S
MoveType= I
velset=0,0
ctrl=0
anim=380
poweradd=50
facep2=1

[State 380,2]
Type=VarSet
Trigger1=time=0
var(2)=var(1)

[State 380,2]
Type=VarSet
Trigger1=time=0
var(1)=-1

[State 380,4]
Type=ChangeState
Trigger1= 1
value=386

;
; Card Use State Discard Check
;
[Statedef 386]
Type= S
Physics =S
MoveType= I
velset=0,0
ctrl=0

[State 386]
Type=ChangeState
Triggerall=time=0
Trigger1=var(2)=53
Trigger1=Helper(7800),var(var(2)) %100=1
Trigger1=NumHelper(14601)>0
Trigger2=var(2)=20
Trigger2=Helper(7800),var(var(2)) %100=1
Trigger2=NumHelper(12951)>0
Trigger3=var(2)=23
Trigger3=Helper(7800),var(var(2)) %100=1
Trigger3=NumHelper(4041)>0
Trigger4=var(2)=23
Trigger4=Helper(7800),var(var(2)) %100=2
Trigger4=NumHelper(13111)>0
Trigger5=var(2)=27
Trigger5=Helper(7800),var(var(2)) %100=1
Trigger5=NumHelper(13301)>0
Trigger6=var(2)=24
Trigger6=Helper(7800),var(var(2)) %100=1
Trigger6=NumHelper(13151)>0
Trigger7=var(2)=11
Trigger7=Helper(7800),var(var(2)) %100=1
Trigger7=NumHelper(12501)>0
Trigger8=var(2)=33
Trigger8=Helper(7800),var(var(2)) %100=1
Trigger8=var(12)=1
Trigger9=var(2)=38
Trigger9=Helper(7800),var(var(2)) %100=1
Trigger9=var(13)>0
Trigger10=var(2)=38
Trigger10=Helper(7800),var(var(2)) %100=4
Trigger10=NumHelper(13881)>0
Trigger11=var(2)=41
Trigger11=Helper(7800),var(var(2)) %100=1
Trigger11=var(17)=1
Trigger12=var(2)=47
Trigger12=var(18)>0
Trigger13=var(2)=14
Trigger13=Helper(7800),var(var(2)) %100=1
Trigger13=var(19)=1
Trigger14=var(2)=37
Trigger14=Helper(7800),var(var(2)) %100=1
Trigger14=var(17)=2
Trigger15=var(2)=42
Trigger15=Helper(7800),var(var(2)) %100=1
Trigger16=var(2)=31
Trigger16=Helper(7800),var(var(2)) %100=2
Trigger16=NumHelper(13511)>0
Trigger17=var(2)=6
Trigger17=Helper(7800),var(var(2)) %100=3
Trigger17=NumHelper(12271)>0
Trigger18=var(2)=36
Trigger18=Helper(7800),var(var(2)) %100=1
Trigger19=var(2)=25
Trigger19=Helper(7800),var(var(2)) %100=1
Trigger19=NumHelper(13201)>0
Trigger20=var(2)=19
Trigger20=Helper(7800),var(var(2)) %100=1
Trigger20=NumHelper(12901)>0
Trigger21=var(2)=22
Trigger21=Helper(7800),var(var(2)) %100=1
Trigger21=NumHelper(13051)>0
Trigger22=var(2)=28
Trigger22=Helper(7800),var(var(2)) %100=1
Trigger22=var(25)>0
Trigger23=var(2)=31
Trigger23=Helper(7800),var(var(2)) %100=1
Trigger23=NumHelper(4141)>0
Trigger24=var(2)=50
Trigger24=Helper(7800),var(var(2)) %100=1
Trigger25=var(2)=38
Trigger25=Helper(7800),var(var(2)) %100=3
Trigger25=Numhelper(13871)>0
Trigger26=var(2)=27
Trigger26=Helper(7800),var(var(2)) %100=2
Trigger26=NumHelper(13311)>0
Trigger27=var(2)=25
Trigger27=Helper(7800),var(var(2)) %100=2
Trigger27=NumHelper(13211)>0
Trigger28=var(2)=6
Trigger28=Helper(7800),var(var(2)) %100=4
Trigger28=NumHelper(12281)>0
Trigger29=var(2)=51
Trigger29=Helper(7800),var(var(2)) %100=2
Trigger29=NumHelper(14511)>0
Trigger30=var(2)=30
Trigger30=Helper(7800),var(var(2)) %100=1
Trigger30=NumHelper(13451)>0
Trigger31=var(2)=18
Trigger31=Helper(7800),var(var(2)) %100=3
Trigger31=NumHelper(12871)>0
Trigger32=var(2)=21
Trigger32=Helper(7800),var(var(2)) %100=1
Trigger32=NumHelper(13001)>0
Trigger33=var(2)=42
Trigger33=Helper(7800),var(var(2)) %100=2
Trigger33=NumHelper(14061)>0
Trigger34=var(2)=42
Trigger34=Helper(7800),var(var(2)) %100=3
Trigger34=NumHelper(14071)>0
Trigger35=var(2)=19
Trigger35=Helper(7800),var(var(2)) %100=2
Trigger35=NumHelper(12911)>0
ctrl=1
Value=0
ignorehitpause=1

[State 3009, pause]
type = SuperPause
trigger1 = time =0
darken = 0
time = 40
anim = -1
movetime = 40
p2defmul = 1

[State 240]
Type = Helper
Triggerall = !Ishelper
Trigger1 = Time=0
StateNo = 3999
ID = 3999
Name = "ClowCircle"
Pos = 0,0
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Size.xscale=0.7
Size.yscale=0.7
PauseMoveTime=9999999
Supermovetime=9999999

[State 3009]
Type=BgPalFx
Trigger1=time<40
mul=0,0,0
time=1

[State 380,4]
Type=ChangeState
Trigger1= time>=40
value=381

;
; Card Use Distributor state
;
[Statedef 381]
Type= S
Physics =S
MoveType= I
velset=0,0
ctrl=0

[State 381]
Type=VarSet
Trigger1=time=0
var(29)=Helper(7800),var(54);

[State 381]
Type=VarSet
Trigger1=time=0
var(30)=Helper(7800),var(var(2));

[State 381,1]
Type=Helper
Trigger1=time=0
Trigger1=Helper(7800),var(54)!=0
ID = 7100
stateno= 388
Postype=left
pos= (TeamSide=2)*140,20
sprpriority=-99
ownpal=1
scale= 1,1
Ignorehitpause=1
;pausemovetime=99999
;supermovetime=99999

[State 381,3]
Type=PLaySnd
Trigger1=1
Value=7000,var(2)

[State 381]
Type=changeState
Trigger1=var(2)=7
Trigger1=enemy,name="Void"
value=12309

[State 381,2]
Type= ChangeState
Trigger1=1
Value=12000+var(2)*50+(Helper(7800),var(var(2)) %100)*10-60   ; Replace with actual card effect
ctrl=1

[Statedef 390]
Type= S
Physics =S
MoveType= I
velset=0,0
ctrl=0
anim=390
facep2=1

[State 3909]
Type=VarSet
Trigger1=time=0
v=9
value=Helper(7800),var(56)-2*(name="Eriol Hiiragizawa")

[State x]
Type=Changestate
triggerall = inguarddist
triggerall =time >10
Trigger1= !var(59)
Trigger1= command="holdback"
trigger2= var(59)
trigger2= random<var(55)*2
value=120
ctrl=1

[State 390,1]
Type=ChangeState
Trigger1= fvar(22)!=1
Trigger1= Command != "holdy"
Trigger1= var(59)=0
Trigger2= power=powermax
Trigger3= RoundState>2
Trigger4= var(59)>0
Trigger4= Numhelper(14050)>0
Trigger4= Life<100
Trigger4= (var(1)=5) || (var(1)=16)
Trigger4= !Ishelper
Trigger4= power>=3000
Trigger5= Numhelper(13211)>0
Trigger5= Helper(13211),Stateno=13212
Trigger6=NumHelper(13651)>0                ; Safety Wall in effect
Trigger6=abs(Pos X-Helper(13651),Pos X)<25
Trigger6=Pos Y>-100
Trigger7=Helper(7800),var(56)=0
Trigger8= fvar(22)=1
Trigger8= Command != "holdc"
Trigger8= var(59)=0
Value=0
ctrl=1

[State 350, snd]
type = PlaySnd
trigger1 = time % 30=0
value = 390,0

[State 705, 2]
type = Explod
trigger1 = ((Time + 12) % 12) = 0
anim = f130
ID = 311
sprpriority = 3
postype = p1
pos = 0,0
bindtime = -1
removeongethit = 1

[State 390,2]
Type=PowerAdd
Trigger1=time % var(9)=var(9)-1
Value=90

[State 390]
Type=Varset
Trigger1=1
var(29)=random %70-35

[State 390]
Type=Varset
Trigger1=1
var(30)=random %70-35

[State 390]
Type=Varset
Trigger1=1
var(31)=(name="Sakura Kinomoto")*25+(name="Shaoran Lee")*12+(name="Eriol Hiiragizawa")*28+(Name="Yue")*4-(Name="Void")*20-2*Selfanimexist(9745)

[State 390]
Type=Varset
Trigger1=1
var(32)=-((name="Sakura Kinomoto")*67+(name="Shaoran Lee")*145+(name="Eriol Hiiragizawa")*170+(name="Yue")*99+(Name="Void")*43+14*Selfanimexist(9745))

[State -2]				; Cloud effect
Type=Explod
Trigger1=time % var(9)=0
ID=390
anim=20010
bindtime=1
removetime=20
vel= -var(29)*0.05,-var(30)*0.05
postype=p1
pos= var(29)+var(31), var(30)+var(32)
scale=0.06,0.06
sprpriority=2
ownpal=1
ignorehitpause=1
Pausemovetime=999999
Supermovetime=999999

[State 390,2]
Type=VarAdd
Trigger1=var(9)>5
Trigger1=time % 30=0
v=9
value=-1

[Statedef 395]
Type= S
Physics =N
MoveType= I
velset=((var(59)=0)*6*((command="holdfwd")-!(command = "holdfwd"))+(var(59)>0)*IfElse(random<500,-6,6))*(1-0.4*Name="Shaoran Lee"),0
sprpriority=-2
ctrl=0
anim=395

[State 395]
Type=ChangeState
Trigger1=var(19)=1
value=396

[State -2]
type = AfterImage
trigger1 = !Time
time = 20
FrameGap = 1
length = 8
PalContrast = 0,40,200
PalBright = 0,40,200
TimeGap = 2
PalColor = 0
Trans = add
persistent = 0
ignorehitpause=1

[State 395, push]
type = PlayerPush
trigger1 = 1
value = 0

[State 395, snd]
type = PlaySnd
trigger1 = time=0
value = 395,0

[State 395, hit]
type = NotHitBy
trigger1 = 1
value2 = ,NA, SA, NP

[State 395]
Type=ChangeState
Trigger1=time>20+12*(Name="Shaoran Lee")
Value=397
ctrl=1

[Statedef 397]
Type= S
Physics =N
MoveType= I
velset=0,0
anim=0
ctrl=1

[State 397]
Type=Assertspecial
Trigger1=1
flag=nowalk

[State 397]
Type=ChangeState
Trigger1=time>=4
Value=0

[Statedef 396]
Type= A
Physics =N
MoveType= I
velset=0,0
ctrl=0
anim=395

[State 396]
Type=NotHitBy
Trigger1=time>1
Trigger1=time<39
Trigger2=PrevStateNo=[120,160]
Trigger3=PrevStateNo=[5000,5099]
Value=SAC

[State 396]
Type=Trans
Trigger1=1
trans=AddAlpha
alpha=(256-12*time)*(time<=20)+(16+(time-20)*12)*(time>20),256-((256-12*time)*(time<=20)+(16+(time-20)*12)*(time>20))

[State 396]
Type=PlaySnd
Trigger1=time=1
Value=S396,0

[State 396]
Type=PosAdd
Trigger1=time=20
Trigger1=var(59)=0
X=(command="holdfwd"*999+command="holdback"*-999)

[State 396]
Type=PosSet
Trigger1=time=20
Trigger1=var(59)=0
Y=(random %2=1)*-(random % 130)

[State 396]
Type=PosSet
Trigger1=time=20
Trigger1=(var(59)>0)
X=IfElse(Pos X>0,-300,300)
Y=(random %2=1)*-(random % 130)

[State 396]
Type=ChangeAnim
Trigger1=time=20
value=47

[State 396]
Type=Turn
Trigger1=time=40
Trigger1=P2Dist X<0

[State 396]
Type=ChangeState
Trigger1=time>40
Value=50
ctrl=1



[Statedef 3999]
type = U
movetype = I
physics = N
anim = 3999
poweradd = 0
velset = 0,0
ctrl = 0
sprpriority=-99

[State 3999]
Type=Playsnd
Triggerall=time=0
Trigger1=root,var(2)=1 ; Firey
Trigger2=root,var(2)=2 ; Windy
Trigger3=root,var(2)=3 ; Watery
Trigger4=root,var(2)=4 ; Earthy
value=386,5
volumescale=200

[State 3999]
Type=Playsnd
Triggerall=time=0
Trigger1=root,var(2)=5 ; Light
Trigger2=root,var(2)=7 ; Hope
Trigger3=root,var(2)=48 ; Create
value=386,4
volumescale=200

[State 3999]
Type=Playsnd
Triggerall=time=0
Trigger1=root,var(2)=6 ; Dark
Trigger2=root,var(2)=32 ; Maze
Trigger3=root,var(2)=45 ; Erase
value=386,3
volumescale=200

[State 3999]
Type=Playsnd
Triggerall=time=0
Trigger1=root,var(2)=8 ; Arrow
Trigger2=root,var(2)=9 ; Wave
Trigger3=root,var(2)=13 ; Thunder
Trigger4=root,var(2)=15 ; Sword
Trigger5=root,var(2)=17 ; Storm
Trigger6=root,var(2)=22 ; Shot
Trigger7=root,var(2)=24 ; Shadow
Trigger8=root,var(2)=28 ; Power
Trigger9=root,var(2)=29 ; Move
Trigger10=root,var(2)=40 ; Freeze
value=386,1
volumescale=200

[State 3999]
Type=Playsnd
Triggerall=time=0
Trigger1=root,var(2)=10 ; Voice
Trigger2=root,var(2)=11 ; Twin
Trigger3=root,var(2)=12 ; Time
Trigger4=root,var(2)=14 ; Through
Trigger5=root,var(2)=16 ; Sweet
Trigger6=root,var(2)=18 ; Song
Trigger7=root,var(2)=19 ; Snow
Trigger8=root,var(2)=20 ; Sleep
Trigger9=root,var(2)=21 ; Silence
Trigger10=root,var(2)=23 ; Shield
Trigger11=root,var(2)=25 ; Sand
Trigger12=root,var(2)=26 ; Return
Trigger13=root,var(2)=27 ; Rain
Trigger14=root,var(2)=30 ; Mist
Trigger15=root,var(2)=31 ; Mirror
Trigger16=root,var(2)=33 ; Loop
Trigger17=root,var(2)=34 ; Lock
Trigger18=root,var(2)=35 ; Little
Trigger19=root,var(2)=36 ; Libra
Trigger20=root,var(2)=37 ; Jump
Trigger21=root,var(2)=38 ; Illusion
Trigger22=root,var(2)=39 ; Glow
Trigger23=root,var(2)=41 ; Fly
Trigger24=root,var(2)=42 ; Flower
Trigger25=root,var(2)=43 ; Float
Trigger26=root,var(2)=44 ; Fight
Trigger27=root,var(2)=46 ; Dream
Trigger28=root,var(2)=47 ; Dash
Trigger29=root,var(2)=49 ; Cloud
Trigger30=root,var(2)=50 ; Change
Trigger31=root,var(2)=51 ; Bubble
Trigger32=root,var(2)=52 ; Big
Trigger33=root,var(2)=53 ; Wood
value=386,2
volumescale=200

[State 3999]
Type=Explod
Trigger1=time=0
anim=7700+root,var(2)
scale=.5,.5
bindtime=-1
removetime=40
postype=left
pos=90,0
ID=3999
supermovetime=40
sprpriority=-999

[State 12050]
Type=ModifyExplod
Trigger1=1
ID=3999
Trans=addalpha
alpha=256-abs(time-20)*10,256

[State 12500]
Type = Poweradd
Trigger1 = time=0
value = -(100*(Helper(7800),var(root,var(2))/100))

[State 12050]
Type=BindToRoot
Trigger1=time=0
pos=0,root,const(size.mid.pos.y)

[State 12050]
Type=AngleAdd
Trigger1=1
value=3

[State 12050]
Type=AngleDraw
Trigger1=1
scale=time*0.02,time*0.02

[State 12050]
Type=Trans
Trigger1=1
Trans=addalpha
alpha=256-(time>=15)*(time-15)*10,256

[State 12050]
Type=Assertspecial
Trigger1=1
flag=noshadow

[State 12050]
Type=Destroyself
Trigger1=time>=40

[Statedef 43816]
type    = U
movetype= H
physics = N
;velset = 0,0

[State 43816]
Type=ChangeState
Triggerall=enemy,var(39)!=43816
Triggerall=enemy,var(39)>10000
Trigger1=enemy,name="Yue"
Trigger2=enemy,name="Void"
Trigger3=enemy,name="Sakura Kinomoto"
Trigger4=enemy,name="Eriol Hiiragizawa"
Trigger5=enemy,name="Shaoran Lee"
value=enemy,var(39)
ignorehitpause=1

[State 43816]
Type=ChangeState
Triggerall=Numenemy>1
Triggerall=enemy(1),var(39)!=43816
Triggerall=enemy(1),var(39)>10000
Trigger1=enemy(1),name="Yue"
Trigger2=enemy(1),name="Void"
Trigger3=enemy(1),name="Sakura Kinomoto"
Trigger4=enemy(1),name="Eriol Hiiragizawa"
Trigger5=enemy(1),name="Shaoran Lee"
value=enemy(1),var(39)
ignorehitpause=1

[State 43816, 1]
type = SelfState
Trigger1= StateType=S
value = 5000
ignorehitpause=1

[State 43816, 1]
type = SelfState
Trigger1= (StateType=L) || (PrevStateNo=12952)
value = 5080
ignorehitpause=1

[State 43816, 1]
type = SelfState
Trigger1= StateType=C
value = 5010
ignorehitpause=1

[State 43816, 1]
type = SelfState
Trigger1= StateType=A
value = 5020
ignorehitpause=1

[State 43816]
Type=HitBy
Trigger1=1
Value=SAC,AA,AP,AT

[State 43816]
Type=HitBy
Trigger1=1
Value2=SAC,AA,AP,AT




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


; Air Run FWD
[Statedef 110]
type = A
MoveType= I
ctrl = 0
physics = N
anim = 14000
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
var(49) = 1

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

[State 110]
type = PlaySnd
trigger1 = time = 0
value = s0,3

[State 115]
type = velset
trigger1 = time = 0
x = const(velocity.run.fwd.x)

[State 100, 3]
type = ChangeState
triggerall = time>=10
trigger1 = Command !="holdfwd"
trigger1 = var(59)=0
trigger2 = abs(P2Dist X)<60
trigger2 = var(59)>0
Trigger2 = helper(991),var(8)=0
Trigger2 = helper(991),var(9)=0
trigger3 = roundstate>2
trigger4 = time>=75
value = 99

; Air Run Back
[Statedef 115]
type = A
MoveType= I
ctrl = 0
physics = N
anim = 14001
velset = 0,0

[State 650, 1]
type = VarAdd
trigger1 = Time = 0
var(49) = 1

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

[State 110]
type = PlaySnd
trigger1 = time = 0
value = s0,3

[State 115]
type = velset
trigger1 = time = 0
x = const(velocity.run.back.x)

[State 115]
type = ChangeState
triggerall = time>=10
trigger1 = command!="holdback"
trigger1 = var(59)=0
trigger2 = BackEdgeDist<30
trigger2 = !Inguarddist
trigger2 = var(59)>0
trigger3 = roundstate>2
trigger4 = time>=75
Trigger5 = var(59)>0
Trigger5 = P2dist X<0
value = 99
