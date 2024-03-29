---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2022/4/20 9:32 PM
---

print("=============================================")
print("__index 方法：")
do
    print("-----------------------------------------")
    print("使用函数设置 __index:")
    local prototype = { age = 29, height = 171 }
    local metatable = {}
    print("metatable", metatable)
    -- table 是被调用的 table
    metatable.__index = function(table, index)
        print("__index table", table)
        return prototype[index]
    end
    local function new(o)
        setmetatable(o, metatable)
        return o
    end
    local person = new { name = "小明" }
    print("person", person)
    print(person.name, person.age, person.height)

    print("-----------------------------------------")
    print("使用表设置 __index:")
    metatable.__index = prototype
    local person2 = new { name = "大黄", height = 165 }
    print("person2", person2)
    print(person2.name, person2.age, person2.height)

    print("-----------------------------------------")
    print("rawget：", rawget(person2, "age"))
end

print("=============================================")
print("__newindex 方法：")
do
    print("-----------------------------------------")
    print("使用方法设置 __newindex：")
    local metatable = {}
    metatable.__newindex = function(table, index, value)
        print(table, index, value)
    end
    local function new(o)
        setmetatable(o, metatable)
        return o
    end
    local person = new { name = "xiaopenyou" }
    person["age"] = 29
    person["name"] = "jiangpengyong"
    print(person.name, person.age)

    print("-----------------------------------------")
    print("使用表设置 __newindex：")
    local cachetable = {}
    metatable.__newindex = cachetable
    local person2 = new { name = "xiao" }
    person2["age"] = 28
    person2["name"] = "jiang"
    print("person2", person2.name, person2.age)
    print("cachetable", cachetable.name, cachetable.age)

    print("-----------------------------------------")
    print("rawset:")
    rawset(person2, "height", 175)
    print("person2", person2.name, person2.age, person2.height)
    print("cachetable", cachetable.name, cachetable.age, cachetable.height)
end

print("=============================================")
print("默认值（创建闭包）：")
do
    local function setDefault(table, default)
        local mt = { __index = function()
            return default
        end }
        setmetatable(table, mt)
    end

    local t = { x = 10, y = "江" }
    print(t.x, t.y, t.z)
    setDefault(t, "涌")
    print(t.x, t.y, t.z)
end

print("=============================================")
print("默认值（共用元表，用 '___' 做默认值）：")
do
    local mt = { __index = function(table)
        return table.___
    end }
    local function setDefault(table, default)
        table.___ = default
        setmetatable(table, mt)
    end

    local t = { x = 10, y = "江" }
    print(t.x, t.y, t.z)
    setDefault(t, "涌")
    print(t.x, t.y, t.z)
end

print("=============================================")
print("默认值（共用元表，用 '{}' 做默认值）：")
do
    local key = {}
    local mt = { __index = function(table)
        return table[key]
    end }
    local function setDefault(table, default)
        table[key] = default
        setmetatable(table, mt)
    end

    local t = { x = 10, y = "江" }
    print(t.x, t.y, t.z)
    setDefault(t, "涌")
    print(t.x, t.y, t.z)
end