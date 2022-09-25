--[[
Copy file function

-- fin:file input name
-- fon:file output name
-- mode:copy mode, plain text by default, anything but nil for binary file
]]

BLOCK_SIZE = 4096
ERR_MSG_FILE_NOT_EXIST = 'FileNotExistError: %s.'
ERR_MSG_FILE_NAME = 'TypeError: filenames both expect string.'

function copy(fin, fon, mode)
	if type(fin) ~= 'string' or type(fon) ~= 'string' then
		print(ERR_MSG_FILE_NAME)
		return
	end
	
	if type(mode) == 'nil' then
		rm = 'r'
		wm = 'w'
	else
		rm = 'rb'
		wm = 'wb'
	end
	
	local fi = io.open(fin, rm)
	if fi == nil then
		print(ERR_MSG_FILE_NOT_EXIST:format(fin))
		return
	end
	local fo = io.open(fon, wm)
	
	local b
	while true do
		b = fi:read(BLOCK_SIZE)
		if not b then break end
		fo:write(b)
	end
	fo:flush()
	fo:close()
	fi:close()
end
