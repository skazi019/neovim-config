local colorscheme = "tokyonight-night"

local function has_value (list, val)
    for index, value in ipairs(list) do
        if value == val then
            return true
        end
    end

    return false
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

if has_value({"rose-pine-main", "rose-pine-moon", "rose-pine-dawn"}, colorscheme) then
    require "kaushal.rose-pine-setup"
end

-- if string.match(colorscheme, "tokyo-night") then
--     require "kaushal.tokyo-night-setup"
-- end
