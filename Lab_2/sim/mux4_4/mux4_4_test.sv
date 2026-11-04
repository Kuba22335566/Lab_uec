module mux4_4_test(
        bit [3:0] input0, input1, input2, input3,
        bit [3:0] sel,
        logic [3:0] input_selected
);

    mux4_4 u_mux4_4(.input0,.input2,.input1,.input3,.sel,.input_selected);
initial begin
    input0=4'b1111;
    input1=4'b1011;
    input2=4'b0001;
    input3=4'b1000;
    for (int index=0;index<4;++index)
        sel [3:0] = ~(1<<index);
        #1;
        assert (y ==~(a&b&c&d&e))else
            $error("y: exp: 0b%b, %b %b %b %b %b ,rcv: 0b%b",~(a&b&c&d&e),a,b,c,d,e,y);
    end



    $finish;

endmodule
