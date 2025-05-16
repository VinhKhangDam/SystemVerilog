module tri_test (
    input logic a, b,
    output tri tri_multi,
    output tri0 tri2,
    output tri1 tri3,
    output trior tri4,
    output triand tri5
);
//multi drive
assign tri_multi = a;
assign tri_multi = b;

//tri0
assign tri2 = a;
assign tri2 = b;

//tri1
assign tri3 = a;
assign tri3 = b;

//trior
assign tri4 = a;
assign tri4 = b;

//triand
assign tri5 = a;
assign tri5 = b;

endmodule

module tb;
    logic a, b;
    tri tri_multi;
    tri0 tri2;
    tri1 tri3;
    trior tri4;
    triand tri5;
    
    tri_test tr(
        .a(a),
        .b(b),
        .tri_multi(tri_multi),
        .tri2(tri2),
        .tri3(tri3),
        .tri4(tri4),
        .tri5(tri5)
    );

    initial begin

        $monitor ("Time = %0t | a = %b, b = %b || tri = %b | tri0 = %b | tri1 = %b | trior = %b | triand = %b", $time, a, b, tri_multi, tri2, tri3, tri4, tri5);

        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
        //0 vs 1
        a = 1'b0; b = 1'b0; #10;
        a = 1'b0; b = 1'b1; #10;
        a = 1'b1; b = 1'b0; #10;
        a = 1'b1; b = 1'b1; #10;
        //0 1 vs x z
        a = 1'b0; b = 1'bx; #10;
        a = 1'b0; b = 1'bz; #10;
        a = 1'b1; b = 1'bx; #10;
        a = 1'b1; b = 1'bz; #10;
        //x z vs 0 1
        a = 1'bx; b = 1'b0; #10;
        a = 1'bx; b = 1'b1; #10;
        a = 1'bz; b = 1'b0; #10;
        a = 1'bz; b = 1'b1; #10;
        // x vs z
        a = 1'bx; b = 1'bx; #10;
        a = 1'bx; b = 1'bz; #10;
        a = 1'bz; b = 1'bx; #10;
        a = 1'bz; b = 1'bz; #10;

        $finish;
    end
endmodule