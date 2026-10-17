module RORO(
    input [11:0] instruccion,
    output [31:0] resultado,
    output ZF
);
    wire [31:0] c1, c2;

    //  fILE_NAME para ROMa
    ROM #(.FILE_NAME("ROMa_init.txt")) Roma(
        .DirL(instruccion[7:4]),
        .Data(c1)
    );

    // fILE_NAME para ROMina
    ROM #(.FILE_NAME("ROMina_init.txt")) Romina(
        .DirL(instruccion[3:0]),
        .Data(c2)
    );

    MIPSALU Pablo(
        .ALUctl(instruccion[11:8]),
        .A(c1),
        .B(c2),
        .ALUOut(resultado),
        .Zero(ZF)
    );
endmodule
