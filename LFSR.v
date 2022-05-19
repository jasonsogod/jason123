module LFSR 
(
    input i_Clk,
    input i_Enable,
    input i_Seed_DV,
    input [3-1:0] i_Seed_Data,

    output [3-1:0]o_LFSR_Data,
    output o_LFSR_Done
);
reg [3:1] r_LFSR =0;
reg              r_XOR;

always @(posedge i_Clk) 
    begin
        if(i_Enable==1'b1)
            begin
                if(i_Seed_DV==1'b1)
                r_LFSR<=i_Seed_Data;
                else
                r_LFSR<={r_LFSR[3-1:1],r_XOR};
            end
    end
    always @(*)
    begin
        r_XOR=r_LFSR[3]^r_LFSR[1];
    end
    assign o_LFSR_Data=r_LFSR[3:1];

    assign o_LFSR_Done=(r_LFSR[3:1]==i_Seed_Data)?1'b1:1'b0;
endmodule