; Clow System Init

[Statedef 7769]
Physics=N
Anim=9999

[State 7700,Numcardinit]
Type=VarSet
Trigger1=var(0)=0
V=0
;**************
value=7 ; Number of cards available to choose from. Maximum 7, Minimum 3
;**************

[State -2]
Type=AssertSpecial
Trigger1=root,var(57)=2
flag=NoBG
flag2=NoFG
ignorehitpause=1

[State 7700]
Type=VarSet
Trigger1=((Root,command!="relc") && (root,fvar(22)!=1)) || ((Root,command!="start") && (root,fvar(22)=1))
trigger2=var(59)>0
v=50
value=1

[State 7700]
Type=Displaytoclipboard
Trigger1=1
text="%d , %d , %d , %d , %d "
params=var(11),var(12),var(13),var(14),var(15)

[State 7700,Carduseup]
Type=VarSet
Trigger1=parent,var(1)=-1
v=1
value=0

[State 7700,CardUpload]
Type=ParentVarSet
Trigger1=1
v=1
value=var(1)

[State 7700,Loopvar init]
Type=VarSet
Trigger1=1
V=59
value=0

[State 7700]
Type=varSet
Trigger1=var(0)<3
var(0)=3

[State 7700]
Type=varSet
Trigger1=var(0)>7
var(0)=7

[State 7700,Numcardinit]
Type=VarSet
Trigger1=root,var(59)>0
V=0
value=3+(root,var(55)>=15)+(root,var(55)>=33)+(root,var(55)>=100)+(root,var(55)>=333)

[State 7700,Rotate]
Type=ChangeState
Triggerall=time>0
Triggerall=var(58)=0
triggerall=var(50)=1
Triggerall=root,stateno!=[380,389]
Triggerall=root,stateno!=13360
Triggerall=root,stateno!=14500
Triggerall=root,stateno!=13650
triggerall=root,var(1)!=-1
Triggerall=Cond(NumHelper(13750),Helper(13750),Time>3,1)
Triggerall=Cond(NumHelper(14050),Helper(14050),Time>3,1)
Triggerall=Cond(NumHelper(4051),Helper(4051),Time>3,1)
Trigger1=((Root,command="relc") && (root,fvar(22)!=1)) || ((Root,command="start") && (root,fvar(22)=1))
Trigger1=root,var(59)=0
Trigger2=root,var(59)>0
Trigger2=(var(11)+5<var(12)) || (var(11)+5<var(13)) || (var(11)+5<var(14)) || (var(11)+5<var(15)) || (var(11)+5<var(16)) || (var(11)+5<var(17))
Trigger2=GameTime %(10-root,AILevel)=0
value=7705

[State 7700,Display, then Check for empty spaces]
Type=ChangeState
Trigger1=time>0
Value=7703

[Statedef 7700]
Physics=N
anim=9999

[State 7770]
Type=VarSet
Trigger1=1
var(10)=0

[State 7770]
Type=ChangeState
Trigger1=1
value=7771

[Statedef 7771]

[State 7770]
Type=VarSet
Trigger1=var(10)>0
var(var(10)+10)=var(20)

[State 7770]
Type=VarAdd
Trigger1=1
var(10)=1

[State 7770]
Type=ChangeState
Trigger1=1
value=IfElse(var(10)<=var(0),7777,7769)

;
; AI Card Priority Calculation
;

[Statedef 7777]

;
; If no power for card then no priority
;

[State 7777]
Type=VarSet
Trigger1=power<(100*(Helper(7800),var(var(var(10)))/100))
var(20)=-999

[State 7777]
Type=ChangeState
Trigger1=power<(100*(Helper(7800),var(var(var(10)))/100))
value=7771

[State 7777]
Type=VarSet
Trigger1=1
var(20)=ceil((100*(Helper(7800),var(var(var(10)))/100))*0.01)

[State 7777] ; Power - Focused strike
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=28))
Trigger1=abs(root,P2BodyDist X)<40+50*(root,name="Eriol Hiiragizawa")
Trigger1=abs(root,P2BodyDist Y)<40
Trigger1=P2StateType!=L
Trigger1=P2stateno=!12952
var(20)=500-250*(P2Life>300)-150*(P2StateNo=[120,160])

