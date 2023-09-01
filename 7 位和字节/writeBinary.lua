-- lua dump.lua 需要解析文件
--local inputFile = assert(io.open(arg[1], "rb"))
local rootPath =  debug.getinfo(1, "S").source:sub(2):match("(.*/)")
local inputFile = io.open(rootPath .. "test.jpeg", "rb")

-- 16 字节读取文件
local blockSize = 16

local output1 = assert(io.open(rootPath .. "outputBinary1.jpeg", "wb"))
-- 循环读取文件，每次读取 16 个字符
for bytes in inputFile:lines(blockSize) do
    -- 循环每个字节
    for i = 1, #bytes do
        local b = string.unpack("i1", bytes, i)
        output1:write(string.pack("i1", b))
    end
end

local output2 = assert(io.open(rootPath .. "outputBinary2.jpeg", "wb"))
-- 重置文件
inputFile:seek("set", 0)
for bytes in inputFile:lines(blockSize) do
    -- 循环每个字节
    output2:write(bytes)
end