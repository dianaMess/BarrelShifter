module main(clk, rst, data_in, select, data_out);
    parameter DATA_SIZE = 8;
    parameter ROTATION = 0;
    parameter DIRECTION = 0;
    input clk, rst;
    input [DATA_SIZE - 1:0] data_in;
    output reg [DATA_SIZE - 1:0] data_out;
    input [$clog2(DATA_SIZE) - 1:0] select;
    wire [1:0] tmp;
    assign tmp = {ROTATION, DIRECTION};
    always@(posedge clk) begin
        if (!rst) begin
            case (tmp)
                2'b00:
                    data_out <= data_in << select;
                2'b01:
                    data_out <= data_in >> select;
                2'b10:
                    data_out <= {data_in, data_in} << select;
                2'b11:
                    data_out <= {data_in, data_in} >> select;
            endcase
        end
    end
endmodule
