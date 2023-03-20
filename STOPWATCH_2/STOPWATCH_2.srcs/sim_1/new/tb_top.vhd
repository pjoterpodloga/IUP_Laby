----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2023 19:52:00
-- Design Name: 
-- Module Name: tb_top - Behavioral
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

entity tb_top is
--  Port ( );
end tb_top;

architecture Behavioral of tb_top is

component top is
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           start_stop_button_i : in STD_LOGIC;
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
end component top;

signal clk_i        :   std_logic   := '0';
signal rst_i        :   std_logic   := '0';
signal ss_button_i  :   std_logic   := '0';
signal led7_an_o    :   std_logic_vector(3 downto 0) := "1111";
signal led7_seg_o   :   std_logic_vector(7 downto 0) := (others => '0');

begin

dut: top port map( 
           clk_i                => clk_i,
           rst_i                => rst_i,
           start_stop_button_i  => ss_button_i,
           led7_an_o            => led7_an_o,
           led7_seg_o           => led7_seg_o);
    
clk_i   <=  not clk_i after 5ns;
           
stim: process
begin
    
    wait for 10ms;
    ss_button_i <= '1';
    wait for 10ms;
    ss_button_i <= '0';
    wait for 10ms;
    ss_button_i <= '1';
    wait for 100ms;
    ss_button_i <= '0';
    wait for 300ms;
    ss_button_i <= '1';
    wait for 100ms;
    ss_button_i <= '0';
    wait for 100ms;
    ss_button_i <= '1';
    wait for 100ms;
    ss_button_i <= '0';
    wait;
end process;

end Behavioral;
