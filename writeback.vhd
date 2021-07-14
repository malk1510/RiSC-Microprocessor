library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity writeback is
	port(clk: in std_logic;
		load, write_back: in std_logic;
		reg_addr, mem_addr: in std_logic_vector(2 downto 0);
		reg_write, mem_write: in std_logic_vector(15 downto 0);
		wb: out std_logic;
		wb_index: out std_logic_vector(2 downto 0);
		wrb: out std_logic_vector(15 downto 0)
	);
end entity writeback;
                     
architecture behavior of writeback is

component mux2to1_16bit is
	port(i1, i2: in std_logic_vector(15 downto 0);
		sel: in std_logic;
		o: out std_logic_vector(15 downto 0));
end component mux2to1_16bit;

component mux2to1_3bit is
	port(i1, i2: in std_logic_vector(2 downto 0);
	sel: in std_logic;
	o: out std_logic_vector(2 downto 0));
end component mux2to1_8bit;

begin
	wb <= write_back or load;
	mux1: mux2to1_16bit port map(reg_write, mem_write, load, wrb);
	mux2: mux2to1_3bit port map(reg_addr, mem_addr, load, wb_index);
end architecture behavior;