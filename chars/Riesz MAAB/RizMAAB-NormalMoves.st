;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
; 普通技定義 ‖ 通常攻撃ステート
; Normal Moves Definition
;＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

;---------------------------------------------------------------------------
; Normal Attack 5Y / Chain Barrage (1)
; 通常攻擊5Y / 連鎖亂擊(一)
;---------------------------------------------------------------------------
[Statedef 200]
type = S;*                       ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype = A                     ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
;anim = 200                      ;Change animation (Def: no change)
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
poweradd = 0                    ;Power to add (Def: 0)
juggle = 1                       ;Number of air juggle points move takes
;facep2 =
;hitdefpersist =
;movehitpersist =
;hitcountpersist =
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

; 必要參數 / Required parameters
; type movetype physics anim

; 可選參數 / Optional Parameters
; velset ctrl poweradd juggle facep2 hitdefpersist movehitpersist hitcountpersist sprpriority

;*The CNS format
; http://www.elecbyte.com/mugendocs-11b1/cns.html

[State 200, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 200
value = 200

[State 200, 2] ;移動(向前)
type = VelSet
trigger1 = AnimElemTime(2) = 0
x = 6
y = 0

[State 200, 3 (Character Voice)] ;人物聲音
type = PlaySnd
triggerall = Random < 750
trigger1 = AnimElemTime(1) = 4
value = s5,0+(random%3)
channel = 0

[State 200, 4 (Effect Sound)] ;効果音
type = PlaySnd
trigger1 = AnimElem = 2 ;相當於AnimElemTime(2) = 0;#
value = s6,0
channel = 10

;#AnimElem、AnimElemTime等相關代碼可以看以下網站的說明
; http://www.elecbyte.com/mugendocs/trigger.html#animelemtime
; https://qxmugen.com/portal/40

[State 200, 5 (Spear Slash A)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 7400
id = 7400
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 6 ;*
;*如果rem_time是正數,explod將在被顯示rem_time幀數後被移除.
; 如果rem_time是-1,explod將被永久顯示.
; 如果rem_time是-2,explod將在animtime到達0時移除.
; 默認為-2.
removeongethit = 1 ;此值設置成1時如果玩家受到攻擊將使Explod被移除.默認為0.
ignorehitpause = 0 ;如果此值為1,Explod將獨立於創建它的玩家而播放動畫. 如果設置成0,在玩家進入Hitpause狀態的時候Explod將不會被更新.默認為1.

[State 200, 6 (Spear Slash A Subtraction)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 7401
id = 7400
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 6
removeongethit = 1
ignorehitpause = 0

[State 200, 7] ;打擊定義
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElem = 2
trigger1 = 1 || var(21):= 390 ;Hit Spark X
trigger1 = 1 || var(22):= -200 ;Hit Spark Y
trigger1 = 1 || var(23):= 7230 ;Hit Spark ID
trigger1 = 1 || var(24):= 7300 ;Guard Spark ID
trigger1 = 1 || var(25):= 140 ;Hit Spark Angle
trigger1 = 1 || var(36):= 200 ;HitDef ID
attr = S, NA
hitflag = MAF
guardflag = LA ;該攻擊蹲下和在空中時才能防禦 (依照原作設定)
animtype = Light ;P2在地面被擊中時將進入的動畫類型
air.animtype = Light ;P2在空中被擊中時將進入的動畫類型 (缺省默認跟animtype相同)
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.018))*fvar(13)),18*fvar(13)),0
getpower = 30,15
pausetime = 9,9 ;Hit時每個玩家將會停止(停頓)的時間(打擊停頓,ignorehitpause就是針對這個參數)
                ;左邊數字是凍結P1的時間(單位是遊戲幀數) 右邊數字是在被擊中後退前造成P2震動的時間
;guard.pausetime = 9,9 ;Hit被防禦時 省略時數值跟pausetime相同
sparkno = -1
guard.sparkno = -1
hitsound = s7,0
guardsound = s8,0
ground.type = Low ;P2在地面的攻擊類型 (High→攻擊使對手頭向後移 Low→擊中對手腹部 Trip→掃腿攻擊 None→沒有任何效果)
air.type = Low ;P2在空中的攻擊類型 (缺省默認跟ground.type相同)
ground.slidetime = 10+2*var(50) ;這是P2被擊中後向後滑動的時間(遊戲幀數) 這時間不包括p2的Pausetime 應用於使P2保持在地面上的Hit 缺省默認為0
ground.hittime = 12+2*var(50)
guard.slidetime = 10
guard.hittime = 12
guard.ctrltime = 10 ;P2在地面防禦狀態中恢復控制之前的時間 缺省默認為guard.slidetime的值
ground.velocity = -11,0
guard.velocity = -11
air.velocity = -6,-6
airguard.velocity = -8,-3
air.hittime = 13+2*var(50) ;如果fall = 1此參數無效
ground.cornerpush.veloff = -15.5 ;版邊攻擊使自己後退的速度 默認值是1.3*guard.velocity*
air.cornerpush.veloff = -10.5 ;版邊攻擊空中的對手使自己後退的速度 缺省默認值是ground.cornerpush.veloff
down.cornerpush.veloff = -15.5 ;版邊攻擊蹲下的對手使自己後退的速度 缺省默認值是ground.cornerpush.veloff
guard.cornerpush.veloff = -15.5 ;版邊被防禦的攻擊使自己後退的速度 缺省默認值是ground.cornerpush.veloff
airguard.cornerpush.veloff = -12.5 ;版邊被防禦的攻擊空中的對手使自己後退的速度 缺省默認值是guard.cornerpush.veloff
airguard.ctrltime = 10 ;P2在空防狀態恢復控制前的時間 缺省默認為guard.ctrltime的值
fall = 0
air.fall = 1
forcenofall = 0
id = 200 ;招式ID號 要不要設置皆可 設置的話可以更精確指定Target觸發器的目標 如果招式屬於需要將對手帶入自己的狀態號 就請一定要設置ID號 https://w.atwiki.jp/mugencns/pages/29.html

;*如果招式攻擊距離較長 請設罝 在場景最前方攻擊時 讓自己後退的速度

[State 200, 8 (Jump Cancel)] ;跳躍取消
type = ChangeState
triggerall = var(59) = 0 || AILevel = 0
trigger1 = Command = "up" || Command = "holdup" ;添加holdup可以做到向前跳、向後跳
trigger1 = MoveContact >= 1
value = 40

[State 200, 9 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Normal Attack 5Y*2 / Chain Barrage (2)
; 通常攻擊5Y*2 / 連鎖亂擊(二)
;---------------------------------------------------------------------------
[Statedef 210]
type = S
movetype = A
physics = S
;anim = 210
velset = 0,0
ctrl = 0
poweradd = 0
juggle = 1
sprpriority = 2

[State 210, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 210
value = 210

[State 210, 2]
type = VelSet
trigger1 = P2Dist X >= 0 ;設置此參數避免我方倒退嚕(向後退)
trigger1 = AnimElem = 2
x = 0+cond(p2dist x >= 600,20,(p2dist x/30))

[State 210, 3] ;1幀內暫時改變玩家的寬度尺寸
type = Width
trigger1 = AnimElemtime(2) >= 0 && AnimElemtime(6) < 0
player = 118*(floor(const(size.xscale))),0 ;*
;edge = ;設置玩家前後的邊緣寬度 邊緣寬度決定了玩家能有多接近屏幕的邊緣 默認值為0,0 ;*
;player = 118,0 ;設置玩家前後的player寬度 player寬度決定了玩家能有多接近其他玩家 默認值為0,0 ;*
;value = edge和player參數兩者的綜合，也就是等於edge = 118,0、player = 118,0
ignorehitpause = 1

;*意思是在人物的ground.front參數之外，額外再增加前寬度118(78+118 = 196)
; 添加後進入遊戲開啟Debug模式(按下Ctrl+C鍵)，人物腳下的寬度條長度會改變
; 另外當顯示碰撞塊時，設置的邊緣寬度條顯示為橙色，玩家的寬度條顯示為黃色
; 邊緣寬度條是在人物身上產生，並不是在畫面兩端
; 當它們重疊時，重疊的區域顯示為亮黃色

; const(size.xscale)改為(floor(const(size.xscale)))
; 是為了消除小數點(Expression Truncated to Integer系統報錯)

[State 210, 4 (Moving Dust 1)]
type = Explod
triggerall = Vel X > 0
triggerall = NumExplod(7040) = 0
trigger1 = AnimElemTime(2) = 0
anim = 7040
id = 7040
;space = stage
pos = cond(facing = 1,300,-300)*fvar(21),0
facing = facing
bindid = id
bindtime = 1
removetime = 16
scale = fvar(21)*0.80,fvar(22)*0.80
removeongethit = 1
ignorehitpause = 1
sprpriority = 0
shadow = 0,0,0
ownpal = 1

[State 210, 5 (Moving Dust 2)]
type = Explod
triggerall = Vel X > 0 ;確保我方正在向前移動時
triggerall = NumExplod(7041) = 0
trigger1 = AnimElemTime(2) = 0
anim = 7040
id = 7041
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = 1
removetime = 16
scale = fvar(21)*0.80,fvar(22)*0.80
removeongethit = 1
ignorehitpause = 1
sprpriority = 0
shadow = 0,0,0
ownpal = 1

[State 210, 6 (Spear Slash D)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 7410
id = 7410
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 8
removeongethit = 1
ignorehitpause = 0

[State 210, 7 (Spear Slash D Subtraction)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 7411
id = 7410
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 8
removeongethit = 1
ignorehitpause = 0

[State 210, 8 (Character Voice)]
type = PlaySnd
trigger1 = AnimElemTime(2) = 2
value = s5,3
channel = 0

[State 210, 9]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElem = 3
trigger1 = 1 || var(21):= 440 ;Hit Spark X
trigger1 = 1 || var(22):= -490 ;Hit Spark Y
trigger1 = 1 || var(23):= 7200 ;Hit Spark ID
trigger1 = 1 || var(24):= 7305 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 210 ;HitDef ID
attr = S, NA
hitflag = MAF
guardflag = MA
animtype = Light
air.animtype = Light
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.019))*fvar(13)),19*fvar(13)),0
getpower = 30,15
pausetime = 8,8
sparkno = -1
guard.sparkno = -1
hitsound = s7,2
guardsound = s8,1
ground.type = High
air.type = High
ground.slidetime = 16+2*var(50)
ground.hittime = 20+2*var(50)
guard.slidetime = 15
guard.ctrltime = 15
guard.hittime = 19
ground.velocity = -24
guard.velocity = -24
air.velocity = -13,-7
airguard.velocity = -15,-6.5
air.hittime = 21+2*var(50)
ground.cornerpush.veloff = -50
air.cornerpush.veloff = -38
guard.cornerpush.veloff = -48
airguard.cornerpush.veloff = -38
airguard.ctrltime = 17
guard.dist = 850 ;因為招式攻擊距離較長，所以需要另外設定防禦距離(否則對手無法在招式快接觸時做出防禦動作) 默認值為[Size]項目的attack.dist參數。
id = 210

[State 210, 10 (Jump Cancel)] ;跳躍取消
type = ChangeState
triggerall = var(59) = 0 || AILevel = 0
trigger1 = Command = "up" || Command = "holdup"
trigger1 = MoveContact >= 1
value = 40

[State 210, 11 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Normal Attack 5Y*3 / Chain Barrage (3)
; 通常攻擊5Y*3 / 連鎖亂擊(三)
;---------------------------------------------------------------------------
[Statedef 220]
type = S
movetype = A
physics = S
;anim = 220
velset = 0,0
ctrl = 0
poweradd = 0
juggle = 3
sprpriority = 2

[State 220, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 220
value = 220

[State 220, 2]
type = PosAdd
trigger1 = P2Dist X >= 0
trigger1 = AnimElem = 3
x = 0+cond(p2dist x >= 600,177,(p2dist x/3.40))

[State 220, 3 (Spear Slash G)]
type = Explod
trigger1 = AnimElemTime(3) = 0
anim = 7420
id = 7420
;space = stage
pos = cond(facing = 1,-60,60)*fvar(21),20*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 10
removeongethit = 1
ignorehitpause = 0

[State 220, 4 (Spear Slash G Subtraction)]
type = Explod
trigger1 = AnimElemTime(3) = 0
anim = 7421
id = 7420
;space = stage
pos = cond(facing = 1,-60,60)*fvar(21),20*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 10
removeongethit = 1
ignorehitpause = 0

[State 220, 5]
type = PosAdd
trigger1 = AnimElem = 4
x = 0

[State 220, 6 (Character Voice)]
type = PlaySnd
trigger1 = AnimElem = 4
value = s5,7
channel = 0

;[State 220, 7 (Effect Sound)]
;type = PlaySnd
;trigger1 = AnimElemTime(4) = 0
;trigger2 = AnimElemTime(7) = 0
;value = s6,14
;channel = 10

[State 220, 8]
type = HitDef
triggerall = !MoveContact && !MoveReversed 
trigger1 = AnimElem = 4
trigger1 = 1 || var(21):= 500 ;Hit Spark X
trigger1 = 1 || var(22):= -400 ;Hit Spark Y
trigger1 = 1 || var(23):= 7236 ;Hit Spark ID
trigger1 = 1 || var(24):= 7310 ;Guard Spark ID
trigger1 = 1 || var(25):= 70 ;Hit Spark Angle
trigger1 = 1 || var(36):= 220 ;HitDef ID
attr = S, NA
hitflag = MAF
guardflag = MA
animtype = Medium
air.animtype = Medium
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.025))*fvar(13)),25*fvar(13)),0
getpower = 15,7
pausetime = 0,3
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,2
ground.type = High
air.type = High
ground.slidetime = 22+2*var(50)
ground.hittime = 22+2*var(50)
guard.slidetime = 20
guard.ctrltime = 20
guard.hittime = 20
ground.velocity = -22
guard.velocity = -22
air.velocity = -16,-12
airguard.velocity = -14,-6
air.hittime = 22+2*var(50)
ground.cornerpush.veloff = -36
air.cornerpush.veloff = -30
guard.cornerpush.veloff = -36
airguard.cornerpush.veloff = -28
airguard.ctrltime = 22
id = 220

[State 220, 9]
type = VelSet
trigger1 = P2Dist X >= 0
trigger1 = AnimElem = 6
x = 0+cond(p2dist x >= 600,40,(p2dist x/15))

[State 220, 10 (Moving Dust 1)]
type = Explod
triggerall = Vel X > 0
triggerall = NumExplod(7040) = 0
trigger1 = AnimElemTime(6) = 0
anim = 7040
id = 7040
;space = stage
pos = cond(facing = 1,200,-200)*fvar(21),0
facing = facing
bindid = id
bindtime = 1
removetime = 16
scale = fvar(21)**1.20,fvar(22)*1.20
removeongethit = 1
ignorehitpause = 1
sprpriority = 0
shadow = 0,0,0
ownpal = 1

[State 220, 11 (Moving Dust 2)]
type = Explod
triggerall = Vel X > 0
triggerall = NumExplod(7041) = 0
trigger1 = AnimElemTime(6) = 0
anim = 7040
id = 7041
;space = stage
pos = cond(facing = 1,-100,100)*fvar(21),0
facing = facing
bindid = id
bindtime = 1
removetime = 16
scale = fvar(21)**1.20,fvar(22)*1.20
removeongethit = 1
ignorehitpause = 1
sprpriority = 0
shadow = 0,0,0
ownpal = 1

[State 220, 12 (Spear Slash G2)]
type = Explod
trigger1 = AnimElemTime(6) = 0
anim = 7422
id = 7420
;space = stage
pos = cond(facing = 1,24,-24)*fvar(21),-8*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 8
removeongethit = 1
ignorehitpause = 0

[State 220, 13 (Spear Slash G2 Subtraction)]
type = Explod
trigger1 = AnimElemTime(6) = 0
anim = 7423
id = 7420
;space = stage
pos = cond(facing = 1,24,-24)*fvar(21),-8*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 8
removeongethit = 1
ignorehitpause = 0

[State 220, 14 (Character Voice)]
type = PlaySnd
trigger1 = AnimElem = 7
value = s5,8
channel = 0

[State 220, 15]
type = Width
trigger1 = AnimElemTime(7) >= 0 && AnimElemTime(11) < 0
player = 152*(floor(const(size.xscale))),0
ignorehitpause = 1

[State 220, 16]
type = HitDef
;triggerall = !MoveContact && !MoveReversed ;如果上一個HitDef有接觸到對手 關閉此參數後該HitDef才會有效
trigger1 = AnimElem = 7
trigger1 = 1 || var(21):= 520 ;Hit Spark X
trigger1 = 1 || var(22):= -400 ;Hit Spark Y
trigger1 = 1 || var(23):= 7236 ;Hit Spark ID
trigger1 = 1 || var(24):= 7310 ;Guard Spark ID
trigger1 = 1 || var(25):= 110 ;Hit Spark Angle
trigger1 = 1 || var(36):= 221 ;HitDef ID
attr = S, NA
hitflag = MAF
guardflag = MA
animtype = Medium
air.animtype = Medium
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.025))*fvar(13)),25*fvar(13)),0
getpower = 15,7
pausetime = 11,14
sparkno = -1
guard.sparkno = -1
hitsound = s7,4
guardsound = s8,2
ground.type = Low
air.type = Low
ground.slidetime = 23+2*var(50)
ground.hittime = 23+2*var(50)
guard.slidetime = 21
guard.hittime = 21
ground.velocity = -43.5
guard.velocity = -43.5
air.velocity = -36,-12
airguard.velocity = -34,-6
air.hittime = 23+2*var(50)
ground.cornerpush.veloff = -74
air.cornerpush.veloff = -68
guard.cornerpush.veloff = -74
airguard.cornerpush.veloff = -66
airguard.ctrltime = 22
air.fall = 1
fall.recover = 0
guard.dist = 850
id = 221

