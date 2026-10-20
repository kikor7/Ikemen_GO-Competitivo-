;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;Courage's Hyper Moves;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;-------------------------------------------------------------------------------
; Raging Scream
[Statedef 3000]
type    = A
movetype= A
physics = N
juggle  = 1
velset = 0,0
poweradd = -1000
anim = 3000
ctrl = 0
sprpriority = 1
hitcountpersist = 1
facep2 = 1

[State 3000, Hyper Portrait]
type = Explod
trigger1 = AnimElem = 1
anim = 3999
pos = 0,0
postype = back
facing = 1
bindtime = 1
removetime = 40
supermovetime = 30
sprpriority = 0
ontop = 0
ownpal = 1
scale = 0.5,0.5

[State 3200, Explod]
type = Explod
trigger1 = AnimElem = 1
anim = 4052
ID = 4052
pos = 0,0
postype = left
facing = 1
bindtime = -1
removetime = 200
sprpriority = -7
ownpal = 1
supermovetime = 40
removeongethit = 1

[State 3000, RemoveExplod]
type = RemoveExplod
trigger1 = WinKO
trigger2 = AnimElem = 1
id = 750

[State 3000, Explod]
type = Explod
trigger1 = AnimElem = 1
anim = 4050
ID = 4050
pos = 0,0
postype = left
facing = 1
bindtime = -1
removetime = 55
sprpriority = -7
ownpal = 1
supermovetime = 40
removeongethit = 1

[State 3000, Hyper Background]
type = Explod
trigger1 = AnimElem = 6
id = 750
anim = 750
pos = 0,0
postype = back
sprpriority = -3
removeongethit = 1
removetime = 450
bindtime = -1
supermove = 1
ownpal = 1
removeongethit = 1

[State 3000, Super A]
type = SuperPause
trigger1 = AnimElem = 1
pos = 10, -47
anim = 102
sound = S20,0
time = 20
movetime = 20

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time >= 351
value = 7034

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time >= 307
trigger1 = time <= 308
trigger1 = movehit
value = 7034

