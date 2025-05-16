`timescale 1ns/1ps
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
    $display("=======================================================");
    $display("================Quesion 1==============================");
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
        $display("==============================================================");
        $display("=======================QUESTION 2=============================");
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

        $display("=========================================================================");
        $display("=====================QUESTION 3==========================================");
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
        $display("======================================================================");
        $display("==========================QUESTION 4==================================");
		$display("my_array1 = %p", my_array1);
	end
    //=========================================

//========Question 6===============
string street[$];

initial begin
    $display("===============================================================================");
    $display("==============================QUESTION 6========================================");
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
        $display("=========================================================");
        $display("========================QUESTION 7=======================");
	foreach(mem[addr]) begin
		$display("mem[%h] = %h", addr, mem[addr]);
	end

	$display("Number of elements in mem: %0d", mem.sum());
end

//=================================

//======Question 8================
static int queue[$] = {2, -1, 127};

initial begin
    //declare 
	static int sum_queue = queue.sum();
    static int queue_max [$] = queue.max();
    static int queue_min [$] = queue.min();
    static int queue_find [$], queue_find_value[$];
    static int queue_reverse[$];
    //display
    $display("================================================================");
    $display("=======================QUESTION 8===============================");
 	$display("Sum of the queue: %0d", sum_queue);
    $display("Max of the queue: %0d", queue_max[0]);
	$display("Min of the queue: %0d", queue_min[0]); 

    //Sort
     queue.sort();
    $display("Sort the queue: %p", queue);
    
    //Find index negative
    queue_find = queue.find_index() with (item < 0);
    $display("Index negative : %p", queue_find);

    //Find Positive value
    queue_find_value = queue.find() with (item >= 0);
    $display ("Positive value : %p", queue_find_value);

    //Reverse
    $display("Queue has : %p", queue);
    queue_reverse = {<<{queue}};
    $display("Reverse queue has : %p",queue_reverse);
end
//================================

//=============Question 9==============
typedef logic [6:0] user_defined;

typedef struct packed {
    user_defined header;
    user_defined cmd;
    user_defined data;
    user_defined crc;
}packed_user;

packed_user packed_user_t;

initial begin 
    packed_user_t.header = 7'h5A;//=================================
    packed_user_t.cmd = 'x;      //|| Header || cmd || data || crc||
    packed_user_t.data = 'x;     //27      21  20  14 13    7 6  0
    packed_user_t.crc = 'x;      //=================================
    $display("==============================================================");
    $display("=========================QUESSTION 9==========================");
    $display("My type:| Header | cmd | data | crc | ");
    $display("======================================");
    $display("        | %h     | %h  | %h   | %h  | ", packed_user_t.header, packed_user_t.cmd, packed_user_t.data, packed_user_t.crc);
end
//=====================================

//===========Question 10===============
//a.
typedef logic [3:0] nibble;
//b.
real r = 4.33;
//c.
shortint i_pack;
//d.
logic [3:0] k [3:0];    
initial begin
    $display("==============================================================");
    $display("========================QUESTION 10===========================");
    k[0] = 4'h0;
    k[1] = 4'hF;
    k[2] = 4'hE;
    k[3] = 4'hD;
    $display("Unpacked array k is : %p", k);//e.
    //f.
    i_pack = {<< {k}};
    $display("Stream k into i_pack right to left(bit): %b", i_pack);
    //g.
    i_pack = {<< 4 {k}};
    $display("Stream k into i_pack right to left(nibble): %b", i_pack);
    //h.
    r = nibble'(r);
    k[0] = r;
    $display("K after type converted r and assing it to k[0] : %p", k);
end
//=====================================

//=========================Question 11========================
typedef enum {ADD ,SUB, BIT_WISE, REDUC_OR} opcode_e;
opcode_e opcode;
int opcode_count = opcode;
initial begin
    $display("====================================================================");
    $display("=====================QUESTION 11====================================");
    opcode = opcode.first;
            $display("|Time     | Opcode  |");
    do begin   
        $display("|%0t      | %0d - %s", $time, opcode, opcode.name());
        opcode = opcode.next;
        #10;
    end
    while(opcode != opcode.first);
end

//============================================================
endmodule
