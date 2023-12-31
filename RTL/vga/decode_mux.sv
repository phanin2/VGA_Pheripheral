// https://github.com/shirriff/vga-fpga-fizzbuzz/blob/master/src/chars.v

module decode_mux(
    input logic [3:0] decimal,
    input logic [3:0] bitmap_row_index,
    output logic [7:0] bitmap_row
    );

always @(*)
  case ({decimal, bitmap_row_index})

    // 0
    8'b00000000: bitmap_row = 8'b00111100;
    8'b00000001: bitmap_row = 8'b01100110;
    8'b00000010: bitmap_row = 8'b11000011;
    8'b00000011: bitmap_row = 8'b11000111;
    8'b00000100: bitmap_row = 8'b11001111;
    8'b00000101: bitmap_row = 8'b11011011;
    8'b00000110: bitmap_row = 8'b11110011;
    8'b00000111: bitmap_row = 8'b11100011;
    8'b00001000: bitmap_row = 8'b11000011;
    8'b00001001: bitmap_row = 8'b01100110;
    8'b00001010: bitmap_row = 8'b00111100;
    8'b00001011: bitmap_row = 8'b00000000;

    // 1
    8'b00010000: bitmap_row = 8'b00011000;
    8'b00010001: bitmap_row = 8'b00111000;
    8'b00010010: bitmap_row = 8'b01111000;
    8'b00010011: bitmap_row = 8'b00011000;
    8'b00010100: bitmap_row = 8'b00011000;
    8'b00010101: bitmap_row = 8'b00011000;
    8'b00010110: bitmap_row = 8'b00011000;
    8'b00010111: bitmap_row = 8'b00011000;
    8'b00011000: bitmap_row = 8'b00011000;
    8'b00011001: bitmap_row = 8'b00011000;
    8'b00011010: bitmap_row = 8'b01111110;
    8'b00011011: bitmap_row = 8'b00000000;

    // 2
    8'b00100000: bitmap_row = 8'b01111110;
    8'b00100001: bitmap_row = 8'b11100111;
    8'b00100010: bitmap_row = 8'b00000011;
    8'b00100011: bitmap_row = 8'b00000110;
    8'b00100100: bitmap_row = 8'b00001100;
    8'b00100101: bitmap_row = 8'b00011000;
    8'b00100110: bitmap_row = 8'b00110000;
    8'b00100111: bitmap_row = 8'b01100000;
    8'b00101000: bitmap_row = 8'b11000000;
    8'b00101001: bitmap_row = 8'b11000000;
    8'b00101010: bitmap_row = 8'b11111111;
    8'b00101011: bitmap_row = 8'b00000000;

    // 3
    8'b00110000: bitmap_row = 8'b01111110;
    8'b00110001: bitmap_row = 8'b11100111;
    8'b00110010: bitmap_row = 8'b00000011;
    8'b00110011: bitmap_row = 8'b00000011;
    8'b00110100: bitmap_row = 8'b00000111;
    8'b00110101: bitmap_row = 8'b01111110;
    8'b00110110: bitmap_row = 8'b00000111;
    8'b00110111: bitmap_row = 8'b00000011;
    8'b00111000: bitmap_row = 8'b00000011;
    8'b00111001: bitmap_row = 8'b11100111;
    8'b00111010: bitmap_row = 8'b01111110;
    8'b00111011: bitmap_row = 8'b00000000;

    // 4
    8'b01000000: bitmap_row = 8'b00001100;
    8'b01000001: bitmap_row = 8'b00011100;
    8'b01000010: bitmap_row = 8'b00111100;
    8'b01000011: bitmap_row = 8'b01101100;
    8'b01000100: bitmap_row = 8'b11001100;
    8'b01000101: bitmap_row = 8'b11111111;
    8'b01000110: bitmap_row = 8'b00001100;
    8'b01000111: bitmap_row = 8'b00001100;
    8'b01001000: bitmap_row = 8'b00001100;
    8'b01001001: bitmap_row = 8'b00001100;
    8'b01001010: bitmap_row = 8'b00001100;
    8'b01001011: bitmap_row = 8'b00000000;

    // 5
    8'b01010000: bitmap_row = 8'b11111111;
    8'b01010001: bitmap_row = 8'b11000000;
    8'b01010010: bitmap_row = 8'b11000000;
    8'b01010011: bitmap_row = 8'b11000000;
    8'b01010100: bitmap_row = 8'b11000000;
    8'b01010101: bitmap_row = 8'b11111110;
    8'b01010110: bitmap_row = 8'b00000111;
    8'b01010111: bitmap_row = 8'b00000011;
    8'b01011000: bitmap_row = 8'b00000011;
    8'b01011001: bitmap_row = 8'b11100111;
    8'b01011010: bitmap_row = 8'b01111110;
    8'b01011011: bitmap_row = 8'b00000000;

    // 6
    8'b01100000: bitmap_row = 8'b01111110;
    8'b01100001: bitmap_row = 8'b11100111;
    8'b01100010: bitmap_row = 8'b11000000;
    8'b01100011: bitmap_row = 8'b11000000;
    8'b01100100: bitmap_row = 8'b11000000;
    8'b01100101: bitmap_row = 8'b11111110;
    8'b01100110: bitmap_row = 8'b11000111;
    8'b01100111: bitmap_row = 8'b11000011;
    8'b01101000: bitmap_row = 8'b11000011;
    8'b01101001: bitmap_row = 8'b11100111;
    8'b01101010: bitmap_row = 8'b01111110;
    8'b01101011: bitmap_row = 8'b00000000;

    // 7
    8'b01110000: bitmap_row = 8'b11111111;
    8'b01110001: bitmap_row = 8'b00000011;
    8'b01110010: bitmap_row = 8'b00000011;
    8'b01110011: bitmap_row = 8'b00000011;
    8'b01110100: bitmap_row = 8'b00000110;
    8'b01110101: bitmap_row = 8'b00001100;
    8'b01110110: bitmap_row = 8'b00011000;
    8'b01110111: bitmap_row = 8'b00110000;
    8'b01111000: bitmap_row = 8'b00110000;
    8'b01111001: bitmap_row = 8'b00110000;
    8'b01111010: bitmap_row = 8'b00110000;
    8'b01111011: bitmap_row = 8'b00000000;

    // 8
    8'b10000000: bitmap_row = 8'b01111110;
    8'b10000001: bitmap_row = 8'b11100111;
    8'b10000010: bitmap_row = 8'b11000011;
    8'b10000011: bitmap_row = 8'b11000011;
    8'b10000100: bitmap_row = 8'b11100111;
    8'b10000101: bitmap_row = 8'b01111110;
    8'b10000110: bitmap_row = 8'b11100111;
    8'b10000111: bitmap_row = 8'b11000011;
    8'b10001000: bitmap_row = 8'b11000011;
    8'b10001001: bitmap_row = 8'b11100111;
    8'b10001010: bitmap_row = 8'b01111110;
    8'b10001011: bitmap_row = 8'b00000000;

    // 9
    8'b10010000: bitmap_row = 8'b01111110;
    8'b10010001: bitmap_row = 8'b11100111;
    8'b10010010: bitmap_row = 8'b11000011;
    8'b10010011: bitmap_row = 8'b11000011;
    8'b10010100: bitmap_row = 8'b11100111;
    8'b10010101: bitmap_row = 8'b01111111;
    8'b10010110: bitmap_row = 8'b00000011;
    8'b10010111: bitmap_row = 8'b00000011;
    8'b10011000: bitmap_row = 8'b00000011;
    8'b10011001: bitmap_row = 8'b11100111;
    8'b10011010: bitmap_row = 8'b01111110;
    8'b10011011: bitmap_row = 8'b00000000;

    default: bitmap_row = 8'b00000000;

  endcase
endmodule