-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Thu Apr  6 14:56:24 2023
-- Host        : DESKTOP-G1E6JH8 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               J:/Kody/vhdl/IUP_Laby/VGA_3/VGA_3.sim/sim_1/synth/func/xsim/tb_freq_div_func_synth.vhd
-- Design      : freq_div
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity freq_div is
  port (
    clk_i : in STD_LOGIC;
    clk_en : in STD_LOGIC;
    rst_i : in STD_LOGIC;
    clk_o : out STD_LOGIC;
    q_out : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of freq_div : entity is true;
  attribute NDIV : integer;
  attribute NDIV of freq_div : entity is 10;
end freq_div;

architecture STRUCTURE of freq_div is
  signal clk_en_IBUF : STD_LOGIC;
  signal clk_i_IBUF : STD_LOGIC;
  signal clk_i_IBUF_BUFG : STD_LOGIC;
  signal clk_o_OBUF : STD_LOGIC;
  signal d_reset : STD_LOGIC;
  signal d_state_i_1_n_0 : STD_LOGIC;
  signal d_state_i_2_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal q_out_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rst_i_IBUF : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \d_q[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \d_q[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \d_q[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \d_q[3]_i_1\ : label is "soft_lutpair0";
begin
clk_en_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => clk_en,
      O => clk_en_IBUF
    );
clk_i_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_i_IBUF,
      O => clk_i_IBUF_BUFG
    );
clk_i_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => clk_i,
      O => clk_i_IBUF
    );
clk_o_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => clk_o_OBUF,
      O => clk_o
    );
\d_q[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => q_out_OBUF(0),
      O => p_0_in(0)
    );
\d_q[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => q_out_OBUF(0),
      I1 => q_out_OBUF(1),
      O => p_0_in(1)
    );
\d_q[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => q_out_OBUF(0),
      I1 => q_out_OBUF(1),
      I2 => q_out_OBUF(2),
      O => p_0_in(2)
    );
\d_q[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => q_out_OBUF(1),
      I1 => q_out_OBUF(0),
      I2 => q_out_OBUF(2),
      I3 => q_out_OBUF(3),
      O => p_0_in(3)
    );
\d_q[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBFBBBBBBBBBBBB"
    )
        port map (
      I0 => rst_i_IBUF,
      I1 => clk_en_IBUF,
      I2 => q_out_OBUF(0),
      I3 => q_out_OBUF(2),
      I4 => q_out_OBUF(1),
      I5 => q_out_OBUF(3),
      O => d_reset
    );
\d_q_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i_IBUF_BUFG,
      CE => '1',
      CLR => d_reset,
      D => p_0_in(0),
      Q => q_out_OBUF(0)
    );
\d_q_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i_IBUF_BUFG,
      CE => '1',
      CLR => d_reset,
      D => p_0_in(1),
      Q => q_out_OBUF(1)
    );
\d_q_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i_IBUF_BUFG,
      CE => '1',
      CLR => d_reset,
      D => p_0_in(2),
      Q => q_out_OBUF(2)
    );
\d_q_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i_IBUF_BUFG,
      CE => '1',
      CLR => d_reset,
      D => p_0_in(3),
      Q => q_out_OBUF(3)
    );
d_state_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => q_out_OBUF(3),
      I1 => q_out_OBUF(0),
      I2 => q_out_OBUF(1),
      I3 => q_out_OBUF(2),
      O => d_state_i_1_n_0
    );
d_state_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => q_out_OBUF(1),
      I1 => q_out_OBUF(0),
      I2 => q_out_OBUF(2),
      I3 => q_out_OBUF(3),
      O => d_state_i_2_n_0
    );
d_state_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i_IBUF_BUFG,
      CE => d_state_i_2_n_0,
      D => d_state_i_2_n_0,
      Q => clk_o_OBUF,
      R => d_state_i_1_n_0
    );
\q_out_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => q_out_OBUF(0),
      O => q_out(0)
    );
\q_out_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => q_out_OBUF(1),
      O => q_out(1)
    );
\q_out_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => q_out_OBUF(2),
      O => q_out(2)
    );
\q_out_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => q_out_OBUF(3),
      O => q_out(3)
    );
rst_i_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => rst_i,
      O => rst_i_IBUF
    );
end STRUCTURE;
