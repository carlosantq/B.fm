MACHINE GerenciadorSistema

SEES
 Max_num,
 Playlist_Ctx,
 Usuario_Ctx,
 Tag_Ctx,
 Musica_Ctx,
 Album_Ctx,
 Artista_Ctx

INCLUDES
 GerenciadorPlaylist,
 GerenciadorUsuario,
 GerenciadorMusica,
 GerenciadorAlbum,
 GerenciadorArtista/*,
 GerenciadorGravadora,
 GerenciadorTag*/

PROMOTES
 listar_playlists,
 listar_usuarios,
 cadastrar_usuario,
 listar_musicas,
 cadastrar_musica,
 listar_albuns,
 cadastrar_album,
 listar_artistas,
 cadastrar_artista/*,
 listar_gravadoras,
 cadastrar_gravadora,
 listar_tags*/

VARIABLES 
 /*musicas_da_playlist,*/
 criador_da_playlist/*,
 musicas_do_album,
 albuns_do_artista,
 artistas_da_gravadora,
 criador_da_tag,
 musica_da_tag,
 album_da_tag,
 artista_da_tag*/,
 biblioteca_musicas_usuario,
 biblioteca_artistas_usuario,
 biblioteca_albuns_usuario,
 obsessao_do_momento/*,
 amigos*/

INVARIANT
 /*musicas_da_playlist : playlists <-> musicas &*/
 criador_da_playlist : PLAYLIST --> USUARIO &
 /*musicas_do_album : albuns <-> musicas &
 albuns_do_artista : artistas <-> albuns &
 artistas_da_gravadora : gravadoras <-> artistas &
 criador_da_tag : tags --> usuarios &
 musica_da_tag : tags --> musicas &
 album_da_tag : tags --> albuns &
 artista_da_tag : tags --> artistas &*/
 biblioteca_artistas_usuario : USUARIO <-> ARTISTA &
 biblioteca_musicas_usuario : USUARIO <-> MUSICA &
 biblioteca_albuns_usuario : USUARIO <-> ALBUM &
 obsessao_do_momento : USUARIO <-> MUSICA/* &
 amigos : usuarios <-> usuarios*/

INITIALISATION
 /*musicas_da_playlist := {}|| */
 criador_da_playlist := PLAYLIST * {USUARIO_DUMMY} ||
 /*musicas_do_album := {} ||
 albuns_do_artista := {} ||
 artistas_da_gravadora := {} ||
 criador_da_tag := {} ||
 musica_da_tag := {} ||
 album_da_tag := {} ||
 artista_da_tag := {} ||*/
 biblioteca_artistas_usuario := {} ||
 biblioteca_musicas_usuario := {} ||
 biblioteca_albuns_usuario := {} ||
 obsessao_do_momento := {}/* || 
 amigos := {}*/

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
	criador_da_playlist(pp) := USUARIO_DUMMY
	// musicas_da_playlist := musicas_da_playlist - ({ pp } <| musicas_da_playlist)
 END;

 uu <-- consultar_usuario_criador_da_playlist(pp) =
 PRE 
	pp : PLAYLIST
 THEN
	uu := criador_da_playlist(pp)
 END;

/* pp <-- consultar_playlists_do_usuario(uu) =
 PRE 
	uu : USUARIO & uu : usuarios
 THEN
	ANY
		lista
	WHERE
		lista : PLAYLIST --> BOOL & 
		dom(lista |> { TRUE }) = dom(criador_da_playlist |> { uu }) 
	THEN
        		pp := lista
     	END
 END*/

// Playlists e musicas ==========================================================
/* cadastrar_musica_na_playlist(pp, mm) =
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
 END*/

