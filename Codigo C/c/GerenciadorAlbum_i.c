/* WARNING if type checker is not performed, translation could contain errors ! */

#include "GerenciadorAlbum.h"

/* Clause SEES */
#include "Album_Ctx.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static bool GerenciadorAlbum__albuns_i[Album_Ctx__ALBUM_MAX+1];
/* Clause INITIALISATION */
void GerenciadorAlbum__INITIALISATION(void)
{
    
    unsigned int i = 0;
    for(i = 0; i <= Album_Ctx__ALBUM_MAX;i++)
    {
        GerenciadorAlbum__albuns_i[i] = false;
    }
    GerenciadorAlbum__albuns_i[Album_Ctx__ALBUM_DUMMY] = true;
}

/* Clause OPERATIONS */

void GerenciadorAlbum__cadastrar_album(int32_t aa)
{
    GerenciadorAlbum__albuns_i[aa] = true;
}

void GerenciadorAlbum__remover_album(int32_t aa)
{
    GerenciadorAlbum__albuns_i[aa] = false;
}

void GerenciadorAlbum__buscar_album(int32_t aa, bool *rr)
{
    (*rr) = GerenciadorAlbum__albuns_i[aa];
}

void GerenciadorAlbum__listar_albuns(bool *aa)
{
    memmove(aa,GerenciadorAlbum__albuns_i,Album_Ctx__ALBUM_MAX+1 * sizeof(bool));
}

