;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
; 特殊技 (必殺技) 定義 ‖ 特殊攻撃 (必殺技) ステート
; Special (Super) Moves Definition
;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

;===========================================================================
; Hyakka Spear
; 百花槍
;===========================================================================
[Statedef 1000]
type = S
movetype = A
physics = S
;anim = 1000
velset = 0,0
ctrl = 0
poweradd = 0
juggle = 6
sprpriority = 3

[State 1000, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 1000
value = 1000

[State 1000, 2]
type = PosAdd
trigger1 = Time = 0
x = 35

[State 1000, 3]
type = VelSet
trigger1 = AnimElem = 3
trigger1 = P2Dist X >= 0
x = 0+cond(p2dist x >= 500,25,(p2dist x/20))

[State 1000, 4 (Moving Dust)]
type = Explod
triggerall = Vel X > 0
trigger1 = AnimElemTime(3) = 0
anim = 7040
id = 7040
;space = stage
pos = cond(facing = 1,-140,140)*fvar(21),0
facing = facing
bindid = id
bindtime = 1
removetime = 16
scale = fvar(21)*1.35,fvar(22)*1.35
removeongethit = 1
ignorehitpause = 1
sprpriority = 0
shadow = 0,0,0
ownpal = 1

[State 1000, 5 (Character Voice)]
type = PlaySnd
trigger1 = AnimElem = 4
value = s5,13+(random%2)
channel = 0

[State 1000, 6]
type = Width
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(19) < 0
player = 152*(floor(const(size.xscale))),0
ignorehitpause = 1

[State 1000, 7 (Hyakka Spear Slash A)]
type = Explod
trigger1 = AnimElemTime(4) = 0
trigger2 = AnimElemTime(10) = 0
anim = 7470
id = 7470
;space = stage
pos = cond(facing = 1,-136,136)*fvar(21),-84*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 5
removeongethit = 1
ignorehitpause = 0

[State 1000, 8 (Hyakka Spear Slash A Subtraction)]
type = Explod
trigger1 = AnimElemTime(4) = 0
trigger2 = AnimElemTime(10) = 0
anim = 7471
id = 7470
;space = stage
pos = cond(facing = 1,-136,136)*fvar(21),-84*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 5
removeongethit = 1
ignorehitpause = 0

[State 1000, 9 (Effect Sound)] ;効果音
type = PlaySnd
triggerall = MoveContact = 0
trigger1 = AnimElem = 5
trigger2 = AnimElem = 8
trigger3 = AnimElem = 11
trigger4 = AnimElem = 14
trigger5 = AnimElem = 17
value = s6,6
channel = 15

[State 1000, 10]
type = HitDef
triggerall = AnimElem = 5;#
trigger1 = 1 || var(21):= 710 ;Hit Spark X
trigger1 = 1 || var(22):= -245 ;Hit Spark Y
trigger1 = 1 || var(23):= 7250 ;Hit Spark ID
trigger1 = 1 || var(24):= 7312 ;Guard Spark ID
trigger1 = 1 || var(25):= -11 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1000 ;HitDef ID
;triggerall = 1 || var(21):= 710 ;Hit Spark X ; #測試過左邊的寫法會造成多個變量讀取失敗
;triggerall = 1 || var(22):= -245 ;Hit Spark Y
;triggerall = 1 || var(23):= 7250 ;Hit Spark ID
;triggerall = 1 || var(24):= 7312 ;Guard Spark ID
;triggerall = 1 || var(25):= -11 ;Hit Spark Angle
;triggerall = 1 || var(36):= 1000 ;HitDef ID
;trigger1 = AnimElem = 5
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Light
air.animtype = Light
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.019))*fvar(13)),19*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.004))*fvar(13)),4*fvar(13))
getpower = 6,3
pausetime = 1,2
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = Low
air.type = Low
ground.slidetime = 10+1*var(50)
ground.hittime = 12+1*var(50)
guard.slidetime = 10
guard.ctrltime = 10
guard.hittime = 12
ground.velocity = -22
guard.velocity = -29
air.velocity = -20,-12
airguard.velocity = -27,-8
airguard.ctrltime = 12
air.hittime = 12+1*var(50)
ground.cornerpush.veloff = -32 ;版邊攻擊使自己後退的速度 默認值是1.3*guard.velocity
down.cornerpush.veloff = -32 ;版邊攻擊空中的對手使自己後退的速度 缺省默認值是ground.cornerpush.veloff
air.cornerpush.veloff = -36 ;版邊攻擊蹲下的對手使自己後退的速度 缺省默認值是ground.cornerpush.veloff
guard.cornerpush.veloff = -32 ;版邊被防禦的攻擊使自己後退的速度 缺省默認值是ground.cornerpush.veloff
airguard.cornerpush.veloff = -36 ;版邊被防禦的攻擊空中的對手使自己後退的速度 缺省默認值是guard.cornerpush.veloff
guard.kill = 0 ;該招式無法在對手防禦時擊殺
guard.dist = 1160
fall = 0
air.fall = 1
id = 1000

[State 1000, 11 (Hyakka Spear Slash B)]
type = Explod
trigger1 = AnimElemTime(7) = 0
trigger2 = AnimElemTime(13) = 0
anim = 7472
id = 7470
;space = stage
pos = cond(facing = 1,-14,14)*fvar(21),-4*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 5
removeongethit = 1
ignorehitpause = 0

[State 1000, 12 (Hyakka Spear Slash B Subtraction)]
type = Explod
trigger1 = AnimElemTime(7) = 0
trigger2 = AnimElemTime(13) = 0
anim = 7473
id = 7470
;space = stage
pos = cond(facing = 1,-14,14)*fvar(21),-4*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 5
removeongethit = 1
ignorehitpause = 0

[State 1000, 13]
type = HitDef
triggerall = AnimElem = 8
trigger1 = 1 || var(21):= 710 ;Hit Spark X
trigger1 = 1 || var(22):= -465 ;Hit Spark Y
trigger1 = 1 || var(23):= 7250 ;Hit Spark ID
trigger1 = 1 || var(24):= 7312 ;Guard Spark ID
trigger1 = 1 || var(25):= 11 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1001 ;HitDef ID
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Light
air.animtype = Light
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.019))*fvar(13)),19*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.004))*fvar(13)),4*fvar(13))
getpower = 6,3
pausetime = 1,2
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = High
air.type = High
ground.slidetime = 10+1*var(50)
ground.hittime = 12+1*var(50)
guard.slidetime = 10
guard.ctrltime = 10
guard.hittime = 12
ground.velocity = -22
guard.velocity = -29
air.velocity = -20,-8
airguard.velocity = -27,-4
airguard.ctrltime = 12
air.hittime = 12+1*var(50)
ground.cornerpush.veloff = -32
air.cornerpush.veloff = -36
guard.cornerpush.veloff = -32
airguard.cornerpush.veloff = -36
guard.kill = 0
guard.dist = 1160
fall = 0
air.fall = 1
id = 1001

[State 1000, 14]
type = HitDef
triggerall = AnimElem = 11
trigger1 = 1 || var(21):= 710 ;Hit Spark X
trigger1 = 1 || var(22):= -245 ;Hit Spark Y
trigger1 = 1 || var(23):= 7250 ;Hit Spark ID
trigger1 = 1 || var(24):= 7312 ;Guard Spark ID
trigger1 = 1 || var(25):= -11 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1002 ;HitDef ID
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Light
air.animtype = Light
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.019))*fvar(13)),19*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.004))*fvar(13)),4*fvar(13))
getpower = 6,3
pausetime = 1,2
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = Low
air.type = Low
ground.slidetime = 18+1*var(50)
ground.hittime = 21+1*var(50)
guard.slidetime = 12
guard.ctrltime = 12
guard.hittime = 14
ground.velocity = -22
guard.velocity = -29
air.velocity = -20,-12
airguard.velocity = -27,-8
airguard.ctrltime = 12
air.hittime = 12+1*var(50)
ground.cornerpush.veloff = -32
air.cornerpush.veloff = -36
guard.cornerpush.veloff = -32
airguard.cornerpush.veloff = -36
guard.kill = 0
guard.dist = 1160
fall = 0
air.fall = 1
id = 1002

[State 1000, 15]
type = HitDef
triggerall = AnimElem = 14
trigger1 = 1 || var(21):= 710 ;Hit Spark X
trigger1 = 1 || var(22):= -465 ;Hit Spark Y
trigger1 = 1 || var(23):= 7250 ;Hit Spark ID
trigger1 = 1 || var(24):= 7312 ;Guard Spark ID
trigger1 = 1 || var(25):= 11 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1003 ;HitDef ID
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Light
air.animtype = Light
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.019))*fvar(13)),19*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.004))*fvar(13)),4*fvar(13))
getpower = 6,3
pausetime = 1,2
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = High
air.type = High
ground.slidetime = 18+1*var(50)
ground.hittime = 21+1*var(50)
guard.slidetime = 12
guard.ctrltime = 12
guard.hittime = 14
ground.velocity = -22
guard.velocity = -29
air.velocity = -20,-8
airguard.velocity = -27,-4
airguard.ctrltime = 12
air.hittime = 12+1*var(50)
ground.cornerpush.veloff = -32
air.cornerpush.veloff = -36
guard.cornerpush.veloff = -32
airguard.cornerpush.veloff = -36
guard.kill = 0
guard.dist = 1160
fall = 0
air.fall = 1
id = 1003

[State 1000, 16 (Hyakka Spear Slash C)]
type = Explod
trigger1 = AnimElemTime(16) = 0
anim = 7474
id = 7470
;space = stage
pos = cond(facing = 1,-68,68)*fvar(21),-36*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 5
removeongethit = 1
ignorehitpause = 0

[State 1000, 17 (Hyakka Spear Slash C Subtraction)]
type = Explod
trigger1 = AnimElemTime(16) = 0
anim = 7475
id = 7470
;space = stage
pos = cond(facing = 1,-68,68)*fvar(21),-36*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 5
removeongethit = 1
ignorehitpause = 0

[State 1000, 18]
type = HitDef
triggerall = AnimElem = 17
trigger1 = 1 || var(21):= 720 ;Hit Spark X
trigger1 = 1 || var(22):= -350 ;Hit Spark Y
trigger1 = 1 || var(23):= 7250 ;Hit Spark ID
trigger1 = 1 || var(24):= 7312 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1004 ;HitDef ID
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Light
air.animtype = Light
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.019))*fvar(13)),19*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.004))*fvar(13)),4*fvar(13))
getpower = 6,3
pausetime = 4,15
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = Low
air.type = Low
ground.slidetime = 9+3*var(50)
ground.hittime = 11+3*var(50)
guard.slidetime = 8
guard.ctrltime = 8
guard.hittime = 10
ground.velocity = -23
guard.velocity = -30
air.velocity = -21,-10
airguard.velocity = -28,-6
airguard.ctrltime = 10
air.hittime = 11+3*var(50)
ground.cornerpush.veloff = -32
air.cornerpush.veloff = -36
guard.cornerpush.veloff = -32
airguard.cornerpush.veloff = -36
guard.kill = 0
guard.dist = 1160
fall = 0
air.fall = 1
id = 1004

[State 1000, 19]
type = TargetState
triggerall = NumTarget(1004)
triggerall = MoveContact = 1
triggerall = Target(1004),StateType = S
trigger1 = NumTarget(1004) = 1 && MoveHit
trigger2 = NumTarget(1004) > 1 && !MoveGuarded
value = 5810
ignorehitpause = 1
id = 1004

[State 1000, 20]
type = TargetState
triggerall = NumTarget(1004)
triggerall = MoveContact = 1
triggerall = Target(1004),StateType = C
trigger1 = NumTarget(1004) = 1 && MoveHit
trigger2 = NumTarget(1004) > 1 && !MoveGuarded
value = 5820
ignorehitpause = 1
id = 1004

[State 1000, 21]
type = TargetState
triggerall = NumTarget(1004)
triggerall = MoveContact = 1
triggerall = Target(1004),StateType = A
trigger1 = NumTarget(1004) = 1 && MoveHit
trigger2 = NumTarget(1004) > 1 && !MoveGuarded
value = 5830
ignorehitpause = 1
id = 1004

[State 1000, 22 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===========================================================================
; Hyakka Spear / Air
; 百花槍 / 空中
;===========================================================================
[Statedef 1050]
type = A
movetype = A
physics = N
;anim = 1050
ctrl = 0
poweradd = 0
juggle = 6 ;避免空中連續使用造成無限連擊 因此設定較高的連擊點數 (如果超過Constant檔airjuggle最大值15參數 該攻擊就會Miss掉)
sprpriority = 3

[State 1050, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 1050
value = 1050

[State 1050, 2]
type = VelSet
trigger1 = Time = 0
x = 10

[State 1050, 3]
type = PosAdd
trigger1 = Time = 0
x = 35

[State 1050, 4]
type = VelSet
trigger1 = AnimElem = 3
trigger1 = P2Dist X >= 0
x = 0+cond(p2dist x >= 500,25,(p2dist x/20))

[State 1050, 5 (Character Voice)]
type = PlaySnd
trigger1 = AnimElem = 3
value = s5,13+(random%2)
channel = 0

[State 1050, 6]
type = VelSet
trigger1 = AnimElem >= 4
x = vel x*0.10
y = vel y*0.10

[State 1050, 7 (Hyakka Spear Slash A)]
type = Explod
trigger1 = AnimElemTime(4) = 0
trigger2 = AnimElemTime(10) = 0
anim = 7470
id = 7476
;space = stage
pos = cond(facing = 1,-260,260)*fvar(21),-200*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 5
removeongethit = 1
ignorehitpause = 0

[State 1050, 8 (Hyakka Spear Slash A Subtraction)]
type = Explod
trigger1 = AnimElemTime(4) = 0
trigger2 = AnimElemTime(10) = 0
anim = 7471
id = 7476
;space = stage
pos = cond(facing = 1,-260,260)*fvar(21),-200*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 5
removeongethit = 1
ignorehitpause = 0

[State 1050, 9 (Effect Sound)] ;効果音
type = PlaySnd
triggerall = MoveContact = 0
trigger1 = AnimElem = 5
trigger2 = AnimElem = 8
trigger3 = AnimElem = 11
trigger4 = AnimElem = 14
trigger5 = AnimElem = 17
value = s6,6
channel = 15

[State 1050, 10]
type = HitDef
triggerall = AnimElem = 5
trigger1 = 1 || var(21):= 710 ;Hit Spark X
trigger1 = 1 || var(22):= -355 ;Hit Spark Y
trigger1 = 1 || var(23):= 7250 ;Hit Spark ID
trigger1 = 1 || var(24):= 7312 ;Guard Spark ID
trigger1 = 1 || var(25):= -11 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1050 ;HitDef ID
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Light
air.animtype = Light
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.019))*fvar(13)),19*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.004))*fvar(13)),4*fvar(13))
getpower = 6,3
pausetime = 1,2
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = Low
air.type = Low
ground.slidetime = 10+1*var(50)
ground.hittime = 12+1*var(50)
guard.slidetime = 10
guard.ctrltime = 10
guard.hittime = 12
ground.velocity = -18
guard.velocity = -25
air.velocity = -14,-12
airguard.velocity = -21,-8
airguard.ctrltime = 12
air.hittime = 12+1*var(50)
ground.cornerpush.veloff = -32
air.cornerpush.veloff = -36
guard.cornerpush.veloff = -32
airguard.cornerpush.veloff = -36
guard.kill = 0 ;該招式無法在對手防禦時擊殺
guard.dist = 1160
fall = 0
air.fall = 1
id = 1050

[State 1050, 11 (Hyakka Spear Slash B)]
type = Explod
trigger1 = AnimElemTime(7) = 0
trigger2 = AnimElemTime(13) = 0
anim = 7472
id = 7476
;space = stage
pos = cond(facing = 1,-150,150)*fvar(21),-120*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 5
removeongethit = 1
ignorehitpause = 0

[State 1050, 12 (Hyakka Spear Slash B Subtraction)]
type = Explod
trigger1 = AnimElemTime(7) = 0
trigger2 = AnimElemTime(13) = 0
anim = 7473
id = 7476
;space = stage
pos = cond(facing = 1,-150,150)*fvar(21),-120*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 5
removeongethit = 1
ignorehitpause = 0

[State 1050, 13]
type = HitDef
triggerall = AnimElem = 8
trigger1 = 1 || var(21):= 710 ;Hit Spark X
trigger1 = 1 || var(22):= -590 ;Hit Spark Y
trigger1 = 1 || var(23):= 7250 ;Hit Spark ID
trigger1 = 1 || var(24):= 7312 ;Guard Spark ID
trigger1 = 1 || var(25):= 11 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1051 ;HitDef ID
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Light
air.animtype = Light
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.019))*fvar(13)),19*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.004))*fvar(13)),4*fvar(13))
getpower = 6,3
pausetime = 1,2
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = High
air.type = High
ground.slidetime = 10+1*var(50)
ground.hittime = 12+1*var(50)
guard.slidetime = 10
guard.ctrltime = 10
guard.hittime = 12
ground.velocity = -18
guard.velocity = -25
air.velocity = -14,-8
airguard.velocity = -21,-4
airguard.ctrltime = 12
air.hittime = 12+1*var(50)
ground.cornerpush.veloff = -32
air.cornerpush.veloff = -36
guard.cornerpush.veloff = -32
airguard.cornerpush.veloff = -36
guard.kill = 0
guard.dist = 1160
fall = 0
air.fall = 1
id = 1051

[State 1050, 14]
type = HitDef
triggerall = AnimElem = 11
trigger1 = 1 || var(21):= 710 ;Hit Spark X
trigger1 = 1 || var(22):= -355 ;Hit Spark Y
trigger1 = 1 || var(23):= 7250 ;Hit Spark ID
trigger1 = 1 || var(24):= 7312 ;Guard Spark ID
trigger1 = 1 || var(25):= -11 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1052 ;HitDef ID
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Light
air.animtype = Light
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.019))*fvar(13)),19*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.004))*fvar(13)),4*fvar(13))
getpower = 6,3
pausetime = 1,2
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = Low
air.type = Low
ground.slidetime = 16+1*var(50)
ground.hittime = 19+1*var(50)
guard.slidetime = 12
guard.ctrltime = 12
guard.hittime = 14
ground.velocity = -18
guard.velocity = -25
air.velocity = -14,-12
airguard.velocity = -21,-8
airguard.ctrltime = 12
air.hittime = 12+1*var(50)
ground.cornerpush.veloff = -32
air.cornerpush.veloff = -36
guard.cornerpush.veloff = -32
airguard.cornerpush.veloff = -36
guard.kill = 0
guard.dist = 1160
fall = 0
air.fall = 1
id = 1052

[State 1050, 15]
type = HitDef
triggerall = AnimElem = 14
trigger1 = 1 || var(21):= 710 ;Hit Spark X
trigger1 = 1 || var(22):= -590 ;Hit Spark Y
trigger1 = 1 || var(23):= 7250 ;Hit Spark ID
trigger1 = 1 || var(24):= 7312 ;Guard Spark ID
trigger1 = 1 || var(25):= 11 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1053 ;HitDef ID
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Light
air.animtype = Light
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.019))*fvar(13)),19*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.004))*fvar(13)),4*fvar(13))
getpower = 6,3
pausetime = 1,2
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = High
air.type = High
ground.slidetime = 16+1*var(50)
ground.hittime = 19+1*var(50)
guard.slidetime = 12
guard.ctrltime = 12
guard.hittime = 14
ground.velocity = -18
guard.velocity = -25
air.velocity = -14,-8
airguard.velocity = -21,-4
airguard.ctrltime = 12
air.hittime = 12+1*var(50)
ground.cornerpush.veloff = -32
air.cornerpush.veloff = -36
guard.cornerpush.veloff = -32
airguard.cornerpush.veloff = -36
guard.kill = 0
guard.dist = 1160
fall = 0
air.fall = 1
id = 1053

