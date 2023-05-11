----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  Piotr Buluk, Jakub Cichocki
-- 
-- Create Date: 10.05.2023 17:35:19
-- Design Name: 
-- Module Name: tb_clk_div - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_clk_div is
--  Port ( );
end tb_clk_div;

architecture Behavioral of tb_clk_div is

component clk_div is
    Generic (
        CLK_IN      :   natural :=  100E6;
        CLK_OUT     :   natural :=  10E6);
        
    Port ( 
        clk_i   :   in  std_logic;
        rst_i   :   in  std_logic;
        q_out   :   out natural range CLK_IN/CLK_OUT downto 0;
        clk_o   :   out std_logic);
end component clk_div;

constant CLK_IN     :   natural := 100E6;
constant CLK_OUT    :   natural :=  10E6;
constant PERIOD     :   time    := (1.0E12 / real(CLK_IN)) * 1ps;

signal clk_i    :   std_logic   :=  '0';
signal rst_i    :   std_logic   :=  '0';
signal q_out    :   natural     :=  0;
signal clk_o    :   std_logic   :=  '0';

begin

dut: clk_div
    Generic map (
        CLK_IN  =>  CLK_IN,
        CLK_OUT =>  CLK_OUT)
        
    Port map (
        clk_i   =>  clk_i,
        rst_i   =>  rst_i,
        q_out   =>  q_out,
        clk_o   =>  clk_o);

clk_i   <=  not clk_i after PERIOD/2;

stim: process
begin
    
    rst_i   <=  '1';
    wait for 100ns;
    rst_i   <=  '0';

    wait;
end process;

end Behavioral;
