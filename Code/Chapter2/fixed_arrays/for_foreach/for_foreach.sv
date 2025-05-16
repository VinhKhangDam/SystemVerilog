module for_foreach();
    logic [31:0] src[5], dst[5];
    integer i, j;
    initial begin
        for (i = 0; i < $size(src);i = i + 1) begin
            src[i] = i;
        end
        $display("src = %p", src);
        foreach(dst[j]) begin
            dst[j] = src[j] * 2;
        end
        $display("dst = %p", dst);
    end
endmodule