[State 1050, 16 (Hyakka Spear Slash C)]
type = Explod
trigger1 = AnimElemTime(16) = 0
anim = 7474
id = 7476
;space = stage
pos = cond(facing = 1,-210,210)*fvar(21),-155*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 5
removeongethit = 1
ignorehitpause = 0

[State 1050, 17 (Hyakka Spear Slash C Subtraction)]
type = Explod
trigger1 = AnimElemTime(16) = 0
anim = 7475
id = 7476
;space = stage
pos = cond(facing = 1,-210,210)*fvar(21),-155*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 5
removeongethit = 1
ignorehitpause = 0

[State 1050, 18]
type = HitDef
triggerall = AnimElem = 17
trigger1 = 1 || var(21):= 720 ;Hit Spark X
trigger1 = 1 || var(22):= -460 ;Hit Spark Y
trigger1 = 1 || var(23):= 7250 ;Hit Spark ID
trigger1 = 1 || var(24):= 7312 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1054 ;HitDef ID
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Light
air.animtype = Light
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.019))*fvar(13)),19*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.004))*fvar(13)),4*fvar(13))
getpower = 6,3
pausetime = 4,15
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = Low
air.type = Low
ground.slidetime = 9+3*var(50)
ground.hittime = 11+3*var(50)
guard.slidetime = 8
guard.ctrltime = 8
guard.hittime = 10
ground.velocity = -19
guard.velocity = -26
air.velocity = -15,-10
airguard.velocity = -22,-6
airguard.ctrltime = 10
air.hittime = 11+3*var(50)
ground.cornerpush.veloff = -32
air.cornerpush.veloff = -36
guard.cornerpush.veloff = -32
airguard.cornerpush.veloff = -36
guard.kill = 0
guard.dist = 1160
fall = 0
air.fall = 1
id = 1054

[State 1050, 19]
type = TargetState
triggerall = NumTarget(1054)
triggerall = MoveContact = 1
triggerall = Target(1054),StateType = S
trigger1 = NumTarget(1054) = 1 && MoveHit
trigger2 = NumTarget(1054) > 1 && !MoveGuarded
value = 5810
ignorehitpause = 1
id = 1054

[State 1050, 20]
type = TargetState
triggerall = NumTarget(1054)
triggerall = MoveContact = 1
triggerall = Target(1054),StateType = C
trigger1 = NumTarget(1054) = 1 && MoveHit
trigger2 = NumTarget(1054) > 1 && !MoveGuarded
value = 5820
ignorehitpause = 1
id = 1054

[State 1050, 21]
type = TargetState
triggerall = NumTarget(1054)
triggerall = MoveContact = 1
triggerall = Target(1054),StateType = A
trigger1 = NumTarget(1054) = 1 && MoveHit
trigger2 = NumTarget(1054) > 1 && !MoveGuarded
value = 5830
ignorehitpause = 1
id = 1054

[State 1050, 22] ;避免落到地平線之下(場景下方)
type = PosSet
trigger1 = Pos Y >= 0
y = 0

[State 1050, 23 (To Next State 50)]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;===========================================================================
; Whirlwind Spear A
; 旋風槍A
;===========================================================================
[Statedef 1100]
type = S
movetype = A
physics = S
;anim = 1100
velset = 0,0
ctrl = 0
poweradd = 0
juggle = 2 ;因為juggle值只有2 所以手操時可以多次連續使用 (測試過不會造成無限連擊的情況)

[State 1100, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 1100
value = 1100

[State 1100, 2 (Character Voice)]
type = PlaySnd
trigger1 = AnimElem = 2
value = s5,17
channel = 0

[State 1100, 3 (Whirlwind Spear Slash A)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 7510
id = 7500
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 20
removeongethit = 1
ignorehitpause = 0

[State 1100, 4 (Whirlwind Spear Slash A Subtraction)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 7511
id = 7500
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 20
removeongethit = 1
ignorehitpause = 0

[State 1100, 5 (Whirlwind Land Effect 2)]
type = Explod
trigger1 = AnimElemTime(2) = 0
trigger2 = AnimElemTime(6) = 0
anim = 7055
id = 7500
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7055,1
sprpriority = -3
removetime = 12
scale = fvar(21)*1.72,fvar(22)*1.72
removeongethit = 1

[State 1100, 6 (Whirlwind Land Effect 1)]
type = Explod
trigger1 = AnimElemTime(2) = 0
trigger2 = AnimElemTime(6) = 0
anim = 7054
id = 7500
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
sprpriority = -3
removetime = 12
scale = fvar(21)*2.40,fvar(22)*2.40
removeongethit = 1

[State 1100, 7 (Spear Waving Sound)]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 4
trigger3 = AnimElem = 6
trigger4 = AnimElem = 8
trigger5 = AnimElem = 10
value = s6,1
channel = 15

[State 1100, 8]
type = HitDef
triggerall = GameTime %4 = 0 ;招式的總攻擊框幀數為12ticks 4%的話最多3連擊
triggerall = AnimElem = 2,>= 0
triggerall = AnimElem = 8,< 0
trigger1 = 1 || var(21):= 350 ;Hit Spark X
trigger1 = 1 || var(22):= -520 ;Hit Spark Y
trigger1 = 1 || var(23):= 7255 ;Hit Spark ID
trigger1 = 1 || var(24):= 7314 ;Guard Spark ID
trigger1 = 1 || var(25):= Random%360 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1100 ;HitDef ID
attr = A, SA
animtype = Up
air.animtype = Up
hitflag = MAF
guardflag = MA
priority = 5, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.010))*fvar(13)),10*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.003))*fvar(13)),3*fvar(13))
getpower = 30,15
pausetime = 0,2
sparkno = -1
guard.sparkno = -1
hitsound = s7,4
guardsound = s8,2
ground.type = High
air.type = High
ground.slidetime = 16+1*var(50)
ground.hittime = 16+1*var(50)
guard.slidetime = 18
guard.ctrltime = 18
guard.hittime = 18
airguard.ctrltime = 15
ground.velocity = -5,-25
guard.velocity = -12
air.velocity = -3.5,-21
air.hittime = 16+1*var(50)
ground.cornerpush.veloff = -21
down.cornerpush.veloff = -10 ;因為招式攻擊高度較高 該數值設計較低屬於合理情況
air.cornerpush.veloff = -25
guard.cornerpush.veloff = -21
airguard.cornerpush.veloff = -25
guard.dist = 860
guard.kill = 0 ;該招式無法在對手防禦時擊殺
p2facing = 1-(gametime%8 = 0)*2 ;讓P2隨著GameTime%4乘以2改變朝向 (可以做出被龍捲風類型招式攻擊的效果)
fall = 0 ;如果你想讓P2進入fall落下狀態時設置為1(P2著地前不恢復控制) 如果你想用一招"擊倒"P2就是用他(默認為0)
air.fall = 0 ;如果你想讓P2進入fall落下狀態時設置為1(P2著地前不恢復控制 如果Hit發生時P2在空中) 默認和fall的值相同
id = 1100

[State 1100, 9]
type = HitDef
triggerall = GameTime %4 = 0 ;招式的總攻擊框幀數為4ticks 4%的話最多只能擊中一次
triggerall = AnimElem = 8, >= 0
triggerall = AnimElem = 10, < 0
trigger1 = 1 || var(21):= 350 ;Hit Spark X
trigger1 = 1 || var(22):= -520 ;Hit Spark Y
trigger1 = 1 || var(23):= 7255 ;Hit Spark ID
trigger1 = 1 || var(24):= 7314 ;Guard Spark ID
trigger1 = 1 || var(25):= Random%360 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1101 ;HitDef ID
attr = A, SA
animtype = Up
air.animtype = Up
hitflag = MAF
guardflag = MA
priority = 5, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.040))*fvar(13)),40*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.009))*fvar(13)),9*fvar(13))
getpower = 30,15
pausetime = 0,2
sparkno = -1
guard.sparkno = -1
hitsound = s7,4
guardsound = s8,2
ground.type = High
air.type = High
ground.slidetime = 16+1*var(50)
ground.hittime = 16+1*var(50)
guard.slidetime = 18
guard.ctrltime = 18
guard.hittime = 18
airguard.ctrltime = 15
ground.velocity = -6,-43
guard.velocity = -16
air.velocity = -5,-39
air.hittime = 16+1*var(50)
ground.cornerpush.veloff = -21
down.cornerpush.veloff = -10
air.cornerpush.veloff = -25
guard.cornerpush.veloff = -21
airguard.cornerpush.veloff = -25
guard.dist = 860
guard.kill = 0
p2facing = 1
id = 1101
fall = 1
air.fall = 1
fall.recover = 1 ;如果你不想讓P2在fall狀態中能夠恢復時設置為0(缺省默認為1可以恢復)
air.juggle = 0 ;Hit要求的額外連擊點數(不要與Statedef中的"juggle"參數混淆)*
;*通常不需要使用這個參數，除了HitDef中的飛行道具(缺省默認值是0)
; 測試過不會和Statedef裡的juggle參數相加
; 而且用在Hitdef狀態控制器會無效(應該只適用於Projectile)

[State 1100, 10 (Jump Cancel)] ;跳躍取消
type = ChangeState
triggerall = var(59) = 0 || AILevel = 0
trigger1 = Command = "up" || Command = "holdup" ;添加holdup可以做到向前跳、向後跳
trigger1 = MoveContact >= 1 && AnimElemTime(10) >= 1
value = 40

[State 1100, 11 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===========================================================================
; Whirlwind Spear B (Combo 1)
; 旋風槍B (組合一)
;===========================================================================
[Statedef 1200]
type = S
movetype = A
physics = S
;anim = 1200
velset = 0,0
ctrl = 0
poweradd = 0
juggle = 5
sprpriority = 3

[State 1200, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 1200
value = 1200

[State 1200, 2 (Character Voice)]
type = PlaySnd
trigger1 = AnimElem = 2
value = s5,18
channel = 0

[State 1200, 3 (Whirlwind Spear Slash A)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 7510
id = 7510
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 23
removeongethit = 1
ignorehitpause = 0

[State 1200, 4 (Whirlwind Spear Slash A Subtraction)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 7511
id = 7510
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 23
removeongethit = 1
ignorehitpause = 0

[State 1200, 5 (Whirlwind Land Effect 2)]
type = Explod
trigger1 = AnimElemTime(2) = 0
trigger2 = AnimElemTime(6) = 0
anim = 7055
id = 7510
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7055,1
sprpriority = -3
removetime = 12
scale = fvar(21)*1.72,fvar(22)*1.72
removeongethit = 1

[State 1200, 6 (Whirlwind Land Effect 1)]
type = Explod
trigger1 = AnimElemTime(2) = 0
trigger2 = AnimElemTime(6) = 0
anim = 7054
id = 7510
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
sprpriority = -3
removetime = 12
scale = fvar(21)*2.40,fvar(22)*2.40
removeongethit = 1

[State 1200, 7 (Spear Waving Sound)]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 4
trigger3 = AnimElem = 6
trigger4 = AnimElem = 8
trigger5 = AnimElem = 10
value = s6,1
channel = 15

[State 1200, 8]
type = HitDef
triggerall = GameTime %4 = 0 ;招式的總攻擊框幀數為12ticks 4%的話最多3連擊
trigger1 = AnimElem = 2,>= 0
trigger1 = AnimElem = 8,< 0
trigger1 = 1 || var(21):= 350 ;Hit Spark X
trigger1 = 1 || var(22):= -520 ;Hit Spark Y
trigger1 = 1 || var(23):= 7255 ;Hit Spark ID
trigger1 = 1 || var(24):= 7314 ;Guard Spark ID
trigger1 = 1 || var(25):= Random%360 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1200 ;HitDef ID
attr = A, SA
animtype = Up
air.animtype = Up
hitflag = MAF
guardflag = MA
priority = 5, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.010))*fvar(13)),10*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.003))*fvar(13)),3*fvar(13))
getpower = 20,10
pausetime = 0,2
sparkno = -1
guard.sparkno = -1
hitsound = s7,4
guardsound = s8,2
ground.type = High
air.type = High
ground.slidetime = 16+1*var(50)
ground.hittime = 16+1*var(50)
guard.slidetime = 18
guard.ctrltime = 18
guard.hittime = 18
airguard.ctrltime = 15
ground.velocity = -8,-24
guard.velocity = -12
air.velocity = -6,-20
air.hittime = 16+1*var(50)
ground.cornerpush.veloff = -28
down.cornerpush.veloff = -14
air.cornerpush.veloff = -32
guard.cornerpush.veloff = -28
airguard.cornerpush.veloff = -32
guard.dist = 860
guard.kill = 0 ;該招式無法在對手防禦時擊殺
p2facing = 1-(gametime%8 = 0)*2
fall = 0
air.fall = 0
id = 1200

[State 1200, 9]
type = HitDef
triggerall = GameTime %4 = 0 ;招式的總攻擊框幀數為4ticks 4%的話最多只能擊中一次
trigger1 = AnimElem = 8,>= 0
trigger1 = AnimElem = 10,< 0
trigger1 = 1 || var(21):= 350 ;Hit Spark X
trigger1 = 1 || var(22):= -520 ;Hit Spark Y
trigger1 = 1 || var(23):= 7255 ;Hit Spark ID
trigger1 = 1 || var(24):= 7314 ;Guard Spark ID
trigger1 = 1 || var(25):= Random%360 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1201 ;HitDef ID
attr = A, SA
animtype = DiagUp ;主要用於5052動畫編號 (如果對手有該動畫編號的話)
air.animtype = DiagUp ;主要用於5052動畫編號 (如果對手有該動畫編號的話)
hitflag = MAF
guardflag = MA
priority = 5, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.010))*fvar(13)),10*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.003))*fvar(13)),3*fvar(13))
getpower = 20,10
pausetime = 0,2
sparkno = -1
guard.sparkno = -1
hitsound = s7,4
guardsound = s8,2
ground.type = High ;如果AnimType參數是Back 則P2的High、Low類型動畫將被替代
air.type = High ;默認值和ground.type一樣
ground.slidetime = 16+1*var(50)
ground.hittime = 16+1*var(50)
guard.slidetime = 18
guard.ctrltime = 18
guard.hittime = 18
airguard.ctrltime = 15
ground.velocity = -68,-18
guard.velocity = -48
air.velocity = -64,-15
airguard.velocity = -48,-15
air.hittime = 16+1*var(50)
ground.cornerpush.veloff = -28
down.cornerpush.veloff = -14
air.cornerpush.veloff = -32
guard.cornerpush.veloff = -28
airguard.cornerpush.veloff = -32
guard.dist = 860
guard.kill = 0
p2facing = 1
fall = 1
air.fall = 1
fall.recover = 0
id = 1201

[State 1200, 10]
type = VelSet
trigger1 = AnimElem = 11
x = 20

[State 1200, 11 (To Next State 1202)]
type = ChangeState
trigger1 = AnimTime = 0
value = 1202
ctrl = 0

;===========================================================================
; Whirlwind Spear B (Combo 2)
; 旋風槍B (組合二)
;===========================================================================
[Statedef 1202]
type = S
movetype = A
physics = S
;anim = 1202
velset = 0,0
ctrl = 0
poweradd = 0
juggle = 4
sprpriority = 3

[State 1202, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 1202
value = 1202

[State 1202, 2]
type = VelSet
trigger1 = AnimElem = 1
x = 40

[State 1202, 3 (Whirlwind Spear Slash B)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 7512
id = 7512
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 27
removeongethit = 1
ignorehitpause = 0

[State 1202, 4 (Whirlwind Spear Slash B Subtraction)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 7513
id = 7512
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 27
removeongethit = 1
ignorehitpause = 0

[State 1202, 5 (Character Voice)]
type = PlaySnd
triggerall = PrevStateNo != 1100 ;上一個動作不能是旋風槍A
trigger1 = AnimElem = 3
value = s5,19
channel = 0

[State 1202, 6 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElem = 3
value = s6,16
channel = 15

[State 1202, 7]
type = Width
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(13) < 0
player = 152*(floor(const(size.xscale))),0
ignorehitpause = 1

[State 1202, 8]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElem = 4,>= 0
trigger1 = AnimElem = 7,< 0
trigger1 = 1 || var(21):= 1100 ;Hit Spark X
trigger1 = 1 || var(22):= -350 ;Hit Spark Y
trigger1 = 1 || var(23):= 7265 ;Hit Spark ID
trigger1 = 1 || var(24):= 7320 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1202 ;HitDef ID
attr = S, SA
animtype = Hard
air.animtype = Hard
hitflag = MAFP
guardflag = MA
priority = 5, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.080))*fvar(13)),80*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.014))*fvar(13)),14*fvar(13))
getpower = 20,10
pausetime = 9,11
sparkno = -1
guard.sparkno = -1
hitsound = s7,4
guardsound = s8,2
ground.type = Low
air.type = Low
ground.slidetime = 24+4*var(50)
ground.hittime = 24+4*var(50)
guard.slidetime = 30
guard.ctrltime = 30
guard.hittime = 30
ground.velocity = -48,-22
guard.velocity = -84
air.hittime = 24+4*var(50)
air.velocity = -44,-20
airguard.velocity = -74,-12
ground.cornerpush.veloff = -95
down.cornerpush.veloff = -60
air.cornerpush.veloff = -91
guard.cornerpush.veloff = -150
airguard.cornerpush.veloff = -144
airguard.ctrltime = 44
guard.dist = 2310
fall = 1
air.fall = 1
fall.recover = 0
id = 1202

[State 1202, 9 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElem = 10
value = s6,7
channel = 16

[State 1202, 10 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===========================================================================
; Whirlwind Spear C (Combo 1)
; 旋風槍C (組合一)
;===========================================================================
[Statedef 1300]
type = S
movetype = A
physics = S
;anim = 1300
velset = 0,0
ctrl = 0
poweradd = 0
juggle = 5
sprpriority = 3

[State 1300, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 1300
value = 1300

[State 1300, 2 (Character Voice)]
type = PlaySnd
trigger1 = AnimElem = 2
value = s5,18
channel = 0

[State 1300, 3 (Whirlwind Spear Slash A)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 7510
id = 7520
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 23
removeongethit = 1
ignorehitpause = 0

[State 1300, 4 (Whirlwind Spear Slash A Subtraction)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 7511
id = 7520
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 23
removeongethit = 1
ignorehitpause = 0

[State 1300, 5 (Whirlwind Land Effect 2)]
type = Explod
trigger1 = AnimElemTime(2) = 0
trigger2 = AnimElemTime(6) = 0
anim = 7055
id = 7520
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7055,1
sprpriority = -3
removetime = 12
scale = fvar(21)*1.72,fvar(22)*1.72
removeongethit = 1

[State 1300, 6 (Whirlwind Land Effect 1)]
type = Explod
trigger1 = AnimElemTime(2) = 0
trigger2 = AnimElemTime(6) = 0
anim = 7054
id = 7520
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
sprpriority = -3
removetime = 12
scale = fvar(21)*2.40,fvar(22)*2.40
removeongethit = 1

[State 1300, 7 (Spear Waving Sound)]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 4
trigger3 = AnimElem = 6
trigger4 = AnimElem = 8
trigger5 = AnimElem = 10
value = s6,1
channel = 15

[State 1300, 8]
type = HitDef
triggerall = GameTime %4 = 0
trigger1 = AnimElem = 2,>= 0
trigger1 = AnimElem = 8,< 0
trigger1 = 1 || var(21):= 350 ;Hit Spark X
trigger1 = 1 || var(22):= -520 ;Hit Spark Y
trigger1 = 1 || var(23):= 7255 ;Hit Spark ID
trigger1 = 1 || var(24):= 7314 ;Guard Spark ID
trigger1 = 1 || var(25):= Random%360 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1300 ;HitDef ID
attr = A, SA
animtype = Up
air.animtype = Up
hitflag = MAF
guardflag = MA
priority = 5, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.010))*fvar(13)),10*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.003))*fvar(13)),3*fvar(13))
getpower = 20,10
pausetime = 0,2
sparkno = -1
guard.sparkno = -1
hitsound = s7,4
guardsound = s8,2
ground.type = High
air.type = High
ground.slidetime = 16+1*var(50)
ground.hittime = 16+1*var(50)
guard.slidetime = 18
guard.ctrltime = 18
guard.hittime = 18
airguard.ctrltime = 15
ground.velocity = -8,-24
guard.velocity = -12
air.velocity = -6,-20
air.hittime = 16+1*var(50)
ground.cornerpush.veloff = -28
down.cornerpush.veloff = -14
air.cornerpush.veloff = -32
guard.cornerpush.veloff = -28
airguard.cornerpush.veloff = -32
guard.dist = 870
guard.kill = 0 ;該招式無法在對手防禦時擊殺
p2facing = 1-(gametime%8 = 0)*2
fall = 0
air.fall = 0
id = 1300

