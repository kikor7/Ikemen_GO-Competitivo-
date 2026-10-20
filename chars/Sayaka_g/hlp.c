;===========================================================================
;†††helpers†††
;===========================================================================
;■汎用バインド
[statedef 10000]
anim = 1
sprpriority = 5

[state 10000, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 10000, changeanim]
type = changeanim
trigger1 = animexist(root,anim+10000)
value = root,anim+10000
elem = root,animelemno(0)
ignorehitpause = 1

[state 10000, bindtoroot]
type = bindtoroot
trigger1 = 1
facing = 1
pos = 0,0
ignorehitpause = 1

[state 10000, trans]
type = trans
trigger1 = root,var(40) = 1
trigger1 = roundstate < 4
trans = sub
ignorehitpause = 1

[state 10000, destroyself]
type = destroyself
trigger1 = root,anim != anim-10000
trigger2 = root,movetype = h
ignorehitpause = 1
;===========================================================================
;■ヤミサヤカ起動ヘルパー
[statedef 15000]
anim = 1

[state 10000, assertspecial]
type = assertspecial
trigger1 = 1
flag = nofg
ignorehitpause = 1

[state 15000, parentvarset]
type = parentvarset
trigger1 = time < 2
var(40) = 2

[state 15000, parentvarset]
type = parentvarset
trigger1 = time < 2
var(41) = 0

[state 15000, parentvarset]
type = parentvarset
trigger1 = time < 2
var(42) = 0

[state 15000, parentvarset]
type = parentvarset
trigger1 = time < 2
var(43) = 0

[state 15000, parentvarset]
type = parentvarset
trigger1 = time < 2
var(44) = 0

[state 15000, parentvarset]
type = parentvarset
trigger1 = time < 2
var(45) = 0

[state 15000, bgpalfx]
type = bgpalfx
trigger1 = time < 2
time = 180
invertall = 1
ignorehitpause = 1
persistent = 0

[state 15000, playsnd]
type = playsnd
trigger1 = time = 1
value = 3,3
abspan = 0
ignorehitpause = 1
persistent = 0

[state 15000, destroyself]
type = destroyself
trigger1 = time > 180;2
ignorehitpause = 1
;===========================================================================
;■ヤミサヤカ起動ヘルパー
[statedef 15001]
anim = 1

[state 10000, assertspecial]
type = assertspecial
trigger1 = 1
flag = nofg
ignorehitpause = 1

[state 15000, parentvarset]
type = parentvarset
trigger1 = root,palno = 12
trigger1 = time < 2
var(40) = 3

[state 15000, bgpalfx]
type = bgpalfx
trigger1 = time < 2
time = 200
invertall = 1
ignorehitpause = 1
persistent = 0

[state 15000, playsnd]
type = playsnd
trigger1 = time = 1
value = 3,3
abspan = 0
ignorehitpause = 1
persistent = 0

[state 15000, destroyself]
type = destroyself
trigger1 = time > 200;2
ignorehitpause = 1

;===========================================================================
;■ヤミサヤカ起動ヘルパー
[statedef 15002]
anim = 1

[state 10000, assertspecial]
type = assertspecial
trigger1 = 1
flag = nofg
ignorehitpause = 1

[state 15000, bgpalfx]
type = bgpalfx
trigger1 = time < 2
time = 200
invertall = 1
ignorehitpause = 1
persistent = 0

[state 15000, playsnd]
type = playsnd
trigger1 = time = 1
value = 3,3
abspan = 0
ignorehitpause = 1
persistent = 0

[State -3, Glazing4]
type = Explod
trigger1 = time = 100
anim = 3541
ID = 6
sprpriority = 95
postype = p1
pos = 0,0
ownpal = 1
SuperMove = 1
scale = 1,1
PauseMoveTime = -1
Persistent = 0

[State -3, Glazing4]
type = Explod
trigger1 = time = 100
anim = 3542
ID = 6
sprpriority = 95
postype = p1
pos = 0,0
ownpal = 1
SuperMove = 1
scale = 1,1
PauseMoveTime = -1
Persistent = 0

[state 15000, destroyself]
type = changestate
trigger1 = time = 150
value = 15003
;---------------------------------------------------------------------------
; 鬼神雷鳴 （エフェクト）
[Statedef 15003]
type = S
movetype = A
physics = S
anim = 4525
ctrl = 0
sprpriority = 9

[state 3000, playsnd]
type = playsnd
trigger1 = time = 0
value = 18,5
volume = 255
channel = 12
freqmul = 0.5

[state 3000, playsnd]
type = playsnd
trigger1 = time = 0
value = 18,6
volume = 255
channel = 13
freqmul = 1.5

[State 17501, 消失処理]
type = PalFX
trigger1 = 1
time = -1
mul = 0+time*3, 0+time*3, 0+time*3

[State 17501, 影消去]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 17501, 角度変更]
type = AngleDraw
trigger1 = 1
scale = 6,0.05+(time*0.05)

[State 17501, 角度変更]
type = AngleSet
trigger1 = 1
value = 0+random%180
persistent = 0

[State 17501, 透過処理]
type = Trans
trigger1 = 1
trans = sub
;*********************************** 中心
[State 2102, エフェクト]
type = Explod
trigger1 = NumExplod(3671) = 0
trigger1 = Time = 0
anim = 3660
postype = p1
pos = 0,0
sprpriority = -1
ownpal = 1
bindtime = -1
supermovetime = 99999999
pausemovetime = 99999999
IgnoreHitPause = 1
ID = 3671

[State 2102, エフェクト操作]
type = ModifyExplod
trigger1 = Time = [0,85]
scale = 0.1+(floor(Time)*0.04),0.1+(floor(Time)*0.04)
supermovetime = 99999999
pausemovetime = 99999999
ID = 3671

[State 2102, エフェクトを消す]
type = RemoveExplod
trigger1 = (Time >= 64)
ID = 3671

;*********************************** 中心
[State 2102, エフェクト]
type = Explod
trigger1 = Time = 0
anim = 3661
postype = p1
pos = 0,0
sprpriority = -1
ownpal = 1
bindtime = -1
supermovetime = 99999999
pausemovetime = 99999999
IgnoreHitPause = 1
ID = 3672

[State 2102, エフェクト]
type = Explod
trigger1 = Time = 0
anim = 3661
postype = p1
pos = 0,0
facing = -1
sprpriority = -1
ownpal = 1
bindtime = -1
supermovetime = 99999999
pausemovetime = 99999999
IgnoreHitPause = 1
ID = 3672

[State 2102, エフェクト操作]
type = ModifyExplod
trigger1 = Time = [0,85]
scale = 0.04+(floor(Time)*0.04),0.1+(floor(Time)*0.04)
supermovetime = 99999999
pausemovetime = 99999999
ID = 3672

[State 2102, エフェクトを消す]
type = RemoveExplod
trigger1 = (Time >= 85)
ID = 3672

;*********************************** 中心
[State 2102, エフェクト]
type = Explod
trigger1 = Time = 0
anim = 3662
postype = p1
pos = 0,0
sprpriority = -1
ownpal = 1
bindtime = -1
supermovetime = 99999999
pausemovetime = 99999999
IgnoreHitPause = 1
ID = 3673

[State 2102, エフェクト]
type = Explod
trigger1 = Time = 0
anim = 3662
postype = p1
pos = 0,0
vfacing = -1
sprpriority = -1
ownpal = 1
bindtime = -1
supermovetime = 99999999
pausemovetime = 99999999
IgnoreHitPause = 1
ID = 3673

