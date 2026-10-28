module zad1(
    output logic y,
    input bit a,
    input bit b,
    input bit c,
    input bit d,
    input bit e
);

assign y=~(a&b&c&d&e);
endmodule
 