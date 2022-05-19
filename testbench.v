`timescale 1ns/100ps
module tv_lfsr;
    reg i_Clk;
    reg i_Enable;
    
    reg i_Seed_DV;
    reg[3-1:0] i_Seed_Data;

    wire[3-1:0] o_LFSR_Data;
    wire o_LFSR_Done;

    LFSR dut( .i_Clk(i_Clk),
              .i_Enable(i_Enable),
              .i_Seed_DV(i_Seed_DV),
              .i_Seed_Data(i_Seed_Data),
              .o_LFSR_Data(o_LFSR_Data),
              .o_LFSR_Done(o_LFSR_Done));
    always #10 i_Clk=~i_Clk;                
    initial begin
        $dumpfile("LFSR.vcd");
        $dumpvars(0,dut);
        #0
        i_Clk=0;
        i_Enable=0;
        i_Seed_DV=0;
        i_Seed_Data=6;

        #15
        i_Enable=1;
        i_Seed_DV=1;
         @(posedge i_Clk);
        #5
        i_Seed_DV=0;
    end  
    initial #400 $finish;
endmodule