MACHINE GerenciadorSistema

SEES
 Max_num,
 Playlist_Ctx,
 Usuario_Ctx,
 Musica_Ctx,
 Album_Ctx,
 Artista_Ctx, 
 Gravadora_Ctx,
 Tag_Ctx

INCLUDES
 GerenciadorPlaylist,
 GerenciadorUsuario,
 GerenciadorMusica,
 GerenciadorAlbum,
 GerenciadorArtista,
 GerenciadorGravadora,
 GerenciadorTag

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
 cadastrar_gravadora,
 listar_tags


VARIABLES 
 musicas_da_playlist,
 criador_da_playlist,
 musicas_do_album,
 albuns_do_artista,
 artistas_da_gravadora,
 criador_da_tag,
 musicas_da_tag,
 albuns_da_tag,
 artistas_da_tag,
 biblioteca_musicas_usuario,
 biblioteca_artistas_usuario,
 biblioteca_albuns_usuario,
 obsessao_do_momento,
 amigos

INVARIANT
 musicas_da_playlist : PLAYLIST <-> MUSICA &
 criador_da_playlist : PLAYLIST --> USUARIO &
 musicas_do_album : ALBUM <-> MUSICA &
 albuns_do_artista : ARTISTA <-> ALBUM &
 artistas_da_gravadora : GRAVADORA <-> ARTISTA &
 criador_da_tag : TAG --> USUARIO &
 musicas_da_tag : TAG <-> MUSICA &
 albuns_da_tag : TAG <-> ALBUM &
 artistas_da_tag : TAG <-> ARTISTA &
 biblioteca_artistas_usuario : USUARIO <-> ARTISTA &
 biblioteca_musicas_usuario : USUARIO <-> MUSICA &
 biblioteca_albuns_usuario : USUARIO <-> ALBUM &
 obsessao_do_momento : USUARIO <-> MUSICA &
 amigos : USUARIO <-> USUARIO

INITIALISATION
 musicas_da_playlist := {}|| 
 criador_da_playlist := PLAYLIST * {USUARIO_DUMMY} ||
 musicas_do_album := {} ||
 albuns_do_artista := {} ||
 artistas_da_gravadora := {} ||
 criador_da_tag := TAG * {USUARIO_DUMMY} ||
 musicas_da_tag := {} ||
 albuns_da_tag := {} ||
 artistas_da_tag := {} ||
 biblioteca_artistas_usuario := {} ||
 biblioteca_musicas_usuario := {} ||
 biblioteca_albuns_usuario := {} ||
 obsessao_do_momento := USUARIO * {MUSICA_DUMMY} ||
 amigos := {}

OPERATIONS

// Playlists e usuarios ==========================================================
 cadastrar_playlist_do_usuario(pp, uu) =
 PRE
	pp : PLAYLIST & pp /: playlists & uu : USUARIO & uu : usuarios & uu /= USUARIO_DUMMY
 THEN
	cadastrar_playlist(pp) ||
	criador_da_playlist(pp) := uu
 END;

 remover_playlist_do_usuario(pp) =
 PRE
	pp : PLAYLIST & pp : playlists & pp /= PLAYLIST_DUMMY
 THEN
	remover_playlist(pp) ||
	criador_da_playlist(pp) := USUARIO_DUMMY ||
	musicas_da_playlist := musicas_da_playlist - ({ pp } <| musicas_da_playlist)
 END;

 uu <-- consultar_usuario_criador_da_playlist(pp) =
 PRE
	pp : PLAYLIST & pp /= PLAYLIST_DUMMY
 THEN
	uu := criador_da_playlist(pp)
 END;

 // Playlists e musicas ==========================================================
  cadastrar_musica_na_playlist(pp, mm) =
  PRE
 	mm : MUSICA & mm : musicas & pp : PLAYLIST & pp : playlists & pp |-> mm /: musicas_da_playlist &
 	pp /= PLAYLIST_DUMMY & mm /= MUSICA_DUMMY
  THEN
 	musicas_da_playlist := musicas_da_playlist \/ { pp |-> mm }
  END;

  remover_musica_da_playlist(pp, mm) =
  PRE
 	mm : MUSICA & mm : musicas & pp : PLAYLIST & pp : playlists & pp |-> mm : musicas_da_playlist &
 	pp /= PLAYLIST_DUMMY & mm /= MUSICA_DUMMY
  THEN
 	musicas_da_playlist := musicas_da_playlist - { pp |-> mm }
  END;

 pp <-- consultar_playlists_e_musicas =
 ANY
	lista WHERE lista : (1..PLAYLIST_MAX)*(1..MUSICA_MAX) --> BOOL & dom(lista |> { TRUE }) =  musicas_da_playlist
 THEN
 	pp := lista
 END;

