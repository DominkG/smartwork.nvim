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

return M
