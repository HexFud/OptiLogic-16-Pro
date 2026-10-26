`timescale 1ns / 1ps

module dac8568_spi_ctrl (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        cmd_valid,
    input  wire        cmd_chip,
    input  wire [3:0]  cmd_ch,
    input  wire [15:0] cmd_data,
    output reg         spi_sclk,
    output reg         spi_mosi,
    output reg         spi_cs0_n,
    output reg         spi_cs1_n
);

    localparam ST_IDLE  = 1'b0,
               ST_SHIFT = 1'b1;

    reg        state = ST_IDLE;
    reg [31:0] shift_reg = 32'd0;
    reg [5:0]  bit_cnt   = 6'd0;
    reg [3:0]  clk_div   = 4'd0;

    always @(posedge clk) begin
        if (!rst_n) begin
            state     <= ST_IDLE;
            spi_sclk  <= 1'b0;
            spi_mosi  <= 1'b0;
            spi_cs0_n <= 1'b1;
            spi_cs1_n <= 1'b1;
        end else begin
            case (state)
                ST_IDLE: begin
                    spi_sclk  <= 1'b0;
                    spi_cs0_n <= 1'b1;
                    spi_cs1_n <= 1'b1;
                    if (cmd_valid) begin
                        shift_reg <= {4'b0000, 4'b0011, cmd_ch, cmd_data, 4'b0000};
                        bit_cnt   <= 6'd32;
                        clk_div   <= 4'd0;
                        spi_cs0_n <= (cmd_chip == 1'b0) ? 1'b0 : 1'b1;
                        spi_cs1_n <= (cmd_chip == 1'b1) ? 1'b0 : 1'b1;
                        state     <= ST_SHIFT;
                    end
                end

                ST_SHIFT: begin
                    clk_div <= clk_div + 1'b1;
                    if (clk_div == 4'd0) begin
                        spi_mosi <= shift_reg[31];
                        spi_sclk <= 1'b1;
                    end else if (clk_div == 4'd5) begin
                        spi_sclk  <= 1'b0;
                        shift_reg <= {shift_reg[30:0], 1'b0};
                        bit_cnt   <= bit_cnt - 1'b1;
                    end else if (clk_div == 4'd9) begin
                        clk_div <= 4'd0;
                        if (bit_cnt == 6'd0) begin
                            spi_cs0_n <= 1'b1;
                            spi_cs1_n <= 1'b1;
                            state     <= ST_IDLE;
                        end
                    end
                end
            endcase
        end
    end

endmodule
