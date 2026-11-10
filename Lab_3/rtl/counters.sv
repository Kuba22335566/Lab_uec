module counters(
    input logic clk,
    input logic rst_n,
    input logic enabled,
    output logic [7:0] value_1,
    output logic [7:0] value_2
);

logic connection;


counter #(
    .MAX_COUNT(5)
) master_counter(
    .clk,
    .enabled,
    .overflow(connection),
    .rst_n,
    .value(value_1)
);
counter #(
    .MAX_COUNT(3)
) slave_counter(
    .clk,
    .enabled(connection),
    .overflow(),
    .rst_n,
    .value(value_2)
);


endmodule