;archivo para el helper "reintegro" por cuculero.
;LLegando
[Statedef 3999]
type = S
movetype = A
anim = 3008
velset = 5,0,0

[State 3999, 1]
type = Varset
trigger1 = Time = 0
v = 29
value = 0

[State 3999, 11]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 3999, 1]
type = MakeDust
trigger1 = TimeMod = 10, 0
pos = -5,-2
spacing = 1

[State 3999, 2]
type = SprPriority
trigger1 = Time >= 0
value = 5

[State 3999, 3]
type = Velset
trigger1 = ParentDist X < 1
x = 0

[State 3999, 4]
type = ChangeState
trigger1 = ParentDist X < 1
trigger2 = Vel X = 0
value = 4000

[State 3999, 4]
type = PlaySnd
trigger1 = animelem = 4
value = 1000, 1
volume = 80

;---------------------------------------------------------------------------
; Reintegro
[Statedef 4000]
type = S
movetype = A
facep2 = 1
anim = 3007
velset = 0,0,0

[State 4000, auto_atac]
type = ChangeState
triggerall = parent, life > 0
trigger1 = parent, MoveType = H;[5000,5999]  
trigger1 = random = [50,60]
trigger2 = parent, StateType = L
trigger2 = random = [50,60]
value = 4052

[State 4000, auto_atac2]
type = ChangeState
triggerall = parent, life > 0
;triggerall = parent, StateNo = [5000,5999]  
;trigger1 = random = [950,960]
trigger1 = parent, MoveType = H;[5000,5999]  
trigger1 = random = [50,60]
trigger2 = parent, StateType = L
trigger2 = random = [50,60]
value = 4050

[State 4000, 3]
type = SprPriority
trigger1 = Time >= 0
value = 5

[State 4000, 1]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 4000, RIGHT]
type = ChangeState
triggerall = ParentDist X > 1
trigger1 = Random < 10
trigger1 = parent, life > 0
value = 4020

[State 4000, LEFT]
type = ChangeState
triggerall = ParentDist X < 1
trigger1 = Random < 10
trigger1 = parent, life > 0
value = 4021

[State 4000, 8];Crash Aereo
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 220 
value = 4070

[State 4000, 7];vueltas
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 600 
value = 4055

[State 4000, 7];crashesito
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 200
value = 4050

[State 4000, 8];Lanze
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 400
trigger2 = var(0) = 1
value = 4052

[State 4000, 8];Dash
type = ChangeState
triggerall = parent, life > 0
triggerall = Pos Y = 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 411
trigger2 = var(0) = 2
value = 4053

[State 4000, 8];Rajilla
type = ChangeState
triggerall = parent, life > 0
triggerall = Pos Y = 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 210
value = 4054

[State 4052, LEFT_LOST]
type = ChangeState
triggerall = NumHelper(4000) = 1
trigger1 = parent, life <= 0
trigger2 = parent, stateno = [170,180]
trigger3 = parent, stateno = 9511
value = 4022

[State 4000, 9]
type = ChangeState
trigger1 = AnimTime = 0
value = 4000
;---------------------------------------------------------------------------
;CORRIENDO ADELANTE
[Statedef 4020]
type = S
movetype = A
anim = 3008
velset = 5,0,0

[State 4020, 1]
type = Varset
trigger1 = Time = 0
v = 29
value = 0

[State 4020, 11]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 4020, 1]
type = MakeDust
trigger1 = TimeMod = 10, 0
pos = -5,-2
spacing = 1

[State 4020, 2]
type = SprPriority
trigger1 = Time >= 0
value = 5

[State 4020, 3]
type = Velset
trigger1 = ParentDist X < 1
x = 0

[State 4020, 4]
type = ChangeState
trigger1 = ParentDist X < 1
trigger2 = Vel X = 0
value = 4000

[State 4020, 8];Dash
type = ChangeState
triggerall = parent, life > 0
triggerall = Pos Y = 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 411
value = 4053

[State 4020, 7];vueltas
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 600 
value = 4055

[State 4020, 7];crashesito
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 200
value = 4050

[State 4020, 8];Lanze
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 400
trigger2 = var(0) = 1
value = 4052

[State 4020, 8];Rajilla
type = ChangeState
triggerall = parent, life > 0
triggerall = Pos Y = 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 210
value = 4054