// Albuns e musicas ==========================================================
 remover_album_e_retirar_musicas(aa) =
 PRE
	aa : ALBUM & aa : albuns & aa /= ALBUM_DUMMY
 THEN
	remover_album( aa ) ||
	musicas_do_album := musicas_do_album - ({ aa } <| musicas_do_album) ||
	albuns_do_artista := albuns_do_artista - (albuns_do_artista |> { aa }) ||
	biblioteca_albuns_usuario := biblioteca_albuns_usuario - (biblioteca_albuns_usuario |> { aa })
 END;

 cadastrar_musica_em_album(aa, mm) =
 PRE
 	aa: ALBUM & aa : albuns & mm : MUSICA & mm : musicas & mm/:ran(musicas_do_album) & 
	aa /= ALBUM_DUMMY & mm /= MUSICA_DUMMY
 THEN
	musicas_do_album := musicas_do_album \/ { aa |-> mm }
 END;

 remover_musica_de_album(aa, mm) =
 PRE
	aa: ALBUM & aa : albuns & mm : MUSICA & mm : musicas & aa |-> mm : musicas_do_album & 
	aa /= ALBUM_DUMMY & mm /= MUSICA_DUMMY
 THEN
	musicas_do_album := musicas_do_album - { aa |-> mm }
 END;

 mm <-- consultar_albuns_e_musicas =
 ANY
	lista WHERE lista : (1..ALBUM_MAX)*(1..MUSICA_MAX) --> BOOL & dom(lista |> { TRUE }) = musicas_do_album
 THEN
 	mm := lista
 END;

// Artistas e albuns ==========================================================
 remover_artista_e_retirar_albuns(aa) =
 PRE
	aa : ARTISTA & aa : artistas & aa /= ARTISTA_DUMMY
 THEN
	remover_artista(aa) ||

	// Remove as relacoes dos albuns com o artista
	albuns_do_artista := albuns_do_artista - ({ aa } <| albuns_do_artista) ||

	// Remove as relacoes do artista com gravadoras
	artistas_da_gravadora := artistas_da_gravadora - (artistas_da_gravadora |> { aa }) ||

	//Remove o artista das bibliotecas dos usuarios
	biblioteca_artistas_usuario := biblioteca_artistas_usuario - (biblioteca_artistas_usuario |> { aa })
 END;
 
 cadastrar_album_para_artista(ar, al) =
 PRE
	ar : ARTISTA & ar : artistas & al : ALBUM & al : albuns & al/:ran(albuns_do_artista) & ar /= ARTISTA_DUMMY & al /= ALBUM_DUMMY
 THEN
	albuns_do_artista := albuns_do_artista \/ { ar |-> al }
 END;

 remover_album_do_artista(ar, al) =
 PRE
	ar : ARTISTA & ar : artistas & al : ALBUM & al : albuns & ar |-> al : albuns_do_artista & ar /= ARTISTA_DUMMY & al /= ALBUM_DUMMY
 THEN
	albuns_do_artista := albuns_do_artista - { ar |-> al }
 END;

 aa <-- consultar_artistas_e_albuns =
 ANY
	lista WHERE lista : (1..ARTISTA_MAX)*(1..ALBUM_MAX) --> BOOL & dom(lista |> { TRUE }) = albuns_do_artista
 THEN
 	aa := lista
 END;

