----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.05.2023 19:34:51
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
        sw5_i   :   in  std_logic;
        sw6_i   :   in  std_logic;
        sw7_i   :   in  std_logic;
        btn_i   :   in  std_logic_vector(3 downto 0);
        hsync_o :   out std_logic;
        vsync_o :   out std_logic;
        red_o   :   out std_logic_vector(3 downto 0);
        green_o :   out std_logic_vector(3 downto 0);
        blue_o  :   out std_logic_vector(3 downto 0));
end component top;

constant    CLK_IN  :   natural :=  100E6;
constant    PERIOD  :   time    :=  (1.0E12/real(CLK_IN)) * 1ps;

signal  clk_i   :   std_logic   :=  '0';
signal  sw_i    :   std_logic_vector(2 downto 0)    :=  (others => '0');
signal  btn_i   :   std_logic_vector(3 downto 0)    :=  (others => '0');
signal  hsync_o :   std_logic   :=  '0';
signal  vsync_o :   std_logic   :=  '0';
signal  red_o   :   std_logic_vector(3 downto 0)    :=  (others => '0');
signal  green_o :   std_logic_vector(3 downto 0)    :=  (others => '0');
signal  blue_o  :   std_logic_vector(3 downto 0)    :=  (others => '0');

begin

dut: top
    PORT MAP (
        clk_i   =>  clk_i,
        sw5_i   =>  sw_i(0),
        sw6_i   =>  sw_i(1),
        sw7_i   =>  sw_i(2),
        btn_i   =>  btn_i,
        hsync_o =>  hsync_o,
        vsync_o =>  vsync_o,
        red_o   =>  red_o,
        green_o =>  green_o,
        blue_o  =>  blue_o);
        
clk_i   <=  not clk_i after PERIOD/2;

stim: process
begin
    
    wait for 20ms;
    sw_i <= "100";
    
    wait for 20ms;
    sw_i <= "010";
    
    wait for 20ms;
    sw_i <= "001";

wait;
end process;

end Behavioral;