[State 1300, 9]
type = HitDef
triggerall = GameTime %4 = 0
trigger1 = AnimElem = 8,>= 0
trigger1 = AnimElem = 10,< 0
trigger1 = 1 || var(21):= 350 ;Hit Spark X
trigger1 = 1 || var(22):= -520 ;Hit Spark Y
trigger1 = 1 || var(23):= 7255 ;Hit Spark ID
trigger1 = 1 || var(24):= 7314 ;Guard Spark ID
trigger1 = 1 || var(25):= Random%360 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1301 ;HitDef ID
attr = A, SA
animtype = DiagUp
air.animtype = DiagUp
hitflag = MAF
guardflag = MA
priority = 5, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.010))*fvar(13)),10*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.003))*fvar(13)),3*fvar(13))
getpower = 20,10
pausetime = 0,2
sparkno = -1
guard.sparkno = -1
hitsound = s7,4
guardsound = s8,2
ground.type = High
air.type = High
ground.slidetime = 16+1*var(50)
ground.hittime = 16+1*var(50)
guard.slidetime = 18
guard.ctrltime = 18
guard.hittime = 18
airguard.ctrltime = 15
ground.velocity = -24,-26
guard.velocity = -20
air.velocity = -22,-24
airguard.velocity = -18,-20
air.hittime = 16+1*var(50)
ground.cornerpush.veloff = -32
down.cornerpush.veloff = -16
air.cornerpush.veloff = -36
guard.cornerpush.veloff = -32
airguard.cornerpush.veloff = -36
guard.dist = 870
guard.kill = 0
p2facing = 1
fall = 1
air.fall = 1
fall.recover = 0
id = 1301

[State 1300, 10]
type = VelSet
trigger1 = AnimElem = 11
x = 20

[State 1300, 11 (To Next State 1302)]
type = ChangeState
trigger1 = AnimTime = 0
value = 1302
ctrl = 0

;===========================================================================
; Whirlwind Spear C (Combo 2)
; 旋風槍C (組合二)
;===========================================================================
[Statedef 1302]
type = S
movetype = A
physics = S
;anim = 1302
velset = 0,0
ctrl = 0
poweradd = 0
juggle = 4
sprpriority = 3

[State 1302, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 1302
value = 1302

[State 1302, 2 (Whirlwind Spear Slash C)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 7520
id = 7522
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 3
removeongethit = 1
ignorehitpause = 0

[State 1302, 3 (Whirlwind Spear Slash C Subtraction)]
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 7521
id = 7522
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 3
removeongethit = 1
ignorehitpause = 0

[State 1302, 4]
type = Width
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(12) < 0
player = 152*(floor(const(size.xscale))),0
ignorehitpause = 1

[State 1302, 5 (Whirlwind Spear Slash D)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 7522
id = 7522
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 23
removeongethit = 1
ignorehitpause = 0

[State 1302, 6 (Whirlwind Spear Slash D Subtraction)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 7523
id = 7522
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7460,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 23
removeongethit = 1
ignorehitpause = 0

[State 1302, 7 (Character Voice)]
type = PlaySnd
;triggerall = PrevStateNo != 1100 ;上一個動作不能是旋風槍A
trigger1 = AnimElem = 3
value = s5,20
channel = 0

[State 1302, 8 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElem = 3
value = s6,16
channel = 15

[State 1302, 9] ;向前移動
type = PosAdd
trigger1 = AnimElem = 3
x = 50

[State 1302, 10]
type = HitDef
triggerall = !MoveContact && !MoveReversed 
;triggerall = GameTime %8 = 0 ;8數值為AnimElem14到AnimElem17的總tick數 這樣設定將確保只擊中一次
trigger1 = AnimElem = 3,>= 0
trigger1 = AnimElem = 7,< 0
trigger1 = 1 || var(21):= 920 ;Hit Spark X
trigger1 = 1 || var(22):= -440 ;Hit Spark Y
trigger1 = 1 || var(23):= 7265 ;Hit Spark ID
trigger1 = 1 || var(24):= 7320 ;Guard Spark ID
trigger1 = 1 || var(25):= 90 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1302 ;HitDef ID
attr = S, SA
animtype = Hard
air.animtype = Hard
hitflag = MAFP
guardflag = MA
priority = 5, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.095))*fvar(13)),95*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.018))*fvar(13)),18*fvar(13))
getpower = 20,10
pausetime = 8,11
sparkno = -1
guard.sparkno = -1
hitsound = s7,4
guardsound = s8,2
ground.type = Low
air.type = Low
ground.slidetime = 26+4*var(50)
ground.hittime = 26+4*var(50)
guard.slidetime = 31
guard.ctrltime = 31
guard.hittime = 31
ground.velocity = -22,38
guard.velocity = -52
air.hittime = 26+4*var(50) ;如果"fall"參數設置為1則此參數無效。缺省默認為20數值。
ground.cornerpush.veloff = -48
air.cornerpush.veloff = -45
guard.cornerpush.veloff = -94
airguard.cornerpush.veloff = -91
air.velocity = -19,35
airguard.velocity = -36,42
airguard.ctrltime = 38
guard.dist = 1110
fall = 1
air.fall = 1
fall.recover = 0
fall.xvelocity = 3 ;當處於fall狀態，從地面反彈時P2獲得的X方向速度(缺省默認為不變)。 ←默認值並不是0 而是ground.velocity或者air.velocity的X軸數值。*
fall.yvelocity = -50;-27 ;當處於fall狀態，從地面反彈時P2獲得的Y方向速度(默認 -4.5(240p), -9(480p), -18(720p)。 ←人物是1080p的話，猜測可能是720p*1.5的值-27.*
down.bounce = 1 ;如果你想讓P2在撞擊地面後立刻從地面反彈起來設置為1(使用fall.xvelocity和fall.yvelocity參數值)
                ;如果"down.velocity"中y_velocity參數為0則此參數被忽略.缺省默認為0.(P2撞擊地面不反彈)
id = 1302

;*親自測試過fall.yvelocity參數，有沒有添加fall.yvelocity = -27數值，
; 對手地面反彈的速度都是相同的，而改用720p(假設人物的localcoord = 1280,720)的-18數值則明顯較低。
; 也就是人物是1080P的話，這個數值同樣是會隨著人物的localcoord改變的。

;*只要上面的fall.xvelocity和fall.yvelocity參數有設定(down.bounce不一定要設定為1)，就可以讓對手呈現大幅度的地面反彈效果。
; down.bounce設定為1的話可以確保對手的Statedef轉為down.bounce的動畫編號。

; 如果不設定以上數值，達到讓對手地面反彈起來的效果，
; 也可以使用TargetState的方式(可以參考MAAB八神庵Statedef 227的部份)。
; TargetState法最大的好處是不會受到對手Common檔案數值設定的影響(以及可以自定義受擊框範圍)。
; 但是需要自製一個給予對手受擊狀態的Statedef定義和Anim動畫。

[State 1302, 11 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElem = 9
value = s6,7
channel = 16

[State 1302, 12 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===========================================================================
; Gale Spear / Move Forward (Preparatory Action)
; 疾風槍 / 向前移動 (預備動作)
;===========================================================================
[Statedef 1400]
type = S
movetype = A
physics = S
;anim = 1400
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = 3

[State 1400, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 1400
value = 1400

[State 1400, 2]
type = Width
trigger1 = 1
player = 28*(floor(const(size.xscale))),28*(floor(const(size.xscale)))
ignorehitpause = 1

[State 1400, 3 (Player To Next State 2400)] ;Dragon Fang Spear (Preparatory Action)
type = ChangeState
triggerall = var(59) = 0 || AILevel = 0
trigger1 = Command = "Dragon_Fang_Spear"
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 4
value = 2400

[State 1400, 4 (Player To Next State 1402)] ;Gale Spear / Move Forward
type = ChangeState
triggerall = var(59) = 0 || AILevel = 0
trigger1 = AnimElemTime(2) >= 4
value = 1402

[State 1400, 5 (AI To Next State 1402)] ;Gale Spear / Move Forward
type = ChangeState
triggerall = var(59) >= 1 || AILevel >= 1
trigger1 = AnimElemTime(2) >= 4
value = 1402

;===========================================================================
; Gale Spear / Move Forward
; 疾風槍 / 向前移動
;===========================================================================
[Statedef 1402]
type = S
movetype = A
physics = S
;anim = 1402
velset = 0,0
poweradd = 0
ctrl = 0
juggle = 4
movehitpersist = 0 ;為了避免下面的風元素粒子效果失效，MoveHit相關觸發器需要復位(默認值為0)。
sprpriority = 3

[State 1402, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 1402
value = 1402
elem = 4

[State 1402, 2]
type = RemoveExplod
trigger1 = Time = 0
id = 7700
ignorehitpause = 1
persistent = 0

[State 1402, 3]
type = StopSnd
trigger1 = Time = 0
channel = 17
ignorehitpause = 1

[State 1402, 4]
type = Width
trigger1 = 1
player = 28*(floor(const(size.xscale))),28*(floor(const(size.xscale)))
ignorehitpause = 1

[State 1402, 5 (Gale Spear Slash A)]
type = Explod
trigger1 = AnimElemTime(6) = 0
anim = 7600
id = 7602
;space = stage
pos = cond(facing = 1,26,-26)*fvar(21),-36*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7600,0
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 16
removeongethit = 1
ignorehitpause = 0

[State 1402, 6 (Gale Spear Slash A Subtraction)]
type = Explod
trigger1 = AnimElemTime(6) = 0
anim = 7601
id = 7602
;space = stage
pos = cond(facing = 1,26,-26)*fvar(21),-36*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7600,2
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 16
removeongethit = 1
ignorehitpause = 0

[State 1402, 7 (Gale Spear Circle Wave 1)]
type = Explod
trigger1 = AnimElemTime(7) = 0
trigger2 = AnimElemTime(9) = 0
anim = 7611
id = 7602
;space = stage
pos = cond(facing = 1,80,-80)*fvar(21),-360*fvar(22)
facing = facing
bindid = id
bindtime = 1
ownpal = 1
remappal = 7600,0
scale = fvar(21)*1.60,fvar(22)*1.60
sprpriority = 2
removetime = 6
removeongethit = 1
ignorehitpause = 0

[State 1402, 8 (Gale Spear Circle Wave 2)]
type = Explod
trigger1 = AnimElemTime(8) = 0
trigger2 = AnimElemTime(10) = 0
anim = 7612
id = 7602
;space = stage
pos = cond(facing = 1,80,-80)*fvar(21),-360*fvar(22)
facing = facing
bindid = id
bindtime = 1
ownpal = 1
remappal = 7600,0
scale = fvar(21)*1.60,fvar(22)*1.60
sprpriority = 4
removetime = 6
removeongethit = 1
ignorehitpause = 0

[State 1402, 9]
type = VelSet
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
x = 75

[State 1402, 10 (Character Voice)]
type = PlaySnd
trigger1 = AnimElemTime(6) = 0
value = s5,22+(random%4)
channel = 0

[State 1402, 11 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElemTime(6) = 0
value = s6,8
channel = 16

[State 1402, 12]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
trigger1 = 1 || var(21):= 540 ;Hit Spark X
trigger1 = 1 || var(22):= -400 ;Hit Spark Y
trigger1 = 1 || var(23):= 7260 ;Hit Spark ID
trigger1 = 1 || var(24):= 7330 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1402 ;HitDef ID
attr = S, SA
animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 6, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.072))*fvar(13)),72*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.014))*fvar(13)),14*fvar(13))
getpower = 6,3
pausetime = 12,12
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = Low
air.type = Low
ground.slidetime = 25+3*var(50)
ground.hittime = 25+3*var(50)
guard.slidetime = 33
guard.hittime = 33
ground.velocity = -19,-40
guard.velocity = -22
air.velocity = -13,-30
airguard.velocity = -12,-24
air.hittime = 25+3*var(50)
ground.cornerpush.veloff = -28.6
down.cornerpush.veloff = -28.6
air.cornerpush.veloff = -19.5
guard.cornerpush.veloff = -21
airguard.cornerpush.veloff = -15.6
airguard.ctrltime = 34
guard.dist = 850
guard.kill = 0 ;該招式無法在對手防禦時擊殺
palfx.time = 47
palfx.add = 0,120,0
palfx.mul = 255,255,255
palfx.sinadd = 10,10,10,30
palfx.color = 256
palfx.invertall = 0
fall = 1
air.fall = 1
id = 1402
chainid = -1

[State 1402, 13]
type = HitDef
triggerall = NumTarget(1302) >= 1 ;旋風槍C 擊落受擊 / 地面反彈離地
triggerall = Target(1302),StateType = L ;目標1302狀態類型為躺下
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
trigger1 = 1 || var(21):= 540 ;Hit Spark X
trigger1 = 1 || var(22):= -400 ;Hit Spark Y
trigger1 = 1 || var(23):= 7260 ;Hit Spark ID
trigger1 = 1 || var(24):= 7330 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1402 ;HitDef ID
attr = S, SA
animtype = Hard
air.animtype = Hard
hitflag = MAFD ;增加可擊中躺下對手
guardflag = MA
priority = 6, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.072))*fvar(13)),72*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.014))*fvar(13)),14*fvar(13))
getpower = 6,3
pausetime = 12,12
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = Low
air.type = Low
ground.slidetime = 25+3*var(50)
ground.hittime = 25+3*var(50)
guard.slidetime = 33
guard.hittime = 33
ground.velocity = -19,-40
guard.velocity = -22
air.velocity = -13,-30
airguard.velocity = -12,-24
air.hittime = 25+3*var(50)
ground.cornerpush.veloff = -28.6
down.cornerpush.veloff = -28.6
air.cornerpush.veloff = -19.5
guard.cornerpush.veloff = -21
airguard.cornerpush.veloff = -15.6
airguard.ctrltime = 34
guard.dist = 850
guard.kill = 0 ;該招式無法在對手防禦時擊殺
palfx.time = 47
palfx.add = 0,120,0
palfx.mul = 255,255,255
palfx.sinadd = 10,10,10,30
palfx.color = 256
palfx.invertall = 0
fall = 1
air.fall = 1
id = 1402
chainid = 1302 ;限定連擊旋風槍C (組合二)

[State 1402, 14]
type = Helper
triggerall = Alive = 1
;triggerall = NumTarget(1402) >= 1 ;*
trigger1 = NumHelper(12980) < 6 ;粒子總數量限制(所有寫上助手ID號12980的招式，最多6個)。
trigger1 = MoveHit >= 1 ;加上大於號(不考慮Hitdef等等其他設定的話會依照幀數產生粒子)。
name = "Wind Element Particle" ;風元素粒子
stateno = 12980
id = 12980
postype = p2
pos = 0,(target,const(size.mid.pos.y))
;pos = 0,(target(1402),const(size.mid.pos.y)) ;*
ownpal = 1
size.xscale = fvar(21)*0.65
size.yscale = fvar(22)*0.65
ignorehitpause = 1
persistent = 1

;*取消對應Hitdef ID號。這樣對手即使處於SuperArmor(超級裝甲)狀態，仍然可以奪取生命值。

[State 1402, 15 (To Next State 1489)]
type = ChangeState
trigger1 = AnimTime = 0
value = 1489
ctrl = 0

;===========================================================================
; Fire Gale Spear (Guard Cancel C / Guard Cancel CB)
; 火風槍 (防禦取消C / 防禦取消CB)
;===========================================================================
[Statedef 1409]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = 3

[State 1409, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 1402
elem = 6

[State 1409, 2]
type = Null;Width
trigger1 = 1
player = 28*(floor(const(size.xscale))),28*(floor(const(size.xscale)))
ignorehitpause = 1

[State 1409, 3]
type = Turn
triggerall = Time = 0
trigger1 = P2Dist X < 0 ;P2BodyDist X < 0 ;對手在人物後方時*
trigger1 = PrevStateNo = 726 ;上一個狀態號為726時

;*如果對手兩位以上，可能會受到第二位對手的影響不會轉向

[State 1409, 4]
type = RemoveExplod
trigger1 = Time = 0
id = 7700
ignorehitpause = 1
persistent = 0

[State 1409, 5]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1

[State 1409, 6 (Fire Gale Spear Slash A)]
type = Explod
trigger1 = AnimElemTime(6) = 0
anim = 7600
id = 7609
;space = stage
pos = cond(facing = 1,26,-26)*fvar(21),-36*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7600,3
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 16
removeongethit = 1
ignorehitpause = 0

[State 1409, 7 (Fire Gale Spear Slash A Subtraction)]
type = Explod
trigger1 = AnimElemTime(6) = 0
anim = 7601
id = 7609
;space = stage
pos = cond(facing = 1,26,-26)*fvar(21),-36*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7600,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 16
removeongethit = 1
ignorehitpause = 0

[State 1409, 8 (Fire Gale Spear Circle Wave 1)]
type = Explod
trigger1 = AnimElemTime(7) = 0
trigger2 = AnimElemTime(9) = 0
anim = 7611
id = 7609
;space = stage
pos = cond(facing = 1,80,-80)*fvar(21),-360*fvar(22)
facing = facing
bindid = id
bindtime = 1
ownpal = 1
remappal = 7600,3
scale = fvar(21)*1.60,fvar(22)*1.60
sprpriority = 2
removetime = 6
removeongethit = 1
ignorehitpause = 0

[State 1409, 9 (Fire Gale Spear Circle Wave 2)]
type = Explod
trigger1 = AnimElemTime(8) = 0
trigger2 = AnimElemTime(10) = 0
anim = 7612
id = 7609
;space = stage
pos = cond(facing = 1,80,-80)*fvar(21),-360*fvar(22)
facing = facing
bindid = id
bindtime = 1
ownpal = 1
remappal = 7600,3
scale = fvar(21)*1.60,fvar(22)*1.60
sprpriority = 4
removetime = 6
removeongethit = 1
ignorehitpause = 0

[State 1409, 10]
type = VelSet
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
x = 75

[State 1409, 11 (Character Voice)]
type = PlaySnd
trigger1 = AnimElemTime(6) = 0
value = s5,22+(random%4)
channel = 0

[State 1409, 12 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElemTime(6) = 0
value = s6,8
channel = 16

[State 1409, 13]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
trigger1 = 1 || var(21):= 540 ;Hit Spark X
trigger1 = 1 || var(22):= -400 ;Hit Spark Y
trigger1 = 1 || var(23):= 7260 ;Hit Spark ID
trigger1 = 1 || var(24):= 7330 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1409 ;HitDef ID
attr = S, SA
animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 6, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.055))*fvar(13)),55*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.012))*fvar(13)),12*fvar(13))
pausetime = 6,6
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = Low
air.type = Low
ground.slidetime = 25+3*var(50)
ground.hittime = 25+3*var(50)
guard.slidetime = 32
guard.hittime = 32
ground.velocity = -22,-38
guard.velocity = -22
air.velocity = -15,-28
airguard.velocity = -12,-24
air.hittime = 25+3*var(50)
ground.cornerpush.veloff = -28.6
down.cornerpush.veloff = -28.6
air.cornerpush.veloff = -19.5
guard.cornerpush.veloff = -21
airguard.cornerpush.veloff = -15.6
airguard.ctrltime = 32
guard.dist = 850
palfx.time = 47
palfx.add = 255,80,0
palfx.mul = 255,255,255
palfx.sinadd = 10,10,10,30
palfx.color = 256
palfx.invertall = 0
fall = 1
air.fall = 1
id = 1409

