debug = true
screen = 1
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
    elseif x >= 145 and x <= 285 and y >= 120 and y <= 155 then
      screen = 2
    end

    if screen == 1 then
      -- Tab1 / Setup Buttons
      if x >= 20 and x <= 60 and y >= 170 and y <= 210 then
      screen = 3
      end
    elseif screen == 2 then
      -- Tab2 / Option Buttons
    end
  end
end

function love.draw(dt)
  love.graphics.draw(background, 0, 0)
  love.graphics.draw(logo, 50, 20)
  love.graphics.draw(butoon1, 10, 120)
  love.graphics.draw(butoon2, 145, 118)
  love.graphics.print("X:"..x, 0, 0)
  love.graphics.print("Y:"..y, 0, 10)
  if screen == 1 then
    love.graphics.draw(Tbutoon1, 20, 170)
    love.graphics.draw(Tbutoon2, 20, 220)
    love.graphics.draw(Tbutoon3, 20, 270)
    love.graphics.draw(Tbutoon4, 20, 320)
    love.graphics.draw(Tbutoon5, 20, 370)
  elseif screen == 2 then

  elseif screen == 3 then
  love.graphics.print("SCREEN3",0,20)
  else
  screen = 1
  end
end