[State 4020, 9];Crash Aereo
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 220 
value = 4070

[State 4020, 4]
type = PlaySnd
trigger1 = animelem = 4
value = 1000, 1
volume = 80

;---------------------------------------------------------------------------
;corriendo atras
[Statedef 4021]
type = S
movetype = A
anim = 3010
velset = -5, 0, 0

[State 4021, 1]
type = Varset
trigger1 = Time = 0
v = 29
value = 1

[State 4021, 11]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 4021, 1]
type = MakeDust
trigger1 = TimeMod = 10, 0
pos = -5,-2
spacing = 1

[State 4021, 1]
type = SprPriority
trigger1 = Time >= 0
value = 5

[State 4021, 1]
type = Velset
trigger1 = ParentDist X > 1
x = 0

[State 4021, 8];Dash
type = ChangeState
triggerall = parent, life > 0
triggerall = Pos Y = 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 411
value = 4053

[State 4021, 7];vueltas
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 600 
value = 4055

[State 4021, 7];crashesito
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 200
value = 4050

[State 4021, 8];Lanze
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 400
trigger2 = var(0) = 1
value = 4052

[State 4021, 8];Rajilla
type = ChangeState
triggerall = parent, life > 0
triggerall = Pos Y = 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 210
value = 4054

[State 4021, 9];Crash Aereo
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 220 
value = 4070

[State 4021, 1]
type = ChangeState
trigger1 = ParentDist X > 1
trigger2 = Vel X = 0
value = 4000

;---------------------------------------------------------------------------
;Reintegro corriendo para envestir (CRASH)
[Statedef 4050]
type    = A
movetype= A
physics = N
juggle = 3
facep2 = 1
ctrl = 0
velset = 0,0,0
anim = 3008

[State 4050, 1]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 4050, 5]
type = poweradd
trigger1 = animelem = 4
value = 0


[State 4050, Super B]
type = PlaySnd
trigger1 = animelem = 1
value = 2, 0

[State 4050, Super E]
type = AfterImageTime
trigger1 = Time = [1,20]
time = 2

[State 4050,3]
type = VelSet
trigger1 = Time = 0
x = 10
y = 0

[State 4050,6]
type = VelSet
trigger1 = Time = 20
x = .5
y = 0

[State 4050, 5]
type = palFX
trigger1 = animelem = 1
time = 20
;add = 168,200,216
sinadd = 245, 245, 245, 10


[State 4050, 42]
type = ChangeState
;trigger1 = MoveHit = 1
trigger1 = P2BodyDist X <= 1
value = 4051

[State 4050, 43] ;antes23
type = ChangeState
trigger1 = MoveGuarded = 1
value = 4051

[State 4050, 44]
type = ChangeState
trigger1 = animtime = 0
value = 4021

[State 4050, 8];Lanze
type = ChangeState
triggerall = parent, life > 0
triggerall = time >= 14
trigger1 = Random < 9999
trigger1 = parent, StateNo = 400
trigger2 = parent, StateNo = 200
value = 4052

[State 4050, 9];Rajilla
type = ChangeState
triggerall = parent, life > 0
triggerall = time = 14
triggerall = Pos Y = 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 210
value = 4054

;crashesito------------------------------
[Statedef 4051]
type    = A
movetype= A
physics = N
juggle = 3
facep2 = 1
ctrl = 0
velset = 10,0,0
anim = 3011

[State 4051,3]
type = VelSet
trigger1 = Movecontact = 1
x = 0
y = 0

[State 4051, 1]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 4051, 15]
type = PlaySnd
trigger1 = animelem = 1
value = 2,3
volume = 90

[State 4051, 6]
type = HitDef
trigger1 = animelem = 1
attr = S, NA
animtype  = light
damage    = 25
guardflag = MA
pausetime = 22,22
sparkno = 0
sparkxy = -10,-37
hitsound   = 5,1
guardsound = 6,0
ground.type = Low
ground.slidetime = 10
ground.hittime  = 12
ground.velocity = -12
fall = 0
air.velocity = -10,0
air.juggle = 3
air.fall = 0
down.velocity = -2,-10
down.hittime = 30
down.bounce = 0

[State 4051, 5]
type = palFX
trigger1 = animelem = 1
time = 20
;add = 168,200,216
sinadd = 245, 245, 245, 22

