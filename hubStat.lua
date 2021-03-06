--------------------------------------------------------------------
-- The hubstat Bot

-- By bobbyToor

-- This script displays the hub statistics on the user query +hubStat
-- All the dorm names are like AK,RP,BG,MB etc.
-- Displays total online users and total share of each dorm active on the hub

--------------------------------------------------------------------



flag=0 

function OpConnected(user)
UserConnected(user)
end

function RegConnected(user)
UserConnected(user)
end

--returns hubstats when client gives in +hubstat command
function ChatArrival(user,data)
local msg = string.match(tostring(data),"%<.-%>%s(.-)%|")
if msg == "+hubstat" then
hubStat()
file1 = io.open("","r") --specify file path where stats are stored by hubstat function
	Core.SendToUser(user,file1:read("*a"))
	file1:close()
end
end



--returns hubstats when a user is connected
function UserConnected(user)
flag=1
hubStat(user)
flag=0
file1 = io.open("","r")
	Core.SendToUser(user,file1:read("*a"))
	file1:close()
end


--	ML,MB,AK,RP etc are all dorm names

hubStat = function(user)

local hubTbl = {["ML"]={0,0},["MB"]={0,0},["AK"]={0,0},["BG"]={0,0},["BD"]={0,0},["GN"]={0,0},["GN"]={0,0},["KR"]={0,0},["RM"]={0,0},["RP"]={0,0},["SK"]={0,0},["VK"]={0,0},["VY"]={0,0},["SR"]={0,0}}
local database = Core.GetOnlineUsers(true)
if flag==1 then
table.insert(database,{["sIP"]=user.sIP,["iShareSize"]=Core.GetUserValue(user,16)})
end

for i=1,#database do

---------to shorten code-----------------------------------------
local ml1=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 1
local ml2=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 2
local mb1=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 3
local mb2=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 4
local mb3=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 5
local mb4=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 6
local mb5=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 7
local mb6=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 8
local ml3=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 9
local mb7=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 10
local ml3=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 11
local ml4=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 12
local ml5=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 13
local as1=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 14
local as2=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 15
local bg1=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 16
local bg2=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 17
local bd1=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 18
local bd2=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 19
local gn1=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 20
local gn2=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 21
local kr1=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 22
local kr2=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 23
local rm1=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 24
local rm2=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 25
local rp1=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 26
local rp2=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 27
local sk1=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 28
local sk2=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 29
local vk1=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 30
local vk2=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 31
local vy1=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 32
local vy2=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 33
local sr1=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 34
local sr2=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 35
local sr3=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 36
local sr4=tonumber(string.match(database[i]["sIP"],"%d+",8)) == 37
---------------------------------------------------------------------------------------------------------------


if ml1 or ml2 or ml3 or ml4 or ml5 then
hubTbl["ML"]={hubTbl["ML"][1]+1,hubTbl["ML"][2]+tonumber(database[i]["iShareSize"])}
end

if mb1 or mb2 or mb3 or mb4 or mb5 or mb6 or mb7 then
hubTbl["MB"]={hubTbl["MB"][1]+1,hubTbl["MB"][2]+tonumber(database[i]["iShareSize"])}
end

if as1 or as2 then
hubTbl["AK"]={hubTbl["AK"][1]+1,hubTbl["AK"][2]+tonumber(database[i]["iShareSize"])}
end

if bg1 or bg2 then
hubTbl["BG"]={hubTbl["BG"][1]+1,hubTbl["BG"][2]+tonumber(database[i]["iShareSize"])}
end

if bd1 or bd2 then
hubTbl["BD"]={hubTbl["BD"][1]+1,hubTbl["BD"][2]+tonumber(database[i]["iShareSize"])}
end

if gn1 or gn2 then
hubTbl["GN"]={hubTbl["GN"][1]+1,hubTbl["GN"][2]+tonumber(database[i]["iShareSize"])}
end

if kr1 or kr2 then
hubTbl["KR"]={hubTbl["KR"][1]+1,hubTbl["KR"][2]+tonumber(database[i]["iShareSize"])}
end

if rm1 or rm2 then
hubTbl["RM"]={hubTbl["RM"][1]+1,hubTbl["RM"][2]+tonumber(database[i]["iShareSize"])}
end

if rp1 or rp2 then
hubTbl["RP"]={hubTbl["RP"][1]+1,hubTbl["RP"][2]+tonumber(database[i]["iShareSize"])}
end

if sk1 or sk2 then
hubTbl["SK"]={hubTbl["SK"][1]+1,hubTbl["SK"][2]+tonumber(database[i]["iShareSize"])}
end

if vk1 or vk2 then
hubTbl["VK"]={hubTbl["VK"][1]+1,hubTbl["VK"][2]+tonumber(database[i]["iShareSize"])}
end

if vy1 or vy2 then
hubTbl["VY"]={hubTbl["VY"][1]+1,hubTbl["VY"][2]+tonumber(database[i]["iShareSize"])}
end

if sr1 or sr2 or sr3 or sr4 then
hubTbl["SR"]={hubTbl["SR"][1]+1,hubTbl["SR"][2]+tonumber(database[i]["iShareSize"])}
end

end

file3=io.open("","w") -- specify file path where stats will be written

file3:write("\n\t\t\t\tHub Statistics\n\t\t==========================================\n")
file3:write("\t\tBhawan\t\tUsersOnline\tTotalShare\n")
file3:write("\t\t==========================================\n")

for k,v in pairs(hubTbl) do
file3:write("\t\t  "..k.."\t\t  "..hubTbl[k][1].."\t\t  "..FormatSize(hubTbl[k][2]).."\n")
end
file3:write("\n \t\t==========================================\n")

file3:close()



end

-- FormatSize () returns size with the corresponding size suffix
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
