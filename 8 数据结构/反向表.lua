---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2022/10/26 08:43
---

print("----------------------")
print("原先表：")
local days = {
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
}
for k, v in pairs(days) do
    print(k .. "-->" .. v)
end

print("----------------------")
print("反向先表：")
local revDays = {}
for k, v in pairs(days) do
    revDays[v] = k
end
for k, v in pairs(revDays) do
    print(k .. "-->" .. v)
end