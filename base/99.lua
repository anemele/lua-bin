--[[
1. lua print�ỻ��
2. lua �ַ����ƺ���������
]]

function strcat(x, y)
	return string.format('%s%s', x, y)
end

result = ''
for i = 1,9 do
	for j = 1,i do
		result = strcat(result, string.format('%d��%d=%d\t',j,i,i*j))
	end
	result = strcat(result, '\n')
end
print(result)
