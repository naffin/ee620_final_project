package svm_factory_pkg;
class svm_factory;
	//Assoc. array from string to svm_object_wrapper handle
	static svm_object_wrapper m_type_names[string];
	
	static svm_factory m_inst; // Handle to singleton

	static function svm_factory get();
		if (m_inst == null) m_inst = new();
		return m_inst;
	endfunction

	static function void register(svm_object_wrapper c);
		m_type_names[c.get_type_name()] = c; // put object into assoc array
	endfunction
	
	static function svm_component get_test();
		string name;
		svm_object_wrapper test_wrapper;
		svm_component test_comp;

		if (!$value$plusargs("SVM_TESTNAME=%s", name)) begin
			$display("FATAL +SVM_TESTNAME not found");
			$finish;
		end	
		$display("%m found +SVM_TESTNAME=%s", name);
		test_wrapper = svm_factory:: m_type_names[name];
		$cast (test_comp, test_wrapper.create_object(name));
		return test_comp;
	endfunction
endclass // svm_factory 
endpackage
