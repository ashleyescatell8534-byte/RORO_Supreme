`timescale 1ns / 1ps

module RORO_Supreme_tb();
    reg [3:0] pc;
    wire [31:0] dd;
    wire zf;

    // Arreglos para guardar los resultados esperados y comprobar automáticamente
    reg [31:0] expected_dd [0:15];
    reg expected_zf [0:15];

    // Instancia del módulo superior
    RORO_Supreme DUV (
        .pc(pc),
        .dd(dd),
        .zf(zf)
    );

    integer i;

    initial begin
        // Inicialización de resultados esperados según la tabla
        expected_dd[0] = 17;         expected_zf[0] = 0;
        expected_dd[1] = 21;         expected_zf[1] = 0;
        expected_dd[2] = 35;         expected_zf[2] = 0;
        expected_dd[3] = 12;         expected_zf[3] = 0;
        expected_dd[4] = 60;         expected_zf[4] = 0;
        expected_dd[5] = 48;         expected_zf[5] = 0;
        expected_dd[6] = 0;          expected_zf[6] = 1;
        expected_dd[7] = 9;          expected_zf[7] = 0;
        expected_dd[8] = 51;         expected_zf[8] = 0;
        expected_dd[9] = 32'd4294967255; expected_zf[9] = 0; // Resta negativa
        expected_dd[10] = 97;        expected_zf[10] = 0;
        expected_dd[11] = 0;         expected_zf[11] = 1;
        expected_dd[12] = 0;         expected_zf[12] = 1;
        expected_dd[13] = 0;         expected_zf[13] = 1;
        expected_dd[14] = 1;         expected_zf[14] = 0;
        expected_dd[15] = 0;         expected_zf[15] = 1;

        $display("Iniciando validacion RORO Supreme...");

        for (i = 0; i < 16; i = i + 1) begin
            pc = i;
            #10; // Pausa para propagación de señales

            if (dd == expected_dd[i] && zf == expected_zf[i]) begin
                $display("Prueba %0d: PASS -> DD=%0d, ZF=%b", i, dd, zf);
            end else begin
                $display("Prueba %0d: FAIL -> Esperado DD=%0d ZF=%b | Obtenido DD=%0d ZF=%b", 
                         i, expected_dd[i], expected_zf[i], dd, zf);
            end
        end
        $display("Simulacion completada.");
        $finish;
    end
endmodule