[State 2102, エフェクト操作]
type = ModifyExplod
trigger1 = Time = [0,85]
scale = 0.04+(floor(Time)*0.04),0.1+(floor(Time)*0.04)
supermovetime = 99999999
pausemovetime = 99999999
ID = 3673

[State 2102, エフェクトを消す]
type = RemoveExplod
trigger1 = (Time >= 85)
ID = 3673
;*********************************** 粒子２
[State 2102, エフェクト]
type = Explod
trigger1 = Time = 0
anim = 3663
postype = p1
pos = 0,0
sprpriority = 7
ownpal = 0
bindtime = -1
supermovetime = 99999999
pausemovetime = 99999999
IgnoreHitPause = 1
ID = 3674

[State 2102, エフェクト]
type = Explod
trigger1 = Time = 0
anim = 3663
facing = -1
postype = p1
pos = 0,0
sprpriority = 99
ownpal = 0
bindtime = -1
supermovetime = 99999999
pausemovetime = 99999999
IgnoreHitPause = 1
ID = 3674

[State 2102, エフェクト操作]
type = ModifyExplod
trigger1 = Time = [0,85]
scale = 0.04+(floor(Time)*0.04),0.04+(floor(Time)*0.04)
supermovetime = 99999999
pausemovetime = 99999999
ID = 3674

[State 2102, エフェクトを消す]
type = RemoveExplod
trigger1 = (Time >= 85)
ID = 3674

;*********************************** 粒子２
[State 2102, エフェクト]
type = Explod
trigger1 = Time = 0
anim = 3664
facing = -1
postype = p1
pos = 0,0
sprpriority = 99
ownpal = 0
bindtime = -1
supermovetime = 99999999
pausemovetime = 99999999
IgnoreHitPause = 1
ID = 3675

[State 2102, エフェクト]
type = Explod
trigger1 = Time = 0
anim = 3664
vfacing = -1
postype = p1
pos = 0,0
sprpriority = 99
ownpal = 0
bindtime = -1
supermovetime = 99999999
pausemovetime = 99999999
IgnoreHitPause = 1
ID = 3675

[State 2102, エフェクト操作]
type = ModifyExplod
trigger1 = Time = [0,85]
scale = 0.04+(floor(Time)*0.04),0.04+(floor(Time)*0.04)
supermovetime = 99999999
pausemovetime = 99999999
ID = 3675

[State 2102, エフェクトを消す]
type = RemoveExplod
trigger1 = (Time >= 85)
ID = 3675

;*********************************
[State 2103, エフェクト]
type = Explod
trigger1 = NumExplod(3678) = 0 
trigger1 = Time = 0
anim = 3665
vfacing = -1
postype = p1
pos = 0,0
sprpriority = 99
ownpal = 1
bindtime = -1
supermovetime = 99999999
pausemovetime = 99999999
IgnoreHitPause = 1
ID = 3678

[State 2103, エフェクト操作]
type = ModifyExplod
trigger1 = Time = [0,85]
scale = 0.04+(floor(Time)*0.04),0.01+(floor(Time)*0.04)
supermovetime = 99999999
pausemovetime = 99999999
ID = 3678

[State 2103, エフェクトを消す]
type = RemoveExplod
trigger1 = (Time >= 85)
ID = 3678

;*********************************
[State 2103, エフェクト]
type = Explod
trigger1 = NumExplod(3679) = 0 
trigger1 = Time = 0
anim = 3666
postype = p1
pos = 0,0
sprpriority = 99
ownpal = 1
bindtime = -1
supermovetime = 99999999
pausemovetime = 99999999
IgnoreHitPause = 1
ID = 3679

[State 2103, エフェクト操作]
type = ModifyExplod
trigger1 = Time = [0,85]
scale = 0.03+(floor(Time)*0.03),0.01+(floor(Time)*0.03)
supermovetime = 99999999
pausemovetime = 99999999
ID = 3679

[State 2103, エフェクトを消す]
type = RemoveExplod
trigger1 = (Time >= 85)
ID = 3679
;*********************************

