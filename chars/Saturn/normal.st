; Standing A - Nut kick
[Statedef 200]
Type= S
Physics =S
MoveType= A
velset=0,0
ctrl=0
anim=200
facep2=1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Animelem=2
value = S200,1

[State 200,2]
type = HitDef
Triggerall = (!movecontact) && (!movereversed)
Trigger1 = time 
attr = S, NA                     ;Attribute: Standing, Normal Attack
getpower = 30,15
damage = floor(fvar(39)*40),0
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MA                    ;Flags of conditions that move can hit
priority = 6, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 12, 12                 ;Time attacker pauses, time opponent shakes
guard.pausetime = 5,5
sparkno = S7002                      ;Spark anim no (Def: set above)
guard.sparkno=S4040
SparkXY = -10,-40
hitsound = S0,3
guardsound = S2000,2
ground.slidetime = 11
ground.hittime  = 11
guard.hittime = 8
ground.velocity = 0,0
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
ground.type = Low
air.type = Low                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1,-3
ID=200

[State 200]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.91
ignorehitpause=1
persistent=0

[State 200,3]
Type=changeState
Trigger1=Animtime=0
ctrl=1
Value=0

; Standing B - High kick
[Statedef 210]
Type= S
Physics =S
MoveType= A
velset=0,0
ctrl=0
anim=210
facep2=1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Animelem=2
value = S200,1

[State 200,2]
type = HitDef
Triggerall = (!movecontact) && (!movereversed)
Trigger1 = time 
attr = S, NA                     ;Attribute: Standing, Normal Attack
getpower = 30,15
damage = floor(fvar(39)*60),0
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MA                    ;Flags of conditions that move can hit
priority = 6, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 12, 12                 ;Time attacker pauses, time opponent shakes
guard.pausetime = 5,5
sparkno = S7002                      ;Spark anim no (Def: set above)
guard.sparkno=S4040
SparkXY = -10,-70
hitsound = S0,3
guardsound = S2000,2
ground.slidetime = 14
ground.hittime  = 14
guard.hittime = 10
ground.velocity = 0,0
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
ground.type = High
air.type = Low
air.velocity = -1,-3
ID=210

[State 200]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.85
ignorehitpause=1
persistent=0

[State 200,3]
Type=changeState
Trigger1=Animtime=0
ctrl=1
Value=0

; Standing C - Roundhouse Kick
[Statedef 220]
Type= S
Physics =S
MoveType= A
velset=0,0
ctrl=0
anim=220
facep2=1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Animelem=3
value = S200,2

[State x]
Type=Nothitby
Trigger1=Animelem=4,<0
Trigger1=prevstateno=[150,155]
value=,NA,SA

[State 0, Explod]
type = Explod
trigger1 = Animelem=4
anim = 1201
ID = 220
pos = 40,-45
postype = p1  
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 0.4,0.2
sprpriority = -1
ownpal = 1
removeongethit = 1

[State 200,2]
type = HitDef
Trigger1 = Animelem=4
attr = S, NA                     ;Attribute: Standing, Normal Attack
getpower = 30,15
damage = floor(fvar(39)*70),0
animtype = DiagUp
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MA                    ;Flags of conditions that move can hit
priority = 6, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 12, 12                 ;Time attacker pauses, time opponent shakes
guard.pausetime = 5,5
sparkno = S7002                      ;Spark anim no (Def: set above)
guard.sparkno=S4040
SparkXY = -10,-40
hitsound = S0,202
guardsound = S2000,2
ground.slidetime = 11
ground.hittime  = 11
guard.hittime = 5
guard.ctrltime = 5
ground.velocity = -6,-4
airguard.velocity = -1,-3     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
ground.type = High
air.type = Low                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -4,-3
ID=220
fall=1
fall.recovertime=15

[State 200]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.8
ignorehitpause=1
persistent=0

[State 2700,Spark]
Type=Helper
Trigger1=MoveHit=1
Stateno=6130
ID=6130
Name="Hitspark"
Pos = 30,-50
PosType=P1
ownpal=1
ignorehitpause=1
persistent=0


