;※設定メモ
;マジカルシュート　トリプル
;1100-1101 1105 1106 1107
;1110-1111 1115 1116 1117
;1120-1121 1125 1126 1127

;マジカルシュート　バラージ
;1150
;1160
;1170


;==================================
;マジカルシュート《トリプル》
;==================================
;弱time =5
;中time =5
;強time =5
;マジカル・シュート《トリプル》弱
[Statedef 1100]
type    = S
movetype= A
physics = N
juggle  = 5
poweradd= 0
velset = 0,0
ctrl = 0
anim = 1100
sprpriority = 2

[State 1100,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State 1100, 0]
type = NotHitBy
trigger1 = time = 0
value = SCA
time = 35

;演出用エフェクト
[State 1100,1]
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

[State 1100, 2]
type = Posadd
trigger1 = animelem = 3;time = 0
;trigger2 = time = 5
x = 10

[State 1100, 3]
type = ChangeState
trigger1 = animTime = 0
value = 1101

[Statedef 1101]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1101
sprpriority = 2

[State 1100,2]
type = Explod
triggerall = numexplod(1100) = 0
trigger1 = time = 0
anim = 355
id = 355
postype = p1
pos = -10,-40
vel = 0,0
ownpal = 0
;ontop = 1
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = -1
sprpriority = 4
removetime = 20
;ignorehitpause = 1

[State 1101,0]
type = VelSet
trigger1 = time = 0
y = 0
x = 0

[State 1101,1]
type = PlaySnd
trigger1 = Animelem = 5
value = s0, 7
volume = 250

[State 1101,2]
type = RemoveExplod
trigger1 = numhelper(1105) = 1
id = 355

;飛び道具
[State 1101,proj1]
type = helper
trigger1 = AnimElem = 5
helpertype = normal
neme = "Magical_shoot_T"
ID = 1105
pos = -10+60,-40
postype = p1
stateno = 1105
keyctrl = 0
persistent = 0

;飛び道具
[State 1101,proj2]
type = helper
trigger1 = AnimElem = 5
helpertype = normal
neme = "Magical_shoot_T"
ID = 1106
pos = -10+60,-40-30
postype = p1
stateno = 1106
keyctrl = 0
persistent = 0

;飛び道具
[State 1101,proj3]
type = helper
trigger1 = AnimElem = 5
helpertype = normal
neme = "Magical_shoot_T"
ID = 1107
pos = -10+40,-40-40
postype = p1
stateno = 1107
keyctrl = 0
persistent = 0

[State 1101, 3]
type = ChangeState
trigger1 = animtime = 0
value = 10
ctrl = 1
;---------------------------------------------------------------------------
;マジカルシュート（弱）飛び道具
[Statedef 1105]
type    = S
movetype= A
physics = N
juggle  = 2
poweradd= 0
anim = 360
ctrl = 0
sprpriority = 3

[State 1105,0] 
type = velset
trigger1 = 1
x = 20;18
y = -2

[State 1105,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,40,30+(root,var(52)*10)), 2
getpower = 10,5
priority  = 3
guardflag = MA
pausetime = 12,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 35
ground.velocity = -2.5,-8
air.velocity = -2,-7.5
sparkno = 3;s300
fall = 1
fall.recover = 0
air.recover = 0

[State 1100,2]
type = Explod
triggerall = numexplod(1105) = 0
trigger1 = movehit = 1
anim = 351
id = 1105
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
removetime = 10
;ignorehitpause = 1

[State 1105,4]
type = DestroySelf
trigger1 = time = 5;90
trigger2 = movecontact = 1


;---------------------------------------------------------------------------
;マジカルシュート（弱）飛び道具
[Statedef 1106]
type    = S
movetype= A
physics = N
juggle  = 3
poweradd= 0
anim = 362
ctrl = 0
sprpriority = 3

[State 1001,0] 
type = velset
trigger1 = 1
x = 18;15
y = -7;10

[State 1106,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,40,30+(root,var(52)*10)), 2
getpower = 10,5
priority  = 3
guardflag = MA
pausetime = 12,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 35
ground.velocity = -2.5,-8
air.velocity = -2,-7.5
sparkno = 3;s300
fall = 1
fall.recover = 0
air.recover = 0

[State 1100,2]
type = Explod
triggerall = numexplod(1106) = 0
trigger1 = movehit = 1
anim = 363
id = 1106
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
removetime = 10
;ignorehitpause = 1

