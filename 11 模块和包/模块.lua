---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2022/11/5 10:26
---

print("--------------------------")
print("Lua 的搜索路径：")
do
    print("package.path: ", package.path)
end

print("--------------------------")
print("C 的搜索路径：")
do
    print("package.cpath: ", package.cpath)
end

print("--------------------------")
print("package.preload：")
do
    for k, v in pairs(package.preload) do
        print(k, "-->", v)
    end
end

print("--------------------------")
print("package.searchpath: ")
do
    local path = "/Users/jiangpengyong/Desktop/code/Lua/lua_study_2022/11 模块和包/?.lua"
    print(package.searchpath("module!sub", path, "!", "@"))
    print(package.searchpath("module.sub", path))
    print(package.searchpath("模块", path))
end

print("--------------------------")
print("加载合理的模块：")
do
    package.path = package.path .. ";/Users/jiangpengyong/Desktop/code/Lua/lua_study_2022/11 模块和包/?.lua"
    local module = require("一个合理的模块")
    print(module.name)
    module.showInfo()
end

print("--------------------------")
print("子模块搜索：")
do
    -- 因为前面已经设置了 package.path 路径
    -- 会拆解为 module/sub
    require("module.sub")
end

print("--------------------------")
print("package.loaded 已经加载的模块：")
do
    for k, item in pairs(package.loaded) do
        print(k, "包含的属性：")
        if type(item) == "table" then
            for key, value in pairs(item) do
                print(key, "---", value)
            end
        else
            print(key, "---", item)
        end
    end
end