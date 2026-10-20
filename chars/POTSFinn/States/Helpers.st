; _________________________________________
;| Character by JStudios2k/John Anonymous, Edited from Doug1105                |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================< HELPER STATES >========================================
;==============================================================================================

;Palette Selector (Saikou Shiva, 2023)
[Statedef 9256]
physics = N
anim = 9256
velset=0,0
sprpriority=99999
 
[State 256, PosSet]
type = PosSet
trigger1 =!time 
x = root,facing*-70
y = 20
ignorehitpause = 1

[State 256, AS]
type=assertspecial
trigger1=1
flag=intro
flag2=noshadow
[State 256, Reset]
type=varset
trigger1=!time
var(29)=200
[State 256, Pal]
type=varset
trigger1=!time
fvar(0)=root,palno
[State 256, Pal]
type=varset
trigger1=!time
fvar(27)=root,fvar(27)

[State 256, Varset]
type=varset
trigger1=fvar(0)<1||fvar(0)>fvar(27)
fvar(0)=1+(fvar(0)<1)*((fvar(27))-1)

[State 256, PlaySnd]
type = PlaySnd
trigger1 =var(10)=2 
value = S256,0
volumescale = 75
channel = 20
[State 256, PlaySnd]
type = PlaySnd
triggerall=ishelper(256)
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="s"||roundstate=2
trigger2=var(29)<=5
value = S256,1
volumescale = 75
channel = 20
persistent =0 

[State 256, Timer]
type = VarAdd
trigger1 =1 
var(29)=-1
[State 256, Timer]
type = VarAdd
trigger1=!var(10)&&var(29)<150
trigger1=root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd"
var(29)=25

[State 256, Varadd]
type=varadd
trigger1=!var(10)
trigger1=root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd"
fvar(0)=1-(root,command="holddown"||root,command="holdback"&&facing=1||root,command="holdfwd"&&facing=-1)*2

