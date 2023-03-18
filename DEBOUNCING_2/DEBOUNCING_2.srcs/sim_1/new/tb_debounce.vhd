----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2023 09:11:14
-- Design Name: 
-- Module Name: tb_debounce - Behavioral
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

entity tb_debounce is
--  Port ( );
end tb_debounce;

architecture Behavioral of tb_debounce is

component debounce is
    generic
    (   BTN_DOWN_TIME   :   time    :=  1ms;
        CLK_FREQ        :   natural :=  100E6);
    Port
    (   clk_i   :   in  std_logic;
        btn_i   :   in  std_logic;
        btn_o   :   out std_logic);
end component debounce;

signal  clk_i   :   std_logic   :=  '0';
signal  btn_i   :   std_logic   :=  '0';
signal  btn_o   :   std_logic   :=  '0';

begin

dut: debounce
    generic map 
    (   BTN_DOWN_TIME   =>  1000ns,
        CLK_FREQ        =>  100E6)
        
    port map
    (   clk_i   =>  clk_i,
        btn_i   =>  btn_i,
        btn_o   =>  btn_o);

clk_i   <=  not clk_i   after 5ns;

stim:   process
begin

wait for 100ns;
btn_i <= '1';
wait for 90ns;
btn_i <= '0';
wait for 110ns;
btn_i <= '1';
wait for 2000ns;
btn_i <= '0';
wait for 2100ns;
btn_i <= '1';
wait for 999ns;
btn_i <= '0';
wait for 1ns;
wait for 1000ns;
btn_i <= '1';
wait for 1100ns;
btn_i <= '0';
wait;

end process;

end Behavioral;
