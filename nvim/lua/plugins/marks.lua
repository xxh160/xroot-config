local status, marks = pcall(require, "marks")
if not status then
    vim.notify("No marks")
    return
end

marks.setup({
    mappings = {
        set = "m.",
        preview = "m:",
        next = "nm",
        prev = "pm",
        set_bookmark0 = "m0",
        -- prev = false -- pass false to disable only this default mapping
    }
})
