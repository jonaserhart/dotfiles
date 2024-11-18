return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        require("custom.common.go-generate-test")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
            }
        })
    end
}