[State 7777] ; Change - Reverse Fate
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=50))
Trigger1 =(P2Life*15+enemy,power>root,Life*15+power+2000) || ((root,Life<100) && (P2Life>350))
Trigger1 =abs(root,P2BodyDist X)<40
Trigger1 =abs(root,P2Dist Y)<40
var(20)=ceil(999-Root,Life+(enemy,power-4000)*0.1)

[State 7777] ; Thunder - Thunderburst
Type=VarSet
Triggerall = NumHelper(4051)=0
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=13))
Trigger1 = (P2MoveType=A) && (root,ctrl=0)
Trigger1 = abs(root,P2BodyDist X)<60
Trigger1 = abs(root,P2Dist Y)<100
var(20)=1100

[State 7777] ; Thunder3
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=3) && (var(var(10))=13))
Trigger1 = abs(root,P2BodyDist X)<100
Trigger1 = power>=1000
var(20)=floor(power*0.1)+210

[State 7777] ; Flower Ritual
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=42))
Trigger1 = root,Life>500
var(20) = 250+root,Life

[State 7777] ; Flower of Life
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=3) && (var(var(10))=42))
Triggerall = NumHelper(14071)=0
Trigger1 = root,Life<250
var(20) = 100+(750-root,Life)

[State 7777] ; Libra
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=36))
Triggerall = NumHelper(13750)=0
Trigger1 = (root,Life>200) || (root,Life>P2Life)
Trigger1 = root,var(35)=0
Trigger1 = Cond((NumHelper(13651)=0),1,(abs(root,Pos X-Helper(13651),Pos X)>25) || (root,Pos Y<=-100))
Trigger1 = (root,var(8)>=root,life-70) || (P2StateNo=[1500,4500]) || (P2StateNo>=6000) || (random<100)
Trigger1 = root,InGuardDist
Trigger1 = NumHelper(4041)=0
var(20)=1000

[State 7777] ; Bubble Blaster
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=51))
Trigger1=P2MoveType=A
Trigger1=root,InGuardDist
var(20)=ceil(500-Life*0.5+power*0.05)

[State 7777] ; Bubble bomber
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=51))
Trigger1=Life>400
Trigger2=NumHelper(14511)>0
var(20)=ceil(0.35*root,life)+128+500*(NumHelper(14511)>0)

[State 7777] ; Lock
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=34))
Triggerall=NumHelper(13651)=0
Trigger1=(Power>=10*root,life) && (root,InGuardDist)
var(20)=ceil(Power*0.1+250*(root,life<250)*(roundNo>1))

[State 7777] ; Omegaflare 
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=1))
Trigger1=abs(root,P2Dist X)>90
Trigger1=NumHelper(12901)=0
Trigger1=!((enemy,authorname="Seravy") && (enemy,NumHelper(14601)>0))
var(20)=ceil(root,var(16)*0.2+power*0.05)+200*(P2Life<250)+75*(NumHelper(14602))

[State 7777] ; Volcano
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=1))
Trigger1=abs(P2Dist X)<90
var(20)=500-(root,life<200)*200

[State 7777] ; Watergun
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=3))
Trigger1=abs(root,P2Dist X)>70
Trigger1=abs(root,P2Dist Y)<30
var(20)=300*(P2Life<250)+100

[State 7777] ; Deep Ocean
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=3))
Trigger1=enemy,pos Y>-120
var(20)=400*(P2Life<100)+100+ceil(0.35*life)+200*(P2Life<250)

[State 7777] ; Tornado
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=2))
Trigger1=abs(root,P2Dist X)>120
var(20)=ceil(600+0.04*power)

[State 7777] ; Hurricane
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=2))
var(20)=150+300*(P2Life<250)

[State 7777] ; Earthquake
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=4))
Trigger1=P2StateType!=A
var(20)=200+(P2Life<250)*200-175*(Numhelper(13201)>0)

[State 7777] ; Spiky Ground
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=4))
Trigger1=P2StateType!=A
var(20)=ceil(300+(P2Life<250)*200-0.3*(1000-root,Life)-175*(Numhelper(13201)>0))

