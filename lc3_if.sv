package lc3_interface_pgk;
interface lc3_if (input bit clk)
	bit rst;
	bit [15:0] inst;
	logic [15:0] addr;
	
	clocking cb (@posedge clk);
		output inst;
		input addr;
	endclocking

	modport TEST (clocking cb, output rst); // asynch. rst
	modport DUT (input inst, rst, clk, output addr); // asynch. rst

endinterface 
endpackage