[State 220, 17 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Normal Attack 5Y*4 / Chain Barrage (4)
; 通常攻擊5Y*4 / 連鎖亂擊(四)
;---------------------------------------------------------------------------
[Statedef 222]
type = S
movetype = A
physics = S
;anim = 222
velset = 0,0
ctrl = 0
poweradd = 0
juggle = 4
sprpriority = 3

[State 222, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 222
value = 222

[State 222, 2]
type = PosAdd
trigger1 = Time = 0
x = 70

[State 222, 3]
type = VelSet
trigger1 = P2Dist X >= 0
trigger1 = AnimElem = 3
x = 0+cond(p2dist x >= 500,30,(p2dist x/17))

[State 222, 4 (Moving Dust)]
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
scale = fvar(21)*1.15,fvar(22)*1.15
removeongethit = 1
ignorehitpause = 1
sprpriority = 0
shadow = 0,0,0
ownpal = 1

[State 222, 5 (Character Voice)]
type = PlaySnd
trigger1 = AnimElem = 4
value = s5,13
channel = 0

[State 222, 6 (Hyakka Spear Slash A)]
type = Explod
trigger1 = AnimElemTime(4) = 0
trigger2 = AnimElemTime(10) = 0
anim = 7470
id = 7422
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

[State 222, 7 (Hyakka Spear Slash A Subtraction)]
type = Explod
trigger1 = AnimElemTime(4) = 0
trigger2 = AnimElemTime(10) = 0
anim = 7471
id = 7422
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

[State 222, 8 (Effect Sound)] ;効果音
type = PlaySnd
triggerall = MoveContact = 0 ;沒有接觸到對手才會播放這個音效
trigger1 = AnimElem = 5
trigger2 = AnimElem = 8
trigger3 = AnimElem = 11
trigger4 = AnimElem = 14
trigger5 = AnimElem = 17
value = s6,6
channel = 10

[State 222, 9]
type = HitDef
triggerall = AnimElem = 5;#
trigger1 = 1 || var(21):= 710 ;Hit Spark X
trigger1 = 1 || var(22):= -245 ;Hit Spark Y
trigger1 = 1 || var(23):= 7250 ;Hit Spark ID
trigger1 = 1 || var(24):= 7312 ;Guard Spark ID
trigger1 = 1 || var(25):= -11 ;Hit Spark Angle
trigger1 = 1 || var(36):= 222 ;HitDef ID
;triggerall = 1 || var(21):= 7100 ;Hit Spark X ; #測試過左邊的寫法會造成多個變量讀取失敗
;triggerall = 1 || var(22):= -245 ;Hit Spark Y
;triggerall = 1 || var(23):= 7250 ;Hit Spark ID
;triggerall = 1 || var(24):= 7312 ;Guard Spark ID
;triggerall = 1 || var(25):= -11 ;Hit Spark Angle
;triggerall = 1 || var(36):= 222 ;HitDef ID
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
guard.slidetime = 12
guard.hittime = 14
ground.velocity = -11
guard.velocity = -29
air.velocity = -10,-12
airguard.velocity = -20,-8
air.hittime = 12+1*var(50)
ground.cornerpush.veloff = -24
air.cornerpush.veloff = -23
guard.cornerpush.veloff = -24
airguard.cornerpush.veloff = -23
guard.kill = 0 ;該招式無法在對手防禦時擊殺
guard.dist = 1160
fall = 0
air.fall = 1
id = 222

[State 222, 10 (Hyakka Spear Slash B)]
type = Explod
trigger1 = AnimElemTime(7) = 0
trigger2 = AnimElemTime(13) = 0
anim = 7472
id = 7422
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

[State 222, 11 (Hyakka Spear Slash B Subtraction)]
type = Explod
trigger1 = AnimElemTime(7) = 0
trigger2 = AnimElemTime(13) = 0
anim = 7473
id = 7422
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

[State 222, 12]
type = HitDef
triggerall = AnimElem = 8
trigger1 = 1 || var(21):= 650 ;Hit Spark X
trigger1 = 1 || var(22):= -450 ;Hit Spark Y
trigger1 = 1 || var(23):= 7250 ;Hit Spark ID
trigger1 = 1 || var(24):= 7312 ;Guard Spark ID
trigger1 = 1 || var(25):= 11 ;Hit Spark Angle
trigger1 = 1 || var(36):= 223 ;HitDef ID
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
guard.slidetime = 12
guard.hittime = 14
ground.velocity = -11
guard.velocity = -29
air.velocity = -10,-8
airguard.velocity = -20,-4
air.hittime = 12+1*var(50)
ground.cornerpush.veloff = -24
air.cornerpush.veloff = -23
guard.cornerpush.veloff = -24
airguard.cornerpush.veloff = -23
guard.kill = 0
guard.dist = 1160
fall = 0
air.fall = 1
id = 223

[State 222, 13]
type = HitDef
triggerall = AnimElem = 11
trigger1 = 1 || var(21):= 650 ;Hit Spark X
trigger1 = 1 || var(22):= -250 ;Hit Spark Y
trigger1 = 1 || var(23):= 7250 ;Hit Spark ID
trigger1 = 1 || var(24):= 7312 ;Guard Spark ID
trigger1 = 1 || var(25):= -11 ;Hit Spark Angle
trigger1 = 1 || var(36):= 224 ;HitDef ID
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
ground.slidetime = 18+3*var(50)
ground.hittime = 21+3*var(50)
guard.slidetime = 12
guard.hittime = 14
ground.velocity = -11
guard.velocity = -29
air.velocity = -10,-12
airguard.velocity = -20,-8
air.hittime = 12+3*var(50)
ground.cornerpush.veloff = -24
air.cornerpush.veloff = -23
guard.cornerpush.veloff = -24
airguard.cornerpush.veloff = -23
guard.kill = 0
guard.dist = 1160
fall = 0
air.fall = 1
id = 224

[State 222, 14]
type = HitDef
triggerall = AnimElem = 14
trigger1 = 1 || var(21):= 650 ;Hit Spark X
trigger1 = 1 || var(22):= -450 ;Hit Spark Y
trigger1 = 1 || var(23):= 7250 ;Hit Spark ID
trigger1 = 1 || var(24):= 7312 ;Guard Spark ID
trigger1 = 1 || var(25):= 11 ;Hit Spark Angle
trigger1 = 1 || var(36):= 225 ;HitDef ID
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
ground.slidetime = 18+3*var(50)
ground.hittime = 21+3*var(50)
guard.slidetime = 12
guard.hittime = 14
ground.velocity = -11
guard.velocity = -29
air.velocity = -10,-8
airguard.velocity = -20,-4
air.hittime = 12+3*var(50)
ground.cornerpush.veloff = -24
air.cornerpush.veloff = -23
guard.cornerpush.veloff = -24
airguard.cornerpush.veloff = -23
guard.kill = 0
guard.dist = 1160
fall = 0
air.fall = 1
id = 225

[State 222, 15 (Hyakka Spear Slash C)]
type = Explod
trigger1 = AnimElemTime(16) = 0
anim = 7474
id = 7422
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

[State 222, 16 (Hyakka Spear Slash C Subtraction)]
type = Explod
trigger1 = AnimElemTime(16) = 0
anim = 7475
id = 7422
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

[State 222, 17]
type = HitDef
triggerall = AnimElem = 17
trigger1 = 1 || var(21):= 660 ;Hit Spark X
trigger1 = 1 || var(22):= -350 ;Hit Spark Y
trigger1 = 1 || var(23):= 7250 ;Hit Spark ID
trigger1 = 1 || var(24):= 7312 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 226 ;HitDef ID
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Light
air.animtype = Light
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.019))*fvar(13)),19*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.004))*fvar(13)),4*fvar(13))
getpower = 6,3
pausetime = 4,5
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = Low
air.type = Low
ground.slidetime = 18+3*var(50)
ground.hittime = 21+3*var(50)
guard.slidetime = 12
guard.hittime = 14
ground.velocity = -12
guard.velocity = -30
air.velocity = -11,-10
airguard.velocity = -21,-6
air.hittime = 19+3*var(50)
ground.cornerpush.veloff = -25
air.cornerpush.veloff = -24
guard.cornerpush.veloff = -25
airguard.cornerpush.veloff = -24
guard.kill = 0
guard.dist = 1160
fall = 0
air.fall = 1
id = 226

[State 222, 18]
type = TargetState
triggerall = NumTarget(226) ;*
triggerall = MoveContact = 1
triggerall = Target(226),StateType = S
trigger1 = NumTarget(226) = 1 && MoveHit
trigger2 = NumTarget(226) > 1 && !MoveGuarded
value = 5810
ignorehitpause = 1
id = 226

;*避免在NumTarget後方添加其他運算符 (例如 &&)

[State 222, 19]
type = TargetState
triggerall = NumTarget(226)
triggerall = MoveContact = 1
triggerall = Target(226),StateType = C
trigger1 = NumTarget(226) = 1 && MoveHit
trigger2 = NumTarget(226) > 1 && !MoveGuarded
value = 5820
ignorehitpause = 1
id = 226

[State 222, 20]
type = TargetState
triggerall = NumTarget(226)
triggerall = MoveContact = 1
triggerall = Target(226),StateType = A
trigger1 = NumTarget(226) = 1 && MoveHit
trigger2 = NumTarget(226) > 1 && !MoveGuarded
value = 5830
ignorehitpause = 1
id = 226

[State 222, 21 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Normal Attack 5Y*5 / Chain Barrage (5)
; 通常攻擊5Y*5 / 連鎖亂擊(五)
;---------------------------------------------------------------------------
[Statedef 227]
type = S
movetype = A
physics = S
;anim = 227
velset = 0,0
ctrl = 0
poweradd = 0
juggle = 4
sprpriority = 3

[State 227, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 227
value = 227

[State 227, 2 (Whirlwind Spear Slash B)]
type = Explod
trigger1 = AnimElemTime(3) = 0
anim = 7512
id = 7427
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

[State 227, 3 (Whirlwind Spear Slash B Subtraction)]
type = Explod
trigger1 = AnimElemTime(3) = 0
anim = 7513
id = 7427
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

[State 227, 4 (Character Voice)]
type = PlaySnd
trigger1 = AnimElem = 5
value = s5,15
channel = 0

[State 227, 5 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElem = 5
value = s6,16
channel = 10

[State 227, 6]
type = Width
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(15) < 0
player = 152*(floor(const(size.xscale))),0
ignorehitpause = 1

[State 227, 7]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElem = 6,>= 0
trigger1 = AnimElem = 9,< 0
trigger1 = 1 || var(21):= 920 ;Hit Spark X
trigger1 = 1 || var(22):= -345 ;Hit Spark Y
trigger1 = 1 || var(23):= 7236 ;Hit Spark ID
trigger1 = 1 || var(24):= 7310 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 227 ;HitDef ID
attr = S, SA
hitflag = MAFP ;測試過加上P可有效攻擊Projectile(飛行道具) 但是對手的飛行道具如果沒有藍框(受擊框)判定而只有紅框(攻擊框)時 打掉飛行道具的同時我方也會受傷害(被攻擊)
guardflag = MA
animtype = Hard
air.animtype = Hard
priority = 5, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.080))*fvar(13)),80*fvar(13)),cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.014))*fvar(13)),14*fvar(13))
getpower = 30,15
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
down.cornerpush.veloff = -60 ;因為招式攻擊高度較高 該數值設計較低屬於合理情況
air.cornerpush.veloff = -91
guard.cornerpush.veloff = -150
airguard.cornerpush.veloff = -144
airguard.ctrltime = 44
guard.dist = 1900
fall = 1
air.fall = 1
id = 227

[State 227, 8 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElem = 12
value = s6,7
channel = 11

[State 227, 9 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Normal Attack 5B
; 通常攻擊5B
;---------------------------------------------------------------------------
[Statedef 230]
type = S
movetype = A
physics = S
;anim = 230
velset = 6,0
ctrl = 0
poweradd = 0
juggle = 3
sprpriority = 2

[State 230, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 230
value = 230

[State 230, 2]
type = Width
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(7) < 0
player = 152*(floor(const(size.xscale))),0
ignorehitpause = 1

[State 230, 3 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElemTime(3) = 0
value = s6,1
channel = 10

[State 230, 4 (Character Voice)]
type = PlaySnd
triggerall = Random < 750
trigger1 = AnimElemTime(3) = 0
value = s5,3+(random%3)
channel = 0

[State 230, 5 (Spear Slash H)]
type = Explod
trigger1 = AnimElemTime(3) = 0
anim = 7430
id = 7430
;space = stage
pos = cond(facing = 1,0,-0)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 11
removeongethit = 1
ignorehitpause = 0

[State 230, 6 (Spear Slash H Subtraction)]
type = Explod
trigger1 = AnimElemTime(3) = 0
anim = 7431
id = 7430
;space = stage
pos = cond(facing = 1,0,-0)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 11
removeongethit = 1
ignorehitpause = 0

[State 230, 7]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElem = 3
trigger1 = 1 || var(21):= 785 ;Hit Spark X
trigger1 = 1 || var(22):= -405 ;Hit Spark Y
trigger1 = 1 || var(23):= 7234 ;Hit Spark ID
trigger1 = 1 || var(24):= 7310 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 230 ;HitDef ID
attr = S, NA
hitflag = MAF
guardflag = MA
animtype = Medium
air.animtype = Medium
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.038))*fvar(13)),38*fvar(13)),0
getpower = 30,15
pausetime = 12,12
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = High
air.type = Low
ground.slidetime = 21+3*var(50)
ground.hittime = 21+3*var(50)
guard.slidetime = 19
guard.ctrltime = 19
guard.hittime = 19
ground.velocity = -32
guard.velocity = -45
air.velocity = -22,-10
airguard.velocity = -30,-5 ;默認值為air.velocity參數X軸*1.5 Y軸/2
air.hittime = 21+3*var(50)
ground.cornerpush.veloff = -85
air.cornerpush.veloff = -75
guard.cornerpush.veloff = -100
airguard.cornerpush.veloff = -87.5
airguard.ctrltime = 21
guard.dist = 1160
air.fall = 1
id = 230

[State 230, 8 (Jump Cancel)] ;跳躍取消
type = ChangeState
triggerall = var(59) = 0 || AILevel = 0
trigger1 = Command = "up" || Command = "holdup"
trigger1 = MoveContact >= 1
value = 40

[State 230, 9 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Normal Attack 5C
; 通常攻擊5C
;---------------------------------------------------------------------------
[Statedef 240]
type = S
movetype = A
physics = S
;anim = 240
velset = 0,0
ctrl = 0
poweradd = 0
juggle = 4
sprpriority = 2

[State 240, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 240
value = 240

[State 240, 2]
type = VelSet
trigger1 = AnimElemTime(3) = 1
x = 48

[State 240, 3 (Spear Slash I)]
type = Explod
trigger1 = AnimElemTime(4) = 0
anim = 7440
id = 7440
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 12
removeongethit = 1
ignorehitpause = 0

[State 240, 4 (Spear Slash I Subtraction)]
type = Explod
trigger1 = AnimElemTime(4) = 0
anim = 7441
id = 7440
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 12
removeongethit = 1
ignorehitpause = 0

[State 240, 5]
type = PlaySnd
trigger1 = AnimElem = 5
value = s6,3
channel = 11

[State 240, 6]
type = Width
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(10) < 0
player = 152*(floor(const(size.xscale))),0
ignorehitpause = 1

[State 240, 7]
type = VelSet
trigger1 = AnimElem = 6
x = 0

[State 240, 8 (Character Voice)]
type = PlaySnd
triggerall = Random < 750
trigger1 = AnimElemTime(6) = 0
value = s5,9+(random%3)
channel = 0

[State 240, 9]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElem = 6
trigger1 = 1 || var(21):= 596 ;Hit Spark X
trigger1 = 1 || var(22):= -406 ;Hit Spark Y
trigger1 = 1 || var(23):= 7236 ;Hit Spark ID
trigger1 = 1 || var(24):= 7310 ;Guard Spark ID
trigger1 = 1 || var(25):= 110 ;Hit Spark Angle
trigger1 = 1 || var(36):= 240 ;HitDef ID
attr = S, NA
hitflag = MAF
guardflag = MA
animtype = Hard
air.animtype = Hard
priority = 5, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.056))*fvar(13)),56*fvar(13)),0
getpower = 30,15
pausetime = 14,14
sparkno = -1
guard.sparkno = -1
hitsound = s7,4
guardsound = s8,2
ground.type = High
air.type = Low
ground.slidetime = 27+4*var(50)
ground.hittime = 27+4*var(50)
guard.slidetime = 25
guard.ctrltime = 25
guard.hittime = 25
ground.velocity = -56
guard.velocity = -66
air.velocity = -45,-12
airguard.velocity = -58,-6 ;默認值為air.velocity參數X軸*1.5 Y軸/2
air.hittime = 27+4*var(50)
ground.cornerpush.veloff = -110
air.cornerpush.veloff = -100
guard.cornerpush.veloff = -120
airguard.cornerpush.veloff = -112
airguard.ctrltime = 28
guard.dist = 1090
air.fall = 1
id = 240

