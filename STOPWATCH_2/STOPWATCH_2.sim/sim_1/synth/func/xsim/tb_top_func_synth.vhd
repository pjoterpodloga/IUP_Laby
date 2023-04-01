-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Sat Apr  1 20:48:32 2023
-- Host        : DESKTOP-G1E6JH8 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               J:/Kody/vhdl/IUP_Laby/STOPWATCH_2/STOPWATCH_2.sim/sim_1/synth/func/xsim/tb_top_func_synth.vhd
-- Design      : top
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity divider is
  port (
    mux_clk : out STD_LOGIC;
    clk_i_IBUF : in STD_LOGIC
  );
end divider;

architecture STRUCTURE of divider is
  signal \FSM_sequential_an_state[1]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_an_state[1]_i_4_n_0\ : STD_LOGIC;
  signal d_diff : STD_LOGIC;
  signal \d_q[0]_i_3_n_0\ : STD_LOGIC;
  signal d_q_reg : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \d_q_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \d_q_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \d_q_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \d_q_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal last_state : STD_LOGIC;
  signal last_state_i_1_n_0 : STD_LOGIC;
  signal last_state_i_3_n_0 : STD_LOGIC;
  signal last_state_i_4_n_0 : STD_LOGIC;
  signal last_state_i_5_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal \NLW_d_q_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_d_q_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \d_q_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \d_q_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \d_q_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \d_q_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \d_q_reg[8]_i_1\ : label is 11;
begin
\FSM_sequential_an_state[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAEAEAEAEAEAEAAA"
    )
        port map (
      I0 => d_q_reg(17),
      I1 => d_q_reg(16),
      I2 => d_q_reg(15),
      I3 => \FSM_sequential_an_state[1]_i_3_n_0\,
      I4 => \FSM_sequential_an_state[1]_i_4_n_0\,
      I5 => d_q_reg(11),
      O => mux_clk
    );
\FSM_sequential_an_state[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFA8000000000000"
    )
        port map (
      I0 => d_q_reg(7),
      I1 => d_q_reg(6),
      I2 => d_q_reg(5),
      I3 => d_q_reg(8),
      I4 => d_q_reg(9),
      I5 => d_q_reg(10),
      O => \FSM_sequential_an_state[1]_i_3_n_0\
    );
\FSM_sequential_an_state[1]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => d_q_reg(12),
      I1 => d_q_reg(13),
      I2 => d_q_reg(14),
      O => \FSM_sequential_an_state[1]_i_4_n_0\
    );
\d_q[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000100"
    )
        port map (
      I0 => last_state_i_4_n_0,
      I1 => d_q_reg(3),
      I2 => d_q_reg(5),
      I3 => d_q_reg(11),
      I4 => d_q_reg(9),
      I5 => last_state_i_3_n_0,
      O => p_0_in
    );
\d_q[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => d_q_reg(0),
      O => \d_q[0]_i_3_n_0\
    );
\d_q_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => p_0_in,
      D => \d_q_reg[0]_i_1_n_7\,
      Q => d_q_reg(0)
    );
\d_q_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \d_q_reg[0]_i_1_n_0\,
      CO(2) => \d_q_reg[0]_i_1_n_1\,
      CO(1) => \d_q_reg[0]_i_1_n_2\,
      CO(0) => \d_q_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \d_q_reg[0]_i_1_n_4\,
      O(2) => \d_q_reg[0]_i_1_n_5\,
      O(1) => \d_q_reg[0]_i_1_n_6\,
      O(0) => \d_q_reg[0]_i_1_n_7\,
      S(3 downto 1) => d_q_reg(3 downto 1),
      S(0) => \d_q[0]_i_3_n_0\
    );
\d_q_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => p_0_in,
      D => \d_q_reg[8]_i_1_n_5\,
      Q => d_q_reg(10)
    );
\d_q_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => p_0_in,
      D => \d_q_reg[8]_i_1_n_4\,
      Q => d_q_reg(11)
    );
\d_q_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => p_0_in,
      D => \d_q_reg[12]_i_1_n_7\,
      Q => d_q_reg(12)
    );
\d_q_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \d_q_reg[8]_i_1_n_0\,
      CO(3) => \d_q_reg[12]_i_1_n_0\,
      CO(2) => \d_q_reg[12]_i_1_n_1\,
      CO(1) => \d_q_reg[12]_i_1_n_2\,
      CO(0) => \d_q_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \d_q_reg[12]_i_1_n_4\,
      O(2) => \d_q_reg[12]_i_1_n_5\,
      O(1) => \d_q_reg[12]_i_1_n_6\,
      O(0) => \d_q_reg[12]_i_1_n_7\,
      S(3 downto 0) => d_q_reg(15 downto 12)
    );
\d_q_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => p_0_in,
      D => \d_q_reg[12]_i_1_n_6\,
      Q => d_q_reg(13)
    );
\d_q_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => p_0_in,
      D => \d_q_reg[12]_i_1_n_5\,
      Q => d_q_reg(14)
    );
\d_q_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => p_0_in,
      D => \d_q_reg[12]_i_1_n_4\,
      Q => d_q_reg(15)
    );
\d_q_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => p_0_in,
      D => \d_q_reg[16]_i_1_n_7\,
      Q => d_q_reg(16)
    );
\d_q_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \d_q_reg[12]_i_1_n_0\,
      CO(3 downto 1) => \NLW_d_q_reg[16]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \d_q_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_d_q_reg[16]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \d_q_reg[16]_i_1_n_6\,
      O(0) => \d_q_reg[16]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1 downto 0) => d_q_reg(17 downto 16)
    );
\d_q_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => p_0_in,
      D => \d_q_reg[16]_i_1_n_6\,
      Q => d_q_reg(17)
    );
\d_q_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => p_0_in,
      D => \d_q_reg[0]_i_1_n_6\,
      Q => d_q_reg(1)
    );
\d_q_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => p_0_in,
      D => \d_q_reg[0]_i_1_n_5\,
      Q => d_q_reg(2)
    );
\d_q_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => p_0_in,
      D => \d_q_reg[0]_i_1_n_4\,
      Q => d_q_reg(3)
    );
\d_q_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => p_0_in,
      D => \d_q_reg[4]_i_1_n_7\,
      Q => d_q_reg(4)
    );
\d_q_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \d_q_reg[0]_i_1_n_0\,
      CO(3) => \d_q_reg[4]_i_1_n_0\,
      CO(2) => \d_q_reg[4]_i_1_n_1\,
      CO(1) => \d_q_reg[4]_i_1_n_2\,
      CO(0) => \d_q_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \d_q_reg[4]_i_1_n_4\,
      O(2) => \d_q_reg[4]_i_1_n_5\,
      O(1) => \d_q_reg[4]_i_1_n_6\,
      O(0) => \d_q_reg[4]_i_1_n_7\,
      S(3 downto 0) => d_q_reg(7 downto 4)
    );
\d_q_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => p_0_in,
      D => \d_q_reg[4]_i_1_n_6\,
      Q => d_q_reg(5)
    );
\d_q_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => p_0_in,
      D => \d_q_reg[4]_i_1_n_5\,
      Q => d_q_reg(6)
    );
\d_q_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => p_0_in,
      D => \d_q_reg[4]_i_1_n_4\,
      Q => d_q_reg(7)
    );
\d_q_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => p_0_in,
      D => \d_q_reg[8]_i_1_n_7\,
      Q => d_q_reg(8)
    );
\d_q_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \d_q_reg[4]_i_1_n_0\,
      CO(3) => \d_q_reg[8]_i_1_n_0\,
      CO(2) => \d_q_reg[8]_i_1_n_1\,
      CO(1) => \d_q_reg[8]_i_1_n_2\,
      CO(0) => \d_q_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \d_q_reg[8]_i_1_n_4\,
      O(2) => \d_q_reg[8]_i_1_n_5\,
      O(1) => \d_q_reg[8]_i_1_n_6\,
      O(0) => \d_q_reg[8]_i_1_n_7\,
      S(3 downto 0) => d_q_reg(11 downto 8)
    );
\d_q_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => p_0_in,
      D => \d_q_reg[8]_i_1_n_6\,
      Q => d_q_reg(9)
    );
last_state_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEF"
    )
        port map (
      I0 => last_state_i_3_n_0,
      I1 => d_q_reg(9),
      I2 => d_q_reg(11),
      I3 => d_q_reg(5),
      I4 => d_q_reg(3),
      I5 => last_state_i_4_n_0,
      O => last_state_i_1_n_0
    );
last_state_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => last_state,
      I1 => clk_i_IBUF,
      O => d_diff
    );
last_state_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFEFF"
    )
        port map (
      I0 => \FSM_sequential_an_state[1]_i_4_n_0\,
      I1 => last_state_i_5_n_0,
      I2 => d_q_reg(7),
      I3 => d_q_reg(16),
      I4 => d_q_reg(0),
      O => last_state_i_3_n_0
    );
last_state_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => d_q_reg(17),
      I1 => d_q_reg(15),
      I2 => d_q_reg(6),
      I3 => d_q_reg(2),
      O => last_state_i_4_n_0
    );
last_state_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => d_q_reg(8),
      I1 => d_q_reg(10),
      I2 => d_q_reg(4),
      I3 => d_q_reg(1),
      O => last_state_i_5_n_0
    );