[State 7777] ; Epicenter
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=3) && (var(var(10))=4))
Trigger1=P2StateType!=A
var(20)=500-175*(Numhelper(13201)>0)

[State 7777] ; Amplify Volume
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=18))
Trigger1=abs(root,P2Dist X)>200
Trigger1=root,Life>400
Trigger1=NumHelper(13001)=0
var(20)=200-ceil(0.2*(1000-root,Life))

[State 7777] ; Trumpet of Victory
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=3) && (var(var(10))=18))
Triggerall=NumHelper(13001)=0
Trigger1=root,Life>400
Trigger2=NumHelper(12871)>0
var(20)=ceil(0.4*root,Life)+ceil(0.5*P2Life)+300*(NumHelper(12871)>0)-200

[State 7777] ; Small Solution
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=35))
Trigger1=var(17)<400
Trigger1=P2StateType=A
var(20)=150+ceil(0.4*(1000-P2Life))+ceil(0.02*power)

[State 7777] ; Ray of Light
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=5))
Trigger1=abs(root,P2Dist X)>160
var(20)=250+150*(P2Life<300)

[State 7777] ; Shining Light
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=5))
var(20)=550+350*(P2Life<400)-750*(P2Life<250)

[State 7777] ; Heavenly Light
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=3) && (var(var(10))=5))
Trigger1= root,Life<root,LifeMax/2
Trigger1=numhelper(4041)=0
var(20)=800-root,life-ceil(0.2*(1000-P2Life))

[State 7777] ; Sudden Darkness
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=6))
Trigger1=root,Life<600
Trigger1=abs(root,P2Dist X)>160
var(20)=200+ceil(0.3*(1000-root,life))+100*(P2Life<250)

[State 7777] ; Engulfing Darkness
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=6))
Trigger1=enemy,power>power
var(20)=800

[State 7777] ; Cloud of Despair
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=3) && (var(var(10))=6))
Trigger1=power<4000
Trigger1=(enemy,power>1500) || (enemy,powermax<3000)
var(20)=400

[State 7777] ; Eternal Sleep
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=4) && (var(var(10))=6))
Trigger1=root,Life>400
Trigger1=P2Life>400
Trigger2=NumHelper(12281)>0
var(20)=550+160*(enemy,power<1500)

[State 7777] ; Ray of Hope
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=7))
Trigger1=(root,Life<300) || (P2Life>500)
Trigger1= enemy,name!="Void"
var(20)=700+290*(P2Life<500)

[State 7777] ; Healing Zone
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=7))
Trigger1=root,life<350
Trigger1= enemy,name!="Void"
var(20)=400+ceil(0.5*(1000-root,life))

[State 7777] ; Void Blaster
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=3) && (var(var(10))=7))
Trigger1=(root,Life<300) || (P2Life>500)
Trigger1= enemy,name!="Void"
var(20)=700+290*(P2Life>500)-500*(root,life<120)*(RoundNo=1)

[State 7777] ; 1000 Arrows
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=8))
Trigger1=P2Life<200
var(20)=60+360*(P2Life<300)+75*(power>=3000)+75*(power>=4000)+75*(power>=5000)

[State 7777] ; Flood
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=9))
Trigger1=P2StateType!=A
var(20)=ceil(0.07*Power)

[State 7777] ; Voice
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=10))
Trigger1=root,var(16)>800
var(20)=100+200*(root,var(16)>900)

[State 7777] ; Twin
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=11))
Trigger1=NumHelper(12501)=0
Trigger1=abs(root,P2Dist X)>130
var(20)=600-ceil(0.25*(1000-root,life))

[State 7777] ; Chronowalk+dash
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=[1,2]) && (var(var(10))=12))
Trigger1=abs(root,P2Dist X)>120
;Trigger1=enemy,numproj=0
Trigger1=var(33)<300
Trigger1=enemy,name!="Yue"
var(20)=400

[State 7777] ; Chronofreeze
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=3) && (var(var(10))=12))
Trigger1=enemy,name!="Yue"
Trigger1=root,numproj=0
var(20)=600

[State 7777] ; Thunderstorm
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=13))
Trigger1=abs(root,P2Dist X)>150
var(20)=300+300*(P2Life<200)

