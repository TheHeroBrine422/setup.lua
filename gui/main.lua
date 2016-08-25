debug = true
tab = 1
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

end

function love.draw(dt)
  love.graphics.draw(background, 0, 0)
  love.graphics.draw(logo, 50, 20)
  love.graphics.draw(butoon1, 10, 120)
  love.graphics.draw(butoon2, 145, 118)
  if tab == 1 then
    love.graphics.draw(Tbutoon1, 20, 170)
    love.graphics.draw(Tbutoon2, 20, 220)
    love.graphics.draw(Tbutoon3, 20, 270)
    love.graphics.draw(Tbutoon4, 20, 320)
    love.graphics.draw(Tbutoon5, 20, 370)
  elseif tab == 2 then

  else
  tab = 1
  end
end
