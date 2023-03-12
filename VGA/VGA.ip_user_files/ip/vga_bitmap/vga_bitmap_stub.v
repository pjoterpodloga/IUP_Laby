// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Mar 11 16:56:27 2023
// Host        : DESKTOP-G1E6JH8 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               j:/Kody/vhdl/IUP_Laby/VGA/VGA.gen/sources_1/ip/vga_bitmap/vga_bitmap_stub.v
// Design      : vga_bitmap
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *)
module vga_bitmap(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[13:0],douta[7:0]" */;
  input clka;
  input [13:0]addra;
  output [7:0]douta;
endmodule