[State 1106,4]
type = DestroySelf
trigger1 = time = 5;90
trigger2 = movecontact = 1


;---------------------------------------------------------------------------
;マジカルシュート（弱）飛び道具
[Statedef 1107]
type    = S
movetype= A
physics = N
juggle  = 3
poweradd= 0
anim = 364
ctrl = 0
sprpriority = 3

[State 1107,0] 
type = null;velset
trigger1 = helper(1107),time <= 15
x = 0
[State 1107,0] 
type = velset
trigger1 = 1
x = 14;12
y = -14;15

[State 1107,0]
type = null;posadd
trigger1 = helper(1107),vel x > 0
trigger1 = helper(1107),anim = 300
x = 20

[State 1107,0]
type = null;changeanim
trigger1 = helper(1107),vel x > 0
trigger1 = helper(1107),anim = 300
value = 350

[State 1107,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,70,60+(root,var(52)*10)), 2
getpower = 10,5
priority  = 3
guardflag = MA
pausetime = 12,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 35
ground.velocity = -2.5,-8
air.velocity = -2,-7.5
sparkno = 3;s300
fall = 1
fall.recover = 0
air.recover = 0

[State 1100,2]
type = Explod
triggerall = numexplod(1107) = 0
trigger1 = movehit = 1
anim = 365
id = 1107
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
removetime = 10
;ignorehitpause = 1

[State 1107,4]
type = DestroySelf
trigger1 = time = 5;90
trigger2 = movecontact = 1


;======================================
;マジカルシュート《トリプル》中
;======================================
[Statedef 1110]
type    = S
movetype= A
physics = N
juggle  = 5
poweradd= 0
velset = 0,0
ctrl = 0
anim = 1100
sprpriority = 2

[State 1110,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State 1110, 0]
type = NotHitBy
trigger1 = time = 0
value = SCA
time = 25

;演出用エフェクト
[State 1110,1]
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

[State 1110, 2]
type = Posadd
trigger1 = animelem = 1
trigger2 = animelem = 3
x = 10

[State 1110, 3]
type = ChangeState
trigger1 = animTime = 0
value = 1111

[Statedef 1111]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1111
sprpriority = 2

[State 1111,2]
type = Explod
triggerall = numexplod(1100) = 0
trigger1 = time = 0
anim = 355
id = 355
postype = p1
pos = -10,-40
vel = 0,0
ownpal = 0
;ontop = 1
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = -1
sprpriority = 4
removetime = 20
;ignorehitpause = 1

[State 1111,0]
type = VelSet
trigger1 = time = 0
y = 0
x = 0

[State 1111,1]
type = PlaySnd
trigger1 = Animelem = 5
value = s0, 7
volume = 250

[State 1111,2]
type = RemoveExplod
trigger1 = numhelper(1115) = 1
trigger2 = movetype = h
id = 355

;飛び道具
[State 1111,proj1]
type = helper
trigger1 = AnimElem = 5
helpertype = normal
neme = "Magical_shoot_T"
ID = 1115
pos = -10+60,-40
postype = p1
stateno = 1115
keyctrl = 0
persistent = 0

;飛び道具
[State 1111,proj2]
type = helper
trigger1 = AnimElem = 5
helpertype = normal
neme = "Magical_shoot_T"
ID = 1116
pos = -10+60,-40-30
postype = p1
stateno = 1116
keyctrl = 0
persistent = 0

;飛び道具
[State 1111,proj3]
type = helper
trigger1 = AnimElem = 5
helpertype = normal
neme = "Magical_shoot_T"
ID = 1117
pos = -10+40,-40-40
postype = p1
stateno = 1117
keyctrl = 0
persistent = 0

[State 1111, 3]
type = ChangeState
trigger1 = animtime = 0
value = 10
ctrl = 1
;---------------------------------------------------------------------------
;マジカルシュート（中）飛び道具
[Statedef 1115]
type    = S
movetype= A
physics = N
juggle  = 3
poweradd= 0
anim = 360
ctrl = 0
sprpriority = 3

[State 1115,0] 
type = null;velset
trigger1 = helper(1115),time <= 15
x = 0
[State 1115,0] 
type = velset
trigger1 = 1
x = 20*1.2;18
y = -2*1.2

[State 1115,0]
type = null;posadd
trigger1 = helper(1115),vel x > 0
trigger1 = helper(1115),anim = 300
x = 20

[State 1115,0]
type = null;changeanim
trigger1 = helper(1115),vel x > 0
trigger1 = helper(1115),anim = 300
value = 350

