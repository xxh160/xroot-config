local workspaces_status, workspaces = pcall(require, "workspaces")
if not workspaces_status then
    vim.notify("No workspaces")
    return
end

-- Session
local persisted_status, persisted = pcall(require, "persisted")

local hooks = {}

if persisted_status then
    hooks.open_pre = function(name, path)
        -- vim.notify(string.format("pre: %s", vim.g.persisted_loaded_session))
        if vim.g.persisted_loaded_session and vim.g.persisted_loaded_session ~= "" then
            persisted.save({ session = vim.g.persisted_loaded_session })
            pcall(vim.api.nvim_del_augroup_by_name, "xroot-nvim-projects")

            -- Delete all of the open buffers
            vim.cmd("silent! wall")
            vim.cmd("silent! %bd!")
        end
    end

    hooks.open = function(name, path)
        local session = persisted.current()
        -- Make session file
        if session and vim.fn.filereadable(session) == 0 then
            persisted.save({ session = session })
        end

        -- Find session related to path
        persisted.load()
        -- Start
        vim.api.nvim_create_autocmd("VimLeavePre", {
            group = vim.api.nvim_create_augroup("xroot-nvim-project", { clear = true }),
            callback = function()
                persisted.save({ session = vim.g.persisted_loaded_session })
            end,
        })
    end
else
    hooks.open = "Telescope find_files"
end

workspaces.setup({
    hooks = hooks,
})
