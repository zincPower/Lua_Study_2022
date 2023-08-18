-- lua dump.lua 需要解析文件
--local f = assert(io.open(arg[1], "rb"))
local rootPath = "/Users/jiangpengyong/Desktop/code/Lua/lua_study_2022/7 位和字节/"
local f = io.open(rootPath .. "dump.lua", "rb")
local output = assert(io.open(rootPath .. "outputBinary.txt", "wb"))
-- 16 字节读取文件
local blockSize = 16
-- 循环读取文件，每次读取 16 个字符
for bytes in f:lines(blockSize) do
    -- 循环每个字节
    for i = 1, #bytes do
        local b = string.unpack("B", bytes, i)
        output:write(string.format("%02X ", b))
    end
    output:write(string.rep("   ", blockSize - #bytes))
    -- 将控制符转为 .
    bytes = string.gsub(bytes, "%c", ".")
    output:write(" ", bytes, "\n")
end