[State 240, 10 (Run Forward Cancel)] ;向前跑取消
type = ChangeState
triggerall = var(59) = 0 || AILevel = 0 ;Player Control 玩家操作時
trigger1 = Command = "FF"
trigger1 = MoveHit >= 1 ;招式命中時
value = 100
ctrl = 1

[State 240, 11 (Hop Backwards Cancel)] ;向後跳取消
type = ChangeState
triggerall = var(59) = 0 || AILevel = 0 ;Player Control 玩家操作時
trigger1 = Command = "BB"
trigger1 = MoveHit >= 1 ;招式命中時
value = 105
ctrl = 0

[State 240, 12 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Normal Attack 6C
; 通常攻擊6C
;---------------------------------------------------------------------------
[Statedef 245]
type = S
movetype = A
physics = S
;anim = 245
;velset = 0,0
ctrl = 0
poweradd = 0
juggle = 2
sprpriority = 2
facep2 = 1

[State 245, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 245
value = 245

[State 245, 2 (Add Forward Velocity When Combo)]
type = VelSet
trigger1 = AnimElemTime(2) = 1
x = cond(prevstateno = 240,74,60)

[State 245, 3 (Character Voice)]
type = PlaySnd
triggerall = Random < 666
trigger1 = AnimElemTime(2) = 2
value = s5,3+(random%2)
channel = 0

[State 245, 4]
type = Width
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(8) < 0
player = 112*(floor(const(size.xscale))),0
ignorehitpause = 1

[State 245, 5]
type = PlaySnd
trigger1 = AnimElemTime(3) = 0
value = s6,3
channel = 11

[State 245, 6 (Spear Slash L)]
type = Explod
trigger1 = AnimElemTime(3) = 0
anim = 7450
id = 7445
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 17
removeongethit = 1
ignorehitpause = 0

[State 245, 7 (Spear Slash L Subtraction)]
type = Explod
trigger1 = AnimElemTime(3) = 0
anim = 7451
id = 7445
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 17
removeongethit = 1
ignorehitpause = 0

[State 245, 8 (Moving Dust 1)]
type = Explod
triggerall = Vel X > 0
trigger1 = AnimElemTime(3) = 0
anim = 7040
id = 7040
;space = stage
pos = cond(facing = 1,170,-170)*fvar(21),0
facing = facing
bindid = id
bindtime = 1
removetime = 16
scale = fvar(21)*1.00,fvar(22)*1.00
removeongethit = 1
ignorehitpause = 1
sprpriority = 0
shadow = 0,0,0
ownpal = 1

[State 245, 9 (Moving Dust 2)]
type = Explod
triggerall = Vel X > 0
trigger1 = AnimElemTime(3) = 0
anim = 7040
id = 7040
;space = stage
pos = cond(facing = 1,-150,150)*fvar(21),0
facing = facing
bindid = id
bindtime = 1
removetime = 16
scale = fvar(21)*1.00,fvar(22)*1.00
removeongethit = 1
ignorehitpause = 1
sprpriority = 0
shadow = 0,0,0
ownpal = 1

[State 245, 10]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 245, 11]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElem = 4
trigger1 = 1 || var(21):= 380 ;Hit Spark X
trigger1 = 1 || var(22):= -360 ;Hit Spark Y
trigger1 = 1 || var(23):= 7236 ;Hit Spark ID
trigger1 = 1 || var(24):= 7310 ;Guard Spark ID
trigger1 = 1 || var(25):= 70 ;Hit Spark Angle
trigger1 = 1 || var(36):= 245 ;HitDef ID
attr = S, NA
hitflag = MAF
guardflag = MA
animtype = Hard
air.animtype = Hard
priority = 5, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.054))*fvar(13)),54*fvar(13)),0
getpower = 30,15
pausetime = 10,10
sparkno = -1
guard.sparkno = -1
hitsound = s7,4
guardsound = s8,2
ground.type = High
air.type = High
ground.slidetime = 25+4*var(50)
ground.hittime = 25+4*var(50)
guard.slidetime = 23
guard.ctrltime = 23
guard.hittime = 23
yaccel = 2.4
ground.velocity = -58
guard.velocity = -68
air.velocity = -18,-36
airguard.velocity = -33,-20
air.hittime = 27+4*var(50)
ground.cornerpush.veloff = -110
air.cornerpush.veloff = -100
guard.cornerpush.veloff = -120
airguard.cornerpush.veloff = -112
airguard.ctrltime = 28
fall = 0
air.fall = 1
guard.dist = 820
id = 245

[State 245, 12 (Jump Cancel)] ;跳躍取消
type = ChangeState
triggerall = var(59) = 0 || AILevel = 0
trigger1 = Command = "up" || Command = "holdup"
trigger1 = MoveHit >= 1 ;招式命中時
value = 255
ctrl = 0

[State 245, 13 (Run Forward Cancel)] ;向前跑取消
type = ChangeState
triggerall = var(59) = 0 || AILevel = 0
trigger1 = Command = "FF"
trigger1 = MoveHit >= 1 ;招式命中時
value = 100
ctrl = 1

[State 245, 14 (Hop Backwards Cancel)] ;向後跳取消
type = ChangeState
triggerall = var(59) = 0 || AILevel = 0
trigger1 = Command = "BB"
trigger1 = MoveHit >= 1 ;招式命中時
value = 105
ctrl = 0

[State 245, 15 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;----------------------------------------------------------------------
; Normal Attack 5A
; 通常攻擊5A
;----------------------------------------------------------------------
[Statedef 250]
type = S
movetype = A
physics = S
;anim = 250
velset = 0,0
ctrl = 0
poweradd = 0
juggle = 2
sprpriority = 2
facep2 = 1

[State 250, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 250
value = 250

[State 250, 2 (Add Forward Velocity When Combo)]
type = VelSet
triggerall = AnimElemTime(2) = 1
trigger1 = PrevStateNo = 200 ;通常攻擊5Y
trigger2 = PrevStateNo = [210,220] ;連鎖亂擊(二)、連鎖亂擊(三)
trigger3 = PrevStateNo = [230,245] ;通常攻擊5B、通常攻擊5C、通常攻擊6C
x = cond((prevstateno = [200,210]),32,64)

[State 250, 3 (Character Voice)]
type = PlaySnd
triggerall = Random < 666
trigger1 = AnimElemTime(2) = 2
value = s5,3+(random%2)
channel = 0

[State 250, 4]
type = PlaySnd
trigger1 = AnimElemTime(3) = 0
value = s6,3
channel = 11

[State 250, 5 (Spear Slash L2)]
type = Explod
trigger1 = AnimElemTime(3) = 0
anim = 7452
id = 7450
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,3
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 12
removeongethit = 1
ignorehitpause = 0

[State 250, 6 (Spear Slash L2 Subtraction)]
type = Explod
trigger1 = AnimElemTime(3) = 0
anim = 7453
id = 7450
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 12
removeongethit = 1
ignorehitpause = 0

[State 250, 7 (Moving Dust 1)]
type = Explod
triggerall = Vel X > 0
trigger1 = AnimElemTime(3) = 0
anim = 7040
id = 7040
;space = stage
pos = cond(facing = 1,170,-170)*fvar(21),0
facing = facing
bindid = id
bindtime = 1
removetime = 16
scale = fvar(21)*1.00,fvar(22)*1.00
removeongethit = 1
ignorehitpause = 1
sprpriority = 0
shadow = 0,0,0
ownpal = 1

[State 250, 8 (Moving Dust 2)]
type = Explod
triggerall = Vel X > 0
trigger1 = AnimElemTime(3) = 0
anim = 7040
id = 7040
;space = stage
pos = cond(facing = 1,-150,150)*fvar(21),0
facing = facing
bindid = id
bindtime = 1
removetime = 16
scale = fvar(21)*1.00,fvar(22)*1.00
removeongethit = 1
ignorehitpause = 1
sprpriority = 0
shadow = 0,0,0
ownpal = 1

[State 250, 9]
type = VelSet
trigger1 = AnimElem = 4
x = 0

[State 250, 10]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElem = 4
trigger1 = 1 || var(21):= 380 ;Hit Spark X
trigger1 = 1 || var(22):= -360 ;Hit Spark Y
trigger1 = 1 || var(23):= 7210 ;Hit Spark ID
trigger1 = 1 || var(24):= 7300 ;Guard Spark ID
trigger1 = 1 || var(25):= 70 ;Hit Spark Angle
trigger1 = 1 || var(36):= 250 ;HitDef ID
attr = S, NA
hitflag = MAF
guardflag = MA
animtype = Up
air.animtype = Up
priority = 5, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.018))*fvar(13)),18*fvar(13)),0
getpower = 30,15
pausetime = 10,10
sparkno = -1
guard.sparkno = -1
hitsound = s7,2
guardsound = s8,1
ground.type = High
air.type = Low
ground.slidetime = 18+1*var(50)
ground.hittime = 18+1*var(50)
guard.slidetime = 16
guard.ctrltime = 16
guard.hittime = 16
yaccel = 2.4
ground.velocity = -6,-50
guard.velocity = -32
air.velocity = -6,-41
airguard.velocity = -22,-10.2
air.hittime = 18+1*var(50)
airguard.ctrltime = 18
fall = 1
air.fall = 1
p2facing = 1
fall.recover = 1
fall.recovertime = 40
ground.cornerpush.veloff = -82
air.cornerpush.veloff = -82
guard.cornerpush.veloff = -88
airguard.cornerpush.veloff = -92
guard.dist = 820
id = 250

[State 250, 11]
type = HitBy
trigger1 = MoveHit >= 1
value = SCA, SA, HA, SP, HP
time = 1
ignorehitpause = 1

[State 250, 12]
type = TargetState
triggerall = NumTarget(250)
triggerall = MoveContact = 1
trigger1 = NumTarget(250) = 1 && MoveHit
trigger2 = NumTarget(250) > 1 && !MoveGuarded
value = 5800
ignorehitpause = 1
id = 250 ;跟HitDef的id號相同

[State 250, 13 (Target MoveHit Auto Jump Cancel)] ;擊中對手時自動跳躍取消
type = ChangeState
triggerall = NumTarget(250)
triggerall = Target(250),Alive = 1
trigger1 = MoveHit >= 1
value = 255
ctrl = 0

[State 250, 14 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Normal Attack 5A (Pursuit Jump)
; 通常攻擊5A (追擊用跳躍)
;---------------------------------------------------------------------------
[Statedef 255]
type = S
movetype = I
physics = S
anim = 255
ctrl = 0
movehitpersist = 1
hitcountpersist = 1
sprpriority = 1
facep2 = 1

[State 255, 1]
type = HitBy
trigger1 = 1
value = SCA, SA, HA, SP, HP
time = 1
ignorehitpause = 1

[State 255, 2 (Jump Sound)]
type = PlaySnd
trigger1 = Time = 0
value = s40,0
channel = 11

[State 255, 3]
type = AssertSpecial
trigger1 = Time < 18
flag = NoAirGuard

[State 255, 4]
type = StateTypeSet
trigger1 = AnimElemTime(3) = 0
statetype = A
physics = N

[State 255, 5]
type = AfterImage
triggerall = PrevStateNo = 250
trigger1 = Animelem = 3
time = -1
length = 10
;palbright  = 180,0,0
palcontrast = 140,110,70
;paladd = -60,-60,-60
;palmul = 128,1,1
trans = add
timegap = 1
framegap = 4

[State 255, 6]
type = VelSet
trigger1 = AnimElem = 3
x = cond(p2bodydist x < 300,10,10+((p2bodydist x-300)*0.1))
y = -56

[State 255, 7]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = const(movement.yaccel)

[State 255, 8 (To Next State 256)]
type = ChangeState
trigger1 = AnimTime = 0
value = 256
ctrl = 1

;---------------------------------------------------------------------------
; Normal Attack 5A (Pursuit Jump) / End
; 通常攻擊5A (追擊用跳躍) / 結束
;---------------------------------------------------------------------------
[Statedef 256]
type = A
movetype = I
physics = N
anim = 256
movehitpersist = 0
hitcountpersist = 0
ctrl = 1

[State 256, 1]
type = Turn
trigger1 = P2Dist X < -60

[State 256, 2]
type = VelMul
trigger1 = !Time
y = 0.65

[State 256, 3]
type = StopSnd
trigger1 = Time = 0
channel = 12

[State 256, 4]
type = VelAdd
trigger1 = Time
y = const(movement.yaccel)

[State 256, 5 (To Next State 52)]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 52

;---------------------------------------------------------------------------
; Teleport Heaven's Spear / Teleport
; 瞬間移動飛天槍 / 瞬間移動
;---------------------------------------------------------------------------
[Statedef 259]
type = U
movetype = I
physics = U
sprpriority = -1
ctrl = 0
velset = 0,0

[State 259, 1 (Effect Sound)]
type = PlaySnd
trigger1 = Time = 0
value = s6,17
channel = 13

[State 259, 2]
type = Pause
trigger1 = Time = 0
time = 8
pausebg = 1

[State 259, 3]
type = PowerAdd
trigger1 = Time = 0
value = -1000

[State 259, 4]
type = ChangeAnim
trigger1 = 1
value = Anim
elem = AnimElemNo(0)

[State 259, 5]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1

[State 259, 6]
type = HitBy
trigger1 = 1
value =
time = 1

[State 259, 7]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256-Time*32,256

[State 259, 8]
type = PosSet
triggerall = NumEnemy
trigger1 = RoundState = [0,2]
trigger1 = Time = 8
x = enemynear(var(48)),pos x
y = enemynear(var(48)),const(size.head.pos.y)+(enemynear(var(48)),pos y)-380

[State 259, 9]
type = PosSet
triggerall = NumEnemy
trigger1 = RoundState >= 3
trigger1 = Time = 8
x = enemynear(var(48)),pos x
y = enemynear(var(48)),const(size.head.pos.y)+(enemynear(var(48)),pos y)-380

[State 259, 10 (To Next State 620)]
type = ChangeState
trigger1 = Time >= 8
value = 625
ctrl = 0

;---------------------------------------------------------------------------
; Normal Attack 2Y / Crouch Chain Barrage (1)
; 通常攻擊2Y / 蹲下連鎖亂擊(一)
;---------------------------------------------------------------------------
[Statedef 400]
type = C
movetype = A
physics = C
;anim = 400
;velset = 0,0 ;*1
ctrl = 0
poweradd = 0
juggle = 6 ;*2
sprpriority = 2

[State 400, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 400
value = 400

[State 400, 2 (Character Voice)]
type = PlaySnd
triggerall = Random < 750
trigger1 = AnimElemTime(1) = 3
value = s5,0+(random%3)
channel = 0

[State 400, 3]
type = PlaySnd
trigger1 = AnimElem = 2
value = s6,0
channel = 10

[State 400, 4 (Spear Slash B)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 7404
id = 7404
;space = stage
pos = cond(facing = 1,0,-0)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 6
removeongethit = 1
ignorehitpause = 0

[State 400, 5 (Spear Slash B Subtraction)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 7405
id = 7404
;space = stage
pos = cond(facing = 1,0,-0)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 6
removeongethit = 1
ignorehitpause = 0

[State 400, 6]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElem = 2
trigger1 = 1 || var(21):= 430 ;Hit Spark X
trigger1 = 1 || var(22):= -15 ;Hit Spark Y
trigger1 = 1 || var(23):= 7230 ;Hit Spark ID
trigger1 = 1 || var(24):= 7300 ;Guard Spark ID
trigger1 = 1 || var(25):= 150 ;Hit Spark Angle
trigger1 = 1 || var(36):= 400 ;HitDef ID
attr = C, NA
hitflag = MAF
guardflag = L
animtype = Light
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.020))*fvar(13)),20*fvar(13)),0
getpower = 30,15
pausetime = 11,11
sparkno = -1
guard.sparkno = -1
hitsound = s7,0
guardsound = s8,0
ground.type = Low
ground.slidetime = 14+2*var(50)
ground.hittime = 14+2*var(50)
guard.slidetime = 12
guard.ctrltime = 12
guard.hittime = 12
ground.velocity = -11,0
guard.velocity = -15
air.velocity = -8,-3.5
air.hittime = 14+2*var(50)
airguard.velocity = -13,-3
ground.cornerpush.veloff = -40
air.cornerpush.veloff = -25
guard.cornerpush.veloff = -38
airguard.cornerpush.veloff = -36
fall = 0
air.fall = 1
guard.dist = 850
id = 400

[State 400, 7]
type = CtrlSet
trigger1 = Time >= 14
value = 1

[State 400, 8 (To Next State 11)]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;*1除非特殊情況 physics = C & A時勿在此位置添加VelSet (會影響移動速度)
;  特別是人物在半空中的時候(人物會直接往下移)

;*2因為攻擊樣式特殊且hitflag帶有D(可攻擊躺上地上的對手)，請將juggle設定到最多2連擊(如果juggle設定為15，那就設定為7)，避免無限連擊。
;  RizMAAB-Constants下方有寫上關於juggle的說明
;  一般招式(hitflag帶有A和F)適合當作最後一段的招式可以將juggle值調高一點。