[State 10291, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

;*********************************
[State 4003, 4]
type = ChangeState
trigger1 = Time = 85
value = 15004
;---------------------------------------------------------------------------
; 鬼神雷鳴 （エフェクト）
[Statedef 15004]
type = S
movetype = A
physics = S
anim = 4520
ctrl = 0
sprpriority = 10

[State 2103, エフェクト]
type = RemoveExplod
trigger1 = Time = 0
ID = 3692

[state 3000, playsnd]
type = playsnd
trigger1 = time = 0
trigger2 = time = 150
value = 18,4
volume = 255

[state 3000, playsnd]
type = playsnd
trigger1 = time = 200
value = 18,7
volume = 255

[State 2103, エフェクト]
type = Explod
trigger1 = Time = 0
anim = 3630
postype = left
pos = 0,0
sprpriority = 99
ownpal = 1
bindtime = -1
supermovetime = 99999999
pausemovetime = 99999999
IgnoreHitPause = 1
ontop = 1
ID = 3688

[State 2103, エフェクト]
type = Explod
trigger1 = Time = 0
anim = 32000
postype = left
pos = 0,0
removetime = 210
sprpriority = 95
ownpal = 1
bindtime = -1
supermovetime = 99999999
pausemovetime = 99999999
IgnoreHitPause = 1
scale = 5,5
ID = 3688

[State 17501, 終了]
type = DestroySelf
trigger1 = time = 200
;===========================================================================
;■影踊るスケルツォ・魔法剣
[statedef 6500]
type = a
movetype = a
physics = n
anim = 6500
poweradd = 0
ctrl = 0

[state 6500, veladd]
type = veladd
trigger1 = 1
x = 7

[state 6500, hitby]
type = hitby
trigger1 = 1
value = sca,ap

[state 6500, hitoverride]
type = hitoverride
trigger1 = 1
attr = sca,aa,ap,at
slot = 0
stateno = 65000
time = -1

[state 6500, hitdef]
type = hitdef
trigger1 = time = 1
attr = a,sp
hitflag = maf
guardflag = ma
affectteam = e
animtype  = hard
ground.type = high
priority = 2,hit
sprpriority = 1
damage = floor(10*root,fvar(1)),5
getpower = 20,0
givepower = 10,5
ground.hittime = 16
air.hittime = 16
guard.ctrltime = 8
pausetime = 0,12
sparkno = s1
guard.sparkno = s1
sparkxy = 0,-50
hitsound = s1,8
guardsound = s2,1
ground.velocity = -3,0
guard.velocity = -2
air.velocity = -2.4,-2
down.velocity = 0,0
ground.cornerpush.veloff = 2
air.fall = 1
fall.recovertime = 20

[state 6500, varset]
type = varset
trigger1 = numtarget
var(15) = target,id

[state 6500, varset]
type = varset
trigger1 = playeridexist(var(15))
var(16) = ceil(playerid(var(15)),pos x)

[state 6500, varset]
type = varset
trigger1 = playeridexist(var(15))
var(17) = ceil(playerid(var(15)),pos y)

[state 6500, varset]
type = varset
trigger1 = movehit
var(1) = 2

[state 6500, varset]
type = varset
trigger1 = moveguarded
var(1) = 40

[state 6500, varrandom]
type = varrandom
trigger1 = 1
v = 2
range = -3,3
ignorehitpause = 1

[state 6500, changestate]
type = changestate
trigger1 = movecontact
value = 6505

[state 6500, destroyself]
type = destroyself
trigger1 = frontedgedist < -30
;---------------------------------------------------------------------------
[statedef 6505]
type = a
movetype = i
physics = n
anim = ifelse(var(1)=2,6505,1)
ctrl = 0
velset = 0,0

[state 6505, posset]
type = posset
trigger1 = var(15) != 0
trigger1 = time <= 1
x = var(16)+var(2)

;[state 6505, gamemakeanim]
;type = gamemakeanim
;trigger1 = time = 1
;value = var(1)

[State -3, Glazing4]
type = Explod
trigger1 = time = 0
trigger1 = var(1) = 2
anim = 6100+random%2
ID = 6
sprpriority = 5
postype = p1
pos = 0,0
ownpal = 1
SprPriority = 5
SuperMove = 1
PauseMoveTime = -1
Persistent = 0

[State -3, Glazing4]
type = Explod
trigger1 = time = 0
trigger1 = var(1) = 40
anim = f40
ID = 6
sprpriority = 5
postype = p1
pos = 0,0
ownpal = 1
SprPriority = 5
SuperMove = 1
PauseMoveTime = -1
Persistent = 0



[state 6505, destroyself]
type = destroyself
trigger1 = time >= 25
;===========================================================================
;■君想うテンペストーソ・魔法剣
[statedef 6550]
type = a
movetype = a
physics = n
anim = 6500
ctrl = 0

[state 6550, veladd]
type = veladd
trigger1 = 1
x = 13.5

[state 6550, hitby]
type = hitby
trigger1 = 1
value = sca,ap

[state 6550, hitoverride]
type = hitoverride
trigger1 = 1
attr = sca,aa,ap,at
slot = 0
stateno = 65000
time = -1

[state 6550, hitdef]
type = hitdef
trigger1 = time = 1
attr = a,hp
hitflag = maf
guardflag = ma
affectteam = e
animtype  = hard
ground.type = high
priority = 2,hit
sprpriority = 1
damage = floor(11*root,fvar(1)),3
getpower = 0,0
givepower = 5,2
ground.hittime = 25
air.hittime = 16
guard.ctrltime = 12
pausetime = 0,12
sparkno = s1
guard.sparkno = s1
sparkxy = 0,-50
hitsound = s1,8
guardsound = s2,1
ground.velocity = -3,0
guard.velocity = -2
air.velocity = -2.4,-2
down.velocity = 0,0
ground.cornerpush.veloff = 2
air.fall = 1
fall.recovertime = 55

[state 6550, varset]
type = varset
trigger1 = numtarget
var(15) = target,id

[state 6550, varset]
type = varset
trigger1 = playeridexist(var(15))
var(16) = ceil(playerid(var(15)),pos x)

[state 6550, varset]
type = varset
trigger1 = playeridexist(var(15))
var(17) = ceil(playerid(var(15)),pos y)

[state 6550, varset]
type = varset
trigger1 = movehit
var(1) = 2

[state 6550, varset]
type = varset
trigger1 = moveguarded
var(1) = 40

[state 6550, varrandom]
type = varrandom
trigger1 = 1
v = 2
range = -3,3
ignorehitpause = 1

[state 6550, changestate]
type = changestate
trigger1 = movecontact
value = 6505

[state 6550, destroyself]
type = destroyself
trigger1 = frontedgedist < -30
;===========================================================================
;■誰が為にアフェットゥオーソ・敵サーチバインド
[statedef 7500]
type = a
movetype = i
physics = n
sprpriority = -5
anim = 1

[state 7500, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 7500, varset]
type = varset
trigger1 = 1
var(15) = parent,var(15)

[state 7500, varset]
type = varset
trigger1 = 1
var(16) = parent,var(16)

[state 7500, varset]
type = varset
trigger1 = 1
var(17) = parent,var(17)

[state 7500, parentvarset]
type = parentvarset
trigger1 = 1
var(25) = var(25)

[state 7500, parentvarset]
type = parentvarset
trigger1 = 1
var(26) = var(26)

[state 7500, posset]
type = posset
trigger1 = 1
x = var(16)
y = var(17)

[state 7500, varset]
type = varset
trigger1 = 1
var(25) = ceil(parentdist x)

[state 7500, varset]
type = varset
trigger1 = 1
var(26) = ceil(parentdist y)

[state 7500, destroyself]
type = destroyself
trigger1 = parent,ctrl = 1
trigger2 = parent,movetype = h
ignorehitpause = 1
;===========================================================================
;■キラキラ
[statedef 20000]
type = a
movetype = i
physics = n
sprpriority = 5
anim = 20000+(root,var(24))

[state 20000, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 20000, varset]
type = varset
trigger1 = time < 3
var(18) = parent,var(18)

[state 20000, posset]
type = posset
trigger1 = playeridexist(var(18))
trigger1 = playerid(var(18)),movetype = h
trigger1 = playerid(var(18)),stateno != [120,155]
x = (playerid(var(18)),pos x)
y = (playerid(var(18)),pos y)-50

[state 20000, trans]
type = trans
trigger1 = root,var(40) = 1
trigger2 = root,var(40) = 3
trans = sub
ignorehitpause = 1

[state 20000, destroyself]
type = destroyself
trigger1 = animtime = 0
ignorehitpause = 1
;===========================================================================
;■キラキラ
[statedef 20001]
type = a
movetype = i
physics = n
sprpriority = 5
anim = 20000+(root,var(24))

[state 20001, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 20001, varset]
type = varset
trigger1 = time < 3
var(19) = parent,var(19)

[state 20001, posset]
type = posset
trigger1 = playeridexist(var(19))
trigger1 = playerid(var(19)),movetype = h
trigger1 = playerid(var(19)),stateno != [120,155]
x = (playerid(var(19)),pos x)
y = (playerid(var(19)),pos y)-50

[state 20001, trans]
type = trans
trigger1 = root,var(40) = 1
trigger2 = root,var(40) = 3
trans = sub
ignorehitpause = 1

[state 20001, destroyself]
type = destroyself
trigger1 = animtime = 0
ignorehitpause = 1
;===========================================================================
;■煌きのオラトリオ１・バインド
[statedef 11010]
type = a
movetype = i
physics = n
anim = 11010
sprpriority = 1

[state 11010, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 11010, bindtoroot]
type = bindtoroot
trigger1 = root,anim = 1010
facing = 1
pos = 0,0
ignorehitpause = 1

[state 11010, trans]
type = trans
trigger1 = root,var(40) = 1
trigger2 = root,var(40) = 3
trans = sub
ignorehitpause = 1

[state 11010, changestate]
type = changestate
trigger1 = root,anim != 1010
trigger2 = root,movetype != a
value = 11020
;---------------------------------------------------------------------------
[statedef 11020]
type    = a
movetype= i
physics = n
anim = 11020

[state 11020, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 11020, trans]
type = trans
trigger1 = root,var(40) = 1
trigger2 = root,var(40) = 3
trans = sub
ignorehitpause = 1

[state 11020, destroyself]
type = destroyself
trigger1 = animtime = 0
trigger2 = root,movetype = h
ignorehitpause = 1
;===========================================================================
;■煌きのオラトリオ２・バインド
[statedef 11040]
type = a
movetype = i
physics = n
anim = 11040
sprpriority = 1

[state 11040, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 11040, bindtoroot]
type = bindtoroot
trigger1 = root,anim = 1040
facing = 1
pos = 0,0
ignorehitpause = 1

[state 11040, trans]
type = trans
trigger1 = root,var(40) = 1
trigger2 = root,var(40) = 3
trans = sub
ignorehitpause = 1

[state 11040, changestate]
type = changestate
trigger1 = root,anim != 1040
trigger2 = root,movetype != a
value = 11050
;---------------------------------------------------------------------------
[statedef 11050]
type    = a
movetype= i
physics = n
anim = 11050

[state 11050, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 11050, trans]
type = trans
trigger1 = root,var(40) = 1
trigger2 = root,var(40) = 3
trans = sub
ignorehitpause = 1

[state 11050, destroyself]
type = destroyself
trigger1 = animtime = 0
trigger2 = root,movetype = h
ignorehitpause = 1
;===========================================================================
;■煌きのオラトリオ５・バインド
[statedef 11110]
type = a
movetype = i
physics = n
anim = 11110
sprpriority = 1

[state 11110, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 11110, bindtoroot]
type = bindtoroot
trigger1 = root,anim = 1110
facing = 1
pos = 0,0
ignorehitpause = 1

[state 11110, trans]
type = trans
trigger1 = root,var(40) = 1
trigger2 = root,var(40) = 3
trans = sub
ignorehitpause = 1

[state 11110, changestate]
type = changestate
trigger1 = root,anim != 1110
trigger2 = root,movetype != a
value = 11120
;---------------------------------------------------------------------------
[statedef 11120]
type    = a
movetype= i
physics = n
anim = 11120

[state 11120, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 11120, trans]
type = trans
trigger1 = root,var(40) = 1
trigger2 = root,var(40) = 3
trans = sub
ignorehitpause = 1

[state 11120, destroyself]
type = destroyself
trigger1 = animtime = 0
trigger2 = root,movetype = h
ignorehitpause = 1
;===========================================================================
;■勇気を乗せてグランディオーソ・バインド１
[statedef 11140]
type = a
movetype = i
physics = n
anim = 11140
sprpriority = 1

[state 11140, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 11140, bindtoroot]
type = bindtoroot
trigger1 = root,anim = 3200
facing = 1
pos = 0,0
ignorehitpause = 1

[state 11140, trans]
type = trans
trigger1 = root,var(40) = 1
trigger2 = root,var(40) = 3
trans = sub
ignorehitpause = 1

[state 11140, changestate]
type = changestate
trigger1 = root,anim != 3200
trigger2 = root,movetype != a
value = 11150
;---------------------------------------------------------------------------
[statedef 11150]
type    = a
movetype= i
physics = n
anim = 11150

[state 11150, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 11150, trans]
type = trans
trigger1 = root,var(40) = 1
trigger2 = root,var(40) = 3
trans = sub
ignorehitpause = 1

[state 11150, destroyself]
type = destroyself
trigger1 = animtime = 0
trigger2 = root,movetype = h
ignorehitpause = 1
;===========================================================================
;■勇気を乗せてグランディオーソ・バインド２
[statedef 11170]
type = a
movetype = i
physics = n
anim = 11170
sprpriority = 1

[state 11170, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 11170, bindtoroot]
type = bindtoroot
trigger1 = root,anim = 3210
facing = 1
pos = 0,0
ignorehitpause = 1

[state 11170, trans]
type = trans
trigger1 = root,var(40) = 1
trigger2 = root,var(40) = 3
trans = sub
ignorehitpause = 1

[state 11170, changestate]
type = changestate
trigger1 = root,anim != 3210
trigger2 = root,movetype != a
value = 11180
;---------------------------------------------------------------------------
[statedef 11180]
type    = a
movetype= i
physics = n
anim = 11180

[state 11180, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 11180, trans]
type = trans
trigger1 = root,var(40) = 1
trigger2 = root,var(40) = 3
trans = sub
ignorehitpause = 1

[state 11180, destroyself]
type = destroyself
trigger1 = animtime = 0
trigger2 = root,movetype = h
ignorehitpause = 1
;===========================================================================
;■魔方陣
[statedef 21500]
type = a
movetype = i
physics = n
anim = 21500
sprpriority = -3+(root,var(40)=1)*8-(root,stateno=3410)*8

[state 21500, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 21500, varset]
type = varset
trigger1 = time < 1
var(1) = root,facing

[state 21500, trans]
type = trans
trigger1 = root,var(40) = 1
trigger2 = root,var(40) = 3
trans = sub
ignorehitpause = 1

[state 21500, changestate]
type = changestate
trigger1 = animtime = 0
value = 21510
;---------------------------------------------------------------------------
[statedef 21510]
type    = a
anim = 21510

[state 21510, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 21510, angledraw]
type = angledraw
trigger1 = 1
ignorehitpause = 1

[state 21510, angleadd]
type = angleadd
trigger1 = 1
value = -0.3*var(1)
ignorehitpause = 1

[state 21510, trans]
type = trans
trigger1 = root,var(40) != 1
trigger1 = root,var(40) != 3
trans = add
ignorehitpause = 1

[state 21510, trans]
type = trans
trigger1 = root,var(40) = 1
trigger2 = root,var(40) = 3
trans = sub
ignorehitpause = 1

[state 21510, destroyself]
type = destroyself
trigger1 = time >= 120
;===========================================================================
;■魔方陣クォート
[statedef 21501]
type = a
movetype = i
physics = n
anim = 21501
sprpriority = -3+(root,var(40)=1)*8-(root,stateno=3410)*8

[state 21501, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 21501, varset]
type = varset
trigger1 = time < 1
var(1) = root,facing

[state 21501, trans]
type = trans
trigger1 = root,var(40) = 1
trigger2 = root,var(40) = 3
trans = sub
ignorehitpause = 1

[state 21501, changestate]
type = changestate
trigger1 = animtime = 0
value = 21511
;---------------------------------------------------------------------------
[statedef 21511]
type    = a
anim = 21511

[state 21511, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 21511, angledraw]
type = angledraw
trigger1 = 1
ignorehitpause = 1

[state 21511, angleadd]
type = angleadd
trigger1 = 1
value = -0.3*var(1)
ignorehitpause = 1

[state 21511, trans]
type = trans
trigger1 = root,var(40) != 1
trigger1 = root,var(40) != 3
trans = add
ignorehitpause = 1

[state 21511, trans]
type = trans
trigger1 = root,var(40) = 1
trigger2 = root,var(40) = 3
trans = sub
ignorehitpause = 1

[state 21511, destroyself]
type = destroyself
trigger1 = time >= 120
;===========================================================================
;■魔方陣
[statedef 21520]
type = a
movetype = i
physics = n
anim = 21500
sprpriority = -3+(root,var(40)=1)*8-(root,stateno=3410)*8

[state 21500, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 21500, varset]
type = varset
trigger1 = time < 1
var(1) = root,facing

[state 21500, trans]
type = trans
trigger1 = 1
trans = sub
ignorehitpause = 1

[state 21500, changestate]
type = changestate
trigger1 = animtime = 0
value = 21530
;---------------------------------------------------------------------------
[statedef 21530]
type    = a
anim = 21510

[state 21510, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 21510, angledraw]
type = angledraw
trigger1 = 1
ignorehitpause = 1

[state 21510, angleadd]
type = angleadd
trigger1 = 1
value = -0.3*var(1)
ignorehitpause = 1

[state 21510, trans]
type = trans
trigger1 = 1
trans = sub
ignorehitpause = 1

[state 21510, destroyself]
type = destroyself
trigger1 = time >= 240
trigger2 = root,stateno != [3600,3610]
;===========================================================================
;■魔方陣クォート
[statedef 21525]
type = a
movetype = i
physics = n
anim = 21501
sprpriority = -3+(root,var(40)=1)*8-(root,stateno=3410)*8

[state 21501, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 21501, varset]
type = varset
trigger1 = time < 1
var(1) = root,facing

[state 21501, trans]
type = trans
trigger1 = 1
trans = sub
ignorehitpause = 1

[state 21501, changestate]
type = changestate
trigger1 = animtime = 0
value = 21526
;---------------------------------------------------------------------------
[statedef 21526]
type    = a
anim = 21511

[state 21511, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 21511, angledraw]
type = angledraw
trigger1 = 1
ignorehitpause = 1

[state 21511, angleadd]
type = angleadd
trigger1 = 1
value = -0.3*var(1)
ignorehitpause = 1

[state 21511, trans]
type = trans
trigger1 = 1
trans = sub
ignorehitpause = 1

[state 21511, destroyself]
type = destroyself
trigger1 = time >= 240
trigger2 = root,stateno != [3600,3610] 
;===========================================================================
;■魔方陣ジャンプ
[statedef 20040]
type = a
movetype = i
physics = n
anim = 20040
sprpriority = -3

[state 20040, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 20040, trans]
type = trans
trigger1 = root,var(40) = 1
trigger2 = numhelper(15000) = 1
trigger3 = root,var(40) = 3
trans = sub
ignorehitpause = 1

[state 20040, destroyself]
type = destroyself
trigger1 = animtime = 0
;===========================================================================
;■魔方陣エアダッシュ
[statedef 20110]
type = a
movetype = i
physics = n
anim = 20110
sprpriority = -3

[state 20110, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 20110, trans]
type = trans
trigger1 = root,var(40) = 1
trigger2 = numhelper(15000) = 1
trigger3 = root,var(40) = 3
trans = sub
ignorehitpause = 1

[state 20110, destroyself]
type = destroyself
trigger1 = animtime = 0
;===========================================================================
;■魔方陣エアロ
[statedef 21700]
type = a
movetype = i
physics = n
anim = 21700
sprpriority = -3

[state 21700, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 21700, trans]
type = trans
trigger1 = root,var(40) = 1
trigger2 = numhelper(15000) = 1
trigger3 = root,var(40) = 3
trans = sub
ignorehitpause = 1

[state 21700, destroyself]
type = destroyself
trigger1 = animtime = 0
;===========================================================================
;■マギカブート結界
[statedef 32400]
type = a
movetype = i
physics = n
anim = 32400
sprpriority = -3

[state 32400, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[state 32400, destroyself]
type = destroyself
trigger1 = animtime = 0
;===========================================================================
[statedef 65000]
movetype = i

[state 65000, stopsnd]
type = stopsnd
trigger1 = 1
channel = 1

[state 65000, assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow
flag2 = invisible
ignorehitpause = 1

[state 65000, nothitby]
type = nothitby
trigger1 = 1
value = sca,aa

[state 65000, destroyself]
type = destroyself
trigger1 = time = 100

;---------------------------------------------------------------------------
;グレイズ
[Statedef 4510]
type = A
physics = N
ctrl = 0
sprpriority = 5
anim = 4500

[State 6110, ????????]
Type = ReversalDef
Trigger1 = 1
Reversal.Attr = SCA,NP,SP,HP
PauseTime = 0,0
SparkNo = -1
NumHits = 0
ID = 4502

[State 6110, ????????]
Type = Projectile
Trigger1 = Time = 0
Attr = A, HP
GetPower = 0
AnimType = Back
PauseTime = 0,0
OffSet = 0,0
Velocity = 0,0
ProjID = 4511
ProjAnim = 4505
ProjRemAnim = -1
ProjHits = 1
ProjRemove = 1
ProjRemoveTime = 1
ProjPriority = 1
SuperMoveTime = 1
PauseMoveTime = 1
;-----------------------------------
HitFlag           = P
GuardFlag         = MA
SparkNo           = -1
GuardSparkNo      = -1
SparkXY           = 0,999
HitSound          = -1
GuardSound        = -1
Guard.Dist = 0
NumHits = 0

[State 6110, エフェクト]
Type = Explod
Trigger1 = MoveHit
Trigger2 = enemy,projcontact = 1
Anim = 4510
ID = 4510
Pos = 0,-40
Scale = .5,.5
Facing = IfElse(Random<500,1,-1)
VFacing = IfElse(Random<500,1,-1)
Ownpal = 1
SprPriority = 5
SuperMove = 1
PauseMoveTime = -1
Persistent = 0

[State 6110, エフェクト]
Type = PlaySnd
Trigger1 = MoveHit
Trigger2 = enemy,projcontact = 1
value = s2,110
volume = 255
channel = 12

[State -3, Glazing4]
type = Explod
trigger1 = Movehit
Trigger2 = enemy,projcontact = 1
anim = 4520
ID = 4520
sprpriority = 5
postype = p1
pos = 10,-53
ownpal = 1
SprPriority = 5
SuperMove = 1
PauseMoveTime = -1
Persistent = 0

[State -3, Glazing6]
type = MoveHitReset
trigger1 = Movehit

[State -3, Glazing3]
type = hitadd
trigger1 = Movehit
value = -1

[State 1201,end]
type = Destroyself
trigger1 = time > 0


;-------------------------------------------------------------------
;carga2
[Statedef 6010]
type=A
velset=0,0
anim=8500
sprpriority=5

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 8500
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 8501
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85021
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85022
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85023
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85024
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85025
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85026

[State 200:Playsnd avanicada]
type = playsnd
trigger1 = time = 0
value = 8500,0
channel = 15

[State 200:Playsnd avanicada]
type = playsnd
trigger1 = time = 10
value = 8500,1
channel = 16

[State 8500, assert]
type=assertspecial
trigger1=1
flag=noshadow

[State 8500, time]
type=varset
trigger1=!time
var(51)=40

[State 0, EnvColor]
type = BGPalFX
trigger1 = time = [0,25]
add = 0-(time*10),0-(time*10),0-(time*10)
time = 1
invertall = 0
ignorehitpause = 1

[State 0, EnvColor]
type = BGPalFX
trigger1 = time >= 26
add = -256,-256,-256
time = 2
invertall = 0
ignorehitpause = 1

[State 8500, rotate]
type=angleset
trigger1=!time
value=0

[State 8500, rotate]
type=angleadd
trigger1=1
value=-60

[State 8500, scale]
type=angledraw
trigger1=time<var(51)
scale=1.2-1.2*((time*1.0)/var(51)),1.2-1.2*((time*1.0)/var(51))

[State 8500, scale]
type=angledraw
trigger1=time>=var(51)
scale=0,0

[State 8500, trans]
type=trans
trigger1=1
trans=addalpha
alpha=256,256

[State 8500, circle]
type=explod
trigger1=!time
anim=8501
ID=8521
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(8521)
ID=8521
scale=.25+(.075*time),.25+(.075*time)
trans=addalpha
alpha=ceil(256-6.4*time),256

[State 8500, circle]
type=explod
trigger1=time=4
anim=8502
ID=85221
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, circle]
type=explod
trigger1=time=8
anim=8502
ID=85222
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, circle]
type=explod
trigger1=time=12
anim=8502
ID=85223
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, circle]
type=explod
trigger1=time=16
anim=8502
ID=85224
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, circle]
type=explod
trigger1=time=20
anim=8502
ID=85225
sprpriority=5
postype=p1
supermovetime=-1
pausemovetime = 9999
supermovetime = 9999