;antes23
[State 4051, 8] 
type = ChangeState
trigger1 = animtime = 0
value = 4021

[State 4050, 8];Lanze
type = ChangeState
triggerall = parent, life > 0
triggerall = movecontact = 1 
trigger1 = Random < 9999
trigger1 = parent, StateNo = 400
trigger2 = parent, StateNo = 200
value = 4052

[State 4050, 9];Crash Aereo
type = ChangeState
triggerall = parent, life > 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 220 
value = 4070

[State 4050, 10];Rajilla
type = ChangeState
triggerall = parent, life > 0
triggerall = Pos Y = 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 210
value = 4054
;Lanze=======================================
[Statedef 4052]
type    = S
movetype= A
physics = N
juggle = 3
facep2 = 1
ctrl = 0
anim = 3008

[State 4052, 1]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 4052, 5]
type = poweradd
trigger1 = animelem = 4
value = 0

[State 4052, Super B]
type = PlaySnd
trigger1 = animelem = 1
value = 2, 0

[State 4052,3]
type = VelSet
trigger1 = Time = [0,10];[0,22]
x = 10
y = -5

[State 4052,6]
type = VelSet
trigger1 = Time = [10,19];[15,36]
x = 10
y = 4.5

[State 4052,6]
type = PosSet
trigger1 = Time >= 20;37
y = 0

[State 4052, 5]
type = palFX
trigger1 = animelem = 1
time = 20
;add = 168,200,216
sinadd = 245, 245, 245, 10

[State 4052, 15]
type = PlaySnd
trigger1 = animelem = 1
value = 2,3
volume = 250

[State 4052, 6]
type = HitDef
trigger1 = animelem = 1
trigger2 = animelem = 2
trigger3 = animelem = 3
trigger4 = animelem = 4
trigger5 = animelem = 5
attr = C, NA
animtype  = light
damage    = 25
guardflag = MA
pausetime = 5,10
sparkno = 0
sparkxy = -10,-37
hitsound   = 5,2
guardsound = 6,0
ground.type = high
ground.slidetime = 10
ground.hittime  = 12
ground.velocity = -12
fall = 0
air.velocity = -10,0
air.juggle = 3
air.fall = 0
down.velocity = -2,-10
down.hittime = 0
down.bounce = 0

[State 4052, 14];Haciendo el paro de pie
type = ChangeState
triggerall = parent, life > 0
triggerall = MoveHit = 1 
trigger1 = parent, StateNo = 210
value = 4080

[State 4052, 8];Dash
type = ChangeState
triggerall = parent, life > 0
triggerall = Pos Y = 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 411
value = 4053

[State 4052, 8] ;antes23
type = ChangeState
trigger1 = AnimTime = 0
value = 4021

;Dash
[Statedef 4053]
type = S
movetype = A
facep2 = 1
anim = 3008
velset = 20,0,0

[State 4053, 11]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 4053, 2]
type = afterimage
trigger1 = time = 0
time = 50
TimeGap  = 1
FrameGap = 4

[State 4053, 6]
type = HitDef
trigger1 = animelem = 1
trigger2 = animelem = 2
trigger3 = animelem = 3
trigger4 = animelem = 4
trigger5 = animelem = 5
attr = C, NA
animtype  = light
damage    = 25
guardflag = L
pausetime = 0,0
sparkno = 0
sparkxy = -10,-37
hitsound   = 5,2
guardsound = 6,0
ground.type = Trip
ground.slidetime = 10
ground.hittime  = 12
ground.velocity = 0,-5
fall = 1
air.velocity = -10,0
air.juggle = 3
air.fall = 1
down.velocity = -2,-10
down.hittime = 20
down.bounce = 0

[State 4053, 1]
type = MakeDust
trigger1 = TimeMod = 10, 0
pos = -5,-2
spacing = 1

[State 4053, 2]
type = SprPriority
trigger1 = Time >= 0
value = 5

[State 4053, 3]
type = Velset
trigger1 = animtime = 0
x = 0

[State 4053, 4]
type = ChangeState
trigger1 = animtime = 0
value = 4021

[State 4053, 4]
type = PlaySnd
trigger1 = animelem = 4
value = 1000, 1
volume = 80

