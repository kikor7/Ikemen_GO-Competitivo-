;LLegando
[Statedef 2699]
type = S
movetype = A
anim = 2701
velset = 5,0,0

[State 2699, 1]
type = Varset
trigger1 = Time = 0
v = 29
value = 0

[State 2699, 1]
type = MakeDust
trigger1 = TimeMod = 10, 0
pos = -5,-2
spacing = 1

[State 2699, 2]
type = SprPriority
trigger1 = Time >= 0
value = -2

[State 2699, 3]
type = Velset
trigger1 = RootDist X < 10
x = 0

[State 2699, 4]
type = ChangeState
trigger1 = RootDist X < 10
trigger2 = Vel X = 0
value = 2700

[State 2699, 4]
type = PlaySnd
trigger1 = animelem = 4
value = 2,1
volume = 100

[State 2699, 3]
type = EnvShake
trigger1 = animelem = 4
time = 22
ampl = 3
freq = 90
phase = 8

[State 2699, 5]
type = Explod
Trigger1 = animelem = 4
anim = 2005
ID = 2005
offset = 0, 0
velocity = 0
projremovetime = 20
SprPriority = -4
;---------------------------------------------------------------------------
; MONSTRUO
[Statedef 2700]
type = S
movetype = A
facep2 = 1
anim = 2700
velset = 0,0,0

[State 2700, 2]
type = changeanim
trigger1 = parent, life = 0
;trigger1 = var(29) = 1
value = 2702

[State 2700, 3]
type = SprPriority
trigger1 = Time >= 0
value = -2


[State 2700, RIGHT]
type = ChangeState
triggerall = RootDist X > 10
trigger1 = Random < 10
trigger1 = parent, life > 0
value = 2720

[State 2700, LEFT]
type = ChangeState
triggerall = RootDist X < 10
trigger1 = Random < 10
trigger1 = parent, life > 0
value = 2721

[State 2700, LEFT_LOST]
type = ChangeState
triggerall = NumHelper(2700) = 1
trigger1 = parent, life <= 0
trigger2 = parent, stateno = [170,180]
trigger3 = parent, stateno = 9527
value = 2726

[State 2700, 4];raja
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 9523 
value = 9524

[State 2700, 5];bite
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 9521 
value = 9530

[State 2700, 6];Crash
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 9525 
value = 9000

[State 2700, 8];garraso fuerte
type = ChangeState
triggerall = parent, life > 0
triggerall = StateNo = 2700 && time >= 10
;trigger1 = Random < 9999
trigger1 = parent, StateNo = 210
trigger2 = parent, StateNo = 410
value = 251

[State 2700, 9];lenguetaso fuerte
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 610
value = 2052
persistent = 0

;[State 2700, 8]
;type = VelSet
;trigger1 = Time >= 0
;x = 0
;y = 0
;z = 0

[State 2700, 9]
type = ChangeState
trigger1 = AnimTime = 0
value = 2700


; MONSTRUO LOSE POSE
[Statedef 2702]
type = S
movetype = A
facep2 = 1
anim = 2700
velset = 0,0,0

[State 2702, 3]
type = SprPriority
trigger1 = Time >= 0
value = -4
;---------------------------------------------------------------------------
;CORRIENDO ADELANTE
[Statedef 2720]
type = S
movetype = A
anim = 2701
velset = 5,0,0

[State 2720, 1]
type = Varset
trigger1 = Time = 0
v = 29
value = 0

[State 2720, 1]
type = MakeDust
trigger1 = TimeMod = 10, 0
pos = -5,-2
spacing = 1

[State 2720, 2]
type = SprPriority
trigger1 = Time >= 0
value = -2

[State 2720, 3]
type = Velset
trigger1 = RootDist X < 10
x = 0

[State 2720, 4]
type = ChangeState
trigger1 = RootDist X < 10
trigger2 = Vel X = 0
value = 2700

[State 2720, 4]
type = PlaySnd
trigger1 = animelem = 4
value = 2,1
volume = 100

[State 190, 3]
type = EnvShake
trigger1 = animelem = 4
time = 22
ampl = 3
freq = 90
phase = 8

[State 2720, 5]
type = Explod
Trigger1 = animelem = 4
anim = 2005
ID = 2005
offset = 0, 0
velocity = 0
projremovetime = 20
SprPriority = -4

[State 2720, 6];Crash
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 9525 
value = 9000

