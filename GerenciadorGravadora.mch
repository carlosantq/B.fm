MACHINE GerenciadorGravadora

SEES
 Gravadora_Ctx,
 Artista_Ctx

VARIABLES
 gravadoras,
 gravadorasArtistas

INVARIANT
 gravadoras <: GRAVADORA & gravadorasArtistas : gravadoras <-> ARTISTA

INITIALISATION
 gravadoras := {} || gravadorasArtistas := {}

OPERATIONS
 
 cadastrar_gravadora(gg) =
 PRE
	gg : GRAVADORA & gg /: gravadoras
 THEN 
 	gravadoras := gravadoras \/ { gg }
 END;

 /* Remove uma gravadora apos remover todos os artistas dela */
  remover_gravadora(gg) =
  PRE
	gg : GRAVADORA
  THEN 
	VAR xx IN
		xx := { gg } <| gravadorasArtistas;
		gravadorasArtistas := gravadorasArtistas - xx
		
	END;	
	gravadoras := gravadoras - { gg }
  END;

 gg <-- listar_gravadoras =  gg := gravadoras;

 cadastrar_artista_numa_gravadora(aa, gg) =
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

 remover_artista_da_gravadora(aa, gg) =
 PRE
	gg : gravadoras & aa : ARTISTA & aa : gravadorasArtistas[{ gg }]
 THEN
	gravadorasArtistas := gravadorasArtistas - { gg |-> aa }
 END;

 aa <-- consultar_artistas_da_gravadora(gg) =
 PRE
	gg : gravadoras
 THEN
	aa := gravadorasArtistas[{ gg }]
 END;

 gg <-- consultar_gravadora_do_artista(aa) =
 PRE
	aa : ARTISTA
 THEN
	gg := dom(gravadorasArtistas |> { aa })
 END;

 remover_todos_artistas_da_gravadora(gg) =
 PRE
	gg : gravadoras
 THEN
	VAR xx IN
		xx := { gg } <| gravadorasArtistas;
		gravadorasArtistas := gravadorasArtistas - xx
		
	END
 END
END


