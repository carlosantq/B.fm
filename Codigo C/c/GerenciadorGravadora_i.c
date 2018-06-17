/* WARNING if type checker is not performed, translation could contain errors ! */

#include "GerenciadorGravadora.h"

/* Clause SEES */
#include "Gravadora_Ctx.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static bool GerenciadorGravadora__gravadoras_i[Gravadora_Ctx__GRAVADORA_MAX+1];
/* Clause INITIALISATION */
void GerenciadorGravadora__INITIALISATION(void)
{
    
    unsigned int i = 0;
    for(i = 0; i <= Gravadora_Ctx__GRAVADORA_MAX;i++)
    {
        GerenciadorGravadora__gravadoras_i[i] = false;
    }
    GerenciadorGravadora__gravadoras_i[Gravadora_Ctx__GRAVADORA_DUMMY] = true;
}

/* Clause OPERATIONS */

void GerenciadorGravadora__cadastrar_gravadora(int32_t gg)
{
    GerenciadorGravadora__gravadoras_i[gg] = true;
}

void GerenciadorGravadora__remover_gravadora(int32_t gg)
{
    GerenciadorGravadora__gravadoras_i[gg] = false;
}

void GerenciadorGravadora__buscar_gravadora(int32_t gg, bool *rr)
{
    (*rr) = GerenciadorGravadora__gravadoras_i[gg];
}

void GerenciadorGravadora__listar_gravadoras(bool *gg)
{
    memmove(gg,GerenciadorGravadora__gravadoras_i,Gravadora_Ctx__GRAVADORA_MAX+1 * sizeof(bool));
}

