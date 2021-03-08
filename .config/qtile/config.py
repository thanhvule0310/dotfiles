# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
import os
import subprocess

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

from custom.windowname import WindowName as CustomWindowName

import theme

mod = "mod4"
terminal = "alacritty"

keys = [
    # Apps
    Key([mod], "f", lazy.spawn(theme.default_apps["file_manager"]),
        desc="Launch file manager"),
    Key([mod], "b", lazy.spawn(theme.default_apps["browser"]),
        desc="Launch web browser"),
    Key([mod], "c", lazy.spawn(theme.default_apps["code"]),
        desc="Launch visual studio code"),

    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.spawn("/home/vu/.bin/launcher.sh"),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "t", lazy.spawn(theme.default_apps["terminal"]),
        desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn(
        "amixer -c 0 sset Master 1- unmute")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(
        "amixer -c 0 sset Master 1+ unmute")),
    Key([], 'XF86MonBrightnessUp',   lazy.spawn("light -A 10")),
    Key([], 'XF86MonBrightnessDown', lazy.spawn("light -U 10")),

    Key([mod], "x", lazy.spawn("/home/vu/.bin/powermenu.sh"), desc="Power menu")
]

group_names = [("", {'layout': 'MONADTALL'}),
               ("", {'layout': 'MONADTALL'}),
               ("", {'layout': 'MONADTALL'}),
               ("", {'layout': 'MONADTALL'}),
               ("", {'layout': 'MONADTALL'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    # Switch to another group
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    # Send current window to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))

tile_styles = {
    'margin': 10,
    'border_width': theme.styles['border_width'],
    'border_focus': theme.colors['bg_4'],
    'border_normal': theme.colors['bg_3']
}

layouts = [
    layout.MonadTall(**tile_styles, name='MONADTALL'),
    # layout.Columns(border_focus_stack='#d75f5f', name="COLUMNS"),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    layout.Bsp(**tile_styles, name='BSPWM'),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    layout.Tile(**tile_styles, name='TILE'),
    layout.Max(**tile_styles, name='MAX'),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
    layout.Floating(**tile_styles, fullscreen_border_width=3,
                    max_border_width=3, name='FLOATING'),
]

widget_defaults = dict(
    font=theme.fonts['icons'],
    fontsize=14,
    padding=4,
)
extension_defaults = widget_defaults.copy()

widget_styles = {
    'fontsize': 14,
    'background': theme.colors['bg_1'],
}

separate_style = {
    'linewidth': 8, 'foreground': theme.colors['bg_1']
}


def update():
    qtile.cmd_spawn(terminal + "-e paru")


def kill_window():
    qtile.cmd_spawn("xdotool getwindowfocus windowkill")


screens = [
    Screen(
        wallpaper="~/Pictures/Wallpapers/big_nord.png",
        wallpaper_mode="fill",
        top=bar.Bar(
            [
                widget.TextBox(
                    text="ﬦ",
                    foreground=theme.colors['blue'],
                    background=theme.colors['bg_2'],
                    # font="Font Awesome 5 Free Solid",
                    fontsize=20,
                    padding=20,
                    mouse_callbacks={"Button1": lambda qtile: qtile.cmd_spawn(
                        "/home/vu/.bin/launcher.sh")},
                ),

                widget.GroupBox(
                    foreground=theme.colors['blue'], borderwidth=0, active=theme.colors['green'], block_highlight_text_color=theme.colors['blue'], urgent_text=theme.colors['orange'], font="FuraCode Nerd Font", padding_x=15, inactive=theme.colors['fg_3'], fontsize=18),

                widget.Spacer(),
                # widget.TextBox(
                #     text=" ",
                #     foreground=theme.colors['cyan'],
                #     # fontsize=38,
                #     font="Font Awesome 5 Free Solid",
                # ),
                # widget.WindowName(
                #     foreground=theme.colors['cyan'],
                #     width=bar.CALCULATED,
                #     empty_group_string="Desktop",
                #     max_chars=50,
                #     mouse_callbacks={"Button2": kill_window},
                # ),
                # CustomWindowName(
                #     foreground=theme.colors['cyan'],
                #     width=bar.CALCULATED,
                #     empty_group_string="Desktop",
                #     max_chars=50,
                #     mouse_callbacks={"Button2": kill_window},
                # ),
                widget.Spacer(),

                # widget.TextBox(**widget_styles, text=' ',
                #                foreground=theme.colors['red']),
                # widget.CurrentLayout(
                #     **widget_styles, foreground=theme.colors['red']),

                widget.Sep(**separate_style),

                widget.CheckUpdates(
                    **widget_styles,
                    foreground=theme.colors['orange'],
                    colour_have_updates=theme.colors['blue'],
                    custom_command="~/.bin/updates-arch-combined",
                    display_format=" {updates}",
                    execute=update,
                    padding=20,
                ),

                widget.Sep(**separate_style),

                widget.TextBox(**widget_styles, text=' ',
                               foreground=theme.colors['red']),
                widget.Pomodoro(**widget_styles,
                                color_active=theme.colors['green'],
                                color_inactive=theme.colors['red'],
                                color_break=theme.colors['blue'],
                                foreground=theme.colors['red']),
                widget.Sep(**separate_style),

                widget.TextBox(**widget_styles, text=' ',
                               foreground=theme.colors['orange']),
                widget.Wlan(
                    **widget_styles, foreground=theme.colors['orange'], format='{essid}', interface='wlp3s0'),

                widget.Sep(**separate_style),

                widget.TextBox(**widget_styles, text=' ',
                               foreground=theme.colors['blue']),
                widget.CPU(format='{load_percent}%', **
                           widget_styles, foreground=theme.colors['blue']),

                widget.Sep(**separate_style),


                widget.TextBox(**widget_styles, text='﬙',
                               foreground=theme.colors['cyan']),
                widget.Memory(**widget_styles,
                              format='{MemUsed: .0f}MB', foreground=theme.colors['cyan']),

                widget.Sep(**separate_style),

                widget.TextBox(**widget_styles, text=' ',
                               foreground=theme.colors['magenta']),
                widget.Volume(**widget_styles,
                              foreground=theme.colors['magenta']),

                widget.Sep(**separate_style),

                widget.TextBox(**widget_styles, text='盛 ',
                               foreground=theme.colors['yellow']),
                widget.Backlight(**widget_styles, backlight_name='intel_backlight',
                                 change_command='light -S {0}', foreground=theme.colors['yellow']),

                widget.Sep(**separate_style),

                widget.TextBox(**widget_styles, text='ﭷ  ',
                               foreground=theme.colors['green']),
                widget.Clock(**widget_styles, format='%Y-%m-%d %a %I:%M %p',
                             foreground=theme.colors['green']),

                widget.Sep(**separate_style),

            ],
            35,
            background=theme.colors['bg_1'], margin=[10, 10, 0, 10],
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"


@ hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])
