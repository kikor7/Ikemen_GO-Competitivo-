;-----------------------------------------------------------;
;				Especiais					;
;-----------------------------------------------------------;
;shuriken
[StateDef 1000]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
poweradd = 20
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)

[State 200, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 1000

[State 1000, 1]
type = PlaySnd
trigger1 = Time = 0
value = 0,0

;Shuriken
[State 1002, hits]
type = helper
trigger1 = animelem = 5
ID = 1005
postype = p1
pos = 45, -47
stateno = 1010	
sprpriority = 5
bindtime = -1

[State 1000, 3]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;-----------------------------------
;shuriken
[StateDef 1001]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
poweradd = 20
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)

[State 200, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 1000

[State 1001, 1]
type = PlaySnd
trigger1 = Time = 0
value = 0,0

;Shuriken
[State 1001, hits]
type = helper
trigger1 = animelem = 5
ID = 1005
postype = p1
pos = 45, -40
stateno = 1013	
sprpriority = 5
bindtime = -1

;Shuriken
[State 1001, hits]
type = helper
trigger1 = animelem = 5
ID = 1005
postype = p1
pos = 45, -54
stateno = 1017	
sprpriority = 5
bindtime = -1

[State 1001, 3]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;----------------------------
;-----------------------------------
;shuriken
[StateDef 1002]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
poweradd = 20
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)

