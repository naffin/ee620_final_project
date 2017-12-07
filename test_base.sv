
package Test_base_pkg;
   import Environment_pkg::*;
   import svm_component_reg_pkg::*;

`define svm_component_utils(T) \
	typedef svm_component_registry #(T, `"T`") type_id; \
	virtual function string get_type_name(); \
		return `"T`"; \
	endfunction
   
class Test_base extends svm_component;
	Environment env;
	`svm_component_utils(Test_base)
	
	function new(string name)
		super.new(name);
		$display("%m");
		env = new();
	endfunction 

	virtual task run_test();
	endtask
endclass // Test_base
   
endpackage
