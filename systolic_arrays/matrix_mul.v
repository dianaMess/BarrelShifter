module matrix#(parameter DATAWIDTN = 8)
(
	input  clk,
	input  rst,
	input [1:0] start,
	input      [DATAWIDTN - 1 : 0] A0,
	input      [DATAWIDTN - 1 : 0] A1,
	input      [DATAWIDTN - 1 : 0] A2,
	input      [DATAWIDTN - 1 : 0] B0,
	input      [DATAWIDTN - 1 : 0] B1,
	input 	   [DATAWIDTN - 1 : 0] B2,
	output reg [DATAWIDTN * 2 - 1 : 0] P11,P12,P13,
	output reg [DATAWIDTN * 2 - 1 : 0] P21,P22,P23,
	output reg [DATAWIDTN * 2 - 1 : 0] P31,P32,P33,
	output     Done
);

    wire [DATAWIDTN - 1 : 0] P11_A,P11_B;
    wire [DATAWIDTN - 1 : 0] P12_A,P12_B;
    wire [DATAWIDTN - 1 : 0] P21_A,P21_B;
    wire [DATAWIDTN - 1 : 0] P22_A,P22_B;
    wire [DATAWIDTN - 1 : 0] P31_A,P32_A;
    wire [DATAWIDTN - 1 : 0] P13_B,P23_B;
    wire [DATAWIDTN * 2 - 1 : 0] P11_reg;
    wire [DATAWIDTN * 2 - 1 : 0] P12_reg;
    wire [DATAWIDTN * 2 - 1 : 0] P13_reg;
    wire [DATAWIDTN * 2 - 1 : 0] P21_reg;
    wire [DATAWIDTN * 2 - 1 : 0] P22_reg;
    wire [DATAWIDTN * 2 - 1 : 0] P23_reg;
    wire [DATAWIDTN * 2 - 1 : 0] P31_reg;
    wire [DATAWIDTN * 2 - 1 : 0] P32_reg;
    wire [DATAWIDTN * 2 - 1 : 0] P33_reg;

    reg [3:0] counter;
    reg isDone;
    always@(posedge clk, posedge rst) begin
	    if (rst)
		    counter <= 0;
	    else if (start) begin
			if (counter == 7)
				counter <= 0;
			else
				counter <= counter + 1'b1;
		    end
	    else
		    counter <= 0;
	 
    end
    always@(posedge clk, posedge rst) begin
        if (rst)
            isDone <= 0;
        else if (counter == 7 )
            isDone <= 1;
        else 
            isDone <= 0;
    end
    assign Done = isDone;
    always@(posedge clk, posedge rst) begin
	    if (rst) begin
		    P11 <= 0;
		    P12 <= 0;
		    P13 <= 0;
		    P21 <= 0;
		    P22 <= 0;
		    P23 <= 0;
		    P31 <= 0;
		    P32 <= 0;
		    P33 <= 0;
	    end else if (Done) begin
		    P11 <= P11_reg;
		    P12 <= P12_reg;
		    P13 <= P13_reg;
		    P21 <= P21_reg;
		    P22 <= P22_reg;
		    P23 <= P23_reg;
		    P31 <= P31_reg;
		    P32 <= P32_reg;
		    P33 <= P33_reg;
	    end else begin
		    P11 <= 0;
		    P12 <= 0;
		    P13 <= 0;
		    P21 <= 0;
	 	    P22 <= 0;
		    P23 <= 0;
		    P31 <= 0;
		    P32 <= 0;
		    P33 <= 0;
		
	    end
    end


pe PE11(.clk(clk),
               .rst(rst),
               .start(start),
			   .A_col(A0),
			   .B_col(B0),
			   .Next_A_col(P11_A),
			   .Next_B_col(P11_B),
			   .PE_out(P11_reg));
pe PE12(.clk(clk),
               .rst(rst),
               .start(start),
			   .A_col(P11_A),
			   .B_col(B1),
			   .Next_A_col(P12_A),
			   .Next_B_col(P12_B),
			   .PE_out(P12_reg));
pe PE13(.clk(clk),
               .rst(rst),
               .start(start),
			   .A_col(P12_A),
			   .B_col(B2),
			   .Next_A_col(),
			   .Next_B_col(P13_B),
			   .PE_out(P13_reg));
pe PE21(.clk(clk),
               .rst(rst),
               .start(start),
			   .A_col(A1),
			   .B_col(P11_B),
			   .Next_A_col(P21_A),
			   .Next_B_col(P21_B),
			   .PE_out(P21_reg));
pe PE22(.clk(clk),
               .rst(rst),
               .start(start),
			   .A_col(P21_A),
			   .B_col(P12_B),
			   .Next_A_col(P22_A),
			   .Next_B_col(P22_B),
			   .PE_out(P22_reg));
pe PE23(.clk(clk),
               .rst(rst),
               .start(start),
			   .A_col(P22_A),
			   .B_col(P13_B),
			   .Next_A_col(),
			   .Next_B_col(P23_B),
			   .PE_out(P23_reg));
pe PE31(.clk(clk),
               .rst(rst),
               .start(start),
			   .A_col(A2),
			   .B_col(P21_B),
			   .Next_A_col(P31_A),
			   .Next_B_col(),
			   .PE_out(P31_reg));
pe PE32(.clk(clk),
               .rst(rst),
               .start(start),
			   .A_col(P31_A),
			   .B_col(P22_B),
			   .Next_A_col(P32_A),
			   .Next_B_col(),
			   .PE_out(P32_reg));
pe PE33(.clk(clk),
               .rst(rst),
               .start(start),
			   .A_col(P32_A),
			   .B_col(P23_B),
			   .Next_A_col(),
			   .Next_B_col(),
			   .PE_out(P33_reg));
			   
endmodule
