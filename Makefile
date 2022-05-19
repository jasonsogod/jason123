VERILOG = iverilog
TARGET = LFSR.vcd

$(TARGET) : BCD.vvp
	vvp BCD.vvp

BCD.vvp: testbench.v LFSR.v
	$(VERILOG) -o BCD.vvp testbench.v LFSR.v

clean:
	del $(TARGET)