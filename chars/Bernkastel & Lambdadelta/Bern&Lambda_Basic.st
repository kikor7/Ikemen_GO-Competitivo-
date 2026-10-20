
;===========================================================================
; 通常攻撃技
;===========================================================================
;---------------------------------------------------------------------------
;立ち弱攻撃
[Statedef 200]
type    = S
movetype= A
physics = S
juggle  = 1
velset = 0,0
ctrl = 0
anim = 200
poweradd = 0
sprpriority = 2
facep2 = 1

[State 200, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = 0, 0

[State -3, ボイス分岐・ベルン]
type = VarRandom
trigger1 = Time = 1
v = 6
range = 100,101

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,var(6)
channel = 1
ignorehitpause = 1

[State 200, ヒット定義]
type = HitDef
trigger1 = AnimElem = 2
attr = S, NA
damage = 20, 0
getpower = 30,15
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 8, 8
sparkno = -1
guard.sparkno = -1
sparkxy = -10, -76
hitsound = s12, 0
guardsound = s6, 0
ground.type = High
ground.slidetime = 4
ground.hittime  = 8
guard.slidetime = 4
guard.hittime = 6
guard.ctrltime = 6
ground.velocity = -1.9
airguard.velocity = -1.8,-.8
air.type = High
air.velocity = -1.6,-3
air.hittime = 12
yaccel = .44
fall.recovertime = 20
ID = 200

[State 200, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(200)
trigger1 = NumExplod(200) = 0
anim = 4200
ID = 200
pos = ceil(100*Const(size.xscale)), ceil(-150*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 200, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(200)
trigger1 = NumExplod(200) = 0
anim = 4230
ID = 200
pos = ceil(100*Const(size.xscale)), ceil(-150*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 200, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;ベルンアッパー
[Statedef 205]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= 0
ctrl = 0
velset = 0,0
anim = 205
sprpriority = 2

[State 205, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 2
value = 0, 2

[State -3, ボイス分岐・ベルン]
type = VarRandom
trigger1 = Time = 1
v = 6
range = 102,103

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,var(6)
channel = 1
ignorehitpause = 1

[State 205, ヒット定義]
type = HitDef
trigger1 = AnimElem = 3
attr = S, NA
animtype  = Medium
damage    = 52
getpower = 30,15
guardflag = MA
pausetime = 12,12
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-70
hitsound   = s12,1
guardsound = s6,0
ground.type = High
ground.slidetime = 19
ground.hittime  = 21
guard.slidetime = 19
guard.hittime = 19
guard.ctrltime = 19
ground.velocity = -3.2
air.velocity = -2.8,-4
fall.recovertime = 30
yaccel = .44
ID = 205

[State 205, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(205)
trigger1 = NumExplod(205) = 0
anim = 4210
ID = 205
pos = ceil(135*Const(size.xscale)), ceil(-140*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 205, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(205)
trigger1 = NumExplod(205) = 0
anim = 4230
ID = 205
pos = ceil(135*Const(size.xscale)), ceil(-140*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 205, 物理的なキャラの幅]
type = Width
trigger1 = (AnimElemTime (2) >= 0) && (AnimElemTime (3) < 0)
value = 10,0

[State 205, 物理的なキャラの幅]
type = Width
trigger1 = (AnimElemTime (3) >= 0)
value = 20,0

[State 205, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;立ち中攻撃
[Statedef 210]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= 0
ctrl = 0
velset = 0,0
anim = 210+ceil(var(10)*0.01)
sprpriority = 2

[State 210, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 2
value = 0, 2

[State -3, ボイス分岐・ラムダ]
type = VarRandom
trigger1 = Time = 1
v = 7
range = 101,102

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,var(7)
channel = 2
ignorehitpause = 1

[State 210, ヒット定義]
type = HitDef
trigger1 = AnimElem = 2
attr = S, NA
animtype  = Medium
damage    = 43
getpower = 30,15
guardflag = MA
pausetime = 10,10
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-70
hitsound   = s12,1
guardsound = s6,0
ground.type = Low
ground.slidetime = 14
ground.hittime  = ifelse(var(11),5,17)
guard.slidetime = 14
guard.hittime = 14
guard.ctrltime = 14
ground.velocity = -2.5,ifelse(var(11),-2.5,0)
air.velocity = -2.8,-4
fall.recovertime = 30
yaccel = .44
ID = 210

[State 210, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(210)
trigger1 = NumExplod(210) = 0
anim = 4210
ID = 210
pos = ceil(100*Const(size.xscale)), ceil(-95*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 210, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(210)
trigger1 = NumExplod(210) = 0
anim = 4230
ID = 210
pos = ceil(100*Const(size.xscale)), ceil(-95*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 210, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;立ち強攻撃
[Statedef 220]
type    = S
movetype= A
physics = S
juggle  = 5
poweradd= 0
ctrl = 0
velset = 0,0
anim = 220
sprpriority = 2

[State 220, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 2
value = 0, 3

[State -3, ボイス分岐・ベルン]
type = VarRandom
trigger1 = Time = 1
v = 6
range = 103,104

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,var(6)
channel = 1
ignorehitpause = 1

[State -3, ボイス分岐・ラムダ]
type = VarRandom
trigger1 = Time = 1
v = 7
range = 104,107

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,var(7)
channel = 2
ignorehitpause = 1

[State 220, ヒット定義]
type = HitDef
trigger1 = AnimElem = 2
attr = S, NA
animtype  = Hard
damage    = 70
getpower = 30,15
guardflag = MA
pausetime = 8,8
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-60
hitsound   = s12,2
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
guard.slidetime = 14
guard.hittime = 14
guard.ctrltime = 14
ground.velocity = -3,-3.5
air.velocity = -3,-3
fall = 1
fall.recover = 0
yaccel = .44
p2stateno = 222
ID = 220

[State 220, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(220)
trigger1 = NumExplod(220) = 0
anim = 4220
ID = 220
pos = ceil(120*Const(size.xscale)), ceil(-113*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 220, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(220)
trigger1 = NumExplod(220) = 0
anim = 4230
ID = 220
pos = ceil(120*Const(size.xscale)), ceil(-113*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 220, ヒット]
type = varset
trigger1 = movehit = 1
trigger1 = var(11) = 0
var(11) = 70

[State 220, ヒット]
Type     = Helper
Trigger1 = MoveHit = 1
Trigger1 = numhelper(224) = 0
Name     = "hit"
Stateno  = 224
ID       = 224
Pos      = ceil(200*Const(size.xscale)), 0
PosType  = P1
OwnPal   = 1
IgnoreHitPause = 1
Persistent = 0
size.xscale = Const(size.xscale)
size.yscale = Const(size.yscale)

[State 220, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;スリップダウン
[Statedef 222]
type    = U;S
movetype= H
physics = N
poweradd= 0
velset = 0,0
ctrl = 0
sprpriority = 0

[State 222, ステート変更]
type = ChangeState
;triggerall = Time = 0
trigger1 = statetype != S && statetype != C
trigger2 = alive = 0
value = 223

[State 222, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 222, StateTypeSet]
type = StateTypeSet
trigger1 = StateType = C
trigger1 = Time = 0
statetype = S

[State 222, StateTypeSet]
type = StateTypeSet
trigger1 = Time = 1
movetype = I

[State 222, StateTypeSet]
type = StateTypeSet
trigger1 = Time = 32
;statetype = L
;movetype = H
physics = S

[State 222, 移動速度]
type = VelSet
trigger1 = Time = 8
x = -4

[State 222, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = statetype = S || statetype = C
trigger1 = alive
trigger1 = Time = 0
value = 5002

[State 222, 制御した相手のアニメ変更]
type = ChangeAnim
triggerall = Time = 0
trigger1 = statetype != S && statetype != C
trigger2 = alive = 0
value = 5030

[State 222, 制御した相手のアニメ変更]
type = ChangeAnim
Trigger1 = Time = 8
value = 5160

[State 222, 制御した相手のアニメ変更]
type = ChangeAnim
Trigger1 = Time = 16
value = 5170

[State 222, 制御した相手のアニメ変更]
type = ChangeAnim
Trigger1 = Time = 32
value = 5110

;[State 1120, 速度加算]
;type = Velset
;trigger1 = anim = 5110
;x = 0

[State 222, 相手ステートに戻す]
type = SelfState
trigger1 = anim = 5110
trigger1 = alive = 0
value = 5100

[State 222, 相手ステートに戻す]
type = SelfState
trigger1 = time = 70
value = 5120

;---------------------------------------------------------------------------
;スリップダウンせず吹き飛び
[Statedef 223]
type    = A
movetype= H
physics = N
poweradd= 0
velset = 0,0
ctrl = 0
sprpriority = 0

[State 223, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = Time = 0
value = 5030

[State 223, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = anim = 5030
trigger1 = AnimTime = 0
value = 5035

[State 223, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = anim = 5035
trigger1 = AnimTime = 0
value = 5050

[State 223, 移動速度]
type = VelSet
trigger1 = Time = 0
x = -4.5
y = -3.5

[State 223, 速度加算];重力
type = VelAdd
trigger1 = 1
y = .44

[State 223, 相手ステートに戻す]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100

;---------------------------------------------------------------------------
;スリップダウン・効果ヘルパー
[Statedef 224]
type    = S
movetype= I
physics = N
poweradd= 0
velset = 0,0
ctrl = 0
anim = 224
sprpriority = 0

[State 224, 音を鳴らす]
type     = PlaySnd
trigger1 = time = 8
value    = s13, 1
ignorehitpause = 1

[State 224, destroyself]
type = destroyself
trigger1 = AnimTime = 0

;---------------------------------------------------------------------------
;ラムダタックル
[Statedef 225]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= 0
ctrl = 0
velset = 0,0
anim = 225+ceil(var(11)*0.01)
sprpriority = 2

[State 225, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 2
value = 0, 4

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,105
channel = 1
ignorehitpause = 1

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,103
channel = 2
ignorehitpause = 1

[State 225, 移動速度]
type = VelSet
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
x = 4

[State 225, ヒット]
type = varset
trigger1 = movehit = 1
trigger1 = var(11) = 0
var(11) = 70

[State 225, ヒット]
type = varset
trigger1 = movehit = 1
trigger1 = var(12) = 0
var(12) = 30

[State 225, ヒット定義]
type = HitDef
trigger1 = AnimElem = 3
attr = S, NA
animtype  = Hard
damage    = 60
getpower = 30,15
guardflag = MA
pausetime = 12,12
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-70
hitsound   = s12,2
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 13
ground.velocity = -7.5
air.velocity = -5.5,-4
fall.recovertime = 40
yaccel = .44
p2stateno = 222+5*ceil(var(11)*0.01)
ID = 225

[State 225, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(225)
trigger1 = NumExplod(225) = 0
anim = 4220
ID = 225
pos = ceil(120*Const(size.xscale)), ceil(-90*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 225, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(225)
trigger1 = NumExplod(225) = 0
anim = 4230
ID = 225
pos = ceil(120*Const(size.xscale)), ceil(-90*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 225, 物理的なキャラの幅]
type = Width
Trigger1 = MoveHit = 0
trigger1 = (AnimElemTime (3) >= 0); && (AnimElemTime (4) < 0)
value = 30,0

[State 225, ヒット]
Type     = Helper
Trigger1 = MoveHit = 1
Trigger1 = numhelper(224) = 0
Name     = "hit"
Stateno  = 224
ID       = 224
Pos      = ceil(200*Const(size.xscale)), 0
PosType  = P1
OwnPal   = 1
IgnoreHitPause = 1
Persistent = 0
size.xscale = Const(size.xscale)
size.yscale = Const(size.yscale)

[State 225, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;スリップダウンせず吹き飛び
[Statedef 227]
type    = A
movetype= H
physics = N
poweradd= 0
velset = 0,0
ctrl = 0
sprpriority = 0

[State 223, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = Time = 0
value = 5030

[State 223, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = anim = 5030
trigger1 = AnimTime = 0
value = 5035

[State 223, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = anim = 5035
trigger1 = AnimTime = 0
value = 5050

[State 223, 移動速度]
type = VelSet
trigger1 = Time = 0
x = -3.5
y = -3.2

[State 223, 速度加算];重力
type = VelAdd
trigger1 = 1
y = .44

[State 223, 相手ステートに戻す]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 52

;---------------------------------------------------------------------------
;ステップ
[Statedef 230]
type    = S
movetype= I
physics = N
poweradd= 0
ctrl = 0
velset = 6.2,0
anim = 230
sprpriority = 1

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,80
channel = 1
ignorehitpause = 1

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,83
channel = 2
ignorehitpause = 1

[State 230, ガードキャンセル]
type      = PowerAdd
Trigger1  = !time
Trigger1  = (prevStateNo=150)||(prevStateNo=151)||(prevStateNo=152)||(prevStateNo=153)
value     = -1000

[State 230, ステップキャンセル]
type      = PowerAdd
Trigger1  = !time
Trigger1  = (prevstateno = [200,299]) || (prevstateno = [400,499]) || (stateno = [1000,1160]) 
value     = -1000

[State 230, NotHitBy]
type = NotHitBy
trigger1 = 1
value = ,AA,AP
time = 1

[State 230, 物理的なキャラの幅]
type = Width
trigger1 = 1
player = 0,0

[State 230, AfterImage]
type = AfterImage
trigger1 = !Time
time = 16
length = 12
palcolor = 128;256
;palbright = 0,0,0
palcontrast = 220,220,220
paladd = 0,0,0
timegap = 1
framegap = 4

[State 230, すり抜け]
type = PlayerPush
trigger1 = 1
value = 0

[State 230, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;バックステップ
[Statedef 235]
type    = S
movetype= I
physics = N
poweradd= 0
ctrl = 0
velset = -3.8,0
anim = 235
sprpriority = 1

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,81
channel = 1
ignorehitpause = 1

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,84
channel = 2
ignorehitpause = 1

[State 235, ステップキャンセル]
type      = PowerAdd
Trigger1  = !time
Trigger1  = (prevstateno = [200,299]) || (prevstateno = [400,499]) || (stateno = [1000,1160]) 
value     = -1000

[State 235, NotHitBy]
type = NotHitBy
trigger1 = 1
value = ,AA,AP
time = 1

[State 235, AfterImage]
type = AfterImage
trigger1 = !Time
time = 16
length = 12
palcolor = 128;256
;palbright = 0,0,0
palcontrast = 220,220,220
paladd = 0,0,0
timegap = 1
framegap = 4

[State 235, ]
type = PlayerPush
trigger1 = 1
value = 0

[State 235, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;ステップジャンプ
[Statedef 240]
type    = S
movetype= I
physics = N
poweradd= 0
ctrl = 0
velset = 0,0
anim = 240
sprpriority = 1

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = AnimElemTime(2) = 0
value = s20,82
channel = 1
ignorehitpause = 1

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = AnimElemTime(2) = 0
value = s30,85
channel = 2
ignorehitpause = 1

[State 240, 先行入力・リセット]
type = Varset
trigger1 = Time = 0
var(9) = 0

[State 240, 先行入力・ラムダミサイル]
type = Varset
trigger1 = var(9) = 0
trigger1 = Time > 0
trigger1 = command = "ベルンミサイル/ラムダミサイル"
var(9) = 1110

[State 240, 先行入力・ジャンプ強攻撃]
type = Varset
trigger1 = var(9) = 0
trigger1 = Time > 0
trigger1 = command = "c"
var(9) = 620

[State 240, 先行入力・ジャンプ中攻撃]
type = Varset
trigger1 = var(9) = 0
trigger1 = Time > 0
trigger1 = command = "b"
var(9) = 610

[State 240, 先行入力・ジャンプ弱攻撃]
type = Varset
trigger1 = var(9) = 0
trigger1 = Time > 0
trigger1 = command = "a"
var(9) = 600

[State 240, AfterImage]
type = AfterImage
trigger1 = AnimElemTime(2) = 0
time = 30
length = 12
palcolor = 128;256
;palbright = 0,0,0
palcontrast = 220,220,220
paladd = 0,0,0
timegap = 1
framegap = 3

[State 240, Velset]
type = Velset
trigger1 = time = 0
trigger1 = var(3) != 0
x = Const(velocity.run.fwd.x)

[State 240, Velset]
type = Velset
trigger1 = time = 0
trigger1 = var(4) != 0
x = Const(velocity.jump.back.x)

[State 240, Velset]
type = Velset
trigger1 = AnimElemTime(2) = 0
x = 6.5
y = -6.3

[State 240, ]
type = PlayerPush
trigger1 = 1
value = 0

[State 240, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElemTime(2) = 0
statetype = A
physics = A

[State 240, ステート変更]
type = ChangeState
trigger1 = AnimElemTime(2) >= 0
trigger1 = var(9) != 0
value = var(9)

;---------------------------------------------------------------------------
;クイック下降
[Statedef 630]
type    = A
movetype= I
physics = A
juggle  = 4
poweradd= 0
ctrl = 0
velset = 0,8
anim = 630
sprpriority = 1

[State -3, ボイス分岐・ベルン]
type = VarRandom
trigger1 = Time = 1
v = 6
range = 83,85

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,var(6)
channel = 1
ignorehitpause = 1

[State 630, AfterImage]
type = AfterImage
trigger1 = time = 0
time = 12
length = 12
palcolor = 128;256
;palbright = 0,0,0
palcontrast = 220,220,220
paladd = 0,0,0
timegap = 1
framegap = 4

;---------------------------------------------------------------------------
;しゃがみ弱攻撃
[Statedef 400]
type    = C
movetype= A
physics = C
juggle  = 5
poweradd= 0
ctrl = 0
anim = 400
sprpriority = 2
facep2 = 1

[State 400, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = 0, 0

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,110
channel = 1
ignorehitpause = 1

[State 400, ヒット定義]
type = HitDef
trigger1 = AnimElem = 3
attr = C, NA
damage    = 24
getpower = 30,15
priority  = 3
animtype  = Light
hitflag = MF
guardflag = L
pausetime = 7,ifelse(var(11),2,8)
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-42
hitsound   = s12,0
guardsound = s6,0
ground.type = Low
ground.slidetime = 4
ground.hittime  = ifelse(var(11),2,8)
guard.slidetime = 6
guard.hittime = 6
guard.ctrltime = 6
ground.velocity = -2,ifelse(var(11),-1.2,0)
air.velocity = -1.5,-3
yaccel = .44
fall.recovertime = 20
ID = 400

[State 400, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(400)
trigger1 = NumExplod(400) = 0
anim = 4200
ID = 400
pos = ceil(110*Const(size.xscale)), ceil(-10*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 400, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(400)
trigger1 = NumExplod(400) = 0
anim = 4230
ID = 400
pos = ceil(110*Const(size.xscale)), ceil(-10*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 400, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;しゃがみ中攻撃
[Statedef 410]
type    = C
movetype= A
physics = C
juggle  = 6
poweradd= 0
ctrl = 0
anim = 410+ceil(var(10)*0.01)
sprpriority = 2

[State 410, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = 0, 2

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,110
channel = 2
ignorehitpause = 1

[State 410, ヒット定義]
type = HitDef
trigger1 = AnimElem = 2
attr = C, NA
damage    = 48
getpower = 30,15
animtype  = Medium
hitflag = MAF
guardflag = MA
pausetime = 12,12
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-55
hitsound   = s12,1
guardsound = s6,0
ground.type = High
ground.slidetime = 15
ground.hittime  = 16
guard.slidetime = 13
guard.hittime = 13
guard.ctrltime = 13
ground.velocity = -3
air.velocity = -3,-4
fall.recovertime = 30
yaccel = .44
ID = 410

[State 410, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(410)
trigger1 = NumExplod(410) = 0
anim = 4210
ID = 410
pos = ceil(110*Const(size.xscale)), ceil(-105*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 410, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(410)
trigger1 = NumExplod(410) = 0
anim = 4230
ID = 410
pos = ceil(110*Const(size.xscale)), ceil(-105*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 410, Velset]
type = Velset
trigger1 = movehit = 1
trigger1 = var(11) > 0
x = -7

[State 410, リセット]
type = varset
trigger1 = movehit = 1
trigger1 = var(11) > 0
var(11) = 0

[State 410, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;しゃがみ強攻撃
[Statedef 420]
type    = C
movetype= A
physics = C
juggle  = 7
poweradd= 0
ctrl = 0
anim = 420
sprpriority = 2

[State 420, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 2
value = 0, 4

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,101
channel = 1
ignorehitpause = 1

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = AnimElem = 6
value = s20,111
;channel = 1
ignorehitpause = 1

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,111
channel = 2
ignorehitpause = 1

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = AnimElem = 6
value = s30,112
channel = 2
ignorehitpause = 1

[State 420, ヒット定義]
type = HitDef
trigger1 = AnimElem = 4
attr = C, NA
animtype  = Hard
damage    = 35
getpower = 15,7
hitflag = MAF
guardflag = MA
pausetime = 8,8
sparkno = -1
guard.sparkno = -1
sparkxy = -5,-10
hitsound   = s12,2
guardsound = s6,0
ground.type = Low
ground.slidetime = 16
ground.hittime  = 18
guard.slidetime = 16
guard.hittime = 16
guard.ctrltime = 16
ground.velocity = -4.5
air.velocity = -3.2,-3
guard.velocity = -6
fall.recovertime = 40
yaccel = .44
ID = 420

[State 420, ヒット定義]
type = HitDef
trigger1 = AnimElem = 8
attr = C, NA
animtype  = Hard
damage    = 35
getpower = 15,7
hitflag = MAF
guardflag = LA
pausetime = 8,8
sparkno = -1
guard.sparkno = -1
sparkxy = -5,-10
hitsound   = s12,2
guardsound = s6,0
ground.type = Low
ground.slidetime = 10
ground.hittime  = 13
guard.slidetime = 10
guard.hittime = 10
guard.ctrltime = 10
ground.velocity = -4.0,-3.0
air.velocity = -3.2,-3
guard.velocity = -6
fall = 1
fall.recover = 0
yaccel = .44
ID = 421

[State 420, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(420)
trigger1 = NumExplod(420) = 0
anim = 4220
ID = 420
pos = ceil(120*Const(size.xscale)), ceil(-100*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 420, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(420)
trigger1 = NumExplod(420) = 0
anim = 4230
ID = 420
pos = ceil(120*Const(size.xscale)), ceil(-100*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 420, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(421)
trigger1 = NumExplod(421) = 0
anim = 4220
ID = 421
pos = ceil(115*Const(size.xscale)), ceil(-20*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 420, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(421)
trigger1 = NumExplod(421) = 0
anim = 4230
ID = 421
pos = ceil(115*Const(size.xscale)), ceil(-20*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 420, Velset]
type = Velset
trigger1 = movehit = 1
trigger1 = var(11) > 0
x = -7

[State 420, リセット]
type = varset
trigger1 = movehit = 1
trigger1 = var(11) > 0
var(11) = 0

[State 420, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;===========================================================================
;---------------------------------------------------------------------------
;ジャンプ弱攻撃
[Statedef 600]
type    = A
movetype= A
physics = A
juggle  = 2
poweradd= 0
ctrl = 0
anim = 600
sprpriority = 2

[State 600, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = 0, 0

[State -3, ボイス分岐・ベルン]
type = VarRandom
trigger1 = Time = 1
v = 6
range = 120,121

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,var(6)
channel = 1
ignorehitpause = 1

[State 600, ヒット定義]
type = HitDef
trigger1 = AnimElem = 2
attr = A, NA
damage    = 17
getpower = 30,15
guardflag = HA
priority = 3
pausetime = 7,8
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-58
hitsound   = s12,0
guardsound = s6,0
ground.type = High
ground.slidetime = 8
ground.hittime  = 8
guard.slidetime = 6
guard.hittime = 6
guard.ctrltime = 6
ground.velocity = -2
air.velocity = -1.3,-3
fall.recovertime = 20
yaccel = .44
ID = 600

[State 600, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(600)
trigger1 = NumExplod(600) = 0
anim = 4200
ID = 600
pos = ceil(80*Const(size.xscale)), ceil(-90*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 600, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(600)
trigger1 = NumExplod(600) = 0
anim = 4230
ID = 600
pos = ceil(60*Const(size.xscale)), ceil(-24*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1


[State 600, コントロール]
type = CtrlSet
trigger1 = Time = 17
value = 1

;---------------------------------------------------------------------------
;ジャンプ中攻撃
[Statedef 610]
type    = A
movetype= A
physics = A
juggle  = 4
poweradd= 0
ctrl = 0
anim = 610
sprpriority = 2

[State 610, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 2
value = 0, 1

[State -3, ボイス分岐・ラムダ]
type = VarRandom
trigger1 = Time = 1
v = 7
range = 120,122

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,var(7)
channel = 2
ignorehitpause = 1

[State 610, ヒット定義]
type = HitDef
trigger1 = Time = 0
attr = A, NA
animtype  = medium
damage = 48
getpower = 30,15
guardflag = HA
priority = 4
pausetime = 11,11
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-55
hitsound   = s12,1
guardsound = s6,0
ground.type = High
ground.slidetime = 18
ground.hittime  = 18
guard.slidetime = 15
guard.hittime = 15
guard.ctrltime = 15
ground.velocity = -3
air.velocity = -3,-4
air.fall = 1
fall.recover = 0
yaccel = .44
ID = 610

[State 610, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(610)
trigger1 = NumExplod(610) = 0
anim = 4210
ID = 610
pos = ceil(115*Const(size.xscale)), ceil(-160*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 610, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(610)
trigger1 = NumExplod(610) = 0
anim = 4230
ID = 610
pos = ceil(115*Const(size.xscale)), ceil(-160*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

;---------------------------------------------------------------------------
;ジャンプ強攻撃
[Statedef 620]
type    = A
movetype= A
physics = A
juggle  = 4
poweradd= 0
ctrl = 0
anim = 620
sprpriority = 2

[State 620, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 2
value = 0, 4

[State -3, ボイス分岐・ベルン]
type = VarRandom
trigger1 = Time = 1
v = 6
range = 123,124

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,var(6)
channel = 1
ignorehitpause = 1

[State -3, ボイス分岐・ラムダ]
type = VarRandom
trigger1 = Time = 1
v = 7
range = 123,125

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,var(7)
channel = 2
ignorehitpause = 1

[State 620, ヒット定義]
type = HitDef
trigger1 = AnimElem = 2
attr = A, NA
animtype  = Hard
damage    = 78
getpower = 30,15
guardflag = HA
priority = 4
pausetime = 12,12
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-40
hitsound   = s12,2
guardsound = s6,0
ground.type = High
ground.slidetime = 20
ground.hittime  = 20
guard.slidetime = 18
guard.hittime = 18
guard.ctrltime = 18
ground.velocity = -4,0
air.velocity = -4,-3
fall = 0
fall.recovertime = 30
yaccel = .44
ID = 620

[State 620, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(620)
trigger1 = NumExplod(620) = 0
anim = 4220
ID = 620
pos = ceil(115*Const(size.xscale)), ceil(-70*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 620, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(620)
trigger1 = NumExplod(620) = 0
anim = 4230
ID = 620
pos = ceil(115*Const(size.xscale)), ceil(-70*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

;---------------------------------------------------------------------------
;アルティメットアタック
[Statedef 700]
type    = S
movetype= A
physics = N
poweradd= 0
ctrl = 0
velset = 0,0
anim = 700
sprpriority = 3

[State 700, 分岐]
type = VarRandom
trigger1 = Time = 0
v = 0
range = 0,1
;range = 0,2

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Var(0) = 0
trigger1 = Time = 1
value = s20,220
channel = 1
ignorehitpause = 1

[State -3, ボイス分岐・ラムダ]
type = VarRandom
trigger1 = Var(0) = 0
trigger1 = Time = 1
v = 7
range = 220,221

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Var(0) = 0
trigger1 = Time = 1
value = s30,Var(7)
channel = 2
ignorehitpause = 1

[State -3, ボイス分岐・ベルン]
type = VarRandom
trigger1 = Var(0) = 1
trigger1 = Time = 1
v = 6
range = 130,133
[State -3, ボイス分岐・ベルン]
type = Varset
trigger1 = Var(0) = 1
trigger1 = Var(6) = 133
trigger1 = Time = 1
v = 6
value = 210

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Var(0) = 1
trigger1 = Time = 1
value = s20,Var(6)
channel = 1
ignorehitpause = 1

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Var(0) = 1
trigger1 = Time = 1
value = s30,209
channel = 2
ignorehitpause = 1

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Var(0) = 2
trigger1 = Time = 1
value = s20,210
channel = 1
ignorehitpause = 1

[State -3, ボイス分岐・ラムダ]
type = VarRandom
trigger1 = Var(0) = 2
trigger1 = Time = 1
v = 7
range = 137,140

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Var(0) = 2
trigger1 = Time = 1
value = s30,Var(7)
channel = 2
ignorehitpause = 1

[State 700, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = s15, 0
ignorehitpause = 1

[State 700, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 6
value = s15, 2
ignorehitpause = 1

[State 700, 速度加算]
type = Velset
trigger1 = AnimElem = 4
x = 6.5
[State 700, 速度加算]
type = Velset
trigger1 = AnimElem = 5
x = 0

[State 700, 無敵]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 700, ヒット定義]
type = HitDef
trigger1 = Time = 0
attr = S, HA
animtype  = Hard
damage    = 17
getpower = 30,15
guardflag = -
pausetime = 0,8
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-60
hitsound   = s12,0
guardsound = s6,0
ground.type = Low
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = 2,0
air.velocity = 2,4
fall = 0
ID = 700
p2stateno = 710

[State 700, ヒット定義]
type = HitDef
trigger1 = animelem = 5
attr = S, HA
animtype  = Hard
damage    = 18
getpower = 30,15
guardflag = -
pausetime = 8,8
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-60
hitsound   = s15,2
guardsound = s6,0
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -6,-3
air.velocity = -4,-3
fall = 1
fall.recover = 0
p2stateno = ifelse(var(13),725,720)
p2facing = 1
ID = 705

[State 700, アルティメット]
type = Explod
triggerall = NumEnemy
trigger1 = animelem = 1,0
trigger1 = NumExplod(4300) = 0
anim = 4300
ID = 4300
pos = ceil(-10*Const(size.xscale)), ceil(-95*Const(size.yscale))
postype = P1
bindtime = -1
removetime = -2
sprpriority = 0
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 700, アルティメット]
type = Explod
triggerall = NumEnemy
trigger1 = animelem = 5,0
trigger1 = NumExplod(4350) = 0
anim = 4350
ID = 4350
pos = ceil(-60*Const(size.xscale)), 0
postype = P1
bindtime = -1
removetime = -2
sprpriority = 4
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 700, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(700)
trigger1 = NumExplod(700) = 0
anim = 4200
ID = 700
pos = ceil(50*Const(size.xscale)), ceil(-94*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 700, 物理的なキャラの幅]
type = Width
trigger1 = (AnimElemTime (5) >= 0) && (AnimElemTime (6) < 0)
value = 25,0

[State 700, 物理的なキャラの幅]
type = Width
trigger1 = (AnimElemTime (6) >= 0) && (AnimElemTime (7) < 0)
value = 45,0

[State 700, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;GCアルティメット
[Statedef 705]
type    = S
movetype= A
physics = N
poweradd= 0
ctrl = 0
velset = 0,0
anim = 705
sprpriority = 3

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,221
channel = 1
ignorehitpause = 1

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,222
channel = 2
ignorehitpause = 1

[State 705, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = s15, 2
ignorehitpause = 1

[State 705, 速度加算]
type = Velset
trigger1 = AnimElem = 1
x = 6.5
[State 705, 速度加算]
type = Velset
trigger1 = AnimElem = 2
x = 0

[State 705, ガードキャンセル]
type      = PowerAdd
Trigger1  = !time
Trigger1  = (prevStateNo=150)||(prevStateNo=151)||(prevStateNo=152)||(prevStateNo=153)
value     = -1000

[State 705, 無敵]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 705, ヒット定義]
type = HitDef
trigger1 = animelem = 2
attr = S, HA
animtype  = Hard
damage    = 18
guardflag = -
pausetime = 8,8
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-60
hitsound   = s12,1
guardsound = s6,0
ground.type =high
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -6,-3
air.velocity = -4,-3
fall = 1
fall.recover = 0
p2stateno = 720
p2facing = 1
ID = 705

[State 705, アルティメット]
type = Explod
triggerall = NumEnemy
trigger1 = animelem = 2,0
trigger1 = NumExplod(4350) = 0
anim = 4350
ID = 4350
pos = ceil(-60*Const(size.xscale)), 0
postype = P1
bindtime = -1
removetime = -2
sprpriority = 4
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 705, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;アルティメットアタック・捕縛
[Statedef 710]
type    = S
movetype= H
physics = N
velset = 0,0

[State 710, ]
type = PosSet
trigger1 = Time = 0
y = 0

[State 710, 相手のアニメ変更]
type = ChangeAnim
trigger1 = Time = 0
value = 5002

[State 710, 相手のアニメ変更]
type = ChangeAnim
trigger1 = anim = 5002
trigger1 = AnimTime = 0
value = 5007

[State 710, 相手ステートに戻す]
type = SelfState
trigger1 = time = 45
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;アルティメットアタック・相手側１（ヒット硬直）
[Statedef 720]
type    = A
movetype= H
physics = N
velset = 0,0

[State 720, ]
type = PosSet
trigger1 = Time = 0
y = 0

[State 720, 相手のアニメ変更]
type = ChangeAnim2
trigger1 = 1
value = 720

[State 720, ステート変更]
type = ChangeState
trigger1 = HitShakeOver = 1 ;ヒット硬直が解けたら
value = 721

;---------------------------------------------------------------------------
;アルティメットアタック・相手側２（吹っ飛び）
[Statedef 721]
type    = A
movetype= H
physics = N

[State 721, 食らい中の速度]
type = VelSet
trigger1 = Time = 0
x = -6

[State 721, スクロール]
type = ScreenBound
trigger1 = BackEdgeBodyDist < 38
trigger2 = FrontEdgeBodyDist < 38
value = 1         ;画面スクロールの影響を受けるか否か。0=受けない・1=受ける
movecamera = 0,0  ;カメラの動きをキャラに依存させるか否か。0=させない・1=させる（Ｘ軸,Ｙ軸）

[State 721, ステート変更];壁に激突するステートへ
type = ChangeState
trigger1 = BackEdgeBodyDist <= 20
trigger2 = FrontEdgeBodyDist <= 20
value = 722

;---------------------------------------------------------------------------
;アルティメットアタック・相手側３（壁に激突）
[Statedef 722]
type    = A
movetype= H
physics = N

[State 722, 振り返る]
type = Turn
trigger1 = (Time = 0) && (FrontEdgeBodyDist <= 30)

[State 722, 軸位置移動]
type = PosAdd
trigger1 = Time = 0
x = 15 - BackEdgeBodyDist

[State 722, 位置固定]
type = PosFreeze
trigger1 = 1
x = 1
y = 1

[State 722, スクロール]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 722, エフェクト]
type = Explod
trigger1 = Time = 0
anim = F72
pos = 0, floor(screenpos y) - 50 ;（※５）
postype = back
sprpriority = 3

[State 722, 相手のアニメ変更]
type = ChangeAnim2
trigger1 = Time = 0
value = 722

[State 722, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 0
value = F7,0

[State 722, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 723

;---------------------------------------------------------------------------
;アルティメットアタック・相手側４（壁からのバウンド）
[Statedef 723]
type    = A
movetype= H
physics = N

[State 723, 移動速度]
type = VelSet
trigger1 = Time = 0
y = -11

[State 723, 移動速度]
type = VelSet
trigger1 = Time = 0
x = 1.3

[State 723, 速度加算];重力
type = VelAdd
trigger1 = 1
y = .5

[State 723, アニメ変更]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = !SelfAnimExist(5052) ;「!」が付いてるので、[Begin Action 5052]が無い場合
value = 5016;5050

[State 723, アニメ変更]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5052)  ;airファイルに[Begin Action 5052]が存在してれば
value = 5052

[State 723, アニメ変更]
type = ChangeAnim
trigger1 = Vel Y > -2
trigger1 = Anim = 5050
trigger1 = SelfAnimExist(5060)
persistent = 0
value = 5060

[State 723, アニメ変更]
type = ChangeAnim
trigger1 = Vel Y > -2
trigger1 = Anim = 5052
trigger1 = SelfAnimExist(5062)
persistent = 0
value = 5062

[State 723, 相手ステートに戻す]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100

;---------------------------------------------------------------------------
;アルティメットアタック・ワイヤー済み復帰
[Statedef 725]
type    = A
movetype= H
physics = N
poweradd= 0
velset = 0,0
ctrl = 0
sprpriority = 0

[State 725, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = Time = 0
value = 5030

[State 725, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = anim = 5030
trigger1 = AnimTime = 0
value = 5035

[State 725, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = anim = 5035
trigger1 = AnimTime = 0
value = 5050

[State 725, 移動速度]
type = VelSet
trigger1 = Time = 0
x = -4
y = -3.5

[State 725, 速度加算];重力
type = VelAdd
trigger1 = 1
y = .44

[State 725, 相手ステートに戻す]
type = SelfState
triggerall = (Vel y > 0) && (Pos y >= 0)
trigger1 = alive = 0
value = 5100

[State 725, 相手ステートに戻す]
type = SelfState
triggerall = (Vel y > 0) && (Pos y >= 0)
trigger1 = alive = 1
value = 52

;---------------------------------------------------------------------------
;オヤシロアタック
[Statedef 750]
type    = S
movetype= A
physics = N
poweradd= -2000
ctrl = 0
velset = 0,0
anim = 750
sprpriority = 3

[State 750, StateTypeSet]
type = StateTypeSet
trigger1 = PrevStateNo = [5020,5030]
statetype = A

[State -3, ボイス分岐・ベルン]
type = VarRandom
trigger1 = Time = 1
v = 6
range = 211,214

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,Var(6)
channel = 1
ignorehitpause = 1

[State -3, ボイス分岐・ラムダ]
type = VarRandom
trigger1 = Time = 1
v = 7
range = 210,211

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,Var(7)
channel = 2
ignorehitpause = 1

[State 750, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = s16, 0
ignorehitpause = 1

[State 750, 速度加算]
type = Velset
trigger1 = AnimElem = 2
x = 1.3
[State 750, 速度加算]
type = Velset
trigger1 = AnimElem = 3
x = 0

[State 750, Pause]
type = Pause
trigger1 = time = 1
time = 35
movetime = 35

[State 750, Pause]
type = Pause
trigger1 = AnimElem = 3,1
time = 44
movetime = 44

[State 750, 無敵]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 750, ]
type = PlayerPush
trigger1 = 1
value = 0

[State 750, 暗転]
type = Explod
triggerall = NumExplod(7100) = 0
trigger1 = time = 1
anim = 7110
ID = 7100
pos = 0, 0
postype = left
bindtime = -1
removetime = -1
sprpriority = -1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
scale = 1.0,1.0
Persistent = 0
ignorehitpause = 1

[State 750, AfterImage]
type = AfterImage
trigger1 = AnimElem = 2,0
time = 25
length = 20
palcolor = 240;256
palbright = 120,0,0
palcontrast = 220,0,0
paladd = 0,0,0
timegap = 2
framegap = 3
;trans = add

[State 750, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 4
trigger1 = numexplod(7100)
ID = 7100
ignorehitpause = 1

[State 750, ヒット定義]
type = HitDef
trigger1 = animelem = 3
attr = S, HA
animtype  = Hard
damage    = 151,151
guardflag = -
pausetime = 0,0
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-60
hitsound   = s16,1
guardsound = s6,0
ground.type = Low
ground.slidetime = 18
ground.hittime  = 18
ground.velocity = -6,-3
air.velocity = -4,-3
fall = 1
fall.recover = 0
p2stateno = 770
kill = 0
ID = 750

[State 700, 崩れ落ち中の追撃スイッチ]
type = varset
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = var(10) = 0
var(10) = 84

[State 750, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(750)
trigger1 = NumExplod(750) = 0
anim = 4200
ID = 750
pos = ceil(80*Const(size.xscale)), ceil(-100*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
supermovetime = 9999
pausemovetime = 9999
Persistent = 0
ignorehitpause = 1

[State 750, ステート変更]
type = ChangeState
trigger1 = StateType != A
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 750, ステート変更]
type = ChangeState
trigger1 = StateType = A
trigger1 = AnimTime = 0
value = 50
;ctrl = 1

;---------------------------------------------------------------------------
;オヤシロアタック相手
[Statedef 770]
type    = U
movetype= H
physics = N
poweradd= 0
velset = 0,0
ctrl = 0
sprpriority = 0

[State 770, StateTypeSet]
type = StateTypeSet
trigger1 = alive
trigger1 = statetype != A
trigger1 = Time = 1
movetype = I

[State 770, 2]
type = PosSet
trigger1 = statetype != A
trigger1 = Time = 0
y = 0

[State 770, StateTypeSet]
type = StateTypeSet
trigger1 = alive
trigger1 = statetype != A
trigger1 = Time = 40
statetype = L
movetype = H

[State 770, 無敵]
type     = NotHitBy
trigger1 = statetype != A
trigger1 = Time >= 40
value    = SCA,AA,AT,AP
time     = 1

[State 770, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = statetype != A
Trigger1 = Time <= 12
Trigger1 = SelfAnimExist(5950)
value = 5950

[State 770, 制御した相手のアニメ変更]
type = ChangeAnim2
trigger1 = statetype != A
Trigger1 = Time <= 12
Trigger1 = !SelfAnimExist(5950)
value = 770

[State 770, 相手ステートに戻す]
type = SelfState
trigger1 = statetype != A
trigger1 = time = 94
value = 5120

[State 770, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = statetype = A
Trigger1 = Time < 12
value = 5030

[State 770, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = statetype = A
trigger1 = time = 12
value = 5035

[State 770, 移動速度]
type = VelSet
trigger1 = statetype = A
trigger1 = time = 12
x = -7
y = 0

[State 770, 速度加算];重力
type = VelAdd
trigger1 = statetype = A
trigger1 = anim = 5035
y = .5

[State 770, 相手ステートに戻す]
type = SelfState
trigger1 = statetype = A
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;===========================================================================
; 投げ技
;===========================================================================
;投げ：掴み
[Statedef 800]
type    = S
movetype= A
physics = S
juggle  = 0
velset = 0,0
ctrl = 0
anim = 800
sprpriority = 2
poweradd = 0

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,135
channel = 1
ignorehitpause = 1

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 2
value = s30,141
channel = 2
ignorehitpause = 1

[State 800, ヒット定義（投げ用）]
type = HitDef
getpower = 60,30
trigger1 = var(10) = 0
trigger1 = var(11) = 0
trigger1 = Time = 0
attr = S, NT ;立ち通常投げ（Standing, Normal Throw）
hitflag = M-  ;マイナスが付加されてるので相手が食らい中の時は掴めない
priority = 1, Miss
sparkno = -1  ;-1だからヒットスパークは表示しない
p1sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 810
p2stateno = 820
guard.dist = 0 ;相手のガード態勢に入る距離を０にしてるので、ガード不可
fall = 1

[State 800, ステート変更]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;投げ：成功（放り投げる）
[Statedef 810]
type    = S
movetype= A
physics = N
anim = 810
poweradd = 0

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,136
channel = 1
ignorehitpause = 1

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,142
channel = 2
ignorehitpause = 1

[State 810, 変数]
type = VarSet
trigger1 = Time = 0
var(2) = command = "holdback"

[State 810, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = 12, 2

[State 810, 掴んだ相手の位置１];TargetBindで相手を一時的に拘束
type = TargetBind
trigger1 = AnimElemTime(2) < 0
pos = 35, 0  ;自分の軸位置から相手の軸をX=28・Y=0の位置にする

[State 810, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
edge = 50,0 ;画面端を押す幅を変える（オレンジの線）

[State 810, 掴んだ相手の位置２]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 40, -100

[State 810, 振り返る];Var(2)が有効な時
type = Turn
trigger1 = var(2)
trigger1 = AnimElem = 2

[State 810, 掴んだ相手の向き];Var(2)が有効な時
type = TargetFacing
trigger1 = var(2)
trigger1 = AnimElem = 2
value = -1

[State 810, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(4) < 0
edge = 60,0

[State 810, 掴んだ相手の位置２]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 45, -100

[State 810, 掴んだ相手の位置]
type = TargetBind
trigger1 = AnimElem = 4
pos = 50, -25

[State 810, ヒット・ガード]
type = Explod
triggerall = NumEnemy
triggerall = NumExplod(810) = 0
trigger1 = AnimElemTime(4) = 0
anim = 4220
ID = 810
pos = ceil(100*Const(size.xscale)), ceil(-110*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
ignorehitpause = 1

;相手が食らい状態の時のみ機能するTarget系コントローラ
[State 810, 掴んだ相手のライフ増減]
type = TargetLifeAdd
trigger1 = AnimElem = 4
value = ceil(-108*(const(data.attack)*0.01))

[State 810, 掴んだ相手のステート変更]
type = TargetState
trigger1 = AnimElem = 4
value = 821

[State 810, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;投げ：相手側１（掴まれて放り投げられるまで）
[Statedef 820]
type    = A
movetype= H
physics = N
velset = 0,0

[State 820,]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 820, 相手のアニメ変更]
type = ChangeAnim2
trigger1 = Time = 0
value = 820

[State 820, 相手ステートに戻す]
type = SelfState
trigger1 = !GetHitVar(IsBound)
value = 5050

;---------------------------------------------------------------------------
;投げ：相手側２（放り投げられた）
[Statedef 821]
type    = A
movetype= H
physics = N
velset = -3.5,-5
poweradd = 40

[State 821,]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 821, 速度加算];重力
type = VelAdd
trigger1 = 1
y = .4

[State 821, 相手ステートに戻す]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
