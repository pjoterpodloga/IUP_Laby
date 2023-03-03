----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2023 19:28:16
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
    Port (  clk_i : in  std_logic;
            clk_o : out std_logic);
end component divider;

signal clk_i : std_logic := '0';
signal clk_o : std_logic := '0';

begin

div: divider port map ( clk_i => clk_i,
                        clk_o => clk_o);

    clk_i <= not clk_i after 5ns;
    
stim: process 
begin
    wait;
end process;

end Behavioral;
