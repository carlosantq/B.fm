#ifndef _GerenciadorSistema_h
#define _GerenciadorSistema_h

#include <stdint.h>
#include <stdbool.h>
#include <string.h>
/* Clause SEES */
#include "Max_num.h"
#include "Playlist_Ctx.h"
#include "Usuario_Ctx.h"
#include "Musica_Ctx.h"
#include "Artista_Ctx.h"
#include "Album_Ctx.h"
#include "Gravadora_Ctx.h"
#include "Tag_Ctx.h"

/* Clause INCLUDES */
#include "GerenciadorPlaylist.h"
#include "GerenciadorUsuario.h"
#include "GerenciadorMusica.h"
#include "GerenciadorAlbum.h"
#include "GerenciadorArtista.h"
#include "GerenciadorGravadora.h"
#include "GerenciadorTag.h"

/* Clause IMPORTS */
#include "GerenciadorPlaylist.h"
#include "GerenciadorUsuario.h"
#include "GerenciadorMusica.h"
#include "GerenciadorAlbum.h"
#include "GerenciadorArtista.h"
#include "GerenciadorGravadora.h"
#include "GerenciadorTag.h"
#define GerenciadorSistema__listar_playlists GerenciadorPlaylist__listar_playlists
#define GerenciadorSistema__listar_usuarios GerenciadorUsuario__listar_usuarios
#define GerenciadorSistema__cadastrar_usuario GerenciadorUsuario__cadastrar_usuario
#define GerenciadorSistema__listar_musicas GerenciadorMusica__listar_musicas
#define GerenciadorSistema__cadastrar_musica GerenciadorMusica__cadastrar_musica
#define GerenciadorSistema__listar_albuns GerenciadorAlbum__listar_albuns
#define GerenciadorSistema__cadastrar_album GerenciadorAlbum__cadastrar_album
#define GerenciadorSistema__listar_artistas GerenciadorArtista__listar_artistas
#define GerenciadorSistema__cadastrar_artista GerenciadorArtista__cadastrar_artista
#define GerenciadorSistema__listar_gravadoras GerenciadorGravadora__listar_gravadoras
#define GerenciadorSistema__cadastrar_gravadora GerenciadorGravadora__cadastrar_gravadora
#define GerenciadorSistema__listar_tags GerenciadorTag__listar_tags

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void GerenciadorSistema__INITIALISATION(void);

/* Clause OPERATIONS */

extern void GerenciadorSistema__cadastrar_playlist_do_usuario(int32_t pp, int32_t uu);
extern void GerenciadorSistema__remover_playlist_do_usuario(int32_t pp);
extern void GerenciadorSistema__consultar_usuario_criador_da_playlist(int32_t pp, int32_t *uu);
extern void GerenciadorSistema__cadastrar_musica_na_playlist(int32_t pp, int32_t mm);
extern void GerenciadorSistema__remover_musica_da_playlist(int32_t pp, int32_t mm);
extern void GerenciadorSistema__consultar_playlists_e_musicas(bool *pp);
extern void GerenciadorSistema__remover_album_e_retirar_musicas(int32_t aa);
extern void GerenciadorSistema__cadastrar_musica_em_album(int32_t aa, int32_t mm);
extern void GerenciadorSistema__remover_musica_de_album(int32_t aa, int32_t mm);
extern void GerenciadorSistema__consultar_albuns_e_musicas(bool *mm);
extern void GerenciadorSistema__remover_artista_e_retirar_albuns(int32_t aa);
extern void GerenciadorSistema__cadastrar_album_para_artista(int32_t ar, int32_t al);
extern void GerenciadorSistema__remover_album_do_artista(int32_t ar, int32_t al);
extern void GerenciadorSistema__consultar_artistas_e_albuns(bool *aa);
extern void GerenciadorSistema__remover_gravadora_apagando_artistas(int32_t gg);
extern void GerenciadorSistema__alterar_gravadora_do_artista(int32_t gg, int32_t aa);
extern void GerenciadorSistema__cadastrar_artista_numa_gravadora(int32_t gg, int32_t aa);
extern void GerenciadorSistema__remover_artista_da_gravadora(int32_t gg, int32_t aa);
extern void GerenciadorSistema__consultar_gravadoras_e_artistas(bool *gg);
extern void GerenciadorSistema__cadastrar_tag_do_usuario_na_musica(int32_t tt, int32_t uu, int32_t mm);
extern void GerenciadorSistema__cadastrar_tag_do_usuario_no_album(int32_t tt, int32_t uu, int32_t aa);
extern void GerenciadorSistema__cadastrar_tag_do_usuario_no_artista(int32_t tt, int32_t uu, int32_t aa);
extern void GerenciadorSistema__remover_tag_do_usuario_na_musica(int32_t tt, int32_t uu, int32_t mm);
extern void GerenciadorSistema__remover_tag_do_usuario_no_album(int32_t tt, int32_t uu, int32_t aa);
extern void GerenciadorSistema__remover_tag_do_usuario_no_artista(int32_t tt, int32_t uu, int32_t aa);
extern void GerenciadorSistema__consultar_usuario_criador_da_tag(int32_t tt, int32_t *uu);
extern void GerenciadorSistema__consultar_tags_e_musicas(bool *tt);
extern void GerenciadorSistema__consultar_tags_e_albuns(bool *tt);
extern void GerenciadorSistema__consultar_tags_e_artistas(bool *tt);
extern void GerenciadorSistema__cadastrar_artista_biblioteca(int32_t uu, int32_t aa);
extern void GerenciadorSistema__remover_artista_biblioteca(int32_t uu, int32_t aa);
extern void GerenciadorSistema__cadastrar_album_biblioteca(int32_t uu, int32_t aa);
extern void GerenciadorSistema__remover_album_biblioteca(int32_t uu, int32_t aa);
extern void GerenciadorSistema__cadastrar_musica_biblioteca(int32_t uu, int32_t mm);
extern void GerenciadorSistema__remover_musica_biblioteca(int32_t uu, int32_t mm);
extern void GerenciadorSistema__consultar_biblioteca_albuns(bool *ab);
extern void GerenciadorSistema__consultar_biblioteca_artistas(bool *ar);
extern void GerenciadorSistema__consultar_biblioteca_musicas(bool *mm);
extern void GerenciadorSistema__cadastrar_obsessao_do_momento(int32_t uu, int32_t mm);
extern void GerenciadorSistema__remover_obsessao_do_momento(int32_t uu);
extern void GerenciadorSistema__consultar_obsessao_do_momento(int32_t uu, int32_t *rr);
extern void GerenciadorSistema__cadastrar_relacao_amizade(int32_t uu, int32_t us);
extern void GerenciadorSistema__remover_relacao_amizade(int32_t uu, int32_t us);
extern void GerenciadorSistema__consultar_relacoes_amigos(bool *aa);
extern void GerenciadorSistema__compatibilidade_musical(int32_t uu, int32_t us, int32_t *ab, int32_t *ar, int32_t *mm);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _GerenciadorSistema_h */
