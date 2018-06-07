MACHINE GerenciadorPlaylist

SEES
 Playlist_Ctx,
 Usuario_Ctx,
 Musica_Ctx

VARIABLES 
 playlists, 
 criador, 
 musicasDaPlaylist

INVARIANT
 playlists <: PLAYLIST & criador : playlists --> USUARIO & musicasDaPlaylist : playlists <-> MUSICA

INITIALISATION 
 playlists := {}; criador := {}; musicasDaPlaylist := {}

OPERATIONS

 cadastrar_playlist(pp, uu) = 
 PRE 
	pp : PLAYLIST & pp /: playlists & uu : USUARIO
 THEN 
	playlists := playlists \/ { pp }; criador := criador \/ { pp |-> uu }
 END;

 remover_playlist(pp) = 
 PRE 
	pp : PLAYLIST & pp : playlists
 THEN 
	playlists := playlists - { pp }; 
	criador := criador - { pp |-> criador(pp) };
	musicasDaPlaylist := musicasDaPlaylist - ({ pp } <| musicasDaPlaylist)
 END;

 modificarPlaylist(novoNomePlaylist, velhoNomePlaylist) = 
 PRE
	velhoNomePlaylist : PLAYLIST & velhoNomePlaylist : playlists & novoNomePlaylist : PLAYLIST & novoNomePlaylist /: playlists
 THEN 
 	VAR criadorPlaylist, playlistsDoUsuario, musicasDaPlaylistSendoEditada IN 

		criadorPlaylist := criador(velhoNomePlaylist);
		playlistsDoUsuario := criador |> { criadorPlaylist };
		musicasDaPlaylistSendoEditada := { velhoNomePlaylist } <| musicasDaPlaylist;
		
		// Deletando playlist antiga
		playlists := playlists - { velhoNomePlaylist };
		criador := criador - { velhoNomePlaylist |-> criador(velhoNomePlaylist) };
		musicasDaPlaylist := musicasDaPlaylist - musicasDaPlaylistSendoEditada;

		// Criando playlist nova
		playlists := playlists \/ { novoNomePlaylist };
		criador := criador \/ { novoNomePlaylist |-> criadorPlaylist };
		musicasDaPlaylist := musicasDaPlaylist \/ {novoNomePlaylist} * ran(musicasDaPlaylistSendoEditada)
	END
END;

 pp <-- listar_playlists = pp := playlists;

 remover_todas_playlists_do_usuario(uu) = 
 PRE 
	uu : USUARIO
 THEN 
	VAR playlistsDoUsuario IN
		playlistsDoUsuario := criador |> { uu };
		playlists := playlists - dom(playlistsDoUsuario);
		criador := criador - playlistsDoUsuario;
		musicasDaPlaylist := musicasDaPlaylist - (dom(playlistsDoUsuario) <| musicasDaPlaylist)
	END
 END;

 uu <-- consultar_usuario_criador_da_playlist(pp) =
 PRE 
	pp : playlists
 THEN
	uu := criador(pp)
 END;

 pp <-- consultar_playlists_do_usuario(uu) =
 PRE 
	uu : USUARIO
 THEN
	pp := dom(criador |> { uu })
 END;

 adicionar_musica_na_playlist(pp, mm) =
 PRE 
	mm : MUSICA & pp : playlists & pp |-> mm /: musicasDaPlaylist
 THEN 
	musicasDaPlaylist := musicasDaPlaylist \/ { pp |-> mm }
 END;

 remover_musica_da_playlist(pp, mm) =
 PRE 
	mm : MUSICA & pp : playlists & pp |-> mm : musicasDaPlaylist
 THEN 
	musicasDaPlaylist := musicasDaPlaylist - { pp |-> mm }
 END;

 mm <-- consultar_musicas_da_playlist(pp) =
 PRE 
	pp : playlists
 THEN 
		mm := ran({ pp } <| musicasDaPlaylist)
 END

END