[State 2720, 9];lenguetaso fuerte
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 610
value = 2052

[State 2720, 8];garraso fuerte
type = ChangeState
triggerall = parent, life > 0
triggerall = StateNo = 2700 && time >= 10
;trigger1 = Random < 9999
trigger1 = parent, StateNo = 210
trigger2 = parent, StateNo = 410
value = 251
;---------------------------------------------------------------------------
;corriendo atras
[Statedef 2721]
type = S
movetype = A
anim = 2703
velset = -5, 0, 0

[State 2721, 1]
type = Varset
trigger1 = Time = 0
v = 29
value = 1

[State 2721, 1]
type = MakeDust
trigger1 = TimeMod = 10, 0
pos = -5,-2
spacing = 1

[State 2721, 1]
type = SprPriority
trigger1 = Time >= 0
value = -2

[State 2721, 1]
type = Velset
trigger1 = RootDist X > 10
x = 0

[State 2721, 1]
type = ChangeState
trigger1 = RootDist X > 10
trigger2 = Vel X = 0
value = 2700

[State 2721, 4]
type = PlaySnd
trigger1 = animelem = 4
value = 2,1
volume = 100

[State 190, 3]
type = EnvShake
trigger1 = animelem = 4
time = 22
ampl = 3
freq = 90
phase = 8

[State 2721, 5]
type = Explod
Trigger1 = animelem = 4
anim = 2005
ID = 2005
offset = 0, 0
velocity = 0
projremovetime = 20
SprPriority = -4

[State 2721, 5]
type = SprPriority
trigger1 = Time = 0
value = -3

[State 2721, 6];Crash
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 9525 
value = 9000

[State 2721, 9];lenguetaso fuerte
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 610
value = 2052

[State 2721, 8];garraso fuerte
type = ChangeState
triggerall = parent, life > 0
triggerall = StateNo = 2700 && time >= 10
;trigger1 = Random < 9999
trigger1 = parent, StateNo = 210
trigger2 = parent, StateNo = 410
value = 251
;---------------------------------------------------------------------------
;ADELANTE DERROTADO
[Statedef 2725]
type = S
movetype = A
anim = 2701
velset = 5,0,0

[State 2725, 1]
type = Varset
trigger1 = Time = 0
v = 29
value = 0

[State 2725, 1]
type = MakeDust
trigger1 = TimeMod = 10, 0
pos = -5,-2
spacing = 1

[State 2725, 2]
type = SprPriority
trigger1 = Time >= 0
value = -2

[State 2725, 3]
type = Velset
trigger1 = RootDist X < 10
x = 0

[State 2725, 4]
type = ChangeState
trigger1 = RootDist X < 10
value = 2702

;---------------------------------------------------------------------------
;-----------------------------------------------------------
;MOSTRO ARROJADNDO LA RAJA
[Statedef 9524]
type    = A
movetype= A
physics = N
juggle = 3
facep2 = 1
ctrl = 0
anim = 9522

[State 9524, 1]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 1

[State 9524, Super A]
type = SuperPause
trigger1 = animelem = 4
pos =  25, -100
time = 25

[State 9524, 5]
type = poweradd
trigger1 = animelem = 4
value = -1000

[State 9524, 51]
type = EnvColor
trigger1 = animelem = 5
value = 245,245,245
time = 3

[State 9524, Super B]
type = PlaySnd
trigger1 = animelem = 3
value = 1000, 3

[State 9524, Super E]
type = AfterImageTime
trigger1 = Time = [0,300]
time = 2

[State 9524, random x]
type = VarRandom
trigger1 = animelem = 3
v = 1
range = 0,2

;[State 9523, Super B]
;type = PlaySnd
;trigger1 = animelem = 3,=1
;value = 1000,2, var(1)
;volume = 50
        
[State 9524, 15]
type = PlaySnd
trigger1 = animelem = 5,=1
value = 3,7
volume = 250

[State 9524, 6]
type = Projectile
trigger1 = AnimElem = 5,=1
projanim = 7110
projid = 7110
projremovetime = 24
projhitanim = 7111
projpriority = 50
projshadow = -1
offset = 0, 0
velocity = 0
attr = S, HP
damage   = 500, 150
animtype = HEAVY
guardflag = MA
hitflag = MAFDP
pausetime = 0,12
hitsound   = S3,7
sparkxy = 30,-5
;guardsound = S4,7
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -3,-6
air.juggle = 3
air.fall = 1
down.velocity = -3,-6
down.hittime = 30
down.bounce = 1
fall.recover = 0

