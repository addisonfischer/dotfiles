require('addison')
require('mason').setup()

-- Clean up orphaned ShaDa temp files on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local shada_path = vim.fn.stdpath('data') .. '/shada/'
    local pattern = shada_path .. 'main.shada.tmp.*'
    
    -- Use vim.fn.glob to find matching files
    local files = vim.fn.glob(pattern, false, true)
    
    for _, file in ipairs(files) do
      -- Try to delete, ignore errors
      pcall(vim.fn.delete, file)
    end
  end,
})