;haciendo el paro de pie-----------------------------------
[Statedef 4080]
type    = S
movetype= A
physics = N
juggle = 3
facep2 = 1
ctrl = 0
anim = 3008

[State 4080, 1]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 4080,3]
type = VelSET
trigger1 = Time = [0,10]
x = 5
y = -10

[State 4080,13]
type = VelSET
trigger1 = Time = [10,20]
x = 5
y = 10

[State 4080,15]
type = PosSet
trigger1 = time >= 20
y = 0

[State 4080, 6]
type = HitDef
trigger1 = animelem = 1
trigger2 = animelem = 2
trigger3 = animelem = 3
trigger4 = animelem = 4
trigger5 = animelem = 5
P2stateno = 4081 
attr = S, NA
damage    = 5
guardflag = MA
pausetime = 5,20
hitsound   = 5,1
guardsound = 6,0
snap = -3,0
sparkno = 10
sparkxy = -5,-45
hitsound   = 5,1
;guardsound = 6,0
ground.type = High
ground.slidetime = 10
ground.hittime  = 25
ground.velocity = 0,0
air.velocity = 0,1
air.juggle = 3
forcestand = 1
fall = 0
air.fall = 0
;down.velocity = 0,0
down.hittime = 30
down.bounce = 0
kill = 0

[State 4080, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 4021

[State 4080, 12]
type = ChangeState
trigger1 = MoveHit = 1
;trigger1 = P2BodyDist X <= 1
;trigger1 = P2BodyDist Y <= 1
value = 4090

[Statedef 4090];mordidas
type    = S
movetype= A
physics = N
juggle = 3
facep2 = 1
ctrl = 0
anim = 3004

[State 4090, 55]
type = BindToTarget
trigger1 = time = 1
postype = head

[State 4090, 56]
type = OffSet
trigger1 = time = 0
x = 0
y = -100

;[State 4090, 42]
;type = TargetBind
;trigger1 = time = 0
;pos = 0,-50

[State 4090, 1]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 4090,6]
type = VelSet
trigger1 = time = 0
x = 0
y = 0

[State 4090, 16]
type = GameMakeAnim
trigger1 = animelem = 3
trigger2 = animelem = 6
trigger3 = animelem = 9 
trigger4 = animelem = 12
value = 10
pos = 0,0

[State 4090, 4]
type = PlaySnd
Trigger1 = animelem = 3
Trigger2 = animelem = 6
trigger3 = animelem = 9
trigger4 = animelem = 12
value = 2,5
volume = 100

[State 4090, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 4091

[Statedef 4091]
type    = S
movetype= I
physics = N
juggle = 3
ctrl = 0
anim = 3006

[State 4091, 1]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 4091,6]
type = PosSet
trigger1 = time = 0
x = 0
y = -45

[State 4091,7]
type = VelSet
trigger1 = time = [1,13]
x = -5
y = 5

[State 4091,7]
type = VelSet
trigger1 = time = 14
x = 0
y = 0

[State 4091,7]
type = PosSet
trigger1 = time = 15
y = 0

