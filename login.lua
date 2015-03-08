-------------------------------------------------------------

-- The Login bot

-- By bobbyToor

-- This is the login script which displays Hub rules,name,address,uptime,users online, user nick,share,hubcount,ip,dorm on hub login
-- dorm IP's are stored in an external file


-------------------------------------------------------------



function OpConnected(user)
UserConnected(user)
end

function RegConnected(user)
UserConnected(user)
end


UserConnected=function(user)


	--------------Rules-----------------------------------
	local file = io.open("") -- specify file path containing rules
	Core.SendToUser(user,file:read("*a"))
	file:close()
	
	---------------info--------------------------------------
	
	Core.GetUserAllData(user)
	local Share = Core.GetUserValue(user,16) or 0
	local bdr = "\t\t"..string.rep("=",36)..""
	local days = math.floor(Core.GetUpTime()/86400)
	local hrs = math.floor(Core.GetUpTime()/3600)
	local minu = math.floor(Core.GetUpTime()/60)-hrs*60
	local sec = Core.GetUpTime()-math.floor(Core.GetUpTime()/60)*60
	local Msg = "\r\n\r\n"..bdr.."\r\n"..
	"\t\t Hub Name	: "..SetMan.GetString(0).."\r\n"..
	"\t\t Hub Address	: "..SetMan.GetString(2)..":"..SetMan.GetString(3).."\r\n"..
	"\t\t Hub Uptime	: "..days.." Days "..hrs.." Hrs "..minu.." Mins "..sec.." Secs\r\n"..
	"\t\t Date And Time	: "..os.date("%d %B %Y - %X ").."\r\n"..
	"\t\t Total Users Online	: "..Core.GetMaxUsersPeak().."\r\n"..
	"\t\t Your Nick	: "..user.sNick.."\r\n"..
	"\t\t Your Share	: "..FormatSize(user.iShareSize).."\r\n"..
	"\t\t Your HubCount   :  "..Core.GetUserValue(user,17).."\r\n"..
	"\t\t Your IP		: "..user.sIP.."\r\n"..
	"\t\t Your Bhawan        : "..BhawanChk(user.sIP).."\r\n"..bdr -- BhawanChk is the dorm check function
	Core.SendToUser(user,Msg)
	

	
end


FormatSize = function(intSize)
	local tUnits = { "B", "KB", "MB", "GB", "TB" }
	intSize = tonumber(intSize);
	if intSize ~= 0 then
		local sUnits;
		for index = 1, #tUnits do
			if(intSize < 1024) then
				sUnits = tUnits[index]
				break
			else
				intSize = intSize / 1024
			end
		end
		return string.format("%0.2f %s",intSize, sUnits)
	end
	return string.format("%0.2f %s",0, tUnits[1])
end


BhawanChk = function(ip)
file1 = io.open("") -- specify file path containing dorm IP's records
while true do
line = file1:read()
--if line == nil then break end
if string.find(line,string.match(ip,"%d+",8)) ~= nil  
then
return string.match(line,"%a+")   
end
end

file1:close()
return "unknown"
end


