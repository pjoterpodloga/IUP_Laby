// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Apr  1 20:41:59 2023
// Host        : DESKTOP-G1E6JH8 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               J:/Kody/vhdl/IUP_Laby/VGA_2/VGA_2.sim/sim_1/synth/timing/xsim/tb_top_time_synth.v
// Design      : top
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module freq_divider
   (pixel_clk_o,
    CLK,
    pixel_clk_en);
  output pixel_clk_o;
  input CLK;
  input pixel_clk_en;

  wire CLK;
  wire clk_o_reg_i_1_n_0;
  wire clk_o_reg_i_3_n_0;
  wire [2:0]d_nq;
  wire \d_nq[0]_i_1_n_0 ;
  wire \d_nq[1]_i_1_n_0 ;
  wire \d_nq[2]_i_1_n_0 ;
  wire [2:0]d_pq;
  wire \d_pq[0]_i_1_n_0 ;
  wire \d_pq[1]_i_1_n_0 ;
  wire \d_pq[2]_i_1_n_0 ;
  wire d_reset;
  wire pixel_clk_en;
  wire pixel_clk_o;

  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    clk_o_reg
       (.CLR(d_reset),
        .D(clk_o_reg_i_1_n_0),
        .G(clk_o_reg_i_1_n_0),
        .GE(1'b1),
        .Q(pixel_clk_o));
  LUT6 #(
    .INIT(64'h0000000100011880)) 
    clk_o_reg_i_1
       (.I0(d_nq[0]),
        .I1(d_pq[0]),
        .I2(d_pq[1]),
        .I3(d_nq[1]),
        .I4(d_nq[2]),
        .I5(d_pq[2]),
        .O(clk_o_reg_i_1_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    clk_o_reg_i_2
       (.I0(clk_o_reg_i_3_n_0),
        .I1(pixel_clk_en),
        .O(d_reset));
  LUT6 #(
    .INIT(64'h0006600060000008)) 
    clk_o_reg_i_3
       (.I0(d_nq[2]),
        .I1(d_pq[2]),
        .I2(d_nq[0]),
        .I3(d_pq[0]),
        .I4(d_pq[1]),
        .I5(d_nq[1]),
        .O(clk_o_reg_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \d_nq[0]_i_1 
       (.I0(d_nq[0]),
        .O(\d_nq[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \d_nq[1]_i_1 
       (.I0(d_nq[0]),
        .I1(d_nq[1]),
        .O(\d_nq[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \d_nq[2]_i_1 
       (.I0(d_nq[0]),
        .I1(d_nq[1]),
        .I2(d_nq[2]),
        .O(\d_nq[2]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \d_nq_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(d_reset),
        .D(\d_nq[0]_i_1_n_0 ),
        .Q(d_nq[0]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \d_nq_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(d_reset),
        .D(\d_nq[1]_i_1_n_0 ),
        .Q(d_nq[1]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \d_nq_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(d_reset),
        .D(\d_nq[2]_i_1_n_0 ),
        .Q(d_nq[2]));
  LUT1 #(
    .INIT(2'h1)) 
    \d_pq[0]_i_1 
       (.I0(d_pq[0]),
        .O(\d_pq[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \d_pq[1]_i_1 
       (.I0(d_pq[0]),
        .I1(d_pq[1]),
        .O(\d_pq[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \d_pq[2]_i_1 
       (.I0(d_pq[0]),
        .I1(d_pq[1]),
        .I2(d_pq[2]),
        .O(\d_pq[2]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \d_pq_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(d_reset),
        .D(\d_pq[0]_i_1_n_0 ),
        .Q(d_pq[0]));
  FDCE #(
    .INIT(1'b0)) 
    \d_pq_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(d_reset),
        .D(\d_pq[1]_i_1_n_0 ),
        .Q(d_pq[1]));
  FDCE #(
    .INIT(1'b0)) 
    \d_pq_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(d_reset),
        .D(\d_pq[2]_i_1_n_0 ),
        .Q(d_pq[2]));
endmodule

module freq_divider_out
   (clk_pixel,
    B_o_OBUF,
    G_o_OBUF,
    R_o_OBUF,
    vsync_o_OBUF,
    \B_o[0] ,
    bg_img_state,
    sw_i_IBUF,
    \G_o[0] ,
    \R_o[0] ,
    douta,
    pixel_clk_o);
  output clk_pixel;
  output [0:0]B_o_OBUF;
  output [0:0]G_o_OBUF;
  output [0:0]R_o_OBUF;
  input vsync_o_OBUF;
  input \B_o[0] ;
  input bg_img_state;
  input [2:0]sw_i_IBUF;
  input \G_o[0] ;
  input \R_o[0] ;
  input [7:0]douta;
  input pixel_clk_o;

  wire \B_o[0] ;
  wire [0:0]B_o_OBUF;
  wire \B_o_OBUF[3]_inst_i_3_n_0 ;
  wire \G_o[0] ;
  wire [0:0]G_o_OBUF;
  wire \G_o_OBUF[3]_inst_i_3_n_0 ;
  wire \R_o[0] ;
  wire [0:0]R_o_OBUF;
  wire \R_o_OBUF[3]_inst_i_3_n_0 ;
  wire \R_o_OBUF[3]_inst_i_4_n_0 ;
  wire bg_img_state;
  wire clk_o_reg_i_1__0_n_0;
  wire clk_o_reg_i_2__0_n_0;
  wire clk_pixel;
  wire \d_nq[0]_i_1__0_n_0 ;
  wire \d_nq[1]_i_1__0_n_0 ;
  wire \d_nq_reg_n_0_[0] ;
  wire \d_nq_reg_n_0_[1] ;
  wire \d_pq[0]_i_1__0_n_0 ;
  wire \d_pq[1]_i_1__0_n_0 ;
  wire \d_pq_reg_n_0_[0] ;
  wire \d_pq_reg_n_0_[1] ;
  wire [7:0]douta;
  wire pixel_clk_o;
  wire [2:0]sw_i_IBUF;
  wire vsync_o_OBUF;

  LUT4 #(
    .INIT(16'h02A2)) 
    \B_o_OBUF[3]_inst_i_1 
       (.I0(vsync_o_OBUF),
        .I1(\B_o[0] ),
        .I2(bg_img_state),
        .I3(\B_o_OBUF[3]_inst_i_3_n_0 ),
        .O(B_o_OBUF));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \B_o_OBUF[3]_inst_i_3 
       (.I0(douta[4]),
        .I1(douta[7]),
        .I2(\R_o_OBUF[3]_inst_i_4_n_0 ),
        .I3(douta[3]),
        .I4(douta[0]),
        .O(\B_o_OBUF[3]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000000A2AAAA00A2)) 
    \G_o_OBUF[3]_inst_i_1 
       (.I0(vsync_o_OBUF),
        .I1(sw_i_IBUF[1]),
        .I2(\G_o[0] ),
        .I3(sw_i_IBUF[2]),
        .I4(bg_img_state),
        .I5(\G_o_OBUF[3]_inst_i_3_n_0 ),
        .O(G_o_OBUF));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \G_o_OBUF[3]_inst_i_3 
       (.I0(douta[5]),
        .I1(douta[7]),
        .I2(\R_o_OBUF[3]_inst_i_4_n_0 ),
        .I3(douta[3]),
        .I4(douta[1]),
        .O(\G_o_OBUF[3]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h02000002AAAAAAAA)) 
    \R_o_OBUF[3]_inst_i_1 
       (.I0(vsync_o_OBUF),
        .I1(sw_i_IBUF[2]),
        .I2(bg_img_state),
        .I3(\R_o[0] ),
        .I4(sw_i_IBUF[0]),
        .I5(\R_o_OBUF[3]_inst_i_3_n_0 ),
        .O(R_o_OBUF));
  LUT6 #(
    .INIT(64'h07F7F7F7FFFFFFFF)) 
    \R_o_OBUF[3]_inst_i_3 
       (.I0(douta[2]),
        .I1(douta[3]),
        .I2(\R_o_OBUF[3]_inst_i_4_n_0 ),
        .I3(douta[6]),
        .I4(douta[7]),
        .I5(bg_img_state),
        .O(\R_o_OBUF[3]_inst_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    \R_o_OBUF[3]_inst_i_4 
       (.I0(\d_pq_reg_n_0_[0] ),
        .I1(\d_nq_reg_n_0_[0] ),
        .I2(\d_pq_reg_n_0_[1] ),
        .I3(\d_nq_reg_n_0_[1] ),
        .O(\R_o_OBUF[3]_inst_i_4_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    clk_o_reg
       (.CLR(clk_o_reg_i_2__0_n_0),
        .D(clk_o_reg_i_1__0_n_0),
        .G(clk_o_reg_i_1__0_n_0),
        .GE(1'b1),
        .Q(clk_pixel));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0118)) 
    clk_o_reg_i_1__0
       (.I0(\d_nq_reg_n_0_[0] ),
        .I1(\d_pq_reg_n_0_[0] ),
        .I2(\d_nq_reg_n_0_[1] ),
        .I3(\d_pq_reg_n_0_[1] ),
        .O(clk_o_reg_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h1880)) 
    clk_o_reg_i_2__0
       (.I0(\d_nq_reg_n_0_[0] ),
        .I1(\d_pq_reg_n_0_[0] ),
        .I2(\d_nq_reg_n_0_[1] ),
        .I3(\d_pq_reg_n_0_[1] ),
        .O(clk_o_reg_i_2__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \d_nq[0]_i_1__0 
       (.I0(\d_nq_reg_n_0_[0] ),
        .O(\d_nq[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \d_nq[1]_i_1__0 
       (.I0(\d_nq_reg_n_0_[0] ),
        .I1(\d_nq_reg_n_0_[1] ),
        .O(\d_nq[1]_i_1__0_n_0 ));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \d_nq_reg[0] 
       (.C(pixel_clk_o),
        .CE(1'b1),
        .CLR(clk_o_reg_i_2__0_n_0),
        .D(\d_nq[0]_i_1__0_n_0 ),
        .Q(\d_nq_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \d_nq_reg[1] 
       (.C(pixel_clk_o),
        .CE(1'b1),
        .CLR(clk_o_reg_i_2__0_n_0),
        .D(\d_nq[1]_i_1__0_n_0 ),
        .Q(\d_nq_reg_n_0_[1] ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \d_pq[0]_i_1__0 
       (.I0(\d_pq_reg_n_0_[0] ),
        .O(\d_pq[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \d_pq[1]_i_1__0 
       (.I0(\d_pq_reg_n_0_[0] ),
        .I1(\d_pq_reg_n_0_[1] ),
        .O(\d_pq[1]_i_1__0_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \d_pq_reg[0] 
       (.C(pixel_clk_o),
        .CE(1'b1),
        .CLR(clk_o_reg_i_2__0_n_0),
        .D(\d_pq[0]_i_1__0_n_0 ),
        .Q(\d_pq_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \d_pq_reg[1] 
       (.C(pixel_clk_o),
        .CE(1'b1),
        .CLR(clk_o_reg_i_2__0_n_0),
        .D(\d_pq[1]_i_1__0_n_0 ),
        .Q(\d_pq_reg_n_0_[1] ));
endmodule

module timing_clk
   (pixel_clk_o,
    hsync_o_OBUF,
    vsync_o_OBUF,
    vsync_o_reg_0,
    hsync_o_reg_0,
    CLK);
  output pixel_clk_o;
  output hsync_o_OBUF;
  output vsync_o_OBUF;
  output vsync_o_reg_0;
  output hsync_o_reg_0;
  input CLK;

  wire CLK;
  wire \h_q[0]_i_2_n_0 ;
  wire [20:0]h_q_reg;
  wire \h_q_reg[0]_i_1_n_0 ;
  wire \h_q_reg[0]_i_1_n_1 ;
  wire \h_q_reg[0]_i_1_n_2 ;
  wire \h_q_reg[0]_i_1_n_3 ;
  wire \h_q_reg[0]_i_1_n_4 ;
  wire \h_q_reg[0]_i_1_n_5 ;
  wire \h_q_reg[0]_i_1_n_6 ;
  wire \h_q_reg[0]_i_1_n_7 ;
  wire \h_q_reg[12]_i_1_n_0 ;
  wire \h_q_reg[12]_i_1_n_1 ;
  wire \h_q_reg[12]_i_1_n_2 ;
  wire \h_q_reg[12]_i_1_n_3 ;
  wire \h_q_reg[12]_i_1_n_4 ;
  wire \h_q_reg[12]_i_1_n_5 ;
  wire \h_q_reg[12]_i_1_n_6 ;
  wire \h_q_reg[12]_i_1_n_7 ;
  wire \h_q_reg[16]_i_1_n_0 ;
  wire \h_q_reg[16]_i_1_n_1 ;
  wire \h_q_reg[16]_i_1_n_2 ;
  wire \h_q_reg[16]_i_1_n_3 ;
  wire \h_q_reg[16]_i_1_n_4 ;
  wire \h_q_reg[16]_i_1_n_5 ;
  wire \h_q_reg[16]_i_1_n_6 ;
  wire \h_q_reg[16]_i_1_n_7 ;
  wire \h_q_reg[20]_i_1_n_7 ;
  wire \h_q_reg[4]_i_1_n_0 ;
  wire \h_q_reg[4]_i_1_n_1 ;
  wire \h_q_reg[4]_i_1_n_2 ;
  wire \h_q_reg[4]_i_1_n_3 ;
  wire \h_q_reg[4]_i_1_n_4 ;
  wire \h_q_reg[4]_i_1_n_5 ;
  wire \h_q_reg[4]_i_1_n_6 ;
  wire \h_q_reg[4]_i_1_n_7 ;
  wire \h_q_reg[8]_i_1_n_0 ;
  wire \h_q_reg[8]_i_1_n_1 ;
  wire \h_q_reg[8]_i_1_n_2 ;
  wire \h_q_reg[8]_i_1_n_3 ;
  wire \h_q_reg[8]_i_1_n_4 ;
  wire \h_q_reg[8]_i_1_n_5 ;
  wire \h_q_reg[8]_i_1_n_6 ;
  wire \h_q_reg[8]_i_1_n_7 ;
  wire [2:0]h_state;
  wire \h_state2_inferred__0/i__carry__0_n_1 ;
  wire \h_state2_inferred__0/i__carry__0_n_2 ;
  wire \h_state2_inferred__0/i__carry__0_n_3 ;
  wire \h_state2_inferred__0/i__carry_n_0 ;
  wire \h_state2_inferred__0/i__carry_n_1 ;
  wire \h_state2_inferred__0/i__carry_n_2 ;
  wire \h_state2_inferred__0/i__carry_n_3 ;
  wire [2:0]h_state__0;
  wire \h_state_reg[2]_i_2_n_0 ;
  wire h_strobe;
  wire h_strobe_reg_i_1_n_0;
  wire h_strobe_reg_i_2_n_0;
  wire hsync_o_OBUF;
  wire hsync_o_i_1_n_0;
  wire hsync_o_reg_0;
  wire i__carry__0_i_1__1_n_0;
  wire i__carry__0_i_2__1_n_0;
  wire i__carry__0_i_3__0_n_0;
  wire i__carry_i_1__0_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4_n_0;
  wire pixel_clk_en;
  wire pixel_clk_en__0;
  wire pixel_clk_en_reg_i_1_n_0;
  wire pixel_clk_o;
  wire [1:0]v_state;
  wire v_state1;
  wire v_state1_carry__0_i_1_n_0;
  wire v_state1_carry__0_i_2_n_0;
  wire v_state1_carry__0_i_3_n_0;
  wire v_state1_carry__0_n_2;
  wire v_state1_carry__0_n_3;
  wire v_state1_carry_i_1_n_0;
  wire v_state1_carry_i_2_n_0;
  wire v_state1_carry_i_3_n_0;
  wire v_state1_carry_i_4_n_0;
  wire v_state1_carry_n_0;
  wire v_state1_carry_n_1;
  wire v_state1_carry_n_2;
  wire v_state1_carry_n_3;
  wire \v_state_reg[0]_i_1_n_0 ;
  wire vsync_o_OBUF;
  wire vsync_o_i_1_n_0;
  wire vsync_o_reg_0;
  wire [3:0]\NLW_h_q_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_h_q_reg[20]_i_1_O_UNCONNECTED ;
  wire [3:0]\NLW_h_state2_inferred__0/i__carry_O_UNCONNECTED ;
  wire [3:3]\NLW_h_state2_inferred__0/i__carry__0_CO_UNCONNECTED ;
  wire [3:0]\NLW_h_state2_inferred__0/i__carry__0_O_UNCONNECTED ;
  wire [3:0]NLW_v_state1_carry_O_UNCONNECTED;
  wire [3:3]NLW_v_state1_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_v_state1_carry__0_O_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    \X_disp[8]_i_2 
       (.I0(hsync_o_OBUF),
        .O(hsync_o_reg_0));
  LUT1 #(
    .INIT(2'h1)) 
    \Y_disp[9]_i_2 
       (.I0(vsync_o_OBUF),
        .O(vsync_o_reg_0));
  LUT1 #(
    .INIT(2'h1)) 
    \h_q[0]_i_2 
       (.I0(h_q_reg[0]),
        .O(\h_q[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[0]_i_1_n_7 ),
        .Q(h_q_reg[0]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \h_q_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\h_q_reg[0]_i_1_n_0 ,\h_q_reg[0]_i_1_n_1 ,\h_q_reg[0]_i_1_n_2 ,\h_q_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\h_q_reg[0]_i_1_n_4 ,\h_q_reg[0]_i_1_n_5 ,\h_q_reg[0]_i_1_n_6 ,\h_q_reg[0]_i_1_n_7 }),
        .S({h_q_reg[3:1],\h_q[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[8]_i_1_n_5 ),
        .Q(h_q_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[8]_i_1_n_4 ),
        .Q(h_q_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[12]_i_1_n_7 ),
        .Q(h_q_reg[12]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \h_q_reg[12]_i_1 
       (.CI(\h_q_reg[8]_i_1_n_0 ),
        .CO({\h_q_reg[12]_i_1_n_0 ,\h_q_reg[12]_i_1_n_1 ,\h_q_reg[12]_i_1_n_2 ,\h_q_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\h_q_reg[12]_i_1_n_4 ,\h_q_reg[12]_i_1_n_5 ,\h_q_reg[12]_i_1_n_6 ,\h_q_reg[12]_i_1_n_7 }),
        .S(h_q_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[12]_i_1_n_6 ),
        .Q(h_q_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[12]_i_1_n_5 ),
        .Q(h_q_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[12]_i_1_n_4 ),
        .Q(h_q_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[16] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[16]_i_1_n_7 ),
        .Q(h_q_reg[16]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \h_q_reg[16]_i_1 
       (.CI(\h_q_reg[12]_i_1_n_0 ),
        .CO({\h_q_reg[16]_i_1_n_0 ,\h_q_reg[16]_i_1_n_1 ,\h_q_reg[16]_i_1_n_2 ,\h_q_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\h_q_reg[16]_i_1_n_4 ,\h_q_reg[16]_i_1_n_5 ,\h_q_reg[16]_i_1_n_6 ,\h_q_reg[16]_i_1_n_7 }),
        .S(h_q_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[17] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[16]_i_1_n_6 ),
        .Q(h_q_reg[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[18] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[16]_i_1_n_5 ),
        .Q(h_q_reg[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[19] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[16]_i_1_n_4 ),
        .Q(h_q_reg[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[0]_i_1_n_6 ),
        .Q(h_q_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[20] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[20]_i_1_n_7 ),
        .Q(h_q_reg[20]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \h_q_reg[20]_i_1 
       (.CI(\h_q_reg[16]_i_1_n_0 ),
        .CO(\NLW_h_q_reg[20]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_h_q_reg[20]_i_1_O_UNCONNECTED [3:1],\h_q_reg[20]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,h_q_reg[20]}));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[0]_i_1_n_5 ),
        .Q(h_q_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[0]_i_1_n_4 ),
        .Q(h_q_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[4]_i_1_n_7 ),
        .Q(h_q_reg[4]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \h_q_reg[4]_i_1 
       (.CI(\h_q_reg[0]_i_1_n_0 ),
        .CO({\h_q_reg[4]_i_1_n_0 ,\h_q_reg[4]_i_1_n_1 ,\h_q_reg[4]_i_1_n_2 ,\h_q_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\h_q_reg[4]_i_1_n_4 ,\h_q_reg[4]_i_1_n_5 ,\h_q_reg[4]_i_1_n_6 ,\h_q_reg[4]_i_1_n_7 }),
        .S(h_q_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[4]_i_1_n_6 ),
        .Q(h_q_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[4]_i_1_n_5 ),
        .Q(h_q_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[4]_i_1_n_4 ),
        .Q(h_q_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[8]_i_1_n_7 ),
        .Q(h_q_reg[8]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \h_q_reg[8]_i_1 
       (.CI(\h_q_reg[4]_i_1_n_0 ),
        .CO({\h_q_reg[8]_i_1_n_0 ,\h_q_reg[8]_i_1_n_1 ,\h_q_reg[8]_i_1_n_2 ,\h_q_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\h_q_reg[8]_i_1_n_4 ,\h_q_reg[8]_i_1_n_5 ,\h_q_reg[8]_i_1_n_6 ,\h_q_reg[8]_i_1_n_7 }),
        .S(h_q_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \h_q_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .D(\h_q_reg[8]_i_1_n_6 ),
        .Q(h_q_reg[9]),
        .R(1'b0));
  CARRY4 \h_state2_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\h_state2_inferred__0/i__carry_n_0 ,\h_state2_inferred__0/i__carry_n_1 ,\h_state2_inferred__0/i__carry_n_2 ,\h_state2_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_h_state2_inferred__0/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_1__0_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0}));
  CARRY4 \h_state2_inferred__0/i__carry__0 
       (.CI(\h_state2_inferred__0/i__carry_n_0 ),
        .CO({\NLW_h_state2_inferred__0/i__carry__0_CO_UNCONNECTED [3],\h_state2_inferred__0/i__carry__0_n_1 ,\h_state2_inferred__0/i__carry__0_n_2 ,\h_state2_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_h_state2_inferred__0/i__carry__0_O_UNCONNECTED [3:0]),
        .S({1'b0,i__carry__0_i_1__1_n_0,i__carry__0_i_2__1_n_0,i__carry__0_i_3__0_n_0}));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \h_state_reg[0] 
       (.CLR(1'b0),
        .D(h_state__0[0]),
        .G(\h_state_reg[2]_i_2_n_0 ),
        .GE(1'b1),
        .Q(h_state[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h000B)) 
    \h_state_reg[0]_i_1 
       (.I0(h_strobe),
        .I1(h_state[2]),
        .I2(h_state[0]),
        .I3(h_state[1]),
        .O(h_state__0[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \h_state_reg[1] 
       (.CLR(1'b0),
        .D(h_state__0[1]),
        .G(\h_state_reg[2]_i_2_n_0 ),
        .GE(1'b1),
        .Q(h_state[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h02C0)) 
    \h_state_reg[1]_i_1 
       (.I0(h_strobe),
        .I1(h_state[1]),
        .I2(h_state[0]),
        .I3(h_state[2]),
        .O(h_state__0[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b1)) 
    \h_state_reg[2] 
       (.CLR(1'b0),
        .D(h_state__0[2]),
        .G(\h_state_reg[2]_i_2_n_0 ),
        .GE(1'b1),
        .Q(h_state[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFD0C)) 
    \h_state_reg[2]_i_1 
       (.I0(h_strobe),
        .I1(h_state[0]),
        .I2(h_state[1]),
        .I3(h_state[2]),
        .O(h_state__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h222E2222)) 
    \h_state_reg[2]_i_2 
       (.I0(\h_state2_inferred__0/i__carry__0_n_1 ),
        .I1(h_state[2]),
        .I2(h_state[1]),
        .I3(h_state[0]),
        .I4(h_strobe),
        .O(\h_state_reg[2]_i_2_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    h_strobe_reg
       (.CLR(1'b0),
        .D(h_strobe_reg_i_1_n_0),
        .G(h_strobe_reg_i_2_n_0),
        .GE(1'b1),
        .Q(h_strobe));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    h_strobe_reg_i_1
       (.I0(v_state[1]),
        .I1(v_state[0]),
        .O(h_strobe_reg_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    h_strobe_reg_i_2
       (.I0(v_state1),
        .I1(v_state[0]),
        .O(h_strobe_reg_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hF7)) 
    hsync_o_i_1
       (.I0(h_state[1]),
        .I1(h_state[0]),
        .I2(h_state[2]),
        .O(hsync_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    hsync_o_reg
       (.C(CLK),
        .CE(1'b1),
        .D(hsync_o_i_1_n_0),
        .Q(hsync_o_OBUF),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h01)) 
    i__carry__0_i_1__1
       (.I0(h_q_reg[20]),
        .I1(h_q_reg[19]),
        .I2(h_q_reg[18]),
        .O(i__carry__0_i_1__1_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    i__carry__0_i_2__1
       (.I0(h_q_reg[17]),
        .I1(h_q_reg[16]),
        .I2(h_q_reg[15]),
        .O(i__carry__0_i_2__1_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    i__carry__0_i_3__0
       (.I0(h_q_reg[14]),
        .I1(h_q_reg[13]),
        .I2(h_q_reg[12]),
        .O(i__carry__0_i_3__0_n_0));
  LUT6 #(
    .INIT(64'h0000000000015554)) 
    i__carry_i_1__0
       (.I0(h_q_reg[10]),
        .I1(h_state[2]),
        .I2(h_state[0]),
        .I3(h_state[1]),
        .I4(h_q_reg[11]),
        .I5(h_q_reg[9]),
        .O(i__carry_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h00020004AA800020)) 
    i__carry_i_2
       (.I0(h_q_reg[6]),
        .I1(h_state[1]),
        .I2(h_state[0]),
        .I3(h_state[2]),
        .I4(h_q_reg[8]),
        .I5(h_q_reg[7]),
        .O(i__carry_i_2_n_0));
  LUT6 #(
    .INIT(64'hAA88000000020010)) 
    i__carry_i_3
       (.I0(h_q_reg[3]),
        .I1(h_state[1]),
        .I2(h_state[0]),
        .I3(h_state[2]),
        .I4(h_q_reg[5]),
        .I5(h_q_reg[4]),
        .O(i__carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h00090000AA800010)) 
    i__carry_i_4
       (.I0(h_q_reg[0]),
        .I1(h_state[1]),
        .I2(h_state[0]),
        .I3(h_state[2]),
        .I4(h_q_reg[2]),
        .I5(h_q_reg[1]),
        .O(i__carry_i_4_n_0));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    pixel_clk_en_reg
       (.CLR(1'b0),
        .D(pixel_clk_en_reg_i_1_n_0),
        .G(pixel_clk_en__0),
        .GE(1'b1),
        .Q(pixel_clk_en));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h02)) 
    pixel_clk_en_reg_i_1
       (.I0(h_state[1]),
        .I1(h_state[0]),
        .I2(h_state[2]),
        .O(pixel_clk_en_reg_i_1_n_0));
  LUT3 #(
    .INIT(8'h02)) 
    pixel_clk_en_reg_i_2
       (.I0(\h_state2_inferred__0/i__carry__0_n_1 ),
        .I1(h_state[2]),
        .I2(h_state[0]),
        .O(pixel_clk_en__0));
  freq_divider pixel_clock
       (.CLK(CLK),
        .pixel_clk_en(pixel_clk_en),
        .pixel_clk_o(pixel_clk_o));
  CARRY4 v_state1_carry
       (.CI(1'b0),
        .CO({v_state1_carry_n_0,v_state1_carry_n_1,v_state1_carry_n_2,v_state1_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_v_state1_carry_O_UNCONNECTED[3:0]),
        .S({v_state1_carry_i_1_n_0,v_state1_carry_i_2_n_0,v_state1_carry_i_3_n_0,v_state1_carry_i_4_n_0}));
  CARRY4 v_state1_carry__0
       (.CI(v_state1_carry_n_0),
        .CO({NLW_v_state1_carry__0_CO_UNCONNECTED[3],v_state1,v_state1_carry__0_n_2,v_state1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_v_state1_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b0,v_state1_carry__0_i_1_n_0,v_state1_carry__0_i_2_n_0,v_state1_carry__0_i_3_n_0}));
  LUT5 #(
    .INIT(32'h00021110)) 
    v_state1_carry__0_i_1
       (.I0(h_q_reg[18]),
        .I1(h_q_reg[19]),
        .I2(v_state[1]),
        .I3(v_state[0]),
        .I4(h_q_reg[20]),
        .O(v_state1_carry__0_i_1_n_0));
  LUT5 #(
    .INIT(32'h01080050)) 
    v_state1_carry__0_i_2
       (.I0(h_q_reg[15]),
        .I1(v_state[1]),
        .I2(v_state[0]),
        .I3(h_q_reg[17]),
        .I4(h_q_reg[16]),
        .O(v_state1_carry__0_i_2_n_0));
  LUT5 #(
    .INIT(32'h080001A0)) 
    v_state1_carry__0_i_3
       (.I0(h_q_reg[12]),
        .I1(v_state[0]),
        .I2(v_state[1]),
        .I3(h_q_reg[14]),
        .I4(h_q_reg[13]),
        .O(v_state1_carry__0_i_3_n_0));
  LUT5 #(
    .INIT(32'h00026400)) 
    v_state1_carry_i_1
       (.I0(h_q_reg[9]),
        .I1(v_state[1]),
        .I2(v_state[0]),
        .I3(h_q_reg[11]),
        .I4(h_q_reg[10]),
        .O(v_state1_carry_i_1_n_0));
  LUT5 #(
    .INIT(32'h08402001)) 
    v_state1_carry_i_2
       (.I0(h_q_reg[6]),
        .I1(v_state[0]),
        .I2(v_state[1]),
        .I3(h_q_reg[8]),
        .I4(h_q_reg[7]),
        .O(v_state1_carry_i_2_n_0));
  LUT5 #(
    .INIT(32'h01841000)) 
    v_state1_carry_i_3
       (.I0(h_q_reg[3]),
        .I1(v_state[0]),
        .I2(v_state[1]),
        .I3(h_q_reg[5]),
        .I4(h_q_reg[4]),
        .O(v_state1_carry_i_3_n_0));
  LUT5 #(
    .INIT(32'h00005104)) 
    v_state1_carry_i_4
       (.I0(h_q_reg[1]),
        .I1(v_state[1]),
        .I2(v_state[0]),
        .I3(h_q_reg[2]),
        .I4(h_q_reg[0]),
        .O(v_state1_carry_i_4_n_0));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b1)) 
    \v_state_reg[0] 
       (.CLR(1'b0),
        .D(\v_state_reg[0]_i_1_n_0 ),
        .G(v_state1),
        .GE(1'b1),
        .Q(v_state[0]));
  LUT1 #(
    .INIT(2'h1)) 
    \v_state_reg[0]_i_1 
       (.I0(v_state[1]),
        .O(\v_state_reg[0]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \v_state_reg[1] 
       (.CLR(1'b0),
        .D(v_state[0]),
        .G(v_state1),
        .GE(1'b1),
        .Q(v_state[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h7)) 
    vsync_o_i_1
       (.I0(v_state[0]),
        .I1(v_state[1]),
        .O(vsync_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    vsync_o_reg
       (.C(CLK),
        .CE(1'b1),
        .D(vsync_o_i_1_n_0),
        .Q(vsync_o_OBUF),
        .R(1'b0));
endmodule

(* NotValidForBitStream *)
module top
   (clk_i,
    R_o,
    G_o,
    B_o,
    sw_i,
    btn_i,
    hsync_o,
    vsync_o);
  input clk_i;
  output [3:0]R_o;
  output [3:0]G_o;
  output [3:0]B_o;
  input [3:0]sw_i;
  input [3:0]btn_i;
  output hsync_o;
  output vsync_o;

  wire [3:0]B_o;
  wire [0:0]B_o_OBUF;
  wire \B_o_OBUF[3]_inst_i_2_n_0 ;
  wire [3:0]G_o;
  wire [0:0]G_o_OBUF;
  wire \G_o_OBUF[3]_inst_i_2_n_0 ;
  wire [3:0]R_o;
  wire [0:0]R_o_OBUF;
  wire \R_o_OBUF[3]_inst_i_2_n_0 ;
  wire [13:0]addra;
  wire [3:0]btn_i;
  wire [3:0]btn_i_IBUF;
  wire clk_i;
  wire clk_i_IBUF;
  wire clk_i_IBUF_BUFG;
  wire [7:0]douta;
  wire hsync_o;
  wire hsync_o_OBUF;
  wire pixel_clk_o;
  wire [3:0]sw_i;
  wire [3:0]sw_i_IBUF;
  wire timings_n_3;
  wire timings_n_4;
  wire vsync_o;
  wire vsync_o_OBUF;

initial begin
 $sdf_annotate("tb_top_time_synth.sdf",,,,"tool_control");
end
  OBUF \B_o_OBUF[0]_inst 
       (.I(B_o_OBUF),
        .O(B_o[0]));
  OBUF \B_o_OBUF[1]_inst 
       (.I(B_o_OBUF),
        .O(B_o[1]));
  OBUF \B_o_OBUF[2]_inst 
       (.I(B_o_OBUF),
        .O(B_o[2]));
  OBUF \B_o_OBUF[3]_inst 
       (.I(B_o_OBUF),
        .O(B_o[3]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hFF87)) 
    \B_o_OBUF[3]_inst_i_2 
       (.I0(sw_i_IBUF[0]),
        .I1(sw_i_IBUF[1]),
        .I2(sw_i_IBUF[2]),
        .I3(sw_i_IBUF[3]),
        .O(\B_o_OBUF[3]_inst_i_2_n_0 ));
  OBUF \G_o_OBUF[0]_inst 
       (.I(G_o_OBUF),
        .O(G_o[0]));
  OBUF \G_o_OBUF[1]_inst 
       (.I(G_o_OBUF),
        .O(G_o[1]));
  OBUF \G_o_OBUF[2]_inst 
       (.I(G_o_OBUF),
        .O(G_o[2]));
  OBUF \G_o_OBUF[3]_inst 
       (.I(G_o_OBUF),
        .O(G_o[3]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    \G_o_OBUF[3]_inst_i_2 
       (.I0(sw_i_IBUF[0]),
        .I1(sw_i_IBUF[2]),
        .I2(sw_i_IBUF[1]),
        .I3(sw_i_IBUF[3]),
        .O(\G_o_OBUF[3]_inst_i_2_n_0 ));
  OBUF \R_o_OBUF[0]_inst 
       (.I(R_o_OBUF),
        .O(R_o[0]));
  OBUF \R_o_OBUF[1]_inst 
       (.I(R_o_OBUF),
        .O(R_o[1]));
  OBUF \R_o_OBUF[2]_inst 
       (.I(R_o_OBUF),
        .O(R_o[2]));
  OBUF \R_o_OBUF[3]_inst 
       (.I(R_o_OBUF),
        .O(R_o[3]));
  LUT2 #(
    .INIT(4'h2)) 
    \R_o_OBUF[3]_inst_i_2 
       (.I0(sw_i_IBUF[2]),
        .I1(sw_i_IBUF[0]),
        .O(\R_o_OBUF[3]_inst_i_2_n_0 ));
  (* IMPORTED_FROM = "j:/Kody/vhdl/IUP_Laby/VGA_2/VGA_2.gen/sources_1/ip/vga_bitmap/vga_bitmap.dcp" *) 
  (* IMPORTED_TYPE = "CHECKPOINT" *) 
  (* IS_IMPORTED *) 
  (* syn_black_box = "TRUE" *) 
  (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
  vga_bitmap bitmap
       (.addra(addra),
        .clka(clk_i_IBUF_BUFG),
        .douta(douta));
  IBUF #(
    .CCIO_EN("TRUE")) 
    \btn_i_IBUF[0]_inst 
       (.I(btn_i[0]),
        .O(btn_i_IBUF[0]));
  IBUF #(
    .CCIO_EN("TRUE")) 
    \btn_i_IBUF[1]_inst 
       (.I(btn_i[1]),
        .O(btn_i_IBUF[1]));
  IBUF #(
    .CCIO_EN("TRUE")) 
    \btn_i_IBUF[2]_inst 
       (.I(btn_i[2]),
        .O(btn_i_IBUF[2]));
  IBUF #(
    .CCIO_EN("TRUE")) 
    \btn_i_IBUF[3]_inst 
       (.I(btn_i[3]),
        .O(btn_i_IBUF[3]));
  BUFG clk_i_IBUF_BUFG_inst
       (.I(clk_i_IBUF),
        .O(clk_i_IBUF_BUFG));
  IBUF #(
    .CCIO_EN("TRUE")) 
    clk_i_IBUF_inst
       (.I(clk_i),
        .O(clk_i_IBUF));
  OBUF hsync_o_OBUF_inst
       (.I(hsync_o_OBUF),
        .O(hsync_o));
  IBUF #(
    .CCIO_EN("TRUE")) 
    \sw_i_IBUF[0]_inst 
       (.I(sw_i[0]),
        .O(sw_i_IBUF[0]));
  IBUF #(
    .CCIO_EN("TRUE")) 
    \sw_i_IBUF[1]_inst 
       (.I(sw_i[1]),
        .O(sw_i_IBUF[1]));
  IBUF #(
    .CCIO_EN("TRUE")) 
    \sw_i_IBUF[2]_inst 
       (.I(sw_i[2]),
        .O(sw_i_IBUF[2]));
  IBUF #(
    .CCIO_EN("TRUE")) 
    \sw_i_IBUF[3]_inst 
       (.I(sw_i[3]),
        .O(sw_i_IBUF[3]));
  timing_clk timings
       (.CLK(clk_i_IBUF_BUFG),
        .hsync_o_OBUF(hsync_o_OBUF),
        .hsync_o_reg_0(timings_n_4),
        .pixel_clk_o(pixel_clk_o),
        .vsync_o_OBUF(vsync_o_OBUF),
        .vsync_o_reg_0(timings_n_3));
  vga_controller vga_contr
       (.\B_o[0] (\B_o_OBUF[3]_inst_i_2_n_0 ),
        .B_o_OBUF(B_o_OBUF),
        .CLK(clk_i_IBUF_BUFG),
        .\G_o[0] (\G_o_OBUF[3]_inst_i_2_n_0 ),
        .G_o_OBUF(G_o_OBUF),
        .\R_o[0] (\R_o_OBUF[3]_inst_i_2_n_0 ),
        .R_o_OBUF(R_o_OBUF),
        .\X_disp_reg[0]_0 (timings_n_4),
        .\Y_disp_reg[0]_0 (timings_n_3),
        .addra(addra),
        .btn_i_IBUF(btn_i_IBUF),
        .douta(douta),
        .hsync_o_OBUF(hsync_o_OBUF),
        .pixel_clk_o(pixel_clk_o),
        .sw_i_IBUF(sw_i_IBUF[3:1]),
        .vsync_o_OBUF(vsync_o_OBUF));
  OBUF vsync_o_OBUF_inst
       (.I(vsync_o_OBUF),
        .O(vsync_o));
endmodule

(* CHECK_LICENSE_TYPE = "vga_bitmap,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
module vga_bitmap
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [13:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [13:0]addra;
  wire clka;
  wire [7:0]douta;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [13:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [13:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "14" *) 
  (* C_ADDRB_WIDTH = "14" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "3" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.315872 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "vga_bitmap.mem" *) 
  (* C_INIT_FILE_NAME = "vga_bitmap.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "12406" *) 
  (* C_READ_DEPTH_B = "12406" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "12406" *) 
  (* C_WRITE_DEPTH_B = "12406" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  vga_bitmap_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[13:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[13:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule

module vga_controller
   (addra,
    B_o_OBUF,
    G_o_OBUF,
    R_o_OBUF,
    CLK,
    hsync_o_OBUF,
    \Y_disp_reg[0]_0 ,
    pixel_clk_o,
    \X_disp_reg[0]_0 ,
    btn_i_IBUF,
    vsync_o_OBUF,
    \B_o[0] ,
    sw_i_IBUF,
    \G_o[0] ,
    \R_o[0] ,
    douta);
  output [13:0]addra;
  output [0:0]B_o_OBUF;
  output [0:0]G_o_OBUF;
  output [0:0]R_o_OBUF;
  input CLK;
  input hsync_o_OBUF;
  input \Y_disp_reg[0]_0 ;
  input pixel_clk_o;
  input \X_disp_reg[0]_0 ;
  input [3:0]btn_i_IBUF;
  input vsync_o_OBUF;
  input \B_o[0] ;
  input [2:0]sw_i_IBUF;
  input \G_o[0] ;
  input \R_o[0] ;
  input [7:0]douta;

  wire \B_o[0] ;
  wire [0:0]B_o_OBUF;
  wire CLK;
  wire \G_o[0] ;
  wire [0:0]G_o_OBUF;
  wire \R_o[0] ;
  wire [0:0]R_o_OBUF;
  wire \X_disp[8]_i_3_n_0 ;
  wire [8:0]X_disp_reg;
  wire \X_disp_reg[0]_0 ;
  wire \X_img[0]_i_1_n_0 ;
  wire \X_img[4]_i_2_n_0 ;
  wire \X_img[4]_i_3_n_0 ;
  wire \X_img[4]_i_4_n_0 ;
  wire \X_img[4]_i_5_n_0 ;
  wire \X_img[4]_i_6_n_0 ;
  wire \X_img[8]_i_10_n_0 ;
  wire \X_img[8]_i_1_n_0 ;
  wire \X_img[8]_i_3_n_0 ;
  wire \X_img[8]_i_4_n_0 ;
  wire \X_img[8]_i_5_n_0 ;
  wire \X_img[8]_i_6_n_0 ;
  wire \X_img[8]_i_7_n_0 ;
  wire \X_img[8]_i_8_n_0 ;
  wire \X_img[8]_i_9_n_0 ;
  wire [8:0]X_img_reg;
  wire \X_img_reg[4]_i_1_n_0 ;
  wire \X_img_reg[4]_i_1_n_1 ;
  wire \X_img_reg[4]_i_1_n_2 ;
  wire \X_img_reg[4]_i_1_n_3 ;
  wire \X_img_reg[4]_i_1_n_4 ;
  wire \X_img_reg[4]_i_1_n_5 ;
  wire \X_img_reg[4]_i_1_n_6 ;
  wire \X_img_reg[4]_i_1_n_7 ;
  wire \X_img_reg[8]_i_2_n_1 ;
  wire \X_img_reg[8]_i_2_n_2 ;
  wire \X_img_reg[8]_i_2_n_3 ;
  wire \X_img_reg[8]_i_2_n_4 ;
  wire \X_img_reg[8]_i_2_n_5 ;
  wire \X_img_reg[8]_i_2_n_6 ;
  wire \X_img_reg[8]_i_2_n_7 ;
  wire \Y_disp[6]_i_1_n_0 ;
  wire \Y_disp[9]_i_3_n_0 ;
  wire [9:0]Y_disp_reg;
  wire \Y_disp_reg[0]_0 ;
  wire Y_img;
  wire \Y_img[4]_i_3_n_0 ;
  wire \Y_img[4]_i_4_n_0 ;
  wire \Y_img[4]_i_5_n_0 ;
  wire \Y_img[4]_i_6_n_0 ;
  wire \Y_img[6]_i_3_n_0 ;
  wire \Y_img[6]_i_4_n_0 ;
  wire \Y_img[6]_i_5_n_0 ;
  wire \Y_img[6]_i_6_n_0 ;
  wire [6:0]Y_img_reg;
  wire \Y_img_reg[4]_i_1_n_0 ;
  wire \Y_img_reg[4]_i_1_n_1 ;
  wire \Y_img_reg[4]_i_1_n_2 ;
  wire \Y_img_reg[4]_i_1_n_3 ;
  wire \Y_img_reg[4]_i_1_n_4 ;
  wire \Y_img_reg[4]_i_1_n_5 ;
  wire \Y_img_reg[4]_i_1_n_6 ;
  wire \Y_img_reg[4]_i_1_n_7 ;
  wire \Y_img_reg[6]_i_2_n_3 ;
  wire \Y_img_reg[6]_i_2_n_6 ;
  wire \Y_img_reg[6]_i_2_n_7 ;
  wire _carry__0_i_1_n_0;
  wire _carry__0_i_3_n_0;
  wire _carry__0_i_4_n_0;
  wire _carry__0_i_5_n_0;
  wire _carry__0_i_6_n_0;
  wire _carry__0_n_0;
  wire _carry__0_n_1;
  wire _carry__0_n_2;
  wire _carry__0_n_3;
  wire _carry__1_i_1_n_0;
  wire _carry__1_i_2_n_0;
  wire _carry__1_n_2;
  wire _carry__1_n_3;
  wire _carry_i_1_n_0;
  wire _carry_i_2_n_0;
  wire _carry_i_3_n_0;
  wire _carry_i_4_n_0;
  wire _carry_n_0;
  wire _carry_n_1;
  wire _carry_n_2;
  wire _carry_n_3;
  wire \_inferred__0/i__carry__0_n_0 ;
  wire \_inferred__0/i__carry__0_n_1 ;
  wire \_inferred__0/i__carry__0_n_2 ;
  wire \_inferred__0/i__carry__0_n_3 ;
  wire \_inferred__0/i__carry__1_n_2 ;
  wire \_inferred__0/i__carry__1_n_3 ;
  wire \_inferred__0/i__carry_n_0 ;
  wire \_inferred__0/i__carry_n_1 ;
  wire \_inferred__0/i__carry_n_2 ;
  wire \_inferred__0/i__carry_n_3 ;
  wire addr_o_carry__0_i_1_n_0;
  wire addr_o_carry__0_i_2_n_0;
  wire addr_o_carry__0_i_3_n_0;
  wire addr_o_carry__0_n_0;
  wire addr_o_carry__0_n_1;
  wire addr_o_carry__0_n_2;
  wire addr_o_carry__0_n_3;
  wire addr_o_carry__1_n_0;
  wire addr_o_carry__1_n_1;
  wire addr_o_carry__1_n_2;
  wire addr_o_carry__1_n_3;
  wire addr_o_carry__2_n_3;
  wire addr_o_carry_i_1_n_0;
  wire addr_o_carry_i_2_n_0;
  wire addr_o_carry_n_0;
  wire addr_o_carry_n_1;
  wire addr_o_carry_n_2;
  wire addr_o_carry_n_3;
  wire [13:0]addra;
  wire bg_img_state;
  wire bg_img_state2_carry__0_i_1_n_0;
  wire bg_img_state2_carry__0_i_2_n_0;
  wire bg_img_state2_carry__0_n_3;
  wire bg_img_state2_carry_i_1_n_0;
  wire bg_img_state2_carry_i_2_n_0;
  wire bg_img_state2_carry_i_3_n_0;
  wire bg_img_state2_carry_i_4_n_0;
  wire bg_img_state2_carry_i_5_n_0;
  wire bg_img_state2_carry_i_6_n_0;
  wire bg_img_state2_carry_i_7_n_0;
  wire bg_img_state2_carry_i_8_n_0;
  wire bg_img_state2_carry_n_0;
  wire bg_img_state2_carry_n_1;
  wire bg_img_state2_carry_n_2;
  wire bg_img_state2_carry_n_3;
  wire \bg_img_state2_inferred__0/i__carry__0_n_3 ;
  wire \bg_img_state2_inferred__0/i__carry_n_0 ;
  wire \bg_img_state2_inferred__0/i__carry_n_1 ;
  wire \bg_img_state2_inferred__0/i__carry_n_2 ;
  wire \bg_img_state2_inferred__0/i__carry_n_3 ;
  wire bg_img_state_i_1_n_0;
  wire [3:0]btn_i_IBUF;
  wire clear;
  wire clk_pixel;
  wire [7:0]douta;
  wire hsync_o_OBUF;
  wire i__carry__0_i_1__0_n_0;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_2__0_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__0_i_3_n_0;
  wire i__carry__0_i_4_n_0;
  wire i__carry__1_i_1_n_0;
  wire i__carry__1_i_2_n_0;
  wire i__carry_i_1__1_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2__0_n_0;
  wire i__carry_i_2__1_n_0;
  wire i__carry_i_3__0_n_0;
  wire i__carry_i_3__1_n_0;
  wire i__carry_i_4__0_n_0;
  wire i__carry_i_4__1_n_0;
  wire i__carry_i_5_n_0;
  wire i__carry_i_6_n_0;
  wire i__carry_i_7_n_0;
  wire i__carry_i_8_n_0;
  wire [5:0]p_0_in;
  wire [9:0]p_0_in__0;
  wire [8:0]p_0_in__1;
  wire pixel_clk_o;
  wire \pixel_it[0]_i_3_n_0 ;
  wire \pixel_it[0]_i_4_n_0 ;
  wire \pixel_it[0]_i_5_n_0 ;
  wire [13:0]pixel_it_reg;
  wire \pixel_it_reg[0]_i_1_n_0 ;
  wire \pixel_it_reg[0]_i_1_n_1 ;
  wire \pixel_it_reg[0]_i_1_n_2 ;
  wire \pixel_it_reg[0]_i_1_n_3 ;
  wire \pixel_it_reg[0]_i_1_n_4 ;
  wire \pixel_it_reg[0]_i_1_n_5 ;
  wire \pixel_it_reg[0]_i_1_n_6 ;
  wire \pixel_it_reg[0]_i_1_n_7 ;
  wire \pixel_it_reg[12]_i_1_n_3 ;
  wire \pixel_it_reg[12]_i_1_n_6 ;
  wire \pixel_it_reg[12]_i_1_n_7 ;
  wire \pixel_it_reg[4]_i_1_n_0 ;
  wire \pixel_it_reg[4]_i_1_n_1 ;
  wire \pixel_it_reg[4]_i_1_n_2 ;
  wire \pixel_it_reg[4]_i_1_n_3 ;
  wire \pixel_it_reg[4]_i_1_n_4 ;
  wire \pixel_it_reg[4]_i_1_n_5 ;
  wire \pixel_it_reg[4]_i_1_n_6 ;
  wire \pixel_it_reg[4]_i_1_n_7 ;
  wire \pixel_it_reg[8]_i_1_n_0 ;
  wire \pixel_it_reg[8]_i_1_n_1 ;
  wire \pixel_it_reg[8]_i_1_n_2 ;
  wire \pixel_it_reg[8]_i_1_n_3 ;
  wire \pixel_it_reg[8]_i_1_n_4 ;
  wire \pixel_it_reg[8]_i_1_n_5 ;
  wire \pixel_it_reg[8]_i_1_n_6 ;
  wire \pixel_it_reg[8]_i_1_n_7 ;
  wire [2:0]sw_i_IBUF;
  wire vsync_o_OBUF;
  wire [3:3]\NLW_X_img_reg[8]_i_2_CO_UNCONNECTED ;
  wire [3:1]\NLW_Y_img_reg[6]_i_2_CO_UNCONNECTED ;
  wire [3:2]\NLW_Y_img_reg[6]_i_2_O_UNCONNECTED ;
  wire [3:0]NLW__carry_O_UNCONNECTED;
  wire [3:0]NLW__carry__0_O_UNCONNECTED;
  wire [3:2]NLW__carry__1_CO_UNCONNECTED;
  wire [3:0]NLW__carry__1_O_UNCONNECTED;
  wire [3:0]\NLW__inferred__0/i__carry_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__0/i__carry__0_O_UNCONNECTED ;
  wire [3:2]\NLW__inferred__0/i__carry__1_CO_UNCONNECTED ;
  wire [3:0]\NLW__inferred__0/i__carry__1_O_UNCONNECTED ;
  wire [3:1]NLW_addr_o_carry__2_CO_UNCONNECTED;
  wire [3:2]NLW_addr_o_carry__2_O_UNCONNECTED;
  wire [3:0]NLW_bg_img_state2_carry_O_UNCONNECTED;
  wire [3:1]NLW_bg_img_state2_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_bg_img_state2_carry__0_O_UNCONNECTED;
  wire [3:0]\NLW_bg_img_state2_inferred__0/i__carry_O_UNCONNECTED ;
  wire [3:1]\NLW_bg_img_state2_inferred__0/i__carry__0_CO_UNCONNECTED ;
  wire [3:0]\NLW_bg_img_state2_inferred__0/i__carry__0_O_UNCONNECTED ;
  wire [3:1]\NLW_pixel_it_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_pixel_it_reg[12]_i_1_O_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \X_disp[0]_i_1 
       (.I0(X_disp_reg[0]),
        .O(p_0_in__1[0]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \X_disp[1]_i_1 
       (.I0(X_disp_reg[0]),
        .I1(X_disp_reg[1]),
        .O(p_0_in__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \X_disp[2]_i_1 
       (.I0(X_disp_reg[2]),
        .I1(X_disp_reg[0]),
        .I2(X_disp_reg[1]),
        .O(p_0_in__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \X_disp[3]_i_1 
       (.I0(X_disp_reg[3]),
        .I1(X_disp_reg[1]),
        .I2(X_disp_reg[0]),
        .I3(X_disp_reg[2]),
        .O(p_0_in__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \X_disp[4]_i_1 
       (.I0(X_disp_reg[2]),
        .I1(X_disp_reg[0]),
        .I2(X_disp_reg[1]),
        .I3(X_disp_reg[3]),
        .I4(X_disp_reg[4]),
        .O(p_0_in__1[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \X_disp[5]_i_1 
       (.I0(X_disp_reg[5]),
        .I1(X_disp_reg[2]),
        .I2(X_disp_reg[0]),
        .I3(X_disp_reg[1]),
        .I4(X_disp_reg[3]),
        .I5(X_disp_reg[4]),
        .O(p_0_in__1[5]));
  LUT3 #(
    .INIT(8'h6A)) 
    \X_disp[6]_i_1 
       (.I0(X_disp_reg[6]),
        .I1(\X_disp[8]_i_3_n_0 ),
        .I2(X_disp_reg[5]),
        .O(p_0_in__1[6]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \X_disp[7]_i_1 
       (.I0(X_disp_reg[7]),
        .I1(X_disp_reg[5]),
        .I2(\X_disp[8]_i_3_n_0 ),
        .I3(X_disp_reg[6]),
        .O(p_0_in__1[7]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \X_disp[8]_i_1 
       (.I0(X_disp_reg[8]),
        .I1(X_disp_reg[6]),
        .I2(\X_disp[8]_i_3_n_0 ),
        .I3(X_disp_reg[5]),
        .I4(X_disp_reg[7]),
        .O(p_0_in__1[8]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \X_disp[8]_i_3 
       (.I0(X_disp_reg[4]),
        .I1(X_disp_reg[3]),
        .I2(X_disp_reg[1]),
        .I3(X_disp_reg[0]),
        .I4(X_disp_reg[2]),
        .O(\X_disp[8]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \X_disp_reg[0] 
       (.C(pixel_clk_o),
        .CE(1'b1),
        .CLR(\X_disp_reg[0]_0 ),
        .D(p_0_in__1[0]),
        .Q(X_disp_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \X_disp_reg[1] 
       (.C(pixel_clk_o),
        .CE(1'b1),
        .CLR(\X_disp_reg[0]_0 ),
        .D(p_0_in__1[1]),
        .Q(X_disp_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \X_disp_reg[2] 
       (.C(pixel_clk_o),
        .CE(1'b1),
        .CLR(\X_disp_reg[0]_0 ),
        .D(p_0_in__1[2]),
        .Q(X_disp_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \X_disp_reg[3] 
       (.C(pixel_clk_o),
        .CE(1'b1),
        .CLR(\X_disp_reg[0]_0 ),
        .D(p_0_in__1[3]),
        .Q(X_disp_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \X_disp_reg[4] 
       (.C(pixel_clk_o),
        .CE(1'b1),
        .CLR(\X_disp_reg[0]_0 ),
        .D(p_0_in__1[4]),
        .Q(X_disp_reg[4]));
  FDCE #(
    .INIT(1'b0)) 
    \X_disp_reg[5] 
       (.C(pixel_clk_o),
        .CE(1'b1),
        .CLR(\X_disp_reg[0]_0 ),
        .D(p_0_in__1[5]),
        .Q(X_disp_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \X_disp_reg[6] 
       (.C(pixel_clk_o),
        .CE(1'b1),
        .CLR(\X_disp_reg[0]_0 ),
        .D(p_0_in__1[6]),
        .Q(X_disp_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \X_disp_reg[7] 
       (.C(pixel_clk_o),
        .CE(1'b1),
        .CLR(\X_disp_reg[0]_0 ),
        .D(p_0_in__1[7]),
        .Q(X_disp_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \X_disp_reg[8] 
       (.C(pixel_clk_o),
        .CE(1'b1),
        .CLR(\X_disp_reg[0]_0 ),
        .D(p_0_in__1[8]),
        .Q(X_disp_reg[8]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \X_img[0]_i_1 
       (.I0(X_img_reg[0]),
        .O(\X_img[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \X_img[4]_i_2 
       (.I0(X_img_reg[1]),
        .O(\X_img[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \X_img[4]_i_3 
       (.I0(X_img_reg[3]),
        .I1(X_img_reg[4]),
        .O(\X_img[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \X_img[4]_i_4 
       (.I0(X_img_reg[2]),
        .I1(X_img_reg[3]),
        .O(\X_img[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \X_img[4]_i_5 
       (.I0(X_img_reg[1]),
        .I1(X_img_reg[2]),
        .O(\X_img[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \X_img[4]_i_6 
       (.I0(X_img_reg[1]),
        .I1(btn_i_IBUF[0]),
        .O(\X_img[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFCB8FC88CC88CC88)) 
    \X_img[8]_i_1 
       (.I0(\X_img[8]_i_3_n_0 ),
        .I1(btn_i_IBUF[0]),
        .I2(\X_img[8]_i_4_n_0 ),
        .I3(\X_img[8]_i_5_n_0 ),
        .I4(\X_img[8]_i_6_n_0 ),
        .I5(btn_i_IBUF[3]),
        .O(\X_img[8]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \X_img[8]_i_10 
       (.I0(X_img_reg[4]),
        .I1(X_img_reg[5]),
        .O(\X_img[8]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \X_img[8]_i_3 
       (.I0(X_img_reg[6]),
        .I1(X_img_reg[5]),
        .I2(X_img_reg[8]),
        .I3(X_img_reg[7]),
        .O(\X_img[8]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \X_img[8]_i_4 
       (.I0(btn_i_IBUF[1]),
        .I1(btn_i_IBUF[2]),
        .O(\X_img[8]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \X_img[8]_i_5 
       (.I0(X_img_reg[1]),
        .I1(X_img_reg[4]),
        .I2(X_img_reg[0]),
        .I3(X_img_reg[3]),
        .I4(X_img_reg[2]),
        .O(\X_img[8]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hFF7F)) 
    \X_img[8]_i_6 
       (.I0(X_img_reg[6]),
        .I1(X_img_reg[7]),
        .I2(X_img_reg[5]),
        .I3(X_img_reg[8]),
        .O(\X_img[8]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \X_img[8]_i_7 
       (.I0(X_img_reg[7]),
        .I1(X_img_reg[8]),
        .O(\X_img[8]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \X_img[8]_i_8 
       (.I0(X_img_reg[6]),
        .I1(X_img_reg[7]),
        .O(\X_img[8]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \X_img[8]_i_9 
       (.I0(X_img_reg[5]),
        .I1(X_img_reg[6]),
        .O(\X_img[8]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \X_img_reg[0] 
       (.C(vsync_o_OBUF),
        .CE(\X_img[8]_i_1_n_0 ),
        .D(\X_img[0]_i_1_n_0 ),
        .Q(X_img_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \X_img_reg[1] 
       (.C(vsync_o_OBUF),
        .CE(\X_img[8]_i_1_n_0 ),
        .D(\X_img_reg[4]_i_1_n_7 ),
        .Q(X_img_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \X_img_reg[2] 
       (.C(vsync_o_OBUF),
        .CE(\X_img[8]_i_1_n_0 ),
        .D(\X_img_reg[4]_i_1_n_6 ),
        .Q(X_img_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \X_img_reg[3] 
       (.C(vsync_o_OBUF),
        .CE(\X_img[8]_i_1_n_0 ),
        .D(\X_img_reg[4]_i_1_n_5 ),
        .Q(X_img_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \X_img_reg[4] 
       (.C(vsync_o_OBUF),
        .CE(\X_img[8]_i_1_n_0 ),
        .D(\X_img_reg[4]_i_1_n_4 ),
        .Q(X_img_reg[4]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \X_img_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\X_img_reg[4]_i_1_n_0 ,\X_img_reg[4]_i_1_n_1 ,\X_img_reg[4]_i_1_n_2 ,\X_img_reg[4]_i_1_n_3 }),
        .CYINIT(X_img_reg[0]),
        .DI({X_img_reg[3:1],\X_img[4]_i_2_n_0 }),
        .O({\X_img_reg[4]_i_1_n_4 ,\X_img_reg[4]_i_1_n_5 ,\X_img_reg[4]_i_1_n_6 ,\X_img_reg[4]_i_1_n_7 }),
        .S({\X_img[4]_i_3_n_0 ,\X_img[4]_i_4_n_0 ,\X_img[4]_i_5_n_0 ,\X_img[4]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \X_img_reg[5] 
       (.C(vsync_o_OBUF),
        .CE(\X_img[8]_i_1_n_0 ),
        .D(\X_img_reg[8]_i_2_n_7 ),
        .Q(X_img_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \X_img_reg[6] 
       (.C(vsync_o_OBUF),
        .CE(\X_img[8]_i_1_n_0 ),
        .D(\X_img_reg[8]_i_2_n_6 ),
        .Q(X_img_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \X_img_reg[7] 
       (.C(vsync_o_OBUF),
        .CE(\X_img[8]_i_1_n_0 ),
        .D(\X_img_reg[8]_i_2_n_5 ),
        .Q(X_img_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \X_img_reg[8] 
       (.C(vsync_o_OBUF),
        .CE(\X_img[8]_i_1_n_0 ),
        .D(\X_img_reg[8]_i_2_n_4 ),
        .Q(X_img_reg[8]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \X_img_reg[8]_i_2 
       (.CI(\X_img_reg[4]_i_1_n_0 ),
        .CO({\NLW_X_img_reg[8]_i_2_CO_UNCONNECTED [3],\X_img_reg[8]_i_2_n_1 ,\X_img_reg[8]_i_2_n_2 ,\X_img_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,X_img_reg[6:4]}),
        .O({\X_img_reg[8]_i_2_n_4 ,\X_img_reg[8]_i_2_n_5 ,\X_img_reg[8]_i_2_n_6 ,\X_img_reg[8]_i_2_n_7 }),
        .S({\X_img[8]_i_7_n_0 ,\X_img[8]_i_8_n_0 ,\X_img[8]_i_9_n_0 ,\X_img[8]_i_10_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \Y_disp[0]_i_1 
       (.I0(Y_disp_reg[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \Y_disp[1]_i_1 
       (.I0(Y_disp_reg[0]),
        .I1(Y_disp_reg[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \Y_disp[2]_i_1 
       (.I0(Y_disp_reg[2]),
        .I1(Y_disp_reg[0]),
        .I2(Y_disp_reg[1]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \Y_disp[3]_i_1 
       (.I0(Y_disp_reg[3]),
        .I1(Y_disp_reg[1]),
        .I2(Y_disp_reg[0]),
        .I3(Y_disp_reg[2]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \Y_disp[4]_i_1 
       (.I0(Y_disp_reg[2]),
        .I1(Y_disp_reg[0]),
        .I2(Y_disp_reg[1]),
        .I3(Y_disp_reg[3]),
        .I4(Y_disp_reg[4]),
        .O(p_0_in__0[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \Y_disp[5]_i_1 
       (.I0(Y_disp_reg[5]),
        .I1(Y_disp_reg[2]),
        .I2(Y_disp_reg[0]),
        .I3(Y_disp_reg[1]),
        .I4(Y_disp_reg[3]),
        .I5(Y_disp_reg[4]),
        .O(p_0_in__0[5]));
  LUT3 #(
    .INIT(8'h6A)) 
    \Y_disp[6]_i_1 
       (.I0(Y_disp_reg[6]),
        .I1(\Y_disp[9]_i_3_n_0 ),
        .I2(Y_disp_reg[5]),
        .O(\Y_disp[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \Y_disp[7]_i_1 
       (.I0(Y_disp_reg[7]),
        .I1(\Y_disp[9]_i_3_n_0 ),
        .I2(Y_disp_reg[5]),
        .I3(Y_disp_reg[6]),
        .O(p_0_in__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \Y_disp[8]_i_1 
       (.I0(Y_disp_reg[8]),
        .I1(\Y_disp[9]_i_3_n_0 ),
        .I2(Y_disp_reg[5]),
        .I3(Y_disp_reg[6]),
        .I4(Y_disp_reg[7]),
        .O(p_0_in__0[8]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \Y_disp[9]_i_1 
       (.I0(Y_disp_reg[9]),
        .I1(Y_disp_reg[8]),
        .I2(Y_disp_reg[7]),
        .I3(Y_disp_reg[6]),
        .I4(Y_disp_reg[5]),
        .I5(\Y_disp[9]_i_3_n_0 ),
        .O(p_0_in__0[9]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \Y_disp[9]_i_3 
       (.I0(Y_disp_reg[4]),
        .I1(Y_disp_reg[3]),
        .I2(Y_disp_reg[1]),
        .I3(Y_disp_reg[0]),
        .I4(Y_disp_reg[2]),
        .O(\Y_disp[9]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Y_disp_reg[0] 
       (.C(hsync_o_OBUF),
        .CE(1'b1),
        .CLR(\Y_disp_reg[0]_0 ),
        .D(p_0_in__0[0]),
        .Q(Y_disp_reg[0]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Y_disp_reg[1] 
       (.C(hsync_o_OBUF),
        .CE(1'b1),
        .CLR(\Y_disp_reg[0]_0 ),
        .D(p_0_in__0[1]),
        .Q(Y_disp_reg[1]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Y_disp_reg[2] 
       (.C(hsync_o_OBUF),
        .CE(1'b1),
        .CLR(\Y_disp_reg[0]_0 ),
        .D(p_0_in__0[2]),
        .Q(Y_disp_reg[2]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Y_disp_reg[3] 
       (.C(hsync_o_OBUF),
        .CE(1'b1),
        .CLR(\Y_disp_reg[0]_0 ),
        .D(p_0_in__0[3]),
        .Q(Y_disp_reg[3]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Y_disp_reg[4] 
       (.C(hsync_o_OBUF),
        .CE(1'b1),
        .CLR(\Y_disp_reg[0]_0 ),
        .D(p_0_in__0[4]),
        .Q(Y_disp_reg[4]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Y_disp_reg[5] 
       (.C(hsync_o_OBUF),
        .CE(1'b1),
        .CLR(\Y_disp_reg[0]_0 ),
        .D(p_0_in__0[5]),
        .Q(Y_disp_reg[5]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Y_disp_reg[6] 
       (.C(hsync_o_OBUF),
        .CE(1'b1),
        .CLR(\Y_disp_reg[0]_0 ),
        .D(\Y_disp[6]_i_1_n_0 ),
        .Q(Y_disp_reg[6]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Y_disp_reg[7] 
       (.C(hsync_o_OBUF),
        .CE(1'b1),
        .CLR(\Y_disp_reg[0]_0 ),
        .D(p_0_in__0[7]),
        .Q(Y_disp_reg[7]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Y_disp_reg[8] 
       (.C(hsync_o_OBUF),
        .CE(1'b1),
        .CLR(\Y_disp_reg[0]_0 ),
        .D(p_0_in__0[8]),
        .Q(Y_disp_reg[8]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Y_disp_reg[9] 
       (.C(hsync_o_OBUF),
        .CE(1'b1),
        .CLR(\Y_disp_reg[0]_0 ),
        .D(p_0_in__0[9]),
        .Q(Y_disp_reg[9]));
  LUT1 #(
    .INIT(2'h1)) 
    \Y_img[0]_i_1 
       (.I0(Y_img_reg[0]),
        .O(p_0_in[0]));
  LUT1 #(
    .INIT(2'h1)) 
    \Y_img[4]_i_2 
       (.I0(Y_img_reg[1]),
        .O(p_0_in[1]));
  LUT2 #(
    .INIT(4'h9)) 
    \Y_img[4]_i_3 
       (.I0(Y_img_reg[3]),
        .I1(Y_img_reg[4]),
        .O(\Y_img[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \Y_img[4]_i_4 
       (.I0(Y_img_reg[2]),
        .I1(Y_img_reg[3]),
        .O(\Y_img[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \Y_img[4]_i_5 
       (.I0(Y_img_reg[1]),
        .I1(Y_img_reg[2]),
        .O(\Y_img[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y_img[4]_i_6 
       (.I0(Y_img_reg[1]),
        .I1(btn_i_IBUF[1]),
        .O(\Y_img[4]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h0000EEE0)) 
    \Y_img[6]_i_1 
       (.I0(\Y_img[6]_i_3_n_0 ),
        .I1(\Y_img[6]_i_4_n_0 ),
        .I2(btn_i_IBUF[1]),
        .I3(btn_i_IBUF[2]),
        .I4(btn_i_IBUF[0]),
        .O(Y_img));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \Y_img[6]_i_3 
       (.I0(Y_img_reg[4]),
        .I1(Y_img_reg[1]),
        .I2(Y_img_reg[6]),
        .I3(Y_img_reg[5]),
        .O(\Y_img[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hFFFD)) 
    \Y_img[6]_i_4 
       (.I0(btn_i_IBUF[1]),
        .I1(Y_img_reg[0]),
        .I2(Y_img_reg[3]),
        .I3(Y_img_reg[2]),
        .O(\Y_img[6]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \Y_img[6]_i_5 
       (.I0(Y_img_reg[5]),
        .I1(Y_img_reg[6]),
        .O(\Y_img[6]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \Y_img[6]_i_6 
       (.I0(Y_img_reg[4]),
        .I1(Y_img_reg[5]),
        .O(\Y_img[6]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Y_img_reg[0] 
       (.C(vsync_o_OBUF),
        .CE(Y_img),
        .D(p_0_in[0]),
        .Q(Y_img_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Y_img_reg[1] 
       (.C(vsync_o_OBUF),
        .CE(Y_img),
        .D(\Y_img_reg[4]_i_1_n_7 ),
        .Q(Y_img_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Y_img_reg[2] 
       (.C(vsync_o_OBUF),
        .CE(Y_img),
        .D(\Y_img_reg[4]_i_1_n_6 ),
        .Q(Y_img_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Y_img_reg[3] 
       (.C(vsync_o_OBUF),
        .CE(Y_img),
        .D(\Y_img_reg[4]_i_1_n_5 ),
        .Q(Y_img_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Y_img_reg[4] 
       (.C(vsync_o_OBUF),
        .CE(Y_img),
        .D(\Y_img_reg[4]_i_1_n_4 ),
        .Q(Y_img_reg[4]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \Y_img_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\Y_img_reg[4]_i_1_n_0 ,\Y_img_reg[4]_i_1_n_1 ,\Y_img_reg[4]_i_1_n_2 ,\Y_img_reg[4]_i_1_n_3 }),
        .CYINIT(Y_img_reg[0]),
        .DI({Y_img_reg[3:1],p_0_in[1]}),
        .O({\Y_img_reg[4]_i_1_n_4 ,\Y_img_reg[4]_i_1_n_5 ,\Y_img_reg[4]_i_1_n_6 ,\Y_img_reg[4]_i_1_n_7 }),
        .S({\Y_img[4]_i_3_n_0 ,\Y_img[4]_i_4_n_0 ,\Y_img[4]_i_5_n_0 ,\Y_img[4]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Y_img_reg[5] 
       (.C(vsync_o_OBUF),
        .CE(Y_img),
        .D(\Y_img_reg[6]_i_2_n_7 ),
        .Q(Y_img_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Y_img_reg[6] 
       (.C(vsync_o_OBUF),
        .CE(Y_img),
        .D(\Y_img_reg[6]_i_2_n_6 ),
        .Q(Y_img_reg[6]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \Y_img_reg[6]_i_2 
       (.CI(\Y_img_reg[4]_i_1_n_0 ),
        .CO({\NLW_Y_img_reg[6]_i_2_CO_UNCONNECTED [3:1],\Y_img_reg[6]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,Y_img_reg[4]}),
        .O({\NLW_Y_img_reg[6]_i_2_O_UNCONNECTED [3:2],\Y_img_reg[6]_i_2_n_6 ,\Y_img_reg[6]_i_2_n_7 }),
        .S({1'b0,1'b0,\Y_img[6]_i_5_n_0 ,\Y_img[6]_i_6_n_0 }));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 _carry
       (.CI(1'b0),
        .CO({_carry_n_0,_carry_n_1,_carry_n_2,_carry_n_3}),
        .CYINIT(1'b1),
        .DI(Y_disp_reg[3:0]),
        .O(NLW__carry_O_UNCONNECTED[3:0]),
        .S({_carry_i_1_n_0,_carry_i_2_n_0,_carry_i_3_n_0,_carry_i_4_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 _carry__0
       (.CI(_carry_n_0),
        .CO({_carry__0_n_0,_carry__0_n_1,_carry__0_n_2,_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({_carry__0_i_1_n_0,p_0_in[5],Y_img_reg[5],Y_disp_reg[4]}),
        .O(NLW__carry__0_O_UNCONNECTED[3:0]),
        .S({_carry__0_i_3_n_0,_carry__0_i_4_n_0,_carry__0_i_5_n_0,_carry__0_i_6_n_0}));
  LUT2 #(
    .INIT(4'h2)) 
    _carry__0_i_1
       (.I0(Y_disp_reg[6]),
        .I1(Y_img_reg[6]),
        .O(_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    _carry__0_i_2
       (.I0(Y_img_reg[5]),
        .O(p_0_in[5]));
  LUT3 #(
    .INIT(8'hB4)) 
    _carry__0_i_3
       (.I0(Y_img_reg[6]),
        .I1(Y_disp_reg[6]),
        .I2(Y_disp_reg[7]),
        .O(_carry__0_i_3_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    _carry__0_i_4
       (.I0(Y_img_reg[5]),
        .I1(Y_img_reg[6]),
        .I2(Y_disp_reg[6]),
        .O(_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    _carry__0_i_5
       (.I0(Y_img_reg[5]),
        .I1(Y_disp_reg[5]),
        .O(_carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    _carry__0_i_6
       (.I0(Y_disp_reg[4]),
        .I1(Y_img_reg[4]),
        .O(_carry__0_i_6_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 _carry__1
       (.CI(_carry__0_n_0),
        .CO({NLW__carry__1_CO_UNCONNECTED[3:2],_carry__1_n_2,_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,Y_disp_reg[9:8]}),
        .O(NLW__carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,_carry__1_i_1_n_0,_carry__1_i_2_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    _carry__1_i_1
       (.I0(Y_disp_reg[9]),
        .O(_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    _carry__1_i_2
       (.I0(Y_disp_reg[8]),
        .O(_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    _carry_i_1
       (.I0(Y_img_reg[3]),
        .I1(Y_disp_reg[3]),
        .O(_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    _carry_i_2
       (.I0(Y_img_reg[2]),
        .I1(Y_disp_reg[2]),
        .O(_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    _carry_i_3
       (.I0(Y_img_reg[1]),
        .I1(Y_disp_reg[1]),
        .O(_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    _carry_i_4
       (.I0(Y_img_reg[0]),
        .I1(Y_disp_reg[0]),
        .O(_carry_i_4_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__0/i__carry_n_0 ,\_inferred__0/i__carry_n_1 ,\_inferred__0/i__carry_n_2 ,\_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b1),
        .DI(X_disp_reg[3:0]),
        .O(\NLW__inferred__0/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_1__1_n_0,i__carry_i_2__1_n_0,i__carry_i_3__1_n_0,i__carry_i_4__1_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__0/i__carry__0 
       (.CI(\_inferred__0/i__carry_n_0 ),
        .CO({\_inferred__0/i__carry__0_n_0 ,\_inferred__0/i__carry__0_n_1 ,\_inferred__0/i__carry__0_n_2 ,\_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI(X_disp_reg[7:4]),
        .O(\NLW__inferred__0/i__carry__0_O_UNCONNECTED [3:0]),
        .S({i__carry__0_i_1__0_n_0,i__carry__0_i_2__0_n_0,i__carry__0_i_3_n_0,i__carry__0_i_4_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__0/i__carry__1 
       (.CI(\_inferred__0/i__carry__0_n_0 ),
        .CO({\NLW__inferred__0/i__carry__1_CO_UNCONNECTED [3:2],\_inferred__0/i__carry__1_n_2 ,\_inferred__0/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,X_img_reg[8]}),
        .O(\NLW__inferred__0/i__carry__1_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,i__carry__1_i_1_n_0,i__carry__1_i_2_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 addr_o_carry
       (.CI(1'b0),
        .CO({addr_o_carry_n_0,addr_o_carry_n_1,addr_o_carry_n_2,addr_o_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,pixel_it_reg[2:1],1'b0}),
        .O(addra[3:0]),
        .S({pixel_it_reg[3],addr_o_carry_i_1_n_0,addr_o_carry_i_2_n_0,pixel_it_reg[0]}));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 addr_o_carry__0
       (.CI(addr_o_carry_n_0),
        .CO({addr_o_carry__0_n_0,addr_o_carry__0_n_1,addr_o_carry__0_n_2,addr_o_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,pixel_it_reg[6:4]}),
        .O(addra[7:4]),
        .S({pixel_it_reg[7],addr_o_carry__0_i_1_n_0,addr_o_carry__0_i_2_n_0,addr_o_carry__0_i_3_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    addr_o_carry__0_i_1
       (.I0(pixel_it_reg[6]),
        .O(addr_o_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    addr_o_carry__0_i_2
       (.I0(pixel_it_reg[5]),
        .O(addr_o_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    addr_o_carry__0_i_3
       (.I0(pixel_it_reg[4]),
        .O(addr_o_carry__0_i_3_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 addr_o_carry__1
       (.CI(addr_o_carry__0_n_0),
        .CO({addr_o_carry__1_n_0,addr_o_carry__1_n_1,addr_o_carry__1_n_2,addr_o_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(addra[11:8]),
        .S(pixel_it_reg[11:8]));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 addr_o_carry__2
       (.CI(addr_o_carry__1_n_0),
        .CO({NLW_addr_o_carry__2_CO_UNCONNECTED[3:1],addr_o_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_addr_o_carry__2_O_UNCONNECTED[3:2],addra[13:12]}),
        .S({1'b0,1'b0,pixel_it_reg[13:12]}));
  LUT1 #(
    .INIT(2'h1)) 
    addr_o_carry_i_1
       (.I0(pixel_it_reg[2]),
        .O(addr_o_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    addr_o_carry_i_2
       (.I0(pixel_it_reg[1]),
        .O(addr_o_carry_i_2_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 bg_img_state2_carry
       (.CI(1'b0),
        .CO({bg_img_state2_carry_n_0,bg_img_state2_carry_n_1,bg_img_state2_carry_n_2,bg_img_state2_carry_n_3}),
        .CYINIT(1'b1),
        .DI({bg_img_state2_carry_i_1_n_0,bg_img_state2_carry_i_2_n_0,bg_img_state2_carry_i_3_n_0,bg_img_state2_carry_i_4_n_0}),
        .O(NLW_bg_img_state2_carry_O_UNCONNECTED[3:0]),
        .S({bg_img_state2_carry_i_5_n_0,bg_img_state2_carry_i_6_n_0,bg_img_state2_carry_i_7_n_0,bg_img_state2_carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 bg_img_state2_carry__0
       (.CI(bg_img_state2_carry_n_0),
        .CO({NLW_bg_img_state2_carry__0_CO_UNCONNECTED[3:1],bg_img_state2_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,bg_img_state2_carry__0_i_1_n_0}),
        .O(NLW_bg_img_state2_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,bg_img_state2_carry__0_i_2_n_0}));
  LUT2 #(
    .INIT(4'hE)) 
    bg_img_state2_carry__0_i_1
       (.I0(Y_disp_reg[9]),
        .I1(Y_disp_reg[8]),
        .O(bg_img_state2_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    bg_img_state2_carry__0_i_2
       (.I0(Y_disp_reg[8]),
        .I1(Y_disp_reg[9]),
        .O(bg_img_state2_carry__0_i_2_n_0));
  LUT3 #(
    .INIT(8'hBA)) 
    bg_img_state2_carry_i_1
       (.I0(Y_disp_reg[7]),
        .I1(Y_img_reg[6]),
        .I2(Y_disp_reg[6]),
        .O(bg_img_state2_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h4F04)) 
    bg_img_state2_carry_i_2
       (.I0(Y_img_reg[4]),
        .I1(Y_disp_reg[4]),
        .I2(Y_img_reg[5]),
        .I3(Y_disp_reg[5]),
        .O(bg_img_state2_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    bg_img_state2_carry_i_3
       (.I0(Y_disp_reg[3]),
        .I1(Y_img_reg[3]),
        .I2(Y_disp_reg[2]),
        .I3(Y_img_reg[2]),
        .O(bg_img_state2_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    bg_img_state2_carry_i_4
       (.I0(Y_disp_reg[1]),
        .I1(Y_img_reg[1]),
        .I2(Y_disp_reg[0]),
        .I3(Y_img_reg[0]),
        .O(bg_img_state2_carry_i_4_n_0));
  LUT3 #(
    .INIT(8'h09)) 
    bg_img_state2_carry_i_5
       (.I0(Y_img_reg[6]),
        .I1(Y_disp_reg[6]),
        .I2(Y_disp_reg[7]),
        .O(bg_img_state2_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    bg_img_state2_carry_i_6
       (.I0(Y_disp_reg[5]),
        .I1(Y_img_reg[5]),
        .I2(Y_disp_reg[4]),
        .I3(Y_img_reg[4]),
        .O(bg_img_state2_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    bg_img_state2_carry_i_7
       (.I0(Y_img_reg[3]),
        .I1(Y_disp_reg[3]),
        .I2(Y_img_reg[2]),
        .I3(Y_disp_reg[2]),
        .O(bg_img_state2_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    bg_img_state2_carry_i_8
       (.I0(Y_img_reg[1]),
        .I1(Y_disp_reg[1]),
        .I2(Y_img_reg[0]),
        .I3(Y_disp_reg[0]),
        .O(bg_img_state2_carry_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \bg_img_state2_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\bg_img_state2_inferred__0/i__carry_n_0 ,\bg_img_state2_inferred__0/i__carry_n_1 ,\bg_img_state2_inferred__0/i__carry_n_2 ,\bg_img_state2_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b1),
        .DI({i__carry_i_1_n_0,i__carry_i_2__0_n_0,i__carry_i_3__0_n_0,i__carry_i_4__0_n_0}),
        .O(\NLW_bg_img_state2_inferred__0/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_5_n_0,i__carry_i_6_n_0,i__carry_i_7_n_0,i__carry_i_8_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \bg_img_state2_inferred__0/i__carry__0 
       (.CI(\bg_img_state2_inferred__0/i__carry_n_0 ),
        .CO({\NLW_bg_img_state2_inferred__0/i__carry__0_CO_UNCONNECTED [3:1],\bg_img_state2_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,i__carry__0_i_1_n_0}),
        .O(\NLW_bg_img_state2_inferred__0/i__carry__0_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,i__carry__0_i_2_n_0}));
  LUT4 #(
    .INIT(16'h0040)) 
    bg_img_state_i_1
       (.I0(\_inferred__0/i__carry__1_n_2 ),
        .I1(bg_img_state2_carry__0_n_3),
        .I2(\bg_img_state2_inferred__0/i__carry__0_n_3 ),
        .I3(_carry__1_n_2),
        .O(bg_img_state_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    bg_img_state_reg
       (.C(CLK),
        .CE(1'b1),
        .D(bg_img_state_i_1_n_0),
        .Q(bg_img_state),
        .R(1'b0));
  freq_divider_out div_clk_p
       (.\B_o[0] (\B_o[0] ),
        .B_o_OBUF(B_o_OBUF),
        .\G_o[0] (\G_o[0] ),
        .G_o_OBUF(G_o_OBUF),
        .\R_o[0] (\R_o[0] ),
        .R_o_OBUF(R_o_OBUF),
        .bg_img_state(bg_img_state),
        .clk_pixel(clk_pixel),
        .douta(douta),
        .pixel_clk_o(pixel_clk_o),
        .sw_i_IBUF(sw_i_IBUF),
        .vsync_o_OBUF(vsync_o_OBUF));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry__0_i_1
       (.I0(X_disp_reg[8]),
        .I1(X_img_reg[8]),
        .O(i__carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_1__0
       (.I0(X_disp_reg[7]),
        .I1(X_img_reg[7]),
        .O(i__carry__0_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_2
       (.I0(X_disp_reg[8]),
        .I1(X_img_reg[8]),
        .O(i__carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_2__0
       (.I0(X_img_reg[6]),
        .I1(X_disp_reg[6]),
        .O(i__carry__0_i_2__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_3
       (.I0(X_img_reg[5]),
        .I1(X_disp_reg[5]),
        .O(i__carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_4
       (.I0(X_img_reg[4]),
        .I1(X_disp_reg[4]),
        .O(i__carry__0_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__1_i_1
       (.I0(X_img_reg[8]),
        .O(i__carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__1_i_2
       (.I0(X_img_reg[8]),
        .I1(X_disp_reg[8]),
        .O(i__carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h44D4)) 
    i__carry_i_1
       (.I0(X_img_reg[7]),
        .I1(X_disp_reg[7]),
        .I2(X_disp_reg[6]),
        .I3(X_img_reg[6]),
        .O(i__carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_1__1
       (.I0(X_img_reg[3]),
        .I1(X_disp_reg[3]),
        .O(i__carry_i_1__1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    i__carry_i_2__0
       (.I0(X_disp_reg[5]),
        .I1(X_img_reg[5]),
        .I2(X_disp_reg[4]),
        .I3(X_img_reg[4]),
        .O(i__carry_i_2__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_2__1
       (.I0(X_img_reg[2]),
        .I1(X_disp_reg[2]),
        .O(i__carry_i_2__1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    i__carry_i_3__0
       (.I0(X_disp_reg[3]),
        .I1(X_img_reg[3]),
        .I2(X_disp_reg[2]),
        .I3(X_img_reg[2]),
        .O(i__carry_i_3__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_3__1
       (.I0(X_img_reg[1]),
        .I1(X_disp_reg[1]),
        .O(i__carry_i_3__1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    i__carry_i_4__0
       (.I0(X_disp_reg[1]),
        .I1(X_img_reg[1]),
        .I2(X_disp_reg[0]),
        .I3(X_img_reg[0]),
        .O(i__carry_i_4__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_4__1
       (.I0(X_img_reg[0]),
        .I1(X_disp_reg[0]),
        .O(i__carry_i_4__1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_5
       (.I0(X_disp_reg[7]),
        .I1(X_img_reg[7]),
        .I2(X_img_reg[6]),
        .I3(X_disp_reg[6]),
        .O(i__carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_6
       (.I0(X_img_reg[5]),
        .I1(X_disp_reg[5]),
        .I2(X_img_reg[4]),
        .I3(X_disp_reg[4]),
        .O(i__carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_7
       (.I0(X_img_reg[3]),
        .I1(X_disp_reg[3]),
        .I2(X_img_reg[2]),
        .I3(X_disp_reg[2]),
        .O(i__carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_8
       (.I0(X_img_reg[1]),
        .I1(X_disp_reg[1]),
        .I2(X_img_reg[0]),
        .I3(X_disp_reg[0]),
        .O(i__carry_i_8_n_0));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \pixel_it[0]_i_2 
       (.I0(\pixel_it[0]_i_4_n_0 ),
        .I1(\pixel_it[0]_i_5_n_0 ),
        .I2(pixel_it_reg[12]),
        .I3(pixel_it_reg[9]),
        .I4(pixel_it_reg[13]),
        .I5(pixel_it_reg[11]),
        .O(clear));
  LUT1 #(
    .INIT(2'h1)) 
    \pixel_it[0]_i_3 
       (.I0(pixel_it_reg[0]),
        .O(\pixel_it[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \pixel_it[0]_i_4 
       (.I0(pixel_it_reg[3]),
        .I1(pixel_it_reg[1]),
        .I2(pixel_it_reg[6]),
        .I3(pixel_it_reg[2]),
        .I4(pixel_it_reg[4]),
        .I5(pixel_it_reg[7]),
        .O(\pixel_it[0]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \pixel_it[0]_i_5 
       (.I0(pixel_it_reg[10]),
        .I1(pixel_it_reg[8]),
        .I2(pixel_it_reg[5]),
        .I3(pixel_it_reg[0]),
        .O(\pixel_it[0]_i_5_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \pixel_it_reg[0] 
       (.C(clk_pixel),
        .CE(bg_img_state),
        .CLR(clear),
        .D(\pixel_it_reg[0]_i_1_n_7 ),
        .Q(pixel_it_reg[0]));
  (* ADDER_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \pixel_it_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\pixel_it_reg[0]_i_1_n_0 ,\pixel_it_reg[0]_i_1_n_1 ,\pixel_it_reg[0]_i_1_n_2 ,\pixel_it_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\pixel_it_reg[0]_i_1_n_4 ,\pixel_it_reg[0]_i_1_n_5 ,\pixel_it_reg[0]_i_1_n_6 ,\pixel_it_reg[0]_i_1_n_7 }),
        .S({pixel_it_reg[3:1],\pixel_it[0]_i_3_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \pixel_it_reg[10] 
       (.C(clk_pixel),
        .CE(bg_img_state),
        .CLR(clear),
        .D(\pixel_it_reg[8]_i_1_n_5 ),
        .Q(pixel_it_reg[10]));
  FDCE #(
    .INIT(1'b0)) 
    \pixel_it_reg[11] 
       (.C(clk_pixel),
        .CE(bg_img_state),
        .CLR(clear),
        .D(\pixel_it_reg[8]_i_1_n_4 ),
        .Q(pixel_it_reg[11]));
  FDCE #(
    .INIT(1'b0)) 
    \pixel_it_reg[12] 
       (.C(clk_pixel),
        .CE(bg_img_state),
        .CLR(clear),
        .D(\pixel_it_reg[12]_i_1_n_7 ),
        .Q(pixel_it_reg[12]));
  (* ADDER_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \pixel_it_reg[12]_i_1 
       (.CI(\pixel_it_reg[8]_i_1_n_0 ),
        .CO({\NLW_pixel_it_reg[12]_i_1_CO_UNCONNECTED [3:1],\pixel_it_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_pixel_it_reg[12]_i_1_O_UNCONNECTED [3:2],\pixel_it_reg[12]_i_1_n_6 ,\pixel_it_reg[12]_i_1_n_7 }),
        .S({1'b0,1'b0,pixel_it_reg[13:12]}));
  FDCE #(
    .INIT(1'b0)) 
    \pixel_it_reg[13] 
       (.C(clk_pixel),
        .CE(bg_img_state),
        .CLR(clear),
        .D(\pixel_it_reg[12]_i_1_n_6 ),
        .Q(pixel_it_reg[13]));
  FDCE #(
    .INIT(1'b0)) 
    \pixel_it_reg[1] 
       (.C(clk_pixel),
        .CE(bg_img_state),
        .CLR(clear),
        .D(\pixel_it_reg[0]_i_1_n_6 ),
        .Q(pixel_it_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \pixel_it_reg[2] 
       (.C(clk_pixel),
        .CE(bg_img_state),
        .CLR(clear),
        .D(\pixel_it_reg[0]_i_1_n_5 ),
        .Q(pixel_it_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \pixel_it_reg[3] 
       (.C(clk_pixel),
        .CE(bg_img_state),
        .CLR(clear),
        .D(\pixel_it_reg[0]_i_1_n_4 ),
        .Q(pixel_it_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \pixel_it_reg[4] 
       (.C(clk_pixel),
        .CE(bg_img_state),
        .CLR(clear),
        .D(\pixel_it_reg[4]_i_1_n_7 ),
        .Q(pixel_it_reg[4]));
  (* ADDER_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \pixel_it_reg[4]_i_1 
       (.CI(\pixel_it_reg[0]_i_1_n_0 ),
        .CO({\pixel_it_reg[4]_i_1_n_0 ,\pixel_it_reg[4]_i_1_n_1 ,\pixel_it_reg[4]_i_1_n_2 ,\pixel_it_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pixel_it_reg[4]_i_1_n_4 ,\pixel_it_reg[4]_i_1_n_5 ,\pixel_it_reg[4]_i_1_n_6 ,\pixel_it_reg[4]_i_1_n_7 }),
        .S(pixel_it_reg[7:4]));
  FDCE #(
    .INIT(1'b0)) 
    \pixel_it_reg[5] 
       (.C(clk_pixel),
        .CE(bg_img_state),
        .CLR(clear),
        .D(\pixel_it_reg[4]_i_1_n_6 ),
        .Q(pixel_it_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \pixel_it_reg[6] 
       (.C(clk_pixel),
        .CE(bg_img_state),
        .CLR(clear),
        .D(\pixel_it_reg[4]_i_1_n_5 ),
        .Q(pixel_it_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \pixel_it_reg[7] 
       (.C(clk_pixel),
        .CE(bg_img_state),
        .CLR(clear),
        .D(\pixel_it_reg[4]_i_1_n_4 ),
        .Q(pixel_it_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \pixel_it_reg[8] 
       (.C(clk_pixel),
        .CE(bg_img_state),
        .CLR(clear),
        .D(\pixel_it_reg[8]_i_1_n_7 ),
        .Q(pixel_it_reg[8]));
  (* ADDER_THRESHOLD = "11" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \pixel_it_reg[8]_i_1 
       (.CI(\pixel_it_reg[4]_i_1_n_0 ),
        .CO({\pixel_it_reg[8]_i_1_n_0 ,\pixel_it_reg[8]_i_1_n_1 ,\pixel_it_reg[8]_i_1_n_2 ,\pixel_it_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pixel_it_reg[8]_i_1_n_4 ,\pixel_it_reg[8]_i_1_n_5 ,\pixel_it_reg[8]_i_1_n_6 ,\pixel_it_reg[8]_i_1_n_7 }),
        .S(pixel_it_reg[11:8]));
  FDCE #(
    .INIT(1'b0)) 
    \pixel_it_reg[9] 
       (.C(clk_pixel),
        .CE(bg_img_state),
        .CLR(clear),
        .D(\pixel_it_reg[8]_i_1_n_6 ),
        .Q(pixel_it_reg[9]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 78592)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
