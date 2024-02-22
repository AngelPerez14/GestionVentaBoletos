program GestionVentaBoletos;
uses crt, SysUtils;
  
var
  asistenciaEspecial: Real;
  serviciosAdicional: boolean;
  totalPagar: Real;
  costoBoletos: Real;
  costoComida: Real;
  cantAsistetenciaEspecialCliente: integer;
  //cantServiciosAdicionalesCliente: integer;
  cantComidaCliente: integer;
  tRuta: boolean;
  numeroBoletos: Integer;
  cantDescuento: Integer;
  
  // varaibles para los totales
  totalBoletosVendidos: Integer;
  totalServiciosAdicionales: Integer;
  ingresosPrimeraClase: Real;
  ingresosSegundaClase: Real;
  ingresosTerceraClase: Real;
  ingresosNacional: Real;
  ingresosInternacional: Real;
  
  // variables por ruta de viaje
  PorlamarCaracas : Real;
  CaracasPorlamar: Real;
  PuertoOrdazCaraca: Real;
  CaracasPuertoOrdaz: Real;
  MaracaiboCaracas: Real;
  CaracasMaracaibo: Real;
  ElVigiaPorlamar: Real;
  PorlamarElVigia: Real;
  BarcelonaCaracas: Real;
  CaracasBarcelona: Real;
  LaFriaCaracas: Real;
  CaracasLaFria: Real;
  BogotaCaracas: Real;
  CaracasBogota: Real;
  CurazaoCaracas: Real;
  CaracasCurazao: Real;
  SantoDomingoCaracas: Real;
  CaracasSantoDomingo: Real;
  LaRomanaCaracas: Real;
  CaracasLaRomana: Real;
  
  //variables de compra de Boletos
  nombrePasajero: string;
  cedula: string;
  edad: Integer;
  claseBoleto: Integer;
  tipoBoleto: Char;
  rutaViaje: Integer;
  requiereServiciosAdicionales: string;
  opcionServiciosAdicionales: string;
  nacionalidad: string;
  nacionalidadOpcion: Integer;
  utilCantTipoBoleto: Integer;
  isTrue: Boolean;
  opc: string;
  //input: string;
  ingresosClase: Real;
  regresoBoleto: Integer;
  opc2: string;

  num: integer;
  errorCode: integer;
  isString: Boolean;

var
    i: Integer;
    opcion: Integer;
    input: string;
    
    factura: Integer;
    totalingresosBoleto: Real;
    totalingresosTipo: Real;
    
    // Variables para los datos de la factura.
    nombreCliente: string;
    ceduelaCliente: string;
    edadCliente: Integer;