last_state_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => last_state_i_1_n_0,
      D => clk_i_IBUF,
      Q => last_state,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \divider__parameterized1\ is
  port (
    CLK : out STD_LOGIC;
    clk_i_IBUF : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \divider__parameterized1\ : entity is "divider";
end \divider__parameterized1\;

architecture STRUCTURE of \divider__parameterized1\ is
  signal d_diff : STD_LOGIC;
  signal \d_q[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \d_q[0]_i_3__0_n_0\ : STD_LOGIC;
  signal d_q_reg : STD_LOGIC_VECTOR ( 20 downto 0 );
  signal \d_q_reg[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1__0_n_1\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1__0_n_2\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1__0_n_3\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1__0_n_4\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1__0_n_5\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1__0_n_6\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1__0_n_7\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1__0_n_0\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1__0_n_1\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1__0_n_2\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1__0_n_3\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1__0_n_4\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1__0_n_5\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1__0_n_6\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1__0_n_7\ : STD_LOGIC;
  signal \d_q_reg[16]_i_1__0_n_0\ : STD_LOGIC;
  signal \d_q_reg[16]_i_1__0_n_1\ : STD_LOGIC;
  signal \d_q_reg[16]_i_1__0_n_2\ : STD_LOGIC;
  signal \d_q_reg[16]_i_1__0_n_3\ : STD_LOGIC;
  signal \d_q_reg[16]_i_1__0_n_4\ : STD_LOGIC;
  signal \d_q_reg[16]_i_1__0_n_5\ : STD_LOGIC;
  signal \d_q_reg[16]_i_1__0_n_6\ : STD_LOGIC;
  signal \d_q_reg[16]_i_1__0_n_7\ : STD_LOGIC;
  signal \d_q_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1__0_n_1\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1__0_n_2\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1__0_n_3\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1__0_n_4\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1__0_n_5\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1__0_n_6\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1__0_n_7\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1__0_n_1\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1__0_n_2\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1__0_n_3\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1__0_n_4\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1__0_n_5\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1__0_n_6\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1__0_n_7\ : STD_LOGIC;
  signal last_state : STD_LOGIC;
  signal \last_state_i_1__0_n_0\ : STD_LOGIC;
  signal \last_state_i_3__0_n_0\ : STD_LOGIC;
  signal \last_state_i_4__0_n_0\ : STD_LOGIC;
  signal \last_state_i_5__0_n_0\ : STD_LOGIC;
  signal last_state_i_6_n_0 : STD_LOGIC;
  signal \millis_01[3]_i_3_n_0\ : STD_LOGIC;
  signal \millis_01[3]_i_4_n_0\ : STD_LOGIC;
  signal \millis_01[3]_i_5_n_0\ : STD_LOGIC;
  signal \NLW_d_q_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_d_q_reg[20]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \d_q_reg[0]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \d_q_reg[12]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \d_q_reg[16]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \d_q_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \d_q_reg[4]_i_1__0\ : label is 11;
  attribute ADDER_THRESHOLD of \d_q_reg[8]_i_1__0\ : label is 11;
begin
\d_q[0]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000100"
    )
        port map (
      I0 => \last_state_i_4__0_n_0\,
      I1 => d_q_reg(4),
      I2 => d_q_reg(0),
      I3 => d_q_reg(20),
      I4 => d_q_reg(14),
      I5 => \last_state_i_3__0_n_0\,
      O => \d_q[0]_i_2__0_n_0\
    );
\d_q[0]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => d_q_reg(0),
      O => \d_q[0]_i_3__0_n_0\
    );
\d_q_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[0]_i_1__0_n_7\,
      Q => d_q_reg(0)
    );
\d_q_reg[0]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \d_q_reg[0]_i_1__0_n_0\,
      CO(2) => \d_q_reg[0]_i_1__0_n_1\,
      CO(1) => \d_q_reg[0]_i_1__0_n_2\,
      CO(0) => \d_q_reg[0]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \d_q_reg[0]_i_1__0_n_4\,
      O(2) => \d_q_reg[0]_i_1__0_n_5\,
      O(1) => \d_q_reg[0]_i_1__0_n_6\,
      O(0) => \d_q_reg[0]_i_1__0_n_7\,
      S(3 downto 1) => d_q_reg(3 downto 1),
      S(0) => \d_q[0]_i_3__0_n_0\
    );
\d_q_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[8]_i_1__0_n_5\,
      Q => d_q_reg(10)
    );
\d_q_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[8]_i_1__0_n_4\,
      Q => d_q_reg(11)
    );
\d_q_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[12]_i_1__0_n_7\,
      Q => d_q_reg(12)
    );
\d_q_reg[12]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \d_q_reg[8]_i_1__0_n_0\,
      CO(3) => \d_q_reg[12]_i_1__0_n_0\,
      CO(2) => \d_q_reg[12]_i_1__0_n_1\,
      CO(1) => \d_q_reg[12]_i_1__0_n_2\,
      CO(0) => \d_q_reg[12]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \d_q_reg[12]_i_1__0_n_4\,
      O(2) => \d_q_reg[12]_i_1__0_n_5\,
      O(1) => \d_q_reg[12]_i_1__0_n_6\,
      O(0) => \d_q_reg[12]_i_1__0_n_7\,
      S(3 downto 0) => d_q_reg(15 downto 12)
    );
\d_q_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[12]_i_1__0_n_6\,
      Q => d_q_reg(13)
    );
\d_q_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[12]_i_1__0_n_5\,
      Q => d_q_reg(14)
    );
\d_q_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[12]_i_1__0_n_4\,
      Q => d_q_reg(15)
    );
\d_q_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[16]_i_1__0_n_7\,
      Q => d_q_reg(16)
    );
\d_q_reg[16]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \d_q_reg[12]_i_1__0_n_0\,
      CO(3) => \d_q_reg[16]_i_1__0_n_0\,
      CO(2) => \d_q_reg[16]_i_1__0_n_1\,
      CO(1) => \d_q_reg[16]_i_1__0_n_2\,
      CO(0) => \d_q_reg[16]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \d_q_reg[16]_i_1__0_n_4\,
      O(2) => \d_q_reg[16]_i_1__0_n_5\,
      O(1) => \d_q_reg[16]_i_1__0_n_6\,
      O(0) => \d_q_reg[16]_i_1__0_n_7\,
      S(3 downto 0) => d_q_reg(19 downto 16)
    );
\d_q_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[16]_i_1__0_n_6\,
      Q => d_q_reg(17)
    );
\d_q_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[16]_i_1__0_n_5\,
      Q => d_q_reg(18)
    );
\d_q_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[16]_i_1__0_n_4\,
      Q => d_q_reg(19)
    );
\d_q_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[0]_i_1__0_n_6\,
      Q => d_q_reg(1)
    );
\d_q_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[20]_i_1_n_7\,
      Q => d_q_reg(20)
    );
\d_q_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \d_q_reg[16]_i_1__0_n_0\,
      CO(3 downto 0) => \NLW_d_q_reg[20]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_d_q_reg[20]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \d_q_reg[20]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => d_q_reg(20)
    );
\d_q_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[0]_i_1__0_n_5\,
      Q => d_q_reg(2)
    );
\d_q_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[0]_i_1__0_n_4\,
      Q => d_q_reg(3)
    );
\d_q_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[4]_i_1__0_n_7\,
      Q => d_q_reg(4)
    );
\d_q_reg[4]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \d_q_reg[0]_i_1__0_n_0\,
      CO(3) => \d_q_reg[4]_i_1__0_n_0\,
      CO(2) => \d_q_reg[4]_i_1__0_n_1\,
      CO(1) => \d_q_reg[4]_i_1__0_n_2\,
      CO(0) => \d_q_reg[4]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \d_q_reg[4]_i_1__0_n_4\,
      O(2) => \d_q_reg[4]_i_1__0_n_5\,
      O(1) => \d_q_reg[4]_i_1__0_n_6\,
      O(0) => \d_q_reg[4]_i_1__0_n_7\,
      S(3 downto 0) => d_q_reg(7 downto 4)
    );
\d_q_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[4]_i_1__0_n_6\,
      Q => d_q_reg(5)
    );
\d_q_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[4]_i_1__0_n_5\,
      Q => d_q_reg(6)
    );
\d_q_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[4]_i_1__0_n_4\,
      Q => d_q_reg(7)
    );
\d_q_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[8]_i_1__0_n_7\,
      Q => d_q_reg(8)
    );
\d_q_reg[8]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \d_q_reg[4]_i_1__0_n_0\,
      CO(3) => \d_q_reg[8]_i_1__0_n_0\,
      CO(2) => \d_q_reg[8]_i_1__0_n_1\,
      CO(1) => \d_q_reg[8]_i_1__0_n_2\,
      CO(0) => \d_q_reg[8]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \d_q_reg[8]_i_1__0_n_4\,
      O(2) => \d_q_reg[8]_i_1__0_n_5\,
      O(1) => \d_q_reg[8]_i_1__0_n_6\,
      O(0) => \d_q_reg[8]_i_1__0_n_7\,
      S(3 downto 0) => d_q_reg(11 downto 8)
    );
\d_q_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__0_n_0\,
      D => \d_q_reg[8]_i_1__0_n_6\,
      Q => d_q_reg(9)
    );
\last_state_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEF"
    )
        port map (
      I0 => \last_state_i_3__0_n_0\,
      I1 => d_q_reg(14),
      I2 => d_q_reg(20),
      I3 => d_q_reg(0),
      I4 => d_q_reg(4),
      I5 => \last_state_i_4__0_n_0\,
      O => \last_state_i_1__0_n_0\
    );
\last_state_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => clk_i_IBUF,
      I1 => last_state,
      O => d_diff
    );
\last_state_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFEF"
    )
        port map (
      I0 => \last_state_i_5__0_n_0\,
      I1 => d_q_reg(2),
      I2 => d_q_reg(7),
      I3 => d_q_reg(9),
      I4 => last_state_i_6_n_0,
      O => \last_state_i_3__0_n_0\
    );
\last_state_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => d_q_reg(8),
      I1 => d_q_reg(6),
      I2 => d_q_reg(5),
      I3 => d_q_reg(16),
      O => \last_state_i_4__0_n_0\
    );
\last_state_i_5__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => d_q_reg(10),
      I1 => d_q_reg(15),
      I2 => d_q_reg(3),
      I3 => d_q_reg(1),
      O => \last_state_i_5__0_n_0\
    );
last_state_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFFFFFFFFFFFF"
    )
        port map (
      I0 => d_q_reg(13),
      I1 => d_q_reg(12),
      I2 => d_q_reg(11),
      I3 => d_q_reg(17),
      I4 => d_q_reg(19),
      I5 => d_q_reg(18),
      O => last_state_i_6_n_0
    );
last_state_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => \last_state_i_1__0_n_0\,
      D => clk_i_IBUF,
      Q => last_state,
      R => '0'
    );
\millis_01[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BAAABABABAAABAAA"
    )
        port map (
      I0 => d_q_reg(20),
      I1 => \millis_01[3]_i_3_n_0\,
      I2 => d_q_reg(16),
      I3 => d_q_reg(15),
      I4 => \millis_01[3]_i_4_n_0\,
      I5 => d_q_reg(14),
      O => CLK
    );
\millis_01[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => d_q_reg(18),
      I1 => d_q_reg(19),
      I2 => d_q_reg(17),
      O => \millis_01[3]_i_3_n_0\
    );
\millis_01[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000001FF"
    )
        port map (
      I0 => d_q_reg(7),
      I1 => d_q_reg(8),
      I2 => d_q_reg(6),
      I3 => d_q_reg(9),
      I4 => \millis_01[3]_i_5_n_0\,
      I5 => d_q_reg(10),
      O => \millis_01[3]_i_4_n_0\
    );
