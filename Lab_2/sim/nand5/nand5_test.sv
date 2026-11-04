module nand5_test;
    bit a, b, c, d, e;
    logic y;
    //int i;

    nand5 u_nand5(
        .a(a), .b(b), .c(c), .d(d), .e(e),
        .y(y)
    );

    initial begin
        //$monitor("%4t | %b %b %b %b %b | %b", $time, a, b, c, d, e, y);

        for (int i = 0; i < 32; ++i) begin
            {a, b, c, d,e}= i[4:0];
            #10;
            //$display("ASDF%d", i);
            assert (y ==~(a&b&c&d&e))else
                $error("y: exp: 0b%b, %b %b %b %b %b ,rcv: 0b%b",~(a&b&c&d&e),a,b,c,d,e,y);
        end

        $finish;
    end
endmodule