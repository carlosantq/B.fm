/* WARNING if type checker is not performed, translation could contain errors ! */

#include "GerenciadorPlaylist.h"

/* Clause SEES */
#include "Playlist_Ctx.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static bool GerenciadorPlaylist__playlists_i[Playlist_Ctx__PLAYLIST_MAX+1];
/* Clause INITIALISATION */
void GerenciadorPlaylist__INITIALISATION(void)
{
    
    unsigned int i = 0;
    for(i = 0; i <= Playlist_Ctx__PLAYLIST_MAX;i++)
    {
        GerenciadorPlaylist__playlists_i[i] = false;
    }
    GerenciadorPlaylist__playlists_i[Playlist_Ctx__PLAYLIST_DUMMY] = true;
}

/* Clause OPERATIONS */

void GerenciadorPlaylist__cadastrar_playlist(int32_t pp)
{
    GerenciadorPlaylist__playlists_i[pp] = true;
}

void GerenciadorPlaylist__remover_playlist(int32_t pp)
{
    GerenciadorPlaylist__playlists_i[pp] = false;
}

void GerenciadorPlaylist__buscar_playlist(int32_t pp, bool *rr)
{
    (*rr) = GerenciadorPlaylist__playlists_i[pp];
}

void GerenciadorPlaylist__listar_playlists(bool *pp)
{
    memmove(pp,GerenciadorPlaylist__playlists_i,Playlist_Ctx__PLAYLIST_MAX+1 * sizeof(bool));
}