\millis_01[3]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => d_q_reg(11),
      I1 => d_q_reg(12),
      I2 => d_q_reg(13),
      O => \millis_01[3]_i_5_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \divider__parameterized3\ is
  port (
    CLK : out STD_LOGIC;
    clk_i_IBUF : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \divider__parameterized3\ : entity is "divider";
end \divider__parameterized3\;

architecture STRUCTURE of \divider__parameterized3\ is
  signal d_diff : STD_LOGIC;
  signal \d_q[0]_i_2__1_n_0\ : STD_LOGIC;
  signal \d_q[0]_i_3__1_n_0\ : STD_LOGIC;
  signal d_q_reg : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal \d_q_reg[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1__1_n_1\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1__1_n_2\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1__1_n_3\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1__1_n_4\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1__1_n_5\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1__1_n_6\ : STD_LOGIC;
  signal \d_q_reg[0]_i_1__1_n_7\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1__1_n_0\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1__1_n_1\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1__1_n_2\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1__1_n_3\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1__1_n_4\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1__1_n_5\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1__1_n_6\ : STD_LOGIC;
  signal \d_q_reg[12]_i_1__1_n_7\ : STD_LOGIC;
  signal \d_q_reg[16]_i_1__1_n_1\ : STD_LOGIC;
  signal \d_q_reg[16]_i_1__1_n_2\ : STD_LOGIC;
  signal \d_q_reg[16]_i_1__1_n_3\ : STD_LOGIC;
  signal \d_q_reg[16]_i_1__1_n_4\ : STD_LOGIC;
  signal \d_q_reg[16]_i_1__1_n_5\ : STD_LOGIC;
  signal \d_q_reg[16]_i_1__1_n_6\ : STD_LOGIC;
  signal \d_q_reg[16]_i_1__1_n_7\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1__1_n_1\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1__1_n_2\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1__1_n_3\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1__1_n_4\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1__1_n_5\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1__1_n_6\ : STD_LOGIC;
  signal \d_q_reg[4]_i_1__1_n_7\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1__1_n_0\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1__1_n_1\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1__1_n_2\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1__1_n_3\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1__1_n_4\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1__1_n_5\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1__1_n_6\ : STD_LOGIC;
  signal \d_q_reg[8]_i_1__1_n_7\ : STD_LOGIC;
  signal \debounce_q[9]_i_10_n_0\ : STD_LOGIC;
  signal \debounce_q[9]_i_9_n_0\ : STD_LOGIC;
  signal last_state : STD_LOGIC;
  signal \last_state_i_1__1_n_0\ : STD_LOGIC;
  signal \last_state_i_3__1_n_0\ : STD_LOGIC;
  signal \last_state_i_4__1_n_0\ : STD_LOGIC;
  signal \last_state_i_5__1_n_0\ : STD_LOGIC;
  signal \last_state_i_6__0_n_0\ : STD_LOGIC;
  signal \NLW_d_q_reg[16]_i_1__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \d_q_reg[0]_i_1__1\ : label is 11;
  attribute ADDER_THRESHOLD of \d_q_reg[12]_i_1__1\ : label is 11;
  attribute ADDER_THRESHOLD of \d_q_reg[16]_i_1__1\ : label is 11;
  attribute ADDER_THRESHOLD of \d_q_reg[4]_i_1__1\ : label is 11;
  attribute ADDER_THRESHOLD of \d_q_reg[8]_i_1__1\ : label is 11;
begin
\d_q[0]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \last_state_i_5__1_n_0\,
      I1 => d_q_reg(18),
      I2 => d_q_reg(17),
      I3 => d_q_reg(16),
      I4 => \last_state_i_4__1_n_0\,
      I5 => \last_state_i_3__1_n_0\,
      O => \d_q[0]_i_2__1_n_0\
    );
\d_q[0]_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => d_q_reg(0),
      O => \d_q[0]_i_3__1_n_0\
    );
\d_q_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[0]_i_1__1_n_7\,
      Q => d_q_reg(0)
    );
\d_q_reg[0]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \d_q_reg[0]_i_1__1_n_0\,
      CO(2) => \d_q_reg[0]_i_1__1_n_1\,
      CO(1) => \d_q_reg[0]_i_1__1_n_2\,
      CO(0) => \d_q_reg[0]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \d_q_reg[0]_i_1__1_n_4\,
      O(2) => \d_q_reg[0]_i_1__1_n_5\,
      O(1) => \d_q_reg[0]_i_1__1_n_6\,
      O(0) => \d_q_reg[0]_i_1__1_n_7\,
      S(3 downto 1) => d_q_reg(3 downto 1),
      S(0) => \d_q[0]_i_3__1_n_0\
    );
\d_q_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[8]_i_1__1_n_5\,
      Q => d_q_reg(10)
    );
\d_q_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[8]_i_1__1_n_4\,
      Q => d_q_reg(11)
    );
\d_q_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[12]_i_1__1_n_7\,
      Q => d_q_reg(12)
    );
\d_q_reg[12]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \d_q_reg[8]_i_1__1_n_0\,
      CO(3) => \d_q_reg[12]_i_1__1_n_0\,
      CO(2) => \d_q_reg[12]_i_1__1_n_1\,
      CO(1) => \d_q_reg[12]_i_1__1_n_2\,
      CO(0) => \d_q_reg[12]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \d_q_reg[12]_i_1__1_n_4\,
      O(2) => \d_q_reg[12]_i_1__1_n_5\,
      O(1) => \d_q_reg[12]_i_1__1_n_6\,
      O(0) => \d_q_reg[12]_i_1__1_n_7\,
      S(3 downto 0) => d_q_reg(15 downto 12)
    );
\d_q_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[12]_i_1__1_n_6\,
      Q => d_q_reg(13)
    );
\d_q_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[12]_i_1__1_n_5\,
      Q => d_q_reg(14)
    );
\d_q_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[12]_i_1__1_n_4\,
      Q => d_q_reg(15)
    );
\d_q_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[16]_i_1__1_n_7\,
      Q => d_q_reg(16)
    );
\d_q_reg[16]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \d_q_reg[12]_i_1__1_n_0\,
      CO(3) => \NLW_d_q_reg[16]_i_1__1_CO_UNCONNECTED\(3),
      CO(2) => \d_q_reg[16]_i_1__1_n_1\,
      CO(1) => \d_q_reg[16]_i_1__1_n_2\,
      CO(0) => \d_q_reg[16]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \d_q_reg[16]_i_1__1_n_4\,
      O(2) => \d_q_reg[16]_i_1__1_n_5\,
      O(1) => \d_q_reg[16]_i_1__1_n_6\,
      O(0) => \d_q_reg[16]_i_1__1_n_7\,
      S(3 downto 0) => d_q_reg(19 downto 16)
    );
\d_q_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[16]_i_1__1_n_6\,
      Q => d_q_reg(17)
    );
\d_q_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[16]_i_1__1_n_5\,
      Q => d_q_reg(18)
    );
\d_q_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[16]_i_1__1_n_4\,
      Q => d_q_reg(19)
    );
\d_q_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[0]_i_1__1_n_6\,
      Q => d_q_reg(1)
    );
\d_q_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[0]_i_1__1_n_5\,
      Q => d_q_reg(2)
    );
\d_q_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[0]_i_1__1_n_4\,
      Q => d_q_reg(3)
    );
\d_q_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[4]_i_1__1_n_7\,
      Q => d_q_reg(4)
    );
\d_q_reg[4]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \d_q_reg[0]_i_1__1_n_0\,
      CO(3) => \d_q_reg[4]_i_1__1_n_0\,
      CO(2) => \d_q_reg[4]_i_1__1_n_1\,
      CO(1) => \d_q_reg[4]_i_1__1_n_2\,
      CO(0) => \d_q_reg[4]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \d_q_reg[4]_i_1__1_n_4\,
      O(2) => \d_q_reg[4]_i_1__1_n_5\,
      O(1) => \d_q_reg[4]_i_1__1_n_6\,
      O(0) => \d_q_reg[4]_i_1__1_n_7\,
      S(3 downto 0) => d_q_reg(7 downto 4)
    );
\d_q_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[4]_i_1__1_n_6\,
      Q => d_q_reg(5)
    );
\d_q_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[4]_i_1__1_n_5\,
      Q => d_q_reg(6)
    );
\d_q_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[4]_i_1__1_n_4\,
      Q => d_q_reg(7)
    );
\d_q_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[8]_i_1__1_n_7\,
      Q => d_q_reg(8)
    );
\d_q_reg[8]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \d_q_reg[4]_i_1__1_n_0\,
      CO(3) => \d_q_reg[8]_i_1__1_n_0\,
      CO(2) => \d_q_reg[8]_i_1__1_n_1\,
      CO(1) => \d_q_reg[8]_i_1__1_n_2\,
      CO(0) => \d_q_reg[8]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \d_q_reg[8]_i_1__1_n_4\,
      O(2) => \d_q_reg[8]_i_1__1_n_5\,
      O(1) => \d_q_reg[8]_i_1__1_n_6\,
      O(0) => \d_q_reg[8]_i_1__1_n_7\,
      S(3 downto 0) => d_q_reg(11 downto 8)
    );
\d_q_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => '1',
      CLR => \d_q[0]_i_2__1_n_0\,
      D => \d_q_reg[8]_i_1__1_n_6\,
      Q => d_q_reg(9)
    );
\debounce_q[9]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000001FF"
    )
        port map (
      I0 => d_q_reg(7),
      I1 => d_q_reg(5),
      I2 => d_q_reg(6),
      I3 => d_q_reg(8),
      I4 => \last_state_i_4__1_n_0\,
      I5 => d_q_reg(9),
      O => \debounce_q[9]_i_10_n_0\
    );
\debounce_q[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BAAABABABAAABAAA"
    )
        port map (
      I0 => d_q_reg(19),
      I1 => \debounce_q[9]_i_9_n_0\,
      I2 => d_q_reg(15),
      I3 => d_q_reg(14),
      I4 => \debounce_q[9]_i_10_n_0\,
      I5 => d_q_reg(13),
      O => CLK
    );
\debounce_q[9]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => d_q_reg(16),
      I1 => d_q_reg(17),
      I2 => d_q_reg(18),
      O => \debounce_q[9]_i_9_n_0\
    );
\last_state_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \last_state_i_3__1_n_0\,
      I1 => \last_state_i_4__1_n_0\,
      I2 => d_q_reg(16),
      I3 => d_q_reg(17),
      I4 => d_q_reg(18),
      I5 => \last_state_i_5__1_n_0\,
      O => \last_state_i_1__1_n_0\
    );
\last_state_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => clk_i_IBUF,
      I1 => last_state,
      O => d_diff
    );
\last_state_i_3__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFB"
    )
        port map (
      I0 => d_q_reg(0),
      I1 => d_q_reg(14),
      I2 => d_q_reg(7),
      I3 => d_q_reg(3),
      I4 => \last_state_i_6__0_n_0\,
      O => \last_state_i_3__1_n_0\
    );
\last_state_i_4__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => d_q_reg(10),
      I1 => d_q_reg(11),
      I2 => d_q_reg(12),
      O => \last_state_i_4__1_n_0\
    );
\last_state_i_5__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000400000000"
    )
        port map (
      I0 => d_q_reg(13),
      I1 => d_q_reg(19),
      I2 => d_q_reg(8),
      I3 => d_q_reg(5),
      I4 => d_q_reg(15),
      I5 => d_q_reg(9),
      O => \last_state_i_5__1_n_0\
    );