[State 1409, 14 (To Next State 1489)]
type = ChangeState
trigger1 = AnimTime = 0
value = 1489
ctrl = 0

;===========================================================================
; Gale Spear / Move Upward
; 疾風槍 / 向上移動
;===========================================================================
[Statedef 1425]
type = S
movetype = A
physics = N
;anim = 1425
velset = 0,0 ;狀態起始時P1的速度 默認值不是0,0而是保持P1原來的速度(也就是會保持上一個狀態的velset值，直到被下一個velset所取代)。
poweradd = 0
ctrl = 0
juggle = 4
sprpriority = 3

[State 1425, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 1425
value = 1425

[State 1425, 2 (Gale Spear Slash B)]
type = Explod
trigger1 = AnimElemTime(5) = 0
anim = 7605
id = 7625
;space = stage
pos = cond(facing = 1,248,-248)*fvar(21),-148*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 16
removeongethit = 1
ignorehitpause = 0

[State 1425, 3 (Gale Spear Slash B Subtraction)]
type = Explod
trigger1 = AnimElemTime(5) = 0
anim = 7606
id = 7625
;space = stage
pos = cond(facing = 1,248,-248)*fvar(21),-148*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7600,2
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 16
removeongethit = 1
ignorehitpause = 0

[State 1425, 4 (Gale Spear Circle Wave 3)]
type = Explod
trigger1 = AnimElemTime(6) = 0
trigger2 = AnimElemTime(8) = 0
anim = 7615
id = 7625
;space = stage
pos = 0,-280*fvar(22)
facing = facing
bindid = id
bindtime = 1
ownpal = 1
scale = fvar(21)*1.60,fvar(22)*1.60
sprpriority = 2
removetime = 6
removeongethit = 1
ignorehitpause = 0

[State 1425, 5 (Gale Spear Circle Wave 4)]
type = Explod
trigger1 = AnimElemTime(7) = 0
trigger2 = AnimElemTime(9) = 0
anim = 7616
id = 7625
;space = stage
pos = 0,-280*fvar(22)
facing = facing
bindid = id
bindtime = 1
ownpal = 1
scale = fvar(21)*1.60,fvar(22)*1.60
sprpriority = 4
removetime = 6
removeongethit = 1
ignorehitpause = 0

[State 1425, 6]
type = VelSet
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(10) < 0
x = 35
y = -35

[State 1425, 7 (Character Voice)]
type = PlaySnd
trigger1 = AnimElemTime(6) = 0
value = s5,22+(random%4)
channel = 0

[State 1425, 8 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElemTime(6) = 0
value = s6,8
channel = 16

[State 1425, 9]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
statetype = A
movetype = A
physics = N

[State 1425, 10]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(10) < 0
trigger1 = 1 || var(21):= 300 ;Hit Spark X
trigger1 = 1 || var(22):= -400 ;Hit Spark Y
trigger1 = 1 || var(23):= 7260 ;Hit Spark ID
trigger1 = 1 || var(24):= 7330 ;Guard Spark ID
trigger1 = 1 || var(25):= 51 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1425 ;HitDef ID
attr = A, SA
animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 6, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.072))*fvar(13)),72*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.014))*fvar(13)),14*fvar(13))
getpower = 30,15
pausetime = 10,14
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = High
air.type = Low
ground.slidetime = 25+3*var(50)
ground.hittime = 25+3*var(50)
guard.slidetime = 28
guard.hittime = 28
ground.velocity = -19,-40
guard.velocity = -22
air.velocity = -13,-30
airguard.velocity = -12,-24
air.hittime = 25+3*var(50)
ground.cornerpush.veloff = -28.6
down.cornerpush.veloff = -14.3
air.cornerpush.veloff = -19.5
guard.cornerpush.veloff = -21
airguard.cornerpush.veloff = -15.6
airguard.ctrltime = 29
guard.dist = 850
guard.kill = 0 ;該招式無法在對手防禦時擊殺
palfx.time = 47
palfx.add = 0,120,0
palfx.mul = 255,255,255
palfx.sinadd = 10,10,10,30
palfx.color = 256
palfx.invertall = 0
fall = 1
air.fall = 1
id = 1425
chainid = -1

[State 1425, 11]
type = HitDef
triggerall = NumTarget(1302) >= 1 ;旋風槍C 擊落受擊 / 地面反彈離地
triggerall = Target(1302),StateType = L ;目標1302狀態類型為躺下
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(10) < 0
trigger1 = 1 || var(21):= 300 ;Hit Spark X
trigger1 = 1 || var(22):= -400 ;Hit Spark Y
trigger1 = 1 || var(23):= 7260 ;Hit Spark ID
trigger1 = 1 || var(24):= 7330 ;Guard Spark ID
trigger1 = 1 || var(25):= 51 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1425 ;HitDef ID
attr = A, SA
animtype = Hard
air.animtype = Hard
hitflag = MAFD ;增加可擊中躺下對手
guardflag = MA
priority = 6, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.072))*fvar(13)),72*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.014))*fvar(13)),14*fvar(13))
getpower = 30,15
pausetime = 10,14
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = High
air.type = Low
ground.slidetime = 25+3*var(50)
ground.hittime = 25+3*var(50)
guard.slidetime = 28
guard.hittime = 28
ground.velocity = -19,-40
guard.velocity = -22
air.velocity = -13,-30
airguard.velocity = -12,-24
air.hittime = 25+3*var(50)
ground.cornerpush.veloff = -28.6
down.cornerpush.veloff = -14.3
air.cornerpush.veloff = -19.5
guard.cornerpush.veloff = -21
airguard.cornerpush.veloff = -15.6
airguard.ctrltime = 29
guard.dist = 850
guard.kill = 0 ;該招式無法在對手防禦時擊殺
palfx.time = 47
palfx.add = 0,120,0
palfx.mul = 255,255,255
palfx.sinadd = 10,10,10,30
palfx.color = 256
palfx.invertall = 0
fall = 1
air.fall = 1
id = 1425
chainid = 1302 ;限定連擊旋風槍C (組合二)

[State 1425, 12]
type = Helper
triggerall = Alive = 1
trigger1 = NumHelper(12980) < 6 ;粒子總數量限制(所有寫上助手ID號12980的招式，最多6個)。
trigger1 = MoveHit >= 1
name = "Wind Element Particle" ;風元素粒子
stateno = 12980
id = 12980
postype = p2
pos = 0,(target,const(size.mid.pos.y))
ownpal = 1
size.xscale = fvar(21)*0.65
size.yscale = fvar(22)*0.65
ignorehitpause = 1
persistent = 1

[State 1425, 13]
type = Gravity
trigger1 = AnimElemTime(10) >= 0

[State 1425, 14]
type = VelAdd
triggerall = Vel X > 0
trigger1 = AnimElemTime(10) >= 0
x = -1.5

[State 1425, 15 (To Next State 50)]
type = ChangeState
trigger1 = AnimTime = 0
trigger2 = AnimElemTime(10) >= 0
trigger2 = Pos Y >= 0 && Vel Y > 0
value = 50
ctrl = 1

;===========================================================================
; Gale Spear / Air Move Forward (Preparatory Action)
; 疾風槍 / 空中向前移動 (預備動作)
;===========================================================================
[Statedef 1450]
type = A
movetype = A
physics = N
;anim = 1450
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = 3

[State 1450, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 1450
value = 1450

[State 1450, 2 (Player To Next State 2450)] ;Dragon Fang Spear / Air (Preparatory Action)
type = ChangeState
triggerall = var(59) = 0
trigger1 = Command = "Dragon_Fang_Spear"
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 4
value = 2450

[State 1450, 3 (Player To Next State 1452)] ;Gale Spear / Air Move Forward
type = ChangeState
triggerall = var(59) = 0
trigger1 = AnimElemTime(2) >= 4
value = 1452

[State 1400, 4 (AI To Next State 1452)] ;Gale Spear / Air Move Forward
type = ChangeState
triggerall = var(59) >= 1
trigger1 = AnimElemTime(2) >= 4
value = 1452

;===========================================================================
; Gale Spear / Air Move Forward
; 疾風槍 / 空中向前移動
;===========================================================================
[Statedef 1452]
type = A
movetype = A
physics = N
;anim = 1452
velset = 0,0
poweradd = 0
ctrl = 0
juggle = 4
sprpriority = 3

[State 1452, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 1452
value = 1452
elem = 4

[State 1452, 2]
type = RemoveExplod
trigger1 = Time = 0
id = 7700
ignorehitpause = 1
persistent = 0

[State 1452, 3]
type = StopSnd
trigger1 = Time = 0
channel = 17
ignorehitpause = 1

[State 1452, 4 (Gale Spear Slash A)]
type = Explod
trigger1 = AnimElemTime(6) = 0
anim = 7600
id = 7652
;space = stage
pos = cond(facing = 1,48,-48)*fvar(21),-78*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 16
removeongethit = 1
ignorehitpause = 0

[State 1452, 5 (Gale Spear Slash A Subtraction)]
type = Explod
trigger1 = AnimElemTime(6) = 0
anim = 7601
id = 7652
;space = stage
pos = cond(facing = 1,48,-48)*fvar(21),-78*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7600,2
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 16
removeongethit = 1
ignorehitpause = 0

[State 1452, 6]
type = Width
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
player = 50*(floor(const(size.xscale))),28*(floor(const(size.xscale)))
ignorehitpause = 1

[State 1452, 7 (Gale Spear Circle Wave 1)]
type = Explod
trigger1 = AnimElemTime(7) = 0
trigger2 = AnimElemTime(9) = 0
anim = 7611
id = 7652
;space = stage
pos = cond(facing = 1,102,-102)*fvar(21),-402*fvar(22)
facing = facing
bindid = id
bindtime = 1
ownpal = 1
scale = fvar(21)*1.60,fvar(22)*1.60
sprpriority = 2
removetime = 6
removeongethit = 1
ignorehitpause = 0

[State 1452, 8 (Gale Spear Circle Wave 2)]
type = Explod
trigger1 = AnimElemTime(8) = 0
trigger2 = AnimElemTime(10) = 0
anim = 7612
id = 7652
;space = stage
pos = cond(facing = 1,102,-102)*fvar(21),-402*fvar(22)
facing = facing
bindid = id
bindtime = 1
ownpal = 1
scale = fvar(21)*1.60,fvar(22)*1.60
sprpriority = 4
removetime = 6
removeongethit = 1
ignorehitpause = 0

[State 1452, 9]
type = VelSet
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
x = 75

[State 1452, 10 (Character Voice)]
type = PlaySnd
trigger1 = AnimElemTime(6) = 0
value = s5,22+(random%4)
channel = 0

[State 1452, 11 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElemTime(6) = 0
value = s6,8
channel = 16

[State 1452, 12]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
trigger1 = 1 || var(21):= 540 ;Hit Spark X
trigger1 = 1 || var(22):= -400 ;Hit Spark Y
trigger1 = 1 || var(23):= 7260 ;Hit Spark ID
trigger1 = 1 || var(24):= 7330 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1452 ;HitDef ID
attr = A, SA
animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 6, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.072))*fvar(13)),72*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.014))*fvar(13)),14*fvar(13))
getpower = 10,5
pausetime = 12,12
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = High
air.type = Low
ground.slidetime = 25+3*var(50)
ground.hittime = 25+3*var(50)
guard.slidetime = 35
guard.hittime = 35
ground.velocity = -19,-40
guard.velocity = -22
air.velocity = -13,-30
airguard.velocity = -12,-24
air.hittime = 25+3*var(50)
ground.cornerpush.veloff = -28.6
down.cornerpush.veloff = -14.3
air.cornerpush.veloff = -19.5
guard.cornerpush.veloff = -21
airguard.cornerpush.veloff = -15.6
airguard.ctrltime = 36
guard.dist = 850
guard.kill = 0 ;該招式無法在對手防禦時擊殺
palfx.time = 47
palfx.add = 0,120,0
palfx.mul = 255,255,255
palfx.sinadd = 10,10,10,30
palfx.color = 256
palfx.invertall = 0
fall = 1
air.fall = 1
id = 1452

[State 1452, 13]
type = Helper
triggerall = Alive = 1
trigger1 = NumHelper(12980) < 6 ;粒子總數量限制(所有寫上助手ID號12980的招式，最多6個)。
trigger1 = MoveHit >= 1
name = "Wind Element Particle" ;風元素粒子
stateno = 12980
id = 12980
postype = p2
pos = 0,(target,const(size.mid.pos.y))
ownpal = 1
size.xscale = fvar(21)*0.65
size.yscale = fvar(22)*0.65
ignorehitpause = 1
persistent = 1

[State 1452, 14]
type = Width
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(12) < 0
player = 28*(floor(const(size.xscale))),28*(floor(const(size.xscale)))
ignorehitpause = 1

[State 1452, 15]
type = Gravity
trigger1 = AnimElemTime(11) >= 0

[State 1452, 16]
type = VelAdd
triggerall = Vel X > 0
trigger1 = AnimElemTime(11) >= 0
x = -3.2

[State 1452, 17]
type = CtrlSet
trigger1 = AnimElemTime(16) >= 0
value = 1

[State 1452, 18 (To Next State 1489)]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 1489
ctrl = 0

;===========================================================================
; Gale Spear / Air Move Downward
; 疾風槍 / 空中向下移動
;===========================================================================
[Statedef 1475]
type = A
movetype = A
physics = N
;anim = 1425
velset = 0,0
poweradd = 0
ctrl = 0
juggle = 4
sprpriority = 3

[State 1475, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 1475
value = 1475

[State 1475, 2]
type = VelSet
triggerall = AnimElem = 1
trigger1 = PrevStateNo = 1465
x = 5
y = 0

[State 1475, 3 (Gale Spear Slash C)]
type = Explod
trigger1 = AnimElemTime(5) = 0
anim = 7607
id = 7675
;space = stage
pos = cond(facing = 1,-230,230)*fvar(21),-70*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = -1
removeongethit = 1
ignorehitpause = 0

[State 1475, 4 (Gale Spear Slash C Subtraction)]
type = Explod
trigger1 = AnimElemTime(5) = 0
anim = 7608
id = 7675
;space = stage
pos = cond(facing = 1,-230,230)*fvar(21),-70*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7600,2
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = -1
removeongethit = 1
ignorehitpause = 0

[State 1475, 5]
type = Width
trigger1 = AnimElemTime(6) >= 0
player = 94*(floor(const(size.xscale))),0
ignorehitpause = 1

[State 1475, 6 (Gale Spear Circle Wave 5)]
type = Explod
trigger1 = AnimElemTime(6) = 0
trigger2 = AnimElemTime(8) = 0
anim = 7617
id = 7675
;space = stage
pos = cond(facing = 1,-30,30)*fvar(21),-300*fvar(22)
facing = facing
bindid = id
bindtime = 1
ownpal = 1
scale = fvar(21)*1.60,fvar(22)*1.60
sprpriority = 2
removetime = 6
removeongethit = 1
ignorehitpause = 0

[State 1475, 7 (Gale Spear Circle Wave 6)]
type = Explod
trigger1 = AnimElemTime(7) = 0
trigger2 = AnimElemTime(9) = 0
anim = 7618
id = 7675
;space = stage
pos = cond(facing = 1,-30,30)*fvar(21),-300*fvar(22)
facing = facing
bindid = id
bindtime = 1
ownpal = 1
scale = fvar(21)*1.60,fvar(22)*1.60
sprpriority = 4
removetime = 6
removeongethit = 1
ignorehitpause = 0

[State 1475, 8]
type = VelSet
trigger1 = AnimElemTime(6) >= 0
x = 48
y = 48

[State 1475, 9 (Character Voice)]
type = PlaySnd
trigger1 = AnimElemTime(6) = 0
value = s5,22+(random%4)
channel = 0

[State 1475, 10 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElemTime(6) = 0
value = s6,8
channel = 16

[State 1475, 11]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElemTime(6) >= 0
trigger1 = 1 || var(21):= 380 ;Hit Spark X
trigger1 = 1 || var(22):= 100 ;Hit Spark Y
trigger1 = 1 || var(23):= 7260 ;Hit Spark ID
trigger1 = 1 || var(24):= 7330 ;Guard Spark ID
trigger1 = 1 || var(25):= -50 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1475 ;HitDef ID
attr = A, SA
animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 6, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.072))*fvar(13)),72*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.014))*fvar(13)),14*fvar(13))
getpower = 60,30
pausetime = 12,12
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = Low
air.type = Low
ground.slidetime = 25+3*var(50)
ground.hittime = 25+3*var(50)
guard.slidetime = 28
guard.hittime = 28
ground.velocity = -19,-40
guard.velocity = -22
air.velocity = -13,-30
airguard.velocity = -12,-24
air.hittime = 25+3*var(50)
ground.cornerpush.veloff = -28.6
down.cornerpush.veloff = -28.6
air.cornerpush.veloff = -14.5
guard.cornerpush.veloff = -21
airguard.cornerpush.veloff = -10.6
airguard.ctrltime = 29
guard.dist = 850
guard.kill = 0 ;該招式無法在對手防禦時擊殺
palfx.time = 47
palfx.add = 0,120,0
palfx.mul = 255,255,255
palfx.sinadd = 10,10,10,30
palfx.color = 256
palfx.invertall = 0
fall = 1
air.fall = 1
id = 1475

[State 1475, 12]
type = Helper
triggerall = Alive = 1
trigger1 = NumHelper(12980) < 6 ;粒子總數量限制(所有寫上助手ID號12980的招式，最多6個)。
trigger1 = MoveHit >= 1
name = "Wind Element Particle" ;風元素粒子
stateno = 12980
id = 12980
postype = p2
pos = 0,(target,const(size.mid.pos.y))
ownpal = 1
size.xscale = fvar(21)*0.65
size.yscale = fvar(22)*0.65
ignorehitpause = 1
persistent = 1

[State 1475, 13 (To Next State 1489)]
type = ChangeState
trigger1 = Pos Y >= -210 && Vel Y > 0
value = 1489
ctrl = 0

