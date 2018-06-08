MACHINE GerenciadorSistema

SEES
 Playlist_Ctx

INCLUDES
 GerenciadorPlaylist,
 GerenciadorUsuario,
 GerenciadorMusica,
 GerenciadorAlbum,
 GerenciadorArtista,
 GerenciadorGravadora

PROMOTES
 listar_playlists,
 listar_usuarios,
 cadastrar_usuario,
 listar_musicas,
 cadastrar_musica,
 listar_albuns,
 cadastrar_album,
 listar_artistas,
 cadastrar_artista,
 listar_gravadoras,
 cadastrar_gravadora

VARIABLES 
 musicas_da_playlist,
 criador_da_playlist,
 musicas_do_album,
 albuns_do_artista,
 artistas_da_gravadora

INVARIANT
 musicas_da_playlist : playlists <-> musicas &
 criador_da_playlist : playlists --> usuarios &
 musicas_do_album : albuns <-> musicas &
 albuns_do_artista : artistas <-> albuns &
 artistas_da_gravadora : gravadoras <-> artistas

INITIALISATION
 musicas_da_playlist := {} || 
 criador_da_playlist := {} ||
 musicas_do_album := {} ||
 albuns_do_artista := {} ||
 artistas_da_gravadora := {}

OPERATIONS

// Playlists e usuarios ==========================================================
 cadastrar_playlist_do_usuario(pp, uu) = 
 PRE 
	pp : PLAYLIST & pp /: playlists & uu : usuarios
 THEN 
	cadastrar_playlist(pp) || 
	criador_da_playlist := criador_da_playlist \/ { pp |-> uu }
 END;

 remover_playlist_do_usuario(pp, uu) = 
 PRE 
	pp : PLAYLIST & pp : playlists & uu : usuarios & pp |-> uu : criador_da_playlist
 THEN 
	remover_playlist(pp) || 
	criador_da_playlist := criador_da_playlist - { pp |-> uu } ||
	musicas_da_playlist := musicas_da_playlist - ({ pp } <| musicas_da_playlist)
 END;

 uu <-- consultar_usuario_criador_da_playlist(pp) =
 PRE 
	pp : playlists
 THEN
	uu := criador_da_playlist(pp)
 END;

 pp <-- consultar_playlists_do_usuario(uu) =
 PRE 
	uu : usuarios
 THEN
	pp := dom(criador_da_playlist |> { uu })
 END;

// Playlists e musicas ==========================================================
 cadastrar_musica_na_playlist(pp, mm) =
 PRE 
	mm : musicas & pp : playlists & pp |-> mm /: musicas_da_playlist
 THEN 
	musicas_da_playlist := musicas_da_playlist \/ { pp |-> mm }
 END;

 remover_musica_da_playlist(pp, mm) =
 PRE 
	mm : musicas & pp : playlists & pp |-> mm : musicas_da_playlist
 THEN 
	musicas_da_playlist := musicas_da_playlist - { pp |-> mm }
 END;

 mm <-- consultar_musicas_da_playlist(pp) =
 PRE 
	pp : playlists
 THEN 
	mm := ran({ pp } <| musicas_da_playlist)
 END;

// Albuns e musicas ==========================================================
 remover_album_e_retirar_musicas(aa) =
 PRE
	aa : albuns
 THEN
	remover_album({ aa }) ||
	musicas_do_album := musicas_do_album - ({ aa } <| musicas_do_album) ||
	albuns_do_artista := albuns_do_artista - (albuns_do_artista |> { aa })
 END;

 cadastrar_musica_em_album(aa, mm) =
 PRE
 	aa : albuns & mm : musicas & mm/:ran(musicas_do_album)
 THEN
	musicas_do_album := musicas_do_album \/ { aa |-> mm }
 END;

 remover_musica_de_album(aa, mm) = 
 PRE
	aa : albuns & mm : musicas & aa |-> mm : musicas_do_album
 THEN
	musicas_do_album := musicas_do_album - { aa |-> mm }
 END;

 mm <-- consultar_musicas_do_album(aa) =
 PRE
 	aa : albuns
 THEN
	mm := musicas_do_album[{ aa }]
 END;

 aa <-- consultar_albuns_da_musica(mm) =
 PRE
	mm : musicas
 THEN
	aa := dom(musicas_do_album |> { mm })
 END;

// Artistas e albuns ==========================================================
 remover_artista_apagando_albuns(aa) =
 PRE
	aa : artistas
 THEN 
	remover_artista(aa) ||

	// Remove os albuns do artista do sistema
	remover_album(ran({ aa } <| albuns_do_artista)) ||

	// Remove as relacoes das musicas com os albuns (que foram removidos acima)
	musicas_do_album := musicas_do_album - (ran({ aa } <| albuns_do_artista) <| musicas_do_album) ||

	// Remove as relacoes dos albuns (removidos acima) com o artista
	albuns_do_artista := albuns_do_artista - ({ aa } <| albuns_do_artista) ||

	// Remove as relacoes do artista com gravadoras
	artistas_da_gravadora := artistas_da_gravadora - (artistas_da_gravadora |> {aa})
 END;

 cadastrar_album_para_artista(ar, al) =
 PRE
	ar : artistas & al : albuns & al/:ran(albuns_do_artista)
 THEN
	albuns_do_artista := albuns_do_artista \/ { ar |-> al }
 END;

 remover_album_do_artista(ar, al) =
 PRE
	ar : artistas & al : albuns & ar |-> al : albuns_do_artista
 THEN
	albuns_do_artista := albuns_do_artista - { ar |-> al }
 END;

 rr <-- consultar_albuns_do_artista(aa) =
 PRE
	aa : artistas
 THEN
	rr := albuns_do_artista[{ aa }]
 END;

 rr <-- consultar_artistas_do_album(aa) =
 PRE
	aa : albuns
 THEN
	rr := dom(albuns_do_artista |> { aa })
 END;

// Gravadoras e artistas ==========================================================
  /*remover_gravadora_apagando_artistas(gg) =
  PRE
	gg : gravadoras
  THEN 
	remover_gravadora(gg)

	// Remove artistas da gravadora do sistema
	// Remove albuns dos artistas da gravadora do sistema
	// Remove musicas dos albuns dos artistas da gravadora do sistema

	// Remove relacoes dos artistas com gravadora
	// Remove relacoes dos artistas com os albuns deles
	// Remove relacoes dos albuns com as musicas deles
	// Remove relacoes das playlists com as musicas removidas acima
  END;*/

 cadastrar_artista_numa_gravadora(aa, gg) =
 PRE
	gg : gravadoras & aa : artistas & gg |-> aa /: artistas_da_gravadora
 THEN
	artistas_da_gravadora := artistas_da_gravadora \/ { gg |-> aa }
 END;

 remover_artista_da_gravadora(aa, gg) =
 PRE
	gg : gravadoras & aa : artistas & gg |-> aa : artistas_da_gravadora
 THEN
	artistas_da_gravadora := artistas_da_gravadora - { gg |-> aa }
 END;

 aa <-- consultar_artistas_da_gravadora(gg) =
 PRE
	gg : gravadoras
 THEN
	aa := artistas_da_gravadora[{ gg }]
 END;

 gg <-- consultar_gravadora_do_artista(aa) =
 PRE
	aa : artistas
 THEN
	gg := dom(artistas_da_gravadora |> { aa })
 END

END