[State 8500, circle]
type=explod
trigger1=time=24
anim=8502
ID=85226
sprpriority=5
postype=p1
supermovetime=-1
pausemovetime = 9999
supermovetime = 9999

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85221)
ID=85221
scale=.25+((time-4)*.0313),.25+((time-4)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85222)
ID=85222
scale=.25+((time-8)*.0313),.25+((time-8)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85223)
ID=85223
scale=.25+((time-12)*.0313),.25+((time-12)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85224)
ID=85224
scale=.25+((time-16)*.0313),.25+((time-16)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85225)
ID=85225
scale=.25+((time-20)*.0313),.25+((time-20)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85226)
ID=85226
scale=.25+((time-24)*.0313),.25+((time-24)*.0313)

[State 8500, 変数増減] ;カットインA拡大率
Type = VarAdd
trigger1 = time >= 26
fvar(0) = 0.0175

[State 8500, エフェクト表示] ;カットインA
Type = Explod
trigger1 = root,stateno = 3600
trigger1 = ishelper(8500)
trigger1 = time = 0
anim = 8550
ID = 8550
scale = 0.50 + fvar(0), 0.50 + fvar(0)
pos = 0, 240
postype = back
sprpriority = -5
removetime = 50
removeongethit = 1
pausemovetime = 9999
supermovetime = 9999
ignorehitpause = 1
persistent = 0