[State 256, Varadd]
type=varadd
trigger1=(root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd")&&!var(10)||var(10)
var(10)=1

[State 256, Varset]
type=varset
trigger1=!time||var(10)>=17
var(10)=0

[State 256, End]
type=changestate
triggerall=ishelper(256)
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="s"||roundstate=2
trigger2=var(29)<=0
trigger3=root, var(56) = 3
trigger4=root,AILevel
value = 9257

[State 256, End]
type=destroyself
triggerall=ishelper(256) && root, var(56) = 1
trigger1=root, var(56) < 3
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="s"||roundstate=2
trigger2=root, var(56) < 3
trigger2=var(29)<=0
trigger3=root,AILevel


;Mode Select (Saikou Shiva, 2023)
[Statedef 9257]
physics = N
anim = 9257+root,var(54)
velset=0,0
sprpriority=99999

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 0.87,0.87
ignorehitpause = 1
;persistent = 
 
[State 257, PosSet]
type = PosSet
trigger1 =!time 
x = root,facing*-70
y = -18
ignorehitpause = 1

[State 257, AS]
type=assertspecial
trigger1=1
flag=intro
flag2=noshadow
[State 257, Reset]
type=varset
trigger1=!time
var(29)=150
[State 257, Locking System]
type=varset
trigger1=!time
var(11)=parent,var(55)
[State 257, Reset]
type=parentvarset
trigger1=1
var(54)=(anim-9257)

[State 257, Varset]
type=varset
trigger1 =var(10)=1
var(10)= Ifelse(var(11)=0,1,0)
[State 257, ChangeAnim]
type = ChangeAnim
trigger1 =var(10)=1
value = Ifelse(anim=9257,9258,Ifelse(anim=9258,9259,9257))

[State 257, PlaySnd]
type = PlaySnd
trigger1 =var(10)=2 
value = S257,0
volumescale = 50
channel = 25
[State 257, PlaySnd]
type = PlaySnd
triggerall = time >= 8
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="s"||roundstate=2
trigger2=var(29)<=5
value = S257,1
volumescale = 50
channel = 20
persistent =0 

[State 257, Timer]
type = VarAdd
trigger1 =1 
var(29)=-1
[State 257, Timer]
type = VarAdd
trigger1=!var(10)&&var(29)<100
trigger1=root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd"
var(29)=20

[State 257, Varadd]
type=varadd
trigger1=(root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd")&&!var(10)||var(10)
var(10)=1

[State 257, Varset]
type=varset
trigger1=!time||var(10)>=17
var(10)=0

[State 257, End]
type=destroyself
trigger1=root,AILevel
[State 257, Change]
type=destroyself
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||(var(29)<=140&&root,command="s")||roundstate=2
trigger2=var(29)<=0
trigger3 = root, var(56) =1

;========================<PROJECTILES>=============================
;Slap my hand
[Statedef 1004]
type=A
physics=N
movetype=I
anim=1001
ctrl=0
velset=0,0

[State 1250, HitOverride]
type=hitoverride
trigger1= 1
attr=SCA,AA,AP,AT
time=-1
stateno=1005
ignorehitpause=1

[State 1250, NHB]
type=nothitby
trigger1= 1
time=-1
value=SCA
ignorehitpause=1

[State 1250, HB]
type=hitby
trigger1= 1
value=SCA,NP,SP,HP
time=-1
ignorehitpause=1

[State 1250, Bind]
type=bindtoroot
trigger1= 1
facing=1
pos = 70,0

[State 1250, End]
type=destroyself
trigger1= root,movetype=H
trigger2= root,stateno!=1000 && root,stateno!=1050
trigger3= root,stateno=1000 && root,animelemtime(7)>=0
trigger3= root,stateno=1050 && root,animelemtime(7)>=0

;Slap hadouken
[Statedef 1005]
type = S
physics = N
movetype = A
anim = 1005
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 200,Posset]
type=posset
trigger1=!time
y=-60

[State Resize]
type = AngleDraw
trigger1 = 1
scale = 0.5,0.5
ignorehitpause = 1

[State BLAM]
type = Explod
trigger1 = !time
anim = 229
ID = 229
pos = 0, 0
postype = p1
removetime = -2
supermovetime = 65535
pausemovetime = 65535
scale = 1,1
sprpriority = 12
ontop = 1
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S1,12
ignorehitpause = 1
[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S760,0
channel = -1
ignorehitpause = 1

[State 1005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1006
ignorehitpause = 1
[State 1005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1005, temp - MAXMODE on?]
type = varset
trigger1 = !time
var(53) = root, var(53)
[State 1005, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)
[State 1005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1005, Vel]
type = velset
trigger1 = 1
x = 6.7
y = 0

[State 1005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
persistent = 0
ignorehitpause = 1

[State 1005, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, SP
damage = ceil(77 * (ifelse(var(53),1.3,1)) * root,fvar(11)), 7
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1 
guard.sparkno = -1 
sparkxy = -10, 0
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -4
fall = var(53)
air.fall = 1
fall.recover = 1
fall.recovertime = 30
getpower = ifelse(p2movetype = H, 72, 144) * !(root, var(20)), 36 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

[State 1005, Miss]
type = hitdef
trigger1 = numenemy
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, SP
hitflag = 

[State 1005, End]
type = changestate
trigger1 = movecontact
value = 1006
ignorehitpause = 1
[State 1005, End]
type = destroyself
trigger1 = pos x != [ -200, 200]

;hol up
[StateDef 1006]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State Resize]
type = AngleDraw
trigger1 = 1
scale = 0.5,0.5
ignorehitpause = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1006, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = 1000
var(18) = 1

[State 1006, End]
type = ChangeState
trigger1 = Time >= 0
value = 1007

;adios
[StateDef 1007]
type = A
physics = N
moveType = A
anim = 1006
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1007, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 3
volume = -128
lowPriority = 1

[State 1007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1007, End]
type = ChangeState
trigger1 = !AnimTime
value = 1008

;hmmm
[StateDef 1008]
type = A
physics = N
moveType = A
anim = 1
ctrl = 0
velSet = 0,0

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;SHOPPING CART
[Statedef 1310]
physics = N
anim = 1310
velset=0,0
sprpriority=99999

[State 0, BindToParent]
type = BindToParent
trigger1 = 1
time = 1
pos = 0,-70
ignorehitpause = 1

[State 257, AS]
type=assertspecial
trigger1=1
flag=noshadow
[State 257, Reset]
type=varset
trigger1=!time
var(29)=150

[State 257, Varset]
type=varset
trigger1 =var(10)=1
var(10)= Ifelse(var(11)=0,1,0)
[State 257, ChangeAnim]
type = ChangeAnim
trigger1 =var(10)=1
value = Ifelse(anim=1310||anim=1313,1311,Ifelse(anim=1311||anim=1314,1312,1310))
[State 257, Sold Out]
type = ChangeAnim
trigger1 = (anim=1310&&root,fvar(1)=3) || (anim=1311&&root,fvar(2)=3) || (anim=1312&&root,fvar(3)=1)
trigger1 = anim != [1313,1315]
value = anim + 3

[State 257, PlaySnd]
type = PlaySnd
trigger1 =!time
value = S1,23
volumescale = 50
channel = 25
[State 257, PlaySnd]
type = PlaySnd
trigger1 =var(10)=2 
value = S256,0
volumescale = 50
channel = 25
[State 257, PlaySnd]
type = PlaySnd
triggerall = time >= 8
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="s"
;trigger2=var(29)<=5
value = S1,24
volumescale = 50
channel = 20
persistent =0 

[State 257, Timer]
type = VarAdd
trigger1 =1 
var(29)=-1
[State 257, Timer]
type = VarAdd
trigger1=!var(10)&&var(29)<100
trigger1=root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd"
trigger2=AILevel && random<400
var(29)=20

[State 257, Varadd]
type=varadd
trigger1=(root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd")&&!var(10)||var(10)
trigger2=AILevel && random<400 &&!var(10)||var(10)
var(10)=1

[State 257, Varset]
type=varset
trigger1=!time||var(10)>=17
var(10)=0

[State 6500, DEBUG]
trigger1 = 1
type = DisplayToClipboard
ignorehitpause = 1
text = "GP = %d ITEM = %d SPD = %d DEF = %d BMO = %d"
params = root,var(27), anim, root,fvar(1), root,fvar(2), root,fvar(3)

[State 257, OUCH!]
type=destroyself
trigger1=(root,StateNo!=1300 && root,StateNo=!1302) || root,MoveType=H
trigger2=var(29)<=0 ; TOO SLOW
trigger3=root,command="SHOP" && time > 10
[State 257, NOT ENOUGH CASH, STRANGER]
type=ChangeState
triggerall = time > 10
triggerall = (anim = [1313, 1315]) || (root,var(27) < ifelse(anim=1310, 100000, ifelse(anim=1311, 200000, 300000)))
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||(var(29)<=140&&root,command="s")
value = 1315
[State 257, KEHEHEHAH THANK YOU]
type=ChangeState
triggerall = time > 10
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||(var(29)<=140&&root,command="s")
value = 1311

;Your purchase is being processed...
[StateDef 1311]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, Speed Up!]
type = ParentVarSet
trigger1 = !Time && Anim = 1310
trigger1 = Root,fvar(1) < 3
var(10) = 1
[State 1006, Defense Up!]
type = ParentVarSet
trigger1 = !Time && Anim = 1311
trigger1 = Root,fvar(2) < 3
var(10) = 2
[State 1006, BMO!]
type = ParentVarSet
trigger1 = !Time && Anim = 1312
trigger1 = Root,fvar(3) < 1
var(10) = 3

[State 1006, End]
type = DestroySelf
trigger1 = Time >= 10

;sample text
[Statedef 1312]
type = A
physics = N
velset = 0, 0
anim = 1

[State 8290, Circle]
type = explod
trigger1 = !numexplod(8290)
anim = ifelse(ishelper(1320), 1320, ifelse(ishelper(1321), 1321, 1322))
ID = 8290
sprpriority = 64
postype = p1
facing = facing
removetime = 32
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8290, Scale]
type = modifyexplod
trigger1 = time < 8
ID = 8290
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 0

[State 8290, Scale]
type = modifyexplod
trigger1 = time >= 8
ID = 8290
scale = 0.5 + .0625 * (time -8), 0.5 + .0625 * (time -8)
trans = addalpha
alpha = 256 -32 * (time -8), 32 * (time -8)

[State 8290, Safety]
type = removeexplod
trigger1 = time >= 16

[State 8290, End]
type = destroyself
trigger1 = time >= 16

;SHOPPING CART (but you didn't have enough money)
[Statedef 1315]
physics = N
anim = 1310
velset=0,0
sprpriority=99999

[State 0, BindToParent]
type = BindToParent
trigger1 = 1
time = 1
pos = 0,-70
ignorehitpause = 1

[State 257, AS]
type=assertspecial
trigger1=1
flag=noshadow
[State 257, Reset]
type=varset
trigger1=!time
var(29)=150

[State 257, Varset]
type=varset
trigger1 =var(10)=1
var(10)= Ifelse(var(11)=0,1,0)
[State 257, ChangeAnim]
type = ChangeAnim
trigger1 =var(10)=1
value = Ifelse(anim=1310||anim=1313,1311,Ifelse(anim=1311||anim=1314,1312,1310))
[State 257, Sold Out]
type = ChangeAnim
trigger1 = (anim=1310&&root,fvar(1)=3) || (anim=1311&&root,fvar(2)=3) || (anim=1312&&root,fvar(3)=1)
trigger1 = anim != [1313,1315]
value = anim + 3

[State 257, PlaySnd]
type = PlaySnd
trigger1 =!time
value = S1,28
volumescale = 50
channel = 25
[State 182, NOPE]
type = PalFX
trigger1 = !time
time = 10
add = 256,0,0
mul = 256,0,0
sinadd = 0,0,0,1
invertall = 0
color = 256
[State 257, PlaySnd]
type = PlaySnd
trigger1 =var(10)=2 
value = S256,0
volumescale = 50
channel = 25
[State 257, PlaySnd]
type = PlaySnd
triggerall = time >= 8
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="s"
;trigger2=var(29)<=5
value = S1,24
volumescale = 50
channel = 20
persistent =0 

[State 257, Timer]
type = VarAdd
trigger1 =1 
var(29)=-1
[State 257, Timer]
type = VarAdd
trigger1=!var(10)&&var(29)<100
trigger1=root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd"
trigger2=AILevel && random<400
var(29)=20

[State 257, Varadd]
type=varadd
trigger1=(root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd")&&!var(10)||var(10)
trigger2=AILevel && random<400 &&!var(10)||var(10)
var(10)=1

[State 257, Varset]
type=varset
trigger1=!time||var(10)>=17
var(10)=0

[State 6500, DEBUG]
trigger1 = 1
type = DisplayToClipboard
ignorehitpause = 1
text = "GP = %d ITEM = %d SPD = %d DEF = %d BMO = %d"
params = root,var(27), anim, root,fvar(1), root,fvar(2), root,fvar(3)

[State 257, OUCH!]
type=destroyself
trigger1=(root,StateNo!=1300 && root,StateNo=!1302) || root,MoveType=H
trigger2=var(29)<=0 ; TOO SLOW
trigger3=root,command="SHOP" && time > 10
[State 257, NOT ENOUGH CASH, STRANGER]
type=ChangeState
triggerall = time > 10
triggerall = (anim = [1313, 1315]) || (root,var(27) < ifelse(anim=1310, 100000, ifelse(anim=1311, 200000, 300000)))
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||(var(29)<=140&&root,command="s")
value = 1315
[State 257, KEHEHEHAH THANK YOU]
type=ChangeState
triggerall = time > 10
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||(var(29)<=140&&root,command="s")
value = 1311

;The spare change in my pocket
[Statedef 1405]
type = S
physics = N
movetype = A
anim = ifelse(ishelper(1405), 1405, 1406)
ctrl = 0
velset = 0, 0
sprpriority = 4

[State spare change]
type = Explod
trigger1 = !time && ishelper(1405)
anim = 8210
ID = 229
pos = 0, 0
postype = p1
removetime = -2
bindtime = 1
supermovetime = 65535
pausemovetime = 65535
scale = 0.5,0.5
sprpriority = 12
ontop = 1
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S1,ifelse(ishelper(1405), 29, 30)
ignorehitpause = 1

[State 1005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1006
ignorehitpause = 1
[State 1005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1005, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)
[State 1005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1005, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10)=0, 3, ifelse(var(10)=1, 8.4, 15))
y = ifelse(var(10)=0, 8, ifelse(var(10)=1, 8.4, 4))

[State 1005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 6
persistent = 0
ignorehitpause = 1

[State 1005, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, SP
damage = ceil(77 * (ifelse(var(53),1.3,1)) * root,fvar(11)), 7
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1 
guard.sparkno = -1 
sparkxy = -10, 0
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -4
fall = var(53)
air.fall = 1
fall.recover = 1
fall.recovertime = 30
getpower = 10,5
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

[State 1005, Miss]
type = hitdef
getpower = 10,5
trigger1 = numenemy
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, SP
hitflag = 

[State 1005, End]
type = changestate
trigger1 = movecontact
value = 1406
ignorehitpause = 1
[State 1005, End]
type = destroyself
trigger1 = pos x != [ -200, 200]
trigger2 = Vel Y > 0 && Pos Y >= 0

;hit
[StateDef 1406]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1
anim = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = !time
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 62)
channel = 3
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1006, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 3

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = 1300
var(18) = 1

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;goddamn you're dirty
[Statedef 2240]
type = S
physics = N
movetype = A
anim = 2240
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 450,Posset]
type=posset
trigger1=!time
y=0

[State 1005, HitOverride]
type = hitoverride
trigger1 = 1
attr = SCA, AP
stateno = 2242
ignorehitpause = 1
[State 1005, HB]
type = nothitby
trigger1 = 1
time = -1
value = , AA, AT
ignorehitpause = 1
[State 1005, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 1005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State Woosh]
type = playsnd
trigger1 = !time
value = 1, 16

[State 1005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, ifelse(var(53),3000,6)
persistent = 0
ignorehitpause = 1

[State 1005, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, NP
damage = ceil(77 * (ifelse(root,var(9),1.2,1)) * root,fvar(11)), 0
animtype = Hard
hitflag = MAF
guardflag = LA
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1 
guard.sparkno = -1 
sparkxy = -10, 0
guardsound = s3, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -4
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 30
getpower = ifelse(p2movetype = H, 72, 144) * !(root, var(20)), 36 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1
palfx.color=32
palfx.sinadd=80,25,0,8
palfx.mul=512,256,128
palfx.time=32 

[State 1015, Miss]
type = hitdef
trigger1 = numenemy
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, SP
hitflag = 

[State 1005, End]
type = changestate
trigger1 = movecontact
value = 2242
ignorehitpause = 1
[State End]
type = destroyself
trigger1 = animtime = 0

;now that's a low blow...
[Statedef 2241]
type = S
physics = N
movetype = A
anim = 2241
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 450,Posset]
type=posset
trigger1=!time
y=0

[State 1005, HitOverride]
type = hitoverride
trigger1 = 1
attr = SCA, AP
stateno = 2242
ignorehitpause = 1
[State 1005, HB]
type = nothitby
trigger1 = 1
time = -1
value = , AA, AT
ignorehitpause = 1
[State 1005, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 1005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State Woosh]
type = playsnd
trigger1 = !time
value = 1, 16

[State 1005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, ifelse(var(53),3000,6)
persistent = 0
ignorehitpause = 1

[State 1005, Hit]
type = hitdef
triggerall = (root,var(15)<4)
trigger1 = 1
ID = 2241
priority = 4, Hit
attr = S, NP
damage = ceil(90 * (ifelse(root,var(9),1.2,1)) * root,fvar(11)), 0
animtype = Hard
hitflag = MAFD
guardflag = LA
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1 
guard.sparkno = -1 
sparkxy = -10, 0
guardsound = s3, 0
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4, -7
guard.velocity = -8
air.velocity = -4, -7
fall = 1
air.fall = 1
'fall.recover = 1
fall.recovertime = 30
getpower = ifelse(p2movetype = H, 72, 144) * !(root, var(20)), 36 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
fall.envshake.time = 15
fall.envshake.ampl = 5
yaccel = 0.6
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1
palfx.color=32
palfx.sinadd=80,25,0,8
palfx.mul=512,256,128
palfx.time=32 

[State 1015, Miss]
type = hitdef
trigger1 = numenemy
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, SP
hitflag = 

[State 1005, End]
type = changestate
trigger1 = movecontact
value = 2242
ignorehitpause = 1
[State End]
type = destroyself
trigger1 = animtime = 0

;hol up
[StateDef 2242]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 1000), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1006, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = 1100
var(18) = 1

[State End]
type = destroyself
trigger1 = animtime = 0

;KAZOO BEAM
[StateDef 3255]
type = S
physics = N
moveType = A
ctrl = 0
anim = 3255
sprPriority = 3

[State 3055, HitOverride]
type = Hitoverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 3255
ignorehitpause = 1

[State 3705, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 3705, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256,256

[State 3705, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3705, Damage Dampener]
type = VarSet
trigger1 = 1
fvar(11) = root,fvar(11)

[State 3705, HitDef]
type = HitDef
trigger1 = time = 10 ||time = 12 ||time = 14 ||time = 16 ||time = 18
;trigger1 = !Time
attr = S, HP
hitFlag = MAFD
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 7
sprpriority = 5
getpower = 1,0
givePower = 36, 36
pauseTime = 4, 8
guard.pauseTime = 0, 4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -8, -3
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -8, -3
air.cornerPush.velOff = 0
airGuard.velocity = -5, -1
airGuard.cornerPush.velOff = 0
down.velocity = -2, -6
yAccel = 0.45
fall = 1
air.fall = 1
fall.recover = 0
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 6
envShake.ampl = 6
envShake.freq = 120

[State 3005, HitSound]
type = Playsnd
trigger1 = Movecontact = 1 && Numtarget
trigger1 = !(target,hitshakeover)
value = Ifelse(MoveGuarded, 3, 2), Ifelse(MoveGuarded, 0, 6)
channel = 2

[State 3005, Spark]
type = Helper
trigger1 = MoveContact=1 && Numtarget
trigger1 = !(target,Hitshakeover)
helpertype = Normal
stateno = Ifelse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
postype = p2
pos = (target, const(size.ground.front)), (target, const(size.mid.pos.y))
facing = -1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3005, Counter FX]
type = Helper
trigger1 = MoveContact=1 && numtarget && var(9)
trigger1 = !(target,hitshakeover)
helpertype = normal
stateno=8290
ID = 8290
name = "Counter FX"
postype = p2
pos = (target, const(size.ground.front)), (target, const(size.mid.pos.y))
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3705, End]
type = DestroySelf
trigger1 = !AnimTime
trigger2 = (Root,StateNo!=3250) && (Root,MoveType=H)

;BALLIN'
[Statedef 3265]
type=S
movetype=A
physics=N
ctrl=0
velset=0, 0
sprpriority=4

[State 3265, HitOverride]
type=hitoverride
trigger1=1
time=-1
attr=SCA, AA, AP, AT
stateno=Ifelse(parent,stateno=3250&&var(1)<9,3265,Ifelse(var(1)<6,3265,3266))
ignorehitpause=1
[State 3655, HB]
type=hitby
trigger1=1
time=-1
value=SCA, NP, SP, HP
ignorehitpause=1

[State 3655, ChangeAnim]
type=ChangeAnim
trigger1 =!time&&!prevstateno
value=3260
[State 3655, velset]
type = velset
trigger1 = 1
x = 5+1*(parent,stateno=3250)
y = 0

[State 3655, Explod]
type = Explod
trigger1 = random<350
anim = 7181
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = -2
pauseMoveTime = -1
superMoveTime = -1
scale = 0.0625,0.0625
ownpal = 0
vel = -5 + (random / 50.0), -5 + (random / 50.0)

[State 3655, movehitvar]
type=varset
trigger1=movecontact && numtarget
trigger1=!(target, ishelper)
var(3)=1
ignorehitpause=1
[State 3655, VarAdd]
type=VarAdd
trigger1 =!time
var(1)=1

[State 3655, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256,256
ignorehitpause =1
[State 3655, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause =1

[State 3655, HitSound]
type=playsnd
trigger1=movehit && numtarget
trigger1=target, time=0 && target, movetype=H
value=2, 3000
persistent=0
ignorehitpause=1

[State 3655, Super]
type=hitdef
trigger1 = 1
priority=4, Hit
attr=S, HP
damage=floor(45*root,fvar(11)),20
animtype=Hard
hitflag=MAF
guardflag=M
pausetime=3,12
sparkNo=-1
guard.sparkNo=-1
sparkXY=-1,-1
guardsound=s3,0
ground.type=High
ground.slidetime=18
ground.hittime=18
guard.hittime=12
ground.velocity=0,0
guard.velocity=-4
air.cornerpush.veloff=0
ground.cornerpush.veloff=0
guard.cornerpush.veloff=0
air.velocity=0,0
air.fall=1
fall.recover=0
getpower = 1,0
givepower=36,72
envshake.time=12
envshake.ampl=5
sprpriority=4
yaccel=.45
forcestand=1
palfx.time = 32
palfx.mul = 192,192,192
palfx.sinadd = 128,128,128,4
p2stateno=4059

[State 3005, HitSpark]
type=Helper
trigger1=movecontact=1 && numtarget
trigger1=(enemynear, movetype=H) && !(target, time)
helperType=Normal
stateNo=ifElse(MoveGuarded, 8001, 8014)
ID=8000
name="Spark"
pos = (target, const(size.ground.front) -10), 0
facing=-1
ownPal=0
size.xScale=1.0
size.yScale=1.0
pauseMoveTime=65535
superMoveTime=65535
ignoreHitPause=1
persistent=0

[State 3655, Counter FX]
type=Helper
trigger1=MoveContact=1 && NumTarget && var(9)
trigger1=!(Target, HitShakeOver)
helperType=Normal
stateNo=8290
ID=8290
name="Counter FX"
posType=P1
pos=ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal=1
pauseMoveTime=65535
superMoveTime=65535
ignoreHitPause=1

[State 3655, HitCount]
type=ParentVarAdd
trigger1=Movehit=1 && NumTarget
var(13)=1
ignorehitpause=1
persistent=0
[State 3655, Projhit]
type=ParentVarAdd
trigger1=Movehit=1 && NumTarget
var(47)=1
ignorehitpause=1
persistent=0
[State 3655, Juggle Points]
type=ParentVarAdd
trigger1=MoveContact=1 && NumTarget
var(15)=1
ignorehitpause=1
persistent=0
[State 3655, ProjContact]
type=VarSet
trigger1=MoveContact=1 && NumTarget
var(18)=1
ignorehitpause=1
persistent=0
[State 3655, ProjContact]
type=ParentVarSet
trigger1=MoveContact=1 && NumTarget
trigger1=(Root, StateNo=3250)
var(18)=1
ignorehitpause=1
persistent=0

[State 3005, End]
type=changestate
trigger1=movecontact
value=3267
ignorehitpause=1
[State 3005, End]
type=destroyself
trigger1=pos x != [ -300, 300]

;poof
[Statedef 3266]
movetype=I
physics=N
anim=3261
ctrl=0
velset=0,0
sprpriority=4

[State BLAM]
type = Explod
trigger1 = !time
anim = 229
ID = 229
pos = 0, 0
postype = p1
removetime = -2
supermovetime = 65535
pausemovetime = 65535
scale = 2,2
sprpriority = 12
ontop = 1
ownpal = 1

[State 3006, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 3006, Trans]
type = Trans
trigger1 =1 
trans = addalpha
alpha = 256-8*(animelemtime(1)>=1),256
ignorehitpause = 1
[State 3006, Explod]
type = Explod
trigger1 = time<=5
anim = 3263
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = -2
pauseMoveTime = -1
superMoveTime = -1
scale = IfElse(Random <= 499,.25,.4),IfElse(Random <= 499,.25,.4)
ownpal = 0
vel = -10 + (random / 50.0), -10 + (random / 50.0)
[State 3006, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S18,0
channel = 5
ignorehitpause =1

[State 3006, End]
type=destroyself
trigger1=!animtime

;IKZ
[Statedef 3267]
type=S
movetype=A
physics=N
ctrl=0
velset=0, 0
sprpriority=4

[State 3267, HitOverride]
type=hitoverride
trigger1=1
time=-1
attr=SCA, AA, AP, AT
stateno=3267
ignorehitpause=1
[State 3007, HB]
type=hitby
trigger1=1
time=-1
value=SCA, NP, SP, HP
ignorehitpause=1

[State 3007, ChangeAnim]
type=ChangeAnim
trigger1 =anim!=3262
value=3262
elem=Ifelse(parent,stateno=3250,13,1)
[State 3007, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause=1
[State 3007, PosFreeze]
type = PosFreeze
trigger1 =1 
value = 1
ignorehitpause = 1

[State 3007, movehitvar]
type=varset
trigger1=movecontact && numtarget
trigger1=!(target, ishelper)
var(3)=1
ignorehitpause=1
[State 3007, VarAdd]
type=VarAdd
trigger1 =!time
var(8)=1

[State 3007, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256,256
ignorehitpause =1
[State 3007, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause =1

[State 3007, HitSound]
type=playsnd
trigger1=movehit && numtarget
trigger1=target, time=0 && target, movetype=H
value=2, 6
persistent=0
ignorehitpause=1

[State 3005, Super Hit 1]
type=hitdef
trigger1 = animelem=1||animelem=5||animelem=9||animelem=13||animelem=17
trigger2 = animelem=21||animelem=25
priority=4, Hit
attr=S, HP
damage=floor(31*root,fvar(11)),5
animtype=Hard
hitflag=MAF
guardflag=MA
pausetime=3,2
sparkNo=-1
guard.sparkNo=-1
sparkXY=-1,-1
guardsound=s3,0
ground.type=Low
ground.slidetime=2
ground.hittime=12
ground.velocity=15,0
guard.velocity=15
air.cornerpush.veloff=0
ground.cornerpush.veloff=0
guard.cornerpush.veloff=0
air.velocity=1,5
air.fall=1
fall.recover=0
getpower = 1,0
givepower=36,18
envshake.time=10
envshake.ampl=4
sprpriority=4
yaccel=.45
forcestand=1
palfx.time = 32
palfx.mul = 192,192,192
palfx.sinadd = 128,128,128,4
p2stateno=4058

[State 3005, Super Hit 2]
type=hitdef
trigger1 = animelem=3||animelem=7||animelem=11||animelem=15||animelem=19||animelem=23
priority=4, Hit
attr=S, HP
damage=floor(31*root,fvar(11)),5
animtype=Hard
hitflag=MAF
guardflag=MA
pausetime=3,2
sparkNo=-1
guard.sparkNo=-1
sparkXY=-1,-1
guardsound=s3,0
ground.type=Low
ground.slidetime=2
ground.hittime=12
ground.velocity=-15,0
guard.velocity=-15
air.cornerpush.veloff=0
ground.cornerpush.veloff=0
guard.cornerpush.veloff=0
air.velocity=-2,5
air.fall=1
fall.recover=0
getpower = 1,0
givepower=36,18
envshake.time=10
envshake.ampl=4
sprpriority=4
yaccel=.45
forcestand=1
palfx.time = 32
palfx.mul = 192,192,192
palfx.sinadd = 128,128,128,4
p2stateno=4058

[State 3005, Super Hit 3]
type=hitdef
trigger1 = animelem=27
priority=4, Hit
attr=S, HP
damage=floor(55*root,fvar(11)),12
animtype=Hard
hitflag=MAF
guardflag=MA
pausetime=3,12
sparkNo=-1
guard.sparkNo=-1
sparkXY=-1,-1
hitsound=s2,3000
guardsound=s3,0
ground.type=High
ground.slidetime=12
ground.hittime=18
guard.hittime=12
ground.velocity=-5,-8
guard.velocity=-9
air.cornerpush.veloff=0
ground.cornerpush.veloff=0
guard.cornerpush.veloff=0
air.velocity=-5,-6.5
fall=1
fall.recover=0
getpower = 1,0
givepower=36,18
envshake.time=12
envshake.ampl=5
sprpriority=4
yaccel=.45
forcestand=1
palfx.time = 32
palfx.mul = 192,192,192
palfx.sinadd = 128,128,128,4

[State 3007, HitSpark]
type=Helper
trigger1=movecontact=1 && numtarget
trigger1=(enemynear, movetype=H) && !(target, time)
helperType=Normal
stateNo=ifElse(MoveGuarded, 8001, 8014)
ID=8000
name="Spark"
pos = (target, const(size.ground.front) -10), 0
facing=-1
ownPal=0
size.xScale=1.0
size.yScale=1.0
pauseMoveTime=65535
superMoveTime=65535
ignoreHitPause=1
persistent=0

[State 3007, Counter FX]
type=Helper
trigger1=MoveContact=1 && NumTarget && var(9)
trigger1=!(Target, HitShakeOver)
helperType=Normal
stateNo=8290
ID=8290
name="Counter FX"
posType=P1
pos=ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal=1
pauseMoveTime=65535
superMoveTime=65535
ignoreHitPause=1

[State 3007, HitCount]
type=ParentVarAdd
trigger1=Movehit=1 && NumTarget
var(13)=1
ignorehitpause=1
persistent=0
[State 3007, Projhit]
type=ParentVarAdd
trigger1=Movehit=1 && NumTarget
var(47)=1
ignorehitpause=1
persistent=0
[State 3007, Juggle Points]
type=ParentVarAdd
trigger1=MoveContact=1 && NumTarget
var(15)=1
ignorehitpause=1
persistent=0
[State 3007, ProjContact]
type=VarSet
trigger1=MoveContact=1 && NumTarget
var(18)=1
ignorehitpause=1
persistent=0
[State 3007, ProjContact]
type=ParentVarSet
trigger1=MoveContact=1 && NumTarget
trigger1=(Root, StateNo=3250)
var(18)=1
ignorehitpause=1
persistent=0

[State 3007, End]
type=changestate
trigger1=movecontact
value=3267
ignorehitpause=1
[State 3007, End]
type=changestate
trigger1=anim=3262&&!animtime
trigger2=root,Movetype=H
trigger3=root,time<1
value=3266

;COMIN' THROUGH
[Statedef 3280]
type=S
movetype=A
physics=N
ctrl=0
velset=0, 0
sprpriority=4
anim = 3280

[State 0, NYOOOM]
type = PlaySnd
trigger1 = !time
value = S1,37
ignorehitpause = 1

[State 1005, Vel]
type = velset
trigger1 = 1
x = 20

[State 0, Wheels]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "Wheels"
ID = 3283
stateno = 3283
pos = 0,0
postype = p1
[State 0, Wheels]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "Wheels"
ID = 3284
stateno = 3284
pos = 0,0
postype = p1

[State 200, Hitdef]
type = HitDef
trigger1 = time = 1
attr = S, SP
damage = 270,25
getpower = 1,0
animtype = hard
guardflag = MA
hitflag = MAF
pauseTime = 4, 8
guard.pauseTime = 0, 4
sparkno = -1
sparkxy = -17, -63
hitsound = s2, 3000
guardsound = s3, 0
ground.type = low
guard.ctrltime = 20
ground.slidetime = 25
ground.hittime = 25
guard.velocity = -14
ground.velocity = -9,-10.5
airguard.velocity = -4,-6.5
air.type = low
air.velocity = -9,-10.5
air.hittime = 22
fall = 1
fall.recovertime = 40
air.fall.recover = 0
yaccel = .55
sprpriority = 4
envshake.time = 16
envshake.ampl = -12
envshake.freq = 255

[State 3005, HitSound]
type = Playsnd
trigger1 = Movecontact = 1 && Numtarget
trigger1 = !(target,hitshakeover)
value = Ifelse(MoveGuarded, 3, 2), Ifelse(MoveGuarded, 0, 3000)
channel = 2

[State 3005, Spark]
type = Helper
trigger1 = MoveContact=1 && Numtarget
trigger1 = !(target,Hitshakeover)
helpertype = Normal
stateno = Ifelse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
postype = p2
pos = (target, const(size.ground.front)), (target, const(size.mid.pos.y))
facing = -1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3005, Counter FX]
type = Helper
trigger1 = MoveContact=1 && numtarget && var(9)
trigger1 = !(target,hitshakeover)
helpertype = normal
stateno=8290
ID = 8290
name = "Counter FX"
postype = p2
pos = (target, const(size.ground.front)), (target, const(size.mid.pos.y))
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1005, End]
type = changestate
trigger1 = time >= 500
trigger2 = frontedgedist < -180
value = 3282

;hmmm
[StateDef 3282]
type = A
physics = N
moveType = A
anim = 1
ctrl = 0
velSet = 0,0

[State 1008, End]
type = DestroySelf
trigger1 = time >= 12
ignorehitpause = 1

;dem wheels doe
[Statedef 3283]
type    = A
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 3281
sprpriority = 3

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
[State 0, AngleAdd]
type = AngleAdd
trigger1 = !parent,hitpausetime
value = -30
ignorehitpause = 1

[State 0, VarRandom]
type = VarRandom
trigger1 = !parent,hitpausetime
v = 0
range = -1,1
[State 0, VarRandom]
type = VarRandom
trigger1 = !parent,hitpausetime
v = 1
range = -1,1

[State 0, BindToParent]
type = BindToParent
trigger1 = 1
time = 1
facing = 1
pos = 119+var(0),-28+var(1)
ignorehitpause = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = parent,stateno!=3280

;dem wheels doe
[Statedef 3284]
type    = A
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 3281
sprpriority = 3

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
[State 0, AngleAdd]
type = AngleAdd
trigger1 = !parent,hitpausetime
value = -30
ignorehitpause = 1

[State 0, VarRandom]
type = VarRandom
trigger1 = !parent,hitpausetime
v = 0
range = -1,1
[State 0, VarRandom]
type = VarRandom
trigger1 = !parent,hitpausetime
v = 1
range = -1,1

[State 0, BindToParent]
type = BindToParent
trigger1 = 1
time = 1
facing = 1
pos = -89+var(0),-28+var(1)
ignorehitpause = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = parent,stateno!=3280

;A black bg
[Statedef 3580]
physics=N
anim=3580
Sprpriority=-99999

[State 3480, ScreenBound]
type = ScreenBound
trigger1 =1
value = 1
[State 3480, PosSet]
type = PosSet
trigger1 =1
x =ceil(pos x-GameHeight / GameWidth)
y =ceil(pos y-GameHeight / GameWidth)
ignorehitpause=1
[State 3480, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 3480, AssertSpecial]
type = AssertSpecial
trigger1 = 1
Flag = noFG
Flag2= nobardisplay
ignorehitpause =1

[State 3480,Speed]
type=null;helper
trigger1 =(Root,StateNo =[3300,3310])
trigger2 =(Root,StateNo =3410)
helpertype=normal
stateno=3490
ID=3490
name="lines"
postype=back
supermovetime=99999
pausemovetime=99999
ownpal=1
ignorehitpause=1
size.xScale=1
size.yScale=1

[State 3480, end]
type=destroyself
trigger1 = root,MoveType = H
[State 3480, ChangeState]
type = ChangeState
trigger1 =root,stateno=3500&&root,animelemtime(6)>=30
trigger2 =root,stateno=3501&&root,animelemtime(48)>=0
trigger3 = Root,StateNo != 3500 && Root,StateNo !=3501
value =3581

;It's over
[Statedef 3581]
physics=N

[State 3481, Assert]
type=trans
trigger1=1
trans=addalpha
alpha=256-8*time, 0+8*time
ignorehitpause=1
[State 3481, ScreenBound]
type = ScreenBound
trigger1 =1
value = 1
[State 0, PosSet]
type = PosSet
trigger1 =1
x =ceil(pos x-GameHeight / GameWidth)
y =ceil(pos y-GameHeight / GameWidth)
ignorehitpause=1
[State 3481, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 3481, end]
type=destroyself
trigger1 =time>=32

;========================<WALLET/GP SYSTEM>=============================
;Wallet Controller (GP System)
[Statedef 6500]
anim = 1
ownpal = 1

[State 6500, ChangeState]
type = null
trigger1 = ((root,var(0)&2**0)/2**0)
value = 6501

;configŒÄ‚Ño‚µ
[State 6500, Helper]
type = null
trigger1 = time = 0
id = 10010
name = "config"
pos = -300,0
postype = Left
stateno = 10010
helpertype = normal
ignorehitpause = 1
pausemovetime = 999999
supermovetime = 999999

;KOŽž
;roundstate=3iKO`WinjƒtƒŒ[ƒ€Œo‰ß”
[State 6500, VarAdd]
type = VarAdd
trigger1 = roundstate = 3
var(1) = 1
ignorehitpause = 1

;roundstate=4iWinjƒtƒŒ[ƒ€Œo‰ß”
[State 6500, VarAdd]
type = VarAdd
trigger1 = roundstate = 4
var(2) = 1
ignorehitpause = 1

;Life Bonus
[State 6500, VarAdd]
type = ParentVarAdd
triggerall = root,win
triggerall = root,alive
triggerall = var(2) = 1
trigger1 = (100*root,life/root,const(data.life))=[76,100]
var(27)=20000
ignorehitpause = 1

[State 6500, VarAdd]
type = ParentVarAdd
triggerall = root,win
triggerall = root,alive
triggerall = var(2) = 1
trigger1 = (100*root,life/root,const(data.life))=[26,75]
var(27)=10000
ignorehitpause = 1

[State 6500, VarAdd]
type = ParentVarAdd
triggerall = root,win
triggerall = root,alive
triggerall = var(2) = 1
trigger1 = (100*root,life/root,const(data.life))=[2,25]
var(27)=5000
ignorehitpause = 1

[State 6500, VarAdd]
type = ParentVarAdd
triggerall = root,win
triggerall = root,alive
triggerall = var(2) = 1
trigger1 = (100*root,life/root,const(data.life))=[0,1]
var(27)=30000
ignorehitpause = 1

;GP counter graphics
[State 6500, Explod];”wŒi1P
type = Explod
trigger1 = !NumExplod(6501)
trigger1 = teamside = 1
anim = 6501
id = 6501
postype = Left
pos = -50,-50
ownpal = 0
bindtime = -1
ignorehitpause = 1
sprpriority = -102
facing = 1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6500, Explod];”wŒi2P
type = Explod
trigger1 = !NumExplod(6501)
trigger1 = teamside = 2
anim = 6551
id = 6501
postype = Right
pos = 50,-50
ownpal = 0
bindtime = -1
ignorehitpause = 1
sprpriority = -102
facing = -1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6500, Explod];˜g1P
type = Explod
trigger1 = !NumExplod(6500)
trigger1 = teamside = 1
anim = 6500
id = 6500
postype = Left
pos = -50,-50
ownpal = 1
bindtime = -1
ignorehitpause = 1
sprpriority = -101
facing = 1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6500, Explod];˜g2P
type = Explod
trigger1 = !NumExplod(6500)
trigger1 = teamside = 2
anim = 6550
id = 6500
postype = Right
pos = 50,-50
ownpal = 1
bindtime = -1
ignorehitpause = 1
sprpriority = -101
facing = -1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

;Counting Logic
[State 6500, VarSet]
type = VarSet
trigger1 = 1
var(51)=floor(abs(root,var(27))*.000001)
ignorehitpause = 1
persistent = 1

[State 6500, VarSet]
type = VarSet
trigger1 = 1
var(52)=floor(abs(root,var(27))*.00001)%10
ignorehitpause = 1
persistent = 1

[State 6500, VarSet]
type = VarSet
trigger1 = 1
var(53)=floor(abs(root,var(27))*.0001)%10
ignorehitpause = 1
persistent = 1

[State 6500, VarSet]
type = VarSet
trigger1 = 1
var(54)=floor(abs(root,var(27))*.001)%10
ignorehitpause = 1
persistent = 1

[State 6500, VarSet]
type = VarSet
trigger1 = 1
var(55)=floor(abs(root,var(27))*.01)%10
ignorehitpause = 1
persistent = 1

[State 6500, VarSet]
type = VarSet
trigger1 = 1
var(56)=floor(abs(root,var(27))*.1)%10
ignorehitpause = 1
persistent = 1

[State 6500, VarSet]
type = VarSet
trigger1 = 1
var(57)=abs(root,var(27))%10
ignorehitpause = 1
persistent = 1

;Number graphics
[State 6500, Explod]
type = Explod
trigger1 = teamside = 1
id = 6510
name = "gp_1"
pos = 141+var(20),47-var(21)
postype = Left
anim = ifelse(abs(root,var(27))>=9999999,6549,6540+var(57))
ownpal = 1
sprpriority = -100
bindtime = -1
ignorehitpause = 1
persistent = 1
facing = 1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6500, Explod]
type = Explod
trigger1 = teamside = 2
id = 6510
name = "gp_1"
pos = -103-var(20),47-var(21)
postype = Right
anim = ifelse(abs(root,var(27))>=9999999,6599,6590+var(57))
ownpal = 1
sprpriority = -100
bindtime = -1
ignorehitpause = 1
persistent = 1
facing = -1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6500, Explod]
type = Explod
trigger1 = teamside = 1
id = 6511
name = "gp_2"
pos = 137+var(20),47-var(21)
postype = Left
anim = ifelse(abs(root,var(27))>=9999999,6549,6540+var(56))
ownpal = 1
sprpriority = -100
bindtime = -1
ignorehitpause = 1
persistent = 1
facing = 1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6500, Explod]
type = Explod
trigger1 = teamside = 2
id = 6511
name = "gp_2"
pos = -107-var(20),47-var(21)
postype = Right
anim = ifelse(abs(root,var(27))>=9999999,6599,6590+var(56))
ownpal = 1
sprpriority = -100
bindtime = -1
ignorehitpause = 1
persistent = 1
facing = -1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6500, Explod]
type = Explod
triggerall = time > 1
trigger1 = teamside = 1
id = 6512
name = "gp_3"
pos = 133+var(20),47-var(21)
postype = Left
anim = ifelse(abs(root,var(27))>=9999999,6549,6540+var(55))
ownpal = 1
sprpriority = -100
bindtime = -1
ignorehitpause = 1
persistent = 1
facing = 1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6500, Explod]
type = Explod
triggerall = time > 1
trigger1 = teamside = 2
id = 6512
name = "gp_3"
pos = -111-var(20),47-var(21)
postype = Right
anim = ifelse(abs(root,var(27))>=9999999,6599,6590+var(55))
ownpal = 1
sprpriority = -100
bindtime = -1
ignorehitpause = 1
persistent = 1
facing = -1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6500, Explod]
type = Explod
triggerall = time > 1
trigger1 = teamside = 1
id = 6513
name = "gp_4"
pos = 127+var(20),45-var(21)
postype = Left
anim = ifelse(abs(root,var(27))>=9999999,6519,6510+var(54))
ownpal = 1
sprpriority = -100
bindtime = -1
ignorehitpause = 1
persistent = 1
facing = 1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6500, Explod]
type = Explod
triggerall = time > 1
trigger1 = teamside = 2
id = 6513
name = "gp_4"
pos = -118-var(20),45-var(21)
postype = Right
anim = ifelse(abs(root,var(27))>=9999999,6569,6560+var(54))
ownpal = 1
sprpriority = -100
bindtime = -1
ignorehitpause = 1
persistent = 1
facing = -1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6500, Explod]
type = Explod
triggerall = time > 1
trigger1 = teamside = 1
id = 6514
name = "gp_5"
pos = 121+var(20),45-var(21)
postype = Left
anim = ifelse(!var(51)&&!var(52)&&!var(53),6902,ifelse(abs(root,var(27))>=9999999,6519,6510+var(53)))
ownpal = 1
sprpriority = -100
bindtime = -1
ignorehitpause = 1
persistent = 1
facing = 1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6500, Explod]
type = Explod
triggerall = time > 1
trigger1 = teamside = 2
id = 6514
name = "gp_5"
pos = -124-var(20),45-var(21)
postype = Right
anim = ifelse(!var(51)&&!var(52)&&!var(53),6902,ifelse(abs(root,var(27))>=9999999,6569,6560+var(53)))
ownpal = 1
sprpriority = -100
bindtime = -1
ignorehitpause = 1
persistent = 1
facing = -1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6500, Explod]
type = Explod
triggerall = time > 1
trigger1 = teamside = 1
id = 6515
name = "gp_6"
pos = 115+var(20),45-var(21)
postype = Left
anim = ifelse(!var(51)&&!var(52),6902,ifelse(abs(root,var(27))>=9999999,6519,6510+var(52)))
ownpal = 1
sprpriority = -100
bindtime = -1
ignorehitpause = 1
persistent = 1
facing = 1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6500, Explod]
type = Explod
triggerall = time > 1
trigger1 = teamside = 2
id = 6515
name = "gp_6"
pos = -130-var(20),45-var(21)
postype = Right
anim = ifelse(!var(51)&&!var(52),6902,ifelse(abs(root,var(27))>=9999999,6569,6560+var(52)))
ownpal = 1
sprpriority = -100
bindtime = -1
ignorehitpause = 1
persistent = 1
facing = -1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6500, Explod]
type = Explod
triggerall = time > 1
trigger1 = teamside = 1
id = 6516
name = "gp_7"
pos = 109+var(20),45-var(21)
postype = Left
anim = ifelse(!var(51),6902,ifelse(abs(root,var(27))>=9999999,6519,6510+var(51)))
ownpal = 1
sprpriority = -100
bindtime = -1
ignorehitpause = 1
persistent = 1
facing = 1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6500, Explod]
type = Explod
triggerall = time > 1
trigger1 = teamside = 2
id = 6516
name = "gp_7"
pos = -136-var(20),45-var(21)
postype = Right
anim = ifelse(!var(51),6902,ifelse(abs(root,var(27))>=9999999,6569,6560+var(51)))
ownpal = 1
sprpriority = -100
bindtime = -1
ignorehitpause = 1
persistent = 1
facing = -1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6500, Explod]
type = Explod
triggerall = time > 1
triggerall = root,var(27) < 0
trigger1 = teamside = 1
id = 6517
name = "gp_-"
pos = ifelse((root,var(27)=[-9999,-1]),120,ifelse((root,var(27)=[-99999,-10000]),116,ifelse((root,var(27)=[-999999,-100000]),110,104)))+var(20),45-var(21)
postype = Left
anim = 6520
ownpal = 1
sprpriority = -100
bindtime = -1
ignorehitpause = 1
persistent = 1
facing = 1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6500, Explod]
type = Explod
triggerall = time > 1
triggerall = root,var(27) < 0
trigger1 = teamside = 2
id = 6517
name = "gp_-"
pos = ifelse((root,var(27)=[-9999,-1]),-122,ifelse((root,var(27)=[-99999,-10000]),-128,ifelse((root,var(27)=[-999999,-100000]),-134,-140)))-var(20),45-var(21)
postype = Right
anim = 6570
ownpal = 1
sprpriority = -100
bindtime = -1
ignorehitpause = 1
persistent = 1
facing = -1
pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 6500, VarSet]
type = VarSet
triggerall = time > 1
triggerall = roundstate = 2
trigger1 = root,fvar(24)
trigger2 = (root,stateno = 150 || root,stateno = 152 || root,stateno = 154) && root,time = 1
trigger3 = (root,stateno = 5000 || root,stateno = 5010 || root,stateno = 5020 || root,stateno = 5070 || root,stateno = 5080) && root,time = 1
trigger4 = var(14)-root,var(54)>0
trigger4 = (root,stateno != 5000 && root,stateno != 5010 && root,stateno != 5020 && root,stateno != 5070 && root,stateno != 5080)
trigger5 = root,var(17)-var(13)>0
var(11) = ifelse((root,var(27)-var(10)>0),1,ifelse((root,var(27)-var(10)<0),-1,0))
ignorehitpause = 1

[State 6500, VarSet]
type = VarSet
triggerall = time > 1
triggerall = roundstate = 2
trigger1 = root,fvar(24)
trigger2 = (root,stateno = 150 || root,stateno = 152 || root,stateno = 154) && root,time = 1
trigger3 = (root,stateno = 5000 || root,stateno = 5010 || root,stateno = 5020 || root,stateno = 5070 || root,stateno = 5080) && root,time = 1
trigger4 = var(14)-root,var(54)>0
trigger4 = (root,stateno != 5000 && root,stateno != 5010 && root,stateno != 5020 && root,stateno != 5070 && root,stateno != 5080)
trigger5 = root,var(17)-var(13)>0
var(12) = 0
ignorehitpause = 1

[State 6500, VarAdd]
type = VarAdd
trigger1 = var(11)
trigger1 = time > 1
var(12) = 1
ignorehitpause = 1

[State 6500, VarSet]
type = VarSet
trigger1 = var(12) = 18
trigger1 = time > 1
var(11) = 0
ignorehitpause = 1

[State 6500, VarSet]
type = VarSet
trigger1 = var(12) = 18
trigger1 = time > 1
var(12) = 0
ignorehitpause = 1

[State 6500, PalFX]
type = PalFX
triggerall = var(11)
triggerall = roundstate = 2
triggerall = time > 1
trigger1 = var(12) = 1
time = 1
add = 0,0,0
sinadd = 0,0,0,0
ignorehitpause = 1

[State 6500, PalFX]
type = PalFX
triggerall = var(11) = 1
triggerall = roundstate = 2
triggerall = time > 1
trigger1 = var(12) = 1
time = 36
add = 255,120,40
sinadd = 0,88,-32,144
ignorehitpause = 1

[State 6500, PalFX]
type = PalFX
triggerall = var(11) = -1
triggerall = roundstate = 2
triggerall = time > 1
trigger1 = var(12) = 1
time = 24
add = 144,144,255
sinadd = 112,64,-255,96
ignorehitpause = 1

[State 6500, PalFX]
type = PalFX
trigger1 = !var(12)
time = 1
add = 255,208,8
ignorehitpause = 1

[State 6500, VarSet]
type = VarSet
trigger1 = 1
var(10) = root,var(27)
ignorehitpause = 1

[State 6500, VarSet]
type = ParentVarSet
trigger1 = 1
fvar(24) = 0
ignorehitpause = 1

[State 6500, VarSet]
type = VarSet
trigger1 = 1
var(13) = root,var(13)
ignorehitpause = 1

[State 6500, VarSet]
type = VarSet
trigger1 = 1
var(14) = root,life
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
triggerall = time = 2
trigger1 = teamside = 1
anim = 6501
id = 6501
postype = Left
pos = 90+var(20),42-var(21)

[State 6500, ModifyExplod]
type = ModifyExplod
triggerall = time = 2
trigger1 = teamside = 2
anim = 6551
id = 6501
postype = Right
pos = -154-var(20),42-var(21)

[State 6500, ModifyExplod]
type = ModifyExplod
triggerall = time = 2
trigger1 = teamside = 1
anim = 6500
id = 6500
postype = Left
pos = 90+var(20),42-var(21)
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
triggerall = time = 2
trigger1 = teamside = 2
anim = 6550
id = 6500
postype = Right
pos = -154-var(20),42-var(21)

[State 6500, ModifyExplod]
type = ModifyExplod
trigger1 = NumExplod(6501)
ID = 6501
scale = .5,.5
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
triggerall = NumExplod(6501)
trigger1 = NumHelper(9000)||((root,var(0)&2**20)&&enemynear,NumHelper(9000));||root,fvar(20)
;trigger2 = root,var(13)
ID = 6501
scale = 0,0
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
trigger1 = NumExplod(6500)
ID = 6500
scale = .5,.5
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
triggerall = NumExplod(6500)
trigger1 = NumHelper(9000)||((root,var(0)&2**20)&&enemynear,NumHelper(9000));||root,fvar(20)
;trigger2 = root,var(13)
ID = 6500
scale = 0,0
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
trigger1 = NumExplod(6510)
ID = 6510
scale = .5,.5
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
triggerall = NumExplod(6510)
trigger1 = NumHelper(9000)||((root,var(0)&2**20)&&enemynear,NumHelper(9000));||root,fvar(20)
;trigger2 = root,var(13)
ID = 6510
scale = 0,0
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
trigger1 = NumExplod(6511)
ID = 6511
scale = .5,.5
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
triggerall = NumExplod(6511)
trigger1 = NumHelper(9000)||((root,var(0)&2**20)&&enemynear,NumHelper(9000));||root,fvar(20)
;trigger2 = root,var(13)
ID = 6511
scale = 0,0
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
trigger1 = NumExplod(6512)
ID = 6512
scale = .5,.5
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
triggerall = NumExplod(6512)
trigger1 = NumHelper(9000)||((root,var(0)&2**20)&&enemynear,NumHelper(9000));||root,fvar(20)
;trigger2 = root,var(13)
ID = 6512
scale = 0,0
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
trigger1 = NumExplod(6513)
ID = 6513
scale = .5,.5
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
triggerall = NumExplod(6513)
trigger1 = NumHelper(9000)||((root,var(0)&2**20)&&enemynear,NumHelper(9000));||root,fvar(20)
;trigger2 = root,var(13)
ID = 6513
scale = 0,0
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
trigger1 = NumExplod(6514)
ID = 6514
scale = .5,.5
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
triggerall = NumExplod(6514)
trigger1 = NumHelper(9000)||((root,var(0)&2**20)&&enemynear,NumHelper(9000));||root,fvar(20)
;trigger2 = root,var(13)
ID = 6514
scale = 0,0
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
trigger1 = NumExplod(6515)
ID = 6515
scale = .5,.5
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
triggerall = NumExplod(6515)
trigger1 = NumHelper(9000)||((root,var(0)&2**20)&&enemynear,NumHelper(9000));||root,fvar(20)
;trigger2 = root,var(13)
ID = 6515
scale = 0,0
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
trigger1 = NumExplod(6516)
ID = 6516
scale = .5,.5
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
triggerall = NumExplod(6516)
trigger1 = NumHelper(9000)||((root,var(0)&2**20)&&enemynear,NumHelper(9000));||root,fvar(20)
;trigger2 = root,var(13)
ID = 6516
scale = 0,0
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
trigger1 = NumExplod(6517)
ID = 6517
scale = .5,.5
ignorehitpause = 1

[State 6500, ModifyExplod]
type = ModifyExplod
triggerall = NumExplod(6517)
trigger1 = NumHelper(9000)||((root,var(0)&2**20)&&enemynear,NumHelper(9000));||root,fvar(20)
;trigger2 = root,var(13)
ID = 6517
scale = 0,0
ignorehitpause = 1

;DEBUG
[State 6500, DEBUG]
trigger1 = 1
type = DisplayToClipboard
ignorehitpause = 1
text = "GP = %d BGFX1 = %d BGFX2 = %d root,life = %d root,gethit = %d \n "
params = root,var(27), var(11), var(12), root,life, ceil(root,fvar(4))

;null
[Statedef 6501]
anim = 1

[State 6501, Null]
type = Null
trigger1 = 0

;========================<JAKE>=============================
;---------------------------------------------------------------------------
; Jake - Stand
[Statedef 7000]
type = S
sprpriority = -2
anim = 7000
velset = 0,0

[State 7000, 0]
type = ChangeState
trigger1 = parentdist x >= 65
trigger1 = anim != 7003
value = 7001
ctrl = 0

[State 7000, 1]
type = ChangeState
trigger1 = parentdist x <= 60
trigger1 = anim != 7003 && anim != 7004
value = 7002
ctrl = 0

[State 7000, 2]
type = ChangeAnim
trigger1 = anim = 7003
trigger1 = parent, movehit = 0
value = 7000

[State 7000, 3]
type = ChangeAnim
trigger1 = anim = 7000
trigger1 = parent, movehit = 1
value = 7003

[State 7000, 4]
type = ChangeAnim
triggerall = anim != 7004
trigger1 = parent, movetype = H
trigger2 = parent, stateno = 1001
value = 7004

[State 7000, 5]
type = ChangeAnim
triggerall = anim != 7000 && anim != 7003
trigger1 = parent, movetype != H
trigger1 = parent, stateno != 1001
value = 7000

[state 7000, 6]
type = Turn
trigger1 = facing != parent, facing

[State 7000, 7]
type = AssertSpecial
trigger1 = parent, anim = 9020
trigger2 = parent, anim = 66660 || parent, anim = 66661 || parent, anim = 66662
flag = invisible

[State 7000, 8]
type = StopSnd
trigger1 = anim = 7003
trigger1 = time = 6
channel = 2

[State 7000, 9]
type = PlaySnd
trigger1 = anim = 7003
trigger1 = time = 6
trigger1 = random < 200
value = S30,0
channel = 2

[State 7000, 10]
type = ChangeState
trigger1 = roundstate = 4
trigger1 = parent, win
value = 7003
ctrl = 0

[State 7000, 11]
type = ChangeState
trigger1 = parent, ctrl = 1
trigger1 = parent, stateno = 1500 && root, var(10) = 0
trigger1 = parent, time < 10
value = 7100

[State 7000, 12]
type = ChangeState
trigger1 = parent, ctrl = 1
trigger1 = parent, stateno = 1500 && root, var(10) = 1
trigger1 = parent, time < 10
value = 7101

[State 7000, 13]
type = ChangeState
trigger1 = parent, movetype != H
trigger1 = parent, stateno = 3200
value = 7102

[State 7000, 14]
type = RemoveExplod
trigger1 = 1
id = 700

[State -2]
type = Trans
trigger1 = root,fvar(0) = 12
trans = add1

[State 0, StopSnd]
type = StopSnd
trigger1 = anim = 7004
channel = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger1 = anim = 7004
trigger1 = random > 500
value = S30,2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger1 = anim = 7004
trigger1 = random < 500
value = S30,3

;---------------------------------------------------------------------------
; Jake - Walk
[Statedef 7001]
type = S
sprpriority = -2
anim = 7001
velset = 3,0

[State -1]
type = ChangeState
trigger1 = parentdist x > 80
value = 7006
ctrl = 0

[State 7001, 0]
type = AssertSpecial
trigger1 = parent, anim = 9020
trigger2 = parent, anim = 66660 || parent, anim = 66661 || parent, anim = 66662
flag = invisible

[State 7001, 1]
type = ChangeState
trigger1 = parentdist x < 65
value = 7000
ctrl = 0

[State 7001, 2]
type = RemoveExplod
trigger1 = 1
id = 700

[State -2]
type = Trans
trigger1 = root,fvar(0) = 12
trans = add1

;---------------------------------------------------------------------------
; Jake - Walk
[Statedef 7002]
type = S
sprpriority = -2
anim = 7002
velset = -3,0

[State -1]
type = ChangeState
trigger1 = parentdist x > 75 || parentdist x < 55
value = 7007
ctrl = 0

[State 7002, 0]
type = AssertSpecial
trigger1 = parent, anim = 9020
trigger2 = parent, anim = 66660 || parent, anim = 66661 || parent, anim = 66662
flag = invisible

[State 7002, 1]
type = StopSnd
trigger1 = prevstateno = 7100
channel = 2

[State 7002, 2]
type = ChangeState
trigger1 = parentdist x > 60
value = 7000
ctrl = 0

[State 7002, 3]
type = RemoveExplod
trigger1 = 1
id = 700

[State -2]
type = Trans
trigger1 = root,fvar(0) = 12
trans = add1

;---------------------------------------------------------------------------
; Jake - Win
[Statedef 7003]
type = S
sprpriority = -2
anim = 7005
velset = 0,0

[State 7003, 0]
type = Null
trigger1 = 1

[State -2]
type = Trans
trigger1 = root,fvar(0) = 12
trans = add1

[State 0, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S30,4

;---------------------------------------------------------------------------
; Jake - Run
[Statedef 7006]
type = S
sprpriority = -2
anim = 7006
velset = 9,0

[State 7001, 0]
type = AssertSpecial
trigger1 = parent, anim = 9020
trigger2 = parent, anim = 66660 || parent, anim = 66661 || parent, anim = 66662
flag = invisible

[State 7001, 1]
type = ChangeState
trigger1 = parentdist x < 65
value = 7000
ctrl = 0

[State 7001, 2]
type = RemoveExplod
trigger1 = 1
id = 700

[State -2]
type = Trans
trigger1 = root,fvar(0) = 12
trans = add1

[State -2, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = S52,1

;---------------------------------------------------------------------------
; Jake - Run
[Statedef 7007]
type = S
sprpriority = -2
anim = 7007
velset = -9,0

[State 7002, 0]
type = AssertSpecial
trigger1 = parent, anim = 9020
trigger2 = parent, anim = 66660 || parent, anim = 66661 || parent, anim = 66662
flag = invisible

[State 7002, 1]
type = StopSnd
trigger1 = prevstateno = 7100
channel = 2

[State 7002, 2]
type = ChangeState
trigger1 = parentdist x > 60
value = 7000
ctrl = 0

[State 7002, 3]
type = RemoveExplod
trigger1 = 1
id = 700

[State -2]
type = Trans
trigger1 = root,fvar(0) = 12
trans = add1

[State -2, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = S52,1

;---------------------------------------------------------------------------
; Jake - Intro
[Statedef 7050]
type = S
sprpriority = -2
anim = 7060
velset = 0,0

[State 7003, 0]
type = Null
trigger1 = 1

[State -2]
type = Trans
trigger1 = root,fvar(0) = 12
trans = add1

[State 7002, 2]
type = ChangeState
trigger1 = animtime = 0
value = 7000
ctrl = 0

;---------------------------------------------------------------------------
; Jake - Intro
[Statedef 7051]
type = S
sprpriority = -2
anim = 7061
velset = 0,0

[State -2]
type = PlaySnd
trigger1 = animelem = 2
value = S30,5
channel = 2

[State -2]
type = Trans
trigger1 = root,fvar(0) = 12
trans = add1

[State 7002, 2]
type = ChangeState
trigger1 = animtime = 0
value = 7000
ctrl = 0

;---------------------------------------------------------------------------
; Jake - Ball
[Statedef 7100]
type = S
movetype = A
sprpriority = -2
anim = 7100
velset = 0,0

[State 7100, 0]
type = VelAdd
trigger1 = time > 22
x = 1

[State 7100, 2]
type = PlaySnd
trigger1 = animelem = 4
value = S1,25
channel = 2

[State 1100, DustExplod]
type = Explod
trigger1 = animelemtime(4) >= 0 && !(time % 2)
anim = 8104
ID = 8104
pos = ceil(-25*const(size.xscale)),0
postype = p1
facing = 1
bindtime = 1
vel = -2,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1 * const(size.xscale), 1 * const(size.yscale)
sprpriority = 4
ontop = 1
shadow = 0,0,0
removeongethit = 1
supermovetime = 0
trans=addalpha
alpha=256,256
ignorehitpause = 1

[State 7100, 3]
type = HitDef
trigger1 = Time = 0
attr = S, SA
damage = 77, 7
animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 8, 8
sparkno = s8010
sparkxy = -10, -20
hitsound = s2, 62
guardsound = s3, 0
ground.type = Low
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = -4
airguard.velocity = -1.9,-.8
air.type = Low
air.velocity = -1.4,-3
air.hittime = 12
p1stateno = 7002
fall = 1
envshake.time = 6
envshake.freq = 120
envshake.ampl = 6

[State BLAM]
type = Explod
trigger1 = movehit = 1 
trigger1 = p2statetype = A
anim = 229
ID = 229
pos = -10, -20
postype = p1
removetime = -2
supermovetime = 65535
pausemovetime = 65535
scale = 1.5,1.5
sprpriority = 12
ontop = 1
ownpal = 1

[State 1605, Counter FX]
type=Helper
trigger1=MoveContact=1 && NumTarget && var(9)
trigger1=!(Target, HitShakeOver)
helperType=Normal
stateNo=8290
ID=8290
name="Counter FX"
posType=P1
pos=ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal=1
pauseMoveTime=65535
superMoveTime=65535
ignoreHitPause=1

[State 7100, 4]
type = ChangeState
trigger1 = frontedgedist < 30
value = 7000
ctrl = 0

[State 7100, 5]
type = RemoveExplod
trigger1 = 1
id = 700

[State -2]
type = Trans
trigger1 = root,fvar(0) = 12
trans = add1

;---------------------------------------------------------------------------
; Jake - Hammer
[Statedef 7101]
type = S
movetype = A
sprpriority = -2
anim = 7101
velset = 8,0

[State 7101, 0]
type = VelSet
trigger1 = animelem = 3
x = 0

[State 7101, 1]
type = PlaySnd
trigger1 = animelem = 3
value = S1,2

[State 7101, 2]
type = PlaySnd
trigger1 = animelem = 4
value = S2,2

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 4
time = 6
freq = 120
ampl = 6
ignorehitpause = 1

[State 52, Dust]
type = explod
trigger1 = animelem = 4
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 7101, 3]
type = HitDef
trigger1 = Time = 0
attr = S, SA
damage = 70, 7
animtype = Heavy
guardflag = LA
hitflag = MAFD
priority = 3, Hit
pausetime = 16, 16
sparkno = s8010
sparkxy = -10, -20
hitsound = s2, 45
guardsound = s3, 0
ground.type = Low
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = 0,10
airguard.velocity = 0,10
air.type = Low
air.velocity = 0,10
air.hittime = 12
p1stateno = 7002
fall = 1
envshake.time = 6
envshake.freq = 120
envshake.ampl = 6

[State BLAM]
type = Explod
trigger1 = movehit = 1 
trigger1 = p2statetype = A
anim = 229
ID = 229
pos = -10, -20
postype = p1
removetime = -2
supermovetime = 65535
pausemovetime = 65535
scale = 1.5,1.5
sprpriority = 12
ontop = 1
ownpal = 1

[State 1605, Counter FX]
type=Helper
trigger1=MoveContact=1 && NumTarget && var(9)
trigger1=!(Target, HitShakeOver)
helperType=Normal
stateNo=8290
ID=8290
name="Counter FX"
posType=P1
pos=ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal=1
pauseMoveTime=65535
superMoveTime=65535
ignoreHitPause=1

[State 7101, 4]
type = ChangeState
trigger1 = animtime = 0
value = 7000
ctrl = 0

[State 7101, 5]
type = RemoveExplod
trigger1 = 1
id = 700

[State -2]
type = Trans
trigger1 = root,fvar(0) = 12
trans = add1

;---------------------------------------------------------------------------
; Giant Jake - Hyper
[Statedef 7102]
type = S
movetype = A
physics = N
sprpriority = 2
anim = 7102
velset = 0,0

[State -1]
type = StopSnd
trigger1 = time = 0
channel = 2

[State -1]
type = PlaySnd
trigger1 = time = 0
value = S30,1
channel = 2

[State 7102, 0]
type = VelSet
trigger1 = animelem = 2
x = 25

[State 7102, 4]
type = VelSet
trigger1 = animelem = 3
x = 0

[State 7102, 5]
type = HitDef
trigger1 = animelem = 2
trigger2 = animelem = 3
trigger3 = animelem = 4
trigger4 = animelem = 5
attr = S, HA
damage = 7, 3
animtype = Heavy
guardflag = MA
hitflag = MAFD
priority = 3, Hit
pausetime = 16, 16
sparkno = -1
sparkxy = -10, -20
hitsound = s2, 45
guardsound = s3,0
ground.type = Low
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = 0,10
airguard.velocity = 0,10
air.type = Low
air.velocity = 0,10
air.hittime = 12
fall = 1
envshake.time = 10
envshake.freq = 60
envshake.ampl = -5
envshake.phase = 90

[State 7102, 6]
type = HitDef
trigger1 = animelem = 6
trigger2 = animelem = 8
trigger3 = animelem = 10
attr = S, HA
damage = 20, 3
animtype = Heavy
guardflag = MA
hitflag = MAFD
priority = 3, Hit
pausetime = 16, 16
sparkno = -1
sparkxy = -10, -20
hitsound = s2, 22
guardsound = s3, 0
ground.type = Low
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = 0,10
airguard.velocity = 0,10
air.type = Low
air.velocity = 0,10
air.hittime = 12
fall = 1
envshake.time = 10
envshake.freq = 60
envshake.ampl = -10
envshake.phase = 90

[State 7102, 7]
type = HitDef
trigger1 = animelem = 11
trigger2 = animelem = 14
trigger3 = animelem = 15
trigger4 = animelem = 18
trigger5 = animelem = 19
attr = S, HA
damage = 18, 2
animtype = Heavy
guardflag = MA
hitflag = MAFD
priority = 3, Hit
pausetime = 0, 6
sparkno = -1
sparkxy = -10, -20
hitsound = s2, 25
guardsound = s3, 0
ground.type = Low
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = 20,0
airguard.velocity = 20,0
air.type = Low
air.velocity = 20,0
air.hittime = 12
fall = 1

[State 7102, 8]
type = HitDef
trigger1 = animelem = 12
trigger2 = animelem = 13
trigger3 = animelem = 16
trigger4 = animelem = 17
trigger5 = animelem = 20
trigger6 = animelem = 21
attr = S, HA
damage = 18, 2
animtype = Heavy
guardflag = MA
hitflag = MAFD
priority = 3, Hit
pausetime = 0, 6
sparkno = -1
sparkxy = -10, -20
hitsound = s2, 25
guardsound = s3,0
ground.type = Low
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = -20,0
airguard.velocity = -20,0
air.type = Low
air.velocity = -20,0
air.hittime = 12
fall = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 50, ceil(P2Dist x), 50)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 50, ceil(P2Dist x), 50)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 7102, 9]
type = PlaySnd
trigger1 = animelem = 6
trigger2 = animelem = 8
trigger3 = animelem = 10
value = S1,18

[State 7102, 9]
type = PlaySnd
trigger1 = animelem = 11
trigger2 = animelem = 13
trigger3 = animelem = 15
trigger4 = animelem = 17
trigger5 = animelem = 19
trigger6 = animelem = 21
value = S101,0

[State 7102, 10]
type = EnvShake
trigger1 = animelem = 6
trigger2 = animelem = 8
trigger3 = animelem = 10
time = 10
freq = 60
ampl = -5
phase = 90

[State 7102, 11]
type = ChangeState
trigger1 = animtime = 0
value = 7000
ctrl = 0

[State -2]
type = Trans
trigger1 = root,fvar(0) = 12
trans = add1

;========================<SPARKS>=============================
;Guard Spark (Normal)
[StateDef 8000]
type = A
physics = N
moveType = I
anim = 8000
velset = 0,0
sprPriority = 5

[State 8000, Assert: No Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8000, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.125 + (0.046875 * Time), 0.125 + (0.046875 * Time)
ignoreHitPause = 1

[State 8000, Transparency]
type = Trans
trigger1 = Time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8000, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8000, End]
type = DestroySelf
trigger1 = Time >= 8


;Guard Spark (Special)
[StateDef 8001]
type = A
physics = N
moveType = I
anim = 8001
velSet = 0,0
sprPriority = 5

[State 8001, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8001, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
ignoreHitPause = 1

[State 8001, Transparency]
type = Trans
trigger1 = time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8001, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8001, End]
type = DestroySelf
trigger1 = Time >= 8



;Weak Hit Spark
[StateDef 8010]
type = A
physics = N
moveType = I
anim = ifelse(root,fvar(29)=-1,8010,8019+(root,fvar(29)=3)*60)
velSet = 0,0
sprPriority = 5

[State 8010, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 8010, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)
ignorehitpause = 1

[State 8010, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8010, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = (0.3 - (Time * 0.03)), (0.3 - (Time * 0.03))
ignorehitpause = 1

[State 8010, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignorehitpause = 1

[State 8010, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignorehitpause = 1

[State 8010, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011+(root,fvar(29)=3)*60
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = (0.15 + (0.009375 * Time)), (0.15 + (0.009375 * Time))
trans = AddAlpha
alpha = 256 - (16 * Time),256

[State 8010, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012+(root,fvar(29)=3)*60
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = (0.15 + (0.009375 * Time)), (0.15 + (0.009375 * Time))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8010, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = (0.3 - (0.0375 * Time)), (0.3 - (0.0375 * Time))
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8010, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8010, End]
type = DestroySelf
trigger1 = Time >= 16


;Medium Hit Spark
[StateDef 8011]
type = A
physics = N
moveType = I
anim = ifelse(root,fvar(29)=-1,8010,8019+(root,fvar(29)=3)*60)
velSet = 0,0
sprPriority = 5

[State 8011, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 8011, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8011, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8011, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = (0.35 - (Time * 0.035)), (0.35 - (Time * 0.035))
ignorehitpause = 1

[State 8011, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignorehitpause = 1

[State 8011, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256

[State 8011, Center]
type = Explod
trigger1 = !Time
anim = 8011+(root,fvar(29)=3)*60
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removetime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = (0.175 + (0.0109375 * Time)), (0.175 + (0.0109375 * Time))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8011, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012+(root,fvar(29)=3)*60
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = (0.175 + (0.0109375 * Time)), (0.175 + (0.0109375 * Time))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8011, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = (0.35 - (0.04375 * Time)), (0.35 - (0.04375 * Time))
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8011, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8011, End]
type = DestroySelf
trigger1 = Time >= 16


;Strong Hit Spark
[StateDef 8012]
type = A
physics = N
moveType = I
anim = ifelse(root,fvar(29)=-1,8010,8019+(root,fvar(29)=3)*60)
velSet = 0,0
sprPriority = 5

[State 8012, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 8012, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8012, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8012, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = (0.4 - (Time * 0.04)), (0.4 - (Time * 0.04))
ignorehitpause = 1

[State 8012, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignorehitpause = 1

[State 8012, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignorehitpause = 1

[State 8012, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011+(root,fvar(29)=3)*60
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = (0.2 + (0.0125 * Time)), (0.2 + (0.0125 * Time))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8012, Streaks Explod]
type = Explod
trigger1 = !time
anim = 8012+(root,fvar(29)=3)*60
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = (0.2 + (0.0125 * Time)), (0.2 + (0.0125 * Time))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8012, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = (0.4 - (0.05 * Time)), (0.4 - (0.05 * Time))
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8012, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8012, End]
type = DestroySelf
trigger1 = Time >= 16


;Special Move Hit Spark
[StateDef 8013]
type = A
physics = N
moveType = I
anim = ifelse(root,fvar(29)=-1,8010,8019+(root,fvar(29)=[1,2])*40+(root,fvar(29)=3)*60)
velSet = 0,0
sprPriority = 5

[State 8013, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 8013, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8013, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8013, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = (0.45 - (Time * 0.045)), (0.45 - (Time * 0.045))
ignorehitpause = 1

[State 8012, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignorehitpause = 1

[State 8013, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignorehitpause = 1

[State 8013, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011+(root,fvar(29)=[1,2])*40+(root,fvar(29)=3)*60
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = (0.225 + (0.0140625 * Time)), (0.225 + (0.0140625 * Time)) 
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8013, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012+(root,fvar(29)=[1,2])*40+(root,fvar(29)=3)*60
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Streaks Explod (Classic)]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = (0.225 + (0.0140625 * Time)), (0.225 + (0.0140625 * Time)) 
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8013, P2 Back Explod (Classic)]
type = Explod
triggerall = root, fvar(29)!=3
trigger1 = !Time
anim = 8013+(root,fvar(29)=[1,2])*40+(root,fvar(29)=3)*60
ID = 3
posType = P1
facing = 1
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale P2 Back Explod (PotS 2022)]
type = ModifyExplod
triggerall = root, fvar(29)!=3
trigger1= NumExplod(3)
ID = 3
scale = (0.4), (0.4) 
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8013, P2 Back (PotS 2022)]
type = explod
triggerall = root, fvar(29)=3
triggerall = !time
triggerall = parent, numtarget
trigger1 = numenemy = parent, numtarget
trigger2 = numenemy > parent, numtarget
trigger2 = abs(enemynear(0), pos x - enemynear(1), pos x) >= 120
anim = 8013
ID = 3
postype = p1
vfacing = ifelse(random < 500, -1, 1)
sprpriority = -3
removetime = 8
pausemovetime = -1
supermovetime = -1

[State 8013, Position (PotS 2022)]
type = modifyexplod
triggerall = root, fvar(29)=3
triggerall = numexplod(3)
trigger1 = numenemy = 1
trigger2 = numenemy >= 2 && !time
ID = 3
postype = p1
pos = ceil(p2dist x + enemynear, const(size.ground.back)), ceil(p2dist y + ifelse(p2statetype = L, 0, ifelse(p2statetype = C, 0.5, 0.75) * enemynear, const(size.head.pos.y)))

[State 8013, Scale]
type = modifyexplod
triggerall = root, fvar(29)=3
trigger1 = numexplod(3)
ID = 3
scale = (0.25 + (0.03125 * time)), (0.25 + (0.03125 * time))
trans = addalpha
alpha = 256 -(32 * time), 256

[State 8013, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(random < 500, -1, 1)
vFacing = ifElse(random < 500, -1, 1)
sprPriority=3
removeTime=8
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = (0.45 - (0.05625 * Time)), (0.45 - (0.05625 * Time))
trans = AddAlpha
alpha = 192 - (24 * Time), 256

[State 8013, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8013, End]
type = DestroySelf
trigger1 = Time >= 16


;Super Hit Spark
[StateDef 8014]
type = A
physics = N
moveType = I
anim = ifelse(root,fvar(29)=-1,8010,8019+(root,fvar(29)=[1,2])*50+(root,fvar(29)=3)*60)
velSet = 0,0
sprPriority = 5

[State 8014, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 8014, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8014, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8014, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = (0.5 - (Time * 0.05)), (0.5 - (Time * 0.05))
ignorehitpause = 1

[State 8014, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignorehitpause = 1

[State 8014, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignorehitpause = 1

[State 8014, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011+(root,fvar(29)=1)*50+(root,fvar(29)=2)*40+(root,fvar(29)=3)*60
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = (0.25 + (0.015625 * Time)), (0.25 + (0.015625 * Time)) 
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012+(root,fvar(29)=[1,2])*50+(root,fvar(29)=3)*60
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = (0.25 + (0.015625 * Time)), (0.25 + (0.015625 * Time))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, P2 Back Explod (Classic)]
type = Explod
triggerall = root,fvar(29)!=3
trigger1 = !Time
anim = 8013+(root,fvar(29)=1)*50+(root,fvar(29)=2)*40+(root,fvar(29)=3)*60
ID = 3
posType = P1
facing = 1
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale P2 Back Explod (Classic)]
type = ModifyExplod
triggerall = root,fvar(29)!=3
trigger1 = NumExplod(3)
ID = 3
scale = (0.5), (0.5)
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8014, P2 Back (PotS 2022)]
type = explod
triggerall = root,fvar(29)=3
triggerall = !time
triggerall = parent, numtarget
trigger1 = numenemy = parent, numtarget
trigger2 = numenemy > parent, numtarget
trigger2 = abs(enemynear(0), pos x - enemynear(1), pos x) >= 120
anim = 8013
ID = 3
postype = p1
vfacing = ifelse(random < 500, -1, 1)
sprpriority = -3
removetime = 8
pausemovetime = -1
supermovetime = -1

[State 8014, Position (PotS 2022)]
type = modifyexplod
triggerall = root,fvar(29)=3
triggerall = numexplod(3)
trigger1 = numenemy = 1
trigger2 = numenemy >= 2 && !time
ID = 3
postype = p1
pos = ceil(p2dist x + enemynear, const(size.ground.back)), ceil(p2dist y + ifelse(p2statetype = L, 0, ifelse(p2statetype = C, 0.5, 0.75) * enemynear, const(size.head.pos.y)))

[State 8014, Scale (PotS 2022)]
type = modifyexplod
triggerall = root,fvar(29)=3
trigger1 = numexplod(3)
ID = 3
scale = (0.30 + (0.0375 * time)), (0.30 + (0.0375 * time)) 
trans = addalpha
alpha = 256 -(32 * time), 256

[State 8014, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = (0.5 - (0.0625 * Time)), (0.5 - (0.0625 * Time))
trans = AddAlpha
alpha = 256 - (32 * Time),256

[State 8014, Remove Explods]
type = RemoveExplod
trigger1 = time >= 16

[State 8014, End]
type = DestroySelf
trigger1 = Time >= 16


;Normal Slash Spark
[StateDef 8015]
type = A
physics = N
moveType = I
anim = 8015+(root,fvar(29)=3)*60
velSet = 0,0
sprPriority = 5

[State 8015, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8015, AngleSet]
type = AngleSet
trigger1 = !Time
value = 15 * (Random % 24)

[State 8015, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = ((0.5 + (Time * 0.15)) / 2), ((1 - (Time * 0.1)) / 2)
ignoreHitPause = 1

[State 8015, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8015, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8015, Streaks Explod]
type = Explod
trigger1 = !time
anim = 8012+(root,fvar(29)=3)*60
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8015, Particles]
type = Explod
trigger1 = time<8 && root,fvar(29)=1
anim = 8017+(root,fvar(29)=3)*60
ID = 17
postype = p1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -4+random%10
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1
scale = 0.15,0.15
vel = Ifelse(random<500,2+random%2,-4+random%2), -5 + (random / 90.0)
accel = -1||1,-1||1
ignorehitpause = 1

[State 8015, Scale Particles]
type = ModifyExplod
trigger1 = NumExplod(17)
ID = 17
scale = (0.2 - (0.005 * Time)), (0.2 - (0.005 * Time))
trans = AddAlpha
alpha = 256 - (16 * Time), 256
ignorehitpause = 1

[State 8015, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = (0.2 + (0.0125 * Time)), (0.2 + (0.0125 * Time))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8015, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8015, End]
type = DestroySelf
trigger1 = Time >= 16


;Special Move Slash Spark
[StateDef 8016]
type = A
physics = N
moveType = I
anim = 8015+(root,fvar(29)=[1,2])*40+(root,fvar(29)=3)*60
velSet = 0,0
sprPriority = 5

[State 8016, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8016, AngleSet]
type = AngleSet
trigger1 = !Time
value = 15 * (Random % 24)

[State 8016, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = ((0.5 + (Time * 0.15)) / 2), ((1 - (Time * 0.1)) / 2)
ignoreHitPause = 1

[State 8016, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8016, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8016, Circle]
type = Explod
trigger1 = !Time
anim = 8016+(root,fvar(29)=[1,2])*40+(root,fvar(29)=3)*60
ID = 8016
posType = p1
removeTime = 10
sprPriority = 5
pauseMoveTime = -1
superMoveTime = -1

[State 8016, Circle Scale]
type = ModifyExplod
trigger1 = NumExplod(8016)
ID = 8016
scale = (0.25 + (0.025 * Time)), (0.25 + (0.025 * Time))
trans = AddAlpha
alpha = ceil(256 - 25.6 * Time), 256

[State 8016, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012+(root,fvar(29)=[1,2])*40+(root,fvar(29)=3)*60
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8016, Particles]
type = Explod
trigger1 = time<8 && root,fvar(29)=1
anim = 8017+(root,fvar(29)=[1,2])*40+(root,fvar(29)=3)*60
ID = 17
postype = p1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -4+random%10
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1
scale = 0.15,0.15
vel = Ifelse(random<500,2+random%2,-4+random%2), -5 + (random / 90.0)
accel = -1||1,-1||1
ignorehitpause = 1

[State 8016, Scale Particles]
type = ModifyExplod
trigger1 = NumExplod(17)
ID = 17
scale = (0.225 - (0.005 * Time)), (0.225 - (0.005 * Time))
trans = AddAlpha
alpha = 256 - (16 * Time), 256
ignorehitpause = 1

[State 8016, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = (0.225 + (0.0140625 * Time)), (0.225 + (0.0140625 * Time))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8016, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8016, End]
type = DestroySelf
trigger1 = Time >= 16


;Super Move Slash Spark
[StateDef 8017]
type = A
physics = N
moveType = I
anim = 8015+(root,fvar(29)=[1,2])*50+(root,fvar(29)=3)*60
velSet = 0,0
sprPriority = 5

[State 8017, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8017, AngleSet]
type = AngleSet
trigger1 = !Time
value = 15 * (Random % 24)

[State 8017, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = ((0.5 + (Time * 0.15)) / 2), ((1 - (Time * 0.1)) / 2)
ignoreHitPause = 1

[State 8017, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8017, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8017, Circle]
type = Explod
trigger1 = !Time
anim = 8016+(root,fvar(29)=1)*50+(root,fvar(29)=2)*40+(root,fvar(29)=3)*60
ID = 8016
posType = p1
removeTime = 10
sprPriority = 5
pauseMoveTime = -1
superMoveTime = -1

[State 8017, Circle Scale]
type = ModifyExplod
trigger1 = NumExplod(8016)
ID = 8016
scale = (0.3 + (0.03 * Time)), (0.3 + (0.03 * Time))
trans = AddAlpha
alpha = ceil(256 - 25.6 * Time), 256

[State 8017, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012+(root,fvar(29)=1)*50+(root,fvar(29)=2)*40+(root,fvar(29)=3)*60
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8017, Particles]
type = Explod
trigger1 = time<10 && root,fvar(29)=1
anim = 8017+(root,fvar(29)=[1,2])*50+(root,fvar(29)=3)*60
ID = 17
postype = p1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -4+random%10
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1
scale = 0.15,0.15
vel = Ifelse(random<500,2+random%2,-4+random%2), -5 + (random / 90.0)
accel = -1||1,-1||1
ignorehitpause = 1

[State 8017, Scale Particles]
type = ModifyExplod
trigger1 = NumExplod(17)
ID = 17
scale = (0.25 - (0.005 * Time)), (0.25 - (0.005 * Time))
trans = AddAlpha
alpha = 256 - (16 * Time), 256
ignorehitpause = 1

[State 8017, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = (0.25 + (0.015625 * Time)), (0.25 + (0.015625 * Time))
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8017, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8017, End]
type = DestroySelf
trigger1 = Time >= 16


;Reversal Spark
[StateDef 8020]
type = A
physics = N
moveType = I
anim = 8020
velSet = 0,0
sprPriority = 5

[State 8020, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8020, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.09375 * Time), 0.25 + (0.09375 * Time)
ignoreHitPause = 1

[State 8020, Transparency]
type = Trans
trigger1 = Time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8020, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8020, End]
type = DestroySelf
trigger1 = Time >= 8



;Jump dust
[Statedef 8100]
type = S
anim = 1
velset = 0, 0

[State 8100, Bind]
type = bindtoroot
trigger1 = time

[State 8100, Dust]
type = explod
trigger1 = !time
anim = 8100
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8100, Dust]
type = explod
trigger1 = !time || time = 2 || time = 6
anim = 8101
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8100, End]
type = destroyself
trigger1 = time >= 7


;Dash dust
[Statedef 8103]
type = A
anim = 1
velset = 0, 0
sprpriority = 5

[State 8103, Pos]
type = posset
trigger1 = !time = 0
y = 0

[State 8103, Dust]
type = explod
trigger1 = time = 0 || time = 3 || time = 6
anim = 8103
ID = ifelse((time = 6), 3, ifelse((time = 3), 2, 1))
postype = p1
pos = 0, -4
random = 8, 8
vel = -3 -(random / 1000.0), -2 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
sprpriority = 3
pausemovetime = -1
supermovetime = -1

[State 8103, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.1 + (0.025 * time), 0.1 + (0.025 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8103, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.1 + (0.025 * (time -3)), 0.1 + (0.025 * (time -3))
trans = addalpha
alpha = 256 -(16 * (time -3)), 256

[State 8103, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 0.1 + (0.025 * (time -6)), 0.1 + (0.025 * (time -6))
trans = addalpha
alpha = 256 -(16 * (time -6)), 256

[State 8103, End]
type = removeexplod
trigger1 = time >= 22

[State 8103, End]
type = destroyself
trigger1 = !numexplod

;-----------------------------------
;Ground Impact 
[Statedef 8110]
type = A
anim = 1
velset = 0, 0
sprpriority = 5

[State 8110, FX]
type = explod
trigger1 = !time
anim = 8110
ID = ifelse(time = 8, 3, ifelse(time = 4, 2, 1))
postype = p1
removetime = 8
sprpriority = -4
pausemovetime = -1
supermovetime = -1

[State 8110, FX]
type = explod
trigger1 = !time
anim = 8120
ID = 2
postype = p1
removetime = 8
sprpriority = -4
pausemovetime = -1
supermovetime = -1

[State 8110, Scale]
type = modifyexplod
trigger1 = 1
scale = 0.25 + (0.03125 * time), 0.25 + (0.03125 * time)
trans = addalpha
alpha = ifelse(time < 4, 256, 256 -(64 * (time -4))), 256

[State 8110, End]
type = removeexplod
trigger1 = time >= 8

[State 8110, End]
type = destroyself
trigger1 = !numexplod

;WALL IMPACT DUST
[StateDef 8111]
type = A
anim = 1
velSet = 0,0
sprPriority = 5

[State 8111, Impact Dust Explod 1]
type = Explod
trigger1 = !Time
anim = 8111
ID = ifElse(Time = 8, 3, ifElse(Time = 4, 2, 1))
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8111, Impact Dust Explod 2]
type = Explod
trigger1 = !Time
anim = 8121
ID = 2
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8111, Scale]
type = ModifyExplod
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 256, 256 - (64 * (Time - 4))), 256

[State 8111, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 8

[State 8111, End]
type = DestroySelf
trigger1 = !NumExplod

;FLAMES
[Statedef 8150]
type = A
velset = 0, 0
anim = 1

[State 8150, player]
type = varset
trigger1 = !time
var(0) = parent, var(43)

[State 8150, Pos]
type = posset
trigger1 = playerIDexist(var(0))
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) + (playerID(var(0)), const(size.mid.pos.y))

[State 8150, Pos]
type = posset
trigger1 = playerIDexist(var(0))
trigger1 = playerID(var(0)), statetype = L
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) - 20

[State 8150, facing]
type = turn
trigger1 = playerIDexist(var(0))
trigger1 = facing != (playerID(var(0)), facing)

[State 8150, flames]
type = explod
trigger1 = playerIDexist(var(0))
anim = 8150
sprpriority = 3
postype = p1
random = 40, 40
vel = (random / 2000.0), -.5 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 8150, flames]
type = explod
trigger1 = playerIDexist(var(0))
anim = 8150
sprpriority = 3
postype = p1
random = 60, 60
vel = (random / 2000.0), -.5 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 8150, End]
type = destroyself
trigger1 = time >= 600
trigger2 = !playerIDexist(var(0))

[State 8150, End]
type = destroyself
triggerall = playerIDexist(var(0))
trigger1 = playerID(var(0)), ctrl
trigger2 = playerID(var(0)), movetype != H || playerID(var(0)), stateno = 5300
trigger3 = playerID(var(0)), statetype = L && (playerID(var(0)), stateno != [5080, 5081])

;RECOVER FX
[Statedef 8200]
type = A
velset = 0, 0
anim = 8200
sprpriority = 5

[State 8200, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8200, Scale]
type = angledraw
trigger1 = 1
scale = 0.25 + (0.017 * time), 0.25 + (0.017 * time)
ignoreHitPause = 1

[State 8200, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 -17.1 * time), 256
ignoreHitPause = 1

[State 8200, End]
type = destroyself
trigger1 = time >= 15

;RAGE MODE FX
[Statedef 8250]
type = A
velset = 0, 0
anim = 1
sprpriority = 5

[State ACTIVATEsnd]
type = PlaySnd
trigger1 = !time
value = S5200,1
channel = -1
ignorehitpause = 1

[State 8330, Dust]
type = explod
trigger1 = !time
anim = 8105
sprpriority = -3
postype = p1
pos = 0, -ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1
ignorehitpause = 1

[State 8250, Explod]
type = Explod
trigger1 = time%3 = [0,12]
anim = 8250
ID = 1
pos = 0,-40
postype = p1  ;p2,front,back,left,right
facing = 1
bindtime = 1
removetime = 30
scale = 2,2
ontop = 0
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 8200, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8200, Scale]
type = modifyExplod
trigger1 = 1
ID = 1
scale = 0.25 + (0.2 * time), 0.25 + (0.2 * time)
trans = addalpha
alpha = ceil(256-17.1*time),256
ignoreHitPause = 1

[State end]
type = destroyself
trigger1 = roundstate !=2
trigger2 = root,var(41)=0


;COUNTER FX
[Statedef 8290]
type = A
physics = N
velset = 0, 0
anim = 1

[State 8290, Circle]
type = explod
trigger1 = !numexplod(8290)
anim = 8290
ID = 8290
sprpriority = 64
postype = p1
facing = facing
removetime = 32
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8290, Scale]
type = modifyexplod
trigger1 = time < 8
ID = 8290
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 0

[State 8290, Scale]
type = modifyexplod
trigger1 = time >= 8
ID = 8290
scale = 0.5 + .0625 * (time -8), 0.5 + .0625 * (time -8)
trans = addalpha
alpha = 256 -32 * (time -8), 32 * (time -8)

[State 8290, Safety]
type = removeexplod
trigger1 = time >= 16

[State 8290, End]
type = destroyself
trigger1 = time >= 16

;MAX MODE TEXT FX
[StateDef 8291]
type = A
physics = N
velSet = 0,0
anim = 1

[State 8291, "Power Up!" Text Explod]
type = Explod
trigger1 = !NumExplod(8291)
anim = 8291
ID = 8291
sprPriority = 64
posType = P1
facing = Facing
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 8291, Scale]
type = ModifyExplod
trigger1 = Time < 8
ID = 8291
scale = 0.5, .5
trans = AddAlpha
alpha = 256,0

[State 8291, Scale]
type = ModifyExplod
trigger1 = Time >= 8
ID = 8291
scale = 0.5 + 0.0625 * (Time - 8), 0.5 + 0.0625 * (Time - 8)
trans = AddAlpha
alpha = 256 - 32 * (Time - 8), 32 * (Time - 8)

[State 8291, Safety]
type = RemoveExplod
trigger1 = Time >= 16

[State 8291, End]
type = DestroySelf
trigger1 = Time >= 16

;POWER CHARGE MAIN FX 
[Statedef 8330]
type = A
physics = N
movetype = I
anim = 1
ctrl = 0
velset = 0, 0

[State 8330, Bind]
type = bindtoroot
trigger1 = (root, stateno = 730)
pos = 0,0

[State 8330, Snd]
type = playsnd
trigger1 = !time
value = 730,0
channel = 0

[State 8330, Aura]
type = explod
trigger1 = !numexplod(8330)
ID = 8330
anim = 8330
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8330, Dust]
type = explod
trigger1 = !(time % 6)
anim = 8105
sprpriority = -3
postype = p1
pos = 0, -ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8330, FX]
type = modifyexplod
trigger1 = numexplod(8330) && root, power < 3000
ID = 8330
scale = 0.5, 0.1 + 0.4 * (root, power / 3000.0)

[State 8330, FX]
type = modifyexplod
trigger1 = numexplod(8330) && root, power >= 3000
ID = 8330
scale = 0.5, 0.5

[State 8330, End]
type = stopsnd
trigger1 = root, stateno != 730
channel = 0

[State 8330, End]
type = removeexplod
trigger1 = root, stateno != 730

[State 8330, End]
type = destroyself
trigger1 = root, stateno != 730


;POWER CHARGE Particles 
[Statedef 8331]
type = A
physics = N
movetype = I
anim = 1
ctrl = 0
velset = 0, 0

[State 8331, Bind]
type=bindtoroot
trigger1= !(time%8)
pos=ceil(-153+(random/3.125)),ceil(82-(random/3.125))

[State 8331, Particle]
type=explod
trigger1= (time%8)=1
anim=8331
sprpriority=ifelse(random<750,5,-1)
postype=p1
vel= ((rootdist x+1)/32.0), ((rootdist y-75)/32.0)
scale= ifelse(random<500,.5,-.5), ifelse(random<500,.5,-.5)
pausemovetime=-1
supermovetime=-1
ownpal=1

[State 8331, End]
type = removeexplod
trigger1 = root, stateno != 730

[State 8331, End]
type = destroyself
trigger1 = root, stateno != 730


;ZERO COUNTER PAUSE
[Statedef 8350]
type = A
physics = N
movetype = I
anim = 1
ctrl = 0
velset = 0, 0

[State 8350, BG PalFX]
type = bgpalfx
trigger1 = 1
time = 1
color = 16 * time
mul = 16 * time, 16 * time, 16 * time

[State 8350, Circle]
type = explod
trigger1 = !time
anim = 8350
ID = 1
sprpriority = 3
postype = p1
removetime = 16
supermovetime = -1
ownpal = 1

[State 8350, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = (0.0625 * time), (0.0625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8350, Lightning]
type = explod
trigger1 = !time
anim = 8351
ID = 2
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
supermovetime = -1
ownpal = 1

[State 8350, End]
type = destroyself
trigger1 = time >= 16


;CUSTOM COMBO
[Statedef 8400]
type = A
physics = N
movetype = I
anim = 8400
ctrl = 0
velset = 0, 0
sprpriority = 5

[State 8400, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8400, BG PalFX]
type = bgpalfx
trigger1 = time < 25
time = 1
mul = 128, 128, 128

[State 8400, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8400, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8400, Scale]
type = angledraw
trigger1 = time < 8
scale = (0.0625 * time), (0.0625 * time)
ignoreHitPause = 1

[State 8400, Scale]
type = angledraw
trigger1 = time >= 8
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8400, Trans]
type = trans
trigger1 = time < 16
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8400, Trans]
type = trans
trigger1 = time >= 16
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256
ignoreHitPause = 1

[State 8400, Lines]
type = explod
trigger1 = !time
anim = 8401
ID = 1
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8400, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 2 -(0.125 * time), 2 -(0.125 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8400, Circle]
type = explod
trigger1 = time = 16
anim = 8402
ID = 2
sprpriority = 5
postype = p1
removetime = 32
supermovetime = -1

[State 8400, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = (0.1 * (time -16)), (0.1 * (time -16))
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256

[State 8400, Safety]
type = removeexplod
trigger1 = time >= 26

[State 8400, End]
type = destroyself
trigger1 = time >= 26


;========================< SUPERPAUSE FX >=============================
;--- --Level 1 -----
[Statedef 8500]
type = A
velset = 0, 0
anim = 8500
sprpriority = 5

[State 8500, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8500, BG PalFX]
type = bgpalfx
trigger1 = time < 39
time = 1
color = 0
mul = 0, 0, 256

[State 8500, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8500, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8500, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 8500, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8500, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8500, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8501
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8500, Circle]
type = explod
trigger1 = time = 24
anim = 8502
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8500, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8500, End]
type = destroyself
trigger1 = time >= 40


;--- --Level 2 -----
[Statedef 8510]
type = A
velset = 0, 0
anim = 8510
sprpriority = 5

[State 8510, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8510, BG PalFX]
type = bgpalfx
trigger1 = time < 39
time = 1
color = 0
mul = 192, 0, 256

[State 8510, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8510, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8510, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 8510, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8510, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8510, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8511
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8510, Circle]
type = explod
trigger1 = time = 24
anim = 8512
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8510, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8510, End]
type = destroyself
trigger1 = time >= 40


;--- --Level 3 -----
[Statedef 8520]
type = A
velset = 0, 0
anim = 8520
sprpriority = 5

[State 8520, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8520, Assert]
type = assertspecial
trigger1 = time < 40
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 8520, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8520, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8520, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 8520, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8520, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8520, Portrait]
type = explod
trigger1 = !time
anim = 8525
ID = 20
sprpriority = -16
postype = back
removetime = 40
supermovetime = -1

[State 8520, Portrait]
type = explod
trigger1 = !time
anim = 8525
ID = 21
sprpriority = -16
postype = back
removetime = 40
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && time < 16
ID = 20
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 1 - (0.03125 * time), 1 - (0.03125 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time < 16
ID = 21
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 2 - (0.09375 * time), 2 - (0.09375 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && (time = [16, 32])
ID = 20
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 256

[State 8520, Scale Portrait 2b]
type = ModifyExplod
trigger1 = NumExplod(21) && (Time = [16,32])
ID = 21
scale = 0,0

[State 8520, Scale Portrait 1c]
type = ModifyExplod
trigger1 = NumExplod(20) && Time >= 32
ID = 20
posType = Back
pos = 160 + (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Scale Portrait 2c]
type = ModifyExplod
trigger1 = NumExplod(21) && Time >= 32
ID = 21
posType = Back
pos = 160 - (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8521
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8520, Circle]
type = explod
trigger1 = time = 24
anim = 8522
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8520, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8520, End]
type = destroyself
trigger1 = time >= 40


;SUPER FINISH
[Statedef 8600]
type = A
velset = 0, 0
anim = 1

[State 8600, Sound]
type = playsnd
trigger1 = !time
value = 8600,0
channel = 1

[State 8600, Snd]
type = sndpan
trigger1 = time <= 80
channel = 1
abspan = ceil(sin(gametime / 20.0 * pi) * 160)

[State 8600, BG PalFX]
type = bgpalfx
trigger1 = time < 16
time = 1
mul = 0, 0, 0

[State 8600, BG PalFX]
type = bgpalfx
trigger1 = time = [16, 24)
time = 1
mul = 32 * (time -16), 32 * (time -16), 32 * (time -16)

[State 8600, Move Name: Custom Combo]
type = varset
trigger1 = !time && root, var(23) = 900
var(0) = 1

[State 8600, Move Name: Bravest Warrior]
type = varset
trigger1 = !time && (root, var(23) = [3000, 3099])
var(0) = 2

[State 8600, Move Name: Rising Swordsman]
type = varset
trigger1 = !time && (root, var(23) = [3100, 3199])
var(0) = 3

[State 8600, Move Name: Giant Jake]
type = varset
trigger1 = !time && (root, var(23) = [3200, 3249])
var(0) = 4

[State 8600, Move Name: Arithmetic Blaster]
type = varset
trigger1 = !time && (root, var(23) = [3250, 3299])
var(0) = 5

[State 8600, Move Name: The Finnale]
type = varset
trigger1 = !time && Root, StateNo=3501;(root, var(23) = [3252, 3299])
var(0) = 6

[State 8600, MvC]
type = explod
trigger1 = !time
anim = 8600
ID = 8600
ontop = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 32
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(8600)
ID = 8600
trans = addalpha
alpha = ifelse(time < 16, 256, 256 -32 * (time -16)), 256

[State 8600, Text]
type = explod
trigger1 = !time && var(0)
anim = 8610 + var(0)
ID = 10
ontop = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 32
pausemovetime = -1
supermovetime = -1

[State 8600, Text]
type = explod
trigger1 = !time && var(0)
anim = 8610 + var(0)
ID = 11
ontop = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 8
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
trans = addalpha
alpha = ifelse(time < 16, 256, 256 -32 * (time -16)), ifelse(time < 16, 0, 32 * (time -16))

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(11)
ID = 11
scale = 0.5 + (0.0625 * time), 0.5 + (0.0625 * time)
trans = addalpha
alpha = 256 - (32 * time), 32 * time

[State 8600, Circle]
type = explod
trigger1 = !time
anim = 8601
ID = 8601
under = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
bindtime = -1
removetime = 16
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(8601)
ID = 8601
scale = (0.25 * time) * (1.3333333 * gameheight / gamewidth), (0.25 * time) * (1.3333333 * gameheight / gamewidth)
trans = addalpha
alpha = 256 - (16 * time), 256

[State 8600, Assert]
type = assertspecial
trigger1 = time < 16
flag = noFG

[State 8600, Assert]
type = assertspecial
trigger1 = time < 24
flag = nobardisplay

[State 8600, End]
type = removeexplod
trigger1 = time >= 24
trigger2 = roundstate < 3

[State 8600, End]
type = destroyself
trigger1 = roundstate < 3

;CAMERA CONTROL
[Statedef 8999]
type = S
velset = 0, 0
anim = 1

[State 8999, bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1
ignoreHitPause = 1

[State 8999, End]
type = destroyself
trigger1 = roundstate = 2