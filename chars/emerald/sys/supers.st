;---------------------------------------------------------------------------
;Dark Energy Ball Light
[Statedef 1000]
type = S
movetype = A
physics = S
anim = 1000
ctrl = 0
velset = 0,0
poweradd = 20
sprpriority = 2

[State 1000, snd]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S1000,0
volumescale = 255

[State 1000, proj]
type = Projectile
trigger1 = AnimElem = 2
ProjID = 1000
projanim = 6100
projhitanim = 6105
projhits = 1
projscale = 0.5,0.5
offset = 35,-75
velocity = 3,0
attr = S,NP
damage = 35,5
animtype = Light
hitflag = MAF
guardflag = M
sparkno = S6110
guard.sparkno = S6110
sparkxy = 0,0
hitsound = S1001,0
guardsound = S1001,0
pausetime = 0,12
givepower = -50,-50
ground.type = High
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -8
ground.cornerpush.veloff = 0
guard.velocity = -8
airguard.velocity = -3.5,-5.5
air.animtype = Back
air.velocity = -2.5,-5.5
air.fall = 1
fall.recover = 0

[State 1000, self]
type = SelfState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Dark Energy Ball Medium
[Statedef 1001]
type = S
movetype = A
physics = S
anim = 1000
ctrl = 0
velset = 0,0
poweradd = 20
sprpriority = 2

[State 1001, snd]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S1000,0
volumescale = 255

[State 1001, proj]
type = Projectile
trigger1 = AnimElem = 2
ProjID = 1000
projanim = 6100
projhitanim = 6105
projhits = 1
projscale = 0.5,0.5
offset = 35,-75
velocity = 4,0
attr = S,NP
damage = 50,5
animtype = Medium
hitflag = MAF
guardflag = M
sparkno = S6110
guard.sparkno = S6110
sparkxy = 0,0
hitsound = S1001,0
guardsound = S1001,0
pausetime = 0,12
givepower = -50,-50
ground.type = High
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -8
ground.cornerpush.veloff = 0
guard.velocity = -8
airguard.velocity = -3.5,-5.5
air.animtype = Back
air.velocity = -2.5,-5.5
air.fall = 1
fall.recover = 0

[State 1001, self]
type = SelfState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Dark Energy Ball Hard
[Statedef 1002]
type = S
movetype = A
physics = S
anim = 1000
ctrl = 0
velset = 0,0
poweradd = 20
sprpriority = 2

[State 1002, snd]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S1000,0
volumescale = 255

[State 1002, proj]
type = Projectile
trigger1 = AnimElem = 2
ProjID = 1000
projanim = 6100
projhitanim = 6105
projhits = 1
projscale = 0.5,0.5
offset = 35,-75
velocity = 6,0
attr = S,NP
damage = 70,10
animtype = Hard
hitflag = MAF
guardflag = M
sparkno = S6110
guard.sparkno = S6110
sparkxy = 0,0
hitsound = S1001,0
guardsound = S1001,0
pausetime = 0,12
givepower = -50,-50
ground.type = High
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -8
ground.cornerpush.veloff = 0
guard.velocity = -8
airguard.velocity = -3.5,-5.5
air.animtype = Back
air.velocity = -2.5,-5.5
air.fall = 1
fall.recover = 0

[State 1002, self]
type = SelfState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Dark Energy Ball Super
[Statedef 1100]
type = S
movetype = A
physics = S
anim = 1000
ctrl = 0
velset = 0,0
poweradd = -500
sprpriority = 2

[State 1010, snd]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S180,1
volumescale = 255

[State 1010, snd]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S1600,0
volumescale = 255

[State 1010, proj]
type = Projectile
trigger1 = AnimElem = 2
ProjID = 1010
projanim = 6100
projhitanim = 6105
projhits = 3
offset = 35,-75
velocity = 3,0
attr = S,SP
damage = 40,20
animtype = Hard
hitflag = MAF
guardflag = M
sparkno = S6110
guard.sparkno = S6110
sparkxy = 0,0
hitsound = S1001,0
guardsound = S1001,0
pausetime = 0,12
givepower = -50,-50
ground.type = High
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -8
ground.cornerpush.veloff = 0
guard.velocity = -8
airguard.velocity = -3.5,-5.5
air.animtype = Back
air.velocity = -2.5,-5.5
air.fall = 1
fall.recover = 0

