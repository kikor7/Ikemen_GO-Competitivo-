;---------------------------------------------------------------------------
; 5x
[Statedef 200]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
;velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 200+0*floor(var(55):=0)
sprpriority = 1                  ;Set p1's sprite layering priority to 2 (in front)
facep2 = 1
juggle = 0

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = (var(11):=18)||1 
trigger1 = (var(12):=0+3*(var(52)=1))||1

[State 200, 1]
type = PlaySnd
trigger1 = animelemtime(3)=0||animelemtime(7)=0
value = 200, 0
channel = 0

[State 200, 1]
type = PlaySnd
trigger1 = animelemtime(3)=0||animelemtime(7)=0
value = 0,0


[State 200, MHR]
type = movehitreset
trigger1 = animelemtime(6)=0

[State 200, 1]
type = HitDef
trigger1 = animelemno(0)=3||animelemno(0)=7
trigger1 = movecontact = 0 && movereversed = 0
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = ceil(var(11)*(fvar(11)/cond(var(55)=1,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(12)*fvar(11))                   ;Damage that move inflicts, guard damage
kill = 1
guard.kill = 0
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = M                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit
pausetime = 6,6                 ;Time attacker pauses, time opponent shakes
sparkno = S8000+(random%2)                      ;Spark anim no (Def: set above)
guard.sparkno = S8030
sparkxy = -10,-46
hitsound = s1,0                  ;Sound to play on hit
guardsound = s2,0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.velocity = -3.5             ;Velocity at which opponent is pushed
air.type = Low                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -3.5,-4.5           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
yaccel = 0.5
ground.slidetime = cond((var(32):=14+2*(var(42)!=0)+var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=14+2*(var(42)!=0)+var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=12+2*(var(42)!=0)+var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=12+2*(var(42)!=0)+var(34))<=1,1,var(32))
air.hittime = cond((var(32):=16+2*(var(42)!=0)+var(34))<=1,1,var(32))
getpower = 30,15;160% & 40% of base damage
givepower = ceil(var(11)*0.8*(fvar(11)/cond(var(55)=1,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.2) ;80% & 20% of base damage
p2facing = 1
ground.cornerpush.veloff = 0
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=16+2*(var(42)!=0)+var(34))<=1,1,var(32))+6;hitstun+pausetime value
id = 555

[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = movecontact
trigger1 = animelemno(0)=[3,6]
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=1,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15)) ;60% & 15% of base damage
persistent=0
ignorehitpause = 1
[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = movecontact
trigger1 = animelemno(0)>=7
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=1,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15)) ;60% & 15% of base damage
persistent=0
ignorehitpause = 1

[State 220, First Combo Hit]
type = varset
triggerall = numtarget(555) && movehit
trigger1 = target(555),gethitvar(hitcount)=1
trigger1 = var(55)=0
var(55) = 1;Change index
ignorehitpause = 1
persistent = 0

[State 1602, Recovery Frames]
type = statetypeset
trigger1 = animelemtime(8) = 0
trigger2 = animelemno(0)=7
trigger2 = movecontact || movereversed
movetype = I
ignorehitpause = 1

[State 200, Damage Dampen]
type = varset
trigger1 = movehit
trigger1 = animelemno(0)=[3,6]
fvar(10) = fvar(10)*0.948*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0
[State 200, Damage Dampen]
type = varset
trigger1 = movehit
trigger1 = animelemno(0)>=7
fvar(10) = fvar(10)*0.948*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State 210, JUMP CANCEL]
type = changestate
trigger1 = (var(57)>0 && var(52)=2) ;Spell Overdrive only
trigger1 = movecontact=[1,5]
trigger1 = command = "holdup" || command = "up"
value = 40
ctrl = 0

[State 200, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 5y
[Statedef 210]
type    = S
movetype= A
physics = S
ctrl = 0
sprpriority = 1
anim = 210+0*floor(var(55):=0)
facep2 = 1
juggle = 0

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = (var(11):=30)||1 
trigger1 = (var(12):=0+6*(var(52)=1))||1

[State 200, PSND]
type = PlaySnd
trigger1 = animelemtime(4)=0
value = 210,0
channel = 0

[State 2000, Spellcard Effect]
type = helper
trigger1 = animelemtime(4) = 0
helpertype = normal
name = "Soundwave"
id = 20210
stateno = 20210
pos = -26,-46
postype = p1
ownpal = 1
facing = 1
size.xscale = 0.45
size.yscale = 0.45
[State 2000, Spellcard Effect]
type = helper
trigger1 = animelemtime(4) = 0
helpertype = normal
name = "Soundwave"
id = 20210
stateno = 20210
pos = 44,-46
postype = p1
ownpal = 1
facing = 1
size.xscale = 0.45
size.yscale = 0.45

[State 240, 1]
type = PlaySnd
trigger1 = animelemtime(4)=0
value = 210,10

[State 210, MHR]
type = movehitreset
trigger1 = animelemtime(6)=0

[State 210, 2]
type = HitDef
triggerall = !movecontact && !movereversed
trigger1 = animelemno(0)=4||animelemno(0)=6;[4,5]
attr = S, NA
animtype  = Medium
priority = 4,Hit
damage = ceil(var(11)*(fvar(11)/cond(var(55)=2,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(12)*fvar(11))
kill = 1
guard.kill = 0
hitflag = MAF
guardflag = M
pausetime = 8,8;10,10
sparkno = S8010+(random%2)
guard.sparkno = S8030
sparkxy = -15,-50
hitsound   = s1,1
guardsound = s2,0
ground.type = High
ground.slidetime = cond((var(32):=18+3*(var(42)!=0)+var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=18+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=15+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=15+3*(var(42)!=0)+var(34))<=1,1,var(32))
air.hittime = cond((var(32):=20+3*(var(42)!=0)+var(34))<=1,1,var(32))
ground.velocity = -5.0
guard.velocity = -5.0
air.velocity = -5.0,-5.0
airguard.velocity = -5.0,-5.0
air.type = High
y.accel = 0.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
fall = 0
fall.recover = 1
fall.recovertime = cond((var(32):=20+3*(var(42)!=0)+var(34))<=1,1,var(32))+10;hitstun+pausetime value
getpower = 30,15;160%/40%
givepower = ceil(var(11)*0.8*(fvar(11)/cond(var(55)=2,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.2) ;80%/20%
p2facing = 1
id = 555

[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = animelemno(0)=[4,5]
trigger1 = movecontact
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=2,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15)) ;60%/15%
persistent=0
ignorehitpause = 1
[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = animelemno(0)>=6
trigger1 = movecontact
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=2,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15)) ;60%/15%
persistent=0
ignorehitpause = 1

[State 220, First Combo Hit]
type = varset
triggerall = numtarget(555) && movehit
trigger1 = target(555),gethitvar(hitcount)=1
trigger1 = var(55)=0
var(55) = 2;Change index
ignorehitpause = 1
persistent = 0

[State 200, Damage Dampen]
type = varset
trigger1 = movehit
trigger1 = animelemno(0)=[4,5]
fvar(10) = fvar(10)*0.94*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0
[State 200, Damage Dampen]
type = varset
trigger1 = movehit
trigger1 = animelemno(0)>=6
fvar(10) = fvar(10)*0.94*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State 1602, Recovery Frames]
type = statetypeset
trigger1 = animelemtime(7) = 0
trigger2 = animelemno(0)=6
trigger2 = movecontact||movereversed
movetype = I
ignorehitpause = 1
persistent=0

[State 210, JUMP CANCEL]
type = changestate
trigger1 = (var(57)>0 && var(52)=2) ;Spell Overdrive only
trigger1 = movecontact=[1,5]
trigger1 = command = "holdup" || command = "up"
value = 40
ctrl = 0

[State 210, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 5y FX
[Statedef 20210]
type    = A
movetype= I
physics = N
velset = 0,0
anim = 20210+0*floor(fvar(0):=1.0)
ctrl = 0
sprpriority = 5

[State 0, VelSet]
type = VelSet
trigger1 = 1 
x = 2.0

[State 0, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256-cond(animelemno(0)=2,floor(256.0*animelemtime(2)/6.0),0),256
ignorehitpause = 1

[State 21100, Zeeky]
type = destroyself
trigger1 = root,stateno != 210
trigger2 = animtime=0

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = fvar(0)*0.85,fvar(0)
ignorehitpause = 1

[State 20210, VA]
type = varadd
trigger1 = 1
fvar(0) = 0.075;15

[State 20210, Timer]
type = varadd
trigger1 = 1
var(0) = 1

;---------------------------------------------------------------------------
; 6y
[Statedef 215]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 215+1*(prevstateno=200||prevstateno=210||prevstateno=220||prevstateno=400||prevstateno=410||prevstateno=420)
sprpriority = 1
facep2 = 1
juggle = 0

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = (var(11):=70)||1 
trigger1 = (var(12):=0+14*(var(52)=1))||1

[State 215, VS]
type = posadd
trigger1 = animelemtime(4)=0
x = 15

[State 200, PSND]
type = PlaySnd
trigger1 = animelemtime(4)=0
value = 210,0
channel = 0

[State 240, 1]
type = PlaySnd
trigger1 = animelemtime(4)=0
value = 0,2

[State 230, 2]
type = HitDef
trigger1 = !movecontact && !movereversed
trigger1 = !(prevstateno=200||prevstateno=210||prevstateno=220||prevstateno=400||prevstateno=410||prevstateno=420)
trigger1 = animelemno(0)=5
attr = S, NA
animtype  = Hard
damage    = ceil(var(11)*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(12)*fvar(11))
kill = 1
guard.kill = 0
hitflag = MAF
guardflag = H
priority = 4,hit
pausetime = 10,10
sparkno = S8020+(random%2)
guard.sparkno = S8030
sparkxy = -20,-60
hitsound   = s1,2
guardsound = s2,0
ground.type = High
ground.slidetime = cond((var(32):=22+3*(var(42)!=0)+var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=22+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=18+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=18+3*(var(42)!=0)+var(34))<=1,1,var(32))
air.hittime = cond((var(32):=24+3*(var(42)!=0)+var(34))<=1,1,var(32))
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=24+3*(var(42)!=0)+var(34))<=1,1,var(32))+10;hitstun+pausetime value
ground.velocity = -6.0,0.0
air.velocity = -6.0,-4.0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
y.accel = 0.5
getpower = 15,7
givepower = ceil(var(11)*0.8*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.2)
p2facing = 1
id = 555
[State 230, 2]
type = HitDef
trigger1 = !movecontact && !movereversed
trigger1 = (prevstateno=200||prevstateno=210||prevstateno=220||prevstateno=400||prevstateno=410||prevstateno=420)
trigger1 = animelemno(0)=5
attr = S, NA
animtype  = Hard
damage    = ceil(var(11)*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(12)*fvar(11))
hitflag = MAF
guardflag = M
priority = 4,hit
pausetime = 10,10
sparkno = S8020+(random%2)
guard.sparkno = S8030
sparkxy = -20,-60
hitsound   = s1,2
guardsound = s2,0
ground.type = High
ground.slidetime = cond((var(32):=22+3*(var(42)!=0)+var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=22+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=18+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=18+3*(var(42)!=0)+var(34))<=1,1,var(32))
air.hittime = cond((var(32):=24+3*(var(42)!=0)+var(34))<=1,1,var(32))
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=24+3*(var(42)!=0)+var(34))<=1,1,var(32))+10;hitstun+pausetime value
ground.velocity = -6.0,0.0
air.velocity = -6.0,-4.0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
y.accel = 0.5
getpower = 15,7
givepower = ceil(var(11)*0.8*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.2)
p2facing = 1
id = 555

