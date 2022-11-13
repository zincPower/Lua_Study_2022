---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2022/11/13 14:11
---

local function iter(t, i)
    i = i + 1
    local v = t[i]
    if v then
        return i, v
    end
end

function my_ipairs(t)
    return iter, t, 0
end

print("-----------------------")
print("类似 ipairs：")
-- 效果和 ipairs 一样
local array = { "jiang", "peng", "yong" }
for key, item in my_ipairs(array) do
    print(key, "-->", item)
end

print("-----------------------")
print("ipairs：")
for key, item in ipairs(array) do
    print(key, "-->", item)
end