;===========================================================================
; Gale Spear (Landing)
; 疾風槍 (落地)
;===========================================================================
[Statedef 1489]
type = S
movetype = I
physics = S
;anim = 1489
ctrl = 0
poweradd = 0
movehitpersist = 1 ;如果設置為1 上一個狀態中招式擊中的信息(例如Statedef 1402的HitDef擊中即為MoveHit = 1)將延續到這個狀態。
sprpriority = 3

[State 1489, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = PrevStateNo != 1475
trigger1 = Anim != 1489
value = 1489
elem = 2

[State 1489, 2]
type = RemoveExplod
trigger1 = Time = 0
id = -1 ;移除所有的Explod

[State 1489, 3]
type = ChangeAnim
triggerall = Time = 0
trigger1 = PrevStateNo = 1475
trigger1 = Anim != 1489
value = 1489
elem = 1

[State 1489, 4]
type = PalFX
triggerall = Time = 0
triggerall = PrevStateNo = 1475
trigger1 = NumExplod(7855) > 0
time = 10
add = 0,100,0
mul = 256,256,256
sinadd = 0,50,0,20
invertall = 0
color = 256
ignorehitpause = 1
persistent = 0 ;不可持續

[State 1489, 5 (Gale Spear Slash Landing)]
type = Explod
triggerall = PrevStateNo = 1475
trigger1 = AnimElemTime(1) = 0
anim = 8227
;id = 7675 ;關閉id可以避免被上面的RemoveExplod消除
;space = stage
pos = cond(facing = 1,400,-400)*fvar(21),0
facing = facing
bindid = id
bindtime = 1
ownpal = 1
remappal = 8224,1
scale = fvar(21)*0.75,fvar(22)*0.75
sprpriority = 6
removetime = 18
removeongethit = 0
ignorehitpause = 0
persistent = 0

[State 1489, 6]
type = PosSet
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
y = 0

[State 1489, 7]
type = VelSet
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
y = 0

[State 1489, 8 (Land Effect)]
type = Explod
trigger1 = AnimElem = 2
anim = 7052
pos = 0,0
facing = facing
bindid = id
bindtime = 1;只綁定本體1ticks
ownpal = 1
sprpriority = -3
scale = fvar(21)*2.80,fvar(22)*2.80

[State 1489, 9 (Landing Sound)];著地的音效
type = PlaySnd
trigger1 = AnimElem = 2
value = s47,0 ;人物落地產生的音效不應受攻擊而中斷 (channel默認值為-1)

[State 1489, 10]
type = VelAdd
triggerall = Vel X > 0
trigger1 = AnimElemTime(1) >= 0
x = -1.8

[State 1489, 11 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===========================================================================
; Kuzukaze Spear《Command Grab》/ Trigger
; 屑風槍《指令投》/ 接觸
;===========================================================================
[Statedef 1500]
type = S
movetype = A
physics = S
anim = 1500
ctrl = 0
poweradd = 0
juggle = 0
sprpriority = 4

[State 1500, 1]
type = HitBy
trigger1 = Time = 0
value = SCA, NT, ST
time = 4
ignorehitpause = 1

[State 1500, 2]
type = HitDef
;trigger1 = AnimElem = 1
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
trigger1 = 1 || var(21):= -1 ;Hit Spark X
trigger1 = 1 || var(22):= -1 ;Hit Spark Y
trigger1 = 1 || var(23):= -1 ;Hit Spark ID
trigger1 = 1 || var(24):= -1 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1500 ;HitDef ID
trigger1 = (P2StateNo != [120,159]) ;當對手不是防禦狀態時
attr = S, ST
hitflag = M
;guardflag = ;缺省默認是一個empty(空的)字符串，意味著P2無法防禦這次攻擊
damage = 0,0
getpower = 30,15
numhits = 0
priority = 2, Dodge
sparkno = -1
p1sprpriority = 1
p2sprpriority = 0
p2facing = 1
p1stateno = 1510
p2stateno = 1520
guard.dist = 0
kill = 0
guard.kill = 0
id = 1500
;fall = 1

[State 1500, 3]
type = HitDef
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
trigger1 = 1 || var(21):= -1 ;Hit Spark X
trigger1 = 1 || var(22):= -1 ;Hit Spark Y
trigger1 = 1 || var(23):= -1 ;Hit Spark ID
trigger1 = 1 || var(24):= -1 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 1500 ;HitDef ID
trigger1 = (P2StateNo = [120,159])
attr = S, ST
hitflag = M- ;-Hit僅在玩家不處於受擊狀態時有效
damage = 0,0
getpower = 30,15
numhits = 0
priority = 2, Dodge
sparkno = -1
p1sprpriority = 1
p2sprpriority = 0
p2facing = 1
p1stateno = 1510
p2stateno = 1520
guard.dist = 0
kill = 0
guard.kill = 0
id = 1500
;fall = 1

[State 1500, 4 (If AI Missed)]
type = ChangeState
triggerall = var(59) >= 1 || AILevel >= 1
trigger1 = frontedgedist >= 900
trigger1 = AnimElemTime(2) >= 0 || Time >= 2
value = cond(random < 500,700,cond(random < 500,200,400))
ctrl = 0

[State 1500, 5 (If AI Missed)]
type = ChangeState
triggerall = var(59) >= 1 || AILevel >= 1
trigger1 = frontedgedist < 900
trigger1 = AnimElemTime(2) >= 0 || Time >= 2
value = cond(random < 500,705,cond(random < 500,200,400))
ctrl = 0

[State 1500, 6 (Character Voice)]
type = PlaySnd
trigger1 = AnimElem = 2
value = s5,1+(random%2)
channel = 0

[State 1500, 7]
type = HitBy
trigger1 = AnimElemTime(2) >= 5
value =
time = 1
ignorehitpause = 1

[State 1500, 8 (Moves End / Trigger Fail)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===========================================================================
; Kuzukaze Spear《Command Grab》/ Start
; 屑風槍《指令投》/ 開始
;===========================================================================
[Statedef 1510]
type = S
movetype = A
physics = N
anim = 1513 ;1510
ctrl = 0
poweradd = 0
sprpriority = 0

[State 1510, 1]
type = Width
trigger1 = 1
edge = 362*(floor(const(size.xscale))),188*(floor(const(size.xscale)))

[State 1510, 2]
type = RemoveExplod
trigger1 = Time = 0
id = var(23)

[State 1510, 3]
type = VelSet
trigger1 = Time = 0
x = 0

[State 1510, 4]
type = PlaySnd
trigger1 = Time = 0
value = s6,4
channel = 16

[State 1510, 5]
type = Explod
trigger1 = AnimElem = 1
anim = 7280
id = 7280
bindid = id
;pos = cond(facing = 1,210,-210)*fvar(21)+(camerapos x+pos x),-415*fvar(22)+pos y ;在畫面兩端位置會偏掉 所以改為下方PoS的寫法和添加bindid參數
pos = cond(facing = 1,210,-210)*fvar(21),-415*fvar(22)
scale = fvar(21)*1.80,fvar(22)*1.80
facing = facing
sprpriority = 5
ownpal = 1
remappal = 7282,1
removeongethit = 1
ignorehitpause = 1

[State 1510, 6]
type = Explod
trigger1 = AnimElem = 1
anim = 7281
id = 7281
bindid = id
pos = cond(facing = 1,210,-210)*fvar(21),-415*fvar(22)
scale = fvar(21)*1.80,fvar(22)*1.80
facing = facing
sprpriority = 5
ownpal = 1
remappal = 7282,1
removeongethit = 1
ignorehitpause = 1

[State 1510, 7]
type = Explod
trigger1 = AnimElem = 1
anim = 7282
id = 7282
bindid = id
pos = cond(facing = 1,210,-210)*fvar(21),-415*fvar(22)
scale = fvar(21)*1.80,fvar(22)*1.80
facing = facing
sprpriority = 5
ownpal = 1
remappal = 7282,1
removeongethit = 1
ignorehitpause = 1

[State 1510, 8]
type = Explod
trigger1 = AnimElem = 1
anim = 7283
id = 7283
bindid = id
pos = cond(facing = 1,210,-210)*fvar(21),-415*fvar(22)
scale = fvar(21)*1.80,fvar(22)*1.80
facing = facing
sprpriority = -2
ownpal = 1
remappal = 7282,1
removeongethit = 1
ignorehitpause = 1

[State 1510, 9]
type = SprPriority
trigger1 = AnimElem = 2
value = 0

[State 1510, 10 (Spear / Rotation)] ;如果上面改為1510動畫 請將此代碼注釋掉 (加上Null)
type = Explod ;Null
trigger1 = AnimElemTime(2) = 0
anim = 7619
id = 7680
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*1.00,fvar(22)*1.00
sprpriority = 1
removetime = -1 ;27
removeongethit = 1
ignorehitpause = 0

[State 1510, 11]
type = TargetBind
trigger1 = AnimElemTime(1) > 0 && AnimElemTime(2) < 0
pos = 198*(floor(const(size.xscale))),0*const(size.yscale)

[State 1510, 12]
type = TargetBind
trigger1 = AnimElemTime(2) > 1 && AnimElemTime(3) < 0
pos = 150*(floor(const(size.xscale))),0*const(size.yscale)

[State 1510, 13 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElem = 4
value = s6,7
channel = 16

[State 1510, 14]
type = TargetBind
trigger1 = AnimElemTime(3) > 1 && AnimElemTime(6) < 0
pos = 126*(floor(const(size.xscale))),0*const(size.yscale)

[State 1510, 15]
type = TargetBind
trigger1 = AnimElemTime(6) > 1 && AnimElemTime(7) < 0
pos = 84*(floor(const(size.xscale))),0*const(size.yscale)

[State 1510, 16]
type = TargetBind
trigger1 = AnimElemTime(7) > 1 && AnimElemTime(8) < 0
pos = 42*(floor(const(size.xscale))),0*const(size.yscale)

[State 1510, 17]
type = TargetBind
trigger1 = AnimElemTime(8) > 1 && AnimElemTime(9) < 0
pos = -90*(floor(const(size.xscale))),0*const(size.yscale)

[State 1510, 18]
type = RemoveExplod
trigger1 = AnimElemTime(9) >= 0
id = 7680

[State 1510, 19]
type = Turn
trigger1 = AnimElem = 9

[State 1510, 20 (Character Voice)]
type = PlaySnd
trigger1 = AnimElem = 10
value = s5,20
channel = 0

[State 1510, 21]
type = PlaySnd
trigger1 = AnimElem = 10
value = s12,0
channel = 17

[State 1510, 22 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
trigger2 = NumTarget(1500) = 0
value = 0
ctrl = 1

;===========================================================================
; Kuzukaze Spear《Command Grab》/ Opponent Start
; 屑風槍《指令投》/ 對手 開始
;===========================================================================
[Statedef 1520]
type = S
movetype = H
physics = N
sprpriority = 1

[State 1520, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 1520

[State 1520, 2]
type = VelSet
trigger1 = AnimElem = 1
x = 18

[State 1520, 3]
type = SprPriority
trigger1 = AnimElem = 2
value = 1

[State 1520, 4]
type = Turn
trigger1 = AnimElem = 9

[State 1520, 5]
type = StateTypeSet
trigger1 = AnimElem = 10
statetype = S

[State 1520, 6]
type = VelSet
trigger1 = AnimElem = 10
x = -30

[State 1520, 7]
type = VelAdd
trigger1 = AnimElemtime(10) >= 2 && AnimElemtime(13) < 0
x = 1.2

[State 1520, 8]
type = VelSet
trigger1 = AnimElem = 13
x = 0

[State 1520, 9 (Target Reverts To Its Own State)]
type = SelfState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===========================================================================
; Whirlwind Wave Spear
; 旋風波動槍
;===========================================================================
[Statedef 1600]
type = S
movetype = A
physics = S
;anim = 1600
velset = 0,0
ctrl = 0
juggle = 0 ;6
poweradd = 20
sprpriority = 3

[State 1600, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 1600
value = 1600

[State 1600, 2 (Character Voice)]
type = PlaySnd
trigger1 = AnimElem = 2
value = s5,26
channel = 0

[State 1600, 3 (Spear Waving Sound)]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 4
trigger3 = AnimElem = 6
trigger4 = AnimElem = 8
trigger5 = AnimElem = 10
value = s6,1
channel = 16

[State 1600, 4 (Whirlwind Wave Spear Slash A)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 7620
id = 7620
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 18
removeongethit = 1
ignorehitpause = 0

[State 1600, 5 (Whirlwind Wave Spear Slash A Subtraction)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 7621
id = 7621
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7600,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 18
removeongethit = 1
ignorehitpause = 0

[State 1600, 6 (Whirlwind Land Effect 2)]
type = Explod
trigger1 = AnimElemTime(2) = 0
trigger2 = AnimElemTime(6) = 0
anim = 7055
id = 7055
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7055,1
sprpriority = -3
removetime = 12
scale = fvar(21)*1.72,fvar(22)*1.72
removeongethit = 1

[State 1600, 7 (Whirlwind Land Effect 1)]
type = Explod
trigger1 = AnimElemTime(2) = 0
trigger2 = AnimElemTime(6) = 0
anim = 7054
id = 7054
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
sprpriority = -3
removetime = 12
scale = fvar(21)*2.40,fvar(22)*2.40
removeongethit = 1

[State 1600, 8 (Whirlwind Wave Spear Slash B)]
type = Explod
trigger1 = AnimElemTime(11) = 0
anim = 7622
id = 7622
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 30
removeongethit = 1
ignorehitpause = 0

[State 1600, 9 (Whirlwind Wave Spear Slash B Subtraction)]
type = Explod
trigger1 = AnimElemTime(11) = 0
anim = 7623
id = 7623
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7600,2
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 30
removeongethit = 1
ignorehitpause = 0

[State 1600, 10 (Velocity Control / Player)]
type = Null
triggerall = var(59) = 0
trigger1 = command != "holdback"
trigger1 = (fvar(16):= 56)||1
trigger2 = command = "holdback"
trigger2 = (fvar(16):= 21)||1

[State 1600, 11 (Velocity Control / AI)]
type = Null
triggerall = var(59) >= 1
trigger1 = p2bodydist x >= 701
trigger1 = (fvar(16):= 56)||1
trigger2 = (p2bodydist x = [0,700])
trigger2 = (fvar(16):= cond(random < 820,21,56)) || 1
trigger3 = p2bodydist x < 0 
trigger3 = (fvar(16):= cond(random < 900,21,56)) || 1

[State 1600, 12 Cornerpush Veloff Effect)] ;角落推擠效果(避免招式在畫面最前端使用)。
type = VelSet
triggerall = AnimElemTime(12) >= 1
trigger1 = FrontEdgeBodyDist < 700
x = -((700-FrontEdgeBodyDist)*0.062)

[State 1600, 13 Cornerpush Veloff Effect)] ;角落推擠效果(避免招式在畫面最前端使用)。
type = VelAdd
triggerall = Vel X < 0
triggerall = AnimElemTime(12) >= 1
trigger1 = FrontEdgeBodyDist < 700
x = 0.22

[State 1600, 14 (Whirlwind Wave Spear Projectile)]
type = Helper
trigger1 = AnimElemTime(12) = 0
id = 7632
stateno = 7632
pos = 400*fvar(21),0
name = "Whirlwind Wave Spear Projectile"
postype = p1 
facing = 1
keyctrl = 0
ownpal = 1
size.xscale = fvar(21)*1.00
size.yscale = fvar(22)*1.00

;*其他的打擊火花效果(用於飛行道具)寫在[Statedef -2]上
;*如果X軸為0可以不加cond 也就是X軸為pos x+camerapos x即可

[State 1600, 15 (Effect Sound)] ;効果音
type = PlaySnd
trigger1 = AnimElem = 12
value = s6,12
channel = 17

[State 1600, 16 (Effect Sound)] ;効果音
type = PlaySnd
trigger1 = AnimElem = 12
value = s6,13
channel = 18

[State 1600, 17]
type = Width
trigger1 = AnimElemTime(13) >= 0 && AnimElemTime(21) < 0
player = 142*(floor(const(size.xscale))),0
ignorehitpause = 1

[State 1600, 18 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===========================================================================
; Ice Gale Spear
; 冰風槍
;===========================================================================
[Statedef 1700]
type = S
movetype = A
physics = N
;anim = 1700
velset = 0,0
ctrl = 0
juggle = 3
poweradd = 0
sprpriority = 3

[State 1700, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 1700
value = 1700

[State 1700, 2 (Ice Floor A)] ;冰層A
type = Explod
trigger1 = AnimElemTime(1) = 0
anim = 7647
id = 7687
;space = stage
pos = cond(facing = 1,120,-120)*fvar(21),30*fvar(22)
facing = facing
bindid = id
bindtime = 1
removetime = 26
scale = fvar(21)*1.80,fvar(22)*1.80
removeongethit = 1
ignorehitpause = 1
sprpriority = 0
shadow = 0,0,0
ownpal = 1

[State 1700, 3 (Ice Floor B)] ;冰層B
type = Helper
trigger1 = NumHelper(7648) = 0
trigger1 = AnimElemTime(1) = 0
id = 7648
stateno = 7648
name = "Ice Floor Freeze Effect" ;冰層凍結效果
pos = 450*fvar(21),20*fvar(22)
postype = p1
ownpal = 1
ignorehitpause = 1

[State 1700, 4]
type = VelSet
trigger1 = AnimElemTime(1) = 1
x = 14
y = 0

[State 1700, 5 (Ice Gale Spear Slash)]
type = Explod
trigger1 = AnimElemTime(5) = 0
anim = 7605
id = 7687
;space = stage
pos = cond(facing = 1,248,-248)*fvar(21),-178*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
angle = 10 ;*
remappal = 7600,4
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 16
removeongethit = 1
ignorehitpause = 0

;*該招式第六個動畫元素(人物的動作)之後有使用角度功能
; 此為MUGEN 1.1以上版本限定的技術
; 因此添加angle功能調整Explod

[State 1700, 6 (Ice Gale Spear Slash Subtraction)]
type = Explod
trigger1 = AnimElemTime(5) = 0
anim = 7606
id = 7687
;space = stage
pos = cond(facing = 1,248,-248)*fvar(21),-178*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
angle = 10
remappal = 7600,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 16
removeongethit = 1
ignorehitpause = 0

[State 1700, 7 (Ice Gale Spear Circle Wave)]
type = Explod
trigger1 = AnimElemTime(6) = 0
trigger2 = AnimElemTime(8) = 0
anim = 7615
id = 7687
;space = stage
pos = 0,-310*fvar(22)
facing = facing
bindid = id
bindtime = 1
ownpal = 1
angle = 10
remappal = 7600,4
scale = fvar(21)*1.60,fvar(22)*1.60
sprpriority = 2
removetime = 6
removeongethit = 1
ignorehitpause = 0

[State 1700, 8 (Ice Gale Spear Circle Wave)]
type = Explod
trigger1 = AnimElemTime(7) = 0
trigger2 = AnimElemTime(9) = 0
anim = 7616
id = 7687
;space = stage
pos = 0,-310*fvar(22)
facing = facing
bindid = id
bindtime = 1
ownpal = 1
angle = 10
remappal = 7600,4
scale = fvar(21)*1.60,fvar(22)*1.60
sprpriority = 4
removetime = 6
removeongethit = 1
ignorehitpause = 0

[State 1700, 9]
type = VelSet
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(10) < 0
x = 14
y = -20

[State 1700, 10 (Character Voice)]
type = PlaySnd
trigger1 = AnimElemTime(6) = 0
value = s5,22+(random%4)
channel = 0

[State 1700, 11 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElemTime(6) = 0
value = s6,9
channel = 16

[State 1700, 12]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
statetype = A
movetype = A
physics = N

[State 1700, 13]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(8) < 0
attr = A, SA
animtype = Hard
air.animtype = Hard
hitflag = MAFDP
guardflag = MA
priority = 6, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.038))*fvar(13)),38*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.008))*fvar(13)),8*fvar(13))
getpower = 30,15
pausetime = 12,16
sparkno = s7203
guard.sparkno = s7303
sparkxy = -150*fvar(21),cond(p2dist y < 0,(p2dist y+(-350)),-350)*fvar(22)
hitsound = s7,3
guardsound = s8,1
ground.type = High
air.type = Low
ground.slidetime = 42+4*var(50)
ground.hittime = 42+4*var(50)
guard.slidetime = 23
guard.hittime = 23
ground.velocity = -16,-58
guard.velocity = -16
air.velocity = -14,-38
airguard.velocity = -12,-25
guard.dist = 850
air.hittime = 42+4*var(50)
ground.cornerpush.veloff = -20.8
down.cornerpush.veloff = -7.2
air.cornerpush.veloff = -18.2
guard.cornerpush.veloff = -20.8
airguard.cornerpush.veloff = -15.6
airguard.ctrltime = 42
palfx.time = 47
palfx.add = 0,50,240
palfx.mul = 120,224,150
palfx.sinadd = 20,30,60,30
palfx.color = 256
palfx.invertall = 0
fall = 0
air.fall = 1
fall.recover = 0
id = 1700

[State 1700, 14 (Ice Element Hit Spark Effect)]
type = Explod
triggerall = NumExplod(7857) = 0
triggerall = NumTarget(1700)
trigger1 = (Target(1700),StateNo != [120,159])
trigger1 = Target(1700),StateType != L
trigger1 = Target(1700),MoveType = H
trigger1 = MoveHit >= 1
anim = 7857
id = 7857
space = stage
bindid = target,id
bindtime = -1
pos = 0,const(size.mid.pos.y) ;這裡對應的是對手(因為bindid = target,id)
facing = facing
sprpriority = 1
removetime = 24
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
removeongethit = 1
ignorehitpause = 1
persistent = 0 ;不持續(出現一次)

[State 1700, 15]
type = HitDef
;triggerall = !MoveContact && !MoveReversed ;因為需要二連擊 這裡就不能再設置
triggerall = GameTime %6 = 0 ;由於AnimElemTime(8) >= 0 && AnimElemTime(10) < 0之間為6ticks幀數，設定6%就只能擊中一次
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(10) < 0
attr = A, SA
animtype = Hard
air.animtype = Hard
hitflag = MAFP
guardflag = MA
priority = 6, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.038))*fvar(13)),38*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.008))*fvar(13)),8*fvar(13))
getpower = 30,15
pausetime = 12,16
sparkno = s7203
guard.sparkno = s7303
sparkxy = -150*fvar(21),cond(p2dist y < 0,(p2dist y+(-350)),-350)*fvar(22)
hitsound = s7,3
guardsound = s8,1
ground.type = High
air.type = Low
ground.slidetime = 42+4*var(50)
ground.hittime = 42+4*var(50)
guard.slidetime = 23
guard.hittime = 23
ground.velocity = -16,-44
guard.velocity = -16
air.velocity = -20,-40
airguard.velocity = -18,-28
air.hittime = 42+4*var(50)
ground.cornerpush.veloff = -20.8
down.cornerpush.veloff = -7.2
air.cornerpush.veloff = -26
guard.cornerpush.veloff = -20.8
airguard.cornerpush.veloff = -23.4
airguard.ctrltime = 42
palfx.time = 47
palfx.add = 0,50,240
palfx.mul = 120,224,150
palfx.sinadd = 20,30,60,30
palfx.color = 256
palfx.invertall = 0
fall = 0
air.fall = 1
fall.recover = 0
id = 1701

