MACHINE GerenciadorPlaylist

SEES
 Playlist_Ctx

VARIABLES 
 playlists

INVARIANT
 playlists <: PLAYLIST

INITIALISATION 
 playlists := {}

OPERATIONS

 cadastrar_playlist(pp) = 
 PRE 
	pp : PLAYLIST & pp /: playlists
 THEN 
	playlists := playlists \/ { pp }
 END;

 remover_playlist(pp) = 
 PRE 
	pp : PLAYLIST
 THEN 
	playlists := playlists - { pp }
 END;

 rr <-- buscar_playlist(pp) =
 PRE
	pp : PLAYLIST
 THEN
	IF pp : playlists THEN
		rr := TRUE
	ELSE
		rr := FALSE
	END
 END;

 pp <-- listar_playlists =
 ANY lista WHERE lista : PLAYLIST --> BOOL & dom(lista |> {TRUE}) = playlists THEN
    pp := lista
 END 

END
