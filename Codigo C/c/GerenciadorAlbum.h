#ifndef _GerenciadorAlbum_h
#define _GerenciadorAlbum_h

#include <stdint.h>
#include <stdbool.h>
#include <string.h>
/* Clause SEES */
#include "Album_Ctx.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void GerenciadorAlbum__INITIALISATION(void);

/* Clause OPERATIONS */

extern void GerenciadorAlbum__cadastrar_album(int32_t aa);
extern void GerenciadorAlbum__remover_album(int32_t aa);
extern void GerenciadorAlbum__buscar_album(int32_t aa, bool *rr);
extern void GerenciadorAlbum__listar_albuns(bool *aa);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _GerenciadorAlbum_h */