[State 7777] ; Through
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=14))
Trigger1=root,var(19)=1
Trigger2=root,Life>200
Trigger2=NumHelper(12281)=0
var(20)=700-ceil(0.7*(1000-root,Life))+500*(root,var(19)=1)

[State 7777] ; Dimension Cut
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=15))
Trigger1=(P2StateNo =[120,160]) || (P2Life<=200)
Trigger1=P2StateNo!=13205
var(20)=300+450*(P2Life<=200)

[State 7777] ; Rain of Swords
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=15))
Trigger1=(P2StateNo =[120,160]) || (P2Life<=300)
Trigger1=P2StateNo!=13205
var(20)=350+180*(P2Life<=300)

[State 7777] ; Happiness
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=16))
Trigger1=root,life<650
var(20)=ceil(0.7*(1000-root,life))

[State 7777] ; Rain of Desserts
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=16))
Trigger1=root,Life<600
Trigger1=(P2Life>800) || (root,Life<250)
var(20)=ceil(0.5*(1000-root,life)+0.2*P2Life)

[State 7777] ; Cyclonic Conductor
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=17))
Trigger1=abs(root,P2Dist X)<95
Trigger1=(root,life<125) || (P2MoveType=A)
var(20)=450

[State 7777] ; Greater Tornado
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=17))
Trigger1=abs(enemy,pos X)<30
Trigger2=P2Life>400
var(20)=500+300*(P2StateType=S)*(abs(enemy,pos X)<30)

[State 7777] ; Ice Age
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=19))
Trigger1=root,var(27)>180
var(20)=100+200*(root,Life>500)+100*(root,Life>750)+250*(root,var(17)>0)

[State 7777] ; Lullaby
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=20))
Trigger1=Helper(991),var(2)=0
Trigger1=abs(root,P2Dist X)>150
var(20)=250+100*(Power<6000)+100*(power<3500)

[State 7777] ; Sniping
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=22))
Trigger1=1
var(20)=100+ceil(0.65*root,life)

[State 7777] ; Alarm System
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=21))
Trigger1=(abs(enemy,vel X)>6.7) || (abs(enemy,vel Y)>6.7)
Trigger1=NumHelper(12871)=0
Trigger2=enemy,authorname="Seravy"
Trigger2=Enemy,NumHelper(12871)>0
var(20)=350+400*(Enemy,NumHelper(12871)>0)

[State 7777] ; O.B.Cannonade
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=22))
Trigger1=root,life<500 || P2Life=[400,600]
Trigger1=(abs(root,P2Dist X)>140) || (root,Life>125)
var(20)=600+200*(P2Life<500)

[State 7777] ; Grand Shield
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=23))
Trigger1=NumHelper(4041)=0
var(20)=200+200*(root,Life<400)+200*(power>6000)

[State 7777] ; Life Protector
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=23))
Trigger1=NumHelper(12281)=0
Trigger2=NumHelper(4041)>0
var(20)=750

[State 7777] ; Twilight Stalker
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=24))
Trigger1=root,Life>400
var(20)=225+200*abs(root,P2Dist X)<60

[State 7777] ; Quicksand
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=25))
Trigger1=root,var(27)>150
Trigger1=(root,var(17)>0) || !(root,Name="Eriol Hiiragizawa")
var(20)=110+200*(root,Life>500)+100*(root,Life>750)+250*(root,var(17)>0)+200*(root,var(22)=[1,9000])

[State 7777] ; Grand Returner
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=26))
Trigger1=(enemy,life>(root,var(14)+250)) || (root,var(14)=0)
Trigger1=enemy,life>0
var(20)=75+enemy,life-root,var(14)+9999*(root,var(14)=0)

[State 7777] ; Weather Forecast
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=27))
var(20)=ceil(0.5*root,life)+300*(NumHelper(14601)>0)+400*(NumHelper(13301)>0)

[State 7777] ; Shower Warning
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=27))
var(20)=100+ceil(0.5*root,life)+400*(NumHelper(13311)>0)+300*(NumHelper(14601)>0)

