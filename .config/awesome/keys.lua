local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

-- {{{ Key bindings

-- General Awesome keys
awful.keyboard.append_global_keybindings({
  awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
            {description="show help", group="awesome"}),
  awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
            {description = "show main menu", group = "awesome"}),
  awful.key({ modkey, "Control" }, "r", awesome.restart,
            {description = "reload awesome", group = "awesome"}),
  awful.key({ modkey, "Shift"   }, "q", awesome.quit,
            {description = "quit awesome", group = "awesome"}),
  -- awful.key({ modkey }, "x",
  --           function ()
  --               awful.prompt.run {
  --                 prompt       = "Run Lua code: ",
  --                 textbox      = awful.screen.focused().mypromptbox.widget,
  --                 exe_callback = awful.util.eval,
  --                 history_path = awful.util.get_cache_dir() .. "/history_eval"
  --               }
  --           end,
  --           {description = "lua execute prompt", group = "awesome"}),
  awful.key({ modkey,           }, "t", function () awful.spawn(terminal) end,
            {description = "open a terminal", group = "launcher"}),
  awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
            {description = "run prompt", group = "launcher"}),
  awful.key({ modkey }, "p", function() menubar.show() end,
            {description = "show the menubar", group = "launcher"}),
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
  awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
            {description = "view previous", group = "tag"}),
  awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
            {description = "view next", group = "tag"}),
  awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
            {description = "go back", group = "tag"}),
})
-- Launcher keybindings
awful.keyboard.append_global_keybindings({
  awful.key({ modkey,           }, "b", function () awful.spawn("google-chrome-stable") end,
            {description = "open google chrome", group = "launcher"}),
  awful.key({ modkey,           }, "x", function () awful.spawn("/home/vu/.bin/powermenu.sh") end,
            {description = "open Power Menu", group = "launcher"}),
            awful.key({ modkey,           }, "d", function () awful.spawn("/home/vu/.bin/launcher.sh") end,
            {description = "open Launcher", group = "launcher"}),
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
  awful.key({ modkey,           }, "j",
      function ()
          awful.client.focus.byidx( 1)
      end,
      {description = "focus next by index", group = "client"}
  ),
  awful.key({ modkey,           }, "k",
      function ()
          awful.client.focus.byidx(-1)
      end,
      {description = "focus previous by index", group = "client"}
  ),
  awful.key({ modkey,           }, "Tab",
      function ()
          awful.client.focus.history.previous()
          if client.focus then
              client.focus:raise()
          end
      end,
      {description = "go back", group = "client"}),
  awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
            {description = "focus the next screen", group = "screen"}),
  awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
            {description = "focus the previous screen", group = "screen"}),
  awful.key({ modkey, "Control" }, "n",
            function ()
                local c = awful.client.restore()
                -- Focus restored client
                if c then
                  c:activate { raise = true, context = "key.unminimize" }
                end
            end,
            {description = "restore minimized", group = "client"}),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
  awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
            {description = "swap with next client by index", group = "client"}),
  awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
            {description = "swap with previous client by index", group = "client"}),
  awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
            {description = "jump to urgent client", group = "client"}),
  awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
            {description = "increase master width factor", group = "layout"}),
  awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
            {description = "decrease master width factor", group = "layout"}),
  awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
            {description = "increase the number of master clients", group = "layout"}),
  awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
            {description = "decrease the number of master clients", group = "layout"}),
  awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
            {description = "increase the number of columns", group = "layout"}),
  awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
            {description = "decrease the number of columns", group = "layout"}),
  awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
            {description = "select next", group = "layout"}),
  awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
            {description = "select previous", group = "layout"}),
})


awful.keyboard.append_global_keybindings({
  awful.key {
      modifiers   = { modkey },
      keygroup    = "numrow",
      description = "only view tag",
      group       = "tag",
      on_press    = function (index)
          local screen = awful.screen.focused()
          local tag = screen.tags[index]
          if tag then
              tag:view_only()
          end
      end,
  },
  awful.key {
      modifiers   = { modkey, "Control" },
      keygroup    = "numrow",
      description = "toggle tag",
      group       = "tag",
      on_press    = function (index)
          local screen = awful.screen.focused()
          local tag = screen.tags[index]
          if tag then
              awful.tag.viewtoggle(tag)
          end
      end,
  },
  awful.key {
      modifiers = { modkey, "Shift" },
      keygroup    = "numrow",
      description = "move focused client to tag",
      group       = "tag",
      on_press    = function (index)
          if client.focus then
              local tag = client.focus.screen.tags[index]
              if tag then
                  client.focus:move_to_tag(tag)
              end
          end
      end,
  },
  awful.key {
      modifiers   = { modkey, "Control", "Shift" },
      keygroup    = "numrow",
      description = "toggle focused client on tag",
      group       = "tag",
      on_press    = function (index)
          if client.focus then
              local tag = client.focus.screen.tags[index]
              if tag then
                  client.focus:toggle_tag(tag)
              end
          end
      end,
  },
  awful.key {
      modifiers   = { modkey },
      keygroup    = "numpad",
      description = "select layout directly",
      group       = "layout",
      on_press    = function (index)
          local t = awful.screen.focused().selected_tag
          if t then
              t.layout = t.layouts[index] or t.layout
          end
      end,
  }
})