\last_state_i_6__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => d_q_reg(6),
      I1 => d_q_reg(1),
      I2 => d_q_reg(2),
      I3 => d_q_reg(4),
      O => \last_state_i_6__0_n_0\
    );
last_state_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => d_diff,
      CE => \last_state_i_1__1_n_0\,
      D => clk_i_IBUF,
      Q => last_state,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity debounce is
  port (
    CLK : out STD_LOGIC;
    clk_i_IBUF : in STD_LOGIC;
    start_stop_button_i_IBUF : in STD_LOGIC
  );
end debounce;

architecture STRUCTURE of debounce is
  signal \^clk\ : STD_LOGIC;
  signal clk_debounce : STD_LOGIC;
  signal debounce_p : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \debounce_q[2]_i_1_n_0\ : STD_LOGIC;
  signal \debounce_q[6]_i_1_n_0\ : STD_LOGIC;
  signal \debounce_q[7]_i_2_n_0\ : STD_LOGIC;
  signal \debounce_q[7]_i_3_n_0\ : STD_LOGIC;
  signal \debounce_q[8]_i_2_n_0\ : STD_LOGIC;
  signal \debounce_q[9]_i_11_n_0\ : STD_LOGIC;
  signal \debounce_q[9]_i_12_n_0\ : STD_LOGIC;
  signal \debounce_q[9]_i_13_n_0\ : STD_LOGIC;
  signal \debounce_q[9]_i_14_n_0\ : STD_LOGIC;
  signal \debounce_q[9]_i_1_n_0\ : STD_LOGIC;
  signal \debounce_q[9]_i_4_n_0\ : STD_LOGIC;
  signal \debounce_q[9]_i_5_n_0\ : STD_LOGIC;
  signal \debounce_q[9]_i_6_n_0\ : STD_LOGIC;
  signal \debounce_q[9]_i_7_n_0\ : STD_LOGIC;
  signal \debounce_q[9]_i_8_n_0\ : STD_LOGIC;
  signal \debounce_q_reg_n_0_[0]\ : STD_LOGIC;
  signal \debounce_q_reg_n_0_[1]\ : STD_LOGIC;
  signal \debounce_q_reg_n_0_[2]\ : STD_LOGIC;
  signal \debounce_q_reg_n_0_[3]\ : STD_LOGIC;
  signal \debounce_q_reg_n_0_[4]\ : STD_LOGIC;
  signal \debounce_q_reg_n_0_[5]\ : STD_LOGIC;
  signal \debounce_q_reg_n_0_[6]\ : STD_LOGIC;
  signal \debounce_q_reg_n_0_[7]\ : STD_LOGIC;
  signal \debounce_q_reg_n_0_[8]\ : STD_LOGIC;
  signal \debounce_q_reg_n_0_[9]\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 9 downto 1 );
  signal pass_signal_i_1_n_0 : STD_LOGIC;
  signal pass_signal_i_2_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \debounce_q[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \debounce_q[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \debounce_q[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \debounce_q[5]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \debounce_q[7]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \debounce_q[7]_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \debounce_q[9]_i_12\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \debounce_q[9]_i_13\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \debounce_q[9]_i_5\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of pass_signal_i_2 : label is "soft_lutpair3";
begin
  CLK <= \^clk\;
\debounce_q[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[0]\,
      O => debounce_p(0)
    );
\debounce_q[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \debounce_q[9]_i_4_n_0\,
      I1 => \debounce_q_reg_n_0_[0]\,
      I2 => \debounce_q_reg_n_0_[1]\,
      O => p_0_in(1)
    );
\debounce_q[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A96A"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[2]\,
      I1 => \debounce_q_reg_n_0_[0]\,
      I2 => \debounce_q_reg_n_0_[1]\,
      I3 => \debounce_q[9]_i_4_n_0\,
      O => \debounce_q[2]_i_1_n_0\
    );
\debounce_q[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA96AAA"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[3]\,
      I1 => \debounce_q_reg_n_0_[1]\,
      I2 => \debounce_q_reg_n_0_[0]\,
      I3 => \debounce_q_reg_n_0_[2]\,
      I4 => \debounce_q[9]_i_4_n_0\,
      O => p_0_in(3)
    );
\debounce_q[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9AAAAAAAAAAAAAA6"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[4]\,
      I1 => \debounce_q[9]_i_4_n_0\,
      I2 => \debounce_q_reg_n_0_[2]\,
      I3 => \debounce_q_reg_n_0_[0]\,
      I4 => \debounce_q_reg_n_0_[1]\,
      I5 => \debounce_q_reg_n_0_[3]\,
      O => p_0_in(4)
    );
\debounce_q[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA9AA59A"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[5]\,
      I1 => \debounce_q[9]_i_5_n_0\,
      I2 => \debounce_q[9]_i_4_n_0\,
      I3 => \debounce_q_reg_n_0_[4]\,
      I4 => \debounce_q[7]_i_3_n_0\,
      O => p_0_in(5)
    );
\debounce_q[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA69AAA9AA6"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[6]\,
      I1 => \debounce_q[9]_i_4_n_0\,
      I2 => \debounce_q_reg_n_0_[5]\,
      I3 => \debounce_q_reg_n_0_[4]\,
      I4 => \debounce_q[9]_i_5_n_0\,
      I5 => \debounce_q[7]_i_3_n_0\,
      O => \debounce_q[6]_i_1_n_0\
    );
\debounce_q[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA6AAA6AAA699A6"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[7]\,
      I1 => \debounce_q[9]_i_4_n_0\,
      I2 => \debounce_q[8]_i_2_n_0\,
      I3 => \debounce_q_reg_n_0_[6]\,
      I4 => \debounce_q[7]_i_2_n_0\,
      I5 => \debounce_q[7]_i_3_n_0\,
      O => p_0_in(7)
    );
\debounce_q[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[5]\,
      I1 => \debounce_q_reg_n_0_[4]\,
      O => \debounce_q[7]_i_2_n_0\
    );
\debounce_q[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[3]\,
      I1 => \debounce_q_reg_n_0_[1]\,
      I2 => \debounce_q_reg_n_0_[0]\,
      I3 => \debounce_q_reg_n_0_[2]\,
      O => \debounce_q[7]_i_3_n_0\
    );
\debounce_q[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAA9AAAA55A9AA"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[8]\,
      I1 => \debounce_q_reg_n_0_[6]\,
      I2 => \debounce_q[8]_i_2_n_0\,
      I3 => \debounce_q[9]_i_4_n_0\,
      I4 => \debounce_q_reg_n_0_[7]\,
      I5 => \debounce_q[9]_i_7_n_0\,
      O => p_0_in(8)
    );
\debounce_q[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[2]\,
      I1 => \debounce_q_reg_n_0_[0]\,
      I2 => \debounce_q_reg_n_0_[1]\,
      I3 => \debounce_q_reg_n_0_[3]\,
      I4 => \debounce_q_reg_n_0_[4]\,
      I5 => \debounce_q_reg_n_0_[5]\,
      O => \debounce_q[8]_i_2_n_0\
    );
\debounce_q[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A8A8AAA"
    )
        port map (
      I0 => \debounce_q[9]_i_4_n_0\,
      I1 => start_stop_button_i_IBUF,
      I2 => \^clk\,
      I3 => \debounce_q[9]_i_5_n_0\,
      I4 => \debounce_q[9]_i_6_n_0\,
      O => \debounce_q[9]_i_1_n_0\
    );
\debounce_q[9]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[7]\,
      I1 => \debounce_q_reg_n_0_[8]\,
      I2 => \debounce_q_reg_n_0_[6]\,
      I3 => \debounce_q_reg_n_0_[9]\,
      O => \debounce_q[9]_i_11_n_0\
    );
\debounce_q[9]_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[2]\,
      I1 => \debounce_q_reg_n_0_[0]\,
      I2 => \debounce_q_reg_n_0_[1]\,
      O => \debounce_q[9]_i_12_n_0\
    );
\debounce_q[9]_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[1]\,
      I1 => \debounce_q_reg_n_0_[0]\,
      O => \debounce_q[9]_i_13_n_0\
    );
\debounce_q[9]_i_14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[4]\,
      I1 => \debounce_q_reg_n_0_[5]\,
      I2 => \debounce_q_reg_n_0_[3]\,
      O => \debounce_q[9]_i_14_n_0\
    );
\debounce_q[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9A9A969AAAAAA6A"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[9]\,
      I1 => \debounce_q_reg_n_0_[7]\,
      I2 => \debounce_q_reg_n_0_[8]\,
      I3 => \debounce_q[9]_i_7_n_0\,
      I4 => \debounce_q[9]_i_4_n_0\,
      I5 => \debounce_q[9]_i_8_n_0\,
      O => p_0_in(9)
    );
\debounce_q[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00400000FFFFFFFF"
    )
        port map (
      I0 => \debounce_q[9]_i_11_n_0\,
      I1 => \debounce_q_reg_n_0_[3]\,
      I2 => \debounce_q_reg_n_0_[5]\,
      I3 => \debounce_q_reg_n_0_[4]\,
      I4 => \debounce_q[9]_i_12_n_0\,
      I5 => start_stop_button_i_IBUF,
      O => \debounce_q[9]_i_4_n_0\
    );
\debounce_q[9]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[3]\,
      I1 => \debounce_q_reg_n_0_[1]\,
      I2 => \debounce_q_reg_n_0_[0]\,
      I3 => \debounce_q_reg_n_0_[2]\,
      O => \debounce_q[9]_i_5_n_0\
    );
\debounce_q[9]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[7]\,
      I1 => \debounce_q_reg_n_0_[8]\,
      I2 => \debounce_q_reg_n_0_[9]\,
      I3 => \debounce_q_reg_n_0_[6]\,
      I4 => \debounce_q_reg_n_0_[5]\,
      I5 => \debounce_q_reg_n_0_[4]\,
      O => \debounce_q[9]_i_6_n_0\
    );
\debounce_q[9]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[2]\,
      I1 => \debounce_q[9]_i_13_n_0\,
      I2 => \debounce_q_reg_n_0_[3]\,
      I3 => \debounce_q_reg_n_0_[6]\,
      I4 => \debounce_q_reg_n_0_[5]\,
      I5 => \debounce_q_reg_n_0_[4]\,
      O => \debounce_q[9]_i_7_n_0\
    );
\debounce_q[9]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000555D"
    )
        port map (
      I0 => start_stop_button_i_IBUF,
      I1 => \debounce_q[9]_i_12_n_0\,
      I2 => \debounce_q[9]_i_14_n_0\,
      I3 => \debounce_q[9]_i_11_n_0\,
      I4 => \debounce_q[8]_i_2_n_0\,
      I5 => \debounce_q_reg_n_0_[6]\,
      O => \debounce_q[9]_i_8_n_0\
    );
\debounce_q_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_debounce,
      CE => '1',
      D => debounce_p(0),
      Q => \debounce_q_reg_n_0_[0]\,
      R => \debounce_q[9]_i_1_n_0\
    );
