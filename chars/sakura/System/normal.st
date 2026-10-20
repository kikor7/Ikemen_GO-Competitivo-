;
; Normal attack a button
;
[Statedef 300]
Type= S
Physics =S
MoveType= A
velset=0,0
ctrl=0
anim=300
facep2=1

[State 221]
Type=Attackdist
triggerall = var(23)=[1,9000]
Trigger1 = time=0
value=0

[State 300,Void]
Type=Explod
Trigger1=Name="Void"
Trigger1=time=0
ID=333
anim=301
bindtime=-1
vfacing=1-2*IsHelper(13151)
removetime=12
removeongethit=1
postype=p1
pos=50,-58*floor(1-1.6*IsHelper(13151))
pausemovetime=9999999
scale=0.3,0.3*(1-0.6*IsHelper(13151))
sprpriority=4
ownpal=1
ignorehitpause=1
trans=sub

[State 300,1]
Type=PlaySnd
Trigger1=time=3
value=300,0

[State 221]
Type=HitDef
Trigger1 = time>1
Trigger1 = !movecontact
Trigger1 = !Movereversed
triggerall = var(23)!=[1,9000]
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*(21*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))),0
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MA                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime =10,10
guard.pausetime=5,5
getpower = 30,15
sparkno = -1                      ;Spark anim no (Def: set above)
guard.sparkno=-1
hitsound = S300,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.slidetime = 14             ;Time that the opponent slides back
ground.hittime  = 16             ;Time opponent is in hit state
ground.velocity = 0,0;-4.8-2.5*(name="Eriol Hiiragizawa"),0             ;Velocity at which opponent is pushed
guard.velocity= -3
air.velocity = 0,0; -3-2*(name="Eriol Hiiragizawa"),0
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
ground.cornerpush.veloff = 0;-4.8-2.5*(name="Eriol Hiiragizawa")
guard.cornerpush.veloff = -5.5-2.5*(name="Eriol Hiiragizawa")
ID=300

[State 221]
Type=HitDef
Trigger1 = time>1
Trigger1 = !movecontact
Trigger1 = !Movereversed
triggerall = var(23)=[1,9000]
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*(21*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))),0
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag =                    ;Flags on how move is to be guarded against
hitflag = MA                   ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime =10,10
guard.pausetime=5,5
getpower = 30,15
;Hit/Miss/Dodge type (Def: Hit)
sparkno = -1                      ;Spark anim no (Def: set above)
guard.sparkno=-1
;Y-offset for the spark rel. to p1
hitsound = S300,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.slidetime = 14             ;Time that the opponent slides back
ground.hittime  = 16             ;Time opponent is in hit state
ground.velocity = 0,0;-4.8-2.5*(name="Eriol Hiiragizawa"),0             ;Velocity at which opponent is pushed
guard.velocity= -3
air.velocity = -0,0; 3-2*(name="Eriol Hiiragizawa"),0
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
ground.cornerpush.veloff = 0;-4.8-2.5*(name="Eriol Hiiragizawa")
guard.cornerpush.veloff = -5.5-2.5*(name="Eriol Hiiragizawa")
ID=300

[State 300]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.92
ignorehitpause=1
persistent=0

[State 301]
Type=TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=NumTarget(300)>0
Trigger1=MoveHit=1
value=43816
ignorehitpause=1

[State -2]
Type = Explod
Triggerall=Name!="Void"
Trigger1 = Movehit=1
anim= 20005
ID = 9300
Pos = 50+20*(Name="Yue")+45*(Name="Eriol Hiiragizawa"),-65-45*(Name="Yue")
Sprpriority=2
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 0
SuperMoveTime = 100
PauseMoveTime = 100
scale = 0.3,0.3

[State -2]
Type = Explod
Trigger1 = Moveguarded=1
anim = 4040
ID = 6011
Pos = 50+20*(Name="Yue")+45*(Name="Eriol Hiiragizawa"),-65-45*(Name="Yue")
Sprpriority=2
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 0
SuperMoveTime = 100
PauseMoveTime = 100

[State -2]
Type = Explod
Triggerall=Name="Void"
Trigger1 = Movehit=1
anim= 20005
ID = 9300
Pos = 50,-65
Sprpriority=2
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 0
SuperMoveTime = 100
PauseMoveTime = 100
scale = 0.3,0.3
trans=sub

[State 300,3]
Type=changeState
Trigger1=Animtime=0
Value=0
ctrl=1


;
; B+b
;
[Statedef 310]
Type= S
Physics =S
MoveType= A
velset=0,0
ctrl=0
anim=310
facep2=1

[State 221]
Type=Attackdist
triggerall = var(23)=[1,9000]
Trigger1 = time=0
value=0

