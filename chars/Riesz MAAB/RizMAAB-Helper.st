;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
; 助手定義 ‖ ヘルパーステート
; Helper Definition
;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

;===========================================================================
; No Walk After Blocking
; 格擋之後不能行走
;===========================================================================
[Statedef 7000]
type = A
movetype = I
physics = N
anim = 99999
velset = 0,0
sprpriority = 0

[State 7000, 1 (Timer Reset)]
type = VarSet
trigger1 = Root,StateNo = [520,545]
var(31) = 7

[State 7000, 2 (Timer)]
type = VarAdd
trigger1 = 1
var(31) = -1

[State 7000, 3 (Helper Remove)]
type = DestroySelf
trigger1 = var(31) <= 0

;===========================================================================
; Guard Cancle Spark Effect
; 防禦取消火花特效
;===========================================================================
[Statedef 7110]
type = A
movetype = I
physics = N
anim = 99999
ctrl = 0
velset = 0,0

[State 7110, 1]
type = BGPalFX
trigger1 = 1
time = 1
color = 16*time
mul = 16*time,16*time,16*time

[State 7110, 2 (Circle Explod Stand)]
type = Explod
triggerall = Time = 0
trigger1 = Root,StateType != C
trigger1 = Root,StateNo = [710,715]
anim = 7110
id = 7110
sprpriority = 3
;space = stage
bindid = root,id
pos = cond(root,facing = 1,0,-0)*root,fvar(21),-366*root,fvar(22)
facing = facing
removetime = 16
supermovetime = -1
bindtime = 1
ownpal = 1
remappal = 7110,1
ignorehitpause = 1 ;必須要無視攻擊暫停 否則會無法正常顯示

[State 7110, 3 (Circle Explod Crouch)]
type = Explod
triggerall = Time = 0
trigger1 = Root,StateType = C
trigger1 = Root,StateNo = [710,715]
anim = 7110
id = 7110
sprpriority = 3
;space = stage
bindid = root,id
pos = cond(root,facing = 1,-70,70)*root,fvar(21),-180*root,fvar(22)
facing = facing
removetime = 16
supermovetime = -1
bindtime = 1
ownpal = 1
remappal = 7110,1
ignorehitpause = 1

[State 7110, 4 (Circle Explod Stand)]
type = Explod
triggerall = Time = 0
trigger1 = Root,StateType != C
trigger1 = Root,StateNo = [720,725]
anim = 7110
id = 7110
sprpriority = 3
;space = stage
bindid = root,id
pos = cond(root,facing = 1,0,-0)*root,fvar(21),-366*root,fvar(22)
facing = facing
removetime = 16
supermovetime = -1
bindtime = 1
ownpal = 1
remappal = 7110,0
ignorehitpause = 1

[State 7110, 5 (Circle Explod Crouch)]
type = Explod
triggerall = Time = 0
trigger1 = Root,StateType = C
trigger1 = Root,StateNo = [720,725]
anim = 7110
id = 7110
sprpriority = 3
;space = stage
bindid = root,id
pos = cond(root,facing = 1,-70,70)*root,fvar(21),-180*root,fvar(22)
facing = facing
removetime = 16
supermovetime = -1
bindtime = 1
ownpal = 1
remappal = 7110,0
ignorehitpause = 1

[State 7110, 6]
type = ModifyExplod
trigger1 = NumExplod(7110)
id = 7110
scale = (0.0625*time)*root,fvar(22),(0.0625*time)*root,fvar(22)
trans = addalpha
alpha = 256-(16*time),256

[State 7110, 7 (Helper Remove)]
type = DestroySelf
trigger1 = Time >= 16

;===========================================================================
; Hit Spark Helper I (Used Statedef 210)
; 打擊火花啟動用助手1 (使用於狀態定義 210)
;===========================================================================
[Statedef 7200]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7200, 1]
type = VarSet
trigger1 = var(12) = 0
trigger1 = var(11) = 0
v = 52
value = parent,var(25)

[State 7200, 2]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7211
anim = 7211 ;該Anim共10幀 (10 ticks)
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y) ;*
;pos = pos x+camerapos x,pos y
facing = facing
ownpal = 1
sprpriority = -2
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

;*如果該Statedef是一個Helper助手，座標pos x和pos y數值就是該Helper助手的pos參數(默認值為0,0)。

[State 7200, 3]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7210
anim = 7210 ;該Anim共10幀 (10 ticks)
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
angle = var(52)
sprpriority = 5
scale = root,fvar(21)*1.10,root,fvar(22)*1.10
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7200, 4 (Counter Spark A)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7305) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7305
anim = 7305
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 5
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7200, 5 (Counter Spark B)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7306) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7306
anim = 7306
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 9
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7200, 6]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7200, 7 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0 ;變量var(11)賦值0
trigger1 = var(12):= var(12)+1 ;變量var(12)賦值var(12)+1
trigger1 = var(12) = 14 ;數值設定為招式的打擊框最大幀數+招式的Pausetime數值(採用較大數值) 
                        ;Pausetime左方數值是凍結P1的時間 單位是遊戲幀數 右方數值是在被擊中後退前造成P2震動的時間
                        ;因為Statedef 210的打擊框最大幀數為6參數，而Pausetime數值為8 所以設定為14

;===========================================================================
; Hit Spark Helper II (Used Statedef 250)
; 打擊火花啟動用助手2 (使用於狀態定義 250)
;===========================================================================
[Statedef 7210]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7210, 1]
type = VarSet
trigger1 = var(12) = 0
trigger1 = var(11) = 0
v = 52
value = parent,var(25)

[State 7210, 2 (Hit Spark)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7232 ;該Anim共14幀 (14 ticks)
id = 7232
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
scale = root,fvar(21)*1.38,root,fvar(22)*1.38
sprpriority = 5
angle = var(52)
remappal = 7232,1
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7210, 3 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7230 ;該Anim共11幀 (11 ticks)
id = 7230
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
scale = root,fvar(21)*1.38,root,fvar(22)*1.38
sprpriority = 5
angle = var(52)
remappal = 7230,1
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7210, 4 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7231 ;該Anim共11幀 (11 ticks)
id = 7231
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
scale = root,fvar(21)*1.38,root,fvar(22)*1.38
sprpriority = 5
angle = var(52)
remappal = 7230,0
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7210, 5 (Counter Spark A)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7305) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7305
anim = 7305
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 5
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7210, 6 (Counter Spark B)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7306) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7306
anim = 7306
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 9
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7210, 7]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7210, 8 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 13 ;採用Statedef 250的打擊框最大幀數3+Pausetime數值10 = 13

;===========================================================================
; Hit Spark Helper III (Used Statedef 440)
; 打擊火花啟動用助手3 (使用於狀態定義 440)
;===========================================================================
[Statedef 7220]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7220, 1]
type = VarSet
trigger1 = var(12) = 0
trigger1 = var(11) = 0
v = 52
value = parent,var(25)

[State 7220, 2]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7211
anim = 7211
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
ownpal = 1
sprpriority = -2
scale = root,fvar(21)*1.30,root,fvar(22)*1.30
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7220, 3]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7214
anim = 7214
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*1.10,root,fvar(22)*1.10
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7220, 4]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7212
anim = 7212
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
angle = var(52)
sprpriority = 5
scale = root,fvar(21)*1.30,root,fvar(22)*1.30
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7220, 5]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7210
anim = 7210
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
angle = var(52)
sprpriority = 5
scale = root,fvar(21)*1.30,root,fvar(22)*1.30
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7220, 6 (Counter Spark A)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7305) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7305
anim = 7305
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 5
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7220, 7 (Counter Spark B)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7306) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7306
anim = 7306
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 9
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7220, 8]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7220, 9 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 15 ;採用Statedef 440的打擊框最大幀數5+Pausetime數值10 = 15

;===========================================================================
; Hit Spark Helper IV (Used Statedef 200 400)
; 打擊火花啟動用助手4 (使用於狀態定義 200 400)
;===========================================================================
[Statedef 7230]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7230, 1]
type = VarSet
trigger1 = var(12) = 0
trigger1 = var(11) = 0
v = 52
value = parent,var(25)

[State 7230, 2 (Hit Spark)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7232 ;該Anim共14幀 (14 ticks)
id = 7232
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
scale = root,fvar(21)*1.10,root,fvar(22)*1.10
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7230, 3 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7230 ;該Anim共11幀 (11 ticks)
id = 7230
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
scale = root,fvar(21)*1.10,root,fvar(22)*1.10
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7230, 4 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7231 ;該Anim共11幀 (11 ticks)
id = 7231
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
scale = root,fvar(21)*1.10,root,fvar(22)*1.10
sprpriority = 5
angle = var(52)
remappal = 7230,1
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7230, 5 (Counter Spark A)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7305) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7305
anim = 7305
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 5
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7230, 6 (Counter Spark B)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7306) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7306
anim = 7306
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 9
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7230, 7]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7230, 8 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 14 ;採用Statedef 400的打擊框最大幀數(大約6)+Statedef 400的Pausetime數值8 = 14

;===========================================================================
; Hit Spark Helper V (Used Statedef 600 620 625)
; 打擊火花啟動用助手5 (使用於狀態定義 600 620 625)
;===========================================================================
[Statedef 7231]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7231, 1]
type = VarSet
trigger1 = var(12) = 0
trigger1 = var(11) = 0
v = 52
value = parent,var(25)

[State 7231, 2 (Hit Spark)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7232 ;該Anim共14幀 (14 ticks)
id = 7232
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
scale = root,fvar(21)*1.10,root,fvar(22)*1.10
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7231, 3 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7230 ;該Anim共11幀 (11 ticks)
id = 7230
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
scale = root,fvar(21)*1.10,root,fvar(22)*1.10
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7231, 4 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7231 ;該Anim共11幀 (11 ticks)
id = 7231
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
scale = root,fvar(21)*1.10,root,fvar(22)*1.10
sprpriority = 5
angle = var(52)
remappal = 7230,1
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7231, 5 (Counter Spark A)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7305) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7305
anim = 7305
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 5
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7231, 6 (Counter Spark B)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7306) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7306
anim = 7306
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 9
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7231, 7]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7231, 8 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 25 ;採用Statedef 620的打擊框最大幀數(大約10)+Statedef 620的Pausetime數值15 = 25

;===========================================================================
; Hit Spark Helper VI (Used Statedef 230 410)
; 打擊火花啟動用助手6 (使用於狀態定義 230 410)
;===========================================================================
[Statedef 7234]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7234, 1]
type = VarSet
trigger1 = var(12) = 0
trigger1 = var(11) = 0
v = 52
value = parent,var(25)

[State 7234, 2 (Hit Spark)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7232
id = 7232
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
scale = root,fvar(21)*1.50,root,fvar(22)*1.50
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7234, 3 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7230
id = 7230
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
scale = root,fvar(21)*1.50,root,fvar(22)*1.50
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7234, 4 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7231
id = 7231
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
scale = root,fvar(21)*1.50,root,fvar(22)*1.50
sprpriority = 5
angle = var(52)
remappal = 7230,1
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7234, 5 (Counter Spark A)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7305) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7305
anim = 7305
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 5
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7234, 6 (Counter Spark B)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7306) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7306
anim = 7306
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 9
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7234, 7]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7234, 8 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 19 ;採用Statedef 230的打擊框最大幀數7+Pausetime數值12 = 19

;===========================================================================
; Hit Spark Helper VII (Used Statedef 610)
; 打擊火花啟動用助手7 (使用於狀態定義 610)
;===========================================================================
[Statedef 7235]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7235, 1]
type = VarSet
trigger1 = var(12) = 0
trigger1 = var(11) = 0
v = 52
value = parent,var(25)

[State 7235, 2 (Hit Spark)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7232
id = 7232
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
scale = root,fvar(21)*1.50,root,fvar(22)*1.50
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7235, 3 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7230
id = 7230
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
scale = root,fvar(21)*1.50,root,fvar(22)*1.50
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7235, 4 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7231
id = 7231
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
scale = root,fvar(21)*1.50,root,fvar(22)*1.50
sprpriority = 5
angle = var(52)
remappal = 7230,1
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7235, 5 (Counter Spark A)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7305) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7305
anim = 7305
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 5
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7235, 6 (Counter Spark B)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7306) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7306
anim = 7306
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 9
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7235, 7]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7235, 8 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 22 ;採用Statedef 610的打擊框最大幀數7+Pausetime數值15 = 22

;===========================================================================
; Hit Spark Helper VIII (Used Statedef 220 227 235 240 3205 23203)
; 打擊火花啟動用助手8 (使用於狀態定義 220 227 235 240 3205 23203)
;===========================================================================
[Statedef 7236]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7236, 1]
type = VarSet
trigger1 = var(12) = 0
trigger1 = var(11) = 0
v = 52
value = parent,var(25)

[State 7236, 2 (Hit Spark)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7232
id = 7232
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
scale = root,fvar(21)*1.65,root,fvar(22)*1.65
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7236, 3 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7230
id = 7230
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
scale = root,fvar(21)*1.65,root,fvar(22)*1.65
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7236, 4 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7231
id = 7231
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
scale = root,fvar(21)*1.65,root,fvar(22)*1.65
sprpriority = 5
angle = var(52)
remappal = 7230,1
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7236, 5 (Counter Spark A)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7305) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7305
anim = 7305
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 5
sprpriority = 9
scale = root,fvar(21)*0.52,root,fvar(22)*0.52
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7236, 6 (Counter Spark B)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7306) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7306
anim = 7306
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 9
sprpriority = 9
scale = root,fvar(21)*0.52,root,fvar(22)*0.52
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7236, 7]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7236, 8 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 20 ;採用Statedef 240的打擊框最大幀數8+Pausetime數值12 = 20

;===========================================================================
; Hit Spark Helper IX (Used Statedef 640 645)
; 打擊火花啟動用助手9 (使用於狀態定義 640 645)
;===========================================================================
[Statedef 7240]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7240, 1]
type = VarSet
trigger1 = var(12) = 0
trigger1 = var(11) = 0
v = 52
value = parent,var(25)

[State 7240, 2 (Hit Spark)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7232 ;該Anim共14幀 (14 ticks)
id = 7232
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,(enemynear(root,var(48)),pos y)+root,const(size.mid.pos.y);*
facing = enemynear(root,var(48)),facing
scale = root,fvar(21)*1.65,root,fvar(22)*1.65
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

; 因為招式的攻擊範圍大(甚至可以跳過對手打擊對手背部，類似八神的外式百合折)，打擊火花對應部份改為P2對手
; root,const(size.mid.pos.y)的部份是對應莉絲本體的Mid Pos Y(P1)

[State 7240, 3 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7230 ;該Anim共11幀 (11 ticks)
id = 7230
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,(enemynear(root,var(48)),pos y)+root,const(size.mid.pos.y)
facing = enemynear(root,var(48)),facing
scale = root,fvar(21)*1.65,root,fvar(22)*1.65
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7240, 4 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7231 ;該Anim共11幀 (11 ticks)
id = 7231
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,(enemynear(root,var(48)),pos y)+root,const(size.mid.pos.y)
facing = enemynear(root,var(48)),facing
scale = root,fvar(21)*1.65,root,fvar(22)*1.65
sprpriority = 5
angle = var(52)
remappal = 7230,1
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7240, 5 (Counter Spark A)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7305) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7305
anim = 7305
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,(enemynear(root,var(48)),pos y)+root,const(size.mid.pos.y)
facing = enemynear(root,var(48)),facing
ownpal = 1
removetime = 5
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7240, 6 (Counter Spark B)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7306) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7306
anim = 7306
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,(enemynear(root,var(48)),pos y)+root,const(size.mid.pos.y)
facing = enemynear(root,var(48)),facing
ownpal = 1
removetime = 9
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7240, 7]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7240, 8 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 24 ;採用Statedef 640的打擊框最大幀數9+Pausetime數值15 = 24

;===========================================================================
; Hit Spark Helper X (Used Statedef 222 1000 1050)
; 打擊火花啟動用助手10 (使用於狀態定義 222 1000 1050)
;===========================================================================
[Statedef 7250]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7250, 1]
type = VarSet
trigger1 = var(12) = 0
trigger1 = var(11) = 0
v = 52
value = parent,var(25)

[State 7250, 2 (Hit Spark)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7232 ;該Anim共14幀 (14 ticks)
id = 7232
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
scale = root,fvar(21)*1.10,root,fvar(22)*1.10
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7250, 3 (Hit Spark)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7218 ;該Anim共14幀 (14 ticks)
id = 7218
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
scale = root,fvar(21)*1.10,root,fvar(22)*1.10
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7250, 4 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7230 ;該Anim共11幀 (11 ticks)
id = 7230
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
scale = root,fvar(21)*1.10,root,fvar(22)*1.10
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7250, 5 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7231 ;該Anim共11幀 (11 ticks)
id = 7231
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
scale = root,fvar(21)*1.10,root,fvar(22)*1.10
sprpriority = 5
angle = var(52)
remappal = 7230,1
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7250, 6 (Counter Spark A)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7305) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7305
anim = 7305
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 5
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7250, 7 (Counter Spark B)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7306) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7306
anim = 7306
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 9
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7250, 8]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7250, 9 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 5 ;採用Statedef 222的打擊框最大幀數3+Pausetime數值2 = 5

;===========================================================================
; Hit Spark Helper XI (Used Statedef 1100 1200 1300)
; 打擊火花啟動用助手11 (使用於狀態定義 1100 1200 1300)
;===========================================================================
[Statedef 7255]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7255, 1]
type = VarSet
trigger1 = var(12) = 0
trigger1 = var(11) = 0
v = 52
value = parent,var(25)

[State 7255, 2 (Hit Spark)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7232
id = 7232
;space = stage
;pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
pos = pos x+camerapos x,pos y+(enemynear(root,var(48)),pos y/2) ;*
facing = facing
scale = root,fvar(21)*1.10,root,fvar(22)*1.10
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

;*因為招式設計特殊(攻擊框上下範圍廣且角色在地上時)改用此組代碼

[State 7255, 3 (Hit Spark)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7218
id = 7218
;space = stage
;pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
pos = pos x+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
scale = root,fvar(21)*1.10,root,fvar(22)*1.10
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7255, 4 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7230
id = 7230
;space = stage
;pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
pos = pos x+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
scale = root,fvar(21)*1.10,root,fvar(22)*1.10
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7255, 5 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7231
id = 7231
;space = stage
;pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
pos = pos x+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
scale = root,fvar(21)*1.10,root,fvar(22)*1.10
sprpriority = 5
angle = var(52)
remappal = 7230,1
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7255, 6 (Counter Spark A)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7305) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7305
anim = 7305
;space = stage
;pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
pos = pos x+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
ownpal = 1
removetime = 5
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7255, 7 (Counter Spark B)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7306) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7306
anim = 7306
;space = stage
;pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
pos = pos x+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
ownpal = 1
removetime = 9
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7255, 8]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7255, 9 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 4 ;採用Statedef 1200的打擊框最大幀數16(2*8)+Pausetime數值5 = 21
                       ;為了要連續出現 所以改為Statedef打擊框總幀數21除以4 (因為GameTime %4 = 0)

;===========================================================================
; Hit Spark Helper XII (Used Statedef 1402 1409 1425 1452 1475)
; 打擊火花啟動用助手12 (使用於狀態定義 1402 1409 1425 1452 1475)
;===========================================================================
[Statedef 7260]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7260, 1]
type = VarSet
trigger1 = var(12) = 0
trigger1 = var(11) = 0
v = 52
value = parent,var(25)

[State 7260, 2 (Hit Spark)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7232
id = 7232
space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y) ;*
facing = facing
scale = root,fvar(21)*1.40,root,fvar(22)*1.40
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

;*如果對手在上方，Y軸這樣設置可以讓效果靠近我方位置。

[State 7260, 3 (Hit Spark)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7218
id = 7218
space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
scale = root,fvar(21)*1.40,root,fvar(22)*1.40
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7260, 4 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7230
id = 7230
space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
scale = root,fvar(21)*1.40,root,fvar(22)*1.40
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7260, 5 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7231
id = 7231
space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
scale = root,fvar(21)*1.40,root,fvar(22)*1.40
sprpriority = 5
angle = var(52)
remappal = 7230,1
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7260, 6 (Counter Spark A)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = Root,StateNo != 1409
triggerall = root,var(50) = 1
triggerall = NumExplod(7305) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7305
anim = 7305
space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 5
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7260, 7 (Counter Spark B)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = Root,StateNo != 1409
triggerall = root,var(50) = 1
triggerall = NumExplod(7306) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7306
anim = 7306
space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 9
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7260, 8]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7260, 9 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 26 ;採用Statedef 1475的打擊框最大幀數(3*4大約12)+Pausetime數值14 = 26

;===========================================================================
; Hit Spark Helper XIII (Used Statedef 1201 1301)
; 打擊火花啟動用助手13 (使用於狀態定義 1201 1301)
;===========================================================================
[Statedef 7265]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7265, 1]
type = VarSet
trigger1 = var(12) = 0
trigger1 = var(11) = 0
v = 52
value = parent,var(25)

[State 7265, 2 (Hit Spark)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7232
id = 7232
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
scale = root,fvar(21)*1.60,root,fvar(22)*1.60
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7265, 3 (Hit Spark)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7218
id = 7218
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
scale = root,fvar(21)*1.60,root,fvar(22)*1.60
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7265, 4 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7230
id = 7230
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
scale = root,fvar(21)*1.60,root,fvar(22)*1.60
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7265, 5 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7231
id = 7231
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
scale = root,fvar(21)*1.60,root,fvar(22)*1.60
sprpriority = 5
angle = var(52)
remappal = 7230,1
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7265, 6 (Counter Spark A)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7305) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7305
anim = 7305
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 5
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7265, 7 (Counter Spark B)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7306) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7306
anim = 7306
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 9
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7265, 8]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7265, 9 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 19 ;採用Statedef 1201的打擊框最大幀數8(2*4)+Pausetime數值11 = 19

;===========================================================================
; Hit Spark Helper XIV (Used Statedef 1600)
; 打擊火花啟動用助手14 (使用於狀態定義 1600)
;===========================================================================
[Statedef 7266]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7266, 1]
type = VarSet
trigger1 = var(12) = 0
trigger1 = var(11) = 0
v = 52
value = Random%360

[State 7266, 2 (Hit Spark)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7232 ;該Anim共14幀 (14 ticks)
id = 7232
;space = stage
pos = pos x+camerapos x,pos y ;*
facing = -facing ;因為該Explod是用在P2上，所以前面加上負號
scale = root,fvar(21)*1.50,root,fvar(22)*1.50
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

;*這個Statedef是一個Helper助手，而這個Helper的postype為p2
; 因此該Explod要對應到對手身上(實際上是對應到這個Helper身上)，可以寫成pos x+camerapos x,pos y

[State 7266, 3 (Hit Spark)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7218 ;該Anim共14幀 (14 ticks)
id = 7218
;space = stage
pos = pos x+camerapos x,pos y ;cond(p2dist x < 0,0,cond(p2dist x < cond(facing = 1,480,-480),p2dist x,cond(facing = 1,480,-480)))*fvar(21),-360*fvar(22)
facing = -facing
scale = root,fvar(21)*1.50,root,fvar(22)*1.50
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7266, 4 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7230 ;該Anim共11幀 (11 ticks)
id = 7230
;space = stage
pos = pos x+camerapos x,pos y ;cond(p2dist x < 0,0,cond(p2dist x < cond(facing = 1,480,-480),p2dist x,cond(facing = 1,480,-480)))*fvar(21),-360*fvar(22)
facing = -facing
scale = root,fvar(21)*1.50,root,fvar(22)*1.50
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7266, 5 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7231 ;該Anim共11幀 (11 ticks)
id = 7231
;space = stage
pos = pos x+camerapos x,pos y ;cond(p2dist x < 0,0,cond(p2dist x < cond(facing = 1,480,-480),p2dist x,cond(facing = 1,480,-480)))*fvar(21),-360*fvar(22)
facing = -facing
scale = root,fvar(21)*1.50,root,fvar(22)*1.50
sprpriority = 5
angle = var(52)
remappal = 7230,1
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7266, 6]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7266, 7 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 9 ;採用飛行道具7632的Projmisstime = 9

;===========================================================================
; Hit Spark Helper XV (Used Statedef 2402 2403 2452 2453)
; 打擊火花啟動用助手15 (使用於狀態定義 2402 2403 2452 2453)
;===========================================================================
[Statedef 7270]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7270, 1]
type = VarSet
trigger1 = var(12) = 0
trigger1 = var(11) = 0
v = 52
value = parent,var(25)

[State 7270, 2]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7211
anim = 7211
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
ownpal = 1
removetime = 9 ;為了符合招式特性，爆炸火花的移除時間提早了 11 → 9
sprpriority = -2
scale = root,fvar(21)*1.40,root,fvar(22)*1.40
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7270, 3]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7214
anim = 7214
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 9 ;為了符合招式特性，爆炸火花的移除時間提早了 20 → 9
sprpriority = 5
scale = root,fvar(21)*1.20,root,fvar(22)*1.20
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7270, 4]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7212
anim = 7212
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
angle = var(52)
removetime = 9 ;為了符合招式特性，爆炸火花的移除時間提早了 16 → 9
sprpriority = 5
scale = root,fvar(21)*1.40,root,fvar(22)*1.40
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7270, 5]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7210
anim = 7210
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
angle = var(52)
removetime = 9 ;為了符合招式特性，爆炸火花的移除時間提早了 10 → 9
sprpriority = 5
scale = root,fvar(21)*1.40,root,fvar(22)*1.40
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7270, 6 (Counter Spark A)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7305) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7305
anim = 7305
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 5
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7270, 7 (Counter Spark B)]
type = Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7306) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7306
anim = 7306
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
removetime = 9
sprpriority = 9
scale = root,fvar(21)*0.42,root,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7270, 8]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7270, 9 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 18 ;採用Statedef 2402的打擊框最大幀數12(3*4)+Pausetime數值6 = 18

;===========================================================================
; Hit Spark Helper XVI (Used Statedef 7740 7760)
; 打擊火花啟動用助手16 (使用於狀態定義 7740 7760)
;===========================================================================
[Statedef 7280]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7280, 1]
type = VarSet
trigger1 = var(12) = 0
trigger1 = var(11) = 0
v = 52
value = parent,var(25)

[State 7280, 2 (Hit Spark)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7232
id = 7232
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,pos y+(enemynear(root,var(48)),pos y/2) ;*
;pos = (enemynear(root,var(48)),pos x)+camerapos x,pos y
;pos = pos x+camerapos x,pos y
facing = facing ;*
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

;*(enemynear(root,var(48)),pos x) ;該Pos X對應到附近的對手身上
; facing = facing ;朝向刻意保持P1方向 (正常情況對應到對手身上，應該是facing = enemynear,facing)
; 該Helper目前的Pos Y值，加上靠近敵人的Pos Y值的一半(該對手在半空中被擊中時出現高度偏差)。

[State 7280, 3 (Hit Spark)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7218
id = 7218
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7280, 4 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7230
id = 7230
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 5
angle = var(52)
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7280, 5 (Slash Effect)]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
anim = 7231
id = 7231
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 5
angle = var(52)
remappal = 7230,1
ownpal = 1
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7280, 6 (Counter Spark A)]
type = Null;Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7305) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7305
anim = 7305
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
ownpal = 1
removetime = 5
sprpriority = 9
scale = root,fvar(21)*0.62,root,fvar(22)*0.62
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7280, 7 (Counter Spark B)]
type = Null;Explod
triggerall = NumEnemy
triggerall = Root,MoveHit
triggerall = root,var(50) = 1
triggerall = NumExplod(7306) = 0
triggerall = EnemyNear(root,var(48)),MoveType = H
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7306
anim = 7306
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
ownpal = 1
removetime = 9
sprpriority = 9
scale = root,fvar(21)*0.62,root,fvar(22)*0.62
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7280, 8]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7280, 9 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 6 ;採用Statedef 7740的GameTime%6 = 0

;===========================================================================
; Hit Spark Helper XVII (Used Statedef 3100)
; 打擊火花啟動用助手17 (使用於狀態定義 3100)
;===========================================================================
[Statedef 7290]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7290, 1]
type = VarSet
trigger1 = var(12) = 0
trigger1 = var(11) = 0
v = 52
value = parent,var(25)

[State 7290, 2]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7216
anim = 7216
;space = stage
;pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
pos = pos x+camerapos x,pos y+(enemynear(root,var(48)),pos y/2) ;*
facing = facing
remappal = 7216,1
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*1.20,root,fvar(22)*1.20
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

;*因為招式設計特殊(角色在地上時，攻擊框上下Y軸範圍廣)改用此代碼組高度部份較能跟隨對手

[State 7290, 3]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7212
anim = 7212
;space = stage
pos = pos x+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
remappal = 7210,1
ownpal = 1
angle = var(52)
sprpriority = 5
scale = root,fvar(21)*1.50,root,fvar(22)*1.50
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7290, 4]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7210
anim = 7210
;space = stage
pos = pos x+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
remappal = 7210,1
ownpal = 1
angle = var(52)
sprpriority = 5
scale = root,fvar(21)*1.50,root,fvar(22)*1.50
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7290, 5]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7290, 6 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 9 ;採用Statedef 3100的打擊框最大幀數9

;===========================================================================
; Guard Spark Helper I (Used Statedef 200 210 250 400 23204)
; 防禦火花啟動用助手1 (使用於狀態定義 200 210 250 400 23204)
;===========================================================================
[Statedef 7300]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7300, 1]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7311
anim = 7311
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7300, 2]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7310
anim = 7310
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7300, 3]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7300, 4 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0 ;變量var(11)賦值0
trigger1 = var(12):= var(12)+1 ;變量var(12)賦值var(12)+1
trigger1 = var(12) = 25 ;數值設定為招式的打擊框最大幀數+招式的Pausetime數值(採用較大數值) 
                        ;Pausetime左方數值是凍結P1的時間 單位是遊戲幀數 右方數值是在被擊中後退前造成P2震動的時間
                        ;因為Statedef 620的打擊框最大幀數大約為10參數，而Pausetime數值為15 所以設定為25


;===========================================================================
; Guard Spark Helper II (Used Statedef 600 620 625)
; 防禦火花啟動用助手2 (使用於狀態定義 600 620 625)
;===========================================================================
[Statedef 7301]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7301, 1]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7311
anim = 7311
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7301, 2]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7310
anim = 7310
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7301, 3]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7301, 4 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0 ;變量var(11)賦值0
trigger1 = var(12):= var(12)+1 ;變量var(12)賦值var(12)+1
trigger1 = var(12) = 25

;===========================================================================
; Guard Spark Helper III (Used Statedef 210 23202)*
; 防禦火花啟動用助手3 (使用於狀態定義 210 23202)
;===========================================================================
[Statedef 7305]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

;*因為跟Statedef 200共同一組Helper助手
; var(12) = 25的話會造成Statedef 210的防禦火花顯示不出來，因此另外設定一個Statedef狀態定義

[State 7305, 1]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7311
anim = 7311
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7305, 2]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7310
anim = 7310
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7305, 3]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7305, 4 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 14 

;===========================================================================
; Guard Spark Helper IV (Used Statedef 220 227 230 235 240 410 440 23203)
; 防禦火花啟動用助手4 (使用於狀態定義 220 227 230 235 240 410 440 23203)
;===========================================================================
[Statedef 7310]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7310, 1]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7311
anim = 7311
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7310, 2]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7310
anim = 7310
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7310, 3]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7314
anim = 7314 ;該Anim共15幀 (15 ticks)
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7310, 4]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7313
anim = 7313
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7310, 5]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7310, 6 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 15 ;採用Statedef 440的打擊框最大幀數5+Pausetime數值10 = 15

;===========================================================================
; Guard Spark Helper V (Used Statedef 610)
; 防禦火花啟動用助手5 (使用於狀態定義 610)
;===========================================================================
[Statedef 7311]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7311, 1]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7311
anim = 7311
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7311, 2]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7310
anim = 7310
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7311, 3]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7314
anim = 7314 ;該Anim共15幀 (15 ticks)
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7311, 4]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7313
anim = 7313
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7311, 5]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7311, 6 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 22