[State 200,3]
Type=changeState
Trigger1=Animtime=0
ctrl=1
Value=0


; Crouching A - kick
[Statedef 400]
Type= C
Physics =C
MoveType= A
velset=0,0
ctrl=0
anim=400
facep2=1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Animelem=2
value = S200,1

[State 200,2]
type = HitDef
Triggerall = (!movecontact) && (!movereversed)
Trigger1 = time 
attr = C, NA                     ;Attribute: Standing, Normal Attack
getpower = 30,15
damage = floor(fvar(39)*30),0
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = LA                    ;Flags on how move is to be guarded against
hitflag = M                    ;Flags of conditions that move can hit
priority = 6, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 12, 12                 ;Time attacker pauses, time opponent shakes
guard.pausetime = 5,5
sparkno = S7002                      ;Spark anim no (Def: set above)
guard.sparkno=S4040
SparkXY = -10,-10
hitsound = S0,3
guardsound = S2000,2
ground.slidetime = 11
ground.hittime  = 11
guard.hittime = 8
ground.velocity = 0,0
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
ground.type = Low
air.type = Low                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1,-3
ID=200

[State 200]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.91
ignorehitpause=1
persistent=0

[State 200,3]
Type=changeState
Trigger1=Animtime=0
ctrl=1
Value=11

; Crouching B - stab
[Statedef 410]
Type= C
Physics =C
MoveType= A
velset=0,0
ctrl=0
anim=410
facep2=1

[State x]
Type=Attackdist
Trigger1=1
value=110

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Animelem=2
value = S200,1

[State 200,2]
type = HitDef
Triggerall = (!movecontact) && (!movereversed)
Trigger1 = time 
attr = C, NA                     ;Attribute: Standing, Normal Attack
getpower = 30,15
damage = floor(fvar(39)*50),3
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = LA                    ;Flags on how move is to be guarded against
hitflag = MA                    ;Flags of conditions that move can hit
priority = 6, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 12, 12                 ;Time attacker pauses, time opponent shakes
guard.pausetime = 5,5
sparkno = S205
guard.sparkno=S4040
SparkXY = -10,-42
hitsound = S200,0
guardsound = S2000,2
ground.slidetime = 11
ground.hittime  = 11
guard.hittime = 8
ground.velocity = 0,0
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
ground.type = Low
air.type = Low                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1,-3
ID=200

[State 200]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.88
ignorehitpause=1
persistent=0

[State 200,3]
Type=changeState
Trigger1=Animtime=0
ctrl=1
Value=11

; Crouching C - kick
[Statedef 420]
Type= C
Physics =C
MoveType= A
velset=0,0
ctrl=0
anim=420
facep2=1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Animelem=2
value = S200,1

[State 200,2]
type = HitDef
Triggerall = (!movecontact) && (!movereversed)
Trigger1 = time 
attr = C, NA                     ;Attribute: Standing, Normal Attack
getpower = 30,15
damage = floor(fvar(39)*75),0
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = LA                    ;Flags on how move is to be guarded against
hitflag = M                    ;Flags of conditions that move can hit
priority = 6, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
guard.pausetime = 5,5
sparkno = S7002                      ;Spark anim no (Def: set above)
guard.sparkno=S4040
SparkXY = -10,-10
hitsound = S0,202
guardsound = S2000,2
ground.slidetime = 11
ground.hittime  = 11
guard.hittime = 8
ground.velocity = 0,0
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
ground.type = Low
air.type = Low                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1,-3
ID=200
fall=1
fall.recover=0

[State 2700,Spark]
Type=Helper
Trigger1=MoveHit=1
Stateno=6130
ID=6130
Name="Hitspark"
Pos = 50,-20
PosType=P1
ownpal=1
ignorehitpause=1
persistent=0

[State 200]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.8
ignorehitpause=1
persistent=0

[State 200,3]
Type=changeState
Trigger1=Animtime=0
ctrl=1
Value=11


; DFA - Skullbreaker
[Statedef 300]
Type= S
Physics =S
MoveType= A
velset=0,0
ctrl=0
anim=300
facep2=1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Animelem=3
value = S200,2

