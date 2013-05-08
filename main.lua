-- 
-- Abstract: CollisionFilter sample project
-- Demonstrates "categoryBits" and "maskBits" for collision filtering
-- 
-- Version: 1.1 (revised for Alpha 2)
-- 
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2010 Corona Labs Inc. All Rights Reserved.

local physics = require("physics")
physics.start()



physics.setScale( 40 )



display.setStatusBar( display.HiddenStatusBar )


local bkg = display.newImage( "bkg_clouds.png", 0, 0,true )


borderCollisionFilter = { categoryBits = 1, maskBits = 6} -- collides with (4 & 2) only
borderBodyElement = { friction=0.4, bounce=0.8, filter=borderCollisionFilter }

local borderTop = display.newRect( 0, 0, 480, 1 )
borderTop:setFillColor( 0, 0, 0, 0)		-- make invisible
physics.addBody( borderTop, "static", borderBodyElement )

local borderBottom = display.newRect( 0, 319, 180, 1 )
borderBottom:setFillColor( 0, 0, 0, 0)		-- make invisible
physics.addBody( borderBottom, "static", borderBodyElement )

local borderright = display.newRect( 540, 1, 1, 320 )
borderright:setFillColor( 0, 0, 0, 0)		-- make invisible
physics.addBody( borderright, "static", borderBodyElement )

local borderLeft = display.newRect( 0, 1, 1, 320 )
borderLeft:setFillColor( 0, 0, 0, 0)		-- make invisible
physics.addBody( borderLeft, "static", borderBodyElement )


local person = {}
local personCollisionFilter = { categoryBits = 4, maskBits = 5 } 
local personBody = { density=1., friction=1000, bounce=0.5, radius=43.0, filter=personCollisionFilter }

  person[1] = display.newImage("asou.png", 50, 50)
  physics.addBody( person[1], personBody)
  person[1].isFixedRotation = true
  soundID = audio.loadSound( "nc27131.mp3" )
local playBeep = function()
  print("beep")
  audio.play( soundID )
end

function buttonFunc(event)
print("tap")
playBeep() --追加
end	
local  function touchListener(e)
    person[1]:applyForce(500, -800, person[1].x,person[1].y+100)
    playBeep()
end


person[1]:addEventListener("tap",touchListener)



local blue = {}


local blueCollisionFilter = { categoryBits = 4, maskBits = 5 } -- collides with (4 & 1) only


local blueBody = { density=5000, friction=1000, bounce=0, radius=43.0, filter=blueCollisionFilter }


for i = 1,2 do

	
	blue[i] = display.newImage( "blue_balloon.png", (70*i)-60, 200 )
	physics.addBody( blue[i], blueBody )
	blue[i].isFixedRotation = true


end
ch1Stream = audio.loadStream("Mappy_001.mp3")
audio.play( ch1Stream, {loops=-1 } )

local platform2CollisionFilter = { categoryBits = 4, maskBits = 5 }
local platform2 = display.newImage( "platform2.png" )
platform2.x = 440; platform2.y = 250
physics.addBody( platform2, "kinematic", { friction=10 ,filter=platform2CollisionFilter } )
platform2.isPlatform = true 


local beamCollisionFilter = { categoryBits = 4, maskBits = 5 }
local beam = display.newImage( "beam.png" )
beam.x = 400; beam.y = 250
physics.addBody( beam, "kinematic", { friction=10 ,filter=beamCollisionFilter } )
beam.isbeam = true 

local resetbutton = display.newImageRect("buttonRed.png",80,70)resetbutton.x = 460;resetbutton.y=0local function touchListener2(e)  physics.removeBody(person[1])  physics.addBody(person[1],personBody)person[1].x =100person[1].y = 100end	resetbutton:addEventListener("tap",touchListener2)

    