[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = movecontact
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1

[State 200, Damage Dampen]
type = varset
trigger1 = movehit
fvar(10) = fvar(10)*0.85*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State 1602, Recovery Frames]
type = statetypeset
trigger1 = animelemtime(6)>=0
trigger2 = movecontact || movereversed
movetype = I
ignorehitpause = 1
persistent=0

[State 210, JUMP CANCEL]
type = changestate
trigger1 = (var(57)>0 && var(52)=2) ;Spell Overdrive only
trigger1 = movecontact=[1,5]
trigger1 = command = "holdup" || command = "up"
value = 40
ctrl = 0

[State 230, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 5z
[Statedef 220]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 220
sprpriority = 1
facep2 = 1
juggle = 0

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = (var(11):=70)||1 ;80
trigger1 = (var(12):=0+14*(var(52)=1))||1

[State 200, PSND]
type = PlaySnd
trigger1 = animelemtime(3)=0
value = 220,0
channel = 0

[State 240, 1]
type = PlaySnd
trigger1 = animelemtime(3)=0
value = 0,2

[State 230, 2]
type = HitDef
trigger1 = !movecontact && !movereversed
trigger1 = animelemno(0)=4
attr = S, NA
animtype  = Hard
damage = ceil(var(11)*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(12)*fvar(11))
kill = 1
guard.kill = 0
hitflag = MAF
guardflag = M
priority = 4,hit
pausetime = 8,8
sparkno = S8020+(random%2)
guard.sparkno = S8030
sparkxy = -20,-80
hitsound   = s1,2
guardsound = s2,0
ground.type = High
ground.slidetime = cond((var(32):=22+10+3*(var(42)!=0)+var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=22+10+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=18+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=18+3*(var(42)!=0)+var(34))<=1,1,var(32))
air.hittime = cond((var(32):=24+10+3*(var(42)!=0)+var(34))<=1,1,var(32))
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=24+10+3*(var(42)!=0)+var(34))<=1,1,var(32))+8;hitstun+pausetime value
ground.velocity = -3.0,-7.0
air.velocity = -3.0,-7.0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
y.accel = 0.5
getpower = 30,15
givepower = ceil(var(11)*0.8*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.2)
p2facing = 1
id = 555
numhits = 1

[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = movecontact
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1

[State 200, Damage Dampen]
type = varset
trigger1 = movehit
fvar(10) = fvar(10)*0.85*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State 1602, Recovery Frames]
type = statetypeset
trigger1 = animelemtime(5)>=0
trigger2 = movecontact || movereversed
movetype = I
ignorehitpause = 1
persistent=0

[State 210, JUMP CANCEL]
type = changestate
;trigger1 = (var(57)>0 && var(52)=2) ;Spell Overdrive only
trigger1 = movecontact=[1,5]
trigger1 = command = "holdup" || command = "up"
value = 40
ctrl = 0

[State 230, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 6z
[Statedef 225]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 225
sprpriority = 1
facep2 = 1
juggle = 0

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = (var(11):=70)||1 ;80
trigger1 = (var(12):=0+14*(var(52)=1))||1

[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(4)=1
x = -12.0
y = 0

[State 200, PSND]
type = PlaySnd
trigger1 = animelemtime(4)=0
value = 220,0
channel = 0

[State 240, 1]
type = PlaySnd
trigger1 = animelemtime(3)=0
value = 225,10

[State 230, 2]
type = HitDef
trigger1 = !movecontact && !movereversed
trigger1 = animelemno(0)=4
attr = S, NA
animtype  = Hard
damage    = ceil(var(11)*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(12)*fvar(11))
kill = 1
guard.kill = 0
hitflag = MAF
guardflag = M
priority = 4,hit
pausetime = 10,10
sparkno = S8020+(random%2)
guard.sparkno = S8030
sparkxy = -20,-53
hitsound   = s1,2
guardsound = s2,0
ground.type = High
ground.slidetime = cond((var(32):=22+20+3*(var(42)!=0)+var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=22+20+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=18+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=18+3*(var(42)!=0)+var(34))<=1,1,var(32))
air.hittime = cond((var(32):=24+20+3*(var(42)!=0)+var(34))<=1,1,var(32))
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=24+20+3*(var(42)!=0)+var(34))<=1,1,var(32))+10;hitstun+pausetime value
ground.velocity = -12.0,cond(var(15)=0&&sysvar(4)=0,-8.0,-4.0);-8.0
air.velocity = -12.0,cond(var(15)=0&&sysvar(4)=0,-8.0,-4.0)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
y.accel = 0.5
getpower = 30,15
givepower = ceil(var(11)*0.8*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.2)
p2facing = 1
id = 225
p2stateno = cond(var(15)=0&&sysvar(4)=0,260,-1)
p2getp1state = cond(var(15)=0&&sysvar(4)=0,1,0)

[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = movecontact
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1

[State 200, Damage Dampen]
type = varset
trigger1 = movehit
fvar(10) = fvar(10)*cond(var(15)=0&&sysvar(4)=0,0.72,0.85)*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State -2, Groundbounce]
type = varset
trigger1 = movehit
trigger1 = numtarget(225)
trigger1 = var(15)=0
var(15)=1
persistent=0
ignorehitpause = 1

[State 1602, Recovery Frames]
type = statetypeset
trigger1 = animelemtime(5)>=0
trigger2 = movecontact || movereversed
movetype = I
ignorehitpause = 1
persistent=0

