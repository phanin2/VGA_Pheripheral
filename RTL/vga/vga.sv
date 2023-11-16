
module vga(
    vga_clk, wb_clk_i, wb_rst_i, wb_cyc_i, wb_adr_i, wb_dat_i, wb_sel_i, wb_we_i, wb_stb_i,
	wb_dat_o, wb_ack_o, wb_err_o, wb_inta_o, vga_r, vga_g, vga_b, h_sync, v_sync 
);

input             vga_clk; //VGA Clock
input             wb_clk_i;	// Clock
input             wb_rst_i;	// Reset
input             wb_cyc_i;	// cycle valid input
input   [8-1:0]	wb_adr_i;	// address bus inputs
input   [31:0]	wb_dat_i;	// input data bus
input	  [3:0]     wb_sel_i;	// byte select inputs
input             wb_we_i;	// indicates write transfer
input             wb_stb_i;	// strobe input
output reg [31:0]  wb_dat_o;	// output data bus
output wire            wb_ack_o;	// normal termination
output wire            wb_err_o;	// termination w/ error
output wire           wb_inta_o;
output logic  [3:0] vga_r, vga_b, vga_g;
output logic h_sync, v_sync;

logic horiz_sync, vert_sync, video_on;
logic [11:0] pixel_row, pixel_column;
logic [31:0] pix_num;
logic [3:0] decimal;
logic [3:0] bitmap_row_index;
logic [7:0] bitmap_row;
logic [9:0] start_row, start_col;
logic [7:0] data_buffer;
logic display_vlaue;
logic [3:0] red, green, blue;
logic [2:0] bitmap_col_index;

parameter DECIMAL_START = 8'h30;
parameter DECIMAL_END = 8'h39;
parameter BITMAP_ROWS = 12;
parameter BITMAP_COLUMNS = 8;

assign h_sync = horiz_sync;
assign v_sync = vert_sync;

wire reg_we = wb_clk_i & wb_stb_i & wb_we_i & !wb_ack_o;
assign resetn = ~wb_rst_i;
assign wb_err_o = 1'b0;

assign display_vlaue = (pixel_row >= start_row) && (pixel_row < (start_row+BITMAP_ROWS)) && (pixel_column >= start_col) && (pixel_column < (start_col+BITMAP_COLUMNS));

dtg dtg1(
    .*,
    .clock(vga_clk),
    .rst(wb_rst_i)
);

decode_mux d_mux(
    .decimal,
    .bitmap_row_index,
    .bitmap_row
);

logic wb_ack;

assign wb_ack_o = wb_ack;

always @(posedge wb_clk_i or posedge wb_rst_i) begin
   if(wb_rst_i) begin									// Reset value to 0
		wb_ack = 0;
        data_buffer = 0;
        start_row = 0;
        start_col = 0;
   end
   else begin
		wb_ack = !wb_ack & wb_stb_i & wb_cyc_i;		// Sending acknowledgment

       if(wb_ack && wb_we_i) begin
            case(wb_adr_i[5:2])								// Write to peripheral registers based on address
                0: begin
                    start_row = wb_dat_i[19:10];
                    start_col = wb_dat_i[9:0];
                    end
                3: data_buffer = wb_dat_i[7:0];
            endcase
       end
    end 
end
  
//   assign data_buffer = 49;
//   assign start_row = 255;
//   assign start_col = 175;
  always @(posedge vga_clk) begin
    if(video_on) begin

            if(display_vlaue) begin
               vga_r = red;
               vga_g = green;
               vga_b = blue; 
            end 
            else begin
                vga_r = '1;
                vga_g = 0;
                vga_b = 0; 
            end
    end
    else begin
            vga_r = 0;
            vga_g = 0;
            vga_b = 0; 
    end
  end
  
  always @(*) begin
    
        if(data_buffer >= DECIMAL_START && data_buffer <= DECIMAL_END) begin
            decimal = data_buffer - DECIMAL_START;
        end

        if(display_vlaue) begin
            bitmap_row_index = pixel_row - start_row;
            bitmap_col_index = 7 - (pixel_column - start_col);
            red = {4{bitmap_row[bitmap_col_index]}};
            green = {4{bitmap_row[bitmap_col_index]}};
            blue = {4{bitmap_row[bitmap_col_index]}}; 
        end 
        
        
   end

   always @(wb_adr_i or start_row or start_col or data_buffer) begin
	case(wb_adr_i[5:2])									// Read from peripheral registers based on address
       1: wb_dat_o = {12'b0, start_row, start_col};
       2: wb_dat_o = data_buffer;
       default: wb_dat_o = 0; 
   endcase
end

endmodule

