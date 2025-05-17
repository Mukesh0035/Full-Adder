`timescale 1ns / 1ps

`timescale 1ns/1ps

module adder_4bit_tb;

    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;

  
    adder_4bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

  
    initial begin
        $display("------------------------------------------");
        $display("|   a   |   b   | cin |  sum  | cout |");
        $display("------------------------------------------");
    end

   
    initial begin
        $monitor("| %b | %b |  %b  | %b |   %b   |", a, b, cin, sum, cout);
    end

    // Simulation
    initial begin
        $dumpfile("adder_4bit.vcd");
        $dumpvars(0, adder_4bit_tb);

        // Test a few patterns
        a = 4'b0000; b = 4'b0000; cin = 0; #10;
        a = 4'b0011; b = 4'b0101; cin = 0; #10;
        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        a = 4'b1010; b = 4'b0101; cin = 1; #10;
        a = 4'b1111; b = 4'b1111; cin = 1; #10;

        $display("------------------------------------------");

        $finish;
    end

endmodule
