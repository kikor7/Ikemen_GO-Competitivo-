; vim: set ts=4 sw=4 sts=4 expandtab: =========================================;
;                         [ 遠野秋葉 from MELTY BLOOD ]                        ;
;==============================================================================;

;==============================================================================;
; 通常攻撃 (立ち)
;==============================================================================;
;------------------------------------------------------------------------------;
; 立弱P
;------------------------------------------------------------------------------;
[Statedef 200]
type     = S
movetype = A
physics  = S
anim     = 200
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 1
trigger1    = Random < 350
value       = ifelse(var(50), 2, 0), 200
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 2
value    = 6, 0

;-------[ Effects ]-------;

[State 200:             Effect]
type           = Explod
trigger1       = AnimElem = 2
anim           = 7000
id             = 7000
postype        = p1
pos            = 0, 0
scale          = const(size.xscale), const(size.yscale)
ownpal         = 1
sprpriority    = 3
removeongethit = 1
ignorehitpause = 0

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 4
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Light
priority         = 3, Hit
damage           = 26, 0
pausetime        = 6, 6
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-75 * const(size.yscale))
hitsound         = S7, 0
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 11
ground.hittime   = 10
ground.velocity  = -3.0, 0
guard.ctrltime   = 9
air.type         = High
air.hittime      = 10
air.velocity     = -2.5, -1.5
air.fall         = 1
fall.recover     = 1
fall.recovertime = 12
id               = 200

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 立弱P (Type-2)
;------------------------------------------------------------------------------;
[Statedef 201]
type     = S
movetype = A
physics  = S
anim     = 201
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 1
trigger1    = Random < 350
value       = ifelse(var(50), 2, 0), 200
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 3
value    = 6, 0

;-------[ Effects ]-------;

[State 200:             Effect]
type           = Explod
trigger1       = AnimElem = 3
anim           = 7003
id             = 7003
postype        = p1
pos            = Floor(0 * const(size.xscale)), Floor(-15 * const(size.yscale))
scale          = 0.75 * const(size.xscale), 0.75 * const(size.yscale)
ownpal         = 1
sprpriority    = 2
removeongethit = 1
ignorehitpause = 0

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 4
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Light
priority         = 3, Hit
damage           = 26, 0
pausetime        = 6, 6
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-65 * const(size.yscale))
hitsound         = S7, 0
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 13
ground.hittime   = 12
ground.velocity  = -4.0, 0
guard.ctrltime   = 11
air.type         = High
air.hittime      = 12
air.velocity     = -2.5, -1.5
air.fall         = 1
fall.recover     = 1
fall.recovertime = 13
id               = 201

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 立中P
;------------------------------------------------------------------------------;
[Statedef 210]
type     = S
movetype = A
physics  = S
anim     = 210
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1, MBAC]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = !var(50)
trigger1    = Random < 350
value       = 0, 200 + (Random % 3)
channel     = 0
volume      = 127
lowpriority = 1

[State 200:             Voice, 1, MBAA]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = var(50)
trigger1    = Random < 350
value       = 2, 212
channel     = 0
volume      = 255
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 6, 1

;-------[ Movement ]-------;

[State 200:             Pos, 1]
type     = PosAdd
trigger1 = AnimElem = 4
x        = Floor(25 * const(size.xscale))

[State 200:             Pos, 2]
type     = PosAdd
trigger1 = AnimElem = 7
x        = Floor(7 * const(size.xscale))

[State 200:             Pos, 3]
type     = PosAdd
trigger1 = AnimElem = 8
x        = Floor(19 * const(size.xscale))

;-------[ Effects ]-------;

[State 200:             Effect]
type           = Explod
trigger1       = AnimElem = 4
anim           = 7001
id             = 7001
postype        = p1
pos            = 0, 0
scale          = const(size.xscale), const(size.yscale)
ownpal         = 1
sprpriority    = 3
removeongethit = 1
ignorehitpause = 0

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 5
attr             = S, NA
hitflag          = MAF
guardflag        = M
animtype         = Medium
priority         = 4, Hit
damage           = 57, 0
getpower = 15,7
pausetime        = 7, 7
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-40 * const(size.yscale))
hitsound         = S7, 1
guardsound       = S8, 1
ground.type      = Low
ground.slidetime = 18
ground.hittime   = 17
ground.velocity  = -4.0, 0
guard.ctrltime   = 16
air.type         = Low
air.hittime      = 17
air.velocity     = -3.5, -1.0
air.fall         = 1
fall.recover     = 1
fall.recovertime = 18
id               = 210

;-------[ States ]-------;

