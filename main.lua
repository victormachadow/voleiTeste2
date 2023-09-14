local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local physics = require("physics")

physics.start()
--physics.setDrawMode( "hybrid" )
physics.setGravity(0,20)
local Trajectory = require( "dmc_library.dmc_trajectory" )

deltasX = { 0.1 , 0.2 , 0.3 , 0.4 , 0.5 }
deltasY = { 0.5 , 0.6 , 0.7 , 0.8 , 0.9 , 1.0 }


local flagTouchPlayer = false
inTarget=false
target = _W-100
local engage = false



local bkg = display.newImage( "background11.png", centerX, centerY )  

local bullet
local bulletEn
local bullets = display.newGroup()
local player = display.newCircle( 50 , centerY, 25 )
physics.addBody( player , "dinamic" , { density = 0 , friction = 0, bounce = 0 , radius = 25 })
player.hp = 5

player.myName="player"
filterEn = { groupIndex = -2 }

local en = display.newCircle(  _W/2+200 , 520, 25 )
physics.addBody( en , "dinamic" , { density = 0 , friction = 2.0, bounce = 0 , radius = 25 , filter = filterEn })
en.hp = 10
en:setFillColor("black")
en.myName="enemy"

playerHp = display.newText( "player hp:  ".. player.hp, display.contentCenterX - 50 , 40 , native.systemFontBold, 26 )
--playerHp:setFillColor( "white" )

enHp = display.newText( "enemy hp:  "..en.hp ,  display.contentCenterX + 180 , 40 , native.systemFontBold, 26 )
--playerHp:setFillColor( "white" )



local en2 = display.newCircle(  _W/2+300 , 520, 25 )
physics.addBody( en2 , "dinamic" , { density = 0 , friction = 2.0, bounce = 0 , radius = 25 , filter = filterEn })
en2.hp = 10
en2:setFillColor("black")
en2.myName="enemy"




function touched(event)

 local phase = event.phase 
    if "began" == phase then
        
      --[[if ( event.x < player.x )then
 
 esq = true

  
 
  
player.x = player.x-15


                              
  end

    if ( event.x > player.x )then
 

 esq = false

 
player.x = player.x+15


                                
  end

--]]
    elseif "moved" == phase then
      if ( event.x < player.x )then
 
 esq = true

  
 
  
player.x = player.x-5


                              
  end

   if ( event.x > player.x )then
 

 esq = false

 
player.x = player.x+5


                                
  end

         

    elseif "ended" == phase then
         -- your ended code
    end



--[[]
if event.phase == "began" then
      pressed = true
 elseif event.phase == "ended" then
      pressed = false
 end

if ( event.x < player.x )then
 
 esq = true

  
 
 if(pressed)then 
player.x = player.x-5
end

                              
  end

 if ( event.x > player.x )then
 

 esq = false

if(pressed)then 
player.x = player.x+5
end

                                
  end

--]]

--[[ if ( event.phase=="began"  ) then

  

 if ( event.x < player.x )then
 
 esq = true

  pressed = true
 
 if(pressed)then 
player.x = player.x-5
end
 --player:setLinearVelocity( -300 ,0)
 --player:applyLinearImpulse( -0.3 , 0 ,  player.x , player.y )
                              
  end
 
 if ( event.x > player.x )then
 

 esq = false

if(pressed)then 
player.x = player.x+5
end
 --player:setLinearVelocity( 300 ,0)
 --player:applyLinearImpulse( 0.3 , 0 ,  player.x , player.y )
                                
  end
 
 elseif event.phase == "ended" then
      pressed = false
                          
 end
--]]
end




 local function onLocalCollision2( self, event )
     -- Aqui ele popula o array quando a bola toca o chao ou o player
    if ( event.phase == "began" ) then
      if ( event.other.myName == "chao") then
  --memoria[math.round( self.x )] = self  -- Popula o array memoria
  --print("normdeltaX:  "..memoria[math.round(self.x)].normX )
  --print("normdeltaY:  "..memoria[math.round(self.x)].normY )
  --print("target :  "..memoria[math.round(self.x)].targetX )
    display.remove(self)

end
       