[State 8500, エフェクト表示] ;カットインB炎
Type = Explod
trigger1 = root,stateno != 3600
trigger1 = ishelper(8500)
trigger1 = time = 0
anim = 8600
ID = 8550
scale = 0.50 + fvar(0), 0.50 + fvar(0)
pos = 0, 240
postype = back
sprpriority = -5
removetime = 50
removeongethit = 1
pausemovetime = 9999
supermovetime = 9999
ignorehitpause = 1
persistent = 0

[State 8500, エフェクト表示] ;カットインB
Type = Explod
trigger1 = root,stateno != 3600
trigger1 = ishelper(8500)
trigger1 = time = 0
anim = 8550
ID = 8550
scale = 0.50 + fvar(0), 0.50 + fvar(0)
pos = 0, 240
postype = back
sprpriority = -5
removetime = 50
removeongethit = 1
pausemovetime = 9999
supermovetime = 9999
ignorehitpause = 1
persistent = 0

[State 8500, エフェクト変更] ;カットイン拡大
Type = ModifyExplod
trigger1 = 1
ID = 8550
scale = 0.50+fvar(0), 0.50+fvar(0)
ignorehitpause = 1

[State 8500, safety]
type=removeexplod
trigger1=time>=(var(51)+1)

[State 8500, end]
type=destroyself
trigger1=time>=(var(51)+5)
;-------------------------------------------------------------------
;carga2
[Statedef 6020]
type=A
velset=0,0
anim=8510
sprpriority=5

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 8500
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 8501
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85021
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85022
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85023
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85024
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85025
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85026