[State 200:             派生]
type       = ChangeState
triggerall = AnimElemTime(5) > 0 && AnimElemTime(7) < 0
trigger1   = command = "y"
value      = 211

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 立中P 派生
;------------------------------------------------------------------------------;
[Statedef 211]
type     = S
movetype = A
physics  = S
anim     = 211
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0 || NumTarget(210)), 0, 1)

;-------[ Sounds ]-------;

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 2
value    = 6, 1

;-------[ Effects ]-------;

[State 200:             Effect]
type           = Explod
trigger1       = AnimElem = 2
anim           = 7002
id             = 7002
postype        = p1
pos            = 0, 0
scale          = const(size.xscale), const(size.yscale)
ownpal         = 1
sprpriority    = 3
removeongethit = 1
ignorehitpause = 0

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 3
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Up
priority         = 4, Hit
damage           = 43, 0
getpower = 15,7
pausetime        = 6, 6
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-95 * const(size.yscale))
hitsound         = S7, 1
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 22
ground.hittime   = 21
ground.velocity  = -1.0, -7.5
guard.ctrltime   = 20
air.type         = High
air.hittime      = 21
air.velocity     = -2.5, ifelse((var(20) > 0 || var(21) > 0), -4, -3)
fall             = 1
air.fall         = 1
fall.recover     = 1
fall.recovertime = 30
id               = 211

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 立強P
;------------------------------------------------------------------------------;
[Statedef 220]
type     = S
movetype = A
physics  = S
anim     = 220
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = Random < 350
value       = ifelse(var(50), 2, 0), 201 + (Random % 3)
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 3
value    = 6, 2

;-------[ Effects ]-------;

[State 200:             Effect]
type           = Explod
trigger1       = AnimElem = 3
anim           = 7003
id             = 7003
postype        = p1
pos            = 0, 0
scale          = const(size.xscale), const(size.yscale)
ownpal         = 1
sprpriority    = -2
removeongethit = 1
ignorehitpause = 0

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 4
trigger2         = AnimElem = 6
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Light
priority         = 4, Hit
damage           = 44, 0
getpower = 30,15
pausetime        = 7, 7
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-60 * const(size.yscale))
hitsound         = S7, 2
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 21
ground.hittime   = 20
ground.velocity  = -6.0, 0
guard.ctrltime   = 19
air.type         = High
air.hittime      = 20
air.velocity     = -4.0, -2.5
air.fall         = 1
fall.recover     = 1
fall.recovertime = 20
id               = 220

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 立弱K
;------------------------------------------------------------------------------;
[Statedef 230]
type     = S
movetype = A
physics  = S
anim     = 230
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = Random < 350
value       = ifelse(var(50), 2, 0), 200
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 3
value    = 6, 3

;-------[ Effects ]-------;

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 4
attr             = S, NA
hitflag          = MAF
guardflag        = L
animtype         = Light
priority         = 3, Hit
damage           = 22, 0
getpower = 30,15
pausetime        = 6, 6
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -10, Floor(-10 * const(size.yscale))
hitsound         = S7, 3
guardsound       = S8, 1
ground.type      = Low
ground.slidetime = 12
ground.hittime   = 11
ground.velocity  = -2.7, 0
guard.ctrltime   = 10
air.type         = Low
air.hittime      = 12
air.velocity     = -2.0, -1.0
air.fall         = 1
fall.recover     = 1
fall.recovertime = 15
id               = 230

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 立中K
;------------------------------------------------------------------------------;
[Statedef 240]
type     = S
movetype = A
physics  = S
anim     = 240
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = Random < 350
value       = ifelse(var(50), 2, 0), 200 + (Random % 2)
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 6, 4

;-------[ Effects ]-------;

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 4
attr             = S, NA
hitflag          = MAF
guardflag        = L
animtype         = Medium
priority         = 4, Hit
damage           = 47, 0
getpower = 30,15
pausetime        = 7, 7
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-10 * const(size.yscale))
hitsound         = S7, 4
guardsound       = S8, 1
ground.type      = Low
ground.slidetime = 17
ground.hittime   = 16
ground.velocity  = -5.5, 0
guard.ctrltime   = 15
air.type         = Low
air.hittime      = 16
air.velocity     = -3.0, -2.0
air.fall         = 1
fall.recover     = 1
fall.recovertime = 20
id               = 240

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 立強K
;------------------------------------------------------------------------------;
[Statedef 250]
type     = S
movetype = A
physics  = S
anim     = 250
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = Random < 350
value       = ifelse(var(50), 2, 0), 201 + (Random % 2)
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 6, 5

;-------[ Movement ]-------;

[State 200:             Pos, 1]
type     = PosAdd
trigger1 = AnimElem = 4
x        = Floor(32 * const(size.xscale))