if(event.other.myName=="player")then

       player.hp = player.hp -1
        display.remove(self) 

      end 

  if(event.other.myName=="enemy")then

        en.hp = en.hp - 1
        display.remove(self)

  end 


 if(event.other.myName=="trave")then
        
       Trajectory.setFlag(false) 
       --print(Trajectory.flag()) -- Acessando a variável em outro modulo
       --display.remove(self)
       --Runtime:removeEventListener( positionIterator )

  end  



end
end


 local function onLocalCollision3( self, event )
     -- Aqui ele popula o array quando a bola toca o chao ou o player
    if ( event.phase == "began" ) then
      if ( event.other.myName == "chao") then
  --memoria[math.round( self.x )] = self  -- Popula o array memoria
  --print("normdeltaX:  "..memoria[math.round(self.x)].normX )
  --print("normdeltaY:  "..memoria[math.round(self.x)].normY )
  --print("target :  "..memoria[math.round(self.x)].targetX )
    display.remove(self)

end
       
if(event.other.myName=="player")then

       player.hp = player.hp -1
        display.remove(self) 

      end 

  if(event.other.myName=="enemy")then

        en.hp = en.hp - 1
        display.remove(self)

  end 


 if(event.other.myName=="trave")then
        
       Trajectory.setFlag2(false) 
       --print(Trajectory.flag2()) -- Acessando a variável em outro modulo
       --display.remove(self)
       --Runtime:removeEventListener( positionIterator )

  end  



end
end





 local function onLocalCollision( self, event )
     
    if ( event.phase == "began" ) then
      if ( event.other.myName == "chao") then
  --memoria[math.round( self.x )] = self  -- Popula o array memoria
  --print("normdeltaX:  "..memoria[math.round(self.x)].normX )
  --print("normdeltaY:  "..memoria[math.round(self.x)].normY )
  --print("target :  "..memoria[math.round(self.x)].targetX )


display.remove(self)

end

  if(event.other.myName=="player")then

        player.hp = player.hp -1
        display.remove(self) 

      end 

 if(event.other.myName=="enemy")then

        en.hp = en.hp - 1
        display.remove(self)

  end 


end

end




function launch(event)
 if ( event.phase=="began" or event.phase == "moved" ) then
 -- Tentar isso tambem if(event.phase == "began" or event.phase == "moved") then
 display.getCurrentStage():setFocus(player)
 player:setLinearVelocity(0,0)
 
 
 elseif event.phase == "ended" then

 
deltaX = event.x - player.x
deltaY = event.y - player.y
normDeltaX = deltaX / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))
normDeltaY = deltaY / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))

    -- sin, cos = math.sin( angle ), math.cos( angle )

    -- sinT.text = sin
    -- cosT.text = cos
 

    bullet = display.newCircle( 0 , 0, 15 )
    bullet.x = player.x
    bullet.y = player.y-50


  bullet.collision = onLocalCollision
  bullet:addEventListener( "collision", bullet )
  --bullet.myName="shoot"

    physics.addBody( bullet )
    bullets:insert(bullet)  
 

 bullet:applyLinearImpulse(((event.xStart - event.x)/100) , ((event.yStart - event.y)/100 ) , bullet.x , bullet.y )

 display.getCurrentStage():setFocus(nil)
 
 end
 
 end


local function tapa( event )

if ( event.phase=="began"  ) then

  

 if ( event.x < player.x )then
 
 esq = true

  
 

 player:setLinearVelocity( -300 ,0)
 --player:applyLinearImpulse( -0.3 , 0 ,  player.x , player.y )
                              
  end
 
 if ( event.x > player.x )then
 

 esq = false


 player:setLinearVelocity( 300 ,0)
 --player:applyLinearImpulse( 0.3 , 0 ,  player.x , player.y )
                                
  end

   


 end


 end 



local function shot( event )
  
bkg:removeEventListener("touch" , tapa )
  player:setLinearVelocity(0,0)

  local phase = event.phase

    
  if "began" == phase then
num = 1  
    display.getCurrentStage():setFocus(player)
    player:setLinearVelocity(0,0)

     print("began")
   
    player.isFocus = true
    
    

  myLine = nil
  
  myLine = display.newLine( player.x,player.y, player.x , player.y+20)
      myLine:setStrokeColor(0.1, 0.2, 0.3)
      myLine.strokeWidth = 20
      myLine.alpha=0.8

  elseif player.isFocus then
     
    if "moved" == phase then
    num = num + 2   

  
  print("moved")  
    display.getCurrentStage():setFocus(player)
    player:setLinearVelocity(0,0)
    
      
      if ( myLine ) then
       -- myLine.parent:remove( myLine ) -- erase previous line, if any
        display.remove(myLine)
      end 
  
      myLine = display.newLine( player.x, player.y, event.x,event.y)
      myLine:setStrokeColor(0.1, 0.2, 0.3)
      myLine.strokeWidth = 20
      myLine.alpha=0.8

    elseif "ended" == phase then
    
