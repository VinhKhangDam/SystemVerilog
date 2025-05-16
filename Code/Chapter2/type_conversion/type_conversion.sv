module convert;
    //static cast
    int i;
    real r;
    initial begin
    i = int ' (10.0 - 0.1);
    r =  real ' (42);
        $display("Value convert: %0d, %0d", i, r);
    end

    //dynamic cast

    //streaming operators
    initial begin
        int h;
        bit [7:0] b, g[4], j[4] = '{8'ha, 8'hb, 8'hc, 8'hd};
        bit [7:0] q, r, s, t;

        h = {<<{j}};
        $display("#1:%h", h);
        h = {>>{j}};
        $display("#2:%h", h);
        h = {<< byte {j}};
        $display("#3:%h", h);
        {>>{g}} = {<<byte{j}};
        $display("#4:%p", g);
        b = {<<{8'b1011_0110}};
        $display("#5:%b", b);
        b = {<<4{8'b0011_0101}};
        $display("#6:%b", b);
        {>>{q, r, s, t}} = j;
        $display("#7:%h", {q, r, s, t});
        h = {>>{t, s, r ,q}};
        $display("#8:%h", h);
    end
        //hehe
        initial begin
            bit [15:0] wq[$] = {16'h1234, 16'h5678};
            bit [7:0] bq[$];

            bq = {>> {wq}}; //12 34 56 78
            $display("bq first : %p", bq);
            bq = {8'h98, 8'h76, 8'h54, 8'h32};
            $display("bq second : %p", bq);
            wq = { <<{bq}};
            $display("wq first : %p", wq);
        end
        //struct
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
            byte b[];
            byte c[];
            b = {>>{st}};
            $display("b = %x", b);
            b = '{8'h11, 8'h22, 8'h33, 8'h44, 8'h55, 8'h66, 8'h77, 8'h88, 8'h99, 8'haa, 8'hbb, 8'hcc, 8'hdd};
            $display("b = %x", b);
            c = { >> {b}};
            $display("c = %x", c);
        end
        //enumerates
        typedef enum  {INIT, DECODE, IDLE} fsmstate_e;
        fsmstate_e pstate, nstate;

        initial begin
            case(pstate)
                IDLE: nstate = INIT;
                INIT: nstate = DECODE;
                default: nstate = IDLE;
            endcase
            $display("Next state is %s", nstate.name());
        end
    
        
endmodule