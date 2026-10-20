;※構成メモ
;マジカルシュートＲ　弾
;1200
;1205
;1210

;未実装
;マジカルシュートＳ《スフィア》
;1220
;1225
;1230

;パニエロケット
;1250-56
;1260-66
;1270-76

;====================================================================
;マジカルシュート《ラピッド》
;====================================================================
;---------------------------------------------------------------------------
;ＭＳラピッド弱
[Statedef 1200]
type    = S
movetype= A
physics = S
juggle  = 2
poweradd= 20
velset = 0,0
anim = 1200
ctrl = 0
sprpriority = 2

[State 1200,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State 1200,snd]
type = PlaySnd
trigger1 = Animelemtime(7) = 1
trigger2 = Animelemtime(13) = 1
trigger3 = Animelemtime(19) = 1
trigger4 = Animelemtime(25) = 1
trigger5 = Animelemtime(31) = 1
value = s0,7
volume = 200

[State 1200,0]
type = VelSet
trigger1 = Animelem = 1 
x = 0
y = 0

;演出用エフェクト
[State 1000,1]
type = helper
trigger1 = AnimElem = 1
trigger1 = numhelper(380) = 0
helpertype = normal
neme = "Mahoujin_1"
ID = 380
pos = 0,0
postype = p1
stateno = 300;魔法陣出現
keyctrl = 0
persistent = 0
size.xscale =0.6
size.yscale =0.6

;三本目
[State 200, 1]
type = Projectile
trigger1 = Animelemtime(7) = 1
trigger2 = Animelemtime(13) = 1
trigger3 = Animelemtime(19) = 1;で出現
trigger4 = Animelemtime(25) = 1
projanim = 1201
projhitanim = 1202
projremanim = 1201
projID = 1200
offset = 0,0;50, -69
velocity = 0,0;6, 0
projremovetime = 10
attr = A, NP
animtype  = Hard
getpower = 15,7
givepower = 20,10
damage    = ifelse(var(51)= 0,20,10+(var(52)*10)),1;ifelse(var(31)+var(34), ceil(98*1.25), 98), 6
guardflag = MA
hitflag = MAF
pausetime = 8,10
sparkno = -1;3
guard.sparkno = -1;40;s306
sparkky = 50,-70
hitsound   = s5,4
guardsound = s6,0
ground.type = High
ground.slidetime = 14;21
ground.hittime  = 20;30
ground.velocity = -.5;-8
airguard.velocity = -4.5      
air.velocity = -1.0,-5.5;-3.5,-5.5
air.juggle = 1

;五本目
[State 200, 1]
type = Projectile
trigger1 = Animelemtime(31) = 1;で出現
projanim = 1201
projhitanim = 1202
projremanim = 1201
projID = 1201
offset = 0,-5;50, -69
velocity = 0,0;6, 0
projremovetime = 10
attr = A, NP
animtype  = Hard
getpower = 15,7
givepower = 20,10
damage    = ifelse(var(51)= 0,20,10+(var(52)*10)),1;ifelse(var(31)+var(34), ceil(98*1.25), 98), 6
guardflag = MA
hitflag = MAF
pausetime = 10,12
sparkno = -1;3
sparkky = -10,-70
guard.sparkno = -1;40;s306
hitsound   = s5,4
guardsound = s6,0
ground.type = High
ground.slidetime = 14;21
ground.hittime  = 20;30
ground.velocity = -3,-7
airguard.velocity = -4.5      
air.velocity = -3.5,-6.5
air.juggle = 3
fall = 1
air.recover = 0

[State 1200, 7]
type = GameMakeAnim
trigger1 = ProjHit1200 = 1
trigger2 = ProjHit1201 = 1
value = 3
pos = 50,-70
under = 0
[State 1200, 7]
type = GameMakeAnim
trigger1 = ProjGuardedTime(1200) = 1
trigger2 = ProjGuardedTime(1201) = 1
value = 40
pos = 50,-70
under = 0

[State 1200,2]
type = Explod
trigger1 = Animelemtime(7) = 1
anim = 321
id = 1200
postype = p1
pos = 16,-69
vel = 7,7
ownpal = 0
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = 1
sprpriority = 4
removetime = 10
;ignorehitpause = 1

[State 1200,2]
type = Explod
trigger1 = Animelemtime(13) = 1
anim = 311
id = 1200
postype = p1
pos = 21,-69
vel = 8,6
ownpal = 0
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = 1
sprpriority = 4
removetime = 10
;ignorehitpause = 1

[State 1200,2]
type = Explod
trigger1 = Animelemtime(19) = 1
trigger2 = Animelemtime(31) = 1
anim = 301
id = 1200
postype = p1
pos = 26,-69
vel = 10,0
ownpal = 0
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = 1
sprpriority = 4
removetime = 10
;ignorehitpause = 1

[State 1200,2]
type = Explod
trigger1 = Animelemtime(25) = 1
anim = 326
id = 1200
postype = p1
pos = 16,-72
vel = 7,-7
ownpal = 0
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = 1
sprpriority = 4
removetime = 10
;ignorehitpause = 1

;ヒットした場合、近くに引き寄せる効果。
[State 1200,引き寄せ]
type = TargetBind
trigger1 = ProjHitTime1200 = 1
pos = 50,0
time = 1


