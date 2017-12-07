package Test_simple_pkg;
import Test_base_pkg::*;
import Driver_cbs_scb_pkg::*;
  
class Test_simple extends Test_base;   
	function new();
		env = new();
		Test_registry::register("Test_good",this);
	endfunction // new
  
	task run_test();
		$display("%m");
		env.gen_cfg();
		env.build();
		begin
			Driver_cbs_scb dcs = new(env.scb);
			env.drv.cbs.push_back(dcs);
		end
		env.run();
		env.wrap_up();
	endtask	
endclass 
endpackage
