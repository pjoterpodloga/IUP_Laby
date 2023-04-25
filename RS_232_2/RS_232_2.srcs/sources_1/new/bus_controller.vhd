----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Piotr Buluk, Jakub Cichocki
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
        clk_i   :   in  std_logic;
        baud_i  :   in  std_logic;
        nbaud_i :   in  std_logic;
        RXD_i   :   in  std_logic;
        data_i  :   in  std_logic_vector(7 downto 0);
        TXD_o   :   out std_logic;
        clk_en  :   out std_logic;
        data_o  :   out std_logic_vector(7 downto 0));
        
end bus_controller;

architecture Behavioral of bus_controller is

subtype byte is std_logic_vector(7 downto 0);

type transmission_enum  is  (rs232_inactive, rs232_active);
type rs232_state_enum   is     (rs232_start, 
                                rs232_d0, rs232_d1, rs232_d2, rs232_d3,
                                rs232_d4, rs232_d5, rs232_d6, rs232_d7,
                                rs232_stop);
                             
signal trans_tx_state  :   transmission_enum;
signal trans_rx_state  :   transmission_enum;

signal rs232_current_tx_state      :   rs232_state_enum;
signal rs232_next_tx_state         :   rs232_state_enum;

signal rs232_current_rx_state      :   rs232_state_enum;
signal rs232_next_rx_state         :   rs232_state_enum;


signal output_data  :   byte    :=  (others => '0');
signal input_data   :   byte    :=  (others => '0');

signal TXD  :   std_logic   := '1';
signal RXD  :   std_logic;

signal strobe_reset : std_logic := '0';
signal strobe_set   : std_logic := '0';

signal strobe       : std_logic := '0';

begin

next_bus_state: process(clk_i, rs232_current_tx_state, rs232_current_rx_state)
begin

    if rising_edge(clk_i) then
        case rs232_current_tx_state is
            when rs232_start    => rs232_next_tx_state <= rs232_d0;
            when rs232_d0       => rs232_next_tx_state <= rs232_d1;
            when rs232_d1       => rs232_next_tx_state <= rs232_d2;
            when rs232_d2       => rs232_next_tx_state <= rs232_d3;
            when rs232_d3       => rs232_next_tx_state <= rs232_d4;
            when rs232_d4       => rs232_next_tx_state <= rs232_d5;
            when rs232_d5       => rs232_next_tx_state <= rs232_d6;
            when rs232_d6       => rs232_next_tx_state <= rs232_d7;
            when rs232_d7       => rs232_next_tx_state <= rs232_stop;
            when rs232_stop     => rs232_next_tx_state <= rs232_start;
            when others         => rs232_next_tx_state <= rs232_start;
        end case;
    
        case rs232_current_rx_state is
            when rs232_start    => rs232_next_rx_state <= rs232_d0;
            when rs232_d0       => rs232_next_rx_state <= rs232_d1;
            when rs232_d1       => rs232_next_rx_state <= rs232_d2;
            when rs232_d2       => rs232_next_rx_state <= rs232_d3;
            when rs232_d3       => rs232_next_rx_state <= rs232_d4;
            when rs232_d4       => rs232_next_rx_state <= rs232_d5;
            when rs232_d5       => rs232_next_rx_state <= rs232_d6;
            when rs232_d6       => rs232_next_rx_state <= rs232_d7;
            when rs232_d7       => rs232_next_rx_state <= rs232_stop;
            when rs232_stop     => rs232_next_rx_state <= rs232_start;
            when others         => rs232_next_rx_state <= rs232_start;
        end case;
    end if;
    
end process;

recive_data: process(clk_i, baud_i)
begin
    
    if rising_edge(baud_i) then
    
        if trans_rx_state = rs232_active then
            case rs232_current_rx_state is
                when rs232_start    =>  strobe_set <= '0';
                when rs232_d0       =>  input_data(0) <= RXD;   
                when rs232_d1       =>  input_data(1) <= RXD;
                when rs232_d2       =>  input_data(2) <= RXD;
                when rs232_d3       =>  input_data(3) <= RXD;
                when rs232_d4       =>  input_data(4) <= RXD;
                when rs232_d5       =>  input_data(5) <= RXD;
                when rs232_d6       =>  input_data(6) <= RXD;
                when rs232_d7       =>  input_data(7) <= RXD;
                when rs232_stop     =>  strobe_set <= '1';      data_o <= input_data;
                when others         =>  null;
            end case;
            
            rs232_current_rx_state <= rs232_next_rx_state;
        end if;    
        

        
    end if;
    
end process;

transmit_data: process(clk_i, nbaud_i)
begin

    if rising_edge(nbaud_i) then
    
        if trans_tx_state = rs232_active then
            case rs232_current_tx_state is            
                when rs232_start    =>  TXD <= '0';             strobe_reset <= '1';           
                when rs232_d0       =>  TXD <= output_data(0);  strobe_reset <= '0';  
                when rs232_d1       =>  TXD <= output_data(1);
                when rs232_d2       =>  TXD <= output_data(2);
                when rs232_d3       =>  TXD <= output_data(3);
                when rs232_d4       =>  TXD <= output_data(4);
                when rs232_d5       =>  TXD <= output_data(5);
                when rs232_d6       =>  TXD <= output_data(6);
                when rs232_d7       =>  TXD <= output_data(7);
                when rs232_stop     =>  TXD <= '1';
                when others         =>  null;
            end case;
            
            rs232_current_tx_state <= rs232_next_tx_state;
        end if;
    
    end if;

end process;

transmission_detection: process(clk_i, strobe, TXD, RXD, rs232_current_tx_state, trans_tx_state, rs232_current_rx_state, trans_rx_state)
begin
    
    if rising_edge(clk_i) then

        if RXD = '0' and rs232_current_rx_state = rs232_start then
            trans_rx_state <= rs232_active;
        elsif RXD = '1' and rs232_current_rx_state = rs232_start then
            trans_rx_state <= rs232_inactive;
        end if;
        
                
        if strobe = '1' and rs232_current_tx_state = rs232_start then
            trans_tx_state <= rs232_active;
        elsif TXD = '1' and rs232_current_tx_state = rs232_start then
            trans_tx_state <= rs232_inactive;
        end if;
    end if;

end process;

tx_strobe: process(strobe_reset, strobe_set)
begin

    if strobe_reset = '1'  then
        strobe <= '0';
    elsif rising_edge(strobe_set) then
        strobe <= '1';
    end if;

end process;

RXD     <= RXD_i;
TXD_o   <= TXD;

output_data <= data_i;

clk_en <= '0' when (trans_rx_state = rs232_inactive) and (trans_tx_state = rs232_inactive) else '1';

end Behavioral;
