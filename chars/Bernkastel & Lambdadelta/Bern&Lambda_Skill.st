;===========================================================================
; 必殺技
;===========================================================================
;ベルンキック
[Statedef 1000]
type    = S
movetype= A
physics = S
juggle  = 2
poweradd= 0
velset = 0,0
anim = 1000
ctrl = 0
sprpriority = 2

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,161
channel = 1
ignorehitpause = 1

[State -3, ボイス分岐・ラムダ]
type = VarRandom
trigger1 = Time = 1
v = 7
range = 130,132

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,var(7)
channel = 2
ignorehitpause = 1

[State 1000, 移動速度]
type = VelSet
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
x = 6.0

[State 1000, ヒット定義]
type = HitDef
trigger1 = AnimElem = 2
attr = S, SA
animtype  = Hard
damage    = 66, 11
getpower = 60,30
priority  = 5
hitflag = M
guardflag = L
pausetime = 8,10
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-60
hitsound   = s12,2
guardsound = s6,0
ground.type = low
ground.slidetime = 18
ground.hittime  = ifelse(var(11),4,18)
guard.slidetime = 18
guard.hittime = 18
guard.ctrltime = 18
ground.velocity = -5,ifelse(var(11),-3,0)
air.velocity = -4,-3
fall.recover = 0
yaccel = .44
ID = 1000