[State 200:Playsnd avanicada]
type = playsnd
trigger1 = time = 0
value = 8500,0
channel = 15

[State 200:Playsnd avanicada]
type = playsnd
trigger1 = time = 10
value = 8500,1
channel = 16

[State 8500, assert]
type=assertspecial
trigger1=1
flag=noshadow

[State 8500, time]
type=varset
trigger1=!time
var(51)=40

[State 0, EnvColor]
type = BGPalFX
trigger1 = time = [0,25]
add = 0-(time*10),0-(time*10),0-(time*10)
time = 1
invertall = 0
ignorehitpause = 1

[State 0, EnvColor]
type = BGPalFX
trigger1 = time >= 26
add = -256,-256,-256
time = 2
invertall = 0
ignorehitpause = 1

[State 8500, rotate]
type=angleset
trigger1=!time
value=0

[State 8500, rotate]
type=angleadd
trigger1=1
value=-60

[State 8500, scale]
type=angledraw
trigger1=time<var(51)
scale=1.2-1.2*((time*1.0)/var(51)),1.2-1.2*((time*1.0)/var(51))

[State 8500, scale]
type=angledraw
trigger1=time>=var(51)
scale=0,0

[State 8500, trans]
type=trans
trigger1=1
trans=addalpha
alpha=256,256

[State 8500, circle]
type=explod
trigger1=!time
anim=8511
ID=8521
sprpriority=5
postype=p1
supermovetime=-1
pausemovetime = 9999
supermovetime = 9999

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(8521)
ID=8521
scale=.25+(.075*time),.25+(.075*time)
trans=addalpha
alpha=ceil(256-6.4*time),256

[State 8500, circle]
type=explod
trigger1=time=4
anim=8512
ID=85221
sprpriority=5
postype=p1
supermovetime=-1
pausemovetime = 9999
supermovetime = 9999

[State 8500, circle]
type=explod
trigger1=time=8
anim=8512
ID=85222
sprpriority=5
postype=p1
supermovetime=-1
pausemovetime = 9999
supermovetime = 9999

[State 8500, circle]
type=explod
trigger1=time=12
anim=8512
ID=85223
sprpriority=5
postype=p1
supermovetime=-1
pausemovetime = 9999
supermovetime = 9999

[State 8500, circle]
type=explod
trigger1=time=16
anim=8512
ID=85224
sprpriority=5
postype=p1
supermovetime=-1
pausemovetime = 9999
supermovetime = 9999

[State 8500, circle]
type=explod
trigger1=time=20
anim=8512
ID=85225
sprpriority=5
postype=p1
supermovetime=-1
pausemovetime = 9999
supermovetime = 9999

[State 8500, circle]
type=explod
trigger1=time=24
anim=8512
ID=85226
sprpriority=5
postype=p1
supermovetime=-1
pausemovetime = 9999
supermovetime = 9999

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85221)
ID=85221
scale=.25+((time-4)*.0313),.25+((time-4)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85222)
ID=85222
scale=.25+((time-8)*.0313),.25+((time-8)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85223)
ID=85223
scale=.25+((time-12)*.0313),.25+((time-12)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85224)
ID=85224
scale=.25+((time-16)*.0313),.25+((time-16)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85225)
ID=85225
scale=.25+((time-20)*.0313),.25+((time-20)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85226)
ID=85226
scale=.25+((time-24)*.0313),.25+((time-24)*.0313)

[State 8500, 変数増減] ;カットインA拡大率
Type = VarAdd
trigger1 = time >= 26
fvar(0) = 0.0175

[State 8500, エフェクト表示] ;カットインA
Type = Explod
trigger1 = root,stateno = 3600
trigger1 = ishelper(8500)
trigger1 = time = 0
anim = 8550
ID = 8550
scale = 0.50 + fvar(0), 0.50 + fvar(0)
pos = 0, 240
postype = back
sprpriority = -5
removetime = 50
removeongethit = 1
pausemovetime = 9999
supermovetime = 9999
ignorehitpause = 1
persistent = 0

[State 8500, エフェクト表示] ;カットインB炎
Type = Explod
trigger1 = root,stateno != 3600
trigger1 = ishelper(8500)
trigger1 = time = 0
anim = 8600
ID = 8550
scale = 0.50 + fvar(0), 0.50 + fvar(0)
pos = 0, 240
postype = back
sprpriority = -5
removetime = 50
removeongethit = 1
pausemovetime = 9999
supermovetime = 9999
ignorehitpause = 1
persistent = 0

