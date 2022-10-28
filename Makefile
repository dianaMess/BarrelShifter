first: 
	iverilog -o test_1 test_1.v main.v
	./test_1
	gtkwave dump1.vcd
second:
	iverilog -o test_2 test_2.v main.v
	./test_2
	gtkwave dump2.vcd
clear1:
	rm test_1
	rm dump1.vcd
clear2:
	rm test_2
	rm dump2.vcd
