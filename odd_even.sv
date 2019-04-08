// Program to constraint odd and even on every randomize call
program odd_even; 
class abc;  
  rand bit [2:0] x;
  
  static bit odd_even;
  //pre_randomize function will be called every time before randomize function
  function void pre_randomize();
    $display("Inside bulit in pre_randomize function");
    odd_even = ~odd_even;
  endfunction
 
  constraint cons{
    (odd_even == 1) -> x%2 == 0;
    (odd_even == 0) -> x%2 != 0;
  }
  endclass : abc
 
  initial begin
    abc a;
    repeat(10) begin
      a = new();
      void'(a.randomize()); 
      $display ("a.x = %0d a.odd_even = %0d", a.x, a.odd_even);
    end
  end
 
endprogram