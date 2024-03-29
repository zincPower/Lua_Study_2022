---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2022/4/16 14:12
---

print("---------------------")
print("table 直接作为双端队列：")
do
    local queue = {}
    print("---------------------")
    print("前面插入：")
    table.insert(queue, 1, -10)
    table.insert(queue, 1, -5)
    table.insert(queue, 1, -1)
    ---------------------------------------
    --- 此时队列内容 -1，-5，-10
    ---------------------------------------
    print(table.remove(queue, 1))
    print(table.remove(queue, 1))

    print("---------------------")
    print("后面插入：")
    table.insert(queue, #queue + 1, 10)
    table.insert(queue, #queue + 1, 5)
    table.insert(queue, #queue + 1, 1)
    ---------------------------------------
    --- 此时队列内容 -10，10，5，1
    ---------------------------------------
    print(table.remove(queue, #queue))
    print(table.remove(queue, #queue))

    print("---------------------")
    print("输出全部：")
    ---------------------------------------
    --- 此时队列内容 -10，10
    ---------------------------------------
    for k, v in pairs(queue) do
        print(k .. "-->" .. v)
    end
end

print("---------------------")
print("优化后的双端队列：")
do
    function listNew()
        return { first = 0, last = -1 }
    end

    function pushFirst(list, value)
        local first = list.first - 1
        list.first = first
        list[first] = value
    end

    function pushLast(list, value)
        local last = list.last + 1
        list.last = last
        list[last] = value
    end

    function popFirst(list)
        local first = list.first
        if first > list.last then
            error("list is empty")
        end
        local value = list[first]
        list[first] = nil
        list.first = first + 1
        return value
    end

    function popLast(list)
        local last = list.last
        if list.first > last then
            error("list is empty")
        end
        local value = list[last]
        list[last] = nil
        list.last = last - 1
        return value
    end

    print("---------------------")
    print("前面插入：")
    local queue = listNew()
    pushFirst(queue, 10)
    pushFirst(queue, 5)
    pushFirst(queue, 1)
    ---------------------------------------
    --- 此时队列内容 1，5，10
    ---------------------------------------
    print(popFirst(queue))

    print("---------------------")
    print("后面插入：")
    pushLast(queue, 15)
    pushLast(queue, 20)
    pushLast(queue, 30)
    ---------------------------------------
    --- 此时队列内容 5，10，15，20，30
    ---------------------------------------
    print(popLast(queue))

    print("---------------------")
    print("输出全部：")
    ---------------------------------------
    --- 此时队列内容 5，10，15，20
    ---------------------------------------
    for k, v in pairs(queue) do
        print(k .. "-->" .. v)
    end
end