\debounce_q_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_debounce,
      CE => '1',
      D => p_0_in(1),
      Q => \debounce_q_reg_n_0_[1]\,
      R => \debounce_q[9]_i_1_n_0\
    );
\debounce_q_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_debounce,
      CE => '1',
      D => \debounce_q[2]_i_1_n_0\,
      Q => \debounce_q_reg_n_0_[2]\,
      R => \debounce_q[9]_i_1_n_0\
    );
\debounce_q_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_debounce,
      CE => '1',
      D => p_0_in(3),
      Q => \debounce_q_reg_n_0_[3]\,
      R => \debounce_q[9]_i_1_n_0\
    );
\debounce_q_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_debounce,
      CE => '1',
      D => p_0_in(4),
      Q => \debounce_q_reg_n_0_[4]\,
      R => \debounce_q[9]_i_1_n_0\
    );
\debounce_q_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_debounce,
      CE => '1',
      D => p_0_in(5),
      Q => \debounce_q_reg_n_0_[5]\,
      R => \debounce_q[9]_i_1_n_0\
    );
\debounce_q_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_debounce,
      CE => '1',
      D => \debounce_q[6]_i_1_n_0\,
      Q => \debounce_q_reg_n_0_[6]\,
      R => \debounce_q[9]_i_1_n_0\
    );
\debounce_q_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_debounce,
      CE => '1',
      D => p_0_in(7),
      Q => \debounce_q_reg_n_0_[7]\,
      R => \debounce_q[9]_i_1_n_0\
    );
\debounce_q_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_debounce,
      CE => '1',
      D => p_0_in(8),
      Q => \debounce_q_reg_n_0_[8]\,
      R => \debounce_q[9]_i_1_n_0\
    );
\debounce_q_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_debounce,
      CE => '1',
      D => p_0_in(9),
      Q => \debounce_q_reg_n_0_[9]\,
      R => \debounce_q[9]_i_1_n_0\
    );
div: entity work.\divider__parameterized3\
     port map (
      CLK => clk_debounce,
      clk_i_IBUF => clk_i_IBUF
    );
pass_signal_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0CCC08FF0CCC08CC"
    )
        port map (
      I0 => \debounce_q[9]_i_5_n_0\,
      I1 => \^clk\,
      I2 => start_stop_button_i_IBUF,
      I3 => \debounce_q[9]_i_4_n_0\,
      I4 => \debounce_q[9]_i_6_n_0\,
      I5 => pass_signal_i_2_n_0,
      O => pass_signal_i_1_n_0
    );
pass_signal_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \debounce_q_reg_n_0_[2]\,
      I1 => \debounce_q_reg_n_0_[3]\,
      I2 => \debounce_q_reg_n_0_[1]\,
      I3 => \debounce_q_reg_n_0_[0]\,
      O => pass_signal_i_2_n_0
    );
pass_signal_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_debounce,
      CE => '1',
      D => pass_signal_i_1_n_0,
      Q => \^clk\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity display is
  port (
    an_state : out STD_LOGIC_VECTOR ( 1 downto 0 );
    led7_an_o_OBUF : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \FSM_sequential_an_state_reg[0]_0\ : out STD_LOGIC;
    \FSM_sequential_an_state_reg[1]_0\ : out STD_LOGIC;
    \FSM_sequential_an_state_reg[0]_1\ : out STD_LOGIC;
    clk_i_IBUF : in STD_LOGIC
  );
end display;

architecture STRUCTURE of display is
  signal \^an_state\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal mux_clk : STD_LOGIC;
  signal p_0_out : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_an_state[1]_i_1\ : label is "soft_lutpair5";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_an_state_reg[0]\ : label is "iSTATE:11,iSTATE0:101,iSTATE1:00,iSTATE2:01,iSTATE3:10,";
  attribute FSM_ENCODED_STATES of \FSM_sequential_an_state_reg[1]\ : label is "iSTATE:11,iSTATE0:101,iSTATE1:00,iSTATE2:01,iSTATE3:10,";
  attribute SOFT_HLUTNM of \led7_an_o_OBUF[0]_inst_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \led7_an_o_OBUF[1]_inst_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \led7_an_o_OBUF[2]_inst_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \led7_an_o_OBUF[3]_inst_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \led7_seg_o_OBUF[7]_inst_i_5\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \led7_seg_o_OBUF[7]_inst_i_8\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \led7_seg_o_OBUF[7]_inst_i_9\ : label is "soft_lutpair6";
begin
  an_state(1 downto 0) <= \^an_state\(1 downto 0);
\FSM_sequential_an_state[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^an_state\(0),
      O => p_0_out(0)
    );
\FSM_sequential_an_state[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^an_state\(0),
      I1 => \^an_state\(1),
      O => p_0_out(1)
    );
\FSM_sequential_an_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => mux_clk,
      CE => '1',
      D => p_0_out(0),
      Q => \^an_state\(0),
      R => '0'
    );
\FSM_sequential_an_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => mux_clk,
      CE => '1',
      D => p_0_out(1),
      Q => \^an_state\(1),
      R => '0'
    );
div: entity work.divider
     port map (
      clk_i_IBUF => clk_i_IBUF,
      mux_clk => mux_clk
    );
\led7_an_o_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^an_state\(0),
      I1 => \^an_state\(1),
      O => led7_an_o_OBUF(0)
    );
\led7_an_o_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^an_state\(1),
      I1 => \^an_state\(0),
      O => led7_an_o_OBUF(1)
    );
\led7_an_o_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^an_state\(0),
      I1 => \^an_state\(1),
      O => led7_an_o_OBUF(2)
    );
\led7_an_o_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^an_state\(1),
      I1 => \^an_state\(0),
      O => led7_an_o_OBUF(3)
    );
\led7_seg_o_OBUF[7]_inst_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^an_state\(0),
      I1 => \^an_state\(1),
      O => \FSM_sequential_an_state_reg[0]_1\
    );
\led7_seg_o_OBUF[7]_inst_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^an_state\(1),
      I1 => \^an_state\(0),
      O => \FSM_sequential_an_state_reg[1]_0\
    );
\led7_seg_o_OBUF[7]_inst_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^an_state\(0),
      I1 => \^an_state\(1),
      O => \FSM_sequential_an_state_reg[0]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity stopwatch is
  port (
    led7_seg_o_OBUF : out STD_LOGIC_VECTOR ( 6 downto 0 );
    clk_i_IBUF : in STD_LOGIC;
    an_state : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \led7_seg_o_OBUF[7]_inst_i_1_0\ : in STD_LOGIC;
    \led7_seg_o_OBUF[7]_inst_i_1_1\ : in STD_LOGIC;
    \led7_seg_o[7]\ : in STD_LOGIC;
    led7_an_o_OBUF : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC
  );
end stopwatch;

architecture STRUCTURE of stopwatch is
  signal \FSM_onehot_sw_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_sw_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_sw_state[3]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_sw_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_sw_state_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_sw_state_reg_n_0_[3]\ : STD_LOGIC;
  signal \^clk\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[1]_inst_i_2_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[1]_inst_i_3_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[1]_inst_i_4_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[1]_inst_i_5_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[2]_inst_i_2_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[2]_inst_i_3_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[2]_inst_i_4_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[2]_inst_i_5_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[3]_inst_i_2_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[3]_inst_i_3_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[3]_inst_i_4_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[3]_inst_i_5_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[4]_inst_i_2_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[4]_inst_i_3_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[4]_inst_i_4_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[4]_inst_i_5_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[5]_inst_i_2_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[5]_inst_i_3_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[5]_inst_i_4_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[5]_inst_i_5_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[6]_inst_i_2_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[6]_inst_i_3_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[6]_inst_i_4_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[6]_inst_i_5_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[7]_inst_i_2_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[7]_inst_i_3_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[7]_inst_i_4_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[7]_inst_i_6_n_0\ : STD_LOGIC;
  signal \led7_seg_o_OBUF[7]_inst_i_7_n_0\ : STD_LOGIC;
  signal millis_01 : STD_LOGIC;
  signal \millis_01[0]_i_1_n_0\ : STD_LOGIC;
  signal \millis_01[1]_i_1_n_0\ : STD_LOGIC;
  signal \millis_01[2]_i_1_n_0\ : STD_LOGIC;
  signal \millis_01[3]_i_1_n_0\ : STD_LOGIC;
  signal \millis_01_reg_n_0_[0]\ : STD_LOGIC;
  signal \millis_01_reg_n_0_[1]\ : STD_LOGIC;
  signal \millis_01_reg_n_0_[2]\ : STD_LOGIC;
  signal \millis_01_reg_n_0_[3]\ : STD_LOGIC;
  signal millis_10 : STD_LOGIC;
  signal \millis_10[0]_i_1_n_0\ : STD_LOGIC;
  signal \millis_10[1]_i_1_n_0\ : STD_LOGIC;
  signal \millis_10[2]_i_1_n_0\ : STD_LOGIC;
  signal \millis_10[3]_i_2_n_0\ : STD_LOGIC;
  signal \millis_10[3]_i_3_n_0\ : STD_LOGIC;
  signal \millis_10_reg_n_0_[0]\ : STD_LOGIC;
  signal \millis_10_reg_n_0_[1]\ : STD_LOGIC;
  signal \millis_10_reg_n_0_[2]\ : STD_LOGIC;
  signal \millis_10_reg_n_0_[3]\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal seconds_01 : STD_LOGIC;
  signal \seconds_01[0]_i_1_n_0\ : STD_LOGIC;
  signal \seconds_01[1]_i_1_n_0\ : STD_LOGIC;
  signal \seconds_01[2]_i_1_n_0\ : STD_LOGIC;
  signal \seconds_01[3]_i_2_n_0\ : STD_LOGIC;
  signal \seconds_01_reg_n_0_[0]\ : STD_LOGIC;
  signal \seconds_01_reg_n_0_[1]\ : STD_LOGIC;
  signal \seconds_01_reg_n_0_[2]\ : STD_LOGIC;
  signal \seconds_01_reg_n_0_[3]\ : STD_LOGIC;
  signal seconds_10 : STD_LOGIC;
  signal \seconds_10[0]_i_1_n_0\ : STD_LOGIC;
  signal \seconds_10[3]_i_1_n_0\ : STD_LOGIC;
  signal seconds_10_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_sw_state_reg[0]\ : label is "iSTATE:1000,iSTATE0:0010,iSTATE1:0100,iSTATE2:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_sw_state_reg[1]\ : label is "iSTATE:1000,iSTATE0:0010,iSTATE1:0100,iSTATE2:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_sw_state_reg[2]\ : label is "iSTATE:1000,iSTATE0:0010,iSTATE1:0100,iSTATE2:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_sw_state_reg[3]\ : label is "iSTATE:1000,iSTATE0:0010,iSTATE1:0100,iSTATE2:0001";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \led7_seg_o_OBUF[2]_inst_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \led7_seg_o_OBUF[2]_inst_i_3\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \led7_seg_o_OBUF[4]_inst_i_2\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \led7_seg_o_OBUF[4]_inst_i_5\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \led7_seg_o_OBUF[5]_inst_i_3\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \led7_seg_o_OBUF[5]_inst_i_4\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \led7_seg_o_OBUF[6]_inst_i_3\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \led7_seg_o_OBUF[6]_inst_i_4\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \led7_seg_o_OBUF[6]_inst_i_5\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \led7_seg_o_OBUF[7]_inst_i_4\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \millis_01[0]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \millis_01[1]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \millis_01[2]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \millis_01[3]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \millis_10[0]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \millis_10[1]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \millis_10[2]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \millis_10[3]_i_2\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \millis_10[3]_i_3\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \seconds_01[0]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \seconds_01[1]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \seconds_01[2]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \seconds_01[3]_i_2\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \seconds_10[1]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \seconds_10[2]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \seconds_10[3]_i_3\ : label is "soft_lutpair13";
