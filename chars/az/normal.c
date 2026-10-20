;===========================================================================
;†††normal actions†††
;===========================================================================
;■挑発
[statedef 195]
type = s
ctrl = 0
movetype = i
anim = 195
physics = s

[state 195, playsnd]
type = playsnd
trigger1 = animelemtime(1) = 0
value = 10,1+(var(1)=[0,49])
channel = 0
freqmul = ifelse(var(33),2-const(size.xscale),1)

[state 195, poweradd]
type = poweradd
trigger1 = 1
value = 10

[state 195, lifeadd]
type = lifeadd
trigger1 = timemod = 5,0
value = 2

[state 195, ctrlset]
type = ctrlset
trigger1 = animelemtime(9) > 10
value = 1

[state 195, changestate]
type = changestate
triggerall = var(50) = 0
trigger1 = animtime = 0
trigger1 = command != "hold_s"
trigger1 = command != "holddown"
value = 199

[state 195, changestate]
type = changestate
triggerall = var(50) = 0
trigger1 = animtime = 0
trigger1 = command != "hold_s"
trigger1 = command = "holddown"
value = 11
ctrl = 1
;---------------------------------------------------------------------------
[statedef 199]
anim = 199
movetype = i
physics = s
ctrl = 1

[state 199, poweradd]
type = poweradd
trigger1 = 1
value = 7

[state 199, changestate]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;■立ち小パンチ
[statedef 200]
type    = s
movetype= a
physics = s
ctrl = 0
anim = 200
poweradd = 0

