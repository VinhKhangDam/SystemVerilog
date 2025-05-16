module arrays_literal ();
    static int a[4] = '{1, 2, 3, 4};
    int b[5];

    initial begin
    $display("a = %p", a);
    b = '{4, 3, 2, 1, 0};
    $display("b = %p", b);
    b [0:2] = '{7, 6, 5};
    $display("b = %p", b);
    a = '{4{8}};
    $display("a = %p", a);
    a = '{default:42};
    $display("a = %p", a);
    end
endmodule