----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2023 15:37:45
-- Design Name: 
-- Module Name: tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb is
--  Port ( );
end tb;

architecture Behavioral of tb is

component top is

    Port ( clk_i : in STD_LOGIC;
           rst_i : in std_logic;
           btn_i : in STD_LOGIC_VECTOR (3 downto 0);
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));

end component top;

signal clk_i : std_logic := '0';
signal rst_i : std_logic := '0';
signal btn_i : std_logic_vector (3 downto 0) := "0000";
signal sw_i  : std_Logic_vector (7 downto 0) := (7 downto 0 => '0');
signal led7_an_o  : std_logic_vector (3 downto 0) := "1111";
signal led7_seg_o : std_logic_vector (7 downto 0) := (7 downto 0 => '0');

begin

dut: top port map ( clk_i => clk_i,
                    rst_i => rst_i,
                    btn_i => btn_i,
                    sw_i  => sw_i,
                    led7_an_o  => led7_an_o,
                    led7_seg_o => led7_seg_o);
    
    clk_i <= not clk_i after 5 ns;
                    
stim: process
begin
    wait for 50ns;
    rst_i <= '1';
    wait for 10ns;
    rst_i <= '0';
    wait for 40ns;
    btn_i <= "1000";
    wait for 1ns;
    sw_i <= "00001000";
    wait for 10ns;
    btn_i <= "0100";
    wait for 1ns;
    sw_i <= "00000111";
    wait for 10ns;
    btn_i <= "0010";
    wait for 1ns;
    sw_i <= "00000001";
    wait for 10ns;
    btn_i <= "0001";
    wait for 1ns;
    sw_i <= "00001000";
    wait for 10ns;
    btn_i <= "0000";
    wait for 1ns;
    sw_i <= "10000000";
    wait;
end process;                   

end Behavioral;
