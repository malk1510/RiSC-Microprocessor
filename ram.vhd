Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;


entity reg_file is 
  port(
		rai, rbi, rci: in std_logic_vector(2 downto 0);
		ra_addr,rb_addr,rc_addr:out std_logic_vector(2 downto 0);
		wb_index: in std_logic_vector(2 downto 0);
		ra, rb, rc: out std_logic_vector(7 downto 0);
		wr,clk: in std_logic;
		wrb:in std_logic_vector(15 downto 0)
    );
 end ram; 

 
architecture behavior of reg_file is
  
  begin
      proc1:process(wr,wrb,wb_index,rai,rbi) is
      type registers is array (7 downto 0) of std_logic_vector(15 downto 0);
      variable a : registers := (x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000") ;
      begin
		
      if(wr='1') then
          a(to_integer(unsigned(wb_index))) := wrb  ;
        end if;
        ra <= a(to_integer(unsigned(rai)));
        rb <= a(to_integer(unsigned(rbi)));
		  rc <= a(to_integer(unsigned(rci)));
        ra_addr <= rai;
        rb_addr <= rbi;
		  rc_addr <= rci;
               
      end process proc1;
		
end architecture behavior;