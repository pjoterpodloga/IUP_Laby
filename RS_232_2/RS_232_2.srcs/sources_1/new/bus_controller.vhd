----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2023 16:49:46
-- Design Name: 
-- Module Name: bus_controller - Behavioral
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

entity bus_controller is
    Port (
        baud_i  :   in  std_logic;
        RXD_i   :   in  std_logic;
        data_i  :   out std_logic_vector(7 downto 0);
        TXD_o   :   out std_logic;
        clk_en  :   out std_logic;
        data_o  :   out std_logic_vector(7 downto 0));
        
end bus_controller;

architecture Behavioral of bus_controller is

subtype byte is std_logic_vector(7 downto 0);

type transmission_dir_enum  is  (rs232_inactive, rs232_rx, rs232_tx);
type rs232_state_enum       is  (rs232_waiting, rs232_start, 
                                 rs232_d0, rs232_d1, rs232_d2, rs232_d3,
                                 rs232_d4, rs232_d5, rs232_d6, rs232_d7,
                                 rs232_stop, rs232_parity);
                             
signal trans_dir_state  :   transmission_dir_enum;

signal rs232_current_state      :   rs232_state_enum;
signal rs232_next_state         :   rs232_state_enum;

signal TX_strobe    :   std_logic   := '0'; --do zmiany i to tak po calaku | dodaæ port TX_STROBE

signal output_data  :   byte    :=  (others => '0');
signal input_data   :   byte    :=  (others => '0');

begin

next_bus_state: process(rs232_current_state)
begin
    
    case rs232_current_state is
        when rs232_waiting  => rs232_next_state <= rs232_start;
        when rs232_start    => rs232_next_state <= rs232_d0;
        when rs232_d0       => rs232_next_state <= rs232_d1;
        when rs232_d1       => rs232_next_state <= rs232_d2;
        when rs232_d2       => rs232_next_state <= rs232_d3;
        when rs232_d3       => rs232_next_state <= rs232_d4;
        when rs232_d4       => rs232_next_state <= rs232_d5;
        when rs232_d5       => rs232_next_state <= rs232_d6;
        when rs232_d7       => rs232_next_state <= rs232_d7;
        when rs232_d7       => rs232_next_state <= rs232_stop;
        when rs232_stop     => rs232_next_state <= rs232_parity;
        when rs232_parity   => rs232_next_state <= rs232_waiting;
        when others         => null;
    end case;
    
end process;

clk_en <= '0' when trans_dir_state = rs232_inactive else '1';

end Behavioral;
