MACHINE GerenciadorGravadora

SEES
 Gravadora_Ctx

VARIABLES
 gravadoras

INVARIANT
 gravadoras <: GRAVADORA

INITIALISATION
 gravadoras := {}

OPERATIONS
 
 cadastrar_gravadora(gg) =
 PRE
	gg : GRAVADORA & gg /: gravadoras
 THEN 
 	gravadoras := gravadoras \/ { gg }
 END;

 remover_gravadora(gg) =
 PRE
	gg : GRAVADORA
 THEN 
	gravadoras := gravadoras - { gg }
 END;

 rr <-- buscar_gravadora(gg) =
 PRE
	gg : GRAVADORA
 THEN
	IF gg : gravadoras THEN
		rr := TRUE
	ELSE
		rr := FALSE
	END
 END;

 gg <-- listar_gravadoras =
 ANY lista WHERE lista : GRAVADORA --> BOOL & dom(lista |> {TRUE}) = gravadoras THEN
    gg := lista
 END 

END