// Albuns e musicas ==========================================================
/* remover_album_e_retirar_musicas(aa) =
 PRE
	aa : albuns
 THEN
	remover_album({ aa }) ||
	musicas_do_album := musicas_do_album - ({ aa } <| musicas_do_album) ||
	albuns_do_artista := albuns_do_artista - (albuns_do_artista |> { aa }) ||
	biblioteca_albuns_usuario := biblioteca_albuns_usuario - (biblioteca_albuns_usuario |> { aa })
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
*/
// Artistas e albuns ==========================================================
/* remover_artista_apagando_albuns(aa) =
 PRE
	aa : artistas
 THEN 
	remover_artista(aa) ||

	// Remove os albuns do artista do sistema
	// remover_album(ran({ aa } <| albuns_do_artista)) ||

	// Remove as relacoes das musicas com os albuns (que foram removidos acima)
	musicas_do_album := musicas_do_album - (ran({ aa } <| albuns_do_artista) <| musicas_do_album) ||

	// Remove as relacoes dos albuns (removidos acima) com o artista
	albuns_do_artista := albuns_do_artista - ({ aa } <| albuns_do_artista) ||

	// Remove as relacoes do artista com gravadoras
	artistas_da_gravadora := artistas_da_gravadora - (artistas_da_gravadora |> { aa }) ||

	//Remove o artista das bibliotecas dos usuarios
	biblioteca_artistas_usuario := biblioteca_artistas_usuario - (biblioteca_artistas_usuario |> { aa }) ||

	//Remove os albuns do artista das bibliotecas dos usuarios
	biblioteca_albuns_usuario := biblioteca_albuns_usuario - (biblioteca_albuns_usuario |> (ran({ aa } <| albuns_do_artista)))
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
*/
// Gravadoras e artistas ==========================================================
/*  remover_gravadora_apagando_artistas(gg) =
  PRE
	gg : gravadoras
  THEN 
	remover_gravadora(gg) ||
	artistas_da_gravadora := artistas_da_gravadora - ({ gg } <| artistas_da_gravadora)
  END;

 alterar_gravadora_do_artista(aa, gg) =
 PRE
	gg : gravadoras & aa : artistas & aa /: artistas_da_gravadora[{ gg }] & aa : ran(artistas_da_gravadora)
 THEN
	artistas_da_gravadora := (artistas_da_gravadora - (artistas_da_gravadora |> {aa})) \/ {gg |-> aa}
 END;

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
 END;
*/
// Tags, usuarios, musicas, albuns e artistas ==========================================================
 /*cadastrar_tag_do_usuario_na_musica(tt, uu, mm) = 
 PRE
	tt : TAG & tt /: tags &
	uu : usuarios &
	mm : musicas &
	tt |-> mm /: musica_da_tag 
 THEN 
	cadastrar_tag(tt) ||
	criador_da_tag := criador_da_tag \/ { tt |-> uu } ||
	musica_da_tag := musica_da_tag \/ { tt |-> mm }
 END;

 cadastrar_tag_do_usuario_no_album(tt, uu, aa) = 
 PRE
	tt : TAG & tt /: tags &
	uu : usuarios &
	aa : albuns &
	tt |-> aa /: album_da_tag 
 THEN 
	cadastrar_tag(tt) ||
	criador_da_tag := criador_da_tag \/ { tt |-> uu } ||
	album_da_tag := album_da_tag \/ { tt |-> aa }
 END;

 cadastrar_tag_do_usuario_no_artista(tt, uu, aa) = 
 PRE
	tt : TAG & tt /: tags &
	uu : usuarios &
	aa : artistas &
	tt |-> aa /: artista_da_tag 
 THEN 
	cadastrar_tag(tt) ||
	criador_da_tag := criador_da_tag \/ { tt |-> uu } ||
	artista_da_tag := artista_da_tag \/ { tt |-> aa }
 END;

 remover_tag_do_usuario_na_musica(tt, uu, mm) =
 PRE 
	tt : TAG & tt : tags &
	uu : usuarios &
	mm : musicas &
	tt |-> mm : musica_da_tag 
 THEN 
	remover_tag(tt) ||
	criador_da_tag := criador_da_tag - { tt |-> uu } ||
	musica_da_tag := musica_da_tag - { tt |-> mm }
 END;

 remover_tag_do_usuario_no_album(tt, uu, aa) =
 PRE 
	tt : TAG & tt : tags &
	uu : usuarios &
	aa : albuns &
	tt |-> aa : album_da_tag 
 THEN 
	remover_tag(tt) ||
	criador_da_tag := criador_da_tag - { tt |-> uu } ||
	album_da_tag := album_da_tag - { tt |-> aa }
 END;

 remover_tag_do_usuario_no_artista(tt, uu, aa) =
 PRE 
	tt : TAG & tt : tags &
	uu : usuarios &
	aa : artistas &
	tt |-> aa : artista_da_tag 
 THEN 
	remover_tag(tt) ||
	criador_da_tag := criador_da_tag - { tt |-> uu } ||
	artista_da_tag := artista_da_tag - { tt |-> aa }
 END;
 
 rr <-- consultar_usuario_criador_da_tag(tt) =
 PRE 
	tt : tags & tt : dom(criador_da_tag)
 THEN
	rr := criador_da_tag(tt)
 END;

 rr <-- consultar_tags_do_usuario(uu) =
 PRE 
	uu : usuarios & uu : ran(criador_da_tag)
 THEN
	rr := dom(criador_da_tag |> { uu })
 END;*/

/* Operação bugada
 rr <-- consultar_alvo_da_tag(tt) =
 PRE 
	tt : tags & 
	(tt : dom(musica_da_tag) or tt : dom(album_da_tag) or tt : dom(artista_da_tag))
 THEN
	IF tt : dom(musica_da_tag) 
	THEN rr := musica_da_tag(tt);

	IF tt : dom(album_da_tag) 
	THEN rr := album_da_tag(tt);

	IF tt : dom(artista_da_tag)
	THEN rr := artista_da_tag(tt);
 END */

