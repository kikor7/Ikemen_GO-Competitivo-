;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;Courage's Helpers;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;-------------------------------------------------------------------------------
; Assist Eustace
[StateDef 6000]
type = S
movetype = A
physics = S
juggle = 0
anim = 6000
ctrl = 0

[State 6000, Helper]
type = Helper
trigger1 = time = 15
ID = 6001
pos = -55,0
postype = back
stateno = 6001
helpertype = normal
name = "Eustace"
keyctrl = 0
ownpal = 1
supermovetime = 1
size.xscale = 0.6
size.yscale = 0.6

[State 6000, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = 0

[State 6000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S6000,0

[State 6000, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 6000, End2]
type = ChangeState
trigger1 = AnimTime = 0
trigger1 = P2BodyDist X > 100
value = 1

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
; Assist Shirley
[StateDef 6100]
type = S
movetype = A
physics = S
juggle = 0
anim = 3150
ctrl = 0

[State 3100, Hyper Portrait]
type = Explod
trigger1 = time = 0
anim = 3999
pos = 0,0
postype = back
facing = 1
bindtime = 1
removetime = 40
supermovetime = 30
sprpriority = 0
ontop = 0
ownpal = 1
scale = 0.5,0.5

[State 3200, SuperPause]
type = SuperPause
trigger1 = time = 5
time = 30
anim = 102
sound = S20,0
pos = 0,-46
move = 0
darken = 1
p2defmul = 0
poweradd = -2000
unhittable = 1
movetime = 30

[State 3200, Explod]
type = Explod
trigger1 = time = 0
anim = 4052
ID = 4052
pos = 0,0
postype = left
facing = 1
bindtime = -1
removetime = -2
sprpriority = -7
ownpal = 1
supermovetime = 70
removeongethit = 1

[State 3100, Text]
type = Explod
trigger1 = WinKO = 1
trigger1 = facing = 1
anim = 33199
ID = 33999
bindtime = -1
pos = 154,107
scale = 0.6,0.6
postype = left
facing = 1
vfacing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause = 1

[State 3200, Explod]
type = Explod
trigger1 = time = 0
anim = 4052
ID = 4052
pos = 0,0
postype = left
facing = 1
bindtime = -1
removetime = 120
sprpriority = -7
ownpal = 1
supermovetime = 70
removeongethit = 1

[State 6000, Helper]
type = Helper
trigger1 = time = 15
ID = 6001
pos = 50,0
postype = p1
stateno = 6102
helpertype = normal
name = "Shirley"
keyctrl = 0
ownpal = 1
supermovetime = 1
;size.xscale = 0.6
;size.yscale = 0.6

[State 6000, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = 0

[State 3200, Hyper Background]
type = Explod
trigger1 = time = 100
id = 750
anim = 750
pos = 0,0
postype = back
sprpriority = -3
removeongethit = 1
removetime = 390
bindtime = -1
supermove = 1
ownpal = 1
removeongethit = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S196,2

[State 6000, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 6000, End2]
type = ChangeState
trigger1 = AnimTime = 0
trigger1 = P2BodyDist X > 100
value = 1

;-------------------------------------------------------------------------------
; Eustace Walks In
[Statedef 6001]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 6001

[State 6001, PlaySnd2]
type = PlaySnd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 7
value = S6000,3
volume = 200
channel = 0

[State 6001, 1]
type = HitOverride
trigger1 = Time = 0
attr = SCA, AA, AP, AT
stateno = 6003
time = -1

[State 6001, 3]
type = SprPriority
trigger1 = Time = 0
value = 2

[State 6001, 2]
type = VelAdd
trigger1 = time = 0
x = 3

[State 6001, Win]
type = changestate
triggerall = time >= 24
trigger1 = Win
trigger2 = RoundState = 4
value = 6005
ctrl = 0

[State 6004, Lose]
type = changestate
triggerall = time >= 24
trigger1 = Lose
trigger2 = RoundState = 4
value = 6006
ctrl = 0

[State 6001, 3]
type = ChangeState
Trigger1 = time = 40
value = 6002
ctrl = 0

;-------------------------------------------------------------------------------
; Eustace's Mask
[Statedef 6002]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 6002
ctrl = 0

[State 6002, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = S6000,2

[State 1651, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000,2

[State 6002, 1]
type = HitOverride
trigger1 = Time = 0
attr = SCA, AA, AP, AT
stateno = 6003
time = -1

[State 3200, Dust]
type = explod
trigger1 = AnimElem = 4
anim = 3211
sprpriority = 2
postype = p1
pos = -15, -ceil(pos y)
ownpal = 1

[State 6202, EnvShake]
type = EnvShake
trigger1 = AnimElem = 4
time = 35
freq = 60
ampl = -4
phase = 70

[State 0, StopSnd]
type = StopSnd
trigger1 = AnimElem = 29
channel = -1

[State 3666, 2]
type = HitDef
trigger1 = AnimElem = 4
attr = S, SA
animtype  = Hard
damage    = 55, 2
getpower  = 0
priority  = 5
guardflag = MA
pausetime = 20,20
sparkno = -1
sparkxy = 0,-65
hitsound   = -1
guardsound = 6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 20
ground.velocity = -1
air.velocity = -2.2,-3.2
palfx.time = 60
Palfx.add = 20,20,20 
Palfx.sinadd = 140,140,140,0
Palfx.color = 100 
p2facing = 1
p2stateno = 305

[State 6202, 1]
type = HitDef
trigger1 = AnimElem = 28
attr = S, NA			;Attribute: Standing, Normal Attack
damage = 25,7			;Damage that move inflicts, guard damage
animtype = Hard			;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA			;Flags on how move is to be guarded against
hitflag = MAF			;Flags of conditions that move can hit
pausetime = 8, 4			;Time attacker pauses, time opponent shakes
sparkno = -1
sparkxy = -18,-26		;X-offset for the "hit spark" rel. to p2,
ground.type = High		;Type: High, Low, Trip (def: Normal)
ground.slidetime = 15		;Time that the opponent slides back
ground.hittime  = 35		;Time opponent is in hit state
ground.velocity = -6.5,-2		;Velocity at which opponent is pushed
airguard.velocity = -1.9,-.8	;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High			;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -6.7,-5		;X-velocity at which opponent is pushed,
air.hittime = 12
fall = 1
air.fall = 1

[State 6002, Win]
type = ChangeState
triggerall = time >= 24
trigger1 = Win
trigger2 = RoundState = 4
value = 6005
ctrl = 0

[State 6002, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 6004

;-------------------------------------------------------------------------------
; Eustace Hit
[Statedef 6003]
type    = A
movetype= I
physics = N
velset = -17,0
anim = 6003

[State 6003, Dust]
type = Explod
trigger1 = !time
anim = 7103
ID = 7103
sprpriority = -2
postype = p1
scale = 0.6,0.6
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 6003, 1]
type = SprPriority
trigger1 = Time = 0
value = -1

[State 6003, PlaySnd]
type = PlaySnd
trigger1 = time = 2
value = S6000,5

[State 6003, 2]
type = DestroySelf
trigger1 = time = 50

;-------------------------------------------------------------------------------
; Eustace Leaves
[Statedef 6004]
type    = A
movetype= I
physics = N
velset = 0,0
anim = 6006

[State 6004, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 7
value = S6000,3
volume = 200
channel = 0

[State 6004, 1]
type = SprPriority
trigger1 = Time = 0
value = -1

[State 6004, ScreenBound]
type = ScreenBound
trigger1 = time = 0
value = 1
movecamera = 0,0

[State 6004, Win]
type = changestate
triggerall = time >= 24
trigger1 = Win
trigger2 = RoundState = 4
value = 6005
ctrl = 0

[State 6004, Lose]
type = changestate
triggerall = time >= 24
trigger1 = Lose
trigger2 = RoundState = 4
value = 6006
ctrl = 0

[State 6004, ScreenBound]
type = ScreenBound
trigger1 = time = 0
value = 1
movecamera = 0,0

[State 6004, 2]
type = VelSet
trigger1 = time = 0
x = -3

[State 6004, 3]
type = DestroySelf
trigger1 = Time = 120

;-------------------------------------------------------------------------------
;Eustace's Win pose
[Statedef 6005]
type = S
anim = 6004
velset = 0,0
ctrl = 0

[State 6005, PlaySnd]
type = PlaySnd
trigger1 = time = 2
value = S6000,4

[State 6005, 1]
type = VelSet
trigger1 = time >= 0
x = 0
y = 0
;-------------------------------------------------------------------------------
;Eustace's Lose pose
[Statedef 6006]
type = S
anim = 6005
velset = 0,0
ctrl = 0

[State 6005, PlaySnd]
type = PlaySnd
trigger1 = time = 2
value = S6000,6

[State 6005, 1]
type = VelSet
trigger1 = time >= 0
x = 0
y = 0
;--------------------------------; 9108106 ----------------------
[StateDef 305]
type     = S
movetype = H
physics  = S
ctrl     = 0
velset   = -5,0

[State 305]
type = ChangeAnim2
trigger1 = time = 1
value = 5001

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S194,0

[State 305]
type = ChangeState
triggerall = SelfAnimExist(9108106) = 1
;triggerall = time > 5
trigger1 = Vel X >= 0
value = 835

[State 305]
type = SelfState
trigger1 = time >= 30
value = 5000

;==========================================================================

[Statedef 835]
type     = S
movetype = H
physics  = S
ctrl     = 0
anim     = 9108106
velset   = 0,0

[State 835]
type = PosSet
trigger1 = 1
y = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S194,0

[State 835]
type = SelfState
trigger1 = time >= 30
value = 5000
;;-------------------------------------------------------------------------------
[Statedef 1422]
type=A
physics=N
ctrl=0
anim=ifelse(ishelper(1422),9950,9951)
sprpriority=ifelse(ishelper(1422),0,4)

[State ]
type=posset
trigger1=ishelper(1422)&&facing=-1&&(time=[21,32])
x=enemynear,pos x+ifelse(time=21,120,ifelse(time=22,110,ifelse(time=23,100,ifelse(time=24,90,ifelse(time=25,80,ifelse(time=26,70,ifelse(time=27,60,ifelse(time=28,50,ifelse(time=29,40,ifelse(time=30,30,ifelse(time=31,20,15)))))))))))
y=enemynear,pos y-ifelse(time=21,25,ifelse(time=22,30,ifelse(time=23,35,ifelse(time=24,40,ifelse(time=25,45,ifelse(time=26,55,ifelse(time=27||time=32,60,ifelse(time=29,67,ifelse(time=31,63,65)))))))))

[State ]
type=posset
trigger1=ishelper(1422)&&facing=1&&(time=[21,32])
x=enemynear,pos x-ifelse(time=21,120,ifelse(time=22,110,ifelse(time=23,100,ifelse(time=24,90,ifelse(time=25,80,ifelse(time=26,70,ifelse(time=27,60,ifelse(time=28,50,ifelse(time=29,40,ifelse(time=30,30,ifelse(time=31,20,15)))))))))))
y=enemynear,pos y-ifelse(time=21,25,ifelse(time=22,30,ifelse(time=23,35,ifelse(time=24,40,ifelse(time=25,45,ifelse(time=26,55,ifelse(time=27||time=32,60,ifelse(time=29,67,ifelse(time=31,63,65)))))))))

[State ]
type=posset
trigger1=ishelper(1422)&&facing=-1&&(time=42||(time=[44,50])||time=52||time=54||(time=[56,60]))
x=enemynear,pos x+ifelse(time=42||time=52,27,ifelse(time=44||time=50,-5,ifelse((time=[45,49]),-20,ifelse(time=54,52,ifelse(time=56,20,ifelse(time=57,16,ifelse(time=58,12,ifelse(time=59,8,ifelse(time=60,6,0)))))))))
y=enemynear,pos y+ifelse(time=42||time=52,-55,ifelse(time=44||time=50,-60,ifelse(time=45||time=48||time=60,-10,ifelse(time=46||time=59,-5,ifelse(time=49,-15,ifelse(time=54,-25,ifelse(time=56,10,ifelse(time=57,5,ifelse(time=31,63,0)))))))))

[State ]
type=posset
trigger1=ishelper(1422)&&facing=1&&(time=42||(time=[44,50])||time=52||time=54||(time=[56,60]))
x=enemynear,pos x+ifelse(time=42||time=52,-27,ifelse(time=44||time=50,5,ifelse((time=[45,49]),20,ifelse(time=54,-52,ifelse(time=56,-20,ifelse(time=57,-16,ifelse(time=58,-12,ifelse(time=59,-8,ifelse(time=60,-6,0)))))))))
y=enemynear,pos y+ifelse(time=42||time=52,-55,ifelse(time=44||time=50,-60,ifelse(time=45||time=48||time=60,-10,ifelse(time=46||time=59,-5,ifelse(time=49,-15,ifelse(time=54,-25,ifelse(time=56,10,ifelse(time=57,5,ifelse(time=31,63,0)))))))))

[State ]
type=posset
trigger1=ishelper(1422)&&facing=-1&&(time=62||(time=[86,97]))
x=enemynear,pos x+ifelse(time=97,25,-20)
y=enemynear,pos y-ifelse(time=62,25,ifelse(time=97,55,60))

[State ]
type=posset
trigger1=ishelper(1422)&&facing=1&&(time=62||(time=[86,97]))
x=enemynear,pos x+ifelse(time=97,-25,20)
y=enemynear,pos y-ifelse(time=62,25,ifelse(time=97,55,60))

[State ]
type=SprPriority
trigger1=ishelper(1422)&&(time=29||time=42||time=54||time=62)
value=ifelse(time=29||time=54,5,3)

[State ]
type=VelSet
trigger1=ishelper(1422)&&(time=63||time=86||(time>=100&&pos y>0))
x=ifelse(time=63,-3,ifelse(time=86,0,-4))
y=ifelse(time=63,-9.5,ifelse(time=86,0,-10))

[State ]
type=VelSet
trigger1=ishelper(1422)&&time=98
y=10

[State ]
type=VelAdd
trigger1=ishelper(1422)&&((time=[63, 85])||(time=[120,130]))
y=ifelse((time=[63,85]),0.25,2)

[State ]
type=VelSet
trigger1=ishelper(1423)&&(time=0||time=20||time=84||(time=[105,106]))
x=ifelse(time=0,3.2,ifelse(time=106,0.5,0))
y=ifelse(time=0,-4.5,ifelse(time=20||time=105,0,ifelse(time=84,8.5,-3.1)))

[State ]
type=VelAdd
trigger1=ishelper(1423)&&(time=[1,19])
y=.44

[State ]
type=turn
trigger1=ishelper(1423)&&time=20

[State ]
type=posset
trigger1=ishelper(1423)&&facing=1&&(time=20||time=26||time=29||time=32||time=35||time=38||time=41||time=44||time=47||time=49||time=51||(time=[53,84]))
x=enemynear,pos x+ifelse(time=20||time=41,26,ifelse(time=26||time=38,-3,ifelse(time=44,64,ifelse(time=47,36,ifelse(time=49,23,ifelse(time=51,11,ifelse((time=[53,83]),-15,ifelse(time=84,42,-19))))))))
y=enemynear,pos y-ifelse(time=20||time=41,70,ifelse(time=26||time=38,80,ifelse(time=32,16,ifelse(time=35,33,ifelse(time=44,38,ifelse(time=49,14,ifelse(time=51,25,ifelse((time=[53,83]),60,ifelse(time=84,69,10)))))))))

[State ]
type=posset
trigger1=ishelper(1423)&&facing=-1&&(time=20||time=26||time=29||time=32||time=35||time=38||time=41||time=44||time=47||time=49||time=51||(time=[53,84]))
x=enemynear,pos x+ifelse(time=20||time=41,-26,ifelse(time=26||time=38,3,ifelse(time=44,-64,ifelse(time=47,-36,ifelse(time=49,-23,ifelse(time=51,-11,ifelse((time=[53,83]),15,ifelse(time=84,-42,19))))))))
y=enemynear,pos y-ifelse(time=20||time=41,70,ifelse(time=26||time=38,80,ifelse(time=32,16,ifelse(time=35,33,ifelse(time=44,38,ifelse(time=49,14,ifelse(time=51,25,ifelse((time=[53,83]),60,ifelse(time=84,69,10)))))))))

[State ]
type=SprPriority
trigger1=ishelper(1423)&&(time=26||time=47||time=84)
value=ifelse(time=47,4,2)

[State ]
type=DestroySelf
trigger1=(ishelper(1422)&&AnimTime=0)||(ishelper(1423)&&time=126)

;?}???IKO????X?e?[?g?i?w???p?[?j
[Statedef 19311]
type=A
movetype=H
physics=N
ctrl=0
anim=19311
sprpriority=3

[State ]
type=PlaySnd
trigger1=time=0
value=s19311,0
abspan=0

[State ]
type=angledraw
trigger1=1
scale=4,4

[State ]
type=AssertSpecial
trigger1=time<=163
flag=noshadow
flag2=nomusic
flag3=roundnotover

[State ]
type=AssertSpecial
trigger1=time>=164
flag=noshadow

[State ]
type=VelSet
trigger1=time=17
y=-7

[State ]
type=VelAdd
trigger1=time>=17
y=.34

;???b?N?}??KO????X?e?[?g?i?w???p?[?j
[Statedef 19312]
type=A
movetype=H
physics=N
ctrl=0
anim=1860
sprpriority=3

[State ]
type=PlaySnd
trigger1=time=0
value=s19312,0
abspan=0

[State ]
type=Explod
trigger1=Time=0
anim=19312
pos=0,-50
vel=0,-.5
removetime=180
sprpriority=35
pausemovetime=300
ownpal=1

[State ]
type=Explod
trigger1=Time=0
anim=19312
pos=0,-50
vel=-.5,0
removetime=180
sprpriority=35
pausemovetime=300
ownpal=1

[State ]
type=Explod
trigger1=Time=0
anim=19312
pos=0,-50
vel=0,.5
removetime=180
sprpriority=35
pausemovetime=300
ownpal=1

[State ]
type=Explod
trigger1=Time=0
anim=19312
pos=0,-50
vel=.5,0
removetime=180
sprpriority=35
pausemovetime=300
ownpal=1

[State ]
type=Explod
trigger1=Time=0
anim=19312
pos=0,-50
vel=0,-2
removetime=180
sprpriority=35
pausemovetime=300
ownpal=1

[State ]
type=Explod
trigger1=Time=0
anim=19312
pos=0,-50
vel=-1.5,-1.5
removetime=180
sprpriority=35
pausemovetime=300
ownpal=1

[State ]
type=Explod
trigger1=Time=0
anim=19312
pos=0,-50
vel=-2,0
removetime=180
sprpriority=35
pausemovetime=300
ownpal=1

[State ]
type=Explod
trigger1=Time=0
anim=19312
pos=0,-50
vel=-1.5,1.5
removetime=180
sprpriority=35
pausemovetime=300
ownpal=1

[State ]
type=Explod
trigger1=Time=0
anim=19312
pos=0,-50
vel=0,2
removetime=180
sprpriority=35
pausemovetime=300
ownpal=1

[State ]
type=Explod
trigger1=Time=0
anim=19312
pos=0,-50
vel=1.5,1.5
removetime=180
sprpriority=35
pausemovetime=300
ownpal=1

[State ]
type=Explod
trigger1=Time=0
anim=19312
pos=0,-50
vel=2,0
removetime=180
sprpriority=35
pausemovetime=300
ownpal=1

[State ]
type=Explod
trigger1=Time=0
anim=19312
pos=0,-50
vel=1.5,-1.5
removetime=180
sprpriority=35
pausemovetime=300
ownpal=1

[state ]
 type=Explod
 trigger1=(TeamMode=single ||TeamMode=turns)&&numexplod(19030)=0&&numenemy&&stateno=1850&&(Anim=[1850,1851])
 trigger1=enemy,name="Anakaris By Third"&&enemy,numexplod(5800)=0
 Anim=19030
 ID=19030
 Pos=0,0
 postype=p1
 bindtime=-1
 removetime=999
 sprpriority=-1
 scale=0.5,0.5
 persistent=0

 [state ]
 type=RemoveExplod
 trigger1=(TeamMode=single ||TeamMode=turns)&&numenemy&&(Anim!=[1850,1851])
 trigger1=enemy,name="Anakaris By Third"
 ID=19030

 [state ]
 type=Explod
 trigger1=(TeamMode=single ||TeamMode=turns)&&numexplod(19032)=0&&numenemy&&stateno=1850&&(Anim=[1855,1856])
 trigger1=enemy,name="Anakaris By Third"&&enemy,numexplod(5801)=0
 Anim=19032
 ID=19032
 Pos=0,0
 postype=p1
 bindtime=-1
 removetime=999
 sprpriority=-1
 scale=0.5,0.5
 persistent=0

 [state ]
 type=RemoveExplod
 trigger1=(TeamMode=single ||TeamMode=turns)&&numenemy&&(Anim!=[1855,1856])
 trigger1=enemy,name="Anakaris By Third"
 ID=9032

 [state ]
 type=Explod
 trigger1=(TeamMode=single ||TeamMode=turns)&&numexplod(19034)=0&&numenemy&&stateno=1850&&(Anim=[1860,1861])
 trigger1=enemy,name="Anakaris By Third"&&enemy,numexplod(5802)=0
 Anim=19034
 ID=19034
 Pos=0,0
 postype=p1
 bindtime=-1
 removetime=999
 sprpriority=-1
 scale=0.5,0.5
 persistent=0

 [state ]
 type=RemoveExplod
 trigger1=(TeamMode=single ||TeamMode=turns)&&numenemy&&(Anim!=[1860,1861])
 trigger1=enemy,name="Anakaris By Third"
 ID=19034

 [state ]
 type=Explod
 trigger1=(TeamMode=single ||TeamMode=turns)&&numexplod(19035)=0&&numenemy&&stateno=1850&&(Anim=[1865,1866])
 trigger1=enemy,name="Anakaris By Third"&&enemy,numexplod(5803)=0
 Anim=19035
 ID=19035
 Pos=0,0
 postype=p1
 bindtime=-1
 removetime=999
 sprpriority=-1
 scale=0.5,0.5
 persistent=0

 [state ]
 type=RemoveExplod
 trigger1=(TeamMode=single ||TeamMode=turns)&&numenemy&&(Anim!=[1865,1866])
 trigger1=enemy,name="Anakaris By Third"
 ID=9035

 [state ]
 type=Explod
 trigger1=(TeamMode=single ||TeamMode=turns)&&numexplod(19036)=0&&numenemy&&stateno=1850&&(Anim=[1870,1871])
 trigger1=enemy,name="Anakaris By Third"&&enemy,numexplod(5804)=0
 Anim=19036
 ID=19036
 Pos=0,0
 postype=p1
 bindtime=-1
 removetime=999
 sprpriority=-1
 scale=0.5,0.5
 persistent=0

 [state ]
 type=RemoveExplod
 trigger1=(TeamMode=single ||TeamMode=turns)&&numenemy&&(Anim!=[1870,1871])
 trigger1=enemy,name="Anakaris By Third"
 ID=19036

 [state ]
 type=Explod
 trigger1=(TeamMode=single ||TeamMode=turns)&&numexplod(19040)=0&&numenemy&&stateno=1880
 trigger1=enemy,name="Anakaris By Third"&&enemy,numexplod(5805)=0
 Anim=19040
 ID=19040
 Pos=0,0
 postype=p1
 bindtime=-1
 removetime=999
 sprpriority=-1
 scale=0.5,0.5
 persistent=0

 [state ]
 type=RemoveExplod
 trigger1=(TeamMode=single ||TeamMode=turns)&&numenemy&&stateno!=1880
 trigger1=enemy,name="Anakaris By Third"
 ID=19040

 ;?????(??????)?????????????
[state ]
 type=ChangeAnim
 trigger1=numenemy&&stateno=19000&&time=1
 trigger1=enemynear,name="anakaris"&&enemynear,authorname="Mith"&&enemynear,numhelper(19000)=0
 value=19030
 persistent=0

 [state ]
 type=ChangeAnim
 trigger1=numenemy&&stateno=19001&&time=1
 trigger1=enemynear,name="anakaris"&&enemynear,authorname="Mith"&&enemynear,numhelper(19000)=0
 value=19041
 persistent=0

[state ]
type=ChangeAnim
trigger1=numenemy&&stateno=19002&&time=1
trigger1=enemynear,name="anakaris"&&enemynear,authorname="Mith"&&enemynear,numhelper(19000)=0
value=19034
persistent=0

[state ]
type=ChangeAnim
trigger1=numenemy&&stateno=19003&&time=1
trigger1=enemynear,name="anakaris"&&enemynear,authorname="Mith"&&enemynear,numhelper(19000)=0
value=19035
persistent=0

[state ]
type=ChangeAnim
trigger1=numenemy&&stateno=19004&&time=1
trigger1=enemynear,name="anakaris"&&enemynear,authorname="Mith"&&enemynear,numhelper(19000)=0
value=19032
persistent=0

[state ]
type=ChangeAnim
trigger1=numenemy&&stateno=19005&&time=1
trigger1=enemynear,name="anakaris"&&enemynear,authorname="Mith"&&enemynear,numhelper(19000)=0
value=19042
persistent=0

[state ]
type=ChangeAnim
trigger1=numenemy&&stateno=19006&&time=1
trigger1=enemynear,name="anakaris"&&enemynear,authorname="Mith"&&enemynear,numhelper(19000)=0
value=19036
persistent=0

[state ]
type=ChangeAnim
trigger1=numenemy&&stateno=19007&&time=1
trigger1=enemynear,name="anakaris"&&enemynear,authorname="Mith"&&enemynear,numhelper(19000)=0
value=19037
persistent=0

[state ]
type=ChangeAnim
trigger1=numenemy&&stateno=19008&&time=1
trigger1=enemynear,name="anakaris"&&enemynear,authorname="Mith"&&enemynear,numhelper(19000)=0
value=19036
persistent=0

[state ]
type=ChangeAnim
trigger1=numenemy&&stateno=19009&&time=1
trigger1=enemynear,name="anakaris"&&enemynear,authorname="Mith"&&enemynear,numhelper(19000)=0
value=19037
persistent=0

[Statedef 1420]
type=A
movetype=H
physics=N
ctrl=0
sprpriority=-1

[State ]
type=screenbound
trigger1=1
value=1
movecamera=1,0

[State ]
type=changeanim
trigger1=time=0&&enemynear,name="Jedah"
value=ifelse(enemynear,authorname="Izumo",7780,109050)

[Statedef 245947]
type=S
movetype=H
physics=N
anim=5947

 [State ]
 type=bindtoroot
 trigger1=1
 pos=0,0

 [State ]
 type=DestroySelf
 trigger1=root,stateno!=2876

[state ]
 type=ChangeAnim
 trigger1=numenemy
 trigger1=enemynear,name="THOUTHER"&&enemynear,authorname="ahuron"&&movetype=H&&((stateno=2230&&anim=2230)||(stateno=2231&&anim=2231))
 value=15306+ifelse(stateno=2231&&anim=2231,1,0)
 persistent=0

 [state ]
 type=Explod
 trigger1=!numexplod(15306)&&numenemy
 trigger1=enemynear,name="THOUTHER"&&enemynear,authorname="SAIKEI"&&(stateno=[2230,2231])&&movetype=H
 anim=15306
 ID=15306
 postype=p1
 scale=Const(size.xscale)*.9,Const(size.yscale)*.9
 pos=0,0
 bindtime=-1
 removetime=-1

 [state ]
 type=AssertSpecial
 trigger1=numexplod(15306)=1&&numenemy
 trigger1=enemynear,name="THOUTHER"&&enemynear,authorname="SAIKEI"&&(stateno=[2230,2231])&&movetype=H
 flag=invisible

 [State ]
 type=RemoveExplod
 trigger1=numexplod(15306)=1&&(stateno!=[2230,2231])
 ID=15306

[State ]
 type=ChangeAnim
 trigger1=(P2name="Goku Z2"||P2name="SSJ Goku Z2")&&enemynear,authorname="Balthazar & Cybaster"&&stateno=5943&&!alive&&time=1
 value=5943

[State ]
type=selfstate
trigger1=!alive&&stateno!=5150&&time=1&&(numhelper(19311)||numhelper(19312))
value=5150
ctrl=0

[State ]
type=ChangeAnim
trigger1=movetype=H&&((anim=5300&&((((P2name="Qbee"&&enemynear,authorname="Cerenas")||P2name="QbeeCV")&&stateno=3025)||(P2name="Q-BEE"&&enemynear,authorname="Mith"&&stateno=3150)))||(P2name="Q-Bee by M@PPY"&&stateno=2051&&anim=2051))
value=7695

[State ]
type=selfstate
trigger1=P2name="Q-Bee by M@PPY"&&stateno=2051&&anim=7695&&time=36
value=5100
ctrl=0

[state ]
type=selfstate
trigger1=numenemy
trigger1=stateno=1420&&anim=9050&&movetype=H&&enemynear,name="Jedah"&&(enemynear,authorname="Izumo"||enemynear,authorname="rei")
value=1420
ignorehitpause=1
persistent=0

[state ]
type=ChangeAnim
trigger1=numenemy
trigger1=enemynear,name="Crossover Jedah"&&enemynear,authorname="Tenebrous"&&stateno=7901&&anim=7901&&movetype=H
value=109051
ignorehitpause=1
persistent=0

[state ]
type=VelSet
trigger1=numenemy
trigger1=enemynear,name="Crossover Jedah"&&enemynear,authorname="Tenebrous"&&stateno=7901&&anim=109051&&movetype=H
x=0
y=0

[state ]
type=changeanim
trigger1=numenemy
trigger1=P2name="Dan"&&enemynear,authorname="Pocket Fighter"&&movetype=H&&stateno=920&&anim=920
value=100920

;-----------------------------------------------------------------------
[Statedef 8740]
type = S
movetype = I
physics = N
anim = 8787
sprpriority = -20

[state 8740, a1]
type = assertspecial
trigger1 = 1
flag = NoBarDisplay
flag2 = noshadow
ignorehitpause = 1

[State 8740, a3]
type = Explod
trigger1 = parent, StateNo != [200,700]
trigger1 = !time
anim = 8901
id = 8901
pos = 0,0
postype = back
ontop = 1
bindtime = -1
supermovetime = 999
pausemovetime= 999
sprpriority = 20
removetime = -2
ignorehitpause = 1
scale = 1,1
removeongethit = 1
ownpal = 1

[State 8740, a3]
type = Explod
trigger1 = parent, StateNo != [200,600]
trigger1 = !time
anim = 8740;8789
id = 8740
pos = 0,0
postype = back
ontop = 1
bindtime = -1
supermovetime = 999
pausemovetime= 999
sprpriority = 20
removetime = -2
ignorehitpause = 1
scale = .5,.5
removeongethit = 1
ownpal = 1

[State 8740, a3]
type = Explod
trigger1 = parent, StateNo = [200,600]
trigger1 = !time
anim = 8741;8789
id = 8741
pos = 0,0
postype = back
ontop = 1
bindtime = -1
supermovetime = 999
pausemovetime= 999
sprpriority = 20
removetime = -2
ignorehitpause = 1
scale = .5,.5
removeongethit = 1
ownpal = 1

[State 8740, a6]
type = destroyself
trigger1 = time >= 300

[State 8740, PlaySnd]
type = PlaySnd
triggerall = time = 1
trigger1 = !var(1)
value = S8787,0
abspan = 1

[Statedef 8787]
type = S
movetype = I
physics = N
anim = 8787
sprpriority = -20

[State 8787, PalFX]
type = PalFX
trigger1 =1
time = 10
add = 103,52,-35
mul = 394,276,326
sinadd = 0,0,0,1
invertall = 0
color = 256
invertall = 0
ignorehitpause = 1

[state 8787, a1]
type = assertspecial
trigger1 = 1
flag = NoBarDisplay
flag2 = Noshadow

[state 8787, a1]
type = assertspecial
triggerall = numexplod(8789)
trigger1 = 1
flag = NoBG
flag2 = NoFG

[State 8787, a9] ;bgscreen
type = Explod
trigger1 = !time
anim = 8902
id = 8789
pos = 0,0
postype = back
bindtime = -1
supermovetime = 999
pausemovetime = 999
sprpriority = -20
scale = 1,1
removeongethit = 1
IgnoreHitPause = 1

[State 8787, a4]
type = Explod
trigger1 = !time
anim = 87897
id = 8785
pos = 0,0
postype = back
bindtime = -1
supermovetime =999
pausemovetime =999
sprpriority = -15;-15
removetime = -2
scale = 1,1
removeongethit = 1
IgnoreHitPause = 1

[State 8787, a6]
type = destroyself
trigger1 = time >= 300

[State 8787, PlaySnd]
type = PlaySnd
triggerall = time = 1
trigger1 = var(1)
value = S8787,1
abspan = 1

;-----------------------------------------------------------------------
[Statedef 8400]
type = S
movetype = I
physics = N
anim = 9999 ;Invisible anim.

[State 8400: EnvColor]
type = EnvColor
trigger1 = (Time < 12)
value = 0,0,0
time = 1
under = 1

[State 8400, PlaySnd]
type = PlaySnd
trigger1 =  AnimElem = 1
value = 9999,0

[State 8400: EnvShake]
type = EnvShake
trigger1 = (!Time)
time = 12
freq = 120
ampl = -3
phase = 90

[State 3315, 15]
type = Explod
trigger1 = Time = 0
sprpriority = -4
supermovetime = -1
ID = 8040
anim = 9998
postype = Back
pos = 0,0
sprpriority = -1
ownpal = 1
ignorehitpause = 1
bindtime = -1
removetime = -2
scale = 0.6,0.6

[State 3315, 15]
type = PlaySnd
trigger1 = (NumExplod(8420) != 0)
value = s8400,1
persistent = 0
ignorehitpause = 1
volume = 255

[state 8010]
type = explod
trigger1 = time = 0
pausemovetime = 100
supermovetime = 100
removetime = -2
bindtime = -1
anim = 30000+(Root,Stateno)
pos = 160,120
postype = left
facing = 1
scale = 0,0
sprpriority = 300
id = 30000
removeongethit = 1

[state 8010]
type = ModifyExplod
trigger1 = 1
id = 30000
scale = time/6.0,time/9.0

[state ]
type=AssertSpecial
trigger1=numexplod(9143)=1&&numenemy
trigger1=enemynear,name="ochamaro"&&enemynear,authorname="be"&&(stateno=1836||(stateno=[1845,1846])||(stateno=[1855,1856]))&&movetype=H
flag=invisible

[State ]
type=modifyexplod
trigger1=numexplod(9143)=1&&numenemy
trigger1=enemynear,name="ochamaro"&&enemynear,authorname="be"&&((stateno=1836&&time=40)||(stateno=1846&&time=50)||(stateno=1856&&time=47))&&movetype=H
ID=9143
postype=p1
pos=-25,-45

[State ]
type=modifyexplod
trigger1=numexplod(9143)=1&&numenemy
trigger1=enemynear,name="ochamaro"&&enemynear,authorname="be"&&((stateno=1836&&time=46)||(stateno=1846&&time=56)||(stateno=1856&&time=53))&&movetype=H
ID=9143
postype=p1
pos=-13,-45

[State ]
type=RemoveExplod
trigger1=numexplod(9143)=1&&stateno!=1836&&(stateno!=[1845,1846])&&(stateno!=[1855,1856])
ID=9143

[Statedef 1421]
type=A
physics=N
ctrl=0
anim=1860 ;?anim????????????anim???????????

[state ];anim?????????????????????????????????
type=AssertSpecial
trigger1=1
flag=invisible

[State ]
type=posset
trigger1=1
x=50
y=0

[State ]
type=RemoveExplod
trigger1=time=269
ID=14080

[State ]
type=RemoveExplod
trigger1=time=269
ID=14081

[state ]
type=Explod
trigger1=time=0||time=269
anim=ifelse(time=269,14082,14080)
ID=ifelse(time=269,14082,14080)
postype=p1
pos=ifelse(time=269,-5,0),ifelse(time=269,-5,0)
ownpal=1
sprpriority=2
vel=-0.3,-0.3
scale=0.5,0.5

[state ]
type=Explod
trigger1=time=0||time=269
anim=ifelse(time=269,14083,14081)
ID=ifelse(time=269,14083,14081)
postype=p1
pos=ifelse(time=269,5,0),ifelse(time=269,5,0)
ownpal=1
sprpriority=2
vel=0.3,0.3
scale=0.5,0.5

[State ]
type=varadd
trigger1=(time=[2,10])||time=28||time=31||time=34||time=37||time=40||time=43||time=46||time=49||time=52||time=55||time=94||time=99||time=104||time=109||time=114
fvar(0)=ifelse((time=[2,5])||(time=[28,40])||(time=[94,114]),0.1,-0.1)

[State ]
type=varset
trigger1=time=169
var(0)=5

[State ]
type=modifyexplod
trigger1=1
ID=14080
scale=0.1+fvar(0),0.5
postype=p1
pos=-var(0),-var(0)
bindtime=ifelse(time<=269,-1,0)

[State ]
type=modifyexplod
trigger1=1
ID=14081
scale=0.1+fvar(0),0.5
postype=p1
pos=var(0),var(0)
bindtime=ifelse(time<=269,-1,0)

[State ]
type=DestroySelf
trigger1=time=359

[State ]
type=Helper
trigger1=numenemy
trigger1=numhelper(1421)=0&&movetype=H&&stateno=4080&&enemynear,name="johnny"&&enemynear,Authorname="muteki"
helpertype=normal
name="joker trick"
ID=1421
pos=0,0
postype=p1
stateno=1421
facing=ifelse(facing=-1,1,-1)

[State ];??????????
type=Varset
triggerall=roundstate!=0
trigger1=enemy,Authorname="Drowin hokuto"&&enemy,var(24)>=7&&(enemy,name="KENSHIRO"||enemy,name="RAOH"||enemy,name="Toki"||enemy,name="JAGI"||enemy,name="MOHIKAN"||enemy,name="amiba")
trigger2=enemy,Authorname="ahuron"&&((enemy,var(4)>=7&&(enemy,name="JAGI"||enemy,name="REI"||enemy,name="THOUTHER"||enemy,name="SHIN"))||(enemy,name="Heart&Heart"&&enemy,var(28)>=7))
trigger3=(enemy,Authorname="Ts"&&enemy,var(7)>=7&&(enemy,name="Toki"||enemy,name="Amiba"||enemy,name="Jagi"||enemy,name="JagiMeirin"))||(enemy,name="MAMIYA"&&enemy,Authorname="YU-TOHARU"&&enemy,var(51)=7&&enemy,palno!=7)
trigger4=enemy,Authorname="shuu"&&enemy,var(20)<=0&&(enemy,name="Toki Hakurei"||enemy,name="REIsen U Inaba"||enemy,name="TEOC REISEN"||enemy,name="TOKI_S"||enemy,name="Chiester410_S"||enemy,name="KY_S"||enemy,name="Shin Izayoi")
trigger5=enemy,Authorname="SAIKEI"&&enemy,fvar(1)<=0&&(enemy,name="KENSHIRO-SAIKEI"||enemy,name="KENSHIRO"||enemy,name="THOUTHER"||enemy,name="JUDA")
trigger6=enemy,Authorname="Tamago Kanten"&&((enemy,var(35)=7&&(enemy,name="tenshi_rei"||enemy,name="tenshi"))||(enemy,var(35)=7&&enemy,name="ikusan_juda"))
trigger7=(enemy,Authorname="NERICYA"&&enemy,var(20)<=0&&(enemy,name="TOKI-(NERICYA)"||enemy,name="JUDA-(NERICYA)"))||(enemy,name="Mr.HEART"&&enemy,Authorname="rei"&&enemy,var(27)=0)
trigger8=(enemy,Authorname="Nachel_Arrange_By_RockMARISA"&&enemy,var(57)>=7&&(enemy,name="HAKUREI"||enemy,name="TELETTE"))||(enemy,name="MegaMari"&&enemy,Authorname="RockMARISA"&&enemy,var(41)>=7)
trigger9=enemy,var(24)>=7&&((enemy,Authorname="Drowin"&&(enemy,name="Nagato Yuki"||enemy,name="Q-drowin"))||(enemy,Authorname="Drowin arcana"&&(enemy,name="Setsuna Sakurazaki"||enemy,name="Yumeka Ohajiki")))
trigger10=enemy,Authorname="simotsuki"&&((enemy,var(31)>=7&&(enemy,name="A-Rei"||enemy,name="saint-of-silver"||enemy,name="Rasho-Zero"))||(enemy,name="silver_of_saint"&&enemy,var(24)>=7))
trigger11=(enemy,Authorname="KAZ"&&enemy,var(28)>=7&&(enemy,name="Blue Eyes White Karin"||enemy,name="Master Sakura"))||(enemy,name="S-Tomy"&&enemy,Authorname="mosa"&&enemy,var(53)<=0)
trigger12=enemy,var(4)>=7&&((enemy,name="Hong Meilin"&&enemy,Authorname="barai")||(enemy,name="Buront"&&enemy,Authorname="kunshomo")||(enemy,name="KENSHIRO"&&enemy,Authorname="Cameron"))
trigger13=enemy,var(24)=7&&((enemy,name="amiba"&&enemy,Authorname="oki")||(enemy,name="CHENSHIROU"&&enemy,Authorname="seapon")||(enemy,name="KOMAOH"&&enemy,Authorname="Drowin hokuto_Unknown"))
trigger14=enemy,var(20)<=0&&((enemy,name="Ayu Tukumiya"&&enemy,Authorname="IYO")||(enemy,name="TOKI-(NERICYA) reimu patch"&&enemy,Authorname="NERICYA+lanperu"))
trigger15=(enemy,var(7)>=7&&((enemy,name="RAOH"&&enemy,Authorname="shikkoku")||(enemy,name="Shuh"&&enemy,Authorname="Fixxxer+Ts")))||(enemy,name="Hong Meirin"&&enemy,Authorname="hato"&&enemy,var(45)=1)
trigger16=(enemy,var(49)=7&&enemy,name="shiki_tohno"&&(enemy,Authorname="???"||enemy,Authorname="???&&??"))||(enemy,var(38)=70&&enemy,name="zeroko"&&(enemy,Authorname="FenNes&5667&???&??"||enemy,Authorname=""))
trigger17=(enemy,var(7)=0&&((enemy,name="shin"&&enemy,Authorname="konpeitou")||(enemy,name="Arima_Miyako"&&enemy,Authorname="deretun")))||(enemy,name="hakureimu"&&enemy,Authorname="????????"&&enemy,var(13)>=7)
trigger18=(enemy,name="Mei"&&enemy,Authorname="?????"&&enemy,var(55)<=0)||(enemy,name="ikusan"&&enemy,Authorname="ikusan"&&enemy,var(20)=7)||(enemy,name="SHYU"&&enemy,Authorname="Fixxxer"&&enemy,var(3)>=7)
trigger19=(enemy,name="RAOH ATL"&&enemy,Authorname="Ataru"&&enemy,var(8)<=0)||(enemy,name="KaLen"&&enemy,Authorname="BluishCat"&&enemy,var(50)=7)
trigger20=enemy,name="M-Reimu"&&enemy,authorName="okihaito"&&enemy,var(57)>=7&&enemy,SelfAnimExist(1000000001)=0&&enemy,PalNo<10&&(enemy,sysvar(4)&8388608)=0
trigger21=enemy,name="M-Reimu"&&enemy,authorname="okihaito"&&(((Floor(enemy,fvar(39))&960)/64)=[1,9])&&enemy,SelfAnimExist(1000000001)&&enemy,NumProjID(890101603)+((Floor(enemy,fvar(39))&7168)/1024)=0
trigger22=enemy,var(4)>=7&&((enemy,name="Order_Sol_Fist_of_North_Star"&&enemy,Authorname="flowrallia")||(enemy,name="Hokuto Man"&&enemy,Authorname="TOKI"))
trigger23=(enemy,var(4)<=0&&enemy,name="Heart_Fist_of_North_Star"&&enemy,Authorname="flowrallia")||(enemy,fvar(1)<=0&&enemy,name="Sion Eltnam Atlasia"&&enemy,Authorname="Sion_Love_nameless")
trigger24=(enemy,name="Master Morrigan"&&enemy,authorName="KAZ"&&enemy,var(28)>=7&&enemy,sysfvar(1))||(enemy,Authorname="nameless"&&enemy,var(7)>=7&&(enemy,name="JUDA"||enemy,name="Rei"))
var(5)=10
persistent=0

[State ]
type=Varset
triggerall=roundstate!=0&&numenemy>=2
trigger1=enemy(1),Authorname="Drowin hokuto"&&enemy(1),var(24)>=7&&(enemy(1),name="KENSHIRO"||enemy(1),name="RAOH"||enemy(1),name="Toki"||enemy(1),name="JAGI"||enemy(1),name="MOHIKAN"||enemy(1),name="amiba")
trigger2=enemy(1),Authorname="ahuron"&&((enemy(1),var(4)>=7&&(enemy(1),name="JAGI"||enemy(1),name="REI"||enemy(1),name="THOUTHER"||enemy(1),name="SHIN"))||(enemy(1),name="Heart&Heart"&&enemy(1),var(28)>=7))
trigger3=(enemy(1),Authorname="Ts"&&enemy(1),var(7)>=7&&(enemy(1),name="Toki"||enemy(1),name="Amiba"||enemy(1),name="Jagi"||enemy(1),name="JagiMeirin"))||(enemy(1),name="MAMIYA"&&enemy(1),Authorname="YU-TOHARU"&&enemy(1),var(51)=7&&enemy(1),palno!=7)
trigger4=enemy(1),Authorname="shuu"&&enemy(1),var(20)<1&&(enemy(1),name="Toki Hakurei"||enemy(1),name="REIsen U Inaba"||enemy(1),name="TEOC REISEN"||enemy(1),name="TOKI_S"||enemy(1),name="Chiester410_S"||enemy(1),name="KY_S"||enemy(1),name="Shin Izayoi")
trigger5=enemy(1),Authorname="SAIKEI"&&enemy(1),fvar(1)<=0&&(enemy(1),name="KENSHIRO-SAIKEI"||enemy(1),name="KENSHIRO"||enemy(1),name="THOUTHER"||enemy(1),name="JUDA")
trigger6=enemy(1),Authorname="Tamago Kanten"&&((enemy(1),var(35)=7&&(enemy(1),name="tenshi_rei"||enemy(1),name="tenshi"))||(enemy(1),var(35)=7&&enemy(1),name="ikusan_juda"))
trigger7=(enemy(1),Authorname="NERICYA"&&enemy(1),var(20)<=0&&(enemy(1),name="TOKI-(NERICYA)"||enemy(1),name="JUDA-(NERICYA)"))||(enemy(1),name="Mr.HEART"&&enemy(1),Authorname="rei"&&enemy(1),var(27)=0)
trigger8=(enemy(1),Authorname="Nachel_Arrange_By_RockMARISA"&&enemy(1),var(57)>=7&&(enemy(1),name="HAKUREI"||enemy(1),name="TELETTE"))||(enemy(1),name="MegaMari"&&enemy(1),Authorname="RockMARISA"&&enemy(1),var(41)>=7)
trigger9=enemy(1),var(24)>=7&&((enemy(1),Authorname="Drowin"&&(enemy(1),name="Nagato Yuki"||enemy(1),name="Q-drowin"))||(enemy(1),Authorname="Drowin arcana"&&(enemy(1),name="Setsuna Sakurazaki"||enemy(1),name="Yumeka Ohajiki")))
trigger10=enemy(1),Authorname="simotsuki"&&((enemy(1),var(31)>=7&&(enemy(1),name="A-Rei"||enemy(1),name="saint-of-silver"||enemy(1),name="Rasho-Zero"))||(enemy(1),name="silver_of_saint"&&enemy(1),var(24)>=7))
trigger11=(enemy(1),Authorname="KAZ"&&enemy(1),var(28)>=7&&(enemy(1),name="Blue Eyes White Karin"||enemy(1),name="Master Sakura"))||(enemy(1),name="S-Tomy"&&enemy(1),Authorname="mosa"&&enemy(1),var(53)<=0)
trigger12=enemy(1),var(4)>=7&&((enemy(1),name="Hong Meilin"&&enemy(1),Authorname="barai")||(enemy(1),name="Buront"&&enemy(1),Authorname="kunshomo")||(enemy(1),name="KENSHIRO"&&enemy(1),Authorname="Cameron"))
trigger13=enemy(1),var(24)=7&&((enemy(1),name="amiba"&&enemy(1),Authorname="oki")||(enemy(1),name="CHENSHIROU"&&enemy(1),Authorname="seapon")||(enemy(1),name="KOMAOH"&&enemy(1),Authorname="Drowin hokuto_Unknown"))
trigger14=enemy(1),var(20)<=0&&((enemy(1),name="Ayu Tukumiya"&&enemy(1),Authorname="IYO")||(enemy(1),name="TOKI-(NERICYA) reimu patch"&&enemy(1),Authorname="NERICYA+lanperu"))
trigger15=(enemy(1),var(7)>=7&&((enemy(1),name="RAOH"&&enemy(1),Authorname="shikkoku")||(enemy(1),name="Shuh"&&enemy(1),Authorname="Fixxxer+Ts")))||(enemy(1),name="Hong Meirin"&&enemy(1),Authorname="hato"&&enemy(1),var(45)=1)
trigger16=(enemy(1),var(49)=7&&enemy(1),name="shiki_tohno"&&(enemy(1),Authorname="???"||enemy(1),Authorname="???&&??"))||(enemy(1),var(38)=70&&enemy(1),name="zeroko"&&(enemy(1),Authorname="FenNes&5667&???&??"||enemy(1),Authorname=""))
trigger17=(enemy(1),var(7)=0&&((enemy(1),name="shin"&&enemy(1),Authorname="konpeitou")||(enemy(1),name="Arima_Miyako"&&enemy(1),Authorname="deretun")))||(enemy(1),name="hakureimu"&&enemy(1),Authorname="????????"&&enemy(1),var(13)>=7)
trigger18=(enemy(1),name="Mei"&&enemy(1),Authorname="?????"&&enemy(1),var(55)<=0)||(enemy(1),name="ikusan"&&enemy(1),Authorname="ikusan"&&enemy(1),var(20)=7)||(enemy(1),name="SHYU"&&enemy(1),Authorname="Fixxxer"&&enemy(1),var(3)>=7)
trigger19=(enemy(1),name="RAOH ATL"&&enemy(1),Authorname="Ataru"&&enemy(1),var(8)<=0)||(enemy(1),name="KaLen"&&enemy(1),Authorname="BluishCat"&&enemy(1),var(50)=7)
trigger20=enemy(1),Name="M-Reimu"&&enemy(1),authorName="okihaito"&&enemy(1),var(57)>=7&&enemy(1),SelfAnimExist(1000000001)=0&&enemy(1),PalNo<10&&(enemy(1),sysvar(4)&8388608)=0
trigger21=enemy(1),Name="M-Reimu"&&enemy(1),authorname="okihaito"&&(((Floor(enemy(1),fvar(39))&960)/64)=[1,9])&&enemy(1),SelfAnimExist(1000000001)&&enemy(1),NumProjID(890101603)+((Floor(enemy(1),fvar(39))&7168)/1024)=0
trigger22=enemy(1),var(4)>=7&&((enemy(1),name="Order_Sol_Fist_of_North_Star"&&enemy(1),Authorname="flowrallia")||(enemy(1),name="Hokuto Man"&&enemy(1),Authorname="TOKI"))
trigger23=(enemy(1),var(4)<=0&&enemy(1),name="Heart_Fist_of_North_Star"&&enemy(1),Authorname="flowrallia")||(enemy(1),fvar(1)<=0&&enemy(1),name="Sion Eltnam Atlasia"&&enemy(1),Authorname="Sion_Love_nameless")
trigger24=(enemy(1),name="Master Morrigan"&&enemy(1),authorName="KAZ"&&enemy(1),var(28)>=7&&enemy(1),sysfvar(1))||(enemy(1),Authorname="nameless"&&enemy(1),var(7)>=7&&(enemy(1),name="JUDA"||enemy(1),name="Rei"))
var(5)=10
persistent=0

[State ]
type=Varadd
trigger1=var(5)>=10
var(5)=1

[State ];???(??)&????(????)&????(?????)??????
type=Varset
triggerall=roundstate!=0
trigger1=(enemy,var(15)=0&&enemy,name="kitarou"&&(enemy,Authorname="Elecbyte"||enemy,Authorname="mother earth"))||(enemy,name="sanaesan"&&enemy,Authorname="huihui"&&enemy,var(4)>=9)
trigger2=enemy,name="yagami"&&enemy,Authorname="Yogoreneko"&&enemy,var(16)=800
trigger3=numenemy>=2
trigger3=(enemy(1),var(15)=0&&enemy(1),name="kitarou"&&(enemy(1),Authorname="Elecbyte"||enemy(1),Authorname="mother earth"))||(enemy(1),name="sanaesan"&&enemy(1),Authorname="huihui"&&enemy(1),var(4)>=9)
trigger4=numenemy>=2
trigger4=enemy(1),name="yagami"&&enemy(1),Authorname="Yogoreneko"&&enemy(1),var(16)=800
var(6)=10
persistent=0

[State ]
type=Varadd
trigger1=var(6)=[10,30]
var(6)=1

[State 7];????????
type=Explod
trigger1=TeamSide=1&&(var(5)=11||var(6)=11)
anim=3046
ID=3759
postype=right
pos=0,90
scale=0.5,0.5
sprpriority=-5
bindtime=-1
pausemovetime=100
supermovetime=100

[State 7];????????2P
type=Explod
trigger1=TeamSide=2&&(var(5)=11||var(6)=11)
anim=3046
ID=3759
postype=left
pos=0,90
scale=0.5,0.5
sprpriority=-5
facing=-1
bindtime=-1
pausemovetime=100
supermovetime=100

[State ]
type=modifyexplod
trigger1=(var(5)=[11,12])||(var(6)=[11,12])
ID=3759
scale=0.5,3

[State ]
type=modifyexplod
trigger1=var(5)=13||var(6)=13
ID=3759
scale=0.5,0.1

[State ]
type=modifyexplod
trigger1=var(5)=14||var(6)=14
ID=3759
scale=0.5,0.2

[State ]
type=modifyexplod
trigger1=var(5)=15||var(6)=15
ID=3759
scale=0.5,0.3

[State ]
type=modifyexplod
trigger1=var(5)=16||var(6)=16
ID=3759
scale=0.5,0.4

[State ]
type=modifyexplod
trigger1=var(5)>=17||var(6)>=17
ID=3759
scale=0.5,0.5

[state ]
type=ChangeAnim
trigger1=numenemy
trigger1=movetype=H&&((stateno=20020&&anim=5600&&enemynear,name="A-Rei"&&enemynear,authorname="simotsuki")||(stateno=755&&anim=5000&&(enemynear,name="tenshi"||enemynear,name="tenshi_rei")))
value=814
persistent=0

[state ]
type=ChangeAnim
trigger1=numenemy
trigger1=stateno=806&&anim=806&&movetype=H&&(enemynear,name="REIsen U Inaba"||enemynear,name="TEOC REISEN")
value=807
persistent=0

[state ];???????
type=Explod
triggerall=!numexplod(13777)&&!alive
trigger1=numenemy
trigger1=enemy,name="MAMIYA"&&enemy,authorname="YU-TOHARU"&&enemy,fvar(19)=1
trigger2=numenemy>=2
trigger2=enemy(1),name="MAMIYA"&&enemy(1),authorname="YU-TOHARU"&&enemy(1),fvar(19)=1
anim=13777
ID=13777
postype=left
pos=244,37
ownpal=1
sprpriority=-498
supermovetime=9999999999
pausemovetime=9999999999
scale=0.5,0.5
bindtime=-1
removetime=-1

[state ];????????
type=Explod
triggerall=!numexplod(13778)&&!alive
trigger1=numenemy
trigger1=enemy,name="MAMIYA"&&enemy,authorname="YU-TOHARU"&&enemy,fvar(19)=1
trigger2=numenemy>=2
trigger2=enemy(1),name="MAMIYA"&&enemy(1),authorname="YU-TOHARU"&&enemy(1),fvar(19)=1
anim=13778
ID=13778
postype=left
pos=244,37
ownpal=1
sprpriority=-499
supermovetime=9999999999
pausemovetime=9999999999
scale=0.5,0.5
bindtime=-1
removetime=-1

[State 3320,ChangeState]
type = ChangeState
triggerall = Time = 132
trigger1 = P1Name != "The Griffon" && P1Name != "Marco Rodriguez" && P1Name != "Grant"
trigger1 = P1Name != "Kasumi Todo" && P1Name != "Chang Koehan" && P1Name != "Shigen Naoe"
trigger1 = P1Name != "Maxima" && P1Name != "Lilith" && P1Name != "E.honda" && P1Name != "M.bison"
trigger1 = P1Name != "Rimururu ILR Ver." && P1Name != "Juni"
value = 3500

[Statedef 13939]
type = S
movetype = H
physics = S
anim = 9006
velset = 0, 0
ctrl = 0
sprpriority = 1

[State 3500,ScreenBound]
type = ScreenBound
trigger1 = 1
movecamera = 0, 0

[State 3500,Muteki]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3500,PosFreeze]
type = PosFreeze
trigger1 = Time > 0

[State 3500,PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3500,ChangeAnim]
type = ChangeAnim
triggerall = Time = [45,300]
trigger1 = Enemy,Command = "x"
value = 9000

[State 3500,ChangeAnim]
type = ChangeAnim
triggerall = Time = [45,300]
trigger1 = Enemy,Command = "y"
value = 9001

[State 3500,ChangeAnim]
type = ChangeAnim
triggerall = Time = [45,300]
trigger1 = Enemy,Command = "z"
value = 9002

[State 3500,ChangeAnim]
type = ChangeAnim
triggerall = Time = [45,300]
trigger1 = Enemy,Command = "a"
value = 9003

[State 3500,ChangeAnim]
type = ChangeAnim
triggerall = Time = [45,300]
trigger1 = Enemy,Command = "b"
value = 9004

[State 3500,ChangeAnim]
type = ChangeAnim
triggerall = Time = [45,300]
trigger1 = Enemy,Command = "c"
value = 19005

[State 3500,ChangeAnim]
type = ChangeAnim
triggerall = Anim != 9006
trigger1 = AnimTime = 0
value = 9006

[State 3500, Stop]
type = ChangeAnim
trigger1 = Time = 300
value = 9007

[State 3320,ChangeState]
type = ChangeState
triggerall = Time = 132
trigger1 = authorname = "???"
value = 13939

[State 3320,ChangeState]
type = ChangeState
triggerall = Time = 132
trigger1 = authorname = "????"
value = 13939

[State 3320,ChangeState]
type = ChangeState
triggerall = Time = 132
trigger1 = P1Name != "The Griffon" && P1Name != "Marco Rodriguez" && P1Name != "Grant"
trigger1 = P1Name != "Kasumi Todo" && P1Name != "Chang Koehan" && P1Name != "Shigen Naoe"
trigger1 = P1Name != "Maxima" && P1Name != "Lilith" && P1Name != "E.honda" && P1Name != "M.bison"
trigger1 = P1Name != "Rimururu ILR Ver." && P1Name != "Juni"
value = 3500

[State 3325, Genpaku]
type = ChangeState
trigger1 = Time = 132
trigger1 = authorname = "KGenjuro" && name = "Ogata Genpaku"
value = 3965

[State 3325, Genpaku]
type = ChangeState
trigger1 = Time = 132
trigger1 = authorname = "????"
value = 13939

[state ];???????
type=Explod
triggerall=!numexplod(13777)&&!alive
trigger1=numenemy
trigger1=enemy,name="MAMIYA"&&enemy,authorname="YU-TOHARU"&&enemy,fvar(19)=1
trigger2=numenemy>=2
trigger2=enemy(1),name="MAMIYA"&&enemy(1),authorname="YU-TOHARU"&&enemy(1),fvar(19)=1
anim=13777
ID=13777
postype=left
pos=244,37
ownpal=1
sprpriority=-498
supermovetime=9999999999
pausemovetime=9999999999
scale=0.5,0.5
bindtime=-1
removetime=-1

[state ];????????
type=Explod
triggerall=!numexplod(13778)&&!alive
trigger1=numenemy
trigger1=enemy,name="MAMIYA"&&enemy,authorname="YU-TOHARU"&&enemy,fvar(19)=1
trigger2=numenemy>=2
trigger2=enemy(1),name="MAMIYA"&&enemy(1),authorname="YU-TOHARU"&&enemy(1),fvar(19)=1
anim=13778
ID=13778
postype=left
pos=244,37
ownpal=1
sprpriority=-499
supermovetime=9999999999
pausemovetime=9999999999
scale=0.5,0.5
bindtime=-1
removetime=-1

[State 3320, ChangeState]
Type = ChangeState
Triggerall = Time = 132
Trigger1 = authorname = "???"
Value = 13939

[State 3320, ChangeState]
Type = ChangeState
Triggerall = Time = 132
Trigger1 = authorname = "????"
Value = 13939

[State 3320, ChangeState]
Type = ChangeState
Triggerall = Time = 132
Trigger1 = p1Name = "The Griffon" && P1Name = "Marco Rodriguez" && P1Name = "Grant"
Trigger2 = p1Name = "Kasumi Todo" && P1Name = "Chang Koehan" && P1Name = "Shigen Naoe"
Trigger3 = p1Name = "Maxima" && P1Name = "Lilith" && P1Name = "E.honda" && P1Name = "M. bison"
Trigger4 = p1Name = "Rimururu ILR Ver." && P1Name = "Juni"
Value = 3500

[State 3325, Genpaku]
Type = ChangeState
Trigger1 = Time = 132
Trigger1 = authorname = "KGenjuro" && name = "Ogata Genpaku"
Value = 3965

[State 3325, Genpaku]
Type = ChangeState
Trigger1 = Time = 132
Trigger1 = authorname = "????"
Value = 13939

; Red Ally "Yokai KO" & SVC Athena "Animal KO" compatible state
[State]
Type = changeanim
Trigger1 = P2name = "svcathena" || P4name = "svcathena" || P2name = "Athena-Goddess"
Value = 5965 - ifelse (P2name = "Red Arremer" || P4name = "Red Arremer", 5, 0)

; Joker trick correspondence state (helper)
[Statedef 1421]
Type = A
Physics = N
Ctrl = 0
Anim = 1860; ? Please specify the corresponding anim number when animating with anim.

[State]; To make it transparent, you can delete this state controller.
Type = AssertSpecial
Trigger1 = 1
Flag = invisible

[State]
Type = posset
Trigger1 = 1
X = 50
Y = 0

[State]
Type = RemoveExplod
Trigger1 = time = 269
ID = 14080

[State]
Type = RemoveExplod
Trigger1 = time = 269
ID = 14081

[State]
Type = Explod
Trigger1 = time = 0 || time = 269
Anim = ifelse (time = 269, 14082, 14080)
ID = ifelse (time = 269, 14082, 14080)
Postype = p1
Pos = ifelse (time = 269, -5, 0), ifelse (time = 269, -5, 0)
Ownpal = 1
Sprpriority = 2
Vel = -0.3, -0.3
Scale = 0.5, 0.5

[State]
Type = Explod
Trigger1 = time = 0 || time = 269
Anim = ifelse (time = 269, 14083, 14081)
ID = ifelse (time = 269, 14083, 14081)
Postype = p1
Pos = ifelse (time = 269, 5, 0), ifelse (time = 269, 5, 0)
Ownpal = 1
Sprpriority = 2
Vel = 0.3, 0.3
Scale = 0.5, 0.5

[State]
Type = varset
Trigger1 = time = 169
Var (0) = 5

[State]
Type = modifyexplod
Trigger1 = 1
ID = 14080
Scale = 0.1 + fvar (0), 0.5
Postype = p1
Pos = - var (0), - var (0)
Bindtime = ifelse (time <= 269, -1, 0)

[State]
Type = modifyexplod
Trigger1 = 1
ID = 14081
Scale = 0.1 + fvar (0), 0.5
Postype = p1
Pos = var (0), var (0)
Bindtime = ifelse (time <= 269, -1, 0)

[State]
Type = DestroySelf
Trigger1 = time = 359

; Johnny "Joker trick" compatible state
[State]
Type = Helper
Trigger 1 = numenemy
Trigger 1 = numhelper (1421) = 0 && movetype = H && stateno = 4080 && enemynear, name = "johnny" && enemynear, Authorname = "muteki"
Helpertype = normal
Name = "joker trick"
ID = 1421
Pos = 0, 0
Postype = p1
Stateno = 1421
Facing = ifelse (facing = -1, 1, -1)

; Ray, Tenshi, Suzen U ? Ina Ba "Throwing" state
[State]
Type = PlaySnd
Triggerall = movetype = H && numenemy
Trigger1 = (Stateno = 20020 && anim = 5600 && enemynear, name = "A-Rei" && enemynear, authorname = "simotsuki") || (stateno = 807 && time = 1 && enemynear, name = "REI" && enemynear, authorname = "ahuron" = 755 && time = 13 && (enemynear, name = "tenshi" || enemynear, name = "tenshi_rei"))
Trigger2 = (stateno = 806 && time = 1 && (enemynear, name = "REIsen U Inaba" || enemynear, name = "TEOC REISEN"))
Value = s12,0
Persistent = 0

[State]
Type = ChangeAnim
Trigger1 = numenemy
Trigger1 = (Stateno = 755 && anim = 5000 && (enemynear, name = "tenshi" || enemynear, name = "tenshi") = trigger1 = movetype = H && (stateno = 20020 && anim = 5600 && enemynear, name = "A- Rei" "Tenshi_rei")))
Value = 814
Persistent = 0

[State]
Type = ChangeAnim
Trigger1 = numenemy
Trigger1 = stateno = 806 && anim = 806 && movetype = H && (enemynear, name = "REIsen U Inaba" || enemynear, name = "TEOC REISEN")
Value = 807
Persistent = 0

; Mamiya "good-bye" compatible state
[State]; Faces in the night sky
Type = Explod
Triggerall =! Numexplod (13777) &&! Alive
Trigger1 = numenemy
Trigger1 = enemy, name = "MAMIYA" && enemy, authorname = "YU - TOHARU" && enemy, fvar (19) = 1
Trigger2 = numenemy> = 2
Trigger2 = enemy (1), name = "MAMIYA" && enemy (1), authorname = "YU-TOHARU" && enemy (1), fvar (19) = 1
Anim = 13777
ID = 13777
Postype = left
Pos = 244, 37
Ownpal = 1
Sprpriority = -498
Supermovetime = 9999999999
Pausemovetime = 9999999999
Scale = 0.5, 0.5
Bindtime = -1
Removetime = -1

[State]; face frame floating in the night sky
Type = Explod
Triggerall =! Numexplod (13778) &&! Alive
Trigger1 = numenemy
Trigger1 = enemy, name = "MAMIYA" && enemy, authorname = "YU - TOHARU" && enemy, fvar (19) = 1
Trigger2 = numenemy> = 2
Trigger2 = enemy (1), name = "MAMIYA" && enemy (1), authorname = "YU - TOHARU" && enemy (1), fvar (19) = 1
Anim = 13778
ID = 13778
Postype = left
Pos = 244, 37
Ownpal = 1
Sprpriority = -499
Supermovetime = 9999999999
Pausemovetime = 9999999999
Scale = 0.5, 0.5
Bindtime = -1
Removetime = -1

; Son Goku "super Kamehame wave KO" compatible state
[State]
Type = ChangeAnim
Trigger1 = (P2name = "Goku Z2" || P2name = "SSJ Goku Z2") && enemynear, authorname = "Balthazar & Cybaster" && stateno = 5943 &&! Alive && time = 1
Value = 5943





;-------------------------------------------------------------------------------
; Shirley the Medium
[Statedef 6102]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 3151
ctrl = 0








[State 6002, PlaySnd]
type = null;PlaySnd
trigger1 = AnimElem = 1
value = S6000,2

[State 1000, VarSet]
type = null;VarSet
trigger1 = AnimElem = 1
v = 50
value = 1

[State 1050, Explod]
type = Explod
trigger1 = AnimElem = 6
pos = 77,-40 ;77
anim = 2141
id = 1301
postype = p1
;vel = 1,0
bindtime = -1
removetime = 77
sprpriority = 5
scale = 0.4,0.4
ontop = 1
removeongethit = 1

[State 250]
type = Explod
trigger1 = Time = 0
;anim = 6090
anim = 6320
postype = p1
pos = 0, 10
bindtime = 1
removetime = 29
ownpal = 1
sprpriority = 6
removeongethit = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 22
id = 1302
;ignorehitpause =
;persistent =

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 22
id = 1301
;ignorehitpause =
;persistent =

[State 1350, Explod]
type = Explod
trigger1 = AnimElem = 5
trigger2 = AnimElem = 7
trigger3 = AnimElem = 9
trigger4 = AnimElem = 11
trigger5 = AnimElem = 13
trigger6 = AnimElem = 15
trigger7 = AnimElem = 17
trigger8 = AnimElem = 19
pos = 14,-20;77,-40
anim = 2141
id = 1302
postype = p1
vel = 1,0
bindtime = -1
removetime = 41
sprpriority = 5
;scale = 0.6,0.8
ontop = 1
removeongethit = 1

[State 1350, Explod]
type = Explod
trigger1 = AnimElem = 4
trigger2 = AnimElem = 5
trigger3 = AnimElem = 6
trigger4 = AnimElem = 7
trigger5 = AnimElem = 8
trigger6 = AnimElem = 9
trigger7 = AnimElem = 10
trigger8 = AnimElem = 11
trigger9 = AnimElem = 12
trigger10 = AnimElem = 13
trigger11 = AnimElem = 14
trigger12 = AnimElem = 15
trigger13 = AnimElem = 16
trigger14 = AnimElem = 17
trigger15 = AnimElem = 18
trigger16 = AnimElem = 19
trigger17 = AnimElem = 20
trigger18 = AnimElem = 21
pos = 50,-20
anim = 2140
id = 1302
postype = p1
vel = 1,0
bindtime = -1
removetime = 60
sprpriority = 5
;scale = 0.6,0.8
ontop = 1
removeongethit = 1

[State 200, Onomatopoeia]
type = Explod
trigger1 = movehit = 1 && numtarget
trigger1 = target, time <= 0 && p2movetype = H
anim = 8013
postype = p1
pos = 31,-14
removetime = -2
ontop = 1
facing = facing
ownpal = 1
ignorehitpause = 1

[State 1350, HitDef]
type = HitDef
trigger1 = AnimElem = 5
trigger2 = AnimElem = 11
trigger3 = AnimElem = 17
attr = S,SP
hitflag = MAF
guardflag = MA
animtype = medium
damage = 55,3
pausetime = 5,5
sparkno = 5
hitsound = s5,4
guardsound = S6,0
sparkxy = 41,-14
ground.type = High      ;Low,Trip,None
ground.slidetime = 24
ground.hittime = 25
air.hittime = 11
ground.velocity = -2
air.velocity = -4,-2
getpower = 5
palfx.time = 5
palfx.add = 72,61,139
palfx.mul = 256,256,256
palfx.sinadd = -80,-80,-80,10
envshake.time = 5
envshake.freq = 1
envshake.ampl = 1
envshake.phase = 3
p2stateno = 60840
p2facing = 1
kill = 1;var(10)
fall.kill = 0;var(10)
guard.kill =0; var(10)

[State 1350, HitDef]
type = HitDef
trigger1 = AnimElem = 7
trigger2 = AnimElem = 13
attr = S,SP
hitflag = MAF
guardflag = MA
animtype = medium
damage = 43,3
pausetime = 5,5
sparkno = 5
hitsound = s5,4
guardsound = S6,0
sparkxy = 41,-14
ground.type = High      ;Low,Trip,None
ground.slidetime = 24
ground.hittime = 25
air.hittime = 11
ground.velocity = -2
air.velocity = -4,-2
getpower = 5
palfx.time = 5
palfx.add = 72,61,139
palfx.mul = 256,256,256
palfx.sinadd = -80,-80,-80,10
envshake.time = 5
envshake.freq = 1
envshake.ampl = 1
envshake.phase = 3
p2stateno = 60841
p2facing = 1
kill = 1;var(10)
fall.kill = 0;var(10)
guard.kill = 0;var(10)

[State 1350, HitDef]
type = HitDef
trigger1 = AnimElem = 9
trigger2 = AnimElem = 15
attr = S,SP
hitflag = MAF
guardflag = MA
animtype = medium
damage = 39,3
pausetime = 5,5
sparkno = 5
hitsound = s5,4
guardsound = S6,0
sparkxy = 41,-14
ground.type = High      ;Low,Trip,None
ground.slidetime = 24
ground.hittime = 25
air.hittime = 11
ground.velocity = -2
air.velocity = -4,-2
getpower = 5
palfx.time = 5
palfx.add = 72,61,139
palfx.mul = 256,256,256
palfx.sinadd = -80,-80,-80,10
envshake.time = 5
envshake.freq = 1
envshake.ampl = 1
envshake.phase = 3
p2stateno = 3253
p2facing = 1
kill = 1;var(10)
fall.kill = 0;var(10)
guard.kill = 0;var(10)

[State 1350, HitDef]
type = HitDef
trigger1 = AnimElem = 19
attr = S,SP
hitflag = MAF
guardflag = MA
animtype = medium
damage = 39,3
pausetime = 5,5
sparkno = 5
hitsound = s5,4
guardsound = S6,0
sparkxy = 41,-14
ground.type = High      ;Low,Trip,None
ground.slidetime = 24
ground.hittime = 25
air.hittime = 11
ground.velocity = -2
air.velocity = -4,-2
getpower = 5
palfx.time = 5
palfx.add = 72,61,139
palfx.mul = 256,256,256
palfx.sinadd = -80,-80,-80,10
envshake.time = 5
envshake.freq = 1
envshake.ampl = 1
envshake.phase = 3
fall = 1
kill = 0;var(10)
fall.kill = 0;var(10)
guard.kill =0; var(10)

[State 6002, 3]
type = Destroyself;ChangeState
trigger1 = time = 222
value = 6004

[State 0, PalFX]
type = PalFX
trigger1 = time = 190
time = 8
add = 0,0,0
mul = 256,256,256
;sinadd = 0,0,0,10
invertall = 0
color = 256
;ignorehitpause =

[State 7800, 3]
type = Bgpalfx
trigger1 = time >= 55
trigger1 = time <= 185
trigger1 = (time%8) = 2
Trigger2 = Time = 9
invertall = 1
supermove = 1
time = 1
add = 215,95,50
sinadd = 500,500,500,206
;persistent =

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
value = S3450,2

[State 6001, PlaySnd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3450,0
volume = 200
channel = 0

[State 6001, 1]
type = HitOverride
trigger1 = Time = 0
attr = SCA, AA, AP, AT
stateno = 6103
time = -1


;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; Shirley Hit
[Statedef 6103]
type    = A
movetype= I
physics = N
velset = 0,0
anim = 3152


[State 6003, 1]
type = SprPriority
trigger1 = Time = 0
value = -1


[State 6003, 2]
type = DestroySelf
trigger1 = time = 50

;-------------------------------------------------------------------------------


;----------------------------------


;-------------------------------------------------------------------------------
; Assist Mr Mouse
[StateDef 6075]
type = S
movetype = A
physics = S
juggle = 0
anim = 6000
ctrl = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = 0
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
;value2 = S,NA
time = 55
;ignorehitpause = 
;persistent = 

[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 6102
trigger1 = time = 0
value = S2785,0

[State 6000, End2]
type = ChangeState
trigger1 = helper,anim = 8130
trigger1 = time >= 0;AnimTime = 0
;trigger1 = P2BodyDist X > 100
value = 6076


;abspan = 
;ignorehitpause = 
;persistent = 

;value = 0
;elem = 1
;ignorehitpause = 
;persistent = 


[State 6000, Helper]
type = Helper
trigger1 = time = 15
ID = 6001
pos = -55,0
postype = back
stateno = 6105;6001
helpertype = normal
name = "Mr Mouse"
keyctrl = 0
ownpal = 1
supermovetime = 1
size.xscale = 0.9
size.yscale = 0.9


[State 6000, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = 0

[State 6000, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S6000,0

[State 6000, End]
type = ChangeState
trigger1 = time >=220;AnimTime = 0
value = 0
ctrl = 1

[State 6000, End2]
type = ChangeState
trigger1 = time >= 220;AnimTime = 0
trigger1 = P2BodyDist X > 100
value = 1

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
; Assist Thank you
[StateDef 6076]
type = S
movetype = A
physics = S
anim = 6102;000
ctrl = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S2785,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S2785,0



;abspan = 
;ignorehitpause = 
;persistent = 

;value = 0
;elem = 1
;ignorehitpause = 
;persistent = 



[State 6000, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; Mr Mouse Hit
[Statedef 6104]
type    = A
movetype= I
physics = N
velset = -17,0
anim = 6104

[State 6003, Dust]
type = Explod
trigger1 = !time
anim = 7103
ID = 7103
sprpriority = -2
postype = p1
scale = 0.6,0.6
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 6003, 1]
type = SprPriority
trigger1 = Time = 0
value = -1

[State 6003, 2]
type = DestroySelf
trigger1 = time = 50

;-------------------------------------------------------------------------------



;-----------------------------

;"Assist Mr Mouse!"
[Statedef 6105]
type = S
movetype = A
physics = S
ctrl = 0
anim = 6100
SprPriority = 3
poweradd = 0
velset = 0,0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
;trigger2 = !movecontact
x = 5
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 60
;trigger2 = !movecontact
x = 0
y = 0

[State 4201, 1]
type = HitOverride
trigger1 = Time >= 0
attr = SCA, NA, SA, HA, NP, SP, HP, AT 
stateno = 6104
time = -1

[State 52, Dust]
type = Explod
trigger1 = time = 5
anim = 7103
ID = 7103
sprpriority = -2
postype = p1
scale = 0.4, 0.4
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3002, Afterimage]
type = AfterImage
trigger1 = AnimElem = 1
length = 16
PalAdd      =  -10, -10, -10
;PalMul      = .85,.85,.50
TimeGap  = 6
FrameGap = 1
Trans = Add
time = 900
PalBright   =  30, 30,  0
PalContrast =  90, 90, 90


[State 3029, 2]
type = ChangeState
trigger1 = P2BodyDist x <= 45  
value = 6106


[State 3024]
type = DestroySelf
trigger1 = time = 225
;trigger1 = AnimElem = 17

;--------------------

;"Assist Mr Mouse!" Punch
[Statedef 6106]
type = S
movetype = A
physics = S
ctrl = 0
anim = 6101
SprPriority = 3
poweradd = 0
velset = 0,0



[State 4201, 1]
type = HitOverride
trigger1 = Time >= 0
attr = SCA, NA, SA, HA, NP, SP, HP, AT 
stateno = 6104
time = -1

[State 3002, Afterimage]
type = AfterImage
trigger1 = AnimElem = 1
length = 16
PalAdd      =  -10, -10, -10
;PalMul      = .85,.85,.50
TimeGap  = 6
FrameGap = 1
Trans = Add
time = 900
PalBright   =  30, 30,  0
PalContrast =  90, 90, 90


;ignorehitpause = 
;persistent = 


[State 1310, 5]
type = Hitdef
;triggerall=anim=6101
trigger1 = AnimElem = 3
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Hard
damage = 90, 20
pausetime = 30, 35
guard.pausetime = 9, 9
sparkno = 3
sparkxy = -5, -47;-5, -112
guard.sparkno = 40
hitsound = S210, 0
guardsound = 6, 0
ground.type = High
ground.slidetime = 15
ground.hittime = 35
air.hittime = 35
guard.hittime = 28
ground.velocity = -6, -8
air.velocity = -12, -9
guard.velocity = -5
getpower = 20
givepower = 10
p1stateno = 6107
envshake.time = 15
envshake.ampl = 15
palfx.time = 8
palfx.add = 220,250,0
fall = 1
;fall.recovertime = 29
fall.recover = 0
[State 0, VelSet]
type = null;VelSet
trigger1 = time = 150
;trigger2 = !movecontact
x = 10
y = 0
;ignorehitpause = 
;persistent = 

[State 200, Onomatopoeia]
type = Explod
trigger1 = movehit = 1 && numtarget
trigger1 = target, time <= 0 && p2movetype = H
anim = 8011
postype = p1
pos = 12,-21
removetime = -2
ontop = 1
facing = facing
ownpal = 1
ignorehitpause = 1

[State 3025, Explod]
type = Explod
trigger1 = Time = 185
anim = 7103
pos = 30,0
postype = p1
facing = -1
;vfacing = 1
bindtime = 1
vel = -25,0
;random = 0,0
removetime = 11
supermove = 99999999
;pausemovetime = 0
;scale = 1, 1
;sprpriority = 0
ontop = 1
shadow = 0,0,0
;ownpal = 0
;removeongethit = 0
;ignorehitpause = 0
;persistent = 1

[State 3025, Explod]
type = Explod
trigger1 = Time = 185
anim = 7103
pos = 0,-17
postype = p1
;facing = 1
;vfacing = 1
bindtime = 14
vel = -5,0
;random = 0,0
removetime = 15
supermove = 99999999
;pausemovetime = 0
;scale = 1, 1
;sprpriority = 0
ownpal=0
ontop = 1
shadow = 0,0,0
;ignorehitpause = 0
;persistent = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 5
value = S0,2

[State 6000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
;trigger1 = time = 0
value = S1998,1

[State 0, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = -90

[State 191, Comic Text]
type = Explod
trigger1 = animelem = 5
anim = 8012
ID = 8012
sprpriority = -2
postype = p1
pos = 23,-22
scale = 0.8, 0.8
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 52, Dust]
type = Explod
trigger1 = animelem = 5
anim = 7106
ID = 7106
sprpriority = -2
postype = p1
scale = 0.7,0.7
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3024]
type = DestroySelf
trigger1 = time = 186
;trigger1 = AnimElem = 17

;--------------------

;--------------------

;"Assist Mr Mouse!" Thanks
[Statedef 6107]
type = S
movetype = A
physics = S
ctrl = 0
anim = 8130
SprPriority = 3
poweradd = 0
velset = 0,0

[State 0, Pause]
type = Pause
trigger1 = time = 3
time = 60
movetime = 60
ignorehitpause = 1
persistent = 1

[State 6000, PlaySnd]
type = PlaySnd
trigger1 = time =28
;trigger1 = time = 0
value = S1998,0

[State 6000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 6
;trigger1 = time = 0
value = S1998,1

[State 0, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = -90

[State 191, Comic Text]
type = Explod
trigger1 = animelem = 6
anim = 8012
ID = 8012
sprpriority = -2
postype = p1
pos = 23,-22
scale = 0.8, 0.8
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 52, Dust]
type = Explod
trigger1 = animelem = 6
anim = 7106
ID = 7106
sprpriority = -2
postype = p1
scale = 0.7,0.7
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3024]
type = DestroySelf
trigger1 = time = 100
;trigger1 = AnimElem = 17

;--------------------
;ownpal = 0
;removeongethit = 0