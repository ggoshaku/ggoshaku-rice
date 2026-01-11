return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<C-\>]], -- Toggles the terminal
      direction = "float",      -- 'float', 'horizontal', or 'vertical'
      float_opts = {
        border = "curved",
      },
    })

    -- Function to run the current python file in a terminal
    local function run_python()
      -- Saves the file before running
      vim.cmd("w") 
      -- Sends the run command to terminal #1
      local cmd = "python3 " .. vim.fn.expand("%")
      require("toggleterm.terminal").Terminal:new({ cmd = cmd, hidden = true }):toggle()
    end

    -- Map <leader>r to run the current python file
    vim.keymap.set("n", "<leader>r", run_python, { desc = "Run Python file" })
  end
}

