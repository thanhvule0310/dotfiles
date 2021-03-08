local awful = require("awful")
local naughty = require("naughty")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

-- This awful.wibar will be placed at the bottom and contain the notifications.
local notif_wb = awful.wibar {
  position = 'bottom',
  height   = 48,
  visible  = #naughty.active > 0,
}

notif_wb:setup {
  nil,
  {
      base_layout = wibox.widget {
          spacing_widget = wibox.widget {
              orientation = 'vertical',
              span_ratio  = 0.5,
              widget      = wibox.widget.separator,
          },
          forced_height = 30,
          spacing       = 3,
          layout        = wibox.layout.flex.horizontal
      },
      widget_template = {
          {
              naughty.widget.icon,
              {
                  naughty.widget.title,
                  naughty.widget.message,
                  {
                      layout = wibox.widget {
                          -- Adding the wibox.widget allows to share a
                          -- single instance for all spacers.
                          spacing_widget = wibox.widget {
                              orientation = 'vertical',
                              span_ratio  = 0.9,
                              widget      = wibox.widget.separator,
                          },
                          spacing = 3,
                          layout  = wibox.layout.flex.horizontal
                      },
                      widget = naughty.list.widgets,
                  },
                  layout = wibox.layout.align.vertical
              },
              spacing = 10,
              fill_space = true,
              layout  = wibox.layout.fixed.horizontal
          },
          margins = 5,
          widget  = wibox.container.margin
      },
      widget = naughty.list.notifications,
  },
  -- Add a button to dismiss all notifications, because why not.
  {
      {
          text   = 'Dismiss all',
          align  = 'center',
          valign = 'center',
          widget = wibox.widget.textbox
      },
      buttons = gears.table.join(
          awful.button({ }, 1, function() naughty.destroy_all_notifications() end)
      ),
      forced_width       = 75,
      shape              = gears.shape.rounded_bar,
      shape_border_width = 1,
      shape_border_color = beautiful.bg_highlight,
      widget = wibox.container.background
  },
  layout = wibox.layout.align.horizontal
}

-- We don't want to have that bar all the time, only when there is content.
naughty.connect_signal('property::active', function()
  notif_wb.visible = #naughty.active > 0
end)