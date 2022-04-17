---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2022/4/16 21:13
---

do
    local status, msg = pcall(function()
        error("error message")
    end)
    print(status, msg)
end

do
    function foo(str)
        if (type(str) ~= "string") then
            error("string expected")
            -- 可以通过第二个参数来指定错误的真正发生位置
            -- 如果不填，则错误栈会认为抛出问题的地方就是问题的关键
            --error("string expected", 2)
        end
    end

    function foo1(str)
        foo(str)
    end

    foo1({ a = 1 })
end