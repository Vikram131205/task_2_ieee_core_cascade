`timescale 1ns / 1ps


module q3(
 input clk,x,reset,
    output z,
    output reg [2:0] state,next_state
    );
    parameter s0 = 3'd0, s1 = 3'd1 , s2 = 3'd2 , s3 = 3'd3 , s4 = 3'd4;
    always @(posedge clk) begin
    if(reset) 
    state <= s0;
    else
    state <= next_state;
    end
    
    always @(x,state) begin
    case(state) 
    s0 : next_state = x ? s1 : s0;
    s1 : next_state = x ? s2 : s1;
    s2 : next_state = x ? s3 : s2;
    s3 : next_state = x ? s4 : s3;
    s4 : next_state = x ? s1 : s4;
    endcase
        end 
   assign z = reset ? 0 : (state == s4);   
endmodule