bkg:addEventListener("touch" , tapa )
print(num)
 
deltaX = event.x - player.x
deltaY = event.y - player.y
normDeltaX = deltaX / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))
normDeltaY = deltaY / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))
      
    
      display.getCurrentStage():setFocus( nil )
      --player.isFocus = false
  
      if ( myLine ) then
        --myLine.parent:remove( myLine )
        display.remove(myLine)
      end
 if ( num > 5 )then
    bullet = display.newCircle( 0 , 0, 15 )
    bullet.x = player.x
    bullet.y = player.y-50
    
  if ( deltaY < -10 ) then bullet.y = player.y+50 end

  bullet.collision = onLocalCollision
  bullet:addEventListener( "collision", bullet )
  --bullet.myName="shoot"

    physics.addBody( bullet )
    bullets:insert(bullet)  
 

 bullet:applyLinearImpulse(((event.xStart - event.x)/100) , ((event.yStart - event.y)/100 ) , bullet.x , bullet.y )

end
 display.getCurrentStage():setFocus(nil)


    end
  end

  --return true -- Stop further propagation of touch event
end







local borderBottom = display.newRect( 0, 550, _W*2, 20 )
borderBottom:setFillColor( 1, 1, 1, 1)    -- make invisible
physics.addBody( borderBottom, "static", borderBodyElement )
borderBottom.myName="chao"
borderBottom.collision=onLocalCollision




local middleBottom = display.newRect( _W/2, _H+10, 20, 600 )
middleBottom:setFillColor( 1, 1, 1, 1)    -- make invisible
physics.addBody( middleBottom , "static", borderBodyElement )
middleBottom.onCollision = onLocalCollision2
middleBottom.myName="trave"

 local borderLeft = display.newRect( 0, 0, 20 , _H*2 )
borderLeft:setFillColor("black" )    -- make invisible
physics.addBody( borderLeft, "static", borderBodyElement )
 borderLeft.onCollision = onLocalCollision2
 borderLeft.myName="esq"



local borderRight = display.newRect( _W , 20, 20, _H*2 )
borderRight:setFillColor("black")   -- make invisible
physics.addBody( borderRight, "static", borderBodyElement )
borderRight.onCollision = onLocalCollision2
borderRight.myName="dir"


local borderTop1 = display.newRect( 0, 0, _W*2 , 20 )
borderTop1:setFillColor( "black")    -- make invisible
physics.addBody( borderTop1, "static", borderBodyElement )
borderTop1.onCollision = onLocalCollision2
borderTop1.myName="top" 


function hasBullet()


for i=bullets.numChildren,1, -1 do 

if (bullets[i].x > _W/2) then

if(bullets[i].y>250)then

if(bullets[i].x>en.x)then

en:setLinearVelocity( math.random( 100, 500)*-1, 0 )
--n = math.random(0,10)
--if(math.random(0,10) > 7 )then en:setLinearVelocity(math.random(100,500) , 0 ) end


 end 

if(bullets[i].x<en.x)then
 --en:applyLinearImpulse(0.1 ,0)
 en:setLinearVelocity(math.random(100,500) , 0 )

--if(math.random(0,10) > 7 )then en:setLinearVelocity(math.random(100,500)*-1 , 0 ) end


 end 



 end 



end


end

end


function atack()

--deltaX = player.x - en.x
--deltaY = math.random(0,5) - player.y
deltaX = deltasX[math.random(1,5)]*-1
deltaY=  deltasY[math.random(1,6)]*-1
--deltaY = math.random(0,90) - player.y

--[[


A = vo² * sen20 / g
Ag = vo² * sen20
vo² = Ag/sen20
vo = sqrt( A*g/sen2angle)

gravity = 0.20
distance = en.x - player.x
angle = 10

v0 = (1 / math.cos(angle)) * math.sqrt((0.5 * gravity * math.pow(distance, 2)) )

v01 = v0 / (distance * math.tan(angle)  )

bulletEn:applyLinearImpulse( v01 * math.cos(angle) , v01 * math.sin(angle) , bulletEn.x , bulletEn.y )


]]



