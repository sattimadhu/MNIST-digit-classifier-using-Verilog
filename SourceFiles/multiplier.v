module multiplier #(
    parameter WIDTH = 16  // Bit-width of inputs
)(
    input  signed [WIDTH-1:0] a,
    input  signed [WIDTH-1:0] b,
    output signed [(2*WIDTH)-1:0] result
);

    assign result = a * b;

endmodule
