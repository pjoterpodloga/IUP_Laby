----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.03.2023 20:32:40
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
    Port (  clk_i : in std_logic;
            rst_i : in std_logic;            
            btn_i : in std_logic_vector(3 downto 0);
            sw_i : in std_logic_vector(7 downto 0);
            led7_an_o : out std_logic_vector(3 downto 0);
            led7_seg_o : out std_logic_vector(7 downto 0));
end component top;

signal clk_i : std_logic := '0';
signal rst_i : std_logic := '0';            
signal btn_i :  std_logic_vector(3 downto 0);
signal sw_i  : std_logic_vector(7 downto 0);
signal led7_an_o  : std_logic_vector(3 downto 0);
signal led7_seg_o : std_logic_vector(7 downto 0);

begin

dut: top port map(
    clk_i => clk_i,
    rst_i => rst_i,
    btn_i => btn_i,
    sw_i  => sw_i,
    led7_an_o => led7_an_o,
    led7_seg_o => led7_seg_o);

    clk_i <= not clk_i after 10ns;

stim: process
begin
    wait for 100ns;
    sw_i <= "00001111";
    btn_i(0) <= '1';
    wait for 1ns;
    sw_i <= "00001111";
    btn_i(1) <= '1';
    wait for 1ns;
    sw_i <= "00000000";
    btn_i(2) <= '1';
    wait for 1ns;
    sw_i <= "00001000";
    btn_i(3) <= '1';
    wait for 1ns;
    sw_i <= "10000000";
    wait for 100ns;
    
    wait;
end process;

end Behavioral;
