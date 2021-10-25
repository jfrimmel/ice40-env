`default_nettype none

module top(
    input wire input_clk,
    output wire LED
);
    wire pll_out;
    reg clk;
    reg pll_lock;

    pll pll(
        .clock_in(input_clk),
        .clock_out(pll_out),
        .locked(pll_lock)
    );

    // make sure, that `clk` is only ever driven if the PLL is locked
    always @(pll_out) begin
        if (pll_lock) clk <= pll_out;
        else clk <= 0;
    end

    // simple counter to toggle `on` once per second (assuming `clk` to be 100MHz)
    reg [26:0] counter;
    reg on;
    always @(posedge clk) begin
        if (counter <= 99999999)
            counter <= counter + 1;
        else begin
            counter = 0;
            on = !on;
        end
    end

    assign LED = on;
endmodule
