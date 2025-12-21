if vim.env.TMUX then
  local function set_tmux_window_name()
    local filename = vim.fn.expand('%:t')  
    
    local cmd
    if filename ~= '' and filename ~= '.' then
      cmd = string.format('tmux rename-window "nvim: %s"', filename)
    else
      local dirname = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
      cmd = string.format('tmux rename-window "nvim: %s"', dirname)
    end
    
    local handle = io.popen(cmd)
    if handle then
      handle:close()
    end
  end
  
  vim.api.nvim_create_autocmd({'BufEnter', 'BufFilePost'}, {
    callback = set_tmux_window_name,
    desc = 'Set tmux window name to current file'
  })
  
  vim.api.nvim_create_autocmd('VimLeave', {
    callback = function()
      local dirname = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
      local handle = io.popen(string.format('tmux rename-window "%s"', dirname))
      if handle then
        handle:close()
      end
    end,
    desc = 'Restore directory name when leaving nvim'
  })
end
