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
 END/*;

 gg <-- listar_gravadoras =  gg := gravadoras*/

END


