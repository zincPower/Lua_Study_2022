---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2022/11/14 07:26
---

local currentPath = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
package.path = package.path .. ";" .. currentPath .. "?.lua"
local Set = require("集合")

print("-----------------------------")
print("设置的元表：")
local s1 = Set.new { 10, 20, 30 }
local s2 = Set.new { "jiang", "peng", "yong", 10 }
-- 如果内部设置了 __metatable 则无法获取元表
print("s1 和 s2 的元表", getmetatable(s1), getmetatable(s2))
-- 如果内部设置了 __metatable 则无法修改元表 cannot change a protected metatable
--print(setmetatable(s1,{}))

print("-----------------------------")
print("元表加法：")
print(Set.tostring(s1 + s2))

print("-----------------------------")
print("元表乘法：")
print(Set.tostring((s1 + s2) * s1))

print("-----------------------------")
print("不同类型相加：")
--print(Set.tostring(s1 + 10))

print("-----------------------------")
print("比较：")
local s4 = Set.new { 2, 4 }
local s5 = Set.new { 4, 10, 2 }
print(s4 <= s5)
print(s4 < s5)
print(s4 >= s5)
print(s4 > s5)
print(s4 * s5)
-- 会直接返回 false ，而不会调用元方法，因为类型不同
print(s4 == 5)

print("-----------------------------")
print("库方法：")
print(s1)