[State 1115,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,50,40+(root,var(52)*10)), 2
getpower = 10,5
priority  = 3
guardflag = MA
pausetime = 12,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 35
ground.velocity = -2.5,-8
air.velocity = -2,-7.5
sparkno = 3;s300
fall = 1
fall.recover = 0
air.recover = 0

[State 1115,2]
type = Explod
triggerall = numexplod(1115) = 0
trigger1 = movehit = 1
anim = 351
id = 1105
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
removetime = 10
;ignorehitpause = 1

[State 1115,4]
type = DestroySelf
trigger1 = time = 5;90
trigger2 = movecontact = 1


;---------------------------------------------------------------------------
;マジカルシュート（中）飛び道具２
[Statedef 1116]
type    = S
movetype= A
physics = N
juggle  = 4
poweradd= 0
anim = 362
ctrl = 0
sprpriority = 3

[State 1116,0] 
type = null;velset
trigger1 = helper(1116),time <= 15
x = 0
[State 1116,0] 
type = velset
trigger1 = 1
x = 18*1.2;15
y = -7*1.2;10

[State 1116,0]
type = null;posadd
trigger1 = helper(1116),vel x > 0
trigger1 = helper(1116),anim = 300
x = 20

[State 1106,0]
type = null;changeanim
trigger1 = helper(1116),vel x > 0
trigger1 = helper(1116),anim = 300
value = 350

[State 1106,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,50,40+(root,var(52)*10)), 2
getpower = 10,5
priority  = 3
guardflag = MA
pausetime = 12,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 35
ground.velocity = -2.5,-8
air.velocity = -2,-7.5
sparkno = 3;s300
fall = 1
fall.recover = 0
air.recover = 0

[State 1116,2]
type = Explod
triggerall = numexplod(1116) = 0
trigger1 = movehit = 1
anim = 363
id = 1106
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
removetime = 10
;ignorehitpause = 1

[State 1116,4]
type = DestroySelf
trigger1 = time = 5;90
trigger2 = movecontact = 1


;---------------------------------------------------------------------------
;マジカルシュート（中）飛び道具３
[Statedef 1117]
type    = S
movetype= A
physics = N
juggle  = 4
poweradd= 0
anim = 364
ctrl = 0
sprpriority = 3

[State 1117,0] 
type = null;velset
trigger1 = helper(1117),time <= 15
x = 0
[State 1117,0] 
type = velset
trigger1 = 1
x = 14*1.2;12
y = -14*1.2;15

[State 1117,0]
type = null;posadd
trigger1 = helper(1117),vel x > 0
trigger1 = helper(1117),anim = 300
x = 20

[State 1117,0]
type = null;changeanim
trigger1 = helper(1117),vel x > 0
trigger1 = helper(1117),anim = 300
value = 350

[State 1117,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,80,70+(root,var(52)*10)), 2
getpower = 10,5
priority  = 3
guardflag = MA
pausetime = 12,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 35
ground.velocity = -2.5,-8
air.velocity = -2,-7.5
sparkno = 3;s300
fall = 1
fall.recover = 0
air.recover = 0

[State 1117,2]
type = Explod
triggerall = numexplod(1117) = 0
trigger1 = movehit = 1
anim = 365
id = 1107
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
removetime = 10
;ignorehitpause = 1

[State 1117,4]
type = DestroySelf
trigger1 = time = 5;90
trigger2 = movecontact = 1

;======================================
;マジカルシュート《トリプル》強
;======================================
[Statedef 1120]
type    = S
movetype= A
physics = N
juggle  = 5
poweradd= 0
velset = 0,0
ctrl = 0
anim = 1100
sprpriority = 2

[State 1120,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State 1120, 0]
type = NotHitBy
trigger1 = time = 0
value = SCA
time = 20

;演出用エフェクト
[State 1120,1]
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

[State 1120, 2]
type = Posadd
trigger1 = animelem = 1
trigger2 = animelem = 3
x = 15

[State 1120, 3]
type = ChangeState
trigger1 = animTime = 0
value = 1121

[Statedef 1121]
type    = S
movetype= A
physics = N
ctrl = 0
anim = 1121
sprpriority = 2

[State 1121,2]
type = Explod
triggerall = numexplod(1100) = 0
trigger1 = time = 0
anim = 355
id = 355
postype = p1
pos = -10,-40
vel = 0,0
ownpal = 0
;ontop = 1
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = -1
sprpriority = 4
removetime = 20
;ignorehitpause = 1

