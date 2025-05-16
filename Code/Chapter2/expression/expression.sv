module expression;
    bit[7:0]b8;
    bit one = 1'b1;
    initial begin
    $displayb(one+one);

    b8 = one+one;
    $displayb(b8);

    $displayb(one+one+2'b0);

    $displayb(2'(one)+one);
    end
endmodule