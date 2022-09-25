Complex = {real=0, imag=0}

function Complex:new(o)
	local o = o or {}
	setmetatable(o,self)
	self.__index = self
	return o
end

function Complex:__tostring()
	if self.imag >= 0 then
		if self.imag == 1 then
			return self.real .. '+i'
		end
		return self.real .. '+' .. self.imag .. 'i'
	else
		if self.imag == -1 then
			return self.real .. '-i'
		end
		return self.real .. '-' .. self.imag .. 'i'
	end
end

function Complex:__add(other)
	return Complex:new({real=self.real+other.real,imag=self.imag+other.imag})
end

function Complex:__sub(other)
	return Complex:new({real=self.real-other.real,imag=self.imag-other.imag})
end

function Complex:__mul(other)
	return Complex:new({real=self.real*other.real-self.imag*other.imag,imag=self.real*other.imag+self.imag*other.real})
end

function Complex:__unm()
	return Complex:new({real=-self.real,imag=-self.imag})
end

function Complex:__eq(other)
	return self.real==other.real and self.imag==other.imag
end

function Complex:abs()
	return math.sqrt(self.real^2+self.imag^2)
end

function Complex:angle()
	return math.deg(math.atan(self.real/self.imag))
end

function Complex:conjugate()
	return Complex:new({real=self.real,imag=-self.imag})
end

a = Complex:new({real=1,imag=1})
b = Complex:new({real=1,imag=2})
c = a+b
d = a*b

print(a,b,c,d,-a,a==a,-a==a)
print(a:abs())
print(a:angle())
print(a:conjugate())