[State 1121,0]
type = VelSet
trigger1 = time = 0
y = 0
x = 0

[State 1121,1]
type = PlaySnd
trigger1 = Animelem = 5
value = s0, 7
volume = 250

[State 1121,2]
type = RemoveExplod
trigger1 = numhelper(1125) = 1
trigger2 = movetype = h
id = 355

;飛び道具
[State 1121,proj1]
type = helper
trigger1 = AnimElem = 5
helpertype = normal
neme = "Magical_shoot_T"
ID = 1125
pos = -10+60,-40
postype = p1
stateno = 1125
keyctrl = 0
persistent = 0

;飛び道具
[State 1121,proj2]
type = helper
trigger1 = AnimElem = 5
helpertype = normal
neme = "Magical_shoot_T"
ID = 1126
pos = -10+60,-40-30
postype = p1
stateno = 1126
keyctrl = 0
persistent = 0

;飛び道具
[State 1121,proj3]
type = helper
trigger1 = AnimElem = 5
helpertype = normal
neme = "Magical_shoot_T"
ID = 1127
pos = -10+40,-40-40
postype = p1
stateno = 1127
keyctrl = 0
persistent = 0

[State 1121, 3]
type = ChangeState
trigger1 = animtime = 0
value = 10
ctrl = 1

;---------------------------------------------------------------------------
;マジカルシュート（強）飛び道具１
[Statedef 1125]
type    = S
movetype= A
physics = N
juggle  = 3
poweradd= 0
anim = 360
ctrl = 0
sprpriority = 3

[State 1125,0] 
type = velset
trigger1 = 1
x = 20*1.5
y = -2*1.5

[State 1125,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,60,50+(root,var(52)*10)), 2
getpower = 10,5
priority  = 3
guardflag = MA
pausetime = 12,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 35
ground.velocity = -2.5,-10
air.velocity = -2,-9.5
sparkno = 3;s300
fall = 1
fall.recover = 0
air.recover = 0

[State 1125,2]
type = Explod
triggerall = numexplod(1125) = 0
trigger1 = movehit = 1
anim = 351
id = 1105
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
removetime = 10
;ignorehitpause = 1

[State 1125,4]
type = DestroySelf
trigger1 = time = 5;90
trigger2 = movecontact = 1


;---------------------------------------------------------------------------
;マジカルシュート（強）飛び道具２
[Statedef 1126]
type    = S
movetype= A
physics = N
juggle  = 4
poweradd= 0
anim = 362
ctrl = 0
sprpriority = 3

[State 1126,0] 
type = velset
trigger1 = 1
x = 18*1.5
y = -7*1.5

[State 1126,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,60,50+(root,var(52)*10)), 2
getpower = 10,5
priority  = 3
guardflag = MA
pausetime = 12,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 35
ground.velocity = -2.5,-10
air.velocity = -2,-9.5
sparkno = 3;s300
fall = 1
fall.recover = 0
air.recover = 0

[State 1126,2]
type = Explod
triggerall = numexplod(1126) = 0
trigger1 = movehit = 1
anim = 363
id = 1106
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
removetime = 10
;ignorehitpause = 1

[State 1126,4]
type = DestroySelf
trigger1 = time = 5;90
trigger2 = movecontact = 1


;---------------------------------------------------------------------------
;マジカルシュート（強）飛び道具３
[Statedef 1127]
type    = S
movetype= A
physics = N
juggle  = 4
poweradd= 0
anim = 364
ctrl = 0
sprpriority = 3

[State 1127,0] 
type = velset
trigger1 = 1
x = 14*1.5
y = -14*1.5

[State 1127,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,90,80+(root,var(52)*10)), 2
getpower = 10,5
priority  = 3
guardflag = MA
pausetime = 12,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 35
ground.velocity = -2.5,-10
air.velocity = -2,-9.5
sparkno = 3;s300
fall = 1
fall.recover = 0
air.recover = 0

[State 1127,2]
type = Explod
triggerall = numexplod(1127) = 0
trigger1 = movehit = 1
anim = 365
id = 1107
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
removetime = 10
;ignorehitpause = 1

[State 1127,4]
type = DestroySelf
trigger1 = time = 5;90
trigger2 = movecontact = 1



















;==================================
;マジカルシュート《バラージ》
;==================================
;弱　下段
;中　中段
;強　上段
;弱中強でモーションや隙、ダメージも同じ

