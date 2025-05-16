module enum_test;
    typedef enum {RED, BLUE, GREEN} color_e;
    color_e color, c2;
    int c;
    initial begin
        color = BLUE;
        c = color;
        c++;
        if(!$cast(color, c))
            $display("Cast failed for c=%0d", c);
        $display("Color is %0d / %s", color, color.name());
        c++;
        c2 = color_e'(c);   
        $display("c2 is %0d / '%s'", c2, c2.name());
    end
endmodule