print("SmartWork")

local M = {}

M.termin = function()
	vim.api.nvim_set_current_line("' () Termin:  ")
	vim.cmd("normal! $")
	vim.cmd("startinsert")
end

M.ticket = function()
	vim.api.nvim_set_current_line("' () Ticket:  ")
	vim.cmd("normal! $")
	vim.cmd("startinsert")
end

function M.dnslookup(domain)
	local domain = domain
	local word = vim.fn.getreg('') -- get blank/yank register
	local result = vim.system({ "dig", "+short", word .. "." .. domain }, { text = true }):wait()
	local ip = vim.trim(result.stdout)
	if ip == "" then
		vim.notify("Keine Adresse gefunden fuer" .. word .. "." .. domain .. " gefunden.", vim.log.levels.WARN)
		return
	end
	vim.cmd("normal! e")
	vim.api.nvim_put({"(" .. ip .. ")" }, "c", true, true)
end

function M.ipman()
	local word = vim.fn.getreg('') -- get blank/yank register
	local result = vim.system({ "ipman", "-a", word}, { text = true }):wait()
	local output = result.stdout or ""
	local lines = vim.split(output, "\n", { trimempty = true })
	vim.api.nvim_put(lines, "c", true, true)
end

return M
