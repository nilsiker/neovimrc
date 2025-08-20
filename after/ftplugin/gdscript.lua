local port = os.getenv('GDScript_Port') or '6005'
local cmd = vim.lsp.rpc.connect('127.0.0.1', tonumber(port))
local pipe = '/tmp/godot.pipe'

local function get_root()
    return vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1])
end

local function is_godot_running(root_dir)
    for _, client in pairs(vim.lsp.get_clients()) do
        if client.name == 'Godot' and client.config.root_dir == root_dir then
            return true
        end
    end
    return false
end

local function maybe_start_godot_lsp()
    local root_dir = get_root()
    if not root_dir or is_godot_running(root_dir) then
        return
    end

    vim.lsp.start({
        name = 'Godot',
        cmd = cmd,
        root_dir = root_dir,
        on_attach = function(client, bufnr)
            vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
        end
    })
end

maybe_start_godot_lsp()
