----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2023 22:31:24
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
    Port ( 
        clk_i   :   in  std_logic;
        rst_i  :   in  std_logic;
        RXD_i   :   in  std_logic;
        TXD_o   :   out std_logic);
end component top;

constant    FREQ_IN     :   natural :=  100E6;
constant    PERIOD      :   time    :=  (1.0E12 / real(FREQ_IN)) * 1ps;

constant    BAUD_RATE   :   natural :=  9600;
constant    BAUD_PERIOD :   time    :=  (1.0E12 / real(BAUD_RATE)) * 1ps;

signal  clk_i   :   std_logic   :=  '0';
signal  rst_i   :   std_logic   :=  '0';
signal  RXD_i   :   std_logic   :=  '1';
signal  TXD_o   :   std_logic   :=  '1';

begin

dut: top
    port map (
        clk_i   =>  clk_i,
        rst_i   =>  rst_i,
        RXD_i   =>  RXD_i,
        TXD_o   =>  TXD_o);

clk_i   <=  not clk_i after PERIOD/2;

stim: process
begin

    wait for BAUD_PERIOD;
    RXD_i <= '0';
    wait for BAUD_PERIOD;  
    RXD_i <= '1';
    wait for BAUD_PERIOD;  
    RXD_i <= '0';
    wait for 2*BAUD_PERIOD;  
    RXD_i <= '0';
    wait for 4*BAUD_PERIOD;
    RXD_i <= '1';
    
    wait;
end process;

end Behavioral;
