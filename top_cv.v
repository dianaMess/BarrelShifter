module top_cv
(
    input         fast_clk,
    input         slow_clk,
    input         rst_n,
    input         fast_clk_en,
    input  [ 2:0] key,
    input  [ 9:0] sw,
    output [ 9:0] led,
    output [ 7:0] disp_en,
    output [31:0] disp,
    output [ 7:0] disp_dot
);
    
    main #(.DATA_SIZE(4), .ROTATION(0), .DIRECTION(1)) log_right_shifter
    (
        .data_in    (sw  [3:0]),
        .select(sw  [9:8]),
        .data_out    (led[3:0]),
        .rst        (rst_n),
        .clk        (slow_clk)
    );

    main #(.DATA_SIZE(4), .ROTATION(1), .DIRECTION(0)) rot_left_shifter
    (
        .data_in    (sw  [7:4]),
        .select(sw  [9:8]),
        .data_out    (led[9:6]),
        .rst        (rst_n),
        .clk        (slow_clk)
    );
    
    assign led[9:4] = 0;

    assign disp[31:11] = 0;
    assign disp_en [7:0] = 8'b00001111;
    assign disp_dot [7:0] = 0;

endmodule
