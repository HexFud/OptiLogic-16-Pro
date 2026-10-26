`timescale 1ns / 1ps

module optilogic_16_pro_top (
    input  wire        FT_CLK,
    output wire        FT_RESET_N,
    output wire        DAC_SPI_SCLK,
    output wire        DAC_SPI_MOSI,
    output wire        DAC_CS0_N,
    output wire        DAC_CS1_N,
    output wire        SELF_TEST_LED
);

    reg [23:0] hb_counter = 24'd0;
    reg        sys_rst_n = 1'b0;

    always @(posedge FT_CLK) begin
        if (&hb_counter[19:0])
            sys_rst_n <= 1'b1;
        else
            hb_counter <= hb_counter + 1'b1;
    end

    assign FT_RESET_N    = 1'b1;
    assign SELF_TEST_LED = hb_counter[23];

    wire        dac_cmd_valid = (~sys_rst_n) && (&hb_counter[18:0]);
    wire [15:0] dac_init_val  = 16'h4925;

    dac8568_spi_ctrl u_dac_ctrl (
        .clk       (FT_CLK),
        .rst_n     (sys_rst_n),
        .cmd_valid (dac_cmd_valid),
        .cmd_chip  (1'b0),
        .cmd_ch    (4'hF),
        .cmd_data  (dac_init_val),
        .spi_sclk  (DAC_SPI_SCLK),
        .spi_mosi  (DAC_SPI_MOSI),
        .spi_cs0_n (DAC_CS0_N),
        .spi_cs1_n (DAC_CS1_N)
    );

endmodule