// Gravadoras e artistas ==========================================================
 remover_gravadora_apagando_artistas(gg) =
 PRE
	gg: GRAVADORA & gg : gravadoras & gg /= GRAVADORA_DUMMY
 THEN 
	remover_gravadora(gg) ||
 	artistas_da_gravadora := artistas_da_gravadora - ({ gg } <| artistas_da_gravadora)
 END;

 alterar_gravadora_do_artista(gg, aa) =
 PRE
	gg : GRAVADORA & gg : gravadoras & aa : ARTISTA & aa : artistas & aa /: artistas_da_gravadora[{ gg }] & aa : ran(artistas_da_gravadora) & aa /= ARTISTA_DUMMY & gg /= GRAVADORA_DUMMY
 THEN
	artistas_da_gravadora := (artistas_da_gravadora - (artistas_da_gravadora |> {aa})) \/ {gg |-> aa}
 END;

 cadastrar_artista_numa_gravadora(gg, aa) =
 PRE
	gg : GRAVADORA & gg : gravadoras & aa : ARTISTA & aa : artistas & aa /: ran(artistas_da_gravadora) & aa /= ARTISTA_DUMMY & gg /= GRAVADORA_DUMMY
 THEN
	artistas_da_gravadora := artistas_da_gravadora \/ { gg |-> aa }
 END;

 remover_artista_da_gravadora(gg, aa) =
 PRE
	gg : GRAVADORA & gg : gravadoras & aa : ARTISTA & aa : artistas & gg |-> aa : artistas_da_gravadora & aa /= ARTISTA_DUMMY & gg /= GRAVADORA_DUMMY
 THEN
	artistas_da_gravadora := artistas_da_gravadora - { gg |-> aa }
 END;

 gg <-- consultar_gravadoras_e_artistas =
 ANY
	lista WHERE lista : (1..GRAVADORA_MAX)*(1..ARTISTA_MAX) --> BOOL & dom(lista |> { TRUE }) = artistas_da_gravadora
 THEN
 	gg := lista
 END;

// Tags, usuarios, musicas, albuns e artistas ==========================================================
 cadastrar_tag_do_usuario_na_musica(tt, uu, mm) =
 PRE
	tt : TAG & tt /= TAG_DUMMY &
	uu : USUARIO & uu : usuarios & uu /= USUARIO_DUMMY &
	mm : MUSICA & mm : musicas & mm /= MUSICA_DUMMY /*&
	tt |-> mm /: musicas_da_tag*/
 THEN
	IF criador_da_tag(tt) = USUARIO_DUMMY THEN
		criador_da_tag(tt) := uu 
	END ||
	IF tt /: tags THEN
		cadastrar_tag(tt)
	END ||
	musicas_da_tag := musicas_da_tag \/ { tt |-> mm }
 END;

 cadastrar_tag_do_usuario_no_album(tt, uu, aa) =
 PRE
	tt : TAG & tt /= TAG_DUMMY &
	uu : USUARIO & uu : usuarios & uu /= USUARIO_DUMMY &
	aa : ALBUM & aa : albuns & aa /= ALBUM_DUMMY