[State 1010, self]
type = SelfState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Dark Energy Balls Hyper
[Statedef 1200]
type = S
movetype = A
physics = S
anim = 1100
ctrl = 0
velset = 0,0
poweradd = -1000
sprpriority = 2

[State 1020, S-Pause]
type = SuperPause
trigger1 = !AnimElemTime(1)
time = 60
anim = -1
sound = -1
darken = 1
ignorehitpause = 1

[State 1020, super]
type = Explod
triggerall = PlayerIDExist(ID)
trigger1 = !animelemtime(1)
anim = 6021
ID = 6021
pos = 0,-75
postype = p1
bindtime = 1
removetime = -2
sprpriority = 2
ownpal = 1
trans = add
supermovetime=2147483647
pausemovetime=2147483647
ignorehitpause = 1

[State 1020, energy]
type = Explod
triggerall = PlayerIDExist(ID)
trigger1 = !animelemtime(1)
anim = 6200
ID = 6200
pos = 0,0
postype = p1
bindtime = 1
removetime = -2
sprpriority = 4
ownpal = 1
trans = add
supermovetime=2147483647
pausemovetime=2147483647
ignorehitpause = 1

[State 1020, energy]
type = Explod
triggerall = PlayerIDExist(ID)
trigger1 = !animelemtime(1)
anim = 6210
ID = 6210
pos = 0,0
postype = p1
facing = 1
bindtime = 1
removetime = -2
sprpriority = -1
ownpal = 1
trans = add
supermovetime=2147483647
pausemovetime=2147483647
ignorehitpause = 1

[State 1020, energy]
type = Explod
triggerall = PlayerIDExist(ID)
trigger1 = !animelemtime(1)
anim = 6210
ID = 6210
pos = 0,0
postype = p1
facing = -1
bindtime = 1
removetime = -2
sprpriority = -1
ownpal = 1
trans = add
supermovetime=2147483647
pausemovetime=2147483647
ignorehitpause = 1

[State 1020, BG]
type = Explod
triggerall = PlayerIDExist(ID)
trigger1 = !animelemtime(1)
anim = 4000
ID = 4000
pos = 0,0
postype = back
bindtime = 1
removetime = -2
sprpriority = 10
ownpal = 1
trans = none
supermovetime=2147483647
pausemovetime=2147483647
ignorehitpause = 1

[State 1020, voice]
type = PlaySnd
trigger1 = !animelemtime(1)
value = S3000,0
volumescale = 255

[State 1020, snd]
type = PlaySnd
trigger1 = !animelemtime(1)
value = S1600,0
volumescale = 255

[State 1020, snd]
type = PlaySnd
trigger1 = !animelemtime(1)
value = S6000,(1+random%2)
volumescale = 255

[State 1020, snd]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 6
trigger3 = AnimElem = 10
trigger4 = AnimElem = 14
value = S1000,0
volumescale = 255

[State 1020, proj]
type = Projectile
trigger1 = AnimElem = 2
trigger2 = AnimElem = 6
trigger3 = AnimElem = 10
trigger4 = AnimElem = 14
ProjID = 1000
projanim = 6100
projhitanim = 6105
projhits = 1
projscale = 0.5,0.5
offset = 35,-75
velocity = 4,0
attr = S,HP
damage = 35,15
animtype = Hard
hitflag = MAF
guardflag = M
sparkno = S6110
guard.sparkno = S6110
sparkxy = 0,0
hitsound = S1001,0
guardsound = S1001,0
pausetime = 0,12
ground.type = High
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -8
ground.cornerpush.veloff = 0
guard.velocity = -8
airguard.velocity = -3.5,-5.5
air.animtype = Back
air.velocity = -2.5,-5.5
air.fall = 1
fall.recover = 0

[State 1020, proj]
type = Projectile
trigger1 = AnimElem = 2
trigger2 = AnimElem = 6
trigger3 = AnimElem = 10
trigger4 = AnimElem = 14
ProjID = 1000
projanim = 6100
projhitanim = 6105
projhits = 1
projscale = 0.5,0.5
offset = 35,-75
velocity = 4,0
attr = S,HP
damage = 35,15
animtype = Hard
hitflag = MAF
guardflag = M
sparkno = S6110
guard.sparkno = S6110
sparkxy = 0,0
hitsound = S1001,0
guardsound = S1001,0
pausetime = 0,12
ground.type = High
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -8
ground.cornerpush.veloff = 0
guard.velocity = -8
airguard.velocity = -3.5,-5.5
air.animtype = Back
air.velocity = -2.5,-5.5
air.fall = 1
fall.recover = 0

