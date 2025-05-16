module compare (
    input bit [7:0] in1, //8-bit unsigned integer
    input byte in2, //8-bit signed integer

    input bit [31:0] in3, //32-bit unsigned integer
    input int unsigned in4, //32-bit unsigned integer
    input int in5, //32-bit signed integer

    output logic [7:0] out1,
    output logic [31:0] out2,
    output logic [31:0] out3
);

assign out1 = in2 - in1; 
assign out2 = in4 - in3;
assign out3 = in5 - in3;
    
endmodule

module tb;
    // Inputs
    bit [7:0] in1;
    byte in2;
    bit [31:0] in3;
    int unsigned in4;
    int in5;

    // Outputs
    logic [7:0] out1;
    logic [31:0] out2;
    logic [31:0] out3;

    // Instantiate DUT
    compare dut (
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .in4(in4),
        .in5(int5),
        .out1(out1),
        .out2(out2),
        .out3(out3)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        $monitor ("Time = %0t |  bit[7:0]= %0d | byte = %0d | bit[31:0] = %0d | int unsigned = %0d | int signed = %0d =>  byte - bit [7:0] = %0d| int unsigned - bit[31:0] = %0d | int signed - bit[31:0] = %0d", $time, in1, in2, in3, in4, in5, out1, out2 ,out3 );

        //case out1:
        in1 = 8'b10010100; in2 = 8'b10010100; #10;
        in1 = 8'b10010100; in2 = 8'b00010100; #10;
        in1 = 8'b00010100; in2 = 8'b10010100; #10;
        in1 = 8'b00010100; in2 = 8'b00010100; #10;

        //case next
        in3 = 32'b11111111111111110000000000000000; in4 = 32'b11111111111111110000000000000000; in5 = 32'b11111111111111110000000000000000; #10;
        in3 = 32'b11111111111111110000000000000000; in4 = 32'b11111111111111110000000000000000; in5 = 32'b01111111111111110000000000000000; #10;
        in3 = 32'b11111111111111110000000000000000; in4 = 32'b01111111111111110000000000000000; in5 = 32'b11111111111111110000000000000000; #10;
        in3 = 32'b11111111111111110000000000000000; in4 = 32'b01111111111111110000000000000000; in5 = 32'b01111111111111110000000000000000; #10;
        in3 = 32'b01111111111111110000000000000000; in4 = 32'b11111111111111110000000000000000; in5 = 32'b11111111111111110000000000000000; #10;
        in3 = 32'b01111111111111110000000000000000; in4 = 32'b11111111111111110000000000000000; in5 = 32'b01111111111111110000000000000000; #10;
        in3 = 32'b01111111111111110000000000000000; in4 = 32'b01111111111111110000000000000000; in5 = 32'b11111111111111110000000000000000; #10;
        in3 = 32'b01111111111111110000000000000000; in4 = 32'b01111111111111110000000000000000; in5 = 32'b01111111111111110000000000000000; #10;
        #5; $finish;
    end
endmodule
    