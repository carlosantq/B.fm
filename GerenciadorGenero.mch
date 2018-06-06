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

 /* Cadastra um genero */
  cadastrar_genero(gg) =
  PRE 
	gg:GENERO
  THEN 
	IF gg/:generos 
	THEN	
		generos := generos \/ {gg}
	END
  END;

  /* Remove um generos apos remover todos os artistas dele */
  remover_genero(gg) =
  PRE
	gg:generos
  THEN 
	VAR xx IN
		xx := {gg} <| generosArtistas;
		generosArtistas := generosArtistas - xx
		
	END;	
	generos := generos - {gg}
  END;

 /* Cadastra um artista em um genero */
 cadastrar_artista_genero(gg, aa) =
 PRE
	gg:generos & aa:ARTISTA/* & aa/:ran(generosArtistas)*/
 THEN
	generosArtistas := generosArtistas \/ {gg |-> aa}
 END;

 /* Remove um artista de um genero */
 remover_artista_genero(gg, aa) =
 PRE
	gg:generos & aa:ARTISTA & aa:generosArtistas[{gg}]
 THEN
	generosArtistas := generosArtistas - {gg |-> aa}
 END;

 /* Consulta todos os generos */
 gg <-- consultar_generos =  gg := generos;

 /* Consulta os artistas de um genero */
 aa <-- consultar_artistas_genero(gg) =
 PRE
	gg:generos
 THEN
	aa := generosArtistas[{gg}]
 END;

 /* Consulta o genero no qual um dado artista faz parte */
 gg <-- consultar_genero_artista(aa) =
 PRE
	aa:ARTISTA
 THEN
	gg := dom(generosArtistas |> {aa})
 END;

 /* Remove todos os artistas de um genero */
 remover_todos_artistas_genero(gg) =
 PRE
	gg:generos
 THEN
	VAR xx IN
		xx := {gg} <| generosArtistas;
		generosArtistas := generosArtistas - xx
		
	END
 END
END


