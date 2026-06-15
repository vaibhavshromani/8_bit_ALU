module not_gate(
    input [7:0] A,
    output [7:0] Y
);

assign Y = ~A;

endmodule