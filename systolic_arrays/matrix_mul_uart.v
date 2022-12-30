module matrix_mul_uart#(parameter DATAWIDTH = 8) 
(   
    input clk, 
    input rst, 
    input start_calc, 
    input start_send,
    input rx;
    output reg tx;
    
    reg [DATAWIDTH - 1:0] dataout1, dataout2, dataout3,
              dataout4, dataout5, dataout6;
              
    wire [DATAWIDTH - 1:0] datain1, datain2, datain3;
    reg [DATAWIDTH - 1:0] A [2:0][2:0];
    reg [DATAWIDTH:0] B [2:0][2:0];
    reg [DATAWIDTH - 1:0] start = 2'b11;
    wire [DATAWIDTH - 1:0] data_in;
    reg [DATAWIDTH - 1:0] data_out;
    reg what_matr = 0;
    wire busy_in, valid, busy_out;
    
    matrix _matrix(.clk(clk), .rst(rst), .start(start), .A0(dataout1), .A1(dataout2), 
                  .A2(dataout3), .B0(dataout4), .B1(dataout5), .B2(dataout6),
                  .P11(), .P12(), .P13(), .P21(), .P22(), .P23(), .P31(), .P32(), P33())
                  
    uart_receiver #(.IF(2), .UF(1), .Precision(0)) 
                  _receiver(.rx(rx), .clock(clk), .reset(rst), .data(data_in),
                            .valid(valid), .busy(busy_in));
                            
    uart_transmitter #(.IF(2), .UF(1), .W(16)) 
                       _transmitter(.data(data_out), .start(start_send), .clock(clk),
                                  .reset(rst), .tx(tx), .busy(busy_out));
    

    integer i = 0, i_in = 0, j_in = 0, i_out = 0, j_out = 0;
    reg busy, rec_mode, change_ind;
                     
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            busy <= 0;
            mode <= 2'b11;
            change_ind <= 0;
        end
        
        if (busy_in) begin
            rec_mode <= 1;
        end else if (!busy_in && rec_mode && valid) begin
        end
         
    end
endmodule

