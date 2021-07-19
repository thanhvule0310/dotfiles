
" ===== galaxyline =====
lua <<EOF
local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'NvimTree', 'vista', 'dbui'}

local colors = {
    bg = '#3c3836',
    fg = '#d4be98',
    yellow = '#d8a657',
    cyan = '#89b482',
    darkblue = '#7daea3',
    green = '#a9b665',
    orange = '#fe8019',
    violet = '#d3869b',
    magenta = '#d3869b',
    blue = '#7daea3',
    red = '#ea6962'
}

local function lsp_status(status)
    shorter_stat = ''
    for match in string.gmatch(status, "[^%s]+") do
        err_warn = string.find(match, "^[WE]%d+", 0)
        if not err_warn then shorter_stat = shorter_stat .. ' ' .. match end
    end
    return shorter_stat
end

local function get_coc_lsp()
    local status = vim.fn['coc#status']()
    if not status or status == '' then return '' end
    return lsp_status(status)
end

function get_diagnostic_info()
    if vim.fn.exists('*coc#rpc#start_server') == 1 then return get_coc_lsp() end
    return ''
end

local function get_current_func()
    local has_func, func_name = pcall(vim.fn.nvim_buf_get_var, 0,
                                      'coc_current_function')
    if not has_func then return end
    return func_name
end

function get_function_info()
    if vim.fn.exists('*coc#rpc#start_server') == 1 then
        return get_current_func()
    end
    return ''
end

local function trailing_whitespace()
    local trail = vim.fn.search("\\s$", "nw")
    if trail ~= 0 then
        return ' '
    else
        return nil
    end
end

CocStatus = get_diagnostic_info
CocFunc = get_current_func
TrailingWhiteSpace = trailing_whitespace

local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then return true end
    return false
end

gls.left[1] = {
    RainbowRed = {
        provider = function() return '▊ ' end,
        highlight = {colors.blue, colors.bg}
    }
}
gls.left[2] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local mode_color = {
                n = colors.blue,
                i = colors.green,
                v = colors.magenta,
                [''] = colors.blue,
                v = colors.magenta,
                c = colors.red,
                no = colors.magenta,
                s = colors.orange,
                s = colors.orange,
                [''] = colors.orange,
                ic = colors.yellow,
                R = colors.violet,
                Rv = colors.violet,
                cv = colors.red,
                ce = colors.red,
                r = colors.cyan,
                rm = colors.cyan,
                ['r?'] = colors.cyan,
                ['!'] = colors.red,
                t = colors.red
            }

            local alias = {
              n = 'NORMAL',
              i = 'INSERT',
              c = 'COMMAND',
              V = 'VISUAL',
              [''] = 'VISUAL',
              v = 'VISUAL',
              R = 'REPLACE',
            }
            vim.api.nvim_command('hi GalaxyViMode guifg=' ..
                                     mode_color[vim.fn.mode()])
            return alias[vim.fn.mode()]..' גּ  '
        end,
        highlight = {colors.red, colors.bg, 'bold'}
    }
}
gls.left[3] = {
    FileSize = {
        provider = 'FileSize',
        condition = buffer_not_empty,
        highlight = {colors.fg, colors.bg}
    }
}
gls.left[4] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = buffer_not_empty,
        highlight = {
            require('galaxyline.provider_fileinfo').get_file_icon_color,
            colors.bg
        }
    }
}

gls.left[5] = {
    FileName = {
        provider = {'FileName'},
        condition = buffer_not_empty,
        highlight = {colors.green, colors.bg, 'bold'}
    }
}

gls.left[6] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.fg, colors.bg}
    }
}

gls.left[7] = {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.fg, colors.bg, 'bold'}
    }
}

gls.left[8] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.red, colors.bg}
    }
}
gls.left[9] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '   ',
        highlight = {colors.yellow, colors.bg}
    }
}

gls.left[10] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '   ',
        highlight = {colors.cyan, colors.bg}
    }
}

gls.left[11] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '   ',
        highlight = {colors.blue, colors.bg}
    }
}

gls.left[12] = {
    CocStatus = {
        provider = CocStatus,
        highlight = {colors.green, colors.bg},
        icon = '   '
    }
}

gls.left[13] = {
    CocFunc = {
        provider = CocFunc,
        icon = '  λ ',
        highlight = {colors.yellow, colors.bg}
    }
}

gls.right[1] = {
    FileEncode = {
        provider = 'FileEncode',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.cyan, colors.bg, 'bold'}
    }
}

gls.right[2] = {
    FileFormat = {
        provider = 'FileFormat',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.cyan, colors.bg, 'bold'}
    }
}

gls.right[3] = {
    GitIcon = {
        provider = function() return '  ' end,
        condition = require('galaxyline.provider_vcs').check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.violet, colors.bg, 'bold'}
    }
}

gls.right[4] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = require('galaxyline.provider_vcs').check_git_workspace,
        highlight = {colors.violet, colors.bg, 'bold'}
    }
}

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then return true end
    return false
end

gls.right[5] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = checkwidth,
        icon = '  ',
        highlight = {colors.green, colors.bg}
    }
}
gls.right[6] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = checkwidth,
        icon = ' 柳',
        highlight = {colors.orange, colors.bg}
    }
}
gls.right[7] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = checkwidth,
        icon = '  ',
        highlight = {colors.red, colors.bg}
    }
}

gls.right[8] = {
    RainbowBlue = {
        provider = function() return '  ▊' end,
        highlight = {colors.blue, colors.bg}
    }
}

gls.short_line_left[1] = {
    BufferType = {
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.blue, colors.bg, 'bold'}
    }
}

gls.short_line_left[2] = {
    SFileName = {
        provider = function()
            local fileinfo = require('galaxyline.provider_fileinfo')
            local fname = fileinfo.get_current_file_name()
            for _, v in ipairs(gl.short_line_list) do
                if v == vim.bo.filetype then return '' end
            end
            return fname
        end,
        condition = buffer_not_empty,
        highlight = {colors.white, colors.bg, 'bold'}
    }
}

gls.short_line_right[1] = {
    BufferIcon = {provider = 'BufferIcon', highlight = {colors.fg, colors.bg}}
}
EOF
