;===========================================================================
;†††specials†††
;===========================================================================
;■エンジェルレイ
[statedef 1000]
type = s
movetype = a
physics = s
anim = 1000
juggle = 1
poweradd = 20
ctrl = 0

[state 1000, nothitby];
type = nothitby
trigger1 = fvar(26) = 1.0	;◆
trigger1 = animelemtime(8) < 0
value = sca,aa
ignorehitpause = 1

[state 1000, playsnd]
type = playsnd
trigger1 = animelemtime(7) = 0
value = 3,1

[state 1000, varset]
type = varset
trigger1 = animelemtime(6) = 0
var(6) = -200

[state 1000, varadd]
type = varadd
trigger1 = animelemtime(6) > 20
trigger1 = var(6) < 0
var(6) = 3

[state 1000, palfx]
type = palfx
trigger1 = 1
time = 1
add = var(6),var(6),var(6)

[state 1000, explod]
type = explod
trigger1 = animelemtime(7) = 0
anim = 21000
id = 21000
pos = 0,0
postype = p1
facing = 1
bindtime = -1
removetime = -2
supermovetime = 900
pausemovetime = 900
scale = const(size.xscale),const(size.yscale)
sprpriority = 5
ownpal = 1
removeongethit = 1

[state 1000, explod]
type = explod
trigger1 = animelemtime(8) = 0
anim = 21001
id = 21001
pos = floor(const(size.xscale)*39),-floor(const(size.yscale)*89)
postype = p1
facing = 1
bindtime = -1
removetime = -2
supermovetime = 900
pausemovetime = 900
scale = const(size.xscale),const(size.yscale)
sprpriority = 5
ownpal = 1
removeongethit = 1

[state 1000, helper]
type = helper
trigger1 = animelemtime(7) = 0
trigger2 = fvar(26) = 1.0	;◆
trigger2 = animelemtime(8) = 12
trigger3 = fvar(26) = 1.0	;◆
trigger3 = animelemtime(8) = 32
helpertype = normal
name = "angel cross"
id = 30000
stateno = 30000
pos = floor(const(size.xscale)*100),0
postype = p1
facing = 1
ownpal = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)
size.height = 0

[state 1000, changestate]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;===========================================================================
;■光のパイル
[statedef 1100]
type = s
movetype = a
physics = s
anim = 1100
poweradd = 0
ctrl = 0

[state 1100, playsnd]
type = playsnd
trigger1 = animelemtime(5) = 0
value = 0,3

[state 1100, hitdef]
type = hitdef
trigger1 = animelemtime(5) = 0
id = 1100
attr = s,st
hitflag = h-
priority = 1,miss
sparkno = -1
getpower = 60,30
p1sprpriority = 0
p1facing = 1
p2facing = 1
p1stateno = 1101
p2stateno = 1105
hitsound = s1,10
guard.dist = 0

[state 1100, changestate]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
[statedef 1101]
type    = s
movetype= a
physics = s
anim = 1101
poweradd = 0

[state 1101, width]
type = width
trigger1 = 1
edge = floor(const(size.xscale)*120),0

[state 1101, playsnd]
type = playsnd
trigger1 = animelemtime(1) = 0
value = 4,0

