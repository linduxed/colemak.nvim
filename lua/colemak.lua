local colemak = {}

local mappings = {
    -- Up/down/left/right
    { modes = { "n", "o", "x" }, lhs = "n", rhs = "h", desc = "DESC" },
    { modes = { "n", "o", "x" }, lhs = "u", rhs = "k", desc = "DESC" },
    { modes = { "n", "o", "x" }, lhs = "e", rhs = "j", desc = "DESC" },
    { modes = { "n", "o", "x" }, lhs = "i", rhs = "l", desc = "DESC" },

    -- Beginning/end of line
    { modes = { "n", "o", "x" }, lhs = "L", rhs = "^", desc = "DESC" },
    { modes = { "n", "o", "x" }, lhs = "Y", rhs = "$", desc = "DESC" },

    -- PageUp/PageDown
    { modes = { "n", "x" }, lhs = "j", rhs = "<PageUp>", desc = "DESC" },
    { modes = { "n", "x" }, lhs = "h", rhs = "<PageDown>", desc = "DESC" },

    -- Jumplist navigation
    { modes = { "n", "v" }, lhs = "<C-u>", rhs = "<C-i>", desc = "DESC" },
    { modes = { "n", "v" }, lhs = "<C-e>", rhs = "<C-o>", desc = "DESC" },

    -- Word left/right
    { modes = { "n", "o", "x" }, lhs = "l", rhs = "b", desc = "DESC" },
    { modes = { "n", "o", "x" }, lhs = "y", rhs = "w", desc = "DESC" },
    { modes = { "n", "o", "v" }, lhs = "<C-l>", rhs = "B", desc = "DESC" },
    { modes = { "n", "o", "v" }, lhs = "<C-y>", rhs = "W", desc = "DESC" },

    -- End of word left/right
    { modes = { "n", "o", "x" }, lhs = "N", rhs = "ge", desc = "DESC" },
    { modes = { "n", "o", "x" }, lhs = "I", rhs = "e", desc = "DESC" },

    -- Text objects
    -- diw is drw. daw is now dtw.
    { modes = { "o", "v" }, lhs = "r", rhs = "i", desc = "DESC" },
    { modes = { "o", "v" }, lhs = "t", rhs = "a", desc = "DESC" },
    -- Move visual replace from 'r' to 'R'
    { modes = { "o", "v" }, lhs = "R", rhs = "r", desc = "DESC" },

    -- Folds
    { modes = { "n", "x" }, lhs = "b", rhs = "z", desc = "DESC" },
    { modes = { "n", "x" }, lhs = "bb", rhs = "zb", desc = "DESC" },
    { modes = { "n", "x" }, lhs = "bu", rhs = "zk", desc = "DESC" },
    { modes = { "n", "x" }, lhs = "be", rhs = "zj", desc = "DESC" },

    -- Copy/paste
    { modes = { "n", "o", "x" }, lhs = "c", rhs = "y", desc = "DESC" },
    { modes = { "n", "x" }, lhs = "v", rhs = "p", desc = "DESC" },
    { modes = { "n" }, lhs = "C", rhs = "y$", desc = "DESC" },
    { modes = { "x" }, lhs = "C", rhs = "y", desc = "DESC" },
    { modes = { "n", "x" }, lhs = "V", rhs = "P", desc = "DESC" },

    -- Undo/redo
    { modes = { "n" }, lhs = "z", rhs = "u", desc = "DESC" },
    { modes = { "n" }, lhs = "gz", rhs = "U", desc = "DESC" },
    { modes = { "n" }, lhs = "Z", rhs = "<C-r>", desc = "DESC" },

    -- inSert/append (T)
    { modes = { "n" }, lhs = "s", rhs = "i", desc = "DESC" },
    { modes = { "n" }, lhs = "S", rhs = "I", desc = "DESC" },
    { modes = { "n" }, lhs = "t", rhs = "a", desc = "DESC" },
    { modes = { "n" }, lhs = "T", rhs = "A", desc = "DESC" },

    -- Change
    { modes = { "n", "o", "x" }, lhs = "w", rhs = "c", desc = "DESC" },
    { modes = { "n", "x" }, lhs = "W", rhs = "C", desc = "DESC" },

    -- Visual mode
    { modes = { "n", "x" }, lhs = "a", rhs = "v", desc = "DESC" },
    { modes = { "n", "x" }, lhs = "A", rhs = "V", desc = "DESC" },

    -- Insert in Visual mode
    { modes = { "v" }, lhs = "S", rhs = "I", desc = "DESC" },

    -- Search
    { modes = { "n", "o", "x" }, lhs = "k", rhs = "n", desc = "DESC" },
    { modes = { "n", "o", "x" }, lhs = "K", rhs = "N", desc = "DESC" },

    -- 'til
    -- Breaks diffput
    { modes = { "n", "o", "x" }, lhs = "p", rhs = "t", desc = "DESC" },
    { modes = { "n", "o", "x" }, lhs = "P", rhs = "T", desc = "DESC" },

    -- Fix diffput (t for 'transfer')
    { modes = { "n" }, lhs = "dt", rhs = "dp", desc = "DESC" },

    -- Macros (replay the macro recorded by qq)
    { modes = { "n" }, lhs = "Q", rhs = "@q", desc = "DESC" },

    -- Cursor to bottom of screen
    -- H and M haven't been remapped, only L needs to be mapped
    { modes = { "n" }, lhs = "B", rhs = "L", desc = "DESC" },
    { modes = { "v" }, lhs = "B", rhs = "L", desc = "DESC" },

    -- Misc overridden keys must be prefixed with g
    { modes = { "n", "x" }, lhs = "gX", rhs = "X", desc = "DESC" },
    { modes = { "n", "x" }, lhs = "gU", rhs = "U", desc = "DESC" },
    { modes = { "n", "x" }, lhs = "gQ", rhs = "Q", desc = "DESC" },
    { modes = { "n", "x" }, lhs = "gK", rhs = "K", desc = "DESC" },
    -- extra alias
    { modes = { "n" }, lhs = "gh", rhs = "K", desc = "DESC" },
    { modes = { "x" }, lhs = "gh", rhs = "K", desc = "DESC" },

    -- Window navigation
    { modes = { "n", "x" }, lhs = "<C-w>n", rhs = "<C-w>h", desc = "DESC" },
    { modes = { "n", "x" }, lhs = "<C-w>u", rhs = "<C-w>k", desc = "DESC" },
    { modes = { "n", "x" }, lhs = "<C-w>e", rhs = "<C-w>j", desc = "DESC" },
    { modes = { "n", "x" }, lhs = "<C-w>i", rhs = "<C-w>l", desc = "DESC" },
    { modes = { "n" }, lhs = "<C-w>N", rhs = "<C-w>H", desc = "DESC" },
    { modes = { "x" }, lhs = "<C-w>n", rhs = "<C-w>h", desc = "DESC" },
    { modes = { "n" }, lhs = "<C-w>U", rhs = "<C-w>K", desc = "DESC" },
    { modes = { "x" }, lhs = "<C-w>u", rhs = "<C-w>k", desc = "DESC" },
    { modes = { "n" }, lhs = "<C-w>E", rhs = "<C-w>J", desc = "DESC" },
    { modes = { "x" }, lhs = "<C-w>e", rhs = "<C-w>j", desc = "DESC" },
    { modes = { "n" }, lhs = "<C-w>I", rhs = "<C-w>L", desc = "DESC" },
    { modes = { "x" }, lhs = "<C-w>i", rhs = "<C-w>l", desc = "DESC" },
    -- Disable spawning empty buffer
    { modes = { "n", "x" }, lhs = "<C-w><C-n>", rhs = "<nop>", desc = "DESC" },
}

function colemak.setup(_)
    colemak.apply()

    vim.api.nvim_create_user_command(
        "ColemakEnable",
        colemak.apply,
        { desc = "Applies Colemak mappings" }
    )
    vim.api.nvim_create_user_command(
        "ColemakDisable",
        colemak.unapply,
        { desc = "Removes Colemak mappings" }
    )
end

function colemak.apply()
    for _, mapping in pairs(mappings) do
        vim.keymap.set(
            mapping.modes,
            mapping.lhs,
            mapping.rhs,
            { desc = mapping.desc }
        )
    end
end

function colemak.unapply()
    for _, mapping in pairs(mappings) do
        vim.keymap.del(mapping.modes, mapping.lhs)
    end
end

return colemak