;---------------------------------------------------------------------------
; Normal Attack 2B / Crouch Chain Barrage (2)
; 通常攻擊2B / 蹲下連鎖亂擊(二)
;---------------------------------------------------------------------------
[Statedef 410]
type = C
movetype = A
physics = C
;anim = 410
ctrl = 0
poweradd = 0
juggle = 5
sprpriority = 2

[State 410, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 410
value = 410

[State 410, 2 (Character Voice)]
type = PlaySnd
triggerall = Random < 750
trigger1 = AnimElemTime(3) = 2
value = s5,3+(random%3)
channel = 0

[State 410, 3 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElem = 4
value = s6,1
channel = 10

[State 410, 4]
type = VelSet
trigger1 = AnimElemTime(3) = 0
x = 5
y = 0

[State 410, 5 (Moving Dust 1)]
type = Explod
trigger1 = AnimElemTime(3) = 0
anim = 7040
id = 7040
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = 1
removetime = 16
scale = fvar(21)*1.00,fvar(22)*1.00
removeongethit = 1
ignorehitpause = 1
sprpriority = 0
shadow = 0,0,0
ownpal = 1

[State 410, 6 (Spear Slash E)]
type = Explod
trigger1 = AnimElemTime(4) = 0
anim = 7414
id = 7414
;space = stage
pos = cond(facing = 1,0,-0)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 5
removeongethit = 1
ignorehitpause = 0

[State 410, 7 (Spear Slash E Subtraction)]
type = Explod
trigger1 = AnimElemTime(4) = 0
anim = 7415
id = 7414
;space = stage
pos = cond(facing = 1,0,-0)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 5
removeongethit = 1
ignorehitpause = 0

[State 410, 8]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElem = 4
trigger1 = 1 || var(21):= 480 ;Hit Spark X
trigger1 = 1 || var(22):= -35 ;Hit Spark Y
trigger1 = 1 || var(23):= 7234 ;Hit Spark ID
trigger1 = 1 || var(24):= 7310 ;Guard Spark ID
trigger1 = 1 || var(25):= 18 ;Hit Spark Angle
trigger1 = 1 || var(36):= 410 ;HitDef ID
attr = C, NA
hitflag = MAF
guardflag = L
animtype = Medium
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.040))*fvar(13)),40*fvar(13)),0
getpower = 30,15
pausetime = 13,13
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = Low
ground.slidetime = 19+3*var(50)
ground.hittime = 19+3*var(50)
guard.slidetime = 17
guard.ctrltime = 17
guard.hittime = 17
ground.velocity = -16,0
guard.velocity = -28
air.velocity = -13,-6
airguard.velocity = -21,-3.5
air.hittime = 19+3*var(50)
ground.cornerpush.veloff = -76
air.cornerpush.veloff = -61
guard.cornerpush.veloff = -82
airguard.cornerpush.veloff = -75
guard.dist = 930
air.fall = 1
id = 410

[State 410, 9 (Spear Slash E2)]
type = Explod
triggerall = NumExplod(7416) = 0
trigger1 = AnimElemTime(5) = 0
anim = 7416
id = 7416
;space = stage
pos = cond(facing = 1,0,-0)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 4
removeongethit = 1
ignorehitpause = 0

[State 410, 10 (Spear Slash E2 Subtraction)]
type = Explod
triggerall = NumExplod(7417) = 0
trigger1 = AnimElemTime(5) = 0
anim = 7417
id = 7417
;space = stage
pos = 0,0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 4
removeongethit = 1
ignorehitpause = 0

[State 410, 11 (To Next State 11)]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Normal Attack 2C / Crouch Chain Barrage (3)
; 通常攻擊2C / 蹲下連鎖亂擊(三)
;---------------------------------------------------------------------------
[Statedef 440]
type = C
movetype = A
physics = C
;anim = 440
ctrl = 0
poweradd = 0
juggle = 7 ;*
sprpriority = 2

;*因為攻擊樣式特殊且hitflag帶有D(可攻擊躺上地上的對手) 請將juggle設定到最多2連擊(如果juggle設定為15 那就設定為7) 避免無限連擊
; RizMAAB-Constants下方有寫上關於juggle的說明 (一般招式的話 適合當作最後一段的招式可以將juggle值調高一點)

[State 440, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 440
value = 440

[State 440, 2 (Character Voice)]
type = PlaySnd
triggerall = Random < 750
trigger1 = AnimElemTime(4) = 4
value = s5,9+(random%3)
channel = 0

[State 440, 3]
type = PlaySnd
trigger1 = AnimElemTime(3) = 1
value = s8,0
channel = 12

[State 440, 4]
type = PlaySnd
trigger1 = AnimElemTime(4) = 2
value = s6,3
channel = 11

[State 440, 5]
type = VelSet
trigger1 = P2Dist X >= 0 ;設置此參數避免我方倒退嚕(向後退)
trigger1 = AnimElemTime(5) = 0
x = 0+cond(p2dist x >= 350,233,(p2dist x/1.50))

[State 440, 6]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElem = 5
trigger1 = 1 || var(21):= 300 ;Hit Spark X
trigger1 = 1 || var(22):= -100 ;Hit Spark Y
trigger1 = 1 || var(23):= 7220 ;Hit Spark ID
trigger1 = 1 || var(24):= 7310 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 440 ;HitDef ID
attr = C, NA
hitflag = MAFD
guardflag = L
animtype = Hard
priority = 5, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.060))*fvar(13)),60*fvar(13)),0
getpower = 30,15
pausetime = 14,14
sparkno = -1
guard.sparkno = -1
hitsound = s7,6
guardsound = s8,2
ground.type = Trip
ground.slidetime = 12+3*var(50)
ground.hittime = 14+3*var(50)
guard.slidetime = 30
guard.ctrltime = 30
guard.hittime = 32
guard.dist = 810
ground.velocity = -20,-28
guard.velocity = -36
air.velocity = -22,-25
air.hittime = 14+3*var(50)
ground.cornerpush.veloff = -72
air.cornerpush.veloff = -64
guard.cornerpush.veloff = -80
airguard.cornerpush.veloff = -82
fall = 1
;air.fall = ;默認值和fall相同
id = 440

[State 440, 7]
type = VelSet
trigger1 = AnimElemTime(5) = 1
x = 0

[State 440, 8]
type = Explod
trigger1 = AnimElemTime(6) = 1
anim = 7053
pos = cond(facing = 1,130,-130)*fvar(21),-50*fvar(22)
facing = facing
bindid = id
bindtime = 1;只綁定本體1ticks
ownpal = 1
scale = fvar(21)*3.62,fvar(22)*4.32
sprpriority = 3
removetime = 8
removeongethit = 0
ignorehitpause = 1

[State 440, 9 (Jump Cancel)] ;跳躍取消
type = ChangeState
triggerall = var(59) = 0 || AILevel = 0
trigger1 = Command = "up" || Command = "holdup"
trigger1 = MoveHit >= 1 ;擊中對手時
value = 40

[State 440, 10 (To Next State 11)]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Normal Attack Air Y / Air Chain Barrage (1)
; 通常攻擊 空中Y / 空中連鎖亂擊(一)
;---------------------------------------------------------------------------
[Statedef 600]
type = A
movetype = A
physics = A
;anim = 600
;velset = 0,0
ctrl = 0
poweradd = 0
juggle = 2
sprpriority = 2

[State 600, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 600
value = 600

[State 600, 2]
type = StateTypeSet
triggerall = Time = 0
trigger1 = PrevStateNo = 110
trigger2 = PrevStateNo = 115
physics = N

[State 600, 3]
type = VelSet
triggerall = Time = 0
trigger1 = PrevStateNo = 110
trigger2 = PrevStateNo = 115
x = (0.20*cond(prevstateno = 110,1,-1))*prevstateno
y = 0

[State 600, 4 (Character Voice)]
type = PlaySnd
triggerall = Random < 750
trigger1 = AnimElemTime(1) = 4
value = s5,0+(random%3)
channel = 0

[State 600, 5 (Effect Sound)] ;効果音
type = PlaySnd
trigger1 = AnimElemTime(1) = 4
value = s6,0
channel = 10

[State 600, 6 (Spear Slash C)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 7406
id = 7406
;space = stage
pos = cond(facing = 1,0,-0)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 6
removeongethit = 1
ignorehitpause = 0

[State 600, 7 (Spear Slash C Subtraction)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 7407
id = 7406
;space = stage
pos = cond(facing = 1,0,-0)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 6
removeongethit = 1
ignorehitpause = 0

[State 600, 8]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElem = 2
trigger1 = 1 || var(21):= 380 ;Hit Spark X
trigger1 = 1 || var(22):= -160 ;Hit Spark Y
trigger1 = 1 || var(23):= 7231 ;Hit Spark ID
trigger1 = 1 || var(24):= 7301 ;Guard Spark ID
trigger1 = 1 || var(25):= 135 ;Hit Spark Angle
trigger1 = 1 || var(36):= 600 ;HitDef ID
attr = A, NA
hitflag = MAF
guardflag = HA
animtype = Light
air.animtype = Light
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.019))*fvar(13)),19*fvar(13)),0
getpower = 30,15
pausetime = 11,11
sparkno = -1
guard.sparkno = -1
hitsound = s7,0
guardsound = s8,0
ground.type = High
air.type = High
ground.slidetime = 14+2*var(50)
ground.hittime = 14+2*var(50)
guard.slidetime = 12
guard.ctrltime = 12
guard.hittime = 12
ground.velocity = -24
air.velocity = -12,-18
air.hittime = 14+2*var(50)
ground.cornerpush.veloff = -34
air.cornerpush.veloff = -28
guard.cornerpush.veloff = -34
airguard.cornerpush.veloff = -28
airguard.ctrltime = 18
air.fall = 1
id = 600
;p2stateno = cond(statetype = A,5802,-1) ;測試過仍然會將對方帶入我方狀態(Anim為對方狀態)，改用TargetState

[State 600, 9]
type = TargetState
triggerall = NumTarget(600)
triggerall = MoveContact = 1
triggerall = Target(600),StateType = A
trigger1 = NumTarget(600) = 1 && MoveHit
trigger2 = NumTarget(600) > 1 && !MoveGuarded
value = 5802
ignorehitpause = 1
id = 600

[State 600, 10 (StateTypeSet: Idle)]
type = StateTypeSet
trigger1 = AnimElemTime(6) = 0
movetype = I

[State 600, 11] ;人物往下降時且高度過低時不顯示Slash效果
type = RemoveExplod
triggerall = Vel Y > 0 ;下降時
trigger1 = Pos Y >= -55 ;高度過低時 (測試過最低高度為-59.2)
id = 7406

[State 600, 12]    ;一般來說physics = A的狀態定義可以不用設定ChangeState
type = ChangeState ;但為了讓人物在落下時再次使用同一個招式(轉為可控制狀態)可以額外設置
trigger1 = AnimElemTime(6) >= 3
value = 50
ctrl = 1

;---------------------------------------------------------------------------
; Normal Attack Air B / Air Chain Barrage (2)
; 通常攻擊 空中B / 空中連鎖亂擊(二)
;---------------------------------------------------------------------------
[Statedef 610]
type = A
movetype = A
physics = A
;anim = 610
ctrl = 0
poweradd = 0
juggle = 3
sprpriority = 2

[State 610, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 610
value = 610

[State 610, 2]
type = StateTypeSet
triggerall = Time = 0
trigger1 = PrevStateNo = 110
trigger2 = PrevStateNo = 115
physics = N

[State 610, 3]
type = VelSet
triggerall = Time = 0
trigger1 = PrevStateNo = 110
trigger2 = PrevStateNo = 115
x = (0.20*cond(prevstateno = 110,1,-1))*prevstateno
y = 0

[State 610, 4 (Spear Slash F)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 7418
id = 7418
;space = stage
pos = cond(facing = 1,0,-0)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 11
removeongethit = 1
ignorehitpause = 0

[State 610, 5 (Spear Slash F Subtraction)]
type = Explod
trigger1 = AnimElemTime(2) = 0
anim = 7419
id = 7418
;space = stage
pos = cond(facing = 1,0,-0)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 11
removeongethit = 1
ignorehitpause = 0

[State 610, 6 (Effect Sound)]
type = PlaySnd
trigger1 = AnimElemTime(2) = 0
value = s6,1
channel = 10

[State 610, 7 (Character Voice)]
type = PlaySnd
triggerall = Random < 750
trigger1 = AnimElemTime(2) = 4
value = s5,3+(random%3)
channel = 0

[State 610, 8]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = AnimElem = 3
trigger1 = 1 || var(21):= 600 ;Hit Spark X
trigger1 = 1 || var(22):= -470 ;Hit Spark Y
trigger1 = 1 || var(23):= 7235 ;Hit Spark ID
trigger1 = 1 || var(24):= 7311 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 610 ;HitDef ID
attr = A, NA
animtype = Medium
air.animtype = Medium
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.039))*fvar(13)),39*fvar(13)),0
getpower = 30,15
pausetime = 13,13
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = High
air.type = High
ground.slidetime = 12+3*var(50)
ground.hittime = 12+3*var(50)
guard.slidetime = 10
guard.ctrltime = 10
guard.hittime = 10
ground.velocity = -32
guard.velocity = -45
air.velocity = -22,-20
airguard.velocity = -30,-10
air.hittime = 12+3*var(50)
ground.cornerpush.veloff = -68
air.cornerpush.veloff = -36
guard.cornerpush.veloff = -83
airguard.cornerpush.veloff = -44
airguard.ctrltime = 16
guard.dist = 1010
air.fall = 1
id = 610

[State 610, 9]
type = TargetState
triggerall = NumTarget(610)
triggerall = MoveContact = 1
triggerall = Target(610),StateType = A
trigger1 = NumTarget(610) = 1 && MoveHit
trigger2 = NumTarget(610) > 1 && !MoveGuarded
value = 5802
ignorehitpause = 1
id = 610

[State 610, 10 (StateTypeSet: Idle)]
type = StateTypeSet
trigger1 = AnimElemTime(6) = 0
movetype = I

[State 610, 11]
type = RemoveExplod
triggerall = Vel Y > 0
trigger1 = Pos Y >= -55
id = 7418

[State 610, 12]
type = ChangeState
trigger1 = AnimElemTime(6) >= 3
value = 50
ctrl = 1

;---------------------------------------------------------------------------
; Heaven's Spear
; 飛天槍
;---------------------------------------------------------------------------
[Statedef 620]
type = A
movetype = I
physics = N
;anim = 620
ctrl = 0
poweradd = 0
juggle = 3
sprpriority = 2

[State 620, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 620
value = 620

[State 620, 2]
type = VelAdd
triggerall = Time > 0
trigger1 = PrevStateNo = 105
trigger2 = PrevStateNo = 115
trigger3 = PrevStateNo = 116
x = -0.6

[State 620, 3]
type = VelSet
trigger1 = Time = 0
trigger1 = PrevStateNo = 110
x = 24

[State 620, 4]
type = VelAdd
triggerall = Time > 0
trigger1 = PrevStateNo = 110
trigger2 = PrevStateNo = 115
y = 0.8

[State 620, 5]
type = Gravity
trigger1 = 1 ;const(movement.yaccel

[State 620, 6 (Character Voice)]
type = PlaySnd
trigger1 = AnimElemTime(2) = 3
value = s5,1
channel = 0

[State 620, 7]
type = PlaySnd
trigger1 = AnimElemTime(2) = 0
value = s6,1
channel = 10

[State 620, 8]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
movetype = A

[State 620, 9]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = 1 || var(21):= 30 ;Hit Spark X
trigger1 = 1 || var(22):= 0 ;Hit Spark Y
trigger1 = 1 || var(23):= 7231 ;Hit Spark ID
trigger1 = 1 || var(24):= 7301 ;Guard Spark ID
trigger1 = 1 || var(25):= 90 ;Hit Spark Angle
trigger1 = 1 || var(36):= 620 ;HitDef ID
attr = A, NA
animtype = Medium
air.animtype = Medium
fall.animtype = Medium
hitflag = MAFD
guardflag = HA
priority = 6, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.032))*fvar(13)),32*fvar(13)),0
getpower = 60,30
pausetime = 16,16
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = High
air.type = High
ground.slidetime = 18+4*var(50)
ground.hittime = 18+4*var(50)
guard.slidetime = 16
guard.ctrltime = 16
guard.hittime = 16
ground.velocity = 0
air.hittime = 20+4*var(50)
ground.cornerpush.veloff = -52
air.cornerpush.veloff = -46
guard.cornerpush.veloff = -52
airguard.cornerpush.veloff = -44
airguard.ctrltime = 24
air.velocity = 0,0
air.fall = 1
fall.recover = 0
guard.dist = 520
id = 620

[State 620, 10 (To Next State 652)]
type = ChangeState
trigger1 = Pos Y >= -180 && Vel Y > 0
value = 652
ctrl = 0

;---------------------------------------------------------------------------
; Teleport Heaven's Spear
; 瞬間移動飛天槍
;---------------------------------------------------------------------------
[Statedef 625]
type = A
movetype = A
physics = N
;anim = 620
ctrl = 0
poweradd = 0
juggle = 0
sprpriority = 2

