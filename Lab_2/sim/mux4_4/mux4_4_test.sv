module mux4_4_test();

    logic [3:0] input0, input1, input2, input3;
    logic [3:0] sel;
    logic [3:0] input_selected;
    
    logic [3:0] expected_val; 

    mux4_4 u_mux4_4(.input0, .input1, .input2, .input3, .sel, .input_selected);

    initial begin
        input0 = 4'b1111;
        input1 = 4'b1011;
        input2 = 4'b0001;
        input3 = 4'b1000;


        for (int index=0; index<4; ++index) begin
            sel[3:0] = ~(4'b0001 << index);
            #1;
            
            case (index)
                0: expected_val = input0;
                1: expected_val = input1;
                2: expected_val = input2;
                3: expected_val = input3;
            endcase

            assert (input_selected === expected_val) else
                $error("Blad dla sel=%b! exp: %b, rcv: %b", sel, expected_val, input_selected);
        end

        sel = 4'b0000;
        #1;
        assert (input_selected === 4'bxxxx) else
            $error("Blad dla blednego sel=%b! exp: xxxx, rcv: %b", sel, input_selected);

        $finish;
    end

endmodule
