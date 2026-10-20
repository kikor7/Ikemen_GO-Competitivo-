;---------------------------------------------------------------------------
; 63214p: Farewell Rubber Ring
[Statedef 1000]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 1000+1*(var(10)=2)+2*(var(10)>=3)+0*floor(var(55):=0)
poweradd = ceil(45.0*fvar(11))
ctrl = 0
sprpriority = 1
facep2 = 1
juggle = 0

[State 1XXX, Special Counter]
type = varadd
trigger1 = time = 0
var(3) = 1
persistent = 0
ignorehitpause = 1

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = var(10)<=1
trigger1 = (var(11):=80)||1 ;Base: 35
trigger1 = (var(12):=16)||1
trigger2 = var(10)=2
trigger2 = (var(11):=80)||1 ;Base: 35
trigger2 = (var(12):=16)||1
trigger3 = var(10)>=3
trigger3 = (var(11):=80)||1 ;Base: 35
trigger3 = (var(12):=16)||1

[State 240, 1]
type = PlaySnd
trigger1 = animelemtime(4)=0
value = 1000,10
[State 240, 1]
type = PlaySnd
trigger1 = animelemtime(8)=0
value = 1000,11

[State 240, 1]
type = PlaySnd
trigger1 = animelemtime(8)=0
value = 0,2

[State 1000, STS]
type = statetypeset
trigger1 = var(10)<=1
trigger1 = animelemtime(8)=0
physics = N

[State 1000, STS]
type = statetypeset
triggerall = var(10)=2
trigger1 = animelemtime(8)=0
statetype=A
physics = N

[State 1000, Velset]
type = velset
trigger1 = var(10)<=2
trigger1 = animelemno(0)=[8,13]
x = 12.5*cond(var(10)<=1,1.0,cos(45.0*pi/180.0))
y = -12.5*cond(var(10)<=1,0.0,sin(45.0*pi/180.0))

[State 1000, Velset]
type = velset
trigger1 = var(10)>=3
trigger1 = animelemno(0)=[8,11]
x = 10.0
y = 0.0


[State 1000, Velset]
type = velset
trigger1 = var(10)>=3
trigger1 = animelemno(0)=[12,13]
x = 10.0
y = -2.0-2.0*(animelemtime(12))

[State 1000, Velset]
type = velmul
trigger1 = var(10)>=3
trigger1 = animelemno(0)=[14,18]
x = 0.8
y = 0.95

[State 1000, Velset]
type = veladd
trigger1 = var(10)>=3
trigger1 = animelemno(0)>=19
y = 0.5

[State 1000, STS]
type = statetypeset
trigger1 = var(10)<=1
trigger1 = animelemtime(14)=0
physics = S

[State 1000, STS]
type = statetypeset
trigger1 = var(10)>=3
trigger1 = animelemtime(12)=0
statetype = A
physics = N

[State 1000, VS]
type = velset
trigger1 = var(10)=2
trigger1 = animelemtime(14)=0
x = 4.0
y = -4.0

[State 1000, Grav]
type = velmul
trigger1 = var(10)=2
trigger1 = animelemtime(14)>0
x = 0.85
[State 1000, Grav]
type = veladd
trigger1 = var(10)=2
trigger1 = animelemtime(14)>0
y = 0.5

[State 1010, Effect]
type = helper
trigger1 = !ishelper
trigger1 = animelemtime(4)=0
helpertype = normal
name = "Hookshot"
ID = 21000
pos = 40,-65
postype = p1
stateno = 21000
ownpal = 1
facing = 1
;size.xscale = 0.5
;size.yscale = 0.4
;size.shadowoffset = 50

[State 1010, Effect]
type = helper
trigger1 = !ishelper
trigger1 = animelemtime(4)=0
helpertype = normal
name = "Wire"
ID = 21000
pos = 40,-65
postype = p1
stateno = 21010
ownpal = 1
facing = 1

[State 1000, Nopush]
type = playerpush
trigger1 = animelemno(0)=[8,14]
value = 0
ignorehitpause = 1

[State 1200, Hitdef]
type = HitDef
triggerall = movecontact = 0 && movereversed=0
trigger1 = animelemno(0)=[8,13]
attr = S,SA
animtype = Back
damage = ceil(var(11)*(fvar(11)/cond(var(55)=6,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(12)*fvar(11))
priority = 4,hit
hitflag = MAF
guardflag = MA
pausetime = 10,10
guard.pausetime = 10,10
sparkno = S8020+(random%2)
guard.sparkno = S8030
sparkxy = -20,-65
hitsound   = s1,2
guardsound = s2,0
ground.type = High
air.type = Low
ground.slidetime = cond((var(32):=27+0+3*(var(42)!=0)+var(34))<=1,1,var(32));27*2
ground.hittime  = cond((var(32):=27+0+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=22+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=22+3*(var(42)!=0)+var(34))<=1,1,var(32))
air.hittime = cond((var(32):=29+0+3*(var(42)!=0)+var(34))<=1,1,var(32))
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ground.velocity = -13.0+4.0*(var(10)=2),-5.0-4.0*(var(10)=2)
air.velocity = -13.0+4.0*(var(10)=2),-5.0-4.0*(var(10)=2)
getpower = 30,15
givepower = ceil(var(11)*0.8*(fvar(11)/cond(var(55)=6,(fvar(30)),1))),ceil(var(11)*0.2)
yaccel = 0.5
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=29+0+3*(var(42)!=0)+var(34))<=1,1,var(32))+10;hitstun+pausetime value
p2facing = 1
id = 1000
p2stateno = cond(var(15)=0&&sysvar(4)=0&&var(10)<=1,260,-1)
p2getp1state = cond(var(15)=0&&sysvar(4)=0&&var(10)<=1,1,0)
;p1stateno = 1001
;p2facing = 1

[State -2, Spirit Gauge Increase (1st Hit)]
type = varadd
triggerall = var(52)=2 ;Type-C Only
triggerall = movehit
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1

[State 220, First Combo Hit]
type = varset
triggerall = numtarget(1000) && movehit
trigger1 = target(1000),gethitvar(hitcount)=1
trigger1 = var(55)=0
var(55) = 6;Change index
ignorehitpause = 1
persistent = 0

[State 200, Damage Dampen]
type = varset
trigger1 = movehit
fvar(10) = fvar(10)*0.85*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State -2, Wallbounce]
type = varset
trigger1 = movehit && var(10)<=1
trigger1 = numtarget(1000)
trigger1 = var(15)=0
var(15)=1
persistent=0
ignorehitpause = 1

[State -2, FLAG RECOVERY FRAMES]
type = statetypeset
trigger1 = animelemtime(14)>=0
trigger2 = movecontact||movereversed
movetype = I
persistent = 0
ignorehitpause = 1

[State 1000, CS]
type = ChangeState
trigger1 = statetype!=A
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 1000, CS]
type = ChangeState
trigger1 = statetype=A
trigger1 = vel y > 0
trigger1 = pos y >= -(vel y)
value = 1001

;---------------------------------------------------------------------------
; FRR Land
[Statedef 1001]
type    = S                     
movetype= I           
physics = S                    
ctrl = 0                      
anim = 47
velset = 0,0
poweradd = 0
sprpriority = 1

[State 1002, PS]
type = posset
trigger1 = time = 0
y = 0

[State 1002, CS]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;--------------------------
; 63214p: Grapple
[Statedef 21000]
type    = A
movetype= I
physics = N
juggle  = 0
anim = 21000
sprpriority = -1
; Var(0) = Timer
; Var(1) = Hitcount
; Var(10) = Version
; Var(11) = Damage
; Var(12) = Chip Damage
; Var(13) = Angle

[State 21200, CVS]
type = varset
trigger1 = time = 0
var(10) = root,var(10)

[State 21000, VS1]
type = null
triggerall = time = 0
trigger1 = var(10)<=1
trigger1 = (var(13):=0)||1
trigger2 = var(10)>=2
trigger2 = (var(13):=45)||1

[State 21000, PS]
type = bindtoroot
trigger1 = var(10)<=1
trigger1 = animelemno(0)=1
pos = 40+15*time,-55
[State 21000, PS]
type = bindtoroot
trigger1 = var(10)>1
trigger1 = animelemno(0)=1
pos = 10+floor((15*time)*cos(var(13)*pi/180.0)),-55-floor((15*time)*sin(var(13)*pi/180.0))

[State 21200, CVS]
type = null
triggerall = time = 0
trigger1 = (var(11):=5)||1
trigger1 = (var(12):=1)||1

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT
ignorehitpause = 1

[State 1010, HitOverride]
Type = HitOverride
Trigger1 = 1
Attr = SCA,AA,AP;,AT
slot = 0
time = -1
Stateno = 21002
IgnoreHitPause = 1

[State 21000, Spec]
Type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 21200, Zeeky]
type = destroyself
trigger1 = root,stateno!=1000
trigger2 = root,stateno=1000
trigger2 = root,animelemtime(14)>=0

[State 21200, CS]
type = changestate
trigger1 = 1
value = 21001

[State 21000, AD]
type = angledraw
trigger1 = time>=0
value = var(13)
ignorehitpause = 1

;--------------------------
; 63214p: Grapple Hook
[Statedef 21001]
type    = A
movetype= A
physics = N
juggle  = 0
velset = 0,0
sprpriority = -1
movehitpersist = 1
;hitcountpersist = 1

[State 21000, VS1]
type = varset
trigger1 = var(10)>=3
trigger1 = animelemtime(2)>=0
trigger1 = (fvar(1):=(root,pos y)+(root,const(size.mid.pos.y))-(pos y))||1
trigger1 = (fvar(2):=((root,pos x)-(pos x))*facing)||1
;trigger1 = (fvar(3):=((fvar(1)**2)+(fvar(2)**2))**0.5)||1
var(13)=floor(atan((fvar(1))/(fvar(2)))*(-180.0/pi)+(180*(fvar(2) > 0)))

[State 21000, PS]
type = bindtoroot
trigger1 = var(10)<=1
trigger1 = animelemno(0)=1
pos = 40+15*time,-55
[State 21000, PS]
type = bindtoroot
trigger1 = var(10)>1
trigger1 = animelemno(0)=1
pos = 10+floor((15*time)*cos(var(13)*pi/180.0)),-55-floor((15*time)*sin(var(13)*pi/180.0))

[State 1010, NHB]
type = nothitby
trigger1 = var(10)<=2
value = ,AA,AT
ignorehitpause = 1

[State 21001, STS]
type = statetypeset
trigger1 = var(10)>=3
movetype = I
ignorehitpause = 1

[State 1010, NHB]
type = nothitby
trigger1 = var(10)>=3
value = SCA,AA,AP,AT
ignorehitpause = 1

[State 1010, HitOverride]
Type = HitOverride
Trigger1 = 1
Attr = SCA,AA,AP;,AT
slot = 0
time = -1
Stateno = 21002
IgnoreHitPause = 1

[State 21001, Attack Range]
type = attackdist
trigger1 = var(10)<=2
value = 30
ignorehitpause = 1


;===============
; HITDEF
;===============
[State 1211, HitDef]
type = HitDef
triggerall = var(10)<=2
trigger1 = movecontact = 0 && movereversed = 0
attr = S,SP
hitflag = MAF
guardflag = MA
animtype = Hard
air.animtype = Back
priority = 4,Hit
damage = ceil(var(11)*(root,fvar(11)/cond(root,var(55)=6,(root,fvar(30)),1))),ceil(var(12)*root,fvar(11))
pausetime = 0,25
getpower = ceil(var(11)*1.6*(root,fvar(11)/cond(root,var(55)=6,(root,fvar(30)),1))),ceil(var(11)*0.4) ;160% & 40% of base damage
givepower = ceil(var(11)*0.8*(root,fvar(11)/cond(root,var(55)=6,(root,fvar(30)),1))),ceil(var(11)*0.2) ;80% & 20% of base damage
sparkno = s8000+(random%2)
guard.sparkno = s8030
sparkxy = 0,0
hitsound = S1,0
guardsound = S2,0
ground.type = High
yaccel = 0.5
p1sprpriority = 5
ground.velocity = -7.0,0.0
guard.velocity = -7.0
air.velocity = -7.0,-3.0
airguard.velocity = -7.0,-3.0
p2facing = 1
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
ground.slidetime = cond((var(32):=22+root,var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=22+root,var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=18+root,var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=18+root,var(34))<=1,1,var(32))
air.hittime = cond((var(32):=24+root,var(34))<=1,1,var(32))
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=24+root,var(34))<=1,1,var(32))+6;hitstun+pausetime value
id = 1000

[State 2011, Helper Hit Flag]
type = parentvarset
triggerall = var(10)<=1
trigger1 = MoveHit=1
trigger1 = p2stateno != [120,159]
var(35)=2
ignorehitpause = 1
persistent = 0

[State 1602, Recovery Frames]
type = statetypeset
trigger1 = movecontact=1 || movereversed=1
trigger2 = animelemtime(3)=0
trigger3 = var(10)>2
movetype = I
ignorehitpause = 1

[State -2, Spirit Gauge Increase]
type = parentvaradd
triggerall = var(10)<=2
trigger1 = root,var(52)=2 ;Type-ß Only
trigger1 = movecontact
trigger1 = root,var(54)<ceil(root,lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(root,fvar(11)/cond(root,var(55)=6,(root,fvar(30)),1))),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1

[State 220, First Combo Hit]
type = parentvarset
triggerall = var(10)<=2
triggerall = numtarget(1000) && movehit
trigger1 = target(1000),gethitvar(hitcount)=1
trigger1 = root,var(55)=0
var(55) = 6;Change index
ignorehitpause = 1
persistent = 0
;===============
; END HITDEF
;===============

[State 200, Damage Proration]
type = parentvarset
triggerall = var(10)<=2
trigger1 = Movehit=1
fvar(10) = (root,fvar(10))*0.99*cond(root,fvar(10)>=1.0,(root,fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State 21000, Spec]
Type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 21200, Zeeky]
type = changestate
trigger1 = root,stateno!=1000
trigger2 = root,stateno=1000
trigger2 = root,animelemtime(14)>=0
value = 999