THEN
	IF criador_da_tag(tt) = USUARIO_DUMMY THEN
		criador_da_tag(tt) := uu 
	END ||
	IF tt /: tags THEN
		cadastrar_tag(tt)
	END ||
	albuns_da_tag := albuns_da_tag \/ { tt |-> aa }
 END;

 cadastrar_tag_do_usuario_no_artista(tt, uu, aa) =
 PRE
	tt : TAG & tt /= TAG_DUMMY &
	uu : USUARIO & uu : usuarios & uu /= USUARIO_DUMMY &
	aa : ARTISTA & aa : artistas & aa /= ARTISTA_DUMMY
 THEN
	IF criador_da_tag(tt) = USUARIO_DUMMY THEN
		criador_da_tag(tt) := uu 
	END ||
	IF tt /: tags THEN
		cadastrar_tag(tt)
	END ||
	artistas_da_tag := artistas_da_tag \/ { tt |-> aa }
 END;

 remover_tag_do_usuario_na_musica(tt, uu, mm) =
 PRE
	tt : TAG & tt : tags & tt /= TAG_DUMMY &
	uu : USUARIO & uu : usuarios & uu /= USUARIO_DUMMY &
	mm : MUSICA & mm : musicas & mm /= MUSICA_DUMMY
 THEN
	IF criador_da_tag(tt) = uu THEN
		remover_tag(tt) ||
		criador_da_tag(tt) := USUARIO_DUMMY
	END ||
	musicas_da_tag := musicas_da_tag - { tt |-> mm }
 END;

 remover_tag_do_usuario_no_album(tt, uu, aa) =
 PRE
	tt : TAG & tt : tags & tt /= TAG_DUMMY &
	uu : USUARIO & uu : usuarios & uu /= USUARIO_DUMMY &
	aa : ALBUM & aa : albuns & aa /= ALBUM_DUMMY
 THEN
	IF criador_da_tag(tt) = uu THEN
		remover_tag(tt) ||
		criador_da_tag(tt) := USUARIO_DUMMY
	END ||
	albuns_da_tag := albuns_da_tag - { tt |-> aa }
 END;

 remover_tag_do_usuario_no_artista(tt, uu, aa) =
 PRE
	tt : TAG & tt : tags & tt /= TAG_DUMMY &
	uu : USUARIO & uu : usuarios & uu /= USUARIO_DUMMY &
	aa : ARTISTA & aa : artistas & aa /= ARTISTA_DUMMY
 THEN
	IF criador_da_tag(tt) = uu THEN
		remover_tag(tt) ||
		criador_da_tag(tt) := USUARIO_DUMMY
	END ||
	artistas_da_tag := artistas_da_tag - { tt |-> aa }
 END;
 
 uu <-- consultar_usuario_criador_da_tag(tt) =
 PRE
	tt : TAG & tt /= TAG_DUMMY
 THEN
	uu := criador_da_playlist(tt)
 END;

 tt <-- consultar_tags_e_musicas =
 ANY
	lista WHERE lista : (1..TAG_MAX)*(1..MUSICA_MAX) --> BOOL & dom(lista |> { TRUE }) = musicas_da_tag
 THEN
 	tt := lista
 END;

 tt <-- consultar_tags_e_albuns =
 ANY
	lista WHERE lista : (1..TAG_MAX)*(1..ALBUM_MAX) --> BOOL & dom(lista |> { TRUE }) = albuns_da_tag
 THEN
 	tt := lista
 END;

 tt <-- consultar_tags_e_artistas =
 ANY
	lista WHERE lista : (1..TAG_MAX)*(1..ARTISTA_MAX) --> BOOL & dom(lista |> { TRUE }) = artistas_da_tag
 THEN
 	tt := lista
 END;

