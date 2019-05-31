
library IEEE;
use IEEE.std_logic_1164.all;
entity tb is
end entity;
architecture test of tb is
component DCT8_slow IS
   PORT( 
      clk       : IN     std_logic  ;
      dctselect : IN     std_logic  ;
      din       : IN     std_logic  ;
      mode      : IN     std_logic_vector (1 downto 0) ;
      reset     : IN     std_logic  ;
      doutput   : OUT    std_logic_vector (15 DOWNTO 0) ;
      next_in   : OUT    std_logic  ;
      read      : OUT    std_logic 
   );
   end component;
	signal Dtemp : std_logic_vector (7 downto 0) := "11001011";
	signal clk       :     std_logic  ;
    signal   dctselect :     std_logic  ;
    signal   din       :      std_logic  ;
   signal    mode      :      std_logic_vector (1 downto 0) ;
     signal  reset     :      std_logic  ;
     signal  doutput   :    std_logic_vector (15 DOWNTO 0) ;
  signal     next_in   :     std_logic  ;
    signal   read      :   std_logic;
  begin 
  uut: DCT8_slow port map(
  	clk => clk,
    dctselect => dctselect,
    din => din,
    mode => mode,
    reset => reset,
    doutput => doutput,
    next_in => next_in,
    read => read
    );
 part1: process
 begin
 clk <= '1';
 wait for 10 ps;
 clk <= '0';
 wait for 10 ps;
 end process;
 part2: process
begin
din <= Dtemp(0) ;
wait for 10 ps;
din <= Dtemp(1);
wait for 10 ps;
din <= Dtemp(2);
wait for 10 ps;

din <= Dtemp(3);
wait for 10 ps;
din <= Dtemp(4);
wait for 10 ps;
din <= Dtemp(5);
wait for 10 ps;
din <= Dtemp(6);
wait for 10 ps;
din <= Dtemp(7);
wait for 10 ps;
end process;
 mode <= "00";
 reset <= '1' , '0' after 10 ps;
 dctselect <= '1';
  
-- Declarations

END test ;