[State 21101, CS]
type = changestate
trigger1 = movecontact=1||movereversed=1
value = 21002

[State 21101, CS]
type = changestate
trigger1 = animelemtime(3)=0
value = 21002

[State 21101, CS]
type = destroyself
trigger1 = root,movetype=H
trigger2 = root,alive = 0
trigger3 = root,stateno!=1000

[State 21101, Custom Timer]
type = varadd
trigger1 = 1
var(0) = 1

[State 21000, AD]
type = angledraw
trigger1 = time>=0
value = var(13)
ignorehitpause = 1

;---------------------------------------------------------------------------
; 63214p: Grapple Hook
[Statedef 21002]
type    = A
movetype= I
physics = N
velset = 0,0
sprpriority = -1
ctrl = 0
movehitpersist = 1

[State 21000, VS1]
type = varset
trigger1 = var(10)>=3
trigger1 = animelemtime(2)>=0
trigger1 = (fvar(1):=(root,pos y)+(root,const(size.mid.pos.y))-(pos y))||1
trigger1 = (fvar(2):=((root,pos x)-(pos x))*facing)||1
;trigger1 = (fvar(3):=((fvar(1)**2)+(fvar(2)**2))**0.5)||1
var(13)=floor(atan((fvar(1))/(fvar(2)))*(-180.0/pi)+(180*(fvar(2) > 0)))

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT
ignorehitpause = 1

[State 21000, Spec]
Type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 21200, Zeeky]
type = changestate
trigger1 = root,stateno!=1000
trigger2 = root,stateno=1000
trigger2 = (root,animelemtime(14)>=0)
value = cond(var(10)<=2,999,21003);999

[State 21000, AD]
type = angledraw
trigger1 = 1
ignorehitpause = 1

[State 21000, AD]
type = angledraw
trigger1 = time>=0
value = var(13)
ignorehitpause = 1

;---------------------------------------------------------------------------
; 63214p: Grapple Hook
[Statedef 21003]
type    = A
movetype= I
physics = N
velset = 0,0
sprpriority = -1
ctrl = 0
movehitpersist = 1

[State 21000, VS1]
type = varset
trigger1 = var(10)>=3
trigger1 = animelemtime(2)>=0
trigger1 = (fvar(1):=(root,pos y)+(root,const(size.mid.pos.y))-(pos y))||1
trigger1 = (fvar(2):=((root,pos x)-(pos x))*facing)||1
;trigger1 = (fvar(3):=((fvar(1)**2)+(fvar(2)**2))**0.5)||1
var(13)=floor(atan((fvar(1))/(fvar(2)))*(-180.0/pi)+(180*(fvar(2) > 0)))

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT
ignorehitpause = 1

[State 0, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256-floor(256.0*time/6.0),floor(256.0*time/6.0)
ignorehitpause = 1

[State 21000, Spec]
Type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 21200, Zeeky]
type = changestate
trigger1 = root,stateno!=1000
trigger2 = root,movetype = H
trigger3 = time>=6
value = 999

[State 21000, AD]
type = angledraw
trigger1 = 1
ignorehitpause = 1

[State 21000, AD]
type = angledraw
trigger1 = time>=0
value = var(13)
ignorehitpause = 1

;--------------------------
; 63214p: Grapple Wire
[Statedef 21010]
type    = A
movetype= I
physics = N
juggle  = 0
anim = 21001
sprpriority = -2
; Var(0) = Timer
; Var(1) = Hitcount
; Var(10) = Version
; Var(11) = Damage
; Var(12) = Chip Damage

[State 21200, CVS]
type = varset
trigger1 = time = 0
var(10) = root,var(10)

[State 21000, VS1]
type = null
triggerall = time = 0
trigger1 = var(10)<=1
trigger1 = (var(13):=0)||1
trigger2 = var(10)>=2
trigger2 = (var(13):=45)||1

[State 21000, VS1]
type = varset
trigger1 = var(10)>=3
trigger1 = animelemtime(2)>=0
trigger1 = (fvar(1):=(root,pos y)+(root,const(size.mid.pos.y))-(pos y))||1
trigger1 = (fvar(2):=((root,pos x)-(pos x))*facing)||1
trigger1 = (fvar(3):=((fvar(1)**2)+(fvar(2)**2))**0.5)||1
var(13)=floor(atan((fvar(1))/(fvar(2)))*(-180.0/pi)+(180*(fvar(2) > 0)))

[State 21000, PS]
type = bindtoroot
trigger1 = var(10)<=1
trigger1 = animelemno(0)=1
pos = 40+15*time,-55
[State 21000, PS]
type = bindtoroot
trigger1 = var(10)>1
trigger1 = animelemno(0)=1
pos = 10+floor((15*time)*cos(var(13)*pi/180.0)),-55-floor((15*time)*sin(var(13)*pi/180.0))

[State 21000, Spec]
Type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 21200, Zeeky]
type = changestate
trigger1 = root,stateno!=1000
trigger2 = root,stateno=1000
trigger2 = (root,animelemtime(14)>=0)
value = cond(var(10)<=2,999,21011);999

[State 21200, CS]
type = angledraw
trigger1 = time>=0
trigger1 = var(10)<=1
value = var(13)
scale = ((pos x - root,pos x)*facing/(34.0)),1.0
ignorehitpause = 1
[State 21200, CS]
type = angledraw
triggerall = time>=0
trigger1 = var(10)=2
trigger2 = var(10)>=3
trigger2 = animelemno(0)=1
value = var(13)
scale = ((pos x - root,pos x)*facing/(34.0*cos(var(13)*pi/180.0))),1.0
ignorehitpause = 1

[State 21200, CS]
type = angledraw
trigger1 = animelemno(0)>1
trigger1 = var(10)>=3
value = var(13)
;scale = ((pos x - root,pos x)*facing/(30.0*cos(var(13)*pi/180.0))),1.0
scale = (fvar(3)/34.0),1.0
;scale = ( (((pos x - root,pos x)*facing)**2+((root,pos y)+(root,const(size.mid.pos.y))-(pos y)))**0.5 /(34.0*cos(var(13)*pi/180.0)) ),1.0
ignorehitpause = 1

;--------------------------
; 63214p: Grapple Wire
[Statedef 21011]
type    = A
movetype= I
physics = N
juggle  = 0
sprpriority = -2
; Var(0) = Timer
; Var(1) = Hitcount
; Var(10) = Version
; Var(11) = Damage
; Var(12) = Chip Damage

[State 21000, VS1]
type = varset
trigger1 = var(10)>=3
trigger1 = animelemtime(2)>=0
trigger1 = (fvar(1):=(root,pos y)+(root,const(size.mid.pos.y))-(pos y))||1
trigger1 = (fvar(2):=((root,pos x)-(pos x))*facing)||1
trigger1 = (fvar(3):=((fvar(1)**2)+(fvar(2)**2))**0.5)||1
var(13)=floor(atan((fvar(1))/(fvar(2)))*(-180.0/pi)+(180*(fvar(2) > 0)))

[State 21000, PS]
type = bindtoroot
trigger1 = var(10)<=1
trigger1 = animelemno(0)=1
pos = 40+15*time,-55
[State 21000, PS]
type = bindtoroot
trigger1 = var(10)>1
trigger1 = animelemno(0)=1
pos = 10+floor((15*time)*cos(var(13)*pi/180.0)),-55-floor((15*time)*sin(var(13)*pi/180.0))

[State 0, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256-floor(256.0*time/6.0),floor(256.0*time/6.0)
ignorehitpause = 1

[State 21000, Spec]
Type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 21200, Zeeky]
type = changestate
trigger1 = root,stateno!=1000
trigger2 = root,movetype = H
trigger3 = time>=6
value = 999

[State 21200, CS]
type = angledraw
trigger1 = time>=0
trigger1 = var(10)<=1
value = var(13)
scale = ((pos x - root,pos x)*facing/(34.0)),1.0
ignorehitpause = 1
[State 21200, CS]
type = angledraw
triggerall = time>=0
trigger1 = var(10)=2
trigger2 = var(10)>=3
trigger2 = animelemno(0)=1
value = var(13)
scale = ((pos x - root,pos x)*facing/(34.0*cos(var(13)*pi/180.0))),1.0
ignorehitpause = 1

[State 21200, CS]
type = angledraw
trigger1 = animelemno(0)>1
trigger1 = var(10)>=3
value = var(13)
;scale = ((pos x - root,pos x)*facing/(30.0*cos(var(13)*pi/180.0))),1.0
scale = (fvar(3)/34.0),1.0
;scale = ( (((pos x - root,pos x)*facing)**2+((root,pos y)+(root,const(size.mid.pos.y))-(pos y)))**0.5 /(34.0*cos(var(13)*pi/180.0)) ),1.0
ignorehitpause = 1

;---------------------------------------------------------------------------
; 214p: Photon Torpedo
[Statedef 1100]
type    = U;S
movetype= A
physics = N
velset = 0,0
anim = 1100+1*(var(10)=2)+2*(var(10)>=3)+10*(statetype=A)+0*floor(var(55):=0)
poweradd = ceil(30.0*fvar(11))
ctrl = 0
sprpriority = 1
facep2 = 0
juggle = 0

[State 1100, STS]
type = statetypeset
trigger1 = time = 0
trigger1 = statetype!=A
statetype=S
physics=N

[State 1100, FaceP2]
type = turn
trigger1 = time = 0
trigger1 = statetype!=A
trigger1 = p2dist x < 0

[State 1XXX, Special Counter]
type = varadd
trigger1 = time = 0
var(3) = 1
persistent = 0
ignorehitpause = 1

[State 1100, PSND]
type = playsnd
trigger1 = var(10)<=1||var(10)=4
trigger1 = animelemtime(7)=0;||animelemtime(6)=5||animelemtime(6)=10;||animelemtime(5)=15
trigger2 = var(10)=2||var(10)=5
trigger2 = animelemtime(6)=0||animelemtime(8)=0||animelemtime(10)=0;||animelemtime(5)=30
trigger3 = var(10)=3||var(10)>=6
trigger3 = animelemtime(6)=0||animelemtime(8)=0||animelemtime(10)=0||animelemtime(12)=0||animelemtime(14)=0
value = 1100,11
channel = 7

[State 1100, STS]
type = statetypeset
trigger1 = animelemtime(2)=0
statetype = A
physics = N

[State 1100, VS]
type = velset
trigger1 = animelemtime(2)=0
trigger1 = var(10)=[1,3]
x = 0
y = -12.0

[State 1100, VS]
type = veladd
trigger1 = animelemtime(2)>0
trigger1 = animelemno(0)=[2,3]
trigger1 = var(10)=[1,3]
y = 0.35

[State 1100, VS]
type = velset
trigger1 = animelemtime(4)=0
x = 0.0
y = 0.0

[State 0, Width]
type = Width
trigger1 = animelemno(0)=[6,15]
edge = 36,0
ignorehitpause = 1

[State 1100, Vel]
type = velset
trigger1 = animelemno(0)=[6,11]
x = 5.0+1.25*(var(10)=2||var(10)=5)+2.5*(var(10)=3||var(10)>=6)

[State 1010, Effect]
type =helper
triggerall = !ishelper
trigger1 = var(10)<=1||var(10)=4
trigger1 = animelemtime(7)=0;||animelemtime(6)=5||animelemtime(6)=10;||animelemtime(5)=15
trigger2 = var(10)=2||var(10)=5
trigger2 = animelemtime(6)=0||animelemtime(8)=0||animelemtime(10)=0;||animelemtime(5)=30
trigger3 = var(10)=3||var(10)>=6
trigger3 = animelemtime(6)=0||animelemtime(8)=0||animelemtime(10)=0||animelemtime(12)=0||animelemtime(14)=0
helpertype = normal
name = "Bomb"
ID = 21100
pos = 0,-55
postype = p1
stateno = 21100
ownpal = 1
facing = 1
size.xscale = 0.5
size.yscale = 0.5

[State 1100, VS]
type = velmul
trigger1 = animelemtime(16)>=0
trigger1 = abs(vel x) > 0
x = 0.8

[State 1100, VS]
type = velset
trigger1 = animelemtime(16)>=0
trigger1 = abs(vel x) < 1
x = 0.0


[State 0, RECOVERY FRAMES]
type = StateTypeSet
trigger1 = var(10)<=1||var(10)=4
trigger1 = animelemtime(7)>1;||animelemtime(6)=5||animelemtime(6)=10;||animelemtime(5)=15
trigger2 = (var(10)=[2,3])||(var(10)=[5,6])
trigger2 = animelemtime(6)>1
movetype = I
persistent=0
ignorehitpause = 1

[State 1000, VelAdd]
type = veladd
trigger1 = animelemtime(16)>=0
y = 0.5

[State 1000, CS]
type = ChangeState
trigger1 = statetype=A
trigger1 = vel y > 0
trigger1 = pos y >= -(vel y)
value = 1101

;---------------------------------------------------------------------------
; FRR Land
[Statedef 1101]
type    = S                     
movetype= I           
physics = S                    
ctrl = 0                      
anim = 47
velset = 0,0
poweradd = 0
sprpriority = 1

[State 1002, PS]
type = posset
trigger1 = time = 0
y = 0

[State 1002, CS]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;--------------------------
; 214 Photon Torpedo
[Statedef 21100]
type    = A
movetype= A
physics = N
juggle  = 0
anim = 21100
sprpriority = 5;-6*ishelper(21100)
; Var(0) - Timer
; Var(10) - Version (1=L, 2=M, 3=H)
; Var(13) - Angle
; Fvar(20) - Prorate value

[State 21200, CVS]
type = varset
trigger1 = time = 0
var(10) = root,var(10)

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = var(10)<=1||var(10)=4
trigger1 = (var(11):=60)||1
trigger1 = (var(12):=12)||1
trigger1 = (fvar(20):=0.85)||1
trigger2 = var(10)=2||var(10)=5
trigger2 = (var(11):=29)||1
trigger2 = (var(12):=5)||1
trigger2 = (fvar(20):=0.947)||1
trigger3 = var(10)=3||var(10)>=6
trigger3 = (var(11):=23)||1
trigger3 = (var(12):=4)||1
trigger3 = (fvar(20):=0.956)||1

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT
ignorehitpause = 1

