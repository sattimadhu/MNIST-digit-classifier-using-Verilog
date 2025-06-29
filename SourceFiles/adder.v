module adder #(
    parameter WIDTH = 32  // input and output width
)(
    input  signed [WIDTH-1:0] a,
    input  signed [WIDTH-1:0] b,
    output signed [WIDTH-1:0] sum
);

    assign sum = a + b;

endmodule