;-------[ Effects ]-------;

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 6
attr             = S, NA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
priority         = 4, Hit
damage           = 96, 0
getpower = 30,15
pausetime        = 8, 8
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-73 * const(size.yscale))
hitsound         = S7, 5
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 20
ground.hittime   = 19
ground.velocity  = -6.0, 0
guard.ctrltime   = 18
air.type         = High
air.hittime      = 19
air.velocity     = -3.5, -2.5
air.fall         = 1
fall.recover     = 1
fall.recovertime = 20
id               = 250

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 立強K (立6強K)
;------------------------------------------------------------------------------;
[Statedef 255]
type     = S
movetype = A
physics  = S
anim     = 255
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 3
value       = ifelse(var(50), 2, 0), 210
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 6, 5

;-------[ Movement ]-------;

[State 200:             Pos, 1]
type     = VelSet
trigger1 = AnimElem = 4
x        = 3.0

;-------[ Effects ]-------;

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type                       = HitDef
trigger1                   = AnimElem = 4
attr                       = S, NA
hitflag                    = MAF
guardflag                  = M
animtype                   = Hard
priority                   = 4, Hit
damage                     = 53, 0
getpower = 30,15
pausetime                  = 8, 8
sparkno                    = S6000 + Random % 8
guard.sparkno              = S6060
sparkxy                    = -15, Floor(-40 * const(size.yscale))
hitsound                   = S7, 5
guardsound                 = S8, 1
ground.type                = Low
ground.slidetime           = 22
ground.hittime             = 21
ground.velocity            = -8.0, 0
ground.cornerpush.veloff   = 0
guard.ctrltime             = 20
guard.cornerpush.veloff    = 0
air.type                   = Low
air.hittime                = 21
air.velocity               = -5.5, -3.5
air.cornerpush.veloff      = 0
airguard.cornerpush.veloff = 0
air.fall                   = 1
fall.recover               = 1
fall.recovertime           = 25
id                         = 255

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;==============================================================================;
; 通常攻撃 (しゃがみ)
;==============================================================================;
;------------------------------------------------------------------------------;
; 屈弱P
;------------------------------------------------------------------------------;
[Statedef 400]
type     = C
movetype = A
physics  = C
anim     = 400
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 1
trigger1    = Random < 350
value       = ifelse(var(50), 2, 0), 200
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 2
value    = 6, 0

;-------[ Effects ]-------;

[State 200:             Effect]
type           = Explod
trigger1       = AnimElem = 2
anim           = 7008
id             = 7008
postype        = p1
pos            = Floor(8 * const(size.xscale)), Floor(-34 * const(size.yscale))
scale          = 0.75 * const(size.xscale), 0.75 * const(size.yscale)
ownpal         = 1
sprpriority    = -1
removeongethit = 1
ignorehitpause = 0

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 2
attr             = C, NA
hitflag          = MAF
guardflag        = L
animtype         = Light
priority         = 3, Hit
damage           = 31, 0
getpower = 30,15
pausetime        = 6, 6
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-32 * const(size.yscale))
hitsound         = S7, 0
guardsound       = S8, 1
ground.type      = Low
ground.slidetime = 16
ground.hittime   = 15
ground.velocity  = -3.0, 0
guard.ctrltime   = 14
air.type         = Low
air.hittime      = 15
air.velocity     = -2.5, -1.0
air.fall         = 1
fall.recover     = 1
fall.recovertime = 14
id               = 400

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1

;------------------------------------------------------------------------------;
; 屈中P
;------------------------------------------------------------------------------;
[Statedef 410]
type     = C
movetype = A
physics  = C
anim     = 410
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = Random < 350
value       = ifelse(var(50), 2, 0), 200 + (Random % 2)
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 6, 1

;-------[ Effects ]-------;

[State 200:             Effect]
type           = Explod
trigger1       = AnimElem = 4
anim           = 7003
id             = 7003
postype        = p1
pos            = Floor(-14 * const(size.xscale)), Floor(30 * const(size.yscale))
scale          = 0.8 * const(size.xscale), 0.8 * const(size.yscale)
ownpal         = 1
sprpriority    = -1
removeongethit = 1
ignorehitpause = 0

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 4
attr             = C, NA
hitflag          = MAF
guardflag        = L
animtype         = Medium
priority         = 4, Hit
damage           = 61, 0
getpower = 30,15
pausetime        = 7, 7
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-10 * const(size.yscale))
hitsound         = S7, 1
guardsound       = S8, 1
ground.type      = Low
ground.slidetime = 19
ground.hittime   = 18
ground.velocity  = -6.5, 0
guard.ctrltime   = 17
air.type         = Low
air.hittime      = 18
air.velocity     = -3.5, -2.5
air.fall         = 1
fall.recover     = 1
fall.recovertime = 20
id               = 410

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1