[State 300,Void]
Type=Explod
Trigger1=Name="Void"
Trigger1=time=0
ID=333
anim=311
bindtime=-1
removetime=55
vfacing=1-2*IsHelper(13151)
postype=p1
pos=0,-10
pausemovetime=9999999
scale=0.4,0.4*(1-0.6*IsHelper(13151))
sprpriority=4
ownpal=1
ignorehitpause=1
trans=sub
removeongethit=1

[State 310,1]
Type=PlaySnd
Trigger1=time=3
value=310,0

[State 221]
Type=HitDef
Trigger1 = time>=1
Trigger1 = !Movecontact
Trigger1 = !Movereversed
triggerall = var(23)!=[1,9000]
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*(55*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))),floor(2*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MA                    ;Flags of conditions that move can hit
priority = 7, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 12, 14+15*(Name="Void")     ;Time attacker pauses, time opponent shakes
guard.pausetime=5,5
getpower = 30,15
sparkno = -1                      ;Spark anim no (Def: set above)
guard.sparkno=-1
hitsound = S310,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.slidetime = 15             ;Time that the opponent slides back
ground.hittime  = 15             ;Time opponent is in hit state
ground.velocity = -4,-2             ;Velocity at which opponent is pushed
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.velocity = -6,-2           ;X-velocity at which opponent is pushed,
air.hittime = 15                 ;Time before opponent regains control in air
ground.cornerpush.veloff = -7
guard.cornerpush.veloff = -8
ID=310

[State 221]
Type=HitDef
Trigger1 = time>=1
Trigger1 = !Movecontact
Trigger1 = !Movereversed
triggerall = var(23)=[1,9000]
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*(55*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))),floor(2*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
getpower = 30,15
guardflag =                     ;Flags on how move is to be guarded against
hitflag = MA                    ;Flags of conditions that move can hit
priority = 7, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 12, 14+15*(Name="Void")     ;Time attacker pauses, time opponent shakes
guard.pausetime=5,5
sparkno = -1                      ;Spark anim no (Def: set above)
guard.sparkno = -1
hitsound = S310,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.slidetime = 15             ;Time that the opponent slides back
ground.hittime  = 15             ;Time opponent is in hit state
ground.velocity = -4,-2             ;Velocity at which opponent is pushed
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.velocity = -6,-2           ;X-velocity at which opponent is pushed,
air.hittime = 15                 ;Time before opponent regains control in air
ground.cornerpush.veloff = -7
guard.cornerpush.veloff = -8
ID=310

[State 300]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.88
ignorehitpause=1
persistent=0

[State -2]
Type = Explod
Triggerall=Name!="Void"
Trigger1 = Movehit=1
anim= 20005
ID = 9300
Pos = 55+45*(Name="Eriol Hiiragizawa"),-60
Sprpriority=2
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 0
SuperMoveTime = 100
PauseMoveTime = 100
scale = 0.3,0.3

[State -2]
Type = Explod
Trigger1 = Moveguarded=1
anim = 4040
ID = 6011
Pos = 55+45*(Name="Eriol Hiiragizawa"),-60
Sprpriority=2
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 0
SuperMoveTime = 100
PauseMoveTime = 100

[State -2]
Type = Explod
Triggerall=Name="Void"
Trigger1 = Movehit=1
anim= 20005
ID = 9300
Pos = 0,-60
Sprpriority=2
PosType = P2
Ownpal = 1
IgnoreHitPause = 1
Persistent = 0
SuperMoveTime = 100
PauseMoveTime = 100
scale = 0.3,0.3
trans=sub

[State 301]
Type=TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=NumTarget(310)>0
Trigger1=MoveHit=1
value=43816
ignorehitpause=1

[State 310,3]
Type=changeState
Trigger1=Animtime=0
Value=0
ctrl=1

;
; B+b Counter version
;
[Statedef 315]
Type= S
Physics =S
MoveType= A
velset=0,0
ctrl=0
anim=310
poweradd=0
facep2=1

[State 221]
Type=Attackdist
triggerall = var(23)=[1,9000]
Trigger1 = time=0
value=0

[State 300,Void]
Type=Explod
Trigger1=Name="Void"
Trigger1=time=0
ID=333
anim=311
bindtime=-1
removetime=55
postype=p1
vfacing=1-2*IsHelper(13151)
pos=0,-10*(1-2*IsHelper(13151))
pausemovetime=9999999
scale=0.4,0.4*(1-0.6*IsHelper(13151))
sprpriority=4
ownpal=1
ignorehitpause=1
trans=sub
removeongethit=1

[State 315,1]
Type=PlaySnd
Trigger1=time=3
value=310,0

[State 221]
Type=HitDef
Trigger1 = time>=1
Trigger1 = !Movecontact
Trigger1 = !Movereversed
triggerall = var(23)!=[1,9000]
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*(25*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))),0
getpower = 30,15
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MA                    ;Flags of conditions that move can hit
priority = 7, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 6,6
sparkno = -1                      ;Spark anim no (Def: set above)
hitsound = S310,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.slidetime = 15             ;Time that the opponent slides back
ground.hittime  = 15             ;Time opponent is in hit state
ground.velocity = -7,-2             ;Velocity at which opponent is pushed
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.velocity = -9,-2           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 15                 ;Time before opponent regains control in air
ground.cornerpush.veloff = -7
guard.cornerpush.veloff = -8
ID=315

