program automatic test;
   	Test_base tb;
   	Test_simple simple_test = new();

   	initial begin
   		svm_component test_obj;
		test_obj = svm_factory::get_test();
		test_obj.run_test();	 
   	end
endprogram
