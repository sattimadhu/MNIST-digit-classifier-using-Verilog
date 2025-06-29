`timescale 1ns / 1ps

module tb_counter;
    parameter WIDTH = 4;
    parameter MAX_COUNT = 10;
    reg clk;
    reg rst;
    reg en;
    wire [WIDTH-1:0] count;
    wire done;
    
    counter #(
        .WIDTH(WIDTH),
        .MAX_COUNT(MAX_COUNT)
    ) uut (.en(en),
    .rst(rst),
        .clk(clk),
        .count(count),
        .done(done)
    );
    
    always #5 clk = ~clk;

    initial begin
        $display("Time\tReset\tEnable\tCount\tDone");
        $monitor("%4t\t%b\t%b\t%2d\t%b", $time, rst, en, count, done);

        // initial state
        clk = 0;
        rst = 0;
        en = 0;
        // hold reset for some time
        #10 rst = 1;
        en = 1;
        // run simulation for longer than MAX_COUNT cycles
        #100;

        $finish;
    end
endmodule