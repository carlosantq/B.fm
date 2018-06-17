#ifndef _GerenciadorUsuario_h
#define _GerenciadorUsuario_h

#include <stdint.h>
#include <stdbool.h>
#include <string.h>
/* Clause SEES */
#include "Usuario_Ctx.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void GerenciadorUsuario__INITIALISATION(void);

/* Clause OPERATIONS */

extern void GerenciadorUsuario__cadastrar_usuario(int32_t uu);
extern void GerenciadorUsuario__remover_usuario(int32_t uu);
extern void GerenciadorUsuario__buscar_usuario(int32_t uu, bool *rr);
extern void GerenciadorUsuario__listar_usuarios(bool *uu);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _GerenciadorUsuario_h */
