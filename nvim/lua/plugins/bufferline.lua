local status, bufferline = pcall(require, "bufferline")
if not status then
    vim.notify("No bufferline")
  return
end

-- bufferline.lua
bufferline.setup({
    options = {
        indicator = {
            -- Split line 
            icon = '▎', 
            style = 'underline',
        },
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer" ,
                text_align = "left",
                separator = true,
            }
        },
    }
})