begin
\FSM_onehot_sw_state[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => millis_01,
      I1 => \FSM_onehot_sw_state_reg_n_0_[1]\,
      O => \FSM_onehot_sw_state[1]_i_1_n_0\
    );
\FSM_onehot_sw_state[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \FSM_onehot_sw_state_reg_n_0_[1]\,
      I1 => millis_01,
      I2 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I3 => \FSM_onehot_sw_state_reg_n_0_[3]\,
      O => \FSM_onehot_sw_state[3]_i_1_n_0\
    );
\FSM_onehot_sw_state[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => seconds_10_reg(2),
      I1 => seconds_10_reg(0),
      I2 => seconds_10_reg(1),
      I3 => seconds_10_reg(3),
      O => \FSM_onehot_sw_state[3]_i_2_n_0\
    );
\FSM_onehot_sw_state_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_onehot_sw_state[3]_i_1_n_0\,
      D => '0',
      PRE => \FSM_onehot_sw_state[3]_i_2_n_0\,
      Q => \FSM_onehot_sw_state_reg_n_0_[0]\
    );
\FSM_onehot_sw_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \FSM_onehot_sw_state[3]_i_1_n_0\,
      CLR => \FSM_onehot_sw_state[3]_i_2_n_0\,
      D => \FSM_onehot_sw_state[1]_i_1_n_0\,
      Q => \FSM_onehot_sw_state_reg_n_0_[1]\
    );
\FSM_onehot_sw_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_onehot_sw_state[3]_i_1_n_0\,
      CLR => \FSM_onehot_sw_state[3]_i_2_n_0\,
      D => \FSM_onehot_sw_state_reg_n_0_[1]\,
      Q => millis_01
    );
\FSM_onehot_sw_state_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \FSM_onehot_sw_state[3]_i_1_n_0\,
      CLR => \FSM_onehot_sw_state[3]_i_2_n_0\,
      D => millis_01,
      Q => \FSM_onehot_sw_state_reg_n_0_[3]\
    );
div: entity work.\divider__parameterized1\
     port map (
      CLK => \^clk\,
      clk_i_IBUF => clk_i_IBUF
    );
\led7_seg_o_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAFFFB"
    )
        port map (
      I0 => \led7_seg_o_OBUF[1]_inst_i_2_n_0\,
      I1 => \led7_seg_o_OBUF[1]_inst_i_3_n_0\,
      I2 => \led7_seg_o_OBUF[1]_inst_i_4_n_0\,
      I3 => \led7_seg_o_OBUF[1]_inst_i_5_n_0\,
      I4 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      O => led7_seg_o_OBUF(0)
    );
\led7_seg_o_OBUF[1]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0302030002000003"
    )
        port map (
      I0 => \millis_01_reg_n_0_[0]\,
      I1 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I2 => led7_an_o_OBUF(0),
      I3 => \millis_01_reg_n_0_[2]\,
      I4 => \millis_01_reg_n_0_[1]\,
      I5 => \millis_01_reg_n_0_[3]\,
      O => \led7_seg_o_OBUF[1]_inst_i_2_n_0\
    );
\led7_seg_o_OBUF[1]_inst_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3337373737F7F3F3"
    )
        port map (
      I0 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I1 => \led7_seg_o_OBUF[7]_inst_i_1_1\,
      I2 => seconds_10_reg(3),
      I3 => seconds_10_reg(0),
      I4 => seconds_10_reg(1),
      I5 => seconds_10_reg(2),
      O => \led7_seg_o_OBUF[1]_inst_i_3_n_0\
    );
\led7_seg_o_OBUF[1]_inst_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2220202020000202"
    )
        port map (
      I0 => an_state(0),
      I1 => an_state(1),
      I2 => \millis_10_reg_n_0_[3]\,
      I3 => \millis_10_reg_n_0_[0]\,
      I4 => \millis_10_reg_n_0_[1]\,
      I5 => \millis_10_reg_n_0_[2]\,
      O => \led7_seg_o_OBUF[1]_inst_i_4_n_0\
    );
\led7_seg_o_OBUF[1]_inst_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222200020000022"
    )
        port map (
      I0 => an_state(1),
      I1 => an_state(0),
      I2 => \seconds_01_reg_n_0_[0]\,
      I3 => \seconds_01_reg_n_0_[1]\,
      I4 => \seconds_01_reg_n_0_[3]\,
      I5 => \seconds_01_reg_n_0_[2]\,
      O => \led7_seg_o_OBUF[1]_inst_i_5_n_0\
    );
\led7_seg_o_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0426"
    )
        port map (
      I0 => an_state(0),
      I1 => an_state(1),
      I2 => \led7_seg_o_OBUF[2]_inst_i_2_n_0\,
      I3 => \led7_seg_o_OBUF[2]_inst_i_3_n_0\,
      I4 => \led7_seg_o_OBUF[2]_inst_i_4_n_0\,
      I5 => \led7_seg_o_OBUF[2]_inst_i_5_n_0\,
      O => led7_seg_o_OBUF(1)
    );
\led7_seg_o_OBUF[2]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00030071"
    )
        port map (
      I0 => \seconds_01_reg_n_0_[0]\,
      I1 => \seconds_01_reg_n_0_[1]\,
      I2 => \seconds_01_reg_n_0_[2]\,
      I3 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I4 => \seconds_01_reg_n_0_[3]\,
      O => \led7_seg_o_OBUF[2]_inst_i_2_n_0\
    );
\led7_seg_o_OBUF[2]_inst_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0011002B"
    )
        port map (
      I0 => \millis_10_reg_n_0_[2]\,
      I1 => \millis_10_reg_n_0_[1]\,
      I2 => \millis_10_reg_n_0_[0]\,
      I3 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I4 => \millis_10_reg_n_0_[3]\,
      O => \led7_seg_o_OBUF[2]_inst_i_3_n_0\
    );
\led7_seg_o_OBUF[2]_inst_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5554555455455504"
    )
        port map (
      I0 => led7_an_o_OBUF(0),
      I1 => \millis_01_reg_n_0_[1]\,
      I2 => \millis_01_reg_n_0_[2]\,
      I3 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I4 => \millis_01_reg_n_0_[0]\,
      I5 => \millis_01_reg_n_0_[3]\,
      O => \led7_seg_o_OBUF[2]_inst_i_4_n_0\
    );
\led7_seg_o_OBUF[2]_inst_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCC8C0CC08"
    )
        port map (
      I0 => seconds_10_reg(0),
      I1 => \led7_seg_o_OBUF[7]_inst_i_1_1\,
      I2 => seconds_10_reg(3),
      I3 => seconds_10_reg(1),
      I4 => seconds_10_reg(2),
      I5 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      O => \led7_seg_o_OBUF[2]_inst_i_5_n_0\
    );
\led7_seg_o_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FF02"
    )
        port map (
      I0 => \led7_seg_o_OBUF[3]_inst_i_2_n_0\,
      I1 => \led7_seg_o_OBUF[3]_inst_i_3_n_0\,
      I2 => \led7_seg_o_OBUF[3]_inst_i_4_n_0\,
      I3 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I4 => \led7_seg_o_OBUF[3]_inst_i_5_n_0\,
      O => led7_seg_o_OBUF(2)
    );
\led7_seg_o_OBUF[3]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEBAFFFFFFFF"
    )
        port map (
      I0 => \seconds_01_reg_n_0_[0]\,
      I1 => \seconds_01_reg_n_0_[1]\,
      I2 => \seconds_01_reg_n_0_[2]\,
      I3 => \seconds_01_reg_n_0_[3]\,
      I4 => an_state(0),
      I5 => an_state(1),
      O => \led7_seg_o_OBUF[3]_inst_i_2_n_0\
    );
\led7_seg_o_OBUF[3]_inst_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000404040004"
    )
        port map (
      I0 => \millis_10_reg_n_0_[0]\,
      I1 => an_state(0),
      I2 => an_state(1),
      I3 => \millis_10_reg_n_0_[2]\,
      I4 => \millis_10_reg_n_0_[1]\,
      I5 => \millis_10_reg_n_0_[3]\,
      O => \led7_seg_o_OBUF[3]_inst_i_3_n_0\
    );
\led7_seg_o_OBUF[3]_inst_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000808080008"
    )
        port map (
      I0 => an_state(1),
      I1 => an_state(0),
      I2 => seconds_10_reg(0),
      I3 => seconds_10_reg(2),
      I4 => seconds_10_reg(1),
      I5 => seconds_10_reg(3),
      O => \led7_seg_o_OBUF[3]_inst_i_4_n_0\
    );
\led7_seg_o_OBUF[3]_inst_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000047"
    )
        port map (
      I0 => \millis_01_reg_n_0_[3]\,
      I1 => \millis_01_reg_n_0_[1]\,
      I2 => \millis_01_reg_n_0_[2]\,
      I3 => \millis_01_reg_n_0_[0]\,
      I4 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I5 => led7_an_o_OBUF(0),
      O => \led7_seg_o_OBUF[3]_inst_i_5_n_0\
    );
\led7_seg_o_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCFDFCFCFFFDFCFC"
    )
        port map (
      I0 => \led7_seg_o_OBUF[4]_inst_i_2_n_0\,
      I1 => \led7_seg_o_OBUF[4]_inst_i_3_n_0\,
      I2 => \led7_seg_o_OBUF[4]_inst_i_4_n_0\,
      I3 => an_state(1),
      I4 => an_state(0),
      I5 => \led7_seg_o_OBUF[4]_inst_i_5_n_0\,
      O => led7_seg_o_OBUF(3)
    );
\led7_seg_o_OBUF[4]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01101123"
    )
        port map (
      I0 => \millis_10_reg_n_0_[3]\,
      I1 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I2 => \millis_10_reg_n_0_[0]\,
      I3 => \millis_10_reg_n_0_[1]\,
      I4 => \millis_10_reg_n_0_[2]\,
      O => \led7_seg_o_OBUF[4]_inst_i_2_n_0\
    );
