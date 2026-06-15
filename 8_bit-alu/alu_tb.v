`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 10:54:32
// Design Name: 
// Module Name: alu_tb
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
`timescale 1ns / 1ps

module alu_tb;

    reg [7:0] A;
    reg [7:0] B;
    reg [2:0] SEL;

    wire [7:0] RESULT;
    wire       CARRY;
    wire       ZERO;

    alu_top uut (
        .A(A),
        .B(B),
        .SEL(SEL),
        .RESULT(RESULT),
        .CARRY(CARRY),
        .ZERO(ZERO)
    );

    task show;
        input [23:0] op_name;
        begin
            $display("%-6s | A=%h  B=%h | RESULT=%h  CARRY=%b  ZERO=%b",
                     op_name, A, B, RESULT, CARRY, ZERO);
        end
    endtask

    initial begin
        // Initialize everything to 0 first
        A = 8'h00; B = 8'h00; SEL = 3'b000;
        #10; // wait for signals to settle

        $display("==========================================");
        $display(" 8-BIT ALU TESTBENCH RESULTS");
        $display("==========================================");

        // ══ SEL=000 : ADD ══════════════════════
        $display("--- ADD ---");
        SEL = 3'b000;
        A = 8'h0F; B = 8'h0F; #20; show("ADD");  // 0F+0F=1E
        A = 8'hFF; B = 8'h01; #20; show("ADD");  // overflow CARRY=1
        A = 8'h00; B = 8'h00; #20; show("ADD");  // ZERO=1
        #50;

        // ══ SEL=001 : SUB ══════════════════════
        $display("--- SUB ---");
        SEL = 3'b001;
        A = 8'hFF; B = 8'h01; #20; show("SUB");  // FF-01=FE
        A = 8'h0A; B = 8'h05; #20; show("SUB");  // 0A-05=05
        A = 8'h00; B = 8'h01; #20; show("SUB");  // borrow CARRY=1
        #50;

        // ══ SEL=010 : AND ══════════════════════
        $display("--- AND ---");
        SEL = 3'b010;
        A = 8'hFF; B = 8'hF0; #20; show("AND");  // F0
        A = 8'hAA; B = 8'h55; #20; show("AND");  // 00 ZERO=1
        A = 8'h0F; B = 8'hF0; #20; show("AND");  // 00 ZERO=1
        #50;

        // ══ SEL=011 : OR ═══════════════════════
        $display("--- OR  ---");
        SEL = 3'b011;
        A = 8'hAA; B = 8'h55; #20; show("OR");   // FF
        A = 8'h0F; B = 8'hF0; #20; show("OR");   // FF
        A = 8'h00; B = 8'h00; #20; show("OR");   // 00 ZERO=1
        #50;

        // ══ SEL=100 : XOR ══════════════════════
        $display("--- XOR ---");
        SEL = 3'b100;
        A = 8'hFF; B = 8'hFF; #20; show("XOR");  // 00 ZERO=1
        A = 8'hAA; B = 8'h55; #20; show("XOR");  // FF
        A = 8'hF0; B = 8'h0F; #20; show("XOR");  // FF
        #50;

        // ══ SEL=101 : NOT ══════════════════════
        $display("--- NOT ---");
        SEL = 3'b101;
        A = 8'hAA; B = 8'h00; #20; show("NOT");  // 55
        A = 8'hFF; B = 8'h00; #20; show("NOT");  // 00 ZERO=1
        A = 8'h00; B = 8'h00; #20; show("NOT");  // FF
        #50;

        // ══ SEL=110 : SHL ══════════════════════
        $display("--- SHL ---");
        SEL = 3'b110;
        A = 8'h0F; B = 8'h00; #20; show("SHL");  // 1E
        A = 8'h01; B = 8'h00; #20; show("SHL");  // 02
        A = 8'h80; B = 8'h00; #20; show("SHL");  // 00 ZERO=1
        #50;

        // ══ SEL=111 : SHR ══════════════════════
        $display("--- SHR ---");
        SEL = 3'b111;
        A = 8'hF0; B = 8'h00; #20; show("SHR");  // 78
        A = 8'hAA; B = 8'h00; #20; show("SHR");  // 55
        A = 8'h01; B = 8'h00; #20; show("SHR");  // 00 ZERO=1
        #50;

        $display("==========================================");
        $display(" SIMULATION COMPLETE - ALL 8 OPS DONE");
        $display("==========================================");
        $finish;
    end

    // Single monitor - no race condition
    initial
        $monitor("t=%0t ns | SEL=%b A=%h B=%h | RESULT=%h CARRY=%b ZERO=%b",
                 $time, SEL, A, B, RESULT, CARRY, ZERO);

endmodule