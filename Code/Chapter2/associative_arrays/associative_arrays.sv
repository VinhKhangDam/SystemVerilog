module associavtive_arrays;
    //------first_test--------------------------------------
    byte assoc[byte], idx = 1;
    initial begin
        do begin
            assoc[idx] = idx;
            idx = idx << 1;
        end while (idx != 0);

        foreach(assoc[i]) 
            $display("Assoc[%h] = %h", i, assoc[i]);

        if (assoc.first(idx))
        do 
            $display("assoc[%h] = %h", idx, assoc[idx]);
        while (assoc.next(idx));

        void '(assoc.first(idx));
        void '(assoc.delete(idx));
        $display("The array has %0d elements", assoc.num());
    end
    //-------------------------------------------------------

    //-----Second-test----------------------------------------
    int switching[string], min_address, max_address, i, file;
    initial begin
        string s;
        file = $fopen("associative_arrays.txt","r");
        while(!$feof(file)) begin
            $fscanf(file, "%d %s", i, s);
            switching[s] = i;
        end
        $fclose(file);

        min_address = switching["min_address"];

        if(switching.exists("max_address"))
            max_address = switching["max_address"];
        else
            max_address = 1000;

        foreach(switching[s])
            $display("switching['%s'] = %0d", s, switching[s]);
       //---------------------------------------------------------
    end
endmodule