[State 221]
Type=HitDef
Trigger1 = time>=1
Trigger1 = !Movecontact
Trigger1 = !Movereversed
triggerall = var(23)=[1,9000]
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*(25*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))),0
getpower = 30,15
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MA                    ;Flags of conditions that move can hit
priority = 7, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 6, 6                 ;Time attacker pauses, time opponent shakes
sparkno = -1                      ;Spark anim no (Def: set above)
hitsound = S310,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.slidetime = 15             ;Time that the opponent slides back
ground.hittime  = 15             ;Time opponent is in hit state
ground.velocity = -7,-2             ;Velocity at which opponent is pushed
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.velocity = -9,-2           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 15                 ;Time before opponent regains control in air
ground.cornerpush.veloff = -7
guard.cornerpush.veloff = -8
ID=315

[State 300]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.92
ignorehitpause=1
persistent=0

[State 301]
Type=TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=NumTarget(315)>0
Trigger1=MoveHit=1
value=43816
ignorehitpause=1

[State -2]
Type = Explod
Triggerall=Name!="Void"
Trigger1 = movehit=1
anim= 20005
ID = 9300
Pos = 55+45*(Name="Eriol Hiiragizawa"),-60
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
Trigger1 = moveguarded=1
anim = 4040
ID = 6011
Pos = 55+45*(Name="Eriol Hiiragizawa"),-60
Sprpriority=2
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
SuperMoveTime = 100
PauseMoveTime = 100

[State -2]
Type = Explod
Triggerall=Name="Void"
Trigger1 = movehit=1
anim= 20005
ID = 9300
Pos = 0,-60
Sprpriority=2
PosType = P2
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
SuperMoveTime = 100
PauseMoveTime = 100
scale = 0.3,0.3
trans=sub

[State 315,3]
Type=changeState
Trigger1=Animtime=0
Value=0
ctrl=1

;
; b attack
;
[Statedef 320]
Type= S
Physics =S
MoveType= A
velset=0,0
juggle  = 1
ctrl=0
anim=320
facep2=1

[State 221]
Type=Attackdist
triggerall = var(23)=[1,9000]
Trigger1 = time=0
value=0

[State 300,Void]
Type=Explod
Trigger1=Name="Void"
Trigger1=time=0
ID=320
anim=321
vfacing=1-2*IsHelper(13151)
bindtime=-1
removetime=-1
removeongethit=1
postype=p1
pos=45,-48*floor(1-1.6*IsHelper(13151))
;pausemovetime=9999999
scale=0.4,0.4*(1-0.6*IsHelper(13151))
sprpriority=4
ownpal=1
;ignorehitpause=0
trans=sub

[State 320,1]
Type=PlaySnd
Trigger1=time=3
value=320,0

[State 221]
Type=HitDef
Trigger1 = (name="Eriol Hiiragizawa") && (time=5)
Trigger2 = (name="Eriol Hiiragizawa") && (time=17)
Trigger3 = (name="Eriol Hiiragizawa") && (time=29)
Trigger4 = (name="Sakura Kinomoto") && (time=8)
Trigger5 = (name="Sakura Kinomoto") && (time=12)
Trigger6 = (name="Sakura Kinomoto") && (time=16)
Trigger7 = (name="Shaoran Lee") && (time=8)
Trigger8 = (name="Shaoran Lee") && (time=12)
Trigger9 = (name="Shaoran Lee") && (time=16)
Trigger10 = (name="Void") && (time=4)
Trigger11 = (name="Void") && (time=13)
Trigger12 = (name="Void") && (time=22)
Trigger13 = (name="Yue") && (time=6)
Trigger14 = (name="Yue") && (time=10)
Trigger15 = (name="Yue") && (time=14)
triggerall = var(23)!=[1,9000]
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*((32+8*name="Shaoran Lee"-6*(Name="Sakura Kinomoto"))*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))),floor(3*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))
getpower = 15,7
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 5, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 6, 9                 ;Time attacker pauses, time opponent shakes
sparkno = -1                      ;Spark anim no (Def: set above)
guard.sparkno=-1
hitsound = S320,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.slidetime = 8-2*(name="Eriol Hiiragizawa")-6*((name="Yue") && (time=14))             ;Time that the opponent slides back
ground.hittime  = 14-6*((name="Yue") && (time=14))             ;Time opponent is in hit state
ground.velocity = -1,0
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.velocity = -1,0
air.hittime = 14-6*((name="Yue") && (time=14))                 ;Time before opponent regains control in air
ground.cornerpush.veloff = -3
guard.cornerpush.veloff = -4
guard.kill=0
ID=320

