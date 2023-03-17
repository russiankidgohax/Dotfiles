local M = {}
local toggle = true

function M.ToggleTransparent()
    require('dracula').setup({
        transparent_bg = toggle
    })
    toggle = not toggle
end

return M
