module multidrive (
    input  a, b,
    output wire out_wire,
    output reg out_reg,
    output logic out_logic
);

assign out_wire = a;
assign out_wire = b;

always @(*) begin
    out_reg = a;
    out_reg = b;
end

assign out_logic = a;
assign out_logic = b;
endmodule

module tb;
    reg a, b;
    wire out_wire;
    reg out_reg;
    logic out_logic;

    multidrive md (
        .a(a),
        .b(b),
        .out_wire(out_wire),
        .out_reg(out_reg),
        .out_logic(out_logic)
    );

initial begin

    $monitor ("Time = %0t | a = %b, b = %b => out_wire = %b | out_reg = %b | out_logic = %b", $time, a, b, out_wire, out_reg, out_logic);

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