[State 221]
Type=HitDef
Trigger1 = (name="Eriol Hiiragizawa") && (time=5)
Trigger2 = (name="Eriol Hiiragizawa") && (time=17)
Trigger3 = (name="Eriol Hiiragizawa") && (time=29)
Trigger4 = (name="Sakura Kinomoto") && (time=8)
Trigger5 = (name="Sakura Kinomoto") && (time=12)
Trigger6 = (name="Sakura Kinomoto") && (time=16)
Trigger7 = (name="Shaoran Lee") && (time=8)
Trigger8 = (name="Shaoran Lee") && (time=12)
Trigger9 = (name="Shaoran Lee") && (time=16)
Trigger10 = (name="Void") && (time=1)
Trigger11 = (name="Void") && (time=11)
Trigger12 = (name="Void") && (time=21)
Trigger13 = (name="Yue") && (time=6)
Trigger14 = (name="Yue") && (time=10)
Trigger15 = (name="Yue") && (time=14)
triggerall = var(23)=[1,9000]
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*((32+8*name="Shaoran Lee"-6*(Name="Sakura Kinomoto"))*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))),floor(3*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))
getpower = 15,7
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag =                     ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 5, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 6, 9                 ;Time attacker pauses, time opponent shakes
sparkno = -1                      ;Spark anim no (Def: set above)
guard.sparkno=-1
hitsound = S320,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.slidetime = 8-2*(name="Eriol Hiiragizawa")-6*((name="Yue") && (time=14))             ;Time that the opponent slides back
ground.hittime  = 14-6*((name="Yue") && (time=14))             ;Time opponent is in hit state
ground.velocity = -1,0             ;Velocity at which opponent is pushed
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.velocity = -1,0           ;X-velocity at which opponent is pushed,
air.hittime = 14-6*((name="Yue") && (time=14))                 ;Time before opponent regains control in air
ground.cornerpush.veloff = -3
guard.cornerpush.veloff = -4
ID=320

[State 300]
Type=Varset
Trigger1=movehit=1
Trigger1=hitpausetime=6
fvar(39)=fvar(39)*(0.9-0.05*name="Eriol Hiiragizawa")
ignorehitpause=1

[State 301]
Type=TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=NumTarget(320)>0
Trigger1=MoveHit=1
value=43816
ignorehitpause=1

[State -2]
Type = Explod
Triggerall=Name!="Void"
Trigger1 = movehit=1
Trigger1 = hitpausetime=6
ignorehitpause=1
anim= 20005
ID = 9300
Pos = 60+random %10+50*Name="Eriol Hiiragizawa",-60+random %10-20*Name="Yue"
Sprpriority=2
PosType = P1
Ownpal = 1
SuperMoveTime = 999999
PauseMoveTime = 999999
scale = 0.3,0.3

[State -2]
Type = Explod
Trigger1 = NumTarget(320)>0
Trigger1 = moveguarded=1
Trigger1 = hitpausetime=6
ignorehitpause=1
anim = 4040
ID = 6011
Pos = 60+random %10+50*Name="Eriol Hiiragizawa",-60+random %10
Sprpriority=2
PosType = P1
Ownpal = 1
SuperMoveTime = 100
PauseMoveTime = 100

[State -2]
Type = Explod
Triggerall=Name="Void"
Trigger1 = movehit=1
Trigger1 = hitpausetime=6
ignorehitpause=1
anim= 20005
ID = 9300
Pos = 60+random %10+50*Name="Eriol Hiiragizawa",-60+random %10
Sprpriority=2
PosType = P1
Ownpal = 1
SuperMoveTime = 100
PauseMoveTime = 100
scale = 0.3,0.3
trans=sub

[State 320,3]
Type=Removeexplod
Trigger1=Animtime=0
Trigger1=name="Void"
ID=320

[State 320,3]
Type=changeState
Trigger1=Animtime=0
ctrl=1
Value=0

;
; D+a
;
[Statedef 330]
Type= C
Physics =C
MoveType= A
velset=0,0
ctrl=0
anim=330
facep2=1

[State 221]
Type=Attackdist
triggerall = var(23)=[1,9000]
Trigger1 = time=0
value=0

[State 330,1]
Type=PlaySnd
Trigger1=time=3
value=330,0