[State 1020, proj]
type = Projectile
trigger1 = AnimElem = 2
trigger2 = AnimElem = 6
trigger3 = AnimElem = 10
trigger4 = AnimElem = 14
ProjID = 1000
projanim = 6100
projhitanim = 6105
projhits = 1
projscale = 0.5,0.5
offset = 35,-75
velocity = 4,-2
attr = S,HP
damage = 35,15
animtype = Hard
hitflag = MAF
guardflag = M
sparkno = S6110
guard.sparkno = S6110
sparkxy = 0,0
hitsound = S1001,0
guardsound = S1001,0
pausetime = 0,12
ground.type = High
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -8
ground.cornerpush.veloff = 0
guard.velocity = -8
airguard.velocity = -3.5,-5.5
air.animtype = Back
air.velocity = -2.5,-5.5
air.fall = 1
fall.recover = 0

[State 1020, proj]
type = Projectile
trigger1 = AnimElem = 2
trigger2 = AnimElem = 6
trigger3 = AnimElem = 10
trigger4 = AnimElem = 14
ProjID = 1000
projanim = 6100
projhitanim = 6105
projhits = 1
projscale = 0.5,0.5
offset = 35,-75
velocity = 4,-4
attr = S,HP
damage = 35,15
animtype = Hard
hitflag = MAF
guardflag = M
sparkno = S6110
guard.sparkno = S6110
sparkxy = 0,0
hitsound = S1001,0
guardsound = S1001,0
pausetime = 0,12
ground.type = High
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -8
ground.cornerpush.veloff = 0
guard.velocity = -8
airguard.velocity = -3.5,-5.5
air.animtype = Back
air.velocity = -2.5,-5.5
air.fall = 1
fall.recover = 0

[State 1020, end]
type = SelfState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Youma 1
[Statedef 1300]
type = S
movetype = A
physics = S
anim = 1200
ctrl = 0
velset = 0,0
poweradd = 20
sprpriority = 2

[State 1300, snd]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S1000,0
volumescale = 255

[State 1300, voice]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = S180,1
volumescale = 255

[State 1300, Helper]
type = Helper
triggerall = !ishelper(6000)
trigger1 = !AnimElemTime(2)
helpertype = player
name = "youma-1"
ID = 6000
stateno = 6000
pos = 25,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
ignorehitpause = 1

[State 1300, self]
type = SelfState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Youma 2
[Statedef 1301]
type = S
movetype = A
physics = S
anim = 1200
ctrl = 0
velset = 0,0
poweradd = 20
sprpriority = 2

[State 1301, snd]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S1000,0
volumescale = 255

[State 1301, voice]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = S180,1
volumescale = 255

[State 1301, Helper]
type = Helper
triggerall = !ishelper(6010)
trigger1 = !AnimElemTime(2)
helpertype = player
name = "youma-1"
ID = 6010
stateno = 6010
pos = 25,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
ignorehitpause = 1

[State 1301, self]
type = SelfState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Youma 3
[Statedef 1302]
type = S
movetype = A
physics = S
anim = 1200
ctrl = 0
velset = 0,0
poweradd = 20
sprpriority = 2

[State 1302, snd]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S1000,0
volumescale = 255

[State 1302, voice]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = S180,1
volumescale = 255

[State 1302, Helper]
type = Helper
triggerall = !ishelper(6020)
trigger1 = !AnimElemTime(2)
helpertype = player
name = "youma-1"
ID = 6020
stateno = 6020
pos = 25,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
ignorehitpause = 1

[State 1302, self]
type = SelfState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Youma Kick
[Statedef 1350]
type = S
movetype = A
physics = S
anim = 195
ctrl = 0
velset = 0,0
poweradd = -300
sprpriority = 2

[State 1350, voice]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S180,1
volumescale = 255

[State 1350, Helper]
type = Helper
triggerall = !ishelper(6050)
trigger1 = !AnimElemTime(1)
helpertype = player
name = "youma-throw"
ID = 6050
stateno = 6050
pos = -320,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
ignorehitpause = 1