[State 1700, 16 (Ice Element Hit Spark Effect)]
type = Explod
triggerall = NumExplod(7857) = 0
triggerall = NumTarget(1701)
trigger1 = (Target(1701),StateNo != [120,159])
trigger1 = Target(1701),StateType != L
trigger1 = Target(1701),MoveType = H
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
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
removeongethit = 1
ignorehitpause = 1
persistent = 0 ;不持續(出現一次)

[State 1700, 17 (Counter Spark A)]
type = Explod
triggerall = NumEnemy
triggerall = var(50) = 1
triggerall = NumExplod(7305) = 0
triggerall = EnemyNear(var(48)),MoveType = H
trigger1 = MoveHit = 1
id = 7305
anim = 7305
space = stage
bindid = id
pos = cond(facing = 1,315,-315)*fvar(21),cond(p2dist y < 0,(p2dist y+(-350)),-350)*fvar(22)
facing = facing
ownpal = 1
removetime = 5
sprpriority = 9
scale = fvar(21)*0.52,fvar(22)*0.52
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 1700, 18 (Counter Spark B)]
type = Explod
triggerall = NumEnemy
triggerall = var(50) = 1
triggerall = NumExplod(7306) = 0
triggerall = EnemyNear(var(48)),MoveType = H
trigger1 = MoveHit = 1
id = 7306
anim = 7306
space = stage
bindid = id
pos = cond(facing = 1,315,-315)*fvar(21),cond(p2dist y < 0,(p2dist y+(-350)),-350)*fvar(22)
facing = facing
ownpal = 1
removetime = 9
sprpriority = 9
scale = fvar(21)*0.42,fvar(22)*0.42
supermovetime = 59
pausemovetime = 59
ignorehitpause = 1

[State 1700, 19]
type = Gravity
trigger1 = AnimElemTime(10) >= 0

[State 1700, 20]
type = VelAdd
triggerall = Vel X > 0
trigger1 = AnimElemTime(10) >= 0
x = -0.50

[State 1700, 21 (To Next State 50)]
type = ChangeState
trigger1 = AnimTime = 0
trigger2 = AnimElemTime(10) >= 0
trigger2 = Pos Y >= 0 && Vel Y > 0
value = 50
ctrl = 1

;===========================================================================
; Dragon Fang Spear (Preparatory Action)
; 龍牙槍 (預備動作)
;===========================================================================
[Statedef 2400]
type = S
movetype = A
physics = S
;anim = 2400
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = 3

[State 2400, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 2400
value = 2400

[State 2400, 2]
type = Width
trigger1 = 1
player = 28*(floor(const(size.xscale))),28*(floor(const(size.xscale)))
ignorehitpause = 1

[State 2400, 3 (Dragon Fang Spear / Turn Detection FVar is OFF)] ;龍牙槍 / 轉向 檢測用浮點變量關閉
type = VarSet
trigger1 = Time = 0
fv = 30
value = 0
ignorehitpause = 1

[State 2400, 4 (Player Back To State 1402)]
type = ChangeState
triggerall = var(59) = 0 || AILevel = 0
trigger1 = command != "Dragon_Fang_Spear"
trigger1 = AnimElemTime(1) >= 1 && AnimElemTime(4) < 3
value = 1402

[State 2400, 5 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElemTime(1) = 6
value = s6,10
channel = 17

[State 2400, 6 (Dragon Fang Spear Slash / Recharge Effect A1)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 7700
id = 7700
bindid = id
bindtime = -1
pos = 0,-300*fvar(22)
scale = fvar(21),fvar(22)
removetime = 11
sprpriority = 4
xangle = 40
yangle = 40
ownpal = 1
removeongethit = 1

[State 2400, 7 (Dragon Fang Spear Slash / Recharge Effect A2)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 7700
id = 7700
bindid = id
bindtime = -1
pos = 0,-300*fvar(22)
scale = fvar(21),fvar(22)
removetime = 11
sprpriority = 4
xangle = 40
yangle = -40
ownpal = 1
removeongethit = 1

[State 2400, 8 (Player To Next State 2402)]
type = ChangeState
triggerall = var(59) = 0 || AILevel = 0
trigger1 = AnimElemTime(4) >= 3
value = 2402

[State 2400, 9 (Player To Next State 2402)]
type = ChangeState
triggerall = var(59) >= 1 || AILevel >= 1
trigger1 = AnimElemTime(4) >= 3
value = 2402

;===========================================================================
; Dragon Fang Spear
; 龍牙槍
;===========================================================================
[Statedef 2402]
type = S
movetype = A
physics = S
;anim = 2402
velset = 0,0
ctrl = 0
juggle = 5
poweradd = 0
sprpriority = 3

[State 2402, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 2402
value = 2402
elem = 5

[State 2402, 2] ;飛行道具無效
type = HitBy
trigger1 = 1
value = ,NA ,SA ,HA ,NT ,ST ,HT
time = 1

[State 2402, 3]
type = PlayerPush
trigger1 = 1
value = 1
ignorehitpause = 1

[State 2402, 4]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 2402, 5]
type = Width
trigger1 = 1
player = 28*(floor(const(size.xscale))),28*(floor(const(size.xscale)))
ignorehitpause = 1

[State 2402, 6 (Dragon Fang Spear / Turn Detection FVar is OFF)] ;龍牙槍 / 轉向 檢測用浮點變量關閉
type = VarSet
trigger1 = AnimElemTime(5) = 0
fv = 30
value = 0

[State 2402, 7]
type = PalFX
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(7) < 0
time = 1
add = 24+(time*8),0,0
mul = 256,256,256
sinadd = 0,0,0,1
invertall = 0
color = 256
ignorehitpause = 1 ;測試過會受到攻擊暫停影響短暫失效 所以請設定為1(應該是time設定為1的關係)

[State 2402, 8 (Dragon Fang Spear Aura)]
type = Explod
trigger1 = AnimElemTime(5) = 0
anim = 7702
id = 7702
;space = stage
pos = 0,-285*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7900,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 7
removeongethit = 1
ignorehitpause = 0

[State 2402, 9 (Dragon Fang Spear Slash / Recharge Effect B1)]
type = Explod
trigger1 = AnimElemTime(5) = 0
anim = 7701
id = 7702
bindid = id
bindtime = -1
pos = 0,-300*fvar(22)
scale = fvar(21),fvar(22)
removetime = 10
sprpriority = 1
xangle = 40
yangle = 40
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 2402, 10 (Dragon Fang Spear Slash / Recharge Effect B2)]
type = Explod
trigger1 = AnimElemTime(5) = 0
anim = 7701
id = 7702
bindid = id
bindtime = -1
pos = 0,-300*fvar(22)
scale = fvar(21),fvar(22)
removetime = 10
sprpriority = 1
xangle = 40
yangle = -40
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 2402, 11 (Dragon Fang Spear Slash)]
type = Explod
trigger1 = AnimElemTime(6) = 0
anim = 7705
id = 7702
;space = stage
pos = cond(facing = 1,-35,35)*fvar(21),-45*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.10,fvar(22)*2.00
sprpriority = 4
removetime = 17
removeongethit = 1
ignorehitpause = 0

[State 2402, 12 (Dragon Fang Spear Slash Subtraction)]
type = Explod
trigger1 = AnimElemTime(6) = 0
anim = 7706
id = 7702
;space = stage
pos = cond(facing = 1,-35,35)*fvar(21),-45*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7705,1
scale = fvar(21)*2.10,fvar(22)*2.00
sprpriority = 4
removetime = 17
removeongethit = 1
ignorehitpause = 0

[State 2402, 13]
type = PalFX
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
time = 1
add = 192,0,0
mul = 256,256,256
sinadd = 0,0,0,1
invertall = 0
color = 256
ignorehitpause = 1 ;測試過會受到攻擊暫停影響短暫失效 所以請設定為1(應該是time設定為1的關係)

[State 2402, 14]
type = VelSet
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
x = 96

[State 2402, 15 (Character Voice)]
type = PlaySnd
trigger1 = AnimElemTime(6) = 0
value = s5,27+(random%2)
channel = 0

[State 2402, 16 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElemTime(7) = 0
value = s6,11
channel = 18

[State 2402, 17]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
trigger1 = 1 || var(21):= 820 ;Hit Spark X
trigger1 = 1 || var(22):= -400 ;Hit Spark Y
trigger1 = 1 || var(23):= 7270 ;Hit Spark ID
trigger1 = 1 || var(24):= 7340 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 2402 ;HitDef ID
attr = S, SA
animtype = Hard
air.animtype = Hard
hitflag = MAFP
guardflag = MA
priority = 6, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.081))*fvar(13)),81*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.027))*fvar(13)),27*fvar(13))
getpower = 6,3
pausetime = 18,18
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = Low
air.type = Low
ground.slidetime = 33+2*var(50)
ground.hittime = 33+2*var(50)
guard.slidetime = 33
guard.hittime = 33
ground.velocity = -22,-38
guard.velocity = -22
air.velocity = -15,-28
airguard.velocity = -12,-24
air.hittime = 33+2*var(50)
ground.cornerpush.veloff = -28.6
down.cornerpush.veloff = -28.6
air.cornerpush.veloff = -19.5
guard.cornerpush.veloff = -28.6
airguard.cornerpush.veloff = -15.6
airguard.ctrltime = 33
guard.dist = 870
palfx.time = 60
palfx.add = 255,80,0
palfx.mul = 255,255,255
palfx.sinadd = 10,10,10,30
palfx.color = 256
palfx.invertall = 0
fall = 1
air.fall = 1
id = 2402
chainid = -1

[State 2402, 18]
type = HitDef
triggerall = NumTarget(1302) >= 1 ;旋風槍C 擊落受擊 / 地面反彈離地
triggerall = Target(1302),StateType = L ;目標1302狀態類型為躺下
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
trigger1 = 1 || var(21):= 820 ;Hit Spark X
trigger1 = 1 || var(22):= -400 ;Hit Spark Y
trigger1 = 1 || var(23):= 7270 ;Hit Spark ID
trigger1 = 1 || var(24):= 7340 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 2402 ;HitDef ID
attr = S, SA
animtype = Hard
air.animtype = Hard
hitflag = MAFDP ;增加可擊中躺下對手
guardflag = MA
priority = 6, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.081))*fvar(13)),81*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.027))*fvar(13)),27*fvar(13))
getpower = 6,3
pausetime = 18,18
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = Low
air.type = Low
ground.slidetime = 33+2*var(50)
ground.hittime = 33+2*var(50)
guard.slidetime = 33
guard.hittime = 33
ground.velocity = -22,-38
guard.velocity = -22
air.velocity = -15,-28
airguard.velocity = -12,-24
air.hittime = 33+2*var(50)
ground.cornerpush.veloff = -28.6
down.cornerpush.veloff = -28.6
air.cornerpush.veloff = -19.5
guard.cornerpush.veloff = -28.6
airguard.cornerpush.veloff = -15.6
airguard.ctrltime = 33
guard.dist = 870
palfx.time = 60
palfx.add = 255,80,0
palfx.mul = 255,255,255
palfx.sinadd = 10,10,10,30
palfx.color = 256
palfx.invertall = 0
fall = 1
air.fall = 1
id = 2402
chainid = 1302 ;限定連擊旋風槍C (組合二)

[State 2402, 19 (Does the detection use Dragon Fang Spear / Alter Course?)] ;檢測是否使用 龍牙槍 / 方向轉換?
type = VarSet
triggerall = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
trigger1 = MoveContact >= 1 ;招式接觸時*
;trigge1 = MoveContact >= 1 && NumTarget(2402) ;招式接觸時 & 目標編號2402*
trigger1 = var(59) = 0 && Command = "z" ;玩家使用時(AI = OFF) & 按下Z鍵
fv = 30
value = 1 ;以上條件達成則開啟
ignorehitpause = 1

;*如果對手有霸體 不添加NumTarget(2402)才能對有霸體的角色進行轉向

[State 2402, 20 (Does the detection use Dragon Fang Spear / Alter Course?)] ;檢測是否使用 龍牙槍 / 方向轉換?
type = VarSet
triggerall = AnimElemTime(7) >= 0 && AnimElemTime(10) < 0 ;AnimElemTime(10)時不檢測轉向
triggerall = MoveContact >= 1 ;招式接觸時
trigger1 = var(59) = 3 && Random < 75 ;電腦等級3(AI LV 3)
trigger2 = var(59) = 4 && Random < 150 ;電腦等級4(AI LV 4)
trigger3 = var(59) = 5 && Random < 300 ;電腦等級5(AI LV 5)
trigger4 = var(59) = 6 && Random < 450 ;電腦等級6(AI LV 6)
trigger5 = var(59) = 7 && Random < 600 ;電腦等級7(AI LV 7)
trigger6 = var(59) >= 8 && Random < 750 ;電腦等級8以上(AI LV >= 8)
fv = 30
value = 1 ;以上條件達成則開啟
ignorehitpause = 1

[State 2402, 21]
type = PlayerPush
triggerall = fvar(30) >= 1
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
value = 0

[State 2402, 22]
type = VelAdd
triggerall = fvar(30) >= 1
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
x = 12

[State 2402, 23 (To Next State 2412 / Alter Course)]
type = ChangeState
triggerall = fvar(30) >= 1
trigger1 = AnimElemTime(11) >= 2
value = 2412
ctrl = 0

[State 2402, 24 (To Next State 2489 / No Alter Course)]
type = ChangeState
trigger1 = AnimTime = 0
value = 2489
ctrl = 0

;===========================================================================
; Dragon Fang Spear / Alter Course
; 龍牙槍 / 方向轉換
;===========================================================================
[Statedef 2412]
type = S
movetype = A
physics = S
;anim = 2412
velset = 24,0 ;X軸24用為上一個招式的後座力
ctrl = 0
poweradd = 0
sprpriority = 3

[State 2412, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 2412
value = 2412

[State 2412, 2]
type = Turn
trigger1 = Time = 0
ignorehitpause = 1
persistent = 0

[State 2412, 3]
type = RemoveExplod
trigger1 = Time = 0
id = 7702
ignorehitpause = 1
persistent = 0

[State 2412, 4]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 2412, 5]
type = HitBy
trigger1 = 1
value = ,NA ,SA ,HA ,NT ,ST ,HT
time = 1

[State 2412, 6]
type = PlayerPush
trigger1 = 1
value = 1 ;0
ignorehitpause = 1

[State 2412, 7]
type = Width
trigger1 = 1
player = 28*(floor(const(size.xscale))),34*(floor(const(size.xscale)))
ignorehitpause = 1

[State 2412, 8]
type = PalFX
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(9) < 0
time = 1
add = 192,0,0
mul = 256,256,256
sinadd = 0,0,0,1
invertall = 0
color = 256
ignorehitpause = 1 ;測試過會受到攻擊暫停影響短暫失效 所以請設定為1(應該是time設定為1的關係)

[State 2412, 9 (Dragon Fang Spear Aura / Alter Course)]
type = Explod
trigger1 = AnimElemTime(2) = 2
anim = 7703
id = 7712
;space = stage
pos = 0,-285*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7900,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 7
removeongethit = 1
ignorehitpause = 0

[State 2412, 10 (Character Voice)]
type = PlaySnd
trigger1 = AnimElemTime(4) = 0
value = s5,29
channel = 0

[State 2412, 11 (Dragon Fang Spear Slash / Alter Course)]
type = Explod
trigger1 = AnimElemTime(4) = 0
anim = 7707
id = 7712
;space = stage
pos = cond(facing = 1,-35,35)*fvar(21),-45*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.10,fvar(22)*2.00
sprpriority = 4
removetime = 17
removeongethit = 1
ignorehitpause = 0

