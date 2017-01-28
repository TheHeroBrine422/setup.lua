debug = true
screen = 1
back = true
function love.load(arg)
   logo = love.graphics.newImage('Assets/Logo.png')
   butoon1 = love.graphics.newImage('Assets/Setupbutoon.png')
   butoon2 = love.graphics.newImage('Assets/Optionsbutoon.png')
   background = love.graphics.newImage('Assets/background.png')
   -- Tab1
   Tbutoon1 = love.graphics.newImage('Assets/SetupTabButoons/Lua.png')
   Tbutoon2 = love.graphics.newImage('Assets/SetupTabButoons/love.png')
   Tbutoon3 = love.graphics.newImage('Assets/SetupTabButoons/Java.png')
   Tbutoon4 = love.graphics.newImage('Assets/SetupTabButoons/HTML.png')
   Tbutoon5 = love.graphics.newImage('Assets/SetupTabButoons/Shellscript.png')
end

function love.update(dt)
x, y = love.mouse.getPosition()
down = love.mouse.isDown(1)
  if down == true then
  -- Buttons
  -- Tabs
    if x >= 10 and x <= 145 and y >= 122 and y <= 155 then
      screen = 1
      back = true
    elseif x >= 145 and x <= 285 and y >= 120 and y <= 155 then
      back= true
    end

    if screen == 1 then
      -- Tab1 / Setup Buttons
      if x >= 20 and x <= 60 and y >= 170 and y <= 210 then
      screen = 3
      back = false
      elseif x >= 20 and x <= 70 and y >= 220 and y <= 260 then
      screen = 4
      back = false
      elseif x >= 20 and x <= 70 and y >= 270 and y <= 310 then
      screen = 5
      back = false
      elseif x >= 20 and x <= 75 and y >= 320 and y <= 360 then
      screen = 6
      back = false
      elseif x >= 20 and x <= 100 and y >= 370 and y <= 410 then
      screen = 7
      back = false
      end
    elseif screen == 2 then
      -- Tab2 / Option Buttons
    end
  end
end

function love.draw(dt)
  love.graphics.draw(background, 0, 0)
  if back == true then
    love.graphics.draw(logo, 50, 20)
    love.graphics.draw(butoon1, 10, 120)
    love.graphics.draw(butoon2, 145, 118)
    love.graphics.print("X:"..x, 0, 0)
    love.graphics.print("Y:"..y, 0, 10)
  end
  if screen == 1 then
    love.graphics.draw(Tbutoon1, 20, 170)
    love.graphics.draw(Tbutoon2, 20, 220)
    love.graphics.draw(Tbutoon3, 20, 270)
    love.graphics.draw(Tbutoon4, 20, 320)
    love.graphics.draw(Tbutoon5, 20, 370)
  elseif screen == 2 then

  elseif screen == 3 then
    love.graphics.print("Lua",0,20)
  elseif screen == 4 then
    love.graphics.print("Love",0,20)
  elseif screen == 5 then
    love.graphics.print("Java",0,20)
  elseif screen == 6 then
    love.graphics.print("HTML",0,20)
  elseif screen == 7 then
    love.graphics.print("Shellscript",0,20)
  else
    screen = 1
  end
end
