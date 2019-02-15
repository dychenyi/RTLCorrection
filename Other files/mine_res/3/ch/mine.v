//----------------------------------------------------------------------------//
// Generated by LegUp High-Level Synthesis Tool Version 4.0 (http://legup.org)
// Compiled: Sun Jul 26 12:56:54 2015
// University of Toronto
// For research and academic purposes only. Commercial use is prohibited.
// Please send bugs to: legup@eecg.toronto.edu
// Date: Fri Feb 15 15:13:59 2019
//----------------------------------------------------------------------------//

`define MEMORY_CONTROLLER_ADDR_SIZE 32
`define MEMORY_CONTROLLER_DATA_SIZE 64
// Number of RAM elements: 1
`define MEMORY_CONTROLLER_TAG_SIZE 9
// @inData = internal global [3 x i32] [i32 10, i32 10, i32 10], align 4
`define TAG_g_inData `MEMORY_CONTROLLER_TAG_SIZE'd2
`define TAG_g_inData_a {`TAG_g_inData, 23'd0}

// Turn off warning 'ignoring unsupported system task'
// altera message_off 10175

`timescale 1 ns / 1 ns
module top
	(
		clk,
		reset,
		start,
		finish,
		waitrequest,
		return_val
	);
input clk;
input reset;
input start;
output wire finish;
input waitrequest;
output wire [31:0] return_val;
wire memory_controller_waitrequest;
wire memory_controller_enable_a;
wire [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_address_a;
wire memory_controller_write_enable_a;
wire [`MEMORY_CONTROLLER_DATA_SIZE-1:0] memory_controller_in_a;
wire [1:0] memory_controller_size_a;
wire [`MEMORY_CONTROLLER_DATA_SIZE-1:0] memory_controller_out_a;

wire memory_controller_enable_b;
wire [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_address_b;
wire memory_controller_write_enable_b;
wire [`MEMORY_CONTROLLER_DATA_SIZE-1:0] memory_controller_in_b;
wire [1:0] memory_controller_size_b;
wire [`MEMORY_CONTROLLER_DATA_SIZE-1:0] memory_controller_out_b;

/* synthesis translate_off */
assign memory_controller_waitrequest = waitrequest;
/* synthesis translate_on */

memory_controller memory_controller_inst (
	.clk( clk ),
	.memory_controller_enable_a( memory_controller_enable_a ),
	.memory_controller_enable_b( memory_controller_enable_b ),
	.memory_controller_address_a( memory_controller_address_a ),
	.memory_controller_address_b( memory_controller_address_b ),
	.memory_controller_write_enable_a( memory_controller_write_enable_a ),
	.memory_controller_write_enable_b( memory_controller_write_enable_b ),
	.memory_controller_in_a( memory_controller_in_a ),
	.memory_controller_in_b( memory_controller_in_b ),
	.memory_controller_size_a( memory_controller_size_a ),
	.memory_controller_size_b( memory_controller_size_b ),
	.memory_controller_waitrequest( memory_controller_waitrequest ),
	.memory_controller_out_reg_a( memory_controller_out_a ),
	.memory_controller_out_reg_b( memory_controller_out_b )
);

main main_inst(
	.clk( clk ),
	.clk2x( clk2x ),
	.clk1x_follower( clk1x_follower ),
	.reset( reset ),
	.start( start ),
	.finish( finish ),
	.return_val( return_val ),
	.memory_controller_waitrequest(memory_controller_waitrequest),
	.memory_controller_enable_a(memory_controller_enable_a),
	.memory_controller_address_a(memory_controller_address_a),
	.memory_controller_write_enable_a(memory_controller_write_enable_a),
	.memory_controller_in_a(memory_controller_in_a),
	.memory_controller_size_a(memory_controller_size_a),
	.memory_controller_out_a(memory_controller_out_a),
	.memory_controller_enable_b(memory_controller_enable_b),
	.memory_controller_address_b(memory_controller_address_b),
	.memory_controller_write_enable_b(memory_controller_write_enable_b),
	.memory_controller_in_b(memory_controller_in_b),
	.memory_controller_size_b(memory_controller_size_b),
	.memory_controller_out_b(memory_controller_out_b)
);

endmodule

`timescale 1 ns / 1 ns
module memory_controller
(
	clk,
	memory_controller_address_a,
	memory_controller_address_b,
	memory_controller_enable_a,
	memory_controller_enable_b,
	memory_controller_write_enable_a,
	memory_controller_write_enable_b,
	memory_controller_in_a,
	memory_controller_in_b,
	memory_controller_size_a,
	memory_controller_size_b,
	memory_controller_waitrequest,
	memory_controller_out_reg_a,
	memory_controller_out_reg_b
);

parameter latency = 2;

parameter ram_latency = latency-1;

integer j;

input clk;
input memory_controller_waitrequest;
input [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_address_a;
input memory_controller_enable_a;
input memory_controller_write_enable_a;
input [64-1:0] memory_controller_in_a;
input [1:0] memory_controller_size_a;
output reg [64-1:0] memory_controller_out_reg_a;
reg [64-1:0] memory_controller_out_prev_a;
reg [64-1:0] memory_controller_out_a;

reg memory_controller_enable_reg_a;
input [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_address_b;
input memory_controller_enable_b;
input memory_controller_write_enable_b;
input [64-1:0] memory_controller_in_b;
input [1:0] memory_controller_size_b;
output reg [64-1:0] memory_controller_out_reg_b;
reg [64-1:0] memory_controller_out_prev_b;
reg [64-1:0] memory_controller_out_b;

reg memory_controller_enable_reg_b;

reg [1:0] inData_address_a;
reg [1:0] inData_address_b;
reg inData_write_enable_a;
reg inData_write_enable_b;
reg [31:0] inData_in_a;
reg [31:0] inData_in_b;
wire [31:0] inData_out_a;
wire [31:0] inData_out_b;

// @inData = internal global [3 x i32] [i32 10, i32 10, i32 10], align 4
ram_dual_port inData (
	.clk( clk ),
	.clken( !memory_controller_waitrequest ),
	.address_a( inData_address_a ),
	.address_b( inData_address_b ),
	.wren_a( inData_write_enable_a ),
	.wren_b( inData_write_enable_b ),
	.data_a( inData_in_a ),
	.data_b( inData_in_b ),
	.byteena_a( 1'b1 ),
	.byteena_b( 1'b1 ),
	.q_a( inData_out_a ),
	.q_b( inData_out_b)
);
defparam inData.width_a = 32;
defparam inData.width_b = 32;
defparam inData.widthad_a = 2;
defparam inData.widthad_b = 2;
defparam inData.width_be_a = 1;
defparam inData.width_be_b = 1;
defparam inData.numwords_a = 3;
defparam inData.numwords_b = 3;
defparam inData.latency = ram_latency;
defparam inData.init_file = "inData.mif";
wire [`MEMORY_CONTROLLER_TAG_SIZE-1:0] tag_a;
assign tag_a = memory_controller_address_a[`MEMORY_CONTROLLER_ADDR_SIZE-1:`MEMORY_CONTROLLER_ADDR_SIZE-`MEMORY_CONTROLLER_TAG_SIZE];
reg [2:0] prevAddr_a;
reg [1:0] prevSize_a;
reg [2:0] prevSize_a_and;

always @(posedge clk)
if (!memory_controller_waitrequest)
begin
	prevAddr_a <= memory_controller_address_a[2:0];
	prevSize_a <= memory_controller_size_a;
end
wire [`MEMORY_CONTROLLER_TAG_SIZE-1:0] tag_b;
assign tag_b = memory_controller_address_b[`MEMORY_CONTROLLER_ADDR_SIZE-1:`MEMORY_CONTROLLER_ADDR_SIZE-`MEMORY_CONTROLLER_TAG_SIZE];
reg [2:0] prevAddr_b;
reg [1:0] prevSize_b;
reg [2:0] prevSize_b_and;

always @(posedge clk)
if (!memory_controller_waitrequest)
begin
	prevAddr_b <= memory_controller_address_b[2:0];
	prevSize_b <= memory_controller_size_b;
end

reg [2:0] select_not_struct_a;

wire select_inData_a;
assign select_inData_a = (tag_a == `TAG_g_inData);
reg [ram_latency:0] select_inData_reg_a;
wire [31:0] memory_controller_inData_out_a;
assign memory_controller_inData_out_a = {32{ select_inData_reg_a[ram_latency]}} & inData_out_a;

always @(*)
begin
	inData_address_a = memory_controller_address_a [2-1+2:2] & {2{select_inData_a}};
	inData_write_enable_a = memory_controller_write_enable_a & select_inData_a;
	inData_in_a [32-1:0] = memory_controller_in_a[32-1:0];

end
always @(*)
begin
	select_not_struct_a [2:0] = 3'b0 | {2{select_inData_reg_a[ram_latency]}};
	if (prevAddr_a[2:0] & select_not_struct_a[2:0] != 0 && memory_controller_enable_a)
	begin
		$display("Error: memory address not aligned to ram word size!");
		$finish;
	end

	prevSize_a_and[0] = prevSize_a[1] | prevSize_a[0];
	prevSize_a_and[1] = prevSize_a[1];
	prevSize_a_and[2] = prevSize_a[1] & prevSize_a[0];
	if ((prevAddr_a & prevSize_a_and) != 0 && memory_controller_enable_a)
	begin
		$display("Error: memory address not aligned to ram word size!");
		$finish;
	end
	memory_controller_out_prev_a = memory_controller_out_reg_a & { 64{!memory_controller_enable_reg_a}};
	memory_controller_out_a = 1'b0 | memory_controller_out_prev_a | memory_controller_inData_out_a;
end

always @(posedge clk)
if (!memory_controller_waitrequest)
begin
memory_controller_out_reg_a <= memory_controller_out_a;
memory_controller_enable_reg_a <= memory_controller_enable_a;
end

always @(posedge clk)
if (!memory_controller_waitrequest)
for (j = 0; j < ram_latency; j=j+1)
begin
select_inData_reg_a[j+1] <= select_inData_reg_a[j];
end
always @(*)
begin
select_inData_reg_a[0] <= select_inData_a;
end

reg [2:0] select_not_struct_b;

wire select_inData_b;
assign select_inData_b = (tag_b == `TAG_g_inData);
reg [ram_latency:0] select_inData_reg_b;
wire [31:0] memory_controller_inData_out_b;
assign memory_controller_inData_out_b = {32{ select_inData_reg_b[ram_latency]}} & inData_out_b;

always @(*)
begin
	inData_address_b = memory_controller_address_b [2-1+2:2] & {2{select_inData_b}};
	inData_write_enable_b = memory_controller_write_enable_b & select_inData_b;
	inData_in_b [32-1:0] = memory_controller_in_b[32-1:0];

end
always @(*)
begin
	select_not_struct_b [2:0] = 3'b0 | {2{select_inData_reg_b[ram_latency]}};
	if (prevAddr_b[2:0] & select_not_struct_b[2:0] != 0 && memory_controller_enable_b)
	begin
		$display("Error: memory address not aligned to ram word size!");
		$finish;
	end

	prevSize_b_and[0] = prevSize_b[1] | prevSize_b[0];
	prevSize_b_and[1] = prevSize_b[1];
	prevSize_b_and[2] = prevSize_b[1] & prevSize_b[0];
	if ((prevAddr_b & prevSize_b_and) != 0 && memory_controller_enable_b)
	begin
		$display("Error: memory address not aligned to ram word size!");
		$finish;
	end
	memory_controller_out_prev_b = memory_controller_out_reg_b & { 64{!memory_controller_enable_reg_b}};
	memory_controller_out_b = 1'b0 | memory_controller_out_prev_b | memory_controller_inData_out_b;
end

always @(posedge clk)
if (!memory_controller_waitrequest)
begin
memory_controller_out_reg_b <= memory_controller_out_b;
memory_controller_enable_reg_b <= memory_controller_enable_b;
end

always @(posedge clk)
if (!memory_controller_waitrequest)
for (j = 0; j < ram_latency; j=j+1)
begin
select_inData_reg_b[j+1] <= select_inData_reg_b[j];
end
always @(*)
begin
select_inData_reg_b[0] <= select_inData_b;
end

endmodule 

`timescale 1 ns / 1 ns
module main
(
	clk,
	clk2x,
	clk1x_follower,
	reset,
	start,
	finish,
	memory_controller_waitrequest,
	memory_controller_enable_a,
	memory_controller_address_a,
	memory_controller_write_enable_a,
	memory_controller_in_a,
	memory_controller_size_a,
	memory_controller_out_a,
	memory_controller_enable_b,
	memory_controller_address_b,
	memory_controller_write_enable_b,
	memory_controller_in_b,
	memory_controller_size_b,
	memory_controller_out_b,
	return_val
);

parameter [3:0] LEGUP_0 = 4'd0;
parameter [3:0] LEGUP_F_main_BB__0_1 = 4'd1;
parameter [3:0] LEGUP_F_main_BB__0_2 = 4'd2;
parameter [3:0] LEGUP_F_main_BB__0_3 = 4'd3;
parameter [3:0] LEGUP_F_main_BB__0_4 = 4'd4;
parameter [3:0] LEGUP_F_main_BB__0_5 = 4'd5;
parameter [3:0] LEGUP_F_main_BB__17_6 = 4'd6;
parameter [3:0] LEGUP_F_main_BB__19_7 = 4'd7;
parameter [3:0] LEGUP_F_main_BB__21_8 = 4'd8;
parameter [8:0] tag_offset = 9'd0;
parameter [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] tag_addr_offset = {tag_offset, 23'd0};

input  clk;
input  clk2x;
input  clk1x_follower;
input  reset;
input  start;
output reg  finish;
input  memory_controller_waitrequest;
output reg  memory_controller_enable_a;
output reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_address_a;
output reg  memory_controller_write_enable_a;
output reg [`MEMORY_CONTROLLER_DATA_SIZE-1:0] memory_controller_in_a;
output reg [1:0] memory_controller_size_a;
input [`MEMORY_CONTROLLER_DATA_SIZE-1:0] memory_controller_out_a;
output reg  memory_controller_enable_b;
output reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] memory_controller_address_b;
output reg  memory_controller_write_enable_b;
output reg [`MEMORY_CONTROLLER_DATA_SIZE-1:0] memory_controller_in_b;
output reg [1:0] memory_controller_size_b;
input [`MEMORY_CONTROLLER_DATA_SIZE-1:0] memory_controller_out_b;
output reg [31:0] return_val;
reg [3:0] cur_state;
reg [3:0] next_state;
reg [31:0] main_0_1;
reg [31:0] main_0_1_reg;
reg [31:0] main_0_2;
reg [31:0] main_0_2_reg;
reg [31:0] main_0_3;
reg [31:0] main_0_4;
reg [31:0] main_0_5;
reg [31:0] main_0_6;
reg [31:0] main_0_7;
reg [31:0] main_0_7_reg;
reg [31:0] main_0_8;
reg [31:0] main_0_9;
reg [31:0] main_0_10;
reg [31:0] main_0_11;
reg [31:0] main_0_11_reg;
reg [31:0] main_0_12;
reg [31:0] main_0_13;
reg [31:0] main_0_14;
reg [31:0] main_0_14_reg;
reg  main_0_16;
reg [31:0] main_signed_add_32_1_op0;
reg [31:0] main_signed_add_32_1_op1;
reg [31:0] main_signed_add_32_1;
reg [31:0] main_signed_multiply_32_0_op0;
reg [31:0] main_signed_multiply_32_0_op1;
reg  lpm_mult_main_0_4_en;
reg [31:0] main_0_4_stage0_reg;
reg [31:0] main_signed_multiply_32_0;
reg [31:0] main_signed_add_32_0_op0;
reg [31:0] main_signed_add_32_0_op1;
reg [31:0] main_signed_add_32_0;
reg [31:0] main_signed_add_32_2_op0;
reg [31:0] main_signed_add_32_2_op1;
reg [31:0] main_signed_add_32_2;
reg [31:0] main_signed_multiply_32_1_op0;
reg [31:0] main_signed_multiply_32_1_op1;
reg  lpm_mult_main_0_8_en;
reg [31:0] main_0_8_stage0_reg;
reg [31:0] main_signed_multiply_32_1;
reg [31:0] main_signed_subtract_32_0_op0;
reg [31:0] main_signed_subtract_32_0_op1;
reg [31:0] main_signed_subtract_32_0;
reg [31:0] main_signed_multiply_32_2_op0;
reg [31:0] main_signed_multiply_32_2_op1;
reg  lpm_mult_main_0_11_en;
reg [31:0] main_0_11_stage0_reg;
reg [31:0] main_signed_multiply_32_2;


/* Unsynthesizable Statements */
always @(posedge clk)
	if (!memory_controller_waitrequest) begin
	/* main: %0*/
	/*   %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 %14) #2*/
	if ((cur_state == LEGUP_F_main_BB__0_5)) begin
		$write("Result: %d\n", $signed(main_0_14));
		// to fix quartus warning
		if (reset == 1'b0 && ^(main_0_14) === 1'bX) finish <= 0;
	end
	/* main: %17*/
	/*   %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0)) #2*/
	if ((cur_state == LEGUP_F_main_BB__17_6)) begin
		$write("RESULT: PASS\n");
	end
	/* main: %19*/
	/*   %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str2, i32 0, i32 0)) #2*/
	if ((cur_state == LEGUP_F_main_BB__19_7)) begin
		$write("RESULT: FAIL\n");
	end
end
always @(posedge clk) begin
if (reset == 1'b1)
	cur_state <= LEGUP_0;
else if (memory_controller_waitrequest == 1'd1)
	cur_state <= cur_state;
else
	cur_state <= next_state;
end

always @(*)
begin
next_state = cur_state;
case(cur_state)  // synthesis parallel_case  
LEGUP_0:
	if ((start == 1'd1))
		next_state = LEGUP_F_main_BB__0_1;
LEGUP_F_main_BB__0_1:
		next_state = LEGUP_F_main_BB__0_2;
LEGUP_F_main_BB__0_2:
		next_state = LEGUP_F_main_BB__0_3;
LEGUP_F_main_BB__0_3:
		next_state = LEGUP_F_main_BB__0_4;
LEGUP_F_main_BB__0_4:
		next_state = LEGUP_F_main_BB__0_5;
LEGUP_F_main_BB__0_5:
	if ((main_0_16 == 1'd1))
		next_state = LEGUP_F_main_BB__17_6;
	else if ((main_0_16 == 1'd0))
		next_state = LEGUP_F_main_BB__19_7;
LEGUP_F_main_BB__17_6:
		next_state = LEGUP_F_main_BB__21_8;
LEGUP_F_main_BB__19_7:
		next_state = LEGUP_F_main_BB__21_8;
LEGUP_F_main_BB__21_8:
		next_state = LEGUP_0;
default:
	next_state = cur_state;
endcase

end
always @(*) begin
	/* main: %0*/
	/*   %1 = load i32* getelementptr inbounds ([3 x i32]* @inData, i32 0, i32 0), align 4*/
		main_0_1 = memory_controller_out_a[31:0];
end
always @(posedge clk) begin
	/* main: %0*/
	/*   %1 = load i32* getelementptr inbounds ([3 x i32]* @inData, i32 0, i32 0), align 4*/
	if ((cur_state == LEGUP_F_main_BB__0_3)) begin
		main_0_1_reg <= main_0_1;
		if (start == 1'b0 && ^(main_0_1) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_0_1_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %0*/
	/*   %2 = load i32* getelementptr inbounds ([3 x i32]* @inData, i32 0, i32 1), align 4*/
		main_0_2 = memory_controller_out_b[31:0];
end
always @(posedge clk) begin
	/* main: %0*/
	/*   %2 = load i32* getelementptr inbounds ([3 x i32]* @inData, i32 0, i32 1), align 4*/
	if ((cur_state == LEGUP_F_main_BB__0_3)) begin
		main_0_2_reg <= main_0_2;
		if (start == 1'b0 && ^(main_0_2) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_0_2_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %0*/
	/*   %3 = load i32* getelementptr inbounds ([3 x i32]* @inData, i32 0, i32 2), align 4*/
		main_0_3 = memory_controller_out_a[31:0];
end
always @(*) begin
	main_0_4 = main_signed_multiply_32_0;
end
always @(*) begin
	/* main: %0*/
	/*   %5 = add nsw i32 %4, %3*/
		main_0_5 = main_signed_add_32_0;
end
always @(*) begin
	/* main: %0*/
	/*   %6 = add nsw i32 %5, %1*/
		main_0_6 = main_signed_add_32_1;
end
always @(*) begin
	/* main: %0*/
	/*   %7 = add nsw i32 %6, %2*/
		main_0_7 = main_signed_add_32_2;
end
always @(posedge clk) begin
	/* main: %0*/
	/*   %7 = add nsw i32 %6, %2*/
	if ((cur_state == LEGUP_F_main_BB__0_4)) begin
		main_0_7_reg <= main_0_7;
		if (start == 1'b0 && ^(main_0_7) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_0_7_reg"); $finish; end
	end
end
always @(*) begin
	main_0_8 = main_signed_multiply_32_1;
end
always @(*) begin
	main_0_9 = main_signed_multiply_32_0;
end
always @(*) begin
	/* main: %0*/
	/*   %10 = sub nsw i32 %7, %9*/
		main_0_10 = main_signed_subtract_32_0;
end
always @(*) begin
	main_0_11 = main_signed_multiply_32_2;
end
always @(posedge clk) begin
	/* main: %0*/
	/*   %11 = mul nsw i32 %1, %1*/
	if ((cur_state == LEGUP_F_main_BB__0_4)) begin
		main_0_11_reg <= main_0_11;
		if (start == 1'b0 && ^(main_0_11) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_0_11_reg"); $finish; end
	end
	/* main: %0*/
	/*   %11 = mul nsw i32 %1, %1*/
	if ((cur_state == LEGUP_F_main_BB__0_4)) begin
		main_0_11_reg <= main_0_11;
		if (start == 1'b0 && ^(main_0_11) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_0_11_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %0*/
	/*   %12 = add nsw i32 %10, %11*/
		main_0_12 = main_signed_add_32_0;
end
always @(*) begin
	main_0_13 = main_signed_multiply_32_1;
end
always @(*) begin
	/* main: %0*/
	/*   %14 = add nsw i32 %12, %13*/
		main_0_14 = main_signed_add_32_1;
end
always @(posedge clk) begin
	/* main: %0*/
	/*   %14 = add nsw i32 %12, %13*/
	if ((cur_state == LEGUP_F_main_BB__0_5)) begin
		main_0_14_reg <= main_0_14;
		if (start == 1'b0 && ^(main_0_14) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_0_14_reg"); $finish; end
	end
end
always @(*) begin
	/* main: %0*/
	/*   %16 = icmp eq i32 %14, 30*/
		main_0_16 = (main_0_14 == 32'd30);
end
always @(*) begin
	/* main: %0*/
	/*   %6 = add nsw i32 %5, %1*/
	if ((cur_state == LEGUP_F_main_BB__0_4)) begin
		main_signed_add_32_1_op0 = main_0_5;
	end
	/* main: %0*/
	/*   %14 = add nsw i32 %12, %13*/
	else /* if ((cur_state == LEGUP_F_main_BB__0_5)) */ begin
		main_signed_add_32_1_op0 = main_0_12;
	end
end
always @(*) begin
	/* main: %0*/
	/*   %6 = add nsw i32 %5, %1*/
	if ((cur_state == LEGUP_F_main_BB__0_4)) begin
		main_signed_add_32_1_op1 = main_0_1_reg;
	end
	/* main: %0*/
	/*   %14 = add nsw i32 %12, %13*/
	else /* if ((cur_state == LEGUP_F_main_BB__0_5)) */ begin
		main_signed_add_32_1_op1 = main_0_13;
	end
end
always @(*) begin
	main_signed_add_32_1 = (main_signed_add_32_1_op0 + main_signed_add_32_1_op1);
end
always @(*) begin
	/* main: %0*/
	/*   %4 = mul nsw i32 %1, %2*/
	if ((cur_state == LEGUP_F_main_BB__0_3)) begin
		main_signed_multiply_32_0_op0 = main_0_1;
	end
	/* main: %0*/
	/*   %9 = mul nsw i32 %8, %3*/
	else /* if ((cur_state == LEGUP_F_main_BB__0_4)) */ begin
		main_signed_multiply_32_0_op0 = main_0_8;
	end
end
always @(*) begin
	/* main: %0*/
	/*   %4 = mul nsw i32 %1, %2*/
	if ((cur_state == LEGUP_F_main_BB__0_3)) begin
		main_signed_multiply_32_0_op1 = main_0_2;
	end
	/* main: %0*/
	/*   %9 = mul nsw i32 %8, %3*/
	else /* if ((cur_state == LEGUP_F_main_BB__0_4)) */ begin
		main_signed_multiply_32_0_op1 = main_0_3;
	end
end
always @(*) begin
	lpm_mult_main_0_4_en = (memory_controller_waitrequest == 1'd0);
end
always @(posedge clk) begin
	/* main: %0*/
	/*   %4 = mul nsw i32 %1, %2*/
	if ((lpm_mult_main_0_4_en == 1'd1)) begin
		main_0_4_stage0_reg <= (main_signed_multiply_32_0_op0 * main_signed_multiply_32_0_op1);
	end
end
always @(*) begin
	main_signed_multiply_32_0 = main_0_4_stage0_reg;
end
always @(*) begin
	/* main: %0*/
	/*   %5 = add nsw i32 %4, %3*/
	if ((cur_state == LEGUP_F_main_BB__0_4)) begin
		main_signed_add_32_0_op0 = main_0_4;
	end
	/* main: %0*/
	/*   %12 = add nsw i32 %10, %11*/
	else /* if ((cur_state == LEGUP_F_main_BB__0_5)) */ begin
		main_signed_add_32_0_op0 = main_0_10;
	end
end
always @(*) begin
	/* main: %0*/
	/*   %5 = add nsw i32 %4, %3*/
	if ((cur_state == LEGUP_F_main_BB__0_4)) begin
		main_signed_add_32_0_op1 = main_0_3;
	end
	/* main: %0*/
	/*   %12 = add nsw i32 %10, %11*/
	else /* if ((cur_state == LEGUP_F_main_BB__0_5)) */ begin
		main_signed_add_32_0_op1 = main_0_11_reg;
	end
end
always @(*) begin
	main_signed_add_32_0 = (main_signed_add_32_0_op0 + main_signed_add_32_0_op1);
end
always @(*) begin
	/* main: %0*/
	/*   %7 = add nsw i32 %6, %2*/
		main_signed_add_32_2_op0 = main_0_6;
end
always @(*) begin
	/* main: %0*/
	/*   %7 = add nsw i32 %6, %2*/
		main_signed_add_32_2_op1 = main_0_2_reg;
end
always @(*) begin
	main_signed_add_32_2 = (main_signed_add_32_2_op0 + main_signed_add_32_2_op1);
end
always @(*) begin
	/* main: %0*/
	/*   %8 = mul nsw i32 %1, %2*/
	if ((cur_state == LEGUP_F_main_BB__0_3)) begin
		main_signed_multiply_32_1_op0 = main_0_1;
	end
	/* main: %0*/
	/*   %13 = mul nsw i32 %3, %3*/
	else /* if ((cur_state == LEGUP_F_main_BB__0_4)) */ begin
		main_signed_multiply_32_1_op0 = main_0_3;
	end
end
always @(*) begin
	/* main: %0*/
	/*   %8 = mul nsw i32 %1, %2*/
	if ((cur_state == LEGUP_F_main_BB__0_3)) begin
		main_signed_multiply_32_1_op1 = main_0_2;
	end
	/* main: %0*/
	/*   %13 = mul nsw i32 %3, %3*/
	else /* if ((cur_state == LEGUP_F_main_BB__0_4)) */ begin
		main_signed_multiply_32_1_op1 = main_0_3;
	end
end
always @(*) begin
	lpm_mult_main_0_8_en = (memory_controller_waitrequest == 1'd0);
end
always @(posedge clk) begin
	/* main: %0*/
	/*   %8 = mul nsw i32 %1, %2*/
	if ((lpm_mult_main_0_8_en == 1'd1)) begin
		main_0_8_stage0_reg <= (main_signed_multiply_32_1_op0 * main_signed_multiply_32_1_op1);
	end
end
always @(*) begin
	main_signed_multiply_32_1 = main_0_8_stage0_reg;
end
always @(*) begin
	/* main: %0*/
	/*   %10 = sub nsw i32 %7, %9*/
		main_signed_subtract_32_0_op0 = main_0_7_reg;
end
always @(*) begin
	/* main: %0*/
	/*   %10 = sub nsw i32 %7, %9*/
		main_signed_subtract_32_0_op1 = main_0_9;
end
always @(*) begin
	main_signed_subtract_32_0 = (main_signed_subtract_32_0_op0 - main_signed_subtract_32_0_op1);
end
always @(*) begin
	/* main: %0*/
	/*   %11 = mul nsw i32 %1, %1*/
		main_signed_multiply_32_2_op0 = main_0_1;
end
always @(*) begin
	/* main: %0*/
	/*   %11 = mul nsw i32 %1, %1*/
		main_signed_multiply_32_2_op1 = main_0_1;
end
always @(*) begin
	lpm_mult_main_0_11_en = (memory_controller_waitrequest == 1'd0);
end
always @(posedge clk) begin
	/* main: %0*/
	/*   %11 = mul nsw i32 %1, %1*/
	if ((lpm_mult_main_0_11_en == 1'd1)) begin
		main_0_11_stage0_reg <= (main_signed_multiply_32_2_op0 * main_signed_multiply_32_2_op1);
	end
end
always @(*) begin
	main_signed_multiply_32_2 = main_0_11_stage0_reg;
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
		if (start == 1'b0 && ^(1'd0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to finish"); $finish; end
	end
	/* main: %21*/
	/*   ret i32 %14*/
	if ((cur_state == LEGUP_F_main_BB__21_8)) begin
		finish <= (memory_controller_waitrequest == 1'd0);
		if (start == 1'b0 && ^((memory_controller_waitrequest == 1'd0)) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to finish"); $finish; end
	end
end
always @(*) begin
	memory_controller_enable_a = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_enable_a = 1'd0;
	end
	/* main: %0*/
	/*   %1 = load i32* getelementptr inbounds ([3 x i32]* @inData, i32 0, i32 0), align 4*/
	if ((cur_state == LEGUP_F_main_BB__0_1)) begin
		memory_controller_enable_a = 1'd1;
	end
	/* main: %0*/
	/*   %3 = load i32* getelementptr inbounds ([3 x i32]* @inData, i32 0, i32 2), align 4*/
	if ((cur_state == LEGUP_F_main_BB__0_2)) begin
		memory_controller_enable_a = 1'd1;
	end
end
always @(*) begin
	memory_controller_address_a = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_address_a = 1'd0;
	end
	/* main: %0*/
	/*   %1 = load i32* getelementptr inbounds ([3 x i32]* @inData, i32 0, i32 0), align 4*/
	if ((cur_state == LEGUP_F_main_BB__0_1)) begin
		memory_controller_address_a = `TAG_g_inData_a;
	end
	/* main: %0*/
	/*   %3 = load i32* getelementptr inbounds ([3 x i32]* @inData, i32 0, i32 2), align 4*/
	if ((cur_state == LEGUP_F_main_BB__0_2)) begin
		memory_controller_address_a = (`TAG_g_inData_a + (4 * 32'd2));
	end
end
always @(*) begin
	memory_controller_write_enable_a = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_write_enable_a = 1'd0;
	end
	/* main: %0*/
	/*   %1 = load i32* getelementptr inbounds ([3 x i32]* @inData, i32 0, i32 0), align 4*/
	if ((cur_state == LEGUP_F_main_BB__0_1)) begin
		memory_controller_write_enable_a = 1'd0;
	end
	/* main: %0*/
	/*   %3 = load i32* getelementptr inbounds ([3 x i32]* @inData, i32 0, i32 2), align 4*/
	if ((cur_state == LEGUP_F_main_BB__0_2)) begin
		memory_controller_write_enable_a = 1'd0;
	end
end
always @(*) begin
	memory_controller_in_a = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_in_a = 1'd0;
	end
end
always @(*) begin
	memory_controller_size_a = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_size_a = 1'd0;
	end
	/* main: %0*/
	/*   %1 = load i32* getelementptr inbounds ([3 x i32]* @inData, i32 0, i32 0), align 4*/
	if ((cur_state == LEGUP_F_main_BB__0_1)) begin
		memory_controller_size_a = 2'd2;
	end
	/* main: %0*/
	/*   %3 = load i32* getelementptr inbounds ([3 x i32]* @inData, i32 0, i32 2), align 4*/
	if ((cur_state == LEGUP_F_main_BB__0_2)) begin
		memory_controller_size_a = 2'd2;
	end
end
always @(*) begin
	memory_controller_enable_b = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_enable_b = 1'd0;
	end
	/* main: %0*/
	/*   %2 = load i32* getelementptr inbounds ([3 x i32]* @inData, i32 0, i32 1), align 4*/
	if ((cur_state == LEGUP_F_main_BB__0_1)) begin
		memory_controller_enable_b = 1'd1;
	end
end
always @(*) begin
	memory_controller_address_b = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_address_b = 1'd0;
	end
	/* main: %0*/
	/*   %2 = load i32* getelementptr inbounds ([3 x i32]* @inData, i32 0, i32 1), align 4*/
	if ((cur_state == LEGUP_F_main_BB__0_1)) begin
		memory_controller_address_b = (`TAG_g_inData_a + (4 * 32'd1));
	end
end
always @(*) begin
	memory_controller_write_enable_b = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_write_enable_b = 1'd0;
	end
	/* main: %0*/
	/*   %2 = load i32* getelementptr inbounds ([3 x i32]* @inData, i32 0, i32 1), align 4*/
	if ((cur_state == LEGUP_F_main_BB__0_1)) begin
		memory_controller_write_enable_b = 1'd0;
	end
end
always @(*) begin
	memory_controller_in_b = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_in_b = 1'd0;
	end
end
always @(*) begin
	memory_controller_size_b = 1'd0;
	if ((cur_state == LEGUP_0)) begin
		memory_controller_size_b = 1'd0;
	end
	/* main: %0*/
	/*   %2 = load i32* getelementptr inbounds ([3 x i32]* @inData, i32 0, i32 1), align 4*/
	if ((cur_state == LEGUP_F_main_BB__0_1)) begin
		memory_controller_size_b = 2'd2;
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		return_val <= 0;
		if (start == 1'b0 && ^(0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to return_val"); $finish; end
	end
	/* main: %21*/
	/*   ret i32 %14*/
	if ((cur_state == LEGUP_F_main_BB__21_8)) begin
		return_val <= main_0_14_reg;
		if (start == 1'b0 && ^(main_0_14_reg) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to return_val"); $finish; end
	end
end

endmodule 
module ram_dual_port
(
	clk,
	clken,
	address_a,
	address_b,
	wren_a,
	wren_b,
	data_a,
	data_b,
	byteena_a,
	byteena_b,
	q_a,
	q_b
);

parameter  width_a = 1'd0;
parameter  width_b = 1'd0;
parameter  widthad_a = 1'd0;
parameter  widthad_b = 1'd0;
parameter  numwords_a = 1'd0;
parameter  numwords_b = 1'd0;
parameter  init_file = "UNUSED.mif";
parameter  width_be_a = 1'd0;
parameter  width_be_b = 1'd0;
parameter  latency = 1;

input  clk;
input  clken;
input [(widthad_a-1):0] address_a;
input [(widthad_b-1):0] address_b;
output wire [(width_a-1):0] q_a;
output wire [(width_b-1):0] q_b;
reg [(width_a-1):0] q_a_wire;
reg [(width_b-1):0] q_b_wire;
input  wren_a;
input  wren_b;
input [(width_a-1):0] data_a;
input [(width_b-1):0] data_b;
// byte enable is unsupported by inferred RAMs
input [width_be_a-1:0] byteena_a;
input [width_be_b-1:0] byteena_b;

(* ramstyle = "no_rw_check", ram_init_file = init_file *) reg [width_a-1:0] ram[numwords_a-1:0];

/* synthesis translate_off */
integer i;
ALTERA_MF_MEMORY_INITIALIZATION mem ();
reg [8*256:1] ram_ver_file;
initial begin
	if (init_file == "UNUSED.mif")
    begin
		for (i = 0; i < numwords_a; i = i + 1)
			ram[i] = 0;
    end
	else
    begin
        // modelsim can't read .mif files directly. So use Altera function to
        // convert them to .ver files
        mem.convert_to_ver_file(init_file, width_a, ram_ver_file);
        $readmemh(ram_ver_file, ram);
    end
end
/* synthesis translate_on */

always @ (posedge clk)
if (clken)
begin // Port A
if (wren_a)
begin
    ram[address_a] <= data_a;
    q_a_wire <= {width_a{1'bX}};
end
else
    q_a_wire <= ram[address_a];
end
always @ (posedge clk)
if (clken)
begin // Port b
if (wren_b)
begin
    ram[address_b] <= data_b;
    q_b_wire <= {width_b{1'bX}};
end
else
    q_b_wire <= ram[address_b];
end



integer j;
reg [(width_a-1):0] q_a_reg[latency:1], q_b_reg[latency:1];

always @(*)
begin
   q_a_reg[1] <= q_a_wire;
   q_b_reg[1] <= q_b_wire;
end

always @(posedge clk)
if (clken)
begin
   for (j = 1; j < latency; j=j+1)
   begin
       q_a_reg[j+1] <= q_a_reg[j];
       q_b_reg[j+1] <= q_b_reg[j];
   end
end

assign q_a = (clken) ? q_a_reg[latency] : 0;
assign q_b = (clken) ? q_b_reg[latency] : 0;


endmodule
module rom_dual_port
(
	clk,
	clken,
	address_a,
	address_b,
	q_a,
	q_b
);

parameter  width_a = 1'd0;
parameter  width_b = 1'd0;
parameter  widthad_a = 1'd0;
parameter  widthad_b = 1'd0;
parameter  numwords_a = 1'd0;
parameter  numwords_b = 1'd0;
parameter  init_file = "UNUSED.mif";
parameter  latency = 1;

input  clk;
input  clken;
input [(widthad_a-1):0] address_a;
input [(widthad_b-1):0] address_b;
output wire [(width_a-1):0] q_a;
output wire [(width_b-1):0] q_b;
reg [(width_a-1):0] q_a_wire;
reg [(width_b-1):0] q_b_wire;

(* ramstyle = "no_rw_check", ram_init_file = init_file *) reg [width_a-1:0] ram[numwords_a-1:0];

/* synthesis translate_off */
integer i;
ALTERA_MF_MEMORY_INITIALIZATION mem ();
reg [8*256:1] ram_ver_file;
initial begin
	if (init_file == "UNUSED.mif")
    begin
		for (i = 0; i < numwords_a; i = i + 1)
			ram[i] = 0;
    end
	else
    begin
        // modelsim can't read .mif files directly. So use Altera function to
        // convert them to .ver files
        mem.convert_to_ver_file(init_file, width_a, ram_ver_file);
        $readmemh(ram_ver_file, ram);
    end
end
/* synthesis translate_on */

always @ (posedge clk)
if (clken)
begin
    q_a_wire <= ram[address_a];
    q_b_wire <= ram[address_b];
end



integer j;
reg [(width_a-1):0] q_a_reg[latency:1], q_b_reg[latency:1];

always @(*)
begin
   q_a_reg[1] <= q_a_wire;
   q_b_reg[1] <= q_b_wire;
end

always @(posedge clk)
if (clken)
begin
   for (j = 1; j < latency; j=j+1)
   begin
       q_a_reg[j+1] <= q_a_reg[j];
       q_b_reg[j+1] <= q_b_reg[j];
   end
end

assign q_a = (clken) ? q_a_reg[latency] : 0;
assign q_b = (clken) ? q_b_reg[latency] : 0;


endmodule
// Adding code from verilog file: ../../boards/Virtex6/ML605/top.v


module ML605 (
       USER_CLOCK,
	    KEY,
	    SW,	    
       LED,
       LEDG,
		UART_RXD,
		UART_TXD

	    );

   input USER_CLOCK;
   input [4:0] KEY;
   input [7:0] SW;
   output [7:0] LED;
   output [7:0] LEDG;
   wire CLOCK_50;

    input UART_RXD;
    output UART_TXD;    
	wire clk = CLOCK_50;
	wire go = ~KEY[1];



   wire 	reset = ~KEY[0];
   wire 	start;
   wire [31:0] 	return_val;
   reg  [31:0] 	return_val_reg;
   wire 	finish;
   wire [3:0]	state;
   
   reg [6:0]   hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7;

   assign CLOCK_50 = USER_CLOCK;
   assign LED = 0;
   
	always @ (*) begin
		hex7 <= return_val_reg[31:28];
		hex6 <= return_val_reg[27:24];
		hex5 <= return_val_reg[23:20];
		hex4 <= return_val_reg[19:16];
		hex3 <= return_val_reg[15:12];
		hex2 <= return_val_reg[11:8];
		hex1 <= return_val_reg[7:4];
		hex0 <= return_val_reg[3:0];
	end
assign UART_TXD = 1'b0;

    parameter s_WAIT = 3'b001, s_START = 3'b010, s_EXE = 3'b011,
                s_DONE = 3'b100;

    // state registers
    reg [3:0] y_Q, Y_D;

    assign LEDG[3:0] = y_Q;

    // next state
    always @(*)
    begin
        case (y_Q)
            s_WAIT: if (go) Y_D = s_START; else Y_D = y_Q;

            s_START: Y_D = s_EXE;

            s_EXE: if (!finish) Y_D = s_EXE; else Y_D = s_DONE;

            s_DONE: Y_D = s_DONE;

            default: Y_D = 3'bxxx;
        endcase
    end

    // current state
    always @(posedge clk)
    begin
        if (reset) // synchronous clear
            y_Q <= s_WAIT;
        else
            y_Q <= Y_D;
    end

    always @(posedge clk)
        if (y_Q == s_EXE && finish)
            return_val_reg <= return_val;
        else if (y_Q == s_DONE)
            return_val_reg <= return_val_reg;
        else
            return_val_reg <= 0;


    assign start = (y_Q == s_START);

   
   top top_inst (
      .clk (clk),
      .reset (reset),
      .finish (finish),
      .return_val (return_val),
        .start (start)

    );

   

endmodule

// Adding code from verilog file: ../../boards/StratixIV/DE4/top.v


module de4 ( 
    	     OSC_50_BANK2, 
             BUTTON, 
             LED, 
    	     SEG0_D, 
    	     SEG1_D 
	     ); 
   input OSC_50_BANK2; 
   input [1:0] BUTTON; 
   output [6:0] SEG0_D; 
   output [6:0] SEG1_D; 
   output [7:0] LED; 
   
   de2 de2_inst ( 
		  .CLOCK_50 (OSC_50_BANK2), 
		  .LEDG (LED), 
		  .KEY (BUTTON), 
		  .SW (), 
		  .HEX0 (SEG0_D), 
		  .HEX1 (SEG1_D), 
		  .HEX2 (), 
		  .HEX3 (), 
		  .HEX4 (), 
		  .HEX5 (), 
		  .HEX6 (), 
		  .HEX7 () 
		  ); 
   
endmodule
// Adding code from verilog file: ../../boards/CycloneII/DE2/top.v


module de2 (
	    CLOCK_50,
	    KEY,
	    SW,
	    HEX0,
	    HEX1,
	    HEX2,
	    HEX3,
	    HEX4,
	    HEX5,
	    HEX6,
	    HEX7,
	    LEDG,
		UART_RXD,
		UART_TXD

	    );

   input CLOCK_50;
   input [3:0] KEY;
   input [17:0] SW;
   output [6:0] HEX0, HEX1,  HEX2,  HEX3,  HEX4,  HEX5,  HEX6,  HEX7;
   reg [6:0] 	hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7;
   

   output [7:0] LEDG;
    input UART_RXD;
    output UART_TXD;    
	wire clk = CLOCK_50;
	wire go = ~KEY[1];



   wire 	reset = ~KEY[0];
   wire 	start;
   wire [31:0] 	return_val;
   reg  [31:0] 	return_val_reg;
   wire 	finish;
   wire [3:0]	state;

   hex_digits h7( .x(hex7), .hex_LEDs(HEX7));
   hex_digits h6( .x(hex6), .hex_LEDs(HEX6));
   hex_digits h5( .x(hex5), .hex_LEDs(HEX5));
   hex_digits h4( .x(hex4), .hex_LEDs(HEX4));
   hex_digits h3( .x(hex3), .hex_LEDs(HEX3));
   hex_digits h2( .x(hex2), .hex_LEDs(HEX2));
   hex_digits h1( .x(hex1), .hex_LEDs(HEX1));
   hex_digits h0( .x(hex0), .hex_LEDs(HEX0));
   
	always @ (*) begin
		hex7 <= return_val_reg[31:28];
		hex6 <= return_val_reg[27:24];
		hex5 <= return_val_reg[23:20];
		hex4 <= return_val_reg[19:16];
		hex3 <= return_val_reg[15:12];
		hex2 <= return_val_reg[11:8];
		hex1 <= return_val_reg[7:4];
		hex0 <= return_val_reg[3:0];
	end
assign UART_TXD = 1'b0;

    parameter s_WAIT = 3'b001, s_START = 3'b010, s_EXE = 3'b011,
                s_DONE = 3'b100;

    // state registers
    reg [3:0] y_Q, Y_D;

    assign LEDG[3:0] = y_Q;

    // next state
    always @(*)
    begin
        case (y_Q)
            s_WAIT: if (go) Y_D = s_START; else Y_D = y_Q;

            s_START: Y_D = s_EXE;

            s_EXE: if (!finish) Y_D = s_EXE; else Y_D = s_DONE;

            s_DONE: Y_D = s_DONE;

            default: Y_D = 3'bxxx;
        endcase
    end

    // current state
    always @(posedge clk)
    begin
        if (reset) // synchronous clear
            y_Q <= s_WAIT;
        else
            y_Q <= Y_D;
    end

    always @(posedge clk)
        if (y_Q == s_EXE && finish)
            return_val_reg <= return_val;
        else if (y_Q == s_DONE)
            return_val_reg <= return_val_reg;
        else
            return_val_reg <= 0;


    assign start = (y_Q == s_START);

   
   top top_inst (
      .clk (clk),
      .reset (reset),
      .finish (finish),
      .return_val (return_val),
        .start (start)

    );

endmodule

module circuit_start_control (
    go,
    control_key
);
    input control_key;
    output go;
    assign go = control_key;
endmodule
module hex_digits(x, hex_LEDs);
    input [3:0] x;
    output [6:0] hex_LEDs;
    
    assign hex_LEDs[0] = (~x[3] & ~x[2] & ~x[1] & x[0]) |
                            (~x[3] & x[2] & ~x[1] & ~x[0]) |
                            (x[3] & x[2] & ~x[1] & x[0]) |
                            (x[3] & ~x[2] & x[1] & x[0]);
    assign hex_LEDs[1] = (~x[3] & x[2] & ~x[1] & x[0]) |
                            (x[3] & x[1] & x[0]) |
                            (x[3] & x[2] & ~x[0]) |
                            (x[2] & x[1] & ~x[0]);
    assign hex_LEDs[2] = (x[3] & x[2] & ~x[0]) |
                            (x[3] & x[2] & x[1]) |
                            (~x[3] & ~x[2] & x[1] & ~x[0]);
    assign hex_LEDs[3] = (~x[3] & ~x[2] & ~x[1] & x[0]) | 
                            (~x[3] & x[2] & ~x[1] & ~x[0]) | 
                            (x[2] & x[1] & x[0]) | 
                            (x[3] & ~x[2] & x[1] & ~x[0]);
    assign hex_LEDs[4] = (~x[3] & x[0]) |
                            (~x[3] & x[2] & ~x[1]) |
                            (~x[2] & ~x[1] & x[0]);
    assign hex_LEDs[5] = (~x[3] & ~x[2] & x[0]) | 
                            (~x[3] & ~x[2] & x[1]) | 
                            (~x[3] & x[1] & x[0]) | 
                            (x[3] & x[2] & ~x[1] & x[0]);
    assign hex_LEDs[6] = (~x[3] & ~x[2] & ~x[1]) | 
                            (x[3] & x[2] & ~x[1] & ~x[0]) | 
                            (~x[3] & x[2] & x[1] & x[0]);
    
endmodule
`timescale 1 ns / 1 ns
module main_tb
(
);

reg  clk;
reg  reset;
reg  start;
reg  waitrequest;
wire [31:0] return_val;
wire  finish;


top top_inst (
	.clk (clk),
	.reset (reset),
	.start (start),
	.waitrequest (waitrequest),
	.finish (finish),
	.return_val (return_val)
);




initial 
    clk = 0;
always @(clk)
    clk <= #10 ~clk;

initial begin
//$monitor("At t=%t clk=%b %b %b %b %d", $time, clk, reset, start, finish, return_val);
@(negedge clk);
reset <= 1;
@(negedge clk);
reset <= 0;
start <= 1;
@(negedge clk);
start <= 0;
end

always@(finish) begin
    if (finish == 1) begin
        $display("At t=%t clk=%b finish=%b return_val=%d", $time, clk, finish, return_val);
        $display("Cycles: %d", ($time-50)/20);
        $finish;
    end
end

initial begin
waitrequest <= 1;
@(negedge clk);
@(negedge clk);
waitrequest <= 0;
end


endmodule 
