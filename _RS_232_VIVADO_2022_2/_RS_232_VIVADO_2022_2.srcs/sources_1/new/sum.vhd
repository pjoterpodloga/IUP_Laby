----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2023 10:40:24
-- Design Name: 
-- Module Name: sum - Behavioral
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
use IEEE.MATH_REAL.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sum is
    Port (  data_i : in  std_logic_vector (7 downto 0);
            data_o : out std_logic_vector (7 downto 0));
end sum;

architecture Behavioral of sum is

constant add_value : unsigned(7 downto 0) := x"20";

signal  sum_out : unsigned(7 downto 0);

begin
    
    sum_out <= unsigned(data_i) + add_value;
    data_o <= std_logic_vector(sum_out);

end Behavioral;
