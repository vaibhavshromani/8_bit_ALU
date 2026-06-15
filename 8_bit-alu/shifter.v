module shifter(
    input [7:0] A,
    input dir,
    output [7:0] Y
);

assign Y = (dir==0) ? (A << 1) : (A >> 1);

endmodule