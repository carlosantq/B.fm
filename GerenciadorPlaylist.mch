MACHINE GerenciadorPlaylist

SEES
 Playlist_Ctx,
 Usuario_Ctx,
 Musica_Ctx

VARIABLES playlists, criador, musicasDaPlaylist

INVARIANT
 playlists <: PLAYLIST & criador : playlists --> USUARIO & musicasDaPlaylist : playlists <-> MUSICA

INITIALISATION playlists := {}; criador := {}; musicasDaPlaylist := {}

OPERATIONS
 criarPlaylist(nomePlaylist, usuario) = 
	PRE nomePlaylist : PLAYLIST & nomePlaylist /: playlists & usuario : USUARIO
	THEN playlists := playlists \/ { nomePlaylist }; criador := criador \/ { nomePlaylist |-> usuario }
	END;

 deletarPlaylist(nomePlaylist) = 
	PRE nomePlaylist : PLAYLIST & nomePlaylist : playlists
	THEN 
		playlists := playlists - { nomePlaylist }; 
		criador := criador - { nomePlaylist |-> criador(nomePlaylist) };
		musicasDaPlaylist := musicasDaPlaylist - ({ nomePlaylist } <| musicasDaPlaylist)
	END;

 deletarTodasPlaylistsDoUsuario(usuario) = 
	PRE usuario : USUARIO
	THEN 
		VAR playlistsDoUsuario IN
			playlistsDoUsuario := criador |> { usuario };
			playlists := playlists - dom(playlistsDoUsuario);
			criador := criador - playlistsDoUsuario;
			musicasDaPlaylist := musicasDaPlaylist - (dom(playlistsDoUsuario) <| musicasDaPlaylist)
		END
	END;

 modificarPlaylist(novoNomePlaylist, velhoNomePlaylist) = 
	PRE velhoNomePlaylist : PLAYLIST & velhoNomePlaylist : playlists & novoNomePlaylist : PLAYLIST & novoNomePlaylist /: playlists
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

 usuarioCriadorDaPlaylist <-- consultarUsuarioCriadorDaPlaylist(playlist) =
	PRE playlist : playlists
	THEN
		usuarioCriadorDaPlaylist := criador(playlist)
	END;

 playlistsDoUsuario <-- consultarPlaylistsDoUsuario(usuario) =
	PRE usuario : USUARIO
	THEN
		playlistsDoUsuario := dom(criador |> { usuario })
	END;

 adicionarMusicaPlaylist(playlist, musica) =
	PRE musica : MUSICA & playlist : playlists & playlist |-> musica /: musicasDaPlaylist
	THEN musicasDaPlaylist := musicasDaPlaylist \/ { playlist |-> musica }
	END;

 removerMusicaDaPlaylist(playlist, musica) =
	PRE musica : MUSICA & playlist : playlists & playlist |-> musica : musicasDaPlaylist
	THEN musicasDaPlaylist := musicasDaPlaylist - { playlist |-> musica }
	END;

 musicas <-- consultarMusicasDaPlaylist(playlist) =
	PRE playlist : playlists
	THEN musicas := ran({playlist} <| musicasDaPlaylist)
	END

END
