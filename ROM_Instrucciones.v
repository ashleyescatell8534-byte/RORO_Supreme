module ROM_Instrucciones (
    input [3:0] dir_inst,
    output [11:0] instruccion
);
    reg [11:0] memoria [0:15]; 

    initial begin
        $readmemb("instrucciones.txt", memoria);
    end

    assign instruccion = memoria[dir_inst];
endmodule