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
 
 /* Cadastra uma gravadora */
 cadastrar_gravadora(gg) =
 PRE
	gg:GRAVADORA
 THEN 
 	IF gg/:gravadoras
 	THEN 
 		gravadoras := gravadoras \/ {gg}
 	END
 END;

 /* Remove uma gravadora apos remover todos os artistas dela */
  remover_gravadora(gg) =
  PRE
	gg:GRAVADORA
  THEN 
	VAR xx IN
		xx := {gg} <| gravadorasArtistas;
		gravadorasArtistas := gravadorasArtistas - xx
		
	END;	
	gravadoras := gravadoras - {gg}
  END;

 /* Cadastra um artista de uma gravadora */
 cadastrar_artista_gravadora(aa, gg) =
 PRE
	gg:gravadoras & aa:ARTISTA & aa/:ran(gravadorasArtistas)
 THEN
	gravadorasArtistas := gravadorasArtistas \/ {gg |-> aa}
 END;

 /* Modificar a gravadora de um artista */
 modificar_gravadora_artista(aa, gg) =
 PRE
	gg:GRAVADORA & gg:gravadoras & aa:ARTISTA & aa/:gravadorasArtistas[{gg}] & aa:ran(gravadorasArtistas)
 THEN
 	gravadorasArtistas := gravadorasArtistas - (gravadorasArtistas |> {aa});
	gravadorasArtistas := gravadorasArtistas \/ {gg |-> aa}
 END;

 /* Remove um artista de uma gravadora */
 remover_artista_gravadora(aa, gg) =
 PRE
	gg:gravadoras & aa:ARTISTA & aa:gravadorasArtistas[{gg}]
 THEN
	gravadorasArtistas := gravadorasArtistas - {gg |-> aa}
 END;

 /* Consulta todas as gravadoras */
 gg <-- consultar_gravadoras =  gg := gravadoras;

 /* Consulta os artistas de uma gravadora */
 aa <-- consultar_artistas_gravadora(gg) =
 PRE
	gg:gravadoras
 THEN
	aa := gravadorasArtistas[{gg}]
 END;

 /* Consulta a gravadora na qual um dado artista faz parte */
 gg <-- consultar_gravadora_artista(aa) =
 PRE
	aa:ARTISTA
 THEN
	gg := dom(gravadorasArtistas |> {aa})
 END;

 /* Remove todos os artistas de uma gravadora */
 remover_todos_artistas_gravadora(gg) =
 PRE
	gg:gravadoras
 THEN
	VAR xx IN
		xx := {gg} <| gravadorasArtistas;
		gravadorasArtistas := gravadorasArtistas - xx
		
	END
 END
END


