module tests (
    input logic logic_array [3:0],
    input int int_array [3:0],
    output logic out_logic,
    output int out_int
);

assign out_logic = logic_array[4];
assign out_int = int_array[4]; 

endmodule

module tb;
    logic logic_array[3:0];
    int int_array[3:0];
    logic out_logic;
    int out_int;

    tests t(
        .logic_array(logic_array),
        .int_array(int_array),
        .out_logic(out_logic),
        .out_int(out_int)
    );

initial begin
    $dumpfile ("test.vcd");
    $dumpvars(0, tb);

    $monitor ("Time = %0t | Logic_array = %p | Logic_array[4] = %b | int_array = %p | int_array[4] = %b", $time, logic_array, out_logic, int_array, out_int);

    logic_array[0] = 1'b0;
    logic_array[1] = 1'b0;
    logic_array[2] = 1'b1;
    logic_array[3] = 1'b0;

    int_array[0] = 1'b1;
    int_array[1] = 1'b0;
    int_array[2] = 1'b0;
    int_array[3] = 1'b1;
    #20;
    $finish;

end
endmodule