[state 200, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
value = 0,0

[state 200, hitdef]
type = hitdef
trigger1 = animelemtime(3) = 0
id = 200
attr = s,na
hitflag = maf
guardflag = ma
affectteam = e
animtype = light
ground.type = high
priority = 3,hit
sprpriority = 1
damage = floor(16*fvar(1)),0
getpower = 30,15
givepower = 8,5
ground.hittime  = 12
air.hittime = 16
guard.ctrltime = 10
ground.slidetime = 10
pausetime = 8,8
sparkno = s25000
guard.sparkno = s25030
sparkxy = -floor(const(size.xscale)*10),-floor(const(size.yscale)*36)
hitsound = s1,0
guardsound = s2,0
ground.velocity = -8
guard.velocity = -6
air.velocity = -1.4,-3
;air.fall = 1
fall.recovertime = 30
guard.cornerpush.veloff = -6

[state 200, targetdrop]
type = targetdrop
trigger1 = numenemy > 1
trigger1 = movehit
excludeid = 200
ignorehitpause = 1

[state 200, targetstate]
type = targetstate
trigger1 = numtarget(200) > 0
trigger1 = target(200),statetype = a
trigger1 = movehit = 1
value = 5025
ignorehitpause = 1

[state 200, changestate]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;■立ち中パンチ
[statedef 210]
type    = s
movetype= a
physics = s
poweradd= 0
ctrl = 0
anim = 210

[state 210, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
value = 0,1

[state 210, hitdef]
type = hitdef
trigger1 = animelemtime(2) = 0
id = 210
attr = s,na
hitflag = maf
guardflag = ma
affectteam = e
animtype  = medium
ground.type = low
priority = 3,hit
sprpriority = 1
damage = floor(28*fvar(1)),0
getpower = 30,15
givepower = 20,5
ground.hittime  = 24
air.hittime = 24
guard.ctrltime = 12
ground.slidetime = 24
pausetime = 12,12
sparkno = s25001
guard.sparkno = s25030
sparkxy = -floor(const(size.xscale)*10),-floor(const(size.yscale)*50)
hitsound = s1,1
guardsound = s2,0
ground.velocity = -16
guard.velocity = -12
air.velocity = -8,-4
air.fall = 1
fall.recovertime = 25
guard.cornerpush.veloff = -12

[state 210, targetdrop]
type = targetdrop
trigger1 = numenemy > 1
trigger1 = movehit
excludeid = 210
ignorehitpause = 1

[state 210, targetstate]
type = targetstate
trigger1 = numtarget(210) > 0
trigger1 = target(210),statetype = a
trigger1 = movehit = 1
value = 5025
ignorehitpause = 1

[state 210, changestate]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;■立ち大パンチ
[statedef 220]
type    = s
movetype= a
physics = s
ctrl = 0
anim = 220
poweradd = 0

[state 220, width]
type = width
trigger1 = 1
player = floor(const(size.xscale)*30),0

[state 220, posadd]
type = posadd
trigger1 = animelemtime(2) = 0
x = floor(const(size.xscale)*115)

[state 220, posadd]
type = posadd
trigger1 = animelemtime(3) = 0
x = floor(const(size.xscale)*35)

[state 220, posadd]
type = posadd
trigger1 = animelemtime(5) = 0
x = -floor(const(size.xscale)*35)

[state 220, posadd]
type = posadd
trigger1 = animelemtime(6) = 0
x = -floor(const(size.xscale)*115)

[state 220, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
value = 0,2

[state 220, hitdef]
type = hitdef
trigger1 = animelemtime(3) = 0
id = 220
attr = s,na
hitflag = maf
guardflag = ma
affectteam = e
animtype  = back
ground.type = low
priority = 5,hit
sprpriority = 1
damage = floor(90*fvar(1)),0
getpower = 30,15
givepower = 20,5
ground.hittime  = 80
air.hittime = 200
guard.ctrltime = 40
ground.slidetime = 24
pausetime = 12,12
sparkno = s25002
guard.sparkno = s25030
sparkxy = -floor(const(size.xscale)*30),-floor(const(size.yscale)*76)
hitsound = s1,2
guardsound = s2,0
ground.velocity = -32,-3
guard.velocity = -16
air.velocity = -28,-4
envshake.time = 16
envshake.freq = 100
envshake.ampl = 8
fall = 1
;air.fall = 1
fall.envshake.time = 16
fall.envshake.freq = 60
fall.envshake.ampl = 5
fall.recovertime = 90
guard.cornerpush.veloff = -20

[state 220, targetdrop]
type = targetdrop
trigger1 = numenemy > 1
trigger1 = movehit
excludeid = 220
ignorehitpause = 1

[state 220, targetstate]
type = targetstate
trigger1 = numtarget(220) > 0
trigger1 = movehit = 1
value = 5025
ignorehitpause = 1

[state 220, changestate]
type = changestate
trigger1 = animtime = 0
value = 0+(command="holddown")*11
ctrl = 1
;---------------------------------------------------------------------------
;■立ち小キック
[statedef 230]
type    = c
movetype= a
physics = s
ctrl = 0
anim = 230
poweradd = 0

[state 230, playsnd]
type = playsnd
trigger1 = animelemtime(1) = 0
value = 0,0

[state 230, hitdef]
type = hitdef
trigger1 = animelemtime(3) = 0
id = 230
attr = s,na
hitflag = mafd
guardflag = la
affectteam = e
animtype = light
ground.type = high
priority = 3,hit
sprpriority = 1
damage = floor(18*fvar(1)),0
getpower = 30,15
givepower = 8,5
ground.hittime  = 14
air.hittime = 16
guard.ctrltime = 12
ground.slidetime = 12
pausetime = 8,8
sparkno = s25000
guard.sparkno = s25030
sparkxy = -floor(const(size.xscale)*10),-floor(const(size.yscale)*31)
hitsound = s1,3
guardsound = s2,0
ground.velocity = -8.4
guard.velocity = -6
air.velocity = -1.8,-3
;air.fall = 1
fall.recovertime = 30
guard.cornerpush.veloff = -6

[state 230, targetdrop]
type = targetdrop
trigger1 = numenemy > 1
trigger1 = movehit
excludeid = 230
ignorehitpause = 1

[state 230, targetstate]
type = targetstate
trigger1 = numtarget(230) > 0
trigger1 = target(230),statetype = a
trigger1 = movehit = 1
value = 5025
ignorehitpause = 1

[state 230, changestate]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;■立ち大キック
[statedef 250]
type    = s
movetype= a
physics = s
ctrl = 0
anim = 250
poweradd = 0

[state 250, playsnd]
type = playsnd
trigger1 = animelemtime(4) = 0
value = 0,2

[state 250, playsnd]
type = playsnd
trigger1 = animelemtime(5) = 0
value = 1,13

[state 250, envshake]
type = envshake
trigger1 = animelemtime(5) = 0
time = 20
freq = 100
ampl = 10
phase = 50

[state 250, hitdef]
type = hitdef
trigger1 = animelemtime(5) = 0
id = 250
attr = s,na
hitflag = mafd
guardflag = ha
affectteam = e
animtype  = back
ground.type = trip
priority = 4,hit
sprpriority = 1
damage = floor(70*fvar(1)),0
getpower = 30,15
givepower = 10,5
ground.hittime  = 30
air.hittime = 50
guard.ctrltime = 25
ground.slidetime = 12
pausetime = 12,12
sparkno = s25002
guard.sparkno = s25030
sparkxy = -floor(const(size.xscale)*30),-floor(const(size.yscale)*60)
hitsound = s1,14;s1,2
guardsound = s2,0
ground.velocity = -8,-2
guard.velocity = -12
air.velocity = -6,-2
down.velocity = 0,0
fall.recovertime = 30
guard.cornerpush.veloff = -13

[state 250, targetdrop]
type = targetdrop
trigger1 = numenemy > 1
trigger1 = movehit
excludeid = 250
ignorehitpause = 1

[state 250, targetstate]
type = targetstate
trigger1 = numtarget(250) > 0
trigger1 = movehit = 1
value = 5075
ignorehitpause = 1

[state 250, changestate]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;■しゃがみ小パンチ
[statedef 300]
type    = c
movetype= a
physics = c
ctrl = 0
anim = 300
poweradd = 0

[state 300, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
value = 0,0

[state 300, hitdef]
type = hitdef
trigger1 = animelemtime(3) = 0
id = 300
attr = s,na
hitflag = maf
guardflag = ma
affectteam = e
animtype = light
ground.type = high
priority = 3,hit
sprpriority = 1
damage = floor(12*fvar(1)),0
getpower = 30,15
givepower = 8,5
ground.hittime  = 12
air.hittime = 16
guard.ctrltime = 10
ground.slidetime = 10
pausetime = 8,8
sparkno = s25000
guard.sparkno = s25030
sparkxy = -floor(const(size.xscale)*10),-floor(const(size.yscale)*12)
hitsound = s1,0
guardsound = s2,0
ground.velocity = -8
guard.velocity = -6
air.velocity = -1.4,-3
;air.fall = 1
fall.recovertime = 30
guard.cornerpush.veloff = -6

[state 300, targetdrop]
type = targetdrop
trigger1 = numenemy > 1
trigger1 = movehit
excludeid = 300
ignorehitpause = 1

[state 300, targetstate]
type = targetstate
trigger1 = numtarget(300) > 0
trigger1 = target(300),statetype = a
trigger1 = movehit = 1
value = 5025
ignorehitpause = 1

[state 300, changestate]
type = changestate
trigger1 = animtime = 0
value = 11
ctrl = 1
;---------------------------------------------------------------------------
;■しゃがみ中パンチ
[statedef 310]
type    = c
movetype= a
physics = c
poweradd= 0
ctrl = 0
anim = 310

[state 310, playsnd]
type = playsnd
trigger1 = animelemtime(4) = 0
value = 0,1

[state 310, hitdef]
type = hitdef
trigger1 = animelemtime(4) = 0
trigger2 = animelemtime(4) = 3
trigger3 = animelemtime(5) = 0
id = 310
attr = c,na
hitflag = maf
guardflag = la
affectteam = e
animtype  = medium
ground.type = low
priority = 3,hit
sprpriority = 1
damage = floor(9*fvar(1)),0
getpower = 30,15
givepower = 20,5
ground.hittime  = 24
air.hittime = 20
guard.ctrltime = 24
ground.slidetime = 24
pausetime = 12,12
sparkno = s25001
guard.sparkno = s25030
sparkxy = -floor(const(size.xscale)*10),-floor(const(size.yscale)*21)
hitsound = s1,1
guardsound = s2,0
ground.velocity = -16
guard.velocity = -12
air.velocity = -8,-4
;air.fall = 1
fall.recovertime = 60
guard.cornerpush.veloff = -12

[state 310, targetdrop]
type = targetdrop
trigger1 = numenemy > 1
trigger1 = movehit
excludeid = 310
ignorehitpause = 1

[state 310, targetstate]
type = targetstate
trigger1 = numtarget(310) > 0
trigger1 = target(310),statetype = a
trigger1 = movehit = 1
value = 5025
ignorehitpause = 1

[state 310, changestate]
type = changestate
trigger1 = animtime = 0
value = 11
ctrl = 1
;---------------------------------------------------------------------------
;■しゃがみ大キック
[statedef 350]
type    = c
movetype= a
physics = c
poweradd= 0
ctrl = 0
anim = 350

[state 350, playsnd]
type = playsnd
trigger1 = animelemtime(3) = 0
value = 0,2

[state 350, hitdef]
type = hitdef
trigger1 = animelemtime(5) = 0
id = 350
attr = c,na
hitflag = mafd
guardflag = la
affectteam = e
animtype  = back
ground.type = trip
priority = 4,hit
sprpriority = 1
damage = floor(75*fvar(1)),0
getpower = 30,15
givepower = 25,5
ground.hittime  = 20
air.hittime = 90
guard.ctrltime = 8
ground.slidetime = 12
pausetime = 12,12
sparkno = s25002
guard.sparkno = s25030
sparkxy = -floor(const(size.xscale)*10),-floor(const(size.yscale)*20)
hitsound = s1,5
guardsound = s2,0
ground.velocity = -5,-3
guard.velocity = -2
air.velocity = -3,-4
down.velocity = -1,0
fall.recovertime = 90
fall.envshake.time = 16
fall.envshake.freq = 70
fall.envshake.ampl = 5
guard.cornerpush.veloff = -6

[state 350, targetdrop]
type = targetdrop
trigger1 = numenemy > 1
trigger1 = movehit
excludeid = 350
ignorehitpause = 1

[state 350, targetstate]
type = targetstate
trigger1 = numtarget(350) > 0
trigger1 = movehit = 1
value = 5075
ignorehitpause = 1

[state 350, changestate]
type = changestate
trigger1 = animtime = 0
value = 11
ctrl = 1
;---------------------------------------------------------------------------
;■ジャンプ小パンチ
[statedef 400]
type    = a
movetype= a
physics = a
poweradd= 0
ctrl = 0
anim = 400

[state 400, playsnd]
type = playsnd
triggerall = anim = 400
trigger1 = animelemtime(1) = 0
value = 0,0

[state 400, hitdef]
type = hitdef
trigger1 = animelemtime(2) = 0
id = 400
attr = a,na
hitflag = mafd
guardflag = ha
affectteam = e
animtype  = light
ground.type = high
priority = 4,hit
sprpriority = 1
damage = floor(10*fvar(1)),0
getpower = 30,15
givepower = 10,7
ground.hittime  = 9
air.hittime = 9
guard.ctrltime = 9
ground.slidetime = 9
pausetime = 10,10
sparkno = s25000
guard.sparkno = s25030
sparkxy = -floor(const(size.xscale)*10),-floor(const(size.yscale)*60)
hitsound = s1,0
guardsound = s2,0
ground.velocity = -1.5,0
guard.velocity = -1.5
air.velocity = -1,-3
down.velocity = -1,0
guard.cornerpush.veloff = -10
;air.fall = 1
fall.recovertime = 30

[state 400, targetdrop]
type = targetdrop
trigger1 = numenemy > 1
trigger1 = movehit
excludeid = 400
ignorehitpause = 1

[state 400, targetstate]
type = targetstate
trigger1 = numtarget(400) > 0
trigger1 = target(400),statetype = a
trigger1 = movehit = 1
value = 5025
ignorehitpause = 1

[state 400, changeanim]
type = changeanim
trigger1 = anim = 400
trigger1 = animtime = 0
value = 490
;---------------------------------------------------------------------------
;■ジャンプ中パンチ
[statedef 410]
type    = a
movetype= a
physics = a
poweradd= 0
ctrl = 0
anim = 410

[state 410, playsnd]
type = playsnd
triggerall = anim = 410
trigger1 = animelemtime(1) = 0
trigger2 = animelemtime(5) = 0
value = 0,1

[state 410, hitdef]
type = hitdef
trigger1 = animelemtime(2) = 0
id = 410
attr = a,na
hitflag = mafd
guardflag = ha
affectteam = e
animtype  = medium
ground.type = high
priority = 4,hit
sprpriority = 1
damage = floor(24*fvar(1)),0
getpower = 30,15
givepower = 10,5
ground.hittime  = 15
air.hittime = 15
guard.ctrltime = 15
ground.slidetime = 15
pausetime = 10,10
sparkno = s25001
guard.sparkno = s25030
sparkxy = -floor(const(size.xscale)*10),-floor(const(size.yscale)*60)
hitsound = s1,1
guardsound = s2,0
ground.velocity = -5,0
guard.velocity = -3
air.velocity = -4,-5
down.velocity = -1,0
guard.cornerpush.veloff = -16
;air.fall = 1
fall.recovertime = 30

[state 410, targetdrop]
type = targetdrop
trigger1 = numenemy > 1
trigger1 = movehit
excludeid = 410
ignorehitpause = 1

[state 410, targetstate]
type = targetstate
trigger1 = numtarget(410) > 0
trigger1 = target(410),statetype = a
trigger1 = movehit = 1
value = 5025
ignorehitpause = 1

[state 410, changeanim]
type = changeanim
trigger1 = anim = 410
trigger1 = animtime = 0
value = 490
;---------------------------------------------------------------------------
;■ジャンプ大パンチ
[statedef 420]
type    = a
movetype= a
physics = a
poweradd= 0
ctrl = 0
anim = 420

[state 420, playsnd]
type = playsnd
triggerall = anim = 420
trigger1 = animelemtime(4) = 0
value = 0,2

[state 420, hitdef]
type = hitdef
trigger1 = animelemtime(4) = 0
id = 420
attr = a,na
hitflag = mafd
guardflag = ha
affectteam = e
animtype  = back
ground.type = high
priority = 4,hit
sprpriority = 1
damage = floor(72*fvar(1)),0
getpower = 30,15
givepower = 10,5
ground.hittime  = 30
air.hittime = 32
guard.ctrltime = 20
ground.slidetime = 12
pausetime = 12,12
sparkno = s25002
guard.sparkno = s25030
sparkxy = -floor(const(size.xscale)*10),-floor(const(size.yscale)*60)
hitsound = s1,5
guardsound = s2,0
ground.velocity = -10,0
guard.velocity = -5
air.velocity = -15,15
down.velocity = -1,0
guard.cornerpush.veloff = -20
envshake.time = 16
envshake.freq = 70
envshake.ampl = 5
fall.damage = floor(16*fvar(1))
fall.envshake.time = 16
fall.envshake.freq = 70
fall.envshake.ampl = 5
air.fall = 1
fall.recovertime = 900
fall.recover = 0

[state 420, targetdrop]
type = targetdrop
trigger1 = numenemy > 1
trigger1 = movehit
excludeid = 420
ignorehitpause = 1

[state 420, targetstate]
type = targetstate
trigger1 = numtarget(420) > 0
trigger1 = target(420),statetype = a
trigger1 = movehit = 1
value = 5025
ignorehitpause = 1

[state 420, changeanim]
type = changeanim
trigger1 = anim = 420
trigger1 = animtime = 0
value = 490
;===========================================================================
;†††grab actions†††
;===========================================================================
;■エロージョンアタック
[statedef 500]
type    = s
movetype= a
physics = s
velset = 0,0
ctrl = 0
anim = 500

[state 500, playsnd]
type = playsnd
trigger1 = animelemtime(1) = 0
value = 0,1

[state 500, hitdef]
type = hitdef
trigger1 = animelemtime(2) = 0
id = 500
affectteam = e
attr = s, nt
hitflag = m-
priority = 1, miss
sparkno = -1
getpower = 60,30
p1sprpriority = 1
p1facing = ifelse(command = "holdfwd", 1, -1)
p2facing = 1
hitsound = s1,6
guard.dist = 0

[state 500, targetdrop]
type = targetdrop
trigger1 = numenemy > 1
trigger1 = movehit
excludeid = 500
ignorehitpause = 1

[state 500, targetstate]
type = targetstate
trigger1 = numtarget(500) > 0
trigger1 = movehit
value = 505
ignorehitpause = 1

[state 500, changestate]
type = changestate
trigger1 = numtarget > 0
trigger1 = movehit
value = 501
ignorehitpause = 1

[state 500, varadd]
type = varadd
triggerall = var(50) != 0
trigger1 = animtime = 0
var(54) = 1

[state 500, changestate]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
[statedef 501]
type    = s
movetype= a
physics = s
anim = 501
poweradd = 0

[state 501, width]
type = width
trigger1 = animelemtime(1) = 0 
edge = floor(const(size.xscale)*90),0

[state 501, playsnd]
type = playsnd
trigger1 = animelemtime(1) = 0
value = 10,0
channel = 0
freqmul = ifelse(var(33),2-const(size.xscale),1)

[state 501, playsnd]
type = playsnd
trigger1 = animelemtime(1) = 0
value = 0,2

[state 501, playsnd]
type = playsnd
trigger1 = animelemtime(8) = 0
value = 4,10

[state 501, posadd]
type = posadd
trigger1 = animelemtime(3) = 0
x = floor(const(size.xscale)*15)

[state 501, targetbind]
type = targetbind
trigger1 = animelemtime(2) < 0
pos = floor(const(size.xscale)*100),-floor(const(size.yscale)*20)

[state 501, targetbind]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = floor(const(size.xscale)*118),-floor(const(size.yscale)*139)

[state 501, targetbind]
type = targetbind
trigger1 = animelemtime(3) >= 0
pos = floor(const(size.xscale)*1),0

[state 501, targetlifeadd]
type = targetlifeadd
trigger1 = animelemtime(11) = 0
trigger2 = animelemtime(12) = 0
trigger3 = animelemtime(13) = 0
trigger4 = animelemtime(14) = 0
trigger5 = animelemtime(15) = 0
trigger6 = animelemtime(16) = 0
trigger7 = animelemtime(17) = 0
trigger8 = animelemtime(18) = 0
trigger9 = animelemtime(19) = 0
value = -11-(animelemtime(19)=0)
absolute = 1

[state 501, posadd]
type = posadd
trigger1 = animtime = 0
x = -floor(const(size.xscale)*15)

[state 501, changestate]
type = changestate
trigger1 = animtime = 0
trigger2 = numtarget = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
[statedef 505]
type    = a
movetype= h
physics = n
velset = 0,0
sprpriority = 4

[state 505, destroyself]
type = destroyself
trigger1 = ishelper

[state 505, changeanim2]
type = changeanim2
trigger1 = time = 0
value = 505

[state 505, turn]
type = turn
trigger1 = animelemtime(3) = 0

[state 505, playsnd]
type = playsnd
trigger1 = animelemtime(3) = 0
value = f7,2

[state 505, playsnd]
type = playsnd
trigger1 = animelemtime(11) = 0
trigger2 = animelemtime(12) = 0
trigger3 = animelemtime(13) = 0
trigger4 = animelemtime(14) = 0
trigger5 = animelemtime(15) = 0
trigger6 = animelemtime(16) = 0
trigger7 = animelemtime(17) = 0
trigger8 = animelemtime(18) = 0
trigger9 = animelemtime(19) = 0
value = 11,0

[state 505, palfx]
type = palfx
trigger1 = animelemtime(11) >= 0
time = 20
add = 128,128,256
invertall = 0

[state 505, selfstate]
type = selfstate
trigger1 = !gethitvar(isbound)
;trigger1 = animtime = 0
trigger1 = life > 0
trigger2 = anim != 505;無効
value = 5120

[state 505, selfstate]
type = selfstate
trigger1 = !gethitvar(isbound)
;trigger1 = animtime = 0
trigger1 = life = 0
value = 5150
