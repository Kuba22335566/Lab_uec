module Lab2_decoder_test();

    logic [3:0] dec;
    logic [6:0] result;
    
    logic [6:0] expected_val;

    Lab2_decoder u_lab2_decoder(.dec, .result);

    initial begin
        for (int i = 0; i < 16; ++i) begin
            dec = i[3:0];
            #1;
            
            case (i)
                0: expected_val = 7'b1000000;
                1: expected_val = 7'b1111001;
                2: expected_val = 7'b0100100;
                3: expected_val = 7'b0110000;
                4: expected_val = 7'b0011001;
                5: expected_val = 7'b0010010;
                6: expected_val = 7'b0000010;
                7: expected_val = 7'b1111000;
                8: expected_val = 7'b0000000;
                9: expected_val = 7'b0000000;
                default: expected_val = 7'bxxxxxxx;
            endcase

            assert (result === expected_val) else
                $error("Blad dla dec=%b! exp: %b, rcv: %b", dec, expected_val, result);
        end
        
        $finish;
    end

endmodule