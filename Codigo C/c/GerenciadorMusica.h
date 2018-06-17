#ifndef _GerenciadorMusica_h
#define _GerenciadorMusica_h

#include <stdint.h>
#include <stdbool.h>
#include <string.h>
/* Clause SEES */
#include "Musica_Ctx.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void GerenciadorMusica__INITIALISATION(void);

/* Clause OPERATIONS */

extern void GerenciadorMusica__cadastrar_musica(int32_t mm);
extern void GerenciadorMusica__remover_musica(int32_t mm);
extern void GerenciadorMusica__buscar_musica(int32_t mm, bool *rr);
extern void GerenciadorMusica__listar_musicas(bool *mm);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _GerenciadorMusica_h */