;------------------------------------------------------------------------------;
; 屈強P
;------------------------------------------------------------------------------;
[Statedef 420]
type     = C
movetype = A
physics  = C
anim     = 420
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 5
trigger1    = Random < 350
value       = ifelse(var(50), 2, 0), 201 + (Random % 3)
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 6
value    = 6, 2

;-------[ Movement ]-------;

[State 200:             Pos, 1]
type     = PosAdd
trigger1 = AnimElem = 3
x        = Floor(38 * const(size.xscale))

;-------[ Effects ]-------;

[State 200:             Effect]
type           = Explod
trigger1       = AnimElem = 6
anim           = 7004
id             = 7004
postype        = p1
pos            = 0, 0
scale          = const(size.xscale), const(size.yscale)
ownpal         = 1
sprpriority    = 3
removeongethit = 1
ignorehitpause = 0

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 7
attr             = C, NA
hitflag          = MAF
guardflag        = L
animtype         = Hard
priority         = 4, Hit
damage           = 79, 0
getpower = 30,15
pausetime        = 8, 8
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-15 * const(size.yscale))
hitsound         = S7, 2
guardsound       = S8, 1
ground.type      = Trip
ground.slidetime = 21
ground.hittime   = 20
ground.velocity  = -4.0, -4
guard.ctrltime   = 19
guard.velocity   = -7
air.type         = Low
air.hittime      = 20
air.velocity     = -3, -2.5
fall             = 1
air.fall         = 1
fall.recover     = 0
id               = 420

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1

;------------------------------------------------------------------------------;
; 屈弱K
;------------------------------------------------------------------------------;
[Statedef 430]
type     = C
movetype = A
physics  = C
anim     = 430
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = Random < 350
value       = ifelse(var(50), 2, 0), 200
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 6, 3

;-------[ Movement ]-------;

;-------[ Effects ]-------;

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 4
attr             = C, NA
hitflag          = MAF
guardflag        = L
animtype         = Light
priority         = 3, Hit
damage           = 25, 0
getpower = 30,15
pausetime        = 6, 6
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-10 * const(size.yscale))
hitsound         = S7, 3
guardsound       = S8, 1
ground.type      = Low
ground.slidetime = 12
ground.hittime   = 11
ground.velocity  = -4.0, 0
guard.ctrltime   = 10
guard.velocity   = -7
air.type         = Low
air.hittime      = 20
air.velocity     = -2, -1.5
fall             = 0
air.fall         = 1
fall.recover     = 1
fall.recovertime = 15
id               = 430

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1

;------------------------------------------------------------------------------;
; 屈中K
;------------------------------------------------------------------------------;
[Statedef 440]
type     = C
movetype = A
physics  = C
anim     = 440
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = Random < 350
value       = ifelse(var(50), 2, 0), 200 + (Random % 3)
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 3
value    = 6, 4

;-------[ Movement ]-------;

[State 200:             Vel, 1]
type     = VelSet
trigger1 = AnimElem = 3
x        = 3

[State 200:             Pos, 1]
type     = PosAdd
trigger1 = AnimElem = 8
x        = Floor(30 * const(size.xscale))

;-------[ Effects ]-------;

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 4
attr             = C, NA
hitflag          = MAF
guardflag        = M
animtype         = Medium
priority         = 4, Hit
damage           = 57, 0
getpower = 30,15
pausetime        = 7, 7
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-40 * const(size.yscale))
hitsound         = S7, 4
guardsound       = S8, 1
ground.type      = Low
ground.slidetime = 18
ground.hittime   = 17
ground.velocity  = -7.0, 0
guard.ctrltime   = 16
guard.velocity   = -7
air.type         = Low
air.hittime      = 17
air.velocity     = -3, -2.5
fall             = 0
air.fall         = 1
fall.recover     = 1
fall.recovertime = 25
id               = 440

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1

;------------------------------------------------------------------------------;
; 屈強K
;------------------------------------------------------------------------------;
[Statedef 450]
type     = C
movetype = A
physics  = C
anim     = 450
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = Random < 350
value       = ifelse(var(50), 2, 0), 201 + (Random % 3)
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 3
value    = 6, 5

;-------[ Movement ]-------;

[State 200:             Pos, 1]
type     = PosAdd
trigger1 = AnimElem = 5
x        = Floor(15 * const(size.xscale))

;-------[ Effects ]-------;

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 5
attr             = C, NA
hitflag          = MAF
guardflag        = L
animtype         = Hard
priority         = 4, Hit
damage           = 79, 0
getpower = 30,15
pausetime        = 8, 8
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-5 * const(size.yscale))
hitsound         = S7, 5
guardsound       = S8, 1
ground.type      = Trip
ground.slidetime = 21
ground.hittime   = 20
ground.velocity  = -2.0, -5
guard.ctrltime   = 19
guard.velocity   = -7
air.type         = Low
air.hittime      = 20
air.velocity     = -3, -2.5
fall             = 1
air.fall         = 1
fall.recover     = 0
id               = 450

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 11
ctrl     = 1


