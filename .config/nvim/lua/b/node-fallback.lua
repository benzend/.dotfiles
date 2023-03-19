local trim = function(str)
  return string.gsub(str, '^%s*(.-)%s*$', '%1')
end

local get_trim_index_of = function(str)
  return string.len(str) + 1
end


local popen_output = function(cmd)
	local handle = assert(io.popen(cmd, 'r'))

  if not handle then return nil end

  local result = handle:read('*all')

	handle:close()

	return result
end

local is_unix = vim.fn.has('unix') == 1

local nvm_default_path = string.sub(
  trim(popen_output('echo $NVM_DEFAULT_NODE_PATH')), 0, get_trim_index_of('/node') * -1
)

if is_unix and nvm_default_path then
  vim.env.PATH = nvm_default_path .. ':' .. vim.env.PATH
end
