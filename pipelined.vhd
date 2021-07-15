library ieee;
use ieee.std_logic_1164.all;

entity pipelined is
	port map(clk: in std_logic);
end entity pipelined;

architecture behavior of pipelined is

component fetch is
	port(clk,jump : in std_logic;
		  jump_addr : in std_logic_vector(7 downto 0);
		  PC_out : out std_logic_vector(7 downto 0);
		  instruction : out std_logic_vector (15 downto 0)
		  );
end component fetch; 

component dec is
	port(clk, wr: in std_logic;
		instruction, wrb: in std_logic_vector(15 downto 0);
		PCi: in std_logic_vector(7 downto 0);
		wb_index: in std_logic_vector(2 downto 0);
		ra_addr, rb_addr, rc_addr, aluop: out std_logic_vector(2 downto 0);
		ra, rb, rc, immed: out std_logic_vector(15 downto 0);
		immed_8_bit, PC: out std_logic_vector(7 downto 0);
		ten_bit: out std_logic_vector(9 downto 0));
end component dec;

component alu is
  port(
	 ra, rb, rc, immed: in std_logic_vector(15 downto 0);
	 ra_addr, rb_addr, rc_addr, aluop: in std_logic_vector(2 downto 0);
	 immed_8_bit, PCi: in std_logic_vector(7 downto 0);
	 mem_addr, PC, jump_addr: out std_logic_vector(7 downto 0);
	 reg_write, mem_write: out std_logic_vector(15 downto 0);
	 reg_addr: out std_logic_vector(2 downto 0);
	 write_back, store, load, jump: out std_logic;
	 ten_bit: in std_logic_vector(9 downto 0)
  );
end component alu;

component memory is
  port( mem_addr : in std_logic_vector(7 downto 0);
    mem_write : in std_logic_vector(15 downto 0);
    load, store : in std_logic;
	 reg_write: out std_logic_vector(15 downto 0));
  end component memory;
  
component writeback is
	port(load, write_back: in std_logic;
		reg_addr: in std_logic_vector(2 downto 0);
		reg_write, mem_write: in std_logic_vector(15 downto 0);
		wb: out std_logic;
		wb_index: out std_logic_vector(2 downto 0);
		wrb: out std_logic_vector(15 downto 0)
	);
end component writeback;

component latch_fetch is
  port(pc_outi : in std_logic_vector(7 downto 0);
		instructioni : in std_logic_vector (15 downto 0);
      clk: in std_logic;
      pc_out : out std_logic_vector(7 downto 0);
		instruction : out std_logic_vector (15 downto 0));
end component latch_fetch; 

component latch_exec is
  port(
    mem_addr_i, PC_i: in std_logic_vector(7 downto 0);
	 reg_write_i, mem_write_i: in std_logic_vector(15 downto 0);
	 reg_addr_i: in std_logic_vector(2 downto 0);
	 write_back_i, store_i, load_i, clk: in std_logic;
    mem_addr, PC: out std_logic_vector(7 downto 0);
	 reg_write, mem_write: out std_logic_vector(15 downto 0);
	 reg_addr: out std_logic_vector(2 downto 0);
	 write_back, store, load: out std_logic);	 
end component latch_exec; 

component latch_dec is
  port(
	 clk: in std_logic;
  	 ra_i, rb_i, rc_i, immed_i: in std_logic_vector(15 downto 0);
	 ra_addr_i, rb_addr_i, rc_addr_i, aluop_i: in std_logic_vector(2 downto 0);
	 immed_8_bit_i, PCi: in std_logic_vector(7 downto 0);
	 ra, rb, rc, immed: out std_logic_vector(15 downto 0);
	 ra_addr, rb_addr, rc_addr, aluop: out std_logic_vector(2 downto 0);
	 immed_8_bit, PC: out std_logic_vector(7 downto 0);
	 ten_bit_i: in std_logic_vector(9 downto 0);
	 ten_bit: out std_logic_vector(9 downto 0));
end component latch_dec;

component latch_mem is
	port(load_i, write_back_i: in std_logic;
		reg_addr_i: in std_logic_vector(2 downto 0);
		reg_write_i, mem_write_i: in std_logic_vector(15 downto 0);
		clk: in std_logic;
		load, write_back: out std_logic;
		reg_addr: out std_logic_vector(2 downto 0);
		reg_write, mem_write: out std_logic_vector(15 downto 0));
end component latch_mem;

begin
	CHIP1: fetch port map(clk, jump, jump_addr, PC_out_temp, instruction_temp);
	CHIP2: latch_fetch port map(PC_out_temp, instruction_temp, clk, PC_out, instruction);
	CHIP3: dec port map(clk, wr, instruction, wrb, PC_out, wb_index, ra_addr_i, rb_addr_i, rc_addr_i, aluop_i, ra_i, rb_i, rc_i, immed_i, immed_8_bit_i, PCi, ten_bit_i);
	CHIP4: latch_dec port map(clk, ra_i, rb_i, rc_i, immed_i, ra_addr_i, rb_addr_i, rc_addr_i, aluop_i, immed_8_bit_i, PCi, ra, rb, rc, immed, ra_addr, rb_addr, rc_addr, aluop, immed_8_bit, PC, ten_bit_i, ten_bit);
	CHIP5: alu port map(ra, rb, rc, immed, ra_addr, rb_addr, rc_addr, aluop, immed_8_bit, PC, mem_addr, PC_wrong, jump_addr, reg_write, mem_write, reg_addr, write_back, )