;==============================================================================;
; 通常攻撃 (空中)
;==============================================================================;
;------------------------------------------------------------------------------;
; 空弱P
;------------------------------------------------------------------------------;
[Statedef 600]
type     = A
movetype = A
physics  = A
anim     = 600
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 1
trigger1    = Random < 350
value       = ifelse(var(50), 2, 0), 200
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 2
value    = 6, 0

;-------[ Effects ]-------;

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 2
attr             = A, NA
hitflag          = MAF
guardflag        = HA
animtype         = Light
priority         = 3, Hit
damage           = 27, 0
getpower = 30,15
pausetime        = 6, 6
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-70 * const(size.yscale))
hitsound         = S7, 0
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 14
ground.hittime   = 13
ground.velocity  = -4.0, 0
guard.ctrltime   = 12
air.type         = High
air.hittime      = 13
air.velocity     = -3, -2
air.fall         = 1
fall.recover     = 1
fall.recovertime = 15
id               = 600

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 51
ctrl     = 1

;------------------------------------------------------------------------------;
; 空中P
;------------------------------------------------------------------------------;
[Statedef 610]
type     = A
movetype = A
physics  = A
anim     = 610
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 4
trigger1    = Random < 350
value       = ifelse(var(50), 2, 0), 200 + (Random % 3)
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 6, 1

;-------[ Effects ]-------;

[State 200:             Effect]
type           = Explod
trigger1       = AnimElem = 4
anim           = 7005
id             = 7005
postype        = p1
pos            = 0, 0
scale          = const(size.xscale), const(size.yscale)
ownpal         = 1
sprpriority    = 3
bindtime       = -1
removeongethit = 1
ignorehitpause = 0

[State 200:             Effect]
type           = Explod
trigger1       = AnimElem = 4
anim           = 7005
id             = 7005
postype        = p1
pos            = 0, 0
scale          = const(size.xscale), const(size.yscale)
ownpal         = 1
facing         = -1
bindtime       = -1
sprpriority    = 3
removeongethit = 1
ignorehitpause = 0

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 5
attr             = A, NA
hitflag          = MAF
guardflag        = HA
animtype         = Medium
priority         = 4, Hit
damage           = 53, 0
getpower = 30,15
pausetime        = 7, 7
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-70 * const(size.yscale))
hitsound         = S7, 0
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 18
ground.hittime   = 17
ground.velocity  = -6.0, 0
guard.ctrltime   = 16
air.type         = High
air.hittime      = 17
air.velocity     = -4, -3
air.fall         = 1
fall.recover     = 1
fall.recovertime = 20
id               = 610

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 51
ctrl     = 1

;------------------------------------------------------------------------------;
; 空強P
;------------------------------------------------------------------------------;
[Statedef 620]
type     = A
movetype = A
physics  = A
anim     = 620
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 5
trigger1    = Random < 350
value       = ifelse(var(50), 2, 0), 201 + (Random % 2)
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 5
value    = 6, 2

;-------[ Effects ]-------;

[State 200:             Effect]
type           = Explod
trigger1       = AnimElem = 5
anim           = 7002
id             = 7002
postype        = p1
pos            = Floor(-15 * const(size.xscale)), 0
scale          = const(size.xscale), const(size.yscale)
ownpal         = 1
sprpriority    = 3
bindtime       = -1
removeongethit = 1
ignorehitpause = 0

[State 200:             Effect]
type           = Explod
trigger1       = AnimElem = 5
anim           = 7006
id             = 7006
postype        = p1
pos            = Floor(20 * const(size.xscale)), 0
scale          = const(size.xscale), const(size.yscale)
ownpal         = 1
bindtime       = -1
sprpriority    = 3
removeongethit = 1
ignorehitpause = 0

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 5
attr             = A, NA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
priority         = 4, Hit
damage           = 91, 0
getpower = 30,15
pausetime        = 8, 8
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-50 * const(size.yscale))
hitsound         = S7, 2
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 19
ground.hittime   = 18
ground.velocity  = -7.0, 0
guard.ctrltime   = 17
air.type         = High
air.hittime      = 18
air.velocity     = -5, -3
air.fall         = 1
fall.recover     = 1
fall.recovertime = 21
id               = 620

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 51
ctrl     = 1

