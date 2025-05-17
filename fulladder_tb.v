`timescale 1ns/1ps

module full_adder_tb;
    reg a, b, c;
    wire sumf, carryf;
    
    full_adder uut (
        .a(a),
        .b(b),
        .c(c),
        .sumf(sumf),
        .carryf(carryf)
    );

    initial begin
        $display("-------------------------------");
        $display(" a  b  c | sumf  carryf ");
        $display("-------------------------------");
    end
    initial begin
        $monitor(" %b  %b  %b   |   %b     %b   ", a, b, c, sumf, carryf);
    end
    initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0, full_adder_tb);

        a = 0; b = 0; c = 0; #10;
        a = 0; b = 0; c = 1; #10;
        a = 0; b = 1; c = 0; #10;
        a = 0; b = 1; c = 1; #10;
        a = 1; b = 0; c = 0; #10;
        a = 1; b = 0; c = 1; #10;
        a = 1; b = 1; c = 0; #10;
        a = 1; b = 1; c = 1; #10;

        $display("-------------------------------");

        $finish;
    end

endmodule