;===========================================================================
; Guard Spark Helper VI (Used Statedef 222 1000 1050)
; 防禦火花啟動用助手6 (使用於狀態定義 222 1000 1050)
;===========================================================================
[Statedef 7312]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7312, 1]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7311
anim = 7311
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7312, 2]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7310
anim = 7310
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7312, 3]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7314
anim = 7314 ;該Anim共15幀 (15 ticks)
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7312, 4]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7313
anim = 7313
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7312, 5]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7312, 6 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 4 ;採用Statedef 1200的打擊框最大幀數16(2*8)+Pausetime數值5 = 21
                       ;為了要連續出現 所以改為Statedef打擊框總幀數21除以4 (因為GameTime %4 = 0)

;===========================================================================
; Guard Spark Helper VII (Used Statedef 1100 1200 1300)
; 防禦火花啟動用助手7 (使用於狀態定義 1100 1200 1300)
;===========================================================================
[Statedef 7314]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7314, 1]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7311
anim = 7311
;space = stage
;pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
pos = pos x+camerapos x,pos y+(enemynear(root,var(48)),pos y/2) ;*
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

;*因為招式設計特殊(角色在地上時，攻擊框上下Y軸範圍廣)改用此代碼組高度部份較能跟隨對手

[State 7314, 2]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7310
anim = 7310
;space = stage
;pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
pos = pos x+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7314, 3]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7314
anim = 7314 ;該Anim共15幀 (15 ticks)
;space = stage
;pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
pos = pos x+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7314, 4]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7313
anim = 7313
;space = stage
;pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
pos = pos x+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7314, 5]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7314, 6 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 4 ;採用Statedef 1200的打擊框最大幀數16(2*8)+Pausetime數值5 = 21
                       ;為了要連續出現 所以改為Statedef打擊框總幀數21除以4 (因為GameTime %4 = 0)

;===========================================================================
; Guard Spark Helper VIII (Used Statedef 640 645 23201)
; 防禦火花啟動用助手8 (使用於狀態定義 640 645 23201)
;===========================================================================
[Statedef 7315]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7315, 1]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7311
anim = 7311
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,(enemynear(root,var(48)),pos y)+root,const(size.mid.pos.y)
facing = enemynear(root,var(48)),facing
sprpriority = 5
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7315, 2]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7310
anim = 7310
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,(enemynear(root,var(48)),pos y)+root,const(size.mid.pos.y)
facing = enemynear(root,var(48)),facing
sprpriority = 5
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7315, 3]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7314
anim = 7314
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,(enemynear(root,var(48)),pos y)+root,const(size.mid.pos.y)
facing = enemynear(root,var(48)),facing
sprpriority = 5
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7315, 4]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7313
anim = 7313
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,(enemynear(root,var(48)),pos y)+root,const(size.mid.pos.y)
facing = enemynear(root,var(48)),facing
sprpriority = 5
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7315, 5]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7315, 6 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 24 ;採用Statedef 640的打擊框最大幀數9+Pausetime數值15 = 24

;===========================================================================
; Guard Spark Helper IX (Used Statedef 227 1201 1301)
; 防禦火花啟動用助手9 (使用於狀態定義 227 1201 1301)
;===========================================================================
[Statedef 7320]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7320, 1]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7311
anim = 7311
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7320, 2]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7310
anim = 7310
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7320, 3]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7314
anim = 7314
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7320, 4]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7313
anim = 7313
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7320, 5]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7315
anim = 7315
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
ownpal = 1
sprpriority = 5
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7320, 6]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7320, 7 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 18 ;採用Statedef 1409的打擊框最大幀數(3*4大約12)+Pausetime數值6 = 18

;===========================================================================
; Guard Spark Helper X (Used Statedef 1402 1409 1425 1452 1475)
; 防禦火花啟動用助手10 (使用於狀態定義 1402 1409 1425 1452 1475)
;===========================================================================
[Statedef 7330]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7330, 1]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7311
anim = 7311
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
sprpriority = 5
remappal = 7311,1
ownpal = 1
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7330, 2]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7310
anim = 7310
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
sprpriority = 5
remappal = 7310,1
ownpal = 1
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7330, 3]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7314
anim = 7314
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
sprpriority = 5
remappal = 7310,1
ownpal = 1
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7330, 4]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7313
anim = 7313
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
sprpriority = 5
remappal = 7311,1
ownpal = 1
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7330, 5]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7315
anim = 7315
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
sprpriority = 5
remappal = 7310,1
ownpal = 1
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7330, 6]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7330, 7 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 26 ;採用Statedef 1475的打擊框最大幀數(3*4大約12)+Pausetime數值14 = 26

;===========================================================================
; Guard Spark Effect XI (Used Statedef 1600)
; 防禦火花啟動用助手11 (使用於狀態定義 1600)
;===========================================================================
[Statedef 7336]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7336, 1]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7311
anim = 7311
;space = stage
pos = pos x+camerapos x,pos y ;*
facing = -facing ;因為該Explod是用在P2上，所以前面加上負號
sprpriority = 5
remappal = 7311,1
ownpal = 1
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

;*這個Statedef是一個Helper助手，而這個Helper的postype為p2
; 因此該Explod要對應到對手身上(實際上是對應到這個Helper身上)，可以寫成pos x+camerapos x,pos y

[State 7336, 2]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7310
anim = 7310
;space = stage
pos = pos x+camerapos x,pos y
facing = -facing
sprpriority = 5
remappal = 7310,1
ownpal = 1
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7336, 3]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7314
anim = 7314
;space = stage
pos = pos x+camerapos x,pos y
facing = -facing
sprpriority = 5
remappal = 7310,1
ownpal = 1
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7336, 4]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7313
anim = 7313
;space = stage
pos = pos x+camerapos x,pos y
facing = -facing
sprpriority = 5
remappal = 7311,1
ownpal = 1
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7336, 5]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7336, 6 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 9 ;採用飛行道具7632的Projmisstime = 9

;===========================================================================
; Guard Spark Helper XII (Used Statedef 2402 2403 2452 2453)
; 防禦火花啟動用助手12 (使用於狀態定義 2402 2403 2452 2453)
;===========================================================================
[Statedef 7340]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7340, 1]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7311
anim = 7311
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
sprpriority = 5
remappal = 7311,1
ownpal = 1
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7340, 2]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7310
anim = 7310
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
sprpriority = 5
remappal = 7310,1
ownpal = 1
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7340, 3]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7314
anim = 7314
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
sprpriority = 5
remappal = 7310,1
ownpal = 1
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7340, 4]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7313
anim = 7313
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
sprpriority = 5
remappal = 7311,1
ownpal = 1
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7340, 5]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7315
anim = 7315
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
sprpriority = 5
remappal = 7310,1
ownpal = 1
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7340, 6]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7340, 7 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 18 ;採用Statedef 2402的打擊框最大幀數12(3*4)+Pausetime數值6 = 18

;===========================================================================
; Guard Spark Effect XIII (Used Statedef 7740 7760)
; 防禦火花啟動用助手13 (使用於狀態定義 7740 7760)
;===========================================================================
[Statedef 7350]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7350, 1]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7311
anim = 7311
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
;pos = (enemynear(root,var(48)),pos x)+camerapos x,pos y
;pos = pos x+camerapos x,pos y
facing = facing
sprpriority = 5
remappal = 7311,1
ownpal = 1
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7350, 2]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7310
anim = 7310
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
sprpriority = 5
remappal = 7310,1
ownpal = 1
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7350, 3]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7314
anim = 7314
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
sprpriority = 5
remappal = 7310,1
ownpal = 1
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7350, 4]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7313
anim = 7313
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
sprpriority = 5
remappal = 7311,1
ownpal = 1
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7350, 5]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7315
anim = 7315
;space = stage
pos = (enemynear(root,var(48)),pos x)+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
sprpriority = 5
remappal = 7310,1
ownpal = 1
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7350, 6]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7350, 7 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 6 ;採用Statedef 7740的GameTime%6 = 0

;===========================================================================
; Guard Spark Effect XIV (Used Statedef 3100)
; 防禦火花啟動用助手14 (使用於狀態定義 3100)
;===========================================================================
[Statedef 7360]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7360, 1]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7311
anim = 7311
;space = stage
;pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
pos = pos x+camerapos x,pos y+(enemynear(root,var(48)),pos y/2) ;*
facing = facing
sprpriority = 5
ownpal = 1
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

;*因為招式設計特殊(角色在地上時，攻擊框上下Y軸範圍廣)改用此代碼組高度部份較能跟隨對手

[State 7360, 2]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7310
anim = 7310
;space = stage
pos = pos x+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
sprpriority = 5
ownpal = 1
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7360, 3]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7314
anim = 7314
;space = stage
pos = pos x+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
sprpriority = 5
ownpal = 1
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7360, 4]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7313
anim = 7313
;space = stage
pos = pos x+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
sprpriority = 5
remappal = 7311,1
ownpal = 1
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7360, 5]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7315
anim = 7315
;space = stage
pos = pos x+camerapos x,pos y+(enemynear(root,var(48)),pos y/2)
facing = facing
sprpriority = 5
ownpal = 1
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7360, 6]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7360, 7 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 18

;===========================================================================
; Guard Spark Helper XV (Used Statedef 3205)
; 防禦火花啟動用助手15 (使用於狀態定義 3205)
;===========================================================================
[Statedef 7370]
type = S
movetype = I
physics = N
sprpriority = -2
anim = 99999
ctrl = 0

[State 7370, 1]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7311
anim = 7311
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
;pos = pos x+camerapos x,pos y
facing = facing
sprpriority = 5
;remappal = 7311,1
ownpal = 1
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7370, 2]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7310
anim = 7310
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
sprpriority = 5
;remappal = 7310,1
ownpal = 1
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7370, 3]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7314
anim = 7314
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
sprpriority = 5
;remappal = 7310,1
ownpal = 1
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7370, 4]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7313
anim = 7313
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
sprpriority = 5
;remappal = 7311,1
ownpal = 1
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7370, 5]
type = Explod
trigger1 = var(12) = 0
trigger1 = var(11) = 0
id = 7315
anim = 7315
;space = stage
pos = pos x+camerapos x,cond(p2dist y < 0,(p2dist y+(pos y)),pos y)
facing = facing
sprpriority = 5
;remappal = 7310,1
ownpal = 1
scale = root,fvar(21)*0.80,root,fvar(22)*0.80
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 7370, 6]
type = ChangeState
trigger1 = var(12) = [1,3]
trigger1 = var(11) = 0
trigger1 = var(11):= var(11)+1
value = stateno

[State 7370, 7 (Helper Remove)]
type = DestroySelf
trigger1 = 1 || var(11):= 0
trigger1 = var(12):= var(12)+1
trigger1 = var(12) = 25 ;採用Statedef 3205的打擊框最大幀數3+Pausetime數值22 = 25

;===========================================================================
; Whirlwind Wave Spear / Projectile
; 旋風波動槍 / 飛行道具
;===========================================================================
[Statedef 7632]
type = S
movetype = A
physics = N
juggle = 2
ctrl = 0
anim = 99994
sprpriority = -1

[State 7632, 1]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 7632, 2]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1
ignorehitpause = 1

[State 7632, 3]
type = HitBy
trigger1 = 1
value =
time = 1
ignorehitpause = 1

[State 7632, 4]
type = VelSet
trigger1 = Time = 0
x = root,fvar(16)
y = 0

[State 7632, 5 (Accel)]
type = VelAdd
trigger1 = MoveContact = 0
x = cond(vel x >= 22,-0.93,cond(vel x > 0,-0.28,0)) ;*
y = 0
;*因為command = "holdback"時飛行道具速度為21數值 設定小於22可以讓加速度條件改為-0.28參數 否則過大的加速度會讓飛行道具猶如迴力鏢般轉向

[State 7632, 6] ;推擠檢測(是否穿越對手)
type = PlayerPush
trigger1 = 1
value = 0 ;不推開對手 (Helper型飛行道具能夠穿越對手)

[State 7632, 7]
type = VelSet ;改變速度
trigger1 = MoveContact >= 1 ;接觸到對手時
x = root,fvar(16)/3 ;原速度的三分之一

[State 7632, 8 (Accel)]
type = VelAdd
trigger1 = MoveContact >= 1 ;接觸到對手時
x = cond(vel x >= 22/3,(-0.93/3),cond(vel x > 0,(-0.28/3),0)) ;*
y = 0

[State 7632, 9]
type = Hitdef
triggerall = GameTime%16 = 1 ;招式的總攻擊框幀數為48ticks 16%的話最多3連擊
trigger1 = 1 || var(21):= 100 ;Hit Spark X
trigger1 = 1 || var(22):= -240 ;Hit Spark Y
trigger1 = 1 || var(23):= 7266 ;Hit Spark ID
trigger1 = 1 || var(24):= 7336 ;Guard Spark ID
trigger1 = 1 || var(25):= Random%360 ;Hit Spark Angle
trigger1 = 1 || var(36):= 7632 ;HitDef ID
attr = S, SP
animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 6, Hit
damage = cond(root,var(15) > 0,ceil((((root,fvar(11))*root,fvar(12)*0.025))*root,fvar(13)),25*root,fvar(13)),cond(root,var(15) > 0,ceil((((root,fvar(11))*root,fvar(12)*0.005))*root,fvar(13)),5*root,fvar(13))
hitsound = s7,5
guardsound = s8,1
pausetime = 0,5
ground.type = Low
air.type = Low
ground.slidetime = 12
ground.hittime = 12
guard.slidetime = 8
guard.hittime = 8
ground.velocity = -46,0
guard.velocity = -46
air.hittime = 10
air.velocity = -42,-10
airguard.velocity = -36,-5
airguard.ctrltime = 10
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.fall = 1
fall.recover = 0
palfx.time = 47
palfx.add = 0,120,0
palfx.mul = 255,255,255
palfx.sinadd = 10,10,10,30
palfx.color = 256
palfx.invertall = 0
p1sprpriority = 5
p2sprpriority = 0
id = 7632

[State 7632, 10 (Whirlwind Wave Spear)] 
type = Explod
trigger1 = AnimElem = 1
anim = 7630
id = 7635
space = stage
pos = 0,0
bindid = id
facing = facing
bindtime = -1
ownpal = 1
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
sprpriority = 4
removetime = 52
removeongethit = 0
ignorehitpause = 0

[State 7632, 11 (Whirlwind Wave Spear Subtraction)]
type = Explod
trigger1 = AnimElem = 1
anim = 7631
id = 7635
space = stage
pos = 0,0
bindid = id
facing = facing
bindtime = -1
remappal = 7600,2
ownpal = 1
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
sprpriority = 4
removetime = 52
removeongethit = 0
ignorehitpause = 0

[State 7632, 12 (Whirlwind Wave Spear Land Effect)]
type = Explod
trigger1 = AnimElem = 1
anim = 7635
id = 7635
space = stage
pos = 0,0
bindid = id
facing = facing
bindtime = -1
ownpal = 1
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
sprpriority = 5
removetime = 52
removeongethit = 0
ignorehitpause = 0

[State 7632, 13 (Whirlwind Wave Spear Land Effect Subtraction)]
type = Explod
trigger1 = AnimElem = 1
anim = 7636
id = 7635
space = stage
pos = 0,0
bindid = id
facing = facing
bindtime = -1
remappal = 7600,1
ownpal = 1
scale = root,fvar(21)*1.00,root,fvar(22)*1.00
sprpriority = 4
removetime = 52
removeongethit = 0
ignorehitpause = 0

[State 7632, 14 (Helper Var 23 Set Up 1 / Hit Spark)]
type = Helper
trigger1 = MoveHit = 1
trigger1 = NumHelper(var(23)) < 1
name = "Hit Spark Effect"
id = var(23)
stateno = var(23)
pos = cond(p2dist x < (cond(var(21) < 0,var(21),0)),(cond(var(21) < 0,var(21),0)),cond(p2dist x < (cond(var(21) < 0,0,var(21))),ceil(p2dist x),(cond(var(21) < 0,0,var(21))))),var(22) ;依據P2距離改變打擊火花X軸位置
postype = p2
ownpal = 1
ignorehitpause = 1

[State 7632, 15 (Helper Var 23 Set Up 2 / Hit Spark)]
type = VarSet
trigger1 = !HitDefAttr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
v = 23
value = 0
ignorehitpause = 1

[State 7632, 16 (Helper Var 24 Set Up 1 / Guard Spark)]
type = Helper
trigger1 = MoveGuarded = 1
trigger1 = NumHelper(var(24)) < 1
name = "Guard Spark Effect"
id = var(24)
stateno = var(24)
pos = cond(p2dist x < (cond(var(21) < 0,var(21),0)),(cond(var(21) < 0,var(21),0)),cond(p2dist x < (cond(var(21) < 0,0,var(21))),ceil(p2dist x),(cond(var(21) < 0,0,var(21))))),var(22)
postype = p2
ownpal = 1
ignorehitpause = 1

[State 7632, 17 (Helper Var 24 Set Up 2 / Guard Spark)]
type = VarSet
trigger1 = !HitDefAttr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
v = 24
value = 0
ignorehitpause = 1

[State 7632, 18]
type = Helper
triggerall = Root,Alive = 1
trigger1 = NumHelper(12980) < 6
trigger1 = IsHelper(7632)
trigger1 = MoveHit = 1
name = "Wind Element Particle" ;風元素粒子
stateno = 12980
id = 12980
postype = p2
pos = 0,(target,const(size.mid.pos.y))
ownpal = 1
size.xscale = root,fvar(21)*0.65
size.yscale = root,fvar(22)*0.65
ignorehitpause = 1
persistent = 1

[State 7632, 19 (Helper Remove)]
type = DestroySelf
trigger1 = AnimTime = 0
removeexplods = 1

;===========================================================================
; Ice Floor Freeze Effect
; 冰層凍結效果
;===========================================================================
[Statedef 7648]
type = C
movetype = A
physics = N
juggle = 0
ctrl = 0
anim = 7648
sprpriority = 0

[State 7648, 1]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1

[State 7648, 2]
type = HitDef
trigger1 = !MoveContact && !MoveReversed
attr = C, NA
damage = 0,0
hitflag = MD ;對手必須處於中段(包含上段下段)和躺下狀態才能擊中
guardflag = L ;蹲下時才能防禦
priority = 1, Hit
pausetime = 0,0
sparkno = -1
guard.sparkno = -1
animtype = Light
ground.type = Low
ground.slidetime = 45
ground.hittime = 45
guard.slidetime = 25
guard.hittime = 25
guard.ctrltime = 25
ground.velocity = 0
air.animtype = Light
air.type = Low
air.velocity = 0,0
air.hittime = 45
airguard.ctrltime = 45
guard.dist = 360
palfx.time = 60
palfx.add = 0,50,240
palfx.mul = 120,224,150
palfx.sinadd = 20,30,60,30
p2stateno = 7649
id = 7648

[State 7648, 3 (Helper Remove)]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Root,StateNo != 1700
trigger3 = Root,MoveType = H

;===========================================================================
; Ice Floor Freeze Effect / Opponent is Freezing
; 冰層凍結效果 / 對手凍結中
;===========================================================================
[Statedef 7649]
type = U
movetype = H
physics = U
velset = 0,0
ctrl = 0

[State 7649, 1]
type = ChangeAnim
trigger1 = SelfAnimExist(Anim) ;會是被抓住前的動作編號
value = Anim
elem = AnimElemNo(-1)

[State 7649, 2]
type = SelfState
triggerall = StateType = S
trigger1 = Time >= 45
value = 11
ctrl = 1

[State 7649, 3]
type = SelfState
triggerall = StateType = C
trigger1 = Time >= 45
value = 11
ctrl = 1

[State 7649, 4]
type = SelfState
triggerall = StateType = A
trigger1 = Time >= 45
value = 5030
ctrl = 0

[State 7649, 5]
type = SelfState
triggerall = StateType = L
trigger1 = Time >= 45
value = 5110
ctrl = 0

;===========================================================================
; Vacuum Wave Spear / Projectile 1
; 真空波動槍 / 飛行道具1
;===========================================================================
[Statedef 7740]
type = S
movetype = A
physics = N
juggle = 3
ctrl = 0
anim = 7740
poweradd = 0
sprpriority = 5

[State 7740, 1]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 7740, 2]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1
ignorehitpause = 1

[State 7740, 3]
type = HitBy
trigger1 = 1
value =
time = 1
ignorehitpause = 1

[State 7740, 4]
type = VelSet
trigger1 = Time >= 0
x = 21

[State 7740, 5]
type = VelAdd
trigger1 = Time >= 0
x = 18+(-time*1)
y = 0

[State 7740, 6]
type = PlayerPush
trigger1 = 1
value = 0

[State 7740, 7 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElemTime(1) = 0
value = s6,13
channel = 25

[State 7740, 8 (Vacuum Wave Spear Projectile 1 Subtraction)]
type = Explod
triggerall = NumExplod(7741) = 0
trigger1 = AnimElemTime(1) = 0
anim = 7741
id = 7741
;space = stage
pos = cond(facing = 1,0,0)*root,fvar(21),0*root,fvar(22)
facing = facing
bindid = id ;*
bindtime = -1
ownpal = 1
vel = 21,0
accel = 18+(-time*1),0
remappal = 7600,1
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 4
removetime = 46
removeongethit = 1
ignorehitpause = 1

;*如果該Statedef為Helper助手 該ID參數為Helper助手 (要對應本體前面需要加上Root)
; 若要知道ID參數編號可以利用DisplayToClipBoard狀態控制器 (params參數設定ID)

[State 7740, 9 (Vacuum Wave Spear Projectile 1 Land Effect)]
type = Explod
triggerall = NumExplod(7745) = 0
trigger1 = AnimElemTime(1) = 0
anim = 7745
id = 7745
;space = stage
pos = cond(facing = 1,0,0)*root,fvar(21),0*root,fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
vel = 21,0
accel = 18+(-time*1),0
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 4
removetime = 46
removeongethit = 1
ignorehitpause = 1

[State 7740, 10 (Vacuum Wave Spear Projectile 1 Land Effect Subtraction)]
type = Explod
triggerall = NumExplod(7746) = 0
trigger1 = AnimElemTime(1) = 0
anim = 7746
id = 7746
;space = stage
pos = cond(facing = 1,0,0)*root,fvar(21),0*root,fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
vel = 21,0
accel = 18+(-time*1),0
remappal = 7600,1
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 4
removetime = 46
removeongethit = 1
ignorehitpause = 1

[State 7740, 11]
type = HitDef
triggerall = GameTime%6 = 0 ;招式的總攻擊框幀數為36ticks 6%的話最多6連擊
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(21) < 0
trigger1 = 1 || var(21):= 0 ;Hit Spark X
trigger1 = 1 || var(22):= -350 ;Hit Spark Y
trigger1 = 1 || var(23):= 7280 ;Hit Spark ID
trigger1 = 1 || var(24):= 7350 ;Guard Spark ID
trigger1 = 1 || var(25):= Random%360 ;Hit Spark Angle
trigger1 = 1 || var(36):= 7740 ;HitDef ID
attr = S, HP
hitflag = MAFDP
guardflag = MA
damage = cond(root,var(15) > 0,ceil((((root,fvar(11))*root,fvar(12)*0.020))*root,fvar(13)),20*root,fvar(13)),cond(root,var(15) > 0,ceil((((root,fvar(11))*root,fvar(12)*0.005))*root,fvar(13)),5*root,fvar(13))
animtype = Light
ground.type = Low
priority = 7, Hit
hitsound = s7,5
guardsound = s8,2
pausetime = 0,5 ;0是彈丸擊中暫停的幀數 5是每次擊中p2會眩暈多長時間。
sparkno = -1
guard.sparkno = -1
getpower = 0,0
givepower = 0,0
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
guard.slidetime = 21
guard.hittime = 21
ground.velocity = -75,0 ;因為PlayerPush = 0 這裡需要設定X軸負數數值才能推擠對手。
guard.velocity = -65 ;因為PlayerPush = 0 這裡需要設定X軸負數數值才能推擠對手。
air.animtype = Light
air.type = Low
air.hittime = 18
air.velocity = -72,-32 ;因為PlayerPush = 0 這裡需要設定X軸負數數值才能推擠對手。
airguard.velocity = -55,-25 ;因為PlayerPush = 0 這裡需要設定X軸負數數值才能推擠對手。
air.fall = 1
fall.recover = 0
palfx.time = 47
palfx.add = 0,120,0
palfx.mul = 255,255,255
palfx.sinadd = 10,10,10,30
palfx.color = 256
palfx.invertall = 0
ground.cornerpush.veloff = 0 ;因為該Statedef為Helper型飛行道具 Cornerpush設定為0的話就不會在角落攻擊時倒退了。
down.cornerpush.veloff = 0
air.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
p1sprpriority = 5
p2sprpriority = 0
id = 7740

[State 7740, 12]
type = Helper
triggerall = Root,Alive = 1
;triggerall = NumTarget(7740) >= 1
trigger1 = NumHelper(12980) < 7 ;粒子總數量限制(所有寫上助手ID號12980的招式，最多7個)。
trigger1 = IsHelper(7740) ;因為取消對應Hitdef ID號，再加上粒子是由Helper發出，這個觸發條件請寫上去。
trigger1 = MoveHit = 1 ;不加上大於號(這樣就會依照擊中次數產生粒子，否則會以每幀數計算)。
name = "Wind Element Particle" ;風元素粒子
stateno = 12980
id = 12980
postype = p2
pos = 0,(target,const(size.mid.pos.y))
;pos = 0,(target(7740),const(size.mid.pos.y))
ownpal = 1
size.xscale = root,fvar(21)*0.65
size.yscale = root,fvar(22)*0.65
ignorehitpause = 1
persistent = 1

[State 7740, 13 (Helper Var 23 Set Up 1 / Hit Spark)]
type = Helper
trigger1 = MoveHit = 1
trigger1 = NumHelper(var(23)) < 1
name = "Hit Spark Effect"
id = var(23)
stateno = var(23)
pos = cond(p2dist x < (cond(var(21) < 0,var(21),0)),(cond(var(21) < 0,var(21),0)),cond(p2dist x < (cond(var(21) < 0,0,var(21))),ceil(p2dist x),(cond(var(21) < 0,0,var(21))))),var(22) ;依據P2距離改變打擊火花X軸位置
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1

[State 7740, 14 (Helper Var 23 Set Up 2 / Hit Spark)]
type = VarSet
trigger1 = !HitDefAttr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
v = 23
value = 0
ignorehitpause = 1

[State 7740, 15 (Helper Var 24 Set Up 1 / Guard Spark)]
type = Helper
trigger1 = MoveGuarded = 1
trigger1 = NumHelper(var(24)) < 1
name = "Guard Spark Effect"
id = var(24)
stateno = var(24)
pos = cond(p2dist x < (cond(var(21) < 0,var(21),0)),(cond(var(21) < 0,var(21),0)),cond(p2dist x < (cond(var(21) < 0,0,var(21))),ceil(p2dist x),(cond(var(21) < 0,0,var(21))))),var(22)
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1

[State 7740, 16 (Helper Var 24 Set Up 2 / Guard Spark)]
type = VarSet
trigger1 = !HitDefAttr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
v = 24
value = 0
ignorehitpause = 1

[State 7740, 17]
type = Helper
triggerall = Root,Alive = 1
;triggerall = NumTarget(7740) >= 1
trigger1 = NumHelper(12980) < 6
trigger1 = IsHelper(7632)
trigger1 = MoveHit = 1
name = "Wind Element Particle" ;風元素粒子
stateno = 12980
id = 12980
postype = p2
pos = 0,(target,const(size.mid.pos.y))
;pos = 0,(target(7740),const(size.mid.pos.y))
ownpal = 1
size.xscale = root,fvar(21)*0.65
size.yscale = root,fvar(22)*0.65
ignorehitpause = 1
persistent = 1

[State 7740, 18 (Helper Remove)]
type = DestroySelf
trigger1 = AnimTime = 0
removeexplods = 1

;===========================================================================
; Vacuum Wave Spear / Projectile 2
; 真空波動槍 / 飛行道具2
;===========================================================================
[Statedef 7760]
type = S
movetype = A
physics = N
juggle = 3
ctrl = 0
anim = 7760
poweradd = 0
sprpriority = 5

[State 7760, 1]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 7760, 2]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1
ignorehitpause = 1

[State 7760, 3]
type = HitBy
trigger1 = 1
value =
time = 1
ignorehitpause = 1

[State 7760, 4]
type = VelSet
trigger1 = Time >= 0
x = 22

[State 7760, 5]
type = VelAdd
trigger1 = Time >= 0
x = -22+(time*2)
y = 0

[State 7760, 6]
type = PlayerPush
trigger1 = 1
value = 0

