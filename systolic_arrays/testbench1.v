module testbench1();
	parameter DATAWIDTH = 8;	
    reg clk;
    reg rst;
    reg start;
    reg [DATAWIDTH - 1 : 0] A0;
    reg [DATAWIDTH - 1 : 0] A1;
    reg [DATAWIDTH - 1 : 0] A2;
    reg [DATAWIDTH - 1 : 0] B0;
    reg [ DATAWIDTH - 1 : 0 ] B1;
    reg [ DATAWIDTH - 1 : 0 ] B2;
    wire [ DATAWIDTH * 2 - 1 : 0 ] P11;
    wire [ DATAWIDTH * 2 - 1 : 0 ] P12;
    wire [ DATAWIDTH * 2 - 1 : 0 ] P13;
    wire [ DATAWIDTH * 2 - 1 : 0 ] P21;
    wire [ DATAWIDTH * 2 - 1 : 0 ] P22;
    wire [ DATAWIDTH * 2 - 1 : 0 ] P23;
    wire [ DATAWIDTH * 2 - 1 : 0 ] P31;
    wire [ DATAWIDTH * 2 - 1 : 0 ] P32;
    wire [ DATAWIDTH * 2 - 1 : 0 ] P33;
    wire Done;
    matrix matrix(.clk(clk),
                  .rst(rst),
				  .start(start),
				  .A0(A0),
				  .A1(A1),
				  .A2(A2),
				  .B0(B0),
				  .B1(B1),
				  .B2(B2),
				  .P11(P11),
				  .P12(P12),
				  .P13(P13),
				  .P21(P21),
				  .P22(P22),
				  .P23(P23),
				  .P31(P31),
				  .P32(P32),
				  .P33(P33),
				  .Done(Done));
   initial begin
      $dumpfile("dump1.vcd");
      $dumpvars(0, testbench1);
      #70
      $finish;
   end
   initial begin
        #2
      	rst = 1;
        #2
        rst = 0;
        start = 0; A0 = 0 ;A1 = 0;A2 = 0;B0 = 0;B1 = 0;B2 = 0;
        #2;
        start = 1;
        A0 = 3;
        A1 = 0;
        A2 = 0;
        B0 = 3;
        B1 = 0;
        B2 = 0;
        #2;
        A0 = 4;
        A1 = 2;
        A2 = 0;
        B0 = 2;
        B1 = 4;
        B2 = 0;
        #2;  
        A0 = 2;
        A1 = 5;
        A2 = 3;
        B0 = 3;
        B1 = 5;
        B2 = 2;
        #2;  
        A0 = 0;
        A1 = 3;
        A2 = 2;
        B0 = 0;
        B1 = 2;
        B2 = 3;
        #2;  
        A0 = 0;
        A1 = 0;
        A2 = 5;
        B0 = 0;
        B1 = 0;
        B2 = 5;
        #2; 
        A0 = 0;
        A1 = 0;
        A2 = 0;
        B0 = 0;
        B1 = 0;
        B2 = 0;
        #2
        start = 0;
   end
   initial clk = 0;
   always #1 clk = !clk;
endmodule
