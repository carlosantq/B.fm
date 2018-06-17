/* WARNING if type checker is not performed, translation could contain errors ! */

#include "GerenciadorUsuario.h"

/* Clause SEES */
#include "Usuario_Ctx.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static bool GerenciadorUsuario__usuarios_i[Usuario_Ctx__USUARIO_MAX+1];
/* Clause INITIALISATION */
void GerenciadorUsuario__INITIALISATION(void)
{
    
    unsigned int i = 0;
    for(i = 0; i <= Usuario_Ctx__USUARIO_MAX;i++)
    {
        GerenciadorUsuario__usuarios_i[i] = false;
    }
    GerenciadorUsuario__usuarios_i[Usuario_Ctx__USUARIO_DUMMY] = true;
}

/* Clause OPERATIONS */

void GerenciadorUsuario__cadastrar_usuario(int32_t uu)
{
    GerenciadorUsuario__usuarios_i[uu] = true;
}

void GerenciadorUsuario__remover_usuario(int32_t uu)
{
    GerenciadorUsuario__usuarios_i[uu] = false;
}

void GerenciadorUsuario__buscar_usuario(int32_t uu, bool *rr)
{
    (*rr) = GerenciadorUsuario__usuarios_i[uu];
}

void GerenciadorUsuario__listar_usuarios(bool *uu)
{
    memmove(uu,GerenciadorUsuario__usuarios_i,Usuario_Ctx__USUARIO_MAX+1 * sizeof(bool));
}