[State 625, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 620
value = 620
elem = 2

[State 625, 2]
type = VelAdd
trigger1 = 1
y = const(movement.yaccel)

[State 625, 3]
type = Trans
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
trans = addalpha
alpha = 0+Time*128,256

[State 625, 4]
type = PlaySnd
trigger1 = AnimElemTime(2) = 1
value = s6,1
channel = 10

[State 625, 5]
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = 1 || var(21):= 30 ;Hit Spark X
trigger1 = 1 || var(22):= 0 ;Hit Spark Y
trigger1 = 1 || var(23):= 7231 ;Hit Spark ID
trigger1 = 1 || var(24):= 7301 ;Guard Spark ID
trigger1 = 1 || var(25):= 90 ;Hit Spark Angle
trigger1 = 1 || var(36):= 625 ;HitDef ID
attr = A, SA
animtype = Medium
air.animtype = Medium
fall.animtype = Medium
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.008))*fvar(13)),8*fvar(13)),0
hitflag = MAFD
guardflag = M ;限定在地面上防禦 (在空中時無法防禦)
priority = 7, Hit
pausetime = 16,16
sparkno = -1
guard.sparkno = -1
hitsound = s7,3
guardsound = s8,1
ground.type = High
air.type = High
ground.slidetime = 18+4*var(50)
ground.hittime = 18+4*var(50)
guard.slidetime = 16
guard.ctrltime = 16
guard.hittime = 16
ground.velocity = 0
air.hittime = 20+4*var(50)
ground.cornerpush.veloff = -52
air.cornerpush.veloff = -46
guard.cornerpush.veloff = -52
airguard.cornerpush.veloff = -44
airguard.ctrltime = 24
air.velocity = 0,0
air.fall = 1
fall.recover = 0
guard.dist = 520
id = 625

[State 625, 6 (To Next State 652)]
type = ChangeState
trigger1 = Pos Y >= -180 && Vel Y > 0
value = 652
ctrl = 0

;---------------------------------------------------------------------------
; Normal Attack Air C 
; 通常攻擊 空中C 
;---------------------------------------------------------------------------
[Statedef 640]
type = A
movetype = A
physics = A
;anim = 640
ctrl = 0
poweradd = 0
juggle = 4
sprpriority = 2

[State 640, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 640
value = 640

[State 640, 2]
type = StateTypeSet
triggerall = Time = 0
trigger1 = PrevStateNo = 110
trigger2 = PrevStateNo = 115
physics = N

[State 640, 3]
type = VelSet
triggerall = Time = 0
trigger1 = PrevStateNo = 110
trigger2 = PrevStateNo = 115
x = (0.20*cond(prevstateno = 110,1,-1))*prevstateno
y = 0

[State 640, 4]
type = PlaySnd
triggerall = Random < 750
trigger1 = AnimElemTime(4) = 3
value = s5,9+(random%3)
channel = 0

[State 640, 5 (Spear Slash J)]
type = Explod
trigger1 = AnimElemTime(4) = 0
anim = 7446
id = 7456
;space = stage
pos = cond(facing = 1,0,-0)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 3
removeongethit = 1
ignorehitpause = 0

[State 640, 6 (Spear Slash J Subtraction)]
type = Explod
trigger1 = AnimElemTime(4) = 0
anim = 7447
id = 7456
;space = stage
pos = cond(facing = 1,0,-0)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 3
removeongethit = 1
ignorehitpause = 0

[State 640, 7]
type = PlaySnd
trigger1 = AnimElem = 4
value = s6,3
channel = 11

[State 640, 8 (Spear Slash K)]
type = Explod
trigger1 = AnimElemTime(5) = 0
anim = 7448
id = 7456
;space = stage
pos = cond(facing = 1,0,-0)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 9
removeongethit = 1
ignorehitpause = 0

[State 640, 9 (Spear Slash K Subtraction)]
type = Explod
trigger1 = AnimElemTime(5) = 0
anim = 7449
id = 7456
;space = stage
pos = cond(facing = 1,0,-0)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 9
removeongethit = 1
ignorehitpause = 0

[State 640, 10 (When Facing the Enemy)] ;和敵人面對面時
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = facing != (enemynear(var(48)),facing) ;和靠近的對手朝向相反(面對面時)
trigger1 = AnimElem = 5
trigger1 = 1 || var(21):= 460 ;Hit Spark X
trigger1 = 1 || var(22):= -200 ;Hit Spark Y
trigger1 = 1 || var(23):= 7240 ;Hit Spark ID
trigger1 = 1 || var(24):= 7315 ;Guard Spark ID
trigger1 = 1 || var(25):= 50 ;Hit Spark Angle
trigger1 = 1 || var(36):= 640 ;HitDef ID
attr = A, NA
animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = HA
priority = 5, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.058))*fvar(13)),58*fvar(13)),0
getpower = 30,15
pausetime = 15,15
sparkno = -1
guard.sparkno = -1
hitsound = s7,4
guardsound = s8,2
ground.type = High
air.type = High
ground.slidetime = 14+4*var(50)
ground.hittime = 14+4*var(50)
guard.slidetime = 12
guard.ctrltime = 12
guard.hittime = 12
ground.velocity = -30
air.velocity = -18,-18
air.hittime = 14+4*var(50)
ground.cornerpush.veloff = -74
air.cornerpush.veloff = -40
guard.cornerpush.veloff = -74
airguard.cornerpush.veloff = -40
airguard.ctrltime = 18
guard.dist = 1160
air.fall = 1
id = 640

[State 640, 11 (Jump Over the Enemy, When the Enemy Turns)] ;跳過敵人 敵人轉向時
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = facing = (enemynear(var(48)),facing) ;和靠近的對手朝向相同(跳過對手 對手朝向我方時)
trigger1 = AnimElem = 5
trigger1 = 1 || var(21):= 460 ;Hit Spark X
trigger1 = 1 || var(22):= -200 ;Hit Spark Y
trigger1 = 1 || var(23):= 7240 ;Hit Spark ID
trigger1 = 1 || var(24):= 7315 ;Guard Spark ID
trigger1 = 1 || var(25):= 50 ;Hit Spark Angle
trigger1 = 1 || var(36):= 640 ;HitDef ID
attr = A, NA
animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = HA
priority = 5, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.058))*fvar(13)),58*fvar(13)),0
getpower = 30,15
pausetime = 15,15
sparkno = -1
guard.sparkno = -1
hitsound = s7,4
guardsound = s8,2
ground.type = High
air.type = High
ground.slidetime = 14+4*var(50)
ground.hittime = 14+4*var(50)
guard.slidetime = 12
guard.ctrltime = 12
guard.hittime = 12
ground.velocity = 30
air.velocity = 18,-18
air.hittime = 14+4*var(50)
ground.cornerpush.veloff = 74
air.cornerpush.veloff = 40
guard.cornerpush.veloff = 74
airguard.cornerpush.veloff = 40
airguard.ctrltime = 18
guard.dist = 1160
air.fall = 1
id = 640

[State 640, 12]
type = TargetState
triggerall = NumTarget(640)
triggerall = MoveContact = 1
triggerall = Target(640),StateType = A
trigger1 = NumTarget(640) = 1 && MoveHit
trigger2 = NumTarget(640) > 1 && !MoveGuarded
value = 5802
ignorehitpause = 1
id = 640

[State 640, 13]
type = RemoveExplod
triggerall = Vel Y > 0
trigger1 = Pos Y >= -55
id = 7456

[State 640, 14 (StateTypeSet:Idle)]
type = StateTypeSet
trigger1 = AnimElemTime(7) = 0
movetype = I

[State 640, 15]
type = ChangeState
trigger1 = AnimElemTime(7) >= 3
value = 50
ctrl = 1

;---------------------------------------------------------------------------
; Normal Attack Air Combo C / Air Chain Barrage (3)
; 通常攻擊 空中連段C / 空中連鎖亂擊(三)
;---------------------------------------------------------------------------
[Statedef 645]
type = A
movetype = A
physics = A
velset = const(velocity.airjump.fwd.x),const(velocity.airjump.y)
;anim = 640
ctrl = 0
poweradd = 0
juggle = 4
sprpriority = 2

[State 645, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != 640
value = 640

[State 645, 2]
type = PlaySnd
triggerall = Random < 750
trigger1 = AnimElemTime(4) = 3
value = s5,9+(random%3)
channel = 0

[State 645, 3 (Spear Slash J)]
type = Explod
trigger1 = AnimElemTime(4) = 0
anim = 7446
id = 7456
;space = stage
pos = cond(facing = 1,0,-0)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 3
removeongethit = 1
ignorehitpause = 0

[State 645, 4 (Spear Slash J Subtraction)]
type = Explod
trigger1 = AnimElemTime(4) = 0
anim = 7447
id = 7456
;space = stage
pos = cond(facing = 1,0,-0)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 3
removeongethit = 1
ignorehitpause = 0

[State 645, 5]
type = PlaySnd
trigger1 = AnimElem = 4
value = s6,3
channel = 11

[State 645, 6 (Spear Slash K)]
type = Explod
trigger1 = AnimElemTime(5) = 0
anim = 7448
id = 7456
;space = stage
pos = cond(facing = 1,0,-0)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 9
removeongethit = 1
ignorehitpause = 0

[State 645, 7 (Spear Slash K Subtraction)]
type = Explod
trigger1 = AnimElemTime(5) = 0
anim = 7449
id = 7456
;space = stage
pos = cond(facing = 1,0,-0)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7400,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 3
removetime = 9
removeongethit = 1
ignorehitpause = 0

[State 645, 8 (When Facing the Enemy)] ;和敵人面對面時
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = facing != (enemynear(var(48)),facing) ;和靠近的對手朝向相反(面對面時)
trigger1 = AnimElem = 5
trigger1 = 1 || var(21):= 460 ;Hit Spark X
trigger1 = 1 || var(22):= -200 ;Hit Spark Y
trigger1 = 1 || var(23):= 7240 ;Hit Spark ID
trigger1 = 1 || var(24):= 7315 ;Guard Spark ID
trigger1 = 1 || var(25):= 50 ;Hit Spark Angle
trigger1 = 1 || var(36):= 645 ;HitDef ID
attr = A, NA
animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = HA
priority = 5, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.058))*fvar(13)),58*fvar(13)),0
getpower = 30,15
pausetime = 15,15
sparkno = -1
guard.sparkno = -1
hitsound = s7,4
guardsound = s8,2
ground.type = High
air.type = High
ground.slidetime = 14+4*var(50)
ground.hittime = 14+4*var(50)
guard.slidetime = 12
guard.ctrltime = 12
guard.hittime = 12
ground.velocity = -30
air.velocity = -18,-18
air.hittime = 14+4*var(50)
ground.cornerpush.veloff = -74
air.cornerpush.veloff = -40
guard.cornerpush.veloff = -74
airguard.cornerpush.veloff = -40
airguard.ctrltime = 18
guard.dist = 1160
air.fall = 1
id = 645

[State 645, 9 (Jump Over the Enemy, When the Enemy Turns)] ;跳過敵人 敵人轉向時
type = HitDef
triggerall = !MoveContact && !MoveReversed
trigger1 = facing = (enemynear(var(48)),facing) ;和靠近的對手朝向相同(跳過對手 對手朝向我方時)
trigger1 = AnimElem = 5
trigger1 = 1 || var(21):= 460 ;Hit Spark X
trigger1 = 1 || var(22):= -200 ;Hit Spark Y
trigger1 = 1 || var(23):= 7240 ;Hit Spark ID
trigger1 = 1 || var(24):= 7315 ;Guard Spark ID
trigger1 = 1 || var(25):= 50 ;Hit Spark Angle
trigger1 = 1 || var(36):= 645 ;HitDef ID
attr = A, NA
animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = HA
priority = 5, Hit
damage = cond(var(15) > 0,ceil((((fvar(11))*fvar(12)*0.058))*fvar(13)),58*fvar(13)),0
getpower = 30,15
pausetime = 15,15
sparkno = -1
guard.sparkno = -1
hitsound = s7,4
guardsound = s8,2
ground.type = High
air.type = High
ground.slidetime = 14+4*var(50)
ground.hittime = 14+4*var(50)
guard.slidetime = 12
guard.ctrltime = 12
guard.hittime = 12
ground.velocity = 30
air.velocity = 18,-18
air.hittime = 14+4*var(50)
ground.cornerpush.veloff = 74
air.cornerpush.veloff = 40
guard.cornerpush.veloff = 74
airguard.cornerpush.veloff = 40
airguard.ctrltime = 18
guard.dist = 1160
air.fall = 1
id = 645

[State 645, 10]
type = TargetState
triggerall = NumTarget(645)
triggerall = MoveContact = 1
triggerall = Target(645),StateType = A
trigger1 = NumTarget(645) = 1 && MoveHit
trigger2 = NumTarget(645) > 1 && !MoveGuarded
value = 5802
ignorehitpause = 1
id = 645

[State 645, 11]
type = RemoveExplod
triggerall = Vel Y > 0
trigger1 = Pos Y >= -55
id = 7456

[State 645, 12]
type = StateTypeSet
trigger1 = AnimElemTime(7) = 0
movetype = I

[State 645, 13]
type = ChangeState
trigger1 = AnimElemTime(7) >= 3
value = 50
ctrl = 1

;---------------------------------------------------------------------------
; Heaven's Spear / Jump Land 
; 飛天槍 / 跳完落地
;---------------------------------------------------------------------------
[Statedef 652]
type = S
movetype = I
physics = S
velset = 0,0
ctrl = 0

[State 652, 1]
type = ChangeAnim
triggerall = Time = 0
trigger1 = PrevStateNo = 620
trigger2 = PrevStateNo = 625
value = 47
elem = 1

[State 652, 2]
type = Turn
triggerall = PrevStateNo = 620 || PrevStateNo = 625
trigger1 = P2Dist X = [-540,0]
;trigger2 = Abs(EnemyNear(var(48)),Pos X-Pos X)*Facing = [-540,0];*1

[State 652, 3]
type = PlaySnd 
trigger1 = Time = 0
value = s2,4 ;人物落地產生的音效不應受攻擊而中斷

[State 652, 4]
type = VelSet
trigger1 = Abs(Vel X) < Const(Movement.Stand.Friction.Threshold)
x = 0

[State 652, 5]
type = VelSet
trigger1 = Time = 0
y = 0

[State 652, 6]
type = PosSet
trigger1 = Time = 0
y = 0

[State 652, 7]
type = HitBy
trigger1 = 1
value = SCA, SA, HA, SP, HP
time = 1

[State 652, 8 (Land Effect)]
type = Explod
trigger1 = Time = 0
anim = 7052
pos = 0,0
facing = facing
bindid = id
bindtime = 1 ;只綁定本體1ticks
ownpal = 1
sprpriority = -3
scale = fvar(21)*2.80,fvar(22)*2.80

[State 652, 9]
type = CtrlSet
trigger1 = Time >= 4
value = 1 

[State 652, 10 (Moves End)]
type = ChangeState
trigger1 = Anim = 12
trigger1 = AnimElemTime(2) = 3
trigger2 = Anim = 47
trigger2 = AnimTime = 0
value = 0
ctrl = 1

;*1這裡使用DisplayToClipBoard測試
;  Abs(EnemyNear(var(48)),Pos X-Pos X)*Facing
;  必須要人物正式轉向才會轉為負數Facing = -1

;  而P2Dist X計算則只要人物跳過對手，就會從負數開始計算(即使人物尚未轉身)。

;  其他Dist相關參考網站
;  https://mugenguild.com/forum/topics/p2bodydist-vs-p2dist-vs-pos-169037.0.html
;  https://mugenguild.com/forum/topics/trigger-and-controller-alternatives-178268.0.html

;---------------------------------------------------------------------------
; Kinkyuu Kaihi (Front)
; 緊急回避 (前)
;---------------------------------------------------------------------------
[Statedef 700]
type = S
movetype = I
physics = S
anim = 700
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = -2

[State 700, 1 (Character Voice)]
type = PlaySnd
trigger1 = AnimElem = 2
value = s5,12
channel = 0

[State 700, 2]
type = AfterImage
trigger1 = AnimElem = 2
time = -1
trans = add
timegap = 1
framegap = 4
length = 10
palcontrast = 128,128,128

[State 700, 3]
type = HitBy
trigger1 = AnimElem = 8, <= 0
value = SC, NT, ST, HT
time = 1

[State 700, 4]
type = VelSet
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(8) < 0
x = 35

[State 700, 5 (Movement End)]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 700, 6]
type = PlayerPush
trigger1 = AnimElemTime(2) > 0
value = 0

[State 700, 7 (Moving Dust 1)]
type = Explod
trigger1 = AnimElemTime(8) = 0
anim = 7040
id = 7041
;space = stage
pos = cond(facing = 1,86,-86)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
removetime = 6
scale = fvar(21)*1.00,fvar(22)*1.00
removeongethit = 1
ignorehitpause = 1
sprpriority = 3
shadow = 0,0,0
ownpal = 1

[State 700, 8]
type = RemoveExplod
trigger1 = AnimTime = 0
id = 7041

