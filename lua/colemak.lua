local colemak = {}

local mappings = {
    -- Up/down/left/right
    { modes = { "n", "o", "x" }, lhs = "n", rhs = "h", desc = "Left (h)" },
    { modes = { "n", "o", "x" }, lhs = "u", rhs = "k", desc = "Up (k)" },
    { modes = { "n", "o", "x" }, lhs = "e", rhs = "j", desc = "Down (j)" },
    { modes = { "n", "o", "x" }, lhs = "i", rhs = "l", desc = "Right (l)" },

    -- Beginning/end of line
    { modes = { "n", "o", "x" }, lhs = "L", rhs = "^", desc = "First non-blank character" },
    { modes = { "n", "o", "x" }, lhs = "Y", rhs = "$", desc = "End of line" },

    -- PageUp/PageDown
    { modes = { "n", "x" }, lhs = "j", rhs = "<PageUp>", desc = "DESC" },
    { modes = { "n", "x" }, lhs = "h", rhs = "<PageDown>", desc = "DESC" },

    -- Jumplist navigation
    { modes = { "n" }, lhs = "<C-u>", rhs = "<C-i>", desc = "Jumplist forward" },
    { modes = { "n" }, lhs = "<C-e>", rhs = "<C-o>", desc = "Jumplist forward" },

    -- Word left/right
    { modes = { "n", "o", "x" }, lhs = "l", rhs = "b", desc = "Word back" },
    { modes = { "n", "o", "x" }, lhs = "y", rhs = "w", desc = "Word forward" },
    { modes = { "n", "o", "v" }, lhs = "<C-l>", rhs = "B", desc = "WORD back" },
    { modes = { "n", "o", "v" }, lhs = "<C-y>", rhs = "W", desc = "WORD forward" },

    -- End of word left/right
    { modes = { "n", "o", "x" }, lhs = "N", rhs = "ge", desc = "End of word back" },
    { modes = { "n", "o", "x" }, lhs = "I", rhs = "e", desc = "End of word forward" },

    -- Text objects
    -- diw is drw. daw is now dtw.
    { modes = { "o", "v" }, lhs = "r", rhs = "i", desc = "O/V mode: inner (i)" },
    { modes = { "o", "v" }, lhs = "t", rhs = "a", desc = "O/V mode: a/an (a)" },
    -- Move visual replace from 'r' to 'R'
    { modes = { "o", "v" }, lhs = "R", rhs = "r", desc = "Replace" },

    -- Folds
    { modes = { "n", "x" }, lhs = "b", rhs = "z" },
    { modes = { "n", "x" }, lhs = "bb", rhs = "zb", desc = "Scroll line and cursor to bottom" },
    { modes = { "n", "x" }, lhs = "bu", rhs = "zk", desc = "Move up to fold" },
    { modes = { "n", "x" }, lhs = "be", rhs = "zj", desc = "Move down to fold" },

    -- Copy/paste
    { modes = { "n", "o", "x" }, lhs = "c", rhs = "y" },
    { modes = { "n", "x" }, lhs = "v", rhs = "p" },
    { modes = { "n" }, lhs = "C", rhs = "y$" },
    { modes = { "x" }, lhs = "C", rhs = "y" },
    { modes = { "n", "x" }, lhs = "V", rhs = "P" },

    -- Undo/redo
    { modes = { "n" }, lhs = "z", rhs = "u" },
    { modes = { "n" }, lhs = "gz", rhs = "U" },
    { modes = { "n" }, lhs = "Z", rhs = "<C-r>" },

    -- inSert/append (T)
    { modes = { "n" }, lhs = "s", rhs = "i" },
    { modes = { "n" }, lhs = "S", rhs = "I" },
    { modes = { "n" }, lhs = "t", rhs = "a" },
    { modes = { "n" }, lhs = "T", rhs = "A" },

    -- Change
    { modes = { "n", "o", "x" }, lhs = "w", rhs = "c" },
    { modes = { "n", "x" }, lhs = "W", rhs = "C" },

    -- Visual mode
    { modes = { "n", "x" }, lhs = "a", rhs = "v" },
    { modes = { "n", "x" }, lhs = "A", rhs = "V" },

    -- Insert in Visual mode
    { modes = { "v" }, lhs = "S", rhs = "I" },

    -- Search
    { modes = { "n", "o", "x" }, lhs = "k", rhs = "n" },
    { modes = { "n", "o", "x" }, lhs = "K", rhs = "N" },

    -- 'til
    -- Breaks diffput
    { modes = { "n", "o", "x" }, lhs = "p", rhs = "t" },
    { modes = { "n", "o", "x" }, lhs = "P", rhs = "T" },

    -- Fix diffput (t for 'transfer')
    { modes = { "n" }, lhs = "dt", rhs = "dp", desc = "diffput (t for 'transfer')" },

    -- Macros (replay the macro recorded by qq)
    { modes = { "n" }, lhs = "Q", rhs = "@q", desc = "replay the 'q' macro" },

    -- Cursor to bottom of screen
    -- H and M haven't been remapped, only L needs to be mapped
    { modes = { "n" }, lhs = "B", rhs = "L" },
    { modes = { "v" }, lhs = "B", rhs = "L" },

    -- Misc overridden keys must be prefixed with g
    { modes = { "n", "x" }, lhs = "gX", rhs = "X" },
    { modes = { "n", "x" }, lhs = "gU", rhs = "U" },
    { modes = { "n", "x" }, lhs = "gQ", rhs = "Q" },
    { modes = { "n", "x" }, lhs = "gK", rhs = "K" },
    -- extra alias
    { modes = { "n" }, lhs = "gh", rhs = "K" },
    { modes = { "x" }, lhs = "gh", rhs = "K" },

    -- Window navigation
    { modes = { "n" }, lhs = "<C-w>n", rhs = "<C-w>h" },
    { modes = { "n" }, lhs = "<C-w>u", rhs = "<C-w>k" },
    { modes = { "n" }, lhs = "<C-w>e", rhs = "<C-w>j" },
    { modes = { "n" }, lhs = "<C-w>i", rhs = "<C-w>l" },
    { modes = { "n" }, lhs = "<C-w>N", rhs = "<C-w>H" },
    { modes = { "n" }, lhs = "<C-w>U", rhs = "<C-w>K" },
    { modes = { "n" }, lhs = "<C-w>E", rhs = "<C-w>J" },
    { modes = { "n" }, lhs = "<C-w>I", rhs = "<C-w>L" },
    -- Disable spawning empty buffer
    { modes = { "n" }, lhs = "<C-w><C-n>", rhs = "<nop>" },
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