normDeltaX = deltaX / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))
normDeltaY = deltaY / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))

    -- sin, cos = math.sin( angle ), math.cos( angle )

    -- sinT.text = sin
    -- cosT.text = cos
 
    --filterBall = { groupIndex = -4 }
    bulletEn = display.newCircle( 0 , 0, 15 )
    bulletEn.x = en.x
    bulletEn.y = en.y-80

    bulletEn.normX = normDeltaX
    bulletEn.normY = normDeltaY
    bulletEn.targetX = en.x
    --bulletEn.isVisible = false   

  bulletEn.collision = onLocalCollision2
  bulletEn:addEventListener( "collision", bulletEn )
  
   physics.addBody( bulletEn , "dinamic" )
   bullets:insert(bulletEn)
    --bullets.isVisible=false  
  

    --physics.addBody( bullet )
    --bullets:insert(bullet)  

Trajectory.move( bulletEn ,{ time=1000, pBegin= { bulletEn.x , bulletEn.y }, pEnd={ player.x , player.y }, height=150, rotate= false})

--Trajectory.move( bulletEn ,{ time=1000, pBegin= { bulletEn.x , bulletEn.y }, pEnd={ _W/2-30 , 5 }, height=150, rotate= false})

-- FAZ UM MONTE DE CALCULO AÍ E NAO DA CERTO
 

 --bulletEn:applyLinearImpulse(((normDeltaX * 30)/100) , ((normDeltaY * 30 )/100 ) , bulletEn.x , bulletEn.y )

--bullet:applyLinearImpulse(((normDeltaX * math.random(0,30) )/math.random(50,100)) , ((normDeltaY * math.random(0,30) )/math.random(50,100)) , bullet.x , bullet.y )


end


function atackEn2()

--deltaX = player.x - en.x
--deltaY = math.random(0,5) - player.y
deltaX = deltasX[math.random(1,5)]*-1
deltaY=  deltasY[math.random(1,6)]*-1
--deltaY = math.random(0,90) - player.y


normDeltaX = deltaX / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))
normDeltaY = deltaY / math.sqrt(math.pow(deltaX,2) + math.pow(deltaY,2))

    -- sin, cos = math.sin( angle ), math.cos( angle )

    -- sinT.text = sin
    -- cosT.text = cos
 
    filterBall = { groupIndex = -4 }
    bulletEn = display.newCircle( 0 , 0, 15 )
    bulletEn.x = en2.x
    bulletEn.y = en2.y-50

    bulletEn.normX = normDeltaX
    bulletEn.normY = normDeltaY
    bulletEn.targetX = en2.x
    --bulletEn.isVisible = false   

  bulletEn.collision = onLocalCollision3
  bulletEn:addEventListener( "collision", bulletEn )
  
   physics.addBody( bulletEn , { filter = filterBall } )
    bullets:insert(bulletEn)
    --bullets.isVisible=false  
  

    --physics.addBody( bullet )
    --bullets:insert(bullet)  
 

 --bulletEn:applyLinearImpulse(((normDeltaX * 30)/100) , ((normDeltaY * 30 )/100 ) , bulletEn.x , bulletEn.y )
 Trajectory.move2( bulletEn ,{ time=1000, pBegin= { bulletEn.x , bulletEn.y }, pEnd={ player.x , player.y }, height=250, rotate= false})

--bullet:applyLinearImpulse(((normDeltaX * math.random(0,30) )/math.random(50,100)) , ((normDeltaY * math.random(0,30) )/math.random(50,100)) , bullet.x , bullet.y )


end


function ataca(nx , ny)
if(atacando==false)then
  atacando = true
    bulletEn = display.newCircle( 0 , 0, 15 )
    bulletEn.x = en.x
    bulletEn.y = en.y-50

   
    --bulletEn.isVisible = false   

  bulletEn.collision = onLocalCollision2
  bulletEn:addEventListener( "collision", bulletEn )
  
   physics.addBody( bulletEn )
    bullets:insert(bulletEn)
    --bullets.isVisible=false  
  

    --physics.addBody( bullet )
    --bullets:insert(bullet)  
 
 --print("nx :"..nx)
 --print("ny :"..ny)
 bulletEn:applyLinearImpulse(((nx * 30)/100)  , ((ny * 30 )/100 )  , bulletEn.x , bulletEn.y )
 
