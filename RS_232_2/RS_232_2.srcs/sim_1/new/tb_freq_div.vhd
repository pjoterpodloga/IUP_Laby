----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2023 16:26:41
-- Design Name: 
-- Module Name: tb_freq_div - Behavioral
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

entity tb_freq_div is
--  Port ( );
end tb_freq_div;

architecture Behavioral of tb_freq_div is

component freq_div is
    Generic (
        FREQ_IN     :   natural :=  100E6;
        FREQ_OUT    :   natural :=  10E6);
        
    Port ( 
        clk_i   :   in  std_logic;
        clk_en  :   in  std_logic;
        rst_i   :   in  std_logic;
        clk_o   :   out std_logic;
        clk_s_o :   out std_logic);
end component freq_div;

constant    FREQ_IN     :   natural :=  100E6;
constant    FREQ_OUT    :   natural :=  9600;

constant    PERIOD_IN   :   time    :=  (1.0E12 / real(FREQ_IN)) * 1ps;
constant    HPERIOD_IN  :   time    :=  PERIOD_IN / 2;

signal  clk_i   :   std_logic   :=  '0';
signal  clk_en  :   std_logic   :=  '0';
signal  rst_i   :   std_logic   :=  '0';
signal  clk_o   :   std_logic   :=  '0';
signal  clk_s_o :   std_logic   :=  '0';

signal sig      :   std_logic   :=  '0';

begin

dut: freq_div 
    generic map (
        FREQ_IN     =>  FREQ_IN,
        FREQ_OUT    =>  FREQ_OUT)
    
    port map (
        clk_i   =>  clk_i,
        clk_en  =>  clk_en,
        rst_i   =>  rst_i,
        clk_o   =>  clk_o,
        clk_s_o =>  clk_s_o);

clk_i   <=  not clk_i after HPERIOD_IN;

sig <=  not sig after 104us;

stim: process
begin

    clk_en <= '1';

    wait;
    wait for 100ns;
    clk_en <= '1';
    wait for 100ns;
    rst_i <= '1';
    wait for 100ns;
    rst_i <= '0';
    wait for 300ns;
    clk_en <= '0';

wait;
end process;

end Behavioral;
