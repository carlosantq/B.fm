#ifndef _GerenciadorGravadora_h
#define _GerenciadorGravadora_h

#include <stdint.h>
#include <stdbool.h>
#include <string.h>
/* Clause SEES */
#include "Gravadora_Ctx.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void GerenciadorGravadora__INITIALISATION(void);

/* Clause OPERATIONS */

extern void GerenciadorGravadora__cadastrar_gravadora(int32_t gg);
extern void GerenciadorGravadora__remover_gravadora(int32_t gg);
extern void GerenciadorGravadora__buscar_gravadora(int32_t gg, bool *rr);
extern void GerenciadorGravadora__listar_gravadoras(bool *gg);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _GerenciadorGravadora_h */