;------------------------------------------------------------------------------;
; 空弱K
;------------------------------------------------------------------------------;
[Statedef 630]
type     = A
movetype = A
physics  = A
anim     = 630
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 1
trigger1    = Random < 350
value       = ifelse(var(50), 2, 0), 200
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 2
value    = 6, 3

;-------[ Effects ]-------;

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 2
attr             = A, NA
hitflag          = MAF
guardflag        = HA
animtype         = Light
priority         = 3, Hit
damage           = 31, 0
getpower = 30,15
pausetime        = 6, 6
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-35 * const(size.yscale))
hitsound         = S7, 3
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 15
ground.hittime   = 14
ground.velocity  = -4.5, 0
guard.ctrltime   = 13
air.type         = High
air.hittime      = 14
air.velocity     = -3.5, -2.2
air.fall         = 1
fall.recover     = 1
fall.recovertime = 20
id               = 630

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 51
ctrl     = 1

;------------------------------------------------------------------------------;
; 空中K
;------------------------------------------------------------------------------;
[Statedef 640]
type     = A
movetype = A
physics  = A
anim     = 640
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = Random < 350
value       = ifelse(var(50), 2, 0), 200 + (Random % 3)
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 3
value    = 6, 4

;-------[ Effects ]-------;

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 4
attr             = A, NA
hitflag          = MAF
guardflag        = HA
animtype         = Light
priority         = 4, Hit
damage           = 58, 0
getpower = 30,15
pausetime        = 7, 7
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-80 * const(size.yscale))
hitsound         = S7, 4
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 17
ground.hittime   = 16
ground.velocity  = -6.5, 0
guard.ctrltime   = 15
air.type         = High
air.hittime      = 16
air.velocity     = -2.0, -4.0
air.fall         = 1
fall.recover     = 1
fall.recovertime = 25
id               = 640

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 51
ctrl     = 1

;------------------------------------------------------------------------------;
; 空強K
;------------------------------------------------------------------------------;
[Statedef 650]
type     = A
movetype = A
physics  = N
anim     = 650
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 0, 1)

;-------[ Sounds ]-------;

