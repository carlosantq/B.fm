MACHINE GerenciadorGenero

SEES
 Genero_Ctx,
 Artista_Ctx

VARIABLES 
 generos,
 generosArtistas

INVARIANT
 generos <: GENERO & generosArtistas : generos <-> ARTISTA

INITIALISATION 
 generos := {} || generosArtistas := {}

OPERATIONS

  cadastrar_genero(gg) =
  PRE 
	gg : GENERO & gg /: generos 
  THEN 
	generos := generos \/ { gg }
  END;

  /* Remove um generos apos remover todos os artistas dele */
  remover_genero(gg) =
  PRE
	gg : generos
  THEN 
	VAR xx IN
		xx := { gg } <| generosArtistas;
		generosArtistas := generosArtistas - xx
		
	END;	
	generos := generos - { gg }
  END;

 gg <-- listar_generos =  gg := generos;

 cadastrar_artista_no_genero(gg, aa) =
 PRE
	gg : generos & aa : ARTISTA/* & aa/:ran(generosArtistas)*/
 THEN
	generosArtistas := generosArtistas \/ { gg |-> aa }
 END;

 remover_artista_do_genero(gg, aa) =
 PRE
	gg : generos & aa : ARTISTA & aa : generosArtistas[{ gg }]
 THEN
	generosArtistas := generosArtistas - { gg |-> aa }
 END;

 aa <-- consultar_artistas_do_genero(gg) =
 PRE
	gg : generos
 THEN
	aa := generosArtistas[{ gg }]
 END;

 gg <-- consultar_genero_do_artista(aa) =
 PRE
	aa:ARTISTA
 THEN
	gg := dom(generosArtistas |> { aa })
 END;

 remover_todos_artistas_do_genero(gg) =
 PRE
	gg : generos
 THEN
	VAR xx IN
		xx := { gg } <| generosArtistas;
		generosArtistas := generosArtistas - xx
		
	END
 END
END


