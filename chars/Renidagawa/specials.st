;------------------------------------------------------------------------------
; Can Throw
[Statedef 1000]
type = S
movetype = A
physics = S
anim = 1000
ctrl = 0
hitcountpersist = 1
poweradd = ifelse(!numhelper(3045),35,0)
facep2 = 1
velset = 0,0

[State 3000, 0]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;[State 3000, 0]
;type = ChangeState
;trigger1 = command = "holdfwd"  || command = "holdback" || command = "holdup" || command = "holddown"
;trigger1 = Animelem >= 6
;value = 0
;ctrl = 1

[State 3000, 1]
type = Helper
trigger1 = Anim = 1000 && Animelem = 2
name = "can"
pos = 50,-80
stateno = 1001
id = 1005
ownpal = 1
pausemovetime = 6

[State 400, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,6

[State 3000, 2]
type = PlaySnd
trigger1 = time = 0
value = 1,25
channel = 0
lowpriority = 1

;-------------------------------------------------------------------------------
;Can
;var(10) - set damage
;var(11) - set hitttime
;var(12) - fall?
;var(8) - bounced already?
;var(9) - hit already?
;var(19) - can condition ok ticks
;var(30) - from a super?
;var(33) - fade
;fvar(10) - hitvel x
;fvar(11) - hitvel y
;fvar(15) - amplifer
;fvar(16) - dampender
;fvar(23) - freq
[Statedef 1001]
type = A
movetype = A
physics = N
anim = ifelse(random<100,1004,1005)
sprpriority = 1
id = 1005
;velset = 0.75,-6
ctrl = 0
hitcountpersist = 1
juggle = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
trigger1 = anim = 1004
value = S2,7

[State 0, Freq]
type = VarRandom
trigger1 = 1
v = 23
range = 95,105
[State 0, VarSet]
type = VarSet
trigger1 = 1
fvar(23) = var(23)

[State 0, LOL ABK]
type = VelMul
trigger1 = 1
x = 0.99
;ignorehitpause =
[State 0, Condition OK]
type = VarAdd
trigger1 = parent,var(25)=1
trigger1 = ParentDist X = [0-(parent,var(22)),0-(parent,var(20))]
trigger1 = ParentDist y = [0-(parent,var(23)),0-(parent,var(21))]
var(19) = 1
[State 0, Condition NIET]
type = VarSet
trigger1 = parent,var(25)!=1
trigger2 = ParentDist X != [0-(parent,var(22)),0-(parent,var(20))]
trigger3 = ParentDist y != [0-(parent,var(23)),0-(parent,var(21))]
var(19) = 0
[State 1001, Damage Dampender]
type = AttackMulSet
trigger1 = numenemy
;trigger1 = enemynear, movetype = H
;trigger1 = EnemyNear, gethitvar(hitcount) > 0
;value =  ifelse((enemynear,gethitvar(hitcount) = [1,3]),1,ifelse((enemynear,gethitvar(hitcount) = [4,5]),.7,ifelse((enemynear,gethitvar(hitcount) =[6,7]),.5,ifelse((enemynear,gethitvar(hitcount) >= 8),.3,0))))
;value = ifelse(p2movetype!=H||(p2stateno=[120,169]),1+(.2*numhelper(3045)),1+(.2*numhelper(3045))-(parent,fvar(14)))
value = (parent,fvar(13))+(.15*numhelper(3045))
ignorehitpause = 1
[State ProRation]
type = ParentVarSet
trigger1 = movehit = 2
fvar(13) = (parent,fvar(13)) * 0.9
ignorehitpause = 1

[State BONK]
type = playsnd
triggerall = screenpos y >= -40
trigger1 = (var(19) = 1) && (!var(8))
trigger2 = movecontact = 2
trigger3 = frontedgedist <= -8
trigger3 = vel x > 0
trigger4 = backedgedist <= -8
trigger4 = vel x < 0
trigger5 = var(33) <= 20
trigger5 = vel y >= 2
trigger5 = vel y + pos y >= -8
value = 2,ifelse(anim=1004,ifelse(var(19)=1||movecontact=2,5,6),2)
freqmul = fvar(23) / 100
ignorehitpause = 1
[State 0, Helper]
type = Helper
trigger1 = anim = 1004
trigger1 = movehit = 2
trigger1 = numhelper(1003) < 3
helpertype = normal
name = "BONK!"
ID = 1003
stateno = 1003
pos = 0,0
postype = p1
ownpal = 1
supermovetime = 65535
pausemovetime = 65535
ignorehitpause = 1

[State 1001, Bend the can]
type = ChangeAnim
triggerall = anim = 1005
trigger1 = movecontact = 2
trigger2 = vel y >= 2
trigger2 = vel y + pos y >= -8
value = 1006
ignorehitpause = 1

[State 0, VelSet]
type = VelSet
trigger1 = movecontact = 2
trigger1 = var(12) = 0
x = -1.5
y = -4

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = !var(33)
movetype = A
[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = var(33)
movetype = I

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
trigger1 = var(8)
var(8) = 0
ignorehitpause = 1
[State 0, VarSet]
type = VarSet
trigger1 = movecontact = [1,3]
trigger1 = var(9) = 0
var(9) = 1
ignorehitpause = 1

[State 0, Default VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = prevstateno = 0
x = 0.70
y = -6.5
ignorehitpause = 1

[State 0, Default Values]
type = Null
trigger1 = time = [0,1]
trigger1 = prevstateno = 0
trigger1 = (var(10):=37)
trigger1 = (var(11):=7)
trigger1 = (var(12):=0)
trigger1 = (fvar(10):=-1)
trigger1 = (fvar(11):=-4)
ignorehitpause = 1

[State 1005, AngleDraw]
type = AngleDraw
trigger1 = 1; Time >= 1
scale = ifelse(anim=1004,0.375,0.75), ifelse(anim=1004,0.375,0.75)

[State 10005, test!]
type = AngleAdd
trigger1 = 1; Time >= 1
value = 0 - (vel x * 8)

[State 1005, 0]
type = HitDef
triggerall = !var(30)
trigger1 = Time > 1
trigger1 = var(9) = 0
trigger1 = movecontact != [1,3]
attr = S,SP
hitflag = MAF
guardflag = MA
animtype = light
air.animtype = diagup
priority = 3,hit
damage = var(10),2
pausetime = 0,4
sparkno = S800
guard.sparkno = S806
sparkxy = 0,0
hitsound = s1,ifelse(var(12),1,666)
guardsound = S2,ifelse(var(12),3,4)
ground.type = high
ground.slidetime = var(11)
ground.hittime = var(11)
ground.velocity = fvar(10),ifelse(var(12),fvar(11),0)
air.velocity = -2,-5.4;fvar(10),fvar(11)
down.velocity = -3,0
down.hittime = 20
down.bounce = 0
fall = var(12)
air.fall = 1
fall.recovertime = 40
getpower = 30,15
givepower = 18
id = 1000
yaccel = parent,fvar(12)
;nochainid = 1000
[State 1005, 0]
type = HitDef
triggerall = var(30)
trigger1 = Time > 1
trigger1 = var(9) = 0
trigger1 = movecontact != [1,3]
attr = S,HP
hitflag = MAF
guardflag = MA
animtype = light
air.animtype = diagup
priority = 3,hit
damage = var(10),2
pausetime = 0,4
sparkno = S800
guard.sparkno = S806
sparkxy = 0,0
hitsound = s1,ifelse(var(12),1,666)
guardsound = S2,ifelse(var(12),3,4)
ground.type = high
ground.slidetime = var(11)
ground.hittime = var(11)
ground.velocity = fvar(10),ifelse(var(12),fvar(11),0)
air.velocity = -2,-5.4;fvar(10),fvar(11)
down.velocity = -3,0
down.hittime = 20
down.bounce = 0
fall = var(12)
air.fall = 1
fall.recovertime = 40
getpower = 30,15
givepower = 18
id = 1000
yaccel = parent,fvar(12)
;nochainid = 1000

[State 1005, 0]
type = veladd
trigger1 = !var(33)
trigger1 = time%2 = 1
trigger2 = var(33)
y = ifelse(var(33),0.44,0.50)

[State 1005, 2]
type = nothitby
trigger1 = time = 0
trigger1 = var(30) <= 30
value =  SCA, NA, SA, HA, NT, ST, HT
[State 1005, 2]
type = nothitby
trigger1 = time > ifelse(var(30),30,0)
value =  , NT, ST, HT

[State 1005, 5]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
stateno = 1008
ignorehitpause = 1

[State 1005, safety]
type = posset
trigger1 = pos y >= 0
y = 0

;[State 1005,6]
;type = Changestate
;trigger1 = movecontact;movehit
;value = 1006


[State HIT, Hitspark]
type = explod
trigger1 = (var(19) = 1) && (!var(8))
trigger2 = (var(33) <= 20) && (frontedgedist <= -8) && (vel x > 0)
trigger3 = (var(33) <= 20) && (backedgedist <= -8) && (vel x < 0)
anim = 800
ontop = 1
[State HIT, AMP]
type = VarAdd
trigger1 = (var(19) = 1) && (!var(8))
fvar(15) = 0.07
[State HIT, DAMP]
type = VarAdd
trigger1 = (var(19) = 1) && (!var(8))
trigger1 = fvar(16) < 0.35
fvar(16) = 0.04
[State HIT, Split/Second Velocity]
type = Velset
trigger1 = (var(19) = 1) && (!var(8))
x = (parent,fvar(20)) * (1 + fvar(15))
y = (parent,fvar(21))
[State HIT, LET'S SETSAE]
type = Null
trigger1 = (var(19) = 1) && (!var(8))
trigger1 = (var(10):=(parent,var(24)))
trigger1 = (var(11):=(parent,var(26)))
trigger1 = (var(12):=1)
trigger1 = (fvar(10):=(parent,fvar(23)))
trigger1 = (fvar(11):=(parent,fvar(24)))
trigger1 = (var(8):=ceil(30* (1-fvar(16)) ))
trigger1 = (var(9):=0)
trigger1 = (var(33):=0)
;persistent = 0

[State 0, VarAdd]
type = VarSet
trigger1 = var(33)
trigger1 = var(8)
var(33) = 0
[State 0, VarAdd]
type = VarAdd
trigger1 = var(8) > 0
var(8) = -1
[State 0, VarAdd]
type = VarAdd
trigger1 = var(33)
trigger2 = var(33) = 0
trigger2 = vel y >= 0
trigger2 = vel y + pos y >= -8
var(33) = 1

[State 0, Get Ready To Bounce Agian]
type = VarSet
triggerall = var(8)
trigger1 = parent,var(25) = 0
;trigger1 = vel y + pos y >= -8
;trigger2 = frontedgedist <= -8
;trigger2 = vel x > 0
;trigger3 = backedgedist <= -8
;trigger3 = vel x < 0
;trigger4 = parent,var(25) = 0
var(8) = 0
[State 1005, Wallbounce Slightly...]
type = Veladd
trigger1 = frontedgedist <= -8
trigger1 = vel x > 0
trigger2 = backedgedist <= -8
trigger2 = vel x < 0
y = -1.5
[State 1005, Wallbounce Split/Second Velocity]
type = Velmul
trigger1 = frontedgedist <= -8
trigger1 = vel x > 0
trigger2 = backedgedist <= -8
trigger2 = vel x < 0
x = -0.75
y = ifelse(vel y>=0,-0.75,0.95)
;y = ifelse(vel y>=0,-1.1,1.0)
;persistent = 0

[State 0, VelMul]
type = VelMul
trigger1 = vel y >= 0
trigger1 = vel y + pos y >= -8
x = 0.5
[State 0, VelMul]
type = VelSet
trigger1 = vel y >= 0
trigger1 = vel y + pos y >= -8
y = -6
[State 1007, transparent aluminum]
type = Trans
trigger1 = var(33)
trans = addalpha
alpha = 256 - (var(33) * 4), var(33) * 4
[State 0, DestroySelf]
type = DestroySelf
trigger1 = var(33) >= 30
ignorehitpause = 1

;[State 1005,7]
;type = Changestate
;trigger1 = vel y + pos y >=-8
;value = 1007

[State 0, DisplayToClipboard]
type = DisplayToClipboard
trigger1 = 1
text = "bounced = %d, hit = %d, parent = %d/%d amp = %f"
params = var(8),var(9),floor(parentdist x),floor(parentdist y),1+fvar(15)
ignorehitpause = 1

;----------------------------------------
; BONK!
[Statedef 1003]
type = A
movetype = I
physics = N
anim = 1003
ctrl = 0
sprpriority = 555

[State 0, Turn]
type = Turn
trigger1 = facing = -1
trigger1 = time = 0
ignorehitpause = 1
[State 0, VarAdd]
type = VarAdd
trigger1 = time >= 5
fvar(0) = .05
[State 0, VarAdd]
type = VarAdd
trigger1 = time >= 5
var(0) = 21

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
value = 0
scale = .5+fvar(0),.5+fvar(0)
ignorehitpause = 1
[State 0, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256-var(0),var(0)
ignorehitpause = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = var(0) >= 220
ignorehitpause = 1


;----------------------------------------
; Can Bounced Back
[Statedef 1008]
type = A
movetype = A
physics = N
;anim = 1005
ctrl = 0
juggle = 2

[State 0, Freq]
type = VarRandom
trigger1 = 1
v = 23
range = 95,105
[State 0, VarSet]
type = VarSet
trigger1 = 1
fvar(23) = var(23)

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
var(33) = 0
[State HIT, DAMP]
type = VarAdd
trigger1 = time = 0
fvar(16) = 0.04

;[State 0, Test]
;type = ScreenBound
;trigger1 = 1
;value = 0
;movecamera = 0,1
;ignorehitpause = 1

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
var(9) = -1
ignorehitpause = 1
[State 0, HitVelSet]
type = HitVelSet
trigger1 = time = 0
x = 1
y = 1
[State 0, HitVelSet]
type = VelMul
trigger1 = time = 0
x = 1.6 + fvar(16)

[State 0, LOL ABK]
type = VelMul
trigger1 = 1
x = 0.99
;ignorehitpause =
[State 0, Condition OK]
type = VarAdd
trigger1 = parent,var(25)=1
trigger1 = ParentDist X = [0-(parent,var(22)),0-(parent,var(20))]
trigger1 = ParentDist y = [0-(parent,var(23)),0-(parent,var(21))]
var(19) = 1
[State 0, Condition NIET]
type = VarSet
trigger1 = parent,var(25)!=1
trigger2 = ParentDist X != [0-(parent,var(22)),0-(parent,var(20))]
trigger3 = ParentDist y != [0-(parent,var(23)),0-(parent,var(21))]
var(19) = 0
[State 1001, Damage Dampender]
type = AttackMulSet
trigger1 = numenemy
;trigger1 = enemynear, movetype = H
;trigger1 = EnemyNear, gethitvar(hitcount) > 0
;value =  ifelse((enemynear,gethitvar(hitcount) = [1,3]),1,ifelse((enemynear,gethitvar(hitcount) = [4,5]),.7,ifelse((enemynear,gethitvar(hitcount) =[6,7]),.5,ifelse((enemynear,gethitvar(hitcount) >= 8),.3,0))))
;value = ifelse(p2movetype!=H||(p2stateno=[120,169]),1+(.2*numhelper(3045)),1+(.2*numhelper(3045))-(parent,fvar(14)))
value = (parent,fvar(13))+(.15*numhelper(3045))
ignorehitpause = 1
[State ProRation]
type = ParentVarSet
trigger1 = movehit = 2
fvar(13) = (parent,fvar(13)) * 0.9
ignorehitpause = 1

[State BONK]
type = playsnd
triggerall = screenpos y >= -40
trigger1 = (var(19) = 1) && (!var(8))
trigger2 = movecontact = 2
trigger3 = frontedgedist <= -8
trigger3 = vel x > 0
trigger4 = backedgedist <= -8
trigger4 = vel x < 0
trigger5 = var(33) <= 20
trigger5 = vel y >= 2
trigger5 = vel y + pos y >= -8
trigger6 = time = 0
value = 2,ifelse(anim=1004,ifelse(var(19)=1||movecontact=2,5,6),2)
freqmul = fvar(23) / 100
ignorehitpause = 1
[State 1001, Bend the can]
type = ChangeAnim
triggerall = anim = 1005
trigger1 = movecontact = 2
trigger2 = vel y >= 2
trigger2 = vel y + pos y >= -8
value = 1006
ignorehitpause = 1
[State 0, Helper]
type = Helper
trigger1 = anim = 1004
trigger1 = movehit = 2
trigger1 = numhelper(1003) < 3
helpertype = normal
name = "BONK!"
ID = 1003
stateno = 1003
pos = 0,0
postype = p1
ownpal = 1
supermovetime = 65535
pausemovetime = 65535
ignorehitpause = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = !var(33)
movetype = A
[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = var(33)
movetype = I

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
trigger1 = var(8)
var(8) = 0
ignorehitpause = 1
[State 0, VarSet]
type = VarSet
trigger1 = movecontact = [1,3]
trigger1 = var(9) <= 0
var(9) = 1
ignorehitpause = 1

[State 1005, AngleDraw]
type = AngleDraw
trigger1 = 1; Time >= 1
scale = ifelse(anim=1004,0.375,0.75), ifelse(anim=1004,0.375,0.75)

[State 10005, test!]
type = AngleAdd
trigger1 = 1; Time >= 1
value = 0 - (vel x * 8)

[State 1005, 0]
type = HitDef
trigger1 = Time > 1
trigger1 = var(9) = -1
trigger1 = movecontact != [1,3]
attr = S,SP
hitflag = MAF
guardflag = MA
animtype = Heavy
air.animtype = diagup
priority = 3,hit
damage = 25,2
getpower = 75
givepower = 30
pausetime = 0,4
sparkno = S800
guard.sparkno = S806
sparkxy = 0,0
hitsound = s1,1
guardsound = S2,3
ground.type = low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = 2,-5
air.velocity = 2,-5
fall = 1
air.fall = 1
fall.recovertime = 40
getpower = ifelse(!numhelper(3045),60,0)
givepower = 18
id = 1000
;nochainid = 1000
affectteam = F
p2facing = 1
[State 1005, 0]
type = HitDef
trigger1 = Time > 1
trigger1 = var(9) = 0
trigger1 = movecontact != [1,3]
attr = S,SP
hitflag = MAF
guardflag = MA
animtype = light
air.animtype = diagup
priority = 3,hit
damage = var(10),2
pausetime = 0,4
sparkno = S800
guard.sparkno = S806
sparkxy = 0,0
hitsound = s1,ifelse(var(12),1,666)
guardsound = S2,ifelse(var(12),3,4)
ground.type = high
ground.slidetime = var(11)
ground.hittime = var(11)
ground.velocity = fvar(10),ifelse(var(12),fvar(11),0)
air.velocity = -2,-5.4;fvar(10),fvar(11)
down.velocity = -3,0
down.hittime = 20
down.bounce = 0
fall = var(12)
air.fall = 1
fall.recovertime = 40
getpower = ifelse((prevstateno=[3000,3100]),0,60)
givepower = 18
id = 1000
;nochainid = 1000

[State 1005, 0]
type = veladd
trigger1 = !var(33)
trigger1 = time%2 = 1
trigger2 = var(33)
y = ifelse(var(33),0.44,0.50)

[State 1005, 2]
type = nothitby
trigger1 = time >= 30
value =  , NT, ST, HT
time = 2
[State 1005, 2]
type = nothitby
trigger1 = time < 30
trigger2 = time = [30,40]
trigger2 = random < 500
value =  SCA, NA, SA, HA, NT, ST, HT

[State 1005, 5]
type = hitoverride
trigger1 = 1
attr = SCA, AA, AP, AT
stateno = 1008
ignorehitpause = 1

[State 1005, safety]
type = posset
trigger1 = pos y >= 0
y = 0

;[State 1005,6]
;type = Changestate
;trigger1 = movecontact;movehit
;value = 1006


[State HIT, Hitspark]
type = explod
trigger1 = (var(19) = 1) && (!var(8))
trigger2 = (var(33) <= 20) && (frontedgedist <= -8) && (vel x > 0)
trigger3 = (var(33) <= 20) && (backedgedist <= -8) && (vel x < 0)
anim = 800
ontop = 1
[State HIT, AMP]
type = VarAdd
trigger1 = (var(19) = 1) && (!var(8))
fvar(15) = 0.07
[State HIT, DAMP]
type = VarAdd
trigger1 = (var(19) = 1) && (!var(8))
trigger1 = fvar(16) < 0.35
fvar(16) = 0.04
[State HIT, Split/Second Velocity]
type = Velset
trigger1 = (var(19) = 1) && (!var(8))
x = (parent,fvar(20)) * (1 + fvar(15))
y = (parent,fvar(21))
[State HIT, LET'S SETSAE]
type = Null
trigger1 = (var(19) = 1) && (!var(8))
trigger1 = (var(10):=(parent,var(24)))
trigger1 = (var(11):=(parent,var(26)))
trigger1 = (var(12):=1)
trigger1 = (fvar(10):=(parent,fvar(23)))
trigger1 = (fvar(11):=(parent,fvar(24)))
trigger1 = (var(8):=ceil(30* (1-fvar(16)) ))
trigger1 = (var(9):=0)
trigger1 = (var(33):=0)
;persistent = 0

[State 0, VarAdd]
type = VarSet
trigger1 = var(33)
trigger1 = var(8)
var(33) = 0
[State 0, VarAdd]
type = VarAdd
trigger1 = var(8) > 0
var(8) = -1
[State 0, VarAdd]
type = VarAdd
trigger1 = var(33)
trigger2 = var(33) = 0
trigger2 = vel y >= 0
trigger2 = vel y + pos y >= -8
var(33) = 1

[State 0, Get Ready To Bounce Agian]
type = VarSet
triggerall = var(8)
trigger1 = parent,var(25) = 0
;trigger1 = vel y + pos y >= -8
;trigger2 = frontedgedist <= -8
;trigger2 = vel x > 0
;trigger3 = backedgedist <= -8
;trigger3 = vel x < 0
;trigger4 = parent,var(25) = 0
var(8) = 0
[State 1005, Wallbounce Slightly...]
type = Veladd
trigger1 = frontedgedist <= -8
trigger1 = vel x > 0
trigger2 = backedgedist <= -8
trigger2 = vel x < 0
y = -1.5
[State 1005, Wallbounce Split/Second Velocity]
type = Velmul
trigger1 = frontedgedist <= -8
trigger1 = vel x > 0
trigger2 = backedgedist <= -8
trigger2 = vel x < 0
x = -0.75
y = ifelse(vel y>=0,-0.75,0.95)
;y = ifelse(vel y>=0,-1.1,1.0)
;persistent = 0

[State 0, VelMul]
type = VelMul
trigger1 = vel y >= 0
trigger1 = vel y + pos y >= -8
x = 0.5
[State 0, VelMul]
type = VelSet
trigger1 = vel y >= 0
trigger1 = vel y + pos y >= -8
y = -6
[State 1007, transparent aluminum]
type = Trans
trigger1 = var(33)
trans = addalpha
alpha = 256 - (var(33) * 4), var(33) * 4
[State 0, DestroySelf]
type = DestroySelf
trigger1 = var(33) >= 30
ignorehitpause = 1



;-----------------------------------------------------------------------------
; Molotov Throw
[Statedef 1020]
type = S
movetype = A
physics = S
anim = 1020
ctrl = 0
hitcountpersist = 1
poweradd = ifelse(!numhelper(3045),35,0)
facep2 = 1
velset = 0,0

[State 1000, 0]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 400, 1]
type = Helper
trigger1 = Anim = 1020 && Animelem = 3
name = "molotov"
pos = 50,-80
stateno = 1025
id = 1025
ownpal = 1
pausemovetime = 6

[State 400, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,6

[State 400, 2]
type = PlaySnd
trigger1 = time = 0
value = 1,22
channel = 0
lowpriority = 1

[State 1027]
type = playerpush
trigger1 = movecontact
value = 0

;-----------------------------------------------------------------------------
; var(4) - angle
; var(8) - bounced already?
; var(9) - bounced?
; var(30) - from a super?
; Molotov
[Statedef 1025]
type = A
movetype = A
physics = N
anim = 1025
sprpriority = 1
id = 1005
;velset = 1,-6
ctrl = 0
hitcountpersist = 1

[State 0, VarSet]
type = VarSet
trigger1 = time = 0
var(30) = (prevstateno=[3000,3999])
[State 0, VarAdd]
type = VarAdd
trigger1 = Time >= 0 && Pos Y < 0
var(4) = floor(0 - (vel x * 3.5) - (vel y / 1.8))

[State 0, LOL ABK]
type = VelMul
trigger1 = 1
x = ifelse(var(9),0.94,0.99)
;ignorehitpause =
[State 0, Condition OK]
type = VarAdd
trigger1 = parent,var(25)=1
trigger1 = ParentDist X = [0-(parent,var(22)),0-(parent,var(20))]
trigger1 = ParentDist y = [0-(parent,var(23)),0-(parent,var(21))]
var(19) = 1
[State 0, Condition NIET]
type = VarSet
trigger1 = parent,var(25)!=1
trigger2 = ParentDist X != [0-(parent,var(22)),0-(parent,var(20))]
trigger3 = ParentDist y != [0-(parent,var(23)),0-(parent,var(21))]
var(19) = 0
[State 1001, Damage Dampender]
type = AttackMulSet
trigger1 = numenemy
value = (parent,fvar(13))+(.2*numhelper(3045))
ignorehitpause = 1

[State 1025]
type = velset
trigger1 = Time = 0
trigger1 = prevstateno = 0
;x = 1
x = ifelse((parent, stateno = 182), (((enemynear, Pos X)-Pos X)/43),1)
y = -6.3

[State 1025]
type = playerpush
trigger1 = 1
value = 0

[State 1025, 1]
type = Helper
trigger1 = time = 0
name = "wick"
pos = 0,1
stateno = 1026
id = 1026
ownpal = 1
pausemovetime = 55

[State 1025, Grabbity]
type = veladd
trigger1 = 1
y = ifelse(var(9),0.39,0.35)

[State 1025, AngleDraw]
type = AngleDraw
trigger1 = Time >= 0 && Pos Y <=0
scale = 0.75, 0.75
[State 1025, test!]
type = AngleSet
trigger1 = Time >= 0 && Pos Y < 0
value = var(4)

[State 1025]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 192,64

[State 1025, 0]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1025,0]
type = Posset
trigger1 = pos y >= 0
y = 0

[State 1025, 0]
type = velset
trigger1 = pos y >= 0
y = 0
x = 0

[State 1005, BONK]
type = playsnd
trigger1 = (var(19) = 1) && (!var(8))
value = 1,1
[State 1005, Hitspark]
type = explod
trigger1 = (var(19) = 1) && (!var(8))
anim = 800
ontop = 1
[State 1005, Split/Second Velocity]
type = Velset
trigger1 =(var(19) = 1) && (!var(8))
x = (parent,fvar(20) * 1.05)
y = (parent,fvar(21) * 0.95)
[State HIT, LET'S SETSAE]
type = Null
trigger1 = (var(19) = 1) && (!var(8))
trigger1 = (var(9):=1)
trigger1 = (var(8):=1)
[State 0, VarSet]
type = VarSet
trigger1 = (!var(19)) && (var(8))
var(8) = 0
[State 1005, Wallbounce BONK]
type = playsnd
trigger1 = frontedgedist <= -8
trigger1 = vel x > 0
trigger2 = backedgedist <= -8
trigger2 = vel x < 0
value = 1,48
;persistent = 0
[State 1005, Wallbounce Hitspark]
type = explod
trigger1 = frontedgedist <= -8
trigger1 = vel x > 0
trigger2 = backedgedist <= -8
trigger2 = vel x < 0
anim = 800
;persistent = 0
ontop = 1
[State 1005, Wallbounce Slightly...]
type = Veladd
trigger1 = frontedgedist <= -8
trigger1 = vel x > 0
trigger2 = backedgedist <= -8
trigger2 = vel x < 0
y = -1.5
[State 1005, Wallbounce Split/Second Velocity]
type = Velmul
trigger1 = frontedgedist <= -8
trigger1 = vel x > 0
trigger2 = backedgedist <= -8
trigger2 = vel x < 0
x = -0.5
;y = -0.5
;y = ifelse(vel y>=0,-1.1,1.0)
;persistent = 0

[State 1025, playsnd]
type = Playsnd
trigger1 = pos y >= 0
value = 2,0

[State 1025, 0]
type = Changestate
trigger1 = pos y >= 0;time = 37
value = 1027

;------------------------------------------------------------------
;Molotov Wick
[Statedef 1026]
type = A
movetype = A
physics = N
anim = 1026
sprpriority = 1
id = 1026
ctrl = 0
hitcountpersist = 1

;[State 1025]
;type = velset
;trigger1 = Time = 0
;x = 1
;y = -6

[State 1025]
type = playerpush
trigger1 = 1
value = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = 1
x = parentdist x
y = parentdist y + 1
ignorehitpause = 1

;[State 1025, Grabbity]
;type = veladd
;trigger1 = 1
;y = 0.35

;[State 1026, transparent aluminum]
;type = Trans
;trigger1 = Time = 1
;trans = addalpha
;alpha = 256

[State 1025, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 0.75, 0.75
[State 1025, test!]
type = AngleSet
trigger1 = 1
value = parent,var(4)

[State 1026]
type = Trans
trigger1 = 1
trans = add

[State 1025, 0]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1025,0]
type = Posset
trigger1 = pos y >= 0
y = 0

[State 1026]
type = Destroyself
trigger1 = parent,stateno != 1025
trigger1 = parent,stateno != 3101
;trigger1 = time = 44

;-------------------------------------------------------------------
;Molotov Explosion
[Statedef 1027]
type = C
movetype = A
physics = N
anim = 1027
sprpriority = -2
id = 1027
ctrl = 0
velset = 0,0
hitcountpersist = 1

[State 1025, 0]
type = Helper
trigger1 = time=0 && NumHelper(1029) <= 10
name = "glass"
ID = 1029
pos = 0+random%6, -1
stateno = 1029
ownpal = 1

[State 1025, 0]
type = Helper
trigger1 = time=0 && NumHelper(1029) <= 10
name = "glass"
ID = 1029
pos = 0+random%6, -1
stateno = 1029
ownpal = 1

[State 1025, 0]
type = Helper
trigger1 = time=0 && NumHelper(1029) <= 10
name = "glass"
ID = 1029
pos = 0+random%6, -1
stateno = 1029
ownpal = 1

[State 1025, 0]
type = Helper
triggerall = !var(30) ; Less graphic intensive
trigger1 = time=0 && NumHelper(1029) <= 10
name = "glass"
ID = 1029
pos = 0+random%6, -1
stateno = 1029
ownpal = 1

[State 1025, 0]
type = Helper
triggerall = !var(30) ; Less graphic intensive
trigger1 = time=0 && NumHelper(1029) <= 10
name = "glass"
ID = 1029
pos = 0+random%6, -1
stateno = 1029
ownpal = 1

[State 1025, 0]
type = Helper
triggerall = !var(30) ; Less graphic intensive
trigger1 = time=0 && NumHelper(1029) <= 10;time = 37
name = "glass"
ID = 1029
pos = 0+random%6, -1
stateno = 1029
ownpal = 1

[State 1120]
type = explod
trigger1 = Time = 0
id = 803
anim = 803
pos = 0,0
scale = 1, 1
sprpriority = 2
;ignorehitpause = 1

[State 1001, Damage Dampender]
type = AttackMulSet
trigger1 = numenemy
;trigger1 = enemynear, movetype = H
;trigger1 = EnemyNear, gethitvar(hitcount) > 0
;value =  ifelse((enemynear,gethitvar(hitcount) = [1,3]),1,ifelse((enemynear,gethitvar(hitcount) = [4,5]),.7,ifelse((enemynear,gethitvar(hitcount) =[6,7]),.5,ifelse((enemynear,gethitvar(hitcount) >= 8),.3,0))))
;value = ifelse(p2movetype!=H||(p2stateno=[120,169]),1+(.2*numhelper(3045)),1+(.2*numhelper(3045))-(parent,fvar(14)))
value = (parent,fvar(13))+(.15*numhelper(3045))
ignorehitpause = 1
[State ProRation]
type = ParentVarSet
trigger1 = movehit = 2
fvar(13) = (parent,fvar(13)) * 0.95
ignorehitpause = 1

[State 1027]
type = Angleset
trigger1 = time = 0
value = 0

[State 1027]
type = velset
trigger1 = vel x >= 0
trigger2 = vel x <= 0
trigger3 = movecontact
x = 0

[State 1027]
type = playerpush
trigger1 = 1
trigger2 = Time <= 30
value = 0

[State 1027]
type = posfreeze
trigger1 = movecontact
value = 1

[State 1028]
type = AssertSpecial
trigger1 = 1
flag = Noshadow

[State 1005, AngleDraw]
type = AngleDraw
trigger1 = Time >= 0; && Time <=18
scale = 0.1+((0.1*Time)/2)

[State 1027, transparent aluminum]
type = Trans
trigger1 = Time = [0,64]
trans = addalpha
alpha = 256 - (time * 7), time * 7

[State 1027, I'm hit]
type = HitDef
triggerall = !var(30)
trigger1 = Animelem = 1 || Animelem = 3 || Animelem = 5
attr = C,SP
hitflag = MAF
guardflag = MA
animtype = Heavy
priority = 3,hit
damage = 35,2
pausetime = 3,9
sparkno = S801
guard.sparkno = S806
sparkxy = 0,0
hitsound = S1,1
guardsound = S2,4
ground.type = low
ground.slidetime = 8
ground.hittime = 10
ground.velocity = -8
ground.cornerpush.veloff = 0
air.velocity = -1,-3
down.velocity = -2,0
down.hittime = 10
down.bounce = 0
yaccel = parent,fvar(12)
air.fall = 1
getpower = 60,30
givepower = 18
[State 1027, I'm hit]
type = HitDef
triggerall = var(30)
trigger1 = Animelem = 1 || Animelem = 3 || Animelem = 5
attr = C,HP
hitflag = MAF
guardflag = MA
animtype = Heavy
priority = 3,hit
damage = 30,2
pausetime = 3,9
sparkno = S801
guard.sparkno = S806
sparkxy = 0,0
hitsound = S1,1
guardsound = S2,4
ground.type = low
ground.slidetime = 8
ground.hittime = 10
ground.velocity = -8
ground.cornerpush.veloff = 0
air.velocity = -1,-3
down.velocity = -2,0
down.hittime = 10
down.bounce = 0
yaccel = parent,fvar(12)
air.fall = 1
getpower = 60,30
givepower = 18

[State 1027, fire]
type = explod
trigger1 = Time = 1
random = 3, 3
pos = 0,-15
anim = 1028
id = 1028
removetime = ifelse((parent, stateno = [181,189]),-1,-2)
scale = 0.5,0.5
sprpriority = ifelse((parent, stateno = [181,189]),6,1)

[State 1027, fire]
type = explod
trigger1 = Time = 8
random = 3, 3
pos = 15,0
id = 1028
anim = 1028
removetime = ifelse((parent, stateno = [181,189]),-1,-2)
scale = 0.60, 0.60
sprpriority = ifelse((parent, stateno = [181,189]),7,2)

[State 1027, fire]
type = explod
trigger1 = Time = 8
random = 3, 3
pos = -15,0
id = 1028
anim = 1028
removetime = ifelse((parent, stateno = [181,189]),-1,-2)
scale = 0.60, 0.60
sprpriority = ifelse((parent, stateno = [181,189]),7,2)

[State 1027, fire]
type = explod
trigger1 = Time = 15
pos = 35,-15
random = 3, 3
id = 1028
anim = 1028
removetime = ifelse((parent, stateno = [181,189]),-1,-2)
scale = 0.65, 0.65
sprpriority = ifelse((parent, stateno = [181,189]),6,1)

[State 1027, fire]
type = explod
trigger1 = Time = 15
random = 3, 3
pos = -35,-15
id = 1028
anim = 1028
removetime = ifelse((parent, stateno = [181,189]),-1,-2)
scale = 0.7, 0.7
sprpriority = ifelse((parent, stateno = [181,189]),6,1)

[State 1027, fire]
type = explod
trigger1 = Time = 21
random = 3, 3
pos = 20,0
id = 1028
anim = 1028
removetime = ifelse((parent, stateno = [181,189]),-1,-2)
scale = 0.60, 0.60
sprpriority = ifelse((parent, stateno = [181,189]),7,2)

[State 1027, fire]
type = explod
trigger1 = Time = 21
random = 3, 3
pos = -20,0
id = 1028
anim = 1028
removetime = ifelse((parent, stateno = [181,189]),-1,-2)
scale = 0.60, 0.60
sprpriority = ifelse((parent, stateno = [181,189]),7,2)

[State 1027, fire]
type = explod
trigger1 = Time = 27
random = 3, 3
pos = 55,-15
id = 1028
anim = 1028
removetime = ifelse((parent, stateno = [181,189]),-1,-2)
scale = 0.7, 0.7
sprpriority = ifelse((parent, stateno = [181,189]),6,1)

[State 1027, fire]
type = explod
trigger1 = Time = 27
random = 3, 3
pos = -55,-15
id = 1028
anim = 1028
removetime = ifelse((parent, stateno = [181,189]),-1,-2)
scale = 0.7, 0.7
sprpriority = ifelse((parent, stateno = [181,189]),6,1)

[State 1027, 2]
type = nothitby
trigger1 = 1
value =  SCA

[State 1027,7]
type = destroyself
trigger1 = animtime = 0
;-----------------------------------------------------
;Glass shards for Molotov
[Statedef 1029]
type = A
movetype = A
physics = N
anim = 1029+random%3
sprpriority = 1
id = 1029
velset = 0,-6.5
ctrl = 0
hitcountpersist = 1

[State 0, Better]
type = VarRandom
trigger1 = time = 0
v = 0
range = -40,40
ignorehitpause = 1
[State 0, Randomization]
type = VarSet
trigger1 = time = 0
fvar(0) = var(0)
[State 0, People]
type = VelSet
trigger1 = time = 0
x = fvar(0)/10

[State 1025]
type = playerpush
trigger1 = 1
value = 0

[State 1025, Grabbity]
type = veladd
trigger1 = 1
y = 0.44

[State 1025]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 192,64

[State 0, AngleSet]
type = AngleSet
trigger1 = time = 0
value = random%350
[State 1025, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 0.75, 0.75
[State 1025, test!]
type = AngleAdd
trigger1 = 1
value = 0-(vel x * 5)

[State 1026]
type = Trans
trigger1 = 1
trans = add

[State 1025, 0]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1025,0]
type = Posset
trigger1 = pos y >= 0
y = 0

[State 1025, 0]
type = velset
trigger1 = pos y >= 0
y = 0
x = 0

[State 1026]
type = Destroyself
trigger1 = pos y >= 0

;-------------------------------------------------------------------------------
;Brick Throw
[Statedef 1040]
type = S
movetype = A
physics = S
anim = 1040
ctrl = 0
hitcountpersist = 1
poweradd = ifelse(!numhelper(3045),35,0)
facep2 = 1
velset = 0,0

[State 1000, 0]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 220, 0]
type = playsnd
trigger1 = Animelem = 1
value = 0,0
channel = 0

[State 400, 1]
type = Helper
trigger1 = Anim = 1040 && Animelem = 2
name = "brick"
pos = 50,-80
stateno = 1045
id = 1045
ownpal = 1
pausemovetime = 6

[State 400, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,6

[State 1027]
type = playerpush
trigger1 = movecontact
value = 0

;-------------------------------------------------------------
; Brick
; var(30) - from a super?
[Statedef 1045]
type = A
movetype = A
physics = N
anim = 1045
sprpriority = 1
id = 1045
;velset = 1.5,-6
ctrl = 0
hitcountpersist = 1

[State 0, DisplayToClipboard]
type = DisplayToClipboard
trigger1 = 1
text = "%f, %f"
params = parentdist x,parentdist y
ignorehitpause = 1

[State 1025]
type = varset
trigger1 = Time = 0
var(30) = (prevstateno=[3000,3100])

[State 1025]
type = velset
trigger1 = Time = 0
trigger1 = prevstateno = 0
;x = 1
x = 1.5
y = -6

[State 1005, Wallbounce BONK]
type = playsnd
trigger1 = frontedgedist <= -12
trigger1 = vel x > 0
trigger2 = backedgedist <= -12
trigger2 = vel x < 0
value = 1,48
;persistent = 0
[State 1005, Wallbounce Hitspark]
type = explod
trigger1 = frontedgedist <= -12
trigger1 = vel x > 0
trigger2 = backedgedist <= -12
trigger2 = vel x < 0
anim = 800
;persistent = 0
ontop = 1
[State 1005, Wallbounce Split/Second Velocity]
type = Velmul
trigger1 = frontedgedist <= -12
trigger1 = vel x > 0
trigger2 = backedgedist <= -12
trigger2 = vel x < 0
x = -0.5
;y = ifelse(vel y>=0,-1.1,1.0)
;persistent = 0

[State 0, Condition OK]
type = VarAdd
trigger1 = parent,var(25)=1
trigger1 = ParentDist X = [-17-(parent,var(22)),17-(parent,var(20))]
trigger1 = ParentDist y = [-17-(parent,var(23)),17-(parent,var(21))]
trigger1 = parent,stateno=1240
var(19) = 1
[State 0, Condition NIET]
type = VarSet
trigger1 = parent,var(25)!=1
trigger2 = ParentDist X != [-17-(parent,var(22)),17-(parent,var(20))]
trigger3 = ParentDist y != [-17-(parent,var(23)),17-(parent,var(21))]
trigger4 = parent,stateno!=1240
var(19) = 0
;[State 1001, Damage Dampender]
;type = AttackMulSet
;trigger1 = EnemyNear, gethitvar(hitcount) > 0
;value =  ifelse((enemynear,gethitvar(hitcount) = [1,3]),1,ifelse((enemynear,gethitvar(hitcount) = [4,5]),.7,ifelse((enemynear,gethitvar(hitcount) =[6,7]),.5,ifelse((enemynear,gethitvar(hitcount) >= 8),.3,0))))
;ignorehitpause = 1

[State 1025]
type = playerpush
trigger1 = 1
value = 0

[State 1025, Grabbity]
type = veladd
trigger1 = 1
y = 0.44

[State 1025, AngleDraw]
type = AngleDraw
trigger1 = Time >= 1 && Pos Y <=0
scale = 1, 1

[State 1025, test!]
type = AngleAdd
trigger1 = Time >= 1 && Pos Y < 0
value = -3

[State 1025, afterimages]
type = afterimage
trigger1 = Time = 0
time = -1
length = 4
framegap = 1
trans = add

[State 1025, 0]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1025,0]
type = Posset
trigger1 = pos y >= 0
y = 0

[State 1025, 0]
type = velset
trigger1 = pos y >= 0
y = 0
x = 0

[State 1025, 0]
type = ChangeState
;trigger1 = time = 34
trigger1 = vel y > 0
trigger1 = pos y >= -24
trigger2 = var(19) = 1
value = 1046

;-------------------------------------------------------------
; Brick Joke
[Statedef 1046]
type = A
movetype = A
physics = N
anim = 1044
sprpriority = 1
;id = 1046
velset = 0,0
ctrl = 0
hitcountpersist = 1

[State 0, For OTG]
type = VelSet
trigger1 = numenemy
trigger1 = p2statetype = L
trigger1 = time = 1
trigger1 = var(19)
y = 4
ignorehitpause = 1

[State 0, AfterImageTime]
type = AfterImageTime
trigger1 = time = 0
time = 0
ignorehitpause = 1

[State 1001, Damage Dampender]
type = AttackMulSet
trigger1 = numenemy
;trigger1 = enemynear, movetype = H
;trigger1 = EnemyNear, gethitvar(hitcount) > 0
;value =  ifelse((enemynear,gethitvar(hitcount) = [1,3]),1,ifelse((enemynear,gethitvar(hitcount) = [4,5]),.7,ifelse((enemynear,gethitvar(hitcount) =[6,7]),.5,ifelse((enemynear,gethitvar(hitcount) >= 8),.3,0))))
;value = ifelse(p2movetype!=H||(p2stateno=[120,169]),1+(.2*numhelper(3045)),1+(.2*numhelper(3045))-(parent,fvar(14)))
value = (parent,fvar(13))+(.15*numhelper(3045))
ignorehitpause = 1
[State ProRation]
type = ParentVarSet
trigger1 = movehit = 1
fvar(13) = (parent,fvar(13)) * 0.85
ignorehitpause = 1
persistent = 0

[State 1120]
type = explod
trigger1 = Time = 0
id = 803
anim = 803
pos = 0,0-floor(pos y / 2)
scale = 1, 1
sprpriority = 2
ignorehitpause = 1
persistent = 0

[State 1027, NS I'm hit]
type = HitDef
trigger1 = !var(19)
trigger1 = !var(30)
trigger1 = Time = 0
attr = S,SP
hitflag = MAF
guardflag = MA
animtype = Heavy
priority = 3,hit
damage = 95,2
pausetime = 3,9
sparkno = S801
guard.sparkno = S806
sparkxy = 0,0
hitsound = S1,5
guardsound = S2,3
ground.type = low
ground.slidetime = 8
ground.hittime = 15
ground.velocity = -7,0
ground.cornerpush.veloff = 0
air.velocity = -2.5,-3.5
getpower = 60,30
givepower = 40
fall.recover = 0
air.fall = 1
down.velocity = -3,-3.5
down.hittime = 12
[State 1027, ES I'm hit]
type = HitDef
trigger1 = var(19)
trigger1 = !var(30)
trigger1 = Time = 0
attr = S,SP
hitflag = MAFD
guardflag = MA
animtype = up
priority = 4,hit
damage = 65,5
pausetime = 3,9
sparkno = S801
guard.sparkno = S806
sparkxy = 0,0
hitsound = S1,5
guardsound = S2,3
ground.type = low
ground.slidetime = 8
ground.hittime = 20
ground.velocity = -0.5,-12
ground.cornerpush.veloff = 0
air.velocity = -0.5,-12
getpower = 60,30
yaccel = parent,fvar(12) + 0.09
givepower = 40
fall = 1
fall.recover = 0
air.fall = 1
down.velocity = -3,-7.8
down.hittime = 16
[State 1027, NH I'm hit]
type = HitDef
trigger1 = !var(19)
trigger1 = var(30)
trigger1 = Time = 0
attr = S,HP
hitflag = MAF
guardflag = MA
animtype = Heavy
priority = 3,hit
damage = 95,2
pausetime = 3,9
sparkno = S801
guard.sparkno = S806
sparkxy = 0,0
hitsound = S1,5
guardsound = S2,3
ground.type = low
ground.slidetime = 8
ground.hittime = 15
ground.velocity = -7,0
ground.cornerpush.veloff = 0
air.velocity = -2.5,-3.5
getpower = 60,30
givepower = 40
fall.recover = 0
air.fall = 1
down.velocity = -3,-3.5
down.hittime = 12
[State 1027, EH I'm hit]
type = HitDef
trigger1 = var(19)
trigger1 = var(30)
trigger1 = Time = 0
attr = S,HP
hitflag = MAFD
guardflag = MA
animtype = up
priority = 4,hit
damage = 65,5
pausetime = 3,9
sparkno = S801
guard.sparkno = S806
sparkxy = 0,0
hitsound = S1,5
guardsound = S2,3
ground.type = low
ground.slidetime = 8
ground.hittime = 20
ground.velocity = -0.5,-12
ground.cornerpush.veloff = 0
air.velocity = -0.5,-12
getpower = 60,30
yaccel = parent,fvar(12) + 0.09
givepower = 40
fall = 1
fall.recover = 0
air.fall = 1
down.velocity = -3,-7.8
down.hittime = 16

[State 1025, 0]
type = Helper
triggerall = NumHelper(1047) <= 7
trigger1 = time = 0
name = "cement"
ID = 1047
pos = 0+random%6, -1
stateno = 1047
ownpal = 1
persistent = 0

[State 1025, 0]
type = Helper
triggerall = NumHelper(1047) <= 7
trigger1 = time = 0
name = "cement"
ID = 1047
pos = 0+random%6, 1
stateno = 1047
ownpal = 1
persistent = 0

[State 1025, 0]
type = Helper
triggerall = NumHelper(1047) <= 7
trigger1 = time = 0
name = "cement"
ID = 1047
pos = 0+random%6, 2
stateno = 1047
ownpal = 1
persistent = 0

[State 1025, 0]
type = Helper
triggerall = NumHelper(1047) <= 7
trigger1 = time = 0
name = "cement"
ID = 1047
pos = 0+random%6, -2
stateno = 1047
ownpal = 1
persistent = 0

[State 1025, 0]
type = Helper
triggerall = NumHelper(1047) <= 7
trigger1 = time = 0
name = "cement"
ID = 1047
pos = 0+random%6, 3
stateno = 1047
ownpal = 1
persistent = 0

[State 1025, 0]
type = Helper
triggerall = !var(30) ; Less graphic intensive
triggerall = NumHelper(1047) <= 7
trigger1 = time = 0
name = "cement"
ID = 1047
pos = 0+random%6, -3
stateno = 1047
ownpal = 1
persistent = 0

[State 1025, 0]
type = Helper
triggerall = var(30) != 0 ; Less graphic intensive
triggerall = NumHelper(1047) <= 7
trigger1 = time = 0
name = "cement"
ID = 1047
pos = 0+random%6, -1
stateno = 1047
ownpal = 1
persistent = 0

[State 1025, playsnd]
type = Playsnd
trigger1 = time = 0
value = 1,3

[State 1025, 0]
type = Destroyself
trigger1 = animtime = 0

;----------------------------------------------------------------------------
;Cement pieces for Brick
[Statedef 1047]
type = A
movetype = A
physics = N
anim = 1046+random%4
sprpriority = 1
id = 1047
velset = 0,-5
ctrl = 0
hitcountpersist = 1

[State 0, Better]
type = VarRandom
trigger1 = time = 0
v = 0
range = -50,50
ignorehitpause = 1
[State 0, Randomization]
type = VarSet
trigger1 = time = 0
fvar(0) = var(0)
[State 0, People]
type = VelSet
trigger1 = time = 0
x = fvar(0)/10

[State 1025]
type = playerpush
trigger1 = 1
value = 0

[State 1025, Grabbity]
type = gravity
trigger1 = 1

[State 0, AngleSet]
type = AngleSet
trigger1 = time = 0
value = random%350
[State 1025, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 0.75, 0.75
[State 1025, test!]
type = AngleAdd
trigger1 = 1
value = 0-(vel x * 4)

[State 1025, 0]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1025,0]
type = Posset
trigger1 = pos y >= 0
y = 0

[State 1025, 0]
type = velset
trigger1 = pos y >= 0
y = 0
x = 0

[State 0, Crusty]
type = Explod
trigger1 = pos y + vel y >= 0
anim = F120
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
supermovetime = 65
pausemovetime = 65
scale = 1,1
sprpriority = 4
;ontop = 1
ownpal = 1
ignorehitpause = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 4
movetype = I

[State 1026]
type = Destroyself
trigger1 = pos y + vel y >= 0

;----------------------------------------------------------------------------
;Feint
[Statedef 1100]
type = S
movetype = A
physics = N
anim = 1100
ctrl = 0
;velset = 0,0
facep2 = (pos y=0)

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = statetype != A
x = 0
ignorehitpause = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = time = 0
trigger1 = pos y < 0
statetype = A
ignorehitpause = 1
[State 0, Gravity]
type = Veladd
trigger1 = statetype = A
trigger1 = animelemtime(4) >= 0
y = 0.5
[State 0, PosSet]
type = PosSet
trigger1 = vel y + pos y >= 0
y = 0
ignorehitpause = 1
[State 0, PosSet]
type = VelSet
trigger1 = vel y + pos y >= 0
y = 0
ignorehitpause = 1
[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = statetype = A
trigger1 = pos y >= 0
statetype = S
ignorehitpause = 1
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
trigger1 = statetype = A
value = anim
elem = 2
ignorehitpause = 1
[State 0, ChangeAnim]
type = PosAdd
trigger1 = time = 0
trigger1 = statetype = A
y = -20
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = statetype != A
trigger1 = animelem = 8
x = 2
[State 0, PosAdd]
type = PosAdd
trigger1 = statetype != A
trigger1 = animelem = 9
x = 9
[State 0, PosAdd]
type = PosAdd
trigger1 = statetype != A
trigger1 = animelem = 10
x = 4

[State 1120]
type = explod
trigger1 = statetype != A
trigger1 = Animelem = 4
id = 804
anim = 804
pos = 0,0
vel = -1,0
sprpriority = 2
ignorehitpause = 1
persistent = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S1,0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = statetype != A
trigger1 = animelem = 8
value = S1,49

[State 0, ReversalDef]
type = ReversalDef
trigger1 = animelemtime(4) >= 0 && animelemtime(4) <= 3
trigger2 = animelemtime(5) >= 0 && animelemtime(5) <= 3
trigger3 = animelemtime(6) >= 0 && animelemtime(6) <= 3
reversal.attr = SCA, AA, AP
hitflag = MAF
numhits = 0
pausetime = 10,11
sparkno = S806
hitsound = S2,3
sparkxy = 0,-10

[State 1120]
type = velset
trigger1 = Animelem = 4
x = 30

[State 1100]
type = velmul
triggerall = !vel x <= 0
trigger1 = Animelem >= 4
trigger2 = Animelemno(4)>= 2
x = ifelse(statetype!=A,0.8,0.85)

;[State 1100]
;type = velmul
;trigger1 = Animelem >= 4
;trigger1 = !vel x <= 0
;value = 0.5

[State 1100]
type = helper
trigger1 = Animelem = 4
name = "dashlines1"
id = 1105
stateno = 1105
ownpal = 1
pos = 0,-60
[State 1100]
type = helper
trigger1 = Animelem = 4
name = "afterimage"
id = 1101
stateno = 1101
ownpal = 1
pos = -3,0
[State 1100]
type = helper
trigger1 = Animelem = 4
name = "afterimage"
id = 1102
stateno = 1102
ownpal = 1
pos = 3,0
[State 1100]
type = helper
trigger1 = Animelem = 4
name = "afterimage"
id = 1103
stateno = 1103
ownpal = 1
pos = 6,0

[State 1100]
type = velset
trigger1 = statetype != A
trigger1 = Animelem = 9
x = 0

[State 1100]
type = changestate
trigger1 = statetype = A
trigger1 = animelem = 11
value = 50
ctrl = 1
[State 1100]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;-----------------------------------------------------------------------------
[Statedef 1101]
type = S
movetype = A
physics = N
;anim = 1105
velset = -2,0;0-(parent,vel x)*0.25,0
sprpriority = 5

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = parent,anim
elem = parent,animelemno(0)
ignorehitpause = 1

[State 0, VarAdd]
type = VarAdd
trigger1 = !(parent,HitPauseTime)
fvar(0) = 1
[State 0, VarAdd]
type = VarAdd
trigger1 = !(parent,HitPauseTime)
var(0) = 1
[State 1025]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256-(var(0)*25),256
ignorehitpause = 1
[State 0, PosFreeze]
type = PosFreeze
trigger1 = parent,HitPauseTime
value = 1
ignorehitpause = 1

[State 1100]
type = Destroyself
trigger1 = var(0) > 10

;-----------------------------------------------------------------------------
[Statedef 1102]
type = S
movetype = A
physics = N
;anim = 1105
velset = 2,0;0-(parent,vel x)*0.25,0
sprpriority = 5

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = parent,anim
elem = parent,animelemno(0)
ignorehitpause = 1

[State 0, VarAdd]
type = VarAdd
trigger1 = !(parent,HitPauseTime)
fvar(0) = 1
[State 0, VarAdd]
type = VarAdd
trigger1 = !(parent,HitPauseTime)
var(0) = 1
[State 1025]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256-(var(0)*25),256
ignorehitpause = 1
[State 0, PosFreeze]
type = PosFreeze
trigger1 = parent,HitPauseTime
value = 1
ignorehitpause = 1

[State 1100]
type = Destroyself
trigger1 = var(0) > 10

;-----------------------------------------------------------------------------
[Statedef 1103]
type = S
movetype = A
physics = N
;anim = 1105
velset = 6,0;0-(parent,vel x)*0.25,0
sprpriority = 5

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = parent,anim
elem = parent,animelemno(0)
ignorehitpause = 1

[State 0, VarAdd]
type = VarAdd
trigger1 = !(parent,HitPauseTime)
fvar(0) = 1
[State 0, VarAdd]
type = VarAdd
trigger1 = !(parent,HitPauseTime)
var(0) = 1
[State 1025]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256-(var(0)*25),256
ignorehitpause = 1
[State 0, PosFreeze]
type = PosFreeze
trigger1 = parent,HitPauseTime
value = 1
ignorehitpause = 1

[State 1100]
type = Destroyself
trigger1 = var(0) > 10


;-----------------------------------------------------------------------------
[Statedef 1105]
type = S
movetype = A
physics = N
anim = 1105
velset = -4,0;0-(parent,vel x)*0.25,0
sprpriority = 5

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, VarAdd]
type = VarAdd
trigger1 = !(parent,HitPauseTime)
fvar(0) = 1
[State 0, VarAdd]
type = VarAdd
trigger1 = !(parent,HitPauseTime)
var(0) = 1
[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 1,1-(fvar(0)/15)
ignorehitpause = 1
[State 1025]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256-(var(0)*25),256
ignorehitpause = 1
[State 0, PosFreeze]
type = PosFreeze
trigger1 = parent,HitPauseTime
value = 1
ignorehitpause = 1

[State 1100]
type = Destroyself
trigger1 = var(0) > 10

;----------------------------------------------------------------------
[Statedef 1106]
type = S
movetype = A
physics = N
anim = 1106
velset = 0-(parent,vel x)*0.11,0
sprpriority = -2

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, VarAdd]
type = VarAdd
trigger1 = !(parent,HitPauseTime)
fvar(0) = 1
[State 0, VarAdd]
type = VarAdd
trigger1 = !(parent,HitPauseTime)
var(0) = 1
[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 1-(fvar(0)/15),1
ignorehitpause = 1
[State 1025]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256-(var(0)*25),256
ignorehitpause = 1
[State 0, PosFreeze]
type = PosFreeze
trigger1 = parent,HitPauseTime
value = 1
ignorehitpause = 1

[State 1100]
type = Destroyself
trigger1 = var(0) > 10

;----------------------------------------------------------------------
[Statedef 1107]
type = S
movetype = A
physics = N
anim = 1106
velset = (parent,vel x)*1.2,0
sprpriority = 6

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, VarAdd]
type = VarAdd
trigger1 = !(parent,HitPauseTime)
fvar(0) = 1
[State 0, VarAdd]
type = VarAdd
trigger1 = !(parent,HitPauseTime)
var(0) = 1
[State 0, VarAdd]
type = VelMul
trigger1 = !(parent,HitPauseTime)
x = 0.8
[State 0, BindToParent]
type = BindToParent
trigger1 = parent,stateno = 1120 || parent,stateno = 1140
time = 1
;facing = 0
pos = var(0)*2,0
ignorehitpause = 1

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 1-(fvar(0)/15),1
ignorehitpause = 1
[State 1025]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256-(var(0)*25),256
ignorehitpause = 1
[State 0, PosFreeze]
type = PosFreeze
trigger1 = parent,HitPauseTime
value = 1
ignorehitpause = 1

[State 1100]
type = Destroyself
trigger1 = var(0) > 10

;----------------------------------------------------------------------------
;Charge
[Statedef 1120]
type = S
movetype = A
physics = N
anim = 1120
ctrl = 0
poweradd = ifelse(!numhelper(3045),30,0)
juggle = ifelse(pos y=0,5,2)
facep2 = (pos y=0)

[State ProRation]
type = VarSet
trigger1 = movehit = 1
fvar(13) = fvar(13) * 0.85
ignorehitpause = 1
persistent = 0

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = statetype != A
x = 0
ignorehitpause = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = numhelper(1106)
value2 = ,NT,ST
time = 2
ignorehitpause = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = time = 0
trigger1 = pos y < 0
statetype = A
ignorehitpause = 1
[State 0, Gravity]
type = Veladd
trigger1 = statetype = A
trigger1 = animelemtime(4) >= 0
y = 0.5
[State 0, PosSet]
type = PosSet
trigger1 = vel y + pos y >= 0
y = 0
ignorehitpause = 1
[State 0, PosSet]
type = VelSet
trigger1 = vel y + pos y >= 0
y = 0
ignorehitpause = 1
[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = statetype = A
trigger1 = pos y >= 0
statetype = S
ignorehitpause = 1
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
trigger1 = statetype = A
value = anim
elem = 2
ignorehitpause = 1
[State 0, ChangeAnim]
type = PosAdd
trigger1 = time = 0
trigger1 = statetype = A
y = -20
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = statetype != A
trigger1 = animelem = 8
x = 2
[State 0, PosAdd]
type = PosAdd
trigger1 = statetype != A
trigger1 = animelem = 9
x = 9
[State 0, PosAdd]
type = PosAdd
trigger1 = statetype != A
trigger1 = animelem = 10
x = 4

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S1,50
ignorehitpause = 1
persistent = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S1,45
[State 0, PlaySnd]
type = PlaySnd
trigger1 = statetype != A
trigger1 = animelem = 8
value = S1,49

[State 1120]
type = explod
trigger1 = statetype != A
trigger1 = Animelem = 4
id = 802
anim = 802
pos = 0,0
sprpriority = 2
ignorehitpause = 1
persistent = 0

[State 1120]
type = velset
trigger1 = Animelem = 4
x = 35

[State 1100]
type = velmul
triggerall = !vel x <= 0
trigger1 = Animelem >= 4
trigger2 = Animelemno(4)>= 2
x = ifelse(statetype!=A,0.8,0.85)

[State 1100]
type = helper
trigger1 = Animelem = 4
name = "dashlines1"
id = 1105
stateno = 1105
ownpal = 1
pos = 0,-60

[State 1100]
type = helper
trigger1 = Animelem = 4
name = "dashlines2"
id = 1106
stateno = 1106
ownpal = 1
pos = -5,0

[State 1100]
type = helper
trigger1 = Animelem = 4
name = "dashlines2"
id = 1107
stateno = 1107
ownpal = 1
pos = 5,0

[State 220, 2]
type = HitDef
;triggerall = Hitcount = 0
;trigger1 = AnimElem = 4 || Animelem = 5 || AnimElem = 6 || Animelem = 7
;trigger1 = !moveguarded >= 1
trigger1 = statetype != A
trigger1 = animelem = 4
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Heavy
priority = 5, Hit
damage = 68
pausetime = 8,15
sparkno = S809
guard.sparkno = S806
sparkxy = -20,-50
hitsound = S1,5
guardsound = S2,3
ground.type = Low
ground.slidetime = 50
ground.hittime = 22
ground.velocity = -8
air.velocity = -7.5,-5
guard.velocity = -10
getpower = 60,30
givepower = 4
air.fall = 1
fall.recovertime = 40
id = 1140
nochainid = 1240,1140
yaccel = fvar(12)
[State 220, 2]
type = HitDef
;triggerall = Hitcount = 0
;trigger1 = AnimElem = 4 || Animelem = 5 || AnimElem = 6 || Animelem = 7
;trigger1 = !moveguarded >= 1
trigger1 = statetype = A
trigger1 = animelem = 4
attr = A, SA
hitflag = MAF
guardflag = MA
animtype = Heavy
priority = 5, Hit
damage = 60
pausetime = 8,15
sparkno = S809
guard.sparkno = S806
sparkxy = -20,-50
hitsound = S1,5
guardsound = S2,3
ground.type = Low
ground.slidetime = 50
ground.hittime = 22
ground.velocity = -8
air.velocity = -7.5,-5
guard.velocity = -10
getpower = 60,30
givepower = 4
air.fall = 1
fall.recovertime = 40
id = 1140
nochainid = 1240,1140
yaccel = fvar(12)

[State WallBounce]
type = TargetState
trigger1 = p2statetype = A
trigger1 = numtarget(1140)
trigger1 = movehit = 1
trigger1 = !(target(1140),ishelper)
value = 1150
ID = 1140
ignorehitpause = 1

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = Animelem >= 8
;statetype = S
movetype = I
;physics = S
[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = statetype = S
trigger1 = Animelem >= 8
;statetype = S
physics = S

[State 1100]
type = velset
trigger1 = statetype != A
trigger1 = Animelem = 9
x = 0

[State 1100]
type = changestate
trigger1 = statetype = A
trigger1 = animelem = 11
value = 50
ctrl = 1
[State 1100]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;----------------------------------------------------------------------------
;Charge2
[Statedef 1140]
type = S
movetype = A
physics = N
anim = 1140
ctrl = 0
poweradd= ifelse(!numhelper(3045),35,0)
juggle = ifelse(pos y=0,5,2)
facep2 = (pos y=0)

[State ProRation]
type = VarSet
trigger1 = movehit = 1
fvar(13) = fvar(13) * 0.85
ignorehitpause = 1
persistent = 0

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = statetype != A
x = 0
ignorehitpause = 1

[State 0, NotHitBy]
type = NotHitBy
trigger1 = numhelper(1106)
value2 = ,NT,ST
time = 2
ignorehitpause = 1

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = time = 0
trigger1 = pos y < 0
statetype = A
ignorehitpause = 1
[State 0, Gravity]
type = Veladd
trigger1 = statetype = A
trigger1 = animelemtime(4) >= 0
y = 0.5
[State 0, PosSet]
type = PosSet
trigger1 = vel y + pos y >= 0
y = 0
ignorehitpause = 1
[State 0, PosSet]
type = VelSet
trigger1 = vel y + pos y >= 0
y = 0
ignorehitpause = 1
[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = statetype = A
trigger1 = pos y >= 0
statetype = S
ignorehitpause = 1
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
trigger1 = statetype = A
value = anim
elem = 2
ignorehitpause = 1
[State 0, ChangeAnim]
type = PosAdd
trigger1 = time = 0
trigger1 = statetype = A
y = -20
ignorehitpause = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = statetype != A
trigger1 = animelem = 8
x = 2
[State 0, PosAdd]
type = PosAdd
trigger1 = statetype != A
trigger1 = animelem = 9
x = 9
[State 0, PosAdd]
type = PosAdd
trigger1 = statetype != A
trigger1 = animelem = 10
x = 4

[State 3021]
type = changeanim
;trigger1 = !var(55)
triggerall = statetype != A
trigger1 = command = "holdz"
trigger1 = anim = 1140
trigger1 = Animelemtime(3) = 0
value = 1141
elem = 2

[State 1100]
type = helper
trigger1 = anim = 1141
trigger1 = animelemtime(3) = 3
name = "Powah Up"
id = 1145
stateno = 1145
ownpal = 1
pos = 0,0
[State 0, AngleDraw]
type = AngleDraw
trigger1 = anim = 1141
trigger1 = animelemtime(4) = [-2,-1]
value = 0
scale = 1,1.1
ignorehitpause = 1
[State 0, NotHitBy]
type = NotHitBy
trigger1 = anim=1141
trigger1 = vel x >= 3
value = ,NP,SP
time = 2
ignorehitpause = 1

[State 0, PlaySnd]
type = PlaySnd
;trigger1 = anim != 1141
trigger1 = animelem = 4
value = S1,ifelse(anim=1141,62,50)
ignorehitpause = 1
persistent = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S1,45
[State 0, PlaySnd]
type = PlaySnd
trigger1 = statetype != A
trigger1 = animelem = 8
value = S1,49

[State 1120]
type = explod
trigger1 = statetype != A
trigger1 = Animelem = 4
id = 802
anim = 802
pos = 0,0
sprpriority = 2
ignorehitpause = 1
persistent = 0

[State 1140]
type = Width
trigger1 = 1
edge = 20, 20

[State 1140]
type = playerpush
trigger1 = anim = 1141
trigger1 = vel x >= 2
value = 0
ignorehitpause = 1

[State 1120]
type = velset
trigger1 = Animelem = 4
x = ifelse(anim=1141,65,45)

[State 1100]
type = velmul
triggerall = !vel x <= 0
trigger1 = Animelem >= 4
trigger2 = Animelemno(4)>= 2
x = ifelse(statetype!=A,0.8,0.85)

[State 1100]
type = helper
trigger1 = Animelem = 4
name = "dashlines1"
id = 1105
stateno = 1105
ownpal = 1
pos = 0,-60

[State 1100]
type = helper
trigger1 = Animelem = 4
name = "dashlines2"
id = 1106
stateno = 1106
ownpal = 1
pos = 8,0

[State 1100]
type = helper
trigger1 = Animelem = 4
name = "dashlines2"
id = 1107
stateno = 1107
ownpal = 1
pos = 8,0

[State 1120]
type = explod
trigger1 = movehit && !NumExplod(801)
id = 801
anim = 801
pos = 50,-60
sprpriority = 2
ignorehitpause = 1
persistent = 0

[State 220, 2]
type = HitDef
trigger1 = statetype != A
trigger1 = animelem = 4
;trigger1 = !moveguarded >= 1
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Heavy
priority = 5, Hit
damage = ifelse(anim=1141,100,85)
pausetime = 13,7
sparkno = S800
guard.sparkno = S806
sparkxy = -20,-60
hitsound = S1,5
guardsound = S2,3
ground.type = Low
ground.slidetime = 50
ground.hittime = 20
ground.velocity = ifelse(anim=1141,-15,-7.5), -5.5
air.velocity = ifelse(anim=1141,-15,-7.5),-5
guard.velocity = -10
getpower = 60,30
givepower = 4
fall = 1
fall.recover = ifelse(anim=1141,0,1)
p2facing = 1
persistent = 0
fall.recovertime = 40
id = 1140
nochainid = 1140
yaccel = fvar(12)
[State 220, 2]
type = HitDef
trigger1 = statetype = A
trigger1 = animelem = 4
;trigger1 = !moveguarded >= 1
attr = A, SA
hitflag = MAF
guardflag = MA
animtype = Heavy
priority = 5, Hit
damage = ifelse(anim=1141,100,85)
pausetime = 13,7
sparkno = S800
guard.sparkno = S806
sparkxy = -20,-60
hitsound = S1,5
guardsound = S2,3
ground.type = Low
ground.slidetime = 50
ground.hittime = 20
ground.velocity = ifelse(anim=1141,-15,-7.5), -5.5
air.velocity = ifelse(anim=1141,-15,-7.5),-5
guard.velocity = -10
getpower = 60,30
givepower = 4
fall = 1
p2facing = 1
persistent = 0
fall.recovertime = 40
id = 1140
nochainid = 1140
yaccel = fvar(12)

[State WallBounce]
type = TargetState
trigger1 = numtarget(1140)
trigger1 = movehit = 1
trigger1 = !(target(1140),ishelper)
value = 1150
ID = 1140
ignorehitpause = 1

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = Animelem >= 8
;statetype = S
movetype = I
;physics = S
[State 1100]
type = velset
trigger1 = statetype != A
trigger1 = Animelem = 9
x = 0

[State 1100]
type = changestate
trigger1 = statetype = A
trigger1 = animelem = 11
value = 50
ctrl = 1
[State 1100]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1


;-----------------------------------------------------------------------------
[Statedef 1145]
type = S
movetype = I
physics = N
anim = 1145
velset = 0,0;0-(parent,vel x)*0.25,0
sprpriority = 5

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S1,51
channel = 0
[State 0, BindToParent]
type = BindToParent
trigger1 = 1
time = 1
pos = 0,(fvar(0)*4)
ignorehitpause = 1
[State 0, VarAdd]
type = VarAdd
trigger1 = 1
var(0) = 1
[State 0, VarAdd]
type = VarAdd
trigger1 = var(0) >= 6
fvar(0) = 1
[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 1.1+(fvar(0)/10),1.1+(fvar(0)/10)
ignorehitpause = 1
[State 1025]
type = Trans
trigger1 = 1
trans = add;alpha
;alpha = 256-(var(0)*25),256
ignorehitpause = 1
[State 0, PosFreeze]
type = PosFreeze
trigger1 = parent,HitPauseTime
value = 1
ignorehitpause = 1

[State 0, PlaySnd]
type = StopSnd
trigger1 = parent,movetype = H
channel = 0
[State 1100]
type = Destroyself
trigger1 = var(0) > 8
trigger2 = parent,movetype = H

;------------------------------------------------------------
; Gethitshit
[Statedef 1150]
type    = A
movetype= H
physics = N
velset = 0,0

[State 1025, Anim] ;Custom animation
type = ChangeAnim
trigger1 = 1
value = 5012

[State 1025, Anim] ;Custom animation
type = ChangeAnim2
trigger1 = Time = 0
trigger1 = name = "Gill"
trigger1 = facing = -1
value = 15012

[State 1025, State]
type = ChangeState
trigger1 = HitShakeOver = 1
value = 1152

;------------------
; More Gethit shit
[Statedef 1152]
type    = A
movetype= H
physics = N

[State 1025, Anim]
type = ChangeAnim
trigger1 = time = 0
value = 5030
[State 1025, Anim]
type = ChangeAnim
trigger1 = anim = 5030
trigger1 = animtime = 0
value = ifelse(selfanimexist(5035),5035,5050)
[State 1025, Anim]
type = ChangeAnim
trigger1 = anim = 5035
trigger1 = animtime = 0
value = 5050

[State 1152, Velocity]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 1026, Gravity]
type = VelAdd
trigger1 = 1
y = gethitvar(yaccel)+.01;.45

[State 1026, No scroll]
type = ScreenBound
triggerall = Pos y < -15
trigger1 = BackEdgeBodyDist < 65
trigger2 = FrontEdgeBodyDist < 65
value = 1
movecamera = 0,1

[State 1026, Hit wall]
type = ChangeState
triggerall = Pos y < -15
trigger1 = BackEdgeBodyDist <= 20
trigger2 = FrontEdgeBodyDist <= 20
value = 1153

[State 1026, Hit ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100

;------------------
; More Gethit shit
[Statedef 1153]
type    = A
movetype= H
physics = N

[State 1027, Turn]
type = Turn
trigger1 = (Time = 0) && (FrontEdgeBodyDist <= 30)

[State 1027, Pos]
type = PosAdd
trigger1 = Time = 0
x = 15 - BackEdgeBodyDist

[State 1027, Stop moving]
type = PosFreeze
trigger1 = 1
x = 1
y = 1

[State 1027, No scroll]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 1027, Spark]
type = Explod
trigger1 = Time = 0
anim = F72
pos = 0, floor (screenpos y) - 50
postype = back
sprpriority = 3

[State 1027, Anim]
type = ChangeAnim2
trigger1 = Time = 0
value = 1153

[State 1025, Anim] ;Custom animation
type = ChangeAnim2
trigger1 = Time = 0
trigger1 = name = "Gill"
trigger1 = facing = -1
value = 11153

[State 1027, Sound]
type = PlaySnd
trigger1 = Time = 0
value = F7,0

[State 1027, State]
type = ChangeState
trigger1 = AnimTime = 0
value = 1154

;------------------
; HEven more Gethit shit
[Statedef 1154]
type    = A
movetype= H
physics = N

[State 0, AppendToClipboard]
type = AppendToClipboard
trigger1 = 1
text = "cancan = %d"
params = canrecover
ignorehitpause = 1


;[State 1028, 1]
;type = NotHitBy
;trigger1 = 1
;value = , NA, NP

[State 1028, Vel Y]
type = VelSet
trigger1 = Time = 0
y = -6

[State 1028, Vel X]
type = VelSet
trigger1 = Time = 0
x = 1.6

[State 1028, Turn]
type = Turn
trigger1 = (Time = 0) && (BackEdgeDist < 30)

[State 1028, Gravity]
type = VelAdd
trigger1 = 1
y = gethitvar(yaccel)-.1;.35

[State 1028, Anim 5050] ;Self falling animation
type = ChangeAnim
trigger1 = Time = 0
trigger1 = !SelfAnimExist(5052)
value = 5050

[State 1028, Anim 5052] ;Self falling animation (diagup type)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5052)
value = 5052

[State 1028, Anim 5060] ;Coming down - normal
type = ChangeAnim
trigger1 = Vel Y > -2
trigger1 = Anim = 5050
trigger1 = SelfAnimExist(5060)
persistent = 0
value = 5060

[State 1028, Anim 5062] ;Coming down - diagup type
type = ChangeAnim
trigger1 = Vel Y > -2
trigger1 = Anim = 5052
trigger1 = SelfAnimExist(5062)
persistent = 0
value = 5062

[State 821, 2]
type = SelfState
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5200

[State 1028, Hit ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100

;-----------------------------------------------------------------
;Nigasu Ka Yo!
[Statedef 1200]
type = S
movetype = A
physics = N
anim = 1200
ctrl = 0
velset = 0,0
poweradd = ifelse(prevstateno!=3000&&!numhelper(3045),30,0)
juggle = 0
facep2 = 1

; 38, -229, 84, -101
[State 0, Can info]
type = Null
trigger1 = 1
trigger1 = (var(20):=38) ; min x
trigger1 = (var(21):=-229) ; min y
trigger1 = (var(22):=80) ; max x
trigger1 = (var(23):=-121) ; max y
trigger1 = (var(24):=75) ; damage
trigger1 = (var(26):=16) ; hitcount?
trigger1 = (fvar(20):=0.9)
trigger1 = (fvar(21):=-12)
trigger1 = (fvar(23):=-1)
trigger1 = (fvar(24):=-4)
ignorehitpause = 1

[State 0, Can Check]
type = VarSet
trigger1 = time >= 2
var(25) = (AnimElemTime(2) = [0,2])

[State 0, PosAdd]
type = PosAdd
trigger1 = time = 0
x = 4
[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(2) < 0
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(2) = 0
x = 0
[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 6
trigger2 = animelem = 7
trigger3 = animelem = 8
trigger4 = animelem = 9
x = -8
[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 10
x = -2

[State 800, 1]
type = HitDef
getpower = 60,30
Trigger1 = Time = 0
attr = S, NT
hitflag = AF
priority = 1, Miss
sparkno = S801
sparkxy = 0,-160
p1sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 1201
;p2stateno = 831
guard.dist = 0
fall = 1
fall.recover = 0
id = 1200
nochainid = 1200

;[State 191, 7]
;type = Screenbound
;trigger1 = 1
;value = 0
;movecamera = 0,0

[State 1025]
type = Playsnd
trigger1 = time = 0
value = 1,0
[State 1025]
type = Playsnd
trigger1 = time = 0
value = 1,35
[State 1025]
type = Playsnd
trigger1 = animelem = 2
value = 1,7

[State 1100]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;-----------------------------------------------------------------------------
;Nigasu Ka Yo! throw state
[Statedef 1201]
type    = S
movetype= A
physics = S
anim = 1201
poweradd = ifelse(!numhelper(3045),60,0)
velset = 0,0

[State 191, 7]
type = Screenbound
trigger1 = 1
value = 1
movecamera = 1,1

[State 210, 3]
type = velset
trigger1 = AnimElem = 2
x = 5

[State 210, 3]
type = velmul
trigger1 = AnimElem >= 2
trigger1 = vel x <=2
trigger1 = vel x >0
vel = 0.45

[State 830, Throw 11]
type = TargetState
trigger1 = time = 0
value = 1202

[State 191, 7]
type = Screenbound
trigger1 = 1
value = 0
movecamera = 0,0

[State 830]
type = playsnd
trigger1 = Time = 0
value = 1,33

[State 830]
type = playsnd
trigger1 = Time = 0
value = 1,36
channel = 0

[State 830, Grab Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1, 2

[State 810, Bind 1]
type = TargetBind
trigger1 = animelemtime(2) < 0
pos = 51, -226

[State 810, Bind 2]
type = TargetBind
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(3) < 0
pos = -59, -23

[State 810, Bind 3]
type = TargetBind
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(4) < 0
pos = 15, -94

[State 810, Bind 4]
type = TargetBind
trigger1 = AnimElem = 4
pos = 104, -7

[State 830, Throw 11]
type = TargetState
trigger1 = AnimElem = 4
value = 1203

[State 830, Width 2-11]
type = Width
trigger1 = time = 0
value = 60,0

[State WHAM]
type = PlaySnd
trigger1 = numtarget
trigger1 = target,stateno = 1208
trigger1 = target,time = 1
trigger1 = target,movetype = H
value = S1,5
ignorehitpause = 1
[State COLLISION DAMAGE]
type = TargetLifeAdd
trigger1 = target,stateno = 1208
trigger1 = target,time = 1
value = floor(-100 * (fvar(13)+(.15*numhelper(3045)) ) )
;value = floor(-100 * (1+(.25*numhelper(3045))-(fvar(14))) )
;value = floor(-90 * ifelse((target,gethitvar(hitcount) = [1,3]),1,ifelse((target,gethitvar(hitcount) = [4,5]),.7,ifelse((target,gethitvar(hitcount) =[6,7]),.5,ifelse((target,gethitvar(hitcount) >= 8),.3,0)))))
;ifelse(p2movetype!=H||(p2stateno=[120,169]),1+(.25*numhelper(3045)),1+(.25*numhelper(3045))-(parent,fvar(14)))
persistent = 0
[State HITMAN]
type = HitAdd
trigger1 = target,stateno = 1208
trigger1 = target,time = 1
value = 1
ignorehitpause = 1
persistent = 0

[State 830, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;----------------------------------------------------------------------
;Nigasu Ka Yo Thrown 1
[Statedef 1202]
type    = A
movetype= H
physics = N
velset = 0,0
facep2 = 1

[State 191, 7]
type = Screenbound
trigger1 = 1
value = 0
movecamera = 1,0

[State 831, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1202

;In case attacker loses binding on player for any reason, this controller
;guarantees that the player will never get stuck in this thrown state.
[State 820, 2]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

;---------------------------------------------------------------------------
;Thrown by Ball Throw
[Statedef 1203]
type    = A
movetype= H
physics = N
velset = -1,12
poweradd = 40

[State 833, 1] ;Gravity
type = VelAdd
Trigger1 = 1
y = .4

[State 833, 4] ;Hit ground
type = ChangeState
trigger1 = Vel Y + pos y >= 0
value = 1208

;---------------------------------------------------------------------------
; THIS PARTY'S GETTING BOUNCY!
[Statedef 1208]
type    = A
movetype= H
physics = N

[State 5100, 1]
type = VelSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
trigger1 = vel x > 1
x = 1
;[State COLLISION DAMAGE]
;type = EnvShake
;trigger1 = time = 0
;time = 12
;freq = 255
;ampl = -7
[State 5100, Var] ;Save fall velocity
type = VarSet
trigger1 = Time = 0
sysvar(1) = floor(vel y)
[State 5100, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = !selfanimexist(5101)
value = 5100
[State 5100, 3]
type = ChangeAnim
trigger1 = time = 0
trigger1 = selfanimexist(5101)
value = 5101

[State 5100, 4]
type = PosSet
trigger1 = Time = 0
y = 0
[State 5100, 5]
type = VelSet
trigger1 = Time = 0
y = 0
[State 5100, 6] ;Reduce speed
type = VelMul
trigger1 = Time = 0
x = 0.75

[State 5100, 8]
type = Explod
trigger1 = Time = 1
anim = F60
pos = 0, 0
sprpriority = -2
supermovetime = 65535
pausemovetime = 65535
scale = 0.5,3
[State 5100, 8]
type = Explod
trigger1 = Time = 1
anim = F61
pos = 0, 0
sprpriority = -2
supermovetime = 65535
pausemovetime = 65535
scale = 1,2
[State 5100, 8]
type = Explod
trigger1 = Time = 1
anim = F62
pos = 0, 0
sprpriority = -2
supermovetime = 65535
pausemovetime = 65535
scale = 2,2

[State 5100, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7, 2
[State 5100, 11]
type = PosFreeze
trigger1 = 1
[State 5100, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 1209

[State 5100, 13]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

;---------------------------------------------------------------------------
; HIT_BOUNCE (bounce into air)
[Statedef 1209]
type    = A
movetype= H
physics = N

[State 5101, 1] ;Coming hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim != [5101,5109]
trigger2 = !SelfAnimExist(5160 + (anim % 10))
value = 5160
[State 5101, 2] ;Coming hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [5101,5109]
trigger1 = SelfAnimExist(5160 + (anim % 10))
value = 5160 + (anim % 10)

[State 5101, 3]
type = VelSet
trigger1 = Time = 0
x = -1
y = -5
[State 5101, 5] ;Acceleration
type = VelAdd
trigger1 = 1
y = .713

[State 5101, 6] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 6
type = SelfState
value = 5110


;-----------------------------------------------------------------
;Weak TOBE ORA
[Statedef 1220]
type = S
movetype = A
physics = N
anim = 1220
ctrl = 0
velset = 0,0
poweradd = ifelse(prevstateno!=3000&&!numhelper(3045),30,0)
juggle = 8
facep2 = 1

[State ProRation]
type = VarSet
trigger1 = movehit = 1
fvar(13) = fvar(13) * 0.80
ignorehitpause = 1
persistent = 0

; 31, -195, 117, 2
[State 0, Can info]
type = Null
trigger1 = 1
trigger1 = (var(20):=31) ; min x
trigger1 = (var(21):=-195) ; min y
trigger1 = (var(22):=117) ; max x
trigger1 = (var(23):=2) ; max y
trigger1 = (var(24):=55) ; damage
trigger1 = (var(26):=16) ; hitcount?
trigger1 = (fvar(20):=2.1)
trigger1 = (fvar(21):=-8)
trigger1 = (fvar(23):=-1)
trigger1 = (fvar(24):=-4)
ignorehitpause = 1

[State 0, Can Check]
type = VarSet
trigger1 = time >= 2
var(25) = (AnimElemTime(4) = [0,2])


[State 0, Width]
type = Width
trigger1 = animelemtime(2) < 0
value = 10,0
ignorehitpause = 1
[State 0, Width]
type = Width
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(6) <= 0
value = 20,0
ignorehitpause = 1

;[State 0, PosAdd]
;type = PosAdd
;trigger1 = animelem = 3
;x = 24
[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 4
x = 16
[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 9
trigger2 = animelem = 10
trigger3 = animelem = 11
trigger4 = animelem = 12
x = -6

[State 1240]
type = nothitby
trigger1 = Animelemtime(2) >= 0 && Animelemtime(2) <= 3
value = SCA

[State 200, 1]
type = HitDef
trigger1 = AnimElem = 4
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = diagup
priority = 4, Hit
damage = 76
pausetime = 8,8
sparkno = S809
guard.sparkno = S806
sparkxy = -20,-40
hitsound = S1,5
guardsound = S2,4
ground.type = High
ground.slidetime = 15
ground.hittime = 15
guard.hittime = 9
ground.velocity = -3.5, -9
air.velocity = -3.5, -9
guard.velocity = -11
ground.cornerpush.veloff = -11
fall = 1
bounce = 1
getpower = 60,30
givepower = 7
id = 320
nochainid = 320, 1240
yaccel = fvar(12)

[State WallBounce]
type = TargetState
trigger1 = numtarget(320)
trigger1 = movehit = 1
trigger1 = !(target(320),ishelper)
value = 1150
ID = 320
ignorehitpause = 1

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = Animelem >= 5
statetype = s
movetype = I
physics = S

[State 1025]
type = Playsnd
trigger1 = Animelem = 3
value = 1,8

[State 1100]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;-----------------------------------------------------------------
;TOBE ORA
[Statedef 1240]
type = S
movetype = A
physics = N
anim = 1240
ctrl = 0
velset = 0,0
poweradd = ifelse(prevstateno!=3000&&!numhelper(3045),30,0)
juggle = ifelse(numhelper(1045),7,6)
facep2 = 1

[State ProRation]
type = VarSet
trigger1 = movehit = 1
fvar(13) = fvar(13) * 0.80
ignorehitpause = 1
persistent = 0

;  9, -215, 98, -3
[State 0, Can info]
type = Null
trigger1 = 1
trigger1 = (var(20):=9) ; min x
trigger1 = (var(21):=-160) ; min y
trigger1 = (var(22):=98) ; max x
trigger1 = (var(23):=-3) ; max y
trigger1 = (var(24):=67) ; damage
trigger1 = (var(26):=20) ; hitcount?
trigger1 = (fvar(20):=8)
trigger1 = (fvar(21):=-1)
trigger1 = (fvar(23):=-1.5)
trigger1 = (fvar(24):=-4.5)
ignorehitpause = 1

[State 0, Can Check]
type = VarSet
trigger1 = time >= 2
var(25) = (anim=1240) && (AnimElemTime(5) >= 0) && (AnimElemTime(7) <= 0)

[State 1240]
type = nothitby
trigger1 = Animelemtime(3) >= 0 && Animelemtime(3) <= 4
value = SCA

[State 1025]
type = Playsnd
trigger1 = prevstateno != 3000
trigger1 = animelem = 4
value = 0,2
channel = 0

[State 1100]
type = helper
trigger1 = Animelem = 4
name = "aura"
id = 1
pos = 0, 6
stateno = 1245
ownpal = 1

[State 1025]
type = Playsnd
trigger1 = Animelem = 4
value = 0,3

[State 1027, I'm hit]
type = HitDef
trigger1 = animelem = 5
;trigger1 = !moveguarded >= 1
attr = S,SA
hitflag = MAF
guardflag = MA
animtype = Heavy
priority = 5,hit
damage = 95,2
pausetime = 8,8
sparkno = S801
guard.sparkno = S806
;hitonce = 1
sparkxy = -30,-60
hitsound = S1,1
guardsound = S2,4
ground.type = low
ground.slidetime = 8
ground.hittime = 20
ground.velocity = -7.5, -6
;ground.cornerpush.veloff = -3
air.velocity = -7.5, -5
guard.velocity = -10
getpower = 60,30
givepower = 18
;p2stateno = 1150
p2facing = 1
fall = 1
fall.recover = 0
id = 1240
nochainid = 1240
yaccel = fvar(12)

[State WallBounce]
type = TargetState
trigger1 = numtarget(1240)
trigger1 = movehit = 1
trigger1 = !(target(1240),ishelper)
value = 1150
ID = 1240
ignorehitpause = 1

[State 200, StateTypeSet]
type = StateTypeSet
trigger1 = Animelem >= 8
statetype = S
movetype = I
physics = S

[State 1100]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1
;-------------------------------------------------------------------
;TOBE ORA afterimage
[Statedef 1245]
type = A
movetype = I
physics = N
anim = 1245
sprpriority = 1
id = 1245
velset = 2.5,0
ctrl = 0
hitcountpersist = 1
juggle = 8


[State 1245]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 1245, trans]
type = trans
trigger1 = 1
trans = add

[State 0, PosFreeze]
type = PosFreeze
trigger1 = parent,HitPauseTime
value = 1
ignorehitpause = 1
[State 0, PosFreeze]
type = ChangeAnim
trigger1 = parent,HitPauseTime
value = anim
elem = animelemno(0)
ignorehitpause = 1
[State 0, VelMul]
type = VelMul
trigger1 = !(parent,HitPauseTime)
x = 0.9
ignorehitpause = 1

;[State 1027, I'm hit]
;type = HitDef
;trigger1 = Hitcount = 0
;trigger1 = !moveguarded >= 1
;attr = S,SP
;hitflag = MAF
;guardflag = MA
;animtype = Heavy
;priority = 3,hit
;damage = 95,2
;getpower = 6
;givepower = 2
;pausetime = 3,9
;sparkno = S801
;guard.sparkno = S806
;hitonce = 1
;sparkxy = -30,-60
;hitsound = S1,1
;guardsound = 6,0
;ground.type = low
;ground.slidetime = 8
;ground.hittime = 7
;ground.velocity = -7.5, -6
;ground.cornerpush.veloff = 0
;air.velocity = -7.5, -5
;getpower = 115
;givepower = 18
;p2stateno = 1150
;p2facing = 1
;id = 1240
;nochainid = 1240
;yaccel = parent,fvar(12)

;[State WallBounce]
;type = TargetState
;trigger1 = numtarget(1240)
;trigger1 = movehit = 1
;trigger1 = !(target(1240),ishelper)
;value = 1150
;ID = 1240
;ignorehitpause = 1

[State 1025, 0]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1025, 0]
type = Destroyself
trigger1 = animtime = 0
trigger2 = parent,movetype = H