[State 700, 9 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Kinkyuu Kaihi (Back)
; 緊急回避 (後)
;---------------------------------------------------------------------------
[Statedef 705]
type = S
movetype = I
physics = S
anim = 705
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = -2

[State 705, 1 (Character Voice)]
type = PlaySnd
trigger1 = AnimElem = 3
value = s5,12
channel = 0

[State 705, 2]
type = AfterImage
trigger1 = AnimElem = 3
time = -1
trans = add
timegap = 1
framegap = 4
length = 10
palcontrast = 128,128,128

[State 705, 3]
type = HitBy
trigger1 = AnimElem = 7, <= 0
value = SC, NT, ST, HT
time = 1

[State 705, 4]
type = VelSet
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(7) < 0
x = -38

[State 705, 5 (Movement End)]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 705, 6]
type = PlayerPush
trigger1 = AnimElemTime(3) > 0
value = 0

[State 705, 7 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Roll Recovery / Knock Down (Lie Down)
; 翻滾恢復(受身) / 擊倒 (躺下)
;---------------------------------------------------------------------------
[Statedef 706]
type = S
movetype = I
physics = S
anim = 706 ;請注意第三個個動畫編號(AnimElem = 3)內容 在Fighter Factory上和主程式上的呈現效果不相同(以主程式上顯示的效果為準)
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = 1

[State 706, 1]
type = PalFX
trigger1 = Time = 0
time = 12
add = 128,128,128

[State 706, 2 (Recovery Effect)]
type = Explod
trigger1 = Time = 0
anim = 7152
id = 7152
pos = cond(facing = 1,0,-0)*fvar(21),-185*fvar(22)
facing = facing
bindid = id
bindtime = 1
ownpal = 1
scale = fvar(21)*1.00,fvar(22)*1.00
sprpriority = 2
removetime = -2
removeongethit = 1
ignorehitpause = 1

[State 706, 3 Recover Effect (Feather 1)]
type = Explod
trigger1 = Time = 0
anim = 7153
id = 7152
pos = cond(facing = 1,0,-0)*fvar(21),-185*fvar(22)
facing = facing
bindid = id
bindtime = 1
vel = cond(facing = 1,-32,32),-7
accel = cond(facing = 1,0.8,-0.8),0.4
ownpal = 1
scale = fvar(21)*2.5,fvar(22)*2.5
sprpriority = 2
removetime = -2
removeongethit = 1
ignorehitpause = 1

[State 706, 4 Recover Effect (Feather 2)]
type = Explod
trigger1 = Time = 0
anim = 7154
id = 7152
pos = cond(facing = 1,0,-0)*fvar(21),-185*fvar(22)
facing = facing
bindid = id
bindtime = 1
vel = cond(facing = 1,-27,27),-13
accel = cond(facing = 1,0.7,-0.7),0.5
ownpal = 1
scale = fvar(21)*2.5,fvar(22)*2.5
sprpriority = 2
removetime = -2
removeongethit = 1
ignorehitpause = 1

[State 706, 5 Recover Effect (Feather 3)]
type = Explod
trigger1 = Time = 0
anim = 7155
id = 7152
pos = cond(facing = 1,0,-0)*fvar(21),-185*fvar(22)
facing = facing
bindid = id
bindtime = 1
vel = cond(facing = 1,-22,22),-19
accel = cond(facing = 1,0.5,-0.5),0.7
ownpal = 1
scale = fvar(21)*2.5,fvar(22)*2.5
sprpriority = 2
removetime = -2
removeongethit = 1
ignorehitpause = 1

[State 706, 6 Recover Effect (Feather 4)]
type = Explod
trigger1 = Time = 0
anim = 7156
id = 7152
pos = cond(facing = 1,0,-0)*fvar(21),-185*fvar(22)
facing = facing
bindid = id
bindtime = 1
vel = cond(facing = 1,-17,17),-25
accel = cond(facing = 1,0.4,-0.4),0.8
ownpal = 1
scale = fvar(21)*2.5,fvar(22)*2.5
sprpriority = 2
removetime = -2
removeongethit = 1
ignorehitpause = 1

[State 706, 7 (Recovery 1P Font)] ;Recovery字體 (1P側)
type = Explod
triggerall = AnimElemTime(1) = 0
triggerall = NumExplod(15060) = 0
trigger1 = TeamSide = 1
id = 15026
anim = 15060
space = screen
pos = cond(1.0*screenwidth/screenheight < 1.34,(32+(var(10))),(44+(var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,918,894)*screenheight/1080
ontop = 1
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.42,0.38)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.30,0.34)*screenheight/1080
bindtime = -1
removetime = -1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 706, 8 (Recovery 2P Font)] ;Recovery字體 (2P側)
type = Explod
triggerall = AnimElemTime(1) = 0
triggerall = NumExplod(15060) = 0
trigger1 = TeamSide = 2
id = 15026
anim = 15060
space = screen
pos = cond(1.0*screenwidth/screenheight < 1.34,(-366+(-var(10))),(-358+(-var(10))))*screenwidth/1920+screenwidth,cond(1.0*screenwidth/screenheight < 1.34,918,894)*screenheight/1080
ontop = 1
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.42,0.38)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.30,0.34)*screenheight/1080
bindtime = -1
removetime = -1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 706, 9 (Character Recovery Voice)] ;人物恢復(受身)時語音
type = PlaySnd
trigger1 = AnimElem = 1
value = s5200,0+(random%3)
channel = 0

[State 706, 10]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1

[State 706, 11]
type = VelSet
trigger1 = AnimElemTime(2) = 0
x = -32
y = -68

[State 706, 12]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
statetype = A       ;S,A,C,L
movetype = I        ;I,A,H
physics = N         ;A,C,S,N

[State 706, 13]
type = Gravity
trigger1 = AnimElemTime(2) >= 0
ignorehitpause = 1

[State 706, 14]
type = PlayerPush
trigger1 = AnimElemTime(2) > 0
value = 0

[State 706, 15]
type = VelSet
trigger1 = AnimElemTime(3) = 0
x = -32
y = 0

[State 706, 16 (Moving Dust 1)]
type = Explod
trigger1 = AnimElemTime(5) = 2
anim = 7040
id = 15025
;space = stage
pos = cond(facing = -1,340,-340)*fvar(21),0
facing = -facing
bindid = id
bindtime = 1
removetime = 16
scale = fvar(21)*1.00,fvar(22)*1.00
removeongethit = 1
ignorehitpause = 1
sprpriority = 0
shadow = 0,0,0
ownpal = 1

[State 706, 17 (Moving Dust 2)]
type = Explod
trigger1 = AnimElemTime(5) = 2
anim = 7040
id = 15025
;space = stage
pos = cond(facing = -1,-200,200)*fvar(21),0
facing = -facing
bindid = id
bindtime = 1
removetime = 16
scale = fvar(21)*1.00,fvar(22)*1.00
removeongethit = 1
ignorehitpause = 1
sprpriority = 0
shadow = 0,0,0
ownpal = 1

[State 706, 18 (Movement End)]
type = VelSet
trigger1 = AnimElemTime(4) >= 0
trigger1 = Pos Y >= 0 && Vel Y > 0
x = 0

[State 706, 19]
type = RemoveExplod
trigger1 = AnimElemTime(4) >= 0
trigger1 = Pos Y >= 0 && Vel Y > 0
trigger2 = StateNo != 706
id = 15026

[State 706, 20 (Moves End)]
type = ChangeState
trigger1 = AnimElemTime(4) >= 0
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 106
ctrl = 0

;---------------------------------------------------------------------------
; Guard Cancel Y / Kinkyuu Kaihi Front
; 防禦取消Y / 緊急回避前
;---------------------------------------------------------------------------
[Statedef 710]
type = U
movetype = I
physics = U
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = -2
facep2 = 1

[State 710, 1]
type = ChangeAnim
trigger1 = Time = 0
value = cond(statetype = C,151,150)

[State 710, 2]
type = SuperPause
trigger1 = Time = 0
anim = -1
time = 15
sound = s710,0
darken = 0
movetime = 15
p2defmul = 1

[State 710, 3 (Zero Counter FX Helper)]
type = Helper
trigger1 = Time = 0
stateno = 7110
id = 7110
name = "Guard Cancle Spark Effect"
postype = p1
pos = 0,0
supermovetime = 15
ownpal = 1

[State 710, 4]
type = PowerAdd
trigger1 = Time = 0
value = -500

[State 710, 5 (Guard Cancel 1P Font)] ;Guard Cancel字體 (1P側)
type = Explod
triggerall = AnimElemTime(1) = 0
triggerall = NumExplod(15030) = 0
trigger1 = TeamSide = 1
id = 15030
anim = 15030
space = screen
pos = cond(1.0*screenwidth/screenheight < 1.34,(28+(var(10))),(38+(var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,918,894)*screenheight/1080
ontop = 1
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.34,0.30)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.34,0.38)*screenheight/1080
bindtime = -1
removetime = -1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 710, 6 (Guard Cancel 2P Font)] ;Guard Cancel字體 (2P側)
type = Explod
triggerall = AnimElemTime(1) = 0
triggerall = NumExplod(15030) = 0
trigger1 = TeamSide = 2
id = 15030
anim = 15030
space = screen
pos = cond(1.0*screenwidth/screenheight < 1.34,(-374+(-var(10))),(-364+(-var(10))))*screenwidth/1920+screenwidth,cond(1.0*screenwidth/screenheight < 1.34,918,894)*screenheight/1080
ontop = 1
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.34,0.30)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.34,0.38)*screenheight/1080
bindtime = -1
removetime = -1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 710, 7]
type = ChangeAnim
triggerall = Anim = [120,159]
trigger1 = AnimElemTime(1) >= 15
value = 700
elem = 3

[State 710, 8 (Character Voice)]
type = PlaySnd
trigger1 = AnimElem = 3
value = s5,12
channel = 0

[State 710, 9] ;残像
type = AfterImage
trigger1 = AnimElem = 3
time = -1
trans = add
timegap = 1
framegap = 4
length = 10
palcontrast = 128,128,128

[State 710, 10]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1

[State 710, 11]
type = HitBy
trigger1 = 1
value =
time = 1

[State 710, 12] ;移動量
type = VelSet
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(7) < 0
x = 58

[State 710, 13]
type = LifeAdd
trigger1 = AnimElemTime(3) = 1
value = 70

[State 710, 14 (Recovery Life Flash)] ;回復生命閃光特效
type = Explod
trigger1 = AnimElemTime(3) >= 1 && AnimElemTime(6) < 0
trigger1 = NumExplod(7855) < 5
anim = 7855
id = 710
bindid = id
bindtime = -1
pos = (50+cond(random < 500,random%90,-random%90))*fvar(21),(-280+cond(random < 500,random%90,-random%90))*fvar(22)
scale = fvar(21)*0.50,fvar(22)*0.50
sprpriority = 3+cond(random < 500,(-1),(1))
facing = facing
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 1

[State 710, 15]
type = PlayerPush
trigger1 = AnimElemTime(3) > 0
value = 0

[State 710, 16]
type = RemoveExplod
trigger1 = AnimElem = 6
id = 710

[State 710, 17 (Moving Dust 1)]
type = Explod
trigger1 = AnimElemTime(8) = 0
anim = 7040
id = 7041
;space = stage
pos = Cond(facing = 1,86,-86)*fvar(21),0
facing = facing
bindid = id
bindtime = -1
removetime = 6
scale = fvar(21)*1.00,fvar(22)*1.00
removeongethit = 1
ignorehitpause = 1
sprpriority = 3
shadow = 0,0,0
ownpal = 1

[State 710, 18] ;移動終了
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 710, 19]
type = RemoveExplod
trigger1 = AnimTime = 0
id = 7041

[State 710, 20 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Guard Cancel YB / Kinkyuu Kaihi Back
; 防禦取消YB / 緊急回避後
;---------------------------------------------------------------------------
[Statedef 715]
type = U
movetype = I
physics = U
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = -2
facep2 = 1

[State 715, 1]
type = ChangeAnim
trigger1 = Time = 0
value = cond(statetype = C,151,150)

[State 715, 2]
type = SuperPause
trigger1 = Time = 0
anim = -1
time = 15
sound = s710,0
darken = 0
movetime = 15
p2defmul = 1

[State 715, 3 (Zero Counter FX Helper)]
type = Helper
trigger1 = Time = 0
stateno = 7110
id = 7110
name = "Guard Cancle Spark Effect"
postype = p1
pos = 0,0
supermovetime = 15
ownpal = 1

[State 715, 4]
type = PowerAdd
trigger1 = Time = 0
value = -500

[State 715, 5 (Guard Cancel 1P Font)] ;Guard Cancel字體 (1P側)
type = Explod
triggerall = AnimElemTime(1) = 0
triggerall = NumExplod(15030) = 0
trigger1 = TeamSide = 1
id = 15030
anim = 15030
space = screen
pos = cond(1.0*screenwidth/screenheight < 1.34,(28+(var(10))),(38+(var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,918,894)*screenheight/1080
ontop = 1
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.34,0.30)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.34,0.38)*screenheight/1080
bindtime = -1
removetime = -1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 715, 6 (Guard Cancel 2P Font)] ;Guard Cancel字體 (2P側)
type = Explod
triggerall = AnimElemTime(1) = 0
triggerall = NumExplod(15030) = 0
trigger1 = TeamSide = 2
id = 15030
anim = 15030
space = screen
pos = cond(1.0*screenwidth/screenheight < 1.34,(-374+(-var(10))),(-364+(-var(10))))*screenwidth/1920+screenwidth,cond(1.0*screenwidth/screenheight < 1.34,918,894)*screenheight/1080
ontop = 1
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.34,0.30)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.34,0.38)*screenheight/1080
bindtime = -1
removetime = -1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 715, 7]
type = ChangeAnim
triggerall = Anim = [120,159]
trigger1 = AnimElemTime(1) >= 15
value = 705
elem = 3

[State 715, 8 (Character Voice)]
type = PlaySnd
trigger1 = AnimElem = 3
value = s5,12
channel = 0

[State 715, 9] ;残像
type = AfterImage
trigger1 = AnimElem = 3
time = -1
trans = add
timegap = 1
framegap = 4
length = 10
palcontrast = 128,128,128

[State 715, 10]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1

[State 715, 11]
type = HitBy
trigger1 = 1
value =
time = 1

[State 715, 12] ;移動量
type = VelSet
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(7) < 0
x = -61

[State 715, 13]
type = LifeAdd
trigger1 = AnimElemTime(3) = 1
value = 70

[State 715, 14 (Recovery Life Flash)] ;回復生命閃光特效
type = Explod
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(7) < 0
trigger1 = NumExplod(7855) < 5
anim = 7855
id = 715
bindid = id
bindtime = -1
pos = (0+cond(random < 500,random%90,-random%90))*fvar(21),(-180+cond(random < 500,random%90,-random%90))*fvar(22)
scale = fvar(21)*0.50,fvar(22)*0.50
sprpriority = 3+cond(random < 500,(-1),(1))
facing = facing
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 1

[State 715, 15]
type = PlayerPush
trigger1 = AnimElemTime(3) > 0
value = 0

[State 715, 16]
type = RemoveExplod
trigger1 = AnimElem = 6
id = 715

[State 715, 17] ;移動終了
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 715, 18 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Guard Cancel C / Fire Gale Spear
; 防禦取消C / 火風槍
;---------------------------------------------------------------------------
[Statedef 720]
type = U
movetype = I
physics = U
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = -2
facep2 = 1

[State 720, 1]
type = ChangeAnim
trigger1 = Time = 0
value = cond(statetype = C,151,150)

[State 720, 2]
type = SuperPause
trigger1 = Time = 0
anim = -1
time = 15
sound = s710,0
darken = 0
movetime = 15
p2defmul = 1

[State 720, 3 (Zero Counter FX Helper)]
type = Helper
trigger1 = Time = 0
stateno = 7110
id = 7110
name = "Guard Cancle Spark Effect"
postype = p1
pos = 0,0
supermovetime = 15
ownpal = 1

[State 720, 4]
type = PowerAdd
trigger1 = Time = 0
value = -1000

[State 720, 5 (Guard Cancel 1P Font)] ;Guard Cancel字體 (1P側)
type = Explod
triggerall = AnimElemTime(1) = 0
triggerall = NumExplod(15030) = 0
trigger1 = TeamSide = 1
id = 15030
anim = 15030
space = screen
pos = cond(1.0*screenwidth/screenheight < 1.34,(28+(var(10))),(38+(var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,918,894)*screenheight/1080
ontop = 1
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.34,0.30)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.34,0.38)*screenheight/1080
bindtime = -1
removetime = -1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 720, 6 (Guard Cancel 2P Font)] ;Guard Cancel字體 (2P側)
type = Explod
triggerall = AnimElemTime(1) = 0
triggerall = NumExplod(15030) = 0
trigger1 = TeamSide = 2
id = 15030
anim = 15030
space = screen
pos = cond(1.0*screenwidth/screenheight < 1.34,(-374+(-var(10))),(-364+(-var(10))))*screenwidth/1920+screenwidth,cond(1.0*screenwidth/screenheight < 1.34,918,894)*screenheight/1080
ontop = 1
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.34,0.30)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.34,0.38)*screenheight/1080
bindtime = -1
removetime = -1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 720, 7]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1

[State 720, 8]
type = HitBy
trigger1 = 1
value =
time = 1

[State 720, 9 (To Next State 1402)]
type = ChangeState
trigger1 = AnimElemTime(1) > 30
value = 1409

;---------------------------------------------------------------------------
; Guard Cancel CB / Fire Gale Spear
; 防禦取消CB / 火風槍
;---------------------------------------------------------------------------
[Statedef 725]
type = U
movetype = I
physics = U
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = -2
facep2 = 1

