----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2023 15:25:41
-- Design Name: 
-- Module Name: ps2_controller - Behavioral
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

entity ps2_controller is
    Port (  ps2_clk_i   : in std_logic;
            ps2_data_i  : in std_logic;
            sign_data_o : out std_logic_vector (7 downto 0);
            sign_trig_o : out std_logic);
end ps2_controller;

architecture Behavioral of ps2_controller is

subtype byte is std_logic_vector (7 downto 0);

type ps2_bus_enum is (ps2_waiting, ps2_start, 
                        ps2_d0, ps2_d1, ps2_d2, ps2_d3,
                        ps2_d4, ps2_d5, ps2_d6, ps2_d7,
                        ps2_parity, ps2_stop, ps2_error);

signal bus_data : byte := (others => '0');
signal ps2_bus_state : ps2_bus_enum := ps2_waiting;

signal sign_data : byte;

signal parity_r : std_logic;

begin

process(ps2_clk_i, ps2_data_i, ps2_bus_state)
begin
    if falling_edge(ps2_clk_i) then 
        
        if ps2_data_i = '0' and ps2_bus_state = ps2_waiting then
            ps2_bus_state <= ps2_d0;
            sign_trig_o <= '0';
        elsif ps2_bus_state = ps2_d0 then
            bus_data(0) <= ps2_data_i;
            ps2_bus_state <= ps2_d1;
        elsif ps2_bus_state = ps2_d1 then
            bus_data(1) <= ps2_data_i;
            ps2_bus_state <= ps2_d2;
        elsif ps2_bus_state = ps2_d2 then
            bus_data(2) <= ps2_data_i;
            ps2_bus_state <= ps2_d3;
        elsif ps2_bus_state = ps2_d3 then
            bus_data(3) <= ps2_data_i;
            ps2_bus_state <= ps2_d4;
        elsif ps2_bus_state = ps2_d4 then
            bus_data(4) <= ps2_data_i;
            ps2_bus_state <= ps2_d5;
        elsif ps2_bus_state = ps2_d5 then
            bus_data(5) <= ps2_data_i;
            ps2_bus_state <= ps2_d6;
        elsif ps2_bus_state = ps2_d6 then
            bus_data(6) <= ps2_data_i;
            ps2_bus_state <= ps2_d7;
        elsif ps2_bus_state = ps2_d7 then
            bus_data(7) <= ps2_data_i;
            ps2_bus_state <= ps2_parity;
        elsif ps2_bus_state = ps2_parity then
            parity_r <= ps2_data_i;
            ps2_bus_state <= ps2_stop;
            sign_data <= bus_data;
        elsif ps2_data_i = '1' and ps2_bus_state = ps2_stop then
            ps2_bus_state <= ps2_waiting;
            sign_trig_o <= '1';
        end if;
    end if;
end process;

    sign_data_o <= sign_data;

end Behavioral;
