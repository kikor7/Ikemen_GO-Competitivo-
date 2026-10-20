;====================================================
;================BASICS==============================
;====================================================

;-----------------------------------------------------------------------------------
[Statedef 200,A]
type    = S
movetype= A
physics = S
juggle  = 1
ctrl = 0
anim = 200
poweradd = 0
sprpriority = 2

;-------dash--------------
[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = prevstateno = 100
statetype = S  
movetype = A 
physics = N 

[State 0, VelSet]
type = VelSet
triggerall = prevstateno = 100
trigger1 = time=0
x = 3

[State 0, VelMul]
type = VelMul
triggerall = prevstateno = 100
trigger1 = time=[0,13]
x = .85
;-----------------------

[State 0, VelSet]
type = VelSet
triggerall = prevstateno != 100
trigger1 = animelem=  3
x = 3
y = 0


[State 203, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = animelem = 3
attr = S, NA
damage = 10,2
getpower = 15,7
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 5,7
sparkno = -1;s6000
guard.sparkno = -1;s7000
hitsound = S3,2
guardsound = S3,4
ground.type = High
ground.slidetime = 7
ground.hittime  =15
ground.velocity = -1,0
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -1,0
air.hittime = 15
envshake.time = 15
envshake.ampl = 5
envshake.freq = 110
envshake.phase = 110

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-30
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.35,0.35
removeongethit = 1
ontop = 0
supermovetime  = 999
ignorehitpause  = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8101) = 0
trigger1 = Movehit = 1 && p2movetype=H
helpertype = normal
name = "HitSpark"
ID = 8101
stateno =ifelse(random>500,8101,8001)
pos = 50-10+random%20, 0-30+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .45
size.yscale = .45

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 0,-Random%EnemyNear,Const(size.height);6,-33
postype = p2
facing = IfElse(Random <= 499,1,-1);1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .6,.6
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
persistent = 0

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 3
anim = 801
ID = 801
pos = 5,-25
postype = p1
bindtime = -1
removetime =-2
scale = .7,.7
sprpriority = 4
ownpal = 1
pausemovetime = 9999
supermovetime = 9999

[State 203, 2]
type = PlaySnd
trigger1 = Time = 0
value = S4,6
channel=0

[State 203, 2]
type = PlaySnd
trigger1 = Time = 1
value =S3,0


;.....................................
;--------------combo------------------
;.....................................
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 4000 && life < 300
trigger1 = command = "Ashura Makyuusen"
trigger1 = time > 7
value = 3800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 4000
trigger1 = command = "Daisen Sekai"
trigger1 = time > 7
value = 3000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 3500
trigger1 = command = "Daishinkan"
trigger1 = time > 7
value = 3710
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 3000
trigger1 = command = "Rokudou no Tsuji"
trigger1 = time > 7
value = 3510
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 3000
trigger1 = command = "Ashura Ichibugin"
trigger1 = time > 7
value = 3100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Kokujou Tatsumaki"
trigger1 = time > 7 
value = 3200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Rengoku Onigiri"
trigger1 = time > 7 
value = 3410
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Shi-Shishi Sonson"
trigger1 = time > 7 
value = 3600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2000
trigger1 = command = "Hiryuu Kaen"
trigger1 = time > 7
value = 3310
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Dai Butsu Giri"
trigger1 = time > 7
value = 1900
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Ushi Bari"
trigger1 = time > 7
value = 1600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Hyou Kin Dama" 
trigger1 = time > 7
value = 1800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Nigori Zake" 
trigger1 = time > 7
value = 1300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 2000 
trigger1 = command = "1080 Pound Hou"
trigger1 = time > 7
value = 2400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Ultra Tora Gari" 
trigger1 = time > 7
value = 2300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500
trigger1 = command = "Tatsumaki"
trigger1 = time > 7
value = 2000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command =  "108 Pound Hou"
trigger1 = time > 7
value = 1150
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 1000
trigger1 = command = "onigiri"
trigger1 = time > 7
value = 1700
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Nigiri Combo"
trigger1 = time > 7
value = 1400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500 
trigger1 = command = "72 Pound Hou"
trigger1 = time > 7
value = 1140
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 800
trigger1 = command = "Rashoumon"
trigger1 = time > 7
value = 1500
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "360 Pound Hou"
trigger1 = time > 7
value = 1100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 500
trigger1 = command = "Shishi Sonson"
trigger1 = time > 7
value = 1200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel  && power >= 300 
trigger1 = command = "Yakkoudori"
trigger1 = time > 7
value = 1000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Yasha Karasu"
trigger1 = time > 7
value = 2202
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Gazami Dori"
trigger1 = time > 7
value = 2100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel  
trigger1 = command = "Maguma"
trigger1 = time > 7
value = 214
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Needle"
trigger1 = time > 7
value = 205
ctrl = 0
[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 7
value = 263
ctrl = 0

[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "a"
trigger1 = time > 7
value = 201
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "b"
trigger1 = time > 7
value = 210
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "c"
trigger1 = time > 7
value = 220
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "x"
trigger1 = time > 7
value = 224
ctrl = 0

[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = !movehit && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 10
value = 263
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "a"
trigger1 = time > 10
value = 201
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "b"
trigger1 = time > 10
value = 210
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "c"
trigger1 = time > 10
value = 220
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "x"
trigger1 = time > 10
value = 224
ctrl = 0
;.....................................
;.....................................

[State 201, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 203
ctrl = 0

;-------------------------------------------------------------------------------
[Statedef 201,AA]
type    = S
movetype= A
physics = S
juggle  = 1
velset = 0,0
ctrl = 0
anim = 201
poweradd = 0
sprpriority = 2

[State 203, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = animelem =2 || animelem =3
attr = S, NA
damage = 10,1;2
getpower = 15,7
animtype = light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 5,8
sparkno = -1;s6000
guard.sparkno = -1;s7000
hitsound = S3,2
guardsound = S3,4
ground.type = low;High
ground.slidetime = 7
ground.hittime  = 15
ground.velocity = -1,-.5
air.type = low
air.velocity = -1,-.5
air.hittime = 20

envshake.time = 15
envshake.ampl = 5
envshake.freq = 110
envshake.phase = 110

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-25
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.35,0.35
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8101) = 0
trigger1 = Movehit = 1 && p2movetype=H
helpertype = normal
name = "HitSpark"
ID = 8101
stateno =ifelse(random>500,8101,8001)
pos = 60-10+random%20, 0-30+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .45
size.yscale = .45

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 0,-Random%EnemyNear,Const(size.height);6,-28
postype = p2
facing = IfElse(Random <= 499,1,-1);1
sprpriority = IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .6,.6;
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
persistent = 0

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 1
anim = 810
ID = 810
pos = 18,10
postype = p1
bindtime = -1
removetime =-2
scale = .6,.6
sprpriority = 4
ownpal = 1
facing = -1
pausemovetime = 9999
supermovetime = 9999

[State 203, 2]
type = PlaySnd
trigger1 = Time = 1
value = S3,0

;.....................................
;--------------combo------------------
;.....................................
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000  && life < 300
trigger1 = command = "Ashura Makyuusen"
trigger1 = time > 4
value = 3800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000
trigger1 = command = "Daisen Sekai"
trigger1 = time > 4
value = 3000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3500
trigger1 = command = "Daishinkan"
trigger1 = time > 4
value = 3710
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Rokudou no Tsuji"
trigger1 = time > 4
value = 3510
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Ashura Ichibugin"
trigger1 = time > 4
value = 3100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Kokujou Tatsumaki"
trigger1 = time > 4
value = 3200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Rengoku Onigiri"
trigger1 = time > 4 
value = 3410
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Shi-Shishi Sonson"
trigger1 = time > 4 
value = 3600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2000
trigger1 = command = "Hiryuu Kaen"
trigger1 = time > 4
value = 3310
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Dai Butsu Giri"
trigger1 = time > 4
value = 1900
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Ushi Bari"
trigger1 = time > 4
value = 1600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Hyou Kin Dama" 
trigger1 = time > 4
value = 1800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Nigori Zake" 
trigger1 = time > 4
value = 1300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 2000 
trigger1 = command = "1080 Pound Hou"
trigger1 = time > 4
value = 2400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Ultra Tora Gari" 
trigger1 = time > 4
value = 2300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500
trigger1 = command = "Tatsumaki"
trigger1 = time > 4
value = 2000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command =  "108 Pound Hou"
trigger1 = time > 4
value = 1150
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 1000
trigger1 = command = "onigiri"
trigger1 = time > 4
value = 1700
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Nigiri Combo"
trigger1 = time > 4
value = 1400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500 
trigger1 = command = "72 Pound Hou"
trigger1 = time > 4
value = 1140
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 800
trigger1 = command = "Rashoumon"
trigger1 = time > 4
value = 1500
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "360 Pound Hou"
trigger1 = time > 4
value = 1100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 500
trigger1 = command = "Shishi Sonson"
trigger1 = time > 4
value = 1200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 300 
trigger1 = command = "Yakkoudori"
trigger1 = time > 4
value = 1000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Yasha Karasu"
trigger1 = time > 4
value = 2202
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Gazami Dori"
trigger1 = time > 4
value = 2100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel  
trigger1 = command = "Maguma"
trigger1 = time > 4
value = 214
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Needle"
trigger1 = time > 4
value = 205
ctrl = 0
[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 4
value = 263
ctrl = 0

[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "a"
trigger1 = time > 4
value = 202
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "b"
trigger1 = time > 4
value = 210
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "c"
trigger1 = time > 4
value = 220
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "x"
trigger1 = time > 4
value = 224
ctrl = 0


[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall =! movehit && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 7
value = 263
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "a"
trigger1 = time > 7
value = 202
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "b"
trigger1 = time > 7
value = 210
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "c"
trigger1 = time > 7
value = 220
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "x"
trigger1 = time > 7
value = 224
ctrl = 0

;................................



[State 201, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 203
ctrl = 0

;-------------------------------------------------------------------------------
[Statedef 202,AAA]
type    = S
movetype= A
physics = S
juggle  = 1
velset = 0,0
ctrl = 0
anim = 202
poweradd = 0
sprpriority = 2

[State 0, PosAdd]
type = velset
trigger1 = animelem = 2
x = 5

[State 203, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = animelem = 3 || animelem = 4
attr = S, NA
damage =15, 2;
getpower = 15,7
animtype = hard
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 5,7
sparkno = -1;s6000
guard.sparkno = -1;s7000
hitsound = S3,2
guardsound = S3,4
ground.type = High
ground.slidetime = 15
ground.hittime  = 20
ground.velocity = -1,-1
airguard.velocity = -1,-.7
air.type = High
air.velocity = -1,-1
air.hittime = 15
fall=0

envshake.time = 15
envshake.ampl = 5
envshake.freq = 110
envshake.phase = 110

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8107) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8107
stateno =ifelse(random>500,8107,8007)
pos = 70, -24
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6

[State 0, Helper]
type = Helper
triggerall = Numexplod(8200) = 0
trigger1 = moveguarded=1 && numenemy
helpertype =normal
name = "sparkGuard"
ID = 8200
stateno = ifelse(random>500,8200,8201)
pos = 20,-35
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
persistent =0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8105) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8105
stateno =ifelse(random>500,8100,8000)
pos = 70, -24
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 0,-Random%EnemyNear,Const(size.height);6,-35
postype = p2
facing = IfElse(Random <= 499,1,-1);1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .6,.6
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
persistent = 0

[State 0, Corte FX]
type = Explod
trigger1 = time=6
anim = 804
ID = 804
pos = 66,-12
postype = p1
bindtime = -1
removetime =-2
scale = .9,.7
sprpriority = 4
ownpal = 1
pausemovetime=9999
supermovetime = 9999

[State 0, Explod viento]
type = Explod
triggerall =time<30
trigger1 =animelem=4 
anim = 7136
ID = 7136
pos =60,5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
supermovetime = 9999
pausemovetime=9999
scale = .5,.5
sprpriority = 0
ownpal = 1
removeongethit = 1
ignorehitpause =1

[State 203, 2]
type = PlaySnd
trigger1 = Time = 1
value = s3, 0

[State 203, 2]
type = PlaySnd
trigger1 = animelem=3
value = S3,13

[State 203, 2]
type = PlaySnd
trigger1 = animelem=1
value = S4, 13
channel=0

;.....................................
;--------------combo------------------
;.....................................
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000  && life < 300
trigger1 = command = "Ashura Makyuusen"
trigger1 = time > 7
value = 3800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000
trigger1 = command = "Daisen Sekai"
trigger1 = time > 7
value = 3000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3500
trigger1 = command = "Daishinkan"
trigger1 = time > 7
value = 3710
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Rokudou no Tsuji"
trigger1 = time > 7
value = 3510
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Ashura Ichibugin"
trigger1 = time > 7
value = 3100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Kokujou Tatsumaki"
trigger1 = time > 7 
value = 3200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Rengoku Onigiri"
trigger1 = time > 7
value = 3410
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Shi-Shishi Sonson"
trigger1 = time > 7 
value = 3600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2000
trigger1 = command = "Hiryuu Kaen"
trigger1 = time > 7
value = 3310
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Dai Butsu Giri"
trigger1 = time > 7
value = 1900
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Ushi Bari"
trigger1 = time > 7
value = 1600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Hyou Kin Dama" 
trigger1 = time > 7
value = 1800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Nigori Zake" 
trigger1 = time > 7
value = 1300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 2000 
trigger1 = command = "1080 Pound Hou"
trigger1 = time > 7
value = 2400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Ultra Tora Gari" 
trigger1 = time > 7
value = 2300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500
trigger1 = command = "Tatsumaki"
trigger1 = time > 7
value = 2000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command =  "108 Pound Hou"
trigger1 = time > 7
value = 1150
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 1000
trigger1 = command = "onigiri" 
trigger1 = time > 7
value = 1700
ctrl = 0

[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Nigiri Combo"
trigger1 = time > 7
value = 1400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500 
trigger1 = command = "72 Pound Hou"
trigger1 = time > 7
value = 1140
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 800
trigger1 = command = "Rashoumon"
trigger1 = time > 7
value = 1500
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "360 Pound Hou"
trigger1 = time > 7
value = 1100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 500
trigger1 = command = "Shishi Sonson"
trigger1 = time > 7
value = 1200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 300 
trigger1 = command = "Yakkoudori"
trigger1 = time > 7
value = 1000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Yasha Karasu"
trigger1 = time > 7
value = 2202
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Gazami Dori"
trigger1 = time > 7
value = 2100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel  
trigger1 = command = "Maguma"
trigger1 = time > 7
value = 214
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Needle"
trigger1 = time > 7
value = 205
ctrl = 0
[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 7
value = 263
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "b"
trigger1 = time > 7
value = 210
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "c"
trigger1 = time > 7
value = 220
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "x"
trigger1 = time > 7
value = 224
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel
trigger1 = command = "y"
trigger1 = time > 7
value = 291
ctrl = 0



[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = !movehit && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 10
value = 263
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "b"
trigger1 = time > 10
value = 210
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "c"
trigger1 = time > 10
value = 220
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "x"
trigger1 = time > 10
value = 224
ctrl = 0

;................................


[State 203, End]
type = ChangeState
trigger1 =time=29
value = 203
ctrl = 0


;===============================================================================
;-------------------------------------------------------------------------------
[Statedef 205,Needle]
type    = S
movetype= A
physics = N
juggle  = 1
ctrl = 0
anim = 305
poweradd = 0
sprpriority = 2

[State 0, VelSet]
type = VelSet
trigger1 = time=0
x = 4

[State 0, VelMul]
type = VelMul
trigger1 = time=[0,13]
x = .9
;-----------------------

[State 3000, polvo Rush - FX]
type = Explod
triggerall = time <14
trigger1 = time%6=0
anim = 7140
ID = 7140
pos = 15,0
sprpriority = 3
removetime = -2
bindtime = 1
ownpal = 1
scale = .3,.2
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
facing=-1

[State 100, Dash]
type = Explod
trigger1 = !Time
anim = 6005
id = 6005
pos = -44,-35
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 100, Dash]
type = Explod
trigger1 = !Time
anim = 6005
id = 6005
pos = -40,-8
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 203, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = animelem = 2
attr = S, NA
damage =15, 3
getpower = 60,30
animtype = hard
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 5,9
guard.pausetime=2,2
sparkxy = -20, -30
sparkno = -1;s6000
guard.sparkno = -1;s7000
hitsound = S3,12
guardsound = S3,13
ground.type = low
ground.slidetime = 15
ground.hittime  = 30
ground.velocity = -3,-1.5
air.velocity = -1.4,-1
air.type = High
air.hittime = 15
fall=0

envshake.time = 15
envshake.ampl = 5
envshake.freq = 110
envshake.phase = 110

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8107
stateno = 8107
pos = 70, -24
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-33
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.3,0.3
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 1
persistent = 0

[State 200, Spark blood]
type = Explod
triggerall = Numexplod(7162) = 0
trigger1 = movehit=1  && p2movetype=H
anim = 7162
ID =7162
pos = 6,-34
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .6,.6
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 1
persistent = 0

[State 0, Corte FX]
type = Explod
trigger1 = time=0
anim = 809
ID = 809
pos = 55,-33
postype = p1
bindtime = -1
removetime =-2
scale = .8,1
sprpriority = 4
ownpal = 1
pausemovetime=9999
supermovetime = 9999

[State 203, 2]
type = PlaySnd
trigger1 = Time = 0
value = s3, 14

[State 203, 2]
type = PlaySnd
trigger1 = animelem=1
value = S4, 13
channel=0

;.....................................
;--------------combo------------------
;.....................................
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000  && life < 300
trigger1 = command = "Ashura Makyuusen"
trigger1 = time > 7
value = 3800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000
trigger1 = command = "Daisen Sekai"
trigger1 = time > 7
value = 3000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3500
trigger1 = command = "Daishinkan"
trigger1 = time > 7
value = 3710
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Rokudou no Tsuji"
trigger1 = time > 7
value = 3510
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Ashura Ichibugin"
trigger1 = time > 7
value = 3100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Kokujou Tatsumaki"
trigger1 = time > 7 
value = 3200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Rengoku Onigiri"
trigger1 = time > 7 
value = 3410
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Shi-Shishi Sonson"
trigger1 = time > 7 
value = 3600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2000
trigger1 = command = "Hiryuu Kaen"
trigger1 = time > 7
value = 3310
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Dai Butsu Giri"
trigger1 = time > 7
value = 1900
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Ushi Bari"
trigger1 = time > 7
value = 1600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Hyou Kin Dama" 
trigger1 = time > 7
value = 1800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Nigori Zake" 
trigger1 = time > 7
value = 1300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 2000 
trigger1 = command = "1080 Pound Hou"
trigger1 = time > 7
value = 2400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Ultra Tora Gari" 
trigger1 = time > 7
value = 2300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500 
trigger1 = command = "Tatsumaki"
trigger1 = time > 7
value = 2000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command =  "108 Pound Hou"
trigger1 = time > 7
value = 1150
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 1000
trigger1 = command = "onigiri"
trigger1 = time > 7
value = 1700
ctrl = 0

[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Nigiri Combo"
trigger1 = time > 7
value = 1400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500 
trigger1 = command = "72 Pound Hou"
trigger1 = time > 7
value = 1140
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 800
trigger1 = command = "Rashoumon"
trigger1 = time > 7
value = 1500
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "360 Pound Hou"
trigger1 = time > 7
value = 1100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 500
trigger1 = command = "Shishi Sonson"
trigger1 = time > 7
value = 1200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 300 
trigger1 = command = "Yakkoudori"
trigger1 = time > 7
value = 1000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Yasha Karasu"
trigger1 = time > 7
value = 2202
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Gazami Dori"
trigger1 = time > 7
value = 2100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel  
trigger1 = command = "Maguma"
trigger1 = time > 7
value = 214
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Needle"
trigger1 = time > 7
value = 205
ctrl = 0
[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = movehit && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 7
value = 263
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel
trigger1 = command = "a"
trigger1 = time > 7
value = 200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel
trigger1 = command = "b"
trigger1 = time > 7
value = 210
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel
trigger1 = command = "c"
trigger1 = time > 7
value = 220
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel
trigger1 = command = "x"
trigger1 = time > 7
value = 224
ctrl = 0

[State Change]
type = ChangeState
triggerall = movehit && !AILevel
trigger1 = command = "y"
trigger1 = time > 7
value = 291
ctrl = 0


[State 203, End]
type = ChangeState
trigger1 =time=29
value = 203
ctrl = 0


;===============================================================================
[Statedef 203, A end]
type    = S
movetype= I
physics = S
velset = 0,0
ctrl = 0
anim = 203
sprpriority = 2

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 0, PlaySnd]
type = PlaySnd
triggerall=prevstateno=260
trigger1 = time=1
value = S3,33

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = 1
id = 7144

[State 203, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;===============================================================================

[Statedef 210,B]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd = 0
ctrl = 0
anim = 210
sprpriority = 2

;-------RUN--------------
[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = prevstateno = 100
statetype = S  
movetype = A 
physics = N 

[State 0, VelSet]
type = VelSet
triggerall = prevstateno = 100
trigger1 = time=0
x = 3

[State 0, VelMul]
type = VelMul
triggerall = prevstateno = 100
trigger1 = time=[0,13]
x = .85
;-----------------------

[State 0, VelSet]
type = VelSet
triggerall = prevstateno != 100
trigger1 = animelem=  4
x = 2
y = 0

[State 210, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = animelem = 4  || animelem = 5
attr = S, NA
animtype  = Medium
damage    = 15,2;
getpower = 10,5
guardflag = MA
pausetime =  5,7
sparkno = -1;s6000
guard.sparkno = -1;s7000
sparkxy = -20,-25
hitsound   = S3,21
guardsound = S3,6
ground.type = low
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -4,0

envshake.time = 15
envshake.ampl = 5
envshake.freq = 115
envshake.phase = 115

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-30
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.45,0.45
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8101) = 0
trigger1 = Movehit = 1 && p2movetype=H
helpertype = normal
name = "HitSpark"
ID = 8101
stateno =ifelse(random>500,8101,8001)
pos = 30-10+random%20, 0-30+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .45
size.yscale = .45

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 0,-30
postype = p2
facing = IfElse(Random <= 499,1,-1);1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .65,.65
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
persistent = 0

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 4
anim = 810
ID = 810
pos = 8,18
postype = p1
bindtime = -1
removetime =-2
scale = .6,.6
sprpriority = 4
ownpal = 1
pausemovetime=9999
supermovetime = 9999

[State 203, 2]
type = PlaySnd
trigger1 = Time = 0
value = S4,1
channel=0

[State 210, 2]
type = PlaySnd
trigger1 = Time = 0
value = S3,10

;.....................................
;--------------combo------------------
;.....................................
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000  && life < 300
trigger1 = command = "Ashura Makyuusen"
trigger1 = time > 9
value = 3800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000
trigger1 = command = "Daisen Sekai"
trigger1 = time > 9
value = 3000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3500
trigger1 = command = "Daishinkan"
trigger1 = time > 9
value = 3710
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Rokudou no Tsuji"
trigger1 = time > 9
value = 3510
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Ashura Ichibugin"
trigger1 = time > 9
value = 3100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Kokujou Tatsumaki"
trigger1 = time > 9 
value = 3200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Rengoku Onigiri"
trigger1 = time > 9 
value = 3410
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Shi-Shishi Sonson"
trigger1 = time > 9 
value = 3600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2000
trigger1 = command = "Hiryuu Kaen"
trigger1 = time > 9
value = 3310
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Dai Butsu Giri"
trigger1 = time > 9
value = 1900
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Ushi Bari"
trigger1 = time > 9
value = 1600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Hyou Kin Dama" 
trigger1 = time > 9
value = 1800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Nigori Zake" 
trigger1 = time > 9
value = 1300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 2000 
trigger1 = command = "1080 Pound Hou"
trigger1 = time > 9
value = 2400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Ultra Tora Gari" 
trigger1 = time > 9
value = 2300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500
trigger1 = command = "Tatsumaki"
trigger1 = time > 9
value = 2000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command =  "108 Pound Hou"
trigger1 = time > 9
value = 1150
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 1000
trigger1 = command = "onigiri"
trigger1 = time > 9
value = 1700
ctrl = 0

[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Nigiri Combo"
trigger1 = time > 9
value = 1400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500 
trigger1 = command = "72 Pound Hou"
trigger1 = time > 9
value = 1140
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 800
trigger1 = command = "Rashoumon"
trigger1 = time > 9
value = 1500
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "360 Pound Hou"
trigger1 = time > 9
value = 1100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 500
trigger1 = command = "Shishi Sonson"
trigger1 = time > 9
value = 1200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 300 
trigger1 = command = "Yakkoudori"
trigger1 = time > 9
value = 1000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Yasha Karasu"
trigger1 = time > 9
value = 2202
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Gazami Dori"
trigger1 = time > 9
value = 2100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel  
trigger1 = command = "Maguma"
trigger1 = time > 9
value = 214
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Needle"
trigger1 = time > 9
value = 205
ctrl = 0
[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 9
value = 263
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "a"
trigger1 = time > 9
value = 200
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "b"
trigger1 = time > 9
value = 211
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded)&& !AILevel
trigger1 = command = "c"
trigger1 = time > 9
value = 220
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "x"
trigger1 = time > 9
value = 224
ctrl = 0


[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = !movehit && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 10
value = 263
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "a"
trigger1 = time > 10
value = 200
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "b"
trigger1 = time > 10
value = 211
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "c"
trigger1 = time > 10
value = 220
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "x"
trigger1 = time > 10
value = 224
ctrl = 0

;.....................................


[State 210, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 213
ctrl = 0


;-------------------------------------------------------------------------------
[Statedef 211,BB]
type    = S
movetype= A
physics = S
juggle  = 1
velset = 0,0
ctrl = 0
anim = 211
poweradd = 0
sprpriority = 2

[State 211, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = animelem = 3 || animelem = 4
attr = S, NA
animtype  = Medium
damage    = 15,2;3
getpower = 10,5
guardflag = MA
pausetime = 8,10
sparkno = -1;s6000
guard.sparkno = -1;s7000
sparkxy = -20,-25
hitsound   = S3,21
guardsound = S3,6
ground.type = low
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -2,0

envshake.time = 15
envshake.ampl = 5
envshake.freq = 115
envshake.phase = 115

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-30
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.45,0.45
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8101) = 0
trigger1 = Movehit = 1 && p2movetype=H
helpertype = normal
name = "HitSpark"
ID = 8101
stateno =ifelse(random>500,8101,8001)
pos = 45-10+random%20, 0-30+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .45
size.yscale = .45

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 0,-30
postype = p2
facing = IfElse(Random <= 499,1,-1);1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .65,.65
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
persistent = 0

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 3
anim = 805
ID = 805
pos = 5,-53
postype = p1
bindtime = -1
removetime =-2
scale = .7,.57
sprpriority = 4
ownpal = 1
pausemovetime=9999
supermovetime = 9999

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 3
anim = 805
ID = 805
pos = 5,-35
postype = p1
bindtime = -1
removetime =-2
scale = .7,.57
sprpriority = 4
ownpal = 1
pausemovetime=9999
supermovetime = 9999

[State 211, 2]
type = PlaySnd
trigger1 = Time = 1
value = S3,0


;.....................................
;--------------combo------------------
;.....................................
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000  && life < 300
trigger1 = command = "Ashura Makyuusen"
trigger1 = time > 9
value = 3800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000
trigger1 = command = "Daisen Sekai"
trigger1 = time > 6
value = 3000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3500
trigger1 = command = "Daishinkan"
trigger1 = time > 6
value = 3710
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Rokudou no Tsuji"
trigger1 = time > 6
value = 3510
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Ashura Ichibugin"
trigger1 = time > 6
value = 3100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Kokujou Tatsumaki"
trigger1 = time > 6 
value = 3200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Rengoku Onigiri"
trigger1 = time > 6 
value = 3410
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Shi-Shishi Sonson"
trigger1 = time > 6 
value = 3600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2000
trigger1 = command = "Hiryuu Kaen"
trigger1 = time > 6
value = 3310
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Dai Butsu Giri"
trigger1 = time > 6
value = 1900
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Ushi Bari"
trigger1 = time > 6
value = 1600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Hyou Kin Dama" 
trigger1 = time > 6
value = 1800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Nigori Zake" 
trigger1 = time > 6
value = 1300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 2000 
trigger1 = command = "1080 Pound Hou"
trigger1 = time > 6
value = 2400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Ultra Tora Gari" 
trigger1 = time > 6
value = 2300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500
trigger1 = command = "Tatsumaki"
trigger1 = time > 6
value = 2000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command =  "108 Pound Hou"
trigger1 = time > 6
value = 1150
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 1000
trigger1 = command = "onigiri"
trigger1 = time > 6
value = 1700
ctrl = 0

[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Nigiri Combo"
trigger1 = time > 6
value = 1400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500 
trigger1 = command = "72 Pound Hou"
trigger1 = time > 6
value = 1140
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 800
trigger1 = command = "Rashoumon"
trigger1 = time > 6
value = 1500
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "360 Pound Hou"
trigger1 = time > 6
value = 1100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 500
trigger1 = command = "Shishi Sonson"
trigger1 = time > 6
value = 1200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 300 
trigger1 = command = "Yakkoudori"
trigger1 = time > 6
value = 1000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Yasha Karasu"
trigger1 = time > 6
value = 2202
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Gazami Dori"
trigger1 = time > 6
value = 2100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel  
trigger1 = command = "Maguma"
trigger1 = time > 6
value = 214
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Needle"
trigger1 = time > 6
value = 205
ctrl = 0
[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 6
value = 263
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "a"
trigger1 = time > 6
value = 200
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "b"
trigger1 = time > 6
value = 212
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "c"
trigger1 = time > 6
value = 220
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "x"
trigger1 = time > 6
value = 224
ctrl = 0


[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = !movehit && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 11
value = 263
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "a"
trigger1 = time > 11
value = 200
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "b"
trigger1 = time > 11
value = 212
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "c"
trigger1 = time > 11
value = 220
ctrl = 0
[State Change]
type = ChangeState
triggerall =!movehit && !AILevel
trigger1 = command = "x"
trigger1 = time > 11
value = 224
ctrl = 0

;.....................................



[State 211, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 213
ctrl = 0



;-------------------------------------------------------------------------------
[Statedef 212,BBB]
type    = S
movetype= A
physics = S
juggle  = 1
velset = 0,0
ctrl = 0
anim = 212
poweradd = 0
sprpriority = 2

[State 0, VelSet]
type = posadd
trigger1 = animelem=1
x =23

[State 211, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = animelem = 2
attr = S, NA
animtype  = Medium
damage    = 20,4
getpower = 10,5
guardflag = MA
pausetime = 8,10
sparkno = -1;s6000
guard.sparkno = -1;s7000
sparkxy = -20,-25
hitsound   = S3,21
guardsound = S3,6
ground.type = low
ground.slidetime = 15
ground.hittime  = 30
ground.velocity = -9,-4
air.velocity =-6,-3
p2stateno=5820;
envshake.freq = 15
envshake.time = 40

envshake.time = 15
envshake.ampl = 5
envshake.freq = 115
envshake.phase = 115

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numexplod(8200) = 0
trigger1 = moveguarded=1 && numenemy
helpertype =normal
name = "sparkGuard"
ID = 8200
stateno = ifelse(random>500,8200,8201)
pos = 20,-35
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
persistent =0


[State 0, Helper]
type = Helper
triggerall = Numhelper(8107) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8107
stateno =ifelse(random>500,8107,8007)
pos = 50, -24
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6

[State 0, Helper]
type = Helper
triggerall = Numhelper(8105) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8105
stateno =ifelse(random>500,8100,8000)
pos = 50, -24
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6
; 
[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 0,-33
postype = p2
facing = IfElse(Random <= 499,1,-1);1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .65,.65
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
persistent = 0

[State 60, dust]
type = Explod
triggerall =movehit && p2movetype=H
triggerall =p2dist y = 0
triggerall = time < 30
trigger1 = time%4= 0
anim = 7140
ID =  7140
pos = 0,floor(p2dist y)
postype = p2
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .3,.2
sprpriority = 10
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
supermovetime = 9999
pausemovetime =9999

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 2
anim = 810
ID = 810
pos = 25,-1
postype = p1
bindtime = -1
removetime =-2
scale = .55,.4
sprpriority = 4
ownpal = 1
pausemovetime=9999
supermovetime = 9999

;.....................................
;--------------combo------------------
;.....................................
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000  && life < 300
trigger1 = command = "Ashura Makyuusen"
trigger1 = time > 6
value = 3800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000
trigger1 = command = "Daisen Sekai"
trigger1 = time > 6
value = 3000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3500
trigger1 = command = "Daishinkan"
trigger1 = time > 6
value = 3710
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Rokudou no Tsuji"
trigger1 = time > 6
value = 3510
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Ashura Ichibugin"
trigger1 = time > 6
value = 3100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Kokujou Tatsumaki"
trigger1 = time > 6
value = 3200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Rengoku Onigiri"
trigger1 = time > 6 
value = 3410
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Shi-Shishi Sonson"
trigger1 = time > 6 
value = 3600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2000
trigger1 = command = "Hiryuu Kaen"
trigger1 = time > 6
value = 3310
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Dai Butsu Giri"
trigger1 = time > 6
value = 1900
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Ushi Bari"
trigger1 = time > 6
value = 1600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Hyou Kin Dama" 
trigger1 = time > 6
value = 1800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Nigori Zake" 
trigger1 = time > 6
value = 1300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 2000 
trigger1 = command = "1080 Pound Hou"
trigger1 = time > 6
value = 2400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Ultra Tora Gari" 
trigger1 = time > 6
value = 2300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500
trigger1 = command = "Tatsumaki"
trigger1 = time > 6
value = 2000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command =  "108 Pound Hou"
trigger1 = time > 6
value = 1150
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 1000
trigger1 = command = "onigiri"
trigger1 = time > 6
value = 1700
ctrl = 0

[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Nigiri Combo"
trigger1 = time > 6
value = 1400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500 
trigger1 = command = "72 Pound Hou"
trigger1 = time > 6
value = 1140
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 800
trigger1 = command = "Rashoumon"
trigger1 = time > 6
value = 1500
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "360 Pound Hou"
trigger1 = time > 6
value = 1100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 500
trigger1 = command = "Shishi Sonson"
trigger1 = time > 6
value = 1200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 300 
trigger1 = command = "Yakkoudori"
trigger1 = time > 6
value = 1000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Yasha Karasu"
trigger1 = time > 6
value = 2202
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Gazami Dori"
trigger1 = time > 6
value = 2100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel  
trigger1 = command = "Maguma"
trigger1 = time > 6
value = 214
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Needle"
trigger1 = time > 6
value = 205
ctrl = 0
[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 6
value = 263
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "a"
trigger1 = time > 6
value = 200
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "c"
trigger1 = time > 6
value = 220
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "x"
trigger1 = time > 6
value = 224
ctrl = 0

[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = !movehit && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 9
value = 263
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "a"
trigger1 = time > 9
value = 200
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "c"
trigger1 = time > 9
value = 220
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "x"
trigger1 = time > 9
value = 224
ctrl = 0

;.....................................


[State 211, 2]
type = PlaySnd
trigger1 = Time = 0
value = S4,5
channel=0

[State 211, 2]
type = PlaySnd
trigger1 = Time = 1
value = S3,0

[State 203, 2]
type = PlaySnd
trigger1 = animelem=2
value = S3,16

[State 211, End]
type = ChangeState
trigger1 = time=20
value = 213
ctrl = 0



;===============================================================================
[Statedef 213, B end]
type    = S
movetype= I
physics = S
velset = 0,0
ctrl = 0
anim = 213
sprpriority = 2


[State 204, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-------------------------------------------------------------------------
[Statedef 214, Maguma]
type = S;A
movetype = A
physics = N
anim = 1403
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = 2

;-------RUN--------------
[State 0, VelSet]
type = VelSet
triggerall = prevstateno = 100
trigger1 = time=0
x = 7

[State 0, VelMul]
type = VelMul
triggerall = prevstateno = 100
trigger1 = time=[0,12]
x = 0.85
;-----------------------

[State 0, VelSet]
type = VelSet
trigger1 = time =[13,24]
x = ifelse(movecontact,15,5)
y = 0
ignorehitpause = 1

[State 100, Dash]
type = Explod
trigger1 = animelem=4
anim = 6005
id = 6005
pos = -44,-38
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 100, Dash]
type = Explod
trigger1 = animelem=4
anim = 6005
id = 6005
pos = -40,-11
postype	= p1
facing = 1
vfacing	= 1
bindtime = -1
sprpriority = 3
vel = 0,0
removetime = -2
accel = 0,0
scale  = .25,.25
ontop = 0
ownpal = 1

[State 211, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = animelem = 4 || animelem = 5 || animelem = 6
attr = S, NA
animtype  = Medium
damage    = 20,2;4
getpower = 30,15
guardflag = MA
pausetime = 8,10
sparkno = -1;s6000
guard.sparkno = -1;s7000
sparkxy = -20,-25
hitsound   = S3,21
guardsound = S3,25
ground.type =high
ground.slidetime = 12
ground.hittime  = 30
ground.velocity = -4,0
air.velocity = -2.5,-4
kill=0

envshake.time = 15
envshake.ampl = 5
envshake.freq = 115
envshake.phase = 115

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-30
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.5,0.5
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 1
persistent = 1

[State 0, Helper]
type = Helper
triggerall = Numhelper(8101) = 0
trigger1 = Movehit = 1 && p2movetype=H
helpertype = normal
name = "HitSpark"
ID = 8101
stateno =8101
pos = 30-10+random%20, 0-30+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .3
size.yscale = .3

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 6,-30
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .65,.65
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
persistent = 0

[State 1000: helper rush]
type = Helper
trigger1 = animelem = 4
helpertype = Normal
id = 215
pos = 0,0
postype = p1
facing = 1
stateno	= 215
keyctrl	= 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = 1
size.yscale = 1

[State 210, 2]
type = PlaySnd
trigger1 = Time = 0
value = S4,3

[State 210, 2]
type = PlaySnd
trigger1 = Time = 3
value = S3, 31


;.....................................
;--------------combo------------------
;.....................................
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000  && life < 300
trigger1 = command = "Ashura Makyuusen"
trigger1 = time > 25
value = 3800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000
trigger1 = command = "Daisen Sekai"
trigger1 = time > 25
value = 3000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3500
trigger1 = command = "Daishinkan"
trigger1 = time > 25
value = 3710
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Rokudou no Tsuji"
trigger1 = time > 25
value = 3510
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Ashura Ichibugin"
trigger1 = time > 25
value = 3100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Kokujou Tatsumaki"
trigger1 = time > 25 
value = 3200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Rengoku Onigiri"
trigger1 = time > 25 
value = 3410
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Shi-Shishi Sonson"
trigger1 = time > 25 
value = 3600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2000
trigger1 = command = "Hiryuu Kaen"
trigger1 = time > 25
value = 3310
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Dai Butsu Giri"
trigger1 = time > 25
value = 1900
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Ushi Bari"
trigger1 = time > 25
value = 1600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Hyou Kin Dama" 
trigger1 = time > 25
value = 1800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Nigori Zake" 
trigger1 = time > 25
value = 1300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 2000 
trigger1 = command = "1080 Pound Hou"
trigger1 = time > 25
value = 2400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Ultra Tora Gari" 
trigger1 = time > 25
value = 2300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500
trigger1 = command = "Tatsumaki"
trigger1 = time > 25
value = 2000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command =  "108 Pound Hou"
trigger1 = time > 25
value = 1150
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 1000
trigger1 = command = "onigiri"
trigger1 = time > 25
value = 1700
ctrl = 0

[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Nigiri Combo"
trigger1 = time > 25
value = 1400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500 
trigger1 = command = "72 Pound Hou"
trigger1 = time > 25
value = 1140
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 800
trigger1 = command = "Rashoumon"
trigger1 = time > 25
value = 1500
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "360 Pound Hou"
trigger1 = time > 25
value = 1100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 500
trigger1 = command = "Shishi Sonson"
trigger1 = time > 25
value = 1200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 300 
trigger1 = command = "Yakkoudori"
trigger1 = time > 25
value = 1000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Yasha Karasu"
trigger1 = time > 25
value = 2202
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Gazami Dori"
trigger1 = time > 25
value = 2100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel  
trigger1 = command = "Maguma"
trigger1 = time > 25
value = 214
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Needle"
trigger1 = time > 25
value = 205
ctrl = 0
[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = movehit && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 30
value = 263
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel
trigger1 = command = "a"
trigger1 = time > 25
value = 200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel
trigger1 = command = "b"
trigger1 = time > 25
value = 210
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel
trigger1 = command = "c"
trigger1 = time > 25
value = 220
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel
trigger1 = command = "x"
trigger1 = time > 25
value = 224
ctrl = 0

[State Change,Nigiri Combo IV]
type = ChangeState
triggerall = !AIlevel
triggerall=movecontact
trigger1 =Command = "up" && time>=25;30
value = 216
ctrl = 0

;
[State 211, off]
type = ChangeState
;triggerall= !AIlevel || AIlevel ||  p2life = 0
trigger1 = time>=39
value =  1406
ctrl = 0


;-------------------------------------------------------------------------------

[Statedef 215, Maguma - helper]
type = S
movetype = A
physics = S
ctrl = 0
anim =809;
sprpriority = 3

[State 0, Trans]
type = Trans
trigger1 = 1
trans = add
;
[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 6
y = 0

[State 3000, polvo Rush - FX]
type = Explod
triggerall = time <30
trigger1 = time%5=0
anim = 7140
ID = 7140
pos = 21,0
vel = 0, 0
sprpriority = 3
supermove = 1
removetime = -2
bindtime = 1
ownpal = 1
scale = .3,.2
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
facing=-1

[State 0, Helper]
type = Helper
triggerall = time <30
trigger1 = time%3=0
helpertype = normal
name = "HitSpark_Floor"
ID = 8106
stateno = 8106
pos = 0,-floor(pos y)
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .3
size.yscale = .3

[State 211, 2]
type = PlaySnd
triggerall = time <30
trigger1 = time%3=0
value = S3,0

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time=30 || parent,stateNo!= 214

;---------------------------------------------------------------------
[Statedef 216, Maguma - combo to air]
type = A
movetype = A
physics = N
anim = 1404
velset = 0,0
ctrl = 0

[State 1100, 2]
type = VelSet
trigger1 = Time = 11
X = 1
Y = -10

[State 1100, 3]
type = VelAdd
trigger1 = Time >= 11
Y = .32

[State 211, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 =  animelem = 4
attr = A, NA
damage    = 10,0
getpower = 30,15
guardflag =
animtype= up
priority = 3
pausetime = 8,7
sparkno = -1
sparkxy = -25,-40
guard.sparkno = -1;s7000
hitsound   = S3,2
guardsound = S3,13
ground.type = High
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = -1, -10
air.velocity = -2,-4 
guard.velocity = -7
airguard.velocity =-2.,-6.5
air.hittime = 30
Fall = 1
kill=0
fall.recover=0

envshake.time = 15
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8101) = 0
trigger1 = Movehit = 1 && p2movetype=H
helpertype = normal
name = "HitSpark"
ID = 8101
stateno =ifelse(random>500,8101,8001)
pos = 20-10+random%20, 0-40+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .9
size.yscale = .9

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 6,-35
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .65,.65
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
persistent = 0

[State 60, corte FX]
type = Explod
trigger1 = AnimElem = 4 || AnimElem = 6
anim = 813
ID =  813
pos = 9,-3
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
supermovetime = 9999
pausemovetime = 9999
scale = .9,.9
sprpriority = 1
ownpal = 1
removeongethit = 0
ignorehitpause = 1
persistent = 1

[State 60, corte FX]
type = Explod
trigger1 = AnimElem = 4 || AnimElem = 6
anim = 813
ID =  813
pos = 17,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
supermovetime = 9999
pausemovetime = 9999
scale = .9,.9
sprpriority = 4
ownpal = 1
removeongethit = 0
ignorehitpause = 1
persistent = 1

[State 1100, 1]
type = PlaySnd
trigger1 = time = 11
value = S2,0
;channel=7

[State 210, 2]
type = PlaySnd
trigger1 =time=10
value = S4,11
channel=0

[State Change]
type = ChangeState
triggerall= movehit && !AIlevel
trigger1 =  command = "Nigori Zake" && time>=24
value = 1300
ctrl = 0

[State 600, Combo]
type = ChangeState
triggerall = !AIlevel
trigger1 =Command = "b" &&  time>=24
value = 240
ctrl = 0

[State Change]
type = ChangeState
triggerall= movehit && !AIlevel
trigger1 = command = "x" && time>=24
value = 255
ctrl = 0

[State Change]
type = ChangeState
triggerall= movehit && !AIlevel
trigger1 = command = "c" && time>=24
value = 250
ctrl = 0

[State Change]
type = ChangeState
triggerall= movehit && !AIlevel
trigger1 =  command = "z" && time>=24
value = 280
ctrl = 0

[State Change]
type = ChangeState
triggerall= movehit && !AIlevel
trigger1 =  command = "y" && time>=24
value = 270
ctrl = 0

[State Change]
type = ChangeState
triggerall= movehit && !AIlevel
trigger1 =  command = "a" && time>=24
value = 230
ctrl = 0


[State 1100, off]
type = Changestate
trigger1 = Time >= 45
value = 241
ctrl = 0

;-------------------------------------------------------------------------------


;===============================================================================
[Statedef 220, C]
type    = S
movetype = A
physics = S
poweradd = 0
ctrl = 0
velset = 0,0
anim = 220
sprpriority = 2
juggle  = 1

;-------RUN--------------
[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = prevstateno = 100
statetype = S  
movetype = A 
physics = N 

[State 0, VelSet]
type = VelSet
triggerall = prevstateno = 100
trigger1 = time=0
x = 3

[State 0, VelMul]
type = VelMul
triggerall = prevstateno = 100
trigger1 = time=[0,13]
x = .85
;-----------------------

[State 0, VelSet]
type = VelSet
triggerall = prevstateno != 100
trigger1 = animelem=  4
x = 1
y = 0


[State 230, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = animelem = 4 || animelem = 5
attr = S, NA
animtype  = hard
damage    = 20,2;4
getpower = 7,3
guardflag = MA
pausetime = 5,7
sparkno = -1;s6000
guard.sparkno = -1; s7000
sparkxy = -25,-25
hitsound   = S3,22
guardsound = S3,25
ground.type = high
ground.slidetime = 100
ground.hittime  = 20
ground.velocity = -3,0
air.velocity = -3,0
fall = 0

envshake.time = 15
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0


[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-35
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.6,0.6
removeongethit = 1
ontop = 0
ignorehitpause  = 1
persistent = 0
supermovetime =9999
pausemovetime =9999

[State 0, Helper]
type = Helper
triggerall = Numhelper(8102) = 0
trigger1 = Movehit = 1 && p2movetype=H
helpertype = normal
name = "HitSpark"
ID = 8102
stateno =ifelse(random>500,8102,8002)
pos = 70-10+random%20, 0-40+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 0,-Random%EnemyNear,Const(size.height);6,-33
postype = p2
facing = IfElse(Random <= 499,1,-1);1
sprpriority = IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .7,.7
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 4
anim = 811
ID = 811
pos = 50,35
postype = p1
bindtime = -1
removetime =-2
scale = 1,1
sprpriority = 4
ownpal = 1
supermovetime =9999
pausemovetime =9999

[State 203, 2]
type = PlaySnd
trigger1 = Time = 0
value = S4,0
channel=0

[State 210, 2]
type = PlaySnd
trigger1 = Time = 0
value = S3,20


;.....................................
;--------------combo------------------
;.....................................
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000  && life < 300
trigger1 = command = "Ashura Makyuusen"
trigger1 = time > 11
value = 3800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000
trigger1 = command = "Daisen Sekai"
trigger1 = time > 11
value = 3000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3500
trigger1 = command = "Daishinkan"
trigger1 = time > 11
value = 3710
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Rokudou no Tsuji"
trigger1 = time > 11
value = 3510
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Ashura Ichibugin"
trigger1 = time > 11
value = 3100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Kokujou Tatsumaki"
trigger1 = time > 11
value = 3200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Rengoku Onigiri"
trigger1 = time > 11
value = 3410
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Shi-Shishi Sonson"
trigger1 = time > 11
value = 3600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2000
trigger1 = command = "Hiryuu Kaen"
trigger1 = time > 11
value = 3310
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Dai Butsu Giri"
trigger1 = time > 11
value = 1900
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Ushi Bari"
trigger1 = time > 11
value = 1600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Hyou Kin Dama" 
trigger1 = time > 11
value = 1800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Nigori Zake" 
trigger1 = time > 11
value = 1300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 2000 
trigger1 = command = "1080 Pound Hou"
trigger1 = time > 11
value = 2400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Ultra Tora Gari" 
trigger1 = time > 11
value = 2300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500
trigger1 = command = "Tatsumaki"
trigger1 = time > 11
value = 2000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command =  "108 Pound Hou"
trigger1 = time > 11
value = 1150
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 1000
trigger1 = command = "onigiri"
trigger1 = time > 11
value = 1700
ctrl = 0

[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Nigiri Combo"
trigger1 = time > 11
value = 1400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500 
trigger1 = command = "72 Pound Hou"
trigger1 = time > 11
value = 1140
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 800
trigger1 = command = "Rashoumon"
trigger1 = time > 11
value = 1500
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "360 Pound Hou"
trigger1 = time > 11
value = 1100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 500
trigger1 = command = "Shishi Sonson"
trigger1 = time > 11
value = 1200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 300 
trigger1 = command = "Yakkoudori"
trigger1 = time > 11
value = 1000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Yasha Karasu"
trigger1 = time > 11
value = 2202
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Gazami Dori"
trigger1 = time > 11
value = 2100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel  
trigger1 = command = "Maguma"
trigger1 = time > 11
value = 214
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Needle"
trigger1 = time > 11
value = 205
ctrl = 0
[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 11
value = 263
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "a"
trigger1 = time > 11
value = 200
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "b"
trigger1 = time > 11
value = 210
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "x"
trigger1 = time > 11
value = 225
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "c"
trigger1 = time > 11
value = 222
ctrl = 0


[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = !movehit && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 13
value = 263
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "a"
trigger1 = time > 13
value = 200
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "b"
trigger1 = time > 13
value = 210
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "c"
trigger1 = time > 13
value = 222
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "x"
trigger1 = time > 13
value = 225
ctrl = 0

;....................................

[State 600, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 221
ctrl = 0


;===============================================================================
[Statedef 221, C end]
type    = S
movetype= I
physics = S
velset = 0,0
ctrl = 0
anim = 221
sprpriority = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S3,33

[State 204, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;===============================================================================
[Statedef 222, CC]
type    = S
movetype = A
physics = S
poweradd = 0
ctrl = 0
velset = 0,0
anim = 300
sprpriority = 2


[State 230, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = animelem = 2 
attr = S, NA
animtype  = medium;hard
damage    = 20,4
getpower = 7,3
guardflag = MA
pausetime = 5,7
sparkno = -1;s6000
guard.sparkno = -1; s7000
sparkxy = -25,-25
hitsound   = S3,22
guardsound = S3,25
ground.type = low
ground.slidetime = 100
ground.hittime  = 20
ground.velocity = -3,0
air.velocity = -3,0
fall = 0

envshake.time = 15
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-35
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.6,0.6
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8102) = 0
trigger1 = Movehit = 1 && p2movetype=H
helpertype = normal
name = "HitSpark"
ID = 8102
stateno =ifelse(random>500,8102,8002)
pos = 50-10+random%20, 0-30+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6


[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 0,-Random%EnemyNear,Const(size.height);6,-29
postype = p2
facing = IfElse(Random <= 499,1,-1);1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .7,.7
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 2
anim = 810
ID = 810
pos = 7,28
postype = p1
bindtime = -1
removetime = -2
scale = .6,.6
sprpriority = 4
ownpal = 1
supermovetime =9999
pausemovetime =9999

[State 0, VelSet]
type = VelSet
trigger1 = animelem=  1
x = 6
y = 0

[State 210, 2]
type = PlaySnd
trigger1 = Time = 0
value = S3,20

;.....................................
;--------------combo------------------
;.....................................
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000  && life < 300
trigger1 = command = "Ashura Makyuusen"
trigger1 = time > 8
value = 3800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000
trigger1 = command = "Daisen Sekai"
trigger1 = time > 8
value = 3000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3500
trigger1 = command = "Daishinkan"
trigger1 = time > 8
value = 3710
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Rokudou no Tsuji"
trigger1 = time > 8
value = 3510
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Ashura Ichibugin"
trigger1 = time > 8
value = 3100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Kokujou Tatsumaki"
trigger1 = time > 8 
value = 3200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Rengoku Onigiri"
trigger1 = time > 8 
value = 3410
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Shi-Shishi Sonson"
trigger1 = time > 8 
value = 3600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2000
trigger1 = command = "Hiryuu Kaen"
trigger1 = time > 8
value = 3310
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Dai Butsu Giri"
trigger1 = time > 8
value = 1900
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Ushi Bari"
trigger1 = time >8
value = 1600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Hyou Kin Dama" 
trigger1 = time > 8
value = 1800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Nigori Zake" 
trigger1 = time > 8
value = 1300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 2000 
trigger1 = command = "1080 Pound Hou"
trigger1 = time > 8
value = 2400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Ultra Tora Gari" 
trigger1 = time > 8
value = 2300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500
trigger1 = command = "Tatsumaki"
trigger1 = time > 8
value = 2000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command =  "108 Pound Hou"
trigger1 = time > 8
value = 1150
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 1000
trigger1 = command = "onigiri"
trigger1 = time > 8
value = 1700
ctrl = 0

[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Nigiri Combo"
trigger1 = time > 8
value = 1400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500 
trigger1 = command = "72 Pound Hou"
trigger1 = time > 8
value = 1140
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 800
trigger1 = command = "Rashoumon"
trigger1 = time > 8
value = 1500
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "360 Pound Hou"
trigger1 = time > 8
value = 1100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 500
trigger1 = command = "Shishi Sonson"
trigger1 = time > 8
value = 1200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 300 
trigger1 = command = "Yakkoudori"
trigger1 = time > 8
value = 1000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Yasha Karasu"
trigger1 = time > 8
value = 2202
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Gazami Dori"
trigger1 = time > 8
value = 2100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel  
trigger1 = command = "Maguma"
trigger1 = time > 8
value = 214
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Needle"
trigger1 = time > 8
value = 205
ctrl = 0
[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = (movehit||moveguarded)&& !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 8
value = 263
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "a"
trigger1 = time > 8
value = 200
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "b"
trigger1 = time > 8
value = 210
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "c"
trigger1 = time > 8
value = 223
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "x"
trigger1 = time > 8
value = 225
ctrl = 0


[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = !movehit && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 10
value = 263
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "a"
trigger1 = time > 10
value = 200
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "b"
trigger1 = time > 10
value = 210
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "c"
trigger1 = time > 10
value = 223
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "x"
trigger1 = time > 10
value = 225
ctrl = 0

;......................................

[State 600, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 221
ctrl = 0

;===============================================================================
;===============================================================================
[Statedef 223, CCC]
type    = S
movetype = A
physics = S
poweradd = 0
ctrl = 0
velset = 0,0
anim = 301
sprpriority = 2


[State 230, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = animelem = 4 || animelem = 5
attr = S, NA
animtype  = hard
damage    = 25,2;5
getpower = 7,3
guardflag = MA
pausetime = 5,7
sparkno = -1;s6000
guard.sparkno = -1; s7000
sparkxy = -25,-25
hitsound   = S3,22
guardsound = S3,25
ground.type = high
ground.slidetime = 20
ground.hittime  = 20
ground.velocity = -3,0
air.velocity = -3,0
envshake.freq = 15
envshake.time = 30
fall = 0

envshake.time = 15
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numexplod(8200) = 0
trigger1 = moveguarded=1 && numenemy
helpertype =normal
name = "sparkGuard"
ID = 8200
stateno = ifelse(random>500,8200,8201)
pos = 20,-35
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
persistent =0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8107) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8107
stateno =ifelse(random>500,8107,8007)
pos = 50, -24
postype = p1
facing = 1
ownpal = 1
supermovetime =9999
pausemovetime =9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6

[State 0, Helper]
type = Helper
triggerall = Numhelper(8102) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8102
stateno =ifelse(random>500,8102,8002)
pos = 50, -24
postype = p1
facing = 1
ownpal = 1
supermovetime =9999
pausemovetime =9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 0,-Random%EnemyNear,Const(size.height);6,-33
postype = p2
facing = IfElse(Random <= 499,1,-1);1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .7,.7
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 4
anim = 808
ID = 808
pos = 90,-30
vfacing=-1
postype = p1
bindtime = -1
removetime =-2
scale = .5,.7
sprpriority = 4
ownpal = 1
pausemovetime=9999
supermovetime = 9999

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 4
anim = 808
ID = 808
pos =  -85,-30
facing=-1
vfacing=-1
postype = p1
bindtime = -1
removetime =-2
scale = .5,.7
sprpriority = 4
ownpal = 1
pausemovetime=9999
supermovetime = 9999

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 5
anim = 808
ID = 808
pos = 80,-51
vfacing=-1
postype = p1
bindtime = -1
removetime =-2
scale = .5,1
sprpriority = 4
ownpal = 1
pausemovetime=9999
supermovetime = 9999

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 5
anim = 808
ID = 808
pos =  -75,-51
facing=-1
vfacing=-1
postype = p1
bindtime = -1
removetime =-2
scale = .5,1
sprpriority = 4
ownpal = 1
pausemovetime=9999
supermovetime = 9999

[State 210, 2]
type = PlaySnd
trigger1 = Time = 0
value = S3,20



;.....................................
;--------------combo------------------
;.....................................
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000  && life < 300
trigger1 = command = "Ashura Makyuusen"
trigger1 = time > 9	
value = 3800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=4000
trigger1 = command = "Daisen Sekai"
trigger1 = time > 9
value = 3000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3500
trigger1 = command = "Daishinkan"
trigger1 = time > 9
value = 3710
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Rokudou no Tsuji"
trigger1 = time > 9
value = 3510
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=3000
trigger1 = command = "Ashura Ichibugin"
trigger1 = time > 9
value = 3100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Kokujou Tatsumaki"
trigger1 = time > 9 
value = 3200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Rengoku Onigiri"
trigger1 = time > 9 
value = 3410
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Shi-Shishi Sonson"
trigger1 = time > 9
value = 3600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2000
trigger1 = command = "Hiryuu Kaen"
trigger1 = time > 9
value = 3310
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Dai Butsu Giri"
trigger1 = time > 9
value = 1900
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Ushi Bari"
trigger1 = time > 9
value = 1600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Hyou Kin Dama" 
trigger1 = time > 9
value = 1800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Nigori Zake" 
trigger1 = time > 9
value = 1300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 2000 
trigger1 = command = "1080 Pound Hou"
trigger1 = time > 9
value = 2400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Ultra Tora Gari" 
trigger1 = time > 9
value = 2300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500
trigger1 = command = "Tatsumaki"
trigger1 = time > 9
value = 2000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command =  "108 Pound Hou"
trigger1 = time > 9
value = 1150
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 1000
trigger1 = command = "onigiri"
trigger1 = time > 9
value = 1700
ctrl = 0

[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Nigiri Combo"
trigger1 = time > 9
value = 1400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500 
trigger1 = command = "72 Pound Hou"
trigger1 = time > 9
value = 1140
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 800
trigger1 = command = "Rashoumon"
trigger1 = time > 9
value = 1500
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "360 Pound Hou"
trigger1 = time > 9
value = 1100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 500
trigger1 = command = "Shishi Sonson"
trigger1 = time > 9
value = 1200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 300 
trigger1 = command = "Yakkoudori"
trigger1 = time > 9
value = 1000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Yasha Karasu"
trigger1 = time > 9
value = 2202
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Gazami Dori"
trigger1 = time > 9
value = 2100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel  
trigger1 = command = "Maguma"
trigger1 = time > 9
value = 214
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Needle"
trigger1 = time > 9
value = 205
ctrl = 0
[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 9
value = 263
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "a"
trigger1 = time > 9
value = 200
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "b"
trigger1 = time > 9
value = 210
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "x"
trigger1 = time > 9
value = 225
ctrl = 0



[State Change]
type = ChangeState
triggerall = var(20) = 0
triggerall = !movehit && !AILevel
trigger1 = command = "ashuraHit"
trigger1 = time > 11
value = 263
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "a"
trigger1 = time > 11
value = 200
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "b"
trigger1 = time > 11
value = 210
ctrl = 0
[State Change]
type = ChangeState
triggerall = !movehit && !AILevel
trigger1 = command = "x"
trigger1 = time > 11
value = 225
ctrl = 0

;......................................

[State 600, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 221
ctrl = 0


;==================================================
[Statedef 224, X start]
type    = S
movetype= I
physics = S
velset = 0,0
ctrl = 0
anim = 302
sprpriority = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S3,31

[State 204, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 225
ctrl = 0

;==================================================
[Statedef 225, X]
type    = S
movetype = A
physics = S
juggle  = 10
poweradd = 0
ctrl = 0
velset = 0,0
anim = 222
sprpriority = 2

[State 0, VelSet]
type = VelSet
trigger1 =time=[8,15]
x = 5

[State 0, VelSet]
type = VelSet
trigger1 =animelem=5
y = -8

[State -3, Helper]
type = Helper
trigger1 = time = 8
helpertype = normal
name = "floor I"
ID = 5633
stateno = 5633
pos = 5,-3
postype = p1
facing = 1
ownpal = 1
supermovetime =9999
pausemovetime =9999
ignorehitpause =1
persistent=0

size.xscale = .6
size.yscale = .6

[State 230, 1]
type = HitDef
triggerall = hitcount < 6
trigger1 = movehit=0
trigger2 = movehit>1
attr = S, NA
animtype  = up;hard
damage    = 4,1
getpower = 7,3
priority = 5, Hit
guardflag = MA
pausetime = 6,7
guard.pausetime=2,2
sparkno = -1;S6111
guard.sparkno = -1;s7000
sparkxy = 0,-30
hitsound   = S3,21
guardsound = S3,25
ground.type = low
ground.slidetime = 30
guard.slidetime = 1
ground.hittime = 15
guard.hittime = 1
air.hittime = 30
fall = 1
ground.velocity = 0,-8.5
air.velocity =-1,-8.5
airguard.velocity = -1.9,-5
air.type = high

envshake.time = 15
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-35
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.5,0.5
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 1
persistent = 1

[State 0, Helper]
type = Helper
;triggerall = Numhelper(8101) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8001;8101
stateno =ifelse(random>500,8101,8001)
pos = 5-10+random%20, -40-20+random%20
postype = p2
facing = 1
ownpal = 1
pausemovetime=9999
supermovetime = 9999
ignorehitpause=1
size.xscale = IfElse(Random < 500,.65,.85)
size.yscale = IfElse(Random < 500,.65,.85)

[State 200, Spark blood]
type = Explod
trigger1 = movehit  && p2movetype=H
trigger1 = target,time=0
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 5-10+random%20, -40-20+random%20
postype = p2
facing = IfElse(Random <= 499,1,-1);1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = IfElse(Random <= 499,.5,.6),IfElse(Random <= 499,.5,.6)
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1
;persistent = 0

[State 200, viento]
type = Explod
trigger1 = animelem = 4
anim = 7119
ID = 7119
postype = P1
pos = 10,-10
facing = 1
sprpriority = 4
removetime = -2
bindtime = -1
ownpal = 1
scale = .7,.7
removeongethit = 1
ontop = 0
supermovetime = 0;9999
pausemovetime = 0;9999
ignorehitpause  = 1


[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 6
statetype = A       ;S,A,C,L
movetype = A        ;I,A,H
physics = A         ;A,C,S,N


[State 300]
type = RemoveExplod
id = 7119
trigger1 = animelem=10

[State 210, 2]
type = PlaySnd
trigger1 = Time = 0
value = S4,4
channel=0

[State 210, 2]
type = PlaySnd
trigger1 = Time = 0
value = S2,2

[State 210, 2]
type = PlaySnd
trigger1 = Time = 21
value = S3,20

[State Change]
type = ChangeState
triggerall= movehit && !AIlevel
trigger1 = command = "x" && Time >= 25
value = 255
ctrl = 0

[State Change]
type = ChangeState
triggerall= movehit && !AIlevel
trigger1 = command = "c" && Time >= 25
value = 250
ctrl = 0

[State Change]
type = ChangeState
triggerall= movehit && !AIlevel
trigger1 =  command = "z" && Time >= 25
value = 280
ctrl = 0

[State Change]
type = ChangeState
triggerall= movehit && !AIlevel
trigger1 =  command = "y" && Time >= 25
value = 270
ctrl = 0

[State 600, End]
type = ChangeState
trigger1 =animtime=0
value = 251
ctrl = 0



;-------------------------------------------------------------------------------
[Statedef 230, A air]
type    = A
movetype= A
physics = A
juggle  = 2
poweradd = 0
ctrl = 0
anim = 230
sprpriority = 2

;--------dash---------------
[State 40, Velocity]
type = VelSet
trigger1 = prevstateno = 108 
x = const(velocity.jump.fwd.x)

[State 40, Velocity]
type = VelSet
trigger1 = prevstateno = 109
x = const(velocity.jump.back.x)

[State 40, VelMul]
type = VelMul
trigger1 = prevstateno = 108 || prevstateno = 109
x = 1
;-----------------------

[State 600, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = AnimElem = 1 || AnimElem = 2
animtype  = light
attr = A, NA
damage = 15,1;3
getpower = 30,15
guardflag = HA
priority = 3
pausetime = 6,8
sparkno = -1;s6000
guard.sparkno = -1;s7000
sparkxy = -15,-35
hitsound = S3,2
guardsound = S3,4
ground.type = High
ground.slidetime = 5
ground.hittime  = 5
ground.velocity = -3.5
air.velocity = -3.3,-3.5

envshake.time = 15
envshake.ampl = 5
envshake.freq = 110
envshake.phase = 110

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 =moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-30
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.35,0.35
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8101) = 0
trigger1 = Movehit = 1 && p2movetype=H
helpertype = normal
name = "HitSpark"
ID = 8101
stateno =ifelse(random>500,8101,8001)
pos = 40-10+random%20, 0-15+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .45
size.yscale = .45


[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 6,-33
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .6,.6
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 2
anim = 801
ID = 801
pos = -10,-28
postype = p1
bindtime = -1
removetime =-2
scale = .9,.7
sprpriority = 4
ownpal = 1
pausemovetime=9999
supermovetime = 9999

[State 600, 2]
type = PlaySnd
trigger1 = Time = 0
value = S3,0

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y >= 0
value = 0
ctrl = 1

[State 600, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 231
ctrl = 0
;-------------------------------------------------------------------------------
[Statedef 231, A air off]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 231
sprpriority = 2

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y >= 0
value = 0
ctrl = 1

[State 204, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
;ctrl = 1


;===============================================================================
[Statedef 240, B air]
type    = A
movetype= A
physics = A
juggle  = 2
poweradd = 0
ctrl = 0
anim = 240
sprpriority = 2

;--------dash---------------
[State 40, Velocity]
type = VelSet
trigger1 = prevstateno = 108 
x = const(velocity.jump.fwd.x)

[State 40, Velocity]
type = VelSet
trigger1 = prevstateno = 109
x = const(velocity.jump.back.x)

[State 40, VelMul]
type = VelMul
trigger1 = prevstateno = 108 || prevstateno = 109
x = 1
;-----------------------

[State 1330, 1]
type = HitDef
Triggerall = hitcount < 1
trigger1 = AnimElem = 4 || AnimElem = 5
attr = A, NA
animtype  = medium
damage    = 20,2;4
getpower = 30,15
guardflag = MA
pausetime = 9,8
sparkno = -1
guard.sparkno = -1;s7000
sparkxy = 0,-40
hitsound   = S3,21
guardsound = S3,6
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -6,6
air.velocity = -6,6
fall = 1

envshake.time = 15
envshake.ampl = 5
envshake.freq = 115
envshake.phase = 115

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-30
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.45,0.45
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8101) = 0
trigger1 = Movehit = 1 && p2movetype=H
helpertype = normal
name = "HitSpark"
ID = 8101
stateno =ifelse(random>500,8101,8001)
pos = 40-10+random%20, 0-5+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .45
size.yscale = .45

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 6,-33
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .65,.65
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 4
anim = 806
ID = 806
pos = 10,-35
postype = p1
bindtime = -1
removetime =-2
scale = .4,.41
sprpriority = 4
ownpal = 1
pausemovetime=9999
supermovetime = 9999

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 4
anim = 806
ID = 806
pos = 18,-30
postype = p1
bindtime = -1
removetime =-2
scale = .4,.41
sprpriority = 4
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 1330, PlaySnd]
type = PlaySnd
trigger1 = time = 4
value = S4,0
channel=0

[State 1330, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = S3,10

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y >= 0
value = 0
ctrl = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 241
ctrl = 0
;-------------------------------------------------------------------------------
[Statedef 241, B air off]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 241
sprpriority = 2

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y >= 0
value = 0
ctrl = 1

[State 204, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
;ctrl = 1
;===============================================================================

[Statedef 250, C air]
type    = A
movetype= A
physics = A
juggle  = 4
poweradd = 0
ctrl = 0
anim = 250
sprpriority = 2

;--------dash---------------
[State 40, Velocity]
type = VelSet
trigger1 = prevstateno = 108 
x = const(velocity.jump.fwd.x)

[State 40, Velocity]
type = VelSet
trigger1 = prevstateno = 109
x = const(velocity.jump.back.x)

[State 40, VelMul]
type = VelMul
trigger1 = prevstateno = 108 || prevstateno = 109
x = 1
;-----------------------

[State 630, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = AnimElem = 5 || AnimElem = 6
attr = A, NA
animtype  = hard
damage = 25, 2;5
getpower = 30,15
guardflag = HA
priority = 3
pausetime = 6,15
sparkno = -1;s6000
guard.sparkno = -1;s7000
sparkxy = -20,-10
hitsound   = S3,22
guardsound = S3,25
ground.type = High
ground.slidetime = 6
ground.hittime  = 6
ground.velocity = -4
air.velocity = -1,-9
fall = 1

envshake.time = 15
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numexplod(8200) = 0
trigger1 = moveguarded=1 && numenemy
helpertype =normal
name = "sparkGuard"
ID = 8200
stateno = ifelse(random>500,8200,8201)
pos = 20,-30
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
persistent =0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8102) = 0
trigger1 = Movehit = 1 && p2movetype=H
helpertype = normal
name = "HitSpark"
ID = 8102
stateno =ifelse(random>500,8102,8002)
pos = 60-10+random%20, 0-42+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 6,-33
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .7,.7
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0
; 
[State 0, Corte FX]
type = Explod
trigger1 = animelem = 5
anim = 808
ID = 808
pos = 90,-22
vfacing=-1
postype = p1
bindtime = -1
removetime =-2
scale = .5,.7
sprpriority = 4
ownpal = 1
pausemovetime=9999
supermovetime = 9999

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 5
anim = 808
ID = 808
pos =  -90,-22
facing=-1
vfacing=-1
postype = p1
bindtime = -1
removetime =-2
scale = .5,.7
sprpriority = 4
ownpal = 1
pausemovetime=9999
supermovetime = 9999

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 6
anim = 808
ID = 808
pos = 80,-43
vfacing=-1
postype = p1
bindtime = -1
removetime =-2
scale = .5,1
sprpriority = 4
ownpal = 1
pausemovetime=9999
supermovetime = 9999

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 6
anim = 808
ID = 808
pos =  -80,-43
facing=-1
vfacing=-1
postype = p1
bindtime = -1
removetime =-2
scale = .5,1
sprpriority = 4
ownpal = 1
pausemovetime=9999
supermovetime = 9999

[State 210, 2]
type = PlaySnd
trigger1 = Time = 15
value = S3,20

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y >= 0
value = 0
ctrl = 1

[State 630, End]
type = ChangeState
trigger1 = ANIMTime = 0
value = 251
ctrl = 0

;===============================================================================
[Statedef 251, C air off]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 251
sprpriority = 2

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y >= 0
value = 0
ctrl = 1

[State 204, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
;ctrl = 1
;===============================================================================

[Statedef 255, X air ]
type    = A
movetype= A
physics = A
juggle  = 2
ctrl = 0
anim = 224
sprpriority = 2
poweradd=0

;--------dash---------------
[State 40, Velocity]
type = VelSet
trigger1 = prevstateno = 108 
x = const(velocity.jump.fwd.x)

[State 40, Velocity]
type = VelSet
trigger1 = prevstateno = 109
x = const(velocity.jump.back.x)

[State 40, VelMul]
type = VelMul
trigger1 = prevstateno = 108 || prevstateno = 109
x = 1
;-----------------------

[State 230, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = animelem = 6 || animelem = 7
attr = A, NA
animtype  = hard
damage    = 25,2;5
getpower = 30,15
guardflag = MA
pausetime = 10,12
sparkno = -1;s6000
guard.sparkno = -1;s7000
sparkxy = -25,-25
hitsound   = S3,22
guardsound = S3,25
ground.type = high
ground.slidetime = 100
ground.hittime  = 20
ground.velocity = -2,-2
air.velocity = -2,-1.5
fall = 1
p2stateno=5604

envshake.time = 15
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numexplod(8200) = 0
trigger1 = moveguarded=1 && numenemy
helpertype =normal
name = "sparkGuard"
ID = 8200
stateno = ifelse(random>500,8200,8201)
pos = 20,-30
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
persistent =0


[State 0, Helper]
type = Helper
triggerall = Numhelper(8107) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8107
stateno =ifelse(random>500,8107,8007)
pos = 80, -40
postype = p1
facing = 1
ownpal = 1
supermovetime =9999
pausemovetime =9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6

[State 0, Helper]
type = Helper
triggerall = Numhelper(8102) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8102
stateno =ifelse(random>500,8102,8002)
pos = 80, -40
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 6,-33
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .7,.7
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 6
anim = 801
ID = 801
pos = 43,-25
postype = p1
bindtime = -1
removetime =-2
scale = .7,.4
sprpriority = 4
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 6
anim = 801
ID = 801
pos = 25,-18
postype = p1
bindtime = -1
removetime =-2
scale = .7,.35
sprpriority = 4
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 6
anim = 801
ID = 801
pos = 13,-23
postype = p1
bindtime = -1
removetime =-2
scale = .6,.25
sprpriority = 4
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 211, 2]
type = PlaySnd
trigger1 = animelem=1
value = S4,1
channel=0

[State 210, 2]
type = PlaySnd
trigger1 = Time = 0
value = S3,20

[State 262, VelSet]
type = VelSet
trigger1 = Animelemno(0)<=6
x = 0
y = 0

[State 262, Type]
type = StateTypeSet
trigger1 = animelemtime(10) >= 0
movetype = I

[State 262, 1]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

[State 600, End]
type = ChangeState
trigger1 = animtime=0
value = 251
ctrl = 0


;------------------------------------------------------
[Statedef 270, Y air]
type    = A
movetype= A
physics = A
poweradd = 0
ctrl = 0
anim = 270
sprpriority = 2

;--------dash---------------
[State 40, Velocity]
type = VelSet
trigger1 = prevstateno = 108 
x = const(velocity.jump.fwd.x)

[State 40, Velocity]
type = VelSet
trigger1 = prevstateno = 109
x = const(velocity.jump.back.x)

[State 40, VelMul]
type = VelMul
trigger1 = prevstateno = 108 || prevstateno = 109
x = 1
;-----------------------

[State 630, 1]
type = HitDef
triggerall = hitcount < 7
trigger1 = movehit=0
trigger2 = movehit>1
attr = A, NA
animtype  = medium
damage = 2,0
getpower = 15,7
guardflag = HA
priority = 3
pausetime = ifelse(hitcount < 2,7,ifelse(hitcount < 5,4,0)),ifelse(hitcount < 2,7,ifelse(hitcount < 5,4,0));5,7
guard.pausetime = 2,2
sparkno = -1;s6000
guard.sparkno = -1;s7000
sparkxy = -20,-10
hitsound = S3,21
guardsound = S3,25
ground.type = low
ground.slidetime = 0
ground.hittime  = 6
ground.velocity = 0
air.velocity = 3,-1
fall = 1
kill = 0
envshake.freq = ifelse(hitcount < 2,30,ifelse(hitcount < 5,40,70))
envshake.time = 15

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = movehit = 1
time = 1
pos = 5;,0

[State 0, PosAdd]
type = PosAdd
trigger1 = 1
x =  ifelse(movehit,5,0)
y = ifelse(movehit,-8,0)

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 = moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-30
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.4,0.4
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1



[State 0, Helper]
type = Helper
;triggerall = Numhelper(8101) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8001;8101
stateno =ifelse(random>500,8101,8001)
pos = 5-10+random%20, -35-10+random%20
postype = p2
facing = 1
ownpal = 1
pausemovetime=9999
supermovetime = 9999
ignorehitpause=1
size.xscale = IfElse(Random < 500,.65,.85)
size.yscale = IfElse(Random < 500,.65,.85)

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
trigger1 = target,time=0
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 5-10+random%20, -30-10+random%20
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .7,.7
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem=2
x = 5
y = -3

[State 200, viento]
type = Explod
trigger1 = animelem = 1
anim = 7119
ID = 71119
postype = P1
pos =15,-10
facing = -1
sprpriority = 4
removetime = -2
bindtime = -1
ownpal = 1
scale = .6,.6
removeongethit = 1
ontop = 0
supermovetime = 0;9999
pausemovetime = 0;9999
ignorehitpause  = 1


[State 0, PlaySnd]
type = PlaySnd
triggerall = time > 0
trigger1 = time%6 = 0
value = S1,0

[State 0, PlaySnd]
type = PlaySnd
triggerall = time > 0
trigger1 = time%6 = 0
value = S3,0

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y >= 0
value = 0
ctrl = 1

[State 630, End]
type = ChangeState
triggerall=!movehit
trigger1 = ANIMTime = 0
value = 251
ctrl = 0

[State 630, remate]
type = ChangeState
triggerall=movehit
trigger1 = ANIMTime = 0
value = 271
ctrl = 0

;-------------------------------------------------------------------------------
[Statedef 271, Y air remate]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 271
sprpriority = 2

[State 1330, 1]
type = HitDef
Triggerall = hitcount < 1
trigger1 = AnimElem = 2
attr = A, NA
animtype  = hard
damage    = 10
getpower = 15,7
pausetime = 20,20
sparkno = -1
guard.sparkno = -1;s7000
sparkxy = 0,-40
hitsound   = S3,22
guardsound = S3,25
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -6,6
air.velocity = -10,12
fall = 1
fall.xvelocity = -2
fall.yvelocity = -5
yaccel =9
down.bounce =1
fall.damage = 5
p2stateNo=5640

envshake.time = 15
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, PosFreeze]
type = PosFreeze
trigger1 =  movehit=1
value = 1


[State 0, Helper]
type = Helper
triggerall = Numhelper(8107) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8107
stateno =ifelse(random>500,8107,8007)
pos = 35,-40
postype = p1
facing = 1
ownpal = 1
supermovetime =9999
pausemovetime =9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6

[State 0, Helper]
type = Helper
triggerall = Numhelper(8102) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8102
stateno =ifelse(random>500,8102,8002)
pos = 35,-40
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 6,-33
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .7,.7
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 2
anim = 810
ID = 810
pos = 16,-15
postype = p1
bindtime = -1
removetime =-2
scale = .6,.6
sprpriority = 4
ownpal = 1
pausemovetime=9999
supermovetime = 9999

[State 262, 1]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

[State 630, End]
type = ChangeState
trigger1 = ANIMTime = 0
value =50
;ctrl = 1

;-------------------------------------------------------------------------------
[Statedef 280, Z air]
type    = A
movetype= A
physics = A
juggle  = 2
poweradd = 0
ctrl = 0
anim = 280
sprpriority = 2

;--------dash---------------
[State 40, Velocity]
type = VelSet
trigger1 = prevstateno = 108 
x = const(velocity.jump.fwd.x)

[State 40, Velocity]
type = VelSet
trigger1 = prevstateno = 109
x = const(velocity.jump.back.x)

[State 40, VelMul]
type = VelMul
trigger1 = prevstateno = 108 || prevstateno = 109
x = 1
;-----------------------

[State 1330, 1]
type = HitDef
Triggerall = hitcount < 1
trigger1 = AnimElem = 3 ||  AnimElem = 4
attr = A, NA
animtype  = hard
damage    = 25,2;5
getpower = 30,15
guardflag = MA
pausetime = 20,20
guard.pausetime=5,5
sparkno = -1
guard.sparkno = -1;s7000
sparkxy = 0,-40
hitsound   = S3,22
guardsound = S3,25
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -6,6
air.velocity = -10,15
fall = 1
fall.xvelocity = -2
fall.yvelocity = -5
down.bounce =1
p2stateNo=5640

envshake.time = 15
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numexplod(8200) = 0
trigger1 = moveguarded=1 && numenemy
helpertype =normal
name = "sparkGuard"
ID = 8200
stateno = ifelse(random>500,8200,8201)
pos = 20,-30
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
persistent =0


[State 0, Helper]
type = Helper
triggerall = Numhelper(8107) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8107
stateno =ifelse(random>500,8107,8007)
pos = 35,-40
postype = p1
facing = 1
ownpal = 1
supermovetime =9999
pausemovetime =9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6

[State 0, Helper]
type = Helper
triggerall = Numhelper(8102) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8102
stateno =ifelse(random>500,8102,8002)
pos = 35,-40
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .7
size.yscale = .7

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 6,-33
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,4,5)
removetime = -2
bindtime = -1
ownpal = 1
scale = .7,.7
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 3
anim = 803
ID = 803
pos = 3,-55
postype = p1
bindtime = -1
removetime =-2
scale = .8,.9
sprpriority = 4
ownpal = 1
pausemovetime=9999
supermovetime = 9999

[State 0, PosFreeze]
type = PosFreeze
trigger1 =  movehit=1
value = 1

[State 210, 2]
type = PlaySnd
trigger1 = animelem=3
value = S3,20

[State 210, 2]
type = PlaySnd
trigger1 = Time = 0
value = S4, 3
channel=0

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y >= 0
value = 0
ctrl = 1

[State 630, End]
type = ChangeState
trigger1 = ANIMTime = 0
value =251
ctrl = 0
;---------------------------------------------------------------

;=================================================================
[Statedef 285, C+X air]
type = A
movetype = A
physics = A
juggle = 1
poweradd = 20
ctrl = 0
velset = 0,0
anim = 285

;--------dash---------------
[State 40, Velocity]
type = VelSet
trigger1 = prevstateno = 108 
x = const(velocity.jump.fwd.x)

[State 40, Velocity]
type = VelSet
trigger1 = prevstateno = 109
x = const(velocity.jump.back.x)

[State 40, VelMul]
type = VelMul
trigger1 = prevstateno = 108 || prevstateno = 109
x = 1
;-----------------------

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[state 0,afterimage]
type=afterimage
trigger1=!time
time=23
length=9
palbright=0,0,0
palcontrast=0,0,255
palpostbright=0,0,0
paladd=0,0,0
palmul=0.5,0.5,0.5
timegap=1
trans=add


[State 0, VelSet]
type = VelSet
trigger1 = Time >4 && Time < 15 && Time%3=0
y = vel y-2.4

[State 0, HitDef]
type = HitDef
trigger1 = Time%2=0
attr = S, NA
damage = Ceil(FVar(0):=5),Ceil(Fvar(0)/3.0)
getpower = 15,7
animtype = Light
guardflag = MA
hitflag = MAFD
priority = 5, Hit
pausetime = 0,2
sparkno = -1
guard.sparkno = -1
hitsound   = S3,21
guardsound = S3,13
ground.type = High
ground.slidetime = 12
ground.hittime = 25
ground.velocity = -5,5
airguard.velocity = -4,5
air.type = High
air.velocity = -3,5
air.hittime = 25
envshake.time = 10
envshake.freq = 30
envshake.ampl = -1
envshake.phase = 20
Fall = 1

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 =moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,-30
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.35,0.35
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 1
persistent = 0


[State 0, Helper spark]
type = Helper
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8001;8101
stateno =IfElse(Random <= 499,8001,8101)
pos = 5-10+random%20, -30-10+random%20
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = IfElse(Random <= 499,.3,.5)
size.yscale = IfElse(Random <= 499,.3,.5)

[State 200, Spark blood]
type = Explod
trigger1 = movehit  && p2movetype=H
trigger1 = target,time=0
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 5-Random%11,-Random%EnemyNear,Const(size.height);5-20+random%20, 10-45+random%20
postype = p2
facing = Cond(Random<500,1,-1);1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = IfElse(Random <= 499,.5,.6),IfElse(Random <= 499,.5,.6)
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1

[State 0, Helper]
type = Helper
trigger1 = Time > 11 && Time < 25 && Time%2=0
helpertype = normal
name = "helper cortes"
ID = 286
stateno = 286
pos = 5-Random%11,Random%Const(size.height)/2
postype = p1
ownpal = 1

[State 0, Helper]
type = Helper
trigger1 = Time > 11 && Time < 25 && Time%2=0
helpertype = normal
name = "helper attack"
ID = 287
stateno =287
pos = 5-Random%11,Random%Const(size.height)/2
postype = p1
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = S4,1
channel=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 4 || Animelem = 5 || Animelem = 6 || Animelem = 7 || Animelem = 8 || Animelem = 9
value = S3,15

[State 0, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 50
ctrl = 1

;------------------------------------------------------------------
[Statedef 286, ---helper cortes]
type = A
movetype = I
physics = N
ctrl = 0
sprpriority = 5

[State 0, VarRandom]
type = VarRandom
trigger1 = !Time
v = 0
range = -30,30

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
Value = Var(0)
Scale = 0.2-((Time/5.0)*0.2) ,0.1+((Time/5.0)*0.2)

[State 0, VelSet]
type = VelSet
trigger1 = 1
x = Var(0)/5
y = Var(0)/5*Cond(Var(0)<0,-1,1)

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = Anim !=6013
value = 6013

[State 0, EnvShake]
type = EnvShake
trigger1 = !Time
time = 3
freq = 75
ampl = -2
phase = 90

[State 0, Trans]
Type=Trans
Trigger1=1
Trans=AddAlpha
Alpha=Ceil(256.0-((Time/5.0)*256.0)),256

[State 0, DestroySelf]
type = DestroySelf
trigger1 = Time = 5

;--------------------------------------------------------

;------------------------------------------------------------------
[Statedef 287, ---helper attack]
type = A
movetype = A
physics = N
ctrl = 0
sprpriority = 5

[State 0, VarRandom]
type = VarRandom
trigger1 = !Time
v = 0
range = -30,30

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
Value =Var(0)
Scale = 0.2-((Time/5.0)*0.2) ,0.1+((Time/5.0)*0.2)

[State 0, VelSet]
type = VelSet
trigger1 = 1
x = Var(0)/3
y = 40;Var(0)/5*Cond(Var(0)<0,-1,1)

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = Anim !=287
value = 287

[State 0, HitDef]
type = HitDef
trigger1 = Time%2=0
attr = S, NA
damage = Ceil(FVar(0):=5),Ceil(Fvar(0)/3.0)
getpower = 15,7
animtype = Light
guardflag = MA
hitflag = MAFD
priority = 5, Hit
pausetime = 0,2
sparkno = -1
guard.sparkno = -1
hitsound   = S3,21
guardsound = S3,13
ground.type = High
ground.slidetime = 12
ground.hittime = 25
ground.velocity = -5,5
airguard.velocity = -4,5
air.type = High
air.velocity = -3,5
air.hittime = 25
envshake.time = 10
envshake.freq = 30
envshake.ampl = -1
envshake.phase = 20
Fall = 1

[State 200, Spark guard]
type = Explod
triggerall = Numexplod(4080) = 0
trigger1 =moveguarded=1 && numenemy
anim = 4080
ID = 4080
pos = 9,10-55+random%20;-30
postype = p2
facing = -1
sprpriority = 20
removetime = -2
bindtime = -1
ownpal = 1
scale = 0.3,0.3
removeongethit = 1
ontop = 0
supermovetime 	= 999
ignorehitpause  = 1
persistent = 1


[State 0, Helper spark]
type = Helper
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8001;8101
stateno =IfElse(Random <= 499,8001,8101)
pos = 5-10+random%20, -30-10+random%20
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = IfElse(Random <= 499,.3,.5)
size.yscale = IfElse(Random <= 499,.3,.5)

[State 200, Spark blood]
type = Explod
trigger1 = movehit  && p2movetype=H
trigger1 = target,time=0
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 5-20+random%20, 10-45+random%20
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = IfElse(Random <= 499,.5,.6),IfElse(Random <= 499,.5,.6)
removeongethit = 1
ontop = 0
supermovetime = 999
ignorehitpause  = 1


[State -3, Helper]
type = Helper
trigger1 = pos Y >= -5
helpertype = normal
name = "helper floor"
ID = 288
stateno = 288
pos = 0,-3
postype = p1
facing = 1
ownpal = 1
supermovetime =9999
pausemovetime =9999
ignorehitpause =1
persistent=0

[State 0, Trans]
Type=Trans
Trigger1=1
Trans=AddAlpha
Alpha=Ceil(256.0-((Time/5.0)*256.0)),256

[State 0, DestroySelf]
type = DestroySelf
trigger1 = Time = 5

;--------------------------------------------------------

[Statedef 288, ---helper floor]
Type     = A
MoveType = H
Physics  = N
Ctrl     = 0
anim     = 99999;aux
VelSet   = 0,0
sprpriority = 5

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 7142
ID = 7142
pos = 0,0
postype = p1 
removetime = -2
scale = .1,.1;
sprpriority = -5
ownpal = 1
ignorehitpause=1
supermovetime =9999
pausemovetime =9999

[State 5100, 1]
type = Explod
trigger1 = time = 0
anim  = 7143
id = 7143
ownpal  = 1
sprpriority = -1
scale = .1,.1;
pos = 0,0
postype = p1 
ignorehitpause=1
supermovetime =9999
pausemovetime =9999

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 7140
ID = 7140
pos = 0,0
postype = p1  ;p2,front,back,left,right
removetime = -2
scale=.2,.2;
sprpriority = -5
ownpal = 1 
ignorehitpause=1
supermovetime =9999
pausemovetime =9999

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=0
value = S7,1
volumescale=50

[State 0, DestroySelf]
type = DestroySelf
trigger1 = !Animtime

;;-------------------------------------------------------------------------------

;===============================================================================
[StateDef 263, Ashura hit]
type = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
anim = 263
poweradd = 0
sprpriority = 2

;------counter---------------
[State 0, varset]
type=varset
triggerall= AILevel || !AILevel
trigger1= Time > 1
var(20) = 100
;--------------------

[State 0, NotHitBy]
type = NotHitBy
triggerall = p2stateno!=[3000,4000]
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

[State 0, Helper ashura]
type = Helper
trigger1 = animelem=3;time=0
helpertype = normal
name = "ashura espadas"
ID = 264
stateno = 264
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal =1
supermovetime=0;9999
pausemovetime=0;9999

[State 702, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = AnimElem = 5 || animelem = 6
attr = S, NA
animtype  = hard
damage    =25,2;5
guardflag = MA
pausetime = 0,7
sparkno = -1
guard.sparkno = -1;s7000
sparkxy = -20,-30
hitsound   = S3,22
guardsound = S3,25
ground.type = High
ground.slidetime = 0
ground.hittime  = 0
ground.velocity = 0,0
air.velocity = 0,0
kill=0
fall = 0
p2stateno =5880

envshake.time = 15
envshake.ampl = 5
envshake.freq = 120
envshake.phase = 120
getpower = 60,30

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numexplod(8200) = 0
trigger1 = moveguarded=1 && numenemy
helpertype =normal
name = "sparkGuard"
ID = 8200
stateno = ifelse(random>500,8200,8201)
pos = 20,-30
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
persistent =0


[State 0, Helper]
type = Helper
triggerall = Numhelper(8107) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8107
stateno =ifelse(random>500,8107,8007)
pos = 30-10+random%20, 0-30+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6

[State 0, Helper]
type = Helper
triggerall = Numhelper(8102) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8102
stateno =ifelse(random>500,8102,8002)
pos = 30-10+random%20, 0-30+random%20
postype = p1
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .6
size.yscale = .6

[State 200, Spark blood]
type = Explod
trigger1 = movehit=1  && p2movetype=H
anim = ifelse(random%2,7160,ifelse(random%2,7161,7162))
ID = 7160
pos = 6,-33
postype = p2
facing = 1
sprpriority =  IfElse(Random <= 499,3,4)
removetime = -2
bindtime = -1
ownpal = 1
scale = .7,.7
removeongethit = 1
ontop = 0
supermovetime =9999
pausemovetime =9999
ignorehitpause  = 1
persistent = 0

;imagen ashura--------------
[State 4, Explod]
type = Explod
trigger1 = movecontact;movehit=1 && p2movetype=H
anim = 3150
ID = 3150
pos = 4,6
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime= -1
scale = 1,1
removeongethit = 1
supermovetime = 9999
pausemovetime = 9999
persistent = 0

[State 0, AllPalFX]
type = BGPalFX
triggerall = movehit
trigger1 = anim=263
trigger1 = time%3=0
time = 2
add = -50,-50,-50
mul = 256,256,256
color = 128

;.....................................
;--------------combo------------------
;.....................................
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 4000 && life < 300
trigger1 = command = "Ashura Makyuusen"
trigger1 = time > 12
value = 3800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 4000
trigger1 = command = "Daisen Sekai"
trigger1 = time > 12
value = 3000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 3500
trigger1 = command = "Daishinkan"
trigger1 = time > 12
value = 3710
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 3000
trigger1 = command = "Rokudou no Tsuji"
trigger1 = time > 12
value = 3510
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 3000
trigger1 = command = "Ashura Ichibugin"
trigger1 = time > 12
value = 3100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Kokujou Tatsumaki"
trigger1 = time >12 
value = 3200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Rengoku Onigiri"
trigger1 = time > 12 
value = 3410
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2500
trigger1 = command = "Shi-Shishi Sonson"
trigger1 = time > 12
value = 3600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>=2000
trigger1 = command = "Hiryuu Kaen"
trigger1 = time > 12
value = 3310
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Dai Butsu Giri"
trigger1 = time > 12
value = 1900
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Ushi Bari"
trigger1 = time > 12
value = 1600
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Hyou Kin Dama" 
trigger1 = time > 12
value = 1800
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Nigori Zake" 
trigger1 = time > 12
value = 1300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 2000 
trigger1 = command = "1080 Pound Hou"
trigger1 = time > 12
value = 2400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command = "Ultra Tora Gari" 
trigger1 = time > 12
value = 2300
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500
trigger1 = command = "Tatsumaki"
trigger1 = time > 12
value = 2000
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1000 
trigger1 = command =  "108 Pound Hou"
trigger1 = time > 12
value = 1150
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 1000
trigger1 = command = "onigiri"
trigger1 = time > 12
value = 1700
ctrl = 0

[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "Nigiri Combo"
trigger1 = time > 12
value = 1400
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 500 
trigger1 = command = "72 Pound Hou"
trigger1 = time > 12
value = 1140
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 800
trigger1 = command = "Rashoumon"
trigger1 = time > 12
value = 1500
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power >= 1500 
trigger1 = command = "360 Pound Hou"
trigger1 = time > 12
value = 1100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel && power>= 500
trigger1 = command = "Shishi Sonson"
trigger1 = time > 12
value = 1200
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel  && power >= 300 
trigger1 = command = "Yakkoudori"
trigger1 = time > 12
value = 1000
ctrl = 0

[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Yasha Karasu"
trigger1 = time > 12
value = 2202
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Gazami Dori"
trigger1 = time > 12
value = 2100
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel  
trigger1 = command = "Maguma"
trigger1 = time > 12
value = 214
ctrl = 0
[State Change]
type = ChangeState
triggerall = movehit && !AILevel 
trigger1 = command = "Needle"
trigger1 = time >12
value = 205
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "a"
trigger1 = time > 12
value = 201
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "b"
trigger1 = time > 12
value = 210
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "c"
trigger1 = time > 12
value = 220
ctrl = 0
[State Change]
type = ChangeState
triggerall = (movehit||moveguarded) && !AILevel
trigger1 = command = "x"
trigger1 = time > 12
value = 224
ctrl = 0

[State 210, 2]
type = PlaySnd
trigger1 = Time = 0
value = S3,20

[State 210, 2]
type = PlaySnd
trigger1 = Time = 0
value = S4,102
channel=0

[State 706, changestate]
type = changestate
trigger1 = animtime=0
value=0
ctrl =1

;-------------------------------------------------------------------------------
[StateDef 264, Ashura helper ghost]
type = S
movetype= A
physics = S
juggle  = 1
velset = 0,0
ctrl = 0
anim = 264
poweradd = 0
sprpriority = 1

[State 0, BindToParent]
type = BindToParent
trigger1 =1
time = 1
facing = 0
pos = 0,0
ignorehitpause = 1

[State 60, Corte R]
type = Explod
trigger1 = AnimElem = 2;
anim = 827
ID =  827
pos = 50,-30
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
supermovetime = 0
pausemovetime = 0
scale = 0.5,0.5
sprpriority = 4
ownpal = 1
removeongethit = 1


[State 60, Corte L]
type = Explod
trigger1 = AnimElem = 2
anim = 827
ID =  827
pos = -50,-30
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = 1
bindtime = -1
removetime = -2
supermovetime = 0
pausemovetime = 0
scale = 0.5,0.5
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1


[State 1601, DestroySelf]
type = DestroySelf
trigger1 = (parent,stateno)!=263


;-------------------------------------------------------------------------------
[Statedef 265, Charge]
movetype = I
physics = S
type = S
ctrl = 0
anim = 265
velset = 0,0
sprpriority = 2


[State 0, Explod smallRocks] 
type = Explod
trigger1 = time >= 10 & timemod = 15,0
anim = 7145
id = 7145
postype = p1
pos = 35,floor(pos y)
facing = ifelse(random%2,1,-1)
vel = Random/(-120),Random/(-120)
accel = 0,.5
scale = IfElse(Random <= 499,.02,.01),IfElse(Random <= 499,.02,.01)
sprpriority = ifelse(random%2,3,ifelse(random%2,27,ifelse(random%2,25,ifelse(random%2,10,-1))))
pausemovetime = 9999
supermovetime = 9999
removeongethit = 1


[State 0, Helper]
type = Helper
triggerall = !numhelper(50037) 
trigger1 = time >= 10 & timemod = 15,0
helpertype = normal ;player
name = "AfterImage6Blue"
ID = 50037
stateno = 50037
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 9999
pausemovetime = 9999


[State 0, Veladd] 
type = Veladd
trigger1 = 1
x = -1.5
[State 0, VelSet]
type = VelSet
trigger1 = vel x < 0.05
x = 0
ignorehitpause = 1
[State 0, VelSet]
type = VelSet
trigger1 = 1
y = 0

[State 0, EnvShake]
type = EnvShake
trigger1 = time >= 15 & timemod = 10,0
time = 3
freq = 90
ampl = -4
phase = 10
ignorehitpause = 1

[State 100, Explod]
type = Explod
trigger1 = animelem=5
anim = 6050
ID = 6050
pos = -20,-5
postype = p1
bindtime = 1
removetime = -2
scale = 0.15,0.15
sprpriority = -4
ownpal = 1
facing = 1
supermovetime=9999
pausemovetime=9999

[State 100, Explod]
type = Explod
trigger1 = animelem=11
anim = 6050
ID = 6050
pos = 20,-5
postype = p1
bindtime = 1
removetime = -2
scale = 0.15,0.15
sprpriority = -4
ownpal = 1
facing=-1
supermovetime=9999
pausemovetime=9999


[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = S4,11
channel = 3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 11
value = S4,12
channel = 3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5 || animelem = 11
value = S3,33
channel = 11

[State 300, PowerAdd]
type = PowerAdd
triggerall = command = "hold_z"
trigger1=animelem=7 || animelem=13
value = 150

[State 0, StopSnd]
type = StopSnd
trigger1 = command != "hold_z"
channel = 11

[State 0, StopSnd]
type = StopSnd
trigger1 = command != "hold_z"
channel = 3

[State 300, off]
type = ChangeState
trigger1 = command !=  "hold_z"
trigger2 = power = powermax
value = 266
ctrl = 0

;===============================================================================
[Statedef 266, Charge end]
type    = S
movetype= I
physics = S
velset = 0,0
ctrl = 0
anim = 266
sprpriority = 2


[State 203, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
[Statedef 290, Throw start]
type = S
movetype= A
physics = S
juggle = 0
velset = 0,0
ctrl = 0
anim = 290
poweradd = 0
sprpriority = 2


[State 211, 1]
type = HitDef
triggerall = hitcount < 1
trigger1 = animelem = 3
attr = S, NA
animtype  = light
damage    = 5
getpower = 30,15
guardflag = ;MA
pausetime = 8,9
sparkno = -1;s6000
guard.sparkno = -1;s7000
sparkxy = -20,-25
hitsound   = S1,2
guardsound = S1,1
ground.type = high
ground.slidetime =7
ground.hittime  = 20
ground.velocity = -10,0
p1stateno=291
envshake.freq = 15
envshake.time = 40
fall=0
kill=0

[State 60, Arena Grande atras]
type = Explod
trigger1=animelem=2
anim = 7102
ID =  7102
pos = -1,4
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
supermovetime = 0
pausemovetime = 0
scale = 0.4, 0.4
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 0, PlaySnd]
type = PlaySnd
Trigger1 = animelem=2
value = S4,6
channel=0

[State 800, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
[Statedef 291, Throw start2]
type = S
movetype= A
physics = S
juggle = 0
velset = 0,0
ctrl = 0
anim = 291

[State 810, Bind 7]
type = TargetBind
trigger1 = time=0
pos = 40, 0

[State 800, 1]
type = HitDef
getpower = 15,7
triggerall=hitcount<1
Trigger1 = animelem = 5
Trigger2 = animelem = 6
attr = S, NT
hitflag = M
priority = 1, Miss
sparkno = -1
sprpriority = 1
hitsound = S5,5
p1facing = ifelse (command = "holdback", -1, 1)
p2facing = 1
p1stateno = 292
p2stateno = 293
fall = 1

envshake.time = 15
envshake.ampl = 5
envshake.freq = 110
envshake.phase = 110

[State 1000, EnvColor]
type = EnvColor
triggerall = movehit
trigger1 = 1
value = 255,255,255
time = 1
under = 1
ignorehitpause = 1
persistent = 0

[State 0, Helper]
type = Helper
triggerall = Numhelper(8100) = 0
triggerall = movehit=1  && p2movetype=H
trigger1 = target,time=0
helpertype = normal
name = "HitSpark"
ID = 8100
stateno =ifelse(random>500,8100,8000)
pos = 5,-43
postype = p2
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause=1
size.xscale = .5
size.yscale = .5


[State 0, PlaySnd]
type = PlaySnd
Trigger1 = time = 15
value = S3,3

[State 800, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;----------------------------------------------------------------------
[Statedef 292, Throw]
type = S
movetype= A
physics = N
anim = 292

[State 210, 2]
type = PlaySnd
trigger1 = time=40
value = S4,4
channel=0

[State 210, 2]
type = PlaySnd
trigger1 = animelem=2
value = S4,15
channel=0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

[State 810, SprPriority]
type = SprPriority
trigger1 = AnimElem =1
value = 1

[State 810, SprPriority]
type = SprPriority
trigger1 = AnimElem =2
value = 1

[State 810, SprPriority]
type = SprPriority
trigger1 = AnimElem =3
value = -1

[State 810, SprPriority]
type = SprPriority
trigger1 = AnimElem =4
value = 1

[State 810, SprPriority]
type = SprPriority
trigger1 = AnimElem =5
value = 1

[State 810, SprPriority]
type = SprPriority
trigger1 = AnimElem =6
value = 1

[State 810, SprPriority]
type = SprPriority
trigger1 = AnimElem =7
value = 1

[State 810, SprPriority]
type = SprPriority
trigger1 = AnimElem =8
value = 1

[State 0, Corte FX]
type = Explod
trigger1 = animelem = 8
anim = 801
ID = 801
pos = -23,-42
postype = p1
bindtime = -1
removetime =-2
scale = .9,.7
sprpriority = 4
ownpal = 1
pausemovetime=9999
supermovetime = 9999

[State 810, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 42,-101

[State 810, Bind 2]
type = TargetBind
trigger1 = AnimElem = 2
pos = 30,-45

[State 810, Bind 6]
type = TargetBind
trigger1 = AnimElem = 3
pos = -37, -15

[State 810, Bind 7]
type = TargetBind
trigger1 = AnimElem = 4
pos = -48, -57

[State 810, Bind 7]
type = TargetBind
trigger1 = AnimElem =5
pos = -38, -80

[State 810, Bind 7]
type = TargetBind
trigger1 = AnimElem =6
pos = -45, -57

[State 810, Bind 7]
type = TargetBind
trigger1 = AnimElem =7
pos = -8, -110

[State 810, Bind 7]
type = TargetBind
trigger1 = AnimElem =8
pos = 20, -85


[State 100, Explod]
type = Explod
trigger1 = AnimElem = 7
anim = 6050
ID = 6050
pos = -25,-5
postype = p1
bindtime = 1
removetime = -2
scale = 0.25,0.25
sprpriority = 4
ownpal = 1

[State 0, VelAdd]
type = VelAdd
trigger1 = AnimElem = 8
x =-3
y=-3

[State 810, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 10
value = -40

[State 0, PlaySnd]
type = PlaySnd
trigger1 =AnimElem =8
value = S2,7

[State 810, Throw]
type = TargetState
trigger1 = time=57
value = 5650

[State 810, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 231


;----------------------------------------------------------------------
[Statedef 293, Throw anim2]
type = A
movetype = H
physics = N
velset = 0,0

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 293

;===============================================================================
[Statedef 294, Throw end]
type    = S
movetype= H
physics = N
velset = 0,0
ctrl = 0
anim = 294
sprpriority = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time=12
value = S3,33

[State 204, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;===============================================================================