[State 200,2]
type = HitDef
Trigger1 = Animelem=3
attr = S, SA                     ;Attribute: Standing, Normal Attack
getpower = 60,30
damage = floor(fvar(39)*90),0
animtype = DiagUp
guardflag = HA                    ;Flags on how move is to be guarded against
hitflag = MA                    ;Flags of conditions that move can hit
priority = 6, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 12, 12                 ;Time attacker pauses, time opponent shakes
guard.pausetime = 5,5
sparkno = S7002                      ;Spark anim no (Def: set above)
guard.sparkno=S4040
SparkXY = -10,-40
hitsound = S0,202
guardsound = S2000,2
ground.slidetime = 11
ground.hittime  = 11
guard.hittime = 3
guard.ctrltime = 3
ground.velocity = 0,0
airguard.velocity = 0,0
ground.type = High
air.type = Low
air.velocity = 0,0
ID=300
fall=1
fall.recover=0

[State 200]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.8
ignorehitpause=1
persistent=0

[State 2700,Spark]
Type=Helper
Trigger1=MoveHit=1
Stateno=6130
ID=6130
Name="Hitspark"
Pos = 30,-45
PosType=P1
ownpal=1
ignorehitpause=1
persistent=0

[State 200,3]
Type=changeState
Trigger1=Animtime=0
ctrl=1
Value=0



; DFB - Launcher
[Statedef 310]
Type= S
Physics =S
MoveType= A
velset=0,0
ctrl=0
anim=310
facep2=1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Animelem=2
value = S200,2

[State 200,2]
type = HitDef
Triggerall = (!movecontact) && (!movereversed)
Trigger1 = time 
attr = S, SA   
getpower = 60,30
damage = floor(fvar(39)*72),3
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MA                    ;Flags of conditions that move can hit
priority = 6, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
guard.pausetime = 5,5
sparkno = S205
guard.sparkno=S4040
SparkXY = -10,-42
hitsound = S200,0
guardsound = S2000,2
ground.slidetime = 24
ground.hittime  = 8
guard.hittime = 8
ground.velocity = 0,-9
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
ground.type = Low
air.type = Low                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = 0,-9
ID=310
fall = 1
fall.recover = 0

[State 200]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.8
ignorehitpause=1
persistent=0

[State 200]
Type=Changestate
Triggerall=Movehit>=1
Trigger1=var(59)=0
Trigger1=command="holdup"
Trigger2=var(59)>0
Trigger2=random<var(50)*2
Trigger2=AiLevel>=3
value=40
ctrl=1

[State 200,3]
Type=changeState
Trigger1=Animtime=0
ctrl=1
Value=0

; DFC - Triple Combo
[Statedef 320]
Type= S
Physics =S
MoveType= A
velset=0,0
ctrl=0
anim=320
facep2=1

[State 0, PlaySnd]
type = Attackdist
trigger1 = 1
value=120

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Animelem=3
trigger2 = Animelem=7
trigger3 = Animelem=11
value = S200,2

[State 200,2]
type = HitDef
Trigger1 = animelem=3
attr = S, SA   
getpower = 20,10
damage = floor(fvar(39)*45),3
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MA                    ;Flags of conditions that move can hit
priority = 6, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 8, 0               ;Time attacker pauses, time opponent shakes
guard.pausetime = 5,5
sparkno = S205
guard.sparkno=S4040
SparkXY = -10,-42
hitsound = S200,0
guardsound = S2000,2
ground.slidetime = 32
ground.hittime  = 32
guard.hittime = 32
ground.velocity = 5,0
guard.velocity=0
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
ground.type = High
air.type = Low                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = 0,0
ID=320

[State 200,2]
type = HitDef
Trigger1 = animelem=7
attr = S, SA   
getpower = 20,10
damage = floor(fvar(39)*45),3
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MA                    ;Flags of conditions that move can hit
priority = 6, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
guard.pausetime = 5,5
sparkno = S205
guard.sparkno=S4040
SparkXY = -10,-42
hitsound = S200,0
guardsound = S2000,2
ground.slidetime = 24
ground.hittime  = 24
guard.hittime = 24
ground.velocity = -2,0
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
ground.type = Low
air.type = Low                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = 0,0
ID=320