[State 1000, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(1000)
trigger1 = NumExplod(1000) = 0
anim = 4220
ID = 1000
pos = ceil(110*Const(size.xscale)), ceil(-40*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 1000, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(1000)
trigger1 = NumExplod(1000) = 0
anim = 4230
ID = 1000
pos = ceil(110*Const(size.xscale)), ceil(-40*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 1000, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;ラムダキック
[Statedef 1010]
type    = S
movetype= A
physics = N
juggle  = 2
poweradd= 0
velset = 0,0
anim = 1010+ceil(var(12)*0.01)
ctrl = 0
sprpriority = 2

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,163
channel = 1
ignorehitpause = 1

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = AnimElem = 2
value = s20,164
channel = 1
ignorehitpause = 1

[State -3, ボイス分岐・ラムダ]
type = VarRandom
trigger1 = Time = 1
v = 7
range = 164,166

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,var(7)
channel = 2
ignorehitpause = 1

[State 1010, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = 0, 3

[State 1010, 移動速度]
type = VelSet
trigger1 = AnimElemTime(2) = 0
x = 9.1;6.5
y = -7.8;-5.2

[State 1010, 移動速度]
type = VelSet
trigger1 = AnimElemTime(3) = 0
x = 0
y = 0

[State 1010, 移動速度]
type = VelSet
trigger1 = FrontEdgeBodyDist <= 30
trigger1 = var(13) != 0
trigger1 = AnimElemTime(3) = 0
x = -4.5

[State 1010, ]
type = PlayerPush
trigger1 = vel X < 0
value = 0

[State 1010, 移動速度]
type = Gravity
trigger1 = AnimElemTime(3) >= 0

[State 1010, StateTypeSet]
type = StateTypeSet
trigger1 = animelemtime(2) = 0
statetype = A

[State 1010, StateTypeSet]
type = StateTypeSet
trigger1 = animelemtime(3) = 0
movetype = I
;physics = S

[State 1010, ヒット定義]
type = HitDef
trigger1 = AnimElem = 2
attr = A, SA
animtype  = Hard
damage    = 70, 14
getpower = 60,30
priority  = 5
guardflag = MA
pausetime = 10,10
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-60
hitsound   = s12,2
guardsound = s6,0
ground.type = high
ground.slidetime = 15
ground.hittime  = 17
guard.slidetime = 12
guard.hittime = 12
guard.ctrltime = 12
ground.velocity = -4,-4.5
air.velocity = -4,-3
fall = 1
fall.recover = 0
yaccel = .44
p2stateno = ifelse(var(13),1116,1115)
p2facing = 1
ID = 1010

[State 1010, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(1010)
trigger1 = NumExplod(1010) = 0
anim = 4220
ID = 1010
pos = ceil(110*Const(size.xscale)), ceil(-120*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 1010, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(1010)
trigger1 = NumExplod(1010) = 0
anim = 4230
ID = 1010
pos = ceil(110*Const(size.xscale)), ceil(-120*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 1010, 着地]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52

;---------------------------------------------------------------------------
;ラムダキック・相手側１（ヒット硬直）ワイヤー前
[Statedef 1115]
type    = U
movetype= H
physics = N
velset = 0,0

[State 1115, 相手のアニメ変更]
type = ChangeAnim
trigger1 = statetype != A
value = 5030

[State 1115, 相手のアニメ変更]
type = ChangeAnim2
trigger1 = statetype = A
value = 720

[State 1115, ステート変更]
type = ChangeState
trigger1 = statetype != A
trigger1 = HitShakeOver = 1 ;ヒット硬直が解けたら
value = 1117

[State 1115, ステート変更]
type = ChangeState
trigger1 = statetype = A
trigger1 = HitShakeOver = 1 ;ヒット硬直が解けたら
value = 721

;---------------------------------------------------------------------------
;ラムダキック・相手側１（ヒット硬直）ワイヤー後
[Statedef 1116]
type    = U
movetype= H
physics = N
velset = 0,0

[State 1116, 相手のアニメ変更]
type = ChangeAnim
trigger1 = statetype != A
value = 5030

[State 1116, 相手のアニメ変更]
type = ChangeAnim2
trigger1 = statetype = A
value = 720

[State 1115, ステート変更]
type = ChangeState
trigger1 = statetype != A
trigger1 = HitShakeOver = 1
value = 1117

[State 1116, ステート変更]
type = ChangeState
trigger1 = statetype = A
trigger1 = HitShakeOver = 1
value = 725

;---------------------------------------------------------------------------
;地上での吹き飛び
[Statedef 1117]
type    = A
movetype= H
physics = N
poweradd= 0
velset = 0,0
ctrl = 0
sprpriority = 0

[State 1117, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = Time = 0
value = 5030

[State 1117, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = anim = 5030
trigger1 = AnimTime = 0
value = 5035

[State 1117, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = anim = 5035
trigger1 = AnimTime = 0
value = 5050

[State 1117, 移動速度]
type = VelSet
trigger1 = Time = 0
x = -6
y = -4.5

[State 1117, 速度加算];重力
type = VelAdd
trigger1 = 1
y = .44

[State 1117, 相手ステートに戻す]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100

;---------------------------------------------------------------------------
;ダブルキック
[Statedef 1020]
type    = A
movetype= I
physics = N
juggle  = 2
poweradd= 0
velset = 3,-6.2
anim = 1020
ctrl = 0
sprpriority = 2

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,162
channel = 1
ignorehitpause = 1

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,133
channel = 2
ignorehitpause = 1

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = AnimElem = 3
value = s30,136
channel = 2
ignorehitpause = 1

[State 1020, 移動速度]
type = VelSet
trigger1 = AnimElemTime(2) = 0
x = 3
y = -4.5

[State 1020, 移動速度]
type = VelSet
trigger1 = AnimElemTime(3) = 0
x = 5.8
y = 7

[State 1020, StateTypeSet]
type = StateTypeSet
trigger1 = animelemtime(3) = 0
movetype = A

[State 1020, ヒット定義]
type = HitDef
trigger1 = AnimElem = 3
attr = A, SA
animtype  = Hard
damage    = 100, 20
getpower = 60,30
priority  = 5
guardflag = HA
pausetime = 12,12
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-60
hitsound   = s12,2
guardsound = s6,0
ground.type = high
ground.slidetime = 15
ground.hittime  = 17
guard.slidetime = 12
guard.hittime = 12
guard.ctrltime = 12
ground.velocity = -4,-4.5
air.velocity = -4,-3
fall = 1
fall.recover = 0
yaccel = .44
ID = 1020

[State 1020, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(1020)
trigger1 = NumExplod(1020) = 0
anim = 4220
ID = 1020
pos = ceil(100*Const(size.xscale)), 0;ceil(-10*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 1020, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(1020)
trigger1 = NumExplod(1020) = 0
anim = 4230
ID = 1020
pos = ceil(100*Const(size.xscale)), 0;ceil(-100*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 1020, 着地]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 1025

;---------------------------------------------------------------------------
;ダブルキック着地
[Statedef 1025]
type    = S
movetype= A
physics = S
juggle  = 5
poweradd= 0
ctrl = 0
anim = 1025
sprpriority = 2
velset = 0,0

[State 1025, 音を鳴らす]
type = PlaySnd
trigger1 = Time = 1
value = 4, 0

[State 1025, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1025, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;突撃パンチ(ベルン)
[Statedef 1050]
type    = S
movetype= A
physics = S
juggle  = 1
poweradd= 0
velset = 0,0
anim = 1050+2*ceil(var(12)*0.01)
ctrl = 0
sprpriority = 2

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,175
channel = 1
ignorehitpause = 1

[State -1, 入力リセット]
type = varset
trigger1 = Time = 0
v = 0
value = 0

[State -1, 追加入力]
type = varset
triggerall = Command = "追加の突撃パンチ(ラムダ)"
triggerall = Time > 0
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 9
trigger2 = movecontact
v = 0
value = 1

[State 1050, 移動速度]
type = VelSet
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
x = 5.2

[State 1050, ヒット定義]
type = HitDef
trigger1 = AnimElem = 2
attr = S, SA
animtype  = Hard
damage    = 43, 8
getpower = 60,30
priority  = 5
guardflag = MA
pausetime = 5,5
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-60
hitsound   = s12,2
guardsound = s6,0
ground.type = high
ground.slidetime = 18
ground.hittime  = ifelse(var(11),4,20)
guard.slidetime = 16
guard.hittime = 16
guard.ctrltime = 16
ground.velocity = -6,ifelse(var(11),-1.2,0)
air.velocity = -4,-3
fall.recover = 0
yaccel = .44
ID = 1050

[State 1050, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(1050)
trigger1 = NumExplod(1050) = 0
anim = 4220
ID = 1050
pos = ceil(100*Const(size.xscale)), ceil(-130*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 1050, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(1050)
trigger1 = NumExplod(1050) = 0
anim = 4230
ID = 1050
pos = ceil(100*Const(size.xscale)), ceil(-130*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 1050, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;追加の突撃パンチ(ラムダ)
[Statedef 1060]
type    = S
movetype= A
physics = S
juggle  = 1
poweradd= 0
velset = 0,0
anim = 1060
ctrl = 0
sprpriority = 2

[State -3, ボイス分岐・ベルン]
type = VarRandom
trigger1 = Time = 1
v = 6
range = 200,204

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,var(6)
;channel = 1
ignorehitpause = 1

[State -3, ボイス分岐・ラムダ]
type = VarRandom
trigger1 = Time = 1
v = 7
range = 206,208

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,var(7)
;channel = 2
ignorehitpause = 1

[State -1, 入力リセット]
type = varset
trigger1 = Time = 0
v = 0
value = 0

[State -1, 追加入力]
type = varset
triggerall = var(0) = 0
triggerall = Command = "トドメのパンチ(ベルン)"
triggerall = Time > 0
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 9
trigger2 = movecontact
v = 0
value = 1

[State -1, 追加入力]
type = varset
triggerall = var(0) = 0
triggerall = Command = "トドメのパンチ(ラムダ)"
triggerall = Time > 0
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 9
trigger2 = movecontact
v = 0
value = 2

[State 1060, 移動速度]
type = VelSet
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
x = 4.5

[State 1060, ヒット定義]
type = HitDef
trigger1 = AnimElem = 2
attr = S, SA
animtype  = Hard
damage    = 35, 7
priority  = 5
guardflag = MA
pausetime = 5,8
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-60
hitsound   = s12,2
guardsound = s6,0
ground.type = high
ground.slidetime = 18
ground.hittime  = 20
guard.slidetime = 16
guard.hittime = 16
guard.ctrltime = 16
ground.velocity = -6
air.velocity = -4,-3
fall.recover = 0
yaccel = .44
ID = 1060

[State 1060, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(1060)
trigger1 = NumExplod(1060) = 0
anim = 4220
ID = 1060
pos = ceil(130*Const(size.xscale)), ceil(-130*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 1060, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(1060)
trigger1 = NumExplod(1060) = 0
anim = 4230
ID = 1060
pos = ceil(130*Const(size.xscale)), ceil(-130*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 1060, 残像]
type = Explod
trigger1 = NumExplod(1051) = 0
trigger1 = time  = 0
anim = 1051
ID = 1051
pos = 0, 0
postype = P1
bindtime = 1
removetime = -2
sprpriority = 1
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
shadow = -1,-1,-1
removeongethit = 1
Persistent = 0
ignorehitpause = 1

[State 1060, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;トドメのパンチ(ベルン)
[Statedef 1070]
type    = S
movetype= A
physics = S
juggle  = 2
poweradd= 0
velset = 0,0
anim = 1070
ctrl = 0
sprpriority = 2

[State -3, ボイス分岐・ベルン]
type = VarRandom
trigger1 = Time = 1
v = 6
range = 205,208

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
value = s20,var(6)
;channel = 1
ignorehitpause = 1

[State -3, ボイス分岐・ラムダ]
type = VarRandom
trigger1 = Time = 1
v = 7
range = 200,205

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,var(7)
;channel = 2
ignorehitpause = 1

[State 1070, 移動速度]
type = VelSet
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
x = 4.5

[State 1070, ヒット定義]
type = HitDef
trigger1 = AnimElem = 2
attr = S, SA
animtype  = Hard
damage    = 52, 10
priority  = 5
guardflag = MA
pausetime = 8,12
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-60
hitsound   = s12,2
guardsound = s6,0
ground.type = high
ground.slidetime = 16
ground.hittime  = 24
guard.slidetime = 16
guard.hittime = 20
guard.ctrltime = 20
ground.velocity = -5,-4.5
air.velocity = -4,-3
fall = 1
fall.recover = 0
yaccel = .44
ID = 1070

[State 1070, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(1070)
trigger1 = NumExplod(1070) = 0
anim = 4220
ID = 1070
pos = ceil(110*Const(size.xscale)), ceil(-130*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 1060, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(1070)
trigger1 = NumExplod(1070) = 0
anim = 4230
ID = 1070
pos = ceil(110*Const(size.xscale)), ceil(-130*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 1070, 残像]
type = Explod
trigger1 = NumExplod(1061) = 0
trigger1 = time  = 0
anim = 1061
ID = 1061
pos = 0, 0
postype = P1
bindtime = 1
removetime = -2
sprpriority = 1
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
shadow = -1,-1,-1
removeongethit = 1
Persistent = 0
ignorehitpause = 1

[State 1070, 残像]
type = RemoveExplod
trigger1 = NumExplod(1051)
trigger1 = time = 0
ID = 1051

[State 1070, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;トドメのパンチ(ラムダ)
[Statedef 1080]
type    = S
movetype= A
physics = S
juggle  = 2
poweradd= 0
velset = 0,0
anim = 1080
ctrl = 0
sprpriority = 2

[State 1080, 移動速度]
type = VelSet
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
x = 4.8

[State 1080, ヒット定義]
type = HitDef
trigger1 = AnimElem = 2
attr = S, SA
animtype  = Hard
damage    = 70, 14
priority  = 5
hitflag = M
guardflag = L
pausetime = 10,10
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-60
hitsound   = s12,2
guardsound = s6,0
ground.type = Trip;low
ground.slidetime = 16
ground.hittime  = 16
guard.slidetime = 13
guard.hittime = 13
guard.ctrltime = 13
ground.velocity = -6,-4
air.velocity = -4,-3
fall.recover = 0
fall = 1
yaccel = .44
ID = 1080

[State 1080, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(1080)
trigger1 = NumExplod(1080) = 0
anim = 4220
ID = 1080
pos = ceil(160*Const(size.xscale)), ceil(-55*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 1080, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(1080)
trigger1 = NumExplod(1080) = 0
anim = 4230
ID = 1080
pos = ceil(160*Const(size.xscale)), ceil(-55*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 1060, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;ベルンミサイル
[Statedef 1100]
type    = S
movetype= A
physics = S
juggle  = 2
poweradd= 20
velset = 0,0
anim = 1100
ctrl = 0
sprpriority = 2

[State -3, ボイス分岐・ベルン]
type = VarRandom
trigger1 = Time = 1
v = 6
range = 164,168

[State -3, ボイス分岐・ベルン]
type = VarRandom
trigger1 = var(6) = [164,165]
trigger1 = Time = 1
v = 6
range = 151,152

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
range = 150,155

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,var(7)
channel = 2
ignorehitpause = 1

[State 1100, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 3
value = 0, 3

[State 1100, 物理的なキャラの幅]
type = Width
Trigger1 = MoveHit = 0
trigger1 = (AnimElemTime (3) >= 0)
value = 30,-15

[State 1100, ベルンミサイル]
type = Helper
trigger1 = AnimElem = 3,0
id = 1005
name = "bernmissile"
pos = ceil(-13*Const(size.xscale)), 0
postype = p1
stateno = 1105
helpertype = Normal
keyctrl = 0
ownpal = 1
pausemovetime = 0
size.xscale = Const(size.xscale)
size.yscale = Const(size.yscale)

[State 1100, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;ベルンミサイル飛び道具
[Statedef 1105]
type    = A
movetype= A
physics = N
juggle  = 2
poweradd= 0
velset = 6.5,0
anim = 1105
ctrl = 0
sprpriority = 3

[State 1005, 0.5]
type = HitOverRide
trigger1 = Time = 0
time = -1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
stateno = 1106

[State 1105, 無敵]
type     = NotHitBy
trigger1 = 1
value    = ,AA,AT
time     = 1

[State 1105 , ]
type = HitDef
trigger1 = time = 0
attr = S, SP
damage   = 125,25
animtype = hard
guardflag = MA
hitflag = MAF
priority = 7, Hit
pausetime = 3,5
sparkno = -1
guard.sparkno = -1
sparkxy =  0, 0
hitsound   = s12,5
guardsound = s6,0
ground.type = high
ground.slidetime    = 22
ground.hittime      = 22
guard.slidetime     = 18
guard.hittime       = 22
air.hittime         = 12
ground.velocity = -3,-5.5
air.velocity = -2,-5
air.hittime = 12
fall        = 1
fall.recover        = 0
getpower = 30,15
givepower           = 30, 30
ID = 1105

[State 1105, ステート変更]
type = ChangeState
trigger1 = movecontact = 1
value = 1106

[State 1105, destroyself]
type = destroyself
trigger1 = FrontEdgeDist < -30

;---------------------------------------------------------------------------
;ベルンミサイル消滅	
[Statedef 1106]
type    = A
movetype= A
physics = N
juggle  = 2
poweradd= 0
velset = 0,0
anim = 1105
ctrl = 0
sprpriority = 3

[State 1106, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = NumTarget(1105)
trigger1 = NumExplod(1105) = 0
anim = 4800
ID = 1105
pos = ceil(120*Const(size.xscale)), ceil(-120*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 1106, destroyself]
type = destroyself
trigger1 = time = 1

;---------------------------------------------------------------------------
;ラムダミサイル
[Statedef 1110]
type    = A
movetype= A
physics = N
juggle  = 2
poweradd= 0
velset = 3,0
anim = 1110
ctrl = 0
sprpriority = 3

[State -3, ボイス分岐・ベルン]
type = VarRandom
trigger1 = Time = 1
v = 6
range = 0,6

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
trigger1 = var(6) = 0
value = s20,105
channel = 1
ignorehitpause = 1
[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
trigger1 = var(6) = 1
value = s20,112
channel = 1
ignorehitpause = 1
[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
trigger1 = var(6) = 2
value = s20,122
channel = 1
ignorehitpause = 1
[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
trigger1 = var(6) = 3
value = s20,150
channel = 1
ignorehitpause = 1
[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
trigger1 = var(6) = 4
value = s20,154
channel = 1
ignorehitpause = 1
[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
trigger1 = var(6) = 5
value = s20,155
channel = 1
ignorehitpause = 1
[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = Time = 1
trigger1 = var(6) = 6
value = s20,177
channel = 1
ignorehitpause = 1

[State -3, ボイス分岐・ラムダ]
type = VarRandom
trigger1 = Time = 1
v = 0
range = 0,1
[State -3, ボイス分岐・ラムダ]
type = VarRandom
trigger1 = var(0) = 0
trigger1 = Time = 1
v = 7
range = 130,131
[State -3, ボイス分岐・ラムダ]
type = VarRandom
trigger1 = var(0) = 1
trigger1 = Time = 1
v = 7
range = 207,208

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,var(7)
;channel = 2
ignorehitpause = 1

[State 1110, 移動速度]
type = VelSet
trigger1 = AnimElemTime(2) = 0
x = 5.2

[State 1110, 移動速度]
type = VelSet
trigger1 = AnimElemTime(3) = 0
x = 0
y = 2

[State 1110, 移動速度]
type = Gravity
trigger1 = AnimElemTime(3) >= 0

[State 1110, ヒット定義]
type = HitDef
trigger1 = AnimElem = 2
attr = A, SA
animtype  = Hard
damage    = 70, 14
getpower = 60,30
priority  = 4
guardflag = HA
pausetime = 12,12
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-60
hitsound   = s12,2
guardsound = s6,0
ground.type = High
ground.slidetime = 16
ground.hittime  = 20
guard.slidetime = 16
guard.hittime = 16
guard.ctrltime = 16
ground.velocity = -6,-4
air.velocity = -5,-3.5
fall = 1
fall.recover = 0
yaccel = .44
ID = 1110

[State 1110, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(1110)
trigger1 = NumExplod(1110) = 0
anim = 4220
ID = 1110
pos = ceil(120*Const(size.xscale)), ceil(-100*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 1110, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(1110)
trigger1 = NumExplod(1110) = 0
anim = 4230
ID = 1110
pos = ceil(120*Const(size.xscale)), ceil(-100*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 1110, 着地]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52

;---------------------------------------------------------------------------
;ゲロカスアッパー(ベルン)
[Statedef 1150]
type    = S
movetype= A
physics = N
juggle  = 2
poweradd= 0
velset = 0,0
anim = 1150
ctrl = 0
sprpriority = 2

[State -3, ボイス分岐・ベルン]
type = VarRandom
trigger1 = Time = 1
v = 6
range = 0,1

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = var(6) = 0
trigger1 = time = 1
value = s20,50
channel = 1
ignorehitpause = 1

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = var(6) = 1
trigger1 = time = 1
value = s20,211
channel = 1
ignorehitpause = 1

[State 1150, 無敵]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0
value = SCA
ignorehitpause = 1

[State 1150, 移動速度]
type = VelSet
trigger1 = AnimElemTime(2) = 0
x = 1.8
y = -3.8

[State 1150, StateTypeSet]
type = StateTypeSet
trigger1 = animelemtime(2) = 0
statetype = A

[State 1150, 移動速度]
type = Gravity
trigger1 = AnimElemTime(2) >= 0

[State 1150, ヒット定義]
type = HitDef
triggerall = NumEnemy
trigger1 = var(14) = 0
trigger1 = Enemynear,statetype = A
trigger1 = AnimElem = 2
attr = A, SA
animtype  = Up
damage    = 70, 14
getpower = 60,30
priority  = 5
guardflag = MA
pausetime = 10,10
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-60
hitsound   = s12,2
guardsound = s6,0
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
guard.slidetime = 16
guard.hittime = 16
guard.ctrltime = 16
ground.velocity = 0
air.velocity = -1.2,-11.5
air.fall = 1
fall.recover = 0
yaccel = .44
ID = 1150

[State 1150, ヒット定義]
type = HitDef
triggerall = NumEnemy
triggerall = AnimElem = 2
trigger1 = Enemynear,statetype != A
trigger2 = var(14) != 0
trigger2 = Enemynear,statetype = A
attr = A, SA
animtype  = Hard
damage    = 87, 17
getpower = 60,30
priority  = 5
guardflag = MA
pausetime = 10,10-5*var(14)
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-60
hitsound   = s12,2
guardsound = s6,0
ground.type = high
ground.slidetime = 18
ground.hittime  = 18
guard.slidetime = 16
guard.hittime = 16
guard.ctrltime = 16
ground.velocity = 0
air.velocity = -1.2-4*var(14),-11.5+3*var(14)
air.fall = 1-var(14)
fall.recover = 0+var(14)
yaccel = .44+0.4*var(14)
ID = 1150

[State 1150, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(1150)
trigger1 = NumExplod(1150) = 0
anim = 4220
ID = 1150
pos = ceil(100*Const(size.xscale)), ceil(-160*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 1150, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(1150)
trigger1 = NumExplod(1150) = 0
anim = 4230
ID = 1150
pos = ceil(100*Const(size.xscale)), ceil(-160*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 1150, 着地]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52

;---------------------------------------------------------------------------
;ボンバー(ラムダ)
[Statedef 1160]
type    = S
movetype= A
physics = S
juggle  = 2
poweradd= 0
velset = 0,0
anim = 1160+ceil(var(10)*0.01)+ceil(var(12)*0.01)
ctrl = 0
sprpriority = 2

[State -3, ボイス分岐・ラムダ]
type = VarRandom
trigger1 = Time = 1
v = 7
range = 156,160

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,var(7)
channel = 2
ignorehitpause = 1

[State 1160, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 2
value = 12, 1

[State 1160, 崩れ落ち中の追撃スイッチ]
type = varset
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = var(10) = 0
var(10) = 54

[State 1160, ヒット定義]
type = HitDef
trigger1 = AnimElem = 2
attr = S, SA
animtype  = Hard
damage    = 37, 7
getpower = 60,30
priority  = 5
guardflag = MA
pausetime = 10,10
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-60
hitsound   = s12,0
guardsound = s6,0
ground.type = low
ground.slidetime = 16
ground.hittime  = 18
guard.slidetime = 15
guard.hittime = 15
guard.ctrltime = 15
ground.velocity = -6
air.velocity = -4,-3
fall.recover = 0
yaccel = .44
p2stateno = 1165+ceil(var(10)*0.01)+ceil(var(11)*0.01)
ID = 1160

[State 1160, ヒット・ガード]
type = Explod
trigger1 = NumExplod(1165) = 0
trigger1 = AnimElem = 2,0
anim = 4220
ID = 1165
pos = ceil(80*Const(size.xscale)), ceil(-90*Const(size.yscale))
postype = P1
facing = -1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 1160, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = movehit = 1
trigger1 = NumTarget(1160)
trigger1 = NumExplod(1160) = 0
anim = 4200
ID = 1160
pos = ceil(140*Const(size.xscale)), ceil(-100*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1
[State 1160, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(1160)
trigger1 = NumExplod(1160) = 0
anim = 4230
ID = 1160
pos = ceil(140*Const(size.xscale)), ceil(-100*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 1160, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;ボンバー・崩れ落ち/吹き飛び
[Statedef 1165]
type    = U
movetype= H
physics = N
poweradd= 0
velset = 0,0
ctrl = 0
sprpriority = 0

[State 1165, 無敵]
type = NotHitBy
trigger1 = time >46
value = SCA
ignorehitpause = 1

[State 1165, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = statetype = S || statetype = C
trigger1 = alive
trigger1 = Time < 18
value = 5010

[State 1165, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = statetype = S || statetype = C
trigger1 = alive
trigger1 = Time = 18
trigger1 = SelfAnimExist(5950)
value = 5950

[State 1165, 制御した相手のアニメ変更]
type = ChangeAnim2
trigger1 = statetype = S || statetype = C
trigger1 = alive
trigger1 = Time = 18
trigger1 = !SelfAnimExist(5950)
value = 1165

[State 1165, 相手ステートに戻す]
type = SelfState
trigger1 = statetype = S || statetype = C
trigger1 = alive
trigger1 = time = 75
value = 5120

[State 1165, 制御した相手のアニメ変更]
type = ChangeAnim
triggerall = Time = 0
trigger1 = statetype != S && statetype != C
trigger2 = alive = 0
value = 5030

[State 1165, 制御した相手のアニメ変更]
type = ChangeAnim
triggerall = anim = 5030
triggerall = AnimTime = 0
trigger1 = statetype != S && statetype != C
trigger2 = alive = 0
value = 5035

[State 1165, 制御した相手のアニメ変更]
type = ChangeAnim
triggerall = anim = 5035
triggerall = AnimTime = 0
trigger1 = statetype != S && statetype != C
trigger2 = alive = 0
value = 5050

[State 1165, 移動速度]
type = VelSet
triggerall = Time = 0
trigger1 = statetype != S && statetype != C
trigger2 = alive = 0
x = -3.5
y = -3.5

[State 1165, 速度加算];重力
type = VelAdd
trigger1 = statetype != S && statetype != C
trigger2 = alive = 0
y = .44

[State 1165, 相手ステートに戻す]
type = SelfState
triggerall = (Vel y > 0) && (Pos y >= 0)
trigger1 = statetype != S && statetype != C
trigger2 = alive = 0
value = 5100

;---------------------------------------------------------------------------
;ボンバー・復帰
[Statedef 1166]
type    = A
movetype= H
physics = N
poweradd= 0
velset = 0,0
ctrl = 0
sprpriority = 0

[State 1070, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = Time = 0
value = 5030

[State 1070, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = anim = 5030
trigger1 = AnimTime = 0
value = 5035

[State 1070, 制御した相手のアニメ変更]
type = ChangeAnim
trigger1 = anim = 5035
trigger1 = AnimTime = 0
value = 5050

[State 1070, 移動速度]
type = VelSet
trigger1 = Time = 0
x = -3.5
y = -3.5

[State 1070, 速度加算];重力
type = VelAdd
trigger1 = 1
y = .44

[State 1070, 相手ステートに戻す]
type = SelfState
triggerall = (Vel y > 0) && (Pos y >= 0)
trigger1 = alive = 0
value = 5100

[State 1070, 相手ステートに戻す]
type = SelfState
triggerall = (Vel y > 0) && (Pos y >= 0)
trigger1 = alive = 1
value = 52

;---------------------------------------------------------------------------
;ヘッドクラッシャーズ
[Statedef 1170]
type    = S
movetype= A
physics = S
juggle  = 2
poweradd= 0
velset = 0,0
anim = 1170
ctrl = 0
sprpriority = 2

[State -3, ボイス・ベルン]
type = PlaySnd
trigger1 = time = 1
value = s20,160
channel = 1
ignorehitpause = 1

[State 1170, 移動速度]
type = VelSet
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
x = 3.5

[State 1170, 無敵]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0
value = SCA
ignorehitpause = 1

[State 1070, ヒット定義]
type = HitDef
trigger1 = AnimElem = 2
attr = S, SA
animtype  = Hard
damage    = 40, 8
getpower = 60,30
priority  = 5
hitflag = MAF
guardflag = HA
pausetime = 5,5
sparkno = -1
guard.sparkno = -1
sparkxy = -10,-60
hitsound   = s12,1
guardsound = s6,0
ground.type = Low
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -4,-3.5
air.velocity = -4,-3
fall = 1
fall.recover = 0
Kill          = 0
hitonce = 1
p1stateno = 1180
p2stateno = 1190
ID = 1170

[State 1170, ヒット・ガード]
type = Explod
trigger1 = moveguarded  = 1
trigger1 = NumTarget(1170)
trigger1 = NumExplod(1170) = 0
anim = 4230
ID = 1170
pos = ceil(110*Const(size.xscale)), ceil(-120*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 3
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 1170, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;ヘッドクラッシャーズ・ヒット
[Statedef 1180]
type    = S
movetype= A
physics = N
anim = 1180
poweradd = 0
velset = 0,0
sprpriority = 2

[State -3, ボイス分岐・ラムダ]
type = VarRandom
trigger1 = Time = 1
v = 7
range = 169,172

[State -3, ボイス・ラムダ]
type = PlaySnd
trigger1 = Time = 1
value = s30,var(7)
channel = 2
ignorehitpause = 1

[State 1180, 音を鳴らす]
type = PlaySnd
trigger1 = AnimElem = 4
value = 12, 2

[State 1180, 2]
type = HitAdd
trigger1 = AnimElem = 4
value = 1

[State 1180, 物理的なキャラの幅]
type = Width
trigger1 = AnimElemTime(2) < 0
edge = ceil(220*Const(size.xscale)),0

;[State 1180, 掴んだ相手の位置１]
;type = TargetBind
;trigger1 = AnimElemTime(1) = 0
;pos = ceil(110*Const(size.xscale)), 0

[State 1180, 掴んだ相手の位置２]
type = TargetBind
trigger1 = AnimElemTime(3) = 0
pos = ceil(170*Const(size.xscale)), ceil(-200*Const(size.yscale))

[State 1180, 掴んだ相手の位置３]
type = TargetBind
trigger1 = AnimElemTime(4) = 0
pos = ceil(250*Const(size.xscale)), ceil(-4*Const(size.yscale))

[State 1180, 掴んだ相手の位置４]
type = TargetBind
trigger1 = AnimElemTime(5) = 0
pos = ceil(210*Const(size.xscale)), 0

[State 1180, 掴んだ相手のステート変更]
type = TargetState
trigger1 = AnimElem = 3
value = 1191

[State 1180, 掴んだ相手のステート変更]
type = TargetState
trigger1 = AnimElem = 4
value = 1192

[State 1180, 掴んだ相手のステート変更]
type = TargetState
trigger1 = AnimElem = 5
value = 1193

[State 1180, 掴んだ相手のライフ増減]
type = TargetLifeAdd
trigger1 = AnimElem = 4
value = ceil(-124*(const(data.attack)*0.01))

[State 1180, ラムダ]
type = Explod
trigger1 = NumExplod(1185) = 0
trigger1 = AnimElemTime(2) = 0
anim = 1185
ID = 1185
pos = ceil(161*Const(size.xscale)), 0
postype = P1
bindtime = -1
removetime = -2
sprpriority = 0
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
shadow = -1,-1,-1
removeongethit = 1
Persistent = 0
ignorehitpause = 1

[State 1180, ヒット・ガード]
type = Explod
triggerall = NumEnemy
trigger1 = AnimElemTime(4) = 0
trigger1 = NumExplod(1180) = 0
anim = 4220
ID = 1180
pos = ceil(260*Const(size.xscale)), ceil(-10*Const(size.yscale))
postype = P1
bindtime = 1
removetime = -2
sprpriority = 0
ownpal = 1
scale = Const(size.xscale), Const(size.yscale)
Persistent = 0
ignorehitpause = 1

[State 1180, ステート変更]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;ヘッドクラッシャーズ・相手側1
[Statedef 1190]
type    = S
movetype= H
physics = S
velset = 0,0
sprpriority = 1

[State 1090, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1190, 移動速度]
type = VelSet
trigger1 = time < 8
x = -3.5

[State 1190,]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1190, 相手のアニメ変更]
type = ChangeAnim2
trigger1 = Time = 0
value = 1190

[State 1190, 相手ステートに戻す]
type = SelfState
trigger1 = Time = 35
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;ヘッドクラッシャーズ・相手側2
[Statedef 1191]
type    = A
movetype= H
physics = N
velset = 0,0
sprpriority = 1

[State 1191,]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1191, 相手のアニメ変更]
type = ChangeAnim2
trigger1 = Time = 0
value = 1191

;---------------------------------------------------------------------------
;ヘッドクラッシャーズ・相手側3
[Statedef 1192]
type    = A
movetype= H
physics = N
velset = 0,0
sprpriority = 1

[State 1192,]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1192, 相手のアニメ変更]
type = ChangeAnim2
trigger1 = Time = 0
value = 1192

;---------------------------------------------------------------------------
;ヘッドクラッシャーズ・相手側4
[Statedef 1193]
type    = A
movetype= H
physics = N
velset = -3.5,-4
poweradd = 40
sprpriority = 1

[State 1193, 相手のアニメ変更]
type = ChangeAnim2
trigger1 = Time = 0
value = 1193

[State 1193,]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1193, 速度加算];重力
type = VelAdd
trigger1 = 1
y = .4

[State 1193, 相手ステートに戻す]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