[State 7760, 7 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElemTime(1) = 0
value = s6,19 ;s6,17
channel = 26

[State 7760, 8 (Vacuum Wave Spear Projectile 2 Subtraction)]
type = Explod
triggerall = NumExplod(7761) = 0
trigger1 = AnimElemTime(1) = 0
anim = 7761
id = 7761
;space = stage
pos = cond(facing = 1,0,0)*root,fvar(21),0*root,fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
vel = 22,0
accel = -22+(time*2),0
remappal = 7600,1
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 4
removetime = 112
removeongethit = 1
ignorehitpause = 1

[State 7760, 9 (Vacuum Wave Spear Projectile 2 Land Effect)]
type = Explod
triggerall = NumExplod(7765) = 0
trigger1 = AnimElemTime(1) = 0
anim = 7765
id = 7765
;space = stage
pos = cond(facing = 1,0,0)*root,fvar(21),0*root,fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
vel = 22,0
accel = -22+(time*2),0
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 4
removetime = 112
removeongethit = 1
ignorehitpause = 1

[State 7760, 10 (Vacuum Wave Spear Projectile 2 Land Effect Subtraction)]
type = Explod
triggerall = NumExplod(7766) = 0
trigger1 = AnimElemTime(1) = 0
anim = 7766
id = 7766
;space = stage
pos = cond(facing = 1,0,0)*root,fvar(21),0*root,fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
vel = 22,0
accel = -22+(time*2),0
remappal = 7600,1
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 4
removetime = 112
removeongethit = 1
ignorehitpause = 1

[State 7760, 11]
type = HitDef
triggerall = GameTime%16 = 0 ;招式的總攻擊框幀數為96ticks 16%的話最多6連擊
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(51) < 0
trigger1 = 1 || var(21):= 300 ;Hit Spark X
trigger1 = 1 || var(22):= -350 ;Hit Spark Y
trigger1 = 1 || var(23):= 7280 ;Hit Spark ID
trigger1 = 1 || var(24):= 7350 ;Guard Spark ID
trigger1 = 1 || var(25):= Random%360 ;Hit Spark Angle
trigger1 = 1 || var(36):= 7760 ;HitDef ID
attr = S, HA
hitflag = MAFP
guardflag = MA
damage = cond(root,var(15) > 0,ceil((((root,fvar(11))*root,fvar(12)*0.015))*root,fvar(13)),15*root,fvar(13)),cond(root,var(15) > 0,ceil((((root,fvar(11))*root,fvar(12)*0.004))*root,fvar(13)),4*root,fvar(13))
animtype = Light
ground.type = Low
priority = 7, Hit
hitsound = s7,5
guardsound = s8,2
pausetime = 0,5 ;0是彈丸擊中暫停的幀數 5是每次擊中p2會眩暈多長時間
sparkno = -1
guard.sparkno = -1
getpower = 0,0
givepower = 0,0
ground.type = Low
ground.slidetime = 15
ground.hittime = 15
guard.slidetime = 18
guard.hittime = 18
ground.velocity = -65,-20
guard.velocity = -65
air.animtype = Back
air.type = Low
air.hittime = 15
air.velocity = -60,-25
airguard.velocity = -55,-5
fall = 1
air.fall = 1
fall.recover = 0
palfx.time = 47
palfx.add = 0,120,0
palfx.mul = 255,255,255
palfx.sinadd = 10,10,10,30
palfx.color = 256
palfx.invertall = 0
ground.cornerpush.veloff = 0
down.cornerpush.veloff = 0
air.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
p1sprpriority = 5
p2sprpriority = 0
id = 7760

[State 7760, 12]
type = Helper
triggerall = Root,Alive = 1
trigger1 = NumHelper(12980) < 7 ;粒子總數量限制(所有寫上助手ID號12980的招式 最多7個)
trigger1 = IsHelper(7760) ;因為取消對應Hitdef ID號 再加上粒子是由Helper發出 這個觸發條件請寫上去
trigger1 = MoveHit = 1 ;不加上大於號(這樣就會依照擊中次數產生粒子)
name = "Wind Element Particle" ;風元素粒子
stateno = 12980
id = 12980
postype = p2
pos = 0,(target,const(size.mid.pos.y))
ownpal = 1
size.xscale = root,fvar(21)*0.65
size.yscale = root,fvar(22)*0.65
ignorehitpause = 1
persistent = 1

[State 7760, 13 (Helper Var 23 Set Up 1 / Hit Spark)]
type = Helper
trigger1 = MoveHit = 1
trigger1 = NumHelper(var(23)) < 1
name = "Hit Spark Effect"
id = var(23)
stateno = var(23)
pos = cond(p2dist x < (cond(var(21) < 0,var(21),0)),(cond(var(21) < 0,var(21),0)),cond(p2dist x < (cond(var(21) < 0,0,var(21))),ceil(p2dist x),(cond(var(21) < 0,0,var(21))))),var(22) ;依據P2距離改變打擊火花X軸位置
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1

[State 7760, 14 (Helper Var 23 Set Up 2 / Hit Spark)]
type = VarSet
trigger1 = !HitDefAttr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
v = 23
value = 0
ignorehitpause = 1

[State 7760, 15 (Helper Var 24 Set Up 1 / Guard Spark)]
type = Helper
trigger1 = MoveGuarded = 1
trigger1 = NumHelper(var(24)) < 1
name = "Guard Spark Effect"
id = var(24)
stateno = var(24)
pos = cond(p2dist x < (cond(var(21) < 0,var(21),0)),(cond(var(21) < 0,var(21),0)),cond(p2dist x < (cond(var(21) < 0,0,var(21))),ceil(p2dist x),(cond(var(21) < 0,0,var(21))))),var(22)
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1

[State 7760, 16 (Helper Var 24 Set Up 2 / Guard Spark)]
type = VarSet
trigger1 = !HitDefAttr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
v = 24
value = 0
ignorehitpause = 1

[State 7760, 17 (Helper Remove)]
type = DestroySelf
trigger1 = AnimTime = 0
removeexplods = 1

;===========================================================================
; Vacuum Wave Spear Super Pause Effect
; 真空波動槍超級暫停特效
;===========================================================================
[Statedef 8000]
type = S
movetype = A
physics = N
ctrl = 0
anim = 99999
sprpriority = 5

[State 8000, 1] ;爆炸特效旋轉效果
type = Null
triggerall = Time = 0
;trigger1 = 1 || fvar(25) := 310-Atan(((Const240p(120)-ScreenPos Y+Pos Y)*(ScreenHeight/GameHeight))/Const240p(500))*180/Pi
trigger1 = 1 || fvar(25) := 310-Atan(((720-ScreenPos Y+Pos Y)*(ScreenHeight/GameHeight))/3000)*180/Pi
trigger1 = 1 || fvar(26) := 335
trigger1 = 1 || fvar(27) := -335
trigger1 = 1 || fvar(28) := 90

[State 8000, 2 (Hyper Moves Super Pause Effect 1)]
type = Explod
trigger1 = Time = 0
anim = 8010
ownpal = 1
id = 8010
pos = root,pos x+camerapos x,root,const(size.mid.pos.y)+pos y
facing = facing
removetime = 10
supermovetime = 10
pausemovetime = 10
sprpriority = 5
removeongethit = 1

[State 8000, 3 (Hyper Moves Super Pause Effect 2 Flip)]
type = Explod
trigger1 = Time = 0
anim = 8012
id = 8011
pos = root,pos x+camerapos x,root,const(size.mid.pos.y)+pos y
bindtime = -1
trans = add
alpha = 256,256
scale = 1.184+0.08*4,1.184+0.08*4
removetime = 25
supermovetime = 25
pausemovetime = 25
sprpriority = 8
removeongethit = 1

[State 8000, 4 (Hyper Moves Super Pause Effect 2)]
type = Explod
trigger1 = Time = 0
anim = 8011
id = 8011
pos = root,pos x+camerapos x,root,const(size.mid.pos.y)+pos y
bindtime = -1
trans = add
alpha = 256,256
scale = 1.184+0.08*4,1.184+0.08*4
xangle = fvar(25)
yangle = fvar(26)
angle = fvar(28)
removetime = 25
supermovetime = 25
pausemovetime = 25
sprpriority = 8
removeongethit = 1

[State 8000, 5 (Hyper Moves Super Pause Effect 2 Flip)]
type = Explod
trigger1 = Time = 0
anim = 8012
id = 8012
pos = root,pos x+camerapos x,root,const(size.mid.pos.y)+pos y
bindtime = -1
trans = add
alpha = 256,256
scale = 1.184+0.08*4,1.184+0.08*4
xangle = fvar(25)
yangle = fvar(27)
angle = fvar(28)
removetime = 25
supermovetime = 25
pausemovetime = 25
sprpriority = 8
removeongethit = 1

[State 8000, 6 (Hyper Moves Super Pause Effect 3)]
type = Explod
trigger1 = Time = 0
anim = 8015
ownpal = 1
id = 8015
pos = root,pos x+camerapos x,root,const(size.mid.pos.y)+pos y
facing = facing
removetime = 5
supermovetime = 5
pausemovetime = 5
sprpriority = 5
removeongethit = 1

[State 8000, 7 (Hyper Moves Super Pause Effect 4)]
type = Explod
trigger1 = Time = 0
anim = 8016
ownpal = 1
id = 8016
pos = root,pos x+camerapos x,root,const(size.mid.pos.y)+pos y
facing = facing
removetime = 8
supermovetime = 8
pausemovetime = 8
sprpriority = 5
removeongethit = 1

[State 8000, 8 (Helper Remove)]
type = DestroySelf
trigger1 = Root,StateNo != 3000
trigger2 = Time >= 25 ;數值取自於該Statedef中最長的Explod時間。

;===========================================================================
; Meteor Spear Super Pause Effect
; 流星衝超級暫停特效
;===========================================================================
[Statedef 8001]
type = S
movetype = A
physics = N
ctrl = 0
anim = 99999
sprpriority = 5

[State 8001, 1] ;爆炸特效旋轉效果
type = Null
triggerall = Time = 0
;trigger1 = 1 || fvar(25) := 310-Atan(((Const240p(120)-ScreenPos Y+Pos Y)*(ScreenHeight/GameHeight))/Const240p(500))*180/Pi
trigger1 = 1 || fvar(25) := 310-Atan(((720-ScreenPos Y+Pos Y)*(ScreenHeight/GameHeight))/3000)*180/Pi
trigger1 = 1 || fvar(26) := 335
trigger1 = 1 || fvar(27) := -335
trigger1 = 1 || fvar(28) := 90

[State 8001, 2 (Hyper Moves Super Pause Effect 1)]
type = Explod
trigger1 = Time = 0
anim = 8010
ownpal = 1
id = 8010
pos = root,pos x+camerapos x,root,const(size.mid.pos.y)+pos y
facing = facing
removetime = 10
supermovetime = 10
pausemovetime = 10
sprpriority = 5
removeongethit = 1

[State 8001, 3 (Hyper Moves Super Pause Effect 2 Flip)]
type = Explod
trigger1 = Time = 0
anim = 8012
id = 8011
pos = root,pos x+camerapos x,root,const(size.mid.pos.y)+pos y
bindtime = -1
trans = add
alpha = 256,256
scale = 1.184+0.08*4,1.184+0.08*4
removetime = 25
supermovetime = 25
pausemovetime = 25
sprpriority = 8
removeongethit = 1

[State 8001, 4 (Hyper Moves Super Pause Effect 2)]
type = Explod
trigger1 = Time = 0
anim = 8011
id = 8011;7000
pos = root,pos x+camerapos x,root,const(size.mid.pos.y)+pos y
bindtime = -1
trans = add
alpha = 256,256
scale = 1.184+0.08*4,1.184+0.08*4
xangle = fvar(25)
yangle = fvar(26)
angle = fvar(28)
removetime = 25
supermovetime = 25
pausemovetime = 25
sprpriority = 8
removeongethit = 1

[State 8001, 5 (Hyper Moves Super Pause Effect 2 Flip)]
type = Explod
trigger1 = Time = 0
anim = 8012
id = 8012
pos = root,pos x+camerapos x,root,const(size.mid.pos.y)+pos y
bindtime = -1
trans = add
alpha = 256,256
scale = 1.184+0.08*4,1.184+0.08*4
xangle = fvar(25)
yangle = fvar(27)
angle = fvar(28)
removetime = 25
supermovetime = 25
pausemovetime = 25
sprpriority = 8
removeongethit = 1

[State 8001, 6 (Hyper Moves Super Pause Effect 3)]
type = Explod
trigger1 = Time = 0
anim = 8015
ownpal = 1
id = 8015
pos = root,pos x+camerapos x,root,const(size.mid.pos.y)+pos y
facing = facing
removetime = 5
supermovetime = 5
pausemovetime = 5
sprpriority = 5
removeongethit = 1

[State 8001, 7 (Hyper Moves Super Pause Effect 4)]
type = Explod
trigger1 = Time = 0
anim = 8016
ownpal = 1
id = 8016
pos = root,pos x+camerapos x,root,const(size.mid.pos.y)+pos y
facing = facing
removetime = 8
supermovetime = 8
pausemovetime = 8
sprpriority = 5
removeongethit = 1

[State 8001, 8 (Helper Remove)]
type = DestroySelf
trigger1 = Root,StateNo != 3100
trigger2 = Time >= 25

;===========================================================================
; Hyakka Light Bullet Spear Super Pause Effect
; 百花光弾槍超級暫停特效
;===========================================================================
[Statedef 8002]
type = S
movetype = A
physics = N
ctrl = 0
anim = 99999
sprpriority = 5

[State 8002, 1] ;爆炸特效旋轉效果
type = Null
triggerall = Time = 0
;trigger1 = 1 || fvar(25) := 310-Atan(((Const240p(120)-ScreenPos Y+Pos Y)*(ScreenHeight/GameHeight))/Const240p(500))*180/Pi
trigger1 = 1 || fvar(25) := 310-Atan(((720-ScreenPos Y+Pos Y)*(ScreenHeight/GameHeight))/3000)*180/Pi
trigger1 = 1 || fvar(26) := 335
trigger1 = 1 || fvar(27) := -335
trigger1 = 1 || fvar(28) := 90

[State 8002, 2 (Hyper Moves Super Pause Effect 1)]
type = Explod
trigger1 = Time = 0
anim = 8010
ownpal = 1
id = 8010
pos = root,pos x+camerapos x,root,const(size.mid.pos.y)+pos y
scale = root,fvar(21)*1.20,root,fvar(22)*1.20
angle = 180
facing = facing
removetime = 10
supermovetime = 10
pausemovetime = 10
sprpriority = 5
removeongethit = 1

[State 8002, 3 (Hyper Moves Super Pause Effect 1)]
type = Explod
trigger1 = Time = 0
anim = 8010
ownpal = 1
id = 8010
pos = root,pos x+camerapos x,root,const(size.mid.pos.y)+pos y
scale = root,fvar(21)*1.20,root,fvar(22)*1.20
facing = facing
removetime = 10
supermovetime = 10
pausemovetime = 10
sprpriority = 5
removeongethit = 1

[State 8002, 4 (Hyper Moves Super Pause Effect 5)]
type = Explod
trigger1 = Time = 0
anim = 8017
ownpal = 1
id = 8017
pos = root,pos x+camerapos x,root,const(size.mid.pos.y)+pos y
facing = facing
removetime = 25
supermovetime = 25
pausemovetime = 25
sprpriority = 9
removeongethit = 1

[State 8002, 5 (Helper Remove)]
type = DestroySelf
trigger1 = Root,StateNo != 3200
trigger2 = Time >= 25

;===========================================================================
; Foible Elle
; 弱酸型艾爾《弱酸型エル》
;===========================================================================
[Statedef 12600]
type = S
movetype = A
physics = N
ctrl = 0
anim = 12600
sprpriority = 7
poweradd = 0

[State 12600, 1]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1

[State 12600, 2]
type = HitBy
trigger1 = 1
value =
time = 1

[State 12600, 3]
type = PosSet
trigger1 = Time = 0
y = 32*root,fvar(22)

[State 12600, 4 (Variable to Zero)] ;變量歸零
type = ParentVarSet
trigger1 = Time = 0
fv = 34
value = 0
;fvar(34) = 0
ignorehitpause = 1

[State 12600, 5 (Fade In)]
type = Trans
trigger1 = Time < 9
trans = addalpha
alpha = 0+time*32,256-(time*32)

[State 12600, 6]
type = VelSet
trigger1 = AnimElemTime(7) = 0
x = 48
y = -1

[State 12600, 7]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElem = 7
attr = S, ST
animtype = Light
hitflag = MAF ;測試過原作允許可以擊中在空中和落下時的對手
guardflag = L ;蹲下才能防禦
priority = 5, Hit
damage = 0,cond(root,var(15) > 0,ceil((((root,fvar(11))*root,fvar(12)*0.010))*root,fvar(13)),10*root,fvar(13))
pausetime = 0,0
sparkno = -1
guard.sparkno = s7302
sparkxy = -90*(floor(const(size.xscale))),-175*const(size.yscale)
hitsound = -1
guardsound = s8,11
ground.type = Low
ground.slidetime = 0
ground.hittime = 0
guard.slidetime = 0
guard.hittime = 0
ground.velocity = 0
guard.dist = 260
p1stateno = 12605
p2stateno = 2615
hitonce = 1 ;該攻擊只能對一人有效
kill = 0
guard.kill = 0
id = 12600

[State 12600, 8]
type = VelAdd
triggerall = Pos Y > 0
trigger1 = AnimElemTime(7) >= 3 && AnimElemTime(8) < 0
y = -2.40

[State 12600, 9]
type = PosSet
triggerall = Pos Y <= 0
trigger1 = AnimElemTime(7) >= 3 && AnimElemTime(8) < 0
y = 0

[State 12600, 10]
type = PosSet
trigger1 = AnimElemTime(8) >= 0
y = 0

[State 12600, 11]
type = VelSet
trigger1 = AnimElemTime(8) = 0
x = 12
y = 0

[State 12600, 12]
type = VelSet
trigger1 = AnimElemTime(9) = 0
x = 0

;[State 12600, 13 (Fade Out)] ;本效果改為利用AnimElem方式完成
;type = Trans
;trigger1 = AnimElemTime(10) >= 0
;trans = addalpha
;alpha = 256-(time*32),0+(time*32)

[State 12600, 14]
type = PalFX
trigger1 = AnimElemTime(10) >= 0 && AnimElemTime(10) < 4
time = 1
add = 256,128+((time-96)*25),0 ;*
mul = 256,256,256
sinadd = 0,0,0,1
invertall = 0
color = 256

;*time-96 的96數值取自於AnimElem = 10之前所有的ticks數(AnimElem = 1~9)

[State 12600, 15]
type = PalFX
trigger1 = AnimElemTime(10) >= 4 && AnimElemTime(10) < 7
time = 1
add = 0,0,256-((time-96)*42)
mul = 256,256,256
sinadd = 0,0,0,1
invertall = 0
color = 256

[State 12600, 16 (Helper Remove)]
type = DestroySelf
trigger1 = AnimTime = 0

;===========================================================================
; Foible Elle / Nice Chinchin!
; 弱酸型艾爾《弱酸型エル》 / 好雞雞！《ナイスちんちん！》
;===========================================================================
[Statedef 12605]
type = S
movetype = A
physics = N
ctrl = 0
anim = 12605
velset = 0,0
sprpriority = 9
poweradd = 0

[State 12605, 1 (If It's a Male Character...)] ;如果對手是男性角色……
type = VarSet
;~~~~~~~~~~~~Street Fighter~~~~~~~~~~~~;快打旋風
;▼----------✱隆✱----------▼;
trigger1 = P2Name = "Ryu" || P2Name = "Evil Ryu"
;▼----------✱肯✱----------▼;
trigger2 = P2Name = "Ken" || P2Name = "Ken Masters" || P2Name = "Evil Ken" || P2Name = "Violent Ken"
;▼----------✱凱爾✱----------▼;
trigger3 = P2Name = "Guile"
;▼----------✱塔爾鍚✱----------▼;
trigger4 = P2Name = "Dhalsim"
;▼----------✱桑基爾夫✱----------▼;
trigger5 = P2Name = "Zangief"
;▼----------✱E·本田✱----------▼;
trigger6 = P2Name = "Edmond Honda" || P2Name = "E. Honda" || P2Name = "E.Honda" || P2Name = "E Honda"
;▼----------✱布蘭卡✱----------▼;
trigger7 = P2Name = "Blanka"
;▼----------✱M·拜森✱----------▼;
trigger8 = P2Name = "M. Bison" || P2Name = "M.Bison" || P2Name = "M Bison"
;▼----------✱巴洛克✱----------▼;
trigger9 = P2Name = "Balrog" || P2Name = "Fallen Balrog"
;▼----------✱沙加特✱----------▼;
trigger10 = P2Name = "Sagat"
;▼----------✱貝卡✱----------▼;
trigger11 = P2Name = "Vega"
;▼----------✱豪鬼✱----------▼;
trigger12 = P2Name = "Gouki" || P2Name = "Shin Gouki" || P2Name = "Akuma" || P2Name = "Shin Akuma"  || P2Name = "Rare Akuma" 
;▼----------✱飛龍✱----------▼;
trigger13 = P2Name = "Fei Long"
;~~~~~~~~~~~~The King of Fighters~~~~~~~~~~~~;拳皇
;▼----------✱草薙京✱----------▼;
trigger14 = P2Name = "Kyo" || P2Name = "Kyo Kusanagi" || P2Name = "KyoXIII" || P2Name = "A-KYOXIII" || P2Name = "Nests Kyo"
;▼----------✱八神庵✱----------▼;
trigger15 = P2Name = "Iori" || P2Name = "Iori Yagami" || P2Name = "Yagevil" || P2Name = "EX-Iori" || P2Name = "Ex-Iori Yagami" || P2Name = "Iori Yagami MAAB Sprite by Lingle" 
;▼----------✱二階堂紅丸✱----------▼;
trigger16 = P2Name = "Benimaru Nikaido"
;▼----------✱泰瑞·柏格✱----------▼;
trigger17 = P2Name = "Terry Bogard" || P2Name = "TerryXIII" || P2Name = "Terry Kof_XIII"
;▼----------✱安迪·柏格✱----------▼;
trigger18 = P2Name = "Andy Bogard" || P2Name = "AndyXIII"
;▼----------✱喬·東丈✱----------▼;
trigger19 = P2Name = "Joe Higashi" || P2Name = "JoeXIII"
;▼----------✱金卡法✱----------▼;
trigger20 = P2Name = "Kim Kaphwan"
;▼----------✱坂崎良✱----------▼;
trigger21 = P2Name = "Ryo Sakazaki"
;▼----------✱羅伯特·賈西亞✱----------▼;
trigger22 = P2Name = "Robert Garcia"
;▼----------✱基斯·霍華德✱----------▼;
trigger23 = P2Name = "Geese Howard" || P2Name = "Geese"
;▼----------✱傑尼茲✱----------▼;
trigger24 = P2Name = "Goenitz"
;▼----------✱盧卡爾·伯恩斯坦✱----------▼;
trigger25 = P2Name = "Rugal Bernstein" || P2Name = "Rugal"
;▼----------✱大蛇✱----------▼;
trigger26 = P2Name = "Orochi"
;~~~~~~~~~~~~Dragon Ball~~~~~~~~~~~~;七龍珠
;▼----------✱孫悟空✱----------▼;
trigger27 = P2Name = "Son Goku" || P2Name = "Goku" || P2Name = "Super Goku" || P2Name = "SSj Goku" || P2Name = "SSj2 Goku" || P2Name = "SSj3 Goku" || P2Name = "SSj4 Goku" || P2Name = "SSj5 Goku" || P2Name = "SSJSS Goku" || P2Name = "SSGSS Goku" || P2Name = "Ultra Instinct Goku" || P2Name = "Goku Ultra Instinct"
;▼----------✱達爾✱----------▼;
trigger28 = P2Name = "Vegeta" || P2Name = "Super Vegeta" || P2Name = "SSj Vegeta" || P2Name = "SSj2 Vegeta" || P2Name = "SSj3 Vegeta" || P2Name = "SSj4 Vegeta" || P2Name = "SSj5 Vegeta" || P2Name = "SSJSS Vegeta" || P2Name = "SSGSS Vegeta"
;▼----------✱悟吉塔 或 貝吉特✱----------▼;
trigger29 = P2Name = "Gogeta" || P2Name = "SSj Gogeta" || P2Name = "SSj4 Gogeta" || P2Name = "Gogeta SSJ" || P2Name = "Gogeta SSJ4" || P2Name = "Ultra Instinct Gogeta" || P2Name = "Gogeta Ultra Instinct" || P2Name = "Vegetto" || P2Name = "SSj4 Vegetto"
;▼----------✱布羅利✱----------▼;
trigger30 = P2Name = "Broly" || P2Name = "Broli" || P2Name = "SSj4 Broly" || P2Name = "Nightmare Broly" || P2Name = "Limiter Cut Broly" || P2Name = "SSJSS Broly" || P2Name = "SSGSS Broly"
;~~~~~~~~~~~~Million Arthur: Arcana Blood~~~~~~~~~~~~;百萬亞瑟王：聖靈之血
;▼----------✱二刀亞瑟✱----------▼;
trigger31 = P2Name = "Twinblade Arthur" || P2Name = "Nitou Arthur"
;▼----------✱亞瑟劍術之城✱----------▼;
trigger32 = P2Name = "Arthur Blade Protector" || P2Name = "Blade Protector Arthur" || P2Name = "Blade-Protector Arthur"
;▼----------✱澤克斯·西格弗里德✱----------▼;
trigger33 = P2Name = "Zechs Siegfried"
;~~~~~~~~~~~~Other Characters~~~~~~~~~~~~;其他角色
trigger34 = P2Name = "Abe" || P2Name = "Takakazu Abe"
trigger35 = P2Name = "Kenshiro"
trigger36 = P2Name = "Toki"
trigger37 = P2Name = "RAOH" || P2Name = "Raoh"  
trigger38 = P2Name = "Jotaro Kujo" || P2Name = "Jotaro" 
trigger39 = P2Name = "Dio Brando" || P2Name = "Dio" || P2Name = "Shadow Dio" || P2Name = "Final Dio"
trigger40 = P2Name = "Donald" || P2Name = "McDonald" || P2Name = "Ronald McDonald" || P2Name = "Dark Donald" 
trigger41 = P2Name = "Colonel" || P2Name = "Colonel Sanders"
trigger42 = P2Name = "Superman"
trigger43 = P2Name = "Batman"
trigger44 = P2Name = "Deadpool" || P2Name = "DeadPoolx"
trigger45 = P2Name = "Dante"
trigger46 = P2Name = "Vergil"
trigger47 = P2Name = "Ky" || P2Name = "Ky Kiske"
trigger48 = P2Name = "Sol" || P2Name = "Sol Badguy"
trigger49 = P2Name = "Yu Narukami"
trigger50 = P2Name = "Tohru Adachi"
trigger51 = P2Name = "Ragna The Bloodedge"
trigger52 = P2Name = "Kazuya Mishima" || P2Name = "Kazuya"
trigger53 = P2Name = "Heihachi Mishima" || P2Name = "Heihachi"
trigger54 = P2Name = "Link" || P2Name = "Link - The Ultimate Hero Of Time V4" || P2Name = "TS Link" 
trigger55 = P2Name = "Naruto-Kun" || P2Name = "naruto-kun" || P2Name = "Naruto Kun"
trigger56 = P2Name = "Hyde" || P2Name = "Hyde Kido"
trigger57 = P2Name = "Jin Kazama"
trigger58 = P2Name = "Liu Kang" || P2Name = "Liu Kang MK1"
trigger59 = P2Name = "Johnny Cage" || P2Name = "Johnny Cage MK1"
trigger60 = P2Name = "Kuma_DD"
v = 26
value = 1

[State 12605, 2]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1
ignorehitpause = 1

[State 12605, 3]
type = HitBy
trigger1 = 1
value = 
time = 1
ignorehitpause = 1

[State 12605, 4]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,1

[State 12605, 5]
type = Width
trigger1 = 1
edge = 402*(floor(root,const(size.xscale))),208*(floor(root,const(size.xscale)))

[State 12605, 6]
type = AssertSpecial
trigger1 = 1
flag = TimerFreeze

[State 12605, 7 (Pink Background)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 12611
id = 12611
space = screen
facing = 1
pos = 0,0
scale = screenwidth/1920*640.00,screenheight/1080*2.00
ownpal = 1
removetime = 66
sprpriority = -5

[State 12605, 8 (Bubble 1)] ;*
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 12612
id = 12612
;space = stage
pos = cond(random < 500,random%800,-random%800)+(pos x+camerapos x)+0,cond(random < 500,random%400,-random%400)-400
facing = facing
vel = 2,0
scale = 0.50,0.50
ownpal = 1
removetime = 66
sprpriority = -4

;*因為8位元索引圖片的漸層效果較差 所以泡泡特效使用24位元真彩圖片

[State 12605, 9 (Bubble 2)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 12612
id = 12612
;space = stage
pos = cond(random < 500,random%800,-random%800)+(pos x+camerapos x)-400,cond(random < 500,random%400,-random%400)-400
facing = facing
vel = 2,0
scale = 0.50,0.50
ownpal = 1
removetime = 66
sprpriority = -4

[State 12605, 10 (Bubble 3)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 12612
id = 12612
;space = stage
pos = cond(random < 500,random%800,-random%800)+(pos x+camerapos x)+400,cond(random < 500,random%400,-random%400)-400
facing = facing
vel = 2,0
scale = 0.50,0.50
ownpal = 1
removetime = 66
sprpriority = -4

[State 12605, 11 (Bubble 4)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 12612
id = 12612
;space = stage
pos = cond(random < 500,random%800,-random%800)+(pos x+camerapos x)+0,cond(random < 500,random%400,-random%400)-600
facing = facing
vel = 2,0
scale = 0.50,0.50
ownpal = 1
removetime = 66
sprpriority = -4

[State 12605, 12 (Bubble 5)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 12612
id = 12612
;space = stage
pos = cond(random < 500,random%800,-random%800)+(pos x+camerapos x)+800,cond(random < 500,random%400,-random%400)-600
facing = facing
vel = 2,0
scale = 0.50,0.50
ownpal = 1
removetime = 66
sprpriority = -4

[State 12605, 13 (Bubble 6)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 12612
id = 12612
;space = stage
pos = cond(random < 500,random%800,-random%800)+(pos x+camerapos x)-800,cond(random < 500,random%400,-random%400)-600
facing = facing
vel = 2,0
scale = 0.50,0.50
ownpal = 1
removetime = 66
sprpriority = -4

[State 12605, 14 (Bubble 7)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 12612
id = 12612
;space = stage
pos = cond(random < 500,random%800,-random%800)+(pos x+camerapos x)+0,cond(random < 500,random%400,-random%400)-200
facing = facing
vel = 2,0
scale = 0.50,0.50
ownpal = 1
removetime = 66
sprpriority = -4

[State 12605, 15 (Bubble 8)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 12612
id = 12612
;space = stage
pos = cond(random < 500,random%800,-random%800)+(pos x+camerapos x)+600,cond(random < 500,random%400,-random%400)-200
facing = facing
vel = 2,0
scale = 0.50,0.50
ownpal = 1
removetime = 66
sprpriority = -4

[State 12605, 16 (Bubble 9)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 12612
id = 12612
;space = stage
pos = cond(random < 500,random%800,-random%800)+(pos x+camerapos x)+600,cond(random < 500,random%400,-random%400)-200
facing = facing
vel = 2,0
scale = 0.50,0.50
ownpal = 1
removetime = 66
sprpriority = -4

[State 12605, 17 (Bubble 10)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 12612
id = 12612
;space = stage
pos = cond(random < 500,random%400,-random%400)+(pos x+camerapos x)+0,cond(random < 500,random%200,-random%200)-400
facing = facing
vel = 2,0
scale = 0.50,0.50
ownpal = 1
removetime = 66
sprpriority = -4

[State 12605, 18 (If Target Separation)]
type = DestroySelf
triggerall = NumTarget(12600) = 0
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(17) < 4
recursive = 1
removeexplods = 1

[State 12605, 19 (Chibi Elle turns when the Target is in the same direction)] ;小艾爾和目標同一個方向時轉身
type = Turn
triggerall = AnimElemTime(3) = 0
trigger1 = Facing = Target(12600),Facing

[State 12605, 20]
type = BindToTarget
trigger1 = AnimElemTime(3) = 0
time = 62
id = 12600
pos = 202*(floor(const(size.xscale))),-200*const(size.yscale),Foot ;*1
;pos = 202*(root,fvar(21)),-200*(root,fvar(22)),Foot ;*2

;*1 該const(size.xscale)和const(size.yscale)是計算Helper(12600)的Size.XScale和Size.YScale 不是本體
;*2 測試過該寫法無效 因為這個BindToTarget是用於Helper(12600) Root是用於計算本體

[State 12605, 21]
type = AssertSpecial
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(16) < 2
flag = NoFG

[State 12605, 22]
type = Zoom
trigger1 = AnimElem = 5,>= 0
trigger1 = AnimElem = 5,< 6
trigger1 = CameraZoom < 1.2
scale = (1+(1.2/camerazoom-1)/7*(animelemtime(5)+1))
pos = pos x/(1+(1.2/camerazoom-1)/7*(animelemtime(5)+1))*camerazoom,0

[State 12605, 23 (Nice Chinchin Background Spark)]
type = Explod
trigger1 = AnimElemTime(6) = 0
anim = 12613
id = 12613
bindid = id ;因為該Statedef是一個Helper助手，這裡綁定的會是Helper(12610)而不是本體。
facing = facing
pos = cond(facing = 1,200,-200)*(floor(const(size.xscale))),-150*const(size.yscale)
scale = const(size.xscale)*1.20,const(size.yscale)*1.20 ;Size對應Helper
ownpal = 1
removetime = 48
sprpriority = 7

;[State 12605, 24 (Nice Chinchin Hit Spark)]
;type = Explod
;trigger1 = AnimElemTime(6) = 0
;anim = 12614
;id = 12614
;bindid = id ;因為該Statedef是一個Helper助手，這裡綁定的會是Helper(12610)而不是本體。
;facing = facing
;pos = cond(facing = 1,200,-200)*const(size.xscale),-112*const(size.yscale)
;scale = const(size.xscale)*1.20,const(size.yscale)*1.20 ;Size對應Helper
;ownpal = 1
;removetime = 12
;sprpriority = 9

[State 12605, 25]
type = Zoom
trigger1 = AnimElem = 5,>= 6
trigger1 = AnimElem = 14,< 2
trigger1 = CameraZoom < 1.2
scale = 1.2/camerazoom
pos = pos x/(1.2/camerazoom)*camerazoom,0

[State 12605, 26 (Support Knight Voice)]
type = PlaySnd
trigger1 = AnimElem = 7
value = s12601,var(26) ;如果對手是上面VarSet所寫的角色其中之一，配音將為Nice Chinchin!
channel = 27
ignorehitpause = 1

[State 12605, 27 (If Target Separation)]
type = StopSnd
triggerall = NumTarget(12600) = 0
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(17) < 4
channel = 27
ignorehitpause = 1 

[State 12605, 28]
type = Zoom
trigger1 = AnimElem = 14,>= 2
trigger1 = AnimElem = 16,< 0
trigger1 = CameraZoom < 1.2
scale = (1.2/camerazoom-(1.2/camerazoom-1)/7*(animelemtime(14)-1))
pos = pos x/(1.2/camerazoom-(1.2/camerazoom-1)/7*(animelemtime(14)-1))*camerazoom,0

[State 12605, 29]
type = TargetLifeAdd
triggerall = NumTarget(12600)
triggerall = root,var(15) > 0
trigger1 = AnimElemTime(18) = 4
value = -cond(target(12600),life > ceil(48*root,fvar(20)),(ceil((0.048*(target(12600),lifemax))*root,fvar(20))),ceil(48*root,fvar(20))) ;可隨著我方攻擊力 對手最大生命值改變
absolute = 1
ignorehitpause = 1
kill = 1

[State 12605, 30]
type = TargetLifeAdd
triggerall = NumTarget(12600)
triggerall = root,var(15) <= 0
trigger1 = AnimElemTime(18) = 4
value = -ceil(48*root,fvar(20))
absolute = 0
ignorehitpause = 1
kill = 1

[State 12605, 31]
type = PosSet
trigger1 = AnimElem = 20
y = 0

[State 12605, 32 (Fire Element Hit Spark)]
type = Explod
triggerall = NumExplod(7851) < 2 ;爆炸火花7851數量小於2
triggerall = NumTarget(12600)
trigger1 = (Target(12600),StateNo != [120,159])
trigger1 = Target(12600),StateType != L
trigger1 = Target(12600),MoveType = H
trigger1 = AnimElem = 20
anim = 7851
id = 7851
space = stage
bindid = target,id
bindtime = -1
pos = 0,const(size.mid.pos.y)
facing = facing
sprpriority = 1
removetime = 20
ownpal = 1 ;上面的remappal要有效，請記得將ownpal設定為1
scale = root,fvar(21)*1.50,root,fvar(22)*1.50
ignorehitpause = 1
persistent = 0

[State 12605, 33 (Remove Pink Background)]
type = RemoveExplod
trigger1 = Root,StateNo = 3000 || Root,StateNo = 3100 || Root,StateNo = 3200
id = 12611

[State 12605, 34 (Remove Bubble)]
type = RemoveExplod
trigger1 = Root,StateNo = 3000 || Root,StateNo = 3100 || Root,StateNo = 3200
id = 12612

[State 12605, 35 (Remove Nice Chinchin Background Spark)]
type = RemoveExplod
triggerall = AnimElemTime(19) >= 1
trigger1 = Root,StateNo = 3000 || Root,StateNo = 3100 || Root,StateNo = 3200
id = 12613

[State 12605, 36 (Can it be cancelled by other moves?)] ;能否被其他招式取消？
type = ParentVarSet
trigger1 = AnimElemTime(26) = 3
fv = 34 ;*
value = 1
;fvar(34) = 1
ignorehitpause = 1

;*因為本體AnimElem號會在中途改變 所以增加變量設計提前取消時間
; 跟本體的AnimElemTime(22) >= 1取消時間相比 多7ticks提前取消時間

[State 12605, 37]
type = ChangeState
trigger1 = AnimElemTime(28) >= 4
value = 12610
ctrl = 0

;===========================================================================
; Foible Elle / Disappear
; 弱酸型艾爾《弱酸型エル》 / 消失
;===========================================================================
[Statedef 12610]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
sprpriority = 9
poweradd = 0

[State 12610, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 12605
elem = 29

[State 12610, 2]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1
ignorehitpause = 1

[State 12610, 3]
type = HitBy
trigger1 = 1
value = 
time = 1
ignorehitpause = 1

[State 12610, 4]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,1

[State 12610, 5]
type = AssertSpecial
trigger1 = 1
flag = TimerFreeze

[State 12610, 6 (Variable to Zero)] ;變量歸零
type = ParentVarSet
trigger1 = Root,Ctrl = 1 ;本體回到可控制狀態時
trigger2 = Root,MoveType = H ;本體受擊時
trigger3 = Root,Alive = 0 ;本體未存活時
fv = 34
value = 0
;fvar(34) = 0
ignorehitpause = 1

[State 12610, 7]
type = PosSet
trigger1 = Time = 0
y = 0

;[State 12610, 8 (Fade Out)] ;本效果改為利用AnimElem方式完成
;type = Trans
;trigger1 = AnimElemTime(30) >= 0
;trans = addalpha
;alpha = 256-(time*32),0+(time*32)

[State 12610, 9]
type = PalFX
trigger1 = AnimElemTime(30) >= 0 && AnimElemTime(30) < 4
time = 1
add = 256,128+((time-22)*25),0 ;*
mul = 256,256,256
sinadd = 0,0,0,1
invertall = 0
color = 256

;*time-22 的22數值取自於第一個AnimElem的ticks數(AnimElem = 29的ticks數)
; 要記得Statedef改變 Time會從0開始計算
; 再加上該Statedef的第一個AnimElem為29(一般預設為從AnimElem = 1開始)
; 因此才會是22ticks(而不是122ticks)

[State 12610, 10]
type = PalFX
trigger1 = AnimElemTime(30) >= 4 && AnimElemTime(30) < 7
time = 1
add = 0,0,256-((time-25)*42)
mul = 256,256,256
sinadd = 0,0,0,1
invertall = 0
color = 256

[State 12610, 11 (Remove Pink Background)]
type = RemoveExplod
trigger1 = Root,StateNo = 3000 || Root,StateNo = 3100 || Root,StateNo = 3200
id = 12611

[State 12610, 12 (Remove Bubble)]
type = RemoveExplod
trigger1 = Root,StateNo = 3000 || Root,StateNo = 3100 || Root,StateNo = 3200
id = 12612

[State 12610, 13 (Remove Nice Chinchin Background Spark)]
type = RemoveExplod
trigger1 = Root,StateNo = 3000 || Root,StateNo = 3100 || Root,StateNo = 3200
id = 12613

[State 12610, 14 (Helper Remove)]
type = DestroySelf
trigger1 = AnimTime = 0
recursive = 1
removeexplods = 1

;===========================================================================
; Clone Scathach
; 複製型斯卡哈《複製型スカアハ》
;===========================================================================
[Statedef 12800]
type = S
movetype = A
physics = N
ctrl = 0
anim = 12800
sprpriority = 1
poweradd = 20

[State 12800, 1]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1

[State 12800, 2]
type = HitBy
trigger1 = 1
value =
time = 1

[State 12800, 3]
type = PosSet
trigger1 = 1
y = -22*root,fvar(22)

[State 12800, 4 (Fade In)]
type = Trans
trigger1 = Time < 9
trans = addalpha
alpha = 0+time*32,256-(time*32)

[State 12800, 5 (Support Knight Voice)]
type = PlaySnd
trigger1 = AnimElem = 3
value = s12801,0+(random%2)
channel = 28
ignorehitpause = 1

[State 12800, 6 (Shake Spark / Leather Whip)]
type = Explod
trigger1 = AnimElemTime(3) = 0
anim = 12850
id = 12850
bindid = id ;因為該Statedef是一個Helper助手 這裡綁定的會是Helper(12800)而不是本體
facing = facing
pos = cond(facing = 1,-10,10)*(floor(const(size.xscale))),-10*const(size.yscale)
scale = const(size.xscale)*1.85,const(size.yscale)*2.00 ;Size對應Helper(12800)
ownpal = 1
removetime = -2
sprpriority = 2

[State 12800, 7]
type = Null
trigger1 = P2Dist X <= 0
trigger1 = (fvar(29):= 0)||1
trigger2 = P2Dist X >= 1 && P2Dist X < 2400
trigger2 = (fvar(29):= p2dist x)||1
trigger3 = P2Dist X >= 2400
trigger3 = (fvar(29):= 2400)||1

[State 12800, 8 (Gale Upward)] ;向上疾風
type = Helper
triggerall = NumHelper(12860) = 0
trigger1 = AnimElemTime(3) = 0
name = "Gale Upward"
size.xscale = root,fvar(21)*2.20
size.yscale = root,fvar(22)*1.60
stateno = 12860
keyctrl = 0
ownpal = 1
id = 12860
pos = fvar(29),0 ;數值設定2180 可以讓招式最大追蹤距離到場景最遠處(除了少部份極為寬廣的場景之外)
postype = p1
ignorehitpause = 1

[State 12800, 9]
type = ChangeState
trigger1 = AnimElemTime(12) >= 22
value = 12810
ctrl = 0

;===========================================================================
; Clone Scathach / Disappear
; 複製型斯卡哈《複製型スカアハ》 / 消失
;===========================================================================
[Statedef 12810]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
sprpriority = 1
poweradd = 0

[State 12810, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 12800
elem = 13 ;從第十三個動畫元素開始 (Statedef的Time計算不會改變 一律從0開始)

[State 12810, 2]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1
ignorehitpause = 1

[State 12810, 3]
type = HitBy
trigger1 = 1
value = 
time = 1
ignorehitpause = 1

[State 12810, 4]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,1

[State 12810, 5]
type = AssertSpecial
trigger1 = 1
flag = TimerFreeze

[State 12810, 6]
type = PosSet
trigger1 = 1
y = -22*root,fvar(22)

;[State 12810, 7 (Fade Out)] ;本效果改為利用AnimElem方式完成
;type = Trans
;trigger1 = AnimElemTime(13) >= 0
;trans = addalpha
;alpha = 256-(time*32),0+(time*32)

[State 12810, 8]
type = PalFX
trigger1 = AnimElemTime(13) >= 0 && AnimElemTime(13) < 4
time = 1
add = 256,128+(time*25),0
mul = 256,256,256
sinadd = 0,0,0,1
invertall = 0
color = 256

[State 12810, 9]
type = PalFX
trigger1 = AnimElemTime(13) >= 4 && AnimElemTime(13) < 7
time = 1
add = 0,0,256-(time*42)
mul = 256,256,256
sinadd = 0,0,0,1
invertall = 0
color = 256

[State 12810, 10 (Helper Remove)]
type = DestroySelf
trigger1 = AnimTime = 0
recursive = 1
removeexplods = 1

;===========================================================================
; Gale Upward
; 向上疾風 
;===========================================================================
[Statedef 12860]
type = A
movetype = A
physics = N
ctrl = 0
juggle = 1
sprpriority = 5
velset = 0,0

[State 12860, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 99993

[State 12860, 2]
type = AssertSpecial
trigger1 = 1
flag = Invisible
ignorehitpause = 1

[State 12860, 3]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1

[State 12860, 4]
type = HitBy
trigger1 = 1
value =
time = 1

[State 12860, 5]
type = PlaySnd
trigger1 = AnimElemTime(1) = 0
value = s12860,0
channel = 29

[State 12860, 6 (Gale Upward / Subtraction)]
type = Explod
triggerall = NumExplod(12861) = 0
trigger1 = AnimElemTime(1) = 0
anim = 12861
id = 12861
;space = stage
bindid = id ;綁定Helper(12860)*
pos = 0,0 ;綁定後會以Helper(12860)的Pos為基準
facing = facing
bindtime = 1 ;綁定1ticks時間
remappal = 12860,1
ownpal = 1
scale = parent,const(size.xscale)*2.20,parent,const(size.yscale)*1.80 ;Parent為上一級(父級)，即為Helper(12800)助手
sprpriority = 2
removetime = 52
removeongethit = 1
ignorehitpause = 0

;*因為這個Statedef為Helper助手，要對應本體 前面需要加上Root。
; 如果沒有加上Root 該ID參數即為該Helper助手。

[State 12860, 7 (Gale Upward)]
type = Explod
triggerall = NumExplod(12860) = 0
trigger1 = AnimElemTime(1) = 0
anim = 12860
id = 12860
;space = stage
bindid = id
pos = 0,0
facing = facing
bindtime = 1
ownpal = 1
scale = parent,const(size.xscale)*2.20,parent,const(size.yscale)*1.80
sprpriority = 2
removetime = 52
removeongethit = 1
ignorehitpause = 0

[State 12860, 8 (Gale Upward / Land Effect)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 7055
id = 12870
bindid = id
pos = 0,0
facing = facing
bindtime = -1
ownpal = 1
remappal = 7055,1
sprpriority = -3
removetime = 12
scale = parent,const(size.xscale)*1.40,parent,const(size.yscale)*1.40
removeongethit = 1

[State 12860, 9 (Gale Upward / Dust)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 7052
id = 12870
;space = stage
bindid = id
pos = 0,0
facing = facing
bindtime = 1
ownpal = 1
scale = parent,const(size.xscale)*4.40,parent,const(size.yscale)*4.40
sprpriority = 3
removetime = 27
removeongethit = 1
ignorehitpause = 0

[State 12860, 10 (Gale Upward / Wind Slash A1)]
type = Explod
triggerall = NumExplod(12880) = 0
trigger1 = AnimElemTime(1) = 0
anim = 12880
id = 12880
;space = stage
bindid = id
pos = 0,-720*parent,const(size.yscale) ;←這個Const是計算該Statedef的上一級(父級)，即Helper(12800)助手
facing = facing
bindtime = 1
ownpal = 1
scale = parent,const(size.xscale)*0.500,parent,const(size.yscale)*0.750
sprpriority = 3
removetime = 48
removeongethit = 1
ignorehitpause = 0

[State 12860, 11 (Gale Upward / Wind Slash B1)]
type = Explod
triggerall = NumExplod(12881) = 0
trigger1 = AnimElemTime(1) = 0
anim = 12881
id = 12881
;space = stage
bindid = id ;enemynear,id
pos = 0,-720*parent,const(size.yscale)
facing = facing
bindtime = 1
ownpal = 1
scale = parent,const(size.xscale)*0.500,parent,const(size.yscale)*0.750
sprpriority = 0
removetime = 48
removeongethit = 1
ignorehitpause = 0

[State 12860, 12 (Gale Upward / Wind Slash A2)]
type = Explod
triggerall = NumExplod(12882) = 0
trigger1 = AnimElemTime(1) = 0
anim = 12882
id = 12882
;space = stage
bindid = id
pos = 0,-590*parent,const(size.yscale) ;←這個Const是計算該Statedef的上一級(父級)，即Helper(12800)助手
facing = facing
bindtime = 1
ownpal = 1
scale = parent,const(size.xscale)*0.525,parent,const(size.yscale)*0.750
sprpriority = 3
removetime = 48
removeongethit = 1
ignorehitpause = 0

[State 12860, 13 (Gale Upward / Wind Slash B2)]
type = Explod
triggerall = NumExplod(12883) = 0
trigger1 = AnimElemTime(1) = 0
anim = 12883
id = 12883
;space = stage
bindid = id ;enemynear,id
pos = 0,-590*parent,const(size.yscale)
facing = facing
bindtime = 1
ownpal = 1
scale = parent,const(size.xscale)*0.525,parent,const(size.yscale)*0.750
sprpriority = 0
removetime = 48
removeongethit = 1
ignorehitpause = 0

[State 12860, 14 (Gale Upward / Wind Slash A3)]
type = Explod
triggerall = NumExplod(12884) = 0
trigger1 = AnimElemTime(1) = 0
anim = 12880
id = 12884
;space = stage
bindid = id
pos = 0,-460*parent,const(size.yscale) ;←這個Const是計算該Statedef的上一級(父級)，即Helper(12800)助手
facing = facing
bindtime = 1
ownpal = 1
scale = parent,const(size.xscale)*0.550,parent,const(size.yscale)*0.750
sprpriority = 3
removetime = 48
removeongethit = 1
ignorehitpause = 0

[State 12860, 15 (Gale Upward / Wind Slash B3)]
type = Explod
triggerall = NumExplod(12885) = 0
trigger1 = AnimElemTime(1) = 0
anim = 12881
id = 12885
;space = stage
bindid = id ;enemynear,id
pos = 0,-460*parent,const(size.yscale)
facing = facing
bindtime = 1
ownpal = 1
scale = parent,const(size.xscale)*0.550,parent,const(size.yscale)*0.750
sprpriority = 0
removetime = 48
removeongethit = 1
ignorehitpause = 0

[State 12860, 16 (Gale Upward / Wind Slash A4)]
type = Explod
triggerall = NumExplod(12886) = 0
trigger1 = AnimElemTime(1) = 0
anim = 12884
id = 12886
;space = stage
bindid = id
pos = 0,-330*parent,const(size.yscale) ;←這個Const是計算該Statedef的上一級(父級)，即Helper(12800)助手
facing = facing
bindtime = 1
ownpal = 1
scale = parent,const(size.xscale)*0.575,parent,const(size.yscale)*0.750
sprpriority = 3
removetime = 26
removeongethit = 1
ignorehitpause = 0

[State 12860, 17 (Gale Upward / Wind Slash B4)]
type = Explod
triggerall = NumExplod(12887) = 0
trigger1 = AnimElemTime(1) = 0
anim = 12885
id = 12887
;space = stage
bindid = id ;enemynear,id
pos = 0,-330*parent,const(size.yscale)
facing = facing
bindtime = 1
ownpal = 1
scale = parent,const(size.xscale)*0.575,parent,const(size.yscale)*0.750
sprpriority = 0
removetime = 26
removeongethit = 1
ignorehitpause = 0

[State 12860, 18 (Gale Upward / Wind Slash A5)]
type = Explod
triggerall = NumExplod(12888) = 0
trigger1 = AnimElemTime(1) = 0
anim = 12884
id = 12888
;space = stage
bindid = id ;enemynear,id
pos = 0,-200*parent,const(size.yscale)
facing = facing
bindtime = 1
ownpal = 1
scale = parent,const(size.xscale)*0.600,parent,const(size.yscale)*0.750
sprpriority = 3
removetime = 26
removeongethit = 1
ignorehitpause = 0

[State 12860, 19 (Gale Upward / Wind Slash B5)]
type = Explod
triggerall = NumExplod(12889) = 0
trigger1 = AnimElemTime(1) = 0
anim = 12885
id = 12889
;space = stage
bindid = id ;enemynear,id
pos = 0,-200*parent,const(size.yscale)
facing = facing
bindtime = 1
ownpal = 1
scale = parent,const(size.xscale)*0.600,parent,const(size.yscale)*0.750
sprpriority = 0
removetime = 26
removeongethit = 1
ignorehitpause = 0

[State 12860, 20]
type = HitDef
trigger1 = GameTime %6 = 0 ;招式的總攻擊框幀數為36ticks 6%的話最多6連擊
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(22) < 0
attr = A, SA
animtype = Up ;主要用於5051動畫編號 (如果對手有該動畫編號的話)
air.animtype = Up ;主要用於5051動畫編號 (如果對手有該動畫編號的話)
hitflag = MAFD
guardflag = MA
priority = 5, Hit
damage = cond(root,var(15) > 0,ceil((((root,fvar(11))*root,fvar(12)*0.023))*root,fvar(13)),23*root,fvar(13)),cond(root,var(15) > 0,ceil((((root,fvar(11))*root,fvar(12)*0.004))*root,fvar(13)),4*root,fvar(13))
pausetime = 0,0
guard.pausetime = 0,0
getpower = 0,0
givepower = 0,0
sparkno = s7205
guard.sparkno = s7302
sparkxy = 0,-520*parent,const(size.yscale)+target,pos y ;←這個Const是計算該Statedef的上一級(父級)，即Helper(12800)助手
hitsound = s7,3
guardsound = s8,1
ground.type = High
air.type = High
ground.slidetime = 25
ground.hittime = 25
ground.velocity = 0,-32
guard.slidetime = 35
guard.hittime = 35
guard.velocity = 35
air.hittime = 28
air.velocity = 0,-24
airguard.velocity = 0,-25
airguard.ctrltime = 28
palfx.time = 16
palfx.add = 0,120,0
palfx.mul = 255,255,255
palfx.sinadd = 10,10,10,30
palfx.color = 256
palfx.invertall = 0
guard.dist = 600
p2facing = 1-(gametime%12 = 0)*2 ;讓P2隨著GameTime%6乘以2改變朝向
p2sprpriority = 1
fall = 1
air.fall = 1
fall.recover = 0
id = 12860

[State 12860, 21]
type = Helper
triggerall = Root,Alive = 1
trigger1 = NumHelper(12980) < 5 ;粒子總數量限制(所有寫上助手ID號12980的招式，最多5個)。
trigger1 = MoveHit >= 1
name = "Wind Element Particle" ;風元素粒子
stateno = 12980
id = 12980
postype = p2
pos = 0,(target,const(size.mid.pos.y))
ownpal = 1
size.xscale = root,fvar(21)*0.65
size.yscale = root,fvar(22)*0.65
ignorehitpause = 1
persistent = 1

[State 12860, 22 (Helper Remove)]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = MoveType = H
removeexplods = 1

;===========================================================================
; Wind Element Particle
; 風元素粒子
;===========================================================================
[Statedef 12980]
type = A
movetype = I
physics = N
velset = 0,0
sprpriority = 10
poweradd = 0
anim = 7854

[State 12980, 1]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 12980, 2]
type = NotHitBy
trigger1 = 1
value = SCA, AA, AP, AT
time = 1
ignorehitpause = 1

[State 12980, 3]
type = HitBy
trigger1 = 1
value =
time = 1
ignorehitpause = 1

[State 12980, 4 (Particle 1 Angle Value)]
type = VarSet
trigger1 = Time = 0
trigger1 = NumEnemy > 0
trigger1 = IsHelper(12980)
fvar(26) = cond(enemynear(root,var(48)),statetype = A,50+random%200,50+random%160) ;粒子1角度 (加上Random值讓粒子角度隨機決定 提醒：該Helper目標是設定P2對手)

[State 12980, 5 (Particle 2 Angle Value)]
type = VarSet
trigger1 = Time = 0
trigger1 = IsHelper(12981)
fvar(26) = 30+random%100 ;粒子2角度 (加上Random值讓粒子角度隨機決定)

[State 12980, 6 (Particle 3 Angle Value)]
type = VarSet
trigger1 = Time = 0
trigger1 = IsHelper(12982)
fvar(26) = 120+random%90 ;粒子3角度 (加上Random值讓粒子角度隨機決定)

[State 12980, 7 (Particle 4 Angle Value)]
type = VarSet
trigger1 = Time = 0
trigger1 = IsHelper(12983)
fvar(26) = 210+random%60 ;粒子4角度 (加上Random值讓粒子角度隨機決定)

[State 12980, 8 (Particle 5~HelperMax Angle Value)]
type = VarSet
trigger1 = Time = 0
trigger1 = IsHelper(12984)
fvar(26) = random%360 ;粒子5~Helper最大值角度 (加上Random值讓粒子角度隨機決定)

[State 12980, 9]
type = VarSet
trigger1 = Time = 1
fvar(27) = 5

[State 12980, 10]
type = VarSet
trigger1 = Time >= 15
trigger1 = fvar(33)!= 0
fvar(25) = -atan(fvar(28)/fvar(33))*(180/pi)-cond(fvar(33) < 0,cond(fvar(28) > 0,180,-180),0)

[State 12980, 11]
type = VarAdd
trigger1 = IsHelper(12980)
trigger1 = (Abs(RootDist Y) >= (-Root,Const(Size.Mid.Pos.Y)) && Abs(RootDist X) <= (-Root,Const(Size.Mid.Pos.Y))) || Time = [25,85]
trigger2 = IsHelper(12981) || IsHelper(12982) || IsHelper(12983) || IsHelper(12984)
trigger2 = Time = [0,60]
fvar(27) = 0.25

[State 12980, 12 (Particle Gather Towards the Root Y Axis)] ;粒子最後收回時聚集到本體的Y軸位置
type = VarSet
trigger1 = 1
fvar(28) = (rootdist y-(-root,const(size.mid.pos.y)))+0.001 ;*
;*(-root,const(size.mid.pos.y)) = (-(-380)) = 380 對應人物中心位置 因為要負負得正前面加上負號

[State 12980, 13 (Particle Gather Towards the Root X Axis)] ;粒子最後收回時聚集到本體的X軸位置
type = VarSet
trigger1 = 1
fvar(33) = rootdist x+0.001

[State 12980, 14]
type = Null
triggerall = Time = [25,39]
trigger1 = fvar(27):= fvar(27)+10

[State 12980, 15]
type = VarAdd
trigger1 = IsHelper(12980)
trigger1 = (Abs(RootDist Y) >= (-Root,Const(Size.Mid.Pos.Y)) && Abs(RootDist X) <= (-Root,Const(Size.Mid.Pos.Y))) || Time >= 24
trigger2 = IsHelper(12981) || IsHelper(12982) || IsHelper(12983) || IsHelper(12984)
trigger2 = Time >= 14
fvar(26) = cond(fvar(25)-fvar(26)>fvar(27),cond(fvar(25)-fvar(26)> 180,-fvar(27),fvar(27)),cond(fvar(25)-fvar(26)<-fvar(27),cond(fvar(25)-fvar(26) < -180,fvar(27),-fvar(27)),fvar(25)-fvar(26)))

[State 12980, 16]
type = VarAdd
trigger1 = fvar(26) > 190
fvar(26) = -360

[State 12980, 17]
type = VarAdd
trigger1 = fvar(26) < -190
fvar(26) = 360

[State 12980, 18 (Particle Velocity 1 from Target)] ;粒子從目標放射出的速度1
type = VelSet
trigger1 = Time = [0,4] ;0~4 Ticks時
trigger1 = fvar(26)!= 0
x = cos((pi/180)*fvar(26))*(40)
y = sin((pi/180)*fvar(26))*(-40)

[State 12980, 19]
type = VarSet
triggerall = Time >= 10
trigger1 = RootDist X = [-40,80]
trigger1 = RootDist Y = [(((-Root,Const(Size.Mid.Pos.Y))-80)),(((-Root,Const(Size.Mid.Pos.Y))+20))] ;[300,400]
fvar(23) = 1

[State 12980, 20 (Particle Velocity 2 from Target)] ;粒子從目標放射出的速度2
type = VelSet
trigger1 = Time = [5,24] ;5~24 Ticks時
trigger1 = fvar(26)!= 0
x = cos((pi/180)*fvar(26))*(30-(time-4)*1.5)
y = sin((pi/180)*fvar(26))*(-30+(time-4)*1.5)

[State 12980, 21 (Particle Multiplier Velocity)] ;粒子乘數速度
type = VelMul
trigger1 = Time = [25,39] ;25~39 Ticks時
trigger1 = fvar(26)!= 0
x = 0 ;Since any number multiplied by 0 is equal to 0, the particles will temporarily stop.
y = 0 ;因為任何數字乘以0都等於0數值 所以粒子會暫時停住
persistent = 0

[State 12980, 22 (Particle Velocity 1 Gather Towards the Root)] ;粒子向本體集中的速度1
type = VelSet
trigger1 = Time = [40,59] ;40~59 Ticks時
trigger1 = fvar(26)!= 0
x = cos((pi/180)*fvar(26))*((time-39)/12.0+time/15.0)
y = sin((pi/180)*fvar(26))*(-(time-39)/12.0-(time/75.0))

[State 12980, 23 (Particle Velocity 2 Gather Towards the Root)] ;粒子向本體集中的速度2
type = VelSet
trigger1 = Time = [60,89] ;60~89 Ticks時
trigger1 = fvar(26)!= 0
x = cos((pi/180)*fvar(26))*(40+time/20.0)
y = sin((pi/180)*fvar(26))*(-40-(time/100.0))

[State 12980, 24 (Particle Velocity 3 Gather Towards the Root)] ;粒子向本體集中的速度3
type = VelSet
trigger1 = Time >= 90 ;大於90 Ticks時
trigger1 = fvar(26)!= 0
x = cos((pi/180)*fvar(26))*(50+time/25.0)
y = sin((pi/180)*fvar(26))*(-50-(time/125.0))

[State 12980, 25 (To Next State 12989 / Special Case)] ;特殊情況
type = ChangeState ;DestroySelf
trigger1 = Root,Alive = 0 ;本體未存活時
trigger2 = (Root,StateNo = [3103,3105]) ;流星衝 / 第三段~第四段
trigger3 = (Root,StateNo = [3209,3212]) ;百花光弾槍 / 第七段 (換裝二)~第十段
trigger4 = (Root,StateNo = [3990,3991]) ;復活狀態定義時
trigger5 = root,var(53) > 0 ;復活開啟時
;trigger6 = Root,MoveType = H && (Root,StateNo != [120,159]) ;#關閉此項設定 避免本體被擊中一次時多個粒子直接全部消失#
ignorehitpause = 1
value = 12989
;recursive = 1
;removeexplods = 1

[State 12980, 26 (To Next State 12988 / Particle Fusion to Root)] ;粒子跟本體融合(回到本體身上)
type = ChangeState
trigger1 = fvar(23) >= 1
trigger2 = Time >= 1800 ;約30秒鐘(用於非常寬廣的場景上)
trigger3 = Time >= 30*TicksPerSecond ;約30秒鐘(跟上面相同，但是不支持透過Debug鍵進行加速) → https://w.atwiki.jp/mugencns/pages/196.html
ignorehitpause = 1
value = 12988

;===========================================================================
; Wind Element Particle / Recovery Life Flash
; 風元素粒子 / 回復生命特效
;===========================================================================
[Statedef 12988]
type = A
movetype = I
physics = N
juggle = 0
velset = 0,0
ctrl = 0
anim = 99999
poweradd = 0

[State 12988, 1 (Particle fusion to Root sound effect)] 
type = PlaySnd
trigger1 = Time = 0
value = s12988,0
;channel = 0 ;確定不設置channel參數，以避免上一個粒子音效被下一個取代

[State 12988, 2]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
flag2 = Invisible
ignorehitpause = 1

[State 12988, 3 (Recovery Life Flash)] ;回復生命閃光特效
type = Explod
trigger1 = AnimElemTime(1) >= 0
trigger1 = NumExplod(7855) < 5 ;特效數量最多4個
anim = 7855
bindid = id
bindtime = -1
pos = (0+cond(random < 500,random%140,-random%140))*root,fvar(21),(0+cond(random < 500,random%180,-random%180))*root,fvar(22)
scale = root,fvar(21)*0.50,root,fvar(22)*0.50
sprpriority = 3+cond(random < 500,(-1),(1))
facing = facing
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 1 ;需要持續才能讓Explod數量到4個

[State 12988, 4 (Projectiles for LifeAdd)] ;回復用飛行道具(不用於攻擊，回復量寫在Statedef -2下方)
type = Projectile
trigger1 = Time = 0
projid = 12988
projanim = 99999
projhitanim = 99999
projremanim = 99999
projcancelanim = 99999
projscale = 1,1
projremove = 1
projremovetime = 1
velocity = 0,0
remvelocity = 0,0
accel = 0,0
projhits = 0
projpriority = 1
projsprpriority = 3
projedgebound = 240
projstagebound = 240
projheightbound = -1440,6
offset = 0,0
postype = p1 ;因為MUGEN系統Projectile歸屬Bug的關係，由Helper助手發出的飛行道具歸屬會算在Root本體。
projshadow = 0,0,0
supermovetime = 2147483647 ;MUGEN系統允許最大值
pausemovetime = 2147483647

[State 12988, 5 (Helper Remove)]
type = DestroySelf
trigger1 = Time >= 10
trigger2 = Root,Alive = 0 ;本體未存活時
trigger3 = (Root,StateNo = [3103,3105]) ;流星衝 / 第三段~第四段
trigger4 = (Root,StateNo = [3209,3212]) ;百花光弾槍 / 第七段 (換裝二)~第十段
trigger5 = (Root,StateNo = [3990,3991]) ;復活狀態定義時
trigger6 = root,var(53) > 0 ;復活開啟時
;trigger7 = Root,MoveType = H && (Root,StateNo != [120,159]) ;本體被擊中時
recursive = 1
removeexplods = 1

;===========================================================================
; Wind Element Particle / Remove (If Root is Hit by Enemy)
; 風元素粒子 / 消除 (如果本體被敵人擊中)
;===========================================================================
[Statedef 12989]
type = A
movetype = I
physics = N
velset = 0,0
sprpriority = 10
poweradd = 0
anim = 7854

[State 12989, 1 (Fade Out)]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256-(time*10),256
ignorehitpause = 1

[State 12989, 2 (Helper Remove)]
type = DestroySelf
trigger1 = Time >= 10
recursive = 1
removeexplods = 1

;===========================================================================
; Clone Pharsalia
; 複製型法莎莉雅《複製型ファルサリア》
;===========================================================================
[Statedef 13600]
type = A
movetype = I
physics = N
ctrl = 0
anim = 13600
sprpriority = 6
poweradd = 375

[State 13600, 1]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1

[State 13600, 2]
type = HitBy
trigger1 = 1
value =
time = 1

[State 13600, 3]
type = EnvShake
trigger1 = AnimElem = 1
time = 30
freq = 100
ampl = -5
phase = 90
ignorehitpause = 1

[State 13600, 4]
type = EnvShake
trigger1 = AnimElem = 9
time = 80
freq = 100
ampl = -20
phase = 90
ignorehitpause = 1

[State 13600, 5] ;Pharsalia's Weapon 1 (Trans)
type = Explod
trigger1 = AnimElem = 1
anim = 13606
id = 13606
pos = 0,0
bindid = id
bindtime = -1
facing = facing
ownpal = 1
scale = root,fvar(21)*0.92,root,fvar(22)*0.92
sprpriority = 6
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 6] ;Pharsalia's Weapon 2 (Trans)
type = Explod
trigger1 = AnimElem = 1
anim = 13608
id = 13608
pos = 0,0
bindid = id
bindtime = -1
facing = facing
ownpal = 1
scale = root,fvar(21)*0.92,root,fvar(22)*0.92
sprpriority = 6
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 7] ;Pharsalia's Weapon 1
type = Explod
trigger1 = AnimElem = 1
anim = 13602
id = 13602
pos = 0,0
bindid = id
bindtime = -1
facing = facing
scale = root,fvar(21)*0.92,root,fvar(22)*0.92
ownpal = 1
sprpriority = 6
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 8] ;Pharsalia's Weapon 2
type = Explod
trigger1 = AnimElem = 1
anim = 13604
id = 13604
pos = 0,0
bindid = id
bindtime = -1
facing = facing
scale = root,fvar(21)*0.92,root,fvar(22)*0.92
ownpal = 1
sprpriority = 6
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 9]
type = Explod
trigger1 = AnimElem = 1
anim = 13610
id = 13610
pos = facing*276*root,fvar(21)*0.92,-518*root,fvar(22)*0.92
bindid = id
bindtime = -1
facing = facing
scale = root,fvar(21)*2*0.92,root,fvar(22)*2*0.92
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 10]
type = Explod
trigger1 = AnimElem = 1
anim = 13611 ;Particle 2
id = 13611 ;對應Clone Pharsalia
pos = facing*276*root,fvar(21)*0.92,-518*root,fvar(22)*0.92
scale = root,fvar(21)*2*0.92,root,fvar(22)*2*0.92
bindid = id
bindtime = -1
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

;*這裡所有Explod的const是對應Helper
; 要對應真本體 請前面加上Root

[State 13600, 11]
type = Explod
trigger1 = AnimElem = 1
anim = 13612
id = 13612
pos = facing*276*root,fvar(21)*0.92,-518*root,fvar(22)*0.92
scale = root,fvar(21)*2*0.92,root,fvar(22)*2*0.92
bindid = id
bindtime = -1
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 12]
type = Explod
trigger1 = AnimElem = 1
anim = 13613
id = 13613
pos = facing*320*root,fvar(21)*0.92,-700*root,fvar(22)*0.92
scale = root,fvar(21)*2*0.92,root,fvar(22)*2*0.92
bindid = id
bindtime = -1
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 13]
type = Explod
trigger1 = AnimElem = 1
anim = 13614
id = 13614
pos = facing*264*root,fvar(21)*0.92,-869*root,fvar(22)*0.92
scale = root,fvar(21)*2*0.92,root,fvar(22)*2*0.92
bindid = id
bindtime = -1
removetime = 34
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 14]
type = Explod
trigger1 = AnimElem = 1
anim = 13614
id = 13614
pos = facing*382*root,fvar(21)*0.92,-779*root,fvar(22)*0.92
scale = root,fvar(21)*0.9*0.92,root,fvar(22)*0.9*0.92
bindid = id
bindtime = -1
removetime = 34
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 15]
type = Explod
trigger1 = AnimElem = 1
anim = 13614
id = 13614
pos = facing*298*root,fvar(21)*0.92,-531*root,fvar(22)*0.92
scale = root,fvar(21)*0.92,root,fvar(22)*0.92
bindid = id
bindtime = -1
removetime = 34
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 16]
type = Helper
trigger1 = AnimElem = 9
name = "Attack Laser"
id = 13650
stateno = 13650
postype = p1
pos = 0,-500*root,fvar(22)*0.92
size.xscale = root,fvar(21)*0.92
size.yscale = root,fvar(22)*0.92
facing = 1
ownpal = 0
supermovetime = root,var(34)

[State 13600, 17]
type = Explod
trigger1 = AnimElem = 1
anim = 13614
id = 13614
pos = facing*3*root,fvar(21)*0.92,-512*root,fvar(22)*0.92
scale = root,fvar(21)*2*0.92,root,fvar(22)*2*0.92
bindid = id
bindtime = -1
removetime = 34
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 18]
type = Explod
trigger1 = AnimElem = 9
anim = 13630
id = 13630
bindid = id
pos = 0*root,fvar(21)*0.92,0-500*root,fvar(22)*0.92
scale = root,fvar(21)*2.5*0.92,root,fvar(22)*2.5*0.92
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 19]
type = Explod
trigger1 = AnimElem = 9
anim = 13631
id = 13631
bindid = id
pos = 0*root,fvar(21)*0.92,0-500*root,fvar(22)*0.92
scale = root,fvar(21)*2.5*0.92,root,fvar(22)*2.5*0.92
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 20]
type = Explod
trigger1 = AnimElem = 9
anim = 13633
id = 13633
bindid = id
pos = 0*root,fvar(21)*0.92,0-500*root,fvar(22)*0.92
scale = root,fvar(21)*2.5*0.92,root,fvar(22)*2.5*0.92
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 21]
type = Explod
trigger1 = AnimElem = 9
anim = 13635
id = 13635
bindid = id
pos = 0*root,fvar(21)*0.92,0-500*root,fvar(22)*0.92
scale = root,fvar(21)*8*0.92,root,fvar(22)*8*0.92
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 22]
type = Explod
trigger1 = AnimElem = 9
anim = 13615
id = 13615
bindid = id
pos = 0+facing*300,0-500*root,fvar(22)*0.92
scale = root,fvar(21)*0.92,root,fvar(22)*0.92
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 23]
type = Explod
trigger1 = AnimElem = 9
anim = 13616
id = 13616
bindid = id
pos = 0+facing*300*root,fvar(21)*0.92,0-500*root,fvar(22)*0.92
scale = root,fvar(21)*0.92,root,fvar(22)*0.92
facing = facing
ownpal = 0
sprpriority = 0
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 24]
type = Explod
trigger1 = AnimElem = 9
anim = 13623
id = 13623
bindid = id
pos = 0+cond(facing = 1,4100,-4100)*root,fvar(21)*0.92,0-500*root,fvar(22)*0.92
scale = root,fvar(21)*20*0.92,root,fvar(22)*2.5*0.92
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 25]
type = Explod
trigger1 = AnimElem = 9
anim = 13623
id = 13623
bindid = id
pos = 0+cond(facing = 1,2100,-2100)*root,fvar(21)*0.92,0-500*root,fvar(22)*0.92
scale = root,fvar(21)*20*0.92,root,fvar(22)*2.5*0.92
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 26]
type = Explod
trigger1 = AnimElem = 9
anim = 13623
id = 13623
bindid = id
pos = 0*root,fvar(21)*0.92,0-500*root,fvar(22)*0.92
scale = root,fvar(21)*20*0.92,root,fvar(22)*2.5*0.92
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 27]
type = Explod
trigger1 = AnimElem = 9
anim = 13621
id = 13621
bindid = id
pos = 0+cond(facing = 1,4100,-4100)*root,fvar(21)*0.92,0-500*root,fvar(22)*0.92
scale = root,fvar(21)*10*0.92,root,fvar(22)*3.0*0.92
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 28]
type = Explod
trigger1 = AnimElem = 9
anim = 13621
id = 13621
bindid = id
pos = 0+cond(facing = 1,2100,-2100)*root,fvar(21)*0.92,0-500*root,fvar(22)*0.92
scale = root,fvar(21)*10*0.92,root,fvar(22)*3.0*0.92
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 29]
type = Explod
trigger1 = AnimElem = 9
anim = 13621
id = 13621
bindid = id
pos = 0*root,fvar(21)*0.92,0-500*root,fvar(22)*0.92
scale = root,fvar(21)*10*0.92,root,fvar(22)*3.0*0.92
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 30]
type = Explod
trigger1 = AnimElem = 9
anim = 13622
id = 13622
bindid = id
pos = 0+cond(facing = 1,4100,-4100)*root,fvar(21)*0.92,0-500*root,fvar(22)*0.92
scale = root,fvar(21)*10*0.92,root,fvar(22)*3.0*0.92
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 31]
type = Explod
trigger1 = AnimElem = 9
anim = 13622
id = 13622
bindid = id
pos = 0+cond(facing = 1,2100,-2100)*root,fvar(21)*0.92,0-500*root,fvar(22)*0.92
scale = root,fvar(21)*10*0.92,root,fvar(22)*3.0*0.92
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 32]
type = Explod
trigger1 = AnimElem = 9
anim = 13622
id = 13622
bindid = id
pos = 0*root,fvar(21)*0.92,0-500*root,fvar(22)*0.92
scale = root,fvar(21)*10*0.92,root,fvar(22)*3.0*0.92
facing = facing
ownpal = 0
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 33]
type = VarRandom
trigger1 = AnimElem = 9,>= 0
trigger1 = AnimElem = 9,< 80
trigger1 = AnimElemTime(9)%10 = 0 || AnimElemTime(9)%10 = 4
v = 43
range = -10,10
ignorehitpause = 1