[State 2412, 12 (Dragon Fang Spear Slash / Alter Course Subtraction)]
type = Explod
trigger1 = AnimElemTime(4) = 0
anim = 7708
id = 7712
;space = stage
pos = cond(facing = 1,-35,35)*fvar(21),-45*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7705,1
scale = fvar(21)*2.10,fvar(22)*2.00
sprpriority = 4
removetime = 17
removeongethit = 1
ignorehitpause = 0

[State 2412, 13]
type = VelSet
trigger1 = AnimElemTime(4) = 0
x = 0
y = 0

[State 2412, 14]
type = VelSet
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(9) < 0
x = 90

[State 2412, 15 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElemTime(5) = 0
value = s6,11
channel = 18

[State 2412, 16]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(9) < 0
trigger1 = 1 || var(21):= 820 ;Hit Spark X
trigger1 = 1 || var(22):= -400 ;Hit Spark Y
trigger1 = 1 || var(23):= 7270 ;Hit Spark ID
trigger1 = 1 || var(24):= 7340 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 2412 ;HitDef ID
attr = S, SA
animtype = Hard
air.animtype = Hard
hitflag = MAFP
guardflag = MA
priority = 6, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.045))*fvar(13)),45*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.015))*fvar(13)),15*fvar(13))
getpower = 6,3
pausetime = 18,18
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = Low
air.type = Low
ground.slidetime = 33+2*var(50)
ground.hittime = 33+2*var(50)
guard.slidetime = 32
guard.hittime = 32
ground.velocity = -22,-38
guard.velocity = -22
air.velocity = -15,-28
airguard.velocity = -12,-24
air.hittime = 33+2*var(50)
airguard.ctrltime = 32
guard.dist = 870
palfx.time = 60
palfx.add = 255,80,0
palfx.mul = 255,255,255
palfx.sinadd = 10,10,10,30
palfx.color = 256
palfx.invertall = 0
fall = 1
air.fall = 1
id = 2412

[State 2412, 17 (To Next State 2489)]
type = ChangeState
trigger1 = AnimTime = 0
value = 2489
ctrl = 0

;===========================================================================
; Dragon Fang Spear / Air (Preparatory Action)
; 龍牙槍 / 空中 (預備動作)
;===========================================================================
[Statedef 2450]
type = A
movetype = A
physics = N
;anim = 2450
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = 3

[State 2450, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 2450
value = 2450

[State 2450, 2 (Dragon Fang Spear / Turn Detection FVar is OFF)] ;龍牙槍 / 轉向 檢測用浮點變量關閉
type = VarSet
trigger1 = Time = 0
fv = 30
value = 0
ignorehitpause = 1

[State 2450, 3 (Player Back To State 1452)]
type = ChangeState
triggerall = var(59) = 0 || AILevel = 0
trigger1 = command != "Dragon_Fang_Spear"
trigger1 = AnimElemTime(1) >= 1 && AnimElemTime(4) < 3
value = 1452

[State 2450, 4 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElemTime(1) = 6
value = s6,10
channel = 17

[State 2450, 5 (Dragon Fang Spear Slash / Recharge Effect A1)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 7700
id = 7750
bindid = id
bindtime = -1
pos = 0,-380*fvar(22)
scale = fvar(21),fvar(22)
removetime = 11
sprpriority = 4
xangle = 40
yangle = 40
ownpal = 1
removeongethit = 1

[State 2450, 6 (Dragon Fang Spear Slash / Recharge Effect A2)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 7700
id = 7750
bindid = id
bindtime = -1
pos = 0,-380*fvar(22)
scale = fvar(21),fvar(22)
removetime = 11
sprpriority = 4
xangle = 40
yangle = -40
ownpal = 1
removeongethit = 1

[State 2450, 7 (Player To Next State 2452)]
type = ChangeState
triggerall = var(59) = 0 || AILevel = 0
trigger1 = AnimElemTime(4) >= 3
value = 2452

[State 2400, 8 (Player To Next State 2452)]
type = ChangeState
triggerall = var(59) >= 1 || AILevel >= 1
trigger1 = AnimElemTime(4) >= 3
value = 2452

;===========================================================================
; Dragon Fang Spear / Air 
; 龍牙槍 / 空中
;===========================================================================
[Statedef 2452]
type = A
movetype = A
physics = N
;anim = 2452
velset = 0,0
ctrl = 0
juggle = 5
poweradd = 0
sprpriority = 3

[State 2452, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 2452
value = 2452
elem = 5

[State 2452, 2] ;飛行道具無效
type = HitBy
trigger1 = 1
value = ,NA ,SA ,HA ,NT ,ST ,HT
time = 1

[State 2452, 3]
type = PlayerPush
trigger1 = 1
value = 1 ;0
ignorehitpause = 1

[State 2452, 4]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 2452, 5 (Dragon Fang Spear / Turn Detection FVar is OFF)] ;龍牙槍 / 轉向 檢測用浮點變量關閉
type = VarSet
trigger1 = AnimElemTime(5) = 0
fv = 30
value = 0

[State 2452, 6]
type = PalFX
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(7) < 0
time = 1
add = 24+(time*8),0,0
mul = 256,256,256
sinadd = 0,0,0,1
invertall = 0
color = 256
ignorehitpause = 1 ;測試過會受到攻擊暫停影響短暫失效 所以請設定為1(應該是time設定為1的關係)

[State 2452, 7 (Dragon Fang Spear Aura)]
type = Explod
trigger1 = AnimElemTime(5) = 0
anim = 7702
id = 7752
;space = stage
pos = 0,-370*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7900,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 7
removeongethit = 1
ignorehitpause = 0

[State 2452, 8 (Dragon Fang Spear Slash / Recharge Effect B1)]
type = Explod
trigger1 = AnimElemTime(5) = 0
anim = 7701
id = 7752
bindid = id
bindtime = -1
pos = 0,-360*fvar(22)
scale = fvar(21),fvar(22)
removetime = 10
sprpriority = 1
xangle = 40
yangle = 40
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 2452, 9 (Dragon Fang Spear Slash / Recharge Effect B2)]
type = Explod
trigger1 = AnimElemTime(5) = 0
anim = 7701
id = 7752
bindid = id
bindtime = -1
pos = 0,-360*fvar(22)
scale = fvar(21),fvar(22)
removetime = 10
sprpriority = 1
xangle = 40
yangle = -40
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 2452, 10 (Dragon Fang Spear Slash)]
type = Explod
trigger1 = AnimElemTime(6) = 0
anim = 7705
id = 7752
;space = stage
pos = cond(facing = 1,-13,13)*fvar(21),-87*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.10,fvar(22)*2.00
sprpriority = 4
removetime = 17
removeongethit = 1
ignorehitpause = 0

[State 2452, 11 (Dragon Fang Spear Slash Subtraction)]
type = Explod
trigger1 = AnimElemTime(6) = 0
anim = 7706
id = 7752
;space = stage
pos = cond(facing = 1,-13,13)*fvar(21),-87*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7705,1
scale = fvar(21)*2.10,fvar(22)*2.00
sprpriority = 4
removetime = 17
removeongethit = 1
ignorehitpause = 0

[State 2452, 12 (Character Voice)]
type = PlaySnd
trigger1 = AnimElemTime(6) = 0
value = s5,27+(random%2)
channel = 0

[State 2452, 13]
type = Width
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
player = 50*(floor(const(size.xscale))),28*(floor(const(size.xscale)))
ignorehitpause = 1

[State 2452, 14]
type = PalFX
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
time = 1
add = 192,0,0
mul = 256,256,256
sinadd = 0,0,0,1
invertall = 0
color = 256
ignorehitpause = 1 ;測試過會受到攻擊暫停影響短暫失效 所以請設定為1(應該是time設定為1的關係)

[State 2452, 15]
type = VelSet
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
x = 96

[State 2452, 16 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElemTime(7) = 0
value = s6,11
channel = 18

[State 2452, 17]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
trigger1 = 1 || var(21):= 820 ;Hit Spark X
trigger1 = 1 || var(22):= -400 ;Hit Spark Y
trigger1 = 1 || var(23):= 7270 ;Hit Spark ID
trigger1 = 1 || var(24):= 7340 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 2452 ;HitDef ID
attr = A, SA
animtype = Hard
air.animtype = Hard
hitflag = MAFP
guardflag = MA
priority = 6, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.081))*fvar(13)),81*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.027))*fvar(13)),27*fvar(13))
getpower = 10,5
pausetime = 18,18
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = High
air.type = Low
ground.slidetime = 33+2*var(50)
ground.hittime = 33+2*var(50)
guard.slidetime = 33
guard.hittime = 33
ground.velocity = -22,-38
guard.velocity = -22
air.velocity = -15,-28
airguard.velocity = -12,-24
air.hittime = 33+2*var(50)
ground.cornerpush.veloff = -28.6
down.cornerpush.veloff = -14.3
air.cornerpush.veloff = -19.5
guard.cornerpush.veloff = -28.6
airguard.cornerpush.veloff = -15.6
airguard.ctrltime = 33
guard.dist = 870
palfx.time = 60
palfx.add = 255,80,0
palfx.mul = 255,255,255
palfx.sinadd = 10,10,10,30
palfx.color = 256
palfx.invertall = 0
fall = 1
air.fall = 1
id = 2452

[State 2452, 18 (Does the detection use Dragon Fang Spear / Air Alter Course?)] ;檢測是否使用 龍牙槍 / 空中方向轉換?
type = VarSet
triggerall = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
trigger1 = MoveContact >= 1 ;招式接觸時
trigger1 = var(59) = 0 && Command = "z" ;玩家使用時(AI = OFF) & 按下Z鍵
fv = 30
value = 1 ;以上條件達成則開啟
ignorehitpause = 1

[State 2452, 19 (Does the detection use Dragon Fang Spear / Air Alter Course?)] ;檢測是否使用 龍牙槍 / 空中方向轉換?
type = VarSet
triggerall = AnimElemTime(7) >= 0 && AnimElemTime(10) < 0
triggerall = MoveContact >= 1 ;招式接觸時
trigger1 = var(59) = 3 && Random < 75 ;電腦等級3(AI LV 3)
trigger2 = var(59) = 4 && Random < 150 ;電腦等級4(AI LV 4)
trigger3 = var(59) = 5 && Random < 300 ;電腦等級5(AI LV 5)
trigger4 = var(59) = 6 && Random < 450 ;電腦等級6(AI LV 6)
trigger5 = var(59) = 7 && Random < 600 ;電腦等級7(AI LV 7)
trigger6 = var(59) >= 8 && Random < 750 ;電腦等級8以上(AI LV >= 8)
fv = 30
value = 1 ;以上條件達成則開啟
ignorehitpause = 1

[State 2452, 20]
type = PlayerPush
triggerall = fvar(30) >= 1
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
value = 0

[State 2452, 21]
type = VelAdd
triggerall = fvar(30) >= 1
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
x = 12

[State 2452, 22]
type = Width
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(12) < 0
player = 28*(floor(const(size.xscale))),28*(floor(const(size.xscale)))
ignorehitpause = 1

[State 2452, 23]
type = Gravity
trigger1 = AnimElemTime(11) >= 0

[State 2452, 24]
type = VelAdd
triggerall = Vel X > 0
trigger1 = AnimElemTime(11) >= 0
x = -3.2

[State 2452, 25 (To Next State 2462 / Alter Course)]
type = ChangeState
triggerall = fvar(30) >= 1
trigger1 = AnimElemTime(11) >= 2
value = 2462
ctrl = 0

[State 2452, 26 (To Next State 2489 / No Alter Course)]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 2489
ctrl = 0

;===========================================================================
; Dragon Fang Spear / Air Alter Course
; 龍牙槍 / 空中方向轉換
;===========================================================================
[Statedef 2462]
type = A
movetype = A
physics = N
;anim = 2462
velset = 24,0 ;加上此項不會有上一個狀態的Vel X > 0和Vel Y > 0效果。
ctrl = 0
poweradd = 0
sprpriority = 3

[State 2462, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 2462
value = 2462

[State 2462, 2]
type = Turn
trigger1 = Time = 0
ignorehitpause = 1
persistent = 0

[State 2462, 3]
type = RemoveExplod
trigger1 = Time = 0
id = 7752
ignorehitpause = 1
persistent = 0

[State 2462, 4]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 2462, 5]
type = HitBy
trigger1 = 1
value = ,NA ,SA ,HA ,NT ,ST ,HT
time = 1

[State 2462, 6]
type = PlayerPush
trigger1 = 1
value = 1 ;0
ignorehitpause = 1

[State 2462, 7]
type = PalFX
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(9) < 0
time = 1
add = 192,0,0
mul = 256,256,256
sinadd = 0,0,0,1
invertall = 0
color = 256
ignorehitpause = 1 ;測試過會受到攻擊暫停影響短暫失效 所以請設定為1(應該是time設定為1的關係)

[State 2462, 8 (Dragon Fang Spear Aura / Air Alter Course)]
type = Explod
trigger1 = AnimElemTime(2) = 2
anim = 7704
id = 7762
;space = stage
pos = 0,-370*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7900,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
removetime = 7
removeongethit = 1
ignorehitpause = 0

[State 2462, 9 (Character Voice)]
type = PlaySnd
trigger1 = AnimElemTime(4) = 0
value = s5,29
channel = 0

[State 2462, 10 (Dragon Fang Spear Slash / Alter Course)]
type = Explod
trigger1 = AnimElemTime(4) = 0
anim = 7707
id = 7762
;space = stage
pos = cond(facing = 1,-13,13)*fvar(21),-87*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.10,fvar(22)*2.00
sprpriority = 4
removetime = 17
removeongethit = 1
ignorehitpause = 0

[State 2462, 11 (Dragon Fang Spear Slash / Alter Course Subtraction)]
type = Explod
trigger1 = AnimElemTime(4) = 0
anim = 7708
id = 7762
;space = stage
pos = cond(facing = 1,-13,13)*fvar(21),-87*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7705,1
scale = fvar(21)*2.10,fvar(22)*2.00
sprpriority = 4
removetime = 17
removeongethit = 1
ignorehitpause = 0

[State 2462, 12]
type = VelSet
trigger1 = AnimElemTime(4) = 0
x = 0
y = 0

[State 2462, 13]
type = VelSet
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(9) < 0
x = 100

[State 2462, 14 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElemTime(5) = 0
value = s6,11
channel = 18

[State 2462, 15]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(9) < 0
trigger1 = 1 || var(21):= 820 ;Hit Spark X
trigger1 = 1 || var(22):= -400 ;Hit Spark Y
trigger1 = 1 || var(23):= 7270 ;Hit Spark ID
trigger1 = 1 || var(24):= 7340 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 2462 ;HitDef ID
attr = A, SA
animtype = Hard
air.animtype = Hard
hitflag = MAFP
guardflag = MA
priority = 6, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.045))*fvar(13)),45*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.015))*fvar(13)),15*fvar(13))
getpower = 10,5
pausetime = 18,18
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = High
air.type = Low
ground.slidetime = 33+2*var(50)
ground.hittime = 33+2*var(50)
guard.slidetime = 32
guard.hittime = 32
ground.velocity = -22,-38
guard.velocity = -22
air.velocity = -15,-28
airguard.velocity = -12,-24
air.hittime = 33+2*var(50)
airguard.ctrltime = 32
guard.dist = 870
palfx.time = 60
palfx.add = 255,80,0
palfx.mul = 255,255,255
palfx.sinadd = 10,10,10,30
palfx.color = 256
palfx.invertall = 0
fall = 1
air.fall = 1
id = 2462

[State 2462, 16]
type = Gravity
trigger1 = AnimElemTime(9) >= 0

[State 2462, 17]
type = VelAdd
triggerall = Vel X > 0
trigger1 = AnimElemTime(9) >= 0
x = -3.2

[State 2462, 18 (To Next State 2489)]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 2489
ctrl = 0

;===========================================================================
; Dragon Fang Spear (Landing)
; 龍牙槍 (落地)
;===========================================================================
[Statedef 2489]
type = S
movetype = I
physics = S
;anim = 2489
ctrl = 0
poweradd = 0
movehitpersist = 1 ;如果設置為1 上一個狀態中招式擊中的信息(例如Statedef 2402的HitDef擊中即為MoveHit = 1)將延續到這個狀態(目的是方便連擊用)。
sprpriority = 3

