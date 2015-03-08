--------------------------------------------------------------------

-- Rotating hubTopic bot

-- By bobbyToor

-- This script rotates the hub topic after a specified interval of time

--------------------------------------------------------------------

timeInterval = 2000  -- specify time interval in milliseconds
flag = true

OnStartup = function()
TmrMan.AddTimer(timeInterval,setTopic)
end


setTopic = function()

if flag == true then
file = io.open('')
flag = false
end

str = file:read()

if str == nil then 
file:close()
file = io.open('') -- specify file path where hub topics are stored , each in a new line
str = file:read()
end

SetMan.SetString(0,'hubname - '..str)

end