[State 1350, self]
type = SelfState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Youma Flamer
[Statedef 1400]
type = S
movetype = A
physics = S
anim = 195
ctrl = 0
velset = 0,0
poweradd = -300
sprpriority = 2

[State 1400, voice]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S180,1
volumescale = 255

[State 1400, Helper]
type = Helper
triggerall = !ishelper(6100)
trigger1 = !AnimElemTime(1)
helpertype = player
name = "youma-flamer"
ID = 6100
stateno = 6100
pos = -320,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
ignorehitpause = 1

[State 1400, self]
type = SelfState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Super Kick Attack
[Statedef 1500]
type = S
movetype = A
physics = N
anim = 1500
ctrl = 0
velset = 0,0
poweradd = 0
sprpriority = 2

[State 1500, voice]
type = PlaySnd
trigger1 = !animelemtime(1)
value = S2000,0
volumescale = 255

[State 1500, snd]
type = PlaySnd
trigger1 = !animelemtime(1)
value = S300,8
volumescale = 255

[State 1500, effect]
type = Explod
triggerall = PlayerIDExist(ID)
trigger1 = !animelemtime(2)
trigger2 = !animelemtime(6)
anim = 4130
ID = 4130
pos = 30,-30
postype = p1
bindtime = -1
removetime = -2
sprpriority = 5
ownpal = 1
trans = add
removeongethit = 1

[State 1500, hit]
type = hitdef
trigger1 = (animelem=2||animelem=3||animelem=4)
attr = S,SA
damage = 30,15
animtype = Back
priority = 7,Hit
hitflag = MAF
guardflag = M
sparkno = S6000+(random%4)
guard.sparkno = s6005
sparkxy = -20,ifelse((animelem=2),-35,-60)
hitsound = S200,(5+random%3)
guardsound = S120,(random%2)
pausetime = 12,12
getpower = 100
ground.type = Low
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -2,-8
air.type = Low
air.velocity = -8,-6
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 60
envshake.ampl = 4

[State 1500, hit]
type = hitdef
trigger1 = (animelem=6||animelem=7||animelem=8)
attr = S,SA
damage = 30,15
animtype = Back
priority = 7,Hit
hitflag = MAF
guardflag = M
sparkno = S6000+(random%4)
guard.sparkno = s6005
sparkxy = -20,ifelse((animelem=2),-35,-60)
hitsound = S200,(5+random%3)
guardsound = S120,(random%2)
pausetime = 12,12
getpower = 100
ground.type = Low
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -8,-6
air.type = Low
air.velocity = -8,-6
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 60
envshake.ampl = 4

[State 1500, vel]
type = VelSet
trigger1 = animelem = 1
x = 4
y = -5

[State 1500, vel]
type = VelSet
trigger1 = animelem = 8
x = -5
y = -3

[State 1500, After]
type = AfterImage
trigger1 = AnimElem = 1
time = 60
TimeGap = 1
FrameGap = 1
length = 10
PalBright = 1,1,1
PalContrast = 0,150,0
PalAdd = 0,0,0
PalMul = 1,1,1
trans = add1

[State 1500, self]
type = SelfState
trigger1 = !animtime
value = 50
ctrl = 1

;---------------------------------------------------------------------------
;Super Kick Attack
[Statedef 1501]
type = S
movetype = A
physics = N
anim = 1500
ctrl = 0
velset = 0,0
poweradd = 0
sprpriority = 2

[State 1501, voice]
type = PlaySnd
trigger1 = !animelemtime(1)
value = S2000,0
volumescale = 255

[State 1501, snd]
type = PlaySnd
trigger1 = !animelemtime(1)
value = S300,8
volumescale = 255

[State 1501, effect]
type = Explod
triggerall = PlayerIDExist(ID)
trigger1 = !animelemtime(2)
trigger2 = !animelemtime(6)
anim = 4130
ID = 4130
pos = 30,-30
postype = p1
bindtime = -1
removetime = -2
sprpriority = 5
ownpal = 1
trans = add
removeongethit = 1

[State 1501, hit]
type = hitdef
trigger1 = (animelem=2||animelem=3||animelem=4)
attr = S,SA
damage = 30,15
animtype = Back
priority = 7,Hit
hitflag = MAF
guardflag = M
sparkno = S6000+(random%4)
guard.sparkno = s6005
sparkxy = -20,ifelse((animelem=2),-35,-60)
hitsound = S200,(5+random%3)
guardsound = S120,(random%2)
pausetime = 12,12
getpower = 100
ground.type = Low
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -2,-8
air.type = Low
air.velocity = -8,-6
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 60
envshake.ampl = 4

