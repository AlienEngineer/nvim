return {
  -- Add PHP treesitter parser for correct indentation with = key
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "php", "html" })
    end,
  },

  -- Configure formatter for PHP files
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "php_cs_fixer" },
      },
    },
  },

  -- Install php-cs-fixer via Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "php-cs-fixer" },
    },
  },
}