\led7_seg_o_OBUF[4]_inst_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFEE94"
    )
        port map (
      I0 => \millis_01_reg_n_0_[1]\,
      I1 => \millis_01_reg_n_0_[2]\,
      I2 => \millis_01_reg_n_0_[0]\,
      I3 => \millis_01_reg_n_0_[3]\,
      I4 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I5 => led7_an_o_OBUF(0),
      O => \led7_seg_o_OBUF[4]_inst_i_3_n_0\
    );
\led7_seg_o_OBUF[4]_inst_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAA0AA82AA08"
    )
        port map (
      I0 => \led7_seg_o_OBUF[7]_inst_i_1_0\,
      I1 => \seconds_01_reg_n_0_[0]\,
      I2 => \seconds_01_reg_n_0_[1]\,
      I3 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I4 => \seconds_01_reg_n_0_[2]\,
      I5 => \seconds_01_reg_n_0_[3]\,
      O => \led7_seg_o_OBUF[4]_inst_i_4_n_0\
    );
\led7_seg_o_OBUF[4]_inst_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0003006D"
    )
        port map (
      I0 => seconds_10_reg(0),
      I1 => seconds_10_reg(1),
      I2 => seconds_10_reg(2),
      I3 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I4 => seconds_10_reg(3),
      O => \led7_seg_o_OBUF[4]_inst_i_5_n_0\
    );
\led7_seg_o_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFABAAFBAA"
    )
        port map (
      I0 => \led7_seg_o_OBUF[5]_inst_i_2_n_0\,
      I1 => \led7_seg_o_OBUF[5]_inst_i_3_n_0\,
      I2 => an_state(1),
      I3 => an_state(0),
      I4 => \led7_seg_o_OBUF[5]_inst_i_4_n_0\,
      I5 => \led7_seg_o_OBUF[5]_inst_i_5_n_0\,
      O => led7_seg_o_OBUF(4)
    );
\led7_seg_o_OBUF[5]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3333333330302022"
    )
        port map (
      I0 => \millis_01_reg_n_0_[1]\,
      I1 => led7_an_o_OBUF(0),
      I2 => \millis_01_reg_n_0_[3]\,
      I3 => \millis_01_reg_n_0_[0]\,
      I4 => \millis_01_reg_n_0_[2]\,
      I5 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      O => \led7_seg_o_OBUF[5]_inst_i_2_n_0\
    );
\led7_seg_o_OBUF[5]_inst_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"11131013"
    )
        port map (
      I0 => \millis_10_reg_n_0_[3]\,
      I1 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I2 => \millis_10_reg_n_0_[2]\,
      I3 => \millis_10_reg_n_0_[1]\,
      I4 => \millis_10_reg_n_0_[0]\,
      O => \led7_seg_o_OBUF[5]_inst_i_3_n_0\
    );
\led7_seg_o_OBUF[5]_inst_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0302030F"
    )
        port map (
      I0 => seconds_10_reg(0),
      I1 => seconds_10_reg(3),
      I2 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I3 => seconds_10_reg(2),
      I4 => seconds_10_reg(1),
      O => \led7_seg_o_OBUF[5]_inst_i_4_n_0\
    );
\led7_seg_o_OBUF[5]_inst_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A8A8A8A0A8AAA8A0"
    )
        port map (
      I0 => \led7_seg_o_OBUF[7]_inst_i_1_0\,
      I1 => \seconds_01_reg_n_0_[3]\,
      I2 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I3 => \seconds_01_reg_n_0_[2]\,
      I4 => \seconds_01_reg_n_0_[1]\,
      I5 => \seconds_01_reg_n_0_[0]\,
      O => \led7_seg_o_OBUF[5]_inst_i_5_n_0\
    );
\led7_seg_o_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABAAFBAFABAFFBA"
    )
        port map (
      I0 => \led7_seg_o_OBUF[6]_inst_i_2_n_0\,
      I1 => \led7_seg_o_OBUF[6]_inst_i_3_n_0\,
      I2 => an_state(1),
      I3 => an_state(0),
      I4 => \led7_seg_o_OBUF[6]_inst_i_4_n_0\,
      I5 => \led7_seg_o_OBUF[6]_inst_i_5_n_0\,
      O => led7_seg_o_OBUF(5)
    );
\led7_seg_o_OBUF[6]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3322333233303320"
    )
        port map (
      I0 => \millis_01_reg_n_0_[3]\,
      I1 => led7_an_o_OBUF(0),
      I2 => \millis_01_reg_n_0_[2]\,
      I3 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I4 => \millis_01_reg_n_0_[0]\,
      I5 => \millis_01_reg_n_0_[1]\,
      O => \led7_seg_o_OBUF[6]_inst_i_2_n_0\
    );
\led7_seg_o_OBUF[6]_inst_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00032133"
    )
        port map (
      I0 => \seconds_01_reg_n_0_[0]\,
      I1 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I2 => \seconds_01_reg_n_0_[1]\,
      I3 => \seconds_01_reg_n_0_[2]\,
      I4 => \seconds_01_reg_n_0_[3]\,
      O => \led7_seg_o_OBUF[6]_inst_i_3_n_0\
    );
\led7_seg_o_OBUF[6]_inst_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"11010313"
    )
        port map (
      I0 => \millis_10_reg_n_0_[3]\,
      I1 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I2 => \millis_10_reg_n_0_[2]\,
      I3 => \millis_10_reg_n_0_[0]\,
      I4 => \millis_10_reg_n_0_[1]\,
      O => \led7_seg_o_OBUF[6]_inst_i_4_n_0\
    );
\led7_seg_o_OBUF[6]_inst_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00032313"
    )
        port map (
      I0 => seconds_10_reg(0),
      I1 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I2 => seconds_10_reg(2),
      I3 => seconds_10_reg(1),
      I4 => seconds_10_reg(3),
      O => \led7_seg_o_OBUF[6]_inst_i_5_n_0\
    );
\led7_seg_o_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEBAA"
    )
        port map (
      I0 => \led7_seg_o_OBUF[7]_inst_i_2_n_0\,
      I1 => \led7_seg_o_OBUF[7]_inst_i_3_n_0\,
      I2 => \led7_seg_o_OBUF[7]_inst_i_4_n_0\,
      I3 => \led7_seg_o[7]\,
      I4 => \led7_seg_o_OBUF[7]_inst_i_6_n_0\,
      I5 => \led7_seg_o_OBUF[7]_inst_i_7_n_0\,
      O => led7_seg_o_OBUF(6)
    );
\led7_seg_o_OBUF[7]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFF10000FFC2"
    )
        port map (
      I0 => \millis_01_reg_n_0_[0]\,
      I1 => \millis_01_reg_n_0_[1]\,
      I2 => \millis_01_reg_n_0_[3]\,
      I3 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I4 => led7_an_o_OBUF(0),
      I5 => \millis_01_reg_n_0_[2]\,
      O => \led7_seg_o_OBUF[7]_inst_i_2_n_0\
    );
\led7_seg_o_OBUF[7]_inst_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I1 => \millis_10_reg_n_0_[1]\,
      I2 => \millis_10_reg_n_0_[2]\,
      O => \led7_seg_o_OBUF[7]_inst_i_3_n_0\
    );
\led7_seg_o_OBUF[7]_inst_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"000E"
    )
        port map (
      I0 => \millis_10_reg_n_0_[1]\,
      I1 => \millis_10_reg_n_0_[0]\,
      I2 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      I3 => \millis_10_reg_n_0_[3]\,
      O => \led7_seg_o_OBUF[7]_inst_i_4_n_0\
    );
\led7_seg_o_OBUF[7]_inst_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAA8A80208"
    )
        port map (
      I0 => \led7_seg_o_OBUF[7]_inst_i_1_0\,
      I1 => \seconds_01_reg_n_0_[2]\,
      I2 => \seconds_01_reg_n_0_[1]\,
      I3 => \seconds_01_reg_n_0_[0]\,
      I4 => \seconds_01_reg_n_0_[3]\,
      I5 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      O => \led7_seg_o_OBUF[7]_inst_i_6_n_0\
    );
\led7_seg_o_OBUF[7]_inst_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAA880028"
    )
        port map (
      I0 => \led7_seg_o_OBUF[7]_inst_i_1_1\,
      I1 => seconds_10_reg(2),
      I2 => seconds_10_reg(0),
      I3 => seconds_10_reg(1),
      I4 => seconds_10_reg(3),
      I5 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      O => \led7_seg_o_OBUF[7]_inst_i_7_n_0\
    );
\millis_01[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00BF"
    )
        port map (
      I0 => \millis_01_reg_n_0_[2]\,
      I1 => \millis_01_reg_n_0_[3]\,
      I2 => \millis_01_reg_n_0_[1]\,
      I3 => \millis_01_reg_n_0_[0]\,
      O => \millis_01[0]_i_1_n_0\
    );
\millis_01[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0FB0"
    )
        port map (
      I0 => \millis_01_reg_n_0_[2]\,
      I1 => \millis_01_reg_n_0_[3]\,
      I2 => \millis_01_reg_n_0_[1]\,
      I3 => \millis_01_reg_n_0_[0]\,
      O => \millis_01[1]_i_1_n_0\
    );
\millis_01[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \millis_01_reg_n_0_[2]\,
      I1 => \millis_01_reg_n_0_[1]\,
      I2 => \millis_01_reg_n_0_[0]\,
      O => \millis_01[2]_i_1_n_0\
    );
\millis_01[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6C8C"
    )
        port map (
      I0 => \millis_01_reg_n_0_[2]\,
      I1 => \millis_01_reg_n_0_[3]\,
      I2 => \millis_01_reg_n_0_[1]\,
      I3 => \millis_01_reg_n_0_[0]\,
      O => \millis_01[3]_i_1_n_0\
    );
\millis_01_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => millis_01,
      D => \millis_01[0]_i_1_n_0\,
      Q => \millis_01_reg_n_0_[0]\,
      R => \FSM_onehot_sw_state_reg_n_0_[1]\
    );
\millis_01_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => millis_01,
      D => \millis_01[1]_i_1_n_0\,
      Q => \millis_01_reg_n_0_[1]\,
      R => \FSM_onehot_sw_state_reg_n_0_[1]\
    );
\millis_01_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => millis_01,
      D => \millis_01[2]_i_1_n_0\,
      Q => \millis_01_reg_n_0_[2]\,
      R => \FSM_onehot_sw_state_reg_n_0_[1]\
    );
\millis_01_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => millis_01,
      D => \millis_01[3]_i_1_n_0\,
      Q => \millis_01_reg_n_0_[3]\,
      R => \FSM_onehot_sw_state_reg_n_0_[1]\
    );
