---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2022/4/17 20:41
---

print("--------------------------")
print("元表初始值：")
print("表的初始值", getmetatable({}))
print("整型的初始值", getmetatable(10))
print("浮点型的初始值", getmetatable(10.0))
print("字符串的初始值", getmetatable("江澎涌"))
print("字符串的初始值", getmetatable("jiangpengyong"))
print("布尔型的初始值", getmetatable(true))
print("nil的初始值", getmetatable(nil))
function sayHello()
end
print("函数的初始值", getmetatable(sayHello))

print("--------------------------")
print("设置元表：")
local oriTable = {}
local metaTable = {}
setmetatable(oriTable, metaTable)
print(getmetatable(oriTable), metaTable)

---- __metatable 设置
--t2 = { c = 1 }
--t2.__metatable = { a = 1 }
--s1 = {}
--setmetatable(s1, t2)
--print(getmetatable(s1)["a"])
---- cannot change a protected metatable
--print(setmetatable(s1, {}))