// Usuarios e bibliotecas de artistas, albuns e musicas ==========================================================
 cadastrar_artista_biblioteca(aa, uu) =
 PRE
 	uu : USUARIO & uu : usuarios & aa : ARTISTA & aa : artistas & { uu |-> aa } /<: biblioteca_artistas_usuario & uu > USUARIO_DUMMY
 THEN
 	biblioteca_artistas_usuario := biblioteca_artistas_usuario \/ { uu |-> aa }
 END;

 remover_artista_biblioteca(aa, uu) =
 PRE
 	uu : USUARIO & uu : usuarios & aa : ARTISTA & aa : artistas & { uu |-> aa } <: biblioteca_artistas_usuario & uu > USUARIO_DUMMY
 THEN
 	biblioteca_artistas_usuario := biblioteca_artistas_usuario - { uu |-> aa }
 END;
 
 cadastrar_album_biblioteca(aa, uu) =
 PRE
 	uu : USUARIO & uu : usuarios & aa : ALBUM & aa : albuns & { uu |-> aa } /<: biblioteca_albuns_usuario & uu > USUARIO_DUMMY
 THEN
 	biblioteca_albuns_usuario := biblioteca_albuns_usuario \/ { uu |-> aa }
 END;

 remover_album_biblioteca(aa, uu) =
 PRE
 	uu : USUARIO & uu : usuarios & aa : ALBUM & aa : albuns & { uu |-> aa } <: biblioteca_albuns_usuario & uu > USUARIO_DUMMY
 THEN
 	biblioteca_albuns_usuario := biblioteca_albuns_usuario - { uu |-> aa }
 END;

 cadastrar_musica_biblioteca(mm, uu) =
 PRE
 	uu : USUARIO & uu : usuarios & mm : MUSICA & mm : musicas & { uu |-> mm } /<: biblioteca_musicas_usuario & uu > USUARIO_DUMMY & mm > MUSICA_DUMMY
 THEN
 	biblioteca_musicas_usuario := biblioteca_musicas_usuario \/ { uu |-> mm }
 END;

 remover_musica_biblioteca(mm, uu) =
 PRE
 	uu : USUARIO & uu : usuarios & mm : MUSICA & mm : musicas & { uu |-> mm } <: biblioteca_musicas_usuario & uu > USUARIO_DUMMY & mm > MUSICA_DUMMY
 THEN
 	biblioteca_musicas_usuario := biblioteca_musicas_usuario - { uu |-> mm } ||
	IF mm : obsessao_do_momento[{ uu }] THEN obsessao_do_momento := obsessao_do_momento - { uu |-> mm } END
 END;

 /*ab, ar, mm <-- consultar_biblioteca(uu) = 
 PRE
	uu : usuarios
 THEN
	ab := ran({ uu } <| biblioteca_albuns_usuario) || ar := ran({ uu } <| biblioteca_artistas_usuario) || mm := ran({ uu } <| biblioteca_musicas_usuario)
 END;*/

 cadastrar_obsessao_do_momento(uu, mm) =
 PRE
	uu : USUARIO & uu : usuarios & mm : MUSICA & mm : musicas & { uu |-> mm } <: biblioteca_musicas_usuario & obsessao_do_momento[{ uu }] = {} & mm > MUSICA_DUMMY
 THEN
	obsessao_do_momento := obsessao_do_momento \/  { uu |-> mm }
 END;

 remover_obsessao_do_momento(uu) =
 PRE
	uu : USUARIO & uu : usuarios & obsessao_do_momento[{ uu }] /= {} & uu > USUARIO_DUMMY
 THEN
	obsessao_do_momento := obsessao_do_momento - ({ uu } <| obsessao_do_momento)
 END;

 rr <-- consultar_obsessao_do_momento(uu) =
 PRE
	uu : USUARIO & uu : usuarios & uu > USUARIO_DUMMY
 THEN
	rr := obsessao_do_momento(uu)
 END //;

// Amigos ==========================================================
/* cadastrar_relacao_amizade(uu, us) =
 PRE
 	uu : usuarios & us : usuarios & uu /= us
 THEN
	amigos := amigos \/ { uu |-> us }
 END;

 remover_relacao_amizade(uu, us) =
 PRE
	uu : usuarios & us : usuarios & uu /= us & ({ uu |-> us } <: amigos)
 THEN
	amigos := amigos - { uu |-> us }
 END;

 rr <-- consultar_amigos(uu) =
 PRE
	uu : usuarios
 THEN
	rr := amigos[{ uu }]
 END;

 ab, ar, mm <-- compatibilidade_musical(uu, us) =
 PRE
	uu : usuarios & us : usuarios & uu /= us
 THEN
 	ar := card(ran({ uu } <| biblioteca_artistas_usuario) /\ ran({ us } <| biblioteca_artistas_usuario)) ||
	ab := card(ran({ uu } <| biblioteca_albuns_usuario) /\ ran({ us } <| biblioteca_albuns_usuario)) ||
	mm := card(ran({ uu } <| biblioteca_musicas_usuario) /\ ran({ us } <| biblioteca_musicas_usuario))
 END*/
END