[State 200:             Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 5
value       = ifelse(var(50), 2, 0), 203
channel     = 0
volume      = ifelse(var(50), 255, 127)
lowpriority = 1

[State 200:             SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 5
value    = 6, 5

;-------[ Movement ]-------;

[State 200:             State Type, 1]
type      = StateTypeSet
trigger1  = AnimElem = 6
statetype = A
movetype  = A
physics   = A

[State 200:             State Type, 2]
type      = StateTypeSet
trigger1  = AnimElem = 8
statetype = A
movetype  = I
physics   = A

[State 200:             Vel, 1]
type     = VelMul
trigger1 = AnimElemTime(5) < 0
x        = 0.9
y        = 0.9

;-------[ Effects ]-------;

;-------[ Hit Defs ]-------;

[State 200:             Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 6
attr             = A, NA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
priority         = 4, Hit
damage           = 79, 0
getpower = 30,15
pausetime        = 8, 8
sparkno          = S6000 + Random % 8
guard.sparkno    = S6060
sparkxy          = -15, Floor(-30 * const(size.yscale))
hitsound         = S7, 5
guardsound       = S8, 1
ground.type      = Low
ground.slidetime = 20
ground.hittime   = 19
ground.velocity  = -7.0, 0
guard.ctrltime   = 18
air.type         = Low
air.hittime      = 19
air.velocity     = -4, 4
air.fall         = 1
fall.recover     = 0
id               = 650

;-------[ States ]-------;

[State 200:             Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 51
ctrl     = 1


;==============================================================================;
; 投げ
;==============================================================================;
;------------------------------------------------------------------------------;
; 地上投げ
;------------------------------------------------------------------------------;
[Statedef 500]
type     = S
movetype = A
physics  = S
anim     = 500
ctrl     = 0
velset   = 0, 0

;-------[ Movement ]-------;

[State 500:         Attack Dist]
type     = AttackDist
trigger1 = 1
value    = 0

;-------[ Sounds ]-------;

[State 500:         Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 5
trigger1 = !var(50)
value    = 0, 520
channel  = 0
volume   = 127

[State 500:         Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 5
trigger1 = var(50)
value    = 2, 520 + (Random % 2)
channel  = 0
volume   = 255

;-------[ Hit Defs ]-------;

[State 500:         Hit Def]
type          = HitDef
triggerall    = AnimElem = 4
trigger1      = !NumTarget
trigger2      = NumTarget
trigger2      = Target,StateNo != [140, 159]
attr          = S, NT
hitflag       = M
guardflag     =
animtype      = Light
priority      = 1, Miss
damage        = 0, 0
getpower = 60,30
sparkno       = -1
guard.sparkno = -1
sparkxy       = 0, 0
hitsound      = S7, 31
guardsound    = -1
ground.type   = High
p1stateno     = 501
p1facing      = ifelse(command = "holdback", -1, 1)
p2facing      = 1
p2stateno     = 4990
numhits       = 0
id            = 500

;-------[ States ]-------;

[State 500:         Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 地上投げ 成立
;
; var(43)   : 投げぬけされたフラグ
;------------------------------------------------------------------------------;
[Statedef 501]
type        = S
movetype    = I
physics     = S
anim        = 501
ctrl        = 0
velset      = 0, 0
sprpriority = 1

;-------[ 投げ抜け ]-------;

[State 501:         Reset]
type     = VarSet
trigger1 = Time = 0
trigger2 = AnimElem = 2
v        = 43
value    = 0

[State 501:         Release]
type       = VarSet
triggerall = NumTarget(500)
triggerall = AnimElemTime(2) < 0
triggerall = Target(500),command = "holdback"
trigger1   = Target(500),command = "a"
trigger2   = Target(500),command = "b"
trigger3   = Target(500),command = "c"
trigger4   = Target(500),command = "x"
trigger5   = Target(500),command = "y"
trigger6   = Target(500),command = "z"
v          = 43
value      = 1

[State 501:         Release Target]
type     = TargetState
trigger1 = NumTarget(500)
trigger1 = var(43)
value    = 5940
id       = 500

[State 501:         Release Self]
type     = ChangeState
trigger1 = NumTarget(500)
trigger1 = var(43)
value    = 5945

;-------[ Movement ]-------;

[State 500:         Edge]
type     = Width
trigger1 = AnimElemTime(12) < 0
edge     = Floor(50 * const(size.xscale)), 0

[State 500:         Power]
type     = PowerAdd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 6
trigger3 = AnimElem = 7
trigger4 = AnimElem = 8
trigger5 = AnimElem = 9
trigger6 = AnimElem = 10
trigger7 = AnimElem = 11
value    = Ceil(12 * fvar(11))

;-------[ Sounds ]-------;

[State 500:         Voice, 1]
type     = PlaySnd
trigger1 = AnimElem = 1
value    = ifelse(var(50), 2, 0), 500 + (Random % 2)
channel  = 0
volume   = ifelse(var(50), 255, 127)

[State 500:         Hit Sound]
type     = PlaySnd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 6
trigger3 = AnimElem = 7
trigger4 = AnimElem = 8
trigger5 = AnimElem = 9
trigger6 = AnimElem = 10
trigger7 = AnimElem = 11
value    = 7, (Random % 6)

;-------[ Effects ]-------;

[State 500:         Sparks]
type        = Explod
trigger1    = AnimElem = 5
trigger2    = AnimElem = 6
trigger3    = AnimElem = 7
trigger4    = AnimElem = 8
trigger5    = AnimElem = 9
trigger6    = AnimElem = 10
trigger7    = AnimElem = 11
anim        = 6000 + Random % 8
id          = 6000
postype     = p1
pos         = Floor(55 * const(size.xscale)), Floor(-84 * const(size.yscale))
ownpal      = 1
ontop       = 1
sprpriority = 100

;-------[ Target ]-------;

[State 500:         State, 1]
type     = TargetState
trigger1 = Time = 0
id       = 500
value    = 4000

[State 500:         Bind, 1]
type     = TargetBind
trigger1 = AnimElemTime(12) < 0
id       = 500
pos      = Floor(55 * const(size.xscale)), Floor(-84 * const(size.yscale))

[State 500:         Life, 1]
type     = TargetLifeAdd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 6
trigger3 = AnimElem = 7
trigger4 = AnimElem = 8
trigger5 = AnimElem = 9
trigger6 = AnimElem = 10
value    = Floor(-17.4 * fvar(11))
kill     = 0
id       = 500

[State 500:         Life, 2]
type     = TargetLifeAdd
trigger1 = AnimElem = 11
value    = Floor(-17.4 * fvar(11))
kill     = 1
id       = 500

[State 500:         Power, 1]
type     = TargetPowerAdd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 6
trigger3 = AnimElem = 7
trigger4 = AnimElem = 8
trigger5 = AnimElem = 9
trigger6 = AnimElem = 10
trigger7 = AnimElem = 11
value    = Ceil(35 * fvar(11))
id       = 500

[State 500:         Hit Count]
type     = HitAdd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 6
trigger3 = AnimElem = 7
trigger4 = AnimElem = 8
trigger5 = AnimElem = 9
trigger6 = AnimElem = 10
trigger7 = AnimElem = 11
value    = 1

;-------[ States ]-------;

[State 500:         Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 空中投げ
;------------------------------------------------------------------------------;
[Statedef 510]
type     = A
movetype = A
physics  = A
anim     = 510
ctrl     = 0

;-------[ Movement ]-------;

[State 500:         Attack Dist]
type     = AttackDist
trigger1 = 1
value    = 0

;-------[ Sounds ]-------;

[State 500:         Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 4
trigger1 = !var(50)
value    = 0, 520
channel  = 0
volume   = 127

[State 500:         Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 4
trigger1 = var(50)
value    = 2, 520 + (Random % 2)
channel  = 0
volume   = 255

;-------[ Hit Defs ]-------;

[State 500:         Hit Def]
type          = HitDef
triggerall    = AnimElem = 3
trigger1      = !NumTarget
trigger2      = NumTarget
trigger2      = Target,StateNo != [140, 159]
attr          = A, NT
hitflag       = AF
guardflag     =
animtype      = Light
priority      = 1, Miss
damage        = 0, 0
getpower = 60,30
sparkno       = -1
guard.sparkno = -1
sparkxy       = 0, 0
hitsound      = S7, 31
guardsound    = -1
ground.type   = High
p1stateno     = 511
p1facing      = ifelse(command = "holdback", -1, 1)
p2facing      = 1
p2stateno     = 4990
numhits       = 0
id            = 510
fall.damage   = 27

;-------[ States ]-------;

[State 500:         Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 51
ctrl     = 1

;------------------------------------------------------------------------------;
; 空中投げ 成立
;------------------------------------------------------------------------------;
[Statedef 511]
type     = A
movetype = I
physics  = N
anim     = 511
ctrl     = 0
velset   = 0, 0

;-------[ Movement ]-------;

[State 511:         Vel, 1]
type     = VelSet
trigger1 = AnimElem = 9
x        = -2
y        = -5

[State 511:         Gravity, 1]
type     = Gravity
trigger1 = AnimElemTime(9) > 0

[State 511:         Self Power, 1]
type     = PowerAdd
trigger1 = AnimElem = 3
value    = Ceil(100 * fvar(11))
id       = 510

;-------[ Sounds ]-------;

[State 500:         Voice, 1]
type     = PlaySnd
trigger1 = AnimElem = 1
value    = ifelse(var(50), 2, 0), 500 + (Random % 2)
channel  = 0
volume   = ifelse(var(50), 255, 127)

[State 511:         SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 3
value    = 4, 10

[State 511:         SE, 2]
type     = PlaySnd
trigger1 = AnimElem = 8
value    = 6, 2

;-------[ Effects ]-------;

[State 511:         Fire]
type        = Explod
trigger1    = AnimElem = 1
anim        = 7009
id          = 7009
postype     = p1
pos         = Floor(9 * const(size.xscale)), Floor(-100 * const(size.yscale))
scale       = const(size.xscale), const(size.yscale)
ownpal      = 1
sprpriority = 2

;-------[ Burn Spark ]-------;

[State 511:             Fire, 1]
type             = Helper
triggerall       = AnimElem = 3
trigger1         = NumTarget(510)
trigger1         = !NumHelper(6070 + 510)
helpertype       = Normal
name             = "Fire"
stateno          = 6070
id               = 6070 + 510
postype          = p1
pos              = 0, 0
size.height      = Target(510),ID
size.xscale      = const(size.xscale)
size.yscale      = const(size.yscale)
size.ground.back = 48
ownpal           = 1

;-------[ Target ]-------;

[State 511:         State, 1]
type     = TargetState
trigger1 = Time = 0
id       = 510
value    = 4010

[State 511:         Bind]
type     = TargetBind
trigger1 = AnimElemTime(1) >= 0
trigger1 = AnimElemTime(7) < 0
id       = 510
pos      = Floor(9 * const(size.xscale)), Floor(-100 * const(size.yscale))

[State 511:         Bind, 2]
type     = TargetBind
trigger1 = AnimElem = 7
id       = 510
pos      = Floor(-14 * const(size.xscale)), Floor(-74 * const(size.yscale))

[State 511:         Vel, 1]
type     = TargetVelSet
trigger1 = AnimElem = 9
x        = -5
y        = 12
id       = 510

[State 511:         Damage, 1]
type     = TargetLifeAdd
trigger1 = AnimElem = 3
value    = Floor(-60 * fvar(11))
kill     = 1
id       = 510

[State 511:         Power, 1]
type     = TargetPowerAdd
trigger1 = AnimElem = 3
value    = Ceil(120 * fvar(11))
id       = 510

;-------[ States ]-------;

[State 511:         Landing]
type       = ChangeState
triggerall = AnimElemTime(9) > 0
trigger1   = Vel Y > 0
trigger1   = Pos Y >= 0
value      = 52
ctrl       = 0


;==============================================================================;
; Last Revision : $Rev$
; Last Modified : $Date$
;==============================================================================;
