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
  cadastrar_artista(aa) =
  PRE 
	aa:ARTISTA
  THEN 
	IF aa/:artistas 
	THEN	
		artistas := artistas \/ {aa}
	END
  END;

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

 cadastrar_album_artista(ar, al) =
 PRE
	ar:artistas & al:ALBUM & al/:ran(artistasAlbuns)
 THEN
	artistasAlbuns := artistasAlbuns \/ {ar |-> al}
 END;

 remover_album_artista(ar, al) =
 PRE
	ar:artistas & al:ALBUM & al:artistasAlbuns[{ar}]
 THEN
	artistasAlbuns := artistasAlbuns - {ar |-> al}
 END;

 rr <-- consultar_albuns_artista(aa) =
 PRE
	aa:artistas
 THEN
	rr:=artistasAlbuns[{aa}]
 END;

 rr <-- consultar_artista_album(aa) =
 PRE
	aa:ALBUM
 THEN
	rr:=dom(artistasAlbuns |> {aa})
 END;

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



