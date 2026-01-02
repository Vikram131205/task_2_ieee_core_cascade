`timescale 1ns / 1ps


module q1(
input x,clk,reset,
output reg z,
output reg [2:0] state,next_state
    );
    parameter s0 = 3'd0, s1 = 3'd1, s2 = 3'd2 , s3 = 3'd3 , s4 = 3'd4 , s5 = 3'd5 , s6 = 3'd6;
    
    
    always @(posedge clk) begin
    if(reset)
    state <= s0;
    else 
    state <= next_state;
    end
    
    always @(state,x) begin
    case(state)
    s0 : begin
    if(x) begin
    next_state = s1;
    z = 0;
    end
    else begin
    next_state = s2;
    z = 0;
    end
    end
    
    s1 : begin
    if(x) begin
    next_state = s3;
    z = 0;
    end
    else begin
    next_state = s5;
    z = 0;
    end
    end
    
    s2 : begin
    if(x) begin
    next_state = s6;
    z = 0;
    end
    else begin
    next_state = s4;
    z = 0;
    end
    end
    
    s3 : begin
    if(x) begin
    next_state = s3;
    z = 1;
    end
    else begin
    next_state = s5;
    z = 1;
    end
    end
    
    s4 : begin
    if(x) begin
    next_state = s6;
    z = 0;
    end
    else begin
    next_state = s4;
    z = 0;
    end
    end
    
    s5 : begin
    if(x) begin
    next_state = s6;
    z = 1;
    end
    else begin
    next_state = s4;
    z = 0;
    end
    end
    
    s6 : begin
    if(x) begin
    next_state = s3;
    z = 1;
    end
    else begin
    next_state = s5;
    z = 0;
    end
    end
    endcase
    end
    endmodule
