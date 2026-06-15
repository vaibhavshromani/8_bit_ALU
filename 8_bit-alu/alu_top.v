module alu_top(
    input [7:0] A,
    input [7:0] B,
    input [2:0] SEL,

    output reg [7:0] RESULT,
    output reg CARRY,
    output ZERO
);

wire [7:0] sum;
wire [7:0] diff;
wire [7:0] and_out;
wire [7:0] or_out;
wire [7:0] xor_out;
wire [7:0] not_out;
wire [7:0] shl_out;
wire [7:0] shr_out;

wire add_carry;
wire sub_borrow;

adder U1(
    .A(A),
    .B(B),
    .SUM(sum),
    .COUT(add_carry)
);

subtractor U2(
    .A(A),
    .B(B),
    .DIFF(diff),
    .BORROW(sub_borrow)
);

and_gate U3(
    .A(A),
    .B(B),
    .Y(and_out)
);

or_gate U4(
    .A(A),
    .B(B),
    .Y(or_out)
);

xor_gate U5(
    .A(A),
    .B(B),
    .Y(xor_out)
);

not_gate U6(
    .A(A),
    .Y(not_out)
);

shifter U7(
    .A(A),
    .dir(1'b0),
    .Y(shl_out)
);

shifter U8(
    .A(A),
    .dir(1'b1),
    .Y(shr_out)
);

always @(*) begin

    CARRY = 0;

    case(SEL)

        3'b000:
        begin
            RESULT = sum;
            CARRY = add_carry;
        end

        3'b001:
        begin
            RESULT = diff;
            CARRY = sub_borrow;
        end

        3'b010:
            RESULT = and_out;

        3'b011:
            RESULT = or_out;

        3'b100:
            RESULT = xor_out;

        3'b101:
            RESULT = not_out;

        3'b110:
            RESULT = shl_out;

        3'b111:
            RESULT = shr_out;

        default:
            RESULT = 8'b0;

    endcase

end

assign ZERO = (RESULT == 8'b00000000);

endmodule