----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2023 15:56:07
-- Design Name: 
-- Module Name: tb_ps2_controller - Behavioral
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

entity tb_ps2_controller is
--  Port ( );
end tb_ps2_controller;

architecture Behavioral of tb_ps2_controller is

component ps2_controller is
    Port (  ps2_clk_i   : in std_logic;
            ps2_data_i  : in std_logic;
            sign_data_o : out std_logic_vector (7 downto 0);
            sign_trig_o : out std_logic);
end component ps2_controller;

signal ps2_clk_i   : std_logic := '0';
signal ps2_data_i  : std_logic := '0';
signal sign_data_o : std_logic_vector (7 downto 0) := (others => '0');
signal sign_trig_o : std_logic := '0';

type ps2_bus_enum is (ps2_waiting, ps2_start, 
                        ps2_d0, ps2_d1, ps2_d2, ps2_d3,
                        ps2_d4, ps2_d5, ps2_d6, ps2_d7,
                        ps2_parity, ps2_stop, ps2_error);
                        
signal kb_state : ps2_bus_enum := ps2_waiting;

constant tx_data : std_logic_vector (7 downto 0) := x"0E"; 

constant PERIOD : time := 66us;

begin

dut: ps2_controller port map (
                                ps2_clk_i => ps2_clk_i,
                                ps2_data_i => ps2_data_i,
                                sign_data_o => sign_data_o,
                                sign_trig_o => sign_trig_o);

ps2_clk_i <= not ps2_clk_i after PERIOD/2;

stim: process
begin
    wait for 1ns;
    if rising_edge(ps2_clk_i) then 
        
        if kb_state = ps2_waiting then
            wait for 1ns;
            ps2_data_i <= '0';
            kb_state <= ps2_start;
        elsif kb_state = ps2_start then
            wait for 1ns;
            ps2_data_i <= tx_data(0);
            kb_state <= ps2_d0;
        elsif kb_state = ps2_d0 then
            wait for 1ns;
            ps2_data_i <= tx_data(1);
            kb_state <= ps2_d1;
        elsif kb_state = ps2_d1 then
            wait for 1ns;
            ps2_data_i <= tx_data(2);
            kb_state <= ps2_d2;
        elsif kb_state = ps2_d2 then
            wait for 1ns;
            ps2_data_i <= tx_data(3);
            kb_state <= ps2_d3;
        elsif kb_state = ps2_d3 then
            wait for 1ns;
            ps2_data_i <= tx_data(4);
            kb_state <= ps2_d4;
        elsif kb_state = ps2_d4 then
            wait for 1ns;
            ps2_data_i <= tx_data(5);
            kb_state <= ps2_d5;
        elsif kb_state = ps2_d5 then
            wait for 1ns;
            ps2_data_i <= tx_data(6);
            kb_state <= ps2_d6;
        elsif kb_state = ps2_d6 then
            wait for 1ns;
            ps2_data_i <= tx_data(7);
            kb_state <= ps2_d7;
        elsif kb_state = ps2_d7 then
            wait for 1ns;
            ps2_data_i <= '0';
            kb_state <= ps2_parity;
        elsif kb_state = ps2_parity then
            wait for 1ns;
            ps2_data_i <= '1';
            kb_state <= ps2_stop;
            wait;
        end if;
        
    end if;

end process;

end Behavioral;
