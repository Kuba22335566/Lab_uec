/* Copyright (C) 2025  AGH University of Krakow */

module counter #(
    parameter int WIDTH = 8,
    parameter logic [WIDTH-1:0] MAX_COUNT = 4
) (
    input logic clk,
    input logic rst_n,
    input logic enabled,
    output logic [WIDTH-1:0] value,
    output logic overflow
);


/* Local variables and signals */

logic [3:0] value_nxt;
logic overflow_nxt;

/* Module internal logic */

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        value <= 4'b0;
        overflow <= 0;
    end else begin
        value <= value_nxt;
        overflow <= overflow_nxt;
    end 
end

always_comb begin

    if (enabled) begin
        if (value==MAX_COUNT) begin
            value_nxt = 0;
            overflow_nxt = 1;
        end else begin
            value_nxt = value + 1;
            overflow_nxt = 0;
        end
    end else begin
        value_nxt = value;
        overflow_nxt = 0;
    end
end

endmodule
