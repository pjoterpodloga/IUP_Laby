----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.03.2023 20:03:09
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
        clk_i           : in    std_logic;
        R_o             : out   std_logic_vector(3 downto 0);
        G_o             : out   std_logic_vector(3 downto 0);
        B_o             : out   std_logic_vector(3 downto 0);
        sw_i            : in    std_logic_vector(3 downto 0);
        btn_i           : in    std_logic_vector(3 downto 0);  
        hsync_o         : out   std_logic;
        vsync_o         : out   std_logic);
end component top;

signal clk_i           : std_logic  := '0';
signal R_o             : std_logic_vector(3 downto 0)   := (others => '0');
signal G_o             : std_logic_vector(3 downto 0)   := (others => '0');
signal B_o             : std_logic_vector(3 downto 0)   := (others => '0');
signal sw_i            : std_logic_vector(3 downto 0)   := (others => '0');
signal btn_i           : std_logic_vector(3 downto 0)   := (others => '0');  
signal hsync_o         : std_logic  := '1';
signal vsync_o         : std_logic  := '1';

begin

dut: top port map(
    clk_i   =>  clk_i,
    R_o     =>  R_o,
    G_o     =>  G_o,
    B_o     =>  B_o,
    sw_i    =>  sw_i,
    btn_i   =>  btn_i,
    hsync_o =>  hsync_o,
    vsync_o =>  vsync_o);

clk_i   <=  not clk_i after 5ns;
    
stim: process
begin

wait;

end process;

end Behavioral;