[State 8500, エフェクト表示] ;カットインB
Type = Explod
trigger1 = root,stateno != 3600
trigger1 = ishelper(8500)
trigger1 = time = 0
anim = 8550
ID = 8550
scale = 0.50 + fvar(0), 0.50 + fvar(0)
pos = 0, 240
postype = back
sprpriority = -5
removetime = 50
removeongethit = 1
pausemovetime = 9999
supermovetime = 9999
ignorehitpause = 1
persistent = 0

[State 8500, エフェクト変更] ;カットイン拡大
Type = ModifyExplod
trigger1 = 1
ID = 8550
scale = 0.50+fvar(0), 0.50+fvar(0)
ignorehitpause = 1

[State 8500, safety]
type=removeexplod
trigger1=time>=(var(51)+1)

[State 8500, end]
type=destroyself
trigger1=time>=(var(51)+5)

;-------------------------------------------------------------------
;carga2
[Statedef 6030]
type=A
velset=0,0
anim=8520
sprpriority=5

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 8500
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 8501
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85021
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85022
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85023
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85024
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85025
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85026

[State 200:Playsnd avanicada]
type = playsnd
trigger1 = time = 0
value = 8500,0
channel = 15

[State 200:Playsnd avanicada]
type = playsnd
trigger1 = time = 10
value = 8500,1
channel = 16


[State 8500, assert]
type=assertspecial
trigger1=1
flag=noshadow

[State 8500, time]
type=varset
trigger1=!time
var(51)=40

[State 0, EnvColor]
type = BGPalFX
trigger1 = time = [0,25]
add = 0-(time*10),0-(time*10),0-(time*10)
time = 1
invertall = 0
ignorehitpause = 1

[State 0, EnvColor]
type = BGPalFX
trigger1 = time >= 26
add = -256,-256,-256
time = 2
invertall = 0
ignorehitpause = 1

[State 8500, rotate]
type=angleset
trigger1=!time
value=0

[State 8500, rotate]
type=angleadd
trigger1=1
value=-60

[State 8500, scale]
type=angledraw
trigger1=time<var(51)
scale=1.2-1.2*((time*1.0)/var(51)),1.2-1.2*((time*1.0)/var(51))

[State 8500, scale]
type=angledraw
trigger1=time>=var(51)
scale=0,0

[State 8500, trans]
type=trans
trigger1=1
trans=addalpha
alpha=256,256

[State 8500, circle]
type=explod
trigger1=!time
anim=8521
ID=8521
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(8521)
ID=8521
scale=.25+(.075*time),.25+(.075*time)
trans=addalpha
alpha=ceil(256-6.4*time),256

[State 8500, circle]
type=explod
trigger1=time=4
anim=8522
ID=85221
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, circle]
type=explod
trigger1=time=8
anim=8522
ID=85222
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, circle]
type=explod
trigger1=time=12
anim=8522
ID=85223
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, circle]
type=explod
trigger1=time=16
anim=8522
ID=85224
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, circle]
type=explod
trigger1=time=20
anim=8522
ID=85225
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, circle]
type=explod
trigger1=time=24
anim=8522
ID=85226
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85221)
ID=85221
scale=.25+((time-4)*.0313),.25+((time-4)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85222)
ID=85222
scale=.25+((time-8)*.0313),.25+((time-8)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85223)
ID=85223
scale=.25+((time-12)*.0313),.25+((time-12)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85224)
ID=85224
scale=.25+((time-16)*.0313),.25+((time-16)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85225)
ID=85225
scale=.25+((time-20)*.0313),.25+((time-20)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85226)
ID=85226
scale=.25+((time-24)*.0313),.25+((time-24)*.0313)

[State 8500, 変数増減] ;カットインA拡大率
Type = VarAdd
trigger1 = time >= 26
fvar(0) = 0.0175

[State 8500, エフェクト表示] ;カットインA
Type = Explod
trigger1 = root,stateno = 3600
trigger1 = ishelper(8500)
trigger1 = time = 0
anim = 8550
ID = 8550
scale = 0.50 + fvar(0), 0.50 + fvar(0)
pos = 0, 240
postype = back
sprpriority = -5
removetime = 50
removeongethit = 1
pausemovetime = 9999
supermovetime = 9999
ignorehitpause = 1
persistent = 0

[State 8500, エフェクト表示] ;カットインB炎
Type = Explod
trigger1 = root,stateno != 3600
trigger1 = ishelper(8500)
trigger1 = time = 0
anim = 8600
ID = 8550
scale = 0.50 + fvar(0), 0.50 + fvar(0)
pos = 0, 240
postype = back
sprpriority = -5
removetime = 50
removeongethit = 1
pausemovetime = 9999
supermovetime = 9999
ignorehitpause = 1
persistent = 0

[State 8500, エフェクト表示] ;カットインB
Type = Explod
trigger1 = root,stateno != 3600
trigger1 = ishelper(8500)
trigger1 = time = 0
anim = 8550
ID = 8550
scale = 0.50 + fvar(0), 0.50 + fvar(0)
pos = 0, 240
postype = back
sprpriority = -5
removetime = 50
removeongethit = 1
pausemovetime = 9999
supermovetime = 9999
ignorehitpause = 1
persistent = 0

[State 8500, エフェクト変更] ;カットイン拡大
Type = ModifyExplod
trigger1 = 1
ID = 8550
scale = 0.50+fvar(0), 0.50+fvar(0)
ignorehitpause = 1

[State 8500, safety]
type=removeexplod
trigger1=time>=(var(51)+1)

[State 8500, end]
type=destroyself
trigger1=time>=(var(51)+5)

;-------------------------------------------------------------------
;carga2
[Statedef 6040]
type=A
velset=0,0
anim=8530
sprpriority=5

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 8500
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 8501
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85021
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85022
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85023
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85024
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85025
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85026

[State 200:Playsnd avanicada]
type = playsnd
trigger1 = time = 0
value = 8500,0
channel = 15

[State 200:Playsnd avanicada]
type = playsnd
trigger1 = time = 10
value = 8500,2
channel = 16

[State 8500, assert]
type=assertspecial
trigger1=1
flag=noshadow

[State 8500, time]
type=varset
trigger1=!time
var(51)=40

[State 0, EnvColor]
type = BGPalFX
trigger1 = time = [0,25]
add = 0-(time*10),0-(time*10),0-(time*10)
time = 1
invertall = 0
ignorehitpause = 1

[State 0, EnvColor]
type = BGPalFX
trigger1 = time >= 26
add = -256,-256,-256
time = 2
invertall = 0
ignorehitpause = 1

[State 8500, rotate]
type=angleset
trigger1=!time
value=0

[State 8500, rotate]
type=angleadd
trigger1=1
value=-60

[State 8500, scale]
type=angledraw
trigger1=time<var(51)
scale=1.2-1.2*((time*1.0)/var(51)),1.2-1.2*((time*1.0)/var(51))

[State 8500, scale]
type=angledraw
trigger1=time>=var(51)
scale=0,0

[State 8500, trans]
type=trans
trigger1=1
trans=addalpha
alpha=256,256

[State 8500, circle]
type=explod
trigger1=!time
anim=8531
ID=8521
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(8521)
ID=8521
scale=.25+(.075*time),.25+(.075*time)
trans=addalpha
alpha=ceil(256-6.4*time),256