[State 200, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 1000

[State 1002, 1]
type = PlaySnd
trigger1 = Time = 0
value = 0,0

;Shuriken
[State 1002, hits]
type = helper
trigger1 = animelem = 5
ID = 1005
postype = p1
pos = 45, -40
stateno = 1015	
sprpriority = 5
bindtime = -1

;Shuriken
[State 1002, hits]
type = helper
trigger1 = animelem = 5
ID = 1005
postype = p1
pos = 45, -54
stateno = 1017	
sprpriority = 5
bindtime = -1

;Shuriken
[State 1002, hits]
type = helper
trigger1 = animelem = 5
ID = 1005
postype = p1
pos = 55, -47
stateno = 1017	
sprpriority = 5
bindtime = -1

[State 1002, 3]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;-----------------------------------------------------------------
;helpers shuriken
[Statedef 1010]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1002
sprpriority = 0

[State 1040, 2]
type = VelSet
trigger1 = time > 1
x = 12
y = 0

[State 1040,1]
type = AfterImage
trigger1 = time = 1
time = 50
trans = add1
timegap = 1
framegap = 1
length = 8
palcontrast = 208,208,248 
palbright = 5,16,54

[State 4201, 3]
type = HitDef
trigger1 = time > 1 
attr = A, HP
damage    = 20, 0
getpower = 30,15
animtype = Medium
guardflag = MA
pausetime = 0,9
hitsound   = S6,0
guardsound = S5,0
sparkxy = 90, 0
sparkno =S9999999
ground.type = Low
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -4
air.animtype = Back
air.velocity = -4,0
air.juggle = 3
sparkno = -1
guard.sparkno = -1

[State 1001, hits]
type = helper
triggerall = movehit = 1
trigger1 = movecontact = 1
ID = 1011
postype = p2
pos = 45, -47
stateno = 1011
sprpriority = 5
bindtime = -1

[State 1001, hits]
type = helper
triggerall = moveguarded = 1
trigger1 = movecontact = 1
ID = 1018
postype = p2
pos = 45, -47
stateno = 1018
sprpriority = 5
bindtime = -1

[State 1030, Destroy]
type = destroyself
trigger1 = movecontact = 1
;--------------------------------------------------------
[Statedef 1011]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1004
sprpriority = 3

[State 10321, Wood 1]
type = Explod
trigger1 = time = 0
anim = 1004
sprpriority = 2
postype = p2
pos = -10,-47
removetime = 20
bindtime = -1


[State 1030, Destroy]
type = destroyself
trigger1 = time = 1
;-----------------
;h2
;helpers shuriken
[Statedef 1013]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1002
sprpriority = 0

[State 1013, 2]
type = VelSet
trigger1 = time > 1
x = 12
y = 0

[State 1013,1]
type = AfterImage
trigger1 = time = 1
time = 50
trans = add1
timegap = 1
framegap = 1
length = 8
palcontrast = 208,208,248 
palbright = 5,16,54

[State 4213, 3]
type = HitDef
trigger1 = time > 1 
attr = A, HP
damage    = 20, 0
getpower = 15,7
animtype = Medium
guardflag = MA
pausetime = 0,9
hitsound   = S6,0
guardsound = S5,0
sparkxy = 90, 0
sparkno =S9999999
ground.type = Low
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -4
air.animtype = Back
air.velocity = -4,0
air.juggle = 3
sparkno = -1
guard.sparkno = -1

[State 1013, hits]
type = helper
triggerall = movehit = 1
trigger1 = movecontact = 1
ID = 1014
postype = p2
pos = 45, -40
stateno = 1014
sprpriority = 5
bindtime = -1

[State 1001, hits]
type = helper
triggerall = moveguarded = 1
trigger1 = movecontact = 1
ID = 1018
postype = p2
pos = 45, -54
stateno = 1019
sprpriority = 5
bindtime = -1

[State 1001, hits]
type = helper
triggerall = moveguarded = 1
trigger1 = movecontact = 1
ID = 1018
postype = p2
pos = 45, -40
stateno = 1020
sprpriority = 5
bindtime = -1

[State 1013, Destroy]
type = destroyself
trigger1 = movecontact = 1
;--------------------------------------------------------
[Statedef 1014]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1004
sprpriority = 3

[State 1014, Wood 1]
type = Explod
trigger1 = time = 0
anim = 1004
sprpriority = 2
postype = p2
pos = -3,-40
removetime = 20
bindtime = -1

[State 1014, Wood 1]
type = Explod
trigger1 = time = 0
anim = 1004
sprpriority = 2
postype = p2
pos = -5,-54
removetime = 20
bindtime = -1

[State 1014, Destroy]
type = destroyself
trigger1 = time = 1
;-----------------
;h3
;helpers shuriken
[Statedef 1015]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1002
sprpriority = 0

[State 1015, 2]
type = VelSet
trigger1 = time > 1
x = 12
y = 0

[State 1015,1]
type = AfterImage
trigger1 = time = 1
time = 50
trans = add1
timegap = 1
framegap = 1
length = 8
palcontrast = 208,208,248 
palbright = 5,16,54

[State 4213, 3]
type = HitDef
trigger1 = time > 1 
attr = A, HP
damage    = 20, 0
getpower = 30,15
animtype = Medium
guardflag = MA
pausetime = 0,9
hitsound   = S6,0
guardsound = S5,0
sparkxy = 90, 0
sparkno =S9999999
ground.type = Low
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -4
air.animtype = Back
air.velocity = -4,0
air.juggle = 3
sparkno = -1
guard.sparkno = -1

[State 1015, hits]
type = helper
triggerall = movehit = 1
trigger1 = movecontact = 1
ID = 1016
postype = p2
pos = 45, -40
stateno = 1016
sprpriority = 5
bindtime = -1

[State 1001, hits]
type = helper
triggerall = moveguarded = 1
trigger1 = movecontact = 1
ID = 1018
postype = p2
pos = 45, -54
stateno = 1019
sprpriority = 5
bindtime = -1

[State 1001, hits]
type = helper
triggerall = moveguarded = 1
trigger1 = movecontact = 1
ID = 1018
postype = p2
pos = 45, -40
stateno = 1020
sprpriority = 5
bindtime = -1

[State 1001, hits]
type = helper
triggerall = moveguarded = 1
trigger1 = movecontact = 1
ID = 1018
postype = p2
pos = 45, -47
stateno = 1018
sprpriority = 5
bindtime = -1

[State 1015, Destroy]
type = destroyself
trigger1 = movecontact = 1
;--------------------------------------------------------
[Statedef 1016]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1004
sprpriority = 3

[State 1016, Wood 1]
type = Explod
trigger1 = time = 0
anim = 1004
sprpriority = 2
postype = p2
pos = -3,-54
removetime = 20
bindtime = -1

[State 1016, Wood 1]
type = Explod
trigger1 = time = 0
anim = 1004
sprpriority = 4
postype = p2
pos = -5,-40
removetime = 20
bindtime = -1

[State 1016, Wood 1]
type = Explod
trigger1 = time = 0
anim = 1004
sprpriority = 3
postype = p2
pos = -10,-47
removetime = 20
bindtime = -1

[State 1016, Destroy]
type = destroyself
trigger1 = time = 1
;---------------------------
;-----------------
;h3
;helpers shuriken
[Statedef 1017]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1002
sprpriority = 0

[State 1017, 2]
type = VelSet
trigger1 = time > 1
x = 12
y = 0

[State 1017,1]
type = AfterImage
trigger1 = time = 1
time = 50
trans = add1
timegap = 1
framegap = 1
length = 8
palcontrast = 208,208,248 
palbright = 5,16,54

[State 4213, 3]
type = HitDef
trigger1 = time > 1 
attr = A, HP
damage    = 20, 0
getpower = 15,7
animtype = Medium
guardflag = MA
pausetime = 0,9
hitsound   = S6,0
guardsound = S5,0
sparkxy = 90, 0
sparkno =S9999999
ground.type = Low
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -4
air.animtype = Back
air.velocity = -4,0
air.juggle = 3
sparkno = -1
guard.sparkno = -1

[State 1015, Destroy]
type = destroyself
trigger1 = movecontact = 1
;----------------------------
;shuriken indo embora
[Statedef 1018]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1002
sprpriority = 3

[State 1018, 2]
type = VelSet
trigger1 = time > 1
x = 12
y = -8

[State 1018, Destroy]
type = destroyself
trigger1 = time = 20
;---
[Statedef 1019]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1002
sprpriority = 3

[State 1019, 2]
type = VelSet
trigger1 = time > 1
x = 12
y = 0

[State 1019, Destroy]
type = destroyself
trigger1 = time = 20
;-----
[Statedef 1020]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1002
sprpriority = 3

[State 1020, 2]
type = VelSet
trigger1 = time > 1
x = 12
y = -5

[State 1020, Destroy]
type = destroyself
trigger1 = time = 20
;---------------------------------------------------------------------------
;shuriken air
[Statedef 2000]
type    = A
poweradd = 20
movetype= A
physics = A
ctrl = 0

[State 2000, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 1001

[State 2000, 2]
type = PlaySnd
trigger1 = Time = 0
value = 0,0

;shuriken
[State 1002, hits]
type = helper
trigger1 = animelem = 3
ID = 10
postype = p1
pos = 10, -40
stateno = 2010
sprpriority = 5
bindtime = -1

[State 2000, 4]
type = ChangeState
trigger1 = Pos Y = 5
value = 50
ctrl = 1
;-----------------------------------
;shuriken air
[Statedef 2001]
type    = A
poweradd = 20
movetype= A
physics = A
ctrl = 0

[State 2001, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 1001

[State 2001, 2]
type = PlaySnd
trigger1 = Time = 0
value = 0,0

;shuriken
[State 1001, hits]
type = helper
trigger1 = animelem = 3
ID = 10
postype = p1
pos = 15, -45
stateno = 2011
sprpriority = 5
bindtime = -1

;shuriken
[State 1001, hits]
type = helper
trigger1 = animelem = 3
ID = 10
postype = p1
pos = 5, -35
stateno = 2015
sprpriority = 5
bindtime = -1

[State 2001, 4]
type = ChangeState
trigger1 = Pos Y = 5
value = 50
ctrl = 1
;-------------------
;shuriken air
[Statedef 2002]
type    = A
poweradd = 20
movetype= A
physics = A
ctrl = 0

[State 2002, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 1001

[State 2002, 2]
type = PlaySnd
trigger1 = Time = 0
value = 0,0

;shuriken
[State 1002, hits]
type = helper
trigger1 = animelem = 3
ID = 10
postype = p1
pos = 15, -45
stateno = 2012
sprpriority = 5
bindtime = -1

;shuriken
[State 1002, hits]
type = helper
trigger1 = animelem = 3
ID = 10
postype = p1
pos = 5, -35
stateno = 2015
sprpriority = 5
bindtime = -1

;shuriken
[State 1002, hits]
type = helper
trigger1 = animelem = 3
ID = 10
postype = p1
pos = 10, -40
stateno = 2015
sprpriority = 5
bindtime = -1

[State 2002, 4]
type = ChangeState
trigger1 = Pos Y = 5
value = 50
ctrl = 1
;-----------------------------------------------------------------
;helpers shuriken
[Statedef 2010]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1002
sprpriority = 0

[State 2010, 2]
type = VelSet
trigger1 = time > 1
x = 12
y = 8

[State 2010,1]
type = AfterImage
trigger1 = time = 1
time = 50
trans = add1
timegap = 1
framegap = 1
length = 8
palcontrast = 208,208,248 
palbright = 5,16,54

[State 4201, 3]
type = HitDef
trigger1 = time > 1 
attr = A, HP
damage    = 20, 0
getpower = 30,15
animtype = Medium
guardflag = MA
pausetime = 0,9
hitsound   = S6,0
guardsound = S5,0
sparkxy = 90, 0
sparkno =S9999999
ground.type = Low
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -4
air.animtype = Back
air.velocity = -4,0
air.juggle = 3
sparkno = -1
guard.sparkno = -1

[State 2010, hits]
type = helper
triggerall = movehit = 1
trigger1 = movecontact = 1
ID = 1011
postype = p2
pos = 45, -47
stateno = 1011
sprpriority = 5
bindtime = -1

[State 2010, hits]
type = helper
triggerall = moveguarded = 1
trigger1 = movecontact = 1
ID = 1018
postype = p2
pos = 45, -47
stateno = 1018
sprpriority = 5
bindtime = -1

[State 2010, hits]
type = changestate
trigger1 = pos y >= 0
value = 2013

[State 2010, Destroy]
type = destroyself
trigger1 = movecontact = 1
;-----------
;h2
;helpers shuriken
[Statedef 2011]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1002
sprpriority = 0

[State 2011, 2]
type = VelSet
trigger1 = time > 1
x = 12
y = 8

[State 2011,1]
type = AfterImage
trigger1 = time = 1
time = 50
trans = add1
timegap = 1
framegap = 1
length = 8
palcontrast = 208,208,248 
palbright = 5,16,54

[State 2011, 3]
type = HitDef
trigger1 = time > 1 
attr = A, HP
damage    = 20, 0
getpower = 15,7
animtype = Medium
guardflag = MA
pausetime = 0,9
hitsound   = S6,0
guardsound = S5,0
sparkxy = 90, 0
sparkno =S9999999
ground.type = Low
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -4
air.animtype = Back
air.velocity = -4,0
air.juggle = 3
sparkno = -1
guard.sparkno = -1

[State 2011, hits]
type = helper
triggerall = movehit = 1
trigger1 = movecontact = 1
ID = 1014
postype = p2
pos = 45, -40
stateno = 1014
sprpriority = 5
bindtime = -1

[State 2011, hits]
type = helper
triggerall = moveguarded = 1
trigger1 = movecontact = 1
ID = 1018
postype = p2
pos = 45, -54
stateno = 1019
sprpriority = 5
bindtime = -1

[State 2011, hits]
type = helper
triggerall = moveguarded = 1
trigger1 = movecontact = 1
ID = 1018
postype = p2
pos = 45, -40
stateno = 1020
sprpriority = 5
bindtime = -1

[State 2010, hits]
type = changestate
trigger1 = pos y >= 0
value = 2014

[State 2011, Destroy]
type = destroyself
trigger1 = movecontact = 1
;-------------------------
;h3
;helpers shuriken
[Statedef 2012]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1002
sprpriority = 0

[State 2012, 2]
type = VelSet
trigger1 = time > 1
x = 12
y = 8

[State 2012,1]
type = AfterImage
trigger1 = time = 1
time = 50
trans = add1
timegap = 1
framegap = 1
length = 8
palcontrast = 208,208,248 
palbright = 5,16,54

[State 4213, 3]
type = HitDef
trigger1 = time > 1 
attr = A, HP
damage    = 20, 0
getpower = 30,15
animtype = Medium
guardflag = MA
pausetime = 0,9
hitsound   = S6,0
guardsound = S5,0
sparkxy = 90, 0
sparkno =S9999999
ground.type = Low
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -4
air.animtype = Back
air.velocity = -4,0
air.juggle = 3
sparkno = -1
guard.sparkno = -1

[State 2012, hits]
type = helper
triggerall = movehit = 1
trigger1 = movecontact = 1
ID = 1016
postype = p2
pos = 45, -40
stateno = 1016
sprpriority = 5
bindtime = -1

[State 2012, hits]
type = helper
triggerall = moveguarded = 1
trigger1 = movecontact = 1
ID = 1018
postype = p2
pos = 45, -54
stateno = 1019
sprpriority = 5
bindtime = -1

[State 2012, hits]
type = helper
triggerall = moveguarded = 1
trigger1 = movecontact = 1
ID = 1018
postype = p2
pos = 45, -40
stateno = 1020
sprpriority = 5
bindtime = -1

[State 2012, hits]
type = helper
triggerall = moveguarded = 1
trigger1 = movecontact = 1
ID = 1018
postype = p2
pos = 45, -47
stateno = 1018
sprpriority = 5
bindtime = -1

[State 2010, hits]
type = changestate
trigger1 = pos y >= 0
value = 2016

[State 2012, Destroy]
type = destroyself
trigger1 = movecontact = 1
;---------------------------
;h4
;helpers shuriken
[Statedef 2015]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1002
sprpriority = 0

[State 1017, 2]
type = VelSet
trigger1 = time > 1
x = 12
y = 8

[State 2015,1]
type = AfterImage
trigger1 = time = 1
time = 50
trans = add1
timegap = 1
framegap = 1
length = 8
palcontrast = 208,208,248 
palbright = 5,16,54

[State 2015, 3]
type = HitDef
trigger1 = time > 1 
attr = A, HP
damage    = 20, 0
getpower = 15,7
animtype = Medium
guardflag = MA
pausetime = 0,9
hitsound   = S6,0
guardsound = S5,0
sparkxy = 90, 0
sparkno =S9999999
ground.type = Low
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -4
air.animtype = Back
air.velocity = -4,0
air.juggle = 3
sparkno = -1
guard.sparkno = -1

[State 2010, hits]
type = destroyself
trigger1 = pos y >= 0

[State 2015, Destroy]
type = destroyself
trigger1 = movecontact = 1
;--------------------------
;shu no chão
[Statedef 2013]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1003
sprpriority = 3

[State 2013, 2]
type = VelSet
trigger1 = time = 0
x = 0
y = 0

[State 2013, Destroy]
type = destroyself
trigger1 = time = 20
;-------------
[Statedef 2014]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1003
sprpriority = 3

[State 2014, 2]
type = VelSet
trigger1 = time = 0
x = 0
y = 0

[State 10321, Wood 1]
type = Explod
trigger1 = time = 0
anim = 1003
sprpriority = 2
;postype = p2
pos = -10, 0
removetime = 20

[State 2013, Destroy]
type = destroyself
trigger1 = time = 20
;----------------
[Statedef 2016]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1003
sprpriority = 3

[State 2016, 2]
type = VelSet
trigger1 = time = 0
x = 0
y = 0

[State 10321, Wood 1]
type = Explod
trigger1 = time = 0
anim = 1003
sprpriority = 2
;postype = p2
pos = -10, 0
removetime = 20

[State 10321, Wood 1]
type = Explod
trigger1 = time = 0
anim = 1003
sprpriority = 2
;postype = p2
pos = -20, 0
removetime = 20

[State 2016, Destroy]
type = destroyself
trigger1 = time = 20

;---------------------------------------------------------------------
;bomb
[StateDef 1050]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
poweradd = 20
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)

[State 200, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 1010

[State 1050, 1]
type = PlaySnd
trigger1 = Time = 0
value = 0,0

;bomba
[State 1002, hits]
type = helper
trigger1 = animelem = 6
ID = 10
postype = p1
pos = 68, -25
stateno = 1040
sprpriority = 5
bindtime = -1

[State 1050, 3]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;bomb air
[Statedef 1060]
type    = A
poweradd = 20
movetype= A
physics = A
ctrl = 0

[State 1060, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 1001

[State 200, 2]
type = PlaySnd
trigger1 = Time = 0
value = 0,0

;bomba
[State 1002, hits]
type = helper
trigger1 = animelem = 3
ID = 10
postype = p1
pos = 0, 0
stateno = 1042
sprpriority = 5
bindtime = -1

[State 1060, 4]
type = ChangeState
trigger1 = Pos Y = 5
value = 50
ctrl = 1
;--------------------------------------
;helpers bomb

[Statedef 1040]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1011
sprpriority = 0

[State 1040, 2]
type = VelSet
trigger1 = time > 1
x = 12
y = 0

[State 1040,1]
type = AfterImage
trigger1 = time = 1
time = 50
trans = add1
timegap = 1
framegap = 1
length = 8
palcontrast = 208,208,248 
palbright = 5,16,54

[State 4201, 3]
type = HitDef
trigger1 = AnimElem = 1 
attr = A, HP
damage    = 0, 0
getpower = 15,7
animtype = Medium
guardflag = MA
pausetime = 0,9
hitsound   = S-1
sparkxy = 90, 0
sparkno =S9999999
ground.type = Low
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -0
air.animtype = Back
air.velocity = 0,0
air.juggle = 3
sparkno = -1
guard.sparkno = -1


[State 1001, hits]
type = helper
trigger1 = movecontact = 1
ID = 1002
postype = p2
pos = 0, 0
stateno = 1041
sprpriority = 5
bindtime = -1

[State 1030, Destroy]
type = destroyself
trigger1 = movecontact = 1
;---------------------------------------------
;helpers bomb

[Statedef 1042]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1011
sprpriority = 0

[State 1042, 2]
type = VelSet
trigger1 = time > 1
x = 12
y = 8

[State 1040,1]
type = AfterImage
trigger1 = time = 1
time = 50
trans = add1
timegap = 1
framegap = 1
length = 8
palcontrast = 208,208,248 
palbright = 5,16,54

[State 4242, 3]
type = HitDef
trigger1 = AnimElem = 1 
attr = A, HP
damage    = 0, 0
getpower = 15,7
animtype = Medium
guardflag = MA
pausetime = 0,9
hitsound   = S-1
sparkxy = 90, 0
sparkno =S9999999
ground.type = Low
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -0
air.animtype = Back
air.velocity = 0,0
air.juggle = 3
sparkno = -1
guard.sparkno = -1

[State 1042, hits]
type = helper
trigger1 = movecontact = 1
ID = 1002
postype = p2
pos = 0, 0
stateno = 1041
sprpriority = 5
bindtime = -1

;[State 1042, hits]
;type = helper
;trigger1 = Pos Y >= 5
;ID = 1002
;postype = p2
;pos = 0, 0
;stateno = 1041
;sprpriority = 5
;bindtime = -1

[State 1042, 5]
type = changestate
trigger1 = pos y >= 0
value = 1043

[State 1032, Destroy]
type = destroyself
trigger1 = movecontact = 1
;=--------------------------------------------
;helers bomb
[Statedef 1041]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1012
sprpriority = 0

[State 1050, 1]
type = PlaySnd
trigger1 = Time = 0
value = 8,1

[State 1040, 2]
type = VelSet
trigger1 = time = 0
x = 0
y = 0

[State 213, 2]
type = HitDef
trigger1 = AnimElem >= 1 
attr = A, HP
damage    = 100, 0
getpower = 15,7
animtype  = Medium
guardflag = MA
pausetime = 0,0
sparkno = S-1
guard.sparkno = S2
sparkxy = 10,-36
hitsound   = S-1
guardsound = S-1
ground.type = High
air.animtype = Back
ground.slidetime = 12
ground.hittime  = 18
ground.velocity = 7, -4 
air.velocity = 5.5,-4.2
fall = 1
palfx.time = 30
palfx.add = 0,0,0
palfx.mul = 255,255,0
palfx.sinadd     = 0,30,40,40
palfx.color      = 0
palfx.invertall  = 1    


[State 1030, Destroy]
type = destroyself
trigger1 = animtime = 0
;-------------------------------------
[Statedef 1043]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1013
sprpriority = 3

[State 1044, 2]
type = VelSet
trigger1 = time = 0
x = 0
y = 0

[State 1043, 5]
type = changestate
trigger1 = animtime= 0
value = 1044
;-----------
[Statedef 1044]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1012
sprpriority = 3

[State 1044, 1]
type = PlaySnd
trigger1 = Time = 0
value = 8,1

[State 1044, 2]
type = VelSet
trigger1 = time = 0
x = 0
y = 0

[State 1044, 2]
type = HitDef
trigger1 = AnimElem >= 1 
attr = A, HP
damage    = 100, 0
getpower = 15,7
animtype  = Medium
guardflag = MA
pausetime = 0,0
sparkno = S-1
guard.sparkno = S2
sparkxy = 10,-36
hitsound   = S-1
guardsound = S-1
ground.type = High
air.animtype = Back
ground.slidetime = 12
ground.hittime  = 18
ground.velocity = -7, -4 
air.velocity = -5.5,-4.2
fall = 1
palfx.time = 30
palfx.add = 0,0,0
palfx.mul = 255,255,0
palfx.sinadd     = 0,30,40,40
palfx.color      = 0
palfx.invertall  = 1    

[State 1044, Destroy]
type = destroyself
trigger1 = animtime = 0
;--------------------------------------------------------------------
;bombparado
[StateDef 1070]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)

[State 200, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 1014

[State 1070, 1]
type = PlaySnd
trigger1 = Time = 0
value = 0,0

;bomba
[State 1002, hits]
type = helper
trigger1 = animelem = 5
ID = 10
postype = p1
pos = 0, 0
stateno = 1043
sprpriority = 5
bindtime = -1

[State 1070, 3]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1



;---------------------------------------------------------------------------------------
;fenku
[StateDef 2020]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)

[State 200, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 184

[State 2020, 1]
type = PlaySnd
trigger1 = Time = 0
value = 0,5
channel = 1

[State 2020, 1]
type = PlaySnd
trigger1 = animelem = 6
value = 2,4
channel = 2

[State 2020, 2]
type = Explod
trigger1 = animelem = 6
anim = 199
pos = 0,0
postype = p1
sprpriority = 1
removetime = 28
supermove = 1
bindtime = 1

[State 2020, 3]
type = changestate
triggerall = facing = 1
trigger1 = time = 55
value = 2021
ctrl = 1

[State 2020, 3]
type = changestate
triggerall = facing = -1
trigger1 = time = 55
value = 2022
ctrl = 1
;-----------
[StateDef 2023]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)

[State 200, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 184

[State 2023, 1]
type = PlaySnd
trigger1 = Time = 0
value = 0,5
channel = 1

[State 2023, 1]
type = PlaySnd
trigger1 = animelem = 6
value = 2,4
channel = 2

[State 2023, 2]
type = Explod
trigger1 = animelem = 6
anim = 199
pos = 0,0
postype = p1
sprpriority = 1
removetime = 28
supermove = 1
bindtime = 1

[State 2023, 3]
type = changestate
triggerall = facing = -1
trigger1 = time = 55
value = 2021
ctrl = 1

[State 2023, 3]
type = changestate
triggerall = facing = 1
trigger1 = time = 55
value = 2022
ctrl = 1
;--->
[StateDef 2021]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)

[State 400, 1]
type = Posset
trigger1 = Time = 0
x= 200

[State 200, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 1018

[State 2021, 1]
type = PlaySnd
trigger1 = animelem = 1
value = 2,4
channel = 2

[State 2021, 2]
type = Explod
trigger1 = animelem = 1
anim = 199
pos = 0,0
postype = p1
sprpriority = 5
removetime = 28
supermove = 1
bindtime = 1

[State 2021, 3]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;------------------------------------------------
;<---
[StateDef 2022]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)

[State 400, 1]
type = Posset
trigger1 = Time = 0
x= -200

[State 200, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 1018

[State 2022, 1]
type = PlaySnd
trigger1 = animelem = 1
value = 2,4
channel = 2

[State 2022, 2]
type = Explod
trigger1 = animelem = 1
anim = 199
pos = 0,0
postype = p1
sprpriority = 5
removetime = 28
supermove = 1
bindtime = 1

[State 2022, 3]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
