-- 江澎涌
local f = assert(io.open(arg[1], "rb"))
-- 16 字节读取文件
local blockSize = 16
-- 循环读取文件，每次读取 16 个字符
for bytes in f:lines(blockSize) do
    -- 循环每个字节
    for i = 1, #bytes do
        local b = string.unpack("B", bytes, i)
        io.write(string.format("%02X ", b))
    end
    io.write(string.rep("   ", blockSize - #bytes))
    bytes = string.gsub(bytes, "%c", ".")
    io.write(" ", bytes, "\n")
end