[State 210, JUMP CANCEL]
type = changestate
trigger1 = (var(57)>0 && var(52)=2) ;Spell Overdrive only
trigger1 = movecontact=[1,5]
trigger1 = command = "holdup" || command = "up"
value = 40
ctrl = 0

[State 230, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; 2x
[Statedef 400]
type    = C
movetype= A
physics = C
ctrl = 0
anim = 400
sprpriority = 1
facep2 = 1
juggle = 0;ifelse((var(33)&floor(exp(5*ln(2)) + 0.5)),2*!(var(57)>0 && var(52)=2),0) ;use Juggle

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = (var(11):=23)||1 
trigger1 = (var(12):=0+4*(var(52)=1))||1

[State 200, PSND]
type = PlaySnd
trigger1 = animelemtime(3)=0
value = 200,0
channel = 0

[State 240, 1]
type = PlaySnd
trigger1 = animelemtime(3)=0
value = 0,0

[State 400, 2]
type = HitDef
trigger1 = animelemno(0)=3
trigger1 = movecontact = 0 && movereversed = 0
attr = C, NA
damage = ceil(var(11)*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(12)*fvar(11))
kill = 1
guard.kill = 0
priority  = 4,hit
animtype  = Light
hitflag = MAF
guardflag = L
pausetime = 8,8
sparkno = S8000+(random%2)
guard.sparkno = S8030
sparkxy = -10,-26
hitsound   = s1,0
guardsound = s2,0
ground.type = High
air.type = Low
ground.velocity = -3.5
air.velocity = -3.5,-5.0
yaccel = 0.5
getpower = 30,15
givepower = ceil(var(11)*0.8*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.2)
p2facing = 1
ground.cornerpush.veloff = 0
ground.slidetime = cond((var(32):=14+2*(var(42)!=0)+var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=14+2*(var(42)!=0)+var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=12+2*(var(42)!=0)+var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=12+2*(var(42)!=0)+var(34))<=1,1,var(32))
air.hittime = cond((var(32):=16+2*(var(42)!=0)+var(34))<=1,1,var(32))
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=16+2*(var(42)!=0)+var(34))<=1,1,var(32))+8;hitstun+pausetime value
id = 555
[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = movecontact
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1

[State 200, Damage Dampen]
type = varset
trigger1 = movehit
fvar(10) = fvar(10)*0.92*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State 1602, Recovery Frames]
type = statetypeset
trigger1 = animelemtime(4) = 0
trigger2 = movecontact || movereversed
movetype = I
ignorehitpause = 1
persistent = 0

[State 210, JUMP CANCEL]
type = changestate
trigger1 = (var(57)>0 && var(52)=2) ;Spell Overdrive only
trigger1 = movecontact=[1,5]
trigger1 = command = "holdup" || command = "up"
value = 40
ctrl = 0

[State 400, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; 2y
[Statedef 410]
type    = C
movetype= A
physics = C
ctrl = 0
anim = 410
sprpriority = 1
facep2 = 1
juggle = 0;ifelse((var(33)&floor(exp(6*ln(2)) + 0.5)),2*!(var(57)>0 && var(52)=2),0) ;use Juggle

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = (var(11):=50)||1 
trigger1 = (var(12):=0+10*(var(52)=1))||1

[State 200, PSND]
type = PlaySnd
trigger1 = animelemtime(4)=0
value = 210,0
channel = 0

[State 240, 1]
type = PlaySnd
trigger1 = animelemtime(4)=0
value = 1500,11
channel = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = animelemtime(3)=0
x = 14
[State 0, PosAdd]
type = PosAdd
trigger1 = animelemtime(4)=0
x = 10
[State 0, PosAdd]
type = PosAdd
trigger1 = animelemtime(10)=0
x = -10
[State 0, PosAdd]
type = PosAdd
trigger1 = animelemtime(11)=0
x = -14

[State 210, 2]
type = HitDef
triggerall = !movecontact && !movereversed
trigger1 = animelemno(0)=[4,5]
attr = C, NA
animtype  = Medium
priority = 4,hit
damage = ceil(var(11)*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(12)*fvar(11))
kill = 1
guard.kill = 0
hitflag = MAF
guardflag = M
pausetime = 10,10
sparkno = S8010+(random%2)
guard.sparkno = S8030
sparkxy = -15,-90
hitsound   = s1,2
guardsound = s2,0
ground.type = High
ground.velocity = -3.0
guard.velocity = -4.0
airguard.velocity = -4.0,-6.5
air.type = Low
air.velocity = -3.0,-6.5
y.accel = 0.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ground.slidetime = cond((var(32):=18+3*(var(42)!=0)+var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=18+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=15+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=15+3*(var(42)!=0)+var(34))<=1,1,var(32))
air.hittime = cond((var(32):=20+3*(var(42)!=0)+var(34))<=1,1,var(32))
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=20+3*(var(42)!=0)+var(34))<=1,1,var(32))+10;hitstun+pausetime value
getpower = 30,15;160%/40%
givepower = ceil(var(11)*0.8*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.2) ;80%/20%
p2facing = 1
id = 555

