return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    {
      "copilotlsp-nvim/copilot-lsp",
      init = function()
        vim.g.copilot_nes_debounce = 100
      end,
    },
  },
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      filetypes = {
        markdown = true,
        ["*"] = true,
      },
      nes = {
        enabled = false,
        keymap = {
          accept_and_goto = "<leader>cp",
          accept = false,
          dismiss = "<Esc>",
        },
      },
    })
  end,
}
