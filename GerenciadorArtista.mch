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
	aa : ARTISTA & aa /: artistas
  THEN 
	artistas := artistas \/ {aa}
  END;

  /* Remove um artista apos remover todos os albuns dele */
  remover_artista(aa) =
  PRE
	aa : artistas
  THEN 
	VAR xx IN
		xx := { aa } <| artistasAlbuns;
		artistasAlbuns := artistasAlbuns - xx
		
	END;	
	artistas := artistas - {aa}
  END;

 /* Lista todos os artistas */
 aa <-- listar_artistas =  aa := artistas;

 cadastrar_album_para_artista(ar, al) =
 PRE
	ar : artistas & al : ALBUM
 THEN
	artistasAlbuns := artistasAlbuns \/ { ar |-> al }
 END;

 remover_album_do_artista(ar, al) =
 PRE
	ar : artistas & al : ALBUM & al : artistasAlbuns[{ ar }]
 THEN
	artistasAlbuns := artistasAlbuns - { ar |-> al }
 END;

 rr <-- consultar_albuns_do_artista(aa) =
 PRE
	aa : artistas
 THEN
	rr := artistasAlbuns[{ aa }]
 END;

 rr <-- consultar_artistas_do_album(aa) =
 PRE
	aa : ALBUM
 THEN
	rr := dom(artistasAlbuns |> { aa })
 END;

 remover_todos_albuns_do_artista(aa) =
 PRE
	aa : artistas
 THEN
	VAR xx IN
		xx := { aa } <| artistasAlbuns;
		artistasAlbuns := artistasAlbuns - xx
		
	END
 END
END



