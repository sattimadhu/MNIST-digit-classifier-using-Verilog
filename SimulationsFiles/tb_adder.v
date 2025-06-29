`timescale 1ns / 1ps
module tb_adder;
  parameter WIDTH = 16;
  reg signed [WIDTH-1:0] a, b;
  wire signed [WIDTH-1:0] sum;

  adder #(WIDTH) uut (
    .a(a),
    .b(b),
    .sum(sum)
  );

  initial begin
    $display("Time\t a\t b\t sum");
    $monitor("%0t\t %d\t %d\t %d", $time, a, b, sum);

    a = 16'd1000; b = 16'd2000; #10;
    a = 16'd1500; b = -16'd500; #10;
    a = -16'd3000; b = -16'd1000; #10;
    a = 16'sh7FFF; b = 16'sh7FFF; #10;
    a = -16'sh8000; b = -16'sh8000; #10;

    $finish;
  end

endmodule