--bullet:applyLinearImpulse(((normDeltaX * math.random(0,30) )/math.random(50,100)) , ((normDeltaY * math.random(0,30) )/math.random(50,100)) , bullet.x , bullet.y )
timer.performWithDelay( 5000 , function()


atacando = false

  end, 1 )


end




end








function getTarget()


if(en.x <= target)then
 target = _W/2+50
end
if(en.x >= target)then
 target = _W -100
end



--target = math.random( _W/2+50, _W-100)
--inTarget = true -- Ele estará intarget e não terá o fluxo interrompido



end






function go(target, nx , ny )

--print(inTarget)

--[[

if(inTarget==false)then-- Se ela não estiver em trajeto ela fará
--getTarget()
 
if(target>en.x)then
en:setLinearVelocity(300,0)
if( en.x <= target)then -- Quando chegar no trajeto ataca
en:setLinearVelocity(0,0)
print(target)  
ataca( nx , ny)

--en:setLinearVelocity(0,0)
 -- Leva player.x que é o indice do array mapeado das jogadas..
--inTarget=false

end
end


if(target < en.x)then
en:setLinearVelocity(-300,0)
if(en.x >= target)then -- Quando chegar no trajeto ataca
en:setLinearVelocity(0,0)
print(target) 
ataca( nx , ny)
--en:setLinearVelocity(0,0)
 -- Leva player.x que é o indice do array mapeado das jogadas..
--inTarget=false

end
end
--]]




--if(en.x == target)then -- Quando chegar no trajeto ataca
--atack()
--en:setLinearVelocity(0,0)
 -- Leva player.x que é o indice do array mapeado das jogadas..
--inTarget=false

--end

transition.moveTo( en, { x= target, y=en.y, time=math.random(1000,2000) , onComplete=ataca( nx , ny ) } )


end


function respawn()

 bulletEn = display.newCircle( 0 , 0, 15 )
    bulletEn.x = player.x
    bulletEn.y = 200

   
    --bulletEn.isVisible = false   

  bulletEn.collision = onLocalCollision2
  bulletEn:addEventListener( "collision", bulletEn )
  
   physics.addBody( bulletEn )
    bullets:insert(bulletEn)



 end 




function update()
--mapeia()
playerHp.text="player hp:  "..player.hp
enHp.text="enemy hp:  "..en.hp

--timer.performWithDelay( math.random(2100,2700), hasBullet , 1 )
--timer.performWithDelay( 2000 , hasBullet , 1 ) -- checa onde tem bala

 




hasBullet()

end



function targets()
n = math.random(0,5)
if( n > 2 )then inTarget = true end
if( n < 2 )then inTarget = false end
--print(inTarget)

end


function move3()

if ( math.random(0,10) > 5 ) then en:setLinearVelocity(-10,0) end
if ( math.random(0,10) < 5 ) then en:setLinearVelocity( 10,0) end

 end 



function move2()

transition.moveTo( en2, { x= math.random(_W/2+40 , _W-40 ), y=en2.y, time=math.random(500,1000) , onComplete=move } )

 end 

function move()

transition.moveTo( en, { x= math.random(_W/2+40 , _W-40 ), y=en.y, time=math.random(500,1000) , onComplete=move2 } )

 end 


--timer.performWithDelay( 1000 , go , 1 )
--timer.performWithDelay( 1000 , move , 1 )
  --timer.performWithDelay( 1500 , ataca, -1 )
timer.performWithDelay( 1500 , atack, -1 )
timer.performWithDelay( 2500 , move3 , -1 )
timer.performWithDelay( 1500 , atackEn2, -1 )
--timer.performWithDelay( 10 , atack2 , 50 )
--timer.performWithDelay( 1 , mapeia , 500 )
--timer.performWithDelay( 3000 , atack , -1 )
--timer.performWithDelay( 5000 , respawn , -1 )
--player:addEventListener("touch",launch)
player:addEventListener("touch",shot)
bkg:addEventListener("touch" , tapa )
--bkg:addEventListener("touch",touched)
timer.performWithDelay(1 , update , -1 )
--timer.performWithDelay(2000 , targets , -1)