[State 7777] ; Super Strength
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=28))
Trigger1=(root,Life>400) || (NumHelper(13151)>0) || (Numhelper(13211)>0)
Trigger1=root,var(25)=0
Trigger1=NumHelper(12281)=0
var(20)=125+250*(NumHelper(13151)>0)+250*(NumHelper(13211)>0)+250*(root,var(23)>0)-300*(root,Life<400)-300*(root,life<200)

[State 7777] ; Telekinesis
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=29))
Trigger1=P2MoveType=A
Trigger1=P2stateNo!=13401
Trigger1=Helper(991),var(2)=0
var(20)=200+200*(P2Life<100)

[State 7777] ; Cenrtifugal Training
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=29))
Trigger1=P2StateType=A
Trigger1=root,Numproj=0
Trigger1=NumHelper(12911)=0
Trigger1=NumHelper(13001)=0
var(20)=350+450*(P2Life<250)

[State 7777] ; Mist
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=30))
Trigger1=P2Life<=root,Life-300
var(20)=100+200*(RoundNo=1)+150*(root,life>600)+150*(P2Life<250)

[State 7777] ; Mirror Image
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=31))
Trigger1=P2MoveType!=A
Trigger1=abs(root,p2Dist X)>150
var(20)=600-ceil(0.5*(1000-root,Life))

[State 7777] ; Focused Reflection
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=31))
Trigger1=abs(root,P2Dist X)>220
Trigger1=NumHelper(14201)=0
Trigger1=Helper(991),var(2)>0
var(20)=150+25*Helper(991),var(2)

[State 7777] ; Road of Hell
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=32))
Triggerall=root,Life>P2Life
Trigger1=abs(root,P2Dist X)>160
Trigger1=Helper(991),var(2)=0
Trigger1=P2Movetype!=A
Trigger2=NumHelper(4041)>0
Trigger3=NumHelper(13651)>0                ; Safety Wall in effect
Trigger3=abs(root,Pos X-Helper(13651),Pos X)<25
Trigger3=root,Pos Y>-100
var(20)=520+300*(root,var(12)=1)

[State 7777] ; Loop
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=33))
Trigger1=root,life>300
var(20)=100+2*(root,LifeMax-enemy,lifemax)+100*(root,life>700)

[State 7777] ; Jump
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=37))
Triggerall=root,var(17)!=1
Trigger1=NumHelper(12281)=0
Trigger2=root,var(17)=2
var(20)=600-ceil(0.6*(1000-root,Life))+400*(root,var(17)=2)

[State 7777] ; Fly
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=41))
Triggerall=root,var(17)!=2
Trigger1=NumHelper(12281)=0
Trigger2=root,var(17)=1
var(20)=650-ceil(0.65*(1000-root,Life))+400*(root,var(17)=1)

[State 7777] ; Haunt
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=4) && (var(var(10))=38))
var(20)=ceil(0.35*root,life)+100

[State 7777] ; Stunning light
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=39))
Trigger1=power>=3000
var(20)=333

[State 7777] ; Spikes of Cold
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=40))
Trigger1=abs(root,P2Dist X)>100
var(20)=200+100*(P2Life<100)

[State 7777] ; Frost Driver
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=40))
Trigger1=abs(root,p2dist X)<180
var(20)=350+175*(P2Life<500)

[State 7777] ; Freeze 3
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=3) && (var(var(10))=40))
Trigger1=P2stateno=[120,160]
var(20)=380

[State 7777] ; Float
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=43))
Trigger1=root,var(22)=0
Trigger1=NumHelper(12281)=0
var(20)=150+150*(root,Name="Eriol Hiiragizawa")+250*(NumHelper(13201)>0)

[State 7777] ; Lightspeed
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=44))
Trigger1=root,var(23)=0
Trigger1=NumHelper(12281)=0
var(20)=145+200*(abs(root,P2Dist X)<120)+150*(root,life<600)

[State 7777] ; Breakthrough
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=44))
Trigger1=root,var(23)=0
Trigger1=root,life>200
Trigger1=NumHelper(12281)=0
var(20)=200*(NumHelper(13151)>0)+200*(Numhelper(13211)>0)+180*(root,life>500)+300*(root,var(25)>0)

