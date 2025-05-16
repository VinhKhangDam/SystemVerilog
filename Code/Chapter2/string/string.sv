module string_test;
    string s;

    initial begin
        s = "IEEE";
        $display("%s", s);
        $display(s.getc(0));//return byte at location 0
        $display(s.tolower());//lowercase text

        s.putc(s.len()-1, "-");//write '-' into the location s.len() - 1
        s = {s, "1800"}; //concatenation : => 's 1800'

        $display(s.substr(2, 5));//extracts characters from location start to end.

        my_log($sformatf("%s %5d",s, 42 ));
    end
    function void my_log(string message);
        $display("@%0t: %s", $time, message);
    endfunction
endmodule