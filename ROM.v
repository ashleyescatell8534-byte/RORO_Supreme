module ROM #(parameter FILE_NAME = "initData.txt") (
    input [3:0] DirL,
    output [31:0] Data
);
    // (0 a 15) indica la actividad
    reg [31:0] srom [0:15];

    assign Data = srom[DirL];

    initial begin
        // Cargamos el archivo que se indique en el parámetro
        $readmemb(FILE_NAME, srom);
    end
endmodule
