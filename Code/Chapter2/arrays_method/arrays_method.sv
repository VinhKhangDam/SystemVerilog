module method;
    //Reduction Operation
    byte b[$] = {2, 4, 5, 7};
    int aa[int] = '{0:1, 5:2, 10:4, 15:8, 20:16, 25:32, 30:64};
    int index, element, count;
    int f[6] = '{1,6,2,6,8,6}; //Fixed size
    int d[] = '{2,4,6,8,10}; // Dynamic
    int q[$] = {1, 3, 5, 7}, tq[$]; //Queues
    int a[] = '{9, 1, 8, 3, 4, 4};
    int countb, total, z[] = '{9, 1, 8, 3, 4, 4}, sr[$];
    initial begin
        $display("Sum all elements in arrays is : %0d",b.sum()); // w = 2 + 4 + 5 + 7 = 18
        $display("Product all elements in arrays is : %0d",b.product()); // w = 2 * 4 * 5 * 7 = 280
        $display("And all elements in arrays is : %b",b.and()); // w = 2 & 4 & 5 & 7 = 010 & 100 & 101 & 111 = 000
    end
    //-------------------

    //Ramdom---------------
    initial begin
    element = $urandom_range(aa.size() - 1);

    foreach(aa[i])
        if (count++ == element) begin
            index = i;
            break;
        end
    $display("elements#%0d aa[%0d] = %0d", element, index, aa[index]);
    end
    //-----------------

    //Locator-----------
    initial begin
        tq = q.min();
        $display("The queue q is: %p, and the min value is:%p", q, tq);
        tq = d.max();
        $display("The dynamic arrays d is: %p, and the max value is:%p", d, tq);
        tq = f.unique();
        $display("The fixed arrays f is: %p, and unique is:%p", f, tq);
        tq = a.find with (item > 3);
        $display ("The elements in a[] is %p and item > 3 are %p:", a, tq);
        tq.delete();

        foreach(a[i]) 
            if (a[i] > 3)
                tq.push_back(a[i]);
        
        tq = a.find_index with(item > 3);
        $display ("The elements in a[] is %p and item > 3 are %p:", a, tq);
        tq = a.find_first with(item > 99);
        $display ("The elements in a[] is %p and first item > 99 are %p:", a, tq);
        tq = a.find_first_index with(item == 8);
        $display ("The elements in a[] is %p and first index item == 8 are %p:", a, tq);
        tq = a.find_last with(item==4);
        $display ("The elements in a[] is %p and last item = 4 are %p:", a, tq);
        tq = a.find_last_index with (item == 4);
        $display ("The elements in a[] is %p and last index item == 4 are %p:", a, tq);
    end
    //------------------

    //Count and total--------not right
    initial begin
        countb = z.sum(x) with (x > 7);
        $display("The elements of b are: %p and count number of elements which > 7:%0d", z, countb);
        total = z.sum(x) with ((x>7)*x);
        $display("The elements of b are: %p and count number of elements which > 7:%0d", z, total);
        countb = z.sum(x) with (x < 7);
        $display("The elements of b are: %p and count number of elements which < 7:%0d", z, countb);
        total = z.sum(x) with ((x<7)?x:0);
        $display("The elements of b are: %p and count number of elements which < 7:%0d", z, total);
        countb = z.sum(x) with (x == 4);
        $display("The elements of b are: %p and count number of elements which = 7:%0d", z, countb);
    end
    //-----------------------

    //Arrays sorting and Ordering
    initial begin
    sr = z;
    sr.reverse();
    $display("Reverse the z array: %p",sr);
    sr.sort();
    $display("Sort the z array: %p", sr);
    sr.rsort();
    $display("Resort the z array: %p",sr);
    sr.shuffle();
    $display("Shuffle the z array: %p",sr);
    end
    //----------------------------

    //sorting an array of structure-----
    struct packed {bit [7:0] r, g, b;} c[];
    initial begin
    c = '{'{r:7, g:4, b:9}, '{r:3, g:2, b:9}, '{r:5, g:2, b:1}};
    c.sort with(item.r);
    $display("c arrays sort : %p", c);
    c.sort(x) with ({x.g, x.b});
    $display("c arrays sort : %p", c);
    end
    //----------------------------------

    //score-board-----------------------
    typedef struct packed {
        bit [7:0] addr;
        bit [7:0] pr;
        bit [15:0] data;
    } Packet;

    Packet scb[$];

    function void check_addr(bit[7:0] addr);
        int intq[$];
        intq = scb.find_index() with (item.addr == addr);
        case (intq.size())
            0: $display("Addr %h not found in scoreboard", addr);
            1: scb.delete(intq[0]);
            default: 
                $display("ERROR: Multiple hits for addr %h", addr);
        endcase
    endfunction: check_addr
    //-----------------------------------
endmodule