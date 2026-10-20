;===========================================================================
;†††normal actions†††
;===========================================================================
;■挑発
[statedef 195]
type = s
movetype = i
physics = s
velset = 0,0
ctrl = 0
anim = 195

[state 195, poweradd]
type = poweradd
trigger1 = 1
value = 4

[state 195, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
value = 0,3

[state 195, playsnd]
type = playsnd
trigger1 = animelemtime(6) = 0
value = 10,0
channel = 0

[state 195, ctrlset]
type = ctrlset
trigger1 = time = 80
value = 1

[state 195, changestate]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;===========================================================================
;■へちょ化
[statedef 197]
type = s
movetype = i
physics = s
velset = 0,0
ctrl = 0
anim = 197

[state 197, varrandom]
type = varrandom
trigger1 = 1
v = 5
range = 100,111

[state 197, playsnd]
type = playsnd
trigger1 = time = 5
value = 10,var(5)
channel = 0

[state 197, playsnd]
type = playsnd
trigger1 = time = 0
trigger1 = prevstateno != stateno
value = 2,11

[state 197, explod]
type = explod
trigger1 = time = 0
anim = 31000
id = 31000
pos = 0,0
postype = p1
facing = 1
bindtime = 1
removetime = -2
scale = const(size.xscale),const(size.yscale)
sprpriority = 5
ownpal = 1

[state 197, bgpalfx]
type = bgpalfx
trigger1 = time = 0
time = 6
add = var(21),var(22),var(23)

[state 197, changestate]
type = changestate
trigger1 = roundstate != 2
trigger1 = time > 120
value = 0
ctrl = 1
;===========================================================================
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
value = 0,3

[state 200, hitdef]
type = hitdef
trigger1 = animelemtime(2) = 0
attr = s,na
hitflag = maf
guardflag = ma
affectteam = e
animtype = light
ground.type = high
priority = 3,hit
sprpriority = 1
damage = floor(8*fvar(1)),0
getpower = 30,15
givepower = 8,5
ground.hittime  = 19
air.hittime = 19
guard.ctrltime = 13
ground.slidetime = 13
pausetime = 8,8
sparkno = s6000+random%4
guard.sparkno = 40
sparkxy = 0,-47
hitsound = s1,7
guardsound = s2,1
ground.velocity = -7.5
guard.velocity = ifelse((p2stateno!=[120,155]),-5,(var(14)-3))
air.velocity = -1.4,-3
fall.recovertime = 25
guard.cornerpush.veloff = var(14)-6

[state 200, changestate]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;===========================================================================
;■立ち中パンチ
[statedef 210]
type    = s
movetype= a
physics = s
poweradd= 0
ctrl = 0
anim = 210

[state 210, varrandom]
type = varrandom
trigger1 = 1
v = 5
range = 0,3

[state 210, playsnd]
type = playsnd
trigger1 = animelemtime(3) = 0
trigger1 = random < 500
value = 9,var(5)
channel = 1
lowpriority = 1

[state 210, playsnd]
type = playsnd
trigger1 = animelemtime(4) = 0
value = 0,4

[state 210, hitdef]
type = hitdef
trigger1 = animelemtime(4) = 0
attr = s,na
hitflag = maf
guardflag = ma
affectteam = e
animtype = medium
ground.type = high
priority = 3,hit
sprpriority = 1
damage = floor(15*fvar(1)),0
getpower = 30,15
givepower = 10,5
ground.hittime  = 22
air.hittime = 27
guard.ctrltime = 22
ground.slidetime = 22
pausetime = 10,10
sparkno = s6010+random%4
guard.sparkno = 40
sparkxy = 0,-44
hitsound = s1,8
guardsound = s2,1
ground.velocity = ifelse((p2stateno!=[120,155]),-7.5,(var(14)-7.5))
guard.velocity = var(14)-10
air.velocity = -7,-4
fall.recovertime = 25
guard.cornerpush.veloff = var(14)-12

[state 210, changestate]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;===========================================================================
;■立ち大パンチ
[statedef 220]
type    = s
movetype= a
physics = s
ctrl = 0
anim = 220
poweradd = 0

[state 220, varrandom]
type = varrandom
trigger1 = 1
v = 5
range = 0,3

[state 220, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
trigger1 = random < 500
value = 9,var(5)
channel = 1
lowpriority = 1

[state 220, playsnd]
type = playsnd
trigger1 = animelemtime(3) = 0
value = 0,5

[state 220, width]
type = width
trigger1 = 1
player = 30,0

[state 220, posadd]
type = posadd
trigger1 = animelemtime(2) = 0
x = 35

[state 220, posadd]
type = posadd
trigger1 = animelemtime(3) = 0
x = 25

[state 220, posadd]
type = posadd
trigger1 = animelemtime(7) = 0
x = -20

[state 220, posadd]
type = posadd
trigger1 = animelemtime(8) = 0
x = -20

[state 220, posadd]
type = posadd
trigger1 = animtime = 0
x = -20

[state 220, hitdef]
type = hitdef
trigger1 = animelemtime(3) = 0
attr = s,na
hitflag = maf
guardflag = ma
affectteam = e
animtype = back
ground.type = high
priority = 5,hit
sprpriority = 1
damage = floor(28*fvar(1)),0
getpower = 30,15
givepower = 20,5
ground.hittime  = 40
air.hittime = 60
guard.ctrltime = 40
ground.slidetime = 40
pausetime = 12,12
sparkno = s6020+random%4
guard.sparkno = 40
sparkxy = 0,-43
hitsound = s1,9
guardsound = s2,1
ground.velocity = -13
guard.velocity = ifelse((p2stateno!=[120,155]),-16,(var(14)-16))
air.velocity = -24,-4
air.fall = 1
fall.recovertime = 90
guard.cornerpush.veloff = var(14)-20

[state 220, changestate]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;===========================================================================
;■立ち小キック
[statedef 230]
type    = s
movetype= a
physics = s
ctrl = 0
anim = 230
poweradd = 0

[state 230, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
value = 0,3

[state 230, hitdef]
type = hitdef
trigger1 = animelemtime(2) = 0
attr = s,na
hitflag = maf
guardflag = ma
affectteam = e
animtype = light
ground.type = low
priority = 3,hit
sprpriority = 1
damage = floor(7*fvar(1)),0
getpower = 30,15
givepower = 8,5
ground.hittime  = 23
air.hittime = 26
guard.ctrltime = 18
ground.slidetime = 18
pausetime = 8,8
sparkno = s6000+random%4
guard.sparkno = 40
sparkxy = 0,-51
hitsound = s1,7
guardsound = s2,1
ground.velocity = -8.9
guard.velocity = ifelse((p2stateno!=[120,155]),-3.4,(var(14)-3.4))
air.velocity = -1.6,-3
fall.recovertime = 25
guard.cornerpush.veloff = var(14)-6

[state 230, changestate]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;===========================================================================
;■立ち中キック
[statedef 240]
type    = c
movetype= a
physics = c
ctrl = 0
anim = 240
poweradd = 0

[state 240, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
value = 0,4

[state 240, width]
type = width
trigger1 = 1
player = 30,0

[state 240, posadd]
type = posadd
trigger1 = animelemtime(2) = 0
x = 20

[state 240, posadd]
type = posadd
trigger1 = animelemtime(3) = 0
x = 5

[state 240, posadd]
type = posadd
trigger1 = animelemtime(4) = 0
x = 45

[state 240, posadd]
type = posadd
trigger1 = animelemtime(6) = 0
x = 15

[state 240, posadd]
type = posadd
trigger1 = animtime = 0
x = 35

[state 240, hitdef]
type = hitdef
trigger1 = animelemtime(3) = 0
attr = s,na
hitflag = maf
guardflag = la
affectteam = e
animtype = medium
ground.type = low
priority = 3,hit
sprpriority = 1
damage = floor(14*fvar(1)),0
getpower = 30,15
givepower = 10,5
ground.hittime  = 23
air.hittime = 28
guard.ctrltime = 28
ground.slidetime = 22
pausetime = 10,10
sparkno = s6010+random%4
guard.sparkno = 40
sparkxy = 0,-47
hitsound = s1,8
guardsound = s2,1
ground.velocity = -7.8
guard.velocity = ifelse((p2stateno!=[120,155]),-10,(var(14)-10))
air.velocity = -8,-4
fall.recovertime = 25
guard.cornerpush.veloff = var(14)-12

[state 240, changestate]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;===========================================================================
;■立ち大キック
[statedef 250]
type    = s
movetype= a
physics = s
poweradd= 0
ctrl = 0
anim = 250

[state 250, width]
type = width
trigger1 = 1
player = 30,0

[state 250, changestate]
type = changestate
trigger1 = animtime = 0
value = 251
;---------------------------------------------------------------------------
[statedef 251]
type    = a
movetype= a
physics = n
ctrl = 0
anim = 251

[state 251, velset]
type = velset
trigger1 = time = 0
x = 3
y = -9

[state 251, veladd]
type = veladd
trigger1 = pos y < 0
y = const(movement.yaccel)+0.7

[state 251, playsnd]
type = playsnd
trigger1 = animelemtime(1) = 0
value = 0,6

[state 251, changestate]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 252
;---------------------------------------------------------------------------
[statedef 252]
type    = s
movetype= a
physics = s
ctrl = 0
anim = 252

[state 252, velset]
type = velset
trigger1 = 1
y = 0

[state 252, posset]
type = posset
trigger1 = 1
y = 0

[state 252, hitdef]
type = hitdef
trigger1 = animelemtime(1) = 0
attr = s,na
hitflag = mafd
guardflag = ha
affectteam = e
animtype  = back
ground.type = trip
priority = 3,hit
sprpriority = 1
damage = floor(36*fvar(1)),0
getpower = 30,15
givepower = 10,5
ground.hittime  = 30
air.hittime = 50
guard.ctrltime = 25
ground.slidetime = 12
pausetime = 12,12
sparkno = s6020+random%4
guard.sparkno = 40
sparkxy = 0,-10
hitsound = s1,10
guardsound = s2,1
ground.velocity = -8,-2
guard.velocity = ifelse((p2stateno!=[120,155]),-12,(var(14)-12))
air.velocity = -6,-2
down.velocity = 0,0
fall.recovertime = 30
guard.cornerpush.veloff = var(14)-13

[state 252, changestate]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;===========================================================================
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
value = 0,3

[state 300, hitdef]
type = hitdef
trigger1 = animelemtime(2) = 0
attr = s,na
hitflag = maf
guardflag = ma
affectteam = e
animtype = light
ground.type = low
priority = 3,hit
sprpriority = 1
damage = floor(5*fvar(1)),0
getpower = 30,15
givepower = 8,5
ground.hittime  = 15
air.hittime = 26
guard.ctrltime = 18
ground.slidetime = 18
pausetime = 8,8
sparkno = s6000+random%4
guard.sparkno = 40
sparkxy = 0,-39
hitsound = s1,7
guardsound = s2,1
ground.velocity = -8.9
guard.velocity = ifelse((p2stateno!=[120,155]),-5,(var(14)-3.4))
air.velocity = -1.6,-3
fall.recovertime = 25
guard.cornerpush.veloff = var(14)-6

[state 300, changestate]
type = changestate
trigger1 = animtime = 0
value = 11
ctrl = 1
;===========================================================================
;■しゃがみ中パンチ
[statedef 310]
type    = c
movetype= a
physics = c
poweradd= 0
ctrl = 0
anim = 310

[state 310, varrandom]
type = varrandom
trigger1 = 1
v = 5
range = 0,3

[state 310, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
trigger1 = random < 500
value = 9,var(5)
channel = 1
lowpriority = 1

[state 310, playsnd]
type = playsnd
trigger1 = animelemtime(4) = 0
value = 0,4

[state 310, hitdef]
type = hitdef
trigger1 = animelemtime(3) = 0
attr = c,na
hitflag = maf
guardflag = la
affectteam = e
animtype = medium
ground.type = high
priority = 3,hit
sprpriority = 1
damage = floor(13*fvar(1)),0
getpower = 30,15
givepower = 10,5
ground.hittime  = 19
air.hittime = 19
guard.ctrltime = 16
ground.slidetime = 16
pausetime = 10,10
sparkno = s6010+random%4
guard.sparkno = 40
sparkxy = 0,-39
hitsound = s1,8
guardsound = s2,1
ground.velocity = -7.5
guard.velocity = ifelse((p2stateno!=[120,155]),-10,(var(14)-10))
air.velocity = -7,-4
fall.recovertime = 25
guard.cornerpush.veloff = var(14)-12

[state 310, changestate]
type = changestate
trigger1 = animtime = 0
value = 11
ctrl = 1
;===========================================================================
;■しゃがみ大パンチ
[statedef 320]
type    = c
movetype= a
physics = c
poweradd= 0
ctrl    = 0
anim    = 320

[state 320, varrandom]
type = varrandom
trigger1 = 1
v = 5
range = 0,3

[state 320, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
trigger1 = random < 500
value = 9,var(5)
channel = 1
lowpriority = 1

[state 320, width]
type = width
trigger1 = 1
player = 20,0

[state 320, posadd]
type = posadd
trigger1 = animelemtime(2) = 0
x = 5

[state 320, posadd]
type = posadd
trigger1 = animelemtime(3) = 0
x = 10

[state 320, posadd]
type = posadd
trigger1 = animelemtime(7) = 0
x = 15

[state 320, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
value = 0,5

[state 320, hitdef]
type = hitdef
trigger1 = animelemtime(3) = 0
attr = c,na
hitflag = maf
guardflag = la
affectteam = e
animtype = hard
air.animtype = up
ground.type = high
priority = 4,hit
sprpriority = 1
damage = floor(25*fvar(1)),0
getpower = 30,15
givepower = 20,5
ground.hittime  = 30
air.hittime = 90
guard.ctrltime = 12
ground.slidetime = 12
pausetime = 10,10
sparkno = s6020+random%4
guard.sparkno = 40
sparkxy = -10,-40
hitsound = s1,9
guardsound = s2,1
ground.velocity = -1.2
guard.velocity = ifelse((p2stateno!=[120,155]),-3,(var(14)-3))
air.velocity = -1.6,-5
fall.recovertime = 30
guard.cornerpush.veloff = var(14)-20

[state 320, changestate]
type = changestate
trigger1 = animtime = 0
value = 11
ctrl = 1
;===========================================================================
;■しゃがみ小キック
[statedef 330]
type    = c
movetype= a
physics = c
ctrl = 0
anim = 330
poweradd = 0

[state 330, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
value = 0,3

[state 330, hitdef]
type = hitdef
trigger1 = animelemtime(2) = 0
attr = s,na
hitflag = maf
guardflag = ma
affectteam = e
animtype = light
ground.type = low
priority = 3,hit
sprpriority = 1
damage = floor(7*fvar(1)),0
getpower = 30,15
givepower = 8,5
ground.hittime  = 23
air.hittime = 26
guard.ctrltime = 18
ground.slidetime = 18
pausetime = 8,8
sparkno = s6000+random%4
guard.sparkno = 40
sparkxy = 0,-39
hitsound = s1,7
guardsound = s2,1
ground.velocity = -8.9
guard.velocity = ifelse((p2stateno!=[120,155]),-3.4,(var(14)-3.4))
air.velocity = -1.6,-3
fall.recovertime = 25
guard.cornerpush.veloff = var(14)-6

[state 330, changestate]
type = changestate
trigger1 = animtime = 0
value = 11
ctrl = 1
;===========================================================================
;■しゃがみ中キック
[statedef 340]
type    = c
movetype= a
physics = c
poweradd= 0
ctrl = 0
anim = 340

[state 340, width]
type = width
trigger1 = 1
player = 30,0

[state 340, posadd]
type = posadd
trigger1 = animelemtime(1) = 0
x = 30

[state 340, posadd]
type = posadd
trigger1 = animelemtime(2) = 0
x = 30

[state 340, changestate]
type = changestate
trigger1 = animtime = 0
value = 341
;---------------------------------------------------------------------------
[statedef 341]
type    = a
movetype= a
physics = n
ctrl = 0
anim = 341

[state 341, width]
type = width
trigger1 = 1
player = 30,0

[state 341, velset]
type = velset
trigger1 = time = 0
x = 4.5
y = -1

[state 341, veladd]
type = veladd
trigger1 = pos y < 0
y = const(movement.yaccel)

[state 341, changestate]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 342
;---------------------------------------------------------------------------
[statedef 342]
type    = c
movetype= a
physics = c
ctrl = 0
anim = 342

[state 342, velset]
type = velset
trigger1 = 1
y = 0

[state 342, posset]
type = posset
trigger1 = 1
y = 0

[state 342, playsnd]
type = playsnd
trigger1 = animelemtime(1) = 0
value = 0,4

[state 342, hitdef]
type = hitdef
trigger1 = animelemtime(1) = 0
attr = c,na
hitflag = maf
guardflag = la
affectteam = e
animtype = medium
ground.type = high
priority = 3,hit
sprpriority = 1
damage = floor(14*fvar(1)),0
getpower = 30,15
givepower = 10,5
ground.hittime  = 21
air.hittime = 17
guard.ctrltime = 15
ground.slidetime = 15
pausetime = 10,10
sparkno = s6010+random%4
guard.sparkno = 40
sparkxy = 0,-39
hitsound = s1,8
guardsound = s2,1
ground.velocity = -7.5
guard.velocity = ifelse((p2stateno!=[120,155]),-10,(var(14)-10))
air.velocity = -7,-4
fall.recovertime = 25
guard.cornerpush.veloff = var(14)-12

[state 342, changestate]
type = changestate
trigger1 = animtime = 0
value = 11
ctrl = 1
;===========================================================================
;■しゃがみ大キック
[statedef 350]
type    = c
movetype= a
physics = c
poweradd= 0
ctrl    = 0
anim    = 350

[state 350, width]
type = width
trigger1 = 1
player = 20,0

[state 350, playsnd]
type = playsnd
trigger1 = animelemtime(3) = 0
value = 0,6

[state 350, hitdef]
type = hitdef
trigger1 = animelemtime(4) = 0
attr = c,na
hitflag = mafd
guardflag = la
affectteam = e
animtype = back
ground.type = low
priority = 4,hit
sprpriority = 1
damage = floor(31*fvar(1)),0
getpower = 30,15
givepower = 25,5
ground.hittime  = 24
air.hittime = 90
guard.ctrltime = 8
ground.slidetime = 12
pausetime = 12,12
sparkno = s6020+random%4
guard.sparkno = 40
sparkxy = -10,-7
hitsound = s1,10
guardsound = s2,1
ground.velocity = -4,-3.5
guard.velocity = ifelse((p2stateno!=[120,155]),-3.2,(var(14)-3.2))
air.velocity = -2.2,-4
down.velocity = -1,0
guard.cornerpush.veloff = var(14)-20
fall = 1
fall.recover = 0
fall.recovertime = 100

[state 350, changestate]
type = changestate
trigger1 = animtime = 0
value = 11
ctrl = 1
;===========================================================================
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
trigger1 = animelemtime(1) = 0
value = 0,3

[state 400, hitdef]
type = hitdef
trigger1 = animelemtime(2) = 0
attr = a,na
hitflag = mafd
guardflag = ha
affectteam = e
animtype = light
ground.type = high
priority = 4,hit
sprpriority = 1
damage = floor(7*fvar(1)),0
getpower = 30,15
givepower = 8,5
ground.hittime  = 15-14*(var(13)=2)
air.hittime = 15
guard.ctrltime = 8
ground.slidetime = 12
pausetime = 10,10
sparkno = s6010+random%4
guard.sparkno = 40
sparkxy = -10,-60
hitsound = s1,7
guardsound = s2,1
ground.velocity = -2,0
guard.velocity = var(14)-2
air.velocity = -1,-3.3
down.velocity = -1,0
guard.cornerpush.veloff = var(14)-10
air.fall = 1
fall.recovertime = 20

[state 400, changestate]
type = changestate
trigger1 = animtime = 0
value = ifelse(var(9)=1,63,50)
ctrl = 1
;===========================================================================
;■ジャンプ中パンチ
[statedef 410]
type    = a
movetype= a
physics = a
poweradd= 0
ctrl = 0
anim = 410

[state 410, varrandom]
type = varrandom
trigger1 = 1
v = 5
range = 0,3

[state 410, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
trigger1 = random < 500
value = 9,var(5)
channel = 1
lowpriority = 1

[state 410, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
value = 0,4

[state 410, hitdef]
type = hitdef
trigger1 = animelemtime(3) = 0
attr = a,na
hitflag = mafd
guardflag = ha
affectteam = e
animtype = medium
ground.type = high
priority = 4,hit
sprpriority = 1
damage = floor(12*fvar(1)),0
getpower = 30,15
givepower = 10,5
ground.hittime  = 20-19*(var(13)=2)
air.hittime = 22
guard.ctrltime = 20
ground.slidetime = 12
pausetime = 10,10
sparkno = s6010+random%4
guard.sparkno = 40
sparkxy = -10,-60
hitsound = s1,7
guardsound = s2,1
ground.velocity = -2.8,0
guard.velocity = var(14)-2.4
air.velocity = -2,-5.5
down.velocity = -1,0
guard.cornerpush.veloff = var(14)-16
air.fall = 1
fall.recovertime = 30

[state 410, changestate]
type = changestate
trigger1 = animtime = 0
value = ifelse(var(9)=1,63,50)
ctrl = 1
;===========================================================================
;■ジャンプ大パンチ
[statedef 420]
type    = a
movetype= a
physics = a
poweradd= 0
ctrl = 0
anim = 420

[state 420, varrandom]
type = varrandom
trigger1 = 1
v = 5
range = 2,3

[state 420, playsnd]
type = playsnd
trigger1 = animelemtime(6) < 0
trigger1 = movecontact = 1
value = 9,var(5)
channel = 1
persistent = 0
ignorehitpause = 1

[state 420, playsnd]
type = playsnd
trigger1 = animelemtime(3) = 0
trigger2 = animelemtime(5) = 0
value = 0,6

[state 420, hitdef]
type = hitdef
trigger1 = animelemtime(4) = 0
trigger2 = animelemtime(6) = 0
attr = a,na
hitflag = mafd
guardflag = ha
affectteam = e
animtype = back
ground.type = low
priority = 4,hit
sprpriority = 1
damage = floor(22*fvar(1))+(animelemtime(6)>=0)*11,0
getpower = 30,15
givepower = 25,5
ground.hittime  = 24
air.hittime = 90
guard.ctrltime = 8
ground.slidetime = 12
pausetime = 12,12
sparkno = s6020+random%4
guard.sparkno = 40
sparkxy = -10,-50
hitsound = s1,10
guardsound = s2,1
ground.velocity = -4,-3
guard.velocity = var(14)-3.2
air.velocity = -2.2,15+(animelemtime(6)>=0)*25
down.velocity = -1,0
guard.cornerpush.veloff = var(14)-24
envshake.time = 16
envshake.freq = 70
envshake.ampl = 5
fall.damage = floor(16*fvar(1))
fall.envshake.time = 16
fall.envshake.freq = 70
fall.envshake.ampl = 5
air.fall = 1
fall.recover = 0
fall.recovertime = 900

[state 420, changeanim]
type = changeanim
trigger1 = animelemtime(3) > 0 && animelemtime(4) <= 0
trigger1 = movecontact
value = 420
elem = 4
ignorehitpause = 1
persistent = 0

[state 420, changeanim]
type = changeanim
trigger1 = animelemtime(4) > 0 && animelemtime(5) <= 0
trigger1 = movecontact
value = 420
elem = 5
ignorehitpause = 1
persistent = 0

[state 420, changestate]
type = changestate
trigger1 = animtime = 0
value = ifelse(var(9)=1,63,50)
ctrl = 1
;===========================================================================
;■ジャンプ小キック
[statedef 430]
type    = a
movetype= a
physics = a
poweradd= 0
ctrl = 0
anim = 430

[state 430, playsnd]
type = playsnd
trigger1 = animelemtime(1) = 0
value = 0,3

[state 430, hitdef]
type = hitdef
trigger1 = animelemtime(2) = 0
attr = a,na
hitflag = mafd
guardflag = ha
affectteam = e
animtype = light
ground.type = high
priority = 4,hit
sprpriority = 1
damage = floor(9*fvar(1)),0
getpower = 30,15
givepower = 9,5
ground.hittime  = 16-15*(var(13)=2)
air.hittime = 19
guard.ctrltime = 12
ground.slidetime = 12
pausetime = 10,10
sparkno = s6010+random%4
guard.sparkno = 40
sparkxy = -10,-53
hitsound = s1,7
guardsound = s2,1
ground.velocity = -2.3,0
guard.velocity = var(14)-2
air.velocity = -1.6,-3.4
down.velocity = -1,0
guard.cornerpush.veloff = var(14)-10
air.fall = 1
fall.recovertime = 25

[state 430, changestate]
type = changestate
trigger1 = animtime = 0
value = ifelse(var(9)=1,63,50)
ctrl = 1
;===========================================================================
;■ジャンプ中キック
[statedef 440]
type    = a
movetype= a
physics = a
poweradd= 0
ctrl = 0
anim = 440

[state 440, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
value = 0,4

[state 440, hitdef]
type = hitdef
trigger1 = animelemtime(3) = 0
attr = a,na
hitflag = mafd
guardflag = ha
affectteam = e
animtype = medium
ground.type = high
priority = 4,hit
sprpriority = 1
damage = floor(13*fvar(1)),0
getpower = 30,15
givepower = 12,5
ground.hittime  = 24-23*(var(13)=2)
air.hittime = 26
guard.ctrltime = 20
ground.slidetime = 12
pausetime = 10,10
sparkno = s6010+random%4
guard.sparkno = 40
sparkxy = -10,-53
hitsound = s1,7
guardsound = s2,1
ground.velocity = -2.8,0
guard.velocity = var(14)-2.4
air.velocity = -2,-5.3
down.velocity = -1,0
guard.cornerpush.veloff = var(14)-16
air.fall = 1
fall.recovertime = 30

[state 440, changestate]
type = changestate
trigger1 = animtime = 0
value = ifelse(var(9)=1,63,50)
ctrl = 1
;===========================================================================
;■熊殺し流星剣
[statedef 460]
type    = a
movetype= i
physics = a
poweradd= 0
ctrl = 0
velset = 0,0
anim = 460

[state 460, posfreeze]
type = posfreeze
trigger1 = 1

[state 460, changestate]
type = changestate
trigger1 = pos y >= 0
value = 52

[state 460, changestate]
type = changestate
trigger1 = animtime = 0
value = 463
;---------------------------------------------------------------------------
[statedef 463]
type    = a
movetype= a
physics = a
anim = 463

[state 463, velset]
type = velset
trigger1 = time = 0
x = 0
y = 15

[state 463, playsnd]
type = playsnd
trigger1 = time = 0
value = 2,14

[state 463, hitdef]
type = hitdef
trigger1 = time = 0
trigger1 = var(28) < 5
attr = a,na
hitflag = mafdp
guardflag = ma
affectteam = e
animtype = hard
ground.type = high
priority = 4,hit
sprpriority = 1
damage = floor(20*fvar(1)),0
getpower = 60,30
givepower = 20,5
ground.hittime = 27
air.hittime = 33
guard.ctrltime = 18
ground.slidetime = 18
pausetime = 10,10
sparkno = s6020+random%4
guard.sparkno = 40
sparkxy = 0,0
hitsound = s1,9
guardsound = s2,1
ground.velocity = -4.6,0
guard.velocity = var(14)-3
air.velocity = -1,-2.4
down.velocity = 0,0
air.fall = 1
fall.recovertime = 30
guard.cornerpush.veloff = var(14)-16

[state 463, changestate]
type = changestate
trigger1 = movecontact
value = 465
;---------------------------------------------------------------------------
[statedef 465]
type    = a
movetype= i
physics = a
anim = 465

[state 465, velset]
type = velset
trigger1 = time = 0
x = -7
y = -7

[state 465, changestate]
type = changestate
trigger1 = animtime = 0
value = ifelse(var(9)=1,63,50)
ctrl = 1
;===========================================================================
;†††grab actions†††
;===========================================================================
;■ブルーアール
[statedef 500]
type    = s
movetype= a
physics = s
velset = 0,0
ctrl = 0
anim = 500

[state 500, varset]
type = varset
trigger1 = var(50) = 0
trigger1 = command = "holdfwd"
var(7) = 1

[state 500, varset]
type = varset
trigger1 = var(50) = 0
trigger1 = command = "holdback"
var(7) = 2

[state 500, playsnd]
type = playsnd
trigger1 = animelemtime(1) = 0
value = 0,0

[state 500, hitdef]
type = hitdef
trigger1 = animelemtime(2) = 0
affectteam = e
attr = s,nt
hitflag = m-
priority = 1,miss
sparkno = -1
getpower = 20,10
p1sprpriority = 1
p1facing = ifelse(var(7)=1,1,-1)
p2facing = 1
hitsound = s1,6
guard.dist = 0

[state 500, targetstate]
type = targetstate
trigger1 = numtarget > 0
trigger1 = movehit
value = 505
ignorehitpause = 1

[state 500, changestate]
type = changestate
trigger1 = numtarget > 0
trigger1 = movehit
value = 501
ignorehitpause = 1

[state 500, varset]
type = varset
trigger1 = animtime = 0
var(7) = 0

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

[state 501, playsnd]
type = playsnd
trigger1 = time = 0
value = 9,4+(random<500)
channel = 1
lowpriority = 1

[state 501, posadd]
type = posadd
trigger1 = time = 0 
trigger1 = var(7) = 2
x = 60

[state 501, width]
type = width
trigger1 = animelemtime(1) = 0 
edge = 90,0

[state 501, targetbind]
type = targetbind
trigger1 = time <= 10
pos = 60,0

[state 501, playsnd]
type = playsnd
trigger1 = animelemtime(4) = 0
value = 0,6

[state 501, hitdef]
type = hitdef
trigger1 = animelemtime(4) = 0
attr = a,na
hitflag = mafd
guardflag = m
affectteam = e
animtype = back
ground.type = low
priority = 4,hit
sprpriority = 1
damage = floor(20*fvar(1)),0
getpower = 20,10
givepower = 10,5
ground.hittime  = 35
air.hittime = 35
guard.ctrltime = 20
ground.slidetime = 35
pausetime = 10,10
sparkno = s6010+random%4
guard.sparkno = 40
sparkxy = 0,-24
hitsound = s1,8
guardsound = s2,1
ground.velocity = -4,0
guard.velocity = -3.3
air.velocity = -2.4,-4
down.velocity = -1,0
guard.cornerpush.veloff = -24
envshake.time = 16
envshake.freq = 70
envshake.ampl = 5
air.fall = 1
fall.damage = floor(10*fvar(1))
fall.envshake.time = 16
fall.envshake.freq = 70
fall.envshake.ampl = 5
fall.recover = 0
fall.recovertime = 900
kill = 0
guard.kill = 0
fall.kill = 0

[state 501, changestate]
type = changestate
trigger1 = animtime = 0
value = 502
;---------------------------------------------------------------------------
[statedef 502]
type    = s
movetype= a
physics = s
anim = 502
poweradd = 0

[state 502, velset]
type = velset
trigger1 = animelemtime(2) = 0
x = 33

[state 502, hitdef]
type = hitdef
trigger1 = animelemtime(2) = 0
attr = a,na
hitflag = mafd
guardflag = m
affectteam = e
animtype = up
ground.type = low
priority = 4,hit
sprpriority = 1
damage = floor(25*fvar(1)),0
getpower = 20,10
givepower = 10,5
ground.hittime  = 35
air.hittime = 35
guard.ctrltime = 20
ground.slidetime = 35
pausetime = 10,10
sparkno = s6010+random%4
guard.sparkno = 40
sparkxy = 0,-35
hitsound = s1,9
guardsound = s2,1
ground.velocity = 2,-5
guard.velocity = -3.9
air.velocity = -2.4,-13.5
down.velocity = -1,0
guard.cornerpush.veloff = -24
envshake.time = 16
envshake.freq = 70
envshake.ampl = 5
fall = 1
fall.damage = floor(10*fvar(1))
fall.envshake.time = 16
fall.envshake.freq = 70
fall.envshake.ampl = 5
fall.recover = 0
fall.recovertime = 900

[state 502, changestate]
type = changestate
trigger1 = time >= 12
value = 503
;---------------------------------------------------------------------------
[statedef 503]
type    = s
movetype= i
physics = s
anim = 503

[state 503, varset]
type = varset
trigger1 = 1
var(7) = 0

[state 503, changestate]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
[statedef 505]
type    = s
movetype= h
physics = n
velset = 0,0

[state 505, destroyself]
type = destroyself
trigger1 = ishelper

[state 505, changeanim]
type = changeanim
trigger1 = 1
value = 5000

[state 505, selfstate]
type = selfstate
trigger1 = time >= 100
value = 5110
;===========================================================================
;■必殺天空十字剣
[statedef 550]
type    = a
movetype= a
physics = a
ctrl = 0
anim = 550
poweradd = 0

[state 550, varset]
type = varset
trigger1 = var(50) = 0
trigger1 = command="holdfwd"
var(7) = 1

[state 550, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
value = 0,0

[state 550, hitdef]
type = hitdef
getpower = 60,30
trigger1 = animelemtime(2) = 0
affectteam = e
attr = a,nt
hitflag = a-
priority = 1,miss
sparkno = -1
p1sprpriority = 1
p1facing = ifelse(var(7)=1,1,-1)
p2facing = 1
p1stateno = 551
p2stateno = 555
hitsound = s1,6
guard.dist = 0
fall = 1
fall.recover = 0
fall.recovertime = 900
fall.envshake.time = 16
fall.envshake.freq = 70
fall.envshake.ampl = 5

[state 550, varadd]
type = varadd
triggerall = var(50) != 0
trigger1 = animtime = 0
var(54) = 1

[state 550, changestate]
type = changestate
trigger1 = animtime = 0
value = 50
ctrl = 1
;---------------------------------------------------------------------------
[statedef 551]
type    = a
movetype= a
physics = a
anim = 551
poweradd = 0

[state 551, width]
type = width
trigger1 = animelemtime(1) = 0 
edge = 90,0

[state 551, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
trigger2 = animelemtime(6) = 0
value = 0,5

[state 551, hitadd]
type = hitadd
trigger1 = animelemtime(2) = 0
trigger2 = animelemtime(6) = 0
value = 1

[state 551, envshake]
type = envshake
trigger1 = animelemtime(2) = 0
trigger2 = animelemtime(6) = 0
time = 16
freq = 70
ampl = 5
phase = 50

[state 551, playsnd]
type = playsnd
trigger1 = animelemtime(2) = 0
value = 1,8

[state 551, playsnd]
type = playsnd
trigger1 = animelemtime(6) = 0
value = 1,9

[state 551, posfreeze]
type = posfreeze
trigger1 = animelemtime(7) < 0

[state 551, targetbind]
type = targetbind
trigger1 = animelemtime(7) < 0
pos = 30,-50

[state 551, targetlifeadd]
type = targetlifeadd
trigger1 = animelemtime(2) = 0
trigger2 = animelemtime(6) = 0
value = -floor(30*fvar(1))

[state 551, velset]
type = velset
trigger1 = animelemtime(7) = 0
x = -12
y = -3
;---------------------------------------------------------------------------
[statedef 555]
type    = a
movetype= h
physics = n
velset = 0,0

[state 555, destroyself]
type = destroyself
trigger1 = ishelper

[state 555, changeanim2]
type = changeanim2
trigger1 = time = 0
value = 555

[state 555, veladd]
type = veladd
trigger1 = 1
y = const(movement.yaccel)*2

[state 555, velset]
type = velset
trigger1 = animelemtime(7) = 0
x = -21
y = -2

[state 555, selfstate]
type = selfstate
trigger1 = anim = 555
trigger1 = animtime = 0
value = 5050

[state 555, selfstate]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= -10
value = 5100