;マジカル・シュート《バラージ》弱
[Statedef 1150]
type    = S
movetype= A
physics = N
juggle  = 5
poweradd= 0
velset = 0,0
ctrl = 0
anim = 1150
sprpriority = 2

;チャージダメージリセット
[State 1150,0]
type = VarSet
trigger1 = time = 0
v = 24
value = 0

[State 1150,1]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State 1150,5]
type = PlaySnd
trigger1 = time = 0
value = 0,3
volume = 250

[State 1150,2]
type = null;NotHitBy
trigger1 = time = 0
value = SCA
time = 35

;演出用エフェクト
[State 1150,3]
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

;バラージシュート
[State 1150,4]
type = helper
trigger1 = AnimElem = 2
helpertype = normal
neme = "Magical_shoot_B"
ID = 1150
pos = 10,-40+const(size.mid.pos.y);-80の位置
postype = p1
stateno = 1151
keyctrl = 0
persistent = 0

[State 1150,5]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;バラージシュート（弱
[Statedef 1151]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 1151
ctrl = 0
sprpriority = 3

[State 1151,0] 
type = velset
trigger1 = helper(1150),time = 0
x = 0

[State 1151,0] 
type = velset
trigger1 = helper(1150),animelemtime(10) = 0
y = 3

[State 1151,0]
type = ChangeAnim
trigger1 = helper(1150),anim = 1151
trigger1 = helper(1150),pos Y >= 0
trigger1 = helper(1150),Vel Y > 0
value = 1152

[State 1151,0]
type = Velset
trigger1 = helper(1150),pos Y >= 0
trigger1 = helper(1150),Vel Y > 0
y = 0

[State 1151,1] 
type = null;HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,90,80+(root,var(52)*10)), 2
priority  = 3
guardflag = MA
pausetime = 12,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 35
ground.velocity = -2.5,-10
air.velocity = -2,-9.5
sparkno = 3;s300
fall = 1
fall.recover = 0
air.recover = 0

[State 1151,2]
type = Explod
triggerall = numexplod(1127) = 0
trigger1 = movehit = 1
anim = 351;365
id = 1107
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
removetime = 10
;ignorehitpause = 1

;最大150ぐらい
[State 1151,3]
type = ParentVarAdd
trigger1 = helper(1150),time >= 0
trigger1 = root,command ="hold_a"
v = 24
value = 1

;チャージ
[State 1151,4]
type = ChangeState
trigger1 = helper(1150),time > 100
trigger1 = root,command != "hold_a"
trigger2 = helper(1150),time = 150
trigger2 = root,var(24) < 149
trigger2 = root,command = "hold_a"
trigger3 = helper(1150),p2bodydist X = [-30,30]
trigger3 = helper(1150),p2bodydist Y = [-50,50]
value = 1152

;チャージ最大
[State 1151,5]
type = ChangeState
trigger1 = root,var(24) >= 149
trigger1 = helper(1150),time = 150
trigger1 = root,command ="hold_a"
value = 1153

[State 1151, NotHitby]
type = NotHitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 1151, Hitby]
type = HitBy
trigger1 = 1
value = SCA,AA,AP
time = 1
;hitbyで指定して置かないと、Hitoverrideは作動しない事になる。

[State 1151, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP
slot = 1
stateno = 1154
time = 1

[State 1151,6]
type = DestroySelf
trigger1 = time >= 151
trigger2 = movecontact = 1

;定時で発射・その１
[Statedef 1152]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 1153;350
ctrl = 0
sprpriority = 3

[State 1152,0] 
type = velset
trigger1 = 1
x = 14*1.5

[State 1152,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,90,80+(root,var(52)*10)) + ceil((root,Var(24))/10), 2
getpower = 30,15
priority  = 3
guardflag = MA
pausetime = 12,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 35
ground.velocity = -2.5,-10
air.velocity = -2,-9.5
sparkno = 3;s300
fall = 1
fall.recover = 0
air.recover = 0

[State 1152,2]
type = Explod
triggerall = numexplod(1127) = 0
trigger1 = movehit = 1
anim = 351;365
id = 1107
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
removetime = 10
;ignorehitpause = 1

[State 1152, NotHitby]
type = NotHitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 1152, Hitby]
type = HitBy
trigger1 = 1
value = SCA,AA,AP
time = 1

