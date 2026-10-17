module RORO_Supreme(
    input [3:0] pc, 
    output [31:0] dd, 
    output zf         
);
    wire [11:0] cable_inst; 

    // 1. Instanciamos la ROM de Instrucciones
    ROM_Instrucciones mi_programa (
        .dir_inst(pc),
        .instruccion(cable_inst)
    );

    // Instanciamos RORO
    RORO mi_nucleo (
        .instruccion(cable_inst),
        .resultado(dd),
        .ZF(zf)
    );
endmodule