[State 1501, hit]
type = hitdef
trigger1 = (animelem=6||animelem=7||animelem=8)
attr = S,SA
damage = 30,15
animtype = Back
priority = 7,Hit
hitflag = MAF
guardflag = M
sparkno = S6000+(random%4)
guard.sparkno = s6005
sparkxy = -20,ifelse((animelem=2),-35,-60)
hitsound = S200,(5+random%3)
guardsound = S120,(random%2)
pausetime = 12,12
getpower = 100
ground.type = Low
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -8,-6
air.type = Low
air.velocity = -8,-6
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 60
envshake.ampl = 4

[State 1501, vel]
type = VelSet
trigger1 = animelem = 1
x = 5
y = -6

[State 1501, vel]
type = VelSet
trigger1 = animelem = 8
x = -5
y = -3

[State 1501, After]
type = AfterImage
trigger1 = AnimElem = 1
time = 60
TimeGap = 1
FrameGap = 1
length = 10
PalBright = 1,1,1
PalContrast = 0,150,0
PalAdd = 0,0,0
PalMul = 1,1,1
trans = add1

[State 1501, self]
type = SelfState
trigger1 = !animtime
value = 50
ctrl = 1

;---------------------------------------------------------------------------
;Super Kick Attack
[Statedef 1502]
type = S
movetype = A
physics = N
anim = 1500
ctrl = 0
velset = 0,0
poweradd = 0
sprpriority = 2

[State 1502, voice]
type = PlaySnd
trigger1 = !animelemtime(1)
value = S2000,0
volumescale = 255

[State 1502, snd]
type = PlaySnd
trigger1 = !animelemtime(1)
value = S300,8
volumescale = 255

[State 1502, effect]
type = Explod
triggerall = PlayerIDExist(ID)
trigger1 = !animelemtime(2)
trigger2 = !animelemtime(6)
anim = 4130
ID = 4130
pos = 30,-30
postype = p1
bindtime = -1
removetime = -2
sprpriority = 5
ownpal = 1
trans = add
removeongethit = 1

[State 1502, hit]
type = hitdef
trigger1 = (animelem=2||animelem=3||animelem=4)
attr = S,SA
damage = 30,15
animtype = Back
priority = 7,Hit
hitflag = MAF
guardflag = M
sparkno = S6000+(random%4)
guard.sparkno = s6005
sparkxy = -20,ifelse((animelem=2),-35,-60)
hitsound = S200,(5+random%3)
guardsound = S120,(random%2)
pausetime = 12,12
getpower = 100
ground.type = Low
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -2,-8
air.type = Low
air.velocity = -8,-6
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 60
envshake.ampl = 4

[State 1502, hit]
type = hitdef
trigger1 = (animelem=6||animelem=7||animelem=8)
attr = S,SA
damage = 30,15
animtype = Back
priority = 7,Hit
hitflag = MAF
guardflag = M
sparkno = S6000+(random%4)
guard.sparkno = s6005
sparkxy = -20,ifelse((animelem=2),-35,-60)
hitsound = S200,(5+random%3)
guardsound = S120,(random%2)
pausetime = 12,12
getpower = 100
ground.type = Low
ground.slidetime = 22
ground.hittime = 22
ground.velocity = -8,-6
air.type = Low
air.velocity = -8,-6
fall = 1
fall.recover = 0
envshake.time = 16
envshake.freq = 60
envshake.ampl = 4

[State 1502, vel]
type = VelSet
trigger1 = animelem = 1
x = 6
y = -9

[State 1502, vel]
type = VelSet
trigger1 = animelem = 6
x = 2
y = -3

[State 1502, vel]
type = VelSet
trigger1 = animelem = 8
x = -5
y = -3

[State 1502, After]
type = AfterImage
trigger1 = AnimElem = 1
time = 60
TimeGap = 1
FrameGap = 1
length = 10
PalBright = 1,1,1
PalContrast = 0,150,0
PalAdd = 0,0,0
PalMul = 1,1,1
trans = add1