[State 8500, circle]
type=explod
trigger1=time=4
anim=8532
ID=85221
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, circle]
type=explod
trigger1=time=8
anim=8532
ID=85222
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, circle]
type=explod
trigger1=time=12
anim=8532
ID=85223
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, circle]
type=explod
trigger1=time=16
anim=8532
ID=85224
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, circle]
type=explod
trigger1=time=20
anim=8532
ID=85225
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, circle]
type=explod
trigger1=time=24
anim=8532
ID=85226
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85221)
ID=85221
scale=.25+((time-4)*.0313),.25+((time-4)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85222)
ID=85222
scale=.25+((time-8)*.0313),.25+((time-8)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85223)
ID=85223
scale=.25+((time-12)*.0313),.25+((time-12)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85224)
ID=85224
scale=.25+((time-16)*.0313),.25+((time-16)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85225)
ID=85225
scale=.25+((time-20)*.0313),.25+((time-20)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85226)
ID=85226
scale=.25+((time-24)*.0313),.25+((time-24)*.0313)

[State 8500, 変数増減] ;カットインA拡大率
Type = VarAdd
trigger1 = time >= 26
fvar(0) = 0.0175

[State 8500, エフェクト表示] ;カットインA
Type = Explod
trigger1 = root,stateno = 3600
trigger1 = ishelper(8500)
trigger1 = time = 0
anim = 8550
ID = 8550
scale = 0.50 + fvar(0), 0.50 + fvar(0)
pos = 0, 240
postype = back
sprpriority = -5
removetime = 50
removeongethit = 1
pausemovetime = 9999
supermovetime = 9999
ignorehitpause = 1
persistent = 0

[State 8500, エフェクト表示] ;カットインB炎
Type = Explod
trigger1 = root,stateno != 3600
trigger1 = ishelper(8500)
trigger1 = time = 0
anim = 8600
ID = 8550
scale = 0.50 + fvar(0), 0.50 + fvar(0)
pos = 0, 240
postype = back
sprpriority = -5
removetime = 50
removeongethit = 1
pausemovetime = 9999
supermovetime = 9999
ignorehitpause = 1
persistent = 0

[State 8500, エフェクト表示] ;カットインB
Type = Explod
trigger1 = root,stateno != 3600
trigger1 = ishelper(8500)
trigger1 = time = 0
anim = 8550
ID = 8550
scale = 0.50 + fvar(0), 0.50 + fvar(0)
pos = 0, 240
postype = back
sprpriority = -5
removetime = 50
removeongethit = 1
pausemovetime = 9999
supermovetime = 9999
ignorehitpause = 1
persistent = 0

[State 8500, エフェクト変更] ;カットイン拡大
Type = ModifyExplod
trigger1 = 1
ID = 8550
scale = 0.50+fvar(0), 0.50+fvar(0)
ignorehitpause = 1

[State 8500, safety]
type=removeexplod
trigger1=time>=(var(51)+1)

[State 8500, end]
type=destroyself
trigger1=time>=(var(51)+5)

;-------------------------------------------------------------------
;carga2
[Statedef 6050]
type=A
velset=0,0
anim=8540
sprpriority=5

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 8500
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 8501
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85021
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85022
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85023
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85024
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85025
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 1
id = 85026

[State 200:Playsnd avanicada]
type = playsnd
trigger1 = time = 0
value = 8500,3
channel = 15

[State 8500, assert]
type=assertspecial
trigger1=1
flag=noshadow

[State 8500, time]
type=varset
trigger1=!time
var(51)=40

[State 0, EnvColor]
type = BGPalFX
trigger1 = time = [0,25]
add = 0-(time*10),0-(time*10),0-(time*10)
time = 1
invertall = 0
ignorehitpause = 1

[State 0, EnvColor]
type = BGPalFX
trigger1 = time >= 26
add = -256,-256,-256
time = 2
invertall = 0
ignorehitpause = 1

[State 8500, rotate]
type=angleset
trigger1=!time
value=0

[State 8500, rotate]
type=angleadd
trigger1=1
value=-60

[State 8500, scale]
type=angledraw
trigger1=time<var(51)
scale=1.2-1.2*((time*1.0)/var(51)),1.2-1.2*((time*1.0)/var(51))

[State 8500, scale]
type=angledraw
trigger1=time>=var(51)
scale=0,0

[State 8500, trans]
type=trans
trigger1=1
trans=addalpha
alpha=256,256

[State 8500, circle]
type=explod
trigger1=!time
anim=8541
ID=8521
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(8521)
ID=8521
scale=.25+(.075*time),.25+(.075*time)
trans=addalpha
alpha=ceil(256-6.4*time),256

[State 8500, circle]
type=explod
trigger1=time=4
anim=8542
ID=85221
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, circle]
type=explod
trigger1=time=8
anim=8542
ID=85222
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, circle]
type=explod
trigger1=time=12
anim=8542
ID=85223
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, circle]
type=explod
trigger1=time=16
anim=8542
ID=85224
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, circle]
type=explod
trigger1=time=20
anim=8542
ID=85225
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, circle]
type=explod
trigger1=time=24
anim=8542
ID=85226
sprpriority=5
postype=p1
supermovetime=-1

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85221)
ID=85221
scale=.25+((time-4)*.0313),.25+((time-4)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85222)
ID=85222
scale=.25+((time-8)*.0313),.25+((time-8)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85223)
ID=85223
scale=.25+((time-12)*.0313),.25+((time-12)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85224)
ID=85224
scale=.25+((time-16)*.0313),.25+((time-16)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85225)
ID=85225
scale=.25+((time-20)*.0313),.25+((time-20)*.0313)

[State 8500, scale]
type=modifyexplod
trigger1=numexplod(85226)
ID=85226
scale=.25+((time-24)*.0313),.25+((time-24)*.0313)

[State 8500, 変数増減] ;カットインA拡大率
Type = VarAdd
trigger1 = time >= 26
fvar(0) = 0.0175

[State 8500, エフェクト表示] ;カットインA
Type = null;;Explod
trigger1 = root,stateno = 3600
trigger1 = ishelper(8500)
trigger1 = time = 0
anim = 8550
ID = 8550
scale = 0.50 + fvar(0), 0.50 + fvar(0)
pos = 0, 240
postype = back
sprpriority = -5
removetime = 50
removeongethit = 1
pausemovetime = 9999
supermovetime = 9999
ignorehitpause = 1
persistent = 0

[State 8500, エフェクト表示] ;カットインB炎
Type = null;;Explod
trigger1 = root,stateno != 3600
trigger1 = ishelper(8500)
trigger1 = time = 0
anim = 8600
ID = 8550
scale = 0.50 + fvar(0), 0.50 + fvar(0)
pos = 0, 240
postype = back
sprpriority = -5
removetime = 50
removeongethit = 1
pausemovetime = 9999
supermovetime = 9999
ignorehitpause = 1
persistent = 0

[State 8500, エフェクト表示] ;カットインB
Type = null;;;Explod
trigger1 = root,stateno != 3600
trigger1 = ishelper(8500)
trigger1 = time = 0
anim = 8550
ID = 8550
scale = 0.50 + fvar(0), 0.50 + fvar(0)
pos = 0, 240
postype = back
sprpriority = -5
removetime = 50
removeongethit = 1
pausemovetime = 9999
supermovetime = 9999
ignorehitpause = 1
persistent = 0

[State 8500, エフェクト変更] ;カットイン拡大
Type = ModifyExplod
trigger1 = 1
ID = 8550
scale = 0.50+fvar(0), 0.50+fvar(0)
ignorehitpause = 1

[State 8500, safety]
type=removeexplod
trigger1=time>=(var(51)+1)

[State 8500, end]
type=destroyself
trigger1=time>=(var(51)+5)
