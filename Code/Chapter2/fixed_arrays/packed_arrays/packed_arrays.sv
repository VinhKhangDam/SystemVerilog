module test();
    bit [7:0] a_packed, b_packed, c_packed, d_packed, e_packed;
    bit a_unpacked[7:0];
    bit b_unpacked[0:7];

    initial begin 
    a_unpacked[0] = 1'b1;
    a_unpacked[1] = 1'b0;
    a_unpacked[2] = 1'b0;
    a_unpacked[3] = 1'b1;
    a_unpacked[4] = 1'b1;
    a_unpacked[5] = 1'b1;
    a_unpacked[6] = 1'b1;
    a_unpacked[7] = 1'b1;

    b_unpacked[0] = 1'b1;
    b_unpacked[1] = 1'b0;
    b_unpacked[2] = 1'b0;
    b_unpacked[3] = 1'b1;
    b_unpacked[4] = 1'b1;
    b_unpacked[5] = 1'b1;
    b_unpacked[6] = 1'b1;
    b_unpacked[7] = 1'b1;

    a_packed = {<<{a_unpacked}};
    b_packed = {>>{a_unpacked}};
    c_packed = {<<{b_unpacked}};
    d_packed = {>>{b_unpacked}};
    e_packed = 


    $display("a_packed = %b", a_packed);
    $display("b_packed = %b", b_packed);
    $display("c_packed = %b", c_packed);
    $display("d_packed = %b", d_packed);
    $display("a_unpacked = %p", a_unpacked);
    $display("b_unpacked = %p", b_unpacked);

    end 
  endmodule