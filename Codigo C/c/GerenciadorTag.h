#ifndef _GerenciadorTag_h
#define _GerenciadorTag_h

#include <stdint.h>
#include <stdbool.h>
#include <string.h>
/* Clause SEES */
#include "Tag_Ctx.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void GerenciadorTag__INITIALISATION(void);

/* Clause OPERATIONS */

extern void GerenciadorTag__cadastrar_tag(int32_t tt);
extern void GerenciadorTag__remover_tag(int32_t tt);
extern void GerenciadorTag__buscar_tag(int32_t tt, bool *rr);
extern void GerenciadorTag__listar_tags(bool *tt);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _GerenciadorTag_h */