[State 1152, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP
slot = 1
stateno = 1154
time = 1

[State 1152,4]
type = DestroySelf
trigger1 = helper(1150),animtime = 0
trigger2 = movecontact = 1


;定時で発射・その１
[Statedef 1153]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 1153
ctrl = 0
sprpriority = 3

[State 1153,0] 
type = velset
trigger1 = 1
x = 14*1.5

[State 1153,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,150,140+(root,var(52)*10)), 2
getpower = 30,15
priority  = 3
guardflag = MA
pausetime = 12,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 35
ground.velocity = -2.5,-10
air.velocity = -2,-9.5
sparkno = 3;s300
fall = 1
fall.recover = 0
air.recover = 0

[State 1153,2]
type = Explod
triggerall = numexplod(1127) = 0
trigger1 = movehit = 1
anim = 351;365
id = 1107
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
removetime = 10
;ignorehitpause = 1

[State 1153,3]
type = Palfx
trigger1 = Ishelper(1150) = 1
trigger1 = 1;Animtime != 0
add = 200,50,50
sinadd = 10, 10, 10
time = 1

[State 1153, NotHitby]
type = NotHitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 1153, Hitby]
type = HitBy
trigger1 = 1
value = SCA,AA,AP
time = 1

[State 1153, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP
slot = 1
stateno = 1154
time = 1

[State 1153,4]
type = DestroySelf
trigger1 = helper(1150),animtime = 0
trigger2 = movecontact = 1

[Statedef 1154]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 1154
ctrl = 0
sprpriority = 3

[State 1154,0]
type = DestroySelf
trigger1 = helper(1150),Animtime = 0


;マジカル・シュート《バラージ》中
[Statedef 1160]
type    = S
movetype= A
physics = N
juggle  = 5
poweradd= 0
velset = 0,0
ctrl = 0
anim = 1150
sprpriority = 2

;チャージダメージリセット
[State 1160,0]
type = VarSet
trigger1 = time = 0
v = 24
value = 0

[State 1160,1]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State 1150,5]
type = PlaySnd
trigger1 = time = 0
value = 0,3
volume = 250

[State 1160,2]
type = null;NotHitBy
trigger1 = time = 0
value = SCA
time = 35

;演出用エフェクト
[State 1160,3]
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

;バラージシュート
[State 1160,4]
type = helper
trigger1 = AnimElem = 2
helpertype = normal
neme = "Magical_shoot_B"
ID = 1160
pos = 10,-40+const(size.mid.pos.y);-80の位置
postype = p1
stateno = 1161
keyctrl = 0
persistent = 0

[State 1160,5]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;バラージシュート（中
[Statedef 1161]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 1151
ctrl = 0
sprpriority = 3

[State 1161,0] 
type = velset
trigger1 = helper(1160),time = 0
x = 0

[State 1161,0] 
type = velset
trigger1 = helper(1160),animelemtime(10) = 0
y = 1
[State 1161,0]
type = ChangeAnim
trigger1 = helper(1160),anim = 1151
trigger1 = helper(1160),pos Y >= const(size.mid.pos.y)
trigger1 = helper(1160),Vel Y > 0
value = 1152

[State 1161,0]
type = Velset
trigger1 = helper(1160),pos Y >= const(size.mid.pos.y)
trigger1 = helper(1160),Vel Y > 0
y = 0

[State 1161,1] 
type = null;HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,90,80+(root,var(52)*10)), 2
priority  = 3
guardflag = MA
pausetime = 12,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 35
ground.velocity = -2.5,-10
air.velocity = -2,-9.5
sparkno = 3;s300
fall = 1
fall.recover = 0
air.recover = 0

[State 1161,2]
type = Explod
triggerall = numexplod(1127) = 0
trigger1 = movehit = 1
anim = 351;365
id = 1107
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
removetime = 10
;ignorehitpause = 1

[State 1161,3]
type = ParentVarAdd
trigger1 = helper(1160),time >= 0
trigger1 = root,command = "hold_b"
v = 24
value = 1

;チャージ
[State 1161,4]
type = ChangeState
trigger1 = helper(1160),time > 100
trigger1 = root,command != "hold_b"
trigger2 = helper(1160),time = 150
trigger2 = root,var(24) < 149
trigger2 = root,command = "hold_b"
trigger3 = helper(1160),p2bodydist X = [-30,30]
trigger3 = helper(1160),p2bodydist Y = [-50,50]
value = 1162

;チャージ最大
[State 1161,5]
type = ChangeState
trigger1 = root,var(24) >= 149
trigger1 = helper(1160),time = 150
trigger1 = root,command ="hold_b"
value = 1163