\millis_10[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0B0F"
    )
        port map (
      I0 => \millis_10_reg_n_0_[2]\,
      I1 => \millis_10_reg_n_0_[3]\,
      I2 => \millis_10_reg_n_0_[0]\,
      I3 => \millis_10_reg_n_0_[1]\,
      O => \millis_10[0]_i_1_n_0\
    );
\millis_10[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0BF0"
    )
        port map (
      I0 => \millis_10_reg_n_0_[2]\,
      I1 => \millis_10_reg_n_0_[3]\,
      I2 => \millis_10_reg_n_0_[0]\,
      I3 => \millis_10_reg_n_0_[1]\,
      O => \millis_10[1]_i_1_n_0\
    );
\millis_10[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \millis_10_reg_n_0_[2]\,
      I1 => \millis_10_reg_n_0_[1]\,
      I2 => \millis_10_reg_n_0_[0]\,
      O => \millis_10[2]_i_1_n_0\
    );
\millis_10[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA00002000"
    )
        port map (
      I0 => millis_01,
      I1 => \millis_01_reg_n_0_[0]\,
      I2 => \millis_01_reg_n_0_[1]\,
      I3 => \millis_01_reg_n_0_[3]\,
      I4 => \millis_01_reg_n_0_[2]\,
      I5 => \millis_10[3]_i_3_n_0\,
      O => millis_10
    );
\millis_10[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"68CC"
    )
        port map (
      I0 => \millis_10_reg_n_0_[2]\,
      I1 => \millis_10_reg_n_0_[3]\,
      I2 => \millis_10_reg_n_0_[0]\,
      I3 => \millis_10_reg_n_0_[1]\,
      O => \millis_10[3]_i_2_n_0\
    );
\millis_10[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => \millis_10_reg_n_0_[1]\,
      I1 => \millis_10_reg_n_0_[0]\,
      I2 => \millis_10_reg_n_0_[3]\,
      I3 => \millis_10_reg_n_0_[2]\,
      O => \millis_10[3]_i_3_n_0\
    );
\millis_10_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => millis_10,
      D => \millis_10[0]_i_1_n_0\,
      Q => \millis_10_reg_n_0_[0]\,
      R => \FSM_onehot_sw_state_reg_n_0_[1]\
    );
\millis_10_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => millis_10,
      D => \millis_10[1]_i_1_n_0\,
      Q => \millis_10_reg_n_0_[1]\,
      R => \FSM_onehot_sw_state_reg_n_0_[1]\
    );
\millis_10_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => millis_10,
      D => \millis_10[2]_i_1_n_0\,
      Q => \millis_10_reg_n_0_[2]\,
      R => \FSM_onehot_sw_state_reg_n_0_[1]\
    );
\millis_10_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => millis_10,
      D => \millis_10[3]_i_2_n_0\,
      Q => \millis_10_reg_n_0_[3]\,
      R => \FSM_onehot_sw_state_reg_n_0_[1]\
    );
\seconds_01[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00BF"
    )
        port map (
      I0 => \seconds_01_reg_n_0_[2]\,
      I1 => \seconds_01_reg_n_0_[3]\,
      I2 => \seconds_01_reg_n_0_[1]\,
      I3 => \seconds_01_reg_n_0_[0]\,
      O => \seconds_01[0]_i_1_n_0\
    );
\seconds_01[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0BF0"
    )
        port map (
      I0 => \seconds_01_reg_n_0_[2]\,
      I1 => \seconds_01_reg_n_0_[3]\,
      I2 => \seconds_01_reg_n_0_[0]\,
      I3 => \seconds_01_reg_n_0_[1]\,
      O => \seconds_01[1]_i_1_n_0\
    );
\seconds_01[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \seconds_01_reg_n_0_[1]\,
      I1 => \seconds_01_reg_n_0_[0]\,
      I2 => \seconds_01_reg_n_0_[2]\,
      O => \seconds_01[2]_i_1_n_0\
    );
\seconds_01[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888888A88888"
    )
        port map (
      I0 => millis_01,
      I1 => \millis_10[3]_i_3_n_0\,
      I2 => \seconds_01_reg_n_0_[1]\,
      I3 => \seconds_01_reg_n_0_[0]\,
      I4 => \seconds_01_reg_n_0_[3]\,
      I5 => \seconds_01_reg_n_0_[2]\,
      O => seconds_01
    );
\seconds_01[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6F80"
    )
        port map (
      I0 => \seconds_01_reg_n_0_[2]\,
      I1 => \seconds_01_reg_n_0_[0]\,
      I2 => \seconds_01_reg_n_0_[1]\,
      I3 => \seconds_01_reg_n_0_[3]\,
      O => \seconds_01[3]_i_2_n_0\
    );
\seconds_01_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => seconds_01,
      D => \seconds_01[0]_i_1_n_0\,
      Q => \seconds_01_reg_n_0_[0]\,
      R => \FSM_onehot_sw_state_reg_n_0_[1]\
    );
\seconds_01_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => seconds_01,
      D => \seconds_01[1]_i_1_n_0\,
      Q => \seconds_01_reg_n_0_[1]\,
      R => \FSM_onehot_sw_state_reg_n_0_[1]\
    );
\seconds_01_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => seconds_01,
      D => \seconds_01[2]_i_1_n_0\,
      Q => \seconds_01_reg_n_0_[2]\,
      R => \FSM_onehot_sw_state_reg_n_0_[1]\
    );
\seconds_01_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => seconds_01,
      D => \seconds_01[3]_i_2_n_0\,
      Q => \seconds_01_reg_n_0_[3]\,
      R => \FSM_onehot_sw_state_reg_n_0_[1]\
    );
\seconds_10[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => seconds_10_reg(0),
      O => \seconds_10[0]_i_1_n_0\
    );
\seconds_10[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => seconds_10_reg(0),
      I1 => seconds_10_reg(1),
      O => p_0_in(1)
    );
\seconds_10[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => seconds_10_reg(2),
      I1 => seconds_10_reg(1),
      I2 => seconds_10_reg(0),
      O => p_0_in(2)
    );
\seconds_10[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \FSM_onehot_sw_state_reg_n_0_[1]\,
      I1 => millis_01,
      I2 => \FSM_onehot_sw_state_reg_n_0_[0]\,
      O => \seconds_10[3]_i_1_n_0\
    );
\seconds_10[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => millis_01,
      I1 => \seconds_01_reg_n_0_[2]\,
      I2 => \seconds_01_reg_n_0_[3]\,
      I3 => \seconds_01_reg_n_0_[0]\,
      I4 => \seconds_01_reg_n_0_[1]\,
      O => seconds_10
    );
\seconds_10[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => seconds_10_reg(3),
      I1 => seconds_10_reg(2),
      I2 => seconds_10_reg(0),
      I3 => seconds_10_reg(1),
      O => p_0_in(3)
    );
\seconds_10_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => seconds_10,
      D => \seconds_10[0]_i_1_n_0\,
      Q => seconds_10_reg(0),
      R => \seconds_10[3]_i_1_n_0\
    );
\seconds_10_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => seconds_10,
      D => p_0_in(1),
      Q => seconds_10_reg(1),
      R => \seconds_10[3]_i_1_n_0\
    );
\seconds_10_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => seconds_10,
      D => p_0_in(2),
      Q => seconds_10_reg(2),
      R => \seconds_10[3]_i_1_n_0\
    );
\seconds_10_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => seconds_10,
      D => p_0_in(3),
      Q => seconds_10_reg(3),
      R => \seconds_10[3]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top is
  port (
    clk_i : in STD_LOGIC;
    rst_i : in STD_LOGIC;
    start_stop_button_i : in STD_LOGIC;
    led7_an_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    led7_seg_o : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top : entity is true;
end top;

architecture STRUCTURE of top is
  signal an_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal button_internal : STD_LOGIC;
  signal clk_i_IBUF : STD_LOGIC;
  signal disp_n_6 : STD_LOGIC;
  signal disp_n_7 : STD_LOGIC;
  signal disp_n_8 : STD_LOGIC;
  signal led7_an_o_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal led7_seg_o_OBUF : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal start_stop_button_i_IBUF : STD_LOGIC;
begin
clk_i_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => clk_i,
      O => clk_i_IBUF
    );
deboun: entity work.debounce
     port map (
      CLK => button_internal,
      clk_i_IBUF => clk_i_IBUF,
      start_stop_button_i_IBUF => start_stop_button_i_IBUF
    );
disp: entity work.display
     port map (
      \FSM_sequential_an_state_reg[0]_0\ => disp_n_6,
      \FSM_sequential_an_state_reg[0]_1\ => disp_n_8,
      \FSM_sequential_an_state_reg[1]_0\ => disp_n_7,
      an_state(1 downto 0) => an_state(1 downto 0),
      clk_i_IBUF => clk_i_IBUF,
      led7_an_o_OBUF(3 downto 0) => led7_an_o_OBUF(3 downto 0)
    );
\led7_an_o_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led7_an_o_OBUF(0),
      O => led7_an_o(0)
    );
\led7_an_o_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led7_an_o_OBUF(1),
      O => led7_an_o(1)
    );
\led7_an_o_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led7_an_o_OBUF(2),
      O => led7_an_o(2)
    );
\led7_an_o_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led7_an_o_OBUF(3),
      O => led7_an_o(3)
    );
\led7_seg_o_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => led7_seg_o(0)
    );
\led7_seg_o_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led7_seg_o_OBUF(1),
      O => led7_seg_o(1)
    );
\led7_seg_o_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led7_seg_o_OBUF(2),
      O => led7_seg_o(2)
    );
\led7_seg_o_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led7_seg_o_OBUF(3),
      O => led7_seg_o(3)
    );
\led7_seg_o_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led7_seg_o_OBUF(4),
      O => led7_seg_o(4)
    );
\led7_seg_o_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led7_seg_o_OBUF(5),
      O => led7_seg_o(5)
    );
\led7_seg_o_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led7_seg_o_OBUF(6),
      O => led7_seg_o(6)
    );
\led7_seg_o_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => led7_seg_o_OBUF(7),
      O => led7_seg_o(7)
    );
start_stop_button_i_IBUF_inst: unisim.vcomponents.IBUF
    generic map(
      CCIO_EN => "TRUE"
    )
        port map (
      I => start_stop_button_i,
      O => start_stop_button_i_IBUF
    );
sw: entity work.stopwatch
     port map (
      CLK => button_internal,
      an_state(1 downto 0) => an_state(1 downto 0),
      clk_i_IBUF => clk_i_IBUF,
      led7_an_o_OBUF(0) => led7_an_o_OBUF(0),
      \led7_seg_o[7]\ => disp_n_8,
      led7_seg_o_OBUF(6 downto 0) => led7_seg_o_OBUF(7 downto 1),
      \led7_seg_o_OBUF[7]_inst_i_1_0\ => disp_n_7,
      \led7_seg_o_OBUF[7]_inst_i_1_1\ => disp_n_6
    );
end STRUCTURE;