[State 9524, 42] ;antes23
type = ChangeState
trigger1 = animtime = 0
value = 2700

;----------------------------------------------------------------------------------------------
;MOSTRO corriendo para envestir
[Statedef 9530]
type    = A
movetype= A
physics = N
juggle = 3
facep2 = 1
ctrl = 0
velset = 10,0,0
anim = 9524

[State 9530, 1]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 9530, 5]
type = poweradd
trigger1 = animelem = 4
value = 0

[State 9530, Super B]
type = PlaySnd
trigger1 = animelem = 2
value = 2,0

[State 9530, Super E]
type = AfterImageTime
trigger1 = Time = [0,300]
time = 2

        
[State 9530, 15]
type = PlaySnd
trigger1 = animelem = 4
value = 2,1

[State 9530, 16]
type = EnvShake
trigger1 = animelem = 4
time = 22
ampl = 3
freq = 90
phase = 8

[State 9530, 5]
type = Explod
Trigger1 = animelem = 4
anim = 2005
ID = 2005
offset = 0, 0
velocity = 0
projremovetime = 20
SprPriority = -4

[State 9530, 6]
type = HitDef
trigger1 = animelem = 1
trigger2 = animelem = 2
trigger3 = animelem = 3
trigger4 = animelem = 4
trigger5 = animelem = 5
P2stateno = 9532 
attr = S, NA
animtype  = hard
damage    = 10,5
guardflag = MA
pausetime = 0,20
sparkno = 0
sparkxy = -10,-37
hitsound   = 5,1
guardsound = 6,0
ground.type = Low
ground.slidetime = 10
ground.hittime  = 12
ground.velocity = 0
air.velocity = 0,2
air.juggle = 3
air.fall = 0
down.velocity = 0,-2
down.hittime = 30
down.bounce = 0
kill = 0
snap = 30,0

[State 9530, 42]
type = ChangeState
trigger1 = MoveHit = 1
;trigger1 = P2BodyDist X <= 4
value = 9531

[State 9530, 44]
type = ChangeState
trigger1 = animtime = 0
value = 2721

;next bite----------------------------
[Statedef 9531]
type    = A
movetype= A
physics = N
juggle = 3
facep2 = 1
ctrl = 0
velset = 0,0,0
anim = 9523;bite

[State 9531, 1]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 9531, 4]
type = PlaySnd
Trigger1 = animelem = 3
Trigger2 = animelem = 6
trigger3 = animelem = 9
trigger4 = animelem = 12
value = 2,5
volume = 100
sprpriority = 1

[State 9531, 1]
type = Explod
Trigger1 = animelem = 3
Trigger2 = animelem = 6
trigger3 = animelem = 9
trigger4 = animelem = 12
anim = 1600
ID = 1600
pos = 2,-42
velocity = 0
removeongethit = 1
SprPriority = 2

[State 9531, 2]
type = EnvColor
trigger1 = animelem = 3
trigger2 = animelem = 6
trigger3 = animelem = 9
trigger4 = animelem = 12
value = 245,245,245
time = 1

[State 9531, 6]
type = HitDef
trigger1 = animelem = 3
trigger2 = animelem = 6
trigger3 = animelem = 9
;trigger4 = animelem = 8
P2stateno = 9532 
attr = S, NA
animtype  = hard
damage    = 20
;guardflag = MA
pausetime =12,20
sparkno = 0
sparkxy = -10,-37
hitsound   = 5,1
;guardsound = 6,0
ground.type = High
ground.slidetime = 10
ground.hittime  = 25
ground.velocity = 0
air.velocity = 0,1
air.juggle = 3
forcestand = 1
fall = 0
air.fall = 0
;down.velocity = 0,0
down.hittime = 30
down.bounce = 0
kill = 0

[State 9531, 7]
type = HitDef
trigger1 = animelem = 12
attr = S, NA
animtype  = hard
damage    = 50
;guardflag = MA
pausetime = 12,20
sparkno = 0
sparkxy = -10,-37
hitsound   = 5,1
;guardsound = 6,0
ground.type = High
ground.slidetime = 10
ground.hittime  = 75
ground.velocity = 0
air.velocity = 0,1
air.juggle = 3
fall = 1
air.fall = 1
fall.recover = 0
;down.velocity = 0,0
down.hittime = 70
down.bounce = 1