[State 1010, HitOverride]
Type = HitOverride
Trigger1 = 1
Attr = SCA,AA,AP;,AT
slot = 0
time = -1
Stateno = 21102
IgnoreHitPause = 1

[State 21200, CS]
type = changestate
trigger1 = time>=0
value = 21101

[State 21100, AD]
type = angledraw
trigger1 = 1
value = var(13)
ignorehitpause = 1

[State 21100, Timer]
type = varadd
trigger1 = 1
var(0) = 1

;--------------------------
; 214 Photon Torpedo
[Statedef 21101]
type    = A
movetype= A
physics = N
juggle  = 0
velset = 0,0
sprpriority = 5
movehitpersist = 1

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = ,AA,AT
ignorehitpause = 1

[State 1010, HitOverride]
Type = HitOverride
Trigger1 = 1
Attr = SCA,AA,AP;,AT
slot = 0
time = -1
Stateno = 21102
IgnoreHitPause = 1

[State 21101, Initialize Air Vel]
type = velset
trigger1 = prevstateno=21100
trigger1 = time = 0
;trigger1 = var(10)=[4,5]
x = 2.5
y = 0.25

;[State 21101, VelS]
;type = velset
;trigger1 = 1
;x = 10.0*cos(var(13)*pi/180.0)
;y = -10.0*sin(var(13)*pi/180.0)

;===============
; HITDEF
;===============
[State 1211, HitDef]
type = HitDef
trigger1 = movecontact = 0 && movereversed = 0
attr = S,SP
hitflag = MAFD
guardflag = MA
animtype = Hard
air.animtype = Back
priority = 4,Hit
damage = ceil(var(11)*(root,fvar(11)/cond(root,var(55)=7,(root,fvar(30)),1))),ceil(var(12)*root,fvar(11))
pausetime = 0,8
getpower = ceil(var(11)*1.6*(root,fvar(11)/cond(root,var(55)=7,(root,fvar(30)),1))),ceil(var(11)*0.4) ;160% & 40% of base damage
givepower = ceil(var(11)*0.8*(root,fvar(11)/cond(root,var(55)=7,(root,fvar(30)),1))),ceil(var(11)*0.2) ;80% & 20% of base damage
sparkno=s8010+(random%2)
guard.sparkno = s8030
sparkxy = -10,0
hitsound = S1,2
guardsound = S2,0
ground.type = High
yaccel = 0.5
p1sprpriority = 5
ground.velocity = -2.0,-4.0
guard.velocity = -2.0
air.velocity = -2.0,-4.0
airguard.velocity = -2.0,-4.0
down.velocity = -2.0,-4.0
p2facing = 1
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
ground.slidetime = cond((var(32):=22+root,var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=22+root,var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=18+root,var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=18+root,var(34))<=1,1,var(32))
air.hittime = cond((var(32):=24+root,var(34))<=1,1,var(32))
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=24+root,var(34))<=1,1,var(32))+6;hitstun+pausetime value
id = 1100

[State 2011, Helper Hit Flag]
type = parentvarset
trigger1 = MoveHit=1
trigger1 = p2stateno != [120,159]
var(35)=2
ignorehitpause = 1
persistent = 0

[State 1602, Recovery Frames]
type = statetypeset
trigger1 = movecontact || movereversed
movetype = I
ignorehitpause = 1

[State -2, Spirit Gauge Increase]
type = parentvaradd
trigger1 = root,var(52)=2 ;Type-ß Only
trigger1 = movecontact
trigger1 = root,var(54)<ceil(root,lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(root,fvar(11)/cond(root,var(55)=7,(root,fvar(30)),1))),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1

[State 220, First Combo Hit]
type = parentvarset
triggerall = numtarget(1100) && movehit
trigger1 = target(1100),gethitvar(hitcount)=1
trigger1 = root,var(55)=0
var(55) = 7;Change index
ignorehitpause = 1
persistent = 0
;===============
; END HITDEF
;===============

[State 200, Damage Proration]
type = parentvarset
trigger1 = Movehit=1
fvar(10) = (root,fvar(10))*fvar(20)*cond(root,fvar(10)>=1.0,(root,fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State 21101, CS]
type = changestate
trigger1 = frontedgedist < -10
trigger2 = movecontact||movereversed
trigger3 = vel y > 0 && pos y >= -(vel y)
value = 21102

[State 21101, Air X]
type = veladd
;trigger1 = var(10)=[4,5]
trigger1 = var(0)=[1,10]
x = -0.125
[State 21101, Air X]
type = veladd
;trigger1 = var(10)=[4,5]
trigger1 = var(0)>0
y = 0.4

[State 21101, Custom Timer]
type = varadd
trigger1 = 1
var(0) = 1

[State 21100, AD]
type = angledraw
trigger1 = vel y != 0
value = floor(atan(vel X/vel Y)*180/pi-90)
ignorehitpause = 1

[State 21101, AA]
type = angleadd
trigger1 = vel y < 0
value = 180
ignorehitpause=1

[State 21100, AD]
type = angledraw
trigger1 = vel y = 0
value = 0
ignorehitpause = 1

;---------------------------------------------------------------------------
; Torpedo Projectile
[Statedef 21102]
type    = A
movetype= I
physics = N
sprpriority=5
ctrl = 0
anim = 21102
velset = 0,0
movehitpersist = 1

[State 21100, AD]
type = angleset
trigger1 = time = 0
value = floor(360.0*random/1000.0)
ignorehitpause = 1

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 21202, T]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256,256
ignorehitpause = 1

[State 21102, Zeeky]
type = changestate
trigger1 = animtime=0
value = 999

[State 21101, Custom Timer]
type = varadd
trigger1 = 1
var(0) = 1

[State 21100, AD]
type = angledraw
trigger1 = 1
scale = 0.75,0.75
ignorehitpause = 1

;---------------------------------------------------------------------------
; 22p: Kiku-ichimonji Compressor
[Statedef 1200]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 1200+0*floor(var(55):=0)
poweradd = ceil(20.0*fvar(11))
ctrl = 0
sprpriority = 1
facep2 = 1
juggle = 0

[State 1XXX, Special Counter]
type = varadd
trigger1 = time = 0
var(3) = 1
persistent = 0
ignorehitpause = 1

[State 240, 1]
type = PlaySnd
trigger1 = animelemtime(5)=0
value = 1200,10

[State 1010, Effect]
type =helper
trigger1 = !ishelper
trigger1 = animelemtime(5)=0
helpertype = normal
name = "Grenade"
ID = 21200
pos = 40,-64
postype = p1
stateno = 21200
ownpal = 1
facing = 1

[State -2, FLAG RECOVERY FRAMES]
type = statetypeset
trigger1 = animelemtime(5)>1
movetype = I
persistent = 0
ignorehitpause = 1

[State 1000, CS]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1


;--------------------------
; 22p Grenade Proj
[Statedef 21200]
type    = A
movetype= I
physics = N
juggle  = 0
anim = 21200
sprpriority = 5

[State 21200, CVS]
type = varset
trigger1 = time = 0
var(10) = root,var(10)

[State 21202, T]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256,0
ignorehitpause = 1
[State 21201, Ass]
type = assertspecial
trigger1 = 1
flag = noshadow 
ignorehitpause = 1

[State 21200, CVS]
type = null
triggerall = time = 0
trigger1 = (var(11):=21)||1
trigger1 = (var(12):=3)||1
trigger1 = (var(1):=floor(360.0*random/1000.0))||1

[State 21200, VelS]
type = velset
trigger1 = time = 0
x = 3.0+3.5*(var(10)=2)-2.0*(var(10)>=3)
y = -7.5

[State 21200, VelS]
type = veladd
trigger1 = time
y = 0.5

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT
ignorehitpause = 1

[State 1010, HitOverride]
Type = HitOverride
Trigger1 = 1
Attr = SCA,AA,AP;,AT
slot = 0
time = -1
Stateno = 21202
IgnoreHitPause = 1

[State 21200, Destroyself]
type = changestate
trigger1 = root,movetype=H
trigger2 = root,alive = 0
value = 21205

[State 21200, VS]
type = velset
trigger1 = var(3)<4
trigger1 = vel y > 0
trigger1 = pos y >= -(vel y)
trigger1 = (var(3):=var(3)+1)||1
x = (vel x)*0.85
y = -(vel y)*0.67

[State 21200, CS]
type = changestate
trigger1 = var(10)<=2
trigger1 = time>=30
trigger2 = var(10)>=3
trigger2 = var(3)>=4
trigger2 = vel y > 0
trigger2 = pos y >= -(vel y)
value = 21201

[State 21200, AS]
type = angleset
trigger1 = time = 0
value = var(1)

[State 21200, AA]
type = angleadd
trigger1 = time
value = 12*cond(var(3)%2=0,1,-1)

[State 21200, AD]
type = angledraw
trigger1 = 1
scale = 0.2,0.3
ignorehitpause = 1

;--------------------------
; 22p Grenade Proj
[Statedef 21201]
type    = A
movetype= A
physics = N
juggle  = 0
velset = 0,0
sprpriority = 5
movehitpersist = 1

[State 1010, Effect]
type =helper
trigger1 = time = 0
trigger1 = prevstateno=21200
helpertype = normal
name = "Water_Explosion"
ID = 21210
pos = 0,0
postype = p1
stateno = 21210
ownpal = 1
facing = 1
size.xscale = 0.4
size.yscale = 0.4

[State 21201, PSND]
type = playsnd
trigger1 = time = 0
trigger1 = prevstateno=21200
value = 1200,11

[State 21201, CA]
type = changeanim
trigger1 = anim!=21201
value = 21201

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = ,AA,AT
ignorehitpause = 1

[State 21202, T]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256,256
ignorehitpause = 1
[State 21201, Ass]
type = assertspecial
trigger1 = 1
flag = noshadow 
ignorehitpause = 1

[State 1010, HitOverride]
Type = HitOverride
Trigger1 = 1
Attr = SCA,AA,AP;,AT
slot = 0
time = -1
Stateno = 21202
IgnoreHitPause = 1

;===============
; HITDEF
;===============
[State 1211, HitDef]
type = HitDef
trigger1 = movecontact = 0 && movereversed = 0
attr = S,SP
hitflag = MAF
guardflag = MA
animtype = Hard
air.animtype = Back
priority = 4,Hit
damage = ceil(var(11)*(root,fvar(11)/cond(root,var(55)=8,(root,fvar(30)),1))),ceil(var(12)*root,fvar(11))
pausetime = 0,10
getpower = ceil(var(11)*1.6*(root,fvar(11)/cond(root,var(55)=8,(root,fvar(30)),1))),ceil(var(11)*0.4) ;160% & 40% of base damage
givepower = ceil(var(11)*0.8*(root,fvar(11)/cond(root,var(55)=8,(root,fvar(30)),1))),ceil(var(11)*0.2) ;80% & 20% of base damage
sparkno=s8010+(random%2)
guard.sparkno = s8030
sparkxy = -10,0
hitsound = S1200,12
guardsound = S2,0
ground.type = High
yaccel = 0.5
p1sprpriority = 5
ground.velocity = -1.0,-7.0
guard.velocity = -2.0
air.velocity = -1.0,-7.0
airguard.velocity = -2.0,-7.0
p2facing = 1
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
ground.slidetime = cond((var(32):=22+20+root,var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=22+20+root,var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=18+root,var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=18+root,var(34))<=1,1,var(32))
air.hittime = cond((var(32):=24+20+root,var(34))<=1,1,var(32))
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=24+20+root,var(34))<=1,1,var(32))+6;hitstun+pausetime value
id = 1200

[State 2011, Helper Hit Flag]
type = parentvarset
trigger1 = MoveHit=1
trigger1 = p2stateno != [120,159]
var(35)=2
ignorehitpause = 1
persistent = 0

[State 1602, Recovery Frames]
type = statetypeset
trigger1 = movecontact || movereversed
movetype = I
ignorehitpause = 1

[State -2, Spirit Gauge Increase]
type = parentvaradd
trigger1 = root,var(52)=2 ;Type-ß Only
trigger1 = movecontact
trigger1 = root,var(54)<ceil(root,lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(root,fvar(11)/cond(root,var(55)=8,(root,fvar(30)),1))),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1
;===============
; END HITDEF
;===============

[State 220, First Combo Hit]
type = parentvarset
triggerall = numtarget(1200) && movehit
trigger1 = target(1200),gethitvar(hitcount)=1
trigger1 = root,var(55)=0
var(55) = 8;Change index
ignorehitpause = 1
persistent = 0