[State 13600, 34]
type = VarRandom
trigger1 = AnimElem = 9,>= 0
trigger1 = AnimElem = 9,< 80
trigger1 = AnimElemTime(9)%10 = 0 || AnimElemTime(9)%10 = 4
v = 44
range = -300,300
ignorehitpause = 1

[State 13600, 35]
type = VarRandom
trigger1 = AnimElem = 9,>= 0
trigger1 = AnimElem = 9,< 80
trigger1 = AnimElemTime(9)%10 = 0 || AnimElemTime(9)%10 = 4
v = 45
range = -50,50
ignorehitpause = 1

[State 13600, 36]
type = Explod
trigger1 = AnimElem = 9,>= 0
trigger1 = AnimElem = 9,< 80
trigger1 = AnimElemTime(9)%10 = 0 || AnimElemTime(9)%10 = 4
anim = 13637
id = 13637
bindid = id
pos = (var(44))*(root,fvar(21))*0.92,(0-500+var(45))*(root,fvar(22))*0.92
scale = 4*(1+var(43)*0.01)*(root,fvar(21))*0.92,2.5*(1+var(43)*0.01)*(root,fvar(22))*0.92
vfacing = cond(animelemtime(9)%10 = 4,-1,1)
facing = facing
ownpal = 0
removeongethit = 1
sprpriority = cond(animelemtime(9)%10 = 4,0,7)
supermovetime = root,var(34)

