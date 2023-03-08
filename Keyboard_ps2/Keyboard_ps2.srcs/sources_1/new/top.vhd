----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.03.2023 13:46:32
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port (  clk_i : in std_logic;
            rst_i : in std_logic;
            ps2_clk_i  : in std_logic;
            ps2_data_i : in std_logic;
            led7_an_o  : out std_logic_vector (3 downto 0);
            led7_seg_o : out std_logic_vector (7 downto 0));
end top;

architecture Behavioral of top is

component ps2_controller is
    Port (  ps2_clk_i   : in std_logic;
            ps2_data_i  : in std_logic;
            sign_data_o : out std_logic_vector (7 downto 0);
            sign_trig_o : out std_logic);
end component ps2_controller;

component sign_mem is
    Port (  rst_i : in std_logic;
            sign_data_i : in std_logic_vector (7 downto 0);
            sign_trig_i : in std_logic;
            sign_o  : out std_logic_vector (7 downto 0));
end component sign_mem;

component display is
    Port (  sign_i : in std_logic_vector (7 downto 0);
            led7_an_o : out std_logic_vector (3 downto 0);
            led7_seg_o : out std_logic_vector (7 downto 0));
end component display;

signal sign_data : std_logic_vector (7 downto 0);
signal sign_trig : std_logic;
signal sign : std_logic_vector (7 downto 0);

begin

controller: ps2_controller port map (
    ps2_clk_i => ps2_clk_i,
    ps2_data_i => ps2_data_i,
    sign_data_o => sign_data,
    sign_trig_o => sign_trig);
    
memory: sign_mem port map (
    rst_i => rst_i,
    sign_data_i => sign_data,
    sign_trig_i => sign_trig,
    sign_o => sign);
    
disp: display port map (
    sign_i => sign,
    led7_an_o => led7_an_o,
    led7_seg_o => led7_seg_o);

end Behavioral;
