`timescale 1ps/1ps

module state_compare (
    input bit b_2state,       // Biến kiểu 2-state (bit)
    input logic [31:0] i_4state, // Biến kiểu 4-state (logic 32-bit)
    output logic out_2state,  // Output 2-state
    output logic [31:0] out_4state // Output 4-state
);

// 2-state chỉ có 0 và 1, không giữ được x/z
always_comb out_2state = b_2state;

// 4-state giữ được x/z
always_comb out_4state = i_4state;

endmodule

module tb_state_compare;
    // Khai báo biến test
    bit b_2state;
    logic [31:0] i_4state;
    logic out_2state;
    logic [31:0] out_4state;

    // Instance module RTL
    state_compare uut (
        .b_2state(b_2state),
        .i_4state(i_4state),
        .out_2state(out_2state),
        .out_4state(out_4state)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_state_compare);

        // Khởi tạo giá trị
        b_2state = 0;
        i_4state = 0;
        #10;
        $display("T=%0t | bit: %b -> out_2state: %b | integer: %0d -> out_4state: %0d", 
                 $time, b_2state, out_2state, i_4state, out_4state);

        // Gán giá trị 1
        b_2state = 1;
        i_4state = 1;
        #10;
        $display("T=%0t | bit: %b -> out_2state: %b | integer: %0d -> out_4state: %0d", 
                 $time, b_2state, out_2state, i_4state, out_4state);

        // Gán giá trị x
        b_2state = 1'bx;  // 2-state không giữ được x
        i_4state = 32'bx; // 4-state giữ được x
        #10;
        $display("T=%0t | bit: %b -> out_2state: %b | integer: %0d -> out_4state: %0d", 
                 $time, b_2state, out_2state, i_4state, out_4state);

        // Gán giá trị z
        b_2state = 1'bz;  // 2-state không giữ được z
        i_4state = 32'bz; // 4-state giữ được z
        #10;
        $display("T=%0t | bit: %b -> out_2state: %b | integer: %0d -> out_4state: %0d", 
                 $time, b_2state, out_2state, i_4state, out_4state);

        $finish;
    end
endmodule
