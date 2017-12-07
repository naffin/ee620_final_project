`define SV_RAND_CHECK(r) \
  do begin \
    if (!(r)) begin \
      $display("%s:%0d: Randomization failed \"%s\"", \
               `__FILE__, `__LINE__, `"r`"); \
      $finish; \
    end \
  end while (0)
    
package Generator_pkg;
   import Packet_pkg::*;
   import Packet_bad_pkg::*;
   import Packet_base_pkg::*;
class Generator;
   mailbox #(Packet) gen2drv;
   Packet blueprint;

   function new(mailbox #(Packet) gen2drv);
      this.gen2drv = gen2drv;
      blueprint = new();
   endfunction 

   
   task run(int num_packets = 100);
      repeat(num_packets) begin
	 Packet blueprint_copy;
	 `SV_RAND_CHECK(blueprint.randomize());
	 if(!$cast(blueprint_copy,blueprint.copy()))
	   $display("Error in casting blueprint to Packet class");
	 gen2drv.put(blueprint_copy);
      end
   endtask
endclass // Generator
   
endpackage
