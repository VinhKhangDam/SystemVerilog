module multi_dimensional ();
    int md[2][3] = '{'{0, 1, 2}, '{3, 4, 5}};
    integer i, j;
    initial begin
        $display ("Initual Value:");
        foreach(md[i, j]) begin
            $display("md[%0d][%0d] = %0d", i, j, md[i][j]);
        end

        $display("New value: ");
        md = '{'{9, 5, 7}, '{3{2}}};
        foreach(md[i, j]) begin
            $display("md[%0d][%0d]= %0d", i, j, md[i][j]);
        end
    end
endmodule