[State 1161, NotHitby]
type = NotHitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 1161, Hitby]
type = HitBy
trigger1 = 1
value = SCA,AA,AP
time = 1

[State 1161, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP
slot = 1
stateno = 1164
time = 1

[State 1161,6]
type = DestroySelf
trigger1 = time >= 151
trigger2 = movecontact = 1

;定時で発射・その１
[Statedef 1162]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim =1153;350;
ctrl = 0
sprpriority = 3

[State 1162,0] 
type = velset
trigger1 = 1
x = 14*1.5

[State 1162,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,90,80+(root,var(52)*10)) + ceil((root,Var(24))/10), 2
getpower = 30,15
priority  = 3
guardflag = MA
pausetime = 12,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 35
ground.velocity = -2.5,-10
air.velocity = -2,-9.5
sparkno = 3;s300
fall = 1
fall.recover = 0
air.recover = 0

[State 1162,2]
type = Explod
triggerall = numexplod(1127) = 0
trigger1 = movehit = 1
anim = 351;365
id = 1107
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
removetime = 10
;ignorehitpause = 1

[State 1162, NotHitby]
type = NotHitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 1162, Hitby]
type = HitBy
trigger1 = 1
value = SCA,AA,AP
time = 1

[State 1162, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP
slot = 1
stateno = 1164
time = 1

[State 1162,4]
type = DestroySelf
trigger1 = helper(1160),animtime = 0;time = 20
trigger2 = movecontact = 1


;定時で発射・その１
[Statedef 1163]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 1153
ctrl = 0
sprpriority = 3

[State 1163,0] 
type = velset
trigger1 = 1
x = 14*1.5

[State 1163,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,150,140+(root,var(52)*10)), 2
getpower = 30,15
priority  = 3
guardflag = MA
pausetime = 12,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 35
ground.velocity = -2.5,-10
air.velocity = -2,-9.5
sparkno = 3;s300
fall = 1
fall.recover = 0
air.recover = 0

[State 1163,2]
type = Explod
triggerall = numexplod(1127) = 0
trigger1 = movehit = 1
anim = 351;365
id = 1107
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
removetime = 10
;ignorehitpause = 1

[State 1163,3]
type = Palfx
trigger1 = Ishelper(1160) = 1
trigger1 = 1;Animtime != 0
add = 200,50,50
sinadd = 10, 10, 10
time = 1

[State 1163, NotHitby]
type = NotHitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 1163, Hitby]
type = HitBy
trigger1 = 1
value = SCA,AA,AP
time = 1

[State 1163, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP
slot = 1
stateno = 1164
time = 1

[State 1163,4]
type = DestroySelf
trigger1 = helper(1160),animtime = 0;time = 20
trigger2 = movecontact = 1

[Statedef 1164]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 1154
ctrl = 0
sprpriority = 3

[State 1164,0]
type = DestroySelf
trigger1 = helper(1160),Animtime = 0

;マジカル・シュート《バラージ》強
[Statedef 1170]
type    = S
movetype= A
physics = N
juggle  = 5
poweradd= 0
velset = 0,0
ctrl = 0
anim = 1150
sprpriority = 2

;チャージダメージリセット
[State 1170,0]
type = VarSet
trigger1 = time = 0
v = 24
value = 0

[State 1170,1]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State 1150,5]
type = PlaySnd
trigger1 = time = 0
value = 0,3
volume = 250

[State 1170,2]
type = null;NotHitBy
trigger1 = time = 0
value = SCA
time = 35

;演出用エフェクト
[State 1170,3]
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

;バラージシュート
[State 1170,4]
type = helper
trigger1 = AnimElem = 2
helpertype = normal
neme = "Magical_shoot_B"
ID = 1170
pos = 10,-40+const(size.mid.pos.y);-80の位置
postype = p1
stateno = 1171
keyctrl = 0
persistent = 0

[State 1170,5]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;バラージシュート（強
[Statedef 1171]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 1151
ctrl = 0
sprpriority = 3

[State 1171,0] 
type = velset
trigger1 = helper(1170),time = 0
x = 0

[State 1171,0] 
type = velset
trigger1 = helper(1170),animelemtime(10) = 0
y = -3

[State 1171,0]
type = ChangeAnim
trigger1 = helper(1170),anim = 1151
trigger1 = helper(1170),pos Y <= const(size.head.pos.y)
trigger1 = helper(1170),Vel Y < 0
value = 1152