[State 9531, 8]
type = ChangeState
trigger1 = animtime = 0
value = 2721

;accion--------------------------------
[Statedef 9532]
type    = S
movetype= H
physics = N
facep1 = 1
sprpriority = 0 

[State 9532, 1]
type = PosAdd
trigger1 = time = 0 
x = 2
y = 0

[State 9532, 2]
type = PosFreeze
trigger1 = time = 1
value = 20

[State 9531, 1]
type = PosSet
trigger1 = Time = 0
value = 2,0

[State 9532,2]
type = VelSet
trigger1 = Time = 0
x = 0
y = 0

[State 9532, 3]
type = ChangeAnim
trigger1 = time = [0,14]
value = 5007

[State 5500, 4]
type = ChangeAnim
trigger1 = time = 14
trigger2 = time = 37
trigger3 = time = 59
value = 5002

[State 9532, 5]
type = ChangeAnim
trigger1 = time = 20
trigger2 = time = 44
trigger3 = time = 67
value = 5007

;----------------------------------------------------------------------------------------------
;MOSTRO corriendo para envestir (CRASH)
[Statedef 9000]
type    = A
movetype= A
physics = N
juggle = 3
facep2 = 1
ctrl = 0
velset = 0,0,0
anim = 2701

[State 9000, 1]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 9000, 5]
type = poweradd
trigger1 = animelem = 4
value = 0

;[State 9000, Super B]
;type = PlaySnd
;trigger1 = animelem = 3
;value = 2, 1

[State 9000, Super B]
type = PlaySnd
trigger1 = animelem = 1
value = 2, 0

[State 9000, Super E]
type = AfterImageTime
trigger1 = Time = [1,20]
time = 2

[State 9000,3]
type = VelSet
trigger1 = Time = 0
x = 25.5
y = 0

[State 9000,6]
type = VelSet
trigger1 = Time = 20
x = .5
y = 0

[State 9000, 5]
type = Explod
Trigger1 = animelem = 1
anim = 2005
ID = 2005
offset = 0, 0
velocity = 0
projremovetime = 20
SprPriority = -4

[State 9000, 5]
type = palFX
trigger1 = animelem = 1
time = 20
;add = 168,200,216
sinadd = 245, 245, 245, 10


[State 9000, 42]
type = ChangeState
;trigger1 = MoveHit = 1
trigger1 = P2BodyDist X <= 1
trigger1 = P2BodyDist Y <= 1
value = 9001

[State 9000, 43] ;antes23
type = ChangeState
trigger1 = MoveGuarded = 1
value = 9001

[State 9000, 44]
type = ChangeState
trigger1 = animtime = 0
value = 2721

;[State 9000, 8] ;antes23
;type = ChangeState
;trigger1 = animtime = 0
;value = 9001

;crash--------------------------------
[Statedef 9001]
type    = A
movetype= A
physics = N
juggle = 3
facep2 = 1
ctrl = 0
velset = 20,0,0
anim = 9525

[State 9001, 1]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 9001, 15]
type = PlaySnd
trigger1 = animelem = 1
value = 2,3
volume = 250

[State 9001, 6]
type = HitDef
trigger1 = animelem = 1
attr = S, NA
animtype  = hard
damage    = 150, 35
guardflag = MA
pausetime = 22,22
sparkno = 5
sparkxy = -10,-37
hitsound   = S2,2
guardsound = S2,2
ground.type = High
ground.slidetime = 10
ground.hittime  = 12
ground.velocity = -12
fall = 1
air.velocity = -10,0
air.juggle = 3
air.fall = 1
down.velocity = -2,-10
down.hittime = 30
down.bounce = 1

[State 9001, 5]
type = palFX
trigger1 = animelem = 1
time = 20
;add = 168,200,216
sinadd = 245, 245, 245, 22

[State 9001, 5]
type = EnvShake
trigger1 = time = 0
ignorehitpause = 1
time = 25
ampl = 10

[State 9001,15]
type = VelSet
trigger1 = time = 0
x = 0
y = 0

[State 9001, 5];chispa
type = Explod
Trigger1 = time = 0
;Trigger1 = MoveContact ;= 1
ignorehitpause = 1
anim = 7004
ID = 7004
offset = 0, 0
velocity = 0
removetime = 22
SprPriority = 4

