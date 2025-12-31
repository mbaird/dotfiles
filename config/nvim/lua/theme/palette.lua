local lush = require("lush")
local hsl = lush.hsl

local function blend(fg, bg, alpha)
  local f, b = fg.rgb, bg.rgb
  local function mix(x, y)
    return math.floor((alpha * x + (1 - alpha) * y) + 0.5)
  end
  return hsl(("#%02X%02X%02X"):format(mix(f.r, b.r), mix(f.g, b.g), mix(f.b, b.b)))
end

local palette = {
  base = hsl(32, 57, 95).li(30),
  surface = hsl(28, 45, 94),
  overlay = hsl(28, 43, 91).de(2).li(8),
  muted = hsl(257, 9, 61).de(20).da(10),
  subtle = hsl(248, 12, 52).de(20).da(20),
  text = hsl(248, 19, 40).de(20).da(20),
  love = hsl(343, 35, 55),
  gold = hsl(35, 81, 56),
  rose = hsl(3, 53, 67),
  pine = hsl(197, 53, 34),
  foam = hsl(189, 30, 48),
  iris = hsl(263, 38, 64),
  highlight_low = hsl(25, 35, 93),
  highlight_med = hsl(10, 9, 88),
  highlight_high = hsl(315, 4, 80),

  ochre = hsl(14, 63, 47).de(20),
  cerulean = hsl(218, 53, 46).de(20),
}

palette.fg = palette.text
palette.bg = palette.base

palette.panel = palette.overlay
palette.border = palette.muted

palette.error = palette.love.ro(4).abs_sa(20).abs_da(5)
palette.warn = palette.gold
palette.ok = palette.foam
palette.hint = palette.iris
palette.info = palette.cerulean

palette.pine_blend = blend(palette.pine, palette.base, 0.25)
palette.gold_blend = blend(palette.gold, palette.base, 0.2)
palette.iris_blend = blend(palette.iris, palette.base, 0.2)
palette.foam_blend = blend(palette.foam, palette.base, 0.2)
palette.love_blend = blend(palette.love, palette.base, 0.2)
palette.rose_blend = blend(palette.rose, palette.base, 0.2)

return palette
