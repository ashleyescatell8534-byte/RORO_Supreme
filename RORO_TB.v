
`timescale 1ns / 1ps

module RORO_tb();
    reg [11:0] instruccion;

    wire [31:0] resultado;
    wire ZF;

    RORO mi_roro (
        .instruccion(instruccion),
        .resultado(resultado),
        .ZF(ZF)
    );

  
    initial begin
        
        $monitor("Tiempo: %0t | Instruccion: %b | Resultado: %d | ZF: %b", $time, instruccion, resultado, ZF);

        instruccion = 12'b0010_0000_0000;
        #10; // Esperamos 10 unidades de tiempo para que la ALU procese

        instruccion = 12'b0110_0001_0001;
        #10;

        instruccion = 12'b0111_0010_0010;
        #10;

        instruccion = 12'b0010_0110_0110;
        #10;

        $display("Simulación terminada.");
        $finish; // Detiene la simulación
    end

endmodule