[State 200, Damage Proration]
type = parentvarset
trigger1 = Movehit=1
fvar(10) = (root,fvar(10))*0.96*cond(root,fvar(10)>=1.0,(root,fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State 21101, CS]
type = changestate
trigger1 = var(0)>=50
trigger2 = movecontact||movereversed
value = 21202

[State 21101, Custom Timer]
type = varadd
trigger1 = 1
var(0) = 1

[State 21200, AD]
type = angledraw
trigger1 = 1
scale = 0.4,0.25
value = 0
ignorehitpause = 1

;---------------------------------------------------------------------------
; Grenade Projectile
[Statedef 21202]
type    = A
movetype= I
physics = N
sprpriority=5
ctrl = 0
facep2=0
movehitpersist=1

[State 21202, HitAdd]
type = varadd
trigger1 = time = 0
var(2) = 1

[State 21202, Trigger Destruct]
type = varset
trigger1 = var(2)>=4
trigger1 = var(0)<50
var(0) = 50

[State 21202, Remote Varset];Doncha love these creative names?
type = null
trigger1 = var(0)=50
trigger1 = cond(numhelper(21210),(helper(21210),cond(1,(var(0):=1),0)),0)

[State 21202, MHR]
type = movehitreset
trigger1 = var(2)<4
trigger1 = time=9

[State 21202, CS]
type = changestate
trigger1 = var(2)<4
trigger1 = time=9
trigger1 = var(0)<50
value = 21201

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT
ignorehitpause = 1

[State 21202, T]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256,256
ignorehitpause = 1
[State 21201, Ass]
type = assertspecial
trigger1 = 1
flag = noshadow 
ignorehitpause = 1

[State 21202, T]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256-cond(var(0)<=50,0,floor(256.0*(var(0)-50)/10.0)),256
ignorehitpause = 1

[State 21102, Zeeky]
type = changestate
trigger1 = var(0) >= 60
value = 999

[State 21101, Custom Timer]
type = varadd
trigger1 = 1
var(0) = 1

[State 21200, AD]
type = angledraw
trigger1 = 1
scale = 0.4*cond(var(0)<=50,1.0,1.0-floor(0.75*(var(0)-50)/10.0)),0.25*cond(var(0)<=50,1.0,1.0-floor(0.75*(var(0)-50)/10.0))
value = 0
ignorehitpause = 1


;--------------------------
; 22p Grenade Premature Destruct
[Statedef 21205]
type    = A
movetype= I
physics = N
juggle  = 0
sprpriority = 5

[State 21200, VelS]
type = veladd
trigger1 = time
y = 0.5

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT
ignorehitpause = 1

[State 21202, T]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256-floor(256.0*time/10.0),floor(256.0*time/10.0)
ignorehitpause = 1
[State 21201, Ass]
type = assertspecial
trigger1 = 1
flag = noshadow 
ignorehitpause = 1

[State 21200, Destroyself]
type = destroyself
trigger1 = time>=10

[State 21200, AA]
type = angleadd
trigger1 = 1
value = 12*cond(var(3)%2=0,1,-1)

[State 21200, AD]
type = angledraw
trigger1 = 1
scale = 0.2,0.3
ignorehitpause = 1

;--------------------------
; 22 Grenade FX
[Statedef 21210]
type    = A
movetype= I
physics = N
juggle  = 0
anim = 21202
sprpriority = 5
;Var(0) = Destroy Flag, can be set remotely by main projectile via Cond exploit.

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT
ignorehitpause = 1

[State 21202, T]
type = trans
trigger1 = animelemno(0)=1
trans = addalpha
alpha = 256-floor(256.0*animelemtime(1)/20.0),256
ignorehitpause = 1

[State 0, Explod]
type = Explod
trigger1 = time%5=0
anim = 21203
ID = 21203
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vel = 2.0-(4.0*random/1000.0),-10
removetime = -2
scale = 0.6,0.6
sprpriority = 5
ontop = 0
ownpal = 0
removeongethit = 0
ignorehitpause = 1
[State 0, Explod]
type = Explod
trigger1 = time%5=0
anim = 21203
ID = 21203
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vel = 2.0-(4.0*random/1000.0),10
removetime = -2
scale = 0.6,0.6
sprpriority = 5
ontop = 0
ownpal = 0
removeongethit = 0
ignorehitpause = 1


[State 21210, VarSet]
type = varset
trigger1 = var(0)=0
trigger1 = time>=50
var(0)=1

[State 21210, Zeeky]
type = changestate
triggerall = animelemno(0)=2
trigger1 = var(0)=1
value = 21211

[State 21210, AD]
type = angledraw
trigger1 = animelemno(0)=1
scale = 1+(0.08*time),1+(0.08*time)
ignorehitpause = 1

;---------------------------------------------------------------------------
; Grenade FX
[Statedef 21211]
type    = A
movetype= I
physics = N
sprpriority=5
ctrl = 0
facep2 = 0

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 21102, Zeeky]
type = changestate
trigger1 = time>20
value = 999


;---------------------------------------------------------------------------
; 421 Aerial Blast
[Statedef 1300]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 1300
poweradd = ceil(30.0*fvar(11))
ctrl = 0
sprpriority = 1
facep2 = 1
juggle = 0

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = (var(11):=0)||1
trigger1 = (var(12):=0)||1

[State 1100, PSND]
type = playsnd
trigger1 = animelemtime(4)=0
value = 1300,10

[State 1010, Effect]
type =helper
trigger1 = !ishelper
trigger1 = animelemtime(4)=0
helpertype = normal
name = "Missile"
ID = 21300
pos = -14,-88
postype = p1
stateno = 21300
ownpal = 1
facing = 1

[State 1010, Effect]
type =helper
trigger1 = !ishelper
trigger1 = animelemtime(4)=0
helpertype = normal
name = "Reticule"
ID = 21310
pos = 60+80*(var(10)=2)+160*(var(10)>=3),0
postype = p1
stateno = 21310
ownpal = 1
facing = 1
;size.xscale = 0.5
;size.yscale = 0.5

[State 0, RECOVERY FRAMES]
type = StateTypeSet
trigger1 = animelemtime(4)>1
movetype = I
persistent=0
ignorehitpause = 1

[State 1000, CS]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;--------------------------
; 421 Missile
[Statedef 21300]
type    = A
movetype= I
physics = N
juggle  = 0
anim = 21300
sprpriority = 5

[State 21200, CVS]
type = varset
trigger1 = time = 0
var(10) = root,var(10)

[State 21200, CVS]
type = null
triggerall = time = 0
trigger1 = var(10)<=1
trigger1 = (var(11):=100)||1
trigger1 = (var(12):=20)||1
trigger2 = var(10)=2
trigger2 = (var(11):=100)||1
trigger2 = (var(12):=20)||1
trigger3 = var(10)>=3
trigger3 = (var(11):=100)||1
trigger3 = (var(12):=20)||1

[State 21300, VelS]
type = velset
trigger1 = time = 0
x = 5.0
y = -30.0

[State 21300, AS]
type = angleset
trigger1 = vel y != 0
value = floor(atan(vel x/vel y)*180.0/pi)-90
ignorehitpause = 1

[State 21300, AS]
type = angleset
trigger1 = vel y = 0
value = 0
ignorehitpause = 1

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1010, HitOverride]
Type = HitOverride
Trigger1 = 1
Attr = SCA,AA,AP;,AT
slot = 0
time = -1
Stateno = 21302
IgnoreHitPause = 1

[State 21200, CS]
type = changestate
trigger1 = (root,movetype = H) && (root,stateno!=[120,155])
trigger2 = root,alive = 0
value = 999

[State 21200, CS]
type = changestate
trigger1 = var(10)<=1
trigger1 = time>=90
trigger2 = var(10)=2
trigger2 = time>=100
trigger3 = var(10)>=3
trigger3 = time>=110
value = 21301

[State 21300, AS]
type = angledraw
trigger1 = 1
scale = 0.6,0.6
ignorehitpause = 1

;--------------------------
; 421 Missile Drop
[Statedef 21301]
type    = A
movetype= A
physics = N
juggle  = 0
velset = 0,0
anim = 21301
sprpriority = 5
movehitpersist = 1

[State 21301, RemoteVarSet]
type = null
trigger1 = prevstateno=21300
trigger1 = time = 0
trigger1 = root,numhelper(21310)
trigger1 = root,cond(numhelper(21310),helper(21310),cond(1,var(20):=1,0),0);Remotely set root's helper21310's var(20), if it exists.

[State 21301, PSND]
type = playsnd
trigger1 = prevstateno=21300
trigger1 = time = 0
value = 1300,12

[State 21301, PS]
type = posset
trigger1 = prevstateno=21300
trigger1 = time = 0
x = floor(root,cond(numhelper(21310),helper(21310),cond(1,pos x,0),0))-100*facing
y = -600

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1010, HitOverride]
Type = HitOverride
Trigger1 = 1
Attr = SCA,AA,AP;,AT
slot = 0
time = -1
Stateno = 21302
IgnoreHitPause = 1

[State 21101, VelS]
type = velset
trigger1 = 1
x = 5.0
y = 30.0

[State 21300, AS]
type = angleset
trigger1 = vel y != 0
value = floor(atan(vel x/vel y)*180.0/pi)-90
ignorehitpause = 1

[State 21300, AS]
type = angleset
trigger1 = vel y = 0
value = 0
ignorehitpause = 1


;===============
; HITDEF
;===============
[State 1211, HitDef]
type = HitDef
trigger1 = movecontact = 0 && movereversed = 0
attr = A,SP
hitflag = MAFD
guardflag = MA
animtype = Hard
air.animtype = Back
priority = 4,Hit
damage = ceil(var(11)*root,fvar(11)),ceil(var(12)*root,fvar(11))
pausetime = 0,10
getpower = ceil(var(11)*1.6*fvar(11)),ceil(var(11)*0.4) ;160% & 40% of base damage
givepower = ceil(var(11)*0.8*fvar(11)),ceil(var(11)*0.2) ;80% & 20% of base damage
sparkno=s8010+(random%2)
guard.sparkno = s8030
sparkxy = -10,0
hitsound = S1,2
guardsound = S2,0
ground.type = High
yaccel = 0.5
p1sprpriority = 5
ground.velocity = -2.0,-10.0
guard.velocity = -2.0
air.velocity = -2.0,-10.0
airguard.velocity = -2.0,-10.0
down.velocity = -2.0,-10.0
p2facing = 1
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
ground.slidetime = cond((var(32):=22+root,var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=22+root,var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=18+root,var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=18+root,var(34))<=1,1,var(32))
air.hittime = cond((var(32):=44+root,var(34))<=1,1,var(32))
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=44+root,var(34))<=1,1,var(32))+10;hitstun+pausetime value
id = 1300

[State 2011, Helper Hit Flag]
type = parentvarset
trigger1 = MoveHit=1
trigger1 = p2stateno != [120,159]
var(35)=2
ignorehitpause = 1
persistent = 0

[State 1602, Recovery Frames]
type = statetypeset
trigger1 = movecontact || movereversed
movetype = I
ignorehitpause = 1

[State -2, Spirit Gauge Increase]
type = parentvaradd
trigger1 = root,var(52)=2 ;Type-ß Only
trigger1 = movecontact
trigger1 = root,var(54)<ceil(root,lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*root,fvar(11)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1
;===============
; END HITDEF
;===============

[State 200, Damage Proration]
type = parentvarset
trigger1 = Movehit
fvar(10) = (root,fvar(10))*0.85*cond(root,fvar(10)>=1.0,(root,fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State 21101, CS]
type = changestate
trigger1 = movecontact||movereversed
trigger2 = vel y > 0
trigger2 = pos y > -(vel y)
value = 21302

[State 21300, AS]
type = angledraw
trigger1 = 1
scale = 0.6,0.6
ignorehitpause = 1

[State 21300, Timer]
type = varadd
trigger1 = 1
var(1) = 1

;---------------------------------------------------------------------------
; Missile Projectile
[Statedef 21302]
type    = A
movetype= I
physics = N
sprpriority=5
ctrl = 0
anim = 21102
velset = 0,0
facep2 = 0
movehitpersist = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 20
freq = 180
ampl = 2
phase = 90

[State 21301, PSND]
type = playsnd
trigger1 = time = 0
value = 1300,13

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 21202, T]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256,256
ignorehitpause = 1

[State 21102, Zeeky]
type = changestate
trigger1 = animtime=0
value = 999

[State 21200, AD]
type = angledraw
trigger1 = 1
scale = 1.0,1.0
ignorehitpause = 1

;--------------------------
; 421 Reticule
[Statedef 21310]
type    = A
movetype= I
physics = N
juggle  = 0
velset = 0,0
anim = 1998+0*floor(fvar(0):=1.0)
sprpriority = 5
movehitpersist = 1
; Var(20) - Activate Flag (Activated by state 21300)

[State 21200, CVS]
type = varset
trigger1 = time = 0
var(10) = root,var(10)

[State 21301, PS]
type = posset
trigger1 = time = 0
y = 0

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 21310, CS]
type = changestate
trigger1 = var(20)=1
value = 21311

;--------------------------
; 421 Reticule - Locked
[Statedef 21311]
type    = A
movetype= I
physics = N
juggle  = 0
velset = 0,0
anim = 21310
sprpriority = 5
movehitpersist = 1

[State 21310, VA]
type = varadd
trigger1 = time
trigger1 = fvar(0)>0.6
fvar(0)=-0.04

[State 21310, AA]
type = angleadd
trigger1 = time
value = 7

[State 21311, PSND]
type = playsnd
trigger1 = time=0
value = 1300,11

[State 21301, PS]
type = posset
trigger1 = time = 0
y = 0

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 21311, Destroyself]
type = destroyself
trigger1 = time>=60
trigger2 = root,cond(numhelper(21300),helper(21300),cond(stateno=999||stateno=21302,1,0),1)

[State 21311, AD]
type = angledraw
trigger1 = 1
scale = fvar(0),fvar(0)
ignorehitpause = 1

;---------------------------------------------------------------------------
; 236p Water Bomb Giant Swing
[Statedef 1400]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 1400+1*(var(10)=2)+2*(var(10)>=3)+0*floor(var(55):=0)
poweradd = ceil(30.0*fvar(11))
ctrl = 0
sprpriority = 1
facep2 = 1
juggle = 0

[State 1200, STS]
type = statetypeset
trigger1 = statetype != A
statetype = S
physics = S

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = var(10)<=1
trigger1 = (var(11):=20)||1 ;Base: 35
trigger1 = (var(12):=4)||1
trigger2 = var(10)=2
trigger2 = (var(11):=20)||1 ;Base: 35
trigger2 = (var(12):=4)||1
trigger3 = var(10)>=3
trigger3 = (var(11):=20)||1 ;Base: 35
trigger3 = (var(12):=4)||1

[State 1400, PSND]
type = playsnd
trigger1 = animelemtime(4)=0
trigger2 = var(10)>=2
trigger2 = animelemtime(12)=0
trigger3 = var(10)>=3
trigger3 = animelemtime(20)=0
value = 1400,10

[State 0, MoveHitReset]
type = MoveHitReset
trigger1 = var(10)>=2
trigger1 = animelemtime(12)=0
trigger2 = var(10)>=3
trigger2 = animelemtime(20)=0