[State 1502, self]
type = SelfState
trigger1 = !animtime
value = 50
ctrl = 1

;---------------------------------------------------------------------------
;Zoom Dodge
[Statedef 1600]
type= S
movetype = I
physics = S
anim = 1600
ctrl = 0
velset = 0,0
poweradd = 50
sprpriority = -1

[State 1600, voice]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S180,1
channel = 1
volumescale = 255

[State 1600, snd]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S1600,0
channel = 2
volumescale = 255

[State 1600, After]
type = AfterImage
trigger1 = !AnimElemTime(1)
time = 22
timegap = 1
framegap = 1
length = 10
PalBright = 1,1,1
PalContrast = 0,150,0
PalAdd = 0,0,0
PalMul = 1,1,1
trans = add

[State 1600, Vel]
type = VelSet
trigger1 = (animelemtime(2)>= 0) && (animelemtime(10)<=0)
x = 6.2

[State 1600, Push]
type = PlayerPush
trigger1 = animelemtime(1)>=0
value = 0

[State 1600, end]
type = SelfState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Zoom Dodge (Short)
[Statedef 1601]
type = S
movetype = I
physics = S
anim = 1601
ctrl = 0
velset = 0,0
poweradd = 50
sprpriority = 2

[State 1601, voice]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S180,1
channel = 1
volumescale = 255

[State 1601, snd]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S1600,0
channel = 2
volumescale = 255

[State 1601, After]
type = AfterImage
trigger1 = !AnimElemTime(1)
time = 22
timegap = 1
framegap = 1
length = 10
PalBright = 1,1,1
PalContrast = 0,150,0
PalAdd = 0,0,0
PalMul = 1,1,1
trans = add

[State 1601, Vel]
type = Velset
trigger1 = !AnimelemTime(3)
x = 25

[State 1601, Vel]
type = Velset
trigger1 = !AnimelemTime(5)
x = 12

[State 1601, Push]
type = PlayerPush
trigger1 = animelemtime(1)>=0
value = 0

[State 1601, end]
type = SelfState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Zoom Dodge (Long)
[Statedef 1602]
type = S
movetype = A
physics = S
anim = 1600
ctrl = 0
velset = 50,0
poweradd = 0
sprpriority = 1

[State 1602, voice]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S180,1
channel = 1
volumescale = 255

[State 1602, snd]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S1600,0
channel = 2
volumescale = 255

[State 1602, After]
type = AfterImage
trigger1 = !AnimElemTime(1)
time = 22
timegap = 1
framegap = 1
length = 10
PalBright = 1,1,1
PalContrast = 0,150,0
PalAdd = 0,0,0
PalMul = 1,1,1
trans = add

[State 1602, Push]
type = PlayerPush
trigger1 = Time >= 0
value = 0

[State 1602, end]
type = SelfState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Stand Counter
[Statedef 1700]
type = S
movetype = A
physics = S
anim = 1700
ctrl = 0
velset = 0,0
poweradd = -500
sprpriority = 2

[State 1700, Pause]
type = SuperPause
trigger1 = !Time
time = 30
anim = -1
sound = -1
darken = 1
p2defmul = 1
ignorehitpause = 1

[State 1700, NHB]
type = NotHitBy
trigger1 = !Time
value = SCA,AA,AT,AP
time = 30
ignorehitpause = 1

[State 1700, voice]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S1900,0
volumescale = 255

