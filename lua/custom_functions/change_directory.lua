local M = {}

local function get_custom_directories(base_dir, custom_paths, add_paths)
  local dirs = {}
  local dir_map = {}

  local handle = vim.uv.fs_scandir(vim.fn.expand(base_dir))
  if handle then
    while true do
      local name, type = vim.uv.fs_scandir_next(handle)
      if not name then break end
      if type == "directory" and not name:match "^%." then
        local full_path = vim.fs.joinpath(base_dir, name)
        local matched = false
        for _, custom_path in ipairs(custom_paths) do
          if name == custom_path.name then
            table.insert(dirs, name)
            dir_map[name] = vim.fs.joinpath(full_path, custom_path.path)
            matched = true
            break
          end
        end
        if not matched then
          table.insert(dirs, name)
          dir_map[name] = full_path
        end
      end
    end
  end

  for _, add_path in ipairs(add_paths) do
    local name = add_path.name
    local path = load("return " .. add_path.path_command)()
    table.insert(dirs, name)
    dir_map[name] = path
  end

  return dirs, dir_map
end

function M.change_directory()
  local config = require "custom_functions.config"
  local directories, dir_map = get_custom_directories(config.base_dir, config.custom_paths, config.add_paths)

  local items = {}
  for _, name in ipairs(directories) do
    table.insert(items, { text = name })
  end

  require("snacks").picker.pick {
    title = "Select Directory",
    items = items,
    format = "text",
    confirm = function(picker, item)
      picker:close()
      vim.cmd("cd " .. vim.fn.fnameescape(dir_map[item.text]))
    end,
  }
end

return M
