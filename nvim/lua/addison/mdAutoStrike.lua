vim.api.nvim_create_autocmd({"TextChanged", "TextChangedI"}, {
  pattern = "*.md",
  callback = function()
    local line = vim.api.nvim_get_current_line()
    local row = vim.api.nvim_win_get_cursor(0)[1]
    
    -- Add strikethrough when checking [x]
    if line:match("^%s*- %[x%] [^~]") and not line:match("~.+~$") then
      local indent, content = line:match("^(%s*- %[x%] )(.+)$")
      if content then
        vim.api.nvim_set_current_line(indent .. "~" .. content .. "~")
      end
    end
    
    -- Remove strikethrough when unchecking [ ]
    if line:match("^%s*- %[ %] ~.+~$") then
      local indent, content = line:match("^(%s*- %[ %] )~(.+)~$")
      if content then
        vim.api.nvim_set_current_line(indent .. content)
      end
    end
  end,
})
