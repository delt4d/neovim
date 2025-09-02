return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function ()
        local npairs = require('nvim-autopairs')
        local Rule = require('nvim-autopairs.rule')

        npairs.setup({})

        npairs.add_rules({
            Rule("'''", "'''")
                :with_pair(function() return true end)
                :with_move(function() return false end)
                :with_del(function() return true end)
                :with_cr(function() return true end),

            Rule('"""', '"""')
                :with_pair(function() return true end)
                :with_move(function() return false end)
                :with_del(function() return true end)
                :with_cr(function() return true end),
        })
    end
}