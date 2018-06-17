#ifndef _GerenciadorPlaylist_h
#define _GerenciadorPlaylist_h

#include <stdint.h>
#include <stdbool.h>
#include <string.h>
/* Clause SEES */
#include "Playlist_Ctx.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void GerenciadorPlaylist__INITIALISATION(void);

/* Clause OPERATIONS */

extern void GerenciadorPlaylist__cadastrar_playlist(int32_t pp);
extern void GerenciadorPlaylist__remover_playlist(int32_t pp);
extern void GerenciadorPlaylist__buscar_playlist(int32_t pp, bool *rr);
extern void GerenciadorPlaylist__listar_playlists(bool *pp);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _GerenciadorPlaylist_h */