[State 1200, Hitdef]
type = HitDef
triggerall = movecontact = 0 && movereversed=0
trigger1 = animelemno(0)=[4,11]
trigger2 = var(10)>=2
trigger2 = animelemno(0)=[12,19]
trigger3 = var(10)>=3
trigger3 = animelemno(0)=[20,27]
attr = S,SA
animtype = Back
damage = ceil(var(11)*(fvar(11)/cond(var(55)=9,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(12)*fvar(11))
priority = 4,hit
hitflag = MAF
guardflag = MA
pausetime = 8,8
sparkno = S8020+(random%2)
guard.sparkno = S8030
sparkxy = -20,-65
hitsound   = s1,2
guardsound = s2,0
ground.type = High
air.type = Low
ground.slidetime = cond((var(32):=27+0+3*(var(42)!=0)+var(34))<=1,1,var(32));27*2
ground.hittime  = cond((var(32):=27+0+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=22+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=22+3*(var(42)!=0)+var(34))<=1,1,var(32))
air.hittime = cond((var(32):=29+0+3*(var(42)!=0)+var(34))<=1,1,var(32))
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ground.velocity = -4.0
air.velocity = -4.0,-2.0
getpower = 30,15
givepower = ceil(var(11)*0.8*(fvar(11)/cond(var(55)=9,(fvar(30)),1))),ceil(var(11)*0.2)
yaccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=29+0+3*(var(42)!=0)+var(34))<=1,1,var(32))+10;hitstun+pausetime value
p2facing = 1
id = 1400

[State -2, Spirit Gauge Increase (1st Hit)]
type = varadd
triggerall = var(52)=2 ;Type-C Only
triggerall = movehit
trigger1 = animelemno(0)=[4,11]
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=9,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1
[State -2, Spirit Gauge Increase (1st Hit)]
type = varadd
triggerall = var(52)=2 ;Type-C Only
triggerall = movehit
trigger1 = var(10)>=2
trigger1 = animelemno(0)=[12,19]
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=9,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1
[State -2, Spirit Gauge Increase (1st Hit)]
type = varadd
triggerall = var(52)=2 ;Type-C Only
triggerall = movehit
trigger1 = var(10)>=3
trigger1 = animelemno(0)>=20
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=9,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1

[State 220, First Combo Hit]
type = varset
triggerall = numtarget(1400) && movehit
trigger1 = target(1400),gethitvar(hitcount)=1
trigger1 = var(55)=0
var(55) = 9;Change index
ignorehitpause = 1
persistent = 0

[State 200, Damage Dampen]
type = varset
trigger1 = movehit
trigger1 = (animelemno(0)=[4,11]) || var(10)<=1
fvar(10) = fvar(10)*0.95*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0
[State 200, Damage Dampen]
type = varset
trigger1 = movehit && var(10)>=2
trigger1 = animelemno(0)=[12,19]
fvar(10) = fvar(10)*0.95*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0
[State 200, Damage Dampen]
type = varset
trigger1 = movehit && var(10)>=3
trigger1 = animelemno(0)>=20
fvar(10) = fvar(10)*0.95*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State 1400, PSND]
type = playsnd
trigger1 = var(10)<=1
trigger1 = animelemtime(13)=0
trigger2 = var(10)=2
trigger2 = animelemtime(20)=0
trigger3 = var(10)>=3
trigger3 = animelemtime(29)=0
value = 1400,11

[State 1010, Effect]
type =helper
triggerall = !ishelper
trigger1 = var(10)<=1
trigger1 = animelemtime(13)=0
trigger2 = var(10)=2
trigger2 = animelemtime(21)=0
trigger3 = var(10)>=3
trigger3 = animelemtime(29)=0
helpertype = normal
name = "Waterbomb"
ID = 21400
pos = 70,-60
postype = p1
stateno = 21400
ownpal = 1
facing = 1

[State -2, FLAG RECOVERY FRAMES]
type = statetypeset
trigger1 = var(10)<=1
trigger1 = animelemtime(13)>1
trigger2 = var(10)=2
trigger2 = animelemtime(20)>1
trigger3 = var(10)>=3
trigger3 = animelemtime(29)>1
movetype = I
persistent = 0
ignorehitpause = 1

[State 1900, CS]
type = changestate
trigger1 = animtime=0
value = 0
ctrl = 1

;--------------------------
; 236 Water Bomb
[Statedef 21400]
type    = A
movetype= I
physics = N
juggle  = 0
anim = 21400
sprpriority = 5
; Var(0) - Timer
; Var(5) - Angle
; Var(10) - Version (1=L, 2=M, 3=H)

[State 21200, CVS]
type = varset
trigger1 = time = 0
var(10) = root,var(10)

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = (var(11):=65)||1
trigger1 = (var(12):=13)||1

[State 1300, Angle Set]
type = null
triggerall = time = 0
trigger1 = var(10)<=1
trigger1 = (var(5):=-10)||1
trigger2 = var(10)=2
trigger2 = (var(5):=-25)||1
trigger3 = var(10)>=3
trigger3 = (var(5):=-40)||1

[State 0, BindToRoot]
type = BindToRoot
trigger1 = time=0
time = 1
pos = 70,-60+floor(30*sin(var(5)*pi/180.0));-60


[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT
ignorehitpause = 1

[State 1010, HitOverride]
Type = HitOverride
Trigger1 = 1
Attr = SCA,AA,AP;,AT
slot = 0
time = -1
Stateno = 21402
IgnoreHitPause = 1

[State 21200, CS]
type = changestate
trigger1 = 1
value = 21401

[State 21100, AD]
type = angledraw
trigger1 = 1
ignorehitpause = 1


;--------------------------
; 236 Water Bomb
[Statedef 21401]
type    = A
movetype= A
physics = N
juggle  = 0
velset = 0,0
sprpriority = 5
movehitpersist = 1

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = ,AA,AT
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1010, HitOverride]
Type = HitOverride
Trigger1 = 1
Attr = SCA,AA,AP;,AT
slot = 0
time = -1
Stateno = 21402
IgnoreHitPause = 1

[State 21501, VS]
type = velset
trigger1 = var(0)=0
x = 5.0+2.5*(var(10)=2)+5.0*(var(10)>=3);*cos(var(5)*pi/180.0)
y = 5.0*sin(var(5)*pi/180.0)

[State 21501, VS]
type = veladd
trigger1 = var(0)>0
y = 0.3

;===============
; HITDEF
;===============
[State 1211, HitDef]
type = HitDef
trigger1 = movecontact = 0 && movereversed = 0
attr = S,SP
hitflag = MAF
guardflag = MA
animtype = Hard
air.animtype = Back
priority = 4,Hit
damage = ceil(var(11)*(root,fvar(11)/cond(root,var(55)=9,(root,fvar(30)),1))),ceil(var(12)*root,fvar(11))
pausetime = 0,8
getpower = ceil(var(11)*1.6*(root,fvar(11)/cond(root,var(55)=9,(root,fvar(30)),1))),ceil(var(11)*0.4) ;160% & 40% of base damage
givepower = ceil(var(11)*0.8*(root,fvar(11)/cond(root,var(55)=9,(root,fvar(30)),1))),ceil(var(11)*0.2) ;80% & 20% of base damage
sparkno=s8020+(random%2)
guard.sparkno = s8030
sparkxy = -10,0
hitsound = S1200,11
guardsound = S2,0
ground.type = High
yaccel = 0.5
p1sprpriority = 5
ground.velocity = -6.0,-4.0
guard.velocity = -6.0
air.velocity = -6.0,-4.0
airguard.velocity = -6.0,-4.0
p2facing = 1
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
ground.slidetime = cond((var(32):=22+root,var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=22+root,var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=18+root,var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=18+root,var(34))<=1,1,var(32))
air.hittime = cond((var(32):=24+root,var(34))<=1,1,var(32))
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=24+root,var(34))<=1,1,var(32))+8;hitstun+pausetime value
id = 1400

[State 2011, Helper Hit Flag]
type = parentvarset
trigger1 = MoveHit=1
trigger1 = p2stateno != [120,159]
var(35)=2
ignorehitpause = 1
persistent = 0

[State 1602, Recovery Frames]
type = statetypeset
trigger1 = movecontact || movereversed
movetype = I
ignorehitpause = 1

[State -2, Spirit Gauge Increase]
type = parentvaradd
trigger1 = root,var(52)=2 ;Type-ß Only
trigger1 = movecontact
trigger1 = root,var(54)<ceil(root,lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(root,fvar(11)/cond(root,var(55)=9,(root,fvar(30)),1))),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1
;===============
; END HITDEF
;===============

[State 220, First Combo Hit]
type = parentvarset
triggerall = numtarget(1400) && movehit
trigger1 = target(1400),gethitvar(hitcount)=1
trigger1 = root,var(55)=0
var(55) = 9;Change index
ignorehitpause = 1
persistent = 0

