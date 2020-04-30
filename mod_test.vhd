library IEEE;
use IEEE.STD_LOGIC_1164.all;						 
use IEEE.STD_LOGIC_UNSIGNED.all;					  
use IEEE.NUMERIC_STD.all;							  

entity mod_test is	
	
	port(CLK: in std_logic;				  						-- CLK 50 MHz, cu perioada 20ns
	LED: out std_logic_vector(7 downto 0) := "00000000");	 	-- Valorile care urmeaza a fi afisate pe led-uri 
	
end mod_test;		

architecture test of mod_test is 

	signal int0, int1, int2, int3, int4, int5, int6, int7 : integer := 0;								   -- Intensitatea LED-urilor
	signal cnt0, cnt1, cnt2, cnt3, cnt4, cnt5, cnt6, cnt7 : integer := 0;	 							   -- Numarator de impulsuri de CLK
	signal int_cnt0, int_cnt1, int_cnt2, int_cnt3, int_cnt4, int_cnt5, int_cnt6, int_cnt7 : integer := 0;  -- Numaratoare intensitate
	signal leds: std_logic_vector(7 downto 0) := "00000000";											   -- Iesirile ce urmeaza a fi scoase pe LED-uri
	
begin
	process(CLK)
	begin	
		
		-- LED-ul cu indicele 0
		
			if rising_edge(CLK) then	
				if cnt0 = 195312 then					
					cnt0 <= 0;					
 					int0 <= int0 + 1;
				else cnt0 <= cnt0 + 1;
				end if;
				if int_cnt0 >= 256 then						
					int_cnt0 <= 0;
				else int_cnt0 <= int_cnt0 + 1;
				end if;	
				if int0 >= 256 then						
					int0 <= 0;					
				end if;
			end if;
			if int0 > int_cnt0 then
				leds(0) <= '1';
			else leds(0) <= '0';
			end if;	
			
		-- LED-ul cu indicele 1	
			
			if rising_edge(CLK) then	
				if cnt1 = 390625 then					
					cnt1 <= 0;					
 					int1 <= int1 + 1;
				else cnt1 <= cnt1 + 1;
				end if;
				if int_cnt1 >= 256 then						
					int_cnt1 <= 0;	
				else int_cnt1 <= int_cnt1 + 1;
				end if;	
				if int1 >= 256 then						
					int1 <= 0;					
				end if;
			end if;
			
			if int1 > int_cnt1 then
				leds(1) <= '1';
			else leds(1) <= '0';
			end if;		   	  
			
		-- LED-ul cu indicele 2	 
			
			if rising_edge(CLK) then	
				if cnt2 = 585937 then					
					cnt2 <= 0;					
 					int2 <= int2 + 1;
				else cnt2 <= cnt2 + 1;
				end if;
				if int_cnt2 >= 256 then						
					int_cnt2 <= 0;
				else int_cnt2 <= int_cnt2 + 1;
				end if;	
				if int2 >= 256 then						
					int2 <= 0;					
				end if;
			end if;
			
			if int2 > int_cnt2 then
				leds(2) <= '1';
			else leds(2) <= '0';
			end if;	  
			
		-- LED-ul cu indicele 3
			
			if rising_edge(CLK) then	
				if cnt3 = 781250 then					
					cnt3 <= 0;					
 					int3 <= int3 + 1;	
				else cnt3 <= cnt3 + 1;
				end if;
				if int_cnt3 >= 256 then						
					int_cnt3 <= 0;
				else int_cnt3 <= int_cnt3 + 1;
				end if;	
				if int3 >= 256 then						
					int3 <= 0;					
				end if;
			end if;
			
			if int3 > int_cnt3 then
				leds(3) <= '1';
			else leds(3) <= '0';
			end if;	
			
		-- LED-ul cu indicele 4
			
			if rising_edge(CLK) then	
				if cnt4 = 976562 then					
					cnt4 <= 0;					
 					int4 <= int4 + 1;
				else cnt4 <= cnt4 + 1;
				end if;
				if int_cnt4 >= 256 then						
					int_cnt4 <= 0;		
				else int_cnt4 <= int_cnt4 + 1;
				end if;	
				if int4 >= 256 then						
					int4 <= 0;					
				end if;
			end if;
			
			if int4 > int_cnt4 then
				leds(4) <= '1';
			else leds(4) <= '0';
			end if;	
			
		-- LED-ul cu indicele 5
			
			if rising_edge(CLK) then	
				if cnt5 = 1171875 then					
					cnt5 <= 0;					
 					int5 <= int5 + 1;
				else cnt5 <= cnt5 + 1;
				end if;
				if int_cnt5 >= 256 then						
					int_cnt5 <= 0;		
				else int_cnt5 <= int_cnt5 + 1;
				end if;	
				if int5 >= 256 then						
					int5 <= 0;					
				end if;
			end if;
			
			if int5 > int_cnt5 then
				leds(5) <= '1';
			else leds(5) <= '0';
			end if;
			
		-- LED-ul cu indicele 6
			
			if rising_edge(CLK) then	
				if cnt6 = 1367187 then					
					cnt6 <= 0;					
 					int6 <= int6 + 1;	
				else cnt6 <= cnt6 + 1;
				end if;
				if int_cnt6 >= 256 then						
					int_cnt6 <= 0;	
				else int_cnt6 <= int_cnt6 + 1;
				end if;	
				if int6 >= 256 then						
					int6 <= 0;					
				end if;
			end if;
			
			if int6 > int_cnt6 then
				leds(6) <= '1';
			else leds(6) <= '0';
			end if;	  
			
		-- LED-ul cu indicele 7
			
			if rising_edge(CLK) then	
				if cnt7 = 1562499 then					
					cnt7 <= 0;					
 					int7 <= int7 + 1;
				else cnt7 <= cnt7 + 1;
				end if;
				if int_cnt7 >= 256 then						
					int_cnt7 <= 0;
				else int_cnt7 <= int_cnt7 + 1;
				end if;	
				if int7 >= 256 then						
					int7 <= 0;					
				end if;
			end if;
			
			if int7 > int_cnt7 then
				leds(7) <= '1';
			else leds(7) <= '0';
			end if;	
	end process;
	
	LED <= leds;

end test;