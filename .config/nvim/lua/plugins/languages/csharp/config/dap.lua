local M = {}

-- Helper function to read file contents
local function read_file(path)
	local file = io.open(path, "r")
	if not file then
		return nil
	end
	local content = file:read("*all")
	file:close()
	return content
end

-- Helper function to find solution file in current directory or parent directories
local function find_solution_file()
	local current_dir = vim.fn.getcwd()
	local max_depth = 5

	while max_depth > 0 do
		local files = vim.fn.glob(current_dir .. "/*.sln", false, true)
		if #files > 0 then
			return files[1]
		end

		current_dir = vim.fn.fnamemodify(current_dir, ":h")
		max_depth = max_depth - 1
	end
	return nil
end

-- Main function to get the program DLL path
local function get_program_dll()
	local sln_path = find_solution_file()
	if not sln_path then
		print("No solution file found")
		return nil
	end

	local content = read_file(sln_path)
	if not content then
		print("Could not read solution file")
		return nil
	end

	for line in content:gmatch("[^\r\n]+") do
		local proj_path = line:match('Project%([^)]+%).%s*=%s*"[^"]+"%s*,%s*"([^"]+)"')
		if proj_path then
			local abs_path = vim.fn.fnamemodify(sln_path, ":h") .. "/" .. proj_path
			abs_path = abs_path:gsub("\\", "/")

			local proj_content = read_file(abs_path)
			if proj_content then
				local output_type = proj_content:match("<OutputType>([^<]+)</OutputType>")
				local assembly_name = proj_content:match("<AssemblyName>([^<]+)</AssemblyName>")

				if output_type and output_type:lower() == "exe" then
					local target_framework = proj_content:match("<TargetFramework>([^<]+)</TargetFramework>")
					if not target_framework then
						local frameworks = proj_content:match("<TargetFrameworks>([^<]+)</TargetFrameworks>")
						if frameworks then
							target_framework = frameworks:match("([^;]+)")
						end
					end

					if target_framework and assembly_name then
						local dll_path = vim.fn.fnamemodify(abs_path, ":h")
							.. "/bin/Debug/"
							.. target_framework
							.. "/"
							.. assembly_name
							.. ".dll"

						if vim.fn.filereadable(dll_path) == 1 then
							return dll_path
						end
					end
				end
			end
		end
	end

	print("No executable project found in solution")
	return nil
end

function M.setup()
	local dap = require("dap")

	dap.adapters.coreclr = {
		type = "executable",
		command = "/usr/local/netcoredbg",
		args = { "--interpreter=vscode" },
	}

	dap.configurations.cs = {
		{
			type = "coreclr",
			name = "launch - netcoredbg",
			request = "launch",
			program = function()
				local dll_to_debug = get_program_dll()
				if dll_to_debug == nil then
					vim.notify("No executable project found in solution")
				else
					return dll_to_debug
				end
			end,
		},
	}
end

return M
