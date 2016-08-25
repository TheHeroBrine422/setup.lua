function love.load()
	enteringText = false
  textenter = true
	defaultText = true
	text = "Path of File"
  cap = false
end
lkey = {}
lkeycount = 0
function love.draw()
	love.graphics.print( string.format("%s\n", tostring(cap)), 10, 10 )
  if textenter == false then
     enteringText = false
  end
	if enteringText then
		love.graphics.setColor( 100, 100, 100)
	else
		love.graphics.setColor( 255, 255, 255 )
	end
	love.graphics.rectangle( "fill", 100, 100, 600, 15 )

	love.graphics.setColor( 0, 0, 0 )
	love.graphics.print( text, 100, 100 )

end

function love.mousepressed( x, y, button )
	if x > 100 and x < 700 and  y > 100 and y < 115 then
		if defaultText then
			defaultText = false
			text = ""
		end
		enteringText = true
	else
		enteringText = false
	end
end

function love.keypressed( key, code )
	if enteringText then
     if key == "backspace" then
        if lkeycount == 0 then
        else
           text = ""
           lkeycount = lkeycount - 1
           for i=1,lkeycount do
              text = text..lkey[i]
           end
        end
     elseif key == "lshift" then
        cap = true
		 elseif key == "rshift" then
        cap = true
     elseif key == "return" then
        textenter = false
        enteringTest = false
     elseif key == "space" then
        key = " "
				lkeycount = lkeycount + 1
				lkey[lkeycount] = key
				text = text .. key
     else
      if cap == true then
           key = key:gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end)
					 lkeycount = lkeycount + 1
					 lkey[lkeycount] = key
					 text = text .. key
           cap = false
        else
			     lkeycount = lkeycount + 1
			     lkey[lkeycount] = key
			     text = text .. key
      end
     end
	end
end