[State 4091, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 4021

;siendo mordido-----------------------
[Statedef 4081]
type    = S
movetype= H
physics = N
facep1 = 1
ctrl = 0

[State 4081, 1]
type = ChangeAnim2
trigger1 = time = 0
value = 3005

[State 4081, 2]
type = PosFreeze
trigger1 = time = 1
value = 20

[State 4081, 3]
type = LifeAdd
trigger1 = time = 18
trigger2 = time = 51
trigger3 = time = 84 
trigger4 = time = 117
value = -20

[State 4081, 3]
type = VelSet
trigger1 = time = 0
x = 0
y = 0

[State 4081, 40]
type = selfstate
trigger1 = time > 125
value = 5100

;-------------------------
;Rajilla
[Statedef 4054]
type = S
movetype = A
anim = 3024
velset = 0, 0, 0
facep2 = 1
ctrl = 0

[State 4054, 1]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 1

[State 4054, 5]
type = poweradd
trigger1 = animelem = 4
value = 0

[State 4054, Super B]
type = PlaySnd
trigger1 = animelem = 3
value = 1000, 3
        
[State 4054, 15]
type = PlaySnd
trigger1 = animelem = 5,=1
value = 3,12
volume = 250

[State 4054, 6]
type = Projectile
trigger1 = AnimElem = 5,=1
projanim = 3023
projid = 3023
projremovetime = 17
projremove = 0
projpriority = 10
projsprpriority = 7
projshadow = -1
offset = 20, -20
velocity = 0
attr = S, NA
damage   = 100,5
animtype = Medium
guardflag = MA
hitflag = MAFDP
pausetime = 0,12
hitsound   = S3,7
sparkno = -1
;guardsound = S4,7
ground.type = Low
ground.slidetime = 25
ground.hittime  = 25
ground.velocity = -6
air.animtype = Back
air.velocity = -3,-6
air.juggle = 3

[State 4054, 42] ;antes23
type = ChangeState
trigger1 = animtime = 0
value = 4000

[State 4054, 8];Dash
type = ChangeState
triggerall = parent, life > 0
triggerall = animtime = 0
triggerall = Pos Y = 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 411
value = 4053

[State 4054, 7];vueltas
type = ChangeState
triggerall = parent, life > 0
triggerall = animtime = 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 600 
value = 4055

[State 4054, 7];crashesito
type = ChangeState
triggerall = parent, life > 0
triggerall = animtime = 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 200
value = 4050

[State 4054, 8];Lanze
type = ChangeState
triggerall = parent, life > 0
triggerall = animtime = 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 400
trigger2 = var(0) = 1
value = 4052

[State 4054, 9];Crash Aereo
type = ChangeState
triggerall = parent, life > 0
triggerall = animtime = 0
trigger1 = Random < 9999
trigger1 = parent, StateNo = 220 
value = 4070
;-------------------------
;Golpe debil(aereo)
[Statedef 4055] 
type = S
movetype = A
anim = 15
velset = 8,0,0
facep2 = 1

[State 4055, 1]
type = VelSet
trigger1 = time = 0
y = -1

[State 4055, 11]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 4055, 2]
type = afterimage
trigger1 = time = 0
time = 50
TimeGap  = 1
FrameGap = 4

[State 4055, 5]
type = ChangeState
trigger1 = animtime = 0
value = 4056

;dando vueltas
[Statedef 4056] 
type = A
movetype = A
anim = 16
velset = 8,0,0

[State 4056, 11]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 4056, 1]
type = VelSet
trigger1 = time = [0,20]
y = -9

[State 4056, 2]
type = VelSet
trigger1 = time = [20,40]
y = 9

[State 4056, 3]
type = HitDef
trigger1 = time >= 0
persistent = 0
attr = A, NA
animtype  = Medium
damage    = 57
guardflag = MA
pausetime = 0,12
sparkno = 1
sparkxy = -10,-20
hitsound   = 5,2
guardsound = 6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -5.5
air.velocity = -2.5,-4
fall = 0
air.fall = 1

[State 4056, 5]
type = ChangeState
trigger1 = time >= 15 && Pos Y >= 0 && Pos Y <= 15
trigger2 = animtime = 0
value = 4057

;aterrisando
[Statedef 4057] 
type = S
movetype = A
anim = 17
velset = 5

[State 4057, 11]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 4057, 1]
type = VelSet
trigger1 = time = 0
y = 1

[State 4057, 1]
type = VelSet
trigger1 = Pos Y = 0
y = 0

[State 4057, 5]
type = ChangeState
trigger1 = animtime = 0
trigger2 = Pos Y  = 0
trigger3 = Vel Y = 0
value = 4021

;-------------------------
;Glpe fuerte
[Statedef 4070] 
type = S
movetype = A
anim = 15
velset = 8,0,0
facep2 = 1

[State 4070, 11]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 4070, 5]
type = palFX
trigger1 = animelem = 1
time = 20
;add = 168,200,216
sinadd = 245, 245, 245, 10

[State 4070, 1]
type = VelSet
trigger1 = time = 0
y = -2

[State 4070, 2]
type = afterimage
trigger1 = time = 0
time = 50
TimeGap  = 1
FrameGap = 4

;Hit decider
[State 4070, 6];dizzy
triggerall = P2Stateno != 5300
type = ChangeState
trigger1 = animtime = 0 && random >= 900;[50,100]
value = 4073

[State 4070, 5];Normal
type = ChangeState
trigger1 = animtime = 0
value = 4071

;CRASHESILLO VOLADOR
[Statedef 4071] 
type = A
movetype = A
anim = 3011
velset = 15,0,0

