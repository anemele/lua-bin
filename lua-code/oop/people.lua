Person = {name='name',age=0,gendar='M'}

function Person:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	return o
end

function Person:info()
	print(string.format('%s is a %d years old %s',self.name,self.age,self.gendar))
end


local p1 = Person:new({name='Zhangsan',age=10})
p1:info()


Student = {}

function Student:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	
	setmetatable(self,Person)
	Person.__index = Person
	
	return o
end

-- Override
function Student:info()
	print(string.format('%s is %d years old student',self.name,self.age))
end

function Student:study()
	print(string.format('%d years old %s is studying', self.age,self.name))
end


local s1 = Student:new({name='Lisi',age=9,gendar='M'})
s1:info()
s1:study()
