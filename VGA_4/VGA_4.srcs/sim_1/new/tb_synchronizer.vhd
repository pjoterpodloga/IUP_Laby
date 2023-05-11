----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.05.2023 18:35:05
-- Design Name: 
-- Module Name: tb_synchronizer - Behavioral
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

entity tb_synchronizer is
--  Port ( );
end tb_synchronizer;

architecture Behavioral of tb_synchronizer is

component synchronizer_module is

    Port ( 
        clk_i   :   in  std_logic;
        rst_i   :   in  std_logic;
        d_in    :   in  std_logic_vector;
        d_out   :   out std_logic_vector);
        
end component synchronizer_module;

constant CLK_IN :   natural := 100E6;
constant PERIOD :   time    := (1.0E12/real(CLK_IN)) * 1ps;

signal clk_i    :   std_logic   :=  '0';
signal rst_i    :   std_logic   :=  '0';
signal d_in     :   std_logic_vector(3 downto 0)    :=  (others => '0');
signal d_out    :   std_logic_vector(d_in'range)    :=  (others => '0');

signal d    :   std_logic_vector(3 downto 0);

signal rand :   std_logic_vector(15 downto 0)   :=  ( 12 => '1', others => '0');

begin

dut: synchronizer_module
    PORT MAP (
        clk_i   =>  clk_i,
        rst_i   =>  rst_i,
        d_in    =>  d_in,
        d_out   =>  d_out);
        
clk_i   <=  not clk_i after PERIOD/2;

d <= rand(rand'left)&rand(rand'left)&rand(rand'left)&rand(rand'left);

randomize: process(clk_i)
begin
    if rising_edge(clk_i) then
        
        for it in rand'right + 1 to rand'left loop
            rand(it) <= rand(it - 1);
        end loop;
        
        rand(rand'right) <= rand(rand'left) xor rand(10) xor rand(3) xor rand(11);
        
    end if;
end process;

stim: process
begin
    
    wait for 100ns;
    d_in <= d;
    wait for 200ns;
    d_in <= d;
    wait for 100ns;
    d_in <= d;
    wait for 300ns;
    d_in <= d;
    wait for 400ns;
    d_in <= d;
    wait for 200ns;
    d_in <= d;
    wait for 100ns;
    d_in <= d;
    
    wait;
end process;

end Behavioral;
