add wave *


# first run, sets reset to false
force reset '0'
force din "0000"
force clk '0'
run 1

# second run
force clk '1'
run 1

# third run
force din "0001"
force clk '0'
run 1

force clk '0' 
run 1

force sel "00"
force din "0010"
force clk '1'
run 1

force clk '0'
run 1

force din "0011"
force sel "00"
force clk '1'
run 1

force clk '0'
run 1

force din "0100"
force clk '1'
run 1

force clk '1'
run 1

force din "0101"
force sel "00"
force clk '0'
run 1


force clk '1'
run 1

force clk '0'
run 1

force din "0110"
force clk '1'
run 1

force clk '0'
run 1

force din "0111"
force clk '1'
run 1

force clk '0'
run 1

force din "1000"
force clk '1'
run 1

force clk '0'
run 1

force din "1001"
force clk '1'
run 1

force clk '0'
run 1

force din "1010"
force clk '1'
run 1

force clk '0'
run 1

force din "1011"
force clk '1'
run 1

force clk '0'
run 1

force din "1100"
force sel "10"
force clk '1'
run 1

force clk '0'
run 1

force din "1101"
force clk '1'
run 1

force clk '0'
run 1

force din "1110"
force clk '1'
run 1

force clk '0'
run 1

force din "1111"
force clk '1'
run 1

