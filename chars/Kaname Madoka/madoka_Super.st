;※構成メモ
;マジカルシュートＥ　弾
;1000　1001
;1005　1006
;1010　1011 1012

;マジカルシュートＥ（空中）
;1020　1021(着地まで)1022　1025
;1030　1031　　　　　　    1035
;1040　1041　　　　　　    1045 1046

;マジカルシュートＳ　弾
;1050　1051
;1055　1056
;1060　1061

;マジカルシュートＣ《クラック》
;ガードキャンセル専用技
;1080

;結界
;1090 1095 1096

;============================================
;マジカルシュート《イーグル》
;============================================
;弱
[Statedef 1000]
type    = S
movetype= A
physics = S
juggle  = 2
poweradd= ifelse(var(51)= 0,60,0)
velset = 0,0
anim = 1000
ctrl = 0
sprpriority = 2

;マギカモード：魔力消費
[State 1000,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State -2,魔法文字消去]
type = removeExplod
trigger1 = time = 0
trigger1 = numexplod(380) != 0
id = 380

[State 1000,0]
type = PlaySnd
trigger1 = time = 20
value = s0,7
volume = 250

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

[State 1000,2]
type = ChangeAnim
trigger1 = time = 0
trigger1 = PrevStateno = [200,220]
value = 1000
elem = 5

;飛び道具
[State 1000,3]
type = helper
trigger1 = AnimElem = 7
helpertype = normal
neme = "Magical_shoot_E"
ID = 1000
pos = 10,-68
postype = p1
stateno = 1001
keyctrl = 0
persistent = 0