[State 1200,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;ＭＳラピッド中
[Statedef 1205]
type    = S
movetype= A
physics = S
juggle  = 2
poweradd= 20
velset = 0,0
anim = 1205
ctrl = 0
sprpriority = 2

[State 1205,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State 1205,snd]
type = PlaySnd
trigger1 = Animelemtime(7) = 1
trigger2 = Animelemtime(13) = 1
trigger3 = Animelemtime(19) = 1
trigger4 = Animelemtime(25) = 1
trigger5 = Animelemtime(31) = 1
trigger6 = Animelemtime(37) = 1
trigger7 = Animelemtime(43) = 1
trigger8 = Animelemtime(49) = 1
trigger9 = Animelemtime(55) = 1
value = s0,7
volume = 200

[State 1205,0]
type = VelSet
trigger1 = Animelem = 1 
x = 0
y = 0

;演出用エフェクト
[State 1000,1]
type = helper
trigger1 = AnimElem = 1
trigger1 = numhelper(380) = 0
helpertype = normal
neme = "Mahoujin_1"
ID = 380
pos = 0,0
postype = p1
stateno = 300;魔法陣出現
keyctrl = 0
persistent = 0
size.xscale =0.6
size.yscale =0.6

;三本目
[State 1205, 1]
type = Projectile
trigger1 = Animelemtime(7) = 1
trigger2 = Animelemtime(13) = 1
trigger3 = Animelemtime(19) = 1;で出現
trigger4 = Animelemtime(25) = 1

trigger5 = Animelemtime(31) = 1
trigger6 = Animelemtime(37) = 1
trigger7 = Animelemtime(43) = 1
trigger8 = Animelemtime(49) = 1
projanim = 1201
projhitanim = 1202
projremanim = 1201
projID = 1205
offset = 0,0
velocity = 0,0
projremovetime = 10
attr = A, NP
animtype  = Hard
getpower = 15,7
givepower = 20,10
damage    = ifelse(var(51)= 0,15,5+(var(52)*10)),1;ifelse(var(31)+var(34), ceil(98*1.25), 98), 6
guardflag = MA
hitflag = MAF
pausetime = 8,10
sparkno = -1;3
guard.sparkno = -1;40;s306
sparkky = 50,-70
hitsound   = s5,4
guardsound = s6,0
ground.type = High
ground.slidetime = 14;21
ground.hittime  = 20;30
ground.velocity = -.5;-8
airguard.velocity = -4.5      
air.velocity = -1.0,-5.5;-3.5,-5.5
air.juggle = 1

;五本目
[State 1205, 1]
type = Projectile
trigger1 = Animelemtime(55) = 1;で出現
projanim = 1201
projhitanim = 1202
projremanim = 1201
projID = 1206
offset = 0,-5;50, -69
velocity = 0,0;6, 0
projremovetime = 10
attr = A, NP
animtype  = Hard
getpower = 15,7
givepower = 20,10
damage    = ifelse(var(51)= 0,20,10+(var(52)*10)),1;ifelse(var(31)+var(34), ceil(98*1.25), 98), 6
guardflag = MA
hitflag = MAF
pausetime = 10,12
sparkno = -1;3
sparkky = -10,-70
guard.sparkno = -1;40;s306
hitsound   = s5,4
guardsound = s6,0
ground.type = High
ground.slidetime = 14;21
ground.hittime  = 20;30
ground.velocity = -3,-7
airguard.velocity = -4.5      
air.velocity = -3.5,-6.5
air.juggle = 3
fall = 1
air.recover = 0

[State 1205, 7]
type = GameMakeAnim
trigger1 = ProjHit1205 = 1
trigger2 = ProjHit1206 = 1
value = 3
pos = 50,-70
under = 0

[State 1205, 7]
type = GameMakeAnim
trigger1 = ProjGuardedTime(1205) = 1
trigger2 = ProjGuardedTime(1206) = 1
value = 40
pos = 50,-70
under = 0

[State 1205,2]
type = Explod
trigger1 = Animelemtime(7) = 1
trigger2 = Animelemtime(43) = 1
anim = 321
id = 1200
postype = p1
pos = 16,-69
vel = 7,7
ownpal = 0
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = 1
sprpriority = 4
removetime = 10
;ignorehitpause = 1

[State 1205,2]
type = Explod
trigger1 = Animelemtime(13) = 1
trigger2 = Animelemtime(37) = 1
trigger3 = Animelemtime(49) = 1
anim = 311
id = 1200
postype = p1
pos = 21,-69
vel = 8,6
ownpal = 0
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = 1
sprpriority = 4
removetime = 10
;ignorehitpause = 1

[State 1205,2]
type = Explod
trigger1 = Animelemtime(19) = 1
trigger2 = Animelemtime(31) = 1
trigger3 = Animelemtime(55) = 1
anim = 301
id = 1200
postype = p1
pos = 26,-69
vel = 10,0
ownpal = 0
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = 1
sprpriority = 4
removetime = 10
;ignorehitpause = 1

[State 1205,2]
type = Explod
trigger1 = Animelemtime(25) = 1
anim = 326
id = 1200
postype = p1
pos = 16,-72
vel = 7,-7
ownpal = 0
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = 1
sprpriority = 4
removetime = 10
;ignorehitpause = 1

;ヒットした場合、近くに引き寄せる効果。
[State 1205,引き寄せ]
type = TargetBind
trigger1 = ProjHitTime1205 = 1
pos = 50,0
time = 1


[State 1205,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;ＭＳラピッド強
[Statedef 1210]
type    = S
movetype= A
physics = S
juggle  = 2
poweradd= 20
velset = 0,0
anim = 1210
ctrl = 0
sprpriority = 2

[State 1210,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State 1210,snd]
type = PlaySnd
trigger1 = Animelemtime(7) = 1
trigger2 = Animelemtime(13) = 1
trigger3 = Animelemtime(19) = 1
trigger4 = Animelemtime(25) = 1
trigger5 = Animelemtime(31) = 1
trigger6 = Animelemtime(37) = 1
trigger7 = Animelemtime(43) = 1
trigger8 = Animelemtime(49) = 1
trigger9 = Animelemtime(55) = 1
trigger10 = Animelemtime(61) = 1
trigger11 = Animelemtime(67) = 1
trigger12 = Animelemtime(73) = 1
trigger13 = Animelemtime(79) = 1
value = s0,7
volume = 200

[State 1210,0]
type = VelSet
trigger1 = Animelem = 1 
x = 0
y = 0

;演出用エフェクト
[State 1210,1]
type = helper
trigger1 = AnimElem = 1
trigger1 = numhelper(380) = 0
helpertype = normal
neme = "Mahoujin_1"
ID = 380
pos = 0,0
postype = p1
stateno = 300;魔法陣出現
keyctrl = 0
persistent = 0
size.xscale =0.6
size.yscale =0.6

;三本目
[State 1210, 1]
type = Projectile
trigger1 = Animelemtime(7) = 1
trigger2 = Animelemtime(13) = 1
trigger3 = Animelemtime(19) = 1;で出現
trigger4 = Animelemtime(25) = 1

trigger5 = Animelemtime(31) = 1
trigger6 = Animelemtime(37) = 1
trigger7 = Animelemtime(43) = 1
trigger8 = Animelemtime(49) = 1

trigger9 = Animelemtime(55) = 1
trigger10 = Animelemtime(61) = 1
trigger11 = Animelemtime(67) = 1
trigger12 = Animelemtime(73) = 1
projanim = 1201
projhitanim = 1202
projremanim = 1201
projID = 1210
offset = 0,0
velocity = 0,0
projremovetime = 10
attr = A, NP
animtype  = Hard
getpower = 15,7
givepower = 20,10
damage    = ifelse(var(51)= 0,12,2+(var(52)*10)),1;ifelse(var(31)+var(34), ceil(98*1.25), 98), 6
guardflag = MA
hitflag = MAF
pausetime = 8,10
sparkno = -1;3
guard.sparkno = -1;40;s306
sparkky = 50,-70
hitsound   = s5,4
guardsound = s6,0
ground.type = High
ground.slidetime = 14;21
ground.hittime  = 20;30
ground.velocity = -.5;-8
airguard.velocity = -4.5      
air.velocity = -1.0,-5.5;-3.5,-5.5
air.juggle = 1

;五本目
[State 1210, 1]
type = Projectile
trigger1 = Animelemtime(79) = 1;で出現
projanim = 1201
projhitanim = 1202
projremanim = 1201
projID = 1211
offset = 0,-5;50, -69
velocity = 0,0;6, 0
projremovetime = 10
attr = A, NP
animtype  = Hard
getpower = 15,7
givepower = 20,10
damage    = ifelse(var(51)= 0,20,10+(var(52)*10)),1;ifelse(var(31)+var(34), ceil(98*1.25), 98), 6
guardflag = MA
hitflag = MAF
pausetime = 10,12
sparkno = -1;3
sparkky = -10,-70
guard.sparkno = -1;40;s306
hitsound   = s5,4
guardsound = s6,0
ground.type = High
ground.slidetime = 14;21
ground.hittime  = 20;30
ground.velocity = -3,-7
airguard.velocity = -4.5      
air.velocity = -3.5,-6.5
air.juggle = 3
fall = 1
air.recover = 0

[State 1210, 7]
type = GameMakeAnim
trigger1 = ProjHit1210 = 1
trigger2 = ProjHit1211 = 1
value = 3
pos = 50,-70
under = 0

[State 1210, 7]
type = GameMakeAnim
trigger1 = ProjGuardedTime(1210) = 1
trigger2 = ProjGuardedTime(1211) = 1
value = 40
pos = 50,-70
under = 0

[State 1210,2]
type = Explod
trigger1 = Animelemtime(7) = 1
trigger2 = Animelemtime(43) = 1
;trigger3 = Animelemtime(69) = 1
anim = 321
id = 1200
postype = p1
pos = 16,-69
vel = 7,7
ownpal = 0
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = 1
sprpriority = 4
removetime = 10
;ignorehitpause = 1

[State 1210,2]
type = Explod
trigger1 = Animelemtime(13) = 1
trigger2 = Animelemtime(37) = 1
trigger3 = Animelemtime(49) = 1
trigger4 = Animelemtime(73) = 1
anim = 311
id = 1200
postype = p1
pos = 21,-69
vel = 8,6
ownpal = 0
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = 1
sprpriority = 4
removetime = 10
;ignorehitpause = 1

[State 1210,2]
type = Explod
trigger1 = Animelemtime(19) = 1
trigger2 = Animelemtime(31) = 1
trigger3 = Animelemtime(55) = 1
trigger4 = Animelemtime(67) = 1
trigger5 = Animelemtime(79) = 1
anim = 301
id = 1200
postype = p1
pos = 26,-69
vel = 10,0
ownpal = 0
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = 1
sprpriority = 4
removetime = 10
;ignorehitpause = 1

[State 1210,2]
type = Explod
trigger1 = Animelemtime(25) = 1
trigger2 = Animelemtime(61) = 1
anim = 326
id = 1200
postype = p1
pos = 16,-72
vel = 7,-7
ownpal = 0
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = 1
sprpriority = 4
removetime = 10
;ignorehitpause = 1

;ヒットした場合、近くに引き寄せる効果。
[State 1210,引き寄せ]
type = TargetBind
trigger1 = ProjHitTime1210 = 1
pos = 50,0
time = 1

[State 1210,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;====================================================================
;マジカルシュート《スフィア》
;====================================================================
;--------------------------------------------------------------------
[Statedef 1220]
type    = A
movetype= A
physics = N
juggle  = 2
poweradd= 20
velset = 0,0
anim = 1220
ctrl = 0
sprpriority = 2

[State 1200,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State 1200,snd]
type = PlaySnd
trigger1 = Animelemtime(7) = 1
trigger2 = Animelemtime(13) = 1
trigger3 = Animelemtime(19) = 1
trigger4 = Animelemtime(25) = 1
trigger5 = Animelemtime(31) = 1
value = s0,7
volume = 200

;演出用エフェクト
[State 1000,1]
type = helper
trigger1 = AnimElem = 1
trigger1 = numhelper(380) = 0
helpertype = normal
neme = "Mahoujin_1"
ID = 380
pos = 0,0
postype = p1
stateno = 300;魔法陣出現
keyctrl = 0
persistent = 0
size.xscale =0.6
size.yscale =0.6

;飛び道具
[State 1250,3]
type = helper
trigger1 = numhelper(1220) = 0
trigger1 = AnimElemtime(4) = 0
helpertype = normal
neme = "Sphere"
ID = 1220
pos = 15,-50
postype = p1
stateno = 1221
keyctrl = 0
persistent = 0
size.xscale =0.5
size.yscale =0.5

[State 1220,2]
type = Explod
triggerall = numexplod(1222) = 0
trigger1 = animelemtime(4) = 0
anim = 1223
id = 1222
postype = p1
pos = 25,-50
vel = 0,0
ownpal = 0
;ontop = 1
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = -1
sprpriority = 4
removetime = 40
ignorehitpause = 1

[State 1200,4]
type = velset
trigger1 = time = 0
x = 2
y = -1

[State 1220,5]
type = veladd
trigger1 = time > 0
y = 0.08

[State 1200,3];
type = ChangeState
trigger1 = Time > 40
trigger1 = numhelper(1220) = 0
value = 1222;47
ctrl = 1

[State 1022,4]
type = ChangeState
;trigger1 = AnimTime = 0
trigger1 = Pos Y >= 0
trigger1 = vel Y > 0
value = 1223

;---------------------------------------------------------------------------
;マジカルシュート（球）
[Statedef 1221]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 1221
ctrl = 0
sprpriority = 3

[State 1221, 0]
type = BindToRoot
trigger1 = 1
time = 1
pos = 15,-50

[State 1221,angle1]
type = AngleSet
trigger1 = helper(1220),time >= 0
value = -30

[State 1221,angle2]
type = AngleDraw
trigger1 = helper(1220),time >= 0

[State 1221,透過]
type = Trans
trigger1 = 1;time < 256
trans = addalpha
alpha = 210,250;AS210(明るさ),D250（半透明率）

[State 1221,1] 
type = HitDef
triggerall = helper(1220),anim = 1221
trigger1 = helper(1220),animelem = 1
trigger2 = helper(1220),animelem = 5
trigger3 = helper(1220),animelem = 10
trigger4 = helper(1220),animelem = 15
trigger5 = helper(1220),animelem = 20
trigger6 = helper(1220),animelem = 25
trigger7 = helper(1220),animelem = 30
trigger8 = helper(1220),animelem = 35
;trigger9 =
;trigger10 =
attr = S, SP
animtype  = Hard
damage    = ifelse(root,var(51)= 0,10,5+(root,var(52)*10)), 2
getpower = 30,15
priority  = 3
guardflag = MA
pausetime = 1,2
sparkxy = -60,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 22
ground.hittime  = 25
ground.velocity = -3,.5
air.velocity = -2.5,-.5
sparkno = 3;s300

[State 1100,2]
type = Explod
triggerall = numexplod(1001) = 0
trigger1 = movehit = 1
anim = 351
id = 1001
postype = p1
pos = 0,0
vel = 0,0
ownpal = 0
;ontop = 1
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = -1
sprpriority = 4
removetime = 14
ignorehitpause = 1

[State 1221,3]
type = ChangeAnim
triggerall = helper(1220),anim = 1221
trigger1 = helper(1220),animtime = 0
trigger2 = helper(1220),pos Y >= 0
value = 1222

[State 1001,4]
type = DestroySelf
trigger1 = helper(1220),anim = 1222
trigger1 = helper(1220),animtime = 0;time = 90
trigger2 = helper(1220),movetype = h;movecontact = 1


;落下
[Statedef 1222]
type    = A
movetype= A
physics = A
juggle  = 0
poweradd= 0
anim = 1021
ctrl = 0
sprpriority = 3

[State 1022,0]
type = VelSet
trigger1 = time = 0
y = 3

[State 1022,4]
type = ChangeState
;trigger1 = AnimTime = 0
trigger1 = Pos Y >= 0
trigger1 = vel Y > 0
value = 1223

;着地部分
[Statedef 1223]
type    = S
movetype= A
physics = N
juggle  = 0
poweradd= 0
anim = 47
ctrl = 0
sprpriority = 3

[State 1023,0]
type = VelSet
trigger1 = time = 0
y = 0

[State 1023,1]
type = PosSet
trigger1 = time = 0
y = 0


[State 1023,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1




;--------------------------------------------------------------------
;マイカルシュート・スフィア　中
[Statedef 1225]
type    = A
movetype= A
physics = N
juggle  = 2
poweradd= 20
velset = 0,0
anim = 1225
ctrl = 0
sprpriority = 2

[State 1225,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State 1225,snd]
type = PlaySnd
trigger1 = Animelemtime(7) = 1
trigger2 = Animelemtime(13) = 1
trigger3 = Animelemtime(19) = 1
trigger4 = Animelemtime(25) = 1
trigger5 = Animelemtime(31) = 1
value = s0,7
volume = 200

;演出用エフェクト
[State 1025,1]
type = helper
trigger1 = AnimElem = 1
trigger1 = numhelper(380) = 0
helpertype = normal
neme = "Mahoujin_1"
ID = 380
pos = 0,0
postype = p1
stateno = 300;魔法陣出現
keyctrl = 0
persistent = 0
size.xscale =0.6
size.yscale =0.6

;飛び道具
[State 1225,3]
type = helper
trigger1 = numhelper(1225) = 0
trigger1 = AnimElemtime(4) = 0
helpertype = normal
neme = "Sphere"
ID = 1225
pos = 15,-50
postype = p1
stateno = 1226
keyctrl = 0
persistent = 0
size.xscale =0.5
size.yscale =0.5

[State 1225,2]
type = Explod
triggerall = numexplod(1222) = 0
trigger1 = animelemtime(4) = 0
anim = 1223
id = 1222
postype = p1
pos = 25,-50
vel = 0,0
ownpal = 0
;ontop = 1
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = -1
sprpriority = 4
removetime = 40
ignorehitpause = 1

[State 1225,4]
type = velset
trigger1 = time = 0
x = 2
y = -2

[State 1225,5]
type = veladd
trigger1 = time > 0
y = 0.08

[State 1225,3];
type = ChangeState
trigger1 = Time > 50
trigger1 = numhelper(1220) = 0
value = 1222;47
ctrl = 1

[State 1225,4]
type = ChangeState
;trigger1 = AnimTime = 0
trigger1 = Pos Y >= 0
trigger1 = vel Y > 0
value = 1223



;---------------------------------------------------------------------------
;マジカルシュート（球）2
[Statedef 1226]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 1226
ctrl = 0
sprpriority = 3

[State 1226,0]
type = BindToRoot
trigger1 = 1
time = 1
pos = 15,-50

[State 1226,angle1]
type = AngleSet
trigger1 = helper(1225),time >= 0
value = -30

[State 1226,angle2]
type = AngleDraw
trigger1 = helper(1225),time >= 0

[State 1226,透過]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 210,250;AS210(明るさ),D250（半透明率）

[State 1226,1] 
type = HitDef
triggerall = helper(1225),anim = 1226
trigger1 = helper(1225),animelem = 1
trigger2 = helper(1225),animelem = 5
trigger3 = helper(1225),animelem = 10
trigger4 = helper(1225),animelem = 15
trigger5 = helper(1225),animelem = 20
trigger6 = helper(1225),animelem = 25
trigger7 = helper(1225),animelem = 30
trigger8 = helper(1225),animelem = 35
trigger9 = helper(1225),animelem = 40
trigger10 = helper(1225),animelem = 45
trigger11 = helper(1225),animelem = 50
attr = S, SP
animtype  = Hard
damage    = ifelse(root,var(51)= 0,10,5+(root,var(52)*10)), 2
getpower = 30,15
priority  = 3
guardflag = MA
pausetime = 1,2
sparkxy = -60,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 22
ground.hittime  = 25
ground.velocity = -3,.5
air.velocity = -2.5,-.5
sparkno = 3;s300

[State 1226,2]
type = Explod
triggerall = numexplod(1001) = 0
trigger1 = movehit = 1
anim = 351
id = 1001
postype = p1
pos = 0,0
vel = 0,0
ownpal = 0
;ontop = 1
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = -1
sprpriority = 4
removetime = 14
ignorehitpause = 1

[State 1226,3]
type = ChangeAnim
triggerall = helper(1225),anim = 1226
trigger1 = helper(1225),animtime = 0
trigger2 = helper(1225),pos Y >= 0
value = 1222

[State 1226,4]
type = DestroySelf
trigger1 = helper(1225),anim = 1222;
trigger1 = helper(1225),animtime = 0;time = 90
trigger2 = helper(1225),movetype = h;movecontact = 1

;--------------------------------------------------------------------
;マイカルシュート・スフィア　強
[Statedef 1230]
type    = A
movetype= A
physics = N
juggle  = 2
poweradd= 20
velset = 0,0
anim = 1225
ctrl = 0
sprpriority = 2

[State 1230,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State 1230,snd]
type = PlaySnd
trigger1 = Animelemtime(7) = 1
trigger2 = Animelemtime(13) = 1
trigger3 = Animelemtime(19) = 1
trigger4 = Animelemtime(25) = 1
trigger5 = Animelemtime(31) = 1
value = s0,7
volume = 200

;演出用エフェクト
[State 1030,1]
type = helper
trigger1 = AnimElem = 1
trigger1 = numhelper(380) = 0
helpertype = normal
neme = "Mahoujin_1"
ID = 380
pos = 0,0
postype = p1
stateno = 300;魔法陣出現
keyctrl = 0
persistent = 0
size.xscale =0.6
size.yscale =0.6

;飛び道具
[State 1230,3]
type = helper
trigger1 = numhelper(1230) = 0
trigger1 = AnimElemtime(4) = 0
helpertype = normal
neme = "Sphere"
ID = 1230
pos = 15,-50
postype = p1
stateno = 1231
keyctrl = 0
persistent = 0
size.xscale =0.5
size.yscale =0.5

[State 1230,2]
type = Explod
triggerall = numexplod(1222) = 0
trigger1 = animelemtime(4) = 0
anim = 1223
id = 1222
postype = p1
pos = 25,-50
vel = 0,0
ownpal = 0
;ontop = 1
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = -1
sprpriority = 4
removetime = 70;40
ignorehitpause = 1

[State 1230,4]
type = velset
trigger1 = time = 0
x = 2
y = -2.5

[State 1230,5]
type = veladd
trigger1 = time > 0
y = 0.06

[State 1230,3];
type = ChangeState
trigger1 = Time > 70;40;50
trigger1 = numhelper(1220) = 0
value = 1222;47
ctrl = 1

[State 1230,4]
type = ChangeState
;trigger1 = AnimTime = 0
trigger1 = Pos Y >= 0
trigger1 = vel Y > 0
value = 1223

;---------------------------------------------------------------------------
;マジカルシュート（球）2
[Statedef 1231]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 1231
ctrl = 0
sprpriority = 3

[State 1231,0]
type = BindToRoot
trigger1 = 1
time = 1
pos = 15,-50

[State 1231,angle1]
type = AngleSet
trigger1 = helper(1230),time >= 0
value = -30

[State 1231,angle2]
type = AngleDraw
trigger1 = helper(1230),time >= 0

[State 1231,透過]
type = Trans
trigger1 = 1;time < 256
trans = addalpha
alpha = 210,250;AS210(明るさ),D250（半透明率）

[State 1231,1] 
type = HitDef
triggerall = helper(1230),anim = 1226;消滅時のアニメの時はヒットしない。
trigger1 = helper(1230),animelem = 1
trigger2 = helper(1230),animelem = 5
trigger3 = helper(1230),animelem = 10
trigger4 = helper(1230),animelem = 15
trigger5 = helper(1230),animelem = 20
trigger6 = helper(1230),animelem = 25
trigger7 = helper(1230),animelem = 30
trigger8 = helper(1230),animelem = 35
trigger9 = helper(1230),animelem = 40
trigger10 = helper(1230),animelem = 45
trigger11 = helper(1230),animelem = 50
trigger12 = helper(1230),animelem = 55
trigger13 = helper(1230),animelem = 60
trigger14 = helper(1230),animelem = 65
attr = S, SP
animtype  = Hard
damage    = ifelse(root,var(51)= 0,10,5+(root,var(52)*10)), 2
getpower = 30,15
priority  = 3
guardflag = MA
pausetime = 1,2
sparkxy = -60,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 22
ground.hittime  = 25
ground.velocity = -3,.5
air.velocity = -2.5,-.5
sparkno = 3;s300

[State 1231,2]
type = Explod
triggerall = numexplod(1001) = 0
trigger1 = movehit = 1
anim = 351
id = 1001
postype = p1
pos = 0,0
vel = 0,0
ownpal = 0
;ontop = 1
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = -1
sprpriority = 4
removetime = 14
ignorehitpause = 1

[State 1231,3]
type = ChangeAnim
triggerall = helper(1230),anim = 1231
trigger1 = helper(1230),animtime = 0
trigger2 = helper(1230),pos Y >= 0
value = 1222

[State 1231,4]
type = DestroySelf
trigger1 = helper(1230),anim = 1222;
trigger1 = helper(1230),animtime = 0;time = 90
trigger2 = helper(1230),movetype = h;movecontact = 1

;====================================================================
;パニエロケット《ムーヴ》
;====================================================================
;--------------------------------------------------------------------
;パニエロケット　弱（後ろ）
[Statedef 1250]
type    = S
movetype= A
physics = S
poweradd= ifelse(var(51)= 0,60,0)
velset = 0,0
anim = 1250
ctrl = 0
sprpriority = 2

;マギカモード：魔力消費
[State 1250,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State 1250,魔法文字消去]
type = removeExplod
trigger1 = time = 0
trigger1 = numexplod(380) != 0
id = 380

[State 1250,0]
type = PlaySnd
trigger1 = time = 5
value = s7,12
volume = 250

;演出用エフェクト
[State 1250,1]
type = null;helper
trigger1 = AnimElem = 1
trigger1 = numhelper(380) = 0
helpertype = normal
neme = "Mahoujin_1"
ID = 380
pos = 0,0
postype = p1
stateno = 300;魔法陣出現
keyctrl = 0
persistent = 0
size.xscale =0.6
size.yscale =0.6

;飛び道具
[State 1250,3]
type = helper
trigger1 = AnimElemtime(1) = 4
helpertype = player
neme = "Panie_Rocket"
ID = 1250
pos = 0,0
postype = p1
stateno = 1255
keyctrl = 0
persistent = 0

[State 1255,4]
type = Explod
triggerall = numexplod(40) = 0
trigger1 = AnimElemtime(1) = 4
anim = 30
id = 40
postype = p1
pos = 0,0
vel = 0,0
ownpal = 0
;ontop = 1
supermove = 1
pausemovetime = 1
shadow = 0,0,0
bindtime = 1
sprpriority = 4
removetime = 26;
scale = 0.6,0.6
;ignorehitpause = 1

[State 1250,5]
type = ChangeState
trigger1 = AnimTime = 0
;trigger1 = time = 35
value = 1251
ctrl = 0

[Statedef 1251]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 1251
ctrl = 0
sprpriority = 2

[State 1251,2]
type = Posadd
trigger1 = time = 0
x = -100

[State 1251,2]
type = Explod
trigger1 = time = 0
anim = 1254
id = 1251
postype = p1
pos = 0,0;-250
vel = 0,0;0,8
ownpal = 0
supermove = 100
pausemovetime = 100
shadow = 5,5,5
bindtime = 1
sprpriority = 4
removetime = 10
;ignorehitpause = 1

[State 1251,魔法文字消去]
type = removeExplod
trigger1 = time = 0
trigger1 = numexplod(380) != 0
id = 380

[State 1251,0]
type = PlaySnd
trigger1 = time = 20
value = s0,7
volume = 250

[State 1251,4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;ロケットまどか
[Statedef 1255]
type    = S
movetype= A
physics = N
anim = 1252
ctrl = 0
sprpriority = 3

[State 1250,0]
type = ScreenBound
trigger1 = helper(1250),time >= 0
value = 0
movecamera = 0,0

[State 1250,1]
type = BindToParent
trigger1 = root,Stateno = 1250
trigger1 = helper(1250),time = 0
time = 1
pos = 0,0

[State 1255,2] 
type = velset
trigger1 = helper(1250),time = 0
x = 0

[State 1255,4]
type = ChangeState
trigger1 = helper(1250),time >= 20
value = 1256
ctrl = 0

[Statedef 1256]
type    = S
movetype= A
physics = N
anim = 1253
ctrl = 0
sprpriority = 3

[State 1256,0]
type = ScreenBound
trigger1 = helper(1250),time >= 0
value = 0
movecamera = 0,0

[State 1256,0] 
type = velset
trigger1 = helper(1250),time = 0
y = -8

[State 1256,0] 
type = veladd
trigger1 = helper(1250),time >= 0
y = -.18

[State 1256,4]
type = DestroySelf
trigger1 = helper(1250),time >= 20
trigger2 = helper(1250),movecontact = 1
trigger3 = helper(1250),movetype = H
trigger4 = helper(1250),Anim != 1253

;---------------------------------------------------------------------------
;パニエロケット　中（前１）
[Statedef 1260]
type    = S
movetype= A
physics = S
poweradd= ifelse(var(51)= 0,60,0)
velset = 0,0
anim = 1250
ctrl = 0
sprpriority = 2

;マギカモード：魔力消費
[State 1260,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State 1260,魔法文字消去]
type = removeExplod
trigger1 = time = 0
trigger1 = numexplod(380) != 0
id = 380

[State 1260,0]
type = PlaySnd
trigger1 = time = 5
value = s7,12
volume = 250

;演出用エフェクト
[State 1260,1]
type = null;helper
trigger1 = AnimElem = 1
trigger1 = numhelper(380) = 0
helpertype = normal
neme = "Mahoujin_1"
ID = 380
pos = 0,0
postype = p1
stateno = 300;魔法陣出現
keyctrl = 0
persistent = 0
size.xscale =0.6
size.yscale =0.6

;飛び道具
[State 1260,3]
type = helper
trigger1 = AnimElemtime(1) = 4
helpertype = player
neme = "Panie_Rocket"
ID = 1260
pos = 0,0
postype = p1
stateno = 1265
keyctrl = 0
persistent = 0

[State 1260,0]
type = Explod
triggerall = numexplod(40) = 0
trigger1 = AnimElemtime(1) = 4
anim = 30
id = 40
postype = p1
pos = 0,0
vel = 0,0
ownpal = 0
;ontop = 1
supermove = 1
pausemovetime = 1
shadow = 0,0,0
bindtime = 1
sprpriority = 4
removetime = 26;
scale = 0.6,0.6
;ignorehitpause = 1

[State 1260,4]
type = ChangeState
trigger1 = AnimTime = 0
;trigger1 = time = 35
value = 1261
ctrl = 0

[Statedef 1261]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 1251
ctrl = 0
sprpriority = 2

[State 1261,2]
type = Posadd
trigger1 = time = 0
x = 100

[State 1261,2]
type = Explod
trigger1 = time = 0
anim = 1254
id = 1251
postype = p1
pos = 0,0;-250
vel = 0,0;8
ownpal = 0
supermove = 100
pausemovetime = 100
shadow = 5,5,5
bindtime = 1
sprpriority = 4
removetime = 10
;ignorehitpause = 1

[State 1261,魔法文字消去]
type = removeExplod
trigger1 = time = 0
trigger1 = numexplod(380) != 0
id = 380

[State 1261,0]
type = PlaySnd
trigger1 = time = 20
value = s0,7
volume = 250

[State 1261,4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;ロケットまどか
[Statedef 1265]
type    = S
movetype= A
physics = N
anim = 1252
ctrl = 0
sprpriority = 3

[State 1250,0]
type = ScreenBound
trigger1 = helper(1260),time >= 0
value = 0
movecamera = 0,0

[State 1250,1]
type = BindToParent
trigger1 = root,Stateno = 1260
trigger1 = helper(1260),time = 0
time = 1
pos = 0,0

[State 1255,2] 
type = velset
trigger1 = helper(1260),time = 0
x = 0

[State 1255,4]
type = ChangeState
trigger1 = helper(1260),time >= 20
value = 1266
ctrl = 0

[Statedef 1266]
type    = S
movetype= A
physics = N
anim = 1253
ctrl = 0
sprpriority = 3

[State 1256,0]
type = ScreenBound
trigger1 = helper(1260),time >= 0
value = 0
movecamera = 0,0

[State 1256,0] 
type = velset
trigger1 = helper(1260),time = 0
y = -8

[State 1256,0] 
type = veladd
trigger1 = helper(1260),time >= 0
y = -.18

[State 1256,4]
type = DestroySelf
trigger1 = helper(1260),time >= 20
trigger2 = helper(1260),movecontact = 1
trigger3 = helper(1260),movetype = H
trigger4 = helper(1260),Anim != 1253

;---------------------------------------------------------------------------
;パニエロケット　強（前２）
[Statedef 1270]
type    = S
movetype= A
physics = S
poweradd= ifelse(var(51)= 0,60,0)
velset = 0,0
anim = 1250
ctrl = 0
sprpriority = 2

;マギカモード：魔力消費
[State 1270,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State 1270,魔法文字消去]
type = removeExplod
trigger1 = time = 0
trigger1 = numexplod(380) != 0
id = 380

[State 1270,0]
type = PlaySnd
trigger1 = time = 5
value = s7,12
volume = 250

;演出用エフェクト
[State 1270,1]
type = null;helper
trigger1 = AnimElem = 1
trigger1 = numhelper(380) = 0
helpertype = normal
neme = "Mahoujin_1"
ID = 380
pos = 0,0
postype = p1
stateno = 300;魔法陣出現
keyctrl = 0
persistent = 0
size.xscale =0.6
size.yscale =0.6

;飛び道具
[State 1270,3]
type = helper
trigger1 = AnimElemtime(1) = 4
helpertype = player
neme = "Panie_Rocket"
ID = 1270
pos = 0,0
postype = p1
stateno = 1275
keyctrl = 0
persistent = 0

[State 1270,4]
type = Explod
triggerall = numexplod(40) = 0
trigger1 = AnimElemtime(1) = 4
anim = 30
id = 40
postype = p1
pos = 0,0
vel = 0,0
ownpal = 0
;ontop = 1
supermove = 1
pausemovetime = 1
shadow = 0,0,0
bindtime = 1
sprpriority = 4
removetime = 26;
scale = 0.6,0.6
;ignorehitpause = 1

[State 1270,5]
type = ChangeState
trigger1 = AnimTime = 0
;trigger1 = time = 35
value = 1271
ctrl = 0

[Statedef 1271]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 1251
ctrl = 0
sprpriority = 2

[State 1271,2]
type = Posadd
trigger1 = time = 0
x = 200

[State 1271,2]
type = Explod
trigger1 = time = 0
anim = 1254
id = 1251
postype = p1
pos = 0,0;-250
vel = 0,0;8
ownpal = 0
supermove = 100
pausemovetime = 100
shadow = 5,5,5
bindtime = 1
sprpriority = 4
removetime = 10
;ignorehitpause = 1

[State 1271,魔法文字消去]
type = removeExplod
trigger1 = time = 0
trigger1 = numexplod(380) != 0
id = 380

[State 1271,0]
type = PlaySnd
trigger1 = time = 20
value = s0,7
volume = 250

[State 1271,4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;ロケットまどか
[Statedef 1275]
type    = S
movetype= A
physics = N
anim = 1252
ctrl = 0
sprpriority = 3

[State 1275,0]
type = ScreenBound
trigger1 = helper(1270),time >= 0
value = 0
movecamera = 0,0

[State 1275,1]
type = BindToParent
trigger1 = root,Stateno = 1270
trigger1 = helper(1270),time = 0
time = 1
pos = 0,0

[State 1275,2] 
type = velset
trigger1 = helper(1270),time = 0
x = 0

[State 1275,4]
type = ChangeState
trigger1 = helper(1270),time >= 20
value = 1276
ctrl = 0

[Statedef 1276]
type    = S
movetype= A
physics = N
anim = 1253
ctrl = 0
sprpriority = 3

[State 1276,0]
type = ScreenBound
trigger1 = helper(1270),time >= 0
value = 0
movecamera = 0,0

[State 1276,0] 
type = velset
trigger1 = helper(1270),time = 0
y = -8

[State 1276,0] 
type = veladd
trigger1 = helper(1270),time >= 0
y = -.18

[State 1276,4]
type = DestroySelf
trigger1 = helper(1270),time >= 20
trigger2 = helper(1270),movecontact = 1
trigger3 = helper(1270),movetype = H
trigger4 = helper(1270),Anim != 1253
