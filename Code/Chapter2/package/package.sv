module package_test;
    package ABC;
        parameter int abc_data_width = 32;
        typedef logic [abc_data_width-1:0] abc_data_t;
        parameter time timeout = 100ns;
    endpackage//ABC

    abc_data_t data;
    import ABC::*;
    string messages = "Test timed out";

    initial begin
        #(timeout);
        $display("Timeout - %s", messages);
        $finish;
    end
endmodule