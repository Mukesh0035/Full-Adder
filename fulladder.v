module half_adder(
    input a,
    input b,
    output sumh,
    output carryh
);
    assign sumh = a ^ b;
    assign carryh = a & b;
endmodule

module full_adder(
    input a,
    input b,
    input c,
    output sumf,
    output carryf
);
    wire sum1, carry1, carry2;

    half_adder HA1 (
        .a(a),
        .b(b),
        .sumh(sum1),
        .carryh(carry1)
    );

    half_adder HA2 (
        .a(c),
        .b(sum1),
        .sumh(sumf),
        .carryh(carry2)
    );

    assign carryf = carry1 | carry2;
endmodule
