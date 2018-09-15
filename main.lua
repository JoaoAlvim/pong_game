 


--love.graphics.setFont(love.graphics.newFont(28))
--love.graphics.getWidth()
--love.graphics.getHeight()

function love.load()
	speed = 10
	pe = 0 
	pd = 0
	love.graphics.setBackgroundColor(0,0,0)
	love.window.setMode(1050, 700)

	vx = speed * math.cos(math.deg(1))  
    vy = speed * math.sin(math.deg(1))     

	d = {x = 1000, y = love.graphics.getHeight()/2-55,w = 28,h = 105}
	e = {x = 25, y = love.graphics.getHeight()/2-55,w = 28,h = 105}
	bo = {x = love.graphics.getWidth()/2, y = love.graphics.getHeight()/2,w = 15,h = 15}


end

function love.update(dt)
	if love.keyboard.isDown('up') then
		d.y = d.y - 8

    end
    if love.keyboard.isDown('down') then
    	d.y = d.y + 8

    end
    if love.keyboard.isDown('w') then
    	e.y = e.y - 8

    end
    if love.keyboard.isDown('s') then
    	e.y = e.y - - 8

    end
    if d.y < 0 then 
    	d.y = 0
    end
    if d.y > love.graphics.getHeight()-d.h then
    	d.y = love.graphics.getHeight() - d.h
    end
    if e.y < 0 then 
    	e.y = 0
    end
    if e.y > love.graphics.getHeight()-e.h then
    	e.y = love.graphics.getHeight() - e.h
    end



 

   	bo.x = bo.x + vx 
   	bo.y = bo.y + vy

    if bo.y < 0+bo.w or bo.y+bo.w > love.graphics.getHeight() then
    	vy = -vy
    	sound = love.audio.newSource("pop.mp3")
		love.audio.play(sound)

    end

   
    if bo.y > d.y and bo.y < d.y + d.h and bo.x+bo.w > d.x and bo.x+bo.w <d.x + 7 then
    	vx = -vx
    	sound = love.audio.newSource("pop.mp3")
		love.audio.play(sound)

    end
    if bo.y < e.y+e.h and bo.y > e.y and bo.x-bo.w < e.x+e.w and bo.x -bo.w > e.x+e.w/2 then
    	vx = -vx
    	sound = love.audio.newSource("pop.mp3")
		love.audio.play(sound)

    end




    if bo.x > love.graphics.getWidth() then
    	bo.x = love.graphics.getWidth()/2
   		bo.y = love.graphics.getHeight()/2
   		vx = speed*math.cos(math.deg(1))--love.math.random(-30,30)))
    	vy = speed*math.sin(math.deg(1))--love.math.random(-30,30)))
    	pe = pe +1 
    end

    if bo.x < 0 then
    	bo.x = love.graphics.getWidth()/2
   		bo.y = love.graphics.getHeight()/2
   		vx = speed*math.cos(math.deg(1))--love.math.random(-30,30)))
    	vy = speed*math.sin(math.deg(1))--love.math.random(-30,30)))
    	pd = pd +1
    end


end


function love.draw()
	love.graphics.print(pd,love.graphics.getWidth()/2+50, 45)
	love.graphics.print(pe,love.graphics.getWidth()/2-85, 45)
	love.graphics.setFont(love.graphics.newFont(55))

	love.graphics.line(love.graphics.getWidth()/2,0,love.graphics.getWidth()/2,love.graphics.getHeight())

	love.graphics.rectangle('fill',d.x,d.y,d.w,d.h)
	love.graphics.setColor(255,255,255)

	love.graphics.rectangle('fill',e.x,e.y,e.w,e.h)
	love.graphics.setColor(255,255,255)

	love.graphics.circle('fill',bo.x,bo.y,bo.w,bo.h)
	love.graphics.setColor(255,255,255)


end



