[State 725, 1]
type = ChangeAnim
trigger1 = Time = 0
value = cond(statetype = C,151,150)

[State 725, 2]
type = SuperPause
trigger1 = Time = 0
anim = -1
time = 15
sound = s710,0
darken = 0
movetime = 15
p2defmul = 1

[State 725, 3 (Zero Counter FX Helper)]
type = Helper
trigger1 = Time = 0
stateno = 7110
id = 7110
name = "Guard Cancle Spark Effect"
postype = p1
pos = 0,0
supermovetime = 15
ownpal = 1

[State 725, 4]
type = PowerAdd
trigger1 = Time = 0
value = -1000

[State 725, 5 (Guard Cancel 1P Font)] ;Guard Cancel字體 (1P側)
type = Explod
triggerall = AnimElemTime(1) = 0
triggerall = NumExplod(15030) = 0
trigger1 = TeamSide = 1
id = 15030
anim = 15030
space = screen
pos = cond(1.0*screenwidth/screenheight < 1.34,(28+(var(10))),(38+(var(10))))*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,918,894)*screenheight/1080
ontop = 1
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.34,0.30)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.34,0.38)*screenheight/1080
bindtime = -1
removetime = -1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 725, 6 (Guard Cancel 2P Font)] ;Guard Cancel字體 (2P側)
type = Explod
triggerall = AnimElemTime(1) = 0
triggerall = NumExplod(15030) = 0
trigger1 = TeamSide = 2
id = 15030
anim = 15030
space = screen
pos = cond(1.0*screenwidth/screenheight < 1.34,(-374+(-var(10))),(-364+(-var(10))))*screenwidth/1920+screenwidth,cond(1.0*screenwidth/screenheight < 1.34,918,894)*screenheight/1080
ontop = 1
ownpal = 1
facing = 1
scale = cond(1.0*screenwidth/screenheight < 1.34,0.34,0.30)*screenwidth/1920,cond(1.0*screenwidth/screenheight < 1.34,0.34,0.38)*screenheight/1080
bindtime = -1
removetime = -1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 725, 7]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1

[State 725, 8]
type = HitBy
trigger1 = 1
value =
time = 1

[State 725, 9 (To Next State 726)]
type = ChangeState
trigger1 = AnimElemTime(1) > 30
value = 726

;---------------------------------------------------------------------------
; Guard Cancel CB / Fire Gale Spear (Kaihi)
; 防禦取消CB / 火風槍 (回避)
;---------------------------------------------------------------------------
[Statedef 726]
type = S
movetype = I
physics = S
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = -2

[State 726, 1]
type = ChangeAnim
trigger1 = Time = 0 
value = 700
elem = 3 ;從第三個動畫元素開始

[State 726, 2]
type = HitBy
trigger1 = 1
value =
time = 1

[State 726, 3]
type = VelSet
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(7) < 0
x = 100

[State 726, 4]
type = PlayerPush
trigger1 = AnimElemTime(3) >= 0
value = 0

[State 726, 5 (To Next State 1409)]
type = ChangeState
trigger1 = AnimElemTime(4) >= 4
value = 1409
ctrl = 0

;---------------------------------------------------------------------------
; Somersault Kick / Trigger
; 筋斗踢 / 接觸
;---------------------------------------------------------------------------
[Statedef 800]
type = S
movetype = A
physics = S
anim = 800
velset = 0,0
ctrl = 0
poweradd = 0
juggle = 0
sprpriority = 2

[State 800, 1]
type = HitDef
getpower = 30,15
;trigger1 = AnimElem = 1 ;測試過仍然可以抓到對手(效果相同)，下方為比較詳細的寫法
trigger1 = AnimElemTime(1) >= 0
trigger1 = AnimElemTime(2) < 0
trigger1 = 1 || var(21):= -1 ;Hit Spark X
trigger1 = 1 || var(22):= -1 ;Hit Spark Y
trigger1 = 1 || var(23):= -1 ;Hit Spark ID ;這裡設定-1 避免爆炸火花效果在下一次Statedef出現
trigger1 = 1 || var(24):= -1 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 800 ;HitDef ID
trigger1 = (P2StateNo != [120,159]) ;當對手不是防禦狀態時
attr = S, NT
hitflag = M
;guardflag = ;缺省默認是一個empty(空的)字符串，意味著P2無法防禦這次攻擊
priority = 1, Miss
sparkno = -1
p1sprpriority = 1
p2sprpriority = 0
p1facing = 1
p2facing = 1 
p1stateno = 810
p2stateno = 820
guard.dist = 0
fall = 1
fall.recover = 1 ;設置為0如果你不想讓對手在"fall"狀態中能夠恢復 默認值為1(可以恢復)
id = 800

[State 800, 2]
type = HitDef
getpower = 30,15
trigger1 = AnimElemTime(1) >= 0
trigger1 = AnimElemTime(2) < 0
trigger1 = 1 || var(21):= -1 ;Hit Spark X
trigger1 = 1 || var(22):= -1 ;Hit Spark Y
trigger1 = 1 || var(23):= -1 ;Hit Spark ID ;這裡設定-1 避免爆炸火花效果在下一次Statedef出現
trigger1 = 1 || var(24):= -1 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 800 ;HitDef ID
trigger1 = (P2StateNo = [120,159]) ;當對手防禦狀態時
attr = S, NT
hitflag = M-
priority = 1, Miss
sparkno = -1
p1sprpriority = 1
p2sprpriority = 0
p1facing = 1
p2facing = 1 
p1stateno = 810 
p2stateno = 820
guard.dist = 0
fall = 1
fall.recover = 1
id = 800

[State 800, 3]
type = HitBy
trigger1 = AnimElem = 2
value = SCA, SA, HA, SP, HP, ST, HT
time = 9
ignorehitpause = 1

[State 800, 4 (Character Voice)]
type = PlaySnd
triggerall = Random < 600
trigger1 = AnimElem = 3
value = s5,21
channel = 0

[State 800, 5]
type = CtrlSet
trigger1 = Time >= 10
value = 1

[State 800, 6 (Moves End / Trigger Fail)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Somersault Kick / Start
; 筋斗踢 / 開始
;---------------------------------------------------------------------------
[Statedef 810]
type = S
movetype = A
physics = N
anim = 810
ctrl = 0
poweradd = 0
sprpriority = 2

;[State 810, 1];因為在Statedef 800時設定var(23):= -1 這裡就不用再設置
;type = RemoveExplod
;trigger1 = 1
;id = var(23)

[State 810, 2 (Touch Sound)]
type = PlaySnd
trigger1 = Time = 0
value = s6,4
channel = 10

[State 810, 3]
type = PosSet
trigger1 = Time = 0
y = 0

[State 810, 4]
type = Width
trigger1 = 1
edge = 352*(floor(const(size.xscale))),178*(floor(const(size.xscale)))

[State 810, 5]
type = Explod
trigger1 = !Target(800),IsHelper 
trigger1 = AnimElem = 1
anim = 7280
id = 7280
bindid = id
pos = cond(facing = 1,230,-230)*fvar(21),-485*fvar(22)
scale = fvar(21)*1.8,fvar(22)*1.8
facing = facing
sprpriority = 5
ownpal = 1
remappal = 7282,cond(prevstateno = 1000,2,0)
removeongethit = 1
ignorehitpause = 1

[State 810, 6]
type = Explod
trigger1 = !Target(800),IsHelper
trigger1 = AnimElem = 1
anim = 7281
id = 7281
bindid = id
pos = cond(facing = 1,230,-230)*fvar(21),-485*fvar(22)
scale = fvar(21)*1.8,fvar(22)*1.8
facing = facing
sprpriority = 5
ownpal = 1
remappal = 7282,cond(prevstateno = 1000,2,0)
removeongethit = 1
ignorehitpause = 1

[State 810, 7]
type = Explod
trigger1 = !Target(800),IsHelper 
trigger1 = AnimElem = 1
anim = 7282
id = 7282
bindid = id
pos = cond(facing = 1,230,-230)*fvar(21),-485*fvar(22)
scale = fvar(21)*1.8,fvar(22)*1.8
facing = facing
sprpriority = 5
ownpal = 1
remappal = 7282,cond(prevstateno = 1000,2,0)
removeongethit = 1
ignorehitpause = 1

[State 810, 8]
type = Explod
trigger1 = !Target(800),IsHelper
trigger1 = AnimElem = 1
anim = 7283
id = 7283
bindid = id
pos = cond(facing = 1,230,-230)*fvar(21),-485*fvar(22)
scale = fvar(21)*1.8,fvar(22)*1.8
facing = facing
sprpriority = -2
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 810, 9]
type = TargetBind
trigger1 = AnimElemtime(1) >= 0 && AnimElemTime(6) < 0
pos = 230*fvar(21),0

[State 810, 10 (If Target Separation)] ;如果目標脫離 招式將強制中斷
type = ChangeState
triggerall = NumTarget(800) = 0
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(6) < 0
value = 0
ctrl = 1

[State 810, 11 (Throw Kick Slash)]
type = Explod
triggerall = NumExplod(7460) = 0
trigger1 = AnimElemTime(4) = 0
anim = 7460
id = 7460
;space = stage
pos = cond(facing = 1,-160,160)*fvar(21),140*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
angle = -10.0
removetime = 21
removeongethit = 1
ignorehitpause = 0

[State 810, 12 (Throw Kick Slash Subtraction)]
type = Explod
triggerall = NumExplod(7461) = 0
trigger1 = AnimElemTime(4) = 0
anim = 7461
id = 7461
;space = stage
pos = cond(facing = 1,-160,160)*fvar(21),140*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7460,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
angle = -10.0
removetime = 21
removeongethit = 1
ignorehitpause = 0

[State 810, 13 (Character Voice)]
type = PlaySnd
trigger1 = AnimElem = 6
value = s5,16
channel = 0

[State 810, 14]
type = Explod
triggerall = NumTarget(800) ;*
trigger1 = !Target(800),IsHelper
trigger1 = Target(800),StateNo = 820
trigger1 = AnimElemTime(6) = 0
anim = 7210
id = 7210
;space = stage
bindid = target,id
bindtime = 1
pos = cond(facing = 1,100,-100)*fvar(21),-400*fvar(22)
facing = -target,facing
scale = fvar(21)*1.30,fvar(22)*1.30
sprpriority = 5
ownpal = 1
removeongethit = 1
ignorehitpause = 1

;*括號內數字對應HitDef、Projectile、ReversalDef的ID編號。
; 是否有對應成功可以利用DisplayToClipBoard狀態控制器測試出來。

[State 810, 15]
type = Explod
triggerall = NumTarget(800)
trigger1 = !Target(800),IsHelper
trigger1 = Target(800),StateNo = 820
trigger1 = AnimElemTime(6) = 0
anim = 7211
id = 7211
;space = stage
bindid = target,id
bindtime = 1
pos = cond(facing = 1,100,-100)*fvar(21),-400*fvar(22)
facing = -target,facing
scale = fvar(21)*1.30,fvar(22)*1.30
sprpriority = 5
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 810, 16]
type = Explod
triggerall = NumTarget(800)
trigger1 = !Target(800),IsHelper
trigger1 = Target(800),StateNo = 820
trigger1 = AnimElemTime(6) = 0
id = 7214
anim = 7214
;space = stage
bindid = target,id
bindtime = 1
pos = cond(facing = 1,100,-100)*fvar(21),-400*fvar(22)
facing = -target,facing
scale = fvar(21)*1.10,fvar(22)*1.10
sprpriority = 5
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 810, 17 (Hit Spark)]
type = Explod
triggerall = NumTarget(800)
trigger1 = !Target(800),IsHelper
trigger1 = Target(800),StateNo = 820
trigger1 = AnimElemTime(6) = 0
anim = 7212
id = 7212
;space = stage
bindid = target,id
bindtime = 1
pos = cond(facing = 1,100,-100)*fvar(21),-400*fvar(22)
facing = -target,facing
scale = fvar(21)*1.30,fvar(22)*1.30
sprpriority = 5
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 810, 18 (MoveHit Sound)]
type = PlaySnd
trigger1 = AnimElem = 6
value = s6,5
channel = 10

[State 810, 19]
type = TargetLifeAdd
triggerall = NumTarget
triggerall = var(15) > 0
trigger1 = AnimElemTime(6) = 0
value = -cond(target,life > ceil(82*fvar(20)),(ceil((0.082*(target,lifemax))*fvar(20))),ceil(82*fvar(20))) ;可隨著我方攻擊力、對手最大生命值改變
;value = -cond(target,life > 82,(0.082*(target,lifemax)),82)  ;可隨著對手最大生命值改變
absolute = 1                                                   ;將不受縮放影響(防禦係數將被忽略)
ignorehitpause = 1
kill = 1

[State 810, 20]
type = TargetLifeAdd
triggerall = NumTarget
triggerall = var(15) <= 0
trigger1 = AnimElemTime(6) = 0
value = -ceil(82*fvar(20))
;value = -82
absolute = 0
ignorehitpause = 1
kill = 1

[State 810, 21 (If Target Helper)]
type = ChangeState
triggerall = NumTarget
trigger1 = Target,IsHelper
trigger1 = Time > 10
value = 0
ctrl = 1

[State 810, 22 (Moves End)]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Somersault Kick / Opponent Start
; 筋斗踢 / 對手開始
;---------------------------------------------------------------------------
[Statedef 820]
type = A
movetype = H
physics = N
sprpriority = 3

[State 820, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 820

[State 820, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 820, 3] ;如果當身到對手的Helper 此ChangeState消除對手Helper用
type = ChangeState
trigger1 = IsHelper
value = 990

[State 820, 4]
type = VelSet
trigger1 = AnimElem = 3
x = -15
y = -66

[State 820, 5]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 3.0

[State 820, 6]
type = EnvShake
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
time = 10

[State 820, 7 (Target Reverts To Its Own State)]
type = SelfState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100

;---------------------------------------------------------------------------
; Air Somersault Kick / Trigger
; 空中筋斗踢 / 接觸
;---------------------------------------------------------------------------
[Statedef 850]
type = A
movetype = A
physics = A
anim = 850
ctrl = 0
poweradd = 0
juggle = 0
sprpriority = 2

[State 850, 1]
type = HitDef
getpower = 30,15
trigger1 = AnimElemTime(1) >= 0
trigger1 = AnimElemTime(2) < 0
trigger1 = 1 || var(21):= -1 ;Hit Spark X
trigger1 = 1 || var(22):= -1 ;Hit Spark Y
trigger1 = 1 || var(23):= -1 ;Hit Spark ID
trigger1 = 1 || var(24):= -1 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 850 ;HitDef ID
trigger1 = (P2StateNo != [120,159]) ;當對手不是防禦狀態時
attr = A, NT
hitflag = A
priority = 2, Miss
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 860
p2stateno = 870
guard.dist = 0
fall = 1
fall.recover = 1
id = 850

[State 850, 2]
type = HitDef
getpower = 30,15
trigger1 = AnimElemTime(1) >= 0
trigger1 = AnimElemTime(2) < 0
trigger1 = 1 || var(21):= -1 ;Hit Spark X
trigger1 = 1 || var(22):= -1 ;Hit Spark Y
trigger1 = 1 || var(23):= -1 ;Hit Spark ID
trigger1 = 1 || var(24):= -1 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 850 ;HitDef ID
trigger1 = (P2StateNo = [120,159]) ;當對手是防禦狀態時
attr = A, NT
hitflag = A-
priority = 2, Miss
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 860
p2stateno = 870
guard.dist = 0
fall = 1
fall.recover = 1
id = 850

[State 850, 3]
type = HitBy
trigger1 = AnimElem = 2
value = SCA, SA, HA, SP, HP, ST, HT
time = 9
ignorehitpause = 1

[State 850, 4 (Character Voice)]
type = PlaySnd
triggerall = Random < 600
trigger1 = AnimElem = 3
value = s5,21
channel = 0

[State 850, 5]
type = CtrlSet
trigger1 = Time >= 10
value = 1

;---------------------------------------------------------------------------
; Air Somersault Kick / Start
; 空中筋斗踢 / 開始
;---------------------------------------------------------------------------
[Statedef 860]
type = A
movetype = A
physics = N
anim = 860
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = 2

;[State 860, 1]
;type = RemoveExplod
;trigger1 = 1
;id = var(23)

[State 860, 2 (Touch Sound)]
type = PlaySnd
trigger1 = Time = 0
value = s6,4
channel = 10

[State 860, 3]
type = Width
trigger1 = 1
edge = 352*(floor(const(size.xscale))),178*(floor(const(size.xscale)))

[State 860, 4]
type = Explod
trigger1 = !Target(850),IsHelper 
trigger1 = AnimElem = 1
anim = 7280
id = 7280
bindid = id
pos = cond(facing = 1,230,-230)*fvar(21),-485*fvar(22)
scale = fvar(21)*1.8,fvar(22)*1.8
facing = facing
sprpriority = 5
ownpal = 1
remappal = 7282,cond(prevstateno = 1000,2,0)
removeongethit = 1
ignorehitpause = 1

[State 860, 5]
type = Explod
trigger1 = !Target(850),IsHelper
trigger1 = AnimElem = 1
anim = 7281
id = 7281
bindid = id
pos = cond(facing = 1,230,-230)*fvar(21),-485*fvar(22)
scale = fvar(21)*1.8,fvar(22)*1.8
facing = facing
sprpriority = 5
ownpal = 1
remappal = 7282,cond(prevstateno = 1000,2,0)
removeongethit = 1
ignorehitpause = 1

[State 860, 6]
type = Explod
trigger1 = !Target(850),IsHelper 
trigger1 = AnimElem = 1
anim = 7282
id = 7282
bindid = id
pos = cond(facing = 1,230,-230)*fvar(21),-485*fvar(22)
scale = fvar(21)*1.8,fvar(22)*1.8
facing = facing
sprpriority = 5
ownpal = 1
remappal = 7282,cond(prevstateno = 1000,2,0)
removeongethit = 1
ignorehitpause = 1

[State 860, 7]
type = Explod
trigger1 = !Target(850),IsHelper
trigger1 = AnimElem = 1
anim = 7283
id = 7283
bindid = id
pos = cond(facing = 1,230,-230)*fvar(21),-485*fvar(22)
scale = fvar(21)*1.8,fvar(22)*1.8
facing = facing
sprpriority = -2
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 860, 8]
type = TargetBind
trigger1 = AnimElemtime(1) >= 0 && AnimElemTime(6) < 0
pos = 230*fvar(21),0

