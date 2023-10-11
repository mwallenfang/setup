local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

topbar = {}

topbar.create_bar = function (s)
    local topbarwibar = awful.wibar({ position = "top", 
        margins = {top=dpi(0), left=dpi(0), right = dpi(0), bottom = dpi(0)},
        height = dpi(30),
        opacity = 1,
        screen = s,
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr,width,height,dpi(8))
        end,
         })

-- Add widgets to the wibox
topbarwibar:setup {
    {
        layout = wibox.layout.stack,
        expand = "none",
        {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                mylauncher,
                s.mytaglist,
                s.mypromptbox,
                {
                    layout = wibox.layout.fixed.horizontal,
                    width = 10,
                    s.mytasklist
                }
                
            },
            nil,
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                mykeyboardlayout,
                wibox.widget.systray(),
                
                s.mylayoutbox,
            },
        },
        {
            mytextclock, -- Middle widget
            valign = "center",
            halign = "center",
            layout = wibox.container.place
        }
    },
    widget = wibox.container.background,
    bg = beautiful.background,
    shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, 8)
    end,
    
}
end



return topbar