begin
    
    asistenciaEspecial := 100.0;
    factura := 0;
    
    totalBoletosVendidos:= 0;
    totalServiciosAdicionales := 0;
    ingresosPrimeraClase:= 0.0;
    ingresosSegundaClase:= 0.0;
    ingresosTerceraClase:= 0.0;
    
    PorlamarCaracas:= 0.0;
    CaracasPorlamar:= 0.0;
    PuertoOrdazCaraca:= 0.0;
    CaracasPuertoOrdaz:= 0.0;
    MaracaiboCaracas:= 0.0;
    CaracasMaracaibo:= 0.0;
    ElVigiaPorlamar:= 0.0;
    PorlamarElVigia:= 0.0;
    BarcelonaCaracas:= 0.0;
    CaracasBarcelona:= 0.0;
    LaFriaCaracas:= 0.0;
    CaracasLaFria:= 0.0;
    BogotaCaracas:= 0.0;
    CaracasBogota:= 0.0;
    CurazaoCaracas:= 0.0;
    CaracasCurazao:= 0.0;
    SantoDomingoCaracas:= 0.0;
    CaracasSantoDomingo:= 0.0;
    LaRomanaCaracas:= 0.0;
    CaracasLaRomana:= 0.0;
    
    clrscr;
    repeat
        clrscr;
        writeln('*****************************************************************************');
        writeln('*                           --- LASER Airlines ---                          *');
        writeln('*                    --- Sistema de Venta de Boletos ---                    *');
        writeln('*****************************************************************************');
    
        repeat
            writeln;
            writeln('           1. Comprar Boleto');
            writeln('           2. Ver Sistema');
            writeln('           3. Salir');
            writeln;
            write('           Ingrese su opción: ');
            readln(input);
            
            Val(input, num, errorCode);
    
            if errorCode <> 0 then begin
                // Si es true es un string
                isString := true;
            end
            else begin
                // Si es false es un integer
                isString := false;
            end;
            
            if isString = false then begin
                opcion := StrToInt(input);
            end
            else begin
                clrscr;
                writeln('*****************************************************************************');
                writeln('*                           --- LASER Airlines ---                          *');
                writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                writeln('*****************************************************************************');
                writeln;
                writeln('           Ingrese un valor valido');
            end;
            writeln;
        until isString = false;
    
        clrscr;
        case opcion of
            1:
                begin
                    // la variable factura se incrementa cada que se ingresa la modulo de compra
                    factura := factura + 1;
                    
                    writeln('*****************************************************************************');
                    writeln('*                           --- LASER Airlines ---                          *');
                    writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                    writeln('*****************************************************************************');
                    
                    //Inicializamos variables del cliente en este punto.
                    numeroBoletos := 0;
                    serviciosAdicional := false;
                    totalPagar := 0.0;
                    costoComida := 0.0;

                    cantAsistetenciaEspecialCliente := 0;
                    //cantServiciosAdicionalesCliente := 0;
                    cantComidaCliente := 0;
                    cantDescuento := 0;
                    
                    tRuta := false;
                    //Fin inicializacion variables cliente
                    
                    writeln;
                    writeln('           --- DATOS DE LA FACTURA ---');
                    writeln;
                    write('           Ingrese edad del cliente: ');
                    readln(input);
                    
                    Val(input, num, errorCode);
    
                    if errorCode <> 0 then begin
                        // Si es true es un string
                        isString := true;
                    end
                    else begin
                        // Si es false es un integer
                        isString := false;
                    end;
                    
                    if isString = false then begin
                        edadCliente := StrToInt(input);
                        
                        // Validar edad del cliente
                        if (edadCliente < 18) then begin
                          writeln;
                          writeln('           Lo siento, los boletos solo están disponibles para clientes');
                          writeln('           mayores de 18 años.');
                          writeln;
                        end
                        else begin
                            
                            repeat
                                write('           Nombre del cliente: ');
                                readln(input);
                                
                                Val(input, num, errorCode);
    
                                if errorCode <> 0 then begin
                                    // Si es true es un string
                                    isString := true;
                                end
                                else begin
                                    // Si es false es un integer
                                    isString := false;
                                end;
                                
                                if isString = true then begin
                                  nombreCliente := input;
                                end
                                else begin
                                  clrscr;
                                  writeln('*****************************************************************************');
                                  writeln('*                           --- LASER Airlines ---                          *');
                                  writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                  writeln('*****************************************************************************');
                                  writeln;
                                  writeln('           Ingrese valor valido:');
                                end;
                                
                                if input = '' then begin
                                  clrscr;
                                  writeln('*****************************************************************************');
                                  writeln('*                           --- LASER Airlines ---                          *');
                                  writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                  writeln('*****************************************************************************');
                                  writeln;
                                end;
                            until (isString = true) and (input <> '');
                            
                            repeat    
                              write('           Cedula del cliente: ');
                              readln(input);
                              
                              Val(input, num, errorCode);
    
                              if errorCode <> 0 then begin
                                  // Si es true es un string
                                  isString := true;
                              end
                              else begin
                                  // Si es false es un integer
                                  isString := false;
                              end;
                              
                              if isString = false then begin
                                ceduelaCliente := input;
                                
                                if StrToInt(ceduelaCliente) <= 0 then begin
                                    clrscr;
                                    writeln('*****************************************************************************');
                                    writeln('*                           --- LASER Airlines ---                          *');
                                    writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                    writeln('*****************************************************************************');
                                    writeln;
                                    writeln('           No puede ingresar valores negativos.');
                                end;
                              end
                              else begin
                                clrscr;
                                writeln('*****************************************************************************');
                                  writeln('*                           --- LASER Airlines ---                          *');
                                  writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                  writeln('*****************************************************************************');
                                writeln;
                                writeln('           Ingrese un valor valido');
                                ceduelaCliente := '0';
                              end;
                              
                            until (StrToInt(ceduelaCliente) > 0) and (isString = false);
                            
                            repeat
                                writeln;
                                write('           Cantidad de boletos : ');
                                readln(input);
                                
                                Val(input, num, errorCode);
    
                                if errorCode <> 0 then begin
                                    // Si es true es un string
                                    isString := true;
                                end
                                else begin
                                    // Si es false es un integer
                                    isString := false;
                                end;
                                
                                if isString = false then begin
                                    numeroBoletos := StrToInt(input);
                                end
                                else begin
                                    clrscr;
                                    writeln('*****************************************************************************');
                                    writeln('*                           --- LASER Airlines ---                          *');
                                    writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                    writeln('*****************************************************************************');
                                    writeln;
                                    writeln('           Ingrese un valor valido');
                                end;
                                writeln;
                            until isString = false;    
                            
                            // agregamos la cantidad de boletos al total vendidos
                            totalBoletosVendidos := totalBoletosVendidos + numeroBoletos;
                            
                            for i := 1 to numeroBoletos do begin
                                serviciosAdicional := false;
                                ingresosClase := 0.0;
                                regresoBoleto := 0;
                                opc:= '';
                                
                                // Solicitar datos del pasajero
                                clrscr;
                                writeln('*****************************************************************************');
                                writeln('*                           --- LASER Airlines ---                          *');
                                writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                writeln('*****************************************************************************');
                                writeln;
                                writeln('           --- COMPRAR BOLETO ---');
                                writeln;
                              
                                repeat
                                  writeln('           Ingrese los datos del pasajero');
                                  write('           Nombre: ');
                                  readln(input);
                                  
                                  Val(input, num, errorCode);
    
                                  if errorCode <> 0 then begin
                                      // Si es true es un string
                                      isString := true;
                                  end
                                  else begin
                                      // Si es false es un integer
                                      isString := false;
                                  end;
                                  
                                  if isString = true then begin
                                    nombrePasajero := input;
                                  end
                                  else begin
                                    clrscr;
                                    writeln('*****************************************************************************');
                                    writeln('*                           --- LASER Airlines ---                          *');
                                    writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                    writeln('*****************************************************************************');
                                    writeln;
                                    writeln('           Ingrese valor valido:');
                                  end;
                                  
                                  if input = '' then begin
                                    clrscr;
                                    writeln('*****************************************************************************');
                                    writeln('*                           --- LASER Airlines ---                          *');
                                    writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                    writeln('*****************************************************************************');
                                    writeln;
                                  end;
                                until (isString = true) and (input <> '');
                              
                                nacionalidadOpcion := 0;
                                repeat
                                  writeln;
                                  writeln('           -> NACIONALIDAD');
                                  writeln;
                                  writeln('           1 - Venezolano');
                                  writeln('           2 - Extranjero');
                                  write('           Opcion: ');
                                  readln(input);
                                  
                                  Val(input, num, errorCode);
    
                                  if errorCode <> 0 then begin
                                      // Si es true es un string
                                      isString := true;
                                  end
                                  else begin
                                      // Si es false es un integer
                                      isString := false;
                                  end;
                                  
                                  if isString = false then begin
                                    nacionalidadOpcion := StrToInt(input);
                                    case nacionalidadOpcion of
                                      1: begin nacionalidad := 'V'; end;
                                      2: begin nacionalidad := 'E'; end;
                                      else begin writeln; writeln('           Opción inválida.'); writeln; end;
                                    end;
                                  end
                                  else begin
                                    clrscr;
                                    writeln('*****************************************************************************');
                                    writeln('*                           --- LASER Airlines ---                          *');
                                    writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                    writeln('*****************************************************************************');
                                    writeln;
                                    writeln('           Ingrese un valor valido');
                                  end;
                                until ((nacionalidadOpcion = 1) or (nacionalidadOpcion = 2)) and (isString = false);
                                
                                repeat    
                                  write('           Cédula de Identidad: ');
                                  readln(input);
                                  
                                  Val(input, num, errorCode);
    
                                  if errorCode <> 0 then begin
                                      // Si es true es un string
                                      isString := true;
                                  end
                                  else begin
                                      // Si es false es un integer
                                      isString := false;
                                  end;
                                  
                                  if isString = false then begin
                                    cedula := input;
                                    
                                    if StrToInt(cedula) <= 0 then begin
                                        clrscr;
                                        writeln('*****************************************************************************');
                                        writeln('*                           --- LASER Airlines ---                          *');
                                        writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                        writeln('*****************************************************************************');
                                        writeln;
                                        writeln('           No puede ingresar valores negativos.');
                                    end;
                                  end
                                  else begin
                                    clrscr;
                                    writeln('*****************************************************************************');
                                    writeln('*                           --- LASER Airlines ---                          *');
                                    writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                    writeln('*****************************************************************************');
                                    writeln;
                                    writeln('           Ingrese un valor valido');
                                    cedula := '0';
                                  end;
                                  
                                until (StrToInt(cedula) > 0) and (isString = false);
                               
                                repeat  
                                  write('           Edad: ');
                                  readln(input);
                                  
                                  Val(input, num, errorCode);
    
                                  if errorCode <> 0 then begin
                                      // Si es true es un string
                                      isString := true;
                                  end
                                  else begin
                                      // Si es false es un integer
                                      isString := false;
                                  end;
                                  
                                  if isString = false then begin
                                    edad := StrToInt(input);
                                    
                                    if edad <= 0 then begin
                                        clrscr;
                                        writeln('*****************************************************************************');
                                        writeln('*                           --- LASER Airlines ---                          *');
                                        writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                        writeln('*****************************************************************************');
                                        writeln;
                                        writeln('           No puede ingresar valores negativos.');
                                    end;  
                                  end
                                  else begin
                                    clrscr;
                                    writeln('*****************************************************************************');
                                    writeln('*                           --- LASER Airlines ---                          *');
                                    writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                    writeln('*****************************************************************************');
                                    writeln;
                                    writeln('           Ingrese un valor valido');
                                  end;
                                 
                                until (edad > 0) and (isString = false);
                                
                                repeat 
                                    repeat
                                        isTrue := false;
                                        
                                        writeln;
                                        writeln('           -> CLASE DE BOLETO');
                                        writeln;
                                        writeln('           1 - Primera Clase');
                                        writeln('           2 - Segunda Clase');
                                        writeln('           3 - Tercera Clase');
                                        write('           Opcion: ');
                                        readln(input);
                                        
                                        Val(input, num, errorCode);
    
                                        if errorCode <> 0 then begin
                                            // Si es true es un string
                                            isString := true;
                                        end
                                        else begin
                                            // Si es false es un integer
                                            isString := false;
                                        end;
                                        
                                        if isString = false then begin
                                            claseBoleto := StrToInt(input);
                                            
                                            // Validar disponibilidad de boletos de tercera clase para pasajeros menores de 60 años
                                            if (claseBoleto = 3) and (edad >= 60) then begin
                                                clrscr;
                                                writeln('*****************************************************************************');
                                                writeln('*                           --- LASER Airlines ---                          *');
                                                writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                                writeln('*****************************************************************************');
                                                writeln;
                                                writeln('           Lo siento, los boletos de tercera clase solo están disponibles');
                                                writeln('           para pasajeros menores de 60 años.');
                                                writeln;
                                                
                                                isTrue := true;
                                            end;
                                        end
                                        else begin
                                            clrscr;
                                            writeln('*****************************************************************************');
                                            writeln('*                           --- LASER Airlines ---                          *');
                                            writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                            writeln('*****************************************************************************');
                                            writeln;
                                            writeln('           Ingrese un valor valido');
                                        end;
                                        writeln;
                                    until isTrue = false;    
                                until ((claseBoleto > 0) and (claseBoleto < 4)) and (isString = false);
                              
                                repeat
                                    repeat
                                      writeln;
                                      writeln('           -> TIPO DE BOLETO');
                                      writeln;
                                      writeln('           N - Nacional');
                                      writeln('           I - Internacional');
                                      write('           Opcion: ');
                                      readln(tipoBoleto);
                                      writeln;
                                        
                                        if ((tipoBoleto = 'n') or (tipoBoleto = 'i')) or ((tipoBoleto = 'N') or (tipoBoleto = 'I')) then begin
                                            clrscr;
                                            writeln('*****************************************************************************');
                                            writeln('*                           --- LASER Airlines ---                          *');
                                            writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                            writeln('*****************************************************************************');
                                            writeln; 
                                            writeln('           -> RUTAS DE VUELO');
                                            writeln; 
                                            writeln('                ORIGEN          DESTINO                 COSTO');
                                            writeln('           --------------------------------------------------');
                                            case tipoBoleto of
                                                'n', 'N': begin 
                                                            tRuta := false;
                                
                                                            //Rutas de vuelo nacional
                                                            writeln('           1  - Porlamar        Caracas                   50');
                                                            writeln('           2  - Caracas         Porlamar                  50');
                                                            writeln('           3  - Puerto Ordaz    Caracas                   45');
                                                            writeln('           4  - Caracas         Puerto Ordaz              45');
                                                            writeln('           5  - Maracaibo       Caracas                   80');
                                                            writeln('           6  - Caracas         Maracaibo                 80');
                                                            writeln('           7  - El Vigia        Porlamar                  75');
                                                            writeln('           8  - Porlamar        El Vigia                  75');
                                                            writeln('           9  - Barcelona       Caracas                   30');
                                                            writeln('           10 - Caracas         Barcelona                 30');
                                                            writeln('           11 - La Fria         Caracas                   60');
                                                            writeln('           12 - Caracas         La Fria                   60');
                                                            
                                                          end;
                                                'i', 'I': begin 
                                                            tRuta := true;
                                                                
                                                            //Rutas de vuelo internacional
                                                            writeln('           1  - Bogota          Caracas                   499');
                                                            writeln('           2  - Caracas         Bogota                    499');
                                                            writeln('           3  - Curazao         Caracas                   400');
                                                            writeln('           4  - Caracas         Curazao                   400');
                                                            writeln('           5  - Santo Domingo   Caracas                   700');
                                                            writeln('           6  - Caracas         Santo Domingo             700');
                                                            writeln('           7  - La Romana       Caracas                   650');
                                                            writeln('           8  - Caracas         La Romana                 650');
                                                         end;
                                                else begin writeln; writeln('           Opción inválida.'); writeln; end;
                                            end;
                                      
                                        end
                                        else begin
                                            clrscr;
                                            writeln('*****************************************************************************');
                                            writeln('*                           --- LASER Airlines ---                          *');
                                            writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                            writeln('*****************************************************************************');
                                            writeln;
                                            writeln('           Opción inválida.');
                                            writeln;
                                        end;
                                        
                                    until ((tipoBoleto = 'n') or (tipoBoleto = 'i')) or ((tipoBoleto = 'N') or (tipoBoleto = 'I'));
                                    
                                    writeln;
                                    writeln('           --------------------------------------------------');
                                    writeln('           0  - Regresar -> Tipo de Boleto');
                                    writeln;
                                    
                                    write('           Opción: ');
                                    readln(input);
                                    
                                    Val(input, num, errorCode);
    
                                    if errorCode <> 0 then begin
                                        // Si es true es un string
                                        isString := true;
                                    end
                                    else begin
                                        // Si es false es un integer
                                        isString := false;
                                    end;
                                    
                                    if isString = false then begin
                                      rutaViaje := StrToInt(input);
                                      
                                      // Verificamos la edad
                                      if (edad <= 12) or (edad >= 60) then begin 
                                        cantDescuento := cantDescuento + 1;
                                      end;
                                      
                                      regresoBoleto := 1;
                                      // Verificamos que la ruta sea nacional o internacional falso = nacional y true = internacional
                                      // Para aplicar el descuento del 10% al costo del boleto multiplicamos por 0.10
                                      if tRuta = false then begin
                                        repeat
                                            write('           ¿Desea pasaje de regreso? (S/N): ');
                                            readln(opc2)
                                        until ((opc2 = 's') or (opc2 = 'S')) or ((opc2 = 'n') or (opc2 = 'N'));
                                        
                                        if ((opc2 = 's') or (opc2 = 'S')) then begin
                                            regresoBoleto := 2;
                                        end;
                                        
                                        case rutaViaje of
                                            1:  begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((50.00 - (50.00 * 0.10)) * regresoBoleto); PorlamarCaracas:= PorlamarCaracas + ingresosClase; end else begin ingresosClase := 50.00 * regresoBoleto; PorlamarCaracas:= PorlamarCaracas + ingresosClase;  end; end;
                                            2:  begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((50.00 - (50.00 * 0.10)) * regresoBoleto ); CaracasPorlamar:= CaracasPorlamar + ingresosClase; end else begin ingresosClase := 50.00 * regresoBoleto; CaracasPorlamar:= CaracasPorlamar + ingresosClase;  end; end;
                                            3:  begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((45.00 - (45.00 * 0.10)) * regresoBoleto); PuertoOrdazCaraca:= PuertoOrdazCaraca + ingresosClase; end else begin ingresosClase := 45.00 * regresoBoleto; PuertoOrdazCaraca:= PuertoOrdazCaraca + ingresosClase;  end; end;
                                            4:  begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((45.00 - (45.00 * 0.10)) * regresoBoleto); CaracasPuertoOrdaz:= CaracasPuertoOrdaz + ingresosClase; end else begin ingresosClase := 45.00 * regresoBoleto; CaracasPuertoOrdaz:= CaracasPuertoOrdaz + ingresosClase; end; end;
                                            5:  begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((80.00 - (80.00 * 0.10)) * regresoBoleto); MaracaiboCaracas:= MaracaiboCaracas + ingresosClase; end else begin ingresosClase := 80.00 * regresoBoleto; MaracaiboCaracas:= MaracaiboCaracas + ingresosClase;  end; end;
                                            6:  begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((80.00 - (80.00 * 0.10)) * regresoBoleto); CaracasMaracaibo:= CaracasMaracaibo + ingresosClase; end else begin ingresosClase := 80.00 * regresoBoleto; CaracasMaracaibo:= CaracasMaracaibo + ingresosClase;  end; end;
                                            7:  begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((75.00 - (75.00 * 0.10)) * regresoBoleto); ElVigiaPorlamar:= ElVigiaPorlamar + ingresosClase; end else begin ingresosClase := 75.00 * regresoBoleto; ElVigiaPorlamar:= ElVigiaPorlamar + ingresosClase;  end; end;
                                            8:  begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((75.00 - (75.00 * 0.10)) * regresoBoleto); PorlamarElVigia:= PorlamarElVigia + ingresosClase; end else begin ingresosClase := 75.00 * regresoBoleto; PorlamarElVigia:= PorlamarElVigia + ingresosClase;  end; end;
                                            9:  begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((30.00 - (30.00 * 0.10)) * regresoBoleto); BarcelonaCaracas:= BarcelonaCaracas + ingresosClase; end else begin ingresosClase := 30.00 * regresoBoleto; BarcelonaCaracas:= BarcelonaCaracas + ingresosClase;  end; end;
                                            10: begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((30.00 - (30.00 * 0.10)) * regresoBoleto); CaracasBarcelona:= CaracasBarcelona + ingresosClase; end else begin ingresosClase := 30.00 * regresoBoleto; CaracasBarcelona:= CaracasBarcelona + ingresosClase;  end; end;
                                            11: begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((60.00 - (60.00 * 0.10)) * regresoBoleto); LaFriaCaracas:= LaFriaCaracas + ingresosClase; end else begin ingresosClase := 60.00 * regresoBoleto; LaFriaCaracas:= LaFriaCaracas + ingresosClase;  end; end;
                                            12: begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((60.00 - (60.00 * 0.10)) * regresoBoleto); CaracasLaFria:= CaracasLaFria + ingresosClase; end else begin ingresosClase := 60.00 * regresoBoleto; CaracasLaFria:= CaracasLaFria + ingresosClase;  end; end;
                                        end;
                              
                                        totalPagar := totalPagar + ingresosClase;
                                        case claseBoleto of
                                            1: ingresosPrimeraClase := ingresosPrimeraClase + ingresosClase;
                                            2: ingresosSegundaClase := ingresosSegundaClase + ingresosClase;
                                            3: ingresosTerceraClase := ingresosTerceraClase + ingresosClase;
                                        end;
                                        
                                        ingresosNacional:= ingresosNacional + ingresosClase;
                                        //Aqui se tiene que preguntar si desea un pasaje de regreso o otra ruta
                                      end
                                      else begin
                                        // Como es una ruta de vuelo internacional lo multiplico * 2
                                        // Dado que se debe comprar pasaje de ida y vuelda
                                        case rutaViaje of
                                            1: begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((499.00 * 2) - ((499.00 * 2) * 0.10)); BogotaCaracas := BogotaCaracas + ingresosClase; end else begin ingresosClase := (499.00 * 2); BogotaCaracas:= BogotaCaracas + ingresosClase; end; end;
                                            2: begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((499.00 * 2) - ((499.00 * 2) * 0.10)); CaracasBogota := ingresosClase + CaracasBogota; end else begin ingresosClase := (499.00 * 2); CaracasBogota:= CaracasBogota + ingresosClase; end; end;
                                            3: begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((400.00 * 2) - ((400.00 * 2) * 0.10)); CurazaoCaracas := CurazaoCaracas + ingresosClase; end else begin ingresosClase := (400.00 * 2); CurazaoCaracas:= CurazaoCaracas + ingresosClase; end; end;
                                            4: begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((400.00 * 2) - ((400.00 * 2) * 0.10)); CaracasCurazao := CaracasCurazao + ingresosClase; end else begin ingresosClase := (400.00 * 2); CaracasCurazao:= CaracasCurazao + ingresosClase; end; end;
                                            5: begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((700.00 * 2) - ((700.00 * 2) * 0.10)); SantoDomingoCaracas := SantoDomingoCaracas + ingresosClase; end else begin ingresosClase := (700.00 * 2); SantoDomingoCaracas:= SantoDomingoCaracas + ingresosClase; end; end;
                                            6: begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((700.00 * 2) - ((700.00 * 2) * 0.10)); CaracasSantoDomingo := CaracasSantoDomingo + ingresosClase; end else begin ingresosClase := (700.00 * 2); CaracasSantoDomingo:= CaracasSantoDomingo + ingresosClase; end; end;
                                            7: begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((650.00 * 2) - ((650.00 * 2) * 0.10)); LaRomanaCaracas := LaRomanaCaracas + ingresosClase; end else begin ingresosClase := (650.00 * 2); LaRomanaCaracas:= LaRomanaCaracas + ingresosClase; end; end;
                                            8: begin if (edad <= 12) or (edad >= 60) then begin ingresosClase := ((650.00 * 2) - ((650.00 * 2) * 0.10)); CaracasLaRomana := CaracasLaRomana + ingresosClase; end else begin ingresosClase := (650.00 * 2); CaracasLaRomana:= CaracasLaRomana + ingresosClase ; end; end;
                                        end;
                                        
                                        totalPagar := totalPagar + ingresosClase;
                                        
                                        case claseBoleto of
                                            1: ingresosPrimeraClase := ingresosPrimeraClase + ingresosClase;
                                            2: ingresosSegundaClase := ingresosSegundaClase + ingresosClase;
                                            3: ingresosTerceraClase := ingresosTerceraClase + ingresosClase;
                                        end;
                                        
                                        ingresosInternacional := ingresosInternacional + ingresosClase;
                                      end;
                                      
                                      costoBoletos := totalPagar;
                                      
                                      if rutaViaje < 0 then begin
                                          clrscr;
                                          writeln('*****************************************************************************');
                                          writeln('*                           --- LASER Airlines ---                          *');
                                          writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                          writeln('*****************************************************************************');
                                          writeln;
                                          writeln('           No puede ingresar valores negativos.');
                                          writeln;
                                      end;  
                                    end
                                    else begin
                                      clrscr;
                                      writeln('*****************************************************************************');
                                      writeln('*                           --- LASER Airlines ---                          *');
                                      writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                      writeln('*****************************************************************************');
                                      writeln;
                                      writeln('           Ingrese un valor valido');
                                      writeln;
                                    end;
                                    writeln;
                                  
                                    if ((tipoBoleto = 'n') or (tipoBoleto = 'N')) then 
                                        begin
                                            utilCantTipoBoleto := 12;
                                        end
                                    else 
                                        begin
                                            utilCantTipoBoleto := 8;
                                        end;
                                      
                                    if ((rutaViaje < 0) or (rutaViaje > utilCantTipoBoleto)) then begin
                                        clrscr;
                                        writeln('*****************************************************************************');
                                        writeln('*                           --- LASER Airlines ---                          *');
                                        writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                        writeln('*****************************************************************************');
                                        writeln; writeln('           Opción inválida.'); writeln;
                                        write('           Presione Enter para continuar...');
                                        readln;
                                    end;
                                  
                                    if rutaViaje = 0 then begin
                                        clrscr;
                                        writeln('*****************************************************************************');
                                        writeln('*                           --- LASER Airlines ---                          *');
                                        writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                        writeln('*****************************************************************************');
                                        writeln; 
                                    end;
                                  
                                until ((rutaViaje >= 1) and (rutaViaje <= utilCantTipoBoleto)) and (isString = false);
                                
                                repeat
                                    write('           ¿Requiere servicios adicionales? (S/N): ');
                                    readln(input);
                                    
                                    Val(input, num, errorCode);
    
                                    if errorCode <> 0 then begin
                                        // Si es true es un string
                                        isString := true;
                                    end
                                    else begin
                                        // Si es false es un integer
                                        isString := false;
                                    end;
                                    
                                    if isString = true then begin
                                      requiereServiciosAdicionales := input; 
                                    end
                                    else begin
                                      clrscr;
                                      writeln('*****************************************************************************');
                                      writeln('*                           --- LASER Airlines ---                          *');
                                      writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                      writeln('*****************************************************************************');
                                      writeln;
                                      writeln('           Ingrese un valor valido');
                                      writeln;
                                    end;
                                    
                                    case requiereServiciosAdicionales of
                                        's', 'S': 
                                                begin 
                                                    totalServiciosAdicionales := totalServiciosAdicionales + 1;
                                                    repeat
                                                        clrscr;
                                                        writeln('*****************************************************************************');
                                                        writeln('*                           --- LASER Airlines ---                          *');
                                                        writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                                        writeln('*****************************************************************************');
                                                        writeln;
                                                            
                                                        writeln;
                                                        writeln('           -> SERVICIOS ADICIONALES');
                                                        writeln;
                                                        writeln('           1 - Comida especial');
                                                        writeln('           2 - Asistencia especial');
                                                        write('           Opcion: ');
                                                        readln(opcionServiciosAdicionales);
                                                        
                                                        case opcionServiciosAdicionales of
                                                            '1':
                                                                begin
                                                                    repeat
                                                                        clrscr;
                                                                        writeln('*****************************************************************************');
                                                                        writeln('*                           --- LASER Airlines ---                          *');
                                                                        writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                                                        writeln('*****************************************************************************');
                                                                        writeln;
                                                                        
                                                                        writeln('                MENU                                    COSTO');
                                                                        writeln('           --------------------------------------------------');
                                                                        writeln('           1  - Menú vegetariano y frutas                 15');
                                                                        writeln('           2  - Menú bajo en colesterol                   15');
                                                                        writeln('           3  - Menú para niños                           10');
                                                                        writeln('           4  - Menú bajo en calorías                     15');
                                                                        writeln('           5  - Menú de pescados y mariscos               20');
                                                                        
                                                                        writeln;
                                                                        writeln('           --------------------------------------------------');
                                                                        writeln('           0  - Regresar');
                                                                        writeln;
                                                                        
                                                                        write('           Opción: ');
                                                                        readln(opc);
                                                                        
                                                                        Val(opc, num, errorCode);
    
                                                                        if errorCode <> 0 then begin
                                                                            // Si es true es un string
                                                                            isString := true;
                                                                        end
                                                                        else begin
                                                                            // Si es false es un integer
                                                                            isString := false;
                                                                        end;
                                                                        
                                                                        if isString = true then begin
                                                                            opc := '8';
                                                                        end
                                                                        
                                                                        else begin
                                                                            case opc of
                                                                                '1': begin totalPagar := totalPagar + (15.00); costoComida := costoComida + 15.00; cantComidaCliente := cantComidaCliente + 1; end;
                                                                                '2': begin totalPagar := totalPagar + (15.00); costoComida := costoComida + 15.00; cantComidaCliente := cantComidaCliente + 1; end;
                                                                                '3': begin totalPagar := totalPagar + (10.00); costoComida := costoComida + 10.00; cantComidaCliente := cantComidaCliente + 1; end;
                                                                                '4': begin totalPagar := totalPagar + (15.00); costoComida := costoComida + 15.00; cantComidaCliente := cantComidaCliente + 1; end;
                                                                                '5': begin totalPagar := totalPagar + (20.00); costoComida := costoComida + 20.00; cantComidaCliente := cantComidaCliente + 1; end;
                                                                            end;
                                                                        end;
                                                                    until ((StrToInt(opc) >= 0) and (StrToInt(opc) < 7));    
                                                                end;
                                                            '2': 
                                                                begin 
                                                                    //Se cuenta la veces que pide servicios especial
                                                                    cantAsistetenciaEspecialCliente := cantAsistetenciaEspecialCliente + 1;
                                                                    writeln(cantAsistetenciaEspecialCliente);
                                                                    writeln;
                                                                    writeln('           Se agregaron servicios adicionales.');
                                                                    writeln;
                                                                    opc := '1';
                                                                end;
                                                            else begin
                                                                clrscr;
                                                                writeln('*****************************************************************************');
                                                                writeln('*                           --- LASER Airlines ---                          *');
                                                                writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                                                                writeln('*****************************************************************************');
                                                                writeln;
                                                                writeln('           Opción inválida.');
                                                            end;
                                                        end;
                                                    until ((opcionServiciosAdicionales = '1') or (opcionServiciosAdicionales = '2')) and (StrToInt(opc) > 0);
                                                end;
                                        'n', 'N': writeln;
                                        else begin writeln; writeln('           Opción inválida.'); writeln; end;
                                    end;
                                until (requiereServiciosAdicionales = 'n') or (requiereServiciosAdicionales = 'N');
                                
                                writeln;
                                writeln('           ¡Boleto generado exitosamente!');
                                writeln;
                            end;
                            
                            // Una vez terminado la creacion de boletos se inicia calculos
                            if cantAsistetenciaEspecialCliente > 0 then begin
                                totalPagar := totalPagar + (cantAsistetenciaEspecialCliente * asistenciaEspecial);
                            end;
                            
                            writeln;
                            write('           Presione Enter para continuar...');
                            readln;
                            
                            clrscr;
                            writeln('*****************************************************************************');
                            writeln('*                           --- LASER Airlines ---                          *');
                            writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                            writeln('*****************************************************************************');
                            writeln;
                               
                            // verificamos que no es 0 numeroBoletos      
                            if numeroBoletos > 0 then begin      
                                writeln('           DATOS DEL CLIENTE');
                                writeln('           ----------------------------------------------------');
                                writeln;
                                writeln('           Cliente: ' + nombreCliente);
                                writeln('           Cedula: ' + ceduelaCliente);
                                writeln;
                                writeln('           BOLETOS'); 
                                writeln('           ----------------------------------------------------');
                                write('           ' + IntToStr(numeroBoletos) + '           Costo: ' ); writeln(costoBoletos:0:2);
                                if (cantAsistetenciaEspecialCliente > 0) or (cantComidaCliente > 0) then begin
                                    writeln;
                                    writeln('           SERVICIOS ADICIONALES');
                                    writeln('           ----------------------------------------------------');
                                    
                                    if cantComidaCliente > 0 then begin
                                        write('           ' + IntToStr(cantComidaCliente) + '           Comida Especial            Total: '); writeln(costoComida:0:2);
                                    end;
                                    
                                    if cantAsistetenciaEspecialCliente > 0 then begin
                                        write('           ' + IntToStr(cantAsistetenciaEspecialCliente) + '           Asistencia Especial        Costo: '); writeln(asistenciaEspecial:0:2);
                                    end;
                                end;
                                writeln;
                                writeln('           ----------------------------------------------------');
                                if cantDescuento > 0 then begin 
                                    writeln('           Se aplicaron ' + IntToStr(cantDescuento) + ' descuentos del 10% al costo del boleto');
                                end;
                                write('           TOTAL A PAGAR: '); writeln(totalPagar:0:2);
                            end;    
                        end;
                    end;
                end;
            2:  begin 
                    clrscr;
                    writeln('*****************************************************************************');
                    writeln('*                           --- LASER Airlines ---                          *');
                    writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                    writeln('*****************************************************************************');
                    writeln;
                    writeln('           --- REPORTE DEL SISTEMA ---');
                    writeln;
                    writeln('           Total boletos vendidos: ' + IntToStr(totalBoletosVendidos));
                    writeln;
                    totalingresosBoleto := ingresosPrimeraClase + ingresosSegundaClase + ingresosTerceraClase;
                    write('           -> Total por clase: '); writeln(totalingresosBoleto:0:2);
                    write('           Primera Clase: '); writeln(ingresosPrimeraClase:0:2);
                    write('           Segunda Clase: '); writeln(ingresosSegundaClase:0:2);
                    write('           Tercera Clase: '); writeln(ingresosTerceraClase:0:2);
                    writeln;
                    totalingresosTipo:= ingresosNacional + ingresosInternacional; 
                    write('           -> Total tipo boleto: '); writeln(totalingresosTipo:0:2);
                    write('           Nacional: '); writeln(ingresosNacional:0:2);
                    write('           Internacional: '); writeln(ingresosInternacional:0:2);
                    writeln;
                    writeln('           -> Servicios adicionales: ' + IntToStr(totalServiciosAdicionales));
                    writeln;
                    writeln('           -> Total por ruta de viaje: ' + IntToStr(totalBoletosVendidos));
                    writeln('               * Nacional ');
                    write('                   Porlamar - Caracas '); writeln(PorlamarCaracas:0:2);
                    write('                   Caracas - Porlamar: '); writeln(CaracasPorlamar:0:2);
                    write('                   Puerto Ordaz - Caraca: '); writeln(PuertoOrdazCaraca:0:2);
                    write('                   Caracas - Puerto Ordaz: '); writeln(CaracasPuertoOrdaz:0:2);
                    write('                   Maracaibo - Caracas: '); writeln(MaracaiboCaracas:0:2);
                    write('                   Caracas - Maracaibo: '); writeln(CaracasMaracaibo:0:2);
                    write('                   El Vigia - Porlamar: '); writeln(ElVigiaPorlamar:0:2);
                    write('                   Porlamar - El Vigia: '); writeln(PorlamarElVigia:0:2);
                    write('                   Barcelona - Caracas: '); writeln(BarcelonaCaracas:0:2);
                    write('                   Caracas - Barcelona: '); writeln(CaracasBarcelona:0:2);
                    write('                   La Fria - Caracas: '); writeln(LaFriaCaracas:0:2);
                    write('                   Caracas - La Fria: '); writeln(CaracasLaFria:0:2);
                    writeln('               * Internacional ');
                    write('                   Bogota - Caracas: '); writeln(BogotaCaracas:0:2);
                    write('                   Caracas - Bogota: '); writeln(CaracasBogota:0:2);
                    write('                   Curazao - Caracas: '); writeln(CurazaoCaracas:0:2);
                    write('                   Caracas - Curazao: '); writeln(CaracasCurazao:0:2);
                    write('                   Santo Domingo - Caracas: '); writeln(SantoDomingoCaracas:0:2);
                    write('                   Caracas - Santo Domingo: '); writeln(CaracasSantoDomingo:0:2);
                    write('                   La Romana - Caracas: '); writeln(LaRomanaCaracas:0:2);
                    write('                   Caracas - La Romana: '); writeln(CaracasLaRomana:0:2);
                end;
            3:  begin 
                    clrscr;
                    writeln('*****************************************************************************');
                    writeln('*                           --- LASER Airlines ---                          *');
                    writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                    writeln('*****************************************************************************');
                    writeln;
                    writeln('           --- REPORTE DEL SISTEMA ---');
                    writeln;
                    writeln('           Total boletos vendidos: ' + IntToStr(totalBoletosVendidos));
                    writeln;
                    totalingresosBoleto := ingresosPrimeraClase + ingresosSegundaClase + ingresosTerceraClase;
                    write('           -> Total por clase: '); writeln(totalingresosBoleto:0:2);
                    write('           Primera Clase: '); writeln(ingresosPrimeraClase:0:2);
                    write('           Segunda Clase: '); writeln(ingresosSegundaClase:0:2);
                    write('           Tercera Clase: '); writeln(ingresosTerceraClase:0:2);
                    writeln;
                    totalingresosTipo:= ingresosNacional + ingresosInternacional; 
                    write('           -> Total tipo boleto: '); writeln(totalingresosTipo:0:2);
                    write('           Nacional: '); writeln(ingresosNacional:0:2);
                    write('           Internacional: '); writeln(ingresosInternacional:0:2);
                    writeln;
                    writeln('           -> Servicios adicionales: ' + IntToStr(totalServiciosAdicionales));
                    writeln;
                    writeln('           -> Total por ruta de viaje: ' + IntToStr(totalBoletosVendidos));
                    writeln('               * Nacional ');
                    write('                   Porlamar - Caracas '); writeln(PorlamarCaracas:0:2);
                    write('                   Caracas - Porlamar: '); writeln(CaracasPorlamar:0:2);
                    write('                   Puerto Ordaz - Caraca: '); writeln(PuertoOrdazCaraca:0:2);
                    write('                   Caracas - Puerto Ordaz: '); writeln(CaracasPuertoOrdaz:0:2);
                    write('                   Maracaibo - Caracas: '); writeln(MaracaiboCaracas:0:2);
                    write('                   Caracas - Maracaibo: '); writeln(CaracasMaracaibo:0:2);
                    write('                   El Vigia - Porlamar: '); writeln(ElVigiaPorlamar:0:2);
                    write('                   Porlamar - El Vigia: '); writeln(PorlamarElVigia:0:2);
                    write('                   Barcelona - Caracas: '); writeln(BarcelonaCaracas:0:2);
                    write('                   Caracas - Barcelona: '); writeln(CaracasBarcelona:0:2);
                    write('                   La Fria - Caracas: '); writeln(LaFriaCaracas:0:2);
                    write('                   Caracas - La Fria: '); writeln(CaracasLaFria:0:2);
                    writeln('               * Internacional ');
                    write('                   Bogota - Caracas: '); writeln(BogotaCaracas:0:2);
                    write('                   Caracas - Bogota: '); writeln(CaracasBogota:0:2);
                    write('                   Curazao - Caracas: '); writeln(CurazaoCaracas:0:2);
                    write('                   Caracas - Curazao: '); writeln(CaracasCurazao:0:2);
                    write('                   Santo Domingo - Caracas: '); writeln(SantoDomingoCaracas:0:2);
                    write('                   Caracas - Santo Domingo: '); writeln(CaracasSantoDomingo:0:2);
                    write('                   La Romana - Caracas: '); writeln(LaRomanaCaracas:0:2);
                    write('                   Caracas - La Romana: '); writeln(CaracasLaRomana:0:2);
                    
                    writeln;
                    write('           Presione Enter para continuar...');
                    readln;
                    writeln;
        
                    clrscr;
                    writeln('*****************************************************************************');
                    writeln('*                           --- LASER Airlines ---                          *');
                    writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                    writeln('*****************************************************************************');
                    writeln;
                    writeln('           Gracias por utilizar el Sistema de Venta de LASER Airlines.'); 
                    writeln('           ¡Hasta luego!'); 
                end;
      
            else  begin
                    writeln('*****************************************************************************');
                    writeln('*                           --- LASER Airlines ---                          *');
                    writeln('*                    --- Sistema de Venta de Boletos ---                    *');
                    writeln('*****************************************************************************');
                    writeln;
                    writeln('           Opción inválida. Por favor, seleccione una opción válida.');
                  end;    
            end;
    
        writeln;
        write('           Presione Enter para continuar...');
        readln;
        writeln;
    until opcion = 3;
end.