[State 2489, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 2489
value = 2489
elem = 2

[State 2489, 2 (Dragon Fang Spear / Turn Detection FVar is OFF)] ;龍牙槍 / 轉向 檢測用浮點變量關閉
type = VarSet
trigger1 = Time = 0
fv = 30
value = 0
ignorehitpause = 1

[State 2489, 3]
type = RemoveExplod
trigger1 = Time = 0
id = 7607

[State 2489, 4]
type = RemoveExplod
trigger1 = Time = 0
id = 7608

[State 2489, 5]
type = PosSet
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
y = 0

[State 2489, 6]
type = VelSet
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
y = 0

[State 2489, 7 (Land Effect)]
type = Explod
trigger1 = AnimElem = 2
anim = 7052
pos = 0,0
facing = facing
bindid = id
bindtime = 1;只綁定本體1ticks
ownpal = 1
sprpriority = -3
scale = fvar(21)*2.80,fvar(22)*2.80

[State 2489, 8 (Landing Sound)];著地的音效
type = PlaySnd
trigger1 = AnimElem = 2
value = s47,0 ;人物落地產生的音效不應受攻擊而中斷 (channel默認值為-1)

[State 2489, 9]
type = VelAdd
triggerall = Vel X > 0
trigger1 = AnimElemTime(1) >= 0
x = -1.8

[State 2489, 10 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===========================================================================
; Support Knight Summon A (Foible Elle)
; 支援騎士召喚A (弱酸型艾爾)
;===========================================================================
[Statedef 2600]
type = U
movetype = A
physics = N
sprpriority = 3
anim = 2600
poweradd = 0
juggle = 2
velset = 0,0

[State 2600, 1]
type = StateTypeSet
trigger1 = Pos Y < 0
statetype = A

[State 2600, 2]
type = StateTypeSet
trigger1 = Pos Y >= 0
statetype = S

[State 2600, 3]
type = HitBy
trigger1 = Time = 0
value =
time = 10
ignorehitpause = 1

[State 2600, 4]
type = Width
trigger1 = NumHelper(12600)
trigger1 = Helper(12600),StateNo = 12605
edge = 402*(floor(const(size.xscale))),208*(floor(const(size.xscale)))

[State 2600, 5]
type = CtrlSet
trigger1 = AnimElem = 1
trigger1 = 1 || var(41):= (!Ctrl && PrevStateNo >= 200 && PrevStateNo != [2600,2610])
value = 0

[State 2600, 6]
type = VarSet
trigger1 = AnimElem = 2
v = 37
value = 0
ignorehitpause = 1

[State 2600, 7]
type = VarSet
trigger1 = AnimElem = 2
trigger1 = var(38) <= 1120 || var(41)
v = 38
value = cond(!var(41),120,1420)
ignorehitpause = 1

[State 2600, 8]
type = VarSet
trigger1 = AnimElem = 2
v = 39
value = cond(var(39) <= 1,0,var(39)-1)
ignorehitpause = 1

[State 2600, 9]
type = SuperPause
trigger1 = AnimElem = 2
trigger1 = var(41)
trigger1 = var(34):= 21 ;Super Pause Time
time = 20
anim = -1
sound = -1
movetime = 20
darken = 0
unhittable = 1

[State 2600, 10]
type = Null
trigger1 = FrontEdgeDist < 300
trigger1 = (fvar(23):= FrontEdgeDist-349) || 1 ;120是本體跟該Helper之間的距離
trigger2 = FrontEdgeDist >= 300
trigger2 = (fvar(23):= 120) || 1
trigger3 = BackEdgeDist < 420
trigger3 = (fvar(24):= 3) || 1
trigger4 = BackEdgeDist >= 420
trigger4 = (fvar(24):= 2.5) || 1

[State 2600, 11]
type = Helper
trigger1 = NumHelper(22600) = 0
trigger1 = Time = 0
id = 22600
name = "BG Ctrl / Knight Card A"
pos = 0,0
postype = p1
stateno = 22600
supermovetime = var(34)
ownpal = 1
ignorehitpause = 1

[State 2600, 12 (Knight Card Square Flash Effect)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 8019
id = 8019
;space = stage
pos = cond(facing = 1,fvar(23),-fvar(23))*fvar(21)+(pos x+ camerapos x),-228*fvar(22) ;Y軸不加上Pos Y 就會固定特定數值 (不隨著人物高度改變)
facing = facing
scale = fvar(21)*1.80,fvar(22)*1.80
sprpriority = 6
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1
ownpal = 1

[State 2600, 13 (Knight Card Flash Effect)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 8018
id = 8018
;space = stage
pos = cond(facing = 1,fvar(23),-fvar(23))*fvar(21)+(pos x+ camerapos x),-228*fvar(22)
facing = facing
;scale = fvar(21)*1.80,fvar(22)*1.80
scale = fvar(21)*1.14,fvar(22)*1.14
sprpriority = 8
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1
ownpal = 1

[State 2600, 14 (Knight Card Big)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 8020
id = 8020
;space = stage
pos = cond(facing = 1,fvar(23),-fvar(23))*fvar(21)+(pos x+ camerapos x),-228*fvar(22)
facing = facing
scale = fvar(21)*1.80,fvar(22)*1.80
sprpriority = 6
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1
ownpal = 1

[State 2600, 15]
type = PlaySnd
trigger1 = AnimElem = 2
value = s3600,0
;channel = 15

[State 2600, 16]
type = Explod
trigger1 = AnimElem = 2,= 1
trigger1 = var(41) = 1 || PrevStateNo = [2600,2610]
anim = 10070+(facing = -1)
id = 12600
pos = cond(facing = 1,0,screenwidth),screenheight/2+100
space = screen
ownpal = 1
facing = 1
sprpriority = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1

[State 2600, 17]
type = Explod
trigger1 = AnimElem = 2,= 1
trigger1 = var(41) = 1 || PrevStateNo = [2600,2610]
anim = 10011
id = 12600
pos = cond(facing = 1,0,screenwidth),screenheight/2+210
space = screen
ownpal = 1
facing = facing
sprpriority = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1

[State 2600, 18]
type = Explod
trigger1 = AnimElem = 2,= 1
trigger1 = var(41) = 1 || PrevStateNo = [2600,2610]
anim = 10054
id = 12600
pos = cond(facing = 1,0,screenwidth),screenheight/2
space = screen
ownpal = 1
facing = facing
sprpriority = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1

[State 2600, 19]
type = Explod
trigger1 = AnimElem = 2,= 1
trigger1 = var(41) = 1 || PrevStateNo = [2600,2610]
anim = 10055
id = 12600
pos = cond(facing = 1,0,screenwidth),screenheight/2
space = screen
ownpal = 1
facing = facing
vfacing = -1
sprpriority = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1

[State 2600, 20]
type = Explod
trigger1 = AnimElem = 2,= 1
trigger1 = var(41) = 1 || PrevStateNo = [2600,2610]
anim = 10056
id = 12600
pos = cond(facing = 1,0,screenwidth),screenheight/2
space = screen
ownpal = 1
facing = facing
sprpriority = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1

[State 2600, 21]
type = Explod
trigger1 = AnimElem = 2,= 1
trigger1 = var(41) = 1 || PrevStateNo = [2600,2610]
anim = 10057
id = 12600
pos = cond(facing = 1,0,screenwidth),screenheight/2
space = screen
ownpal = 1
facing = facing
vfacing = -1
sprpriority = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1

[State 2600, 22] ;Magic Light Disc A (Red)
type = Explod
trigger1 = AnimElemTime(2) = 1
anim = 7860
id = 7860
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7900,1
scale = fvar(21)*5.00,fvar(22)*5.00
xangle = -68+cond(pos y > -1450,(pos y*0.005),-7.25) ;1450是人物從Pos Y = 0向上跳的大約極限高度
yangle = fvar(24)
sprpriority = -2
removetime = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1
persistent = 0

[State 2600, 23] ;Magic Light Disc A (Red) / MoveHit
type = Explod
trigger1 = NumHelper(12600)
trigger1 = Helper(12600),StateNo = 12605
anim = 7861
id = 7865
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7900,1
scale = fvar(21)*5.00,fvar(22)*5.00
xangle = -68+cond(pos y > -1450,(pos y*0.005),-7.25)
yangle = fvar(24)
sprpriority = -2
removetime = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1
persistent = 0

[State 2600, 24] ;Magic Circle A1 (Red)
type = Explod
trigger1 = AnimElemTime(2) = 4
anim = 7862
id = 7860
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7902,1
scale = fvar(21)*1.25,fvar(22)*1.25
xangle = -68+cond(pos y > -1450,(pos y*0.005),-7.25)
yangle = fvar(24)
sprpriority = -2
removetime = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1
persistent = 0

[State 2600, 25] ;Magic Circle A1 (Red) / MoveHit
type = Explod
trigger1 = NumHelper(12600)
trigger1 = Helper(12600),StateNo = 12605
anim = 7863
id = 7865
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7902,1
scale = fvar(21)*1.25,fvar(22)*1.25
xangle = -68+cond(pos y > -1450,(pos y*0.005),-7.25)
yangle = fvar(24)
sprpriority = -2
removetime = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1
persistent = 0

[State 2600, 26] ;Magic Circle A2 (Red)
type = Explod
trigger1 = AnimElemTime(2) = 4
anim = 7864
id = 7860
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7902,1
scale = fvar(21)*1.25,fvar(22)*1.25
xangle = -68+cond(pos y > -1450,(pos y*0.005),-7.25)
yangle = fvar(24)
sprpriority = -2
removetime = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1
persistent = 0

[State 2600, 27] ;Magic Circle A2 (Red) / MoveHit
type = Explod
trigger1 = NumHelper(12600)
trigger1 = Helper(12600),StateNo = 12605
anim = 7865
id = 7865
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7902,1
scale = fvar(21)*1.25,fvar(22)*1.25
xangle = -68+cond(pos y > -1450,(pos y*0.005),-7.25)
yangle = fvar(24)
sprpriority = -2
removetime = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1
persistent = 0

[State 2600, 28]
type = Helper
trigger1 = AnimElemTime(3) = 2
name = "Foible Elle" ;《弱酸型エル》
id = 12600
stateno = 12600
pos = fvar(23)*fvar(21),32*fvar(22)
ownpal = 1
postype = p1
size.xscale = fvar(21)*1.00
size.yscale = fvar(22)*1.00
supermovetime = var(34)
ignorehitpause = 1

[State 2600, 29]
type = ScreenBound
triggerall = Anim = 2600
trigger1 = NumHelper(12600)
trigger1 = Helper(12600),StateNo = 12605
value = 0
movecamera = 0,0

[State 2600, 30]
type = ChangeAnim
triggerall = Anim = 2600
trigger1 = AnimElemTime(21) = 4
trigger1 = NumHelper(12600)
trigger1 = Helper(12600),StateNo = 12605
value = 2600
elem = 13

[State 2600, 31]
type = RemoveExplod
trigger1 = NumHelper(12600)
trigger1 = Helper(12600),StateNo = 12605
id = 7860

[State 2600, 32]
type = ChangeAnim
triggerall = Anim = 2600
trigger1 = NumHelper(12600)
trigger1 = Helper(12600),StateNo = 12610
value = 2600
elem = 22
persistent = 0 ;不會持續 (只會發動一次)

[State 2600, 33 (If Foible Elle Hit Enemy)] ;無敵 (弱酸型艾爾擊中對手時)
type = NotHitBy
triggerall = Anim = 2600
trigger1 = NumHelper(12600)
trigger1 = Helper(12600),StateNo = 12605
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time = 66 ;跟弱酸型艾爾的背景效果顯示時間相同
persistent = 0 ;不會持續 (只會發動一次)

[State 2600, 34 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = cond(statetype = A,50,0)
ctrl = 1

;===========================================================================
; Support Knight Summon A (Foible Elle) / Opponent being attacked State
; 支援騎士召喚A (弱酸型艾爾) / 對手被攻擊狀態
;===========================================================================
[Statedef 2615]
type = S
movetype = H
physics = N
sprpriority = 8
velset = 0,0
ctrl = 0

[State 2615, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 2615

[State 2615, 2]
type = PosSet
trigger1 = Time = 0
y = 0

;[State 2615, 3 (Turn in the same direction as Foible Elle)] ;和弱酸型艾爾同一個方向時轉身
;type = Turn
;trigger1 = Facing = Helper(12600),Facing

;*已更改為由弱酸型艾爾轉身

[State 2615, 4]
type = AssertSpecial
trigger1 = 1
flag = TimerFreeze

[State 2615, 5]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,1

[State 2615, 6]
type = NotHitBy
trigger1 = AnimElemTime(1) >= 1 && AnimElemTime(2) < 52
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT
time = 1

[State 2615, 7 (Target To Next State 2616)]
type = ChangeState
trigger1 = AnimTime = 0
value = 2616
ctrl = 0

;===========================================================================
; Support Knight Summon A (Foible Elle) / Opponent Knocked Back
; 支援騎士召喚A (弱酸型艾爾) / 對手擊退
;===========================================================================
[Statedef 2616]
type = S
movetype = H
physics = S
sprpriority = 0
ctrl = 0

[State 2616, 1 (Fire Attribute Element Attack Effect / Fire Color)] ;火屬性元素攻擊效果 (火焰色)
type = PalFX
trigger1 = Time = 0
time = 42
add = 255,80,0
mul = 255,255,255
sinadd = 10,10,10,30
color = 256
invertall = 0

[State 2616, 2 (Fire Attribute Element Attack Effect / Damage Over Time)] ;火屬性元素攻擊效果 (持續傷害)
type = LifeAdd
trigger1 = GameTime %2 = 0
value = -1
kill = cond(random < 250,1,0) ;百分之二十五機率擊殺
absolute = 0 ;非絕對值 (會受對手的防禦係數影響)
ignorehitpause = 1 ;無視攻擊暫停

[State 2616, 3]
type = ChangeAnim2
trigger1 = Time = 0
value = 2616

[State 2616, 4]
type = AssertSpecial
trigger1 = 1
flag = TimerFreeze

[State 2616, 5]
type = VelSet
trigger1 = AnimTime = 0
x = 0

[State 2616, 6 (Target Reverts To Its Own State)]
type = SelfState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;===========================================================================
; Support Knight Summon B (Clone Scathach)
; 支援騎士召喚B (複製型斯卡哈)
;===========================================================================
[Statedef 2800]
type = U
movetype = A
physics = N
sprpriority = 3
anim = 2800
poweradd = 0
juggle = 2
velset = 0,0

[State 2800, 1]
type = StateTypeSet
trigger1 = Pos Y < 0
statetype = A

[State 2800, 2]
type = StateTypeSet
trigger1 = Pos Y >= 0
statetype = S

[State 2800, 3]
type = HitBy
trigger1 = Time = 0
value =
time = 10
ignorehitpause = 1

[State 2800, 4]
type = CtrlSet
trigger1 = AnimElem = 1
trigger1 = 1 || var(41):= (!Ctrl && PrevStateNo >= 200 && PrevStateNo != [2800,2810])
value = 0

[State 2800, 5]
type = VarSet
trigger1 = AnimElem = 2
v = 37
value = 0
ignorehitpause = 1

[State 2800, 6]
type = VarSet
trigger1 = AnimElem = 2
trigger1 = var(38) <= 1120 || var(41)
v = 38
value = cond(!var(41),120,1420)
ignorehitpause = 1

[State 2800, 7]
type = VarSet
trigger1 = AnimElem = 2
v = 39
value = cond(var(39) <= 1,0,var(39)-2)
ignorehitpause = 1

[State 2800, 8 (Life Recovery)]
type = LifeAdd
triggerall = Alive
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(7) < 0
value = 2 ;總回復量為40
ignorehitpause = 1

[State 2800, 9]
type = PalFX
trigger1 = AnimElemTime(3) = 2
time = 10  ;*相當於AAnimElemTime(3) >= 2 && AnimElemTime(5) < 4這段的ticks數 (為上面LifeAdd動畫元素AnimElemTime(2) >= 0 && AnimElemTime(7) < 0中間的10ticks範圍)
add = 0,50,0
mul = 256,256,256
sinadd = 0,50,0,20
invertall = 0
color = 256
ignorehitpause = 1

[State 2800, 10 (Recovery Life Flash)] ;回復生命特效
type = Explod
triggerall = NumExplod(7855) < 6
trigger1 = AnimElemTime(3) >= 2 && AnimElemTime(5) < 4
anim = 7855
bindid = id
bindtime = 1
pos = (0+cond(random < 500,random%180,-random%180))*fvar(21),(-400+cond(random < 500,random%300,-random%300))*fvar(22)
scale = fvar(21)*0.70,fvar(22)*0.70
sprpriority = 3+cond(random < 500,(-1),(1))
facing = facing
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 2800, 11]
type = SuperPause
trigger1 = AnimElem = 2
trigger1 = var(41)
trigger1 = var(34):= 21 ;Super Pause Time
time = 20
anim = -1
sound = -1
movetime = 20
darken = 0
unhittable = 1

[State 2800, 12]
type = Null
trigger1 = BackEdgeDist < 400
trigger1 = (fvar(23):= 360) || 1
trigger2 = BackEdgeDist >= 400
trigger2 = (fvar(23):= -360) || 1
trigger3 = BackEdgeDist < 420
trigger3 = (fvar(24):= 3) || 1
trigger4 = BackEdgeDist >= 420
trigger4 = (fvar(24):= 2.5) || 1

[State 2800, 13]
type = Helper
trigger1 = NumHelper(22800) = 0
trigger1 = Time = 0
id = 22800
name = "BG Ctrl / Knight Card B"
pos = 0,0
postype = p1
stateno = 22800
supermovetime = var(34)
ownpal = 1
ignorehitpause = 1

[State 2800, 14] ;Magic Light Disc B (Green)
type = Explod
trigger1 = AnimElemTime(2) = 1
anim = 7880
id = 7880
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7900,2
scale = fvar(21)*5.00,fvar(22)*5.00
xangle = -68+cond(pos y > -1450,(pos y*0.005),-7.25) ;1450是人物從Pos Y = 0向上跳的大約極限高度
yangle = fvar(24)
sprpriority = -2
removetime = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1

[State 2800, 15] ;Magic Circle 1B (Green)
type = Explod
trigger1 = AnimElemTime(2) = 4
anim = 7882
id = 7880
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7902,2
scale = fvar(21)*1.25,fvar(22)*1.25
xangle = -68+cond(pos y > -1450,(pos y*0.005),-7.25)
yangle = fvar(24)
sprpriority = -2
removetime = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1

[State 2800, 16] ;Magic Circle 2B (Green)
type = Explod
trigger1 = AnimElemTime(2) = 4
anim = 7884
id = 7880
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7902,2
scale = fvar(21)*1.25,fvar(22)*1.25
xangle = -68+cond(pos y > -1450,(pos y*0.005),-7.25)
yangle = fvar(24)
sprpriority = -2
removetime = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1

[State 2800, 17 (Knight Card Square Flash Effect)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 8019
id = 8019
;space = stage
;pos = cond(facing = 1,fvar(23),-fvar(23))*fvar(21)+(pos x+ camerapos x),-228*fvar(22)
pos = cond(facing = 1,(fvar(23)+30),-(fvar(23)+30))*fvar(21)+(pos x+ camerapos x),-260*fvar(22) ;Y軸不加上Pos Y 就會固定特定數值 (不隨著人物高度改變)
facing = facing
scale = fvar(21)*1.80,fvar(22)*1.80
sprpriority = 0
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1
ownpal = 1

[State 2800, 18 (Knight Card Flash Effect)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 8018
id = 8018
;space = stage
pos = cond(facing = 1,(fvar(23)+30),-(fvar(23)+30))*fvar(21)+(pos x+ camerapos x),-260*fvar(22)
facing = facing
scale = fvar(21)*1.14,fvar(22)*1.14
sprpriority = 2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1
ownpal = 1

[State 2800, 19 (Knight Card Big)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 8020
id = 8020
;space = stage
pos = cond(facing = 1,(fvar(23)+30),-(fvar(23)+30))*fvar(21)+(pos x+ camerapos x),-260*fvar(22)
facing = facing
scale = fvar(21)*1.80,fvar(22)*1.80
sprpriority = 0
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1
ownpal = 1

[State 2800, 20]
type = Helper
trigger1 = AnimElemTime(3) = 2
name = "Clone Scathach" ;《複製型斯卡哈》
id = 12800
stateno = 12800
pos = fvar(23)*fvar(21),-22*fvar(22)
ownpal = 1
postype = p1
size.xscale = fvar(21)*0.93
size.yscale = fvar(22)*0.93
supermovetime = var(34)
ignorehitpause = 1

[State 2800, 21]
type = PlaySnd
trigger1 = AnimElem = 2
value = s3600,0
;channel = 15

[State 2800, 22]
type = Explod
trigger1 = AnimElem = 2,= 1
trigger1 = var(41) = 1 || PrevStateNo = [2800,2810]
anim = 10072+(facing = -1)
id = 12800
pos = cond(facing = 1,0,screenwidth),screenheight/2+100
space = screen
ownpal = 1
facing = 1
sprpriority = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1

[State 2800, 23]
type = Explod
trigger1 = AnimElem = 2,= 1
trigger1 = var(41) = 1 || PrevStateNo = [2800,2810]
anim = 10013
id = 12800
pos = cond(facing = 1,0,screenwidth),screenheight/2+210
space = screen
ownpal = 1
facing = facing
sprpriority = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1

[State 2800, 24]
type = Explod
trigger1 = AnimElem = 2,= 1
trigger1 = var(41) = 1 || PrevStateNo = [2800,2810]
anim = 10054
id = 12600
pos = cond(facing = 1,0,screenwidth),screenheight/2
space = screen
ownpal = 1
facing = facing
sprpriority = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1

[State 2800, 25]
type = Explod
trigger1 = AnimElem = 2,= 1
trigger1 = var(41) = 1 || PrevStateNo = [2800,2810]
anim = 10055
id = 12600
pos = cond(facing = 1,0,screenwidth),screenheight/2
space = screen
ownpal = 1
facing = facing
vfacing = -1
sprpriority = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1

[State 2800, 26]
type = Explod
trigger1 = AnimElem = 2,= 1
trigger1 = var(41) = 1 || PrevStateNo = [2800,2810]
anim = 10056
id = 12600
pos = cond(facing = 1,0,screenwidth),screenheight/2
space = screen
ownpal = 1
facing = facing
sprpriority = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1

[State 2800, 27]
type = Explod
trigger1 = AnimElem = 2,= 1
trigger1 = var(41) = 1 || PrevStateNo = [2800,2810]
anim = 10057
id = 12600
pos = cond(facing = 1,0,screenwidth),screenheight/2
space = screen
ownpal = 1
facing = facing
vfacing = -1
sprpriority = -2
removeongethit = 1
supermovetime = var(34)
ignorehitpause = 1

[State 2800, 28 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = cond(statetype = A,50,0)
ctrl = 1
