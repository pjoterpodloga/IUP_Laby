----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2023 15:00:27
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is

    Port ( clk_i : in STD_LOGIC;
           rst_i : in std_logic;
           btn_i : in STD_LOGIC_VECTOR (3 downto 0);
           sw_i : in STD_LOGIC_VECTOR (7 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));

end top;

architecture Behavioral of top is

component enc_mem is
    Port (  clk_i : in std_logic;
            btn_i : in std_logic_vector(3 downto 0);
            sw_i : in std_logic_vector(7 downto 0);
            digit_o : out std_logic_vector(31 downto 0));
end component enc_mem;

component display is
    Port (  clk_i : in std_logic;
            rst_i : in std_logic;
            digit_i : in std_logic_vector (31 downto 0);
            led7_an_o : out std_logic_vector (3 downto 0);
            led7_seg_o : out std_logic_vector (7 downto 0));
end component display;

signal digit_internal : std_logic_vector (31 downto 0);

begin

display_0: display port map (   clk_i       => clk_i,
                                rst_i       => rst_i,
                                digit_i     => digit_internal,
                                led7_an_o   => led7_an_o,
                                led7_seg_o  => led7_seg_o);
                                
enc_mem0: enc_mem port map (    clk_i       => clk_i,
                                btn_i       => btn_i,
                                sw_i        => sw_i,
                                digit_o     => digit_internal);

end Behavioral;
