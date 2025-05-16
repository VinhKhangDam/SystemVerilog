//[m:0] a [n:0] : la co n+1 phan tu, moi phan tu co m+1 bit
//a[m:0][n:0] : tat ca phan tu deu 1 bit, co m+1 phan tu, moi phan tu co n+1 phan tu
//[m:0][n:0]a: m+1 phan tu, n+1 bit

module design1(
    input logic [3:0] a [1:0]
);  

    always_comb begin
        $display ("\n[design1] input [3:0] a [1:0]");
        $display ("a[0] = %b", a[0]);
        $display ("a[1] = %b", a[1]);
    end
endmodule

module design2 (
    input logic [3:0][1:0] a
);
    always_comb begin
        $display ("\n[design2] input [3:0][1:0] a");
        for (int i = 0; i < 4; i = i + 1) begin
            $display ("a[%0d] = %b", i,a[i]);
        end
    end
endmodule

module design3 (
    input logic a [3:0][1:0]
);
    always_comb begin
        $display ("\n[design3] input a [3:0][1:0]");
        for (int i = 0; i < 4; i = i + 1) begin 
                $display ("a[%0d] = %p", i, a[i]);
        end
    end
endmodule

module tb;
    logic [3:0]arr1[1:0];
    logic [3:0][1:0]arr2;
    logic arr3[3:0][1:0];

    design1 d1(.a(arr1));
    design2 d2(.a(arr2));
    design3 d3(.a(arr3));

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        arr1[0] = 4'b0000;
        arr1[1] = 4'b1010;

        arr2[0] = 2'b00;
        arr2[1] = 2'b01;
        arr2[2] = 2'b10;
        arr2[3][0] = 2'b1;
        arr2[3][1] = 2'b1;

        arr3[0][0] = 1'b0;
        arr3[0][1] = 1'b1;
        arr3[1][0] = 1'b0;
        arr3[1][1] = 1'b1;
        arr3[2][0] = 1'b0;
        arr3[2][1] = 1'b1;
        arr3[3][0] = 1'b0;
        arr3[3][1] = 1'b1;

        #10; $finish;
    end
endmodule