[State 7777] ; Vanisher
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=45))
Trigger1=abs(root,P2Dist X)>180
Trigger1=NumHelper(14201)=0
Trigger1=Helper(991),var(2)>0
var(20)=175+25*Helper(991),var(2)

[State 7777] ; World Destroy
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=45))
Trigger1=(root,Life<=200) || ((P2Life>=350) && (P2Life>root,Life) && (Numhelper(14071)>0))
var(20)=P2Life-100

[State 7777] ; Dream
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=46))
var(20)=350

[State 7777] ; Dash
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=47))
Trigger1=NumHelper(12281)=0
var(20)=200

[State 7777] ; Meteor Shower
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=48))
Trigger1=(P2Life > 300) || (root,Life <300)
var(20)=550-280*(P2StateType=A)

[State 7777] ; Grand Meteor
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=48))
Trigger1=(P2Life > 300)
Trigger1=Helper(991),var(2)=0
Trigger1=(abs(root,P2Dist X)>180)
Trigger1=((root,Life>250) || (RoundNo>2))
var(20)=ceil(0.3*root,Life)+300+ceil(0.25*P2Life)

[State 7777] ; Cloud
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=49))
Trigger1=(root,life<600) || (Power>=4000)
;Trigger1=abs(root,P2dist X)>140
var(20)=100+25*Helper(991),var(2)+ceil(0.07*enemy,power*root,life/root,lifemax)

[State 7777] ; Big
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=52))
Trigger1=P2Stateno!=12952
Trigger1=Numhelper(12951)=0
Trigger1=Root,Life>180
var(20)=350+75*(root,life>400)

[State 7777] ; Wood
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=1) && (var(var(10))=53))
Trigger1=NumHelper(14601)=0
var(20)=175+160*(NumHelper(13301)>0)+160*(NumHelper(13311)>0)

[State 7777] ; Sanstone Skin
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=25))
Trigger1= root,life>400
var(20)=105+180*(NumHelper(13151)>0)+180*(root,var(23)>0)+125*(root,var(25)>0)

[State 7777] ; Annihil forecast
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=38))
var(20)=ceil(0.65*(enemy,life-enemy,power/20))

[State 7777] ; SnowStorm
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=19))
Trigger1=root,var(17)=0
Trigger1=NumHelper(13201)=0
Trigger1=root,var(42)>0
var(20)=275

[State 7777] ; Tsunami
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=9))
Trigger1=P2StateType!=A
var(20)=190+290*(P2Life<350)

[State 7777] ; Mirage Attack
Type=VarSet
Trigger1=((Helper(7800),var(var(var(10)))%100=3) && (var(var(10))=38))
Trigger1=enemy,power<4000
var(20)=175

[State 7777] ; Twilight Grab
Type=VarSet
Triggerall=((Helper(7800),var(var(var(10)))%100=2) && (var(var(10))=24))
Trigger1=abs(P2Dist X)>100
Trigger1=(P2stateno=[120,160]) || (Numhelper(12271)>0) || (P2Life<75)
Trigger1=P2StateType=S
Trigger1=NumHelper(13161)=0
var(20)=90+400*(P2Life<75)+700*(Numhelper(12271)>0)

[State 7777] ; Low Level AI randomize priorities
Type=VarAdd
Trigger1=root,AILevel<3
var(20)=ceil((100-root,var(55))*(random-500)*0.01)

; Flower card code
;Trigger2=(root,var(59)>0) && (gametime %50=1)
;Trigger2=!((NumHelper(14050)=0) && (root,var(1)=42) && ((root,Life<=150) || (NumHelper(14211)>0)))

[State 7777]
Type=ChangeState
Trigger1=1
value=7771

; Clow System Check for missing card

[Statedef 7701]
Physics=N
Anim=9999

[State 7701]
Type=VarSet
Trigger1=1
v=58
Value=0

[State 7701]
Type=VarAdd
Trigger1=1
v=59
Value=1

[State 7701]
Type=ChangeState
Trigger1=var(var(59))=0
Trigger2=var(var(59))=31 ; Remove Mirror cards if Mirror already in play
Trigger2=NumHelper(4141)>0
Value= 7702

[State 7701]
Type=ChangeState 
Trigger1=var(59)<var(0)
Value=7701