[State 13600, 37]
type = Explod
trigger1 = AnimElem = 9,>= 0
trigger1 = AnimElem = 9,< 80
trigger1 = AnimElemTime(9)%10 = 0
anim = 13638
id = 13638
bindid = id
pos = (var(44))*(root,fvar(21))*0.92,(0-500+var(45))*(root,fvar(22))*0.92
scale = 4*(1+var(43)*0.01)*(root,fvar(21))*0.92,2.5*(1+var(43)*0.01)*(root,fvar(22))*0.92
vfacing = cond(animelemtime(9)%10 = 4,-1,1)
facing = facing
ownpal = 0
removeongethit = 1
sprpriority = cond(animelemtime(9)%10 = 4,0,7)
supermovetime = root,var(34)

[State 13600, 38]
type = Explod
trigger1 = AnimElem = 39
anim = 13601
id = 13601
pos = 0,0
bindid = id
bindtime = -1
scale = root,fvar(21)*0.92,root,fvar(22)*0.92
facing = facing
ownpal = 1
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 39]
type = Explod
trigger1 = AnimElem = 39
anim = 13603
id = 13601
pos = 0,0
bindid = id
bindtime = -1
scale = root,fvar(21)*0.92,root,fvar(22)*0.92
facing = facing
ownpal = 1
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 40]
type = Explod
trigger1 = AnimElem = 39
anim = 13605
id = 13601
pos = 0,0
bindid = id
bindtime = -1
scale = root,fvar(21)*0.92,root,fvar(22)*0.92
facing = facing
ownpal = 1
sprpriority = 7
removeongethit = 1
supermovetime = root,var(34)

[State 13600, 41]
type = PlaySnd
trigger1 = AnimElem = 1
value = s13600,0

[State 13600, 42 (Support Knight Voice)]
type = PlaySnd
trigger1 = AnimElem = 1
value = s13601,0+(random%3)
channel = 30
ignorehitpause = 1

[State 13600, 43]
type = PlaySnd
trigger1 = AnimElem = 9
value = s13600,1

[State 13600, 44]
type = PlaySnd
trigger1 = AnimElem = 9
value = s13600,2

[State 13600, 45]
type = VelSet
trigger1 = AnimElem = 9
x = -100

[State 13600, 46]
type = VelSet
trigger1 = AnimElem = 10
x = -10

[State 13600, 47]
type = VelAdd
trigger1 = AnimElem = 11,> 0
trigger1 = AnimElem = 15,<= 0
x = 0.5

[State 13600, 48]
type = VelAdd
trigger1 = AnimElem = 15,> 0
trigger1 = AnimElem = 19,<= 0
x = 0.1

[State 13600, 49]
type = VelAdd
trigger1 = AnimElem = 19,> 0
trigger1 = AnimElem = 23,<= 0
x = 0.02

[State 13600, 50 (To Next State 13610)]
type = ChangeState
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(8) < 5
trigger1 = Root,MoveType = H && (Root,StateNo != [120,155])
value = 13610

[State 13600, 51 (Helper Remove)]
type = DestroySelf
trigger1 = AnimTime = 0

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; Clone Pharsalia / Disappear
; 複製型法莎莉雅《複製型ファルサリア》 / 消失
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[Statedef 13610]
type = S
movetype = H
physics = S
ctrl = 0
sprpriority = 6

[State 13610, 1]
type = RemoveExplod
trigger1 = Time = 0
id = -1 ;消除Helper 13600相關的Explod

[State 13610, 2]
type = ChangeAnim
trigger1 = Time = 0
value = 13600
elem = 39

[State 13610, 3]
type = StopSnd
trigger1 = Time = 0
channel = 30
ignorehitpause = 1

[State 13610, 4]
type = VarSet
trigger1 = Time = 0
v = 36
value = 136

[State 13610, 5] ;淡出
type = VarAdd
trigger1 = Time > 0
v = 36
value = 12

[State 13610, 6]
type = BGPalFX
trigger1 = var(36)
time = 1
add = 0,0,0
mul = var(36),var(36),var(36)
sinadd = 0,0,0,10
invertall = 0
color = 256

[State 13610, 7]
type = Explod
trigger1 = Time = 0
anim = 13601
id = 13601
pos = 0,0
bindid = id
bindtime = -1
scale = root,fvar(21)*0.92,root,fvar(22)*0.92
facing = facing
ownpal = 1
sprpriority = 7
supermovetime = root,var(34)

[State 13610, 8]
type = Explod
trigger1 = Time = 0
anim = 13603
id = 13601
pos = 0,0
bindid = id
bindtime = -1
scale = root,fvar(21)*0.92,root,fvar(22)*0.92
facing = facing
ownpal = 1
sprpriority = 7
supermovetime = root,var(34)

[State 13610, 9]
type = Explod
trigger1 = Time = 0
anim = 13605
id = 13601
pos = 0,0
bindid = id
bindtime = -1
scale = root,fvar(21)*0.92,root,fvar(22)*0.92
facing = facing
ownpal = 1
sprpriority = 7
supermovetime = root,var(34)

[State 13610, 10 (Helper Remove)]
type = DestroySelf
trigger1 = Time >= 10
recursive = 1
removeexplods = 1

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; Attack Laser
; 攻擊雷射(激光)
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[Statedef 13650]
type = S
movetype = A
physics = N
anim = 99990
ctrl = 0
juggle = 6
sprpriority = 6 ;因為該動畫圖為透明 所以無需添加ignorehitpause = 1
hitdefpersist = 0
movehitpersist = 0
hitcountpersist = 1

[State 13650, 1]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
ignorehitpause = 1

[State 13650, 2]
type = HitBy
trigger1 = 1
value =
ignorehitpause = 1

[State 13650, 3]
type = HitDef
trigger1 = MoveContact = 0 || MoveContact > 3
attr = A, HP
animtype = Hard
air.animtype = Hard
hitflag = MAFDP
guardflag = MA
priority = 6, Hit
damage = cond(root,var(15) > 0,ceil((((root,fvar(11))*root,fvar(12)*0.010))*root,fvar(13)),10*root,fvar(13)),cond(root,var(15) > 0,ceil((((root,fvar(11))*root,fvar(12)*0.002))*root,fvar(13)),2*root,fvar(13))
getpower = 0,0
givepower = -3,-5
pausetime = 0,2
guard.pausetime = 0,2
sparkno = s7203
guard.sparkno = s7303
sparkxy = cond(p2dist x < 0,0,cond(p2dist x < 0,p2dist x,0)),-150*root,fvar(22)+random%400
hitsound = -1
guardsound = -1
ground.type = High
air.type = High
ground.velocity = -0.24,0
ground.slidetime = 45
ground.hittime = 45
guard.velocity = -32
guard.slidetime = 25
guard.hittime = 25
guard.ctrltime = 25
p2facing = 1
air.velocity = -4,-2
airguard.velocity = -24,-15
airguard.ctrltime = 45
air.hittime = 45
fall = 0
air.fall = 1
fall.recover = 1
ground.cornerpush.veloff = 0
palfx.time = 60
palfx.add = 0,50,240
palfx.mul = 120,224,150
palfx.sinadd = 20,30,60,30
guard.dist = 6240 ;*1
id = 13650

[State 13650, 4 (Ice Element Hit Spark Effect)]
type = Explod
triggerall = NumExplod(7857) = 0
triggerall = NumTarget(13650)
trigger1 = (Target(13650),StateNo != [120,159])
trigger1 = Target(13650),StateType != L
trigger1 = Target(13650),MoveType = H
trigger1 = MoveHit >= 1
anim = 7857
id = 7857
space = stage
bindid = target,id
bindtime = -1
pos = 0,const(size.mid.pos.y)
facing = facing
sprpriority = 1
removetime = 24
ownpal = 1 ;上面的remappal要有效，請記得將ownpal設定為1
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
removeongethit = 1
ignorehitpause = 1
persistent = 1

[State 13650, 5]
type = PlaySnd
trigger1 = MoveHit = 1
trigger1 = HitCount = 1
value = s13650,0

[State 13650, 6]
type = PlaySnd
trigger1 = MoveHit = 1
value = s13650,11+(random%2)

[State 13650, 7]
type = PlaySnd
trigger1 = MoveHit = 1
value = s13650,20

[State 13650, 8]
type = PlaySnd
trigger1 = moveguarded = 1
value = s13650,30

[State 13650, 9 (Helper Remove)]
type = DestroySelf
trigger1 = Parent,AnimElemTime(32) >= 0
trigger2 = Parent,NumExplod(13621) = 0
trigger3 = Root,MoveType = H

;*1 因為招式的攻擊範圍較廣(攻擊框範圍6240)，所以設置guard.dist
;   避免AI在較遠距離無法防禦該招式。

;===========================================================================
; Background Controller / Knight Card A
; 背景控制器 / 騎士卡牌A
;===========================================================================
[Statedef 22600]
type = S
movetype = I
physics = N
ctrl = 0
anim = 99999
velset = 0,0
sprpriority = 0

[State 22600, 1]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = NoShadow

[State 22600, 2]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT

[State 22600, 3]
type = VarSet
trigger1 = Time = 0
v = 46
value = 256 ;用於色碼數值(最大值)

[State 22600, 4] ;淡入
type = VarAdd
trigger1 = var(47) = 0
trigger1 = var(46) > 1
v = 46
value = -6 ;負數將扣除上面的256數值(會讓顏色愈來愈深)

[State 22600, 5]
type = VarSet
trigger1 = var(46) < 196 ;色碼最低數值(愈低顏色愈深 256-(6*10) = 196數值 10為ticks時間)
v = 47
value = 1

[State 22600, 6] ;淡出
type = VarAdd
trigger1 = var(47) = 1
trigger1 = var(46) <= 256 ;小於色碼數值最大值時
trigger1 = Time > 73 ;73數值取自於Helper消滅時間83 83跟73之間剛好10ticks時間差
v = 46
value = 6 ;正數將增加上面的128數值(會讓顏色愈來愈淺)

[State 22600, 7]
type = BGPalFX
trigger1 = var(46)
time = 1
add = 0,0,0
mul = var(46),var(46),var(46)
sinadd = 0,0,0,10
invertall = 0
color = 256

[State 22600, 8 (Helper Remove)]
type = DestroySelf
trigger1 = Time >= 83 ;結束ticks時間
trigger2 = Root,MoveType = H

;===========================================================================
; Background Controller / Knight Card B
; 背景控制器 / 騎士卡牌B
;===========================================================================
[Statedef 22800]
type = S
movetype = I
physics = N
ctrl = 0
anim = 99999
velset = 0,0
sprpriority = 0

[State 22800, 1]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = NoShadow

[State 22800, 2]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT

[State 22800, 3]
type = VarSet
trigger1 = Time = 0
v = 46
value = 256

[State 22800, 4]
type = VarAdd
trigger1 = var(47) = 0
trigger1 = var(46) > 1
v = 46
value = -6

[State 22800, 5]
type = VarSet
trigger1 = var(46) < 196
v = 47
value = 1

[State 22800, 6]
type = VarAdd
trigger1 = var(47) = 1
trigger1 = var(46) <= 256
trigger1 = Time > 76
v = 46
value = 6

[State 22800, 7]
type = BGPalFX
trigger1 = var(46)
time = 1
add = 0,0,0
mul = var(46),var(46),var(46)
sinadd = 0,0,0,10
invertall = 0
color = 256

[State 22800, 8 (Helper Remove)]
type = DestroySelf
trigger1 = Time >= 86
trigger2 = Root,MoveType = H

;===========================================================================
; Hyakka Light Bullet Spear / Paragraph 1 Attack Judgment
; 百花光弾槍 / 第一段攻擊判定
;===========================================================================
[Statedef 23201]
type = S
movetype = A
physics = S
ctrl = 0
juggle = 1
sprpriority = 2