[State 221]
Type=HitDef
Trigger1 = time>=1
Trigger1 = !Movecontact
Trigger1 = !Movereversed
triggerall = var(23)!=[1,9000]
attr = C, NA                     ;Attribute: Standing, Normal Attack
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*(21*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))),0
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = M                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
getpower = 30,15
pausetime=10,10
guard.pausetime=5,5
;Hit/Miss/Dodge type (Def: Hit)
sparkno = -1                      ;Spark anim no (Def: set above)
guard.sparkno=-1
hitsound = S330,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.slidetime = 12             ;Time that the opponent slides back
ground.hittime  = 16             ;Time opponent is in hit state
ground.velocity = 0,0;-4.8-2.5*(name="Eriol Hiiragizawa"),0             ;Velocity at which opponent is pushed
guard.velocity= -3
air.velocity = -3-5*(name="Yue"),0
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
ground.cornerpush.veloff = 0;-4.8-2.5*(name="Eriol Hiiragizawa")
guard.cornerpush.veloff = -5.5-5*(name="Yue")
ID=330

[State 221]
Type=HitDef
Trigger1 = time>=1
Trigger1 = !Movecontact
Trigger1 = !Movereversed
triggerall = var(23)=[1,9000]
attr = C, NA                     ;Attribute: Standing, Normal Attack
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*(21*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))),0
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag =                    ;Flags on how move is to be guarded against
hitflag = M                    ;Flags of conditions that move can hit
getpower = 30,15
pausetime=10,10
guard.pausetime=5,5
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
sparkno = -1                      ;Spark anim no (Def: set above)
guard.sparkno=-1
hitsound = S330,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.slidetime = 12             ;Time that the opponent slides back
ground.hittime  = 16             ;Time opponent is in hit state
ground.velocity = 0,0;-4.8-2.5*(name="Eriol Hiiragizawa"),0             ;Velocity at which opponent is pushed
guard.velocity= -3
air.velocity = -3-5*(name="Yue"),0
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
ground.cornerpush.veloff = 0;-4.8-2.5*(name="Eriol Hiiragizawa")
guard.cornerpush.veloff = -5.5-5*(name="Yue")
ID=330

[State 300]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.92
ignorehitpause=1
persistent=0

[State 301]
Type=TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=NumTarget(330)>0
Trigger1=MoveHit=1
value=43816
ignorehitpause=1

[State -2]
Type = Explod
Trigger1 = movehit=1
anim= 20005
ID = 9300
Pos = 60+45*Name="Yue",-40
Sprpriority=2
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 0
SuperMoveTime = 100
PauseMoveTime = 100
scale = 0.3,0.3

[State -2]
Type = Explod
Trigger1 = moveguarded=1
anim = 4040
ID = 6011
Pos = 60+45*Name="Yue",-40
Sprpriority=2
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 0
SuperMoveTime = 100
PauseMoveTime = 100

[State 330,3]
Type=changeState
Trigger1=Animtime=0
ctrl=1
Value=11

[Statedef 340]
Type= C
Physics =C
MoveType= A
velset=0,0
ctrl=0
anim=340
facep2=1

[State 221]
Type=Attackdist
triggerall = var(23)=[1,9000]
Trigger1 = time=0
value=0

[State 340,1]
Type=PlaySnd
Trigger1=time=3
value=310,0