[State 9001, 8] ;antes23
type = ChangeState
trigger1 = animtime = 0
value = 2721
;-----------------------------------------------------
;atques comamndados por mov. naturales (controlador a sido removido)
;garraso debil 
[Statedef 250]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = N                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 2802                       ;Change animation (Def: no change)
poweradd = 0                    ;Power to add (Def: 0)
sprpriority = 1                  ;Set layering priority to 2 (in front)

[State 250, 1]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 250, 1]
type = HitDef
trigger1 = AnimElem = 4
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 23, 0                   ;Damage that move inflicts, guard damage
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 3, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
                                 ;Hit/Miss/Dodge type (Def: Hit)
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = -10, -76               ;X-offset for the "hit spark" rel. to p2,
                                 ;Y-offset for the spark rel. to p1
hitsound = S2, 5                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 12             ;Time opponent is in hit state
ground.velocity = -4             ;Velocity at which opponent is pushed
airguard.velocity = -1.9,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-3           ;X-velocity at which opponent is pushed,
                                 ;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

;[State 250, 1]
;type = PlaySnd
;trigger1 = MoveHit = 1
;value = 200, 0

[State 250, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 2700
ctrl = 0

;garraso fuerte--------------------------------
[Statedef 251]
type    = S                      
movetype= A                      
physics = S                     
anim = 2803                      
poweradd = 0                    
sprpriority = -1                

[State 251, 1]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 251, 1]
type = HitDef
trigger1 = AnimElem = 4 || AnimElem = 5
attr = S, NA                     
damage = 23                   
animtype = Light                 
guardflag = MA                   
hitflag = MAF                    
priority = 3, Hit                                                 
pausetime = 4, 8                 
sparkno = 12                   
sparkxy = -10, -76                                             
hitsound = S2,6                  
guardsound = 6, 0                
ground.type = High              
ground.slidetime = 5             
ground.hittime  = 12            
ground.velocity = -4             
airguard.velocity = -1.9,-.8     
air.type = High                  
air.velocity = -1.4,-3                                         
air.hittime = 12               

[State 251, 1]
type = PlaySnd
trigger1 = Time = 1
value = 200, 0

[State 251, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 2700
ctrl = 0

[State 251, 15];bite
type = ChangeState
triggerall = parent, life > 0
triggerall = MoveHit = 1
trigger1 = Random < 9999
trigger1 = parent, StateNo = 9521 
value = 9530

[State 251, 16];Crash
type = ChangeState
triggerall = parent, life > 0
triggerall = MoveHit = 1
trigger1 = Random < 9999
trigger1 = parent, StateNo = 9525 
value = 9000

;MOSTRO LENGUA------------------------------
[Statedef 2052]
type    = S
movetype= A
physics = S
juggle = 3
facep2 = 1		
anim = 9534

[State 2052, 1]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 1

[State 2052, 3]
type = Projectile
trigger1 = AnimElem = 2
projanim = 2804
projID = 2804
projhits = 1
projremove = 0
projremovetime = 22
projsprpriority = 1
projshadow = 1
offset = 52,-32 
velocity = 0
attr = S,NP
damage   = 50
animtype = HEAVY
guardflag = MA
hitflag = MAFDP
pausetime = 0,12
hitsound   = S2,6
sparkno = -1
;guardsound = S4,7
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -3,-6
air.juggle = 3
air.fall = 1
down.velocity = -3,-6
down.hittime = 30
down.bounce = 1

[State 2052, 4] ;antes23
type = ChangeState
trigger1 = animtime = 0
value = 2700

;-------------------------------------------------------
;LLendose
[Statedef 2726]
type = S
movetype = A
anim = 2703
velset = -6, 0, 0

[State 2726, 1]
type = MakeDust
trigger1 = TimeMod = 10, 0
pos = -5,-2
spacing = 1

[State 2726, 1]
type = SprPriority
trigger1 = Time >= 0
value = -2

[State 2726, 4]
type = PlaySnd
trigger1 = animelem = 4
value = 2,1
volume = 100

[State 2726, 3]
type = EnvShake
trigger1 = animelem = 4
time = 22
ampl = 3
freq = 90
phase = 8

[State 2726, 5]
type = Explod
Trigger1 = animelem = 4
anim = 2005
ID = 2005
offset = 0, 0
velocity = 0
projremovetime = 20
SprPriority = -4

[State 2726, 5]
type = SprPriority
trigger1 = Time = 0
value = -3

[state 2727, 1]
type = DestroySelf
trigger1 = time = 90
