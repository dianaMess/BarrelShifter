module test_2();
    parameter DATA_SIZE = 16;
    parameter ROTATION = 1;
    parameter DIRECTION = 1;
    reg clk, rst;
    reg [DATA_SIZE - 1:0] data_in;
    reg [$clog2(DATA_SIZE) - 1:0] select;
    wire [DATA_SIZE - 1:0] data_out;
    main #(DATA_SIZE, ROTATION, DIRECTION) _main(.clk(clk), .rst(rst), .data_in(data_in), .select(select), .data_out(data_out));
    initial begin
        $dumpfile("dump2.vcd");
        $dumpvars(0, test_2);
        #20
        $finish;
    end
    initial begin
        #2
        rst = 1;
        #2
        rst = 0;
        data_in = 16'b0001_1001_0000_0001;
        select = 4'b0011;
        #2
        data_in = 16'b1001_0111_1000_1011;
        select = 4'b0010;
        #2
        data_in = 16'b0001_0001_1000_1001;
        select = 4'b0100;
        #2
        data_in = 16'b1101_1001_0001_1101;
        select = 4'b0100;
    end
    initial clk = 0;
    always #1 clk = !clk;
endmodule