[State 1171,0]
type = Velset
trigger1 = helper(1170),pos Y <= const(size.head.pos.y)
trigger1 = helper(1170),Vel Y < 0
y = 0

[State 1171,1] 
type = null;HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,90,80+(root,var(52)*10)), 2
priority  = 3
guardflag = MA
pausetime = 12,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 35
ground.velocity = -2.5,-10
air.velocity = -2,-9.5
sparkno = 3;s300
fall = 1
fall.recover = 0
air.recover = 0

[State 1171,2]
type = Explod
triggerall = numexplod(1127) = 0
trigger1 = movehit = 1
anim = 351;365
id = 1107
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
removetime = 10
;ignorehitpause = 1

[State 1171,3]
type = ParentVarAdd
trigger1 = helper(1170),time >= 0
trigger1 = root,command ="hold_c"
v = 24
value = 1

;チャージ
[State 1171,4]
type = ChangeState
trigger1 = helper(1170),time > 100
trigger1 = root,command != "hold_c"
trigger2 = helper(1170),time = 150
trigger2 = root,var(24) < 149
trigger2 = root,command = "hold_c"
trigger3 = helper(1170),p2bodydist X = [-30,30]
trigger3 = helper(1170),p2bodydist Y = [-50,50]
value = 1172

;チャージ最大
[State 1171,5]
type = ChangeState
trigger1 = root,var(24) >= 149
trigger1 = helper(1170),time = 150
trigger1 = root,command ="hold_c"
value = 1173

[State 1171, NotHitby]
type = NotHitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 1171, Hitby]
type = HitBy
trigger1 = 1
value = SCA,AA,AP
time = 1

[State 1171, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP
slot = 1
stateno = 1174
time = 1

[State 1171,6]
type = DestroySelf
trigger1 = time >= 151
trigger2 = movecontact = 1


;定時で発射・その１
[Statedef 1172]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 1153;350;
ctrl = 0
sprpriority = 3

[State 1172,0] 
type = velset
trigger1 = 1
x = 14*1.5

[State 1172,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,90,80+(root,var(52)*10)) + ceil((root,Var(24))/10), 2
getpower = 30,15
priority  = 3
guardflag = MA
pausetime = 12,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 35
ground.velocity = -2.5,-10
air.velocity = -2,-9.5
sparkno = 3;s300
fall = 1
fall.recover = 0
air.recover = 0

[State 1172,2]
type = Explod
triggerall = numexplod(1127) = 0
trigger1 = movehit = 1
anim = 351;365
id = 1107
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
removetime = 10
;ignorehitpause = 1

[State 1172, NotHitby]
type = NotHitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 1172, Hitby]
type = HitBy
trigger1 = 1
value = SCA,AA,AP
time = 1

[State 1172, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP
slot = 1
stateno = 1174
time = 1

[State 1172,4]
type = DestroySelf
trigger1 = helper(1170),animtime = 0;time = 20
trigger2 = movecontact = 1


;定時で発射・その１
[Statedef 1173]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 1153
ctrl = 0
sprpriority = 3

[State 1173,0] 
type = velset
trigger1 = 1
x = 14*1.5

[State 1173,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,150,140+(root,var(52)*10)), 2
getpower = 30,15
priority  = 3
guardflag = MA
pausetime = 12,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 35
ground.velocity = -2.5,-10
air.velocity = -2,-9.5
sparkno = 3;s300
fall = 1
fall.recover = 0
air.recover = 0

[State 1173,2]
type = Explod
triggerall = numexplod(1127) = 0
trigger1 = movehit = 1
anim = 351;365
id = 1107
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
removetime = 10
;ignorehitpause = 1

[State 1173,3]
type = Palfx
trigger1 = Ishelper(1170) = 1
trigger1 = 1;Animtime != 0
add = 200,50,50
sinadd = 10, 10, 10
time = 1

[State 1172, NotHitby]
type = NotHitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 1172, Hitby]
type = HitBy
trigger1 = 1
value = SCA,AA,AP
time = 1

[State 1173, Override]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP
slot = 1
stateno = 1174
time = 1

[State 1173,4]
type = DestroySelf
trigger1 = helper(1170),Animtime = 0;time = 20
trigger2 = movecontact = 1

[Statedef 1174]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 1154
ctrl = 0
sprpriority = 3

[State 1174,0]
type = DestroySelf
trigger1 = helper(1170),Animtime = 0
