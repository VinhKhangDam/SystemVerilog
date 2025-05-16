module two_dimensions ();
    integer i,j;

    initial begin
        byte twoD[4][6];
        foreach(twoD[i,j])
            twoD[i][j] = i*10+j;

        foreach(twoD[i]) begin
            $write("%2d:",i);
            foreach(twoD[, j]) begin
                $write("%3d", twoD[i][j]);
            end
            $display;
        end
    end
endmodule