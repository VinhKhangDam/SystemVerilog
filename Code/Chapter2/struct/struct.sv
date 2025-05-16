module struct_test;
    initial begin
        typedef struct {
            int a;
            byte b;
            shortint c;
            int d;
        }my_struct_s;
    my_struct_s st = '{
        32'haaaa_aaaa,
        8'hbb,
        16'hcccc,
        32'hdddd_dddd
    };
    $display("str = %x %x %x %x ", st.a, st.b, st.c,st.d);
    end

    //Packed struct
    typedef struct packed{
        bit [7:0] r, g, b;
    } pixel_p_s;
    pixel_p_s my_pixel;
endmodule