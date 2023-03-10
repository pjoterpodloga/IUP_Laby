----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2023 10:40:24
-- Design Name: 
-- Module Name: rs232_controller - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rs232_controller is
    Port (  RXD_i : in std_logic;
            TXD_o : out std_logic;
--            RX_done : out std_logic;
--            TX_trig : in std_logic;
            clk_en  : out std_logic;
            clk_baud : in std_logic;
            data_o : out std_logic_vector (7 downto 0);
            data_i : in  std_logic_vector (7 downto 0));
end rs232_controller;

architecture Behavioral of rs232_controller is

subtype byte is std_logic_vector (7 downto 0);

type rs232_state_enum is (  rs232_waiting, rs232_start,
                            rs232_d0, rs232_d1, rs232_d2, rs232_d3,
                            rs232_d4, rs232_d5, rs232_d6, rs232_d7,
                            rs232_stop);
                        
type rs232_tran_dir_enum is (   rs232_tx, rs232_rx, rs232_inactive);

signal rs232_state  : rs232_state_enum      := rs232_waiting;
signal rs232_dir    : rs232_tran_dir_enum;

signal bus_data : byte := ( others => '0');
signal bus_data_mem : byte := ( others => '0');

signal TXD_out      : std_logic := '1';

signal TX_rst_trig : std_logic := '0';
signal TX_trig_out : std_logic := '0';

signal RX_done : std_logic := '0';
signal TX_trig : std_logic;

begin

tx_trig_latch: process(TX_trig, TX_rst_trig)
begin

    if TX_rst_trig = '1' then
        TX_trig_out <= '0';
    elsif rising_edge(TX_trig) then
        TX_trig_out <= '1';
    end if;

end process;

dir_select: process(rs232_state, RXD_i, TX_trig_out)
begin
    
    if rs232_state = rs232_waiting then
        
        if RXD_i = '0' then
            rs232_dir <= rs232_rx;
        elsif TX_trig_out = '1' then
            rs232_dir <= rs232_tx;
        else
            rs232_dir <= rs232_inactive;
        end if;
        
    end if;
    
end process;

transmission: process(clk_baud, rs232_state, rs232_dir)
begin

    if rising_edge(clk_baud) then
    
        if rs232_dir = rs232_tx then
            
            if rs232_state = rs232_waiting then
                rs232_state <= rs232_start;
                bus_data <= data_i;
                TXD_out <= '0';
                TX_rst_trig <= '1';
            elsif rs232_state = rs232_start then
                rs232_state <= rs232_d0;
                TXD_out <= bus_data(0);
                TX_rst_trig <= '0';
            elsif rs232_state = rs232_d0 then
                rs232_state <= rs232_d1;
                TXD_out <= bus_data(1);
            elsif rs232_state = rs232_d1 then
                rs232_state <= rs232_d2;
                TXD_out <= bus_data(2);
            elsif rs232_state = rs232_d2 then
                rs232_state <= rs232_d3;
                TXD_out <= bus_data(3);
            elsif rs232_state = rs232_d3 then
                rs232_state <= rs232_d4;
                TXD_out <= bus_data(4);
            elsif rs232_state = rs232_d4 then
                rs232_state <= rs232_d5;
                TXD_out <= bus_data(5);
            elsif rs232_state = rs232_d5 then
                rs232_state <= rs232_d6;
                TXD_out <= bus_data(6);
            elsif rs232_state = rs232_d6 then
                rs232_state <= rs232_d7;
                TXD_out <= bus_data(7);
            elsif rs232_state = rs232_d7 then
                rs232_state <= rs232_waiting;
                TXD_out <= '1';
--            elsif rs232_state = rs232_stop then
--                rs232_state <= rs232_waiting;
            end if;
            
        elsif rs232_dir = rs232_rx then
        
            if rs232_state = rs232_waiting then
                rs232_state <= rs232_start;
            elsif rs232_state = rs232_start then
                rs232_state <= rs232_d0;
                bus_data(0) <= RXD_i;
            elsif rs232_state = rs232_d0 then
                rs232_state <= rs232_d1;
                bus_data(1) <= RXD_i;
            elsif rs232_state = rs232_d1 then
                rs232_state <= rs232_d2;
                bus_data(2) <= RXD_i;
            elsif rs232_state = rs232_d2 then
                rs232_state <= rs232_d3;
                bus_data(3) <= RXD_i;
            elsif rs232_state = rs232_d3 then
                rs232_state <= rs232_d4;
                bus_data(4) <= RXD_i;
            elsif rs232_state = rs232_d4 then
                rs232_state <= rs232_d5;
                bus_data(5) <= RXD_i;
            elsif rs232_state = rs232_d5 then
                rs232_state <= rs232_d6;
                bus_data(6) <= RXD_i;
            elsif rs232_state = rs232_d6 then
                rs232_state <= rs232_d7;
                bus_data(7) <= RXD_i;
                RX_done <= '1';
            elsif rs232_state = rs232_d7 then
                rs232_state <= rs232_waiting;
                bus_data_mem <= bus_data;
                RX_done <= '0';
--            elsif rs232_state = rs232_stop then
--                rs232_state <= rs232_waiting;
            end if;
            
        end if;
        
    end if;
    
end process;

    clk_en <= '1' when rs232_dir /= rs232_inactive else '0';
    
    TX_trig <= RX_done;
    
    TXD_o <= TXD_out;
    
    data_o <= bus_data_mem;
    

end Behavioral;
