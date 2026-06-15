module subtractor(
    input [7:0] A,
    input [7:0] B,
    output [7:0] DIFF,
    output BORROW
);

assign {BORROW,DIFF} = A - B;

endmodule