[State 7701]
Type=ChangeState 
Trigger1=1
Value=7700


; Clow Card Add from deck
[Statedef 7702]
Physics=N
Anim=9999

[State 7702]
Type=VarSet
Trigger1=1
v=var(59)
value=parent,var(0)

[State 7702]
Type=ParentVarSet
Trigger1=1
v=0
value=0

[State 7702]
Type=ChangeState
Trigger1=var(59)=1
value=7705

[State 7702]
Type=ChangeState
Trigger1=1
Value=7700

; Clow Card Display
[Statedef 7703]
Physics=N
Anim=9999

[State 7703]
Type=VarAdd
Trigger1=1
v=59
Value=1

[State 7703]
Type=Explod
Trigger1=var(var(59))>0
anim=7700+var(var(59))
ID = 7700+var(59)
Postype=left
pos= (TeamSide=1)*(var(59)*(30-var(59)*1)-30)+(TeamSide=2)*(GameWidth-var(59)*(29-var(59)*1)),floor(root,fvar(18)-240+GameHeight+var(59)*2) ;abajo tambien en pantalla panoramica
bindtime=1
removetime=1
vel=0,0
sprpriority=99
;ownpal=1
scale= 0.09-var(59)*0.04/6.0,0.09-var(59)*0.04/6.0
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999
ontop=1

[State 7703]
Type=Explod
Trigger1=helper(7800),var(58)>0
Trigger1=power>0
Trigger1=var(var(59))>0
Trigger1=power<(helper(7800),var(var(var(59)))/100)*100
anim=7800+27-(28*power)/((helper(7800),var(var(var(59)))/100)*100)
ID = 7800+var(59)
Postype=left
pos= (TeamSide=1)*(var(59)*(30-var(59)*1)-30)+(TeamSide=2)*(GameWidth-var(59)*(29-var(59)*1)),floor(root,fvar(18)-240+GameHeight+var(59)*2) ;abajo tambien en pantalla panoramica
bindtime=1
removetime=1
vel=0,0
sprpriority=110
;ownpal=1
scale= 1.08-var(59)*0.08,1.08-var(59)*0.08
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999
ontop=1

[State 7703]
Type=Explod
Trigger1=helper(7800),var(58)>0
Trigger1=power=0
Trigger1=var(var(59))>0
anim=7827
ID = 7800+var(59)
Postype=left
pos= (TeamSide=1)*(var(59)*(30-var(59)*1)-30)+(TeamSide=2)*(GameWidth-var(59)*(29-var(59)*1)),floor(root,fvar(18)-240+GameHeight+var(59)*2) ;abajo tambien en pantalla panoramica
bindtime=1
removetime=1
vel=0,0
sprpriority=110
;ownpal=1
scale= 1.08-var(59)*0.08,1.08-var(59)*0.08
Ignorehitpause=1
Pausemovetime=9999
Supermovetime=9999
ontop=1

[State 7703]
Type=ChangeState
Trigger1=var(59)<var(0)
Value=7703
Ignorehitpause=1

[State 7703]
Type=ChangeState
Trigger1=1
Value=7704
Ignorehitpause=1

; Varinit

[Statedef 7704]
Physics=N
Anim=9999

[State 7704,Loopvar init]
Type=VarSet
Trigger1=1
V=59
value=0

[State 7704,Check for empty spaces]
Type=ChangeState
Trigger1=1
Value=7701

; Card Select Command
[Statedef 7705]
Physics=N
Anim=9999

[State 7700]
Type=VarSet
Trigger1=1
v=50
value=0

[State 7705]
Type=VarSet
Trigger1=1
var(58)=var(1)

[State 7705]
Type=VarSet
Trigger1=1
var(59)=0

[State 7705]
Type=ChangeState
Trigger1=1
Value=7706

; Card Select Command
[Statedef 7706]
Physics=N
Anim=9999

[State 7706]
Type=VarAdd
Trigger1=1
v=59
value=1

[State 7706]
Type=VarSet
Trigger1=var(59)<=var(0)
V=var(59)
value=IfElse(var(59)!=var(0),var(var(59)+1),var(58))

