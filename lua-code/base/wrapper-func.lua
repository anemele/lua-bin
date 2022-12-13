--[[
Wrapper function demo
Lua does not distinguish float and integer, which causes some problems at cases.
--]]

function _factorial(x, step)
	if step == nil then step = 1 end
	if x <= 1 then return 1 end
	return x * _factorial(x-step)
end

function factorial(x, step)
	local x = math.floor(x)
	if x < 0 then
		error('Can not do factorial for a negetive number') 
	end
	return _factorial(x, step)
end

function double_factorial(x)
	return factorial(x, 2)
end

print(factorial(5))
print(double_factorial(5))
print(factorial(5.5))
print(factorial(0.1))
print(factorial(-1))
