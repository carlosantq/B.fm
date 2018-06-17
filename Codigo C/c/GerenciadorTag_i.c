/* WARNING if type checker is not performed, translation could contain errors ! */

#include "GerenciadorTag.h"

/* Clause SEES */
#include "Tag_Ctx.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static bool GerenciadorTag__tags_i[Tag_Ctx__TAG_MAX+1];
/* Clause INITIALISATION */
void GerenciadorTag__INITIALISATION(void)
{
    
    unsigned int i = 0;
    for(i = 0; i <= Tag_Ctx__TAG_MAX;i++)
    {
        GerenciadorTag__tags_i[i] = false;
    }
    GerenciadorTag__tags_i[Tag_Ctx__TAG_DUMMY] = true;
}

/* Clause OPERATIONS */

void GerenciadorTag__cadastrar_tag(int32_t tt)
{
    GerenciadorTag__tags_i[tt] = true;
}

void GerenciadorTag__remover_tag(int32_t tt)
{
    GerenciadorTag__tags_i[tt] = false;
}

void GerenciadorTag__buscar_tag(int32_t tt, bool *rr)
{
    (*rr) = GerenciadorTag__tags_i[tt];
}

void GerenciadorTag__listar_tags(bool *tt)
{
    memmove(tt,GerenciadorTag__tags_i,Tag_Ctx__TAG_MAX+1 * sizeof(bool));
}

