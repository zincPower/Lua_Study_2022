---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2022/10/31 08:21
---

-- 此处不能用 local ，否则 dofile 就无法使用
--local age = 28
age = 28
function showAge()
    print("main age", age)
end

local load = loadfile("/Users/jiangpengyong/Desktop/study/lua_study_2022/10 编译、执行和错误/编译/加载的文件.lua")
load()

print(name)
showName()