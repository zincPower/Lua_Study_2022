---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2023/9/1 14:30
---

print("Lua 的搜索路径：")
print("package.path: ", package.path)

local function showLoadedModule()
    for path, package in pairs(package.loaded) do
        print("----- 模块【" .. path .. "】包含的属性：-----")
        if type(package) == "table" then
            for key, value in pairs(package) do
                print(key, "---", value)
            end
        else
            print(path, "---", package)
        end
        print("--------------------------------")
    end
end

local currentPath = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
package.path = package.path .. ";" .. currentPath .. "../?.lua"

--showLoadedModule()

local module = require("一个合理的模块")
print(module.name)
-- 会拆解为 module/sub
require("module.sub")

--showLoadedModule()