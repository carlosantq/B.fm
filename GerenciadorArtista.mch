MACHINE GerenciadorArtista
SEES
 Artista_Ctx,
 Album_Ctx
VARIABLES 
 artistas,
 artistasAlbuns
INVARIANT
 artistas <: ARTISTA & artistasAlbuns : artistas <-> ALBUM
INITIALISATION 
 artistas := {} || artistasAlbuns := {}
OPERATIONS

  /* Cadastra um artista */
  cadastrar_artista(aa) =
  PRE 
	aa:ARTISTA
  THEN 
	IF aa/:artistas 
	THEN	
		artistas := artistas \/ {aa}
	END
  END;

  /* Remove um artista apos remover todos os albuns dele */
  remover_artista(aa) =
  PRE
	aa:artistas
  THEN 
	VAR x IN
		x := {aa} <| artistasAlbuns;
		artistasAlbuns := artistasAlbuns - x
		
	END;	
	artistas := artistas - {aa}
  END;

 /* Cadastra um album de um artista */
 cadastrar_album_artista(ar, al) =
 PRE
	ar:artistas & al:ALBUM & al/:ran(artistasAlbuns)
 THEN
	artistasAlbuns := artistasAlbuns \/ {ar |-> al}
 END;

 /* Remove um album de um artista */
 remover_album_artista(ar, al) =
 PRE
	ar:artistas & al:ALBUM & al:artistasAlbuns[{ar}]
 THEN
	artistasAlbuns := artistasAlbuns - {ar |-> al}
 END;

 /* Consulta os albuns de um artista */
 rr <-- consultar_albuns_artista(aa) =
 PRE
	aa:artistas
 THEN
	rr := artistasAlbuns[{aa}]
 END;

 /* Consulta o artista no qual um dado album faz parte */
 rr <-- consultar_artista_album(aa) =
 PRE
	aa:ALBUM
 THEN
	rr := dom(artistasAlbuns |> {aa})
 END;

 /* Remove todos os albuns de um artista */
 remover_todos_albuns_artista(aa) =
 PRE
	aa:artistas
 THEN
	VAR x IN
		x := {aa} <| artistasAlbuns;
		artistasAlbuns := artistasAlbuns - x
		
	END
 END
END



