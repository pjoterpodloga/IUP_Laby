----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.03.2023 19:20:22
-- Design Name: 
-- Module Name: tb_div - Behavioral
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

entity tb_div is
--  Port ( );
end tb_div;

architecture Behavioral of tb_div is

component divider is
    Generic (
        FREQ_IN         :   natural :=  100E6;
        FREQ_OUT        :   natural :=  1E6;
        INCLUDE_ENABLE  :   boolean := false);
    Port ( 
        clk_i   :   in  std_logic;
        clk_en  :   in  std_logic;
        clk_o   :   out std_logic);
end component divider;


constant    CLK_FREQ    :   natural := 100E6;
constant    OUT_FREQ    :   natural := 10E6;
constant    CLK_PERIOD  :   time    := natural(1.0/real(100E6)*1.0E12)*1ps;

constant    EANBLE_ON   :   boolean :=  false;

signal  clk_i   :   std_logic   := '0';
signal  clk_o   :   std_logic   := '0';
signal  clk_en  :   std_logic   := '0';

begin

dut: divider 
    generic map(
        FREQ_IN         =>  CLK_FREQ,
        FREQ_OUT        =>  OUT_FREQ,
        INCLUDE_ENABLE  =>  false)
    port map(
        clk_i   =>  clk_i,
        clk_o   =>  clk_o,
        clk_en  =>  clk_en);

clk_i   <=  not clk_i after CLK_PERIOD / 2;

stim: process
begin
    
    wait for 200ns;
    clk_en  <= '1';
    wait for 400ns;
    clk_en  <= '0';

    wait;
end process;

end Behavioral;