[State 221]
Type=HitDef
Trigger1 = time>=1
Trigger1 = !Movecontact
Trigger1 = !Movereversed
triggerall = var(23)!=[1,9000]
attr = C, NA                     ;Attribute: Standing, Normal Attack
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*((55+20*name="Shaoran Lee"-10*(Name="Sakura Kinomoto"))*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))),floor(2*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MA                    ;Flags of conditions that move can hit
getpower = 60,30
priority = 7, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 12, 14                 ;Time attacker pauses, time opponent shakes
guard.pausetime=5,5
sparkno = -1                      ;Spark anim no (Def: set above)
guard.sparkno=-1
hitsound = S340,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.slidetime = 14             ;Time that the opponent slides back
ground.hittime  = 14             ;Time opponent is in hit state
ground.velocity = -3,0             ;Velocity at which opponent is pushed
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.velocity = -5,0           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 14                 ;Time before opponent regains control in air
ground.cornerpush.veloff = -4.8-2*(name="Yue")
guard.cornerpush.veloff = -5.5
ID=340

[State 221]
Type=HitDef
Trigger1 = time>=1
Trigger1 = !Movecontact
Trigger1 = !Movereversed
triggerall = var(23)=[1,9000]
attr = C, NA                     ;Attribute: Standing, Normal Attack
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*((55+20*name="Shaoran Lee"-10*(Name="Sakura Kinomoto"))*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))),floor(2*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
getpower = 60,30
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MA                    ;Flags of conditions that move can hit
priority = 7, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 12, 14                 ;Time attacker pauses, time opponent shakes
guard.pausetime=5,5
sparkno = -1                      ;Spark anim no (Def: set above)
guard.sparkno=-1
hitsound = S340,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.slidetime = 14             ;Time that the opponent slides back
ground.hittime  = 14             ;Time opponent is in hit state
ground.velocity = -3,0             ;Velocity at which opponent is pushed
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.velocity = -5,0           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 14                 ;Time before opponent regains control in air
ground.cornerpush.veloff = -4.8-2*(name="Yue")
guard.cornerpush.veloff = -5.5
ID=340

[State 300]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.88
ignorehitpause=1
persistent=0

[State 301]
Type=TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=NumTarget(340)>0
Trigger1=MoveHit=1
value=43816
ignorehitpause=1

[State -2]
Type = Explod
Trigger1 = movehit=1
anim= 20005
ID = 9300
Pos = 40,-45
Sprpriority=2
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 0
SuperMoveTime = 100
PauseMoveTime = 100
scale = 0.3,0.3

[State -2]
Type = Explod
Trigger1 = moveguarded=1
anim = 4040
ID = 6011
Pos = 40,-45
Sprpriority=2
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 0
SuperMoveTime = 100
PauseMoveTime = 100

[State 340,3]
Type=changeState
Trigger1=Animtime=0
ctrl=1
Value=11

;
; D+b
;
[Statedef 350]
Type= C
Physics =C
MoveType= A
velset=0,0
ctrl=0
anim=350
facep2=1

[State 221]
Type=Attackdist
triggerall = var(23)=[1,9000]
Trigger1 = time=0
value=0

[State 350]
Type=StateTypeSet
Trigger1=time>25
Trigger1=Name="Yue"
MoveType=I

[State 350]
Type=Veladd
Trigger1=time=0
Trigger1=Name="Yue"
X=13

[State 350,1]
Type=PlaySnd
Trigger1=time=3
value=350,0

[State 221]
Type=HitDef
Trigger1 = time>=1
Trigger1 = !Movecontact
Trigger1 = !Movereversed
triggerall = var(23)!=[1,9000]
attr = C, NA                     ;Attribute: Standing, Normal Attack
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*60*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0))),0
getpower = 30,15
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
ground.type=Trip
guardflag = L                    ;Flags on how move is to be guarded against
hitflag = M                    ;Flags of conditions that move can hit
priority = 7, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 0, 0                 ;Time attacker pauses, time opponent shakes
sparkno = -1                      ;Spark anim no (Def: set above)
guard.sparkno=-1
hitsound = S350,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.velocity = 0,0             ;Velocity at which opponent is pushed
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.velocity = 0,0           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
fall=1
ID=350

[State 221]
Type=HitDef
Trigger1 = time>=1
Trigger1 = !Movecontact
Trigger1 = !Movereversed
triggerall = var(23)=[1,9000]
attr = C, NA                     ;Attribute: Standing, Normal Attack
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*60*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0))),0
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
ground.type=Trip
guardflag =                     ;Flags on how move is to be guarded against
getpower = 30,15
hitflag = M                    ;Flags of conditions that move can hit
priority = 7, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 0, 0                 ;Time attacker pauses, time opponent shakes
sparkno = -1                      ;Spark anim no (Def: set above)
guard.sparkno=-1
hitsound = S350,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.velocity = 0,0             ;Velocity at which opponent is pushed
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.velocity = 0,0           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
fall=1
ID=350

[State 300]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.85
ignorehitpause=1
persistent=0

[State 301]
Type=TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=MoveHit=1
Trigger1=NumTarget(350)>0
value=43816
ignorehitpause=1

[State -2]
Type = Explod
Trigger1 = movehit=1
anim= 20005
ID = 9300
Pos = 60+45*Name="Yue",-20
Sprpriority=2
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 0
SuperMoveTime = 100
PauseMoveTime = 100
scale = 0.3,0.3

[State -2]
Type = Explod
Trigger1 = moveguarded=1
anim = 4040
ID = 6011
Pos = 60+45*Name="Yue",-20
Sprpriority=2
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 0
SuperMoveTime = 100
PauseMoveTime = 100

[State 350,3]
Type=changeState
Trigger1=Animtime=0
ctrl=1
Value=11

;
; Air b
;
[Statedef 360]
Type= A
Physics =A
MoveType= A
juggle  = 1
ctrl=0
anim=360
poweradd=0
facep2=1

[State 221]
Type=Attackdist
triggerall = var(23)=[1,9000]
Trigger1 = time=0
value=0