[State 1000,4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;マジカルシュート（弱）
[Statedef 1001]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 300
ctrl = 0
sprpriority = 3

[State 1001,0] 
type = velset
trigger1 = helper(1000),time <= 15
x = 0
[State 1001,0] 
type = velset
trigger1 = helper(1000),time > 15
x = 18

[State 1001,0]
type = posadd
trigger1 = helper(1000),vel x > 0
trigger1 = helper(1000),anim = 300
x = 20


[State 1001,0]
type = changeanim
trigger1 = helper(1000),vel x > 0
trigger1 = helper(1000),anim = 300
value = 350

[State 1001,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Hard
damage    = ifelse(root,var(51)= 0,90,80+(root,var(52)*10)), 2
getpower = 30,15
priority  = 3
guardflag = MA
pausetime = 8,8
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 22
ground.hittime  = 25
ground.velocity = -3,0
air.velocity = -2.5,-3
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

[State 1001,4]
type = DestroySelf
trigger1 = time = 90
trigger2 = movecontact = 1

;================================================================
;マジカルシュート《イーグル》
;中
[Statedef 1005]
type    = S
movetype= A
physics = S
juggle  = 2
poweradd= 20
velset = 0,0
anim = 1005
ctrl = 0
sprpriority = 2

[State 1000,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State 1005,魔法文字消去]
type = removeExplod
trigger1 = time = 0
trigger1 = numexplod(380) != 0
id = 380

[State 1005,0]
type = PlaySnd
trigger1 = time = 25
value = s0,7
volume = 250

;演出用エフェクト
[State 1005,1]
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
[State 1005,1]
type = helper
trigger1 = AnimElem = 7
helpertype = normal
neme = "Magical_shoot_E"
ID = 1005
pos = 10,-68
postype = p1
stateno = 1006
keyctrl = 0
persistent = 0

[State 1015,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;マジカル・シュート《イーグル》矢
[Statedef 1006]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 300
ctrl = 0
sprpriority = 3

[State 1006,0] 
type = velset
trigger1 = helper(1005),time <= 20
x = 0
[State 1006,0] 
type = velset
trigger1 = helper(1005),time > 20
x = 20

[State 1006,0]
type = posadd
trigger1 = helper(1005),vel x > 0
trigger1 = helper(1005),anim = 300
x = 20

[State 1006,0]
type = changeanim
trigger1 = helper(1005),vel x > 0
trigger1 = helper(1005),anim = 300
value = 350

[State 1006,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Hard
damage    = ifelse(root,var(51)= 0,110,100+(root,var(52)*10)), 2
getpower = 30,15
priority  = 3
guardflag = MA
pausetime = 8,8
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 25
ground.hittime  = 28
ground.velocity = -3,0
air.velocity = -2.5,-3
sparkno = 3;s300

[State 1006,2]
type = Explod
triggerall = numexplod(1006) = 0
trigger1 = movehit = 1
anim = 351
id = 1006
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
removetime = 14;
ignorehitpause = 1

[State 1006,4]
type = DestroySelf
trigger1 = time = 80
trigger2 = movecontact = 1

;================================================================
;マジカルシュート《イーグル》
;強
[Statedef 1010]
type    = S
movetype= A
physics = S
juggle  = 2
poweradd= 20
velset = 0,0
anim = 1010
ctrl = 0
sprpriority = 2

[State 1010,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State 1010,魔法文字消去]
type = removeExplod
trigger1 = time = 0
trigger1 = numexplod(380) != 0
id = 380

[State 1000,0]
type = PlaySnd
trigger1 = time = 25
trigger2 = time = 40
value = s0,7
volume = 250

;演出用エフェクト
[State 1010,1]
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
[State 1010,1]
type = helper
trigger1 = AnimElem = 7
helpertype = normal
neme = "Magical_shoot_E"
ID = 1011
pos = 10,-68
postype = p1
stateno = 1011
keyctrl = 0
persistent = 0

;飛び道具
[State 1010,1]
type = helper
trigger1 = AnimElem = 17
helpertype = normal
neme = "Magical_shoot_E"
ID = 1012
pos = 10,-68
postype = p1
stateno = 1012
keyctrl = 0
persistent = 0

[State 1010,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;マジカル・シュート《イーグル》矢1
[Statedef 1011]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 300
ctrl = 0
sprpriority = 3

[State 1011,0] 
type = velset
trigger1 = helper(1011),time <= 20
x = 0
[State 1011,0] 
type = velset
trigger1 = helper(1011),time > 20
x = 20

[State 1011,0]
type = posadd
trigger1 = helper(1011),vel x > 0
trigger1 = helper(1011),anim = 300
x = 20

[State 1011,0]
type = changeanim
trigger1 = helper(1011),vel x > 0
trigger1 = helper(1011),anim = 300
value = 350

[State 1011,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Hard
damage    = ifelse(root,var(51)= 0,70,60+(root,var(52)*10)), 2
getpower = 15,7
priority  = 3
guardflag = MA
pausetime = 8,19
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 28
ground.hittime  = 30
ground.velocity = -3,0
air.velocity = -2.5,-6
sparkno = 3;s300

[State 1011,2]
type = Explod
triggerall = numexplod(1011) = 0
trigger1 = movehit = 1
anim = 351
id = 1011
postype = p2
pos = 10,-68
vel = 0,0
ownpal = 0
facing = -1
;ontop = 1
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = -1
sprpriority = 4
removetime = 14;
ignorehitpause = 1

[State 1011,4]
type = DestroySelf
trigger1 = time = 80
trigger2 = movecontact = 1


;---------------------------------------------------------------------------
;マジカル・シュート《イーグル》矢1
[Statedef 1012]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 300
ctrl = 0
sprpriority = 3

[State 1012,0] 
type = velset
trigger1 = helper(1012),time <= 20
x = 0
[State 1012,0] 
type = velset
trigger1 = helper(1012),time > 20
x = 25

[State 1012,0]
type = posadd
trigger1 = helper(1012),vel x > 0
trigger1 = helper(1012),anim = 300
x = 20

[State 1012,0]
type = changeanim
trigger1 = helper(1012),vel x > 0
trigger1 = helper(1012),anim = 300
value = 350

[State 1012,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Hard
damage    = ifelse(root,var(51)= 0,70,60+(root,var(52)*10)), 2
getpower = 15,7
priority  = 3
guardflag = MA
pausetime = 8,19
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 28
ground.hittime  = 30
ground.velocity = -3,0
air.velocity = -2.5,-6
sparkno = 3;s300

[State 1012,2]
type = Explod
triggerall = numexplod(1012) = 0
trigger1 = movehit = 1
anim = 351
id = 1012
postype = p2
pos = 10,-68
facing = -1
vel = 0,0
ownpal = 0
;ontop = 1
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = -1
sprpriority = 4
removetime = 14;
ignorehitpause = 1

[State 1012,4]
type = DestroySelf
trigger1 = time = 80
trigger2 = movecontact = 1


;============================================
;空中マジカルシュート《イーグル》
;============================================
;弱
[Statedef 1020]
type    = A
movetype= A
physics = A
juggle  = 2
poweradd= ifelse(var(51)= 0,60,0)
velset = 0,0
anim = 1020
ctrl = 0
sprpriority = 2

[State 1020,0]
type = VelSet
trigger1 = 1
x = 0
y = 0

;マギカモード：魔力消費
[State 1020,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State -2,魔法文字消去]
type = removeExplod
trigger1 = time = 0
trigger1 = numexplod(380) != 0
id = 380

[State 1020,0]
type = PlaySnd
trigger1 = time = 20
value = s0,7
volume = 250

;演出用エフェクト
[State 1020,1]
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

[State 1020,2]
type = ChangeAnim
trigger1 = time = 0
trigger1 = PrevStateno = [600,620]
value = 1020
elem = 4

;飛び道具
[State 1020,3]
type = helper
trigger1 = AnimElem = 5
helpertype = normal
neme = "Magical_shoot_E"
ID = 1025
pos = 10,-68
postype = p1
stateno = 1025
keyctrl = 0
persistent = 0

[State 1020,4]
type = ChangeState
trigger1 = AnimTime = 0
value = 1021

;落下
[Statedef 1021]
type    = A
movetype= A
physics = A
juggle  = 0
poweradd= 0
anim = 1021
ctrl = 0
sprpriority = 3

[State 1020,0]
type = VelSet
trigger1 = time = 0
x = -3
y = -3

[State 1020,4]
type = ChangeState
;trigger1 = AnimTime = 0
trigger1 = Pos Y >= 0
trigger1 = vel Y > 0
value = 1022

;着地部分
[Statedef 1022]
type    = S
movetype= A
physics = N
juggle  = 0
poweradd= 0
anim = 47
ctrl = 0
sprpriority = 3

[State 1022,0]
type = VelSet
trigger1 = time = 0
y = 0

[State 1022,1]
type = PosSet
trigger1 = time = 0
y = 0


[State 1020,2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;マジカルシュート（弱）飛び道具
[Statedef 1025]
type    = A
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 366
ctrl = 0
sprpriority = 3

[State 1025,0] 
type = velset
trigger1 = 1
x = 18
y = 7

[State 1025,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,90,80+(root,var(52)*10)), 2
getpower = 30,15
priority  = 3
hitflag = MAFD
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

[State 1025,2]
type = Explod
triggerall = numexplod(1025) = 0
trigger1 = movehit = 1
trigger2 = helper(1025),pos Y >= 0
trigger2 = helper(1025),Vel Y > 0
anim = 367
id = 1025
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

[State 1025,4]
type = DestroySelf
trigger1 = time = 50
trigger2 = movecontact = 1
trigger3 = helper(1025),pos Y >= 0
trigger3 = helper(1025),Vel Y > 0

;-------------------------------------------------------------
;マジカルシュート・イーグル　中
[Statedef 1030]
type    = A
movetype= A
physics = A
juggle  = 2
poweradd= ifelse(var(51)= 0,60,0)
velset = 0,0
anim = 1030
ctrl = 0
sprpriority = 2

[State 1030,0]
type = VelSet
trigger1 = 1
x = 0
y = 0

;マギカモード：魔力消費
[State 1030,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State -2,魔法文字消去]
type = removeExplod
trigger1 = time = 0
trigger1 = numexplod(380) != 0
id = 380

[State 1030,0]
type = PlaySnd
trigger1 = time = 20
value = s0,7
volume = 250

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

[State 1030,2]
type = ChangeAnim
trigger1 = time = 0
trigger1 = PrevStateno = [600,620]
value = 1030
elem = 4

;飛び道具
[State 1030,3]
type = helper
trigger1 = AnimElem = 5
helpertype = normal
neme = "Magical_shoot_E"
ID = 1035
pos = 10,-68
postype = p1
stateno = 1035
keyctrl = 0
persistent = 0

[State 1030,4]
type = ChangeState
trigger1 = AnimTime = 0
value = 1031

[Statedef 1031]
type    = S
movetype= A
physics = A
juggle  = 0
poweradd= 0
anim = 1021
ctrl = 0
sprpriority = 3

[State 1030,0]
type = VelSet
trigger1 = time = 0
x = -4
y = -5

[State 1030,4]
type = ChangeState
;trigger1 = AnimTime = 0
trigger1 = Pos Y >= 0
trigger1 = vel Y > 0
value = 1022


;---------------------------------------------------------------------------
;マジカルシュート（中）飛び道具
[Statedef 1035]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 366
ctrl = 0
sprpriority = 3

[State 1035,0] 
type = velset
trigger1 = 1
x = 20;20*18/18
y = 7.8;70/9;20*7/18

[State 1025,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,100,90+(root,var(52)*10)), 2
getpower = 30,15
priority  = 3
hitflag = MAFD
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

[State 1035,2]
type = Explod
triggerall = numexplod(1035) = 0
trigger1 = movehit = 1
trigger2 = helper(1035),pos Y >= 0
trigger2 = helper(1035),Vel Y > 0
anim = 367
id = 1035
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

[State 1035,4]
type = DestroySelf
trigger1 = time = 50
trigger2 = movecontact = 1
trigger3 = helper(1035),pos Y >= 0
trigger3 = helper(1035),Vel Y > 0

;-------------------------------------------------------------
;マジカルシュート・イーグル　強
[Statedef 1040]
type    = A
movetype= A
physics = A
juggle  = 2
poweradd= ifelse(var(51)= 0,60,0)
velset = 0,0
anim = 1040
ctrl = 0
sprpriority = 2

[State 1040,0]
type = VelSet
trigger1 = 1
x = 0
y = 0

;マギカモード：魔力消費
[State 1040,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -80

[State -2,魔法文字消去]
type = removeExplod
trigger1 = time = 0
trigger1 = numexplod(380) != 0
id = 380

[State 1040,0]
type = PlaySnd
trigger1 = time = 20
value = s0,7
volume = 250

;演出用エフェクト
[State 1040,1]
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

[State 1040,2]
type = ChangeAnim
trigger1 = time = 0
trigger1 = PrevStateno = [600,620]
value = 1040
elem = 4

;飛び道具
[State 1040,3]
type = helper
trigger1 = AnimElem = 5
helpertype = normal
neme = "Magical_shoot_E"
ID = 1045
pos = 10,-72
postype = p1
stateno = 1045
keyctrl = 0
persistent = 0

[State 1040,3]
type = helper
trigger1 = AnimElem = 5
helpertype = normal
neme = "Magical_shoot_E"
ID = 1046
pos = 10,-68
postype = p1
stateno = 1046
keyctrl = 0
persistent = 0

[State 1040,4]
type = ChangeState
trigger1 = AnimTime = 0
value = 1041

[Statedef 1041]
type    = S
movetype= A
physics = A
juggle  = 0
poweradd= 0
anim = 1021
ctrl = 0
sprpriority = 3

[State 1041,0]
type = VelSet
trigger1 = time = 0
x = -5
y = -5

[State 1041,4]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = vel Y > 0
value = 1022

;---------------------------------------------------------------------------
;マジカルシュート（強）飛び道具
[Statedef 1045]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 360
ctrl = 0
sprpriority = 3

[State 1045,0] 
type = velset
trigger1 = 1
x = 15;20

[State 1045,1]
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,90,80+(root,var(52)*10)), 2
getpower = 15,7
priority  = 3
hitflag = MAFD
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

[State 1045,2]
type = Explod
triggerall = numexplod(1045) = 0
trigger1 = movehit = 1
trigger2 = helper(1045),pos Y >= 0
trigger2 = helper(1045),Vel Y > 0
anim = 361
id = 1045
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

[State 1045,4]
type = DestroySelf
trigger1 = time = 20
trigger2 = movecontact = 1
trigger3 = helper(1045),pos Y >= 0
trigger3 = helper(1045),Vel Y > 0

;---------------------------------------------------------------------------
;マジカルシュート（強）飛び道具２
[Statedef 1046]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 366
ctrl = 0
sprpriority = 3

[State 1035,0] 
type = velset
trigger1 = 1
x = 20;20*18/18
y = 7.8;70/9;20*7/18

[State 1046,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Diagup;Hard
damage    = ifelse(root,var(51)= 0,90,80+(root,var(52)*10)), 2
getpower = 15,7
priority  = 3
hitflag = MAFD
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

[State 1046,2]
type = Explod
triggerall = numexplod(1046) = 0
trigger1 = movehit = 1
trigger2 = helper(1046),pos Y >= 0
trigger2 = helper(1046),Vel Y > 0
anim = 367
id = 1046
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

[State 1046,4]
type = DestroySelf
trigger1 = time = 50
trigger2 = movecontact = 1
trigger3 = helper(1046),pos Y >= 0
trigger3 = helper(1046),Vel Y > 0

;==================================================
;マジカルシュート《スパイラル》
;==================================================
;弱
[Statedef 1050]
type    = S
movetype= A
physics = S
juggle  = 2
poweradd= 20
velset = 0,0
anim = 1050
ctrl = 0
sprpriority = 2

[State 1050,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -100

[State 1050,魔法文字消去]
type = removeExplod
trigger1 = time = 0
trigger1 = numexplod(380) != 0
id = 380

[State 1050,0]
type = PlaySnd
trigger1 = AnimElem = 3
value = s1000,1

;演出用エフェクト
[State 1050,1]
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
[State 1050,1]
type = helper
trigger1 = AnimElem = 7
helpertype = normal
neme = "Magical_shoot_E"
ID = 1050
pos = 10,-68
postype = p1
stateno = 1051
keyctrl = 0
persistent = 0

[State 1050,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;マジカルシュート（弱）
[Statedef 1051]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 370
ctrl = 0
sprpriority = 5

[State 1051,0] 
type = velset
trigger1 = helper(1050),time <= 35
x = 0
[State 1051,0] 
type = velset
trigger1 = helper(1050),time > 35
x = 18

[State 1051,0]
type = posadd
trigger1 = helper(1050),vel x > 0
trigger1 = helper(1050),anim = 370
x = 20


[State 1051,0]
type = changeanim
trigger1 = helper(1050),time > 35; vel; x > 0
trigger1 = helper(1050),anim = 370
value = 371

[State 300,0]
type = BindToRoot
trigger1 = helper(1050),time = 0;helper(1050),time > 35
time = 33
pos = 10,-68

[State 1051,1] 
type = HitDef
triggerall = helper(1050),time <= 35
triggerall = helper(1050),Vel X <= 0
trigger1 = time = 0
trigger2 = helper(1050),anim = 370 && animelem = 3
trigger3 = helper(1050),anim = 370 && animelem = 5
;trigger4 = helper(1050),anim = 371 && animelem = 2
;trigger5 = helper(1050),anim = 371 && animelem = 4
attr = S, SP
animtype  = Hard
damage    = 1,1
priority  = 5
guardflag = MA
pausetime = 1,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 22
ground.hittime  = 25
ground.velocity = -4,0
air.velocity = -3.5,-3
sparkno = 3;s300

[State 1051,1] 
type = HitDef
trigger1 = helper(1050),anim = 371
trigger1 = helper(1050),time > 35
trigger1 = helper(1050),Vel X > 0
attr = S, SP
animtype  = Hard
damage    = 90, 2
priority  = 5
guardflag = MA
pausetime = 8,8
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 22
ground.hittime  = 25
ground.velocity = -4,0
air.velocity = -3.5,-3
sparkno = 3;s300
hitonce = 1
fall = 1
air.recover = 0

[State 1051,2]
type = Explod
triggerall = numexplod(1001) = 0
trigger1 = movehit = 1
anim = 351
id = 1001
postype = p2
pos = 0,-68
vel = 0,0
ownpal = 0
facing = -1
;ontop = 1
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = -1
sprpriority = 4
removetime = 14
ignorehitpause = 1

[State 1051,4]
type = DestroySelf
trigger1 = time = 90
trigger2 = helper,anim = 371
trigger2 = helper(1050),time > 35
trigger2 = helper(1050),Vel X > 0
trigger2 = helper(1050),movecontact = 1


;----------------------------------
;マジカルシュート《スパイラル》
;中
[Statedef 1055]
type    = S
movetype= A
physics = S
juggle  = 2
poweradd= 20
velset = 0,0
anim = 1055
ctrl = 0
sprpriority = 2

[State 1055,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -100

[State 1055,魔法文字消去]
type = removeExplod
trigger1 = time = 0
trigger1 = numexplod(380) != 0
id = 380

[State 1055,0]
type = PlaySnd
trigger1 = AnimElem = 3
value = s1000,1

;演出用エフェクト
[State 1055,1]
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
[State 1055,1]
type = helper
trigger1 = AnimElem = 7
helpertype = normal
neme = "Magical_shoot_E"
ID = 1055
pos = 10,-68
postype = p1
stateno = 1056
keyctrl = 0
persistent = 0

[State 1055,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;マジカルシュートＳ（中）
[Statedef 1056]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 370
ctrl = 0
sprpriority = 5

[State 1056,0] 
type = velset
trigger1 = helper(1055),time <= 45
x = 0
[State 1056,0] 
type = velset
trigger1 = helper(1055),time > 45
x = 18

[State 1056,0]
type = posadd
trigger1 = helper(1055),vel x > 0
trigger1 = helper(1055),anim = 370
x = 20


[State 1056,0]
type = changeanim
trigger1 = helper(1055),time > 45; vel; x > 0
trigger1 = helper(1055),anim = 370
value = 371

[State 300,0]
type = BindToRoot
trigger1 = helper(1055),time = 0
time = 43
pos = 10,-68

[State 1056,1] 
type = HitDef
triggerall = helper(1055),time <= 45
triggerall = helper(1055),Vel X <= 0
trigger1 = time = 0
trigger2 = helper(1055),anim = 370 && animelem = 3
trigger3 = helper(1055),anim = 370 && animelem = 5
;trigger4 = helper(1055),anim = 371 && animelem = 2
;trigger5 = helper(1055),anim = 371 && animelem = 4
attr = S, SP
animtype  = Hard
damage    = 2,1
priority  = 5
guardflag = MA
pausetime = 1,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 22
ground.hittime  = 25
ground.velocity = -4,0
air.velocity = -3.5,-3
sparkno = 3;s300

[State 1056,1] 
type = HitDef
trigger1 = helper(1055),anim = 371
trigger1 = helper(1055),time > 45
trigger1 = helper(1055),Vel X > 0
attr = S, SP
animtype  = Hard
damage    = 100, 2
priority  = 5
guardflag = MA
pausetime = 8,8
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 22
ground.hittime  = 25
ground.velocity = -4,0
air.velocity = -3.5,-3
sparkno = 3;s300
hitonce = 1
fall = 1
air.recover = 0

[State 1056,2]
type = Explod
triggerall = numexplod(1001) = 0
trigger1 = movehit = 1
anim = 351
id = 1001
postype = p2
pos = 0,-68
vel = 0,0
ownpal = 0
facing = -1
;ontop = 1
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = -1
sprpriority = 4
removetime = 14
ignorehitpause = 1

[State 1056,4]
type = DestroySelf
trigger1 = time = 90
trigger2 = helper,anim = 371
trigger2 = helper(1055),time > 45
trigger1 = helper(1055),Vel X > 0
trigger2 = helper(1055),movecontact = 1



;---------------------------------------------------------------------------
;マジカルシュート《スパイラル》
;強
[Statedef 1060]
type    = S
movetype= A
physics = S
juggle  = 2
poweradd= 20
velset = 0,0
anim = 1060
ctrl = 0
sprpriority = 2

[State 1060,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -100

[State 1060,魔法文字消去]
type = removeExplod
trigger1 = time = 0
trigger1 = numexplod(380) != 0
id = 380

[State 1060,0]
type = PlaySnd
trigger1 = AnimElem = 3
value = s1000,1

;演出用エフェクト
[State 1060,1]
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
[State 1060,1]
type = helper
trigger1 = AnimElem = 7
helpertype = normal
neme = "Magical_shoot_E"
ID = 1060
pos = 10,-68
postype = p1
stateno = 1061
keyctrl = 0
persistent = 0


;飛び道具
[State 1010,1]
type = null;helper
trigger1 = AnimElem = 17
helpertype = normal
neme = "Magical_shoot_E"
ID = 1062
pos = 10,-68
postype = p1
stateno = 1062
keyctrl = 0
persistent = 0


[State 1060,3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;マジカルシュートＳ（中）
[Statedef 1061]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 370
ctrl = 0
sprpriority = 5

[State 1061,0] 
type = velset
trigger1 = helper(1060),time <= 55
x = 0
[State 1061,0] 
type = velset
trigger1 = helper(1060),time > 55
x = 18

[State 1061,0]
type = posadd
trigger1 = helper(1060),vel x > 0
trigger1 = helper(1060),anim = 370
x = 20


[State 1061,0]
type = changeanim
trigger1 = helper(1060),time > 55
trigger1 = helper(1060),anim = 370
value = 371

[State 361,0]
type = BindToRoot
trigger1 = helper(1060),time = 0
time = 43
pos = 10,-68

[State 1061,1] 
type = HitDef
triggerall = helper(1060),time <= 55
triggerall = helper(1060),Vel X <= 0
trigger1 = time = 0
trigger2 = helper(1060),anim = 370 && animelem = 3
trigger3 = helper(1060),anim = 370 && animelem = 5
;trigger4 = helper(1060),anim = 371 && animelem = 2
;trigger5 = helper(1060),anim = 371 && animelem = 4
attr = S, SP
animtype  = Hard
damage    = 3,1
priority  = 5
guardflag = MA
pausetime = 1,12
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 22
ground.hittime  = 25
ground.velocity = -4,0
air.velocity = -3.5,-3
sparkno = 3;s300

[State 1061,1] 
type = HitDef
trigger1 = helper(1060),anim = 371
trigger1 = helper(1060),time > 55
trigger1 = helper(1060),Vel X > 0
attr = S, SP
animtype  = Hard
damage    = 120, 2
priority  = 5
guardflag = MA
pausetime = 8,8
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 22
ground.hittime  = 25
ground.velocity = -4,0
air.velocity = -3.5,-3
sparkno = 3;s300
hitonce = 1
fall = 1
air.recover = 0

[State 1061,2]
type = Explod
triggerall = numexplod(1001) = 0
trigger1 = movehit = 1
anim = 351
id = 1001
postype = p2
pos = 0,-68
vel = 0,0
ownpal = 0
facing = -1
;ontop = 1
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = -1
sprpriority = 4
removetime = 14
ignorehitpause = 1

[State 1061,4]
type = DestroySelf
trigger1 = time = 90
trigger2 = helper,anim = 371
trigger2 = helper(1060),time > 45
trigger2 = helper(1060),Vel X > 0
trigger2 = helper(1060),movecontact = 1



;---------------------------------------------------------------------------
;マジカル・シュート《イーグル》矢1
[Statedef 1062]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 300
ctrl = 0
sprpriority = 3

[State 1062,0] 
type = velset
trigger1 = helper(1062),time <= 20
x = 0
[State 1062,0] 
type = velset
trigger1 = helper(1062),time > 20
x = 25

[State 1062,0]
type = posadd
trigger1 = helper(1062),vel x > 0
trigger1 = helper(1062),anim = 300
x = 20

[State 1062,0]
type = changeanim
trigger1 = helper(1062),vel x > 0
trigger1 = helper(1062),anim = 300
value = 350

[State 1062,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Hard
damage    = 80, 2
priority  = 3
guardflag = MA
pausetime = 8,19
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 28
ground.hittime  = 30
ground.velocity = -3,0
air.velocity = -2.5,-6
sparkno = 3;s300
hitonce = 1

[State 1062,2]
type = Explod
triggerall = numexplod(1012) = 0
trigger1 = movehit = 1
anim = 351
id = 1012
postype = p2
pos = 10,-68
facing = -1
vel = 0,0
ownpal = 0
;ontop = 1
supermove = 100
pausemovetime = 100
shadow = 0,0,0
bindtime = -1
sprpriority = 4
removetime = 14;
ignorehitpause = 1
fall = 1

[State 1062,4]
type = DestroySelf
trigger1 = time = 80
trigger2 = movecontact = 1









;---------------------------------------------------------------------------
;===========================================================================
;マジカルシュート《クラック》
;===========================================================================
[Statedef 1080]
type    = S
movetype= A
physics = S
juggle  = 2
poweradd= ifelse(var(51)= 0,-100,0)
velset = 0,0
anim = 1080
ctrl = 0
sprpriority = 2

[State 1080, NotHitby]
type = NotHitBy
trigger1 = 1
value = SCA

;マギカモード：魔力消費
[State 1080,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -100

[State -2,魔法文字消去]
type = removeExplod
trigger1 = time = 0
trigger1 = numexplod(380) != 0
id = 380

[State 1080,0]
type = PlaySnd
trigger1 = time = 20
value = s0,7
volume = 250

;演出用エフェクト
[State 1080,1]
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

[State 1080,2]
type = null;ChangeAnim
trigger1 = time = 0
trigger1 = PrevStateno = [200,220]
value = 1000
elem = 5

;飛び道具
[State 1080,3]
type = helper
trigger1 = AnimElem = 6
helpertype = normal
neme = "Magical_shoot_E"
ID = 1080
pos = 10,-68
postype = p1
stateno = 1081
keyctrl = 0
persistent = 0
size.xscale =0.6
size.yscale =0.6

[State 1080,4]
type = NotHitBy
trigger1 = 1;time = 0
value = SCA
time = 1

[State 1080,5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;マジカルクラックショット
[Statedef 1081]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 1081
ctrl = 0
sprpriority = 3

[State 1081,0] 
type = velset
trigger1 = helper(1080),time >= 0
x = 0

[State 1081,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Hard
damage    = ifelse(root,var(51)= 0,90,80+(root,var(52)*10)), 2
getpower = 30,15
priority  = 3
guardflag = ;MA
pausetime = 12,15
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 22
ground.hittime  = 25
ground.velocity = -2,-4
air.velocity = -2.5,-4.5
sparkno = 3;s300

[State 1081,2]
type = Explod
triggerall = numexplod(1081) = 0
trigger1 = movehit = 1
anim = 351
id = 1081
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

[State 1081,4]
type = DestroySelf
trigger1 = helper(1080),animtime = 0;90
trigger2 = helper(1080),movetype = h
;trigger2 = movecontact = 1



;---------------------------------------------------------------------------
;===========================================================================
;結界
;===========================================================================
[Statedef 1090]
type    = S
movetype= I
physics = S
juggle  = 0
poweradd= 0;ifelse(var(51)= 0,-100,0)
velset = 0,0
ctrl = 0
sprpriority = 2

[State 1090,2]
type = ChangeAnim
trigger1 = time = 0
value = 1090

[State 1090,0]
type = Poweradd
trigger1 = time >= 0
value = -3

;マギカモード：魔力消費
[State 1090,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -100

[State 1090,魔法文字消去]
type = removeExplod
trigger1 = time = 0
trigger1 = numexplod(380) != 0
id = 380

[State 1080,0]
type = null;PlaySnd
trigger1 = time = 20
value = s0,7
volume = 250

;演出用エフェクト
[State 1090,1]
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
[State 1090,3]
type = helper
trigger1 = numhelper(1090) = 0
trigger1 = time >= 0
helpertype = normal
neme = "Magical_Shield"
ID = 1090
pos = 0,-50
postype = p1
stateno = 1095
keyctrl = 0
persistent = 0
size.xscale =0.6
size.yscale =0.6

;プッシュ用
[State 1090,3]
type = helper
trigger1 = PrevStateno = 1091
trigger1 = time = 0
helpertype = normal
neme = "Magical_Shield_push"
ID = 1091
pos = 0,0
postype = p1
stateno = 1098
keyctrl = 0
persistent = 0
size.xscale = 1
size.yscale = 1
[State 1090,3]
type = helper
trigger1 = prevstateno = 1091
trigger1 = time = 0
helpertype = normal
neme = "Magical_Shield_push"
ID = 1092
pos = 0,0
postype = p1
stateno = 1099
keyctrl = 0
persistent = 0
size.xscale = 1
size.yscale = 1

[State 1090,4]
type = null;NotHitBy
trigger1 = 1;time = 0
value = SCA
time = 1

[State -2, Nage_Mukou]
type = HitOverRide
trigger1 = Alive = 1
time = 1
attr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
slot = 0
stateno = 1091

[State 1090,5]
type = ChangeState
;trigger1 = AnimTime = 0
trigger1 = command != "hold_x"
value = 1093
ctrl = 1

;移動
[Statedef 1091]
type    = S
movetype= I
physics = S
juggle  = 0
poweradd= 0;ifelse(var(51)= 0,-100,0)
velset = 0,0
ctrl = 0
sprpriority = 2

[State 1091,0]
type = Poweradd
trigger1 = time >= 0
value = -3

;マギカモード：魔力消費
[State 1091,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -100

[State 1091,魔法文字消去]
type = removeExplod
trigger1 = time = 0
trigger1 = numexplod(380) != 0
id = 380

[State 1081,0]
type = null;PlaySnd
trigger1 = time = 20
value = s0,7
volume = 250

;演出用エフェクト
[State 1090,1]
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

[State 1090,2]
type = null;ChangeAnim
trigger1 = time = 0
trigger1 = PrevStateno = [200,220]
value = 1000
elem = 5

;飛び道具
[State 1090,3]
type = helper
trigger1 = numhelper(1090) = 0
trigger1 = time >= 0
helpertype = normal
neme = "Magical_Shield"
ID = 1090
pos = 0,-50
postype = p1
stateno = 1095
keyctrl = 0
persistent = 0
size.xscale =0.6
size.yscale =0.6

;プッシュ用
[State 1091,3]
type = helper
trigger1 = time = 0
helpertype = normal
neme = "Magical_Shield_push"
ID = 1091
pos = 0,0
postype = p1
stateno = 1098
keyctrl = 0
persistent = 0
size.xscale = 1
size.yscale = 1
[State 1091,3]
type = helper
trigger1 = time = 0
helpertype = normal
neme = "Magical_Shield_push"
ID = 1092
pos = 0,0
postype = p1
stateno = 1099
keyctrl = 0
persistent = 0
size.xscale = 1
size.yscale = 1

[State 1091,4]
type = null;NotHitBy
trigger1 = 1;time = 0
value = SCA
time = 1

[State 1091, Nage_Mukou]
type = HitOverRide
trigger1 = Alive = 1
time = 1
attr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
slot = 0
stateno = 1092

[State 1091,5]
type = ChangeState
trigger1 = command != "hold_x"
value = 1093
ctrl = 1

;移動
[Statedef 1092]
type    = S
movetype= I
physics = S
juggle  = 0
poweradd= 0;ifelse(var(51)= 0,-100,0)
velset = 0,0
ctrl = 0
sprpriority = 2

[State 1092,0]
type = Poweradd
trigger1 = time >= 0
value = -3

;マギカモード：魔力消費
[State 1092,0]
type = Varadd
trigger1 = time = 0
trigger1 = Var(51) = 1
v = 55
value = -100

[State 1092,魔法文字消去]
type = removeExplod
trigger1 = time = 0
trigger1 = numexplod(380) != 0
id = 380

[State 1092,0]
type = null;PlaySnd
trigger1 = time = 20
value = s0,7
volume = 250

;演出用エフェクト
[State 1092,1]
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

[State 1092,2]
type = null;ChangeAnim
trigger1 = time = 0
trigger1 = PrevStateno = [200,220]
value = 1000
elem = 5

;飛び道具
[State 1092,3]
type = helper
trigger1 = numhelper(1090) = 0
trigger1 = time >= 0
helpertype = normal
neme = "Magical_Shield"
ID = 1090
pos = 0,-50
postype = p1
stateno = 1095
keyctrl = 0
persistent = 0
size.xscale =0.6
size.yscale =0.6

;プッシュ用
[State 1092,3]
type = helper
trigger1 = time = 0
helpertype = normal
neme = "Magical_Shield_push"
ID = 1091
pos = 0,0
postype = p1
stateno = 1098
keyctrl = 0
persistent = 0
size.xscale = 1
size.yscale = 1
[State 1092,3]
type = helper
trigger1 = time = 0
helpertype = normal
neme = "Magical_Shield_push"
ID = 1092
pos = 0,0
postype = p1
stateno = 1099
keyctrl = 0
persistent = 0
size.xscale = 1
size.yscale = 1

[State 1092,4]
type = null;NotHitBy
trigger1 = 1;time = 0
value = SCA
time = 1

[State 1092, Nage_Mukou]
type = HitOverRide
trigger1 = Alive = 1
time = 1
attr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
slot = 0
stateno = 1091

[State 1092,5]
type = ChangeState
trigger1 = command != "hold_x"
value = 1093
ctrl = 1

;戻り
[Statedef 1093]
type    = S
movetype= I
physics = S
juggle  = 2
poweradd= 0
velset = 0,0
anim = 1091
ctrl = 1
sprpriority = 2

[State 1093,0]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;マジカルクラックショット
[Statedef 1095]
type    = S
movetype= A
physics = N
juggle  = 1
poweradd= 0
anim = 1095
ctrl = 0
sprpriority = 3

[State 1095,0] 
type = velset
trigger1 = helper(1090),time >= 0
x = 0

[State 1000, 7]
type = BindToRoot
trigger1 = helper(1090),time >= 0
time = 1
pos = 0,-50

[State 1095,1] 
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype  = Hard
damage    = ifelse(root,var(51)= 0,90,80+(root,var(52)*10)), 2
priority  = 3
guardflag = ;MA
pausetime = 12,15
sparkxy = 0,0
hitsound   = s5,5
guardsound = s6,0
ground.type = high
ground.slidetime = 22
ground.hittime  = 25
ground.velocity = -2,-4
air.velocity = -2.5,-4.5
sparkno = 3;s300

[State 1095,2]
type = Explod
triggerall = numexplod(1081) = 0
trigger1 = movehit = 1
anim = 351
id = 1081
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

[State 1095,4]
type = DestroySelf
trigger1 = root,stateno != [1090,1092];animtime = 0
trigger2 = helper(1090),movetype = h
;trigger2 = movecontact = 1

;-------------------------------------------
;プッシュ用１
[Statedef 1098]
type    = S
movetype= A
physics = N
juggle  = 0
poweradd= 0
velset = 10,0
anim = 1092
ctrl = 0
sprpriority = 2

[State 1098, NotHitby]
type = NotHitBy
trigger1 = helper(1091),time >= 0
value = SCA

[State 1098,0]
type = Velset
trigger1 = helper(1091),time >= 0
value = 10+(abs(enemynear,vel X))

[State 1098,0]
type = PlayerPush
trigger1 = helper(1091),time >= 0
value = 1

[State 1098,0]
type = DestroySelf
trigger1 = helper(1091),AnimTime = 0

;-------------------------------------------
;プッシュ用２
[Statedef 1099]
type    = S
movetype= A
physics = N
juggle  = 0
poweradd= 0
velset = -10,0
anim = 1092
ctrl = 0
sprpriority = 2

[State 1099, NotHitby]
type = NotHitBy
trigger1 = helper(1092),time >= 0
value = SCA

[State 1099,0]
type = Velset
trigger1 = helper(1092),time >= 0
value = -10-(abs(enemynear,vel X))

[State 1099,0]
type = PlayerPush
trigger1 = helper(1092),time >= 0
value = 1

[State 1099,0]
type = DestroySelf
trigger1 = helper(1092),AnimTime = 0