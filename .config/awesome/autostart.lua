local awful = require("awful")

-- startup
awful.util.spawn("picom --experimental-backends")
awful.util.spawn("numlockx")