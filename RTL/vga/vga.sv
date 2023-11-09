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

assign h_sync = horiz_sync;
assign v_sync = vert_sync;

wire reg_we = wb_clk_i & wb_stb_i & wb_we_i & !wb_ack_o;
assign resetn = ~wb_rst_i;
assign wb_err_o = 1'b0;

dtg dtg1(
    .*,
    .clock(vga_clk),
    .rst(wb_rst_i)
);

logic wb_ack;
assign wb_ack_o = wb_ack;

always @(posedge wb_clk_i or posedge wb_rst_i) begin
   if(wb_rst_i) begin									// Reset value to 0
		wb_ack <= 0;
   end
   else begin
		wb_ack <= !wb_ack & wb_stb_i & wb_cyc_i;		// Sending acknowledgment
		
        if(video_on) begin
            vga_r = '1;
            vga_g = 0;
            vga_b = 0; 
        end
        else begin
            vga_r = 0;
            vga_g = 0;
            vga_b = 0; 
        end
   end
end

endmodule