[State 300,Void]
Type=Explod
Trigger1=Name="Void"
Trigger1=time=0
ID=360
anim=321
bindtime=-1
removetime=-1
vfacing=1-2*IsHelper(13151)
postype=p1
pos=45,-48
pausemovetime=9999999
scale=0.4,0.4*(1-0.6*IsHelper(13151))
sprpriority=4
ownpal=1
ignorehitpause=1
trans=sub
removeongethit=1

[State 360,1]
Type=PlaySnd
Trigger1=time=3
value=360,0

[State 360]
Type=VelAdd
Trigger1= vel y>2
y=-0.8

[State 221]
Type=HitDef
Trigger1 = (name="Sakura Kinomoto") && (time=6)
Trigger2 = (name="Sakura Kinomoto") && (time=18)
Trigger3 = (name="Sakura Kinomoto") && (time=30)
Trigger4 = (name="Shaoran Lee") && (time=6)
Trigger5 = (name="Shaoran Lee") && (time=11)
Trigger6 = (name="Shaoran Lee") && (time=16)
Trigger7 = (name="Void") && (time=4)
Trigger8 = (name="Void") && (time=13)
Trigger9 = (name="Void") && (time=22)
Trigger10 = (name="Yue") && (time=7)
Trigger11 = (name="Yue") && (time=11)
Trigger12 = (name="Yue") && (time=14)
triggerall = var(23)!=[1,9000]
attr = A, NA
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*(35+7*name="Shaoran Lee"-7*(Name="Sakura Kinomoto"))*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0))),floor(4*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 5, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
getpower = 30,15
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 6, 6                 ;Time attacker pauses, time opponent shakes
sparkno = -1                      ;Spark anim no (Def: set above)
guard.sparkno=-1
hitsound = S360,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.slidetime = 18-8*(time=30)             ;Time that the opponent slides back
ground.hittime  = 18-8*(time=30)             ;Time opponent is in hit state
ground.velocity = -1,0             ;Velocity at which opponent is pushed
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.velocity = -1,0           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 18-8*(time=30)                 ;Time before opponent regains control in air
ID=360

[State 221]
Type=HitDef
Trigger1 = (name="Sakura Kinomoto") && (time=6)
Trigger2 = (name="Sakura Kinomoto") && (time=18)
Trigger3 = (name="Sakura Kinomoto") && (time=30)
Trigger4 = (name="Shaoran Lee") && (time=6)
Trigger5 = (name="Shaoran Lee") && (time=11)
Trigger6 = (name="Shaoran Lee") && (time=16)
Trigger7 = (name="Void") && (time=4)
Trigger8 = (name="Void") && (time=13)
Trigger9 = (name="Void") && (time=22)
Trigger10 = (name="Yue") && (time=7)
Trigger11 = (name="Yue") && (time=11)
Trigger12 = (name="Yue") && (time=14)
triggerall = var(23)=[1,9000]
attr = A, NA                     ;Attribute: Standing, Normal Attack
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*(35+7*name="Shaoran Lee"-7*(Name="Sakura Kinomoto"))*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0))),floor(4*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0)))
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag =                     ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 5, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 6, 6                 ;Time attacker pauses, time opponent shakes
getpower = 30,15
sparkno = -1                      ;Spark anim no (Def: set above)
guard.sparkno=-1
hitsound = S360,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.slidetime = 18-8*(time=30)             ;Time that the opponent slides back
ground.hittime  = 18-8*(time=30)             ;Time opponent is in hit state
ground.velocity = -1,0             ;Velocity at which opponent is pushed
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.velocity = -1,0           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 18-8*(time=30)                 ;Time before opponent regains control in air
ID=360

[State 300]
Type=Varset
Trigger1=movehit=1
Trigger1=hitpausetime=6
fvar(39)=fvar(39)*0.9
ignorehitpause=1

[State 301]
Type=TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=NumTarget(360)>0
Trigger1=MoveHit=1
value=43816
ignorehitpause=1

[State -2]
Type = Explod
Triggerall = name!="Void"
Trigger1 = movehit=1
Trigger1 = hitpausetime=6
Trigger1 = numtarget(360)>0
anim= 20005
ID = 9300
Pos = Ceil(target(360),Pos X - Pos X)*Facing,Ceil(target(360),Pos Y - Pos Y)+(target(360),Const(Size.Head.Pos.Y))
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
Triggerall = name="Void"
Trigger1 = movehit=1
Trigger1 = hitpausetime=6
Trigger1 = numtarget(360)>0
anim= 20005
ID = 9300
Pos = Ceil(target(360),Pos X - Pos X)*Facing,Ceil(target(360),Pos Y - Pos Y)+(target(360),Const(Size.Head.Pos.Y))
Sprpriority=2
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
SuperMoveTime = 100
PauseMoveTime = 100
scale = 0.3,0.3
trans=sub

