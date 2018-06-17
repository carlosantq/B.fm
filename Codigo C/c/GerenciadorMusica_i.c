/* WARNING if type checker is not performed, translation could contain errors ! */

#include "GerenciadorMusica.h"

/* Clause SEES */
#include "Musica_Ctx.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static bool GerenciadorMusica__musicas_i[Musica_Ctx__MUSICA_MAX+1];
/* Clause INITIALISATION */
void GerenciadorMusica__INITIALISATION(void)
{
    
    unsigned int i = 0;
    for(i = 0; i <= Musica_Ctx__MUSICA_MAX;i++)
    {
        GerenciadorMusica__musicas_i[i] = false;
    }
    GerenciadorMusica__musicas_i[Musica_Ctx__MUSICA_DUMMY] = true;
}

/* Clause OPERATIONS */

void GerenciadorMusica__cadastrar_musica(int32_t mm)
{
    GerenciadorMusica__musicas_i[mm] = true;
}

void GerenciadorMusica__remover_musica(int32_t mm)
{
    GerenciadorMusica__musicas_i[mm] = false;
}

void GerenciadorMusica__buscar_musica(int32_t mm, bool *rr)
{
    (*rr) = GerenciadorMusica__musicas_i[mm];
}

void GerenciadorMusica__listar_musicas(bool *mm)
{
    memmove(mm,GerenciadorMusica__musicas_i,Musica_Ctx__MUSICA_MAX+1 * sizeof(bool));
}

