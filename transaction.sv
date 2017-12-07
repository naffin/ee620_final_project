package Transaction_pkg;
class Transaction;
	rand bit [3:0] opCode;
	rand bit [2:0] dr;
	rand bit [2:0] sr;
	rand bit [2:0] sr1;
	rand bit [2:0] sr2;
	rand bit [4:0] imm5;
	rand bit [8:0] PCoffset9;
	rand bit [10:0] PCoffset11;
	rand bit [5:0] offset6;
	rand bit [2:0] BaseR;
	rand bit [7:0] trapvect8;
	rand bit imm5_flag;
	rand bit jsr_flag;

	constraint opCode {
		opCode != RESERVED;	
	}
endclass
endpackage