[State 7706]
Type=ChangeState
Trigger1=var(59)<var(0)
value=7706

[State 7706]
Type=VarSet
Trigger1=1
v=58
value=1

[State 7700,Loopvar init]
Type=VarSet
Trigger1=1
V=59
value=0

[State 7706]
Type=ChangeState
Trigger1=1
Value=7703

; Clow Deck Handle

; Add Sideboard

[Statedef 7911]

[State 7901]
Type=VarSet
Trigger1=1
var(59)=0

[State 7901]
Type=VarSet
Trigger1=1
var(58)=0

[State 7901,Mirror Remove]
Type=VarSet
Trigger1=NumHelper(4141)>0
var(31)=0

[State 7901]
Type=ChangeState
Trigger1=1
Value=7913

; Count cards state
[Statedef 7913]
Physics=N
anim=9999

[State 7902]
Type=VarAdd
Trigger1=1
v=59
value=1

[State 7902]
Type=ChangeState
Trigger1=var(59)>var(0)
Value=7912

[State 7902]
Type=VarAdd
Trigger1=1
v=58
value=var(var(59))

[State 7902]
Type=ChangeState
Trigger1=1
Value=7913

[Statedef 7912]

[State 7911]
Type=Varadd
Trigger1=root,var(50)!=0
v=root,var(50)
value=ceil(var(58)*0.2)

[State 7911]
Type=Varadd
Trigger1=root,var(51)!=0
v=root,var(51)
value=ceil(var(58)*0.2)

[State 7911]
Type=Varadd
Trigger1=root,var(52)!=0
v=root,var(52)
value=ceil(var(58)*0.2)

[State 7911]
Type=Varadd
Trigger1=root,var(53)!=0
v=root,var(53)
value=ceil(var(58)*0.2)

[State 7911]
Type=Varadd
Trigger1=root,var(54)!=0
v=root,var(54)
value=ceil(var(58)*0.2)

[State 7902]
Type=ChangeState
Trigger1=1
Value=7901

; Idle State
[Statedef 7901]
Physics=N
anim=9999

[State 7900]
Type=DisplayToclipBoard
Trigger1=1
text="helper(7800),var(1)=%d"
params=helper(7800),var(1)

[State 7901]
Type=VarSet
Trigger1=1
var(59)=0

[State 7901]
Type=VarSet
Trigger1=1
var(58)=0

[State 7901,Mirror Remove]
Type=VarSet
Trigger1=NumHelper(4141)>0
var(31)=0

[State 7901]
Type=ChangeState
Trigger1=Parent,Var(0)=0
Value=7902

; Count cards state
[Statedef 7902]
Physics=N
anim=9999

[State 7902]
Type=VarAdd
Trigger1=1
v=59
value=1

[State 7902]
Type=ChangeState
Trigger1=var(59)>var(0)
Value=7903

[State 7902]
Type=VarAdd
Trigger1=1
v=58
value=var(var(59))

[State 7902]
Type=ChangeState
Trigger1=1
Value=7902


; Choose a card State Init
[Statedef 7903]
Physics=N
anim=9999

[State 7903]
Type=ChangeState
Trigger1=var(58)=0
Value=7900

[State 7903]
Type=VarRandom
Trigger1=1
V=57
Range=1,var(58)

[State 7903]
Type=VarSet
Trigger1=1
var(59)=0

[State 7903]
Type= ChangeState
Trigger1=1
Value=7904

; Choose a card State Init
[Statedef 7904]
Physics=N
anim=9999

[State 7904]
Type=VarAdd
Trigger1=1
v=59
value=1

[State 7904]
Type=VarAdd
Trigger1=1
v=57
value=-var(var(59))

[State 7904]
Type=ChangeState
Trigger1=var(57)<=0
Value=7905

[State 7904]
Type=ChangeState
Trigger1=1
Value=7904


; Move Chosen card to Root
[Statedef 7905]
Physics=N
anim=9999

[State 7905]
Type=ParentVarSet
Trigger1=1
V=0
Value=var(59)

[State 7905]
Type=VarAdd
Trigger1=1
V=var(59)
Value=-1

[State 7905]
Type=ChangeState
Trigger1=1
Value=7901

