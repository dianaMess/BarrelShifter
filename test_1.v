module test_1();
    parameter DATA_SIZE = 8;
    parameter ROTATION = 1'b0;
    parameter DIRECTION = 1'b1;
    reg clk, rst;
    reg [DATA_SIZE - 1:0] data_in;
    reg [$clog2(DATA_SIZE) - 1:0] select;
    wire [DATA_SIZE - 1:0] data_out;
    main #(DATA_SIZE, ROTATION, DIRECTION) _main(.clk(clk), .rst(rst), .data_in(data_in), .select(select), .data_out(data_out));
    initial begin
        $dumpfile("dump1.vcd");
        $dumpvars(0, test_1);
        #15
        $finish;
    end
    initial begin
        #2
        rst = 1;
        #2
        rst = 0;
        data_in = 8'b0001_1001;
        select = 3'b001;
        #2
        data_in = 8'b1001_0111;
        select = 3'b010;
        #2
        data_in = 8'b1011_0001;
        select = 3'b011;
        #2
        data_in = 8'b1000_0101;
        select = 3'b100;
        #2
        data_in = 8'b1001_0000;
        select = 3'b101;
    end
    initial clk = 0;
    always #1 clk = !clk;
endmodule