[state 1101, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
value = 4,1

[state 1101, helper]
type = helper
trigger1 = time = 0
helpertype = normal
name = "bind1100"
stateno = 10000
id = 11100
pos = 0,0
postype = p1
facing = 1
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

[state 1101, targetbind]
type = targetbind
trigger1 = animelemtime(2) < 0
pos = floor(const(size.xscale)*74),-floor(const(size.yscale)*133)

[state 1101, targetbind]
type = targetbind
trigger1 = animelemtime(2) >= 0
pos = floor(const(size.xscale)*86),-floor(const(size.yscale)*143)

[state 1101, changestate]
type = changestate
trigger1 = animtime = 0
value = 1102

[state 1101, changestate]
type = changestate
trigger1 = numtarget = 0
value = 1103
;---------------------------------------------------------------------------
[statedef 1102]
movetype= a
physics = s
anim = 1102

[state 1102, changestate]
type = changestate
trigger1 = time <= 30
trigger1 = numtarget = 0
value = 1103

[state 1102, targetbind]
type = targetbind
trigger1 = animelemtime(2) < 0
pos = floor(const(size.xscale)*69),-floor(const(size.yscale)*143)

[state 1102, targetbind]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = floor(const(size.xscale)*83),-floor(const(size.yscale)*143)

[state 1102, targetbind]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = floor(const(size.xscale)*78),-floor(const(size.yscale)*143)

[state 1102, targetbind]
type = targetbind
trigger1 = animelemtime(4) >= 0 && animelemtime(9) < 0
pos = floor(const(size.xscale)*69),-floor(const(size.yscale)*143)

[state 1102, targetbind]
type = targetbind
trigger1 = animelemtime(9) >= 0 && animelemtime(10) < 0
pos = floor(const(size.xscale)*83),-floor(const(size.yscale)*143)

[state 1102, targetbind]
type = targetbind
trigger1 = animelemtime(10) >= 0 && animelemtime(11) < 0
pos = floor(const(size.xscale)*78),-floor(const(size.yscale)*143)

[state 1102, targetbind]
type = targetbind
trigger1 = animelemtime(11) >= 0 && animelemtime(16) < 0
pos = floor(const(size.xscale)*69),-floor(const(size.yscale)*143)

[state 1102, targetbind]
type = targetbind
trigger1 = animelemtime(16) >= 0 && animelemtime(17) < 0
pos = floor(const(size.xscale)*83),-floor(const(size.yscale)*143)

[state 1102, targetbind]
type = targetbind
trigger1 = animelemtime(17) >= 0 && animelemtime(18) < 0
pos = floor(const(size.xscale)*78),-floor(const(size.yscale)*143)

[state 1102, targetbind]
type = targetbind
trigger1 = animelemtime(18) >= 0 && animelemtime(22) < 0
pos = floor(const(size.xscale)*69),-floor(const(size.yscale)*143)

[state 1102, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
trigger2 = animelemtime(9) = 0
trigger3 = animelemtime(16) = 0
value = 4,2

[state 1102, playsnd]
type = playsnd
trigger1 = animelemtime(23) = 0
value = 4,3

[state 1102, poweradd]
type = poweradd
trigger1 = animelemtime(2) = 0
trigger2 = animelemtime(9) = 0
trigger3 = animelemtime(16) = 0
trigger4 = animelemtime(23) = 0
value = 30+(animelemtime(23)=0)*30

[state 1102, hitadd]
type = hitadd
trigger1 = animelemtime(2) = 0
trigger2 = animelemtime(9) = 0
trigger3 = animelemtime(16) = 0
trigger4 = animelemtime(23) = 0
value = 1

[state 1102, envshake]
type = envshake
trigger1 = animelemtime(2) = 0
trigger2 = animelemtime(9) = 0
trigger3 = animelemtime(16) = 0
trigger4 = animelemtime(23) = 0
time = 16
freq = 70
ampl = -4
phase = 0

[state 1102, targetlifeadd]
type = targetlifeadd
trigger1 = animelemtime(2) = 0
trigger2 = animelemtime(9) = 0
trigger3 = animelemtime(16) = 0
value = -ceil(lifemax*0.035)
absolute = 1

[state 1102, targetlifeadd]
type = targetlifeadd
trigger1 = animelemtime(23) = 0
value = -ceil(lifemax*0.07)
absolute = 1

[state 1102, explod]
type = explod
trigger1 = animelemtime(2) = 0
trigger2 = animelemtime(9) = 0
trigger3 = animelemtime(16) = 0
trigger4 = animelemtime(23) = 0
anim = 25002
id = 25000
pos = floor(const(size.xscale)*66),-floor(const(size.yscale)*138)
postype = p1
facing = 1
bindtime = -1
removetime = -2
supermovetime = 900
pausemovetime = 900
scale = const(size.xscale),const(size.yscale)
sprpriority = 2
ownpal = 1
removeongethit = 1

[state 1102, explod]
type = explod
trigger1 = animelemtime(23) = 0
anim = 21100
id = 21100
pos = floor(const(size.xscale)*62),-floor(const(size.yscale)*150)
postype = p1
facing = 1
bindtime = -1
removetime = -2
supermovetime = 900
pausemovetime = 900
scale = const(size.xscale),const(size.yscale)
sprpriority = -1
ownpal = 1
removeongethit = 1

[state 1102, hitdef]
type = hitdef
trigger1 = animelemtime(23) = 0
id = 1102
attr = a,sp
hitflag = maf
guardflag = m
affectteam = e
animtype = up
ground.type = trip
priority = 5,hit
sprpriority = 1
damage = floor(120*fvar(1)),10
getpower = 120,60
givepower = 20,5
ground.hittime = 40
air.hittime = 60
guard.ctrltime = 40
ground.slidetime = 20
pausetime = 0, 0
sparkno = s25002
guard.sparkno = s25030
sparkxy = 0,-floor(const(size.yscale)*140)
hitsound = s3,3
guardsound = s2,0
ground.velocity = -16,0
guard.velocity = -4
air.velocity = -16,0
air.juggle = 15
envshake.time = 64
envshake.freq = 120
envshake.ampl = 5
palfx.time = 160
palfx.add = 250,100,250

[state 1102, changestate]
type = changestate
trigger1 = animtime = 0
trigger2 = playeridexist(var(15))
trigger2 = playerid(var(15)),movetype != h
value = 1103
;---------------------------------------------------------------------------
[statedef 1103]
anim = 1103

[state 1103, playsnd]
type = playsnd
trigger1 = animelemtime(1) = 0
value = 4,4

[state 1103, changestate]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
[statedef 1105]
type    = a
movetype= h
physics = n
sprpriority = -2

[state 1105, destroyself]
type = destroyself
trigger1 = ishelper

[state 1105, nothitby]
type = nothitby
trigger1 = 1
value = sca,aa
time = 1

[state 1105, changeanim2]
type = changeanim2
trigger1 = time = 0
value = 1105

[state 1105, screenbound]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1,0

[state 1105, changestate]
type = changestate
trigger1 = animtime = 0
value = 1106

[state 1105, selfstate]
type = selfstate
trigger1 = !gethitvar(isbound)
value = 5100
;---------------------------------------------------------------------------
[statedef 1106]
type    = a
movetype= h
sprpriority = -2

[state 1106, destroyself]
type = destroyself
trigger1 = ishelper

[state 1106, changeanim2]
type = changeanim2
trigger1 = time = 0
value = 1106

[state 1106, screenbound]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1,0

[state 1106, playsnd]
type = playsnd
triggerall = alive = 0
trigger1 = animelemtime(2) = 0
trigger2 = animelemtime(5) = 0
trigger3 = animelemtime(8) = 0
trigger4 = animelemtime(11) = 0
value = 11,0

[state 1106, veladd]
type = veladd
trigger1 = animelemtime(11) >= 0
x = -20

[state 1106, changestate]
type = changestate
trigger1 = animelemtime(11) >= 0
trigger1 = backedgedist <= 5
value = 1107
;---------------------------------------------------------------------------
[statedef 1107]
type    = a
movetype= h
sprpriority = -2

[state 1107, destroyself]
type = destroyself
trigger1 = ishelper

[state 1107, changeanim2]
type = changeanim2
trigger1 = time = 0
value = 1107

[state 1107, screenbound]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1,0

[state 1107, nothitby]
type = nothitby
trigger1 = time < 80
value = sca,aa
ignorehitpause = 1

[state 1107, playsnd]
type = playsnd
trigger1 = time = 0
value = f7,2

[state 1107, envshake]
type = envshake
trigger1 = time = 0
time = 32
freq = 120
ampl = -4
phase = 0

[state 1107, veladd]
type = veladd
trigger1 = time >= 80
y = const(movement.yaccel)

[state 1107, selfstate]
type = selfstate
trigger1 = pos y >= -20
value = 5100
;===========================================================================
;■キティコールアタック
[statedef 1200]
type = s
movetype = a
physics = s
anim = 1200
juggle = 1
poweradd = 0
ctrl = 0

[state 1200, helper]
type = helper
trigger1 = roundstate = 2
trigger1 = var(1) < 80
trigger1 = animelemtime(2) = 0
helpertype = normal
name = "chibi-nyan"
stateno = 7000
id = 7000
pos = 0,0
postype = p1
facing = facing
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

[state 1200, helper]
type = helper
trigger1 = (var(1) >= 80) || (roundstate != 2)
trigger1 = animelemtime(2) = 0
helpertype = normal
name = "yukkuri-aznyan"
stateno = 7400
id = 7400
pos = 0,0
postype = p1
facing = facing
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

[state 1200, changestate]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;===========================================================================
;■ＧボールＰ
[statedef 1300]
type = a
movetype = a
physics = a
anim = 1300
poweradd = 0
velset = 0,0
ctrl = 0

[state 1300, varset]
type = varset
trigger1 = var(50) = 0
trigger1 = command = "angel_ray1"
var(7) = 1

[state 1300, varset]
type = varset
trigger1 = var(50) = 0
trigger1 = command = "angel_ray2"
var(7) = 2

[state 1300, varset]
type = varset
trigger1 = var(50) = 0
trigger1 = command = "angel_ray3"
var(7) = 3

[state 1300, nothitby]
type = nothitby
trigger1 = 1
value = sca,aa
ignorehitpause = 1

[state 1300, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
value = 3,3

[state 1300, posfreeze]
type = posfreeze
trigger1 = 1

[state 1300, changestate]
type = changestate
trigger1 = animtime = 0
value = 1305
;---------------------------------------------------------------------------
[statedef 1305]
type = a
movetype = a
physics = n
anim = 1350
ctrl = 0

[state 1305, velset]
type = velset
trigger1 = time = 0
trigger1 = var(7) = 1
x = 3
y = -60

[state 1305, velset]
type = velset
trigger1 = time = 0
trigger1 = var(7) = 2
x = 5.5
y = -44

[state 1305, velset]
type = velset
trigger1 = time = 0
trigger1 = var(7) = 3
x = 12
y = -42

[state 1305, veladd]
type = veladd
trigger1 = 1
y = const(movement.yaccel)*5

[state 1305, hitdef]
type = hitdef
trigger1 = time = 0
id = 1305
attr = a,sa
hitflag = mafd
guardflag = ha
affectteam = e
animtype = back
ground.type = trip
priority = 4,hit
sprpriority = 1
damage = floor(95*fvar(1)),15
getpower = 60,30
givepower = 20,5
ground.hittime = 30
air.hittime = 40
guard.ctrltime = 20
ground.slidetime = 20
pausetime = 10, 10
sparkno = s25002
guard.sparkno = s25030
sparkxy = 0,-floor(const(size.yscale)*60)
hitsound = s1,9
guardsound = s2,1
ground.velocity = -16,0
guard.velocity = -4
air.velocity = -16,0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 7

[state 1305, targetdrop]
type = targetdrop
trigger1 = numenemy > 1
trigger1 = movehit
excludeid = 1305
ignorehitpause = 1

[state 1305, targetstate]
type = targetstate
trigger1 = numtarget(1305) > 0
trigger1 = movehit = 1
value = 5075
ignorehitpause = 1

[state 1305, changestate]
type = changestate
trigger1 = movecontact
value = 1380

[state 1305, selfstate]
type = selfstate
trigger1 = pos y >= -5
value = 52
;===========================================================================
;■ＧボールＫ
[statedef 1330]
type = a
movetype = a
physics = a
anim = 1300
poweradd = 0
velset = 0,0
ctrl = 0

[state 1330, varset]
type = varset
trigger1 = var(50) = 0
trigger1 = command = "sphere1"
var(7) = 4

[state 1330, varset]
type = varset
trigger1 = var(50) = 0
trigger1 = command = "sphere2"
var(7) = 5

[state 1330, varset]
type = varset
trigger1 = var(50) = 0
trigger1 = command = "sphere3"
var(7) = 6

[state 1330, nothitby]
type = nothitby
trigger1 = 1
value = sca,aa
ignorehitpause = 1

[state 1330, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
value = 3,3

[state 1330, posfreeze]
type = posfreeze
trigger1 = 1

[state 1330, changestate]
type = changestate
trigger1 = animtime = 0
value = 1335
;---------------------------------------------------------------------------
[statedef 1335]
type = a
movetype = a
physics = a
anim = 1350
ctrl = 0

[state 1335, velset]
type = velset
trigger1 = time = 0
trigger1 = var(7) = 4
x = -16
y = 6

[state 1335, velset]
type = velset
trigger1 = time = 0
trigger1 = var(7) = 5
x = 0
y = 20

[state 1335, velset]
type = velset
trigger1 = time = 0
trigger1 = var(7) = 6
x = 18
y = 4

[state 1335, hitdef]
type = hitdef
id = 1335
trigger1 = time = 0
attr = a,sa
hitflag = mafd
guardflag = ha
affectteam = e
animtype = back
ground.type = trip
priority = 4,hit
sprpriority = 1
damage = floor(95*fvar(1)),15
getpower = 60,30
givepower = 20,5
ground.hittime = 30
air.hittime = 40
guard.ctrltime = 20
ground.slidetime = 20
pausetime = 10, 10
sparkno = s25002
guard.sparkno = s25030
sparkxy = 0,-floor(const(size.yscale)*60)
hitsound = s1,9
guardsound = s2,1
ground.velocity = -16,0
guard.velocity = -4
air.velocity = -16,0
envshake.time = 16
envshake.freq = 120
envshake.ampl = 7

[state 1335, targetdrop]
type = targetdrop
trigger1 = numenemy > 1
trigger1 = movehit
excludeid = 1335
ignorehitpause = 1

[state 1335, targetstate]
type = targetstate
trigger1 = numtarget(1335) > 0
trigger1 = movehit = 1
value = 5075
ignorehitpause = 1

[state 1335, changestate]
type = changestate
trigger1 = movecontact
value = 1380
;---------------------------------------------------------------------------
[statedef 1380]
type = a
movetype = i
physics = n
anim = 1380
velset = -12,-4.5
ctrl = 0

[state 1380, veladd]
type = veladd
trigger1 = 1
y = const(movement.yaccel)

[state 1380, changeanim]
type = changeanim
trigger1 = anim = 1380
trigger1 = animtime = 0
value = 490

[state 1380, changestate]
type = changestate
trigger1 = pos y > 0
value = 1390
;---------------------------------------------------------------------------
[statedef 1390]
type = c
movetype = i
physics = c
anim = 1390
velset = 0,0
ctrl = 0

[state 1390, posset]
type = posset
trigger1 = time = 0
y = 0

[state 1390, changestate]
type = changestate
trigger1 = animtime = 0
value = 11
ctrl = 1
;===========================================================================
;■ＡＴフィールド
[statedef 2000]
movetype = a
anim = 2000
poweradd = -200
ctrl = 0

[state 2000, statetypeset]
type = statetypeset
trigger1 = time = 0 && statetype = s
statetype = s
physics = s

[state 2000, statetypeset]
type = statetypeset
trigger1 = time = 0 && statetype = c
statetype = c
physics = c

[state 2000, statetypeset]
type = statetypeset
trigger1 = time = 0 && statetype = a
statetype = a
physics = a

[state 2000, nothitby]
type = nothitby
trigger1 = 1
value = sca,aa
time = 1

[state 2000, bgpalfx]
type = bgpalfx
trigger1 = time = 0
time = 2
add = 256,256,256
invertall = 0

[state 2000, width]
type = width
trigger1 = time > 10
player = floor(const(size.xscale)*200),floor(const(size.xscale)*100)

[state 2000, veladd]
type = veladd
trigger1 = backedgedist > 80
x = -12

[state 2000, posfreeze]
type = posfreeze
trigger1 = pos y != 0

[state 2000, playsnd]
type = playsnd
trigger1 = time = 0
value = 3,0

[state 2000, explod]
type = explod
trigger1 = time = 0
trigger1 = numexplod(20000) = 0
anim = 20000
id = 20000
pos = floor(const(size.xscale)*15),-floor(const(size.yscale)*57)
postype = p1
facing = 1
bindtime = -1
removetime = -2
supermovetime = 900
pausemovetime = 900
scale = const(size.xscale),const(size.yscale)
sprpriority = 5
ownpal = 1
removeongethit = 1

[state 2000, helper]
type = helper
trigger1 = time = 0
trigger2 = time = 10
trigger3 = time = 20
trigger4 = time = 30
trigger5 = time = 40
trigger6 = time = 50
trigger7 = time = 60
trigger8 = time = 70
trigger9 = time = 80
trigger10 = time = 90
helpertype = normal
name = "pusher"
stateno = 30100
id = 30100
pos = 0,0
postype = p1
facing = 1
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

[state 2000, helper]
type = helper
trigger1 = time = 0
helpertype = normal
name = "barrier"
stateno = 30110
id = 30110
pos = 0,0
postype = p1
facing = facing
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

[state 2000, changestate]
type = changestate
trigger1 = time = 100
value = ifelse(pos y!=0,50,0)
ctrl = 1