[State -2]
Type = Explod
Trigger1 = moveguarded=1
Trigger1 = hitpausetime=6
Trigger1 = numtarget(360)>0
anim = 4040
ID = 6011
Pos = Ceil(target(360),Pos X - Pos X)*Facing,Ceil(target(360),Pos Y - Pos Y)+(target(360),Const(Size.Head.Pos.Y))
Sprpriority=2
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 1
SuperMoveTime = 100
PauseMoveTime = 100

[State 320,3]
Type=Removeexplod
Trigger1=Animtime=0
Trigger1=name="Void"
ID=360

[State 360,3]
Type=changeState
Trigger1=Animtime=0
Trigger2=Pos Y>=0
ctrl=1
Value=50

[Statedef 370]
Type= A
Physics =A
MoveType= A
ctrl=0
anim=370
poweradd=0
facep2=1

[State 221]
Type=Attackdist
triggerall = var(23)=[1,9000]
Trigger1 = time=0
value=0

[State 300,Void]
Type=Explod
Trigger1=Name="Void"
Trigger1=time=0
ID=333
anim=301
bindtime=-1
vfacing=1-2*IsHelper(13151)
removetime=12
postype=p1
pos=50,-58*floor(1-1.6*IsHelper(13151))
pausemovetime=9999999
scale=0.3,0.3*(1-0.6*IsHelper(13151))
sprpriority=4
ownpal=1
ignorehitpause=1
trans=sub
removeongethit=1

[State 370,1]
Type=PlaySnd
Trigger1=time=3
value=370,0

[State 360]
Type=VelAdd
Trigger1= vel y>2
y=-0.8

[State 221]
Type=HitDef
Trigger1 = time>=1
Trigger1 = !Movecontact
Trigger1 = !Movereversed
triggerall = var(23)!=[1,9000]
attr = A, NA                     ;Attribute: Standing, Normal Attack
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*70*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0))),0
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MA                    ;Flags of conditions that move can hit
priority = 7, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 6, 8                 ;Time attacker pauses, time opponent shakes
sparkno = -1                      ;Spark anim no (Def: set above)
getpower = 30,15
guard.sparkno=-1
hitsound = S370,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 5             ;Time opponent is in hit state
ground.velocity = -5,-3             ;Velocity at which opponent is pushed
airguard.velocity = -3,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.velocity = -7,-3           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 5                 ;Time before opponent regains control in air
ID=370

[State 300]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.8
ignorehitpause=1
persistent=0

[State 221]
Type=HitDef
Trigger1 = time>=1
Trigger1 = !Movecontact
Trigger1 = !Movereversed
triggerall = var(23)=[1,9000]
attr = A, NA                     ;Attribute: Standing, Normal Attack
damage = floor(Cond(IsHelper,root,fvar(39),fvar(39))*70*(1+(var(25)>0)*0.7-0.4*(NumHelper(4041)+NumHelper(13211)>0))),0
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag =                     ;Flags on how move is to be guarded against
getpower = 30,15
hitflag = MA                    ;Flags of conditions that move can hit
priority = 7, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 6, 8                 ;Time attacker pauses, time opponent shakes
sparkno = -1                      ;Spark anim no (Def: set above)
guard.sparkno=-1
hitsound = S370,1                  ;Sound to play on hit
guardsound = S0,201                ;Sound to play on guard
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 5             ;Time opponent is in hit state
ground.velocity = -5,-3             ;Velocity at which opponent is pushed
airguard.velocity = -3,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.velocity = -7,-3           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 5                 ;Time before opponent regains control in air
ID=370

[State 301]
Type=TargetState
Triggerall=Numtarget
Triggerall=target,stateno!=[120,160]
Trigger1=NumTarget(370)>0
Trigger1=MoveHit=1
value=43816
ignorehitpause=1

[State -2]
Type = Explod
Trigger1 = NumTarget(370)>0
Trigger1 = movehit=1
anim= 20005
ID = 9300
Pos = Ceil(target(370),Pos X - Pos X)*Facing,Ceil(target(370),Pos Y - Pos Y)+(target(370),Const(Size.Mid.Pos.Y))
Sprpriority=2
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 0
SuperMoveTime = 100
PauseMoveTime = 100
scale = 0.3,0.3

[State -2]
Type = Explod
Trigger1 = NumTarget(370)>0
Trigger1 = moveguarded=1
anim = 4040
ID = 6011
Pos = Ceil(target(370),Pos X - Pos X)*Facing,Ceil(target(370),Pos Y - Pos Y)+(target(370),Const(Size.Mid.Pos.Y))
Sprpriority=2
PosType = P1
Ownpal = 1
IgnoreHitPause = 1
Persistent = 0
SuperMoveTime = 100
PauseMoveTime = 100

[State 310,3]
Type=changeState
Trigger1=Animtime=0
Trigger2=Pos Y>=0
ctrl=1
Value=50
