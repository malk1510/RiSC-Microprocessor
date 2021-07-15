library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity memory is
  port( mem_addr : in std_logic_vector(7 downto 0);
	 reg_addr_i : in std_logic_vector(2 downto 0);
    mem_write : in std_logic_vector(15 downto 0);
    load, store : in std_logic;
    reg_addr: out std_logic_vector(2 downto 0);
	 reg_write: out std_logic_vector(15 downto 0));
  end entity memory;

  
  architecture behavior of memory is
    begin				 
		reg_addr <= reg_addr_i;
      PMUX1 : process(daddr)
      type DMEM_array is array(255 downto 0) of std_logic_vector(15 downto 0);
      variable data_mem_array : DMEM_array := (x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
																x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000");

                                                                 
      
      begin     --Process begins here
			if(load = '1') then
				reg_write <= data_mem_array(to_integer(unsigned(mem_addr)));
			elsif(store = '1') then
				data_mem_array(to_integer(unsigned(mem_addr))) := mem_write;
			end if;
    end process PMUX1; --Process ends here
                            
end architecture behavior;     --architecture ends here 