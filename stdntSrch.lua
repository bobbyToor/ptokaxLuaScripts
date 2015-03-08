
-- ToArrival function used for running command in a private char
ToArrival=function (user,data)

local msg = string.match(tostring(data),'%<.-%>%s+(.-)%|')

if string.match(msg,'...') == '+ss' then
local input = string.sub(msg,5)
Core.SendPmToUser(user,user.sNick,stdntSrch(input))

end
end


ChatArrival= function(user,data)
local msg = string.match(tostring(data),'%<.-%>%s+(.-)%|')

if string.match(msg,'...') == '+ss' then
local input = string.sub(msg,5)
Core.SendToUser(user,stdntSrch(input))

end
return true

end


function stdntSrch(inp)
--specify file path containing database	
file = io.open('','r')
local rsltCnt=0
local rslt=''
fname,fid,fhstl,frno,fsx = string.match(inp,'(.+);(.+);(.+);(.+);(.+)')

if fname==nil or fid==nil or fhstl==nil or frno==nil or fsx==nil then return 'Please follow the correct format for this command.\nYou can use this command in a private chat with anyone(even yourself) to avoid its log in main chat.' end

if fname=='_' then fname='' else fname = string.upper(fname) end
if fid=='_' then fid='' else fid = string.upper(fid) end
if fhstl=='_' then fhstl='' else fhstl = string.upper(fhstl) end
if frno=='_' then frno='' else frno = string.upper(frno) end
if fsx=='_' then fsx='' else fsx = string.upper(fsx) end


local noRec=0   --initialise number of records in the database here

for f=1,noRec do
str = file:read()
id,name,hstl,rno,sx = string.match(str,'(.-)%s%s+(.-)%s%s+(.-)%s%s+(.-)%s%s+(%a)')

if string.match(name,fname) == fname then
if string.match(id,fid) == fid then
if string.match(hstl,fhstl) == fhstl then
if string.match(rno,frno) == frno then
if string.match(sx,fsx) == fsx then
if rno == '0' then rno = '000' end
rslt = rslt..id..'-=-'..sx..'--==--'..hstl..'--===--'..rno..'--=--'..name..'\n'
rsltCnt = rsltCnt + 1
 end
 end
 end
 end
 end


end
return '\n\n           ID              SEX     HOSTEL      ROOMNO.    NAME\n\n'..rslt..'\n-----==-----Total results obtained : '..rsltCnt..' -----==-----\n'
end