[State 860, 9 (If Target Separation)] ;如果目標脫離 招式將強制中斷
type = ChangeState
triggerall = NumTarget(850) = 0
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(6) < 0
value = 50
ctrl = 1

[State 860, 10 (Throw Kick Slash)]
type = Explod
triggerall = NumExplod(7460) = 0
trigger1 = AnimElemTime(4) = 0
anim = 7460
id = 7460
;space = stage
pos = cond(facing = 1,-160,160)*fvar(21),140*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
angle = -10.0
removetime = 21
removeongethit = 1
ignorehitpause = 0

[State 860, 11 (Throw Kick Slash Subtraction)]
type = Explod
triggerall = NumExplod(7461) = 0
trigger1 = AnimElemTime(4) = 0
anim = 7461
id = 7461
;space = stage
pos = cond(facing = 1,-160,160)*fvar(21),140*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7460,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
angle = -10.0
removetime = 21
removeongethit = 1
ignorehitpause = 0

[State 860, 12 (Character Voice)]
type = PlaySnd
trigger1 = AnimElem = 6
value = s5,16
channel = 0

[State 860, 13]
type = Explod
triggerall = NumTarget(850)
trigger1 = !Target(850),IsHelper
trigger1 = Target(850),StateNo = 870
trigger1 = AnimElemTime(6) = 0
anim = 7210
id = 7210
;space = stage
bindid = target,id
bindtime = 1
pos = cond(facing = 1,100,-100)*fvar(21),-400*fvar(22)
facing = -target,facing
scale = fvar(21)*1.30,fvar(22)*1.30
sprpriority = 5
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 860, 14]
type = Explod
triggerall = NumTarget(850)
trigger1 = !Target(850),IsHelper
trigger1 = Target(850),StateNo = 870
trigger1 = AnimElemTime(6) = 0
anim = 7211
id = 7211
;space = stage
bindid = target,id
bindtime = 1
pos = cond(facing = 1,100,-100)*fvar(21),-400*fvar(22)
facing = -target,facing
scale = fvar(21)*1.30,fvar(22)*1.30
sprpriority = 5
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 860, 15]
type = Explod
triggerall = NumTarget(850)
trigger1 = !Target(850),IsHelper
trigger1 = Target(850),StateNo = 870
trigger1 = AnimElemTime(6) = 0
id = 7214
anim = 7214
;space = stage
bindid = target,id
bindtime = 1
pos = cond(facing = 1,100,-100)*fvar(21),-400*fvar(22)
facing = -target,facing
scale = fvar(21)*1.10,fvar(22)*1.10
sprpriority = 5
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 860, 16 (Hit Spark)]
type = Explod
triggerall = NumTarget(850)
trigger1 = !Target(850),IsHelper
trigger1 = Target(850),StateNo = 870
trigger1 = AnimElemTime(6) = 0
anim = 7212
id = 7212
;space = stage
bindid = target,id
bindtime = 1
pos = cond(facing = 1,100,-100)*fvar(21),-400*fvar(22)
facing = -target,facing
scale = fvar(21)*1.30,fvar(22)*1.30
sprpriority = 5
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 860, 17 (MoveHit Sound)]
type = PlaySnd
trigger1 = AnimElem = 6
value = s6,5
channel = 10

[State 860, 18]
type = TargetLifeAdd
triggerall = NumTarget
triggerall = var(15) > 0
trigger1 = AnimElemTime(6) = 0
value = -cond(target,life > ceil(82*fvar(20)),(ceil((0.082*(target,lifemax))*fvar(20))),ceil(82*fvar(20))) ;可隨著我方攻擊力、對手最大生命值改變
;value = -cond(target,life > 82,(0.082*(target,lifemax)),82)  ;可隨著對手最大生命值改變
absolute = 1                                                   ;將不受縮放影響(防禦係數將被忽略)
ignorehitpause = 1
kill = 1

[State 860, 19]
type = TargetLifeAdd
triggerall = NumTarget
triggerall = var(15) <= 0
trigger1 = AnimElemTime(6) = 0
value = -ceil(82*fvar(20))
;value = -82
absolute = 0
ignorehitpause = 1
kill = 1

[State 860, 20 (If Target Helper)]
type = ChangeState
triggerall = NumTarget
trigger1 = Target,IsHelper
trigger1 = Time > 10
value = 50
ctrl = 1

[State 860, 21 (To Next State 50)]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
; Air Somersault Kick / Opponent Start
; 空中筋斗踢 / 對手開始
;---------------------------------------------------------------------------
[Statedef 870]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 3

[State 870, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 820

[State 870, 2] ;如果當身到對手的Helper 此ChangeState消除對手Helper用
type = ChangeState
trigger1 = IsHelper
value = 990

[State 870, 3]
type = VelSet
trigger1 = AnimElem = 3
x = -15
y = -66

[State 870, 4]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 3.0

[State 870, 5]
type = EnvShake
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
time = 10

[State 870, 6 (Target Reverts To Its Own State)]
type = SelfState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100

;---------------------------------------------------------------------------
; Back Air Somersault Kick / Trigger
; 後空中筋斗踢 / 接觸
;---------------------------------------------------------------------------
[Statedef 875]
type = A
movetype = A
physics = A
anim = 850
ctrl = 0
poweradd = 0
juggle = 0
sprpriority = 2

[State 875, 1]
type = HitDef
getpower = 30,15
trigger1 = AnimElem = 1
trigger1 = 1 || var(21):= -1 ;Hit Spark X
trigger1 = 1 || var(22):= -1 ;Hit Spark Y
trigger1 = 1 || var(23):= -1 ;Hit Spark ID
trigger1 = 1 || var(24):= -1 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 875 ;HitDef ID
trigger1 = (P2StateNo != [120,159]) ;當對手不是防禦狀態時
attr = A, NT
hitflag = A
priority = 2, Miss
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 885
p2stateno = 895
guard.dist = 0
fall = 1
fall.recover = 1
id = 875

[State 875, 2]
type = HitDef
getpower = 30,15
trigger1 = AnimElemTime(1) >= 0
trigger1 = AnimElemTime(2) < 0
trigger1 = 1 || var(21):= -1 ;Hit Spark X
trigger1 = 1 || var(22):= -1 ;Hit Spark Y
trigger1 = 1 || var(23):= -1 ;Hit Spark ID
trigger1 = 1 || var(24):= -1 ;Guard Spark ID
trigger1 = 1 || var(25):= 0 ;Hit Spark Angle
trigger1 = 1 || var(36):= 875 ;HitDef ID
trigger1 = (P2StateNo = [120,159]) ;當對手是防禦狀態時
attr = A, NT
hitflag = A-
priority = 2, Miss
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 885
p2stateno = 895
guard.dist = 0
fall = 1
fall.recover = 1
id = 875

[State 875, 3 (Character Voice)]
type = PlaySnd
triggerall = Random < 600
trigger1 = AnimElem = 2
value = s5,21
channel = 0

[State 875, 4]
type = HitBy
trigger1 = AnimElem = 2
value = SCA, SA, HA, SP, HP, ST, HT
time = 9
ignorehitpause = 1

[State 875, 5]
type = CtrlSet
trigger1 = Time >= 12
value = 1

;---------------------------------------------------------------------------
; Back Air Somersault Kick / Start
; 後空中筋斗踢 / 開始
;---------------------------------------------------------------------------
[Statedef 885]
type = A
movetype = A
physics = N
anim = 860
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = 2

;[State 885, 1]
;type = RemoveExplod
;trigger1 = 1
;id = var(23)

[State 885, 2 (Touch Sound)]
type = PlaySnd
trigger1 = Time = 0
value = s6,4
channel = 10

[State 885, 3]
type = Width
trigger1 = 1
edge = 352*(floor(const(size.xscale))),178*(floor(const(size.xscale)))

[State 885, 4]
type = Explod
trigger1 = !Target(875),IsHelper 
trigger1 = AnimElem = 1
anim = 7280
id = 7280
bindid = id
pos = cond(facing = 1,230,-230)*fvar(21),-485*fvar(22)
scale = fvar(21)*1.8,fvar(22)*1.8
facing = facing
sprpriority = 5
ownpal = 1
remappal = 7282,cond(prevstateno = 1000,2,0)
removeongethit = 1
ignorehitpause = 1

[State 885, 5]
type = Explod
trigger1 = !Target(875),IsHelper
trigger1 = AnimElem = 1
anim = 7281
id = 7281
bindid = id
pos = cond(facing = 1,230,-230)*fvar(21),-485*fvar(22)
scale = fvar(21)*1.8,fvar(22)*1.8
facing = facing
sprpriority = 5
ownpal = 1
remappal = 7282,cond(prevstateno = 1000,2,0)
removeongethit = 1
ignorehitpause = 1

[State 885, 6]
type = Explod
trigger1 = !Target(875),IsHelper 
trigger1 = AnimElem = 1
anim = 7282
id = 7282
bindid = id
pos = cond(facing = 1,230,-230)*fvar(21),-485*fvar(22)
scale = fvar(21)*1.8,fvar(22)*1.8
facing = facing
sprpriority = 5
ownpal = 1
remappal = 7282,cond(prevstateno = 1000,2,0)
removeongethit = 1
ignorehitpause = 1

[State 885, 7]
type = Explod
trigger1 = !Target(875),IsHelper
trigger1 = AnimElem = 1
anim = 7283
id = 7283
bindid = id
pos = cond(facing = 1,230,-230)*fvar(21),-485*fvar(22)
scale = fvar(21)*1.8,fvar(22)*1.8
facing = facing
sprpriority = -2
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 885, 8]
type = TargetBind
trigger1 = AnimElemtime(1) >= 0 && AnimElemTime(6) < 0
pos = 230*fvar(21),0

[State 885, 9 (If Target Separation)] ;如果目標脫離 招式將強制中斷
type = ChangeState
triggerall = NumTarget(875) = 0
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(6) < 0
value = 50
ctrl = 1

[State 885, 10]
type = Turn
trigger1 = AnimElemTime(3) = 0

[State 885, 11 (Throw Kick Slash)]
type = Explod
triggerall = NumExplod(7460) = 0
trigger1 = AnimElemTime(4) = 0
anim = 7460
id = 74760
;space = stage
pos = cond(facing = 1,-160,160)*fvar(21),140*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
angle = -10.0
removetime = 17
removeongethit = 1
ignorehitpause = 0

[State 885, 12 (Throw Kick Slash Subtraction)]
type = Explod
triggerall = NumExplod(7461) = 0
trigger1 = AnimElemTime(4) = 0
anim = 7461
id = 7461
;space = stage
pos = cond(facing = 1,-160,160)*fvar(21),140*fvar(22)
facing = facing
bindid = id
bindtime = -1
ownpal = 1
remappal = 7460,1
scale = fvar(21)*2.00,fvar(22)*2.00
sprpriority = 4
angle = -10.0
removetime = 17
removeongethit = 1
ignorehitpause = 0

[State 885, 13 (Character Voice)]
type = PlaySnd
trigger1 = AnimElem = 6
value = s5,16
channel = 0

[State 885, 14]
type = Explod
triggerall = NumTarget(875)
trigger1 = !Target(875),IsHelper
trigger1 = Target(875),StateNo = 895
trigger1 = AnimElemTime(6) = 0
anim = 7210
id = 7210
;space = stage
bindid = target,id
bindtime = 1
pos = cond(facing = 1,100,-100)*fvar(21),-400*fvar(22)
facing = -target,facing
scale = fvar(21)*1.30,fvar(22)*1.30
sprpriority = 5
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 885, 15]
type = Explod
triggerall = NumTarget(875)
trigger1 = !Target(875),IsHelper
trigger1 = Target(875),StateNo = 895
trigger1 = AnimElemTime(6) = 0
anim = 7211
id = 7211
;space = stage
bindid = target,id
bindtime = 1
pos = cond(facing = 1,100,-100)*fvar(21),-400*fvar(22)
facing = -target,facing
scale = fvar(21)*1.30,fvar(22)*1.30
sprpriority = 5
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 885, 16]
type = Explod
triggerall = NumTarget(875)
trigger1 = !Target(875),IsHelper
trigger1 = Target(875),StateNo = 895
trigger1 = AnimElemTime(6) = 0
anim = 7214
id = 7214
;space = stage
bindid = target,id
bindtime = 1
pos = cond(facing = 1,100,-100)*fvar(21),-400*fvar(22)
facing = -target,facing
scale = fvar(21)*1.10,fvar(22)*1.10
sprpriority = 5
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 885, 17 (Hit Spark)]
type = Explod
triggerall = NumTarget(875)
trigger1 = !Target(875),IsHelper
trigger1 = Target(875),StateNo = 895
trigger1 = AnimElemTime(6) = 0
anim = 7212
id = 7212
;space = stage
bindid = target,id
bindtime = 1
pos = cond(facing = 1,100,-100)*fvar(21),-400*fvar(22)
facing = -target,facing
scale = fvar(21)*1.30,fvar(22)*1.30
sprpriority = 5
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 885, 18 (MoveHit Sound)]
type = PlaySnd
trigger1 = AnimElem = 6
value = s6,5
channel = 10

[State 885, 19]
type = TargetLifeAdd
triggerall = NumTarget
triggerall = var(15) > 0
trigger1 = AnimElemTime(6) = 0
value = -cond(target,life > ceil(82*fvar(20)),(ceil((0.082*(target,lifemax))*fvar(20))),ceil(82*fvar(20))) ;可隨著我方攻擊力、對手最大生命值改變
;value = -cond(target,life > 82,(0.082*(target,lifemax)),82)  ;可隨著對手最大生命值改變
absolute = 1                                                   ;將不受縮放影響(防禦係數將被忽略)
ignorehitpause = 1
kill = 1

[State 885, 20]
type = TargetLifeAdd
triggerall = NumTarget
triggerall = var(15) <= 0
trigger1 = AnimElemTime(6) = 0
value = -ceil(82*fvar(20))
;value = -82
absolute = 0
ignorehitpause = 1
kill = 1

[State 885, 21 (If Target Helper)]
type = ChangeState
triggerall = NumTarget
trigger1 = Target,IsHelper
trigger1 = Time > 10
value = 50
ctrl = 1

[State 885, 22 (To Next State 50)]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
; Back Air Somersault Kick / Opponent Start
; 後空中筋斗踢 / 對手開始
;---------------------------------------------------------------------------
[Statedef 895]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = 3

[State 895, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 820

[State 895, 2] ;如果當身到對手的Helper 此ChangeState消除對手Helper用
type = ChangeState
trigger1 = IsHelper
value = 990

[State 895, 3]
type = Turn
trigger1 = AnimElemTime(1) = 12

[State 895, 4]
type = VelSet
trigger1 = AnimElem = 3
x = -15
y = -66

[State 895, 5]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 3.0

[State 895, 6]
type = EnvShake
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
time = 10

[State 895, 7 (Target Reverts To Its Own State)]
type = SelfState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100

;---------------------------------------------------------------------------
; Somersault Kick / Opponent Helper Erasing
; 筋斗踢 / 對手援助清除
;---------------------------------------------------------------------------
[Statedef 990]
type = U
movetype = H
physics = N
ctrl = 0
velset = 0,0

[State 990, 1]
type = PosSet
trigger1 = Time = 0
y = 0

[State 990, 2]
type = ChangeAnim
trigger1 = 1
value = Anim ;沿續者上一個狀態的Anim動作
elem = AnimElemNo(0)
ignorehitpause = 1

[State 990, 3 (Fade Out Effect)]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256-(Time*16),0+Time*16
ignorehitpause = 1

[State 990, 4]
type = PlayerPush
trigger1 = 1
value = 0

[State 990, 5]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn
ignorehitpause = 1

[State 990, 6]
type = NotHitBy
trigger1 = 1
value = SCA, NA, SA, HA, NP, SP, HP, NT, ST, HT, AA, AP, AT
time = 1

[State 990, 7]
type = HitBy
trigger1 = 1
value =
time = 1

[State 990, 8 (Target Helper Remove)] ;增加此項 讓Helper被當身後消滅
type = DestroySelf ;不會隨著本體轉換成statedef 5100
triggerall = IsHelper
trigger1 = Time > 16
recursive = 1 ;同時消除由該Helper產生的Helper
removeexplods = 1 ;同時消除由該Helper產生的Explod
