`timescale 1ns / 1ps

module tb_multiplier;
  parameter WIDTH = 16;
  reg signed [WIDTH-1:0] a, b;
  wire signed [(2*WIDTH)-1:0] result;
  
  multiplier #(WIDTH) uut (
    .a(a),
    .b(b),
    .result(result)
  );

  initial begin
    $display("Time\t a\t b\t result");
    $monitor("%0t\t %d\t %d\t %d", $time, a, b, result);

    a = 16'd100; b = 16'd3; #10;
    a = 16'd200; b = -16'd4; #10;
    a = -16'd25; b = -16'd10; #10;
    a = 0; b = 16'd1234; #10;
    a = 16'sh7FFF; b = 16'sh7FFF; #10;
    a = -16'sh8000; b = -16'sh8000; #10;

    $finish;
  end

endmodule
