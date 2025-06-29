`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 09:41:14
// Design Name: 
// Module Name: counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter#(parameter WIDTH=10, MAX_COUNT=784)
(input en,rst,clk,
output reg [WIDTH-1:0] count,
output reg done
);
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        count<=0;
        done<=0;
    end 
    else if(en) begin
        if(count == MAX_COUNT-1)begin
        count<=count;
        done<=1;
        end
        else begin
        count<=count+1;
        done<=0;
        end
    end
end
endmodule
