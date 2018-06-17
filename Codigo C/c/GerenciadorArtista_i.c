/* WARNING if type checker is not performed, translation could contain errors ! */

#include "GerenciadorArtista.h"

/* Clause SEES */
#include "Artista_Ctx.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static bool GerenciadorArtista__artistas_i[Artista_Ctx__ARTISTA_MAX+1];
/* Clause INITIALISATION */
void GerenciadorArtista__INITIALISATION(void)
{
    
    unsigned int i = 0;
    for(i = 0; i <= Artista_Ctx__ARTISTA_MAX;i++)
    {
        GerenciadorArtista__artistas_i[i] = false;
    }
    GerenciadorArtista__artistas_i[Artista_Ctx__ARTISTA_DUMMY] = true;
}

/* Clause OPERATIONS */

void GerenciadorArtista__cadastrar_artista(int32_t aa)
{
    GerenciadorArtista__artistas_i[aa] = true;
}

void GerenciadorArtista__remover_artista(int32_t aa)
{
    GerenciadorArtista__artistas_i[aa] = false;
}

void GerenciadorArtista__buscar_artista(int32_t aa, bool *rr)
{
    (*rr) = GerenciadorArtista__artistas_i[aa];
}

void GerenciadorArtista__listar_artistas(bool *aa)
{
    memmove(aa,GerenciadorArtista__artistas_i,Artista_Ctx__ARTISTA_MAX+1 * sizeof(bool));
}

