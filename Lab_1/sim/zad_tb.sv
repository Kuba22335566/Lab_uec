module tb_nand5;
    bit a, b, c, d, e;
    logic y;
    int i;

    nand5 uut (
        .a(a), .b(b), .c(c), .d(d), .e(e),
        .y(y)
    );

    initial begin
        $monitor("%4t | %b %b %b %b %b | %b", $time, a, b, c, d, e, y);

        for (i = 0; i < 32; i = i + 1) begin
            {a, b, c, d, e} = i;
            #10;      
        end

        $finish;
    end
endmodule