----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2023 14:45:39
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
        NDIV    :   natural := 10);
        
    Port ( 
        clk_i   :   in  std_logic;
        clk_en  :   in  std_logic;
        rst_i   :   in  std_logic;
        clk_o   :   out std_logic;
        q_out   :   out natural range NDIV downto 0);
end component freq_div;

constant    FREQ_IN :   natural :=  100E6;
constant    PERIOD  :   time    :=  (1.0E12/real(FREQ_IN)) * 1ps;

constant    NDIV    :   natural :=  10;

signal  clk_i   :   std_logic   :=  '0';
signal  clk_en  :   std_logic   :=  '0';
signal  rst_i   :   std_logic   :=  '0';
signal  clk_o   :   std_logic   :=  '0';
signal  q_out   :   natural range NDIV downto 0 := 0;

begin

dut: freq_div
    Generic map (
        NDIV    =>  NDIV)
        
    Port map (
        clk_i   =>  clk_i,
        clk_en  =>  clk_en,
        rst_i   =>  rst_i,
        clk_o   =>  clk_o,
        q_out   =>  q_out);

clk_i   <=  not clk_i after PERIOD/2;

stim: process
begin
    
    wait for 100ns;
    clk_en  <= '1';
    wait for 200ns;
    rst_i   <= '1';
    wait for 100ns;
    rst_i   <= '0';
    wait for 600ns;
    clk_en  <= '0';
    
    wait;
end process;

end Behavioral;
