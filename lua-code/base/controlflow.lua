--[[
]]

-- branch
if true then
	print(true)
elseif false then
	print(false)
elseif nil then
	print(nil)
else
	print('Nothing selected')
end

-- loop
i=0
while i < 10 do
	print(i)
	i=i+1
end

i=0
repeat
	print(i)
	i=i+1
until i >= 10

for i=0,9 do
	print(i)
end
