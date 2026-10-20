; vim: set ts=4 sw=4 sts=4 expandtab: =========================================;
;                         [ 遠野秋葉 from MELTY BLOOD ]                        ;
;==============================================================================;

;==============================================================================;
; 鳥を渦切る
;==============================================================================;
;------------------------------------------------------------------------------;
; 鳥を渦切る (地上 / 弱)
;------------------------------------------------------------------------------;
[Statedef 1000]
type     = S
movetype = A
physics  = S
anim     = 1000
ctrl     = 0

;-------[ Movement ]-------;

;-------[ Sounds ]--------;

[State 1000:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 5
trigger1 = !var(50)
value    = 0, 1000
channel  = 0
volume   = 127

[State 1000:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 5
trigger1 = var(50)
value    = 2, 1000 + (Random % 2)
channel  = 0
volume   = 255

;-------[ Projectiles ]-------;

[State 1000:            Projectile, 1]
type        = Helper
trigger1    = AnimElem = 5
helpertype  = Normal
name        = "Eddy off Birds"
stateno     = 7040
id          = 7040
ownpal      = 1
postype     = p1
pos         = Floor(-15 * const(size.xscale)), Floor(-45 * const(size.yscale))
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ Hit Pause ]-------;

[State 1000:            Hit Pause]
type           = ChangeAnim
trigger1       = NumHelper(7040)
trigger1       = Helper(7040),HitPauseTime
value          = Anim
elem           = AnimElemNo(0)
ignorehitpause = 1
persistent     = 1

;-------[ States ]--------;

[State 1000:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 鳥を渦切る (地上 / 中)
;------------------------------------------------------------------------------;
[Statedef 1001]
type     = S
movetype = A
physics  = S
anim     = 1001
ctrl     = 0

;-------[ Movement ]-------;

;-------[ Sounds ]--------;

[State 1000:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 5
trigger1 = !var(50)
value    = 0, 1000
channel  = 0
volume   = 127

[State 1000:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 5
trigger1 = var(50)
value    = 2, 1000 + (Random % 2)
channel  = 0
volume   = 255

;-------[ Projectiles ]-------;

[State 1000:            Projectile, 1]
type        = Helper
trigger1    = AnimElem = 5
helpertype  = Normal
name        = "Eddy off Birds"
stateno     = 7040
id          = 7041
ownpal      = 1
postype     = p1
pos         = Floor(-15 * const(size.xscale)), Floor(-45 * const(size.yscale))
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ Hit Pause ]-------;

[State 1000:            Hit Pause]
type           = ChangeAnim
trigger1       = NumHelper(7041)
trigger1       = Helper(7041),HitPauseTime
value          = Anim
elem           = AnimElemNo(0)
ignorehitpause = 1
persistent     = 1

;-------[ States ]--------;

[State 1000:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 鳥を渦切る (地上 / 強)
;------------------------------------------------------------------------------;
[Statedef 1002]
type     = S
movetype = A
physics  = S
anim     = 1002
ctrl     = 0

;-------[ Movement ]-------;

;-------[ Sounds ]--------;

[State 1000:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 5
trigger1 = !var(50)
value    = 0, 1000
channel  = 0
volume   = 127

[State 1000:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 5
trigger1 = var(50)
value    = 2, 1000 + (Random % 2)
channel  = 0
volume   = 255

;-------[ Projectiles ]-------;

[State 1000:            Projectile, 1]
type        = Helper
trigger1    = AnimElem = 5
helpertype  = Normal
name        = "Eddy off Birds"
stateno     = 7040
id          = 7042
ownpal      = 1
postype     = p1
pos         = Floor(-15 * const(size.xscale)), Floor(-45 * const(size.yscale))
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ Hit Pause ]-------;

[State 1000:            Hit Pause]
type           = ChangeAnim
trigger1       = NumHelper(7042)
trigger1       = Helper(7042),HitPauseTime
value          = Anim
elem           = AnimElemNo(0)
ignorehitpause = 1
persistent     = 1

;-------[ States ]--------;

[State 1000:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 鳥を渦切る (空中 / 弱)
;------------------------------------------------------------------------------;
[Statedef 1010]
type     = A
movetype = A
physics  = N
anim     = 1010
ctrl     = 0
velset   = 0, 0

;-------[ Movement ]-------;

[State 1010:            Vel, 1]
type     = VelSet
trigger1 = AnimElem = 3
x        = -3
y        = -3

[State 1010:            Gravity]
type       = Gravity
triggerall = AnimElemTime(5) > 0
trigger1   = !NumHelper(7040)
trigger2   = NumHelper(7040)
trigger2   = !(Helper(7040),HitPauseTime)

;-------[ Sounds ]--------;

[State 1000:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 2
trigger1 = !var(50)
value    = 0, 1001
channel  = 0
volume   = 127

[State 1000:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 2
trigger1 = var(50)
value    = 2, 1000 + (Random % 2)
channel  = 0
volume   = 255

;-------[ Projectiles ]-------;

[State 1000:            Projectile, 1]
type        = Helper
trigger1    = AnimElem = 2
helpertype  = Normal
name        = "Eddy off Birds"
stateno     = 7040
id          = 7040
ownpal      = 1
postype     = p1
pos         = Floor(-15 * const(size.xscale)), Floor(-55 * const(size.yscale))
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ Hit Pause ]-------;

[State 1000:            Hit Pause]
type           = ChangeAnim
trigger1       = NumHelper(7040)
trigger1       = Helper(7040),HitPauseTime
value          = Anim
elem           = AnimElemNo(0)
ignorehitpause = 1
persistent     = 1

[State 1000:            Hit Pause Pos]
type           = PosFreeze
trigger1       = NumHelper(7040)
trigger1       = Helper(7040),HitPauseTime
ignorehitpause = 1
persistent     = 1

;-------[ States ]--------;

[State 1010:            Fall]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 1015
ctrl     = 0

;------------------------------------------------------------------------------;
; 鳥を渦切る (空中 / 中)
;------------------------------------------------------------------------------;
[Statedef 1011]
type     = A
movetype = A
physics  = N
anim     = 1011
ctrl     = 0
velset   = 0, 0

;-------[ Movement ]-------;

[State 1010:            Vel, 1]
type     = VelSet
trigger1 = AnimElem = 3
x        = -3
y        = -3

[State 1010:            Gravity]
type       = Gravity
triggerall = AnimElemTime(5) > 0
trigger1   = !NumHelper(7041)
trigger2   = NumHelper(7041)
trigger2   = !(Helper(7041),HitPauseTime)

;-------[ Sounds ]--------;

[State 1000:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 2
trigger1 = !var(50)
value    = 0, 1001
channel  = 0
volume   = 127

[State 1000:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 2
trigger1 = var(50)
value    = 2, 1000 + (Random % 2)
channel  = 0
volume   = 255

;-------[ Projectiles ]-------;

[State 1000:            Projectile, 1]
type        = Helper
trigger1    = AnimElem = 2
helpertype  = Normal
name        = "Eddy off Birds"
stateno     = 7040
id          = 7041
ownpal      = 1
postype     = p1
pos         = Floor(-15 * const(size.xscale)), Floor(-55 * const(size.yscale))
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ Hit Pause ]-------;

[State 1000:            Hit Pause]
type           = ChangeAnim
trigger1       = NumHelper(7041)
trigger1       = Helper(7041),HitPauseTime
value          = Anim
elem           = AnimElemNo(0)
ignorehitpause = 1
persistent     = 1

[State 1000:            Hit Pause Pos]
type           = PosFreeze
trigger1       = NumHelper(7041)
trigger1       = Helper(7041),HitPauseTime
ignorehitpause = 1
persistent     = 1

;-------[ States ]--------;

[State 1010:            Fall]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 1015
ctrl     = 0

;------------------------------------------------------------------------------;
; 鳥を渦切る (空中 / 強)
;------------------------------------------------------------------------------;
[Statedef 1012]
type     = A
movetype = A
physics  = N
anim     = 1012
ctrl     = 0
velset   = 0, 0

;-------[ Movement ]-------;

[State 1010:            Vel, 1]
type     = VelSet
trigger1 = AnimElem = 3
x        = -3
y        = -3

[State 1010:            Gravity]
type       = Gravity
triggerall = AnimElemTime(5) > 0
trigger1   = !NumHelper(7042)
trigger2   = NumHelper(7042)
trigger2   = !(Helper(7042),HitPauseTime)

;-------[ Sounds ]--------;

[State 1000:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 2
trigger1 = !var(50)
value    = 0, 1001
channel  = 0
volume   = 127

[State 1000:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 2
trigger1 = var(50)
value    = 2, 1000 + (Random % 2)
channel  = 0
volume   = 255

;-------[ Projectiles ]-------;

[State 1000:            Projectile, 1]
type        = Helper
trigger1    = AnimElem = 2
helpertype  = Normal
name        = "Eddy off Birds"
stateno     = 7040
id          = 7042
ownpal      = 1
postype     = p1
pos         = Floor(-15 * const(size.xscale)), Floor(-55 * const(size.yscale))
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ Hit Pause ]-------;

[State 1000:            Hit Pause]
type           = ChangeAnim
trigger1       = NumHelper(7042)
trigger1       = Helper(7042),HitPauseTime
value          = Anim
elem           = AnimElemNo(0)
ignorehitpause = 1
persistent     = 1

[State 1000:            Hit Pause Pos]
type           = PosFreeze
trigger1       = NumHelper(7042)
trigger1       = Helper(7042),HitPauseTime
ignorehitpause = 1
persistent     = 1

;-------[ States ]--------;

[State 1010:            Fall]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 1015
ctrl     = 0

;------------------------------------------------------------------------------;
; 鳥を渦切る (空中) 落下
;------------------------------------------------------------------------------;
[Statedef 1015]
type     = A
movetype = I
physics  = A
ctrl     = 0

;-------[ Anim ]-------;

[State 1015:            Fall Anim]
type     = ChangeAnim
trigger1 = Time = 0
value    = 46
elem     = 2


;==============================================================================;
; 獣を焦がす
;==============================================================================;
;------------------------------------------------------------------------------;
; 獣を焦がす (地上 / 弱)
;------------------------------------------------------------------------------;
[Statedef 1020]
type     = S
movetype = I
physics  = S
anim     = 1020
ctrl     = 0
velset   = 0, 0

;-------[ Sounds ]-------;

[State 1020:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = !var(50)
value    = 1, 1010
channel  = 0
volume   = 127

[State 1020:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = var(50)
value    = 2, 1020 + (Random % 2)
channel  = 0
volume   = 255

;-------[ Movement ]-------;

[State 1020:            Type, 1]
type      = StateTypeSet
trigger1  = AnimElem = 5
statetype = A
movetype  = I
physics   = N

[State 1020:            Vel, 1]
type     = VelSet
trigger1 = AnimElem = 6
x        = -2.0
y        = -3.5

[State 1020:            Vel, 2, Gravity]
type     = Gravity
trigger1 = AnimElemTime(6) > 0

;-------[ Projectiles ]-------;

[State 1020:            Landmine]
type        = Helper
trigger1    = AnimElem = 6
name        = "Landmine"
stateno     = 7050
id          = 7050
postype     = p1
pos         = Floor(60 * const(size.xscale)), 0
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1020:            Landing]
type       = ChangeState
triggerall = AnimElemTime(6) > 0
trigger1   = Vel Y > 0
trigger1   = Pos Y >= 0
value      = 1024

;------------------------------------------------------------------------------;
; 獣を焦がす (地上 / 中)
;------------------------------------------------------------------------------;
[Statedef 1021]
type     = S
movetype = I
physics  = S
anim     = 1020
ctrl     = 0
velset   = 0, 0

;-------[ Sounds ]-------;

[State 1020:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = !var(50)
value    = 1, 1010
channel  = 0
volume   = 127

[State 1020:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = var(50)
value    = 2, 1020 + (Random % 2)
channel  = 0
volume   = 255

;-------[ Movement ]-------;

[State 1020:            Type, 1]
type      = StateTypeSet
trigger1  = AnimElem = 5
statetype = A
movetype  = I
physics   = N

[State 1020:            Vel, 1]
type     = VelSet
trigger1 = AnimElem = 6
x        = -2.0
y        = -3.5

[State 1020:            Vel, 2, Gravity]
type     = Gravity
trigger1 = AnimElemTime(6) > 0

;-------[ Projectiles ]-------;

[State 1020:            Landmine]
type        = Helper
trigger1    = AnimElem = 6
name        = "Landmine"
stateno     = 7050
id          = 7050
postype     = p1
pos         = Floor(120 * const(size.xscale)), 0
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1020:            Landing]
type       = ChangeState
triggerall = AnimElemTime(6) > 0
trigger1   = Vel Y > 0
trigger1   = Pos Y >= 0
value      = 1024

;------------------------------------------------------------------------------;
; 獣を焦がす (地上 / 強)
;------------------------------------------------------------------------------;
[Statedef 1022]
type     = S
movetype = I
physics  = S
anim     = 1020
ctrl     = 0
velset   = 0, 0

;-------[ Sounds ]-------;

[State 1020:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = !var(50)
value    = 1, 1010
channel  = 0
volume   = 127

[State 1020:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = var(50)
value    = 2, 1020 + (Random % 2)
channel  = 0
volume   = 255

;-------[ Movement ]-------;

[State 1020:            Type, 1]
type      = StateTypeSet
trigger1  = AnimElem = 5
statetype = A
movetype  = I
physics   = N

[State 1020:            Vel, 1]
type     = VelSet
trigger1 = AnimElem = 6
x        = -2.0
y        = -3.5

[State 1020:            Vel, 2, Gravity]
type     = Gravity
trigger1 = AnimElemTime(6) > 0

;-------[ Projectiles ]-------;

[State 1020:            Landmine]
type        = Helper
trigger1    = AnimElem = 6
name        = "Landmne"
stateno     = 7050
id          = 7050
postype     = p1
pos         = Floor(180 * const(size.xscale)), 0
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1020:            Landing]
type       = ChangeState
triggerall = AnimElemTime(6) > 0
trigger1   = Vel Y > 0
trigger1   = Pos Y >= 0
value      = 1024

;------------------------------------------------------------------------------;
; 獣を焦がす 着地
;------------------------------------------------------------------------------;
[Statedef 1024]
type     = S
movetype = I
physics  = S
anim     = 1021
ctrl     = 0

;-------[ Movement ]-------;

[State 52:          Vel, 1]
type     = VelSet
trigger1 = Time = 0
y        = 0

[State 52:          Pos, 1]
type     = PosSet
trigger1 = Time = 0
y        = 0

;-------[ Sounds ]-------;

[State 106:         SE, 1]
type     = PlaySnd
trigger1 = Time = 0
value    = 9, 3

;-------[ Effects ]-------;

[State 106:         Dust]
type        = Explod
trigger1    = Time = 0
anim        = 6201
postype     = p1
pos         = 0, 0
sprpriority = -5
scale       = 0.5 * const(size.xscale), 0.5 * const(size.yscale)
ownpal      = 1

;-------[ States ]-------;

[State 52:          ChangeState, Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 獣を焦がす 発動
;------------------------------------------------------------------------------;
[Statedef 1025]
type     = S
movetype = I
physics  = S
anim     = 1025
ctrl     = 0
velset   = 0,0

;-------[ Sounds ]-------;

[State 1025:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = !var(50)
trigger1 = !NumHelper(7055)
value    = 1, 1011
channel  = 0
volume   = 127

[State 1025:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = var(50)
trigger1 = !NumHelper(7055)
value    = 2, 1022
channel  = 0
volume   = 255

[State 1025:            Voice, 2, Ex, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 5
trigger1 = !var(50)
trigger1 = NumHelper(7055)
value    = 0, 2011
channel  = 0
volume   = 127

[State 1025:            Voice, 2, Ex, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 5
trigger1 = var(50)
trigger1 = NumHelper(7055)
value    = 2, 2010 + (Random % 2)
channel  = 0
volume   = 255

;-------[ States ]-------;

[State 1025:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 獣を焦がす (空中 / 弱)
;------------------------------------------------------------------------------;
[Statedef 1030]
type     = A
movetype = I
physics  = N
anim     = 1030
ctrl     = 0
velset   = 0, 0

;-------[ Sounds ]-------;

[State 1020:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = !var(50)
value    = 1, 1010
channel  = 0
volume   = 127

[State 1020:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = var(50)
value    = 2, 1020 + (Random % 2)
channel  = 0
volume   = 255

;-------[ Movement ]-------;

[State 1020:            Type, 1]
type      = StateTypeSet
trigger1  = AnimElem = 4
statetype = A
movetype  = I
physics   = N

[State 1020:            Vel, 1]
type     = VelSet
trigger1 = AnimElem = 5
x        = -2.0
y        = -3.5

[State 1020:            Vel, 2, Gravity]
type     = Gravity
trigger1 = AnimElemTime(5) > 0

;-------[ Projectiles ]-------;

[State 1020:            Landmine]
type        = Helper
trigger1    = AnimElem = 5
name        = "Landmine"
stateno     = 7050
id          = 7050
postype     = p1
pos         = Floor(60 * const(size.xscale)), Ceil(Abs(Pos Y))
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1020:            Landing]
type       = ChangeState
triggerall = AnimElemTime(5) > 0
trigger1   = Vel Y > 0
trigger1   = Pos Y >= 0
value      = 1024

;------------------------------------------------------------------------------;
; 獣を焦がす (空中 / 中)
;------------------------------------------------------------------------------;
[Statedef 1031]
type     = A
movetype = I
physics  = N
anim     = 1030
ctrl     = 0
velset   = 0, 0

;-------[ Sounds ]-------;

[State 1020:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = !var(50)
value    = 1, 1010
channel  = 0
volume   = 127

[State 1020:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = var(50)
value    = 2, 1020 + (Random % 2)
channel  = 0
volume   = 255

;-------[ Movement ]-------;

[State 1020:            Type, 1]
type      = StateTypeSet
trigger1  = AnimElem = 4
statetype = A
movetype  = I
physics   = N

[State 1020:            Vel, 1]
type     = VelSet
trigger1 = AnimElem = 5
x        = -2.0
y        = -3.5

[State 1020:            Vel, 2, Gravity]
type     = Gravity
trigger1 = AnimElemTime(5) > 0

;-------[ Projectiles ]-------;

[State 1020:            Landmine]
type        = Helper
trigger1    = AnimElem = 5
name        = "Landmine"
stateno     = 7050
id          = 7050
postype     = p1
pos         = Floor(120 * const(size.xscale)), Ceil(Abs(Pos Y))
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1020:            Landing]
type       = ChangeState
triggerall = AnimElemTime(5) > 0
trigger1   = Vel Y > 0
trigger1   = Pos Y >= 0
value      = 1024

;------------------------------------------------------------------------------;
; 獣を焦がす (空中 / 強)
;------------------------------------------------------------------------------;
[Statedef 1032]
type     = A
movetype = I
physics  = N
anim     = 1030
ctrl     = 0
velset   = 0, 0

;-------[ Sounds ]-------;

[State 1020:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = !var(50)
value    = 1, 1010
channel  = 0
volume   = 127

[State 1020:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = var(50)
value    = 2, 1020 + (Random % 2)
channel  = 0
volume   = 255

;-------[ Movement ]-------;

[State 1020:            Type, 1]
type      = StateTypeSet
trigger1  = AnimElem = 4
statetype = A
movetype  = I
physics   = N

[State 1020:            Vel, 1]
type     = VelSet
trigger1 = AnimElem = 5
x        = -2.0
y        = -3.5

[State 1020:            Vel, 2, Gravity]
type     = Gravity
trigger1 = AnimElemTime(5) > 0

;-------[ Projectiles ]-------;

[State 1020:            Landmine]
type        = Helper
trigger1    = AnimElem = 5
name        = "Landmine"
stateno     = 7050
id          = 7050
postype     = p1
pos         = Floor(180 * const(size.xscale)), Ceil(Abs(Pos Y))
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1020:            Landing]
type       = ChangeState
triggerall = AnimElemTime(5) > 0
trigger1   = Vel Y > 0
trigger1   = Pos Y >= 0
value      = 1024

;------------------------------------------------------------------------------;
; 獣を焦がす (空中) 発動
;------------------------------------------------------------------------------;
[Statedef 1035]
type     = A
movetype = I
physics  = N
anim     = 1035
ctrl     = 0
velset   = 0,0

;-------[ Movement ]--------;

[State 1035:            State Type]
type      = StateTypeSet
trigger1  = AnimElem = 8
statetype = A
movetype  = I
physics   = A

;-------[ Sounds ]-------;

[State 1025:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = !var(50)
trigger1 = !NumHelper(7055)
value    = 1, 1011
channel  = 0
volume   = 127

[State 1025:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = var(50)
trigger1 = !NumHelper(7055)
value    = 2, 1022
channel  = 0
volume   = 255

[State 1025:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 4
trigger1 = !var(50)
trigger1 = NumHelper(7055)
value    = 0, 2011
channel  = 0
volume   = 127

[State 1025:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 4
trigger1 = var(50)
trigger1 = NumHelper(7055)
value    = 2, 2010 + (Random % 2)
channel  = 0
volume   = 255

;-------[ States ]-------;

[State 1025:            Fall]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 51
ctrl     = 1


;==============================================================================;
; 月を穿つ
;==============================================================================;
;------------------------------------------------------------------------------;
; 月を穿つ (弱)
;------------------------------------------------------------------------------;
[Statedef 1040]
type     = S
movetype = I
physics  = S
anim     = 1040
ctrl     = 0
velset   = 0, 0

;-------[ Sounds ]--------;

[State 1040:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 4
trigger1 = !var(50)
value    = 0, 1001
channel  = 0
volume   = 127

[State 1040:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 4
trigger1 = var(50)
value    = 2, 1010 + (Random % 3)
channel  = 0
volume   = 255

;-------[ Projectiles ]-------;

[State 1020:            Fire]
type        = Helper
trigger1    = AnimElem = 5
name        = "Fire"
stateno     = 7060
id          = 7060
postype     = p1
pos         = Floor(80 * const(size.xscale)), 0
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1040:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 月を穿つ (中)
;------------------------------------------------------------------------------;
[Statedef 1041]
type     = S
movetype = I
physics  = S
anim     = 1041
ctrl     = 0
velset   = 0, 0

;-------[ Sounds ]--------;

[State 1040:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 4
trigger1 = !var(50)
value    = 0, 1001
channel  = 0
volume   = 127

[State 1040:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 4
trigger1 = var(50)
value    = 2, 1010 + (Random % 3)
channel  = 0
volume   = 255

;-------[ Projectiles ]-------;

[State 1020:            Fire]
type        = Helper
trigger1    = AnimElem = 5
name        = "Fire"
stateno     = 7060
id          = 7061
postype     = p1
pos         = Floor(80 * const(size.xscale)), 0
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1040:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 月を穿つ (強)
;------------------------------------------------------------------------------;
[Statedef 1042]
type     = S
movetype = I
physics  = S
anim     = 1041
ctrl     = 0
velset   = 0, 0

;-------[ Sounds ]--------;

[State 1040:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 4
trigger1 = !var(50)
value    = 0, 1001
channel  = 0
volume   = 127

[State 1040:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 4
trigger1 = var(50)
value    = 2, 1010 + (Random % 3)
channel  = 0
volume   = 255

;-------[ Projectiles ]-------;

[State 1020:            Fire]
type        = Helper
trigger1    = AnimElem = 5
name        = "Fire"
stateno     = 7060
id          = 7062
postype     = p1
pos         = Floor(160 * const(size.xscale)), 0
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1040:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;==============================================================================;
; 月に画く
;==============================================================================;
;------------------------------------------------------------------------------;
; 月に画く (弱)
;------------------------------------------------------------------------------;
[Statedef 1050]
type     = S
movetype = A
physics  = S
anim     = 1050
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 1, 3)

;-------[ Movement ]--------;

;-------[ Sounds ]-------;

[State 1050:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 3
trigger1 = !var(50)
value    = 0, 1020
channel  = 0
volume   = 127

[State 1050:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 3
trigger1 = var(50)
value    = 2, 1050
channel  = 0
volume   = 255

[State 1050:            SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 6, 2

;-------[ Effefcts ]-------;

[State 1050:            Sonic]
type        = Helper
trigger1    = AnimElem = 4
name        = "Sonic"
stateno     = 7070
id          = 7070
postype     = p1
pos         = Floor(50 * const(size.xscale)), Floor(-80 * const(size.yscale))
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ Hit Defs ]-------;

[State 1050:                Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 5
attr             = S, SA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
priority         = 5, Hit
damage           = 53, 5
pausetime        = 7, 7
sparkno          = S6010 + Random % 8
guard.sparkno    = S6061
sparkxy          = -15, Floor(-85 * const(size.yscale))
hitsound         = S7, 22
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 19
ground.hittime   = 18
ground.velocity  = -7.0, 0
guard.ctrltime   = 17
air.type         = High
air.hittime      = 18
air.velocity     = -3, -6
air.fall         = 1
fall             = 0
fall.recover     = 1
fall.recovertime = 30
id               = 1050
palfx.add        = 112, -96, -127
palfx.mul        = 168, 168, 168
palfx.sinadd     = 64, 32, 32, 8
palfx.color      = 64
palfx.time       = 32

;-------[ Burn Spark ]-------;

[State 1050:            Fire]
type             = Helper
trigger1         = MoveHit = 1
trigger1         = NumTarget(1050)
helpertype       = Normal
name             = "Fire"
stateno          = 6070
id               = 6070
postype          = p1
pos              = 0, 0
size.height      = Target(1050),ID
size.xscale      = const(size.xscale)
size.yscale      = const(size.yscale)
size.ground.back = 32
ownpal           = 1

;-------[ States ]-------;

[State 1050:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 月に画く (中)
;------------------------------------------------------------------------------;
[Statedef 1051]
type     = S
movetype = A
physics  = S
anim     = 1051
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 1, 3)

;-------[ Movement ]--------;

;-------[ Sounds ]-------;

[State 1050:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 3
trigger1 = !var(50)
value    = 0, 1020
channel  = 0
volume   = 127

[State 1050:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 3
trigger1 = var(50)
value    = 2, 1050
channel  = 0
volume   = 255

[State 1050:            SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 6, 2

;-------[ Effefcts ]-------;

[State 1050:            Sonic]
type        = Helper
trigger1    = AnimElem = 4
name        = "Sonic"
stateno     = 7070
id          = 7070
postype     = p1
pos         = Floor(50 * const(size.xscale)), Floor(-80 * const(size.yscale))
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ Hit Defs ]-------;

[State 1050:                Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 5
attr             = S, SA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
priority         = 4, Hit
damage           = 70, 7
pausetime        = 7, 7
sparkno          = S6010 + Random % 8
guard.sparkno    = S6061
sparkxy          = -15, Floor(-85 * const(size.yscale))
hitsound         = S7, 22
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 22
ground.hittime   = 21
ground.velocity  = -8.0, 0
guard.ctrltime   = 20
air.type         = High
air.hittime      = 21
air.velocity     = -3.5, -6
air.fall         = 1
fall             = 0
fall.recover     = 1
fall.recovertime = 40
id               = 1051
palfx.add        = 112, -96, -127
palfx.mul        = 168, 168, 168
palfx.sinadd     = 64, 32, 32, 8
palfx.color      = 64
palfx.time       = 32

;-------[ Burn Spark ]-------;

[State 1050:            Fire]
type             = Helper
trigger1         = MoveHit = 1
trigger1         = NumTarget(1051)
helpertype       = Normal
name             = "Fire"
stateno          = 6070
id               = 6070
postype          = p1
pos              = 0, 0
size.height      = Target(1051),ID
size.xscale      = const(size.xscale)
size.yscale      = const(size.yscale)
size.ground.back = 32
ownpal           = 1

;-------[ States ]-------;

[State 1050:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 月に画く (強)
;------------------------------------------------------------------------------;
[Statedef 1052]
type     = S
movetype = A
physics  = S
anim     = 1052
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 1, 3)

;-------[ Movement ]--------;

;-------[ Sounds ]-------;

[State 1050:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 3
trigger1 = !var(50)
value    = 0, 1020
channel  = 0
volume   = 127

[State 1050:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 3
trigger1 = var(50)
value    = 2, 1050
channel  = 0
volume   = 255

[State 1050:            SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 6, 2

;-------[ Effefcts ]-------;

[State 1050:            Sonic]
type        = Helper
trigger1    = AnimElem = 4
name        = "Sonic"
stateno     = 7070
id          = 7070
postype     = p1
pos         = Floor(50 * const(size.xscale)), Floor(-80 * const(size.yscale))
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ Hit Defs ]-------;

[State 1050:                Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 5
trigger2         = AnimElem = 6
attr             = S, SA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
priority         = 4, Hit
damage           = 44, 5
pausetime        = 7, 7
sparkno          = S6010 + Random % 8
guard.sparkno    = S6061
sparkxy          = -15, Floor(-85 * const(size.yscale))
hitsound         = S7, 22
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 22
ground.hittime   = 21
ground.velocity  = -8.0, 0
guard.ctrltime   = 20
air.type         = High
air.hittime      = 21
air.velocity     = -3.5, -6
air.fall         = 1
fall             = 0
fall.recover     = 1
fall.recovertime = 40
id               = 1052
palfx.add        = 112, -96, -127
palfx.mul        = 168, 168, 168
palfx.sinadd     = 64, 32, 32, 8
palfx.color      = 64
palfx.time       = 32

;-------[ Burn Spark ]-------;

[State 1050:            Fire]
type             = Helper
trigger1         = MoveHit = 1
trigger1         = NumTarget(1052)
trigger1         = !NumHelper(6071)
helpertype       = Normal
name             = "Fire"
stateno          = 6070
id               = 6071
postype          = p1
pos              = 0, 0
size.height      = Target(1052),ID
size.xscale      = const(size.xscale)
size.yscale      = const(size.yscale)
size.ground.back = 32
ownpal           = 1

;-------[ States ]-------;

[State 1050:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;==============================================================================;
; 赫訳・鬼灯楓
;==============================================================================;
;------------------------------------------------------------------------------;
; 始動
;------------------------------------------------------------------------------;
[Statedef 1060]
type     = S
movetype = A
physics  = S
anim     = 1060
ctrl     = 0
velset   = 0, 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 1, 3)

;-------[ Movement ]-------;

[State 1060:            State Type]
type      = StateTypeSet
trigger1  = AnimElem = 3
statetype = S
movetype  = I
physics   = S

[State 1060:            Attack Dist]
type     = AttackDist
trigger1 = 1
value    = 0

;-------[ Sounds ]-------;

[State 1060:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 4
trigger1 = !var(50)
value    = 0, 520
channel  = 0
volume   = 127

[State 1060:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 4
trigger1 = var(50)
value    = 2, 520 + (Random % 2)
channel  = 0
volume   = 255

;-------[ Hit Defs ]-------;

[State 1060:            Hit Def]
type          = HitDef
trigger1      = AnimElem = 1
attr          = S, ST
hitflag       = M
guardflag     =
animtype      = Light
priority      = 1, Miss
damage        = 0, 0
getpower = 60,30
sparkno       = -1
guard.sparkno = -1
sparkxy       = 0, 0
hitsound      = -1
guardsound    = -1
ground.type   = High
p1stateno     = 1061
p1facing      = 1
p2stateno     = 4020
p2facing      = 1
numhits       = 0
id            = 1060

;-------[ States ]-------;

[State 1060:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 成立
;------------------------------------------------------------------------------;
[Statedef 1061]
type     = S
movetype = A
physics  = S
anim     = 1061
ctrl     = 0
velset   = 0, 0

;-------[ Sounds ]-------;

[State 1061:            SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 5
value    = 7, 31

[State 1061:            SE, 2]
type     = PlaySnd
trigger1 = AnimElem = 6
value    = 9, 23

[State 1061:            SE, 3]
type     = PlaySnd
trigger1 = AnimElem = 11
value    = 9, 3

[State 1061:            Voice, 1, MBAC]
type        = PlaySnd
trigger1    = AnimElem = 6
trigger1    = !var(50)
value       = 0, 700
volume      = 127
channel     = 0
lowpriority = 1

[State 1061:            Voice, 1, MBAA]
type        = PlaySnd
trigger1    = AnimElem = 6
trigger1    = var(50)
value       = 2, 1040
volume      = 255
channel     = 0
lowpriority = 1

;-------[ Movement ]-------;

[State 1061:            Width, 1]
type     = Width
trigger1 = AnimElemTime(12) < 0
trigger1 = NumTarget(1060)
edge     = Floor(50 + Target(1060),const(size.ground.back)), 0

[State 1061:            Turn]
type     = Turn
trigger1 = AnimElem = 9

[State 1061:            Bind, 1]
type     = BindToTarget
trigger1 = AnimElem = 6
id       = 1060
pos      = Floor(44 * const(size.xscale)), Floor(36 * const(size.yscale)), Head
time     = 3

[State 1061:            Bind, 2]
type     = BindToTarget
trigger1 = AnimElem = 7
id       = 1060
pos      = Floor(40 * const(size.xscale)), Floor(36 * const(size.yscale)), Head
time     = 3

[State 1061:            Bind, 3]
type     = BindToTarget
trigger1 = AnimElem = 8
id       = 1060
pos      = Floor(33 * const(size.xscale)), Floor(36 * const(size.yscale)), Head
time     = 3

[State 1061:            Bind, 4]
type     = BindToTarget
trigger1 = AnimElem = 9
id       = 1060
pos      = Floor(-19 * const(size.xscale)), Floor(32 * const(size.yscale)), Head
time     = 3

[State 1061:            Bind, 5]
type     = BindToTarget
trigger1 = AnimElem = 10
id       = 1060
pos      = Floor(-32 * const(size.xscale)), Floor(38 * const(size.yscale)), Head
time     = 3

[State 1061:            Bind, 5]
type     = BindToTarget
trigger1 = AnimElem = 11
id       = 1060
pos      = Floor(-37 * const(size.xscale)), Floor(43 * const(size.yscale)), Head
time     = 3

[State 1061:            Pos Reset]
type     = PosSet
trigger1 = AnimElem = 12
y        = 0

;-------[ Effects ]-------;

[State 200:             Effect]
type           = Explod
trigger1       = AnimElem = 6
anim           = 7080
id             = 7080
postype        = p1
pos            = Floor(44 * const(size.xscale)), Floor(-36 * const(size.yscale))
scale          = const(size.xscale), const(size.yscale)
ownpal         = 1
sprpriority    = 3
removeongethit = 1
ignorehitpause = 0

;-------[ Target ]-------;

[State 1061:            Bind]
type     = TargetBind
trigger1 = Time = 0
id       = 1060
pos      = Floor(50 * const(size.xscale)), 0

;-------[ States ]-------;

[State 1061:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;==============================================================================;
; 赫訳・紗燐
;==============================================================================;
;------------------------------------------------------------------------------;
; 赫訳・紗燐 (弱)
;------------------------------------------------------------------------------;
[Statedef 1070]
type     = S
movetype = I
physics  = S
anim     = 1070
ctrl     = 0

;-------[ Sounds ]-------;

[State 1070:            Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 1
value       = ifelse(var(50), 2, 1), ifelse(var(50), 1030, 1000) + (Random % 3)
volume      = ifelse(var(50), 255, 127)
channel     = 0
lowpriority = 1

[State 1070:            SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 6, 1

;-------[ Projectiles ]-------;

[State 1070:            Projectile]
type        = Helper
trigger1    = AnimElem = 4
helpertype  = Normal
name        = "Cutter"
stateno     = 7100
id          = 7100
postype     = p1
pos         = 0, 0
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1070:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 赫訳・紗燐 (中)
;------------------------------------------------------------------------------;
[Statedef 1071]
type     = S
movetype = I
physics  = S
anim     = 1070
ctrl     = 0

;-------[ Sounds ]-------;

[State 1070:            Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 1
value       = ifelse(var(50), 2, 1), ifelse(var(50), 1030, 1000) + (Random % 3)
volume      = ifelse(var(50), 255, 127)
channel     = 0
lowpriority = 1

[State 1070:            SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 6, 1

;-------[ Projectiles ]-------;

[State 1070:            Projectile]
type        = Helper
trigger1    = AnimElem = 4
helpertype  = Normal
name        = "Cutter"
stateno     = 7100
id          = 7101
postype     = p1
pos         = 0, 0
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1070:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 赫訳・紗燐 (強)
;------------------------------------------------------------------------------;
[Statedef 1072]
type     = S
movetype = I
physics  = S
anim     = 1072
ctrl     = 0

;-------[ Sounds ]-------;

[State 1070:            Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 1
value       = ifelse(var(50), 2, 1), ifelse(var(50), 1030, 1000) + (Random % 3)
volume      = ifelse(var(50), 255, 127)
channel     = 0
lowpriority = 1

[State 1070:            SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 6, 1

;-------[ Projectiles ]-------;

[State 1070:            Projectile]
type        = Helper
trigger1    = AnimElem = 4
helpertype  = Normal
name        = "Cutter"
stateno     = 7100
id          = 7102
postype     = p1
pos         = 0, 0
ownpal      = 1
size.xscale = const(size.xscale) * 1.25
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1070:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 赫訳・紗燐 (空中 / 弱)
;------------------------------------------------------------------------------;
[Statedef 1080]
type     = A
movetype = I
physics  = N
anim     = 1080
ctrl     = 0

;-------[ Movement ]-------;

[State 1080:            Vel, 1]
type     = VelMul
trigger1 = AnimElemTime(4) < 0
x        = 0.5
y        = 0.5

[State 1080:            Vel, 2]
type     = VelSet
trigger1 = AnimElem = 4
x        = 3
y        = -4

[State 1080:            Vel, 3]
type     = Gravity
trigger1 = AnimElemTime(4) > 0

;-------[ Sounds ]-------;

[State 1070:            Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 1
value       = ifelse(var(50), 2, 1), ifelse(var(50), 1030, 1000) + (Random % 3)
volume      = ifelse(var(50), 255, 127)
channel     = 0
lowpriority = 1

[State 1070:            SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 3
value    = 6, 1

;-------[ Projectiles ]-------;

[State 1070:            Projectile]
type        = Helper
trigger1    = AnimElem = 3
helpertype  = Normal
name        = "Cutter"
stateno     = 7100
id          = 7103
postype     = p1
pos         = 0, 0
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1070:            Landing]
type       = ChangeState
triggerall = AnimElemTime(4) > 0
trigger1   = Vel Y > 0
trigger1   = Pos Y >= 0
value      = 52
ctrl       = 0
anim       = 49

;------------------------------------------------------------------------------;
; 赫訳・紗燐 (空中 / 中)
;------------------------------------------------------------------------------;
[Statedef 1081]
type     = A
movetype = I
physics  = N
anim     = 1080
ctrl     = 0

;-------[ Movement ]-------;

[State 1080:            Vel, 1]
type     = VelMul
trigger1 = AnimElemTime(4) < 0
x        = 0.5
y        = 0.5

[State 1080:            Vel, 2]
type     = VelSet
trigger1 = AnimElem = 4
x        = 3
y        = -4

[State 1080:            Vel, 3]
type     = Gravity
trigger1 = AnimElemTime(4) > 0

;-------[ Sounds ]-------;

[State 1070:            Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 1
value       = ifelse(var(50), 2, 1), ifelse(var(50), 1030, 1000) + (Random % 3)
volume      = ifelse(var(50), 255, 127)
channel     = 0
lowpriority = 1

[State 1070:            SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 3
value    = 6, 1

;-------[ Projectiles ]-------;

[State 1070:            Projectile]
type        = Helper
trigger1    = AnimElem = 3
helpertype  = Normal
name        = "Cutter"
stateno     = 7100
id          = 7104
postype     = p1
pos         = 0, 0
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1070:            Landing]
type       = ChangeState
triggerall = AnimElemTime(4) > 0
trigger1   = Vel Y > 0
trigger1   = Pos Y >= 0
value      = 52
ctrl       = 0
anim       = 49

;------------------------------------------------------------------------------;
; 赫訳・紗燐 (空中 / 強)
;------------------------------------------------------------------------------;
[Statedef 1082]
type     = A
movetype = I
physics  = N
anim     = 1080
ctrl     = 0

;-------[ Movement ]-------;

[State 1080:            Vel, 1]
type     = VelMul
trigger1 = AnimElemTime(4) < 0
x        = 0.5
y        = 0.5

[State 1080:            Vel, 2]
type     = VelSet
trigger1 = AnimElem = 4
x        = 3
y        = -4

[State 1080:            Vel, 3]
type     = Gravity
trigger1 = AnimElemTime(4) > 0

;-------[ Sounds ]-------;

[State 1070:            Voice, 1]
type        = PlaySnd
trigger1    = AnimElem = 1
value       = ifelse(var(50), 2, 1), ifelse(var(50), 1030, 1000) + (Random % 3)
volume      = ifelse(var(50), 255, 127)
channel     = 0
lowpriority = 1

[State 1070:            SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 3
value    = 6, 1

;-------[ Projectiles ]-------;

[State 1070:            Projectile]
type        = Helper
trigger1    = AnimElem = 3
helpertype  = Normal
name        = "Cutter"
stateno     = 7100
id          = 7105
postype     = p1
pos         = 0, 0
ownpal      = 1
size.xscale = const(size.xscale) * 1.25
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1070:            Landing]
type       = ChangeState
triggerall = AnimElemTime(4) > 0
trigger1   = Vel Y > 0
trigger1   = Pos Y >= 0
value      = 52
ctrl       = 0
anim       = 49


;==============================================================================;
; 獣を挫く
;==============================================================================;
;------------------------------------------------------------------------------;
; 獣を挫く (弱)
;------------------------------------------------------------------------------;
[Statedef 1120]
type     = S
movetype = A
physics  = S
anim     = 1120
ctrl     = 0

;-------[ Sounds ]-------;

[State 1120:            Voice, 1, MBAC]
type        = PlaySnd
trigger1    = AnimElem = 2
trigger1    = !var(50)
value       = 1, 1020 + (Random % 2)
channel     = 0
lowpriority = 1

[State 1120:            Voice, 2, MBAA]
type        = PlaySnd
trigger1    = AnimElem = 2
trigger1    = var(50)
value       = 2, 1020 + (Random % 3)
channel     = 0
lowpriority = 1

;-------[ Projectiles ]-------;

[State 1120:            Fire]
type        = Helper
trigger1    = AnimElem = 5
helpertype  = Normal
name        = "Fire"
stateno     = 7140
id          = 7140
postype     = p1
pos         = 0, 0
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1120:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 獣を挫く (中)
;------------------------------------------------------------------------------;
[Statedef 1121]
type     = S
movetype = A
physics  = S
anim     = 1121
ctrl     = 0

;-------[ Sounds ]-------;

[State 1120:            Voice, 1, MBAC]
type        = PlaySnd
trigger1    = AnimElem = 2
trigger1    = !var(50)
value       = 1, 1020 + (Random % 2)
channel     = 0
lowpriority = 1

[State 1120:            Voice, 2, MBAA]
type        = PlaySnd
trigger1    = AnimElem = 2
trigger1    = var(50)
value       = 2, 1020 + (Random % 3)
channel     = 0
lowpriority = 1

;-------[ Projectiles ]-------;

[State 1120:            Fire]
type        = Helper
trigger1    = AnimElem = 5
helpertype  = Normal
name        = "Fire"
stateno     = 7140
id          = 7141
postype     = p1
pos         = 0, 0
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1120:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 獣を挫く (強)
;------------------------------------------------------------------------------;
[Statedef 1122]
type     = S
movetype = A
physics  = S
anim     = 1122
ctrl     = 0

;-------[ Sounds ]-------;

[State 1120:            Voice, 1, MBAC]
type        = PlaySnd
trigger1    = AnimElem = 2
trigger1    = !var(50)
value       = 1, 1020 + (Random % 2)
channel     = 0
lowpriority = 1

[State 1120:            Voice, 2, MBAA]
type        = PlaySnd
trigger1    = AnimElem = 2
trigger1    = var(50)
value       = 2, 1020 + (Random % 3)
channel     = 0
lowpriority = 1

;-------[ Projectiles ]-------;

[State 1120:            Fire]
type        = Helper
trigger1    = AnimElem = 5
helpertype  = Normal
name        = "Fire"
stateno     = 7140
id          = 7142
postype     = p1
pos         = 0, 0
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1120:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;==============================================================================;
; 赫訳・紅葉
;==============================================================================;
;------------------------------------------------------------------------------;
; 赫訳・紅葉 (弱)
;------------------------------------------------------------------------------;
[Statedef 1130]
type     = S
movetype = A
physics  = S
anim     = 1130
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 1, 3)

;-------[ Sounds ]-------;

[State 1130:            SE, 1, Jump]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 9, 5

[State 1130:            SE, 2, Attack]
type     = PlaySnd
trigger1 = AnimElem = 7
value    = 6, 2

[State 1130:            Voice, 1 (MBAC)]
type     = PlaySnd
trigger1 = !var(50)
trigger1 = AnimElem = 2
value    = 1, 1030
channel  = 0

[State 1130:            Voice, 1 (MBAA)]
type     = PlaySnd
trigger1 = var(50)
trigger1 = AnimElem = 2
value    = 2, 210
channel  = 0

;-------[ Movement ]-------;

[State 1130:            State Type, 1]
type      = StateTypeSet
trigger1  = AnimElem = 4
statetype = A
movetype  = A
physics   = N

[State 1130:            Vel, 1]
type     = VelSet
trigger1 = AnimElem = 4
x        = 2
y        = -8

[State 1130:            Vel, 2]
type     = VelSet
trigger1 = AnimElemTime(8) > 0
trigger1 = MoveContact = 1
trigger1 = NumTarget(1131)
x        = -1.5
y        = -5

[State 1130:            Gravity]
type     = Gravity
trigger1 = AnimElemTime(4) > 0

;-------[ Effects ]-------;

[State 1130:            Slash]
type           = Explod
trigger1       = AnimElem = 7
anim           = 7007
id             = 7007
postype        = p1
pos            = Floor(32 * const(size.xscale)), Floor(-30 * const(size.yscale))
scale          = const(size.xscale), const(size.yscale)
ownpal         = 1
sprpriority    = 3
bindtime       = 4
ignorehitpause = 0

;-------[ Hit Defs ]-------;

[State 1130:            Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 4
attr             = A, SA
hitflag          = MAF
guardflag        = M
animtype         = Hard
priority         = 5, Hit
damage           = 52, 5
pausetime        = 9, 9
sparkno          = S6010 + Random % 8
guard.sparkno    = S6061
sparkxy          = -15, Floor(-54 * const(size.yscale))
hitsound         = S7, 2
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 19
ground.hittime   = 18
ground.velocity  = -2.0, -8.0
guard.ctrltime   = 17
guard.velocity   = -6.0
air.type         = High
air.hittime      = 18
air.velocity     = -3, -4
air.fall         = 1
fall.recover     = 1
fall.recovertime = 20
id               = 1130

[State 1130:            Hit Def, 2]
type             = HitDef
trigger1         = AnimElem = 8
attr             = A, SA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
priority         = 4, Hit
damage           = 70, 7
pausetime        = 9, 9
sparkno          = S6040 + Random % 8
guard.sparkno    = S6061
sparkxy          = -15, Floor(-44 * const(size.yscale))
hitsound         = S7, 8
guardsound       = S8, 1
ground.type      = Low
ground.slidetime = 19
ground.hittime   = 18
ground.velocity  = -8.0
guard.ctrltime   = 17
air.type         = Low
air.hittime      = 18
air.velocity     = -5, 6
air.fall         = 1
fall.recover     = 1
fall.recovertime = 21
id               = 1131

;-------[ States ]-------;

[State 1130:            Falling]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 51
ctrl     = 1

;------------------------------------------------------------------------------;
; 赫訳・紅葉 (中)
;------------------------------------------------------------------------------;
[Statedef 1131]
type     = S
movetype = A
physics  = S
anim     = 1131
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 1, 3)

;-------[ Sounds ]-------;

[State 1130:            SE, 1, Dash]
type     = PlaySnd
trigger1 = AnimElem = 5
value    = 9, 24

[State 1130:            SE, 2, Jump]
type     = PlaySnd
trigger1 = AnimElem = 13
value    = 9, 5

[State 1130:            SE, 3, Attack]
type     = PlaySnd
trigger1 = AnimElem = 16
value    = 6, 2

[State 1130:            Voice, 1 (MBAC)]
type     = PlaySnd
trigger1 = !var(50)
trigger1 = AnimElem = 11
value    = 1, 1031
channel  = 0

[State 1130:            Voice, 1 (MBAA)]
type     = PlaySnd
trigger1 = var(50)
trigger1 = AnimElem = 11
value    = 2, 1130
channel  = 0

;-------[ Movement ]-------;

[State 1130:            Anim, 1]
type       = ChangeAnim
triggerall = AnimElemTime(8) >= 0
triggerall = AnimElemTime(10) < 0
trigger1   = MoveHit = 1
trigger1   = NumTarget(1131)
value      = 1131
elem       = 10

[State 1130:            State Type, 1]
type      = StateTypeSet
trigger1  = AnimElem = 13
statetype = A
movetype  = A
physics   = N

[State 1130:            Vel, 1, Dash]
type     = VelSet
trigger1 = AnimElemTime(6) >= 0
trigger1 = AnimElemTime(10) < 0
x        = const(velocity.run.fwd.x)

[State 1130:            Vel, 2, Jump]
type     = VelSet
trigger1 = AnimElem = 13
x        = 2
y        = -8

[State 1130:            Vel, 3, Jump 2]
type     = VelSet
trigger1 = AnimElemTime(17) > 0
trigger1 = MoveContact = 1
trigger1 = NumTarget(1133)
x        = -2
y        = -5

[State 1130:            Gravity]
type     = Gravity
trigger1 = AnimElemTime(13) > 0

;-------[ Effects ]-------;

[State 1130:            Slash]
type           = Explod
trigger1       = AnimElem = 16
anim           = 7007
id             = 7007
postype        = p1
pos            = Floor(32 * const(size.xscale)), Floor(-30 * const(size.yscale))
scale          = const(size.xscale), const(size.yscale)
ownpal         = 1
sprpriority    = 3
bindtime       = 4
ignorehitpause = 0

;-------[ Hit Defs ]-------;

[State 1130:            Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 6
attr             = S, SA
hitflag          = MAF
guardflag        = M
animtype         = Medium
priority         = 4, Hit
damage           = 34, 3
pausetime        = 7, 7
sparkno          = S6010 + Random % 8
guard.sparkno    = S6061
sparkxy          = -15, Floor(-40 * const(size.yscale))
hitsound         = S7, 1
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 17
ground.hittime   = 16
ground.velocity  = -6
guard.ctrltime   = 15
air.type         = High
air.hittime      = 16
air.velocity     = -5, -2
air.fall         = 1
fall.recover     = 1
fall.recovertime = 20
id               = 1130

[State 1130:            Hit Def, 2]
type             = HitDef
trigger1         = AnimElem = 8
attr             = S, SA
hitflag          = MAF
guardflag        = M
animtype         = Medium
priority         = 4, Hit
damage           = 34, 3
pausetime        = 7, 7
sparkno          = S6010 + Random % 8
guard.sparkno    = S6061
sparkxy          = -15, Floor(-30 * const(size.yscale))
hitsound         = S7, 1
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 17
ground.hittime   = 16
ground.velocity  = -6
guard.ctrltime   = 15
air.type         = High
air.hittime      = 16
air.velocity     = -5, -2
air.fall         = 1
fall.recover     = 1
fall.recovertime = 20
id               = 1131

[State 1130:            Hit Def, 3]
type             = HitDef
trigger1         = AnimElem = 13
attr             = A, SA
hitflag          = MAF
guardflag        = M
animtype         = Hard
priority         = 4, Hit
damage           = 52, 5
pausetime        = 9, 9
sparkno          = S6010 + Random % 8
guard.sparkno    = S6061
sparkxy          = -15, Floor(-54 * const(size.yscale))
hitsound         = S7, 2
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 19
ground.hittime   = 18
ground.velocity  = -2.0, -8.0
guard.ctrltime   = 17
guard.velocity   = -6.0
air.type         = High
air.hittime      = 18
air.velocity     = -3, -4
air.fall         = 1
fall.recover     = 1
fall.recovertime = 20
id               = 1132

[State 1130:            Hit Def, 4]
type             = HitDef
trigger1         = AnimElem = 17
attr             = A, SA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
priority         = 4, Hit
damage           = 70, 7
pausetime        = 9, 9
sparkno          = S6040 + Random % 8
guard.sparkno    = S6061
sparkxy          = -15, Floor(-44 * const(size.yscale))
hitsound         = S7, 8
guardsound       = S8, 1
ground.type      = Low
ground.slidetime = 19
ground.hittime   = 18
ground.velocity  = -8.0
guard.ctrltime   = 17
air.type         = Low
air.hittime      = 18
air.velocity     = -5, 6
air.fall         = 1
fall.recover     = 1
fall.recovertime = 21
id               = 1133

;-------[ States ]-------;

[State 1130:            Falling]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 51
ctrl     = 0

;------------------------------------------------------------------------------;
; 赫訳・紅葉 (強)
;------------------------------------------------------------------------------;
[Statedef 1132]
type     = S
movetype = A
physics  = S
anim     = 1132
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 1, 3)

;-------[ Sounds ]-------;

[State 1130:            SE, 1, Dash]
type     = PlaySnd
trigger1 = AnimElem = 5
value    = 9, 24

[State 1130:            SE, 2, Jump]
type     = PlaySnd
trigger1 = AnimElem = 16
value    = 9, 5

[State 1130:            SE, 3, Attack]
type     = PlaySnd
trigger1 = AnimElem = 19
value    = 6, 2

[State 1130:            Voice, 1 (MBAC)]
type     = PlaySnd
trigger1 = !var(50)
trigger1 = AnimElem = 14
value    = 1, 1031
channel  = 0

[State 1130:            Voice, 1 (MBAA)]
type     = PlaySnd
trigger1 = var(50)
trigger1 = AnimElem = 14
value    = 2, 1130
channel  = 0

;-------[ Movement ]-------;

[State 1130:            Anim, 1]
type       = ChangeAnim
triggerall = AnimElemTime(8) > 0
triggerall = AnimElemTime(13) < 0
triggerall = MoveHit
trigger1   = NumTarget(1131)
value      = 1132
elem       = 13

[State 1130:            State Type, 1]
type      = StateTypeSet
trigger1  = AnimElem = 16
statetype = A
movetype  = A
physics   = N

[State 1130:            Vel, 1, Dash]
type     = VelSet
trigger1 = AnimElemTime(6) >= 0
trigger1 = AnimElemTime(13) < 0
x        = const(velocity.run.fwd.x)

[State 1130:            Vel, 2, Jump]
type     = VelSet
trigger1 = AnimElem = 16
x        = 2
y        = -8

[State 1130:            Vel, 3, Jump 2]
type     = VelSet
trigger1 = AnimElemTime(20) > 0
trigger1 = MoveContact = 1
trigger1 = NumTarget(1133)
x        = -2
y        = -5

[State 1130:            Gravity]
type     = Gravity
trigger1 = AnimElemTime(16) > 0

;-------[ Effects ]-------;

[State 1130:            Slash]
type           = Explod
trigger1       = AnimElem = 19
anim           = 7007
id             = 7007
postype        = p1
pos            = Floor(32 * const(size.xscale)), Floor(-30 * const(size.yscale))
scale          = const(size.xscale), const(size.yscale)
ownpal         = 1
sprpriority    = 3
bindtime       = 4
ignorehitpause = 0

;-------[ Hit Defs ]-------;

[State 1130:            Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 6
attr             = S, SA
hitflag          = MAF
guardflag        = M
animtype         = Medium
priority         = 4, Hit
damage           = 34, 3
pausetime        = 7, 7
sparkno          = S6010 + Random % 8
guard.sparkno    = S6061
sparkxy          = -15, Floor(-40 * const(size.yscale))
hitsound         = S7, 1
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 17
ground.hittime   = 16
ground.velocity  = -6
guard.ctrltime   = 15
air.type         = High
air.hittime      = 16
air.velocity     = -5, -2
air.fall         = 1
fall.recover     = 1
fall.recovertime = 20
id               = 1130

[State 1130:            Hit Def, 2]
type             = HitDef
trigger1         = AnimElem = 8
attr             = S, SA
hitflag          = MAF
guardflag        = M
animtype         = Medium
priority         = 4, Hit
damage           = 34, 3
pausetime        = 7, 7
sparkno          = S6010 + Random % 8
guard.sparkno    = S6061
sparkxy          = -15, Floor(-30 * const(size.yscale))
hitsound         = S7, 1
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 17
ground.hittime   = 16
ground.velocity  = -6
guard.ctrltime   = 15
air.type         = High
air.hittime      = 16
air.velocity     = -5, -2
air.fall         = 1
fall.recover     = 1
fall.recovertime = 20
id               = 1131

[State 1130:            Hit Def, 3]
type             = HitDef
trigger1         = AnimElem = 16
attr             = A, SA
hitflag          = MAF
guardflag        = M
animtype         = Hard
priority         = 4, Hit
damage           = 52, 5
pausetime        = 9, 9
sparkno          = S6010 + Random % 8
guard.sparkno    = S6061
sparkxy          = -15, Floor(-54 * const(size.yscale))
hitsound         = S7, 2
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 19
ground.hittime   = 18
ground.velocity  = -2.0, -8.0
guard.ctrltime   = 17
guard.velocity   = -6.0
air.type         = High
air.hittime      = 18
air.velocity     = -3, -4
air.fall         = 1
fall.recover     = 1
fall.recovertime = 20
id               = 1132

[State 1130:            Hit Def, 4]
type             = HitDef
trigger1         = AnimElem = 20
attr             = A, SA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
priority         = 4, Hit
damage           = 70, 7
pausetime        = 9, 9
sparkno          = S6040 + Random % 8
guard.sparkno    = S6061
sparkxy          = -15, Floor(-44 * const(size.yscale))
hitsound         = S7, 8
guardsound       = S8, 1
ground.type      = Low
ground.slidetime = 19
ground.hittime   = 18
ground.velocity  = -8.0
guard.ctrltime   = 17
air.type         = Low
air.hittime      = 18
air.velocity     = -5, 8
air.fall         = 1
fall             = 1
fall.recover     = 0
fall.xvelocity   = -3
fall.yvelocity   = -8
yaccel           = 0.35
id               = 1133

;-------[ States ]-------;

[State 1130:            Falling]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 51
ctrl     = 0


;==============================================================================;
; 飛来する鳥を渦切る (Exエッジ)
;==============================================================================;
;------------------------------------------------------------------------------;
; 飛来する鳥を渦切る (地上)
;------------------------------------------------------------------------------;
[Statedef 2000]
type     = S
movetype = A
physics  = S
anim     = 2000
ctrl     = 0

;-------[ Hyper Effects ]-------;

[State 2000:            Hyper Effect Helper]
type          = Helper
trigger1      = AnimElem = 3
helpertype    = Normal
name          = "Hyper Effect"
id            = 6500
stateno       = 6550
postype       = p1
pos           = Floor(-6 * const(size.xscale)), Floor(-72 * const(size.yscale))
ownpal        = 0
keyctrl       = 0
pausemovetime = 2147483647
supermovetime = 2147483647

[State 2000:            Super Pause]
type     = SuperPause
trigger1 = AnimElem = 3
time     = 48
movetime = 48
anim     = -1
sound    = -1
darken   = 0
p2defmul = fvar(39)
poweradd = -(var(1))

[State 2010:            After Image]
type        = AfterImage
trigger1    = Time = 0
time        = 10
timegap     = 1
framegap    = 4
length      = 10
palbright   = 1, 1, 1
palcontrast = 50, 50, 150
paladd      = 0, 0, 0
palmul      = 0.5, 0.5, 0.5
trans       = Add1

[State 2000:            After Image]
type     = AfterImageTime
trigger1 = 1
time     = 2

[State 2000:            Not Hit]
type     = NotHitBy
trigger1 = AnimElemTime(6) < 0
value    = SCA, NA, SA, HA, NT, ST, HT, NP, SP, HP
time     = 2

;-------[ Sounds ]--------;

[State 1000:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = !var(50)
value    = 0, 2000
channel  = 0
volume   = 127

[State 1000:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = var(50)
value    = 2, 2000 + (Random % 2)
channel  = 0
volume   = 255

;-------[ Projectiles ]-------;

[State 1000:            Projectile, 1]
type        = Helper
trigger1    = AnimElem = 5
helpertype  = Normal
name        = "Eddy off Birds"
stateno     = 7040
id          = 7045
ownpal      = 1
postype     = p1
pos         = Floor(-15 * const(size.xscale)), Floor(-45 * const(size.yscale))
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ Hit Pause ]-------;

[State 1000:            Hit Pause]
type           = ChangeAnim
trigger1       = NumHelper(7045)
trigger1       = Helper(7045),HitPauseTime
value          = Anim
elem           = AnimElemNo(0)
ignorehitpause = 1
persistent     = 1

;-------[ States ]--------;

[State 1000:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 飛来する鳥を渦切る (空中)
;------------------------------------------------------------------------------;
[Statedef 2010]
type     = A
movetype = A
physics  = N
anim     = 2010
ctrl     = 0
velset   = 0, 0

;-------[ Hyper Effects ]-------;

[State 2000:            Hyper Effect Helper]
type          = Helper
trigger1      = Time = 0
helpertype    = Normal
name          = "Hyper Effect"
id            = 6500
stateno       = 6550
postype       = p1
pos           = Floor(25 * const(size.xscale)), Floor(-65 * const(size.yscale))
ownpal        = 0
keyctrl       = 0
pausemovetime = 2147483647
supermovetime = 2147483647

[State 2000:            Super Pause]
type     = SuperPause
trigger1 = Time = 0
time     = 48
movetime = 48
anim     = -1
sound    = -1
darken   = 0
p2defmul = fvar(39)
poweradd = -(var(1))

[State 2010:            After Image]
type        = AfterImage
trigger1    = Time = 0
time        = 10
timegap     = 1
framegap    = 4
length      = 10
palbright   = 1, 1, 1
palcontrast = 50, 50, 150
paladd      = 0, 0, 0
palmul      = 0.5, 0.5, 0.5
trans       = Add1

[State 2000:            After Image]
type     = AfterImageTime
trigger1 = 1
time     = 2

[State 2000:            Not Hit]
type     = NotHitBy
trigger1 = AnimElemTime(3) < 0
value    = SCA, NA, SA, HA, NT, ST, HT, NP, SP, HP
time     = 2

;-------[ Movement ]-------;

[State 1010:            Vel, 1]
type     = VelSet
trigger1 = AnimElem = 3
x        = -4
y        = -4

[State 2010:            Vel, 2]
type       = VelMul
triggerall = AnimElemTime(3) > 0
triggerall = AnimElemTime(13) < 0
trigger1   = !NumHelper(7045)
trigger2   = NumHelper(7045)
trigger2   = !(Helper(7045),HitPauseTime)
x          = 0.9
y          = 0.9

[State 1010:            Gravity]
type       = Gravity
triggerall = AnimElemTime(13) > 0
trigger1   = !NumHelper(7045)
trigger2   = NumHelper(7045)
trigger2   = !(Helper(7045),HitPauseTime)

;-------[ Sounds ]--------;

[State 1000:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = !var(50)
value    = 0, 2000
channel  = 0
volume   = 127

[State 1000:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 1
trigger1 = var(50)
value    = 2, 2000 + (Random % 2)
channel  = 0
volume   = 255

;-------[ Projectiles ]-------;

[State 1000:            Projectile, 1]
type        = Helper
trigger1    = AnimElem = 2
helpertype  = Normal
name        = "Eddy off Birds"
stateno     = 7040
id          = 7045
ownpal      = 1
postype     = p1
pos         = Floor(-15 * const(size.xscale)), Floor(-55 * const(size.yscale))
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ Hit Pause ]-------;

[State 1000:            Hit Pause]
type           = ChangeAnim
trigger1       = NumHelper(7045)
trigger1       = Helper(7045),HitPauseTime
value          = Anim
elem           = AnimElemNo(0)
ignorehitpause = 1
persistent     = 1

[State 1000:            Hit Pause Pos]
type           = PosFreeze
trigger1       = NumHelper(7045)
trigger1       = Helper(7045),HitPauseTime
ignorehitpause = 1
persistent     = 1

;-------[ States ]--------;

[State 1010:            Fall]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 1015
ctrl     = 0


;==============================================================================;
; 疾駆する獣を焦がす (Exエッジ)
;==============================================================================;
;------------------------------------------------------------------------------;
; 疾駆する獣を焦がす (地上)
;------------------------------------------------------------------------------;
[Statedef 2020]
type     = S
movetype = I
physics  = S
anim     = 2020
ctrl     = 0
velset   = 0, 0

;-------[ Hyper Effects ]-------;

[State 2000:            Hyper Effect Helper]
type          = Helper
trigger1      = AnimElem = 2
helpertype    = Normal
name          = "Hyper Effect"
id            = 6500
stateno       = 6550
postype       = p1
pos           = Floor(10 * const(size.xscale)), Floor(-118 * const(size.yscale))
ownpal        = 0
keyctrl       = 0
pausemovetime = 2147483647
supermovetime = 2147483647

[State 2000:            Super Pause]
type     = SuperPause
trigger1 = AnimElem = 2
time     = 48
movetime = 48
anim     = -1
sound    = -1
darken   = 0
p2defmul = fvar(39)
poweradd = -(var(1))

[State 2010:            After Image]
type        = AfterImage
trigger1    = Time = 0
time        = 10
timegap     = 1
framegap    = 4
length      = 10
palbright   = 1, 1, 1
palcontrast = 50, 50, 150
paladd      = 0, 0, 0
palmul      = 0.5, 0.5, 0.5
trans       = Add1

[State 2000:            After Image]
type     = AfterImageTime
trigger1 = 1
time     = 2

[State 2000:            Not Hit]
type     = NotHitBy
trigger1 = AnimElemTime(6) < 0
value    = SCA, NA, SA, HA, NT, ST, HT, NP, SP, HP
time     = 2

;-------[ Sounds ]-------;

[State 1020:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 4
trigger1 = !var(50)
value    = 0, 2010
channel  = 0
volume   = 127

[State 1020:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 4
trigger1 = var(50)
value    = 2, 2020 + (Random % 2)
channel  = 0
volume   = 255

;-------[ Movement ]-------;

[State 1020:            Type, 1]
type      = StateTypeSet
trigger1  = AnimElem = 5
statetype = A
movetype  = I
physics   = N

[State 1020:            Vel, 1]
type     = VelSet
trigger1 = AnimElem = 6
x        = -2.0
y        = -3.5

[State 1020:            Vel, 2, Gravity]
type     = Gravity
trigger1 = AnimElemTime(6) > 0

;-------[ Projectiles ]-------;

[State 1020:            Landmine]
type        = Helper
trigger1    = AnimElem = 6
name        = "Landmine"
stateno     = 7050
id          = 7055
postype     = p1
pos         = Ceil(P2BodyDist X), 0
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1020:            Landing]
type       = ChangeState
triggerall = AnimElemTime(6) > 0
trigger1   = Vel Y > 0
trigger1   = Pos Y >= 0
value      = 1024

;------------------------------------------------------------------------------;
; 疾駆する獣を焦がす (空中)
;------------------------------------------------------------------------------;
[Statedef 2030]
type     = A
movetype = I
physics  = N
anim     = 2030
ctrl     = 0
velset   = 0, 0

;-------[ Hyper Effects ]-------;

[State 2000:            Hyper Effect Helper]
type          = Helper
trigger1      = AnimElem = 1
helpertype    = Normal
name          = "Hyper Effect"
id            = 6500
stateno       = 6550
postype       = p1
pos           = Floor(8 * const(size.xscale)), Floor(-118 * const(size.yscale))
ownpal        = 0
keyctrl       = 0
pausemovetime = 2147483647
supermovetime = 2147483647

[State 2000:            Super Pause]
type     = SuperPause
trigger1 = AnimElem = 1
time     = 48
movetime = 48
anim     = -1
sound    = -1
darken   = 0
p2defmul = fvar(39)
poweradd = -(var(1))

[State 2010:            After Image]
type        = AfterImage
trigger1    = Time = 0
time        = 10
timegap     = 1
framegap    = 4
length      = 10
palbright   = 1, 1, 1
palcontrast = 50, 50, 150
paladd      = 0, 0, 0
palmul      = 0.5, 0.5, 0.5
trans       = Add1

[State 2000:            After Image]
type     = AfterImageTime
trigger1 = 1
time     = 2

[State 2000:            Not Hit]
type     = NotHitBy
trigger1 = AnimElemTime(5) < 0
value    = SCA, NA, SA, HA, NT, ST, HT, NP, SP, HP
time     = 2

;-------[ Sounds ]-------;

[State 1020:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 4
trigger1 = !var(50)
value    = 0, 200
volume   = 127
channel  = 0

[State 1020:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 4
trigger1 = var(50)
value    = 2, 2020 + (Random % 2)
volume   = 255
channel  = 0

;-------[ Movement ]-------;

[State 1020:            Type, 1]
type      = StateTypeSet
trigger1  = AnimElem = 4
statetype = A
movetype  = I
physics   = N

[State 1020:            Vel, 1]
type     = VelSet
trigger1 = AnimElem = 5
x        = -2.0
y        = -3.5

[State 1020:            Vel, 2, Gravity]
type     = Gravity
trigger1 = AnimElemTime(5) > 0

;-------[ Projectiles ]-------;

[State 1020:            Landmine]
type        = Helper
trigger1    = AnimElem = 5
name        = "Landmine"
stateno     = 7050
id          = 7055
postype     = p1
pos         = Floor(P2BodyDist X), Ceil(Abs(Pos Y))
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1020:            Landing]
type       = ChangeState
triggerall = AnimElemTime(5) > 0
trigger1   = Vel Y > 0
trigger1   = Pos Y >= 0
value      = 1024


;==============================================================================;
; 上弦の月を穿つ (Exエッジ)
;==============================================================================;
[Statedef 2040]
type     = S
movetype = I
physics  = S
anim     = 2040
ctrl     = 0
velset   = 0, 0

;-------[ Hyper Effects ]-------;

[State 2000:            Hyper Effect Helper]
type          = Helper
trigger1      = AnimElem = 2
helpertype    = Normal
name          = "Hyper Effect"
id            = 6500
stateno       = 6550
postype       = p1
pos           = Floor(-23 * const(size.xscale)), Floor(-83 * const(size.yscale))
ownpal        = 0
keyctrl       = 0
pausemovetime = 2147483647
supermovetime = 2147483647

[State 2000:            Super Pause]
type     = SuperPause
trigger1 = AnimElem = 2
time     = 48
movetime = 48
anim     = -1
sound    = -1
darken   = 0
p2defmul = fvar(39)
poweradd = -(var(1))

[State 2010:            After Image]
type        = AfterImage
trigger1    = Time = 0
time        = 10
timegap     = 1
framegap    = 4
length      = 10
palbright   = 1, 1, 1
palcontrast = 50, 50, 150
paladd      = 0, 0, 0
palmul      = 0.5, 0.5, 0.5
trans       = Add1

[State 2000:            After Image]
type     = AfterImageTime
trigger1 = 1
time     = 2

[State 2000:            Not Hit]
type     = NotHitBy
trigger1 = AnimElemTime(5) < 0
value    = SCA, NA, SA, HA, NT, ST, HT, NP, SP, HP
time     = 2

;-------[ Sounds ]--------;

[State 2040:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 3
trigger1 = !var(50)
value    = 0, 2020
volume   = 127
channel  = 0

[State 2040:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 3
trigger1 = var(50)
value    = 2, 2040 + (Random % 2)
volume   = 255
channel  = 0

;-------[ Projectiles ]-------;

[State 2040:            Fire]
type        = Helper
trigger1    = AnimElem = 5
name        = "Fire"
stateno     = 7060
id          = 7065
postype     = p1
pos         = Floor(P2Dist X), 0
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 2040:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;==============================================================================;
; 墨空の月に画く (Exエッジ)
;==============================================================================;
;------------------------------------------------------------------------------;
; 墨空の月に画く
;------------------------------------------------------------------------------;
[Statedef 2050]
type     = S
movetype = A
physics  = S
anim     = 2050
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 1, 3)

;-------[ Hyper Effects ]-------;

[State 2000:            Hyper Effect Helper]
type          = Helper
trigger1      = AnimElem = 2
helpertype    = Normal
name          = "Hyper Effect"
id            = 6500
stateno       = 6550
postype       = p1
pos           = Floor(38 * const(size.xscale)), Floor(-60 * const(size.yscale))
ownpal        = 0
keyctrl       = 0
pausemovetime = 2147483647
supermovetime = 2147483647

[State 2000:            Super Pause]
type     = SuperPause
trigger1 = AnimElem = 2
time     = 48
movetime = 48
anim     = -1
sound    = -1
darken   = 0
p2defmul = fvar(39)
poweradd = -(var(1))

[State 2010:            After Image]
type        = AfterImage
trigger1    = Time = 0
time        = 10
timegap     = 1
framegap    = 4
length      = 10
palbright   = 1, 1, 1
palcontrast = 50, 50, 150
paladd      = 0, 0, 0
palmul      = 0.5, 0.5, 0.5
trans       = Add1

[State 2000:            After Image]
type     = AfterImageTime
trigger1 = 1
time     = 2

[State 2000:            Not Hit]
type     = NotHitBy
trigger1 = AnimElemTime(4) < 0
value    = SCA, NA, SA, HA, NT, ST, HT, NP, SP, HP
time     = 2

;-------[ Movement ]--------;

;-------[ Sounds ]-------;

[State 1050:            Voice, 1, MBAC]
type     = PlaySnd
trigger1 = AnimElem = 2
trigger1 = !var(50)
value    = 0, 2030
channel  = 0
volume   = 127

[State 1050:            Voice, 1, MBAA]
type     = PlaySnd
trigger1 = AnimElem = 2
trigger1 = var(50)
value    = 2, 2050
channel  = 0
volume   = 255

[State 1050:            SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 6, 2

[State 2050:            SE, 2]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 4, 31

;-------[ Effefcts ]-------;

[State 1050:            Sonic]
type        = Helper
trigger1    = AnimElem = 4
name        = "Sonic"
stateno     = 7070
id          = 7070
postype     = p1
pos         = Floor(50 * const(size.xscale)), Floor(-80 * const(size.yscale))
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ Hit Defs ]-------;

[State 1050:                Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 5
trigger2         = AnimElem = 6
trigger3         = AnimElem = 7
trigger4         = AnimElem = 8
attr             = S, SA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
priority         = 5, Hit
damage           = 41, 4
pausetime        = 4, 4
sparkno          = S6020 + Random % 8
guard.sparkno    = S6061
sparkxy          = -15, Floor(-85 * const(size.yscale))
hitsound         = S7, 22
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 19
ground.hittime   = 18
ground.velocity  = -3.0, -7
guard.ctrltime   = 17
air.type         = High
air.hittime      = 18
air.velocity     = -4, -6
air.fall         = 1
fall             = 1
fall.recover     = 0
id               = 2050
palfx.add        = 112, -96, -127
palfx.mul        = 168, 168, 168
palfx.sinadd     = 64, 32, 32, 8
palfx.color      = 64
palfx.time       = 48

;-------[ Burn Spark ]-------;

[State 1050:            Fire]
type             = Helper
trigger1         = MoveHit = 1
trigger1         = NumTarget(2050)
trigger1         = !NumHelper(6072)
helpertype       = Normal
name             = "Fire"
stateno          = 6070
id               = 6072
postype          = p1
pos              = 0, 0
size.height      = Target(2050),ID
size.xscale      = const(size.xscale)
size.yscale      = const(size.yscale)
size.ground.back = 48
ownpal           = 1

;-------[ States ]-------;

[State 1050:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1


;==============================================================================;
; 赫訳・紗燐 (EX)
;==============================================================================;
;------------------------------------------------------------------------------;
; 赫訳・紗燐 (EX)
;------------------------------------------------------------------------------;
[Statedef 2070]
type     = S
movetype = I
physics  = S
anim     = 2070
ctrl     = 0

;-------[ Hyper Effects ]-------;

[State 2000:            Hyper Effect Helper]
type          = Helper
trigger1      = AnimElem = 2
helpertype    = Normal
name          = "Hyper Effect"
id            = 6500
stateno       = 6550
postype       = p1
pos           = Floor(-70 * const(size.xscale)), Floor(-60 * const(size.yscale))
ownpal        = 0
keyctrl       = 0
pausemovetime = 2147483647
supermovetime = 2147483647

[State 2000:            Super Pause]
type     = SuperPause
trigger1 = AnimElem = 2
time     = 48
movetime = 48
anim     = -1
sound    = -1
darken   = 0
p2defmul = fvar(39)
poweradd = -(var(1))

[State 2010:            After Image]
type        = AfterImage
trigger1    = Time = 0
time        = 10
timegap     = 1
framegap    = 4
length      = 10
palbright   = 1, 1, 1
palcontrast = 50, 50, 150
paladd      = 0, 0, 0
palmul      = 0.5, 0.5, 0.5
trans       = Add1

[State 2000:            After Image]
type     = AfterImageTime
trigger1 = 1
time     = 2

[State 2000:            Not Hit]
type     = NotHitBy
trigger1 = AnimElemTime(5) < 0
value    = SCA, NA, SA, HA, NT, ST, HT, NP, SP, HP
time     = 2

;-------[ Sounds ]-------;

[State 2070:            Voice, 1, MBAC]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = !var(50)
value       = 1, 2000
volume      = 127
channel     = 0
lowpriority = 1

[State 2070:            Voice, 1, MBAA]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = var(50)
value       = 2, 2030 + (Random % 3)
volume      = 255
channel     = 0
lowpriority = 1

[State 1070:            SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 4
value    = 6, 1

;-------[ Projectiles ]-------;

[State 2070:            Projectile]
type        = Helper
trigger1    = AnimElem = 4
helpertype  = Normal
name        = "Cutter"
stateno     = 7100
id          = 7106
postype     = p1
pos         = 0, 0
ownpal      = 1
size.xscale = const(size.xscale) * 1.25
size.yscale = const(size.yscale) * 1.25

;-------[ States ]-------;

[State 2070:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;------------------------------------------------------------------------------;
; 赫訳・紗燐 (空中 / EX)
;------------------------------------------------------------------------------;
[Statedef 2080]
type     = A
movetype = I
physics  = N
anim     = 2080
ctrl     = 0
velset   = 0, 0

;-------[ Hyper Effects ]-------;

[State 2000:            Hyper Effect Helper]
type          = Helper
trigger1      = AnimElem = 1
helpertype    = Normal
name          = "Hyper Effect"
id            = 6500
stateno       = 6550
postype       = p1
pos           = Floor(25 * const(size.xscale)), Floor(-85 * const(size.yscale))
ownpal        = 0
keyctrl       = 0
pausemovetime = 2147483647
supermovetime = 2147483647

[State 2000:            Super Pause]
type     = SuperPause
trigger1 = AnimElem = 1
time     = 48
movetime = 48
anim     = -1
sound    = -1
darken   = 0
p2defmul = fvar(39)
poweradd = -(var(1))

[State 2010:            After Image]
type        = AfterImage
trigger1    = Time = 0
time        = 10
timegap     = 1
framegap    = 4
length      = 10
palbright   = 1, 1, 1
palcontrast = 50, 50, 150
paladd      = 0, 0, 0
palmul      = 0.5, 0.5, 0.5
trans       = Add1

[State 2000:            After Image]
type     = AfterImageTime
trigger1 = 1
time     = 2

[State 2000:            Not Hit]
type     = NotHitBy
trigger1 = AnimElemTime(4) < 0
value    = SCA, NA, SA, HA, NT, ST, HT, NP, SP, HP
time     = 2

;-------[ Movement ]-------;

[State 1080:            Vel, 2]
type     = VelSet
trigger1 = AnimElem = 4
x        = 4
y        = -5

[State 1080:            Vel, 3]
type     = Gravity
trigger1 = AnimElemTime(4) > 0

[State 2080:            Vel, 4]
type     = VelMul
trigger1 = AnimElemTime(7) > 0
x        = 0.95

;-------[ Sounds ]-------;

[State 2070:            Voice, 1, MBAC]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = !var(50)
value       = 1, 2000
volume      = 127
channel     = 0
lowpriority = 1

[State 2070:            Voice, 1, MBAA]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = var(50)
value       = 2, 2030 + (Random % 3)
volume      = 255
channel     = 0
lowpriority = 1

[State 1070:            SE, 1]
type     = PlaySnd
trigger1 = AnimElem = 3
value    = 6, 1

;-------[ Projectiles ]-------;

[State 1070:            Projectile]
type        = Helper
trigger1    = AnimElem = 3
helpertype  = Normal
name        = "Cutter"
stateno     = 7100
id          = 7107
postype     = p1
pos         = 0, 0
ownpal      = 1
size.xscale = const(size.xscale) * 1.25
size.yscale = const(size.yscale) * 1.25

;-------[ States ]-------;

[State 1070:            Landing]
type       = ChangeState
triggerall = AnimElemTime(4) > 0
trigger1   = Vel Y > 0
trigger1   = Pos Y >= 0
value      = 52
ctrl       = 0
anim       = 48


;==============================================================================;
; 群れ集う獣を挫く
;==============================================================================;
[Statedef 2120]
type     = S
movetype = A
physics  = S
anim     = 2120
ctrl     = 0

;-------[ Hyper Effects ]-------;

[State 2000:            Hyper Effect Helper]
type          = Helper
trigger1      = AnimElem = 2
helpertype    = Normal
name          = "Hyper Effect"
id            = 6500
stateno       = 6550
postype       = p1
pos           = Floor(9 * const(size.xscale)), Floor(-125 * const(size.yscale))
ownpal        = 0
keyctrl       = 0
pausemovetime = 2147483647
supermovetime = 2147483647

[State 2000:            Super Pause]
type     = SuperPause
trigger1 = AnimElem = 2
time     = 48
movetime = 48
anim     = -1
sound    = -1
darken   = 0
p2defmul = fvar(39)
poweradd = -(var(1))

[State 2010:            After Image]
type        = AfterImage
trigger1    = Time = 0
time        = 10
timegap     = 1
framegap    = 4
length      = 10
palbright   = 1, 1, 1
palcontrast = 50, 50, 150
paladd      = 0, 0, 0
palmul      = 0.5, 0.5, 0.5
trans       = Add1

[State 2000:            After Image]
type     = AfterImageTime
trigger1 = 1
time     = 2

[State 2000:            Not Hit]
type     = NotHitBy
trigger1 = AnimElemTime(6) < 0
value    = SCA, NA, SA, HA, NT, ST, HT, NP, SP, HP
time     = 2

;-------[ Sounds ]-------;

[State 1120:            Voice, 1, MBAC]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = !var(50)
value       = 1, 2020
channel     = 0
lowpriority = 1

[State 1120:            Voice, 2, MBAA]
type        = PlaySnd
trigger1    = AnimElem = 3
trigger1    = var(50)
value       = 2, 2020 + (Random % 3)
channel     = 0
lowpriority = 1

;-------[ Projectiles ]-------;

[State 1120:            Fire]
type        = Helper
trigger1    = AnimElem = 5
helpertype  = Normal
name        = "Fire"
stateno     = 7145
id          = 7145
postype     = p1
pos         = 0, 0
ownpal      = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

;-------[ States ]-------;

[State 1120:            Standing]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 0
ctrl     = 1

;==============================================================================;
; 赫訳・紅葉 (EX)
;==============================================================================;
[Statedef 2130]
type     = S
movetype = A
physics  = S
anim     = 2130
ctrl     = 0
juggle   = ifelse((var(20) > 0 || var(21) > 0), 1, 3)

;-------[ Hyper Effects ]-------;

[State 2000:            Hyper Effect Helper]
type          = Helper
trigger1      = AnimElem = 1
helpertype    = Normal
name          = "Hyper Effect"
id            = 6500
stateno       = 6550
postype       = p1
pos           = Floor(-17 * const(size.xscale)), Floor(-75 * const(size.yscale))
ownpal        = 0
keyctrl       = 0
pausemovetime = 2147483647
supermovetime = 2147483647

[State 2000:            Super Pause]
type     = SuperPause
trigger1 = AnimElem = 1
time     = 48
movetime = 48
anim     = -1
sound    = -1
darken   = 0
p2defmul = fvar(39)
poweradd = -(var(1))

[State 2010:            After Image]
type        = AfterImage
trigger1    = Time = 0
time        = 10
timegap     = 1
framegap    = 4
length      = 10
palbright   = 1, 1, 1
palcontrast = 50, 50, 150
paladd      = 0, 0, 0
palmul      = 0.5, 0.5, 0.5
trans       = Add1

[State 2000:            After Image]
type     = AfterImageTime
trigger1 = 1
time     = 2

[State 2000:            Not Hit]
type     = NotHitBy
trigger1 = AnimElemTime(7) < 0
value    = SCA, NA, SA, HA, NT, ST, HT, NP, SP, HP
time     = 2

;-------[ Sounds ]-------;

[State 2130:            SE, 1, Dash]
type     = PlaySnd
trigger1 = AnimElem = 5
value    = 9, 24

[State 2130:            SE, 2, Jump]
type     = PlaySnd
trigger1 = AnimElem = 16
value    = 9, 5

[State 2130:            SE, 3, Attack]
type     = PlaySnd
trigger1 = AnimElem = 19
value    = 6, 2

[State 2130:            Voice, 1 (MBAC)]
type     = PlaySnd
trigger1 = !var(50)
trigger1 = AnimElem = 4
value    = 1, 2030
channel  = 0

[State 2130:            Voice, 1 (MBAA)]
type     = PlaySnd
trigger1 = var(50)
trigger1 = AnimElem = 4
value    = 2, 2042
channel  = 0

[State 2130:            Voice, 2 (MBAC)]
type     = PlaySnd
trigger1 = !var(50)
trigger1 = AnimElem = 19
value    = 1, 210
channel  = 0

[State 2130:            Voice, 2 (MBAA)]
type     = PlaySnd
trigger1 = var(50)
trigger1 = AnimElem = 19
value    = 2, 214
channel  = 0

;-------[ Movement ]-------;

[State 2130:            Anim, 1]
type       = ChangeAnim
triggerall = AnimElemTime(8) > 0
triggerall = AnimElemTime(13) < 0
triggerall = MoveHit
trigger1   = NumTarget(2131)
value      = 2130
elem       = 13

[State 2130:            State Type, 1]
type      = StateTypeSet
trigger1  = AnimElem = 16
statetype = A
movetype  = A
physics   = N

[State 2130:            Vel, 1, Dash]
type     = VelSet
trigger1 = AnimElemTime(6) >= 0
trigger1 = AnimElemTime(13) < 0
x        = const(velocity.run.fwd.x)

[State 2130:            Vel, 2, Jump]
type     = VelSet
trigger1 = AnimElem = 16
x        = 2
y        = -8

[State 2130:            Vel, 3, Jump 2]
type     = VelSet
trigger1 = AnimElemTime(20) > 0
trigger1 = MoveContact = 1
trigger1 = NumTarget(2133)
x        = -2
y        = -5

[State 2130:            Gravity]
type     = Gravity
trigger1 = AnimElemTime(16) > 0

;-------[ Effects ]-------;

[State 2130:            Slash]
type           = Explod
trigger1       = AnimElem = 19
anim           = 7007
id             = 7007
postype        = p1
pos            = Floor(32 * const(size.xscale)), Floor(-30 * const(size.yscale))
scale          = const(size.xscale), const(size.yscale)
ownpal         = 1
sprpriority    = 3
bindtime       = 4
ignorehitpause = 0

;-------[ Hit Defs ]-------;

[State 2130:            Hit Def, 1]
type             = HitDef
trigger1         = AnimElem = 6
attr             = S, SA
hitflag          = MAF
guardflag        = M
animtype         = Medium
priority         = 4, Hit
damage           = 35, 4
pausetime        = 7, 7
sparkno          = S6020 + Random % 8
guard.sparkno    = S6061
sparkxy          = -15, Floor(-40 * const(size.yscale))
hitsound         = S7, 1
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 17
ground.hittime   = 16
ground.velocity  = -6
guard.ctrltime   = 15
air.type         = High
air.hittime      = 16
air.velocity     = -5, -2
air.fall         = 1
fall.recover     = 1
fall.recovertime = 20
id               = 2130
getpower         = 0, 0

[State 2130:            Hit Def, 2]
type             = HitDef
trigger1         = AnimElem = 8
attr             = S, SA
hitflag          = MAF
guardflag        = M
animtype         = Medium
priority         = 4, Hit
damage           = ifelse(MoveContact, 35, 70), ifelse(MoveContact, 7, 4)
pausetime        = 7, 7
sparkno          = S6020 + Random % 8
guard.sparkno    = S6061
sparkxy          = -15, Floor(-30 * const(size.yscale))
hitsound         = S7, 1
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 17
ground.hittime   = 16
ground.velocity  = -6
guard.ctrltime   = 15
air.type         = High
air.hittime      = 16
air.velocity     = -5, -2
air.fall         = 1
fall.recover     = 1
fall.recovertime = 20
id               = 2131
getpower         = 0, 0

[State 2130:            Hit Def, 3]
type             = HitDef
trigger1         = AnimElem = 16
attr             = A, SA
hitflag          = MAF
guardflag        = M
animtype         = Hard
priority         = 4, Hit
damage           = 87, 9
pausetime        = 9, 9
sparkno          = S6020 + Random % 8
guard.sparkno    = S6061
sparkxy          = -15, Floor(-54 * const(size.yscale))
hitsound         = S7, 2
guardsound       = S8, 1
ground.type      = High
ground.slidetime = 19
ground.hittime   = 18
ground.velocity  = -2.0, -8.0
guard.ctrltime   = 17
guard.velocity   = -6.0
air.type         = High
air.hittime      = 18
air.velocity     = -3, -4
air.fall         = 1
fall.recover     = 1
fall.recovertime = 20
id               = 2132
getpower         = 0, 0

[State 2130:            Hit Def, 4]
type             = HitDef
trigger1         = AnimElem = 20
attr             = A, SA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
priority         = 4, Hit
damage           = 44, 5
pausetime        = 9, 6
sparkno          = S6050 + Random % 8
guard.sparkno    = S6061
sparkxy          = -15, Floor(-44 * const(size.yscale))
hitsound         = S7, 8
guardsound       = S8, 1
ground.type      = Low
ground.slidetime = 19
ground.hittime   = 18
ground.velocity  = -8.0
guard.ctrltime   = 17
air.type         = Low
air.hittime      = 18
air.velocity     = -3, 10
air.fall         = 1
fall             = 1
fall.recover     = 0
fall.xvelocity   = -2
fall.yvelocity   = -10
id               = 2133
getpower         = 0, 0

;-------[ Target ]-------;

[State 2130:            Target State]
type     = TargetState
trigger1 = AnimElemTime(20) > 0 && AnimElemTime(21) < 0
trigger1 = MoveHit = 1
trigger1 = NumTarget(2133)
trigger1 = Target(2133),StateNo = [5000, 5150]
value    = 4030
id       = 2133

;-------[ States ]-------;

[State 2130:            Falling]
type     = ChangeState
trigger1 = AnimTime = 0
value    = 51
ctrl     = 1


;==============================================================================;
; Last Revision : $Rev$
; Last Modified : $Date$
;==============================================================================;
