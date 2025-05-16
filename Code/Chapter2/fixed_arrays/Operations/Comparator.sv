module Comparator ();
    initial begin
        bit [31:0] a[5] = '{0, 1, 2, 3, 4},
                   b[5] = '{5, 4, 3, 2, 1};
    if (a == b) 
        $display("a == b");
    else
        $display("a != b");

    b = a;  

    a[0] = 5;

    $display("a %s b", (a == b) ? "==" : "!=");

    $display("a[1:4] %s b[1:4]", (a[1:4] == b[1:4]) ? "==" : "!=");
    end
endmodule