[State 1700, snd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = S300,(6+random%2)

[State 1700, Hit]
type = HitDef
trigger1 = !Time
attr = S,HA
damage = 50,25
animtype = back
priority = 7,hit
hitflag = MAF
guardflag = M
sparkno = S6000+(random%4)
guard.sparkno = s6005
sparkxy = -15,-75
hitsound = S200,(5+random%3)
guardsound = S120,(random%2)
pausetime = 30,35
givepower = -100,0
ground.type = Low
ground.slidetime = 24
ground.hittime  = 30
ground.velocity = -8,-7
air.velocity = -8.2,-7.5
fall.animtype = back
fall = 1
fall.recover = 0
fall.yvelocity = -4.5
yaccel = 0.35
envshake.time = 18
envshake.ampl = 6

[State 1700, turn]
type=turn
triggerall=numenemy
trigger1=enemynear(numenemy>1&&enemynear,alive=0),facing=-facing
trigger1=frontedgedist<enemynear(numenemy>1&&enemynear,alive=0),backedgedist
trigger2=enemynear(numenemy>1&&enemynear,alive=0),facing=facing
trigger2=frontedgedist<enemynear(numenemy>1&&enemynear,alive=0),frontedgedist
ignorehitpause = 1

[State 1700, end]
type = SelfState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Air Counter
[Statedef 1710]
type = A
movetype = A
physics = N
anim = 1710
ctrl = 0
velset = 0,0
poweradd = -500
sprpriority = 2

[State 1710, Pause]
type = SuperPause
trigger1 = !Time
time = 30
anim = -1
sound = -1
darken = 1
p2defmul = 1
ignorehitpause = 1

[State 1710, NHB]
type = NotHitBy
trigger1 = !Time
value = SCA,AA,AT,AP
time = 30
ignorehitpause = 1

[State 1710, voice]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S1900,0
volumescale = 255

[State 1710, snd]
type = PlaySnd
trigger1 = !AnimElemTime(2)
value = S300,(6+random%2)

[State 1710, Hit]
type = HitDef
trigger1 = !Time
attr = A,HA
damage = 50,25
animtype = back
priority = 7,hit
hitflag = MAF
guardflag = M
sparkno = S6000+(random%4)
guard.sparkno = s6005
sparkxy = -15,-75
hitsound = S200,(5+random%3)
guardsound = S120,(random%2)
pausetime = 30,35
givepower = -100,0
ground.type = Low
ground.slidetime = 24
ground.hittime  = 30
ground.velocity = -8,-7
air.velocity = -8.2,-7.5
fall.animtype = back
fall = 1
fall.recover = 0
fall.yvelocity = -4.5
yaccel = 0.35
envshake.time = 18
envshake.ampl = 6

[State 1710, turn]
type=turn
triggerall=numenemy
trigger1=enemynear(numenemy>1&&enemynear,alive=0),facing=-facing
trigger1=frontedgedist<enemynear(numenemy>1&&enemynear,alive=0),backedgedist
trigger2=enemynear(numenemy>1&&enemynear,alive=0),facing=facing
trigger2=frontedgedist<enemynear(numenemy>1&&enemynear,alive=0),frontedgedist
ignorehitpause = 1

[State 1710, end]
type = SelfState
trigger1 = !AnimTime
value = 50
ctrl = 1

;---------------------------------------------------------------------------
;Dark Power
[Statedef 2000]
type = S
movetype = A
physics = S
anim = 2000
ctrl = 0
velset = 0,0
poweradd = -2000
sprpriority = 2

[State 2000, S-Pause]
type = SuperPause
trigger1 = !AnimElemTime(1)
time = 60
anim = -1
sound = -1
darken = 1
ignorehitpause = 1

[State 2000, super]
type = Explod
triggerall = PlayerIDExist(ID)
trigger1 = !animelemtime(1)
anim = 6021
ID = 6021
pos = 0,-75
postype = p1
bindtime = 1
removetime = -2
sprpriority = 2
ownpal = 1
trans = add
supermovetime=2147483647
pausemovetime=2147483647
ignorehitpause = 1

[State 2000, energy]
type = Explod
triggerall = PlayerIDExist(ID)
trigger1 = !animelemtime(1)
anim = 6220
ID = 6220
pos = 0,0
postype = p1
bindtime = 1
removetime = -2
sprpriority = 4
ownpal = 1
trans = add
supermovetime=2147483647
pausemovetime=2147483647
ignorehitpause = 1

[State 2000, energy]
type = Explod
triggerall = PlayerIDExist(ID)
trigger1 = !animelemtime(1)
anim = 6210
ID = 6210
pos = 0,0
postype = p1
facing = 1
bindtime = 1
removetime = -2
sprpriority = -1
ownpal = 1
trans = add
supermovetime=2147483647
pausemovetime=2147483647
ignorehitpause = 1

[State 2000, energy]
type = Explod
triggerall = PlayerIDExist(ID)
trigger1 = !animelemtime(1)
anim = 6210
ID = 6210
pos = 0,0
postype = p1
facing = -1
bindtime = 1
removetime = -2
sprpriority = -1
ownpal = 1
trans = add
supermovetime=2147483647
pausemovetime=2147483647
ignorehitpause = 1

[State 2000, BG]
type = Explod
triggerall = PlayerIDExist(ID)
trigger1 = !animelemtime(1)
anim = 4000
ID = 4000
pos = 0,0
postype = back
bindtime = 1
removetime = -2
sprpriority = 10
ownpal = 1
trans = none
supermovetime=2147483647
pausemovetime=2147483647
ignorehitpause = 1

[State 2000, voice]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S3000, 0
volumescale = 255

[State 2000, snd]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S1600,0
volumescale = 255

[State 2000, snd]
type = PlaySnd
trigger1 = !AnimElemTime(1)
value = S6000,0
volumescale = 255

[State 2000, snd]
type = PlaySnd
trigger1 = !AnimElemTime(3)
value = S6000,8
volumescale = 255

[State 2000, proj]
type = Projectile
trigger1 = !AnimElemTime(3)
ProjID = 6250
projanim = 6250
projhitanim = -1
projhits = 4
projremovetime = 240
projedgebound = 120
offset = (p2dist x-30),0
postype = p1
velocity = 0,0
attr = S,HP
damage = 20,10
hitflag = MAFDP
guardflag = M
sparkno = -1
guard.sparkno = -1
sparkxy = 0,0
hitsound = S6000,5
guardsound = -1
pausetime = 5,10
getpower = 50
givepower = -50
ground.type = High
ground.slidetime = 15
ground.hittime  = 30
ground.velocity = -15,-15
airguard.velocity = -3.5,-5.5
air.velocity = -5.5,-5.5
fall = 1
fall.recover = 0
air.fall = 1
envshake.time = 4
envshake.freq = 180
envshake.ampl = 8

[State 2000, proj]
type = Projectile
trigger1 = !AnimElemTime(3)
ProjID = 6251
projanim = 6250
projhitanim = -1
projhits = 4
projremovetime = 240
projedgebound = 120
offset = (p2dist x+30),0
postype = p1
velocity = 0,0
attr = S,HP
damage = 20,10
hitflag = MAFDP
guardflag = M
sparkno = -1
guard.sparkno = -1
sparkxy = 0,0
hitsound = S6000,5
guardsound = -1
pausetime = 5,10
getpower = 50
givepower = -50
ground.type = High
ground.slidetime = 15
ground.hittime  = 30
ground.velocity = -15,-15
airguard.velocity = -3.5,-5.5
air.velocity = -5.5,-5.5
fall = 1
fall.recover = 0
air.fall = 1
envshake.time = 4
envshake.freq = 180
envshake.ampl = 8

[State 2000, proj]
type = Projectile
trigger1 = !AnimElemTime(3)
ProjID = 6252
projanim = 6250
projhitanim = -1
projhits = 4
projremovetime = 240
projedgebound = 120
offset = (p2dist x-60),0
postype = p1
velocity = 0,0
attr = S,HP
damage = 20,10
hitflag = MAFDP
guardflag = M
sparkno = -1
guard.sparkno = -1
sparkxy = 0,0
hitsound = S6000,5
guardsound = -1
pausetime = 5,10
getpower = 50
givepower = -50
ground.type = High
ground.slidetime = 15
ground.hittime  = 30
ground.velocity = -15,-15
airguard.velocity = -3.5,-5.5
air.velocity = -5.5,-5.5
fall = 1
fall.recover = 0
air.fall = 1
envshake.time = 4
envshake.freq = 180
envshake.ampl = 8

[State 2000, proj]
type = Projectile
trigger1 = !AnimElemTime(3)
ProjID = 6253
projanim = 6250
projhitanim = -1
projhits = 4
projremovetime = 240
projedgebound = 120
offset = (p2dist x+60),0
postype = p1
velocity = 0,0
attr = S,HP
damage = 20,10
hitflag = MAFDP
guardflag = M
sparkno = -1
guard.sparkno = -1
sparkxy = 0,0
hitsound = S6000,5
guardsound = -1
pausetime = 5,10
getpower = 50
givepower = -50
ground.type = High
ground.slidetime = 15
ground.hittime  = 30
ground.velocity = -15,-15
airguard.velocity = -3.5,-5.5
air.velocity = -5.5,-5.5
fall = 1
fall.recover = 0
air.fall = 1
envshake.time = 4
envshake.freq = 180
envshake.ampl = 8

[State 2000, end]
type = SelfState
trigger1 = !AnimTime
value = 0
ctrl = 1
