module pe#(parameter DATAWIDTH = 8)
(
	input clk,
	input rst,
    input [1:0] start,
	input  [DATAWIDTH - 1 : 0] A_col,
	input  [DATAWIDTH - 1 : 0] B_col,
	output [DATAWIDTH - 1 : 0] Next_A_col,
	output [DATAWIDTH - 1 : 0] Next_B_col,
	output reg [DATAWIDTH * 2  : 0] PE_out
);

    reg [DATAWIDTH - 1 : 0] Next_A_reg;
    reg [DATAWIDTH - 1 : 0] Next_B_reg;
    reg  [DATAWIDTH * 2  : 0] PE_reg;
//    wire [DATAWIDTH * 2 : 0] PE_net;

//    mult_add#(.DATAWIDTH(DATAWIDTH)) multadd(.A(A_col), .B(B_col), .C(PE_reg), .P(PE_net));

    always@(posedge clk, posedge rst) begin
	    if (rst) begin
		    Next_A_reg <= 0;
		    Next_B_reg <= 0;
		    PE_reg <= 0;	
	    end else begin
            if (start == 2'b00) begin 
                if (A_col > 0 || B_col > 0) begin
                    PE_reg <= (A_col * B_col) + PE_reg;
                end
		        Next_A_reg <= A_col;
		        Next_B_reg <= B_col;
            end else if (start == 2'b01) begin
		        PE_out <= A_col;
            end else if (start == 2'b10) begin
		        PE_out <= PE_reg;
            end  
	    end
    end
endmodule
