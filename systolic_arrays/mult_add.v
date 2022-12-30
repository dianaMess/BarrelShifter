module mult_add#(parameter DATAWIDTH = 8)
(
	input  [DATAWIDTH - 1 : 0] A,
	input  [DATAWIDTH - 1 : 0] B,
	input  [DATAWIDTH - 1 : 0] C,
	output [DATAWIDTH * 2 : 0] P
);

    wire [ DATAWIDTH * 2  : 0 ] mult = A * B;
    wire [ DATAWIDTH * 2  : 0 ] P_w = mult + C;
    assign P = P_w;
endmodule
