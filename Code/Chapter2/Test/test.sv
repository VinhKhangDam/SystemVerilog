module test;
    //============Question 1===================
    byte my_byte;
    integer my_integer;
    int my_int;
    bit [15:0] my_bit;
    shortint my_short_int1;
    shortint my_short_int2;
    initial begin
    my_integer = 32'b0000_1111_xxxx_zzzz;
    my_int = my_integer;
    my_bit = 16'h8000;
    my_short_int1 = my_bit;
    my_short_int2 = my_short_int1-1;
    $display("The answer for question 1:");
    $display("my_integer = %0d", my_integer);
    $display("my_int value in hex = %h", my_int);
    $display("my_bit value in decimal = %0d", my_bit);
    $display("my_short_int1 value in decimal = %0d", my_short_int1);
    $display("my_short_int2 value in decimal = %0d", my_short_int2);
    end
    //===========================================

    //============Question 2===================
    bit [7:0] my_mem[3];
    logic [3:0] my_logicmem[4];
    logic [3:0] my_logic;

    initial begin
        my_mem = '{default:8'hA5};
        /*
        my_mem[2] = 1010_0101
        my_mem[1] = 1010_0101
        my_mem[0] = 1010_0101
        */
        my_logicmem = '{0, 1, 2, 3};
        /*
        my_logicmem[0] = 0000
        my_logicmem[1] = 0001
        my_logicmem[2] = 0010
        my_logicmem[3] = 0011
        */
        my_logic = 4'hF;//my_logic = 1111

        //questions
        $display("The answer for question 2:");
        my_mem[2] = my_logicmem[4]; //my_mem[2] = 00
        $display("Question a: My_mem[2] = my_logicmem[4] = %h", my_mem[2]);
        my_logic = my_logicmem[4]; //my_logic = X
        $display("Question b: my_logic = my_logicmem[4] = %h", my_logic);
        my_logicmem[3] = my_mem[3];//my_logicmem[3] = 0000
        $display("Question c: my_logicmem[3] = my_mem[3] = %h", my_logicmem[3]);
        my_mem[3] = my_logic;//my_mem[3] = 8'b0
        $display("Question d: My_mem[3] = my_logic = %h", my_mem[3]);
        my_logic = my_logicmem[1];//my_logic = 4'h1
        $display("Question e: My_logic = my_logicmem[1] = %h", my_logic);
        my_logic = my_mem[1];//my_logic = 0101
        $display("Question f: My_logic = my_mem[1] = %h", my_logic);
        my_logic = my_logicmem[my_logicmem[41]];//my_logic = X
        $display("Question g: my_logic = my_logicmem[my_logicmem[41]] = %h", my_logic);
    end
    //=========================================

    //============Question 3===================
    bit [11:0] my_arrays [4];

    initial begin
        $display("The answer for question 3:");
        my_arrays[0] = 12'h012;//0000_00|01|_0010
        my_arrays[1] = 12'h345;//0011_01|00|_0101
        my_arrays[2] = 12'h678;//0110_01|11|_1000
        my_arrays[3] = 12'h9AB;//1001_10|10|_1011
        //for
        for (int i = 0; i < 4; i++) begin
            for (int j = 5; j > 3; j--) begin
                $display("For: my_arrays[%0d][%0d] = %b", i, j, my_arrays[i][j]);
            end
        end
        //foreach
        foreach(my_arrays[i]) begin
            foreach(my_arrays[,j]) begin
                if (j >= 4 && j<6)
                $display("Foreach: my_arrays[%0d][%0d] = %b", i, j, my_arrays[i][j]);
            end
        end
    end
    //=========================================
    
    //==========Question 4=====================
   	logic my_array1 [4:0][30:0];
	
	initial begin
		my_array1[4][30] = 1'b1;
		my_array1[29][4] = 1'b1;
		//my_array1[4] = 32'b1;

		$display("my_array1 = %p", my_array1);
	end
    //=========================================

//========Question 6===============
string street[$];

initial begin
	$display("Question 6");
	street = {"Tejon", "Bijou", "Boulder"};//Tejon
	$display("Street[0] = s", street[0]);
	street.insert(2, "Platte");//Platte
	$display("Street[2] = %s", street[2]);
	street.push_front("St. Vrain");//Boulder
	$display("Street[2] = %s", street[2]);
	$display("pop_back = %s", street.pop_back);//Platte
	$display("street.size = %d", street.size);
end
//=================================

//======Question 7=================
logic [23:0] mem [logic [19:0]];

initial begin
	mem[20'h00000] = 24'hA50400;
	mem[20'h00400] = 24'h123456;
	mem[20'h00401] = 24'h789ABC;
	mem[20'hFFFFF] = 24'h0F1E2D;
end
initial begin
	foreach(mem[addr]) begin
		$display("mem[%h] = %h", addr, mem[addr]);
	end

	$display("Number of elements in mem: %0d", mem.sum());
end

//=================================

//======Question 8================
int queue[$] = {2, -1, 127};

initial begin
	int sum_queue = queue.sum();
	$display("Sum of the queue: %0d", sum_queue);

	$display("Max of the queue: %0d", queue.max());
	$display("Min of the queue: %0d", queue.min());
    
end
//================================

//================================

endmodule