// Usuarios e bibliotecas de artistas, albuns e musicas ==========================================================
 cadastrar_artista_biblioteca(uu, aa) =
 PRE
 	uu : USUARIO & uu : usuarios & aa : ARTISTA & aa : artistas & { uu |-> aa } /<: biblioteca_artistas_usuario & uu /= USUARIO_DUMMY & aa /= ARTISTA_DUMMY
 THEN
 	biblioteca_artistas_usuario := biblioteca_artistas_usuario \/ { uu |-> aa }
 END;

 remover_artista_biblioteca(uu, aa) =
 PRE
 	uu : USUARIO & uu : usuarios & aa : ARTISTA & aa : artistas & { uu |-> aa } <: biblioteca_artistas_usuario & uu /= USUARIO_DUMMY & aa /= ARTISTA_DUMMY
 THEN
 	biblioteca_artistas_usuario := biblioteca_artistas_usuario - { uu |-> aa }
 END;

 cadastrar_album_biblioteca(uu, aa) =
 PRE
 	uu : USUARIO & uu : usuarios & aa : ALBUM & aa : albuns & { uu |-> aa } /<: biblioteca_albuns_usuario & uu /= USUARIO_DUMMY & aa /= ARTISTA_DUMMY
 THEN
 	biblioteca_albuns_usuario := biblioteca_albuns_usuario \/ { uu |-> aa }
 END;

 remover_album_biblioteca(uu, aa) =
 PRE
 	uu : USUARIO & uu : usuarios & aa : ALBUM & aa : albuns & { uu |-> aa } <: biblioteca_albuns_usuario & uu /= USUARIO_DUMMY & aa /= ALBUM_DUMMY
 THEN
 	biblioteca_albuns_usuario := biblioteca_albuns_usuario - { uu |-> aa }
 END;

 cadastrar_musica_biblioteca(uu, mm) =
 PRE
 	uu : USUARIO & uu : usuarios & mm : MUSICA & mm : musicas & { uu |-> mm } /<: biblioteca_musicas_usuario & uu /= USUARIO_DUMMY & mm /= MUSICA_DUMMY
 THEN
 	biblioteca_musicas_usuario := biblioteca_musicas_usuario \/ { uu |-> mm }
 END;

 remover_musica_biblioteca(uu, mm) =
 PRE
 	uu : USUARIO & uu : usuarios & mm : MUSICA & mm : musicas & { uu |-> mm } <: biblioteca_musicas_usuario & uu /= USUARIO_DUMMY & mm /= MUSICA_DUMMY
 THEN
 	biblioteca_musicas_usuario := biblioteca_musicas_usuario - { uu |-> mm } ||
	IF mm : obsessao_do_momento[{ uu }] THEN obsessao_do_momento := obsessao_do_momento - { uu |-> mm } END
 END;

 ab <-- consultar_biblioteca_albuns =
 ANY
	lista1 WHERE lista1 : (1..USUARIO_MAX)*(1..ALBUM_MAX) --> BOOL & dom(lista1 |> { TRUE }) = biblioteca_albuns_usuario
 THEN
 	ab := lista1
 END;

 ar <-- consultar_biblioteca_artistas =
 ANY
	lista2 WHERE lista2 : (1..USUARIO_MAX)*(1..ARTISTA_MAX) --> BOOL & dom(lista2 |> { TRUE }) = biblioteca_artistas_usuario
 THEN
	ar := lista2
 END;

 mm <-- consultar_biblioteca_musicas =
 ANY
	lista3 WHERE lista3 : (1..USUARIO_MAX)*(1..MUSICA_MAX) --> BOOL & dom(lista3 |> { TRUE }) = biblioteca_musicas_usuario
 THEN
	mm := lista3
 END;

 cadastrar_obsessao_do_momento(uu, mm) =
 PRE
	uu : USUARIO & uu : usuarios & mm : MUSICA & mm : musicas & { uu |-> mm } <: biblioteca_musicas_usuario & obsessao_do_momento[{ uu }] = {} & mm > MUSICA_DUMMY
 THEN
	obsessao_do_momento := obsessao_do_momento \/  { uu |-> mm }
 END;

 remover_obsessao_do_momento(uu) =
 PRE
	uu : USUARIO & uu : usuarios & obsessao_do_momento[{ uu }] /= {} & uu > USUARIO_DUMMY & obsessao_do_momento(uu) > MUSICA_DUMMY
 THEN
	obsessao_do_momento(uu) := MUSICA_DUMMY
 END;

 rr <-- consultar_obsessao_do_momento(uu) =
 PRE
	uu : USUARIO & uu : usuarios & uu /= USUARIO_DUMMY & obsessao_do_momento(uu) /= 0
 THEN
	rr := obsessao_do_momento(uu)
 END;

// Amigos ==========================================================
 cadastrar_relacao_amizade(uu, us) =
 PRE
 	uu : USUARIO & uu : usuarios & us : USUARIO & us : usuarios & uu /= us  & uu > USUARIO_DUMMY & us > USUARIO_DUMMY
 THEN
	amigos := amigos \/ { uu |-> us }
 END;

 remover_relacao_amizade(uu, us) =
 PRE
	uu : USUARIO & uu : usuarios & us : USUARIO & us : usuarios & uu /= us & ({ uu |-> us } <: amigos) & uu > USUARIO_DUMMY & us > USUARIO_DUMMY
 THEN
	amigos := amigos - { uu |-> us }
 END;

 aa <-- consultar_relacoes_amigos =
 ANY
	lista WHERE lista : (1..USUARIO_MAX)*(1..USUARIO_MAX) --> BOOL & dom(lista |> { TRUE }) = amigos
 THEN
 	aa := lista
 END;

 ab, ar, mm <-- compatibilidade_musical(uu, us) =
 PRE
	uu : USUARIO & uu : usuarios & us : USUARIO & us : usuarios & uu /= us & uu > USUARIO_DUMMY & us > USUARIO_DUMMY
 THEN
 	ar := card(ran({ uu } <| biblioteca_artistas_usuario) /\ ran({ us } <| biblioteca_artistas_usuario)) ||
	ab := card(ran({ uu } <| biblioteca_albuns_usuario) /\ ran({ us } <| biblioteca_albuns_usuario)) ||
	mm := card(ran({ uu } <| biblioteca_musicas_usuario) /\ ran({ us } <| biblioteca_musicas_usuario))
 END
END
