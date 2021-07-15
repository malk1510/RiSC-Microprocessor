library ieee;
use ieee.std_logic_1164.all;

entity fetch is
	port(clk,jump : in std_logic;
		  jump_addr : in std_logic_vector(7 downto 0);
		  PC_out : out std_logic_vector(7 downto 0);
		  instruction : out std_logic_vector (15 downto 0));
end fetch; 


architecture behavior of fetch is 

signal pc :  std_logic_vector(7 downto 0);
signal clk_out: std_logic;

entity program_counter is
	port(clk, jump: in std_logic;
		jump_addr: in std_logic_vector(7 downto 0);
		clk_out: out std_logic;
		PC_out: out std_logic_vector(7 downto 0));
end program_counter;

entity instr_mem is 
  port( pc: in std_logic_vector(7 downto 0);
        instruction: out std_logic_vector(15 downto 0));  
end entity instr_mem;

begin
CHIP1 : program_counter port map(clk, jump, jump_addr, clk_out, pc);

CHIP2 : instr_mem port map(pc, instruction);

pc_out <= pc;

end architecture behavior;
