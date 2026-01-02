`timescale 1ns / 1ps
module q2(
    input x, clk, reset,
    output reg z,
    output reg [2:0] state, next_state
);
    parameter s0 = 3'd0, s1 = 3'd1, s2 = 3'd2, s3 = 3'd3, s4 = 3'd4;
    
    // State register
    always @(posedge clk) begin
        if(reset) begin
            state <= s0;
        end
        else begin
            state <= next_state;
        end
    end
    
    // Next state logic (mod 5 counter)
    always @(*) begin
        case(state) 
            s0: next_state = x ? s1 : s0;  // 0*2 + x = x mod 5
            s1: next_state = x ? s3 : s2;  // 1*2 + x = (2+x) mod 5
            s2: next_state = x ? s0 : s4;  // 2*2 + x = (4+x) mod 5
            s3: next_state = x ? s2 : s1;  // 3*2 + x = (6+x) mod 5 = (1+x) mod 5
            s4: next_state = x ? s4 : s3;  // 4*2 + x = (8+x) mod 5 = (3+x) mod 5
            default: next_state = s0;
        endcase
    end
    
    // Output logic: z = 1 when divisible by 5 (state == s0) and not in reset
    always @(*) begin
        if(reset)
            z = 0;
        else
            z = (state == s0) ? 1 : 0;
    end
   
endmodule
