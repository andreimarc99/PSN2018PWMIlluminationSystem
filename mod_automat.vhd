library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all; 
use IEEE.NUMERIC_STD.all;


entity mod_automat is	
	
port(CLK: in std_logic;										-- CLK 50 MHz
timp: in std_logic_vector (3 downto 0);						-- Timpul citit de pe switch-ur
out_led: out std_logic_vector (7 downto 0) := "00000000"); 	-- Iesirile ce urmeaza a fi scoase pe LED-uri

end mod_automat;


architecture automat of mod_automat is	

signal cnt, int_cnt, int_led, a_time: integer := 0;	-- Numarator ce numara impulsurile de CLK; Numarator pt intensitate; Intensitatea LED-urilor; 
													-- Timpul citit de pe switch-uri 
signal ok: std_logic := '0'; 						-- '0' - intensitatea creste; '1' - intensitatea scade

begin	
	
	a_time <= (to_integer(unsigned(timp))*50_000_000)/256; -- Calculul numarului de impulsuri de CLK necesare
	
	process(CLK, timp)	
	begin	
		if rising_edge(CLK) then
			cnt <= cnt + 1;
			int_cnt <= int_cnt + 1;
			if cnt = a_time and ok = '0' then				
				cnt <= 0;				
				int_led <= int_led + 1;				
				if int_led = 255 then					
					int_led <= int_led-1;					
					ok <= '1';				
					end if;			
			elsif cnt = a_time and ok = '1' then				
				cnt <= 0;				
				int_led <= int_led - 1;				
				if int_led = 0 then
					ok <= '0';
					int_led <= int_led + 1;									
				end if;			
			end if;
		end if;
		if int_cnt >= 256 then 
			int_cnt <=0;  
		end if;
		if int_led > int_cnt then
			out_led <= (others => '1');
		else out_led <= (others => '0');
		end if;
	end process;	

end automat;