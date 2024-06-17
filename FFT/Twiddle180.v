module Twiddle180 #(
    parameter   TW_FF = 0   //  Use Output Register
)(
    input           clk,  //  Master Clock
    input   [10:0]   addr,   //  Twiddle Factor Number
    output  [17:0]  tw_re,  //  Twiddle Factor (Real)
    output  [17:0]  tw_im   //  Twiddle Factor (Imag)
);

wire[17:0]  wn_re[0:179];   //  Twiddle Table (Real)
wire[17:0]  wn_im[0:179];   //  Twiddle Table (Imag)
wire[17:0]  mx_re;          //  Multiplexer output (Real)
wire[17:0]  mx_im;          //  Multiplexer output (Imag)
reg [17:0]  ff_re;          //  Register output (Real)
reg [17:0]  ff_im;          //  Register output (Imag)

assign  mx_re = addr<180 ? wn_re[addr] : 0;
assign  mx_im = addr<180 ? wn_im[addr] : 0;

always @(posedge clk) begin
    ff_re <= mx_re;
    ff_im <= mx_im;
end

assign  tw_re = TW_FF ? ff_re : mx_re;
assign  tw_im = TW_FF ? ff_im : mx_im;
assign wn_re[0] = 18'b000000010000000000; assign wn_im[0] = 18'b000000000000000000; 
assign wn_re[1] = 18'b000000001111111111; assign wn_im[1] = 18'b111111111111011100; 
assign wn_re[2] = 18'b000000001111111101; assign wn_im[2] = 18'b111111111110111000; 
assign wn_re[3] = 18'b000000001111111010; assign wn_im[3] = 18'b111111111110010100; 
assign wn_re[4] = 18'b000000001111110110; assign wn_im[4] = 18'b111111111101110001; 
assign wn_re[5] = 18'b000000001111110000; assign wn_im[5] = 18'b111111111101001110; 
assign wn_re[6] = 18'b000000001111101001; assign wn_im[6] = 18'b111111111100101011; 
assign wn_re[7] = 18'b000000001111100001; assign wn_im[7] = 18'b111111111100001000; 
assign wn_re[8] = 18'b000000001111011000; assign wn_im[8] = 18'b111111111011100101; 
assign wn_re[9] = 18'b000000001111001101; assign wn_im[9] = 18'b111111111011000011; 
assign wn_re[10] = 18'b000000001111000010; assign wn_im[10] = 18'b111111111010100001; 
assign wn_re[11] = 18'b000000001110110101; assign wn_im[11] = 18'b111111111010000000; 
assign wn_re[12] = 18'b000000001110100111; assign wn_im[12] = 18'b111111111001011111; 
assign wn_re[13] = 18'b000000001110011000; assign wn_im[13] = 18'b111111111000111111; 
assign wn_re[14] = 18'b000000001110001000; assign wn_im[14] = 18'b111111111000011111; 
assign wn_re[15] = 18'b000000001101110110; assign wn_im[15] = 18'b111111111000000000; 
assign wn_re[16] = 18'b000000001101100100; assign wn_im[16] = 18'b111111110111100001; 
assign wn_re[17] = 18'b000000001101010000; assign wn_im[17] = 18'b111111110111000011; 
assign wn_re[18] = 18'b000000001100111100; assign wn_im[18] = 18'b111111110110100110; 
assign wn_re[19] = 18'b000000001100100110; assign wn_im[19] = 18'b111111110110001001; 
assign wn_re[20] = 18'b000000001100010000; assign wn_im[20] = 18'b111111110101101101; 
assign wn_re[21] = 18'b000000001011111000; assign wn_im[21] = 18'b111111110101010010; 
assign wn_re[22] = 18'b000000001011100000; assign wn_im[22] = 18'b111111110100111000; 
assign wn_re[23] = 18'b000000001011000111; assign wn_im[23] = 18'b111111110100011111; 
assign wn_re[24] = 18'b000000001010101101; assign wn_im[24] = 18'b111111110100000111; 
assign wn_re[25] = 18'b000000001010010010; assign wn_im[25] = 18'b111111110011101111; 
assign wn_re[26] = 18'b000000001001110110; assign wn_im[26] = 18'b111111110011011001; 
assign wn_re[27] = 18'b000000001001011001; assign wn_im[27] = 18'b111111110011000011; 
assign wn_re[28] = 18'b000000001000111100; assign wn_im[28] = 18'b111111110010101111; 
assign wn_re[29] = 18'b000000001000011110; assign wn_im[29] = 18'b111111110010011011; 
assign wn_re[30] = 18'b000000001000000000; assign wn_im[30] = 18'b111111110010001001; 
assign wn_re[31] = 18'b000000000111100000; assign wn_im[31] = 18'b111111110001110111; 
assign wn_re[32] = 18'b000000000111000000; assign wn_im[32] = 18'b111111110001100111; 
assign wn_re[33] = 18'b000000000110100000; assign wn_im[33] = 18'b111111110001011000; 
assign wn_re[34] = 18'b000000000101111111; assign wn_im[34] = 18'b111111110001001010; 
assign wn_re[35] = 18'b000000000101011110; assign wn_im[35] = 18'b111111110000111101; 
assign wn_re[36] = 18'b000000000100111100; assign wn_im[36] = 18'b111111110000110010; 
assign wn_re[37] = 18'b000000000100011010; assign wn_im[37] = 18'b111111110000100111; 
assign wn_re[38] = 18'b000000000011110111; assign wn_im[38] = 18'b111111110000011110; 
assign wn_re[39] = 18'b000000000011010100; assign wn_im[39] = 18'b111111110000010110; 
assign wn_re[40] = 18'b000000000010110001; assign wn_im[40] = 18'b111111110000001111; 
assign wn_re[41] = 18'b000000000010001110; assign wn_im[41] = 18'b111111110000001001; 
assign wn_re[42] = 18'b000000000001101011; assign wn_im[42] = 18'b111111110000000101; 
assign wn_re[43] = 18'b000000000001000111; assign wn_im[43] = 18'b111111110000000010; 
assign wn_re[44] = 18'b000000000000100011; assign wn_im[44] = 18'b111111110000000000; 
assign wn_re[45] = 18'b000000000000000000; assign wn_im[45] = 18'b111111110000000000; 
assign wn_re[46] = 18'b111111111111011100; assign wn_im[46] = 18'b111111110000000000; 
assign wn_re[47] = 18'b111111111110111000; assign wn_im[47] = 18'b111111110000000010; 
assign wn_re[48] = 18'b111111111110010100; assign wn_im[48] = 18'b111111110000000101; 
assign wn_re[49] = 18'b111111111101110001; assign wn_im[49] = 18'b111111110000001001; 
assign wn_re[50] = 18'b111111111101001110; assign wn_im[50] = 18'b111111110000001111; 
assign wn_re[51] = 18'b111111111100101011; assign wn_im[51] = 18'b111111110000010110; 
assign wn_re[52] = 18'b111111111100001000; assign wn_im[52] = 18'b111111110000011110; 
assign wn_re[53] = 18'b111111111011100101; assign wn_im[53] = 18'b111111110000100111; 
assign wn_re[54] = 18'b111111111011000011; assign wn_im[54] = 18'b111111110000110010; 
assign wn_re[55] = 18'b111111111010100001; assign wn_im[55] = 18'b111111110000111101; 
assign wn_re[56] = 18'b111111111010000000; assign wn_im[56] = 18'b111111110001001010; 
assign wn_re[57] = 18'b111111111001011111; assign wn_im[57] = 18'b111111110001011000; 
assign wn_re[58] = 18'b111111111000111111; assign wn_im[58] = 18'b111111110001100111; 
assign wn_re[59] = 18'b111111111000011111; assign wn_im[59] = 18'b111111110001110111; 
assign wn_re[60] = 18'b111111111000000000; assign wn_im[60] = 18'b111111110010001001; 
assign wn_re[61] = 18'b111111110111100001; assign wn_im[61] = 18'b111111110010011011; 
assign wn_re[62] = 18'b111111110111000011; assign wn_im[62] = 18'b111111110010101111; 
assign wn_re[63] = 18'b111111110110100110; assign wn_im[63] = 18'b111111110011000011; 
assign wn_re[64] = 18'b111111110110001001; assign wn_im[64] = 18'b111111110011011001; 
assign wn_re[65] = 18'b111111110101101101; assign wn_im[65] = 18'b111111110011101111; 
assign wn_re[66] = 18'b111111110101010010; assign wn_im[66] = 18'b111111110100000111; 
assign wn_re[67] = 18'b111111110100111000; assign wn_im[67] = 18'b111111110100011111; 
assign wn_re[68] = 18'b111111110100011111; assign wn_im[68] = 18'b111111110100111000; 
assign wn_re[69] = 18'b111111110100000111; assign wn_im[69] = 18'b111111110101010010; 
assign wn_re[70] = 18'b111111110011101111; assign wn_im[70] = 18'b111111110101101101; 
assign wn_re[71] = 18'b111111110011011001; assign wn_im[71] = 18'b111111110110001001; 
assign wn_re[72] = 18'b111111110011000011; assign wn_im[72] = 18'b111111110110100110; 
assign wn_re[73] = 18'b111111110010101111; assign wn_im[73] = 18'b111111110111000011; 
assign wn_re[74] = 18'b111111110010011011; assign wn_im[74] = 18'b111111110111100001; 
assign wn_re[75] = 18'b111111110010001001; assign wn_im[75] = 18'b111111111000000000; 
assign wn_re[76] = 18'b111111110001110111; assign wn_im[76] = 18'b111111111000011111; 
assign wn_re[77] = 18'b111111110001100111; assign wn_im[77] = 18'b111111111000111111; 
assign wn_re[78] = 18'b111111110001011000; assign wn_im[78] = 18'b111111111001011111; 
assign wn_re[79] = 18'b111111110001001010; assign wn_im[79] = 18'b111111111010000000; 
assign wn_re[80] = 18'b111111110000111101; assign wn_im[80] = 18'b111111111010100001; 
assign wn_re[81] = 18'b111111110000110010; assign wn_im[81] = 18'b111111111011000011; 
assign wn_re[82] = 18'b111111110000100111; assign wn_im[82] = 18'b111111111011100101; 
assign wn_re[83] = 18'b111111110000011110; assign wn_im[83] = 18'b111111111100001000; 
assign wn_re[84] = 18'b111111110000010110; assign wn_im[84] = 18'b111111111100101011; 
assign wn_re[85] = 18'b111111110000001111; assign wn_im[85] = 18'b111111111101001110; 
assign wn_re[86] = 18'b111111110000001001; assign wn_im[86] = 18'b111111111101110001; 
assign wn_re[87] = 18'b111111110000000101; assign wn_im[87] = 18'b111111111110010100; 
assign wn_re[88] = 18'b111111110000000010; assign wn_im[88] = 18'b111111111110111000; 
assign wn_re[89] = 18'b111111110000000000; assign wn_im[89] = 18'b111111111111011100; 
assign wn_re[90] = 18'b111111110000000000; assign wn_im[90] = 18'b111111111111111111; 
assign wn_re[91] = 18'b111111110000000000; assign wn_im[91] = 18'b000000000000100011; 
assign wn_re[92] = 18'b111111110000000010; assign wn_im[92] = 18'b000000000001000111; 
assign wn_re[93] = 18'b111111110000000101; assign wn_im[93] = 18'b000000000001101011; 
assign wn_re[94] = 18'b111111110000001001; assign wn_im[94] = 18'b000000000010001110; 
assign wn_re[95] = 18'b111111110000001111; assign wn_im[95] = 18'b000000000010110001; 
assign wn_re[96] = 18'b111111110000010110; assign wn_im[96] = 18'b000000000011010100; 
assign wn_re[97] = 18'b111111110000011110; assign wn_im[97] = 18'b000000000011110111; 
assign wn_re[98] = 18'b111111110000100111; assign wn_im[98] = 18'b000000000100011010; 
assign wn_re[99] = 18'b111111110000110010; assign wn_im[99] = 18'b000000000100111100; 
assign wn_re[100] = 18'b111111110000111101; assign wn_im[100] = 18'b000000000101011110; 
assign wn_re[101] = 18'b111111110001001010; assign wn_im[101] = 18'b000000000101111111; 
assign wn_re[102] = 18'b111111110001011000; assign wn_im[102] = 18'b000000000110100000; 
assign wn_re[103] = 18'b111111110001100111; assign wn_im[103] = 18'b000000000111000000; 
assign wn_re[104] = 18'b111111110001110111; assign wn_im[104] = 18'b000000000111100000; 
assign wn_re[105] = 18'b111111110010001001; assign wn_im[105] = 18'b000000001000000000; 
assign wn_re[106] = 18'b111111110010011011; assign wn_im[106] = 18'b000000001000011110; 
assign wn_re[107] = 18'b111111110010101111; assign wn_im[107] = 18'b000000001000111100; 
assign wn_re[108] = 18'b111111110011000011; assign wn_im[108] = 18'b000000001001011001; 
assign wn_re[109] = 18'b111111110011011001; assign wn_im[109] = 18'b000000001001110110; 
assign wn_re[110] = 18'b111111110011101111; assign wn_im[110] = 18'b000000001010010010; 
assign wn_re[111] = 18'b111111110100000111; assign wn_im[111] = 18'b000000001010101101; 
assign wn_re[112] = 18'b111111110100011111; assign wn_im[112] = 18'b000000001011000111; 
assign wn_re[113] = 18'b111111110100111000; assign wn_im[113] = 18'b000000001011100000; 
assign wn_re[114] = 18'b111111110101010010; assign wn_im[114] = 18'b000000001011111000; 
assign wn_re[115] = 18'b111111110101101101; assign wn_im[115] = 18'b000000001100010000; 
assign wn_re[116] = 18'b111111110110001001; assign wn_im[116] = 18'b000000001100100110; 
assign wn_re[117] = 18'b111111110110100110; assign wn_im[117] = 18'b000000001100111100; 
assign wn_re[118] = 18'b111111110111000011; assign wn_im[118] = 18'b000000001101010000; 
assign wn_re[119] = 18'b111111110111100001; assign wn_im[119] = 18'b000000001101100100; 
assign wn_re[120] = 18'b111111110111111111; assign wn_im[120] = 18'b000000001101110110; 
assign wn_re[121] = 18'b111111111000011111; assign wn_im[121] = 18'b000000001110001000; 
assign wn_re[122] = 18'b111111111000111111; assign wn_im[122] = 18'b000000001110011000; 
assign wn_re[123] = 18'b111111111001011111; assign wn_im[123] = 18'b000000001110100111; 
assign wn_re[124] = 18'b111111111010000000; assign wn_im[124] = 18'b000000001110110101; 
assign wn_re[125] = 18'b111111111010100001; assign wn_im[125] = 18'b000000001111000010; 
assign wn_re[126] = 18'b111111111011000011; assign wn_im[126] = 18'b000000001111001101; 
assign wn_re[127] = 18'b111111111011100101; assign wn_im[127] = 18'b000000001111011000; 
assign wn_re[128] = 18'b111111111100001000; assign wn_im[128] = 18'b000000001111100001; 
assign wn_re[129] = 18'b111111111100101011; assign wn_im[129] = 18'b000000001111101001; 
assign wn_re[130] = 18'b111111111101001110; assign wn_im[130] = 18'b000000001111110000; 
assign wn_re[131] = 18'b111111111101110001; assign wn_im[131] = 18'b000000001111110110; 
assign wn_re[132] = 18'b111111111110010100; assign wn_im[132] = 18'b000000001111111010; 
assign wn_re[133] = 18'b111111111110111000; assign wn_im[133] = 18'b000000001111111101; 
assign wn_re[134] = 18'b111111111111011100; assign wn_im[134] = 18'b000000001111111111; 
assign wn_re[135] = 18'b111111111111111111; assign wn_im[135] = 18'b000000010000000000; 
assign wn_re[136] = 18'b000000000000100011; assign wn_im[136] = 18'b000000001111111111; 
assign wn_re[137] = 18'b000000000001000111; assign wn_im[137] = 18'b000000001111111101; 
assign wn_re[138] = 18'b000000000001101011; assign wn_im[138] = 18'b000000001111111010; 
assign wn_re[139] = 18'b000000000010001110; assign wn_im[139] = 18'b000000001111110110; 
assign wn_re[140] = 18'b000000000010110001; assign wn_im[140] = 18'b000000001111110000; 
assign wn_re[141] = 18'b000000000011010100; assign wn_im[141] = 18'b000000001111101001; 
assign wn_re[142] = 18'b000000000011110111; assign wn_im[142] = 18'b000000001111100001; 
assign wn_re[143] = 18'b000000000100011010; assign wn_im[143] = 18'b000000001111011000; 
assign wn_re[144] = 18'b000000000100111100; assign wn_im[144] = 18'b000000001111001101; 
assign wn_re[145] = 18'b000000000101011110; assign wn_im[145] = 18'b000000001111000010; 
assign wn_re[146] = 18'b000000000101111111; assign wn_im[146] = 18'b000000001110110101; 
assign wn_re[147] = 18'b000000000110100000; assign wn_im[147] = 18'b000000001110100111; 
assign wn_re[148] = 18'b000000000111000000; assign wn_im[148] = 18'b000000001110011000; 
assign wn_re[149] = 18'b000000000111100000; assign wn_im[149] = 18'b000000001110001000; 
assign wn_re[150] = 18'b000000001000000000; assign wn_im[150] = 18'b000000001101110110; 
assign wn_re[151] = 18'b000000001000011110; assign wn_im[151] = 18'b000000001101100100; 
assign wn_re[152] = 18'b000000001000111100; assign wn_im[152] = 18'b000000001101010000; 
assign wn_re[153] = 18'b000000001001011001; assign wn_im[153] = 18'b000000001100111100; 
assign wn_re[154] = 18'b000000001001110110; assign wn_im[154] = 18'b000000001100100110; 
assign wn_re[155] = 18'b000000001010010010; assign wn_im[155] = 18'b000000001100010000; 
assign wn_re[156] = 18'b000000001010101101; assign wn_im[156] = 18'b000000001011111000; 
assign wn_re[157] = 18'b000000001011000111; assign wn_im[157] = 18'b000000001011100000; 
assign wn_re[158] = 18'b000000001011100000; assign wn_im[158] = 18'b000000001011000111; 
assign wn_re[159] = 18'b000000001011111000; assign wn_im[159] = 18'b000000001010101101; 
assign wn_re[160] = 18'b000000001100010000; assign wn_im[160] = 18'b000000001010010010; 
assign wn_re[161] = 18'b000000001100100110; assign wn_im[161] = 18'b000000001001110110; 
assign wn_re[162] = 18'b000000001100111100; assign wn_im[162] = 18'b000000001001011001; 
assign wn_re[163] = 18'b000000001101010000; assign wn_im[163] = 18'b000000001000111100; 
assign wn_re[164] = 18'b000000001101100100; assign wn_im[164] = 18'b000000001000011110; 
assign wn_re[165] = 18'b000000001101110110; assign wn_im[165] = 18'b000000001000000000; 
assign wn_re[166] = 18'b000000001110001000; assign wn_im[166] = 18'b000000000111100000; 
assign wn_re[167] = 18'b000000001110011000; assign wn_im[167] = 18'b000000000111000000; 
assign wn_re[168] = 18'b000000001110100111; assign wn_im[168] = 18'b000000000110100000; 
assign wn_re[169] = 18'b000000001110110101; assign wn_im[169] = 18'b000000000101111111; 
assign wn_re[170] = 18'b000000001111000010; assign wn_im[170] = 18'b000000000101011110; 
assign wn_re[171] = 18'b000000001111001101; assign wn_im[171] = 18'b000000000100111100; 
assign wn_re[172] = 18'b000000001111011000; assign wn_im[172] = 18'b000000000100011010; 
assign wn_re[173] = 18'b000000001111100001; assign wn_im[173] = 18'b000000000011110111; 
assign wn_re[174] = 18'b000000001111101001; assign wn_im[174] = 18'b000000000011010100; 
assign wn_re[175] = 18'b000000001111110000; assign wn_im[175] = 18'b000000000010110001; 
assign wn_re[176] = 18'b000000001111110110; assign wn_im[176] = 18'b000000000010001110; 
assign wn_re[177] = 18'b000000001111111010; assign wn_im[177] = 18'b000000000001101011; 
assign wn_re[178] = 18'b000000001111111101; assign wn_im[178] = 18'b000000000001000111; 
assign wn_re[179] = 18'b000000001111111111; assign wn_im[179] = 18'b000000000000100011; 

endmodule
