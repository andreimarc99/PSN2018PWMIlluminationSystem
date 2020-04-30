library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity proiect is 
	port (CLK: in std_logic;
	MODE: in std_logic_vector(1 downto 0);
	btn_in: in std_logic_vector(7 downto 0); 
	time_in: in std_logic_vector(3 downto 0);
	led_out: out std_logic_vector(7 downto 0));	 
end proiect;
	
architecture arh_proiect of proiect is	

	component mod_manual
		port (CLK: in std_logic; 
		btn: in std_logic_vector(7 downto 0) := "00000000";
		out_led: out std_logic_vector(7 downto 0) := "00000000");
	end component ;	
	
	component mod_test
		port (CLK: in std_logic;
		LED: out std_logic_vector(7 downto 0) := "00000000");
	end component;
	
	component mod_automat 
		port (CLK: in std_logic; 
		timp: in std_logic_vector(3 downto 0);
		out_led: out std_logic_vector(7 downto 0) := "00000000");
	end component;
	
	signal a_timp: std_logic_vector(3 downto 0); 
	signal m_btn: std_logic_vector(7 downto 0);   
	signal T_out, M_out, A_out, leds: std_logic_vector(7 downto 0) := "00000000";
	
begin
	
	test: mod_test port map (CLK, T_out);
	a_timp <= time_in(3 downto 0);
	auto: mod_automat port map (CLK, a_timp, A_out);
	m_btn <= btn_in;
	manual: mod_manual port map (CLK, m_btn, M_out);  
	
	process	(CLK)
	begin 	
		
		if MODE = "00" then leds <= (others => '0');
		elsif MODE = "01" then leds <= T_out;
		elsif MODE = "10" then leds <= A_out;
		elsif MODE = "11" then leds <= M_out;
		end if;
		
	end process;
	
	led_out <= leds;
	
end arh_proiect;