[State 23201, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 3201

[State 23201, 2]
type = AssertSpecial
trigger1 = 1
flag = Invisible ;測試過不會讓Statedef裡的Explod隱形
flag = NoShadow
flag2 = TimerFreeze
ignorehitpause = 1

[State 23201, 3]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1
ignorehitpause = 1

[State 23201, 4]
type = HitBy
trigger1 = 1
value = 
time = 1
ignorehitpause = 1

[State 23201, 5]
type = BindToRoot
trigger1 = 1
time = 1
facing = 1 ;*
pos = 0,0
ignorehitpause = 1

;*如果facing_flag是-1,在綁定期間使玩家總是朝著根級相反的方向.
; 如果facing_flag是1,在綁定期間使玩家總是朝著根級相同的方向.
; 如果facing_flag是0,在綁定期間無論根級的朝向如何玩家不會轉向.默認為0.

[State 23201, 6]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
statetype = A
movetype = A
physics = N

[State 23201, 7 (Hyakka Light Bullet Spear A)]
type = Explod
triggerall = NumExplod(17446) = 0
trigger1 = AnimElemTime(5) = 0
anim = 7446
id = 17446
;space = stage
pos = cond(facing = 1,0,-0)*root,fvar(21),0*root,fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,4
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 3
removetime = 3
removeongethit = 1
ignorehitpause = 0

[State 23201, 8 (Hyakka Light Bullet Spear A Subtraction)]
type = Explod
triggerall = NumExplod(17447) = 0
trigger1 = AnimElemTime(5) = 0
anim = 7447
id = 17447
;space = stage
pos = cond(facing = 1,0,-0)*root,fvar(21),0*root,fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 3
removetime = 3
removeongethit = 1
ignorehitpause = 0

[State 23201, 9]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 7
trigger1 = 1 || var(21):= 480 ;Hit Spark X
trigger1 = 1 || var(22):= -200 ;Hit Spark Y
trigger1 = 1 || var(23):= 7250 ;Hit Spark ID
trigger1 = 1 || var(24):= 7315 ;Guard Spark ID
trigger1 = 1 || var(25):= 18 ;Hit Spark Angle
trigger1 = 1 || var(36):= 23201 ;HitDef ID
attr = A, HA
damage = cond(root,var(15) > 0,ceil((((root,fvar(11))*root,fvar(12)*0.135))*root,fvar(13)),135*root,fvar(13)),cond(root,var(15) > 0,ceil((((root,fvar(11))*root,fvar(12)*0.035))*root,fvar(13)),35*root,fvar(13))
hitflag = MAFDP
guardflag = HA
priority = 7, Hit
pausetime = 0,5 ;左側數值必須設定0 否則Helper會因為攻擊暫停而無法跟本體同步 (在同一個Anim動畫)
;guard.pausetime = 0,5 ;默譇值跟pausetime相同
sparkno = -1
guard.sparkno = -1
getpower = 0,0
givepower = 0,0
hitsound = s7,4
guardsound = s8,2
animtype = Hard
ground.type = High
ground.slidetime = 30
ground.hittime = 30
guard.slidetime = 30
guard.hittime = 30
ground.velocity = -15
air.animtype = Hard
air.type = High
air.velocity = -10,-20
air.hittime = 30
airguard.ctrltime = 30
air.fall = 1
guard.dist = 1100
p2facing = 1
kill = 0
guard.kill = 0
numhits = 0
id = 23201

[State 23201, 10 (Hyakka Light Bullet Spear A2)]
type = Explod
triggerall = NumExplod(17448) = 0
trigger1 = AnimElemTime(6) = 0
anim = 7448
id = 17448
;space = stage
pos = cond(facing = 1,0,-0)*root,fvar(21),0*root,fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,4
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 3
removetime = 9
removeongethit = 1
ignorehitpause = 0

[State 23201, 11 (Hyakka Light Bullet Spear A2 Subtraction)]
type = Explod
triggerall = NumExplod(17449) = 0
trigger1 = AnimElemTime(6) = 0
anim = 7449
id = 17449
;space = stage
pos = cond(facing = 1,0,-0)*root,fvar(21),0*root,fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 3
removetime = 9
removeongethit = 1
ignorehitpause = 0

[State 23201, 12 (Hit Spark)]
type = Helper
trigger1 = MoveHit = 1
trigger1 = NumHelper(var(23)) < 1
name = "Hit Spark Effect"
id = var(23)
stateno = var(23)
pos = cond(p2dist x < (cond(var(21) < 0,var(21),0)),(cond(var(21) < 0,var(21),0)),cond(p2dist x < (cond(var(21) < 0,0,var(21))),ceil(p2dist x),(cond(var(21) < 0,0,var(21))))),var(22) ;依據P2距離改變打擊火花X軸位置
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1 ;必須要無視攻擊暫停 否則打擊火花會無法正常顯示

[State 23201, 13 (Hit Spark)]
type = VarSet
trigger1 = !HitDefAttr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
v = 23
value = 0
ignorehitpause = 1

[State 23201, 14 (Guard Spark)]
type = Helper
trigger1 = MoveGuarded = 1
trigger1 = NumHelper(var(24)) < 1
name = "Guard Spark Effect"
id = var(24)
stateno = var(24)
pos = cond(p2dist x < (cond(var(21) < 0,var(21),0)),(cond(var(21) < 0,var(21),0)),cond(p2dist x < (cond(var(21) < 0,0,var(21))),ceil(p2dist x),(cond(var(21) < 0,0,var(21))))),var(22)
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1 ;必須要無視攻擊暫停 否則防禦火花會無法正常顯示

[State 23201, 15 (Guard Spark)]
type = VarSet
trigger1 = !HitDefAttr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
v = 24
value = 0
ignorehitpause = 1

[State 23201, 16 (Helper Remove)]
type = DestroySelf
trigger1 = AnimElemTime(6) >= 6
trigger2 = Root,MoveType = H
removeexplods = 1

;===========================================================================
; Hyakka Light Bullet Spear / Paragraph 2 Attack Judgment A
; 百花光弾槍 / 第二段攻擊判定A
;===========================================================================
[Statedef 23202]
type = S
movetype = A
physics = N
ctrl = 0
juggle = 1
sprpriority = 2

[State 23202, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 3202

[State 23202, 2]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = NoShadow
flag3 = TimerFreeze
ignorehitpause = 1

[State 23202, 3]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1
ignorehitpause = 1

[State 23202, 4]
type = HitBy
trigger1 = 1
value = 
time = 1
ignorehitpause = 1

[State 23202, 5]
type = BindToRoot
trigger1 = 1
time = 1
facing = 1 ;*
pos = 0,0
ignorehitpause = 1

[State 23202, 6]
type = Null;Width
trigger1 = AnimElemTime(2) >= 0
player = 150,0
ignorehitpause = 1

[State 23202, 7 (Hyakka Light Bullet Spear B)]
type = Explod
triggerall = NumExplod(17410) = 0
trigger1 = AnimElemTime(2) = 0
anim = 7410
id = 17410
;space = stage
pos = cond(facing = 1,0,0)*root,fvar(21),0*root,fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,4
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 3
removetime = 8
removeongethit = 1
ignorehitpause = 0

[State 23202, 8 (Hyakka Light Bullet Spear B Subtraction)]
type = Explod
triggerall = NumExplod(17411) = 0
trigger1 = AnimElemTime(2) = 0
anim = 7411
id = 17411
;space = stage
pos = cond(facing = 1,0,0)*root,fvar(21),0*root,fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 3
removetime = 8
removeongethit = 1
ignorehitpause = 0

[State 23202, 9]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElem = 3
trigger1 = 1 || var(21):= 440 ;Hit Spark X
trigger1 = 1 || var(22):= -490 ;Hit Spark Y
trigger1 = 1 || var(23):= 7200 ;Hit Spark ID
trigger1 = 1 || var(24):= 7305 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 23202 ;HitDef ID
attr = S, HA
animtype = Light
hitflag = MAFDP
guardflag = MA
damage = cond(root,var(15) > 0,ceil((((root,fvar(11))*root,fvar(12)*0.020))*root,fvar(13)),20*root,fvar(13)),cond(root,var(15) > 0,ceil((((root,fvar(11))*root,fvar(12)*0.005))*root,fvar(13)),5*root,fvar(13))
priority = 7, Hit
pausetime = 0,5 ;左側數值必須設定0 否則Helper會因為攻擊暫停而無法跟本體同步 (在同一個Anim動畫)
sparkno = -1
guard.sparkno = -1
getpower = 0,0
givepower = 0,0
hitsound = s7,2
guardsound = s8,1
ground.type = High
ground.slidetime = 23
ground.hittime = 23
guard.slidetime = 23
guard.ctrltime = 23
guard.hittime = 23
ground.velocity = -32
guard.velocity = -32
air.animtype = Light
air.type = High
air.velocity = -21,-7
airguard.velocity = -23,-6.5
air.hittime = 23
airguard.ctrltime = 23
air.fall = 1
guard.dist = 850
p2facing = 1
kill = 0
guard.kill = 0
numhits = 0
id = 23202

[State 23202, 10 (Hit Spark)]
type = Helper
trigger1 = MoveHit = 1
trigger1 = NumHelper(var(23)) < 1
name = "Hit Spark Effect"
id = var(23)
stateno = var(23)
pos = cond(p2dist x < (cond(var(21) < 0,var(21),0)),(cond(var(21) < 0,var(21),0)),cond(p2dist x < (cond(var(21) < 0,0,var(21))),ceil(p2dist x),(cond(var(21) < 0,0,var(21))))),var(22) ;依據P2距離改變打擊火花X軸位置
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1 ;必須要無視攻擊暫停 否則打擊火花會無法正常顯示

[State 23202, 11 (Hit Spark)]
type = VarSet
trigger1 = !HitDefAttr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
v = 23
value = 0
ignorehitpause = 1

[State 23202, 12 (Guard Spark)]
type = Helper
trigger1 = MoveGuarded = 1
trigger1 = NumHelper(var(24)) < 1
name = "Guard Spark Effect"
id = var(24)
stateno = var(24)
pos = cond(p2dist x < (cond(var(21) < 0,var(21),0)),(cond(var(21) < 0,var(21),0)),cond(p2dist x < (cond(var(21) < 0,0,var(21))),ceil(p2dist x),(cond(var(21) < 0,0,var(21))))),var(22)
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1 ;必須要無視攻擊暫停 否則防禦火花會無法正常顯示

[State 23202, 13 (Guard Spark)]
type = VarSet
trigger1 = !HitDefAttr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
v = 24
value = 0
ignorehitpause = 1

[State 23202, 14 (Helper Remove)]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Root,MoveType = H
removeexplods = 1

;===========================================================================
; Hyakka Light Bullet Spear / Paragraph 2 Attack Judgment B
; 百花光弾槍 / 第二段攻擊判定B
;===========================================================================
[Statedef 23203]
type = S
movetype = A
physics = S
ctrl = 0
juggle = 1
sprpriority = 2

[State 23203, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 3203

[State 23203, 2]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = NoShadow
flag3 = TimerFreeze
ignorehitpause = 1

[State 23203, 3]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1
ignorehitpause = 1

[State 23203, 4]
type = HitBy
trigger1 = 1
value = 
time = 1
ignorehitpause = 1

[State 23203, 5]
type = BindToRoot
trigger1 = 1
time = 1
facing = 1 ;*
pos = 0,0
ignorehitpause = 1

[State 23203, 6 (Hyakka Light Bullet Spear C)]
type = Explod
triggerall = NumExplod(17426) = 0
trigger1 = AnimElemTime(2) = 0
anim = 7422
id = 17426
;space = stage
pos = cond(facing = 1,24,-24)*root,fvar(21),-8*root,fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,4
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 3
removetime = 8
removeongethit = 1
ignorehitpause = 0

[State 23203, 7 (Hyakka Light Bullet Spear C Subtraction)]
type = Explod
triggerall = NumExplod(17427) = 0
trigger1 = AnimElemTime(2) = 0
anim = 7423
id = 17427
;space = stage
pos = cond(facing = 1,24,-24)*root,fvar(21),-8*root,fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 3
removetime = 8
removeongethit = 1
ignorehitpause = 0

[State 23203, 8]
type = HitDef
triggerall = !MoveContact && !MoveReversed 
trigger1 = AnimElem = 3
trigger1 = 1 || var(21):= 520 ;Hit Spark X
trigger1 = 1 || var(22):= -400 ;Hit Spark Y
trigger1 = 1 || var(23):= 7236 ;Hit Spark ID
trigger1 = 1 || var(24):= 7310 ;Guard Spark ID
trigger1 = 1 || var(25):= 110 ;Hit Spark Angle
trigger1 = 1 || var(36):= 23203 ;HitDef ID
attr = S, HA
damage = cond(root,var(15) > 0,ceil((((root,fvar(11))*root,fvar(12)*0.020))*root,fvar(13)),20*root,fvar(13)),cond(root,var(15) > 0,ceil((((root,fvar(11))*root,fvar(12)*0.005))*root,fvar(13)),5*root,fvar(13))
animtype = Medium
hitflag = MAFDP
guardflag = MA
priority = 7, Hit
pausetime = 0,5 ;左側數值必須設定0 否則Helper會因為攻擊暫停而無法跟本體同步 (在同一個Anim動畫)
sparkno = -1
guard.sparkno = -1
getpower = 0,0
givepower = 0,0
hitsound = s7,4
guardsound = s8,2
ground.type = Low
ground.slidetime = 23
ground.hittime = 23
guard.slidetime = 23
guard.hittime = 23
guard.ctrltime = 23
ground.velocity = -42
guard.velocity = -42
air.animtype = Medium
air.type = Low
air.velocity = -23,-7.2
airguard.velocity = -26.5,-6.7
air.hittime = 23
airguard.ctrltime = 23
air.fall = 1
fall.recover = 0
guard.dist = 850
p2facing = 1
kill = 0
guard.kill = 0
numhits = 0
id = 23203

[State 23203, 9 (Hit Spark)]
type = Helper
trigger1 = MoveHit = 1
trigger1 = NumHelper(var(23)) < 1
name = "Hit Spark Effect"
id = var(23)
stateno = var(23)
pos = cond(p2dist x < (cond(var(21) < 0,var(21),0)),(cond(var(21) < 0,var(21),0)),cond(p2dist x < (cond(var(21) < 0,0,var(21))),ceil(p2dist x),(cond(var(21) < 0,0,var(21))))),var(22) ;依據P2距離改變打擊火花X軸位置
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1 ;必須要無視攻擊暫停 否則打擊火花會無法正常顯示

[State 23203, 10 (Hit Spark)]
type = VarSet
trigger1 = !HitDefAttr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
v = 23
value = 0
ignorehitpause = 1

[State 23203, 11 (Guard Spark)]
type = Helper
trigger1 = MoveGuarded = 1
trigger1 = NumHelper(var(24)) < 1
name = "Guard Spark Effect"
id = var(24)
stateno = var(24)
pos = cond(p2dist x < (cond(var(21) < 0,var(21),0)),(cond(var(21) < 0,var(21),0)),cond(p2dist x < (cond(var(21) < 0,0,var(21))),ceil(p2dist x),(cond(var(21) < 0,0,var(21))))),var(22)
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1 ;必須要無視攻擊暫停 否則防禦火花會無法正常顯示

[State 23203, 12 (Guard Spark)]
type = VarSet
trigger1 = !HitDefAttr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
v = 24
value = 0
ignorehitpause = 1

[State 23203, 13 (Helper Remove)]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Root,MoveType = H
removeexplods = 1

;===========================================================================
; Hyakka Light Bullet Spear / Paragraph 2 Attack Judgment C
; 百花光弾槍 / 第二段攻擊判定C
;===========================================================================
[Statedef 23204]
type = S
movetype = A
physics = N
ctrl = 0
juggle = 1
sprpriority = 2

[State 23204, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 3204

[State 23204, 2]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = NoShadow
flag3 = TimerFreeze
ignorehitpause = 1

[State 23204, 3]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1
ignorehitpause = 1

[State 23204, 4]
type = HitBy
trigger1 = 1
value = 
time = 1
ignorehitpause = 1

[State 23204, 5]
type = BindToRoot
trigger1 = 1
time = 1
facing = 1 ;*
pos = 0,0
ignorehitpause = 1

[State 23204, 6 (Hyakka Light Bullet Spear D)]
type = Explod
triggerall = NumExplod(17410) = 0
trigger1 = AnimElemTime(1) = 0
anim = 7410
id = 17410
;space = stage
pos = cond(facing = 1,0,0)*root,fvar(21),0*root,fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,4
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 3
removetime = 8
removeongethit = 1
ignorehitpause = 0

[State 23204, 7 (Hyakka Light Bullet Spear D Subtraction)]
type = Explod
triggerall = NumExplod(17411) = 0
trigger1 = AnimElemTime(1) = 0
anim = 7411
id = 17411
;space = stage
pos = cond(facing = 1,0,0)*root,fvar(21),0*root,fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = root,fvar(21)*2.00,root,fvar(22)*2.00
sprpriority = 3
removetime = 8
removeongethit = 1
ignorehitpause = 0

[State 23204, 8]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElem = 2
trigger1 = 1 || var(21):= 440 ;Hit Spark X
trigger1 = 1 || var(22):= -490 ;Hit Spark Y
trigger1 = 1 || var(23):= 7200 ;Hit Spark ID
trigger1 = 1 || var(24):= 7300 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 23204 ;HitDef ID
attr = S, HA
animtype = Light
hitflag = MAFDP
guardflag = MA
damage = cond(root,var(15) > 0,ceil((((root,fvar(11))*root,fvar(12)*0.020))*root,fvar(13)),20*root,fvar(13)),cond(root,var(15) > 0,ceil((((root,fvar(11))*root,fvar(12)*0.005))*root,fvar(13)),5*root,fvar(13))
priority = 7, Hit
pausetime = 0,5 ;左側數值必須設定0 否則Helper會因為攻擊暫停而無法跟本體同步 (在同一個Anim動畫)
sparkno = -1
guard.sparkno = -1
getpower = 0,0
givepower = 0,0
hitsound = s7,2
guardsound = s8,1
ground.type = High
ground.slidetime = 25
ground.hittime = 25
guard.slidetime = 25
guard.ctrltime = 25
guard.hittime = 25
ground.velocity = -24
guard.velocity = -24
air.animtype = Light
air.type = High
air.velocity = -13,-7
airguard.velocity = -15,-6.5
air.hittime = 25
airguard.ctrltime = 25
air.fall = 1
guard.dist = 850
p2facing = 1
kill = 0
guard.kill = 0
numhits = 0
id = 23204

[State 23204, 9 (Hit Spark)]
type = Helper
trigger1 = MoveHit = 1
trigger1 = NumHelper(var(23)) < 1
name = "Hit Spark Effect"
id = var(23)
stateno = var(23)
pos = cond(p2dist x < (cond(var(21) < 0,var(21),0)),(cond(var(21) < 0,var(21),0)),cond(p2dist x < (cond(var(21) < 0,0,var(21))),ceil(p2dist x),(cond(var(21) < 0,0,var(21))))),var(22) ;依據P2距離改變打擊火花X軸位置
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1 ;必須要無視攻擊暫停 否則打擊火花會無法正常顯示

[State 23204, 10 (Hit Spark)]
type = VarSet
trigger1 = !HitDefAttr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
v = 23
value = 0
ignorehitpause = 1

[State 23204, 11 (Guard Spark)]
type = Helper
trigger1 = MoveGuarded = 1
trigger1 = NumHelper(var(24)) < 1
name = "Guard Spark Effect"
id = var(24)
stateno = var(24)
pos = cond(p2dist x < (cond(var(21) < 0,var(21),0)),(cond(var(21) < 0,var(21),0)),cond(p2dist x < (cond(var(21) < 0,0,var(21))),ceil(p2dist x),(cond(var(21) < 0,0,var(21))))),var(22)
postype = p1
facing = 1
ownpal = 1
ignorehitpause = 1 ;必須要無視攻擊暫停 否則防禦火花會無法正常顯示

[State 23204, 12 (Guard Spark)]
type = VarSet
trigger1 = !HitDefAttr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
v = 24
value = 0
ignorehitpause = 1

[State 23204, 13 (Helper Remove)]
type = DestroySelf
trigger1 = MoveContact && AnimElemTime(4) >= 3 || MoveContact = 0 && AnimTime = 0
trigger2 = Root,MoveType = H
removeexplods = 1

;===========================================================================
; Hyakka Light Bullet Spear / Camera Effect A
; 百花光弾槍 / 攝影機(畫面鏡頭)效果A
;===========================================================================
[Statedef 23206]
type = A
movetype = I
physics = N
velset = 0,0
ctrl = 0
juggle = 0
sprpriority = 2

[State 23206, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 3206

[State 23206, 2]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = TimerFreeze
flag3 = NoBarDisplay

[State 23206, 3]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,1

[State 23206, 4]
type = Width
trigger1 = 1
edge = 782*(floor(root,const(size.xscale))),198*(floor(root,const(size.xscale))) ;*

;*設置玩家前後的Edge寬度 Edge寬度決定了玩家能有多接近屏幕的邊緣 (可讓必殺技盡量靠近畫面中央使用)
; 設定參考 https://w.atwiki.jp/mugencns/pages/50.html

[State 23206, 5]
type = TargetBind
trigger1 = 1
time = 1
pos = 0,0

[State 23206, 6]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1

[State 23206, 7]
type = HitBy
trigger1 = 1
value =
time = 1

[State 23206, 8]
type = Zoom
;triggerall = TeamMode != Simul
trigger1 = AnimElem = 1,>= 0
trigger1 = AnimElem = 1,< 6
trigger1 = CameraZoom < 1.2
scale = (1+(1.2/camerazoom-1)/7*(animelemtime(1)+1))
pos = pos x/(1+(1.2/camerazoom-1)/7*(animelemtime(1)+1))*camerazoom,0

[State 23206, 9]
type = Zoom
;triggerall = TeamMode != Simul
trigger1 = AnimElem = 1,>= 6
trigger1 = AnimElem = 5,< 44
trigger1 = CameraZoom < 1.2
scale = 1.2/camerazoom
pos = pos x/(1.2/camerazoom)*camerazoom,0

[State 23206, 10]
type = Zoom
;triggerall = TeamMode != Simul
trigger1 = AnimElem = 5,>= 44
trigger1 = AnimElem = 5,< 50
trigger1 = CameraZoom < 1.2
scale = (1.2/camerazoom-(1.2/camerazoom-1)/7*(animelemtime(5)-43))
pos = pos x/(1.2/camerazoom-(1.2/camerazoom-1)/7*(animelemtime(5)-43))*camerazoom,0

[State 23206, 11 (Helper Remove)]
type = DestroySelf
trigger1 = Root,MoveType = H
trigger2 = Root,StateNo != 3206

[State 23206, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 23207
ctrl = 0

;===========================================================================
; Hyakka Light Bullet Spear / Camera Effect A2
; 百花光弾槍 / 攝影機(畫面鏡頭)效果A2
;===========================================================================
[Statedef 23207]
type = A
movetype = I
physics = N
velset = 0,0
ctrl = 0
juggle = 0
sprpriority = 2

[State 23207, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 3207

[State 23207, 2]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = TimerFreeze
flag3 = NoBarDisplay

[State 23207, 3]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,1

[State 23207, 4]
type = Width
trigger1 = 1
edge = 782*(floor(root,const(size.xscale))),198*(floor(root,const(size.xscale)))

[State 23207, 5]
type = TargetBind
trigger1 = 1
time = 1
pos = 0,0

[State 23207, 6]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1

[State 23207, 7]
type = HitBy
trigger1 = 1
value =
time = 1

[State 23207, 8 (Helper Remove)]
type = DestroySelf
trigger1 = Root,MoveType = H
trigger2 = Root,StateNo != 3207

[State 23207, 9]
type = ChangeState
trigger1 = AnimTime = 0
value = 23208
ctrl = 0

;===========================================================================
; Hyakka Light Bullet Spear / Camera Effect A3
; 百花光弾槍 / 攝影機(畫面鏡頭)效果A3
;===========================================================================
[Statedef 23208]
type = A
movetype = I
physics = N
ctrl = 0
juggle = 0
sprpriority = 2

[State 23208, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 3208

[State 23208, 2]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = TimerFreeze
flag3 = NoBarDisplay

[State 23208, 3]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,1

[State 23208, 4]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1

[State 23208, 5]
type = HitBy
trigger1 = 1
value =
time = 1

[State 23208, 6]
type = VelSet
trigger1 = AnimElemTime(1) = 4
x = 40
y = -36

[State 23208, 7 (Black Screen Fade In] ;黑色背景淡入
type = AllPalFX ;全畫面
trigger1 = AnimElemTime(2) >= 0
time = 1
add = 0,0,0
mul = 256-((time-40)*32),256-((time-40)*32),256-((time-40)*32)

[State 23208, 8 (Helper Remove)]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Root,MoveType = H
trigger3 = Root,StateNo != 3208

;[State 23207, 9]
;type = ChangeState
;trigger1 = AnimTime = 0
;value = 23209
;ctrl = 0

;===========================================================================
; Hyakka Light Bullet Spear / Camera Effect B
; 百花光弾槍 / 攝影機(畫面鏡頭)效果B
;===========================================================================
[Statedef 23209]
type = A
movetype = I
physics = N
ctrl = 0
juggle = 0
sprpriority = 2

[State 23209, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 3209

[State 23209, 2]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = TimerFreeze
flag3 = NoBarDisplay

[State 23209, 3]
type = AssertSpecial
trigger1 = 1
flag = NoBG
flag2 = NoFG
flag3 = NoAutoTurn

[State 23209, 4]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,1

[State 23209, 5]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1

[State 23209, 6]
type = HitBy
trigger1 = 1
value =
time = 1

[State 23209, 7]
type = TargetBind
trigger1 = 1
time = 1
pos = 0,0

[State 23209, 8 (Black Screen Fade Out] ;黑色背景淡入
type = AllPalFX ;全畫面
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(1) < 9
time = 1
add = 0,0,0
mul = 0+(time*32),0+(time*32),0+(time*32)

[State 23209, 9 (Black Background)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 10098
id = 10006
space = screen
facing = 1
pos = 0,0
scale = screenwidth/1920*320.00,screenheight/1080*180.00
ownpal = 1
removetime = 161
;supermovetime = 161
;pausemovetime = 161
sprpriority = 998

[State 23209, 10 (Hyakka Light Bullet Spear Animation)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = cond(facing = 1,10006,10007)
id = 10006
space = screen
facing = 1
pos = 0,0
scale = screenwidth/1920*2.00,screenheight/1080*2.00
ownpal = 1
removetime = 161
;supermovetime = 161
;pausemovetime = 161
sprpriority = 999

[State 23209, 11 (White Screen Fade Out] ;白色背景淡入
type = AllPalFX ;全畫面
trigger1 = AnimElemTime(6) >= 0
time = 1
add = 0+((time-145)*16),0+((time-145)*16),0+((time-145)*16)
mul = 256,256,256

[State 23209, 12 (Helper Remove)]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Root,MoveType = H

;===========================================================================
; Hyakka Light Bullet Spear / Camera Effect B2
; 百花光弾槍 / 攝影機(畫面鏡頭)效果B2
;===========================================================================
[Statedef 23210]
type = A
movetype = I
physics = N
ctrl = 0
juggle = 0
sprpriority = 2

[State 23210, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 3210

[State 23210, 2]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = TimerFreeze
flag3 = NoBarDisplay

[State 23210, 3]
type = AssertSpecial
trigger1 = 1
flag = NoBG
flag2 = NoFG
flag3 = NoAutoTurn

[State 23210, 4]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,1

[State 23210, 5 (Hyakka Light Bullet Spear Background A)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = cond(facing = 1,10032,10033)
id = 10032
space = screen
facing = 1
pos = 0,0
scale = screenwidth/1920*2.00,screenheight/1080*2.00
ownpal = 1
removetime = 45
;supermovetime = 45
;pausemovetime = 45
sprpriority = 999

[State 23210, 6 (Helper Remove)]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Root,MoveType = H

;===========================================================================
; Hyakka Light Bullet Spear / Camera Effect B3
; 百花光弾槍 / 攝影機(畫面鏡頭)效果B3
;===========================================================================
[Statedef 23211]
type = A
movetype = I
physics = N
ctrl = 0
juggle = 0
velset = 0,0
sprpriority = 2

[State 23211, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 3211

[State 23211, 2]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = TimerFreeze
flag3 = NoBarDisplay

[State 23211, 3]
type = AssertSpecial
trigger1 = 1
flag = NoBG
flag2 = NoFG
flag3 = NoAutoTurn

[State 23211, 4]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,1

[State 23211, 5 (Moves Screen Zoom Start)]
type = Zoom
trigger1 = 1
scale = cond(camerazoom >= 1.0,1.0,(camerazoom-camerazoom)+1.0)/camerazoom
pos = 0,0

[State 23211, 6 (White Screen Fade In] ;白色背景淡入
type = AllPalFX ;全畫面
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
time = 1
add = 256-((time)*16),256-((time)*16),256-((time)*16)
mul = 256,256,256

[State 23211, 7 (Hyakka Light Bullet Spear Background B Low Sprpriority)] ;百花光彈槍背景B (低圖片優先級)
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = cond(facing = 1,10034,10035)
id = 10034
space = screen
facing = 1
pos = 0,0 ;cond(facing = 1,0,960),0 ;改為在AnimElem上調整
scale = screenwidth/1920*2.00,screenheight/1080*2.00
ownpal = 1
removetime = 200
;supermovetime = 200
;pausemovetime = 200
sprpriority = -5 ;背景在人物後方(在畫面下層 當一般背景用)

[State 23211, 8 (Black Background)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 10098
id = 10006
space = screen
facing = 1
pos = 0,0
scale = screenwidth/1920*320.00,screenheight/1080*180.00
ownpal = 1
removetime = 200
;supermovetime = 200
;pausemovetime = 200
sprpriority = -5 ;相同的sprpriority情況下 寫在下面的背景會被上面的背景蓋住 (正數時則是相反)

[State 23211, 9 (Hyakka Light Bullet Spear Background B Higt Sprpriority)] ;百花光彈槍背景B (高圖片優先級 用於覆蓋目標對手)
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = cond(facing = 1,10034,10035)
id = 10034
space = screen
facing = 1
pos = 0,0 ;cond(facing = 1,0,960),0 ;改為在AnimElem上調整
scale = screenwidth/1920*2.00,screenheight/1080*2.00
ownpal = 1
removetime = 6 ;到一定時間(6ticks)時消滅
;supermovetime = 6
;pausemovetime = 6
sprpriority = 999 ;背景在人物前方(在畫面上層 短暫覆蓋對手用)

[State 23211, 10 (Hyakka Light Bullet Spear Background B Hit Spark 1)] ;百花光彈槍背景B 爆炸火花效果1
type = Explod
trigger1 = AnimElemTime(1) = 6
anim = 8430
id = 8430
space = screen
pos = screenwidth/2,screenheight/2 ;space必須是screen 再加上Sprite圖片在中央(中心點XY座軸為0,0) 圖片就可以在畫面中央
scale = screenwidth/1920,screenheight/1080 ;另外再乘以Anim上設定的比例數值才會是實際比例 (這裡設定在寬螢幕為1,1 傳統螢幕為1,1.33)
angle = cond(facing = 1,cond(1.0*screenwidth/screenheight < 1.34,38,33),cond(1.0*screenwidth/screenheight < 1.34,-218,-213)) ;圖片在寬螢幕時傾斜33度，在傳統螢幕時為38度(頭部方向朝左時角度值加上負數)
facing = 1
ownpal = 1
removetime = 144
;supermovetime = 144
;pausemovetime = 144
sprpriority = 2

[State 23211, 11 (Hyakka Light Bullet Spear Background B Hit Spark 2)] ;百花光彈槍背景B 爆炸火花效果2
type = Explod
trigger1 = AnimElemTime(1) = 6
anim = 8431
id = 8430
space = screen
pos = screenwidth/2,screenheight/2 
scale = screenwidth/1920,screenheight/1080
angle = cond(facing = 1,cond(1.0*screenwidth/screenheight < 1.34,38,33),cond(1.0*screenwidth/screenheight < 1.34,-218,-213))
facing = 1
ownpal = 1
removetime = 144
;supermovetime = 144
;pausemovetime = 144
sprpriority = 2

[State 23211, 12 (Hyakka Light Bullet Spear Background B Hit Spark 3)] ;百花光彈槍背景B 爆炸火花效果3
type = Explod
trigger1 = AnimElemTime(1) = 6
anim = 8432
id = 8430
space = screen
pos = screenwidth/2,screenheight/2
scale = screenwidth/1920,screenheight/1080
facing = 1
ownpal = 1
angle = cond(facing = 1,cond(1.0*screenwidth/screenheight < 1.34,128,123),cond(1.0*screenwidth/screenheight < 1.34,-308,-303)) ;圖片在寬螢幕時傾斜123度，在傳統螢幕時為128度(頭部方向朝左時角度值加上負數180度)
removetime = 144
;supermovetime = 144
;pausemovetime = 144
sprpriority = 2

[State 23211, 13 (Hyakka Light Bullet Spear Background B Hit Spark 4A)] ;百花光彈槍背景B 爆炸火花效果4A (小圓圈)*
type = Explod
trigger1 = AnimElemTime(1) = 6
anim = 8435
id = 8430
space = screen
pos = screenwidth/2,screenheight/2
scale = screenwidth/1920,screenheight/1080
facing = 1
ownpal = 1
angle = cond(facing = 1,cond(1.0*screenwidth/screenheight < 1.34,38,33),cond(1.0*screenwidth/screenheight < 1.34,-218,-213)) ;圖片在寬螢幕時傾斜33度，在傳統螢幕時為38度(頭部方向朝左時角度值加上負數180度)
removetime = 144
;supermovetime = 144
;pausemovetime = 144
sprpriority = 2

[State 23211, 14 (Hyakka Light Bullet Spear Background B Hit Spark 4B)] ;百花光彈槍背景B 爆炸火花效果4B (大圓圈)*
type = Explod
trigger1 = AnimElemTime(1) = 6
anim = 8436
id = 8430
space = screen
pos = screenwidth/2,screenheight/2
scale = screenwidth/1920,screenheight/1080
facing = 1
ownpal = 1
angle = cond(facing = 1,cond(1.0*screenwidth/screenheight < 1.34,38,33),cond(1.0*screenwidth/screenheight < 1.34,-218,-213))
removetime = 144
;supermovetime = 144
;pausemovetime = 144
sprpriority = 2

[State 23211, 15 (Hyakka Light Bullet Spear Background B Hit Spark 5)] ;百花光彈槍背景B 爆炸火花效果5
type = Explod
trigger1 = AnimElemTime(1) = 6
anim = 8437
id = 8430
space = screen
pos = screenwidth/2,screenheight/2 
scale = screenwidth/1920,screenheight/1080
angle = cond(facing = 1,cond(1.0*screenwidth/screenheight < 1.34,38,33),cond(1.0*screenwidth/screenheight < 1.34,-218,-213))
facing = 1
ownpal = 1
removetime = 144
;supermovetime = 144
;pausemovetime = 144
sprpriority = 2

[State 23211, 16 (Hyakka Light Bullet Spear Background B Hit Spark 6)] ;百花光彈槍背景B 爆炸火花效果6
type = Explod
trigger1 = AnimElemTime(1) = 6
anim = 8438
id = 8430
space = screen
pos = screenwidth/2,screenheight/2 
scale = screenwidth/1920,screenheight/1080
angle = cond(facing = 1,cond(1.0*screenwidth/screenheight < 1.34,38,33),cond(1.0*screenwidth/screenheight < 1.34,-218,-213))
facing = 1
ownpal = 1
removetime = 144
;supermovetime = 144
;pausemovetime = 144
sprpriority = 2

[State 23211, 17 (Hyakka Light Bullet Spear Background B Hit Spark 7)] ;百花光彈槍背景B 爆炸火花效果7
type = Explod
trigger1 = AnimElemTime(1) = 6
anim = 8439
id = 8430
space = screen
pos = screenwidth/2,screenheight/2 
scale = screenwidth/1920,screenheight/1080
angle = cond(facing = 1,cond(1.0*screenwidth/screenheight < 1.34,38,33),cond(1.0*screenwidth/screenheight < 1.34,-218,-213))
facing = 1
ownpal = 1
removetime = 190
;supermovetime = 190
;pausemovetime = 190
sprpriority = 2

;*大小圓圈的淡入淡出效果是使用AnimElem上的Interpolate Blend 縮放則是Interpolate Scale

[State 23211, 18]
type = ChangeState
trigger1 = AnimTime = 0
value = 23212

;===========================================================================
; Hyakka Light Bullet Spear / Camera Effect C
; 百花光弾槍 / 攝影機(畫面鏡頭)效果C
;===========================================================================
[Statedef 23212]
type = A
movetype = I
physics = N
ctrl = 0
juggle = 0
velset = 0,0
sprpriority = 2

[State 23212, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 3212

[State 23212, 2]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = TimerFreeze
flag3 = NoBarDisplay

[State 23212, 3]
type = AssertSpecial
trigger1 = 1
flag = NoBG
flag2 = NoFG
flag3 = NoAutoTurn

[State 23212, 4]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,1

[State 23212, 5 (Moves Screen Zoom)]
type = Zoom
trigger1 = 1
scale = cond(camerazoom >= 1.0,1.0,(camerazoom-camerazoom)+1.0)/camerazoom
pos = 0,0

[State 23212, 6 (Hyakka Light Bullet Spear Background B Low Sprpriority)] ;百花光彈槍背景B (低圖片優先級)
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 10038
id = 10038
space = screen
pos = screenwidth/2,screenheight/2
scale = screenwidth/1920*2.50,screenheight/1080*5.00
angle = cond(facing = 1,cond(1.0*screenwidth/screenheight < 1.34,-13,-10),cond(1.0*screenwidth/screenheight < 1.34,13,10))
facing = 1
ownpal = 1
removetime = 270
;supermovetime = 270
;pausemovetime = 270
sprpriority = -5

[State 23212, 7 (Light Bullet Left)] ;光彈左
type = Explod
triggerall = NumExplod(8440) < 15 ;數量小於10時
trigger1 = GameTime %4 = 0 ;每4幀時發動
anim = 8440
id = 8440
space = screen
pos = (screenwidth/2+(-random%600)),screenheight/2 ;*
scale = screenwidth/1920,screenheight/1080
angle = cond(facing = 1,-1*(random%20),1*(random%20)) ;如果facing = 1 Explod效果將向右傾斜(反之向左)
facing = 1
ownpal = 1
removetime = 12
sprpriority = 1

;*X軸為畫面寬度除以2+隨機-0~600 因為座標空間為space 所以負數為畫面左端
; Y軸為畫面高度除以2
; 以上寬高設定後 再加上Explod的中心0,0為圖片的中央 Explod效果將在畫面中央顯示

[State 23212, 8 (Light Bullet Right)] ;光彈右
type = Explod
triggerall = NumExplod(8441) < 15
trigger1 = GameTime %4 = 0
anim = 8440
id = 8441
space = screen
pos = (screenwidth/2+(random%600)),screenheight/2 ;*
scale = screenwidth/1920,screenheight/1080
angle = cond(facing = 1,-1*(random%20),1*(random%20)) ;如果facing = 1 Explod效果將向右傾斜(反之向左)
facing = 1
ownpal = 1
removetime = 12
sprpriority = 1

;*X軸為畫面寬度除以2+隨機0~600 因為座標空間為space 所以正數為畫面右端

[State 23212, 9 (Effect Sound)]
type = PlaySnd
triggerall = NumExplod(8442) < 9
trigger1 = GameTime %10 = 0
value = s7,7
channel = 31

[State 23212, 10 (White Screen Fade In] ;白色背景淡入
type = AllPalFX ;全畫面
trigger1 = AnimElemTime(2) >= 0
time = 1
add = 0+((time-238)*8),0+((time-238)*8),0+((time-238)*8)
mul = 256,256,256

[State 23212, 11 (Helper Remove)]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = Root,MoveType = H
recursive = 1
removeexplods = 1

;===========================================================================
; Background Controller / Knight Card C
; 背景控制器 / 騎士卡牌C
;===========================================================================
[Statedef 23600]
type = S
movetype = I
physics = N
ctrl = 0
anim = 99999
velset = 0,0
sprpriority = 0

[State 23600, 1]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = NoShadow

[State 23600, 2]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT

[State 23600, 3]
type = VarSet
trigger1 = Time = 0
v = 46
value = 256 ;用於色碼數值(最大值)

[State 23600, 4] ;淡入
type = VarAdd
trigger1 = var(47) = 0
trigger1 = var(46) > 1
v = 46
value = -12 ;負數將扣除上面的256數值(會讓顏色愈來愈深)

[State 23600, 5]
type = VarSet
trigger1 = var(46) < 136 ;色碼最低數值(愈低顏色愈深 256-(12*10) = 136數值 10為ticks時間)
v = 47
value = 1

[State 23600, 6] ;淡出
type = VarAdd
trigger1 = var(47) = 1
trigger1 = var(46) <= 256 ;小於色碼數值最大值時
trigger1 = Time > 129 ;129數值取自於Helper消滅時間139 139跟129之間剛好10ticks時間差
v = 46
value = 12 ;正數將增加上面的128數值(會讓顏色愈來愈淺)

[State 23600, 7]
type = BGPalFX
trigger1 = var(46)
time = 1
add = 0,0,0
mul = var(46),var(46),var(46)
sinadd = 0,0,0,10
invertall = 0
color = 256

[State 23600, 8 (Helper Remove)]
type = DestroySelf
trigger1 = Time >= 139 ;結束ticks時間
trigger2 = Root,MoveType = H

;===========================================================================
; Super Armor / Definition 1
; 超級裝甲(霸體) / 定義1
;===========================================================================
[Statedef 25410]
type = U
movetype = I
physics = N
velset = 0,0
sprpriority = 2
ctrl = 0

[State 25410, 1]
type = ChangeAnim
trigger1 = 1
value = Root,Anim
elem = Root,AnimElemNo(0)
ignorehitpause = 1

[State 25410, 2]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = NoShadow
ignorehitpause = 1

[State 25410, 3]
type = StateTypeSet
trigger1 = Root,StateType = S
statetype = S

[State 25410, 4]
type = StateTypeSet
trigger1 = Root,StateType = C
statetype = C
 
[State 25410, 5]
type = StateTypeSet
trigger1 = Root,StateType = A
statetype = A
 
[State 25410, 6]
type = StateTypeSet
trigger1 = Root,StateType = L
statetype = L

[State 25410, 7]
type = Turn
trigger1 = Facing*(Parent,Facing) < 0
ignorehitpause = 1

[State 25410, 8]
type = PosSet
trigger1 = 1
x = Root,Pos X
y = Root,Pos Y
ignorehitpause = 1

[State 25410, 9]
type = BindToRoot
trigger1 = 1
time = 1
facing = 1
pos = 0,0
ignorehitpause = 1

[State 25410, 10]
type = HitOverride
trigger1 = 1
attr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
stateno = 25411
time = 1
ignorehitpause = 1

[State 25410, 11 (Helper Remove)]
type = DestroySelf
trigger1 = Root,StateNo = [120,159]
trigger2 = Root,MoveType = H
trigger3 = PalNo = [1,10]
trigger4 = root,var(53) > 0
trigger4 = (PalNo = [1,10]) || (PalNo = [11,12])
recursive = 1
removeexplods = 1

;===========================================================================
; Super Armor / Definition 2
; 超級裝甲(霸體) / 定義2
;===========================================================================
[Statedef 25411]
type = U
movetype = I
physics = N
velset = 0,0
sprpriority = 2
ctrl = 0

[State 25411, 1]
type = ChangeAnim
trigger1 = 1
value = Root,Anim
elem = Root,AnimElemNo(0)
ignorehitpause = 1

[State 25411, 2]
type = AssertSpecial
trigger1 = 1
flag = Invisible
flag2 = NoShadow
ignorehitpause = 1

[State 25411, 3]
type = StateTypeSet
trigger1 = Root,StateType = S
statetype = S

[State 25411, 4]
type = StateTypeSet
trigger1 = Root,StateType = C
statetype = C
 
[State 25411, 5]
type = StateTypeSet
trigger1 = Root,StateType = A
statetype = A
 
[State 25411, 6]
type = StateTypeSet
trigger1 = Root,StateType = L
statetype = L

[State 25411, 7]
type = ParentVarSet
trigger1 = Time = 0
fvar(29) = GetHitVar(Damage)
ignorehitpause = 1

[State 25411, 8]
type = Turn
trigger1 = Facing*(Parent,Facing) < 0
ignorehitpause = 1

[State 25411, 9]
type = PosSet
trigger1 = 1
x = Root,Pos X
y = Root,Pos Y
ignorehitpause = 1

[State 25411, 10]
type = BindToRoot
trigger1 = 1
time = 1
facing = 1
pos = 0,0
ignorehitpause = 1

[State 25411, 11]
type = HitOverride
trigger1 = 1
attr = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
stateno = 25411
time = 1
ignorehitpause = 1

[State 25411, 12 (To Next State 25410)]
type = ChangeState
trigger1 = Time = 1
value = 25410
ctrl = 0

[State 25411, 13 (Helper Remove)]
type = DestroySelf
trigger1 = Root,StateNo = [120,159]
trigger2 = Root,MoveType = H
trigger3 = PalNo = [1,10]
trigger4 = root,var(53) > 0
trigger4 = (PalNo = [1,10]) || (PalNo = [11,12])
recursive = 1
removeexplods = 1

;===========================================================================
; Color Selection
; 顏色選擇
;===========================================================================
[Statedef 29876]
type = S
movetype = I
physics = N
anim = 99999
velset = 0,0
sprpriority = 999

[State 29876, 1]
type = VarSet
trigger1 = Root,fvar(36) < 10
fvar(39) = 0

[State 29876, 2]
type = VarSet
trigger1 = Root,fvar(36) = [10,19]
fvar(39) = 10

[State 29876, 3]
type = VarSet
trigger1 = Root,fvar(36) = [20,22]
fvar(39) = 20

[State 29876, 4]
type = Explod
trigger1 = NumExplod(29876) = 0
anim = 29876
;space = stage ;省略時預設為stage (MUGEN 1.1+版本)
pos = cond(teamside = 1,0,0),4
facing = facing
scale = 0.58,0.58
pausemovetime = 99999999
supermovetime = 99999999
ownpal = 1
bindid = id 
id = 29876
bindtime = -1
removetime = -1
sprpriority = 88
ignorehitpause = 1

[State 29876, 5 (Palette Index Digits Tens)] ;十位數
type = Explod
trigger1 = 1
anim = 29900+floor((root,fvar(36))/10)
;space = stage
pos = cond(teamside = 1,-20,-20),-140
facing = 1
scale = 1.10,1.10
pausemovetime = 99999999
supermovetime = 99999999
ownpal = facing
;ontop = 1
bindid = id
id = 29910
bindtime = -1
removetime = 1
sprpriority = 89 
ignorehitpause = 1

[State 29876, 6 (Palette Index Digits Ones)] ;個位數
type = Explod
trigger1 = 1
anim = 29900+floor((root,fvar(36)))-fvar(39)
;space = stage ;省略時預設為stage (MUGEN 1.1+版本)
pos = cond(teamside = 1,20,20),-140
facing = facing
scale = 1.10,1.10
pausemovetime = 99999999
supermovetime = 99999999
ownpal = 1
bindid = id
id = 29900
bindtime = -1
removetime = 1
sprpriority = 89
ignorehitpause = 1

[State 29876, 7]
type = AssertSpecial
trigger1 = 1
flag = Intro
flag2 = NoShadow

[State 29876, 8 (Reset)]
type = VarSet
trigger1 = !Time
fvar(38) = 480

[State 29876, 9 (Pal)]
type = VarSet
trigger1 = !Time
fvar(36) = Root,PalNo
 
[State 29876, 10]
type = VarSet
trigger1 = fvar(36) < 1 || fvar(36) > 22
fvar(36) = 1+(fvar(36) < 1)*21

[State 29876, 11]
type = PlaySnd
trigger1 = fvar(35) = 2 
value = s29876,0

[State 29876, 12]
type = PlaySnd
triggerall = IsHelper(29876)
trigger1 = Root,Command = "a" || Root,Command = "b" || Root,Command = "c" || Root,Command = "x" || Root,Command = "y" || Root,Command = "z" || Root,Command = "start" || RoundState = 2
trigger2 = fvar(38) <= 5
value = s29876,1
lowpriority = 1
persistent = 0 

[State 29876, 13 (Countdown)]
type = VarAdd
trigger1 = 1 
fvar(38) = -1

[State 29876, 14 (Countdown)]
type = VarAdd
trigger1 = !fvar(35) && fvar(38) < 320
trigger1 = Root,Command = "holdup" || Root,Command = "holddown" || Root,Command = "holdback" || Root,Command = "holdfwd"
fvar(38) = 60
 
[State 29876, 15]
type = VarAdd
trigger1 = !fvar(35)
trigger1 = Root,Command = "holdup" || Root,Command = "holddown" || Root,Command = "holdback" || Root,Command = "holdfwd"
fvar(36) = 1-(Root,Command = "holddown" || Root,Command = "holdback" && Facing = 1 || Root,Command = "holdfwd" && Facing = -1)*2
 
[State 29876, 16]
type = VarAdd
trigger1 = (Root,Command = "holdup" || Root,Command = "holddown" || Root,Command = "holdback" || Root,Command = "holdfwd") && !fvar(35) || fvar(35)
fvar(35) = 1
 
[State 29876, 17]
type = VarSet
trigger1 = !Time || fvar(35) >= 22
fvar(35) = 0

[State 29876, 18]
type = RemoveExplod
triggerall = IsHelper(29876)
trigger1 = Root,Command = "a" || Root,Command = "b" || Root,Command = "c" || Root,Command = "x" || Root,Command = "y" || Root,Command = "z" || Root,Command = "start" || RoundState = 2
trigger2 = fvar(38) <= 0
trigger3 = Root,AILevel
id = 29876

[State 29876, 19 (Helper Remove)]
type = DestroySelf
triggerall = IsHelper(29876)
trigger1 = Root,Command = "a" || Root,Command = "b" || Root,Command = "c" || Root,Command = "x" || Root,Command = "y" || Root,Command = "z" || Root,Command = "start" || RoundState = 2
trigger2 = fvar(38) <= 0
trigger3 = Root,AILevel
recursive = 1
removeexplods = 1

;===========================================================================
; Knight Card System
; 騎士卡牌系統
;===========================================================================
[Statedef 30000]
type = A
movetype = I
physics = N
anim = 99999
velset = 0,0
ctrl = 0

;/////////////////////////////////////
; 第1段 Paragraph 1
;/////////////////////////////////////
; 支援騎士卡牌 (左)
[State 30000, Support Knight Card (Left)]
type = Explod
trigger1 = root,var(39) < 1
trigger1 = !NumExplod(114000) && !NumExplod(114001)
anim = 14000
id = 114000
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
removetime = -1
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080 ;X軸 0.94→4:3比例 0.88→16:9比例
sprpriority = 56
supermovetime = 2147483647 ;不可關閉 否則在連擊時發動的超級暫停效果會讓翻牌停住
pausemovetime = 2147483647
ontop = 1 ;*
ignorehitpause = 1

;*Ontop設定為1 可保證讓Explod不受Stage(場景)的前景效果覆蓋，
; 但是似乎會忽略Sprpriority(圖片優先級)參數。

;*Explod Ontop = 1時 除非Anim使用透明效果 (或者寫上-1) 
; 較晚顯示的Explod會覆蓋住較早顯示的Explod

;*Ontop = 1時圖片優先級 測試過後偶而有不穩定現象 (未正常顯示)
; 可嘗試到mugen.cfg [Config]項目 提高ExplodMax的數值。

; 支援騎士卡牌 (中)
[State 30000, Support Knight Card (Medium)]
type = Explod
trigger1 = root,var(39) < 2
trigger1 = !NumExplod(214000) && !NumExplod(214001)
anim = 14000
id = 214000
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
removetime = -1
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 支援騎士卡牌 (右)
[State 30000, Support Knight Card (Right)]
type = Explod
trigger1 = root,var(39) < 3
trigger1 = !NumExplod(314000) && !NumExplod(314001)
anim = 14000
id = 314000
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
removetime = -1
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

;/////////////////////////////////////
; Support Knight Card (Left) / Wait State
; 支援騎士卡牌 (左) / 等待狀態
;/////////////////////////////////////
; 騎士卡牌 (左) / 準備翻轉
[State 30000, Knight Card (Left) / Ready Flip]
type = Explod
trigger1 = root,var(39) >= 1
trigger1 = NumExplod(114000)
anim = 14001
id = 114001
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 翻轉
[State 30000, Knight Card (Left) / Flip]
type = Explod
trigger1 = root,var(39) >= 1
trigger1 = NumExplod(114000)
anim = 14002
id = 114001
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 55
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 人物圖像
[State 30000, Knight Card (Left) / Character Image]
type = Explod
trigger1 = root,var(39) >= 1
trigger1 = NumExplod(114000)
anim = 14013 ;【Foible Elle 弱酸型艾爾】
id = 114001
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 金色外框
[State 30000, Knight Card (Left) / Gold Frame]
type = Explod
trigger1 = root,var(39) >= 1
trigger1 = NumExplod(114000)
anim = 14003
id = 114001
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 英文字體 (A)
[State 30000, Knight Card (Left) / English Font (A)]
type = Explod
trigger1 = root,var(39) >= 1
trigger1 = NumExplod(114000)
anim = 14004
id = 114001
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 元素
[State 30000, Knight Card (Left) / Element]
type = Explod
trigger1 = root,var(39) >= 1
trigger1 = NumExplod(114000)
anim = 14008 ;14007:=Wind(風) 14008:=Fire(火) 14009:=Ice(冰)
id = 114001
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 阿拉伯數字
[State 30000, Knight Card (Left) / Arabic Numerals]
type = Explod
trigger1 = root,var(39) >= 1
trigger1 = NumExplod(114000)
anim = 14010 ;14010:=數字1 14011:=數字2 14012:=數字3
id = 114001
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(Teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 發亮
[State 30000, Knight Card (Left) / Shine]
type = Explod
trigger1 = root,var(39) >= 1
trigger1 = NumExplod(114000)
anim = 14016
id = 114001
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.86,1.82)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,1.66,1.78)*screenheight/1080
sprpriority = 59
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

;anim = 14017 原位置
;id = 114002

; 騎士卡牌 (左) / 去除
[State 30000, Knight Card (Left) / Remove]
type = RemoveExplod
trigger1 = root,var(39) >= 1
trigger1 = NumExplod(114000)
id = 114000
ignorehitpause = 1

;/////////////////////////////////////
; Support Knight Card (Medium) / Wait State
; 支援騎士卡牌 (中) / 等待狀態
;/////////////////////////////////////
; 騎士卡牌 (中) / 準備翻轉
[State 30000, Knight Card (Medium) / Ready Flip]
type = Explod
trigger1 = root,var(39) >= 2
trigger1 = NumExplod(214000)
anim = 14001
id = 214001
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 翻轉
[State 30000, Knight Card (Medium) / Flip]
type = Explod
trigger1 = root,var(39) >= 2
trigger1 = NumExplod(214000)
anim = 14002
id = 214001
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 55
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 人物圖像
[State 30000, Knight Card (Medium) / Character Image]
type = Explod
trigger1 = root,var(39) >= 2
trigger1 = NumExplod(214000)
anim = 14014 ;【Clone Scathach 複製型斯卡哈】
id = 214001
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 金色外框
[State 30000, Knight Card (Medium) / Gold Frame]
type = Explod
trigger1 = root,var(39) >= 2
trigger1 = NumExplod(214000)
anim = 14003
id = 214001
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 英文字體 (B)
[State 30000, Knight Card (Medium) / English Font (B)]
type = Explod
trigger1 = root,var(39) >= 2
trigger1 = NumExplod(214000)
anim = 14005
id = 214001
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 元素
[State 30000, Knight Card (Medium) / Element]
type = Explod
trigger1 = root,var(39) >= 2
trigger1 = NumExplod(214000)
anim = 14007 ;14007:=Wind(風) 14008:=Fire(火) 14009:=Ice(冰)
id = 214001
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 阿拉伯數字
[State 30000, Knight Card (Medium) / Arabic Numerals]
type = Explod
trigger1 = root,var(39) >= 2
trigger1 = NumExplod(214000)
anim = 14011 ;14010:=數字1 14011:=數字2 14012:=數字3
id = 214001
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 發亮
[State 30000, Knight Card (Medium) / Shine]
type = Explod
trigger1 = root,var(39) >= 2
trigger1 = NumExplod(214000)
anim = 14016
id = 214001
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.86,1.82)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,1.66,1.78)*screenheight/1080
sprpriority = 59
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

;anim = 14017 原位置
;id = 214002

; 騎士卡牌 (中) / 去除
[State 30000, Knight Card (Medium) / Remove]
type = RemoveExplod
trigger1 = root,var(39) >= 2
trigger1 = NumExplod(214000)
id = 214000
ignorehitpause = 1

;/////////////////////////////////////
; Support Knight Card (Right) / Wait State
; 支援騎士卡牌 (右) / 等待狀態
;/////////////////////////////////////
; 騎士卡牌 (右) / 準備翻轉
[State 30000, Knight Card (Right) / Ready Flip]
type = Explod
trigger1 = root,var(39) >= 3
trigger1 = NumExplod(314000)
anim = 14001
id = 314001
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 翻轉
[State 30000, Knight Card (Right) / Flip]
type = Explod
trigger1 = root,var(39) >= 3
trigger1 = NumExplod(314000)
anim = 14002
id = 314001
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 55
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 人物圖像
[State 30000, Knight Card (Right) / Character Image]
type = Explod
trigger1 = root,var(39) >= 3
trigger1 = NumExplod(314000)
anim = 14015 ;【Clone Pharsalia 複製型法莎莉雅】
id = 314001
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(Teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 金色外框
[State 30000, Knight Card (Right) / Gold Frame]
type = Explod
trigger1 = root,var(39) >= 3
trigger1 = NumExplod(314000)
anim = 14003
id = 314001
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 英文字體 (C)
[State 30000, Knight Card (Right) / English Font (C)]
type = Explod
trigger1 = root,var(39) >= 3
trigger1 = NumExplod(314000)
anim = 14006
id = 314001
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(Teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 元素
[State 30000, Knight Card (Right) / Element]
type = Explod
trigger1 = root,var(39) >= 3
trigger1 = NumExplod(314000)
anim = 14009 ;14007:=Wind(風) 14008:=Fire(火) 14009:=Ice(冰)
id = 314001
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 阿拉伯數字
[State 30000, Knight Card (Right) / Arabic Numerals]
type = Explod
trigger1 = root,var(39) >= 3
trigger1 = NumExplod(314000)
anim = 14012 ;14010:=數字1 14011:=數字2 14012:=數字3
id = 314001
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 發亮
[State 30000, Knight Card (Right) / Shine]
type = Explod
trigger1 = root,var(39) >= 3
trigger1 = NumExplod(314000)
anim = 14016
id = 314001
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.86,1.82)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,1.66,1.78)*screenheight/1080
sprpriority = 59
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

;anim = 14017 原位置
;id = 314002

; 騎士卡牌 (右) / 去除
[State 30000, Knight Card (Right) / Remove]
type = RemoveExplod
trigger1 = root,var(39) >= 3
trigger1 = NumExplod(314000)
id = 314000
ignorehitpause = 1

; 騎士卡牌 (左) / 去除 (本體使用卡牌A招式時)
[State 30000, Knight Card (Left) / Remove (Root Used Card A Moves)]
type = RemoveExplod
trigger1 = Root,StateNo = 2600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
trigger1 = NumExplod(114001)
id = 114001
ignorehitpause = 1

; 騎士卡牌 (左) / 去除 (本體使用卡牌A招式時)
[State 30000, Knight Card (Left) / Remove (Root Use Card A Moves)]
type = RemoveExplod
trigger1 = Root,StateNo = 2600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
trigger1 = NumExplod(114002)
id = 114002
ignorehitpause = 1

; 騎士卡牌 (左) / 去除 (本體使用卡牌A招式時)
[State 30000, Knight Card (Left) / Remove (Root Use Card A Moves)]
type = RemoveExplod
trigger1 = Root,StateNo = 2600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
trigger1 = NumExplod(114003)
id = 114003
ignorehitpause = 1

; 騎士卡牌 (左) / 去除 (本體使用卡牌A招式時)
[State 30000, Knight Card (Left) / Remove (Root Use Card A Moves)]
type = RemoveExplod
trigger1 = Root,StateNo = 2600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
trigger1 = numExplod(111004)
id = 114004
ignorehitpause = 1

;/////////////////////////////////////
; 第2段 Paragraph 2
;/////////////////////////////////////
; Support Knight Card (Left) / Root Use Card A Moves
; 支援騎士卡牌 (左) / 本體使用卡牌A招式時
;/////////////////////////////////////
; 騎士卡牌 (左) / 人物圖像
[State 30000, Knight Card (Left) / Character Image]
type = Explod
trigger1 = Root,StateNo = 2600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14029 ;【Foible Elle 弱酸型艾爾】
id = 114001
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 翻轉 2
[State 30000, Knight Card (Left) / Flip 2]
type = Explod
trigger1 = Root,StateNo = 2600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14018
id = 114003
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 金色外框
[State 30000, Knight Card (Left) / Gold Frame]
type = Explod
trigger1 = Root,StateNo = 2600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14019
id = 114001
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 英文字體 (A)
[State 30000, Knight Card (Left) / English Font (A)]
type = Explod
trigger1 = Root,StateNo = 2600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14020
id = 114001
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 元素
[State 30000, Knight Card (Left) / Element]
type = Explod
trigger1 = Root,StateNo = 2600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14024 ;14023:=Wind(風) 14024:=Fire(火) 14025:=Ice(冰)
id = 114001
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 阿拉伯數字
[State 30000, Knight Card (Left) / Arabic Numerals]
type = Explod
trigger1 = Root,StateNo = 2600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14026 ;14026:=數字1 14027:=數字2 14028:=數字3
id = 114001
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 亮光效果2
[State 30000, Knight Card (Left) / Light Effect 2]
type = Explod
trigger1 = Root,StateNo = 2600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14032
id = 114004
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 59
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 人物圖像
[State 30000, Knight Card (Left) / Character Image]
type = Explod
trigger1 = NumExplod(114003) && !NumExplod(114004)
trigger1 = root,var(39) < 1
anim = 14044 ;【Foible Elle 弱酸型艾爾】
id = 114000
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 翻轉淡出
[State 30000, Knight Card (Left) / Flip Fade Out]
type = Explod
trigger1 = NumExplod(114003) && !NumExplod(114004)
trigger1 = root,var(39) < 1
anim = 14047
id = 114000
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 顯現
[State 30000, Knight Card (Left) / Appear]
type = Explod
trigger1 = NumExplod(114003) && !NumExplod(114004)
trigger1 = root,var(39) < 1
anim = 14048
id = 114000
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 金色外框 (消失)
[State 30000, Knight Card (Left) / Gold Frame (Disappear)]
type = Explod
trigger1 = NumExplod(114003) && !NumExplod(114004)
trigger1 = root,var(39) < 1
anim = 14034
id = 114000
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 英文字體 (A)
[State 30000, Knight Card (Left) / English Font (A)]
type = Explod
trigger1 = NumExplod(114003) && !NumExplod(114004)
trigger1 = root,var(39) < 1
anim = 14035
id = 114000
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 元素
[State 30000, Knight Card (Left) / Element]
type = Explod
trigger1 = NumExplod(114003) && !NumExplod(114004)
trigger1 = root,var(39) < 1
anim = 14039 ;14038:=Wind(風) 14039:=Fire(火) 14040:=Ice(冰)
id = 114000
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 阿拉伯數字
[State 30000, Knight Card (Left) / Arabic Numerals]
type = Explod
trigger1 = NumExplod(114003) && !NumExplod(114004)
trigger1 = root,var(39) < 1
anim = 14041 ;14041:=數字1 14042:=數字2 14043:=數字3
id = 114000
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 去除
[State 30000, Knight Card (Left) / Remove]
type = RemoveExplod
trigger1 = NumExplod(114003) && !NumExplod(114004)
trigger1 = root,var(39) < 1
id = 114001
ignorehitpause = 1

; 騎士卡牌 (中) / 去除 (本體使用卡牌B招式時)
[State 30000, Knight Card (Medium) / Remove (Root Used Card B Moves)]
type = RemoveExplod
trigger1 = Root,StateNo = 2800
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
trigger1 = NumExplod(214001)
id = 214001
ignorehitpause = 1

; 騎士卡牌 (中) / 去除 (本體使用卡牌B招式時)
[State 30000, Knight Card (Medium) / Remove (Root Used Card B Moves)]
type = RemoveExplod
trigger1 = Root,StateNo = 2800
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
trigger1 = NumExplod(214002)
id = 214002
ignorehitpause = 1

; 騎士卡牌 (中) / 去除 (本體使用卡牌B招式時)
[State 30000, Knight Card (Medium) / Remove (Root Used Card B Moves)]
type = RemoveExplod
trigger1 = Root,StateNo = 2800
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
trigger1 = NumExplod(214003)
id = 214003
ignorehitpause = 1

; 騎士卡牌 (中) / 去除
[State 30000, Knight Card (Medium) / Remove]
type = RemoveExplod
trigger1 = Root,StateNo = 2800
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
trigger1 = NumExplod(214004)
id = 214004
ignorehitpause = 1

;/////////////////////////////////////
; 第3段 Paragraph 3
;/////////////////////////////////////
; Support Knight Card (Medium) / Root Use Card B Moves
; 支援騎士卡牌 (中) / 本體使用卡牌B招式時
;/////////////////////////////////////
; 騎士卡牌 (中) / 人物圖像
[State 30000, Knight Card (Medium) / Character Image]
type = Explod
trigger1 = Root,StateNo = 2800
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14030 ;【Clone Scathach 複製型斯卡哈】
id = 214001
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 翻轉 2
[State 30000, Knight Card (Medium) / Flip 2]
type = Explod
trigger1 = Root,StateNo = 2800
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14018
id = 214003
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 金色外框
[State 30000, Knight Card (Medium) / Gold Frame]
type = Explod
trigger1 = Root,StateNo = 2800
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14019
id = 214001
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 英文字體 (B)
[State 30000, Knight Card (Medium) / English Font (B)]
type = Explod
trigger1 = Root,StateNo = 2800
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14021
id = 214001
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 元素
[State 30000, Knight Card (Medium) / Element]
type = Explod
trigger1 = Root,StateNo = 2800
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14023 ;14023:=Wind(風) 14024:=Fire(火) 14025:=Ice(冰)
id = 214001
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 阿拉伯數字
[State 30000, Knight Card (Medium) / Arabic Numerals]
type = Explod
trigger1 = Root,StateNo = 2800
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14027 ;14026:=數字1 14027:=數字2 14028:=數字3
id = 214001
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(Teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 亮光效果2
[State 30000, Knight Card (Medium) / Light Effect 2]
type = Explod
trigger1 = Root,StateNo = 2800
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14032
id = 214004
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 59
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 人物圖像
[State 30000, Knight Card (Medium) / Character Image]
type = Explod
trigger1 = NumExplod(214003) && !NumExplod(214004)
trigger1 = root,var(39) < 2
anim = 14045 ;【Clone Scathach 複製型斯卡哈】
id = 214000
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 翻轉淡出
[State 30000, Knight Card (Medium) / Flip Fade Out]
type = Explod
trigger1 = NumExplod(214003) && !NumExplod(214004)
trigger1 = root,var(39) < 2
anim = 14047
id = 214000
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 顯現
[State 30000, Knight Card (Medium) / Appear]
type = Explod
trigger1 = NumExplod(214003) && !NumExplod(214004)
trigger1 = root,var(39) < 2
anim = 14048
id = 214000
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 金色外框 (消失)
[State 30000, Knight Card (Medium) / Gold Frame (Disappear)]
type = Explod
trigger1 = NumExplod(214003) && !NumExplod(214004)
trigger1 = root,var(39) < 2
anim = 14034
id = 214000
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 英文字體 (B)
[State 30000, Knight Card (Medium) / English Font (B)]
type = Explod
trigger1 = NumExplod(214003) && !NumExplod(214004)
trigger1 = root,var(39) < 2
anim = 14036
id = 214000
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 元素
[State 30000, Knight Card (Medium) / Element]
type = Explod
trigger1 = NumExplod(214003) && !NumExplod(214004)
trigger1 = root,var(39) < 2
anim = 14038 ;14038:=Wind(風) 14039:=Fire(火) 14040:=Ice(冰)
id = 214000
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 阿拉伯數字
[State 30000, Knight Card (Medium) / Arabic Numerals]
type = Explod
trigger1 = NumExplod(214003) && !NumExplod(214004)
trigger1 = root,var(39) < 2
anim = 14042 ;14041:=數字1 14042:=數字2 14043:=數字3
id = 214000
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 去除
[State 30000, Knight Card (Medium) / Remove]
type = RemoveExplod
trigger1 = NumExplod(214003) && !NumExplod(214004)
trigger1 = root,var(39) < 2
id = 214001
ignorehitpause = 1

; 騎士卡牌 (右) / 去除
[State 30000, Knight Card (Right) / Remove]
type = RemoveExplod
trigger1 = Root,StateNo = 3600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
trigger1 = NumExplod(314001)
id = 314001
ignorehitpause = 1

; 騎士卡牌 (右) / 去除
[State 30000, Knight Card (Right) / Remove]
type = RemoveExplod
trigger1 = Root,StateNo = 3600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
trigger1 = NumExplod(314002)
id = 314002
ignorehitpause = 1

; 騎士卡牌 (右) / 去除
[State 30000, Knight Card (Right) / Remove]
type = RemoveExplod
trigger1 = Root,StateNo = 3600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
trigger1 = NumExplod(314003)
id = 314003
ignorehitpause = 1

; 騎士卡牌 (右) / 去除
[State 30000, Knight Card (Right) / Remove]
type = RemoveExplod
trigger1 = Root,StateNo = 3600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
trigger1 = NumExplod(314004)
id = 314004
ignorehitpause = 1

;/////////////////////////////////////
; 第4段 Paragraph 4
;/////////////////////////////////////
; Support Knight Card (Right) / Root Use Card C Moves
; 支援騎士卡牌 (右) / 本體使用卡牌C招式時
;/////////////////////////////////////
; 騎士卡牌 (右) / 人物圖像
[State 30000, Knight Card (Right) / Character Image]
type = Explod
trigger1 = Root,StateNo = 3600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14031 ;【Clone Pharsalia 複製型法莎莉雅】
id = 314001
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 翻轉 2
[State 30000, Knight Card (Right) / Flip 2]
type = Explod
trigger1 = Root,StateNo = 3600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14018
id = 314003
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 金色外框
[State 30000, Knight Card (Right) / Gold Frame]
type = Explod
trigger1 = Root,StateNo = 3600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14019
id = 314001
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 英文字體 (C)
[State 30000, Knight Card (Right) / English Font (C)]
type = Explod
trigger1 = Root,StateNo = 3600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14022
id = 314001
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 元素
[State 30000, Knight Card (Right) / Element]
type = Explod
trigger1 = Root,StateNo = 3600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14025 ;14023:=Wind(風) 14024:=Fire(火) 14025:=Ice(冰)
id = 314001
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 阿拉伯數字
[State 30000, Knight Card (Right) / Arabic Numerals]
type = Explod
trigger1 = Root,StateNo = 3600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14028 ;14026:=數字1 14027:=數字2 14028:=數字3
id = 314001
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 亮光效果2
[State 30000, Knight Card (Right) / Light Effect 2]
type = Explod
trigger1 = Root,StateNo = 3600
trigger1 = Root,AnimElem = 1
trigger1 = root,var(35) = GameTime
anim = 14032
id = 314004
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 59
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 人物圖像
[State 30000, Knight Card (Right) / Character Image]
type = Explod
trigger1 = NumExplod(314003) && !NumExplod(314004)
trigger1 = root,var(39) < 3
anim = 14046 ;【Clone Pharsalia 複製型法莎莉雅】
id = 314000
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 翻轉淡出
[State 30000, Knight Card (Right) / Flip Fade Out]
type = Explod
trigger1 = NumExplod(314003) && !NumExplod(314004)
trigger1 = root,var(39) < 3
anim = 14047
id = 314000
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 顯現
[State 30000, Knight Card (Right) / Appear]
type = Explod
trigger1 = NumExplod(314003) && !NumExplod(314004)
trigger1 = root,var(39) < 3
anim = 14048
id = 314000
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 56
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 金色外框 (消失)
[State 30000, Knight Card (Right) / Gold Frame (Disappear)]
type = Explod
trigger1 = NumExplod(314003) && !NumExplod(314004)
trigger1 = root,var(39) < 3
anim = 14034
id = 314000
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 英文字體 (C)
[State 30000, Knight Card (Right) / English Font (C)]
type = Explod
trigger1 = NumExplod(314003) && !NumExplod(314004)
trigger1 = root,var(39) < 3
anim = 14037
id = 314000
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 元素
[State 30000, Knight Card (Right) / Element]
type = Explod
trigger1 = NumExplod(314003) && !NumExplod(314004)
trigger1 = root,var(39) < 3
anim = 14040 ;14038:=Wind(風) 14039:=Fire(火) 14040:=Ice(冰)
id = 314000
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 阿拉伯數字
[State 30000, Knight Card (Right) / Arabic Numerals]
type = Explod
trigger1 = NumExplod(314003) && !NumExplod(314004)
trigger1 = root,var(39) < 3
anim = 14043 ;14041:=數字1 14042:=數字2 14043:=數字3
id = 314000
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 去除
[State 30000, Knight Card (Right) / Remove]
type = RemoveExplod
trigger1 = NumExplod(314003) && !NumExplod(314004)
trigger1 = root,var(39) < 3
id = 314001
ignorehitpause = 1

; 騎士卡牌 (左) / 人物圖像
[State 30000, Knight Card (Left) / Character Image]
type = Explod
trigger1 = NumExplod(114001) && !NumExplod(114003)
trigger1 = root,var(39) < 1
anim = 14059 ;【Foible Elle 弱酸型艾爾】
id = 114000
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 翻轉淡入
[State 30000, Knight Card (Left) / Flip Fade In]
type = Explod
trigger1 = NumExplod(114001) && !NumExplod(114003)
trigger1 = root,var(39) < 1
anim = 14062
id = 114000
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 65
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 金色外框 (消失)
[State 30000, Knight Card (Left) / Gold Frame (Disappear)]
type = Explod
trigger1 = NumExplod(114001) && !NumExplod(114003)
trigger1 = root,var(39) < 1
anim = 14049
id = 114000
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 英文字體 (A)
[State 30000, Knight Card (Left) / English Font (A)]
type = Explod
trigger1 = NumExplod(114001) && !NumExplod(114003)
trigger1 = root,var(39) < 1
anim = 14050
id = 114000
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 元素
[State 30000, Knight Card (Left) / Element]
type = Explod
trigger1 = NumExplod(114001) && !NumExplod(114003)
trigger1 = root,var(39) < 1
anim = 14054 ;14053:=Wind(風) 14054:=Fire(火) 14055:=Ice(冰)
id = 114000
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 阿拉伯數字
[State 30000, Knight Card (Left) / Arabic Numerals]
type = Explod
trigger1 = NumExplod(114001) && !NumExplod(114003)
trigger1 = root,var(39) < 1
anim = 14056 ;14056:=數字1 14057:=數字2 14058:=數字3
id = 114000
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (左) / 去除
[State 30000, Knight Card (Left) / Remove]
type = RemoveExplod
trigger1 = NumExplod(114001) && !NumExplod(114003)
trigger1 = root,var(39) < 1
id = 114001
ignorehitpause = 1

; 騎士卡牌 (左) / 去除
[State 30000, Knight Card (Left) / Remove]
type = RemoveExplod
trigger1 = NumExplod(114002) && !NumExplod(114003)
trigger1 = root,var(39) < 1
id = 114002
ignorehitpause = 1

; 騎士卡牌 (中) / 人物圖像
[State 30000, Knight Card (Medium) / Character Image]
type = Explod
trigger1 = NumExplod(214001) && !NumExplod(214003)
trigger1 = root,var(39) < 2
anim = 14060 ;【Clone Scathach 複製型斯卡哈】
id = 214000
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 翻轉淡入
[State 30000, Knight Card (Medium) / Flip Fade In]
type = Explod
trigger1 = NumExplod(214001) && !NumExplod(214003)
trigger1 = root,var(39) < 2
anim = 14062
id = 214000
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 65
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 金色外框 (消失)
[State 30000, Knight Card (Medium) / Gold Frame (Disappear)]
type = Explod
trigger1 = NumExplod(214001) && !NumExplod(214003)
trigger1 = root,var(39) < 2
anim = 14049
id = 214000
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 英文字體 (B)
[State 30000, Knight Card (Medium) / English Font (B)]
type = Explod
trigger1 = NumExplod(214001) && !NumExplod(214003)
trigger1 = root,var(39) < 2
anim = 14051
id = 214000
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 元素
[State 30000, Knight Card (Medium) / Element]
type = Explod
trigger1 = NumExplod(214001) && !NumExplod(214003)
trigger1 = root,var(39) < 2
anim = 14053 ;14053:=Wind(風) 14054:=Fire(火) 14055:=Ice(冰)
id = 214000
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 阿拉伯數字
[State 30000, Knight Card (Medium) / Arabic Numerals]
type = Explod
trigger1 = NumExplod(214001) && !NumExplod(214003)
trigger1 = root,var(39) < 2
anim = 14057 ;14056:=數字1 14057:=數字2 14058:=數字3
id = 214000
pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (中) / 去除
[State 30000, Knight Card (Medium) / Remove]
type = RemoveExplod
trigger1 = NumExplod(214001) && !NumExplod(214003)
trigger1 = root,var(39) < 2
id = 214001
ignorehitpause = 1

; 騎士卡牌 (中) / 去除
[State 30000, Knight Card (Medium) / Remove]
type = RemoveExplod
trigger1 = NumExplod(214002) && !NumExplod(214003)
trigger1 = root,var(39) < 2
id = 214002
ignorehitpause = 1

; 騎士卡牌 (右) / 人物圖像
[State 30000, Knight Card (Right) / Character Image]
type = Explod
trigger1 = NumExplod(314001) && !NumExplod(314003)
trigger1 = root,var(39) < 3
anim = 14061 ;【Clone Pharsalia 複製型法莎莉雅】
id = 314000
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 翻轉淡入
[State 30000, Knight Card (Right) / Flip Fade In]
type = Explod
trigger1 = NumExplod(314001) && !NumExplod(314003)
trigger1 = root,var(39) < 3
anim = 14062
id = 314000
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 65
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 金色外框 (消失)
[State 30000, Knight Card (Right) / Gold Frame (Disappear)]
type = Explod
trigger1 = NumExplod(314001) && !NumExplod(314003)
trigger1 = root,var(39) < 3
anim = 14049
id = 314000
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 英文字體 (C)
[State 30000, Knight Card (Right) / English Font (C)]
type = Explod
trigger1 = NumExplod(314001) && !NumExplod(314003)
trigger1 = root,var(39) < 3
anim = 14052
id = 314000
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 元素
[State 30000, Knight Card (Right) / Element]
type = Explod
trigger1 = NumExplod(314001) && !NumExplod(314003)
trigger1 = root,var(39) < 3
anim = 14055 ;14053:=Wind(風) 14054:=Fire(火) 14055:=Ice(冰)
id = 314000
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 阿拉伯數字
[State 30000, Knight Card (Right) / Arabic Numerals]
type = Explod
trigger1 = NumExplod(314001) && !NumExplod(314003)
trigger1 = root,var(39) < 3
anim = 14058 ;14056:=數字1 14057:=數字2 14058:=數字3
id = 314000
pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
angle = cond(teamside = 1,10,-10)
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.94,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.72,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647 
ontop = 1
ignorehitpause = 1

; 騎士卡牌 (右) / 去除
[State 30000, Knight Card (Right) / Remove]
type = RemoveExplod
trigger1 = NumExplod(314001) && !NumExplod(314003)
trigger1 = root,var(39) < 3
id = 314001
ignorehitpause = 1

; 騎士卡牌 (右) / 去除
[State 30000, Knight Card (Right) / Remove]
type = RemoveExplod
trigger1 = NumExplod(314002) && !NumExplod(314003)
trigger1 = root,var(39) < 3
id = 314002
ignorehitpause = 1

;; 騎士卡牌 (左) / 邊緣發光
;[State 30000, Knight Card (Left) / Edge Glow]
;type = Explod
;trigger1 = root,var(39) >= 1
;trigger1 = !NumExplod(114002)
;trigger1 = GameTime%181 = 0  ;每隔遊戲時間181%
;anim = 14017 ;Ontop問題無解 不使用ontop的話沒有問題 可正常顯示在最上方 可能需要改變發動時間才能弄好
;id = 114002
;pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(316+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
;angle = cond(teamside = 1,10,-10)
;space = screen
;removetime = -1
;ownpal = 1
;facing = 1
;scale = cond(1.0*screenwidth/screenheight < 1.34,1.86,1.82)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,1.66,1.78)*screenheight/1080
;sprpriority = 59
;supermovetime = 2147483647
;pausemovetime = 2147483647
;ontop = 1
;ignorehitpause = 1

;; 騎士卡牌 (中) / 邊緣發光
;[State 30000, Knight Card (Medium) / Edge Glow]
;type = Explod
;trigger1 = root,var(39) >= 2
;trigger1 = !NumExplod(214002)
;trigger1 = GameTime%181 = 0  ;每隔遊戲時間181%
;anim = 14017 ;Ontop問題無解 不使用ontop的話沒有問題 可正常顯示在最上方 可能需要改變發動時間才能弄好
;id = 214002
;pos = cond(teamside = 1,(208+(root,var(10))),screenwidth-(208+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
;angle = cond(teamside = 1,10,-10)
;space = screen
;removetime = -1
;ownpal = 1
;facing = 1
;scale = cond(1.0*screenwidth/screenheight < 1.34,1.86,1.82)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,1.66,1.78)*screenheight/1080
;sprpriority = 59
;supermovetime = 2147483647
;pausemovetime = 2147483647
;ontop = 1
;ignorehitpause = 1

;; 騎士卡牌 (右) / 邊緣發光
;[State 30000, Knight Card (Right) / Edge Glow]
;type = Explod
;trigger1 = root,var(39) >= 3
;trigger1 = !NumExplod(314002)
;trigger1 = GameTime%181 = 0  ;每隔遊戲時間181%
;anim = 14017 ;Ontop問題無解 不使用ontop的話沒有問題 可正常顯示在最上方 可能需要改變發動時間才能弄好
;id = 314002
;pos = cond(teamside = 1,(316+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,968,958)*screenheight/1080
;angle = cond(teamside = 1,10,-10)
;space = screen
;removetime = -1
;ownpal = 1
;facing = 1
;scale = cond(1.0*screenwidth/screenheight < 1.34,1.86,1.82)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,1.66,1.78)*screenheight/1080
;sprpriority = 59
;supermovetime = 2147483647
;pausemovetime = 2147483647
;ontop = 1
;ignorehitpause = 1

;/////////////////////////////////////
; 第5段 Paragraph 5
;/////////////////////////////////////
; Knight Card Cost Icon (Knight Card Icon) / Use by Summon Knight
; 騎士卡牌消費圖標 (騎士卡點數) / 召喚騎士使用
;/////////////////////////////////////
; 消費圖標 (空) / 左2
[State 30000, Cost Icon (Empty) / Left 2]
type = Explod
trigger1 = NumExplod(14100) < 5
anim = 14100
id = 14100
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(280+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (空) / 左1
[State 30000, Cost Icon (Empty) / Left 1]
type = Explod
trigger1 = NumExplod(14100) < 5
anim = 14100
id = 14100
pos = cond(teamside = 1,(145+(root,var(10))),screenwidth-(235+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 57 
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (空) / 中
[State 30000, Cost Icon (Empty) / Medium]
type = Explod
trigger1 = NumExplod(14100) < 5
anim = 14100
id = 14100
pos = cond(teamside = 1,(190+(root,var(10))),screenwidth-(190+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (空) / 右1
[State 30000, Cost Icon (Empty) / Right 1]
type = Explod
trigger1 = NumExplod(14100) < 5
anim = 14100
id = 14100
pos = cond(teamside = 1,(235+(root,var(10))),screenwidth-(145+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (空) / 右2
[State 30000, Cost Icon (Empty) / Right 2]
type = Explod
trigger1 = NumExplod(14100) < 5
anim = 14100
id = 14100
pos = cond(teamside = 1,(280+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 57
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (紅) / 左2 顯示紅色時停止回復點數 代表前一個招式接觸到對手 或者連擊中時使用 (出現人物的SuperPause特效圖)
[State 30000, Cost Icon (Red) / Left 2]
type = Explod
trigger1 = root,var(34) = 0
trigger1 = root,var(38) >= 1120
trigger1 = NumExplod(114102) = 0
trigger1 = NumExplod(141036) = 0
anim = 14105
id = 141036
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(280+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (空2) / 左2
[State 30000, Cost Icon (Empty 2) / Left 2]
type = Explod
trigger1 = root,var(34) = 0
trigger1 = root,var(35) = GameTime
trigger1 = root,var(38)%1000 = 0
trigger1 = root,var(39) = 0
trigger1 = NumExplod(114101) = 0
anim = 14101
id = 114101
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(280+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 59
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (滿) / 左2
[State 30000, Cost Icon (Full) / Left 2]
type = Explod
trigger1 = root,var(34) = 0
trigger1 = root,var(35) = GameTime
trigger1 = root,var(38)%1000 = 0
trigger1 = root,var(39) = 0
trigger1 = NumExplod(114102) = 0
anim = cond((palno != [7,12]),14102,14103) ;7P~12P改為14103動畫。
id = 114102
pos = cond(teamside = 1,(100+(root,var(10))),screenwidth-(280+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 60
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (紅) / 左1 顯示紅色時停止回復點數 代表前一個招式接觸到對手 或者連擊中時使用 (出現人物的SuperPause特效圖)
[State 30000, Cost Icon (Red) / Left 1]
type = Explod
trigger1 = root,var(34) = 0
trigger1 = root,var(38) >= 1120
trigger1 = NumExplod(214102) = 0
trigger1 = NumExplod(241036) = 0
anim = 14105
id = 241036
pos = cond(teamside = 1,(145+(root,var(10))),screenwidth-(235+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (空2) / 左1
[State 30000, Cost Icon (Empty 2) / Left 1]
type = Explod
trigger1 = root,var(34) = 0
trigger1 = root,var(35) = GameTime
trigger1 = root,var(38)%1000 = 0
trigger1 = root,var(39) = 1
trigger1 = NumExplod(214101) = 0
anim = 14101
id = 214101
pos = cond(teamside = 1,(145+(root,var(10))),screenwidth-(235+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 59
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (滿) / 左1
[State 30000, Cost Icon (Full) / Left 1]
type = Explod
trigger1 = root,var(34) = 0
trigger1 = root,var(35) = GameTime
trigger1 = root,var(38)%1000 = 0
trigger1 = root,var(39) = 1
trigger1 = NumExplod(214102) = 0
anim = cond((palno != [7,12]),14102,14103)
id = 214102
pos = cond(teamside = 1,(145+(root,var(10))),screenwidth-(235+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 60
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (紅) / 中 顯示紅色時停止回復點數 代表前一個招式接觸到對手 或者連擊中時使用 (出現人物的SuperPause特效圖)
[State 30000, Cost Icon (Red) / Medium]
type = Explod
trigger1 = root,var(34) = 0
trigger1 = root,var(38) >= 1120
trigger1 = NumExplod(314102) = 0
trigger1 = NumExplod(341036) = 0
anim = 14105
id = 341036
pos = cond(teamside = 1,(190+(root,var(10))),screenwidth-(190+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (空2) / 中
[State 30000, Cost Icon (Empty 2) / Medium]
type = Explod
trigger1 = root,var(34) = 0
trigger1 = root,var(35) = GameTime
trigger1 = root,var(38)%1000 = 0
trigger1 = root,var(39) = 2
trigger1 = NumExplod(314101) = 0
anim = 14101
id = 314101
pos = cond(teamside = 1,(190+(root,var(10))),screenwidth-(190+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 59
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (滿) / 中
[State 30000, Cost Icon (Full) / Medium]
type = Explod
trigger1 = root,var(34) = 0
trigger1 = root,var(35) = GameTime
trigger1 = root,var(38)%1000 = 0
trigger1 = root,var(39) = 2
trigger1 = NumExplod(314102) = 0
anim = cond((palno != [7,12]),14102,14103)
id = 314102
pos = cond(teamside = 1,(190+(root,var(10))),screenwidth-(190+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 60
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (紅) / 右1 顯示紅色時停止回復點數 代表前一個招式接觸到對手 或者連擊中時使用 (出現人物的SuperPause特效圖)
[State 30000, Cost Icon (Red) / Right 1]
type = Explod
trigger1 = root,var(34) = 0
trigger1 = root,var(38) >= 1120
trigger1 = NumExplod(414102) = 0
trigger1 = NumExplod(441036) = 0
anim = 14105
id = 441036
pos = cond(teamside = 1,(235+(root,var(10))),screenwidth-(145+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (空2) / 右1
[State 30000, Cost Icon (Empty 2) / Right 1]
type = Explod
trigger1 = root,var(34) = 0
trigger1 = root,var(35) = GameTime
trigger1 = root,var(38)%1000 = 0
trigger1 = root,var(39) = 3
trigger1 = NumExplod(414101) = 0
anim = 14101
id = 414101
pos = cond(teamside = 1,(235+(root,var(10))),screenwidth-(145+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 59
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (滿) / 右1
[State 30000, Cost Icon (Full) / Right 1]
type = Explod
trigger1 = root,var(34) = 0
trigger1 = root,var(35) = GameTime
trigger1 = root,var(38)%1000 = 0
trigger1 = root,var(39) = 3
trigger1 = NumExplod(414102) = 0
anim = cond((palno != [7,12]),14102,14103)
id = 414102
pos = cond(teamside = 1,(235+(root,var(10))),screenwidth-(145+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 60
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (紅) / 右2 顯示紅色時停止回復點數 代表前一個招式接觸到對手 或者連擊中時使用 (出現人物的SuperPause特效圖)
[State 30000, Cost Icon (Red) / Right 2]
type = Explod
trigger1 = root,var(34) = 0
trigger1 = root,var(38) >= 1120
trigger1 = NumExplod(514102) = 0
trigger1 = NumExplod(541036) = 0
anim = 14105
id = 541036
pos = cond(teamside = 1,(280+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 58
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (空2) / 右2
[State 30000, Cost Icon (Empty 2) / Right 2]
type = Explod
trigger1 = root,var(34) = 0
trigger1 = root,var(35) = GameTime
trigger1 = root,var(38)%1000 = 0
trigger1 = root,var(39) = 4
trigger1 = NumExplod(514101) = 0
anim = 14101
id = 514101
pos = cond(teamside = 1,(280+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 59
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (滿) / 右2
[State 30000, Cost Icon (Full) / Right 2]
type = Explod
trigger1 = root,var(34) = 0
trigger1 = root,var(35) = GameTime
trigger1 = root,var(38)%1000 = 0
trigger1 = root,var(39) = 4
trigger1 = NumExplod(514102) = 0
anim = cond((palno != [7,12]),14102,14103)
id = 514102
pos = cond(teamside = 1,(280+(root,var(10))),screenwidth-(100+(root,var(10))))*screenwidth/1920,1046*screenheight/1080
space = screen
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,1.00,0.88)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.76,0.84)*screenheight/1080
sprpriority = 60
supermovetime = 2147483647
pausemovetime = 2147483647
ontop = 1
ignorehitpause = 1

; 消費圖標 (紅) / 左2 去除
[State 30000, Cost Icon (Red) / Left 2 Remove]
type = RemoveExplod
trigger1 = NumExplod(141036)
trigger1 = root,var(38)%1000 < 120
id = 141036
ignorehitpause = 1

; 消費圖標 (紅) / 左1 去除
[State 30000, Cost Icon (Red) / Left 1 Remove]
type = RemoveExplod
trigger1 = NumExplod(241036)
trigger1 = root,var(38)%1000 < 120
id = 241036
ignorehitpause = 1

; 消費圖標 (紅) / 中 去除
[State 30000, Cost Icon (Red) / Medium Remove]
type = RemoveExplod
trigger1 = NumExplod(341036)
trigger1 = root,var(38)%1000 < 120
id = 341036
ignorehitpause = 1

; 消費圖標 (紅) / 右1 去除
[State 30000, Cost Icon (Red) / Right 1 Remove]
type = RemoveExplod
trigger1 = NumExplod(441036)
trigger1 = root,var(38)%1000 < 120
id = 441036
ignorehitpause = 1

; 消費圖標 (紅) / 右2 去除
[State 30000, Cost Icon (Red) / Right 2 Remove]
type = RemoveExplod
trigger1 = NumExplod(541036)
trigger1 = root,var(38)%1000 < 120
id = 541036
ignorehitpause = 1

; 消費圖標 (空2) / 左2 低於1去除
[State 30000, Cost Icon (Empty 2) / Left 2 Below 1 Remove]
type = RemoveExplod
trigger1 = NumExplod(114101)
trigger1 = root,var(38)%1000 > 0
trigger1 = root,var(39) < 1
id = 114101
ignorehitpause = 1

; 消費圖標 (滿) / 左2 低於1去除
[State 30000, Cost Icon (Full) / Left 2 Below 1 Remove]
type = RemoveExplod
trigger1 = NumExplod(114102)
trigger1 = root,var(38)%1000 > 0
trigger1 = root,var(39) < 1
id = 114102
ignorehitpause = 1

; 消費圖標 (空2) / 左1 低於2去除
[State 30000, Cost Icon (Empty 2) / Left 1 Below 2 Remove]
type = RemoveExplod
trigger1 = NumExplod(214101)
trigger1 = root,var(38)%1000 > 0
trigger1 = root,var(39) < 2
id = 214101
ignorehitpause = 1

; 消費圖標 (滿) / 左1 低於2去除
[State 30000, Cost Icon (Full) / Left 1 Below 2 Remove]
type = RemoveExplod
trigger1 = NumExplod(214102)
trigger1 = root,var(38)%1000 > 0
trigger1 = root,var(39) < 2
id = 214102
ignorehitpause = 1

; 消費圖標 (空2) / 中 低於3去除
[State 30000, Cost Icon (Empty 2) / Medium Below 3 Remove]
type = RemoveExplod
trigger1 = NumExplod(314101)
trigger1 = root,var(38)%1000 > 0
trigger1 = root,var(39) < 3
id = 314101
ignorehitpause = 1

; 消費圖標 (滿) / 中 低於3去除
[State 30000, Cost Icon (Full) / Medium Below 3 Remove]
type = RemoveExplod
trigger1 = NumExplod(314102)
trigger1 = root,var(38)%1000 > 0
trigger1 = root,var(39) < 3
id = 314102
ignorehitpause = 1

; 消費圖標 (空2) / 右1 低於4去除
[State 30000, Cost Icon (Empty 2) / Right 1 Below 4 Remove]
type = RemoveExplod
trigger1 = NumExplod(414101)
trigger1 = root,var(38)%1000 > 0
trigger1 = root,var(39) < 4
id = 414101
ignorehitpause = 1

; 消費圖標 (滿) / 右1 低於4去除
[State 30000, Cost Icon (Full) / Right 1 Below 4 Remove]
type = RemoveExplod
trigger1 = NumExplod(414102)
trigger1 = root,var(38)%1000 > 0
trigger1 = root,var(39) < 4
id = 414102
ignorehitpause = 1

; 消費圖標 (空2) / 右2 低於5去除
[State 30000, Cost Icon (Empty 2) / Right 2 Below 5 Remove]
type = RemoveExplod
trigger1 = NumExplod(514101)
trigger1 = root,var(38)%1000 > 0
trigger1 = root,var(39) < 5
id = 514101
ignorehitpause = 1

; 消費圖標 (滿) / 右2 低於5去除
[State 30000, Cost Icon (Full) / Right 2 Below 5 Remove]
type = RemoveExplod
trigger1 = NumExplod(514102)
trigger1 = root,var(38)%1000 > 0
trigger1 = root,var(39) < 5
id = 514102
ignorehitpause = 1

[State 30000, Knight Card System Remove]
type = DestroySelf
trigger1 = RoundState >= 4
recursive = 1
removeexplods = 1

;===========================================================================
; Seikyokukai (Ura Kai)
; 制極界 (裏改)
;===========================================================================
[Statedef 44980]
type = A
movetype = I
physics = N
anim = 99991
velset = 0,0
ctrl = 0

[State 44980, 1]
type = AssertSpecial
trigger1 = 1
flag = Invisible
ignorehitpause = 1

[State 44980, 2]
type = ReversalDef
trigger1 = 1
reversal.attr = SCA, NA, SA, HA, AA, NP, SP, HP, AP, NT, ST, HT, AT
pausetime = 0,0
sparkno = -1
sparkxy = 0,0
hitsound = -1
p2stateno = 44982
ignorehitpause = 1
persistent = 0

[State 44980, 3 (Helper Remove)]
type = DestroySelf
trigger1 = Time >= 1
trigger2 = RoundState != 2
recursive = 1
removeexplods = 1

;===========================================================================
; Seikyokukai (Ura Kai 2)
; 制極界 (裏改二)
;===========================================================================
[Statedef 44981]
type = A
movetype = I
physics = N
anim = 99991
velset = 0,0
ctrl = 0

[State 44981, 1]
type = AssertSpecial
trigger1 = 1
flag = Invisible
ignorehitpause = 1

[State 44981, 2]
type = ReversalDef
trigger1 = 1
reversal.attr = , NA, SA, HA, AA, NP, SP, HP, AP, NT, ST, HT, AT
pausetime = 0,0
sparkno = -1
sparkxy = 0,0
hitsound = -1
p2stateno = 44982
ignorehitpause = 1
persistent = 0

[State 44981, 3 (Helper Remove)]
type = DestroySelf
trigger1 = Time >= 1
trigger2 = RoundState != 2
recursive = 1
removeexplods = 1

;===========================================================================
; Seikyokukai (Ura Kai) / Opponent 
; 制極界 (裏改) / 對手
;===========================================================================
[Statedef 44982]
type = U
movetype = H
physics = N
ctrl = 0
velset = 0,0

[State 44982, 1]
type = ChangeAnim
trigger1 = IsHelper
value = Anim
elem = AnimElemNo(0)
ignorehitpause = 1

[State 44982, 2 (To Next State 44983)]
type = ChangeState
trigger1 = Time >= 0
trigger1 = IsHelper
value = 44983

[State 44982, 3]
type = RemoveExplod
trigger1 = 1
id = -1
ignorehitpause = 1

[State 44982, 4]
type = Null;ChangeAnim
trigger1 = StateType = S
value = 5000
ignorehitpause = 1

[State 44982, 5]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = StateType = S
trigger1 = GetHitVar(animtype) != [3,5]
value = cond((gethitvar(groundtype) = 1),5000,5010)+gethitvar(animtype)

[State 44982, 6]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = StateType = S
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 44982, 7]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = StateType = S
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047+gethitvar(animtype)

[State 44982, 8 (Stand FFB Light)]
type = ForceFeedback
triggerall = StateType = S
trigger1 = Anim = 5000
trigger2 = Anim = 5010
persistent = 0
time = 6
waveform = square

[State 44982, 9 (Stand FFB Medium)]
type = ForceFeedback
triggerall = StateType = S
trigger1 = Anim = 5001
trigger2 = Anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 44982, 10 (Stand FFB Hard)]
type = ForceFeedback
triggerall = StateType = S
trigger1 = Anim = 5012
trigger2 = Anim = 5002
trigger3 = Anim = 5030
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

[State 44982, 11]
type = Null;ChangeAnim
trigger1 = StateType = C
value = 5010
ignorehitpause = 1

[State 44982, 12]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = StateType = C
trigger1 = GetHitVar(animtype) != [3,5]
value = 5020+gethitvar(animtype)

[State 44982, 13]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = StateType = C
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 44982, 14]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = StateType = C
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047+gethitvar(animtype)

[State 44982, 15 (Crouch FFB Light)]
type = ForceFeedback
triggerall = StateType = C
trigger1 = Anim = 5020
persistent = 0
time = 6
waveform = square

[State 44982, 16 (Crouch FFB Medium)]
type = ForceFeedback
triggerall = StateType = C
trigger1 = Anim = 5021
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 44982, 17 (Crouch FFB Hard)]
type = ForceFeedback
triggerall = StateType = C
trigger1 = Anim = 5022
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

[State 44982, 18]
type = Null;ChangeAnim
trigger1 = StateType = A
value = 5020
ignorehitpause = 1

[State 44982, 19]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = StateType = A
trigger1 = GetHitVar(animtype) != [3,5]
value = cond((gethitvar(airtype) = 1),5000,5010)+gethitvar(animtype)

[State 44982, 20]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = StateType = A
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 44982, 21]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = StateType = A
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047+GetHitVar(animtype)))
value = 5047+gethitvar(animtype)

[State 44982, 22 (Air FFB Light)]
type = ForceFeedback
triggerall = StateType = A
trigger1 = Anim = 5000
trigger2 = Anim = 5010
persistent = 0
time = 6
waveform = square

[State 44982, 23 (Air FFB Medium)]
type = ForceFeedback
triggerall = StateType = A
trigger1 = Anim = 5001
trigger2 = Anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 44982, 24 (Air FFB Hard)]
type = ForceFeedback
triggerall = StateType = A
trigger1 = Anim = 5012
trigger2 = Anim = 5002
trigger3 = Anim = 5030
trigger4 = Anim = [5051,5059]
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

[State 44982, 25] ;Freeze Anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 44982, 26 (Get Hit Voice)] ;受擊被打的音效
type = PlaySnd
triggerall = Time = 0
triggerall = !IsHelper
triggerall = Alive = 1
triggerall = Random < 500
trigger1 = StateNo != [120,155]
value = s5000,0+(random%3)
ignorehitpause = 1
persistent = 0

[State 44982, 27]
type = LifeAdd
trigger1 = Time = 0
value = -const(data.life)*0.100 ;這裡的Const(Data.Life)是計算對手的Data.Life值
absolute = 1 ;絕對值(無視防禦系數)
kill = 0 ;不會擊殺
ignorehitpause = 1
persistent = 0

[State 44982, 28]
type = PowerAdd
trigger1 = Time = 0
value = -const(data.power)*0.100 ;這裡的Const(Data.Life)是計算對手的Data.Power值
ignorehitpause = 1
persistent = 0

[State 44982, 29]
type = LifeAdd
trigger1 = Time = 0
trigger1 = Life <= LifeMax*0.100 ;小於等於一割時
value = -const(data.life)*1.000
absolute = 1 ;絕對值(無視防禦系數)
kill = 1 ;擊殺
ignorehitpause = 1

[State 44982, 30 (Target Reverts To Its Own State)]
type = SelfState
trigger1 = StateType = S
trigger1 = Time >= 12
value = 5001
ignorehitpause = 1
persistent = 0

[State 44982, 31 (Target Reverts To Its Own State)]
type = SelfState
trigger1 = StateType = C
trigger1 = Time >= 12
value = 5011
ignorehitpause = 1
persistent = 0

[State 44982, 32 (Target Reverts To Its Own State)]
type = SelfState
trigger1 = StateType = A
trigger1 = Time >= 12
value = 5030
ignorehitpause = 1
persistent = 0

;===========================================================================
; Seikyokukai (Ura Kai) / Opponent's Helper
; 制極界 (裏改) / 對手的助手
;===========================================================================
[Statedef 44983]
type = U
movetype = H
physics = N
ctrl = 0
velset = 0,0

[State 44983, 1]
type = ChangeAnim
trigger1 = 1
value = Anim ;沿續者上一個狀態的Anim動作
elem = AnimElemNo(0)
ignorehitpause = 1

[State 44983, 2]
type = RemoveExplod
trigger1 = 1
id = -1
ignorehitpause = 1

[State 44983, 3]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time = 1
ignorehitpause = 1

[State 44983, 4]
type = HitBy
trigger1 = 1
value =
ignorehitpause = 1

[State 44983, 5]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256-(Time*16),256
ignorehitpause = 1

[State 44983, 6]
type = PlayerPush
trigger1 = 1
value = 0

[State 44983, 7]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn
ignorehitpause = 1

[State 44983, 8 (Helper Remove)]
type = DestroySelf
triggerall = IsHelper
trigger1 = Time >= 17
recursive = 1
removeexplods = 1