[State 200, Damage Proration]
type = parentvarset
trigger1 = Movehit
fvar(10) = (root,fvar(10))*0.85*cond(root,fvar(10)>=1.0,(root,fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State 21101, CS]
type = changestate
trigger1 = movecontact||movereversed
trigger2 = frontedgedist < -30
trigger3 = vel y > 0 && pos y > -(vel y)
value = 21402

[State 21401, Angleset]
type = angleset
trigger1 = vel x != 0
value = atan(vel y/vel x)*(-180.0/pi)+(180*(vel x < 0))
ignorehitpause = 1

[State 21300, AS]
type = angleset
trigger1 = vel y = 0
value = 0
ignorehitpause = 1

[State 21100, AD]
type = angledraw
trigger1 = 1
ignorehitpause = 1

[State 21100, Timer]
type = varadd
trigger1 = time>=0
var(0) = 1

;---------------------------------------------------------------------------
; Missile Projectile
[Statedef 21402]
type    = A
movetype= I
physics = N
sprpriority=5
ctrl = 0
anim = 21102
velset = 0,0
facep2 = 0
movehitpersist = 1

[State 21301, PSND]
type = playsnd
trigger1 = time = 0
value = 1200,12

[State 1010, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,AP,AT
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 21202, T]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256,256
ignorehitpause = 1

[State 21102, Zeeky]
type = changestate
trigger1 = animtime=0
value = 999

[State 21200, AD]
type = angledraw
trigger1 = 1
scale = 0.75,0.75
ignorehitpause = 1

;---------------------------------------------------------------------------
; 623p: Water Driller
[Statedef 1500]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 1500+cond(prevstateno=1900,5,1*(var(10)=2)+2*(var(10)>=3))+0*floor(var(13):=cond(prevstateno=1900,0,1))+0*floor(var(24):=0)+0*floor(var(55):=0)
poweradd = ceil(45.0*fvar(11))*(prevstateno!=1900)
ctrl = 0
sprpriority = 1
facep2 = 1
juggle = 0

[State 1XXX, Special Counter]
type = varadd
trigger1 = time = 0
var(3) = 1
persistent = 0
ignorehitpause = 1

[State 240, 1]
type = PlaySnd
trigger1 = animelemtime(1)=0
value = 1500,10

[State 2000, NotHitBy]
type = NotHitBy
trigger1 = prevstateno=1900
trigger1 = animelemtime(27)<0
value = SCA,AA,AP,AT
time = 1
ignorehitpause = 1

[State 1500, Flag]
type = varset
triggerall = animelemno(0)<25
trigger1 = var(10)<=1 && command!="holdx"
trigger2 = var(10)=2 && command!="holdy"
trigger3 = var(10)>=3 && command!="holdz"
trigger4 = prevstateno=1900
var(13)=0

[State 1300, CA]
type = changeanim
triggerall = animelemno(0)=[5,24]
trigger1 = var(13)=0
value = anim
elem = 25
persistent = 0

[State 1300, Full Charge]
type = playsnd
trigger1 = animelemtime(25)=0
trigger1 = var(13)=1
value = 1500,12

[State 1300, CA]
type = changeanim
triggerall = animelemno(0)=[5,24]
trigger1 = var(10)<=1 && command!="holdx"
trigger2 = var(10)=2 && command!="holdy"
trigger3 = var(10)>=3 && command!="holdz"
trigger4 = prevstateno=1900
value = anim
elem = 25
persistent = 0

[State 1300, CA]
type = changeanim
trigger1 = var(10)<=1 && animelemtime(31)=0
trigger2 = var(10)=2 && animelemtime(33)=0
trigger4 = prevstateno=1900
value = anim
elem = 35
persistent = 0

[State 2000, Proj Inv NotHitBy]
type = NotHitBy
trigger1 = prevstateno!=1900
trigger1 = var(10)=2
trigger1 = animelemno(0)=[25,34]
value = ,AP
time = 1
ignorehitpause = 1

[State 240, 1]
type = PlaySnd
trigger1 = animelemtime(4)=0
value = 1500,10
channel = 7
[State 240, 1]
type = PlaySnd
trigger1 = animelemtime(25)=0
value = 1500,11
channel = 7

[State 0, Width]
type = Width
trigger1 = animelemno(0)=[25,34]
value = 20,0
ignorehitpause = 1

[State 1500, VS]
type = velset
trigger1 = animelemno(0)=[25,34]
x = 5.0+1.0*(var(10)=2)+2.0*(var(10)>=3)

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = var(10)<=1
trigger1 = (var(11):=25*(prevstateno!=1900))||1 ;Base: 35
trigger1 = (var(12):=5*(prevstateno!=1900))||1
trigger2 = var(10)=2
trigger2 = (var(11):=25*(prevstateno!=1900))||1 ;Base: 35
trigger2 = (var(12):=5*(prevstateno!=1900))||1
trigger3 = var(10)>=3
trigger3 = (var(11):=25*(prevstateno!=1900))||1 ;Base: 35
trigger3 = (var(12):=5*(prevstateno!=1900))||1

[State 1500, MHR]
type = movehitreset
trigger1 = animelemtime(27)=0||animelemtime(29)=0
trigger2 = var(10)>=2 && animelemtime(31)=0
trigger3 = var(10)>=3 && animelemtime(33)=0

[State 1200, Hitdef]
type = HitDef
triggerall = movecontact = 0 && movereversed=0
trigger1 = animelemno(0)=25||animelemno(0)=27||animelemno(0)=29
trigger2 = var(10)>=2 && animelemno(0)=31
trigger3 = var(10)>=3 && animelemno(0)=33
attr = S,SA
animtype = Back
damage = ceil(var(11)*(fvar(11)/cond(var(55)=10,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(12)*fvar(11))
priority = 4,hit
hitflag = MAF
guardflag = MA
pausetime = 6,6
sparkno = S8020+(random%2)
guard.sparkno = S8030
sparkxy = -20,-48
hitsound   = s1,1
guardsound = s2,0
ground.type = High
air.type = Low
ground.slidetime = cond((var(32):=27+0+3*(var(42)!=0)+var(34))<=1,1,var(32));27*2
ground.hittime  = cond((var(32):=27+0+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=22+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=22+3*(var(42)!=0)+var(34))<=1,1,var(32))
air.hittime = cond((var(32):=29+20*(var(24)&&((var(10)<=1&&animelemno(0)=29)||(var(10)=2&&animelemno(0)=31)||(var(10)>=3&&animelemno(0)=33)))+3*(var(42)!=0)+var(34))<=1,1,var(32))
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ground.velocity = -5.0-7.5*(((var(10)<=1&&animelemno(0)=29)||(var(10)=2&&animelemno(0)=31)||(var(10)>=3&&animelemno(0)=33))),-0.0-cond(var(24),8.0,3.0)*(((var(10)<=1&&animelemno(0)=29)||(var(10)=2&&animelemno(0)=31)||(var(10)>=3&&animelemno(0)=33)))
guard.velocity = -5.0
air.velocity = -5.0-7.5*(((var(10)<=1&&animelemno(0)=29)||(var(10)=2&&animelemno(0)=31)||(var(10)>=3&&animelemno(0)=33))),-3.0-cond(var(24),5.0,0.0)*(((var(10)<=1&&animelemno(0)=29)||(var(10)=2&&animelemno(0)=31)||(var(10)>=3&&animelemno(0)=33)))
airguard.velocity = -5.0,-3.0
getpower = 30,15
givepower = ceil(var(11)*0.8*(fvar(11)/cond(var(55)=10,(fvar(30)),1))),ceil(var(11)*0.2)
yaccel = 0.5
fall = 0+1*(((var(10)<=1&&animelemno(0)=29)||(var(10)=2&&animelemno(0)=31)||(var(10)>=3&&animelemno(0)=33)))
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=29+20*(var(24)&&((var(10)<=1&&animelemno(0)=29)||(var(10)=2&&animelemno(0)=31)||(var(10)>=3&&animelemno(0)=33)))+3*(var(42)!=0)+var(34))<=1,1,var(32))+6;hitstun+pausetime value
p2facing = 1
id = 1500
p2stateno = cond(((var(15)=0||var(24))&&sysvar(4)=0&&var(13)=1)*(((var(10)<=1&&animelemno(0)=29)||(var(10)=2&&animelemno(0)=31)||(var(10)>=3&&animelemno(0)=33))),260,-1)
p2getp1state = cond(((var(15)=0||var(24))&&sysvar(4)=0&&var(13)=1)*(((var(10)<=1&&animelemno(0)=29)||(var(10)=2&&animelemno(0)=31)||(var(10)>=3&&animelemno(0)=33))),1,0)

[State -2, Spirit Gauge Increase (1st Hit)]
type = varadd
triggerall = var(52)=2 ;Type-C Only
triggerall = movehit
trigger1 = animelemno(0)=[25,26]
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=10,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1
[State -2, Spirit Gauge Increase (1st Hit)]
type = varadd
triggerall = var(52)=2 ;Type-C Only
triggerall = movehit
trigger1 = animelemno(0)=[27,28]
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=10,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1
[State -2, Spirit Gauge Increase (1st Hit)]
type = varadd
triggerall = var(52)=2 ;Type-C Only
triggerall = movehit
trigger1 = animelemno(0)=[29,30]
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=10,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1
[State -2, Spirit Gauge Increase (1st Hit)]
type = varadd
triggerall = var(52)=2 ;Type-C Only
triggerall = movehit
trigger1 = var(10)>=2
trigger1 = animelemno(0)=[31,32]
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=10,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1
[State -2, Spirit Gauge Increase (1st Hit)]
type = varadd
triggerall = var(52)=2 ;Type-C Only
triggerall = movehit
trigger1 = var(10)>=3
trigger1 = animelemno(0)>=33
trigger1 = var(54)<ceil(lifemax*0.9)
var(54) = cond(movehit,ceil(var(11)*0.6*(fvar(11)/cond(var(55)=10,(fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.15))
persistent=0
ignorehitpause = 1

[State 220, First Combo Hit]
type = varset
triggerall = numtarget(1500) && movehit
trigger1 = target(1500),gethitvar(hitcount)=1
trigger1 = var(55)=0
var(55) = 10;Change index
ignorehitpause = 1
persistent = 0

[State 200, Damage Dampen]
type = varset
trigger1 = movehit
trigger1 = (animelemno(0)=[25,26])
fvar(10) = fvar(10)*0.95*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0
[State 200, Damage Dampen]
type = varset
trigger1 = movehit
trigger1 = (animelemno(0)=[27,28])
fvar(10) = fvar(10)*0.95*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0
[State 200, Damage Dampen]
type = varset
trigger1 = movehit
trigger1 = (animelemno(0)=[29,30])
fvar(10) = fvar(10)*0.95*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0
[State 200, Damage Dampen]
type = varset
trigger1 = movehit && var(10)>=2
trigger1 = (animelemno(0)=[31,32])
fvar(10) = fvar(10)*0.95*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0
[State 200, Damage Dampen]
type = varset
trigger1 = movehit && var(10)>=3
trigger1 = (animelemno(0)>=33)
fvar(10) = fvar(10)*0.95*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State -2, Wallbounce]
type = varset
trigger1 = movehit && var(13)=1
trigger1 = numtarget(1500)
trigger1 = var(15)=0
trigger1 = cond(movecontact,(var(24):=1)||1,1)
var(15)=1
persistent=0
ignorehitpause = 1


[State -2, FLAG RECOVERY FRAMES]
type = statetypeset
trigger1 = var(10)<=1
trigger1 = ((animelemno(0)=29)&&(movecontact||movereversed))||animelemtime(30)>=0
trigger2 = var(10)=2
trigger2 = ((animelemno(0)=31)&&(movecontact||movereversed))||animelemtime(32)>=0
trigger3 = var(10)>=3
trigger3 = ((animelemno(0)=33)&&(movecontact||movereversed))||animelemtime(34)>=0
movetype = I
persistent = 0
ignorehitpause = 1

[State 1000, CS]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; USkill 5A - Sortie
[Statedef 1800]
type    = S
movetype = I
physics = S
ctrl = 0
velset = 0,0
anim = 1800+1*(var(10)=2)+0*floor(var(55):=0);+0*floor(var(7):=0)
poweradd = 0
sprpriority = 0
facep2 = 1
juggle = 0

[State 1200, PSND]
type = playsnd
trigger1 = var(10)<=1
trigger1 = animelemtime(3)=0
trigger2 = var(10)>=2
trigger2 = animelemtime(4)=0
value = 1800,10

[State 215, Turret]
type = Helper
trigger1 = var(10)<=1
trigger1 = animelemtime(3)=0
;trigger1 = (fvar(15):=-1.0)||1 ;Variable off switch
;trigger1 = (fvar(16):=(10.0/3.0))||1 ;Add ??% Sumireko gauge per second during recharge (5.0 second recharge)
helpertype = normal ;player
name = "Sortie"
ID = 21800;1410
stateno = 21800
pos = -10,-70
postype = p1 ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 1200, CS]
type = changestate
trigger1 = animtime=0
value = 0
ctrl = 1

;--------------------------
; Sortie Helper
[Statedef 21800]
type = A
movetype = I
physics = N
anim = 21800
sprpriority = 1
; Var(0) = Timer

[State 4002, PSND]
type = playsnd
trigger1 = 1
persistent = 20
value = 4000,10
channel = 6

[State 0, Explod]
type = Explod
trigger1 = time=0
anim = 25200
ID = 21800
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
bindtime = -1
vel = 0,0
removetime = -2
pausemovetime = 0
scale = 1.0,1.0
sprpriority = 5
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State -2, Rotor]
type = helper
trigger1 = numhelper(21804)=0
;trigger1 = animelemtime(1)=0
name = "RotorBlade_Upper"
ID = 21804
pos = 0,0
postype = p1
stateno = 21802
ownpal = 0;1
facing = 1
ignorehitpause = 1
;supermovetime = 999999999
;pausemovetime = 999999999
[State -2, Rotor]
type = helper
trigger1 = numhelper(21802)=0
;trigger1 = animelemtime(1)=0
name = "RotorBlade_Mid"
ID = 21802
pos = 0,0
postype = p1
stateno = 21802
ownpal = 1
facing = 1
ignorehitpause = 1
;supermovetime = 999999999
;pausemovetime = 999999999
[State -2, Rotor]
type = helper
trigger1 = numhelper(21803)=0
;trigger1 = animelemtime(1)=0
name = "RotorBlade_Lower"
ID = 21803
pos = 0,0
postype = p1
stateno = 21802
ownpal = 1
facing = 1
ignorehitpause = 1
;supermovetime = 999999999
;pausemovetime = 999999999

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = (var(11):=70)||1 
trigger1 = (var(12):=0)||1

[State 0, Turn]
type = Turn
trigger1 = p2dist x < 0

[State 21800, Lock Battery Recharge: 60f]
type = ParentVarSet
trigger1 = 1
var(7) = 60

[State 215, Turret Blast]
type = playsnd
trigger1 = var(0)>=120
value = 1800,11

[State 215, Turret Blast]
type = Helper
trigger1 = var(0)>=120
helpertype = normal ;player
name = "Blast"
ID = 21803
stateno = 21803
pos = 30,-1+floor(5.0*sin(2.0*var(1)*pi/180.0))
postype = p1 ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 215, Turret Blast]
type = Helper
trigger1 = var(0)>=120
trigger1 = (var(0):=0)||1
helpertype = normal ;player
name = "Blast"
ID = 21810
stateno = 21810
pos = 0,floor(5.0*sin(2.0*var(1)*pi/180.0))
postype = p1 ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 21800, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,SP,AT
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 21800, Destroy]
type = changestate
trigger1 = root,fvar(15)<=0.0
trigger2 = root,movetype=H
trigger2 = root,stateno!=[120,155]
trigger3 = root,stateno=1800
trigger3 = root,animelemtime(4)>=0
trigger3 = root,var(10)=2
trigger4 = roundstate!=2
value = 21801

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 0.6,0.6
ignorehitpause = 1

[State 0, Offset]
type = Offset
trigger1 = 1
y = floor(5.0*sin(2.0*var(1)*pi/180.0))
ignorehitpause = 1
;persistent = 


[State 21800, Timer]
type = varadd
trigger1 = (root,stateno!=801)&&((root,stateno!=811)||(root,stateno=811&&root,animelemtime(14)>=0))
trigger1 = (root,stateno!=[4001,4099])
trigger1 = !(root,stateno=1800 && root,var(10)=2)
var(0) = 1

[State 21800, Timer]
type = varadd
trigger1 = 1
var(1) = 1

[State 215, Drain Battery]
type = Parentvaradd
trigger1 = (root,stateno!=801)&&((root,stateno!=811)||(root,stateno=811&&root,animelemtime(14)>=0))
trigger1 = (root,stateno!=[4001,4099])
trigger1 = !(root,stateno=1800 && root,var(10)=2)
fvar(15)=-2.0

;--------------------------
; Sortie Helper
[Statedef 21801]
type = A
movetype = I
physics = N
sprpriority = 1
; Var(0) = Timer

[State 21800, Lock Battery Recharge: 30f]
type = ParentVarSet
trigger1 = time=0
var(7) = 60

[State 21800, NHB]
type = nothitby
trigger1 = 1
value = SCA,AA,SP,AT
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256-floor(256.0*time/10.0),floor(256.0*time/10.0)
ignorehitpause = 1

[State 21800, Destroy]
type = destroyself
trigger1 = time>=10

[State 0, Offset]
type = Offset
trigger1 = 1
y = floor(5.0*sin(2.0*var(1)*pi/180.0))
ignorehitpause = 1

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 0.6,0.6
ignorehitpause = 1

;------------------------------
; Sortie Helicopter Blade
[StateDef 21802]
Type = A
MoveType = I
Physics = N
anim = 1+1*(ishelper(21802)||ishelper(21803))
SprPriority = 6-1*ishelper(21802)-2*ishelper(21803)
velset = 0,0

[State 30050, ChangAnim]
type = changeanim
trigger1 = anim!=(1+1*(ishelper(21802)||ishelper(21803)))
value = 1+1*(ishelper(21802)||ishelper(21803))

[State 30050, Scale Me]
type = null
trigger1 = time=0
trigger1 = (fvar(0):=1.0)||1
trigger1 = (fvar(1):=0.25)||1

[State 30050, Bind Me - Default]
type = null
trigger1 = 1
trigger1 = (var(2):=0)||1
trigger1 = (var(0):=-10)||1
trigger1 = (var(1):=-30+floor(5.0*sin(2.0*parent,var(1)*pi/180.0)))||1

[State 0, Trans]
type = Trans
trigger1 = ishelper(21804);||ishelper(30052)
trans = addalpha
alpha = 256,256
ignorehitpause = 1
[State 0, Trans]
type = Trans
trigger1 = ishelper(21803)
trans = addalpha
alpha = 192,256
ignorehitpause = 1
[State 0, Trans]
type = Trans
trigger1 = ishelper(21802)
trans = sub
ignorehitpause = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State T]
type = turn
trigger1 = facing!=parent,facing

[State 0, DestroySelf]
type = DestroySelf
trigger1 = parent,stateno=21801
ignorehitpause = 1

[State 20010, BTR]
type = bindtoparent
trigger1 = 1
pos = var(0),var(1)

[State 30050, Scaleme]
type = angledraw
trigger1 = 1
value = var(2)
scale = fvar(0)*0.5,fvar(1)*0.5
ignorehitpause = 1

