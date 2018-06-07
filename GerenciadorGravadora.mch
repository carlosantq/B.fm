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

 gg <-- listar_gravadoras =  gg := gravadoras

 /*cadastrar_artista_numa_gravadora(aa, gg) =
 PRE
	gg : gravadoras & aa : ARTISTA & aa /: ran(gravadorasArtistas)
 THEN
	gravadorasArtistas := gravadorasArtistas \/ { gg |-> aa }
 END;

 modificar_gravadora_do_artista(aa, gg) =
 PRE
	gg : GRAVADORA & gg : gravadoras & aa : ARTISTA & aa /: gravadorasArtistas[{ gg }] & aa : ran(gravadorasArtistas)
 THEN
 	gravadorasArtistas := gravadorasArtistas - (gravadorasArtistas |> { aa });
	gravadorasArtistas := gravadorasArtistas \/ { gg |-> aa }
 END;
*/

END


