local f = assert(io.open(arg[1], "rb"))
local blockSize = 16
for bytes in f:lines(blockSize) do
    for i = 1, #bytes do
        local b = string.unpack("B", bytes, i)
        io.write(string.format("%02X ", b))
    end
    io.write(string.rep("    ", blockSize - #bytes))
    bytes = string.gsub(bytes, "%c", ".")
    io.write(" ", bytes, "\n")
end