
module test;
  //--------dynamic arrays-------------
  int d[][];
  int j = 1, q[$] = {0, 2, 5}, q2[$] = {3, 4};
  initial begin
  d = new[4];
  
  foreach(d[i])
    d[i] = new[i+1];
  
  foreach(d[i,j])
    d[i][j] = i*10 + j;
  
    $display("%p", d);
    //---------------------------------
    
    //------------queue--------------------------
    
    q = {q[0], j, q[1:$]}; //{0, 1, 2, 5}
    $display("q = %p | j = %0d", q, j);
    q = {q[0:2], q2, q[3:$]};//{0, 1, 2, 3, 4, 5}
    $display("q = %p | j = %0d", q, j);
    q = {q[0], q[2:$]};//{0, 2, 3, 4. 5}
    $display("q = %p | j = %0d", q, j);
    q.push_front(2); //{2, 0, 2, 3, 4, 5}
    $display("q = %p | j = %0d", q, j);
    j = q.pop_back; //{2, 0, 2, 3, 4} j = 5ss
  
    $display("q = %p | j = %0d", q, j);
    q.push_back(8);//{2, 0, 2, 3, 4, 8} j = 5
    $display("q = %p | j = %0d", q, j);
    j = q.pop_front; //{0, 2, 3, 4, 8}, j = 2
    $display("q = %p | j = %0d", q, j);
    //--------------------------------------------

    //
  end
endmodule