[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = movecontact
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1

[State 200, Damage Dampen]
type = varset
trigger1 = movehit
fvar(10) = fvar(10)*0.85
ignorehitpause = 1
persistent = 0

[State 1602, Recovery Frames]
type = statetypeset
trigger1 = animelemtime(6)>=0
trigger2 = (movecontact||movereversed)
movetype = I
ignorehitpause = 1
persistent = 0

[State 210, JUMP CANCEL]
type = changestate
;trigger1 = (var(57)>0 && var(52)=2) ;Spell Overdrive only
trigger1 = movecontact=[1,5]
trigger1 = command = "holdup" || command = "up"
value = 40
ctrl = 0

[State 410, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1


;---------------------------------------------------------------------------
; 2z
[Statedef 420]
type    = C
movetype= A
physics = C
ctrl = 0
anim = 420
sprpriority = 1
facep2 = 1
juggle = 0;ifelse((var(33)&floor(exp(7*ln(2)) + 0.5)),2*!(var(57)>0 && var(52)=2),0) ;use Juggle

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = (var(11):=70)||1 
trigger1 = (var(12):=0+14*(var(52)=1))||1

[State 0, PosAdd]
type = PosAdd
trigger1 = animelemtime(2)=0
x = 12
[State 0, PosAdd]
type = PosAdd
trigger1 = animelemtime(11)=0
x = -12

[State 0, VelSet]
type = VelSet
trigger1 = animelemno(0)=[3,7]
x = 6.0
;ignorehitpause = 
;persistent = 


[State 200, PSND]
type = PlaySnd
trigger1 = animelemtime(3)=0
value = 210,0
channel = 0

[State 240, 1]
type = PlaySnd
trigger1 = animelemtime(3)=0
value = 1500,11
channel = 1

[State 430, 2]
type = HitDef
trigger1 = animelemno(0)=[3,7]
trigger1 = !movecontact && !movereversed
attr = C, NA
damage = ceil(var(11)*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(12)*fvar(11))
kill = 1
guard.kill = 0
animtype = Heavy
hitflag = MAF
guardflag = L
priority = 4,hit
pausetime = 10,10
sparkno = s8020+(random%2)
guard.sparkno = S8030
sparkxy = -20,-0
hitsound   = s1,2
guardsound = s2,0
ground.type = Low;trip
ground.velocity = -7.5,-4.5
guard.velocity = -7.5
airguard.velocity = -7.5,-4.5
air.type = Low
air.velocity = -7.5,-4.5
y.accel = 0.7
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ground.slidetime = cond((var(32):=27+3*(var(42)!=0)+var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=27+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=22+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=22+3*(var(42)!=0)+var(34))<=1,1,var(32))
air.hittime = cond((var(32):=29+3*(var(42)!=0)+var(34))<=1,1,var(32))
fall = 1
fall.recover = 0
fall.yvelocity = 0
getpower = 30,15
givepower = ceil(var(11)*0.8*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.2)
p2facing = 1
p2stateno = cond(sysvar(4)=0,470,-1)
p2getp1state = cond(sysvar(4)=0,1,0)
id = 420
[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = movecontact
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1

[State 200, Damage Dampen]
type = varset
trigger1 = movehit
fvar(10) = fvar(10)*0.75*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State 0, RECOVERY FRAMES]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
trigger2 = movecontact||movereversed
movetype = I
ignorehitpause = 1
persistent = 0

[State 210, JUMP CANCEL]
type = changestate
trigger1 = (var(57)>0 && var(52)=2) ;Spell Overdrive only
trigger1 = movecontact=[1,5]
trigger1 = command = "holdup" || command = "up"
value = 40
ctrl = 0

[State 430, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; j5x
[Statedef 600]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 600+0*floor(var(55):=0)
sprpriority = 1
juggle = 0

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = (var(11):=25)||1 
trigger1 = (var(12):=0+4*(var(52)=1))||1

[State 200, PSND]
type = PlaySnd
trigger1 = animelemtime(4)=0
value = 200,0
channel = 0

[State 240, 1]
type = PlaySnd
trigger1 = animelemtime(3)=0||animelemtime(7)=0
value = 0,0

[State 610, MHR]
type = movehitreset
trigger1 = animelemtime(7)=0

[State 400, 2]
type = HitDef
trigger1 = animelemno(0)=3||animelemno(0)=7
trigger1 = !movecontact && !movereversed
attr = A, NA
damage = ceil(var(11)*(fvar(11)/cond(var(55)=3,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(12)*fvar(11))
kill = 1
guard.kill = 0
priority  = 4,hit
animtype  = Light
hitflag = MAF
guardflag = HA
pausetime = 6,6
sparkno = S8000+(random%2)
guard.sparkno = S8030
sparkxy = -10,-46
hitsound   = s1,0
guardsound = s2,0
ground.type = High
ground.velocity = -4.0
air.velocity = -4.0,-2.0
getpower = 30,15
givepower = ceil(var(11)*0.8*(fvar(11)/cond(var(55)=3,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.2)
p2facing = 1
ground.slidetime = cond((var(32):=18+2*(var(42)!=0)+var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=18+2*(var(42)!=0)+var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=14+2*(var(42)!=0)+var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=14+2*(var(42)!=0)+var(34))<=1,1,var(32))
air.hittime = cond((var(32):=20+2*(var(42)!=0)+var(34))<=1,1,var(32))
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=20+2*(var(42)!=0)+var(34))<=1,1,var(32))+8;hitstun+pausetime value
id = 555

[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = animelemno(0)=[3,6]
trigger1 = movecontact
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=3,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1
[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = animelemno(0)>=7
trigger1 = movecontact
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=3,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1

[State 220, First Combo Hit]
type = varset
triggerall = numtarget(555) && movehit
trigger1 = target(555),gethitvar(hitcount)=1
trigger1 = var(55)=0
var(55) = 3;Change index
ignorehitpause = 1
persistent = 0

[State 200, Damage Dampen]
type = varset
trigger1 = movehit
trigger1 = animelemno(0)=[3,6]
fvar(10) = fvar(10)*0.948*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0
[State 200, Damage Dampen]
type = varset
trigger1 = movehit
trigger1 = animelemno(0)>=7
fvar(10) = fvar(10)*0.948*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State 600, FLAG RECOVERY]
type = StateTypeSet
trigger1 = animelemtime(8) >= 0
trigger2 = animelemno(0)=8
trigger2 = movecontact||movereversed
movetype = I        ;I,A,H
ignorehitpause = 1
persistent = 0

;---------------------------------------------------------------------------
; j5y
[Statedef 610]
type    = A
movetype= A
physics = A;N
ctrl = 0
anim = 610+0*floor(var(55):=0)
sprpriority = 1
juggle = 0

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = (var(11):=22)||1 
trigger1 = (var(12):=0+5*(var(52)=1))||1

[State 200, PSND]
type = PlaySnd
trigger1 = animelemtime(4)=0
value = 210,0
channel = 0

[State 240, 1]
type = PlaySnd
trigger1 = animelemtime(4)=0||animelemtime(6)=0||animelemtime(8)=0
value = 0,1
channel = 7

[State 610, MHR]
type = movehitreset
trigger1 = animelemtime(6)=0||animelemtime(8)=0

[State 210, 2]
type = HitDef
triggerall = !movecontact && !movereversed
trigger1 = animelemno(0)=4||animelemno(0)=6||animelemno(0)=8
attr = A, NA
animtype  = Medium
priority = 4,hit
damage = ceil(var(11)*(fvar(11)/cond(var(55)=4,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(12)*fvar(11))
kill = 1
guard.kill = 0
hitflag = MAF
guardflag = HA
pausetime = 6,6
sparkno = S8010+(random%2)
guard.sparkno = S8030
sparkxy = -15,-10
hitsound   = s1,1
guardsound = s2,0
ground.type = High
ground.velocity = -3.5
guard.velocity = -3.5
airguard.velocity = -3.5,-2.5
air.type = High
air.velocity = -3.5,-2.5
y.accel = 0.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ground.slidetime = cond((var(32):=18+3*(var(42)!=0)+var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=18+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=14+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=14+3*(var(42)!=0)+var(34))<=1,1,var(32))
air.hittime = cond((var(32):=20+3*(var(42)!=0)+var(34))<=1,1,var(32))
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=20+3*(var(42)!=0)+var(34))<=1,1,var(32))+10;hitstun+pausetime value
getpower = 30,15
givepower = ceil(var(11)*0.8*(fvar(11)/cond(var(55)=4,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.2)
p2facing = 1
id = 555

[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = animelemno(0)=[4,5]
trigger1 = movecontact
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=4,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1
[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = animelemno(0)=[6,7]
trigger1 = movecontact
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=4,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1
[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = animelemno(0)>=8
trigger1 = movecontact
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=4,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1

[State 220, First Combo Hit]
type = varset
triggerall = numtarget(555) && movehit
trigger1 = target(555),gethitvar(hitcount)=1
trigger1 = var(55)=0
var(55) = 4;Change index
ignorehitpause = 1
persistent = 0

[State 200, Damage Dampen]
type = varset
trigger1 = animelemno(0)=[4,5]
trigger1 = movehit
fvar(10) = fvar(10)*0.947*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0
[State 200, Damage Dampen]
type = varset
trigger1 = animelemno(0)=[6,7]
trigger1 = movehit
fvar(10) = fvar(10)*0.947*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0
[State 200, Damage Dampen]
type = varset
trigger1 = animelemno(0)>=8
trigger1 = movehit
fvar(10) = fvar(10)*0.947*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State 610, STS]
type = statetypeset
trigger1 = animelemtime(9)>=0
trigger2 = animelemno(0)=8
trigger2 = (movecontact||movereversed)
movetype = I
ignorehitpause = 1

;---------------------------------------------------------------------------
; j5z
[Statedef 620]
type    = A
movetype= A
physics = N
ctrl = 0
;velset = 0,0
anim = 620+0*floor(var(55):=0)
sprpriority = 1
juggle = 0

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = (var(11):=18)||1 
trigger1 = (var(12):=0+4*(var(52)=1))||1

[State 200, PSND]
type = PlaySnd
trigger1 = animelemtime(3)=0
value = 620,10
channel = 7

[State 620, VelS]
type = velset
trigger1 = animelemno(0)=[3,11]
x = 8.0
y = 0.0

[State 620, VelS]
type = velmul
trigger1 = animelemno(0)>=12
x = 0.9

[State 2000, Spellcard Effect]
type = helper
trigger1 = animelemtime(3) = 0
helpertype = normal
name = "HeliBlade"
id = 20620
stateno = 20620
pos = 0,-55
postype = p1
ownpal = 1
facing = 1
size.xscale = 1.5
size.yscale = 1.5




[State 620, MHR]
type = movehitreset
trigger1 = animelemtime(5)=0||animelemtime(7)=0||animelemtime(9)=0||animelemtime(11)=0

[State 620, 1]
type = HitDef
triggerall = movecontact = 0 && movereversed = 0
trigger1 = animelemno(0)=3||animelemno(0)=5||animelemno(0)=7||animelemno(0)=9||animelemno(0)=11
attr = A, NA
damage = ceil(var(11)*(fvar(11)/cond(var(55)=5,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(12)*fvar(11))
kill = 1
guard.kill = 0
animtype = Heavy
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 4,4
sparkno = S8000+(random%2)+20*(animelemno(0)=10)
guard.sparkno = S8030
sparkxy = -20,-80
hitsound = s1,2
guardsound = s2,0
ground.type = High
ground.velocity = -6.0,0.0
air.velocity = -6.0,-4.0
yaccel = 0.5
getpower = 30,15
givepower = ceil(var(11)*0.8*(fvar(11)/cond(var(55)=5,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.2)
p2facing = 1
id = 555
ground.slidetime = cond((var(32):=18+3*(var(42)!=0)+var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=18+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=14+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=14+3*(var(42)!=0)+var(34))<=1,1,var(32))
air.hittime = cond((var(32):=20+3*(var(42)!=0)+var(34))<=1,1,var(32))
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=20+3*(var(42)!=0)+var(34))<=1,1,var(32))+4+6*(animelemno(0)=10)

[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = animelemno(0)=[3,4]
trigger1 = movecontact
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=5,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),var(11)*0.15)
persistent=0
ignorehitpause = 1
[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = animelemno(0)=[5,6]
trigger1 = movecontact
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=5,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),var(11)*0.15)
persistent=0
ignorehitpause = 1
[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = animelemno(0)=[7,8]
trigger1 = movecontact
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=5,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),var(11)*0.15)
persistent=0
ignorehitpause = 1
[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = animelemno(0)=[9,10]
trigger1 = movecontact
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=5,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),var(11)*0.15)
persistent=0
ignorehitpause = 1
[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = animelemno(0)>=11
trigger1 = movecontact
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=5,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),var(11)*0.15)
persistent=0
ignorehitpause = 1

[State 220, First Combo Hit]
type = varset
triggerall = numtarget(555) && movehit
trigger1 = target(555),gethitvar(hitcount)=1
trigger1 = var(55)=0
var(55) = 5;Change index
ignorehitpause = 1
persistent = 0

[State 200, Damage Dampen]
type = varset
trigger1 = animelemno(0)=[3,4]
trigger1 = movehit
fvar(10) = fvar(10)*0.956*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0
[State 200, Damage Dampen]
type = varset
trigger1 = animelemno(0)=[5,6]
trigger1 = movehit
fvar(10) = fvar(10)*0.956*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0
[State 200, Damage Dampen]
type = varset
trigger1 = animelemno(0)=[7,8]
trigger1 = movehit
fvar(10) = fvar(10)*0.956*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0
[State 200, Damage Dampen]
type = varset
trigger1 = animelemno(0)=[9,10]
trigger1 = movehit
fvar(10) = fvar(10)*0.956*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0
[State 200, Damage Dampen]
type = varset
trigger1 = animelemno(0)>=11
trigger1 = movehit
fvar(10) = fvar(10)*0.956*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State 1602, Recovery Frames]
type = statetypeset
trigger1 = animelemtime(12)>=0
trigger2 = animelemno(0)=11
trigger2 = movecontact||movereversed
movetype = I
ignorehitpause = 1
persistent = 0

[State 620, Grav]
type = veladd
trigger1 = animelemtime(3)<0
trigger2 = animelemtime(13)>=0
y = 0.5

[State 620, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y >= -(vel y)
value = 52

;------------------------------
; Helicopter Blade
[StateDef 20620]
Type = A
MoveType = I
Physics = N
anim = 20620
SprPriority = 7
velset = 0,0

[State 30050, Emulate Hitpause]
type = changeanim
trigger1 = root,hitpausetime
value = anim
elem = animelemno(0)-1

[State 30050, Scale Me]
type = null
trigger1 = time=0
trigger1 = (fvar(0):=1.0)||1
trigger1 = (fvar(1):=0.25)||1

[State 30050, Bind Me - State 620 - J.HP]
type = null
triggerall = root,stateno=620
triggerall = root,anim=620
trigger1 = (var(0):=38)||1
trigger1 = (var(1):=-100)||1
trigger1 = (var(2):=-45)||1

[State 0, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256,256
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State T]
type = turn
trigger1 = facing!=root,facing

[State 20620, Zeeky]
type = destroyself
trigger1 = root,stateno!=620
trigger2 = animtime=0

[State 20010, BTR]
type = bindtoroot
trigger1 = root,stateno=620
trigger1 = root,animelemtime(13)<0
pos = var(0),var(1)

[State 30050, Scaleme]
type = angledraw
trigger1 = 1
value = var(2)
scale = fvar(0),fvar(1)
ignorehitpause = 1

;---------------------------------------------------------------------------
; j2z
[Statedef 625]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 625
sprpriority = 1
juggle = 0

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = (var(11):=70)||1 
trigger1 = (var(12):=0+14*(var(52)=1))||1

[State 620, Grav]
type = veladd
trigger1 = time
y = cond(vel y > 0 && (animelemtime(10)<0),0.2,0.5)

[State 200, PSND]
type = PlaySnd
trigger1 = animelemtime(6)=0
value = 0,2

[State 620, 1]
type = HitDef
triggerall = movecontact = 0 && movereversed = 0
trigger1 = animelemno(0)=[7,8]
attr = A, NA
damage = ceil(var(11)*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(12)*fvar(11))
kill = 1
guard.kill = 0
animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 10,10
sparkno = S8020+(random%2)
guard.sparkno = S8030
sparkxy = -20,0
hitsound = s1,16
guardsound = s2,0
ground.type = High
ground.velocity = -12.0,-8.0
airguard.velocity = -8.0,-8.0
air.velocity = -12.0,-8.0
yaccel = 0.5
getpower = 30,15
givepower = ceil(var(11)*0.8*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.2)
p2facing = 1
;id = 555
ground.slidetime = cond((var(32):=27+3*(var(42)!=0)+var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=27+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=22+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=22+3*(var(42)!=0)+var(34))<=1,1,var(32))
air.hittime = cond((var(32):=29+3*(var(42)!=0)+var(34))<=1,1,var(32))
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=29+3*(var(42)!=0)+var(34))<=1,1,var(32))+10;hitstun+pausetime value
id = 625

[State -2, Spirit Gauge Increase]
type = varadd
trigger1 = var(52)=2 ;Type-ß Only
trigger1 = movecontact
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*fvar(11)*ifelse(var(42),1.25,1.0)),var(11)*0.15)
persistent=0
ignorehitpause = 1

[State 200, Damage Dampen]
type = varset
trigger1 = movehit
fvar(10) = fvar(10)*0.8
ignorehitpause = 1
persistent = 0

[State 1602, Recovery Frames]
type = statetypeset
trigger1 = animelemtime(9)>=0
trigger2 = movecontact||movereversed
movetype = I
ignorehitpause = 1
persistent = 0

[State 620, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y >= -(vel y)
value = 52

;---------------------------------------------------------------------------
; Grab Attempt
[Statedef 800]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 800
sprpriority = 1
facep2 = 1
juggle = 0

[State 800, CS]
type = changestate
trigger1 = numtarget(800)
trigger1 = movehit
value = 801
ignorehitpause = 1
persistent = 0

[State 800, CS]
type = changestate
trigger1 = animtime=0
value = 220+5*(var(10)=2);Change to s.HP if throw whiffs

[State 800, Throw]
type = varset
trigger1 = AILevel <= 0
trigger1 = time = 0
var(10)=cond((command="holdback"&&command!="holdfwd"),1,cond((command!="holdback"&&command="holdfwd"),2,0))
[State 800, Tech Reset]
type = varset
trigger1 = 1
var(13) = 0
[State 800, Tech Set]
type = varset
trigger1 = numenemy > 0
trigger1 = enemynear(0),statetype != A
trigger1 = (enemynear(0),stateno = [0,999]) || enemynear(0),movetype = H
trigger1 = enemynear(0),stateno != [200,799]
trigger1 = enemynear(0),stateno != [100,119]
var(13) = 15+12*(enemynear(0),movetype = H)
[State 800, HD]
type = HitDef
trigger1 = var(30) = 0 ;ONLY WHEN THROWS ARE ALLOWED
trigger1 = time=0
trigger1 = var(10)!=0
attr = S, NT
hitflag = M;-
priority = 7, Miss
sparkno = -1
guard.sparkno = -1
hitsound = s1,0
guardsound = -1
p1sprpriority = 1
p1facing = 1
p2facing = 1
guard.dist = 0
;p1stateno = 801;+(var(10)=1)
;fall = 1
;fall.recover = 0
y.accel = 0.5
getpower = 60,30
givepower = 0,0
guard.dist = 0
ID = 800
numhits = 1

;[State 800, CS]
;type = changestate
;trigger1 = animtime=0
;value = 220+5*(var(10)=2);Change to s.HP if throw whiffs

;---------------------------------------------------------------------------
;Fwd Grab - Part 2
[Statedef 801]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 801+0*floor(var(6):=0);Tech Flag
velset = 0, 0
sprpriority = 1

[State 801, TS]
type = targetstate
trigger1 = time = 0
id = 800
value = 850

[State 801, TF]
type = targetfacing
trigger1 = time = 0
value = -1
id = 800

[State 0, Explod]
type = Explod
trigger1 = time = 0
trigger1 = var(13)>0
anim = 890
ID = 20890
pos = 0,-120
postype = p2
facing = 1
bindtime = -1
vel = 0,0
removetime = var(13)
pausemovetime = 0
scale = 0.25,0.25
sprpriority = 5
ontop = 0
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = time = 0
trigger1 = var(13)>16
anim = 890
ID = 20890
pos = 20,-120
postype = p2
facing = 1
bindtime = -1
vel = 0,0
removetime = var(13)
pausemovetime = 0
scale = 0.25,0.25
sprpriority = 5
ontop = 0
ownpal = 1
removeongethit = 1

[State 801, Tech Success]
type = varset;ChangeState
triggerall = NumTarget
triggerall = var(13)>0
trigger1 = (target,command = "holdfwd" || target,command = "holdback") && target,command != "holdup" && target,command != "holddown"
trigger1 = (target,AILevel=0)&&(target,command = "x" || target,command = "y" || target,command = "z")
trigger2 = (target,command = "holdfwd" || target,command = "holdback") && target,command != "holdup" && target,command != "holddown"
trigger2 = (target,AILevel=0)&&(target,command = "a" || target,command = "b" || target,command = "c")
trigger3 = (target,AILevel>0)&&(random<=floor(100*AIlevel*AIlevel/64.0))
;value = 890
var(6)=1

[State 801, Tech Success]
type = changestate
trigger1 = var(6)=1
trigger1 = time=28;27f+1f
value = 890

[State 810, Throw Escape]
type = VarAdd
trigger1 = var(13) > 0
var(13) = -1

[State 810, TS]
type = targetstate
trigger1 = time = 0
value = 850

[State 801, TF]
type = targetfacing
trigger1 = time = 0
value = -1
id = 800

[State 810, T]
type = turn
trigger1 = animelemtime(7)=0;animelemtime(2)=0
trigger1 = var(10)=1

[State 801, TF]
type = targetfacing
trigger1 = animelemtime(7)=0;animelemtime(2)=0
trigger1 = var(10)=1
value = -1
id = 800

[State 801, PP]
type = playerpush
trigger1 = 1
value = 0

[State 810, Bind]
type = TargetBind
trigger1 = time = 0
pos = 35,0;36, 0

[State 810, Bind]
type = TargetBind
trigger1 = animelemtime(2)=0
trigger1 = var(10)=1
pos = 35,0;36, 0
;===============
; END SYSTEM FX
;===============

[State 810, PSND]
type = playsnd
trigger1 = animelemtime(3)=0
value = 800,0
channel = 0

[State 810, PSND]
type = playsnd
trigger1 = animelemtime(5)=0
value = 1,0

[State 0, Width]
type = Width
trigger1 = animelemno(0)=[5,8]
edge = 50,0
ignorehitpause = 1

[State 810, Bind]
type = TargetBind
trigger1 = animelemno(0)=[5,8]
pos = 50,0

[State 810, VS]
type = hitadd
trigger1 = animelemtime(5)=0
value = 1

[State 810, TS]
type = targetstate
trigger1 = animelemtime(5)=0
value = 855

[State 810, TS]
type = targetstate
trigger1 = animelemtime(9)=0
value = 851

[State 810, Bind]
type = TargetBind
trigger1 = animelemtime(9)=0
pos = 50,-10

[State 810, PSND]
type = PlaySnd
trigger1 = animelemtime(9)=0
value = 0,2

[State 810, TLA]
type = targetlifeadd
trigger1 = animelemtime(9)=0
id = 800
kill = 1
value = -ceil(70.0*fvar(11))

[State 810, Poweradd]
type = poweradd
trigger1 = animelemtime(9)=0
value = ceil(70.0*1.6*fvar(11))

[State 810, Target Poweradd]
type = targetpoweradd
trigger1 = animelemtime(9)=0
value = ceil(70.0*0.8*fvar(11))

[State -2, Spirit Gauge Increase]
type = varadd
triggerall = var(52)=2 ;Type-ß Only
triggerall = var(54)<ceil(lifemax*0.9)
trigger1 = animelemtime(9)=0
var(54) = ceil(70.0*0.6*fvar(11))
;persistent=0
ignorehitpause = 1

[State 810, PSND]
type = varset
trigger1 = animelemtime(9)=0
fvar(10)=fvar(10)*0.85*cond(fvar(10)>=1.0,(fvar(30)),1.0)

[State 0, HitAdd]
type = HitAdd
trigger1 = animelemtime(9)=0
trigger1 = (var(4):=1)||1
value = 1
ignorehitpause = 1
;persistent=0

[State 801, IKEMEN Safeguard] ;I Really didn't want to implement this but the alternative would be much messier
type = ChangeState
trigger1 = !NumTarget(800)
trigger1 = animelemtime(9)<0
value = 891

[State 810, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Air Grab Attempt
[Statedef 810]
type    = A
movetype= A
physics = A
ctrl = 0
anim = 810
sprpriority = 1
facep2 = 1
juggle = 0

[State 800, CS]
type = changestate
trigger1 = numtarget(810)
trigger1 = movehit
value = 811
ignorehitpause = 1
persistent = 0

[State 800, CS]
type = changestate
trigger1 = animtime=0
value = 620+5*(command="holddown");Change to s.HP if throw whiffs

[State 800, Throw]
type = varset
trigger1 = AILevel <= 0
trigger1 = time = 0
var(10)=cond((command="holdback"&&command!="holdfwd"),1,cond((command!="holdback"&&command="holdfwd"),2,0))
[State 800, Tech Reset]
type = varset
trigger1 = 1
var(13) = 0
[State 800, Tech Set]
type = varset
trigger1 = numenemy > 0
trigger1 = enemynear(0),statetype = A
trigger1 = (enemynear(0),stateno = [0,999]) || enemynear(0),movetype = H
trigger1 = (enemynear(0),stateno != [200,799]) || enemynear(0),movetype = H  
trigger1 = enemynear(0),stateno != [100,119]
var(13) = 8+8*(enemynear(0),movetype = H)
[State 800, HD]
type = HitDef
trigger1 = var(30) = 0 ;ONLY WHEN THROWS ARE ALLOWED
trigger1 = time=0
trigger1 = var(10)!=0
attr = A, NT
hitflag = AF;-
priority = 7, Miss
sparkno = -1
guard.sparkno = -1
hitsound = s1,0
guardsound = -1
p1sprpriority = 1
p1facing = 1
p2facing = 1
;p1stateno = 811;11;+(var(10)=1)
guard.dist = 0
;fall = 1
;fall.recover = 0
y.accel = 0.5
getpower = 60,30
givepower = 0,0
guard.dist = 0
ID = 810
numhits = 1

;---------------------------------------------------------------------------
;Air Grab - Part 2
[Statedef 811]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 811+0*floor(var(6):=0);Tech Flag
velset = 0, 0
sprpriority = 1

[State 801, TS]
type = targetstate
trigger1 = time = 0
id = 810
value = 870

[State 801, TF]
type = targetfacing
trigger1 = time = 0
value = -1
id = 810

[State 0, Explod]
type = Explod
trigger1 = time = 0
trigger1 = var(13)>0
anim = 890
ID = 20890
pos = 0,-120
postype = p2
facing = 1
bindtime = -1
vel = 0,0
removetime = var(13)
pausemovetime = 0
scale = 0.25,0.25
sprpriority = 5
ontop = 0
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = time = 0
trigger1 = var(13)>16
anim = 890
ID = 20890
pos = 20,-120
postype = p2
facing = 1
bindtime = -1
vel = 0,0
removetime = var(13)
pausemovetime = 0
scale = 0.25,0.25
sprpriority = 5
ontop = 0
ownpal = 1
removeongethit = 1

[State 801, Tech Success]
type = varset;ChangeState
triggerall = NumTarget
triggerall = var(13)>0
trigger1 = (target,command = "holdfwd" || target,command = "holdback") && target,command != "holdup" && target,command != "holddown"
trigger1 = (target,AILevel=0)&&(target,command = "x" || target,command = "y" || target,command = "z")
trigger2 = (target,command = "holdfwd" || target,command = "holdback") && target,command != "holdup" && target,command != "holddown"
trigger2 = (target,AILevel=0)&&(target,command = "a" || target,command = "b" || target,command = "c")
trigger3 = (target,AILevel>0)&&(random<=floor(100*AIlevel*AIlevel/64.0))
;value = 890
var(6)=1

[State 801, Tech Success]
type = changestate
trigger1 = var(6)=1
trigger1 = time=28;
value = 892

[State 810, Throw Escape]
type = VarAdd
trigger1 = var(13) > 0
var(13) = -1

[State 810, TS]
type = targetstate
trigger1 = time = 0
value = 870

[State 801, TF]
type = targetfacing
trigger1 = time = 0
;trigger2 = animelemtime(5)=0
;trigger2 = var(10)=1
value = -1
id = 810

[State 810, T]
type = turn
trigger1 = animelemtime(7)=0;animelemtime(2)=0
trigger1 = var(10)=1

[State 801, TF]
type = targetfacing
trigger1 = animelemtime(7)=0;animelemtime(2)=0
trigger1 = var(10)=1
value = -1
id = 810

[State 801, PP]
type = playerpush
trigger1 = 1
value = 0

[State 810, Bind]
type = TargetBind
trigger1 = time = 0
pos = 35,0;36, 0

[State 810, Bind]
type = TargetBind
trigger1 = animelemtime(2)=0
trigger1 = var(10)=1
pos = 35,0;36, 0
;===============
; END SYSTEM FX
;===============

[State 810, PSND]
type = playsnd
trigger1 = animelemtime(3)=0
value = 800,0
channel = 0

[State 810, PSND]
type = playsnd
trigger1 = animelemtime(5)=0
value = 1,0

[State 0, Width]
type = Width
trigger1 = animelemno(0)=[5,8]
edge = 50,0
ignorehitpause = 1

[State 810, Bind]
type = TargetBind
trigger1 = animelemno(0)=[5,8]
pos = 50,0

[State 810, VS]
type = hitadd
trigger1 = animelemtime(5)=0
value = 1

[State 810, TS]
type = targetstate
trigger1 = animelemtime(5)=0
value = 855

[State 810, TS]
type = targetstate
trigger1 = animelemtime(9)=0
value = 851

[State 810, Bind]
type = TargetBind
trigger1 = animelemtime(9)=0
pos = 50,-10

[State 810, PSND]
type = PlaySnd
trigger1 = animelemtime(9)=0
value = 0,2

[State 810, TLA]
type = targetlifeadd
trigger1 = animelemtime(9)=0
id = 810
kill = 1
value = -ceil(60.0*fvar(11))

[State 810, Poweradd]
type = poweradd
trigger1 = animelemtime(9)=0
value = ceil(60.0*1.6*fvar(11))

[State 810, Target Poweradd]
type = targetpoweradd
trigger1 = animelemtime(9)=0
value = ceil(60.0*0.8*fvar(11))

[State -2, Spirit Gauge Increase]
type = varadd
triggerall = var(52)=2 ;Type-ß Only
triggerall = var(54)<ceil(lifemax*0.9)
trigger1 = animelemtime(9)=0
var(54) = ceil(60.0*0.6*fvar(11))
;persistent=0
ignorehitpause = 1

[State 810, PSND]
type = varset
trigger1 = animelemtime(9)=0
fvar(10)=fvar(10)*0.85*cond(fvar(10)>=1.0,(fvar(30)),1.0)

[State 0, HitAdd]
type = HitAdd
trigger1 = animelemtime(9)=0
trigger1 = (var(4):=1)||1
value = 1
ignorehitpause = 1
;persistent=0

[State 801, IKEMEN Safeguard] ;I Really didn't want to implement this but the alternative would be much messier
type = ChangeState
trigger1 = !NumTarget(810)
trigger1 = animelemtime(9)<0
value = 891


;END GRAB, PROCEED TO FALL ANIM

[State 0, Gravity]
type = VelAdd
trigger1 = animelemtime(14)>=0
x = 0
y = 0.5

[State 800, CS]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y >= -(vel y);animtime = 0
value = 812
ctrl = 0

;---------------------------------------------------------------------------
; Air Grab Land
[Statedef 812]
type    = S
movetype= I
physics = N
velset = 0,0
anim = 47
ctrl = 0
sprpriority = 1

[State 4111, PS]
type = posset
trigger1 = time = 0
y = 0

[State -3, Landing Sound]
type = PlaySnd
trigger1 = time=0
value = 40, 0

[State 1002, CS]
type = changestate
trigger1 = animtime=0
value = 0
ctrl = 1

;---------------
[Statedef 850]
type    = S
movetype= H
physics = S
velset = 0,0

[State 801, PP]
type = playerpush
trigger1 = 1
value = 0

[State 803, CA]
type = ChangeAnim2
Trigger1 = Time = 0
value = 850

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0
ignorehitpause = 1

;---------------
[Statedef 855]
type    = A
movetype= H
physics = N
velset = 0,0

[State 801, PP]
type = playerpush
trigger1 = 1
value = 0

[State 803, CA]
type = ChangeAnim2
Trigger1 = Time = 0
value = 855


;---------------
[Statedef 851]
type    = A
movetype= H
physics = N
velset = 0,0

[State 803, CA]
type = ChangeAnim2
Trigger1 = Time = 0
value = 851

[State 810, Bind]
type = velset
trigger1 = animelemtime(2)=0
x = -12.0
y = -4.5

[State 807, Accel]
type = veladd;gravity
trigger1 = animelemtime(2)>0
y = 0.5

[State 851, CS]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -(vel y)
value = 852

;---------------
; Back Throw
[Statedef 856]
type    = A
movetype= H
physics = N
velset = 0,0

[State 803, CA]
type = ChangeAnim2
Trigger1 = Time = 0
value = 851

[State 810, Bind]
type = velset
trigger1 = animelemtime(1)=0
x = 6.0
y = -9.0

[State 807, Accel]
type = veladd;gravity
trigger1 = animelemtime(1)>0
y = 0.5

[State 851, CS]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -(vel y)
value = 852

;---------------
[Statedef 861]
type    = A
movetype= H
physics = N
velset = 0,0
sprpriority = 0

[State 803, CA]
type = ChangeAnim2
Trigger1 = Time = 0
value = 851

[State 851, VS]
type = velset
trigger1 = time = 0
x = -8.0
y = -4.0

[State 851, VA]
type = veladd
trigger1 = time
y = 0.5

[State 851, CS]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -(vel y)
value = 852


;---------------------------------------------------------------------------
; Downed get-hit (hit ground from fall)
[Statedef 852]
type    = L
movetype= H
physics = N

[State 5100, 2004.04.14 behavior]
type = null;VelSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
trigger1 = vel x < -1
x = -1

[State 5100, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5100, Var] ;Save fall velocity
type = VarSet
trigger1 = Time = 0
sysvar(1) = floor(vel y)

[State 5100, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = (anim != [5051,5059]) && (anim != [5061,5069])
trigger2 = !SelfAnimExist(5100 + (anim % 10))
value = 5100

[State 5100, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
trigger1 = time = 0
trigger1 = (anim = [5051,5059]) || (anim = [5061,5069])
trigger1 = SelfAnimExist(5100 + (anim % 10))
value = 5100 + (anim % 10)

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

[State 5100, 7]
type = ChangeState
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
value = 854;5110 ;Downed get-hit (lying down)

[State 5100, 8]
type = Explod
trigger1 = Time = 1
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0, 0
sprpriority = ifelse (sysvar(1) <= Const720p(56), -10, 10)

[State 5100, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 5100, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 5100, 11]
type = PosFreeze
trigger1 = 1

[State 5100, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 853;5101 ;Downed get-hit (bounce off ground)

[State 5100, 13]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20



;---------------------------------------------------------------------------
; Downed get-hit (bounce off ground)
[Statedef 853]
type    = L
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
type = HitFallVel
trigger1 = Time = 0

[State 5101, 4]
type = PosSet
trigger1 = Time = 0
y = Const(movement.down.bounce.offset.y)

[State 5101, 5]
type = PosAdd
trigger1 = Time = 0
x = Const(movement.down.bounce.offset.x)

[State 5101, 6] ;Acceleration
type = VelAdd
trigger1 = 1
y = Const(movement.down.bounce.yaccel)

[State 5101, 7] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= Const(movement.down.bounce.groundlevel)
type = ChangeState
value = 854;5110


;-------------------------------------------
; Hard Knockdown
[Statedef 854]
type    = L
movetype = H
physics = N
velset = 0,0
sprpriority = 1

[State 5110, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5110, 1] ;For hit up/up-diag type (from state 5081)
type = ChangeAnim
persistent = 0
trigger1 = SelfAnimExist(5110 + (anim % 10))
trigger1 = anim = [5081,5089]
value = 5110 + (anim % 10)

[State 5110, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (anim % 10))
value = 5170

[State 5110, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (anim % 10))
value = 5170 + (anim % 10)

[State 5110, 4]
type = HitFallDamage
trigger1 = Time = 0

[State 5110, 5]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5110, Var] ;Get fall velocity
type = VarSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) != 0
sysvar(1) = floor(vel y)

[State 5110, 6]
type = PlaySnd
trigger1 = Time = 0
trigger1 = !SysVar(0)
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 5110, 7]
type = Explod
trigger1 = Time = 0
trigger1 = !SysVar(0)
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0, 0
sprpriority = ifelse (sysvar(1) <= Const720p(56), -10, 10)

[State 5110, 8]
type = VelSet
trigger1 = Time = 0
y = 0

[State 5110, 9] ;For hit up type
type = ChangeAnim
persistent = 0
triggerall = anim = [5171,5179]
triggerall = SelfAnimExist(5110 + (anim % 10))
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground anim
value = 5110 + (anim % 10)

[State 5110, 10] ;For normal
type = ChangeAnim
persistent = 0
triggerall = Anim != [5111,5119]
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
value = 5110

[State 5110, 11] ;If just died
type = Selfstate;ChangeState
triggerall = !alive
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
trigger3 = Anim = [5110,5119]
value = 5150

[State 5110, 12]
type = VarSet
trigger1 = SysVar(0)
trigger1 = Time = 0
sysvar(0) = 0

[State 5110, 13] ;Friction
type = VelMul
trigger1 = 1
x = 0.85

[State 5110, 14] ;Friction
type = VelSet
trigger1 = abs(Vel x) < Const(movement.down.friction.threshold)
persistent = 0
x = 0

[State 5110, 15]
type = ForceFeedback
trigger1 = alive
trigger1 = Time = 0
time = 8
ampl = 240
waveform = sine

[State 5110, 16]
type = ForceFeedback
trigger1 = !alive
trigger1 = Time = 0
ampl = 200, 7, -.467
time = 30
waveform = sine

[State 852, SS]
type = selfstate
trigger1 = alive
trigger1 = time >= 11
value = 5120

;---------------
[Statedef 870]
type    = A
movetype= H
physics = N
velset = 0,0

[State 801, PP]
type = playerpush
trigger1 = 1
value = 0

[State 803, CA]
type = ChangeAnim2
Trigger1 = Time = 0
value = 850

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0
ignorehitpause = 1

;---------------------------------------------------------------------------
;Throw Tech Success - Ground
[StateDef 890]
type = S
physics = N
movetype = A;I
anim = 5945
ctrl = 0
velset = 0,0
sprPriority = 1

[State 890, PSND]
type = null;PlaySnd
trigger1 = AnimElemtime(2) = 0
value = 890,0
channel = 0

[State 890, PSND]
type = PlaySnd
trigger1= time = 0
value = 3,1

[State 890, T]
type = null;turn
trigger1 = time = 0

[State 890, PA]
type = PosAdd
trigger1 = time = 0
x = 24

[State 890, PS]
type = PosSet
trigger1 = time = 0
y = 0

[State 890, TB]
type = TargetBind
trigger1 = time = 0
trigger1 = numtarget
pos = 0,0

[State 890, TS]
type = TargetState
trigger1 = time = 0
trigger1 = numtarget
value = 895

[State 890, TF]
type = TargetFacing
trigger1 = time = 0
trigger1 = numtarget
value = -1

[State 890, NHB]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 890, PP]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 0
persistent = 4
anim = 8020
ID = 8000
pos = 0,-70
postype = p1  ;p2,front,back,left,right
facing = 1
removetime = -2
pausemovetime = 0
scale = 1,1
sprpriority = 5
ontop = 1
ownpal = 1
removeongethit = 0
pausemovetime = 999999
supermovetime = 999999

[State 890, VS]
type = VelSet
trigger1 = time = 0
x = -8;-6.14
y = 0

[State 890, VM]
type = veladd;mul
trigger1 = time>=0
trigger1 = vel x < 0
x = 0.5;85

[State 890, PA]
type = posadd
triggerall = numtarget
trigger1 = target,frontedgebodydist <= abs(target,vel x + target,const(size.ground.front))
trigger1 = target,vel x > 0.0
trigger2 = target,backedgebodydist <= abs(target,vel x - target,const(size.ground.back))
trigger2 = target,vel x < 0.0
x = cond((target,pos x - pos x) * facing > 0, -abs(target,vel x), abs(target,vel x))


[State 890, CS]
type = ChangeState
trigger1 = time >= 27
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Throw Escape Failsafe
[StateDef 891]
type = S
physics = N
movetype = A;I
anim = 5945
ctrl = 0
velset = 0,0
sprPriority = 1

[State 800, REX]
type = removeexplod
trigger1 = animelemtime(1)=0
id =20800

[State 890, PSND]
type = PlaySnd
trigger1 = AnimElemtime(2) = 0
value = 890,0
channel = 0

[State 890, PSND]
type = PlaySnd
trigger1= time = 0
value = 890,10

[State 890, T]
type = null;turn
trigger1 = time = 0

[State 890, PA]
type = PosAdd
trigger1 = time = 0
x = 24

[State 890, PS]
type = PosSet
trigger1 = time = 0
y = 0

[State 890, NHB]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 890, PP]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 0
persistent = 4
anim = 8020
ID = 8000
pos = 0,-70
postype = p1  ;p2,front,back,left,right
facing = 1
removetime = -2
pausemovetime = 0
scale = 1,1
sprpriority = 5
ontop = 1
ownpal = 1
removeongethit = 0
pausemovetime = 999999
supermovetime = 999999

[State 890, CS]
type = ChangeState
trigger1 = time >= 27
value = 0
ctrl = 1



;---------------------------------------------------------------------------
;Throw Tech Success - Air
[StateDef 892]
type = A
physics = N
movetype = A;I
anim = 5040
ctrl = 0
velset = 0,0
sprPriority = 1

[State 890, PSND]
type = PlaySnd
trigger1= time = 0
value = 3,1

[State 890, T]
type = null;turn
trigger1 = time = 0

[State 890, TB]
type = TargetBind
trigger1 = time = 0
trigger1 = numtarget
pos = 30,0

[State 890, TS]
type = TargetState
trigger1 = time = 0
trigger1 = numtarget
value = 896

[State 890, TF]
type = TargetFacing
trigger1 = time = 0
trigger1 = numtarget
value = -1

[State 890, NHB]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 890, PP]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 0, Explod]
type = Explod
trigger1 = time = 0
persistent = 4
anim = 8020
ID = 8000
pos = 0,-70
postype = p1  ;p2,front,back,left,right
facing = 1
removetime = -2
pausemovetime = 0
scale = 1,1
sprpriority = 5
ontop = 1
ownpal = 1
removeongethit = 0
pausemovetime = 999999
supermovetime = 999999

[State 890, VS]
type = VelSet
trigger1 = time = 0
x = -3.0
y = -8.0

[State 890, VM]
type = veladd;mul
trigger1 = time
y = 0.5;85

[State 890, CS]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y >= -(vel y)
value = 52
ctrl = 0

;------------------------
;Target Throw Escape - Ground
[StateDef 895]
type = S
physics = N
moveType = H
ctrl = 0
velSet = 0,0
sprPriority = 0

[State 895, PS]
type = PosSet
trigger1 = time = 0
y = 0

[State 895, CA]
type = ChangeAnim
trigger1 = time = 0
value = ifElse(SelfAnimExist(5940), 5940, 130)

[State 895, CA]
type = ChangeAnim
trigger1 = time = 0
trigger1 = !selfanimexist(5945)
trigger1 = selfanimexist(5940)
value = 5940

[State 895, CA]
type = ChangeAnim
trigger1 = time = 0
trigger1 = !selfanimexist(5945)
trigger1 = !selfanimexist(5940)
trigger1 = selfanimexist(5910)
value = 5910

[State 895, CA]
type = ChangeAnim
trigger1 = time >= 20
trigger1 = anim = 130
value = 140

[State 895, NHB]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 895, PP]
type = PlayerPush
trigger1 = 1
value = 0

[State 890, VS]
type = VelSet
trigger1 = time = 0
x = -8;-6.14
y = 0

[State 890, VM]
type = veladd;mul
trigger1 = time>=0
trigger1 = vel x < 0
x = 0.5;85

[State 895, CS]
type = SelfState
trigger1 = Time >= 27
value = 0
ctrl = 1

;------------------------
;Target Throw Escape - Air
[StateDef 896]
type = A
physics = N
moveType = H
ctrl = 0
velSet = 0,0
sprPriority = 0

[State 895, CA]
type = ChangeAnim
trigger1 = time = 0
value = 5040

[State 895, NHB]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 895, PP]
type = PlayerPush
trigger1 = 1
value = 0

[State 890, VS]
type = VelSet
trigger1 = time = 0
x = -3.0
y = -8.0

[State 890, VM]
type = veladd;mul
trigger1 = time
y = 0.5;85

[State 890, CS]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= -(vel y)
value = 52
ctrl = 0

