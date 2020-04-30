library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all; 
use IEEE.NUMERIC_STD.all;

entity mod_manual is  
	
	port (CLK: in std_logic;									-- CLK 50 MHz
	btn: in std_logic_vector(7 downto 0) := "00000000";			-- Cele 8 switch-uri
	out_led: out  std_logic_vector(7 downto 0) := "00000000");	-- Iesirile ce vor fi scoase pe LED-urile placii
	
end mod_manual;

architecture manual of mod_manual is 

signal m_btn: std_logic_vector(7 downto 0);	-- Valoarea citita de pe switch-uri
signal int_led, int_cnt: integer := 0;		    -- Intensitatea led-urilor; Numarator pt intensitate   

begin 
	m_btn <= btn;
	int_led <= to_integer(unsigned(m_btn));
	process (CLK, int_led, int_cnt)
	begin  	
			if rising_edge(CLK) then
				int_cnt <= int_cnt + 1;
				if int_cnt = 255 then
					int_cnt <= 0;
				end if;
			end if;
			if int_led > int_cnt then
				out_led <= (others => '1');	  
			else 
				out_led <= (others => '0');
			end if;	  
	end process;
end manual;	
	