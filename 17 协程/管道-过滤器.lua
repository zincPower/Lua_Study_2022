---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2022/4/23 12:29
---

function receive(prod)
    local status, value = coroutine.resume(prod)
    return value
end

function send(x)
    coroutine.yield(x)
end

function producer()
    return coroutine.create(function()
        local x = 1
        while true do
            x = x + 1
            send(x)
        end
    end)
end

-- prod 是 producer 的协程
-- 衔接了两方的数据：
-- 1、让真正的生产者即 producer 进行生产值，此时 filter 是一个消费者
-- 2、然后进行加工
-- 3、抛出加工后的值，此时 filter 是一个生产者
function filter(prod)
    return coroutine.create(function()
        for line = 1, math.huge do
            local x = receive(prod)
            x = string.format("%05d --- %s", line, x)
            send(x)
        end
    end)
end

-- prod 是 filter 的协程
function consumer(prod)
    for i = 1, 100 do
        local x = receive(prod)
        print(x)
    end
end

consumer(filter(producer()))