[State 3000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 6;15
value = S3000,0

[State 1000, EnvShake]
type = EnvShake
trigger1=time>=81
trigger1=time<=291
time = 10
freq = 166
ampl = 7
phase = 30

[State 3000, Charge]
type=explod
trigger1 = AnimElem = 3 && Anim = 3000
anim=3002
sprpriority=5
postype=p1
pos=-10,-47
removetime=60
scale=0.3,0.3
pausemovetime = 400

[State 821, 11] 
type = Explod
trigger1 = time = 271;96
anim = 3001
pos = 167,160
postype = back
sprpriority = 999 
removeongethit = 1
removetime = -2
bindtime = -1
supermove = 1
ownpal = 1

[State 3100, HitDef]
type = HitDef
trigger1 = AnimElem = 6
trigger2 = AnimElem = 8
trigger3 = AnimElem = 10
trigger4 = AnimElem = 12
trigger5 = AnimElem = 14
trigger6 = AnimElem = 16
trigger7 = AnimElem = 18
trigger8 = AnimElem = 20
trigger9 = AnimElem = 22
trigger10 = AnimElem = 24
trigger11 = AnimElem = 26
trigger12 = AnimElem = 28
trigger13 = AnimElem = 30
trigger14 = AnimElem = 32
trigger15 = AnimElem = 34
trigger16 = AnimElem = 36
trigger17 = AnimElem = 38
trigger18 = AnimElem = 40
trigger19 = AnimElem = 42
trigger20 = AnimElem = 44
trigger21 = AnimElem = 46
trigger22 = AnimElem = 48
trigger23 = AnimElem = 50
trigger24 = AnimElem = 52
trigger25 = AnimElem = 54
trigger26 = AnimElem = 56
trigger27 = AnimElem = 58
trigger28 = AnimElem = 60
trigger29 = AnimElem = 62
trigger30 = AnimElem = 64
trigger31 = AnimElem = 66
trigger32 = AnimElem = 68
trigger33 = AnimElem = 70
trigger34 = AnimElem = 72
trigger35 = AnimElem = 74
trigger36 = AnimElem = 76
trigger37 = AnimElem = 78
trigger38 = AnimElem = 80
trigger39 = AnimElem = 82
trigger40 = AnimElem = 84
trigger41 = AnimElem = 86
trigger42 = AnimElem = 88
trigger43 = AnimElem = 90
trigger44 = AnimElem = 92
trigger45 = AnimElem = 94
attr = S,HA
hitflag = MAF
guardflag = MA
animtype = hard          ;light,medium,hard,back,up,diagup
air.animtype = light
damage = 34,18
pausetime = 3,3
sparkno = -1
sparkxy = 0,0
guardsound = S6,1
ground.type = Low
air.type = High
ground.slidetime = 5
ground.hittime = 30
air.hittime = 20
ground.velocity = -3
air.velocity = -3,-1
kill = 1
numhits = 5
getpower = 0
envshake.time = 30
envshake.freq = 5
envshake.ampl = 1
envshake.phase = 9
ignorehitpause = 1

[State 3200, Dust]
type = explod
trigger1 = AnimElem = 6
trigger2 = AnimElem = 8
trigger3 = AnimElem = 10
trigger4 = AnimElem = 12
trigger5 = AnimElem = 14
trigger6 = AnimElem = 16
trigger7 = AnimElem = 18
trigger8 = AnimElem = 20
trigger9 = AnimElem = 22
trigger10 = AnimElem = 24
trigger11 = AnimElem = 26
trigger12 = AnimElem = 28
trigger13 = AnimElem = 30
trigger14 = AnimElem = 32
trigger15 = AnimElem = 34
trigger16 = AnimElem = 36
trigger17 = AnimElem = 38
trigger18 = AnimElem = 40
trigger19 = AnimElem = 42
trigger20 = AnimElem = 44
trigger21 = AnimElem = 46
trigger22 = AnimElem = 48
trigger23 = AnimElem = 50
trigger24 = AnimElem = 52
trigger25 = AnimElem = 54
trigger26 = AnimElem = 56
trigger27 = AnimElem = 58
trigger28 = AnimElem = 60
trigger29 = AnimElem = 62
trigger30 = AnimElem = 64
trigger31 = AnimElem = 66
trigger32 = AnimElem = 68
trigger33 = AnimElem = 70
trigger34 = AnimElem = 72
trigger35 = AnimElem = 74
trigger36 = AnimElem = 76
trigger37 = AnimElem = 78
trigger38 = AnimElem = 80
trigger39 = AnimElem = 82
trigger40 = AnimElem = 84
trigger41 = AnimElem = 86
trigger42 = AnimElem = 88
trigger43 = AnimElem = 90
trigger44 = AnimElem = 92
trigger45 = AnimElem = 94
anim = 3211
sprpriority = 2
postype = p1
pos = -20, -ceil(pos y)
ownpal = 1

[State 3100, HitDef]
type = HitDef
trigger1 = time=306;AnimElem = 96
attr = S,HA
hitflag = MAF
guardflag = MA
animtype = hard          ;light,medium,hard,back,up,diagup
air.animtype = hard
damage = 35,2
pausetime = 9,11
sparkno = -1
sparkxy = 0,0
guardsound = S6,1
ground.type = Low
air.type = High
ground.slidetime = 5
ground.hittime = 30
air.hittime = 20
ground.velocity = -8,-3
air.velocity = -5,-3
kill = 1
getpower = 0
envshake.time = 30
envshake.freq = 5
envshake.ampl = 1
envshake.phase = 9
fall = 1
air.fall = 1
ignorehitpause = 1
fall.recover=0

[State 3000, ChangeState]
type = ChangeState
trigger1 = time>=364;AnimTime = 0
value = 50;ifelse (pos Y <0,50,0)
ctrl = 1

;----------------------------------------------------------------------
;Eggplants Rumble
[StateDef 3100]
type = S
movetype = A
physics = S
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3100
poweradd = -2000
sprpriority = 3
hitcountpersist = 1
facep2 = 1

[State 3100, Text]
type = Explod
trigger1 = WinKO = 1
trigger1 = facing = 1
anim = 31999
ID = 32999
bindtime = -1
pos = 154,107
scale = 0.6,0.6
postype = left
facing = 1
vfacing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause = 1


[State 620, VarSet]
type = VarSet
trigger1 = AnimElem = 1
v = 50
value = 1

[State 3100, RemoveExplod]
type = RemoveExplod
trigger1 = WinKO
trigger2 = AnimTime = 0
id = 750

[State 3101, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 3102
time = 1
forceair = 0

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 1
pos = 0,-50
anim = 102
sound = S20,0
time = 160
movetime = 160

[State 3100, Text]
type = Explod
trigger1 = WinKO = 1
trigger1 = facing = 1
anim = 31999
ID = 31999
bindtime = -1
pos = 154,107
scale = 0.6,0.6
postype = left
facing = 1
vfacing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause = 1

[State 3101, HitOverride]
type = null;HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 32033
time = 1
forceair = 0

[State 3100, Text]
type = Explod
trigger1 = WinKO = 1
trigger1 = facing = -1
anim = 31199
ID = 31199
bindtime = -1
pos = -154,107
scale = 0.6,0.6
postype = right
facing = -1
vfacing = 1
ownpal = -1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause = 1

[State 3100, Hyper Portrait]
type = Explod
trigger1 = time = 0
anim = 3999
pos = 0,0
postype = back
facing = 1
bindtime = 1
removetime = 40
supermovetime = 30
sprpriority = 0
ontop = 0
ownpal = 1
scale = 0.5,0.5

[State 3200, Explod]
type = Explod
trigger1 = time = 0
anim = 4052
ID = 4052
pos = 0,0
postype = left
facing = 1
bindtime = -1
removetime = 120
sprpriority = -7
ownpal = 1
supermovetime = 70
removeongethit = 1

[State 3200, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = S3100,0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 74
value = S182,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 33
trigger2 = AnimElem = 34
trigger3 = AnimElem = 35
trigger4 = AnimElem = 36
trigger5 = AnimElem = 37
trigger6 = AnimElem = 38
trigger7 = AnimElem = 39
trigger8 = AnimElem = 40
trigger9 = AnimElem = 41
trigger10 = AnimElem = 42
trigger11 = AnimElem = 43
trigger12 = AnimElem = 44
trigger13 = AnimElem = 45
trigger14 = AnimElem = 46
trigger15 = AnimElem = 47
trigger16 = AnimElem = 48
trigger17 = AnimElem = 49
trigger18 = AnimElem = 50
trigger19 = AnimElem = 51
trigger20 = AnimElem = 52
trigger21 = AnimElem = 53
trigger22 = AnimElem = 54
trigger23 = AnimElem = 55
trigger24 = AnimElem = 56
trigger25 = AnimElem = 57
trigger26 = AnimElem = 58
trigger27 = AnimElem = 59
trigger28 = AnimElem = 60
trigger29 = AnimElem = 61
trigger30 = AnimElem = 62
trigger31 = AnimElem = 63
trigger32 = AnimElem = 64
trigger33 = AnimElem = 65
trigger34 = AnimElem = 66
trigger35 = AnimElem = 67
trigger36 = AnimElem = 68
trigger37 = AnimElem = 69
trigger38 = AnimElem = 70
trigger39 = AnimElem = 71
trigger40 = AnimElem = 72
value = S0,20

[State 1700, Explod]
type = Explod
trigger1 = animelem = 74
anim = 1112
ID = 1112
pos = 0,-25
postype = p1
facing = 1
bindtime = -1
removetime = 15
scale = .8,.8
sprpriority = 8
ownpal = 1

[State 6001, PlaySnd]
type = PlaySnd
trigger1 = time=165;AnimElem = 1
value = 3100,1

[State 6001, PlaySnd]
type = PlaySnd
trigger1 = time=165;AnimElem = 1
value = 3100,1

[State 191, Comic Text]
type = Explod
trigger1 = AnimElem = 74
anim = 8004
ID = 8004
sprpriority = -2
postype = p1
pos = 0,-25 
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3200, Hyper Background]
type = Explod
trigger1 = AnimElem = 33
id = 750
anim = 750
pos = 0,0
postype = back
sprpriority = -3
removeongethit = 1
removetime = 490
bindtime = -1
supermove = 1
ownpal = 1
removeongethit = 1

[State 3200, Dust]
type = explod
trigger1 = AnimElem = 33
trigger2 = AnimElem = 34
trigger3 = AnimElem = 35
trigger4 = AnimElem = 36
trigger5 = AnimElem = 37
trigger6 = AnimElem = 38
trigger7 = AnimElem = 39
trigger8 = AnimElem = 40
trigger9 = AnimElem = 41
trigger10 = AnimElem = 42
trigger11 = AnimElem = 43
trigger12 = AnimElem = 44
trigger13 = AnimElem = 45
trigger14 = AnimElem = 46
trigger15 = AnimElem = 47
trigger16 = AnimElem = 48
trigger17 = AnimElem = 49
trigger18 = AnimElem = 50
trigger19 = AnimElem = 51
trigger20 = AnimElem = 52
trigger21 = AnimElem = 53
trigger22 = AnimElem = 54
trigger23 = AnimElem = 55
trigger24 = AnimElem = 56
trigger25 = AnimElem = 57
trigger26 = AnimElem = 58
trigger27 = AnimElem = 59
trigger28 = AnimElem = 60
trigger29 = AnimElem = 61
trigger30 = AnimElem = 62
trigger31 = AnimElem = 63
trigger32 = AnimElem = 64
trigger33 = AnimElem = 65
trigger34 = AnimElem = 66
trigger35 = AnimElem = 67
trigger36 = AnimElem = 68
trigger37 = AnimElem = 69
trigger38 = AnimElem = 70
trigger39 = AnimElem = 71
trigger40 = AnimElem = 72
anim = 3211
sprpriority = 2
postype = p1
pos = -20, -ceil(pos y)
ownpal = 1

[State 6004, 4]
type = Helper
trigger1 = AnimElem = 33
trigger2 = AnimElem = 34
trigger3 = AnimElem = 35
trigger4 = AnimElem = 36
trigger5 = AnimElem = 37
trigger6 = AnimElem = 38
trigger7 = AnimElem = 39
trigger8 = AnimElem = 40
trigger9 = AnimElem = 41
trigger10 = AnimElem = 42
trigger11 = AnimElem = 43
trigger12 = AnimElem = 44
trigger13 = AnimElem = 45
trigger14 = AnimElem = 46
trigger15 = AnimElem = 47
trigger16 = AnimElem = 48
trigger17 = AnimElem = 49
trigger18 = AnimElem = 50
trigger19 = AnimElem = 51
trigger20 = AnimElem = 52
trigger21 = AnimElem = 53
trigger22 = AnimElem = 54
trigger23 = AnimElem = 55
trigger24 = AnimElem = 56
trigger25 = AnimElem = 57
trigger26 = AnimElem = 58
trigger27 = AnimElem = 59
trigger28 = AnimElem = 60
trigger29 = AnimElem = 61
trigger30 = AnimElem = 62
trigger31 = AnimElem = 63
trigger32 = AnimElem = 64
trigger33 = AnimElem = 65
trigger34 = AnimElem = 66
trigger35 = AnimElem = 67
trigger36 = AnimElem = 68
trigger37 = AnimElem = 69
trigger38 = AnimElem = 70
trigger39 = AnimElem = 71
trigger40 = AnimElem = 72
helpertype = normal
ID = 3101
stateno = 3101
pos = -100,0
postype = back
pausemovetime = 9999

[State 191, Comic Text]
type = Explod
trigger1 = AnimElem = 74
anim = 8004
ID = 8004
sprpriority = -2
postype = p1
pos = 0,-25 
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3100, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;----------------------------------------------------------------
; Eggplant
[Statedef 3101]
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3101
juggle = 25

[State 3200, Dust]
type = explod
trigger1 = animelem = 2
anim = 3211
sprpriority = 2
postype = p1
pos = -30, -ceil(pos y)
ownpal = 1

[State 3101, VelSet]
type = VelSet
trigger1 = time > 0
x = 12


[State 3101, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 3103
time = 1
forceair = 0

[State 3101, HitDef]
type = HitDef
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2
trigger3 = AnimElem = 3
trigger4 = AnimElem = 4
attr = S,HA        ;SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
givepower = 25
animtype = hard          ;light,medium,hard,back,up,diagup
damage = 5,1
pausetime = 3,5
sparkno = 3
sparkxy = 0,0
hitsound = S5,2
guardsound = S6,0
guard.sparkno = 40
ground.type = Low
air.type = Low
ground.slidetime = 5		;Time that the opponent slides back
ground.hittime  = 15		;Time opponent is in hit state
ground.velocity = 0,-1		;Velocity at which opponent is pushed
airguard.velocity = -1.9,-.8	;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High			;Type: High, Low, Trip (def: same as ground.type)
air.velocity = 0,-1.8		;X-velocity at which opponent is pushed,
getpower = 0					;Y-velocity at which opponent is pushed
air.hittime = 15			;Time before opponent regains control in air
fall = 1
fall.recovertime = 45

[State 200, Onomatopoeia]
type = Explod
trigger1 = movehit = 1 && numtarget
trigger1 = target, time <= 0 && p2movetype = H
anim = 8000+random%9
postype = p1
pos = 18,-21
removetime = -2
ontop = 1
facing = facing
ownpal = 1
ignorehitpause = 1

[State 6001, PlaySnd]
type = PlaySnd
triggerall=numhelper(3131)=1
trigger1 = time=0;AnimElem = 1
value = 3100,1

[State 6001, DestroySelf]
type = DestroySelf
trigger1 = time = 135;999
;trigger2 = FrontEdgeDist < 12
;-------------------------------------------------------------------------------
[Statedef 3102]
type    = S
movetype= A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3103
poweradd = 0
sprpriority = 2

[State 1651, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 5000,0+random%7

[State 191, Comic Text]
type = Explod
trigger1 = AnimElem = 3
anim = 8004
ID = 8004
sprpriority = -2
postype = p1
pos = 0,-25 
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1651, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;-------------------------------------------------------------------------------
[Statedef 3103]
type    = S
movetype= A
physics = N
juggle  = 1
velset = -20,0
ctrl = 0
anim = 3102
poweradd = 0
sprpriority = 2

[State 3101, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7103
ID = 7103
pos = 0,(floor((-Pos Y)-Vel Y)) + 10
postype = p1
scale = 0.33,0.33
sprpriority = 3
ownpal = 1

[State 6001, DestroySelf]
type = DestroySelf
trigger1 = time = 999
;---------------------------------------------------------------------------
; Computer-Droid
; CNS difficulty: easy
[Statedef 3200]
type    = S				;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A				;Move-type: A-attack, I-idle, H-gethit
physics = S				;Physics: S-stand, C-crouch, A-air
juggle  = 1				;Number of air juggle points move takes
velset = 0,0			;Set velocity (x,y) (Def: no change)
ctrl = 0				;Set ctrl (Def: no change)
anim = 3200				;Change animation (Def: no change)
poweradd = -4000			;Power to add (Def: 0)
sprpriority = 2			;Set layering priority to 2 (in front)
hitcountpersist = 1
facep2 = 1

[State 3200, Text]
type = Explod
trigger1 = WinKO = 1
trigger1 = facing = 1
anim = 32999 ;34999
ID = 34999
bindtime = -1
pos = 154,107
scale = 0.6,0.6
postype = left
facing = 1
vfacing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause = 1

[State 3200, Text]
type = Explod
trigger1 = WinKO = 1
trigger1 = facing = -1
anim = 32999;34199
ID = 34199
bindtime = -1
pos = -154,107
scale = 0.6,0.6
postype = right
facing = -1
vfacing = 1
ownpal = -1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause = 1

[State 200, VarSet]
type = VarSet
trigger1 = time = 0
v = 50
value = 1

[State 200, Width]
type = null;Width
trigger1 = AnimElem = 1
edge = 0,0
player = 10,20

;;OTO
[State 3200, RemoveExplod]
type = RemoveExplod
trigger1 = WinKO
trigger2 = AnimTime = 0
id = 750

[State 3200, SuperPause]
type = SuperPause
trigger1 = AnimElem = 38
time = 30
anim = 102
sound = S20,0
pos = 0,-46
move = 0
darken = 1
p2defmul = 0
poweradd = -4000
unhittable = 1
movetime = 30

[State 3200, Dust]
type = explod
trigger1 = animelem = 5
anim = 3211
sprpriority = 2
postype = p1
facing = -1
pos = -50, -ceil(pos y)
ownpal = 1

[State 3050, Pause]
type = Pause
trigger1 = AnimElem = 1
time = 90
movetime = 90


[State 3100, Text]
type = Explod
trigger1 = WinKO = 1
trigger1 = facing = 1
anim = 34999
ID = 31999
bindtime = -1
pos = 154,107
scale = 0.6,0.6
postype = left
facing = 1
vfacing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 3200, Text]
type = Explod
trigger1 = WinKO = 1
trigger1 = facing = -1
anim = 32999;34199
ID = 34199
bindtime = -1
pos = -154,107
scale = 0.6,0.6
postype = right
facing = -1
vfacing = 1
ownpal = -1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause = 1

[State 3200, Hyper Portrait]
type = Explod
trigger1 = AnimElem = 38
anim = 3999
pos = 0,0
postype = back
facing = 1
bindtime = 1
removetime = 40
supermovetime = 30
sprpriority = 0
ontop = 0
ownpal = 1
scale = 0.5,0.5

[State 3200, Explod]
type = Explod
trigger1 = AnimElem = 38
anim = 4052
ID = 4052
pos = 0,0
postype = left
facing = 1
bindtime = -1
removetime = -2
sprpriority = -7
ownpal = 1
supermovetime = 40
removeongethit = 1

[State 3200, Hyper Background]
type = Explod
trigger1 = AnimElem = 39
id = 750
anim = 750
pos = 0,0
postype = back
sprpriority = -3
removeongethit = 1
removetime = 100
bindtime = -1
supermove = 1
ownpal = 1
removeongethit = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 42
value = S182,0

[State 1700, Explod]
type = Explod
trigger1 = animelem = 42
anim = 1112
ID = 1112
pos = 0,-25
postype = p1
facing = 1
bindtime = -1
removetime = 15
scale = .8,.8
sprpriority = 8
ownpal = 1

[State 1220, Dust Up]
type = explod
trigger1 = AnimElem = 37
trigger2 = AnimElem = 39
anim = 7106
postype = p1
sprpriority = 3
supermovetime = 1
removetime = 22
pos = -15,-2
bindtime = 1
removeongethit = 1

[State 200, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S0,0
volume = 255
channel = -1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 39
x = 70

[State -2, AfterImage]
type = AfterImage
trigger1 = AnimElem = 39
time = 20
trans = none
length = 5
timegap  = 3
framegap = 1
palcolor = 0
palinvertall = 0
palbright = 50,50,255
palcontrast = 255,255,255
palpostbright = 50,50,255
PalAdd = -40,-40,0
PalMul = 1,1,1

[State 1120, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = S3150,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 37
value = S3300,6

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 39
value = S3300,7

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 40
value = S3300,8

[State 1303, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 37
value = s3301,1

[state 3700]
type = NotHitby
trigger1 = time = 0
value = SCA
time = 52

[State 1000, 1]
type = HitDef
Trigger1 = AnimElem = 39
Trigger2 = AnimElem = 40
attr = S, NT
hitflag = MAFD
priority = 1, Miss
sparkno = -1
guardflag =
sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 3201
p2stateno = 8200;3203
hitsound = S800,0
guard.dist = 0
getpower = 10
givepower = 20
fall = 1
ID = 3200

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 37
value = S3150,2

[State 200, 1]
type = null;HitDef
trigger1 = Time = 0
attr = S, NA			;Attribute: Standing, Normal Attack
damage = 6,0			;Damage that move inflicts, guard damage
animtype = Light			;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA			;Flags on how move is to be guarded against
hitflag = MAF			;Flags of conditions that move can hit
priority = 3, Hit			;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 8, 4			;Time attacker pauses, time opponent shakes
sparkno = 0				;Spark anim no (Def: set above)
sparkxy = -12,-36		;X-offset for the "hit spark" rel. to p2,
hitsound = S5,0			;Sound to play on hit
guardsound = S6,0			;Sound to play on guard
ground.type = High		;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5		;Time that the opponent slides back
ground.hittime  = 12		;Time opponent is in hit state
ground.velocity = -3		;Velocity at which opponent is pushed
airguard.velocity = -1.9,-.8	;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High			;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-3		;X-velocity at which opponent is pushed,
air.hittime = 12			;Time before opponent regains control in air

[State 200, Onomatopoeia]
type = Explod
trigger1 = movehit = 1 && numtarget
trigger1 = target, time <= 0 && p2movetype = H
anim = 8000+random%5
postype = p1
pos = 12,-36
removetime = -2
ontop = 1
facing = facing
ownpal = 1
ignorehitpause = 1

[State 200, 1]
type = ChangeState
triggerall = var(59)
trigger1 = movecontact
value = 220

[State 200, 2]
type = ChangeState
triggerall = var(59)
trigger1 = movecontact
value = 230

[State 200, 3]
type = ChangeState
triggerall = var(59)
trigger1 = movecontact
value = 240

[State 200, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[State 3100, Text]
type = Explod
trigger2 = win
trigger1 = WinKO = 1
;trigger1 = facing = 1
anim = 32999
ID = 31999
bindtime = -1
pos = 154,107
scale = 0.6,0.6
postype = left
facing = 1
vfacing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999


[State 3101, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 3203
time = 1
forceair = 0

;---------------------------------------------------------------------------
[Statedef 3201]
type = S
movetype= A
physics = S
anim = 3201
poweradd = 0

[State 3100, Text]
type = Explod
trigger2 = win
trigger1 = WinKO = 1
;trigger1 = facing = 1
anim = 32999
ID = 31999
bindtime = -1
pos = 154,107
scale = 0.6,0.6
postype = left
facing = 1
vfacing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 1300, 2]
type = Explod
;triggerall = numexplod(7103) = 0
trigger1 = (Time%20) = 1
trigger1 = Time >= 1
;trigger3 = Time = 72
;trigger4 = Time = 108
;trigger5 = Time = 144
;trigger1 = P2dist x <= 80
anim = 3202
postype = p1
pos = 0,75;500,130
removetime = 90
sprpriority = -3
supermovetime = 999
;vel = -9
ontop = 0
id = 71044
removeongethit = 1
;scale = .4,.4
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S3300,3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S3150,1

[State 6505, 4]
type = Explod
trigger1 = (Time%20) = 1 && NumExplod(8051) = 0
trigger1 = Time >= 1
anim = 8051
id = 8051
postype = P1
pos = 0,-16
removetime = 105
bindTime = -1
removetime = -1
sprpriority = 2
ownpal = 1

[State 52, Dust]
type = Explod
trigger1 = AnimElem = 1
anim = 7103
ID = 7103
sprpriority = -2
postype = p1
scale = 0.4, 0.4
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 184, Explod]
type = Explod
trigger1 = AnimElem = 1
pos = 0,-21
anim = 3203
postype = p1
vel = 1,0
removetime = 105
bindtime = -1
sprpriority = 5
scale = 0.9,0.3
ontop = 1
removeongethit = 1

[State 1330, Explod]
type = Explod
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
anim = F62
pos = 0,-10
postype = p2  ;p2,front,back,left,right
facing = 1
vfacing = 1
removetime = -2

[State 1310, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 57,-84
[State 1310, Bind 2]
type = TargetBind
trigger1 = AnimElem = 2
pos = -4,-76
[State 1310, Bind 3]
type = TargetBind
trigger1 = AnimElem = 3
pos = -65,-78
[State 1310, Bind 4]
type = TargetBind
trigger1 = AnimElem = 4
pos = -54,-73
[State 1310, Bind 5]
type = TargetBind
trigger1 = AnimElem = 5
pos = -3,-99
[State 1310, Bind 6]
type = TargetBind
trigger1 = AnimElem = 6
pos = 57,-67
[State 1310, Bind 7]
type = TargetBind
trigger1 = AnimElem = 7
pos = -4,-76
[State 1310, Bind 8]
type = TargetBind
trigger1 = AnimElem = 8
pos = 57,-84
[State 1310, Bind 2]
type = TargetBind
trigger1 = AnimElem = 9
pos = -4,-76
[State 1310, Bind 3]
type = TargetBind
trigger1 = AnimElem = 10
pos = -65,-78
[State 1310, Bind 4]
type = TargetBind
trigger1 = AnimElem = 11
pos = -54,-73
[State 1310, Bind 5]
type = TargetBind
trigger1 = AnimElem = 12
pos = -3,-99
[State 1310, Bind 6]
type = TargetBind
trigger1 = AnimElem = 13
pos = 57,-67
[State 1310, Bind 7]
type = TargetBind
trigger1 = AnimElem = 14
pos = -4,-76
[State 1310, Bind 1]
type = TargetBind
trigger1 = AnimElem = 15
pos = 57,-84
[State 1310, Bind 2]
type = TargetBind
trigger1 = AnimElem = 16
pos = -4,-76
[State 1310, Bind 3]
type = TargetBind
trigger1 = AnimElem = 17
pos = -65,-78
[State 1310, Bind 4]
type = TargetBind
trigger1 = AnimElem = 18
pos = -54,-73
[State 1310, Bind 5]
type = TargetBind
trigger1 = AnimElem = 19
pos = -3,-99
[State 1310, Bind 6]
type = TargetBind
trigger1 = AnimElem = 20
pos = 57,-67
[State 1310, Bind 7]
type = TargetBind
trigger1 = AnimElem = 21
pos = -4,-76
[State 1310, Bind 1]
type = TargetBind
trigger1 = AnimElem = 22
pos = 57,-84
[State 1310, Bind 2]
type = TargetBind
trigger1 = AnimElem = 23
pos = -4,-76
[State 1310, Bind 3]
type = TargetBind
trigger1 = AnimElem = 24
pos = -65,-78
[State 1310, Bind 4]
type = TargetBind
trigger1 = AnimElem = 25
pos = -54,-73
[State 1310, Bind 5]
type = TargetBind
trigger1 = AnimElem = 26
pos = -3,-99
[State 1310, Bind 6]
type = TargetBind
trigger1 = AnimElem = 27
pos = 57,-67
[State 1310, Bind 7]
type = TargetBind
trigger1 = AnimElem = 28
pos = -4,-76
[State 1310, Bind 1]
type = TargetBind
trigger1 = AnimElem = 29
pos = 57,-84
[State 1310, Bind 2]
type = TargetBind
trigger1 = AnimElem = 30
pos = -4,-76
[State 1310, Bind 3]
type = TargetBind
trigger1 = AnimElem = 31
pos = -65,-78
[State 1310, Bind 4]
type = TargetBind
trigger1 = AnimElem = 32
pos = -54,-73
[State 1310, Bind 5]
type = TargetBind
trigger1 = AnimElem = 33
pos = -3,-99
[State 1310, Bind 6]
type = TargetBind
trigger1 = AnimElem = 34
pos = 57,-67
[State 1310, Bind 7]
type = TargetBind
trigger1 = AnimElem = 35
pos = -4,-76
[State 1310, Bind 6]
type = TargetBind
trigger1 = AnimElem = 36
pos = 57,-84

[State 1301, screenbound]
type = ScreenBound
trigger1 = 1
value = 0

[State 1310, SprPriority]
type = SprPriority
trigger1 = animelem = 36
value = -2

[State 1303, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = s3301,0

[State 1310, SprPriority]
type = SprPriority
trigger1 = animelem = 35
value = 1

[State 1310, Hurt]
type = TargetLifeAdd
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = -350

[State 1301, 1]
type = VelSet
trigger1 = AnimElem = 1
y = -20

[State 1301, Gravity]
type = Gravity
trigger1 = Pos y <-90


[State 1301, Changestate]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 3202
ctrl = 0
;----------------------------------------------------------------------
[Statedef 3202]
type = S
movetype= A
physics = S
velset = 0,0
anim = 3205
sprpriority =2

[State 3200, Text]
type = Explod
trigger1 = WinKO = 1
trigger1 = facing = 1
anim = 32999 ;34999
ID = 34999
bindtime = -1
pos = 154,107
scale = 0.6,0.6
postype = left
facing = 1
vfacing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause = 1

[State 3200, Text]
type = Explod
trigger1 = WinKO = 1
trigger1 = facing = -1
anim = 32999;34199
ID = 34199
bindtime = -1
pos = -154,107
scale = 0.6,0.6
postype = right
facing = -1
vfacing = 1
ownpal = -1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause = 1

[State 191, Comic Text]
type = Explod
trigger1 = AnimElem = 1
anim = 8010
ID = 8010
sprpriority = -2
postype = p1
pos = 57,-55 
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3200, Dust]
type = explod
trigger1 = animelem = 3
anim = 3211
sprpriority = 2
postype = p1
facing = -1
pos = -60, -ceil(pos y)
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = Time = 0
anim = 6204
ID = 6204
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 33
supermove
pausemove
scale = 1,1
sprpriority = 0
ontop = 1
shadow = 0,0,0
ownpal = 0
removeongethit = 0
;ignorehitpause =
;persistent =

[State 4233, BGPalFX]
type = BGPalFX
;triggerall = time >= 10
trigger1 = Time= 0 ;trigger1 =  (time % 10) = 5
;trigger1 = command = "HoldZ"
time = 10
time = 9999
add = 247,247,247
sinadd = 400,500,500,256

[State 1303, envshake]
type = EnvShake
trigger1 = time = 0
time = 20
freq = 110
ampl = -5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3300,4

[State 1303, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = s1300,0
volume = 50
channel = -1

[State 1303, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = s3300,2
volume = 50
channel = -1

[State 1303, ChangeState]
type = ChangeState
trigger1 = time = 20
value = 0
ctrl = 1
;-------------------------------------------------------------------------------
;---------------------------------------------------------------------------;
;ser lanzado por el oponente -kfm Throw-
;---------------------------------------------------------------------------;

[Statedef 8200]
type    = A
movetype= H
physics = N
velset = 0,0

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 820

[State 820, 2]
type = null;SelfState
trigger1 = !gethitvar(isbound)
value = 5050

[State 820, SelfState]
type = SelfState
trigger1 = Pos y >= 0
value = 5050

;---------------------------------------------------------------------------;
;Get Hit!
[Statedef 3203]
type    = S
movetype= A
physics = N
juggle  = 1
velset = -5,0
ctrl = 0
anim = 3207
poweradd = 0
sprpriority = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 3
value = S3300,5

[State 1303, envshake]
type = EnvShake
trigger1 = time = 0
time = 20
freq = 110
ampl = -5

[State 1318, Explod]
type = Explod
trigger1 = Movehit
trigger2 = Moveguarded 
trigger3 = Time >= 1
trigger3 = Vel x = 0
anim = 3880
pos = 0,0
postype = p1
;facing = 1
;vfacing = 1
;bindtime = 1
;vel = 0,0
;random = 0,0
;removetime = -2
supermove = 0
;pausemovetime = 0
scale = .5, .5
;sprpriority = 0
ontop = 1
;shadow = 0,0,0
;ownpal = 0
;removeongethit = 0
;ignorehitpause = 0
;persistent = 1

[State 191, Comic Text]
type = Explod
trigger1 = AnimElem = 2
anim = 8006
ID = 8006
sprpriority = -2
postype = p1
pos = 57,-55 
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 1651, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 5000,0+random%7

[State 1651, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;----------------------------------------------------------------------
;Call Shirley
[StateDef 3250]
type = S
movetype = A
physics = S
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3150
poweradd = -3000
sprpriority = 3
hitcountpersist = 1
facep2 = 1

[State 620, VarSet]
type = VarSet
trigger1 = AnimElem = 1
v = 50
value = 1

[State 3100, RemoveExplod]
type = RemoveExplod
trigger1 = WinKO
trigger2 = AnimTime = 0
id = 750

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 1
pos = 0,-50
anim = 102
sound = S20,0
time = 150
movetime = 150

[State 3100, Text]
type = Explod
trigger1 = WinKO = 1
trigger1 = facing = 1
anim = 31999
ID = 31999
bindtime = -1
pos = 154,107
scale = 0.6,0.6
postype = left
facing = 1
vfacing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause = 1

[State 3100, Text]
type = Explod
trigger1 = WinKO = 1
trigger1 = facing = -1
anim = 31199
ID = 31199
bindtime = -1
pos = -154,107
scale = 0.6,0.6
postype = right
facing = -1
vfacing = 1
ownpal = -1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause = 1

[State 3100, Hyper Portrait]
type = Explod
trigger1 = time = 0
anim = 3999
pos = 0,0
postype = back
facing = 1
bindtime = 1
removetime = 40
supermovetime = 30
sprpriority = 0
ontop = 0
ownpal = 1
scale = 0.5,0.5

[State 3200, Explod]
type = Explod
trigger1 = time = 0
anim = 4052
ID = 4052
pos = 0,0
postype = left
facing = 1
bindtime = -1
removetime = -2
sprpriority = -7
ownpal = 1
supermovetime = 70
removeongethit = 1

[State 502, Helper]
type = Helper
trigger1 = time = 7
ID = 3251
pos = -5,0
postype = p1
stateno = 6102
helpertype = normal
name = "Shirley"
keyctrl = 0
ownpal = 1
supermovetime = 30
pausemovetime = 30

[State 3200, Hyper Background]
type = Explod
trigger1 = AnimElem = 1
id = 750
anim = 750
pos = 0,0
postype = back
sprpriority = -3
removeongethit = 1
removetime = 390
bindtime = -1
supermove = 1
ownpal = 1
removeongethit = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = S196,2

[State 3100, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;-------------------------------------------------------------------------------
; Shirley
[Statedef 3251]
type    = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 3151

[State 0, ]
type = Explod
trigger1 = time = 5
anim = 1451
ID = 85
pos = 23,-40
postype = p1
bindtime = -1
vel = 0,0
random = 0,1
removetime = 65
supermove = 9999
scale = .5, .3
sprpriority = -5
ontop = 0
removeongethit = 1

[State 3050, 2]
type = HitDef
trigger1 = AnimElem = 5
attr = S, HT
damage = 15, 0
guardflag = MA
hitflag = MAF
pausetime = 0,0
priority = 7,hit
sparkno = s7038
sparkxy = -10, 16
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = -4
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -1.4,-3
air.hittime = 12
getpower = 0
givepower = -300
p2stateno = 60840
p2facing = 1
kill = var(10)
fall.kill = var(10)
guard.kill = var(10)

[State 3050, 2]
type = HitDef
trigger1 = AnimElem = 7
attr = S, HT
damage = 15, 0
guardflag = MA
hitflag = MAF
pausetime = 0,0
priority = 7,hit
sparkno = s7038
sparkxy = -10, 16
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = -4
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -1.4,-3
air.hittime = 12
getpower = 0
givepower = -300
p2stateno = 60841
p2facing = 1
kill = 0;var(10)
fall.kill = 0;var(10)
guard.kill = 0;var(10)

[State 3050, 2]
type = HitDef
trigger1 = AnimElem = 9
attr = S, HT
damage = 15, 0
guardflag = MA
hitflag = MAF
pausetime = 0,0
priority = 7,hit
sparkno = s7038
sparkxy = -10, 16
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = -4
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -1.4,-3
air.hittime = 12
getpower = 0
givepower = -300
p2stateno = 3253
p2facing = 1
kill = var(10)
fall.kill = var(10)
guard.kill = var(10)

[State 3050, 2]
type = HitDef
trigger1 = AnimElem = 11
attr = S, HT
damage = 15, 0
guardflag = MA
hitflag = MAF
pausetime = 0,0
priority = 7,hit
sparkno = s7038
sparkxy = -10, 16
hitsound = 5, 0
guardsound = 6, 0
ground.type = High
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = -4
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -1.4,-3
air.hittime = 12
getpower = 0
givepower = -300
p2facing = 1
kill = var(10)
fall.kill = var(10)
guard.kill = var(10)

[State 200, Onomatopoeia]
type = Explod
trigger1 = movehit = 1 && numtarget
trigger1 = target, time <= 0 && p2movetype = H
anim = 8013
postype = p1
pos = -10,-16
removetime = -2
ontop = 1
facing = facing
ownpal = 1
ignorehitpause = 1

[State 6001, PlaySnd2]
type = PlaySnd
trigger1 = AnimElem = 1
value = S3450,0
volume = 200
channel = 0

[State 6001, 1]
type = HitOverride
trigger1 = Time = 0
attr = SCA, AA, AP, AT
stateno = 3254
time = -1

[State 6001, 3]
type = SprPriority
trigger1 = Time = 0
value = 2

[State 6001, 3]
type = DestroySelf
trigger1 = AnimElem = 18
;------------------------------------------
;p2 bebe
[Statedef 60840]
type    = A
movetype= H
physics = N
sprpriority = 2
velset = 0,0

[State bebe1]
type = ChangeAnim
trigger1 = AnimExist(9108104) = 1
trigger1 = Anim != 9108104
value = 9108104

[State 0, AssertSpecial]
type = AssertSpecial
triggerall = anim != 9108104
trigger1 = time > 10
flag = invisible

[State amination]
type = lifeadd
Trigger1 = time = 120
value = -250

[State 7600, Fall Back]
type = gravity
trigger1 = Time >= 120

[State 7600, Change]
type = Selfstate
trigger1 = Pos Y > 0
value = 5100
;------------------------------------------
;p2 babe
[Statedef 60841]
type    = A
movetype= H
physics = N
sprpriority = 2
velset = 0,0

[State bebe1]
type = ChangeAnim
trigger1 = AnimExist(9021) = 1
trigger1 = Anim != 9021
value = 9021

[State 0, AssertSpecial]
type = AssertSpecial
triggerall = anim != 9021
trigger1 = time > 10
flag = invisible

[State amination]
type = lifeadd
Trigger1 = time = 120
value = -250

[State 7600, Fall Back]
type = gravity
trigger1 = Time >= 120

[State 7600, Change]
type = Selfstate
trigger1 = Pos Y > 0
value = 5100
;---------------------------------------------------------------------------
[Statedef 3253]
type    = S
movetype= H
physics = N

[State 2257, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 2257, 2]
type = PlayerPush
trigger1 = 1
value = 0

[State 2257, 3]
type = LifeAdd
trigger1 = Time = 0
value = -25
kill = 0

[State 2257, 4]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(19030) = 1
trigger1 = SelfAnimExist(19050) = 0
value = 19030

[State 2257, 5] ;Royal Judgement P2 Anim
type = Explod
trigger1 = Time = 0
trigger1 = SelfAnimExist(19050) = 1
anim = 19050
ID = 2257
pos = 0,-51
bindtime = -1
removetime = -1
sprpriority = 3
ownpal = 1

[State 2257, 6]
type = ChangeAnim2
triggerall = Time = 0
trigger1 = SelfAnimExist(19030) = 0
trigger2 = SelfAnimExist(19050) = 1
value = 2257

[State 2257, 7]
type = PlaySnd
triggerall = Time = 0
trigger1 = SelfAnimExist(19030) = 1
trigger2 = SelfAnimExist(19050) = 1
value = 19030,0

[State 2257, 8] ;Simulate HitShake
type = Offset
triggerall = Time <= 12
trigger1 = Time % 4 = [0,1]
x = 0

[State 2257, 9] ;Simulate HitShake
type = Offset
triggerall = Time <= 12
trigger1 = Time % 4 = [2,3]
x = -2



;;;
;------------------------------------------------------------------------------------------
; FINISHER
[Statedef 20000]
type    = S
movetype = A
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3350;3400
poweradd = -5000

[State 20000, 0]
type = Pause
trigger1 = time = 0
time = 215
movetime = 215

[State 20000, 1]
type = Explod
trigger1 = time = 0
anim = 20000
ID = 20000
pos = 0,-20;0,-50
postype = back
bindtime = -1
removetime = -2
scale = 0.6,0.6
supermove = 1
ontop = 1
sprpriority = 100
pausemovetime = -1

[State 20000, 2]
type = Explod
trigger1 = time = 0
anim = 20001
ID = 20001
pos = 105,160;105 90
accel = .01,0
postype = back
removetime = 116;98 190
scale = 0.6,0.6
supermove = 1
ontop = 1
sprpriority = 100
pausemovetime = -1

[State 20000, 3]
type = AllPalFX
trigger1 = time = 0
trigger2 = time = 190;98
trigger3 = animtime = 0
time = 5
add = 256,256,256
mul = 256,256,256
sinadd = 0,0,0,1
invertall = 0
color = 256

[State 20000, 4]
type = BGPalFX
trigger1 = time = 5
time = 98
add = 0,0,0
mul = 120,120,120
sinadd = 0,0,0,1
invertall = 0
color = 0

[State 20000, 4]
type = BGPalFX
trigger1 = time = 190;98
time = 88
add = 0,0,0
mul = 100,50,0
sinadd = 0,0,0,1
invertall = 0
color = 0

[State 20000, 5]
type = PlaySnd
trigger1 = time = 0
value = S20000,0

[State 20000, 6]
type = PlaySnd
trigger1 = time = 190;98
value = S20000,1

[State 20000, 7]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
flag2 = nomusic
flag3 = unguardable
ignorehitpause = 1
persistent = 1

[State 6000, Helper]
type = Helper
trigger1 = AnimElem = 2
ID = 20001
pos = 55,0
postype = p1
stateno = 20002
helpertype = normal
name = "King Ramses"
keyctrl = 0
ownpal = 1
supermove = 1
supermovetime = 65535
pausemovetime = 65535
supermovetime = 1
;size.xscale = 0.7
;size.yscale = 0.7

[State 20000, 5]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3500,0

[State 20000, 5]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3500,0

[State 20000, 16]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;;;;--

;-------------------------------------------------------------------------------
; King Ramses

[Statedef 20001]
type    = S
movetype= A
physics = N
velset = 6,0
ctrl = 0
anim = 3401

[State 6202, 1]
type = null;HitDef
trigger1 = AnimElem = 1
attr = S, NA			;Attribute: Standing, Normal Attack
damage = 25,7			;Damage that move inflicts, guard damage
animtype = Hard			;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA			;Flags on how move is to be guarded against
hitflag = MAF			;Flags of conditions that move can hit
pausetime = 8, 4			;Time attacker pauses, time opponent shakes
sparkxy = -18,-26		;X-offset for the "hit spark" rel. to p2,
guard.sparkno = S8012
guardsound = S6,1			;Sound to play on guard
ground.type = High		;Type: High, Low, Trip (def: Normal)
ground.slidetime = 15		;Time that the opponent slides back
ground.hittime  = 30		;Time opponent is in hit state
ground.velocity = -6.5,-2		;Velocity at which opponent is pushed
airguard.velocity = -1.9,-.8	;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High			;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -6.7,-5		;X-velocity at which opponent is pushed,
air.hittime = 25
p1stateno = 20002

[State 6201, 3]
type = SprPriority
trigger1 = Time = 0
value = 2

[State 6201, 2]
type = null;VelAdd
trigger1 = time = 0
x = 5

[State 6201, 3]
type = ChangeState
trigger1 = p2dist x < 40
value = 20002

;-------------------------------------------------------------------------------
; King Ramses's Attack
[Statedef 20002]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 3351
ctrl = 0

[State 6202, EnvShake]
type = EnvShake
trigger1 = AnimElem = 7
time = 15
freq = 30
ampl = -4
phase = 50

[State 0, DestroySelf]
type = DestroySelf
trigger1 = time = 185;210
;trigger2 = Frontedgedist <= -10
;ignorehitpause =
;persistent =



[State 52, Dust]
type = Explod
trigger1 = AnimElem = 7
anim = 7103
ID = 7103
sprpriority = -2
postype = p1
scale = 0.6, 0.6
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 20002, VelSet]
type = null;VelSet
trigger1 = time>=54;AnimElem = 11
x = -25

[State 20000, 5]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3500,1

[State 20000, 5]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3500,1

[State 6202, 1]
type = HitDef
trigger1 = time=0;AnimElem = 7
attr = S, NA			;Attribute: Standing, Normal Attack
damage = 9999,9999			;Damage that move inflicts, guard damage
animtype = Heavy
;guardflag = MA
hitflag = MAFD
priority = 3, Hit
pausetime = 8,8			;Time attacker pauses, time opponent shakes
sparkxy = -18,-26		;X-offset for the "hit spark" rel. to p2,
sparkno = -1
hitsound = S7,434
fall = 1
fall.recover=0
guardsound = S6,1   
p2stateno = 3965

[State 0, EnvColor]
type = EnvColor
trigger1 = movehit
trigger1 = time >= 5
value = 255,255,255
time = 5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = movehit
trigger1 = time = 0
value = S7,434
channel = -1
;abspan = 
;ignorehitpause = 
;persistent = 


[State 0, ]
type = EnvShake
trigger1 = AnimElem = 9
time = 40
;freq = 60
ampl = 40
;under = 0
;ignorehitpause = 

[State 0, TargetVelSet]
type = TargetVelSet
trigger1 = movehit
x = 5
y = -21
ignorehitpause = 1
;persistent = 

;persistent =                                                                


;-------------------------------------------------------------
[Statedef 3965]
type = A
movetype = H
physics = N
velset = 0,0

[State 8020, 1]
type = ChangeAnim2
Trigger1 = time >=0
value = 3352

[State 52, Dust]
type = Explod
trigger1 = time >=0
anim = 7103
ID = 7103
sprpriority = -2
postype = p1
scale = 0.6, 0.6
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 305]
type = ChangeState
triggerall = SelfAnimExist(9108106) = 1
;triggerall = time > 5
trigger1 = Vel X >= 0
value = 835

[State 0, SelfState]
type = SelfState
trigger1 = time >= 200
value = 5030

;----------------------------------------------------------------