[State 200,2]
type = HitDef
Trigger1 = Animelem=11
attr = S, NA                     ;Attribute: Standing, Normal Attack
getpower = 20,10
damage = floor(fvar(39)*40),0
animtype = Medium
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MA                    ;Flags of conditions that move can hit
priority = 6, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
guard.pausetime = 5,5
sparkno = S7002                      ;Spark anim no (Def: set above)
guard.sparkno=S4040
SparkXY = -10,-70
hitsound = S0,3
guardsound = S2000,2
ground.slidetime = 24
ground.hittime  = 24
guard.hittime = 3
ground.velocity = 0,0
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
ground.type = High
air.type = Low                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1,-3
ID=200

[State 200]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.9

[State 200,3]
Type=changeState
Trigger1=Animtime=0
Trigger2=Animelem=6
Trigger2=!Movehit
ctrl=1
Value=0

; DDB - Toeblaster
[Statedef 330]
Type= S
Physics =S
MoveType= A
velset=0,0
ctrl=0
anim=330
facep2=1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Animelem=3
value = S200,2

[State 200,2]
type = HitDef
Trigger1 = Animelem=3
attr = S, SA                     ;Attribute: Standing, Normal Attack
getpower = 60,30
damage = floor(fvar(39)*60),0
animtype = Heavy
guardflag = LA                    ;Flags on how move is to be guarded against
hitflag = M                    ;Flags of conditions that move can hit
priority = 6, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 12, 12                 ;Time attacker pauses, time opponent shakes
guard.pausetime = 5,5
sparkno = S7002                      ;Spark anim no (Def: set above)
guard.sparkno=S4040
SparkXY = -10,-40
hitsound = S0,202
guardsound = S2000,2
ground.slidetime = 14
ground.hittime  = 14
guard.hittime = 3
guard.ctrltime = 3
ground.velocity = 0,0
airguard.velocity = 0,0
ground.type = Low
air.type = Low
air.velocity = 0,0
ID=330

[State 200]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.85
ignorehitpause=1
persistent=0

[State 2700,Spark]
Type=Helper
Trigger1=MoveHit=1
Stateno=6130
ID=6130
Name="Hitspark"
Pos = 30,-15
PosType=P1
ownpal=1
ignorehitpause=1
persistent=0

[State 200,3]
Type=changeState
Trigger1=Animtime=0
ctrl=1
Value=11

; Air Slash (a)
[Statedef 600]
Type= A
Physics =A
MoveType= A
ctrl=0
anim=620
facep2=1
poweradd = 0
juggle=2

[State x]
Type=Attackdist
Trigger1=1
value=120

[State 600]
Type=VelSet
Trigger1=vel Y<=-5
Y=-5

[State 200,1]
Type=PlaySnd
Trigger1=time=3
value=200,1

[State 200,2]
type = HitDef
Triggerall = (!movecontact) && (!movereversed)
Trigger1 = time 
attr = A, NA                     ;Attribute: Standing, Normal Attack
getpower = 30,15
damage = floor(fvar(39)*40),1
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 6, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 10, 10                 ;Time attacker pauses, time opponent shakes
guard.pausetime = 5,5
sparkno = S205                     ;Spark anim no (Def: set above)
guard.sparkno=S4040
sparkxy = 0,-70
hitsound = S200, 0                  ;Sound to play on hit
ground.slidetime = 12             ;Time that the opponent slides back
ground.hittime  = 12             ;Time opponent is in hit state
ground.velocity = 0,0             ;Velocity at which opponent is pushed
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = 0,0           ;X-velocity at which opponent is pushed,
guard.kill=0

[State 200]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.84
ignorehitpause=1
persistent=0

[State 200,3]
Type=changeState
Trigger1=Animtime=0
Value=50
ctrl=1

; Air Divekick (b)
[Statedef 610]
Type     = A
MoveType = A
Physics  = A
Anim     = 610
Ctrl     = 0
Facep2   = 1
juggle = 3

[State 600]
Type=VelSet
Trigger1=vel Y<=-5
Y=-5