[State 4071, 11]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 4071, 1]
type = VelSet
trigger1 = time = [0,8]
y = -6

[State 4071, 2]
type = VelSet
trigger1 = time = [8,16]
y = 6

[State 4071, 3]
type = HitDef
trigger1 = time >= 0
persistent = 0
attr = A, NA
animtype  = Medium
damage    = 100
guardflag = MA
pausetime = 20,20
sparkno = 5
sparkxy = -10,-20
hitsound   = 5,3
guardsound = 6,0
ground.type = Low
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -5.5
air.velocity = -2.5,-4
fall = 1
air.fall = 1

[State 4071, 5]
type = ChangeState
trigger1 = Movecontact = 1
value = 4072

[State 4071,6]
type = PosSet
trigger1 = Time >= 19
y = 0

[State 4071, 5]
type = ChangeState
trigger1 = Pos Y = 0
value = 4021

;crashesillo volador mareador
[Statedef 4073] 
type = A
movetype = A
anim = 3011
velset = 15,0,0
poweradd = -200

[State 4073, 11]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 4073, 1]
type = VelSet
trigger1 = time = [0,8]
y = -6

[State 4073, 2]
type = VelSet
trigger1 = time = [8,16]
y = 6

[State 4073, 5]
type = palFX
trigger1 = animelem = 1
time = 18
;add = 168,200,216
sinadd = 74,0,74, 10
mul = 150,100,150

[State 4073, 10]
type = envcolor
trigger1 = movehit = 1
ignorehitpause = 1
value = 250,250,250
time = 1

[State 4073, 3]
type = HitDef
trigger1 = time >= 0
persistent = 0
kill = 0
attr = A, NA
animtype  = Medium
damage    = 120
guardflag = MA
pausetime = 20,20
sparkno = 5
sparkxy = -10,-20
hitsound   = 5,4
guardsound = 6,0
ground.type = Low
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -5.5
air.velocity = -2.5,-4
palfx.time = 150
palfx.sinadd = 74,0,74,10
;palfx.add = 74,0,74
palfx.mul = 150,100,150
;palfx.invertall = 10
fall = 1
air.fall = 1
P2stateno = 5300

[State 4073, 5]
type = ChangeState
trigger1 = Movecontact = 1
value = 4072

[State 4073,6]
type = PosSet
trigger1 = Time >= 19
y = 0

[State 4073, 5]
type = ChangeState
trigger1 = Pos Y = 0
value = 4021

;aterrisando dando vuletas
[Statedef 4072] 
type = S
movetype = A
anim = 16
velset = -5,0,0

[State 4072, 11]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 4072, 1]
type = VelSet
trigger1 = time = [0,20]
y = -3

[State 4072, 2]
type = VelSet
trigger1 = time = 20
y = 4

[State 4072, 3]
type = VelSet
trigger1 = Pos Y = 0
y = 0

[State 4072,6]
type = PosSet
trigger1 = Time >= 37
y = 0

[State 4072, 5]
type = ChangeState
trigger1 = animtime = 0
trigger2 = Pos Y  = 0
value = 4021

;-------------------------
;Poisonus Dizzy
[Statedef 5300]
type = S
movetype = H
velset = 0,0,0

[State 5300, 1]
type = LifeAdd
trigger1 = time = [0,150]
kill = 0
value = -1

[State 5300, 1]
type = AssertSpecial
triggerall = Life >= 1
trigger1 = time = [0,150]
flag = NoMusic

[State 5300, 1]
type = PosSet
trigger1 = time = 0
y = 0

[State 5300, 1]
type = Changeanim
trigger1 = time = 0
value = 5300

[State 5300, 1]
type = SelfState
trigger1 = time = 150
value = 5110
;-------------------------
;mostrillo rumbandole
[Statedef 4022]
type = S
movetype = I
anim = 3010;2703
velset = -5, 0, 0

[State 4022, 11]
type = NotHitBy
trigger1 = Time >= 0
value = SCA
time = 9999

[State 4022, 1]
type = MakeDust
trigger1 = TimeMod = 10, 0
pos = -5,-2
spacing = 1

[State 4022, 1]
type = SprPriority
trigger1 = Time >= 0
value = 5

[State 4022, 1]
type = DestroySelf
trigger1 = time = 100