;------------------------------
; Sortie FX
[StateDef 21803]
Type = A
MoveType = I
Physics = N
anim = 21801
SprPriority = 5

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

[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime=0
ignorehitpause = 1

[State 30050, Scaleme]
type = angledraw
trigger1 = 1
;scale = 1.8*0.65,(1.8-(time*0.25))*0.65
scale = (1.8-(time*0.25))*0.65,(1.8-(time*0.25))*0.65
ignorehitpause = 1


;--------------------------
; Sortie Projectile
[Statedef 21810]
type = A
movetype = I
physics = N
anim = 21810
sprpriority = 1

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = (var(11):=50)||1 
trigger1 = (var(12):=10)||1

[State 0, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256,256
ignorehitpause = 1

[State 21800, NHB]
type = nothitby
trigger1 = 1
value = ,AT
ignorehitpause = 1

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
slot = 0
stateno = 21812
time = -1
forceair = 0
ignorehitpause = 1

[State 21800, CS]
type = changestate
trigger1 = 1
value = 21811

;--------------------------
; Sortie Projectile
[Statedef 21811]
type = A
movetype = A
physics = N
ctrl = 0
sprpriority = 1

[State 0, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256,256
ignorehitpause = 1

[State 21800, NHB]
type = nothitby
trigger1 = 1
value = ,AT
ignorehitpause = 1

[State 21800, VS]
type = velset
trigger1 = 1
x = 16.0

[State 230, 2]
type = HitDef
trigger1 = !movecontact && !movereversed
attr = S, SP
animtype  = Hard
damage    = ceil(var(11)*(root,fvar(11)/cond(root,var(55)=11,(root,fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(12)*(root,fvar(11)))
hitflag = MAF
guardflag = MA
priority = 4,hit
pausetime = 1,10
sparkno = S8020+(random%2)
guard.sparkno = S8030
sparkxy = -20,0
hitsound = s1,2
guardsound = s2,0
ground.type = High
ground.slidetime = cond((var(32):=22+root,var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=22+root,var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=18+root,var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=18+root,var(34))<=1,1,var(32))
air.hittime = cond((var(32):=24+root,var(34))<=1,1,var(32))
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = cond((var(32):=24+root,var(34))<=1,1,var(32))+10;hitstun+pausetime value
ground.velocity = -6.0
air.velocity = -6.0,-6.0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
y.accel = 0.5
getpower = ceil(var(11)*1.6*(root,fvar(11)/cond(root,var(55)=11,(root,fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.4)
givepower = ceil(var(11)*0.8*(root,fvar(11)/cond(root,var(55)=11,(root,fvar(30)),1))*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.2)
p2facing = 1
id = 1800

[State 2011, Helper Hit Flag]
type = null;rootvarset
trigger1 = MoveHit=1
trigger1 = p2stateno != [120,159]
;var(35)=2
trigger1 = (root,cond(1,var(35):=2,0))||1
ignorehitpause = 1
persistent = 0

[State -2, Spirit Gauge Increase]
type = null;rootvaradd
trigger1 = root,var(52)=2 ;Type-ß Only
trigger1 = movecontact
trigger1 = root,var(54)<ceil(root,lifemax*0.9)
;var(54) = cond(movehit,ceil(var(11)*0.6*root,fvar(11)),ceil(var(11)*0.15))
trigger1 = cond(movehit,(root,cond(1,var(54):=var(54)+ceil(50.0*0.6*(fvar(11)/cond(var(55)=11,(fvar(30)),1))),0)),(root,cond(1,var(54):=var(54)+ceil(50.0*0.15),0)))
persistent=0
ignorehitpause = 1
;===============
; END HITDEF
;===============

[State 220, First Combo Hit]
type = null;rootvarset
triggerall = numtarget(1800) && movehit
trigger1 = target(1800),gethitvar(hitcount)=1
trigger1 = root,var(55)=0
;var(55) = 11;Change index
trigger1 = (root,cond(1,var(55):=11,0))||1
ignorehitpause = 1
persistent = 0

[State 200, Damage Proration]
type = null;rootvarset
trigger1 = Movehit=1
;fvar(10) = (root,fvar(10))*0.85
trigger1 = (root,cond(1,fvar(10):=fvar(10)*0.85*cond(fvar(10)>=1.0,(fvar(30)),1.0),0))||1
ignorehitpause = 1
persistent = 0

[State 1602, Recovery Frames]
type = statetypeset
trigger1 = movecontact || movereversed
movetype = I
ignorehitpause = 1
persistent=0

[State 21800, CS]
type = changestate
trigger1 = movecontact || movereversed
trigger2 = frontedgedist<-100;||backedgedist<-100||(pos y>100)||(screenpos y < -100)
trigger3 = (root,movetype=H) && (root,stateno!=[120,150])
value = 21812

;--------------------------
; Sortie Projectile
[Statedef 21812]
type = A
movetype = I
physics = N
ctrl = 0
sprpriority = 5

[State 21800, NHB]
type = nothitby
trigger1 = 1
value = SCA,AP,AP,AT
ignorehitpause = 1

[State 21800, PP]
type = playerpush
trigger1 = 1
value = 0

[State 21802, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256-floor(256.0*time/10.0),256
ignorehitpause = 1

[State 21802, Destroyself]
type = Destroyself
trigger1 = time>=10

;--------------------------
; Battery Gauge Helper
[Statedef 31800]
type = S
movetype = I
physics = N
anim = 1998

[State 21000, VS]
type = varset
trigger1 = var(53)!=(root,var(53))
var(53)=root,var(53)

;Kanako Gauge Handling
;See Kanako Helper in State 215 for example on how to use
[State -2, VS]
type = parentvarset
trigger1 = root,fvar(15)>1000.0
fvar(15)=1000.0
ignorehitpause = 1

[State -2, VS]
type = parentvarset
trigger1 = root,fvar(15)<0.0
fvar(15)=0.0
ignorehitpause = 1

[State 31800, Countdown]
type = parentvaradd
trigger1 = root,var(7)>=0
var(7)=-1

[State -2, VA]
type = parentvaradd
triggerall = roundstate=2
trigger1 = root,fvar(15)<1000.0 && root,fvar(15)>=0
trigger1 = root,var(7)<0
trigger1 = root,stateno!=1800
trigger1 = root,stateno!=801 && root,stateno!=811
trigger1 = !((root,stateno=2000)&&(root,animelemno(0)=[7,16]))
trigger1 = !((root,stateno=2100)&&(root,time<=50))
trigger1 = !((root,stateno=4000)&&(root,time<=70))
trigger1 = root,stateno!=[3000,3010]
trigger1 = root,stateno!=[4001,4099]
fvar(15) = cond(root,fvar(15)<250.0,0.5,cond(root,fvar(15)<500.0,0.75,1.0));0.75;root,fvar(16)
ignorehitpause = 1

;[State -2, VA]
;type = parentvaradd
;trigger1 = root,fvar(21)<0.0
;fvar(21) = 1.0
;ignorehitpause = 1

[State Kanako]
type = VarSet
trigger1 = Time = 0
fvar(15) = root,fvar(15)

[State 21000, Explod]
type = explod
trigger1 = numexplod(31800)=0
anim = 31800
id = 31800
scale = 0.5,0.5
pos = 16*ifelse(teamside=1,1,-1)+ifelse(teamside=1,0,floor(gamewidth/1.0)),204-160
postype = left
facing = ifelse(teamside=1,1,-1)
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 4
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 0

;==============
;Bar
;==============
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = numexplod(31811)
trigger1 = !(root,fvar(15)<250.0)
id = 31811

[State 21000, Explod]
type = explod
trigger1 = numexplod(31811)=0
trigger1 = root,fvar(15)<250.0
anim = 31801
id = 31811
scale = 0.5,0.5;0.5*0.72151,0.5
pos = 16*ifelse(teamside=1,1,-1)+ifelse(teamside=1,0,floor(gamewidth/1.0)),204-160
postype = left
facing = ifelse(teamside=1,1,-1)
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 5
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 0

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = numexplod(31812)
trigger1 = !(root,fvar(15)=[250.0,500.0))
id = 31812

[State 21000, Explod]
type = explod
trigger1 = numexplod(31812)=0
trigger1 = root,fvar(15)=[250.0,500.0)
anim = 31802
id = 31812
scale = 0.5,0.5;0.5*0.72151,0.5
pos = 16*ifelse(teamside=1,1,-1)+ifelse(teamside=1,0,floor(gamewidth/1.0)),204-160
postype = left
facing = ifelse(teamside=1,1,-1)
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 5
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 0

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = numexplod(31813)
trigger1 = !(root,fvar(15)=[500.0,750.0))
id = 31813

[State 21000, Explod]
type = explod
trigger1 = numexplod(31813)=0
trigger1 = root,fvar(15)=[500.0,750.0)
anim = 31803
id = 31813
scale = 0.5,0.5;0.5*0.72151,0.5
pos = 16*ifelse(teamside=1,1,-1)+ifelse(teamside=1,0,floor(gamewidth/1.0)),204-160
postype = left
facing = ifelse(teamside=1,1,-1)
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 5
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 0

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = numexplod(31814)
trigger1 = !(root,fvar(15)>=750.0)
id = 31814

[State 21000, Explod]
type = explod
trigger1 = numexplod(31814)=0
trigger1 = root,fvar(15)>=750.0
anim = 31804
id = 31814
scale = 0.5,0.5;0.5*0.72151,0.5
pos = 16*ifelse(teamside=1,1,-1)+ifelse(teamside=1,0,floor(gamewidth/1.0)),204-160
postype = left
facing = ifelse(teamside=1,1,-1)
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 5
ontop = 1
shadow = 0,0,0
ownpal = 1
removeongethit = 0

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = 1;numexplod(30012)=1
ID = 31811;2
scale = 0.5*ifelse(root,fvar(15)<0,0.0,(root,fvar(15)/1000.0)),0.5
anim = cond((root,fvar(15)<250.0),31801,cond((root,fvar(15)<500.0),31802,cond((root,fvar(15)<750.0),31803,31804)))
pos = 16*ifelse(teamside=1,1,-1)+ifelse(teamside=1,0,floor(gamewidth/1.0)),204-160
postype = left
ignorehitpause =1
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = 1;numexplod(30012)=1
ID = 31812
scale = 0.5*ifelse(root,fvar(15)<0,0.0,(root,fvar(15)/1000.0)),0.5
anim = cond((root,fvar(15)<250.0),31801,cond((root,fvar(15)<500.0),31802,cond((root,fvar(15)<750.0),31803,31804)))
pos = 16*ifelse(teamside=1,1,-1)+ifelse(teamside=1,0,floor(gamewidth/1.0)),204-160
postype = left
ignorehitpause =1
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = 1;numexplod(30012)=1
ID = 31813
scale = 0.5*ifelse(root,fvar(15)<0,0.0,(root,fvar(15)/1000.0)),0.5
anim = cond((root,fvar(15)<250.0),31801,cond((root,fvar(15)<500.0),31802,cond((root,fvar(15)<750.0),31803,31804)))
pos = 16*ifelse(teamside=1,1,-1)+ifelse(teamside=1,0,floor(gamewidth/1.0)),204-160
postype = left
ignorehitpause =1
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = 1;numexplod(30012)=1
ID = 31814
scale = 0.5*ifelse(root,fvar(15)<0,0.0,(root,fvar(15)/1000.0)),0.5
anim = cond((root,fvar(15)<250.0),31801,cond((root,fvar(15)<500.0),31802,cond((root,fvar(15)<750.0),31803,31804)))
pos = 16*ifelse(teamside=1,1,-1)+ifelse(teamside=1,0,floor(gamewidth/1.0)),204-160
postype = left
ignorehitpause =1

[State 31800, PFX]
type = palfx
trigger1 = root,fvar(15)<1000
time = 1
color = 0

;--------------------
[State Sumireko]
type = VarSet
trigger1 = 1
fvar(15) = root,fvar(15)

;---------------------------------------------------------------------------
; Guard Cancel
[Statedef 1900]
type    = U;S
movetype= A
physics = N;S
velset = 0,0
;anim = 1900
poweradd = 0;-1000
ctrl = 0
sprpriority = 1
;facep2 = 1

[State -2, Counterhit Explod]
type = Explod
trigger1 = time = 0
anim = 7920+1*(teamside!=1)
ID = 7900+1*(numexplod(7900)>0)
pos = ifelse(teamside=1,0,320),(20*numexplod(7900))+80;120
postype = left
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 65535
supermovetime = 65535
sprpriority = 999
scale = 0.6,0.6
ontop = 1
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 210, Fufufu]
type = null;playsnd
trigger1 = time = 0
value = 1000,0
channel = 0

[State 2000, NotHitBy]
type = NotHitBy
trigger1 = time=0
value = SCA,AA,AP,AT
time = 30
;ignorehitpause = 
;persistent = 

[State 2000, Spellcard Effect]
type = helper
trigger1 = time = 0
helpertype = normal
name = "Spellcard_FX"
id = 21900+2*(var(52)=2);1999
stateno = 21900;1999
pos = 0,-50
postype = p1
ownpal = 1
facing = 1
pausemovetime = 40
supermovetime = 40

;[State 1900, Decrease Spirit]
;type = varadd
;trigger1 = time = 0
;var(54) = -floor(lifemax*0.9*0.25)

[State 2000, PS]
type = poweradd
trigger1 = time = 0
value = -1000*!(var(57)>0 && var(52)=1)*!(var(57)>0 && var(52)=2)

[State 2000, Spell Trance Power Cost]
type = varadd
trigger1 = time = 0
trigger1 = (var(57)>0 && var(52)=1)
var(57)=-250
[State 2000, Spell Overdrive End]
type = varset
triggerall = time = 0
trigger1 = (var(57)>0 && var(52)=2)
var(57)=0

[state 1010, Za Warudo!]
type = SuperPause
trigger1 = time = 0
time = 20;0
anim = -1
sound = S4,3
p2defmul = 1
poweradd = 0;-1000
unhittable = 1
movetime = 20;30
darken = 0

[State 1900, CS]
type = changestate
trigger1 = time>=20
trigger1 = (var(10):=1)||1
value = 1500


;-----------------------
; Guard Cancel Use Effect
[Statedef 21900]
anim = 2999+2000*ishelper(21902)
velset = 0,0
sprpriority = 3;-1

[State 1112, NoShadow]
type = AssertSpecial
trigger1 = ishelper
flag = noshadow
ignorehitpause = 1

;[State 700, AD]
;type = angledraw
;trigger1 = 1
;value = 3.0*time*ifelse(ishelper(999),2.0,1.0)
;scale = ifelse(ishelper(999),0.35,0.7)+(time*ifelse(ishelper(999),0.2,0.1)),ifelse(ishelper(999),0.35,0.7)+(time*ifelse(ishelper(999),0.2,0.1))
[State 1999, Angleset]
type = angleadd
trigger1 = 1
value = -10

[State 1999, Varadd]
type = varadd
trigger1 = time <= 20
var(0) = 1

[State 1999, Angledraw]
type = angledraw
trigger1 = 1
scale = (0.5+0.15*var(0))*0.75,(0.5+0.15*var(0))*0.75

;[State 21900, Bomb Type A]
;type = palfx
;trigger1 = ishelper(21900)
;add = 256,0,0
;mul = 256,0,0
;time = -1
;ignorehitpause = 1

;[State 21900, Bomb Type B]
;type = palfx
;trigger1 = ishelper(21901)
;add = 0,256,0
;mul = 0,256,0
;time = -1
;ignorehitpause = 1

;[State 21900, Bomb Type C]
;type = palfx
;trigger1 = ishelper(21902)
;add = 256,256,0
;mul = 256,256,0
;time = -1
;ignorehitpause = 1

[State 700, T]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256-ifelse(time<30,0,floor(256.0*(time-30)/40.0)),256

[State 700, Zeeky]
type = destroyself
trigger1 = time >= 70

;---------------------------------------------------------------------------
; Dash Cancel
[Statedef 1910]
type    = U;S
movetype= A
physics = N;S
velset = 0,0
;anim = 1900
poweradd = 0
ctrl = 0
sprpriority = 1
;facep2 = 1

[State -2, Counterhit Explod]
type = Explod
trigger1 = time = 0
anim = 7930+1*(teamside!=1)
ID = 7900+1*(numexplod(7900)>0)
pos = ifelse(teamside=1,0,320),(20*numexplod(7900))+80;120
postype = left
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 65535
supermovetime = 65535
sprpriority = 999
scale = 0.6,0.6
ontop = 1
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 210, Fufufu]
type = NULL;playsnd
trigger1 = time = 0
value = 1000,0
channel = 0

[State 2000, Spellcard Effect]
type = helper
trigger1 = time = 0
helpertype = normal
name = "Spellcard_FX"
id = 21902;1999
stateno = 21910;1999
pos = 0,-50
postype = p1
ownpal = 1
facing = 1
pausemovetime = 0
supermovetime = 0

[State 1900, Decrease Spirit]
type = varadd
trigger1 = time = 0
var(54) = -floor(lifemax*0.9*0.5);cond(var(57)>0,floor(lifemax*0.9*0.333),floor(lifemax*0.9*0.5))

[State 1910, PSND]
type = playsnd
trigger1 = time=0
value = 4,3

[State 1900, CS]
type = changestate
trigger1 = 1
value = 100+10*(statetype=A)

;-----------------------
; Dash Cancel Use Effect
[Statedef 21910]
anim = 21910
velset = 0,0
sprpriority = 5

[State 1112, NoShadow]
type = AssertSpecial
trigger1 = ishelper
flag = noshadow
ignorehitpause = 1

[State 1999, Angleset]
type = angleadd
trigger1 = 1
value = -10

[State 1999, Varadd]
type = varset
trigger1 = time = 0
var(0) = 8

[State 1999, Varadd]
type = varadd
trigger1 = animelemno(0)=1
var(0) = -1

[State 1999, Varadd]
type = varset
trigger1 = animelemtime(2)=0
var(0) = 0

[State 1999, Varadd]
type = varadd
trigger1 = animelemno(0)=2
var(0) = 1

[State 1999, Angledraw]
type = angledraw
trigger1 = 1
scale = (0.3*var(0))*0.75,(0.3*var(0))*0.75

[State 700, T]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256-ifelse(animelemno(0)=1,0,floor(256.0*animelemtime(2)/20.0)),256
ignorehitpause = 1

[State 700, Zeeky]
type = destroyself
trigger1 = time >= 28

;---------------------------------------------------------------------------
; Bomb (Type-A)
[Statedef 1920]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 1920
poweradd = 0
ctrl = 0
sprpriority = 1
facep2 = 1
juggle = 0
; Total Time: 55f
; Startup: 6f

[State 1920, Strike Invuln]
type = nothitby
trigger1 = time=0
time = 48
value = ,AA,AP
ignorehitpause = 1

[State 1900, Decrease Spirit]
type = varset
trigger1 = time = 0
var(54) = 0;-floor(lifemax*0.9*0.333)

[State 2000, Spellcard Effect]
type = helper
trigger1 = animelemtime(4)=0
helpertype = normal
name = "Bomb_FX"
id = 21920
stateno = 21920
pos = 0,-50
postype = p1
ownpal = 1
facing = 1
[State 2000, Spellcard Effect]
type = helper
trigger1 = animelemtime(4)=0
helpertype = normal
name = "Bomb_FX"
id = 21921
stateno = 21920
pos = 0,-50
postype = p1
ownpal = 1
facing = 1
[State 2000, Spellcard Effect]
type = helper
trigger1 = animelemtime(4)=0
helpertype = normal
name = "Bomb_FX"
id = 21922
stateno = 21920
pos = 0,-50
postype = p1
ownpal = 1
facing = 1

[State 1910, PSND]
type = playsnd
trigger1 = animelemtime(4)=0
value = 1920,10

[State 210, 1st Hitdef]
type = HitDef
triggerall = movecontact=0&&movereversed=0
trigger1 = animelemno(0)=[4,5]
attr = S,SA
animtype  = Hard
priority = 4,hit
damage    = 0,0
Hitflag = MAF
guardflag = MA
pausetime = 6,6
sparkno = S8020+(random%2)
guard.sparkno = S8030
sparkxy = -30,-50
hitsound   = s1,2
guardsound = s2,0
ground.type = High
air.type = low
ground.velocity = -8.5,-6.5
guard.velocity = -8.5
air.velocity = -8.5,-6.5
airguard.velocity = -4.5,-6.5
getpower = 30,15
givepower = ceil(80.0*fvar(11)*ifelse(var(42),1.25,1.0)),20
yaccel = 0.5
ground.slidetime = cond((var(32):=32+3*(var(42)!=0)+var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=32+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=32+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=32+3*(var(42)!=0)+var(34))<=1,1,var(32))
air.hittime = cond((var(32):=32+3*(var(42)!=0)+var(34))<=1,1,var(32))
fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
p2facing = 1
forcestand = 1
id = 1900

[State 1900, Increase Spirit]
type = varset
trigger1 = movehit
var(54) = floor(lifemax*0.9*0.25)
persistent=0
ignorehitpause = 1

[State 1602, Recovery Frames]
type = statetypeset
trigger1 = animelemtime(6) = 0
trigger2 = movecontact || movereversed
movetype = I
ignorehitpause = 1
persistent=0

[State 200, Damage Dampen]
type = varset
trigger1 = movehit;=1
fvar(10) = fvar(10)*0.75*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State 1900, CS]
type = changestate
trigger1 = animtime=0
value = 0
ctrl = 1

;-----------------------
; Bomb Effect
[Statedef 21920]
anim = 21920
velset = 0,0
sprpriority = 5

[State 1999, Angleset]
type = angleadd
trigger1 = 1
value = -10

[State 1112, NoShadow]
type = AssertSpecial
trigger1 = ishelper
flag = noshadow
ignorehitpause = 1

[State 1999, Varadd]
type = varadd
trigger1 = time <= 20
var(0) = 1

[State 21920, AD]
type = angledraw
trigger1 = 1
value = cond(ishelper(21920),0,cond(ishelper(21921),45,-45))
scale = 0.75*(time*0.3) , 0.35*(time*0.3)
ignorehitpause = 1

[State 700, T]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256-floor(256.0*time/30.0),256
ignorehitpause = 1

[State 700, Zeeky]
type = destroyself
trigger1 = time >= 30

;---------------------------------------------------------------------------
; Crush Attack (Type-A)
[Statedef 1940]
type    = S
movetype= A
physics = S
velset = 0,0
anim = 1940
poweradd = -500
ctrl = 0
sprpriority = 1
facep2 = 1
juggle = 0
; 36f startup, 2f active, 69f total

[State 1910, PSND]
type = playsnd
trigger1 = animelemtime(1)=0
value = 1940,10

[State 0, Explod]
type = Explod
trigger1 = animelemtime(1)=0
anim = 21940
ID = 21940
pos = -18,-75
postype = p1  ;p2,front,back,left,right
facing = 1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 5
ontop = 0
ownpal = 1
;pausemovetime = var(36)
removeongethit = 1
ignorehitpause = 1

[State 200, PSND]
type = PlaySnd
trigger1 = animelemtime(4)=0
value = 210,0
channel = 0

[State 240, 1]
type = PlaySnd
trigger1 = animelemtime(4)=0
value = 0,2

[State 0, VelSet]
type = VelSet
trigger1 = animelemno(0)=[4,5]
x = 6.0

[State 1300, Damage Calc]
type = null
triggerall = time = 0
trigger1 = (var(11):=80)||1 ;80
trigger1 = (var(12):=0+16*(var(52)=1))||1

[State 210, 1st Hitdef]
type = HitDef
triggerall = movecontact=0&&movereversed=0
trigger1 = animelemno(0)=5
attr = S,SA
animtype  = Hard
priority = 4,hit
damage = ceil(var(11)*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(12)*fvar(11))
Hitflag = MAF
guardflag = MA
pausetime = 10,10
sparkno = S8020+(random%2)
guard.sparkno = S8020+(random%2);S8030
sparkxy = -20,-60
hitsound   = s1,8
guardsound = s3,1
ground.type = High
air.type = low
ground.velocity = -6.5,-6.5
guard.velocity = -6.5
air.velocity = -6.5,-6.5
airguard.velocity = -6.5,-6.5
getpower = 0,0
givepower = ceil(var(11)*0.8*fvar(11)*ifelse(var(42),1.25,1.0)),ceil(var(11)*0.2)
yaccel = 0.5
ground.slidetime = cond((var(32):=32+3*(var(42)!=0)+var(34))<=1,1,var(32))
ground.hittime  = cond((var(32):=32+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.slidetime = cond((var(32):=32+3*(var(42)!=0)+var(34))<=1,1,var(32))
guard.hittime = cond((var(32):=32+3*(var(42)!=0)+var(34))<=1,1,var(32))
air.hittime = cond((var(32):=32+3*(var(42)!=0)+var(34))<=1,1,var(32))
fall = 1
fall.recover = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
p2facing = 1
forcestand = 1
id = 1940

[State -2, Counterhit Explod]
type = Explod
triggerall = numenemy
triggerall = numtarget(1940)
triggerall = target(1940),stateno = [120,155]
triggerall = target(1940),stateno != [7940,7943]
trigger1 = moveguarded
anim = 7910+1*(teamside!=1)
ID = 7900+1*(numexplod(7900)>0)
pos = ifelse(teamside=1,0,320),(20*numexplod(7900))+80;120
postype = left
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
pausemovetime = 65535
supermovetime = 65535
sprpriority = 999
scale = 0.6,0.6
ontop = 1
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1940, PSND]
type = playsnd
trigger1 = moveguarded
value = 2,1
ignorehitpause = 1
persistent = 0

[State 1940, Guard Crush]
type = targetstate
trigger1 = moveguarded=1
trigger1 = numtarget(1940)
trigger1 = target(1940),stateno = [120,155]
trigger1 = target(1940),stateno != [7940,7943]
id = 1940
value = 7940
ignorehitpause = 1
persistent = 0

[State 1602, Recovery Frames]
type = statetypeset
trigger1 = animelemtime(6) = 0
trigger2 = movecontact || movereversed
movetype = I
ignorehitpause = 1
persistent=0

[State 200, Damage Dampen]
type = varset
trigger1 = movecontact;=1
fvar(10) = fvar(10)*0.75*cond(fvar(10)>=1.0,(fvar(30)),1.0)
ignorehitpause = 1
persistent = 0

[State 1900, CS]
type = changestate
trigger1 = animtime=0
value = 0
ctrl = 1

;-------------------------
; Guard Crush
[Statedef 7940]
type    = U
movetype = H
physics = N
sprpriority = 0
velset = 0,0

[State 7940, CS]
type = changestate
trigger1 = statetype = A
value = 7942

[State 7940, STS]
type = statetypeset
trigger1 = time = 0
statetype = S
physics = S

[State 7940, CA]
type = changeanim
trigger1 = 1;time = 0
value = 5300

[State 7940, CS]
type = changestate
trigger1 = hitshakeover=1
trigger2 = time > 60
value = 7941

;-------------------------
; Guard Crush
[Statedef 7941]
type    = S
movetype = H
physics = S

[State 7941, HVS]
type = hitvelset
trigger1 = time = 0
x = 1

[State 7941, CS]
type = selfstate
trigger1 = time>50
value = 0
ctrl = 1

;-------------------------
; Guard Crush - Air
[Statedef 7942]
type    = A
movetype = H
physics = N
sprpriority = 0
velset = 0,0

[State 7940, CA]
type = changeanim
trigger1 = 1;time = 0
value = 5030

[State 7940, CS]
type = changestate
trigger1 = hitshakeover=1
trigger2 = time > 60
value = 7943

;-------------------------
; Guard Crush - Air
[Statedef 7943]
type    = A
movetype = H
physics = N
sprpriority = 0
velset = -2.0,-6.0

[State 7940, CA]
type = changeanim
trigger1 = time = 0
value = 5050

[State 7940, Grav]
type = veladd
trigger1 = time
y = 0.2

[State 7940, CS]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= -(vel y)
value = 5100