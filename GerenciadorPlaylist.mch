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
 END/*;

 pp <-- listar_playlists = pp := playlists*/

END