[State 620]
Type=velset
Trigger1=animelem=3
X=5.5
Y=0

[State 600]
Type=VelSet
Trigger1=AnimElem=3
Trigger1=P2dist X!=0
Y=5.5*((P2dist Y+(enemynear,const(size.head.pos.y)+30)*((P2statetype=S)+(P2statetype=A))+(enemynear,const(size.mid.pos.y)+10)*(P2statetype=C))/P2dist X)

[State 600]
Type=VelSet
Trigger1=AnimElem=3
Trigger1=vel Y<-1
Y=-1

[State 600]
Type=VelSet
Triggerall=AnimElem=3
Trigger1=vel Y>8
Trigger2=P2statetype=L
Trigger3=P2dist X=0
Y=8

[State 620]
Type=velmul
Trigger1=animelem=5,>=0
X=0.94

[State 620]
Type=gravity
Trigger1=animelem=5,>=0

[State 200]
Type = PlaySnd
Trigger1 = Time=0
Value = s200,1

[State 610]
Type = HitDef
Trigger1 = AnimElem = 3,=0
attr = A,NA
hitflag = MAF
guardflag = HA 
animtype = hard
air.animtype = hard
priority = 2,miss
pausetime = 10,10
guard.pausetime =5,5
damage = floor(fvar(39)*78),0
getpower = 30,15
sparkno = S7002                      ;Spark anim no (Def: set above)
guard.sparkno=S4040
SparkXY = 0,10
hitsound = S0,202
guardsound = S2000,2
ground.type = High      ;Low,Trip,None
ground.slidetime= 13
ground.hittime= 25
ground.velocity = -2.5,-4
air.velocity = -2.5,-4
airguard.velocity = -2.5,-4
fall = 1
ID = 610

[State Idle]
Type=Statetypeset
Trigger1=Animelem=5
;Trigger2=Movecontact
;Trigger3=Movereversed
movetype=I
ignorehitpause=1

[State 2700,Spark]
Type=Helper
Trigger1=NumTarget(610)>0
Trigger1=Enemy(0),GetHitvar(chainID) = 610
Trigger1=NumHelper(6130)=0
Trigger1=MoveHit
Stateno=6130
ID=6130
Name="Hitspark"
Pos = Ceil(Enemy(0),Pos X - Pos X)*Facing,Ceil(Enemy(0),Pos Y - Pos Y)+(Enemy(0),Const(Size.Head.Pos.Y))
PosType=P1
ownpal=1
persistent=0
ignorehitpause=1

[State 600]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 50
ctrl=1


; Strong Air Slash (c)
[Statedef 620]
Type= A
Physics =A
MoveType= A
ctrl=0
anim=600
facep2=1
poweradd = 0
juggle=2

[State x]
Type=Attackdist
Trigger1=1
value=120

[State 600]
Type=VelSet
Trigger1=vel Y<=-5
Y=-5

[State 200,1]
Type=PlaySnd
Trigger1=time=3
value=200,1

[State 200,2]
type = HitDef
Triggerall = (!movecontact) && (!movereversed)
Trigger1 = time 
attr = A, NA                     ;Attribute: Standing, Normal Attack
getpower = 30,15
damage = floor(fvar(39)*70),1
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 6, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 5,0           ;Time attacker pauses, time opponent shakes
guard.pausetime = 5,5
sparkno = S205                     ;Spark anim no (Def: set above)
guard.sparkno=S4040
sparkxy = 0,-70
hitsound = S200, 0                  ;Sound to play on hit
ground.slidetime = 12             ;Time that the opponent slides back
ground.hittime  = 12             ;Time opponent is in hit state
ground.velocity = -6,3             ;Velocity at which opponent is pushed
airguard.velocity = -3,3     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -6,3           ;X-velocity at which opponent is pushed,
guard.kill=0
fall=1
fall.recover=0

[State 200]
Type=Varset
Trigger1=movehit=1
fvar(39)=fvar(39)*0.84
ignorehitpause=1
persistent=0

[State 200,3]
Type=changeState
Trigger1=Animtime=0
Value=50
ctrl=1
