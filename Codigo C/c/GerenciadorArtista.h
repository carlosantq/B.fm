#ifndef _GerenciadorArtista_h
#define _GerenciadorArtista_h

#include <stdint.h>
#include <stdbool.h>
#include <string.h>
/* Clause SEES */
#include "Artista_Ctx.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void GerenciadorArtista__INITIALISATION(void);

/* Clause OPERATIONS */

extern void GerenciadorArtista__cadastrar_artista(int32_t aa);
extern void GerenciadorArtista__remover_artista(int32_t aa);
extern void GerenciadorArtista__buscar_artista(int32_t aa, bool *rr);
extern void GerenciadorArtista__listar_artistas(bool *aa);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _GerenciadorArtista_h */
