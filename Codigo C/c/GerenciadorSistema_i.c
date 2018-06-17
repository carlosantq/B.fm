/* WARNING if type checker is not performed, translation could contain errors ! */

#include "GerenciadorSistema.h"

/* Clause SEES */
#include "Max_num.h"
#include "Playlist_Ctx.h"
#include "Usuario_Ctx.h"
#include "Musica_Ctx.h"
#include "Artista_Ctx.h"
#include "Album_Ctx.h"
#include "Gravadora_Ctx.h"
#include "Tag_Ctx.h"

/* Clause IMPORTS */
#include "GerenciadorPlaylist.h"
#include "GerenciadorUsuario.h"
#include "GerenciadorMusica.h"
#include "GerenciadorAlbum.h"
#include "GerenciadorArtista.h"
#include "GerenciadorGravadora.h"
#include "GerenciadorTag.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static bool GerenciadorSistema__musicas_da_playlist_i[Playlist_Ctx__PLAYLIST_MAX+1][Musica_Ctx__MUSICA_MAX+1];
static int32_t GerenciadorSistema__criador_da_playlist_i[Playlist_Ctx__PLAYLIST_MAX+1];
static bool GerenciadorSistema__musicas_do_album_i[Album_Ctx__ALBUM_MAX+1][Musica_Ctx__MUSICA_MAX+1];
static bool GerenciadorSistema__albuns_do_artista_i[Artista_Ctx__ARTISTA_MAX+1][Album_Ctx__ALBUM_MAX+1];
static int32_t GerenciadorSistema__criador_da_tag_i[Tag_Ctx__TAG_MAX+1];
static bool GerenciadorSistema__musicas_da_tag_i[Tag_Ctx__TAG_MAX+1][Musica_Ctx__MUSICA_MAX+1];
static bool GerenciadorSistema__albuns_da_tag_i[Tag_Ctx__TAG_MAX+1][Album_Ctx__ALBUM_MAX+1];
static bool GerenciadorSistema__artistas_da_tag_i[Tag_Ctx__TAG_MAX+1][Artista_Ctx__ARTISTA_MAX+1];
static bool GerenciadorSistema__artistas_da_gravadora_i[Gravadora_Ctx__GRAVADORA_MAX+1][Artista_Ctx__ARTISTA_MAX+1];
static bool GerenciadorSistema__biblioteca_musicas_usuario_i[Usuario_Ctx__USUARIO_MAX+1][Musica_Ctx__MUSICA_MAX+1];
static bool GerenciadorSistema__biblioteca_artistas_usuario_i[Usuario_Ctx__USUARIO_MAX+1][Artista_Ctx__ARTISTA_MAX+1];
static bool GerenciadorSistema__biblioteca_albuns_usuario_i[Usuario_Ctx__USUARIO_MAX+1][Album_Ctx__ALBUM_MAX+1];
static int32_t GerenciadorSistema__obsessao_do_momento_i[Usuario_Ctx__USUARIO_MAX+1];
static bool GerenciadorSistema__amigos_i[Usuario_Ctx__USUARIO_MAX+1][Usuario_Ctx__USUARIO_MAX+1];
/* Clause INITIALISATION */
void GerenciadorSistema__INITIALISATION(void)
{
    
    unsigned int i = 0, j= 0;
    GerenciadorAlbum__INITIALISATION();
    GerenciadorArtista__INITIALISATION();
    GerenciadorGravadora__INITIALISATION();
    GerenciadorMusica__INITIALISATION();
    GerenciadorPlaylist__INITIALISATION();
    GerenciadorTag__INITIALISATION();
    GerenciadorUsuario__INITIALISATION();
    for(i = 0; i <= Playlist_Ctx__PLAYLIST_MAX;i++)
    {
        for(j = 0; j <= Musica_Ctx__MUSICA_MAX;j++)
        {
            GerenciadorSistema__musicas_da_playlist_i[i][j] = false;
        }
    }
    for(i = 0; i <= Album_Ctx__ALBUM_MAX;i++)
    {
        for(j = 0; j <= Musica_Ctx__MUSICA_MAX;j++)
        {
            GerenciadorSistema__musicas_do_album_i[i][j] = false;
        }
    }
    for(i = 0; i <= Playlist_Ctx__PLAYLIST_MAX;i++)
    {
        GerenciadorSistema__criador_da_playlist_i[i] = Usuario_Ctx__USUARIO_DUMMY;
    }
    for(i = 0; i <= Artista_Ctx__ARTISTA_MAX;i++)
    {
        for(j = 0; j <= Album_Ctx__ALBUM_MAX;j++)
        {
            GerenciadorSistema__albuns_do_artista_i[i][j] = false;
        }
    }
    for(i = 0; i <= Tag_Ctx__TAG_MAX;i++)
    {
        GerenciadorSistema__criador_da_tag_i[i] = Usuario_Ctx__USUARIO_DUMMY;
    }
    for(i = 0; i <= Tag_Ctx__TAG_MAX;i++)
    {
        for(j = 0; j <= Musica_Ctx__MUSICA_MAX;j++)
        {
            GerenciadorSistema__musicas_da_tag_i[i][j] = false;
        }
    }
    for(i = 0; i <= Tag_Ctx__TAG_MAX;i++)
    {
        for(j = 0; j <= Album_Ctx__ALBUM_MAX;j++)
        {
            GerenciadorSistema__albuns_da_tag_i[i][j] = false;
        }
    }
    for(i = 0; i <= Tag_Ctx__TAG_MAX;i++)
    {
        for(j = 0; j <= Artista_Ctx__ARTISTA_MAX;j++)
        {
            GerenciadorSistema__artistas_da_tag_i[i][j] = false;
        }
    }
    for(i = 0; i <= Gravadora_Ctx__GRAVADORA_MAX;i++)
    {
        for(j = 0; j <= Artista_Ctx__ARTISTA_MAX;j++)
        {
            GerenciadorSistema__artistas_da_gravadora_i[i][j] = false;
        }
    }
    for(i = 0; i <= Usuario_Ctx__USUARIO_MAX;i++)
    {
        for(j = 0; j <= Musica_Ctx__MUSICA_MAX;j++)
        {
            GerenciadorSistema__biblioteca_musicas_usuario_i[i][j] = false;
        }
    }
    for(i = 0; i <= Usuario_Ctx__USUARIO_MAX;i++)
    {
        for(j = 0; j <= Artista_Ctx__ARTISTA_MAX;j++)
        {
            GerenciadorSistema__biblioteca_artistas_usuario_i[i][j] = false;
        }
    }
    for(i = 0; i <= Usuario_Ctx__USUARIO_MAX;i++)
    {
        for(j = 0; j <= Album_Ctx__ALBUM_MAX;j++)
        {
            GerenciadorSistema__biblioteca_albuns_usuario_i[i][j] = false;
        }
    }
    for(i = 0; i <= Usuario_Ctx__USUARIO_MAX;i++)
    {
        GerenciadorSistema__obsessao_do_momento_i[i] = Musica_Ctx__MUSICA_DUMMY;
    }
    for(i = 0; i <= Usuario_Ctx__USUARIO_MAX;i++)
    {
        for(j = 0; j <= Usuario_Ctx__USUARIO_MAX;j++)
        {
            GerenciadorSistema__amigos_i[i][j] = false;
        }
    }
}

/* Clause OPERATIONS */

void GerenciadorSistema__cadastrar_playlist_do_usuario(int32_t pp, int32_t uu)
{
    GerenciadorPlaylist__cadastrar_playlist(pp);
    GerenciadorSistema__criador_da_playlist_i[pp] = uu;
}

void GerenciadorSistema__remover_playlist_do_usuario(int32_t pp)
{
    GerenciadorPlaylist__remover_playlist(pp);
    GerenciadorSistema__criador_da_playlist_i[pp] = Usuario_Ctx__USUARIO_DUMMY;
    {
        int32_t ii;
        bool aux;
        
        ii = 0;
        aux = false;
        while((ii) <= (Max_num__MAX_NUM))
        {
            aux = GerenciadorSistema__musicas_da_playlist_i[pp][ii];
            if(aux == true)
            {
                GerenciadorSistema__musicas_da_playlist_i[pp][ii] = false;
            }
            ii = ii+1;
        }
    }
}

void GerenciadorSistema__consultar_usuario_criador_da_playlist(int32_t pp, int32_t *uu)
{
    (*uu) = GerenciadorSistema__criador_da_playlist_i[pp];
}

void GerenciadorSistema__cadastrar_musica_na_playlist(int32_t pp, int32_t mm)
{
    GerenciadorSistema__musicas_da_playlist_i[pp][mm] = true;
}

void GerenciadorSistema__remover_musica_da_playlist(int32_t pp, int32_t mm)
{
    GerenciadorSistema__musicas_da_playlist_i[pp][mm] = false;
}

void GerenciadorSistema__remover_album_e_retirar_musicas(int32_t aa)
{
    GerenciadorAlbum__remover_album(aa);
    {
        int32_t ii;
        bool aux;
        
        ii = 0;
        aux = false;
        while((ii) <= (Max_num__MAX_NUM))
        {
            aux = GerenciadorSistema__musicas_do_album_i[aa][ii];
            if(aux == true)
            {
                GerenciadorSistema__musicas_do_album_i[aa][ii] = false;
            }
            ii = ii+1;
        }
    }
    {
        int32_t ii;
        bool aux;
        
        ii = 1;
        aux = false;
        while((ii) <= (Max_num__MAX_NUM))
        {
            aux = GerenciadorSistema__albuns_do_artista_i[ii][aa];
            if(aux == true)
            {
                GerenciadorSistema__albuns_do_artista_i[ii][aa] = false;
            }
            ii = ii+1;
        }
    }
    {
        int32_t ii;
        bool aux;
        
        ii = 1;
        aux = false;
        while((ii) <= (Max_num__MAX_NUM))
        {
            aux = GerenciadorSistema__biblioteca_albuns_usuario_i[ii][aa];
            if(aux == true)
            {
                GerenciadorSistema__biblioteca_albuns_usuario_i[ii][aa] = false;
            }
            ii = ii+1;
        }
    }
}

void GerenciadorSistema__cadastrar_musica_em_album(int32_t aa, int32_t mm)
{
    GerenciadorSistema__musicas_do_album_i[aa][mm] = true;
}

void GerenciadorSistema__remover_musica_de_album(int32_t aa, int32_t mm)
{
    GerenciadorSistema__musicas_do_album_i[aa][mm] = false;
}

void GerenciadorSistema__remover_artista_e_retirar_albuns(int32_t aa)
{
    GerenciadorArtista__remover_artista(aa);
    {
        int32_t ii;
        bool aux;
        
        ii = 1;
        aux = false;
        while((ii) <= (Max_num__MAX_NUM))
        {
            aux = GerenciadorSistema__albuns_do_artista_i[aa][ii];
            if(aux == true)
            {
                GerenciadorSistema__albuns_do_artista_i[aa][ii] = false;
            }
            ii = ii+1;
        }
    }
    {
        int32_t ii;
        bool aux;
        
        ii = 1;
        aux = false;
        while((ii) <= (Max_num__MAX_NUM))
        {
            aux = GerenciadorSistema__artistas_da_gravadora_i[ii][aa];
            if(aux == true)
            {
                GerenciadorSistema__artistas_da_gravadora_i[ii][aa] = false;
            }
            ii = ii+1;
        }
    }
    {
        int32_t ii;
        bool aux;
        
        ii = 1;
        aux = false;
        while((ii) <= (Max_num__MAX_NUM))
        {
            aux = GerenciadorSistema__biblioteca_artistas_usuario_i[ii][aa];
            if(aux == true)
            {
                GerenciadorSistema__biblioteca_artistas_usuario_i[ii][aa] = false;
            }
            ii = ii+1;
        }
    }
}

void GerenciadorSistema__cadastrar_album_para_artista(int32_t ar, int32_t al)
{
    GerenciadorSistema__albuns_do_artista_i[ar][al] = true;
}

void GerenciadorSistema__remover_album_do_artista(int32_t ar, int32_t al)
{
    GerenciadorSistema__albuns_do_artista_i[ar][al] = false;
}

void GerenciadorSistema__remover_gravadora_apagando_artistas(int32_t gg)
{
    unsigned int i = 0, j= 0;
    {
        GerenciadorGravadora__remover_gravadora(gg);
        for(i = 0; i <= Gravadora_Ctx__GRAVADORA_MAX;i++)
        {
            for(j = 0; j <= Artista_Ctx__ARTISTA_MAX;j++)
            {
                GerenciadorSistema__artistas_da_gravadora_i[i][j] = false;
            }
        }
    }
}

void GerenciadorSistema__alterar_gravadora_do_artista(int32_t gg, int32_t aa)
{
    unsigned int i = 0, j= 0;
    {
        for(i = 0; i <= Gravadora_Ctx__GRAVADORA_MAX;i++)
        {
            for(j = 0; j <= Artista_Ctx__ARTISTA_MAX;j++)
            {
                GerenciadorSistema__artistas_da_gravadora_i[i][j] = false;
            }
        }
        GerenciadorSistema__artistas_da_gravadora_i[gg][aa] = true;
    }
}

void GerenciadorSistema__cadastrar_artista_numa_gravadora(int32_t gg, int32_t aa)
{
    GerenciadorSistema__artistas_da_gravadora_i[gg][aa] = true;
}

void GerenciadorSistema__remover_artista_da_gravadora(int32_t gg, int32_t aa)
{
    GerenciadorSistema__artistas_da_gravadora_i[gg][aa] = false;
}

void GerenciadorSistema__cadastrar_tag_do_usuario_na_musica(int32_t tt, int32_t uu, int32_t mm)
{
    {
        int32_t temp;
        
        temp = GerenciadorSistema__criador_da_tag_i[tt];
        if(temp == Usuario_Ctx__USUARIO_DUMMY)
        {
            GerenciadorSistema__criador_da_tag_i[tt] = uu;
            GerenciadorTag__cadastrar_tag(tt);
        }
    }
    GerenciadorSistema__musicas_da_tag_i[tt][mm] = true;
}

void GerenciadorSistema__cadastrar_tag_do_usuario_no_album(int32_t tt, int32_t uu, int32_t aa)
{
    {
        int32_t temp;
        
        temp = GerenciadorSistema__criador_da_tag_i[tt];
        if(temp == Usuario_Ctx__USUARIO_DUMMY)
        {
            GerenciadorSistema__criador_da_tag_i[tt] = uu;
            GerenciadorTag__cadastrar_tag(tt);
        }
    }
    GerenciadorSistema__albuns_da_tag_i[tt][aa] = true;
}

void GerenciadorSistema__cadastrar_tag_do_usuario_no_artista(int32_t tt, int32_t uu, int32_t aa)
{
    {
        int32_t temp;
        
        temp = GerenciadorSistema__criador_da_tag_i[tt];
        if(temp == Usuario_Ctx__USUARIO_DUMMY)
        {
            GerenciadorSistema__criador_da_tag_i[tt] = uu;
            GerenciadorTag__cadastrar_tag(tt);
        }
    }
    GerenciadorSistema__artistas_da_tag_i[tt][aa] = true;
}

void GerenciadorSistema__remover_tag_do_usuario_na_musica(int32_t tt, int32_t uu, int32_t mm)
{
    {
        int32_t temp;
        
        temp = GerenciadorSistema__criador_da_tag_i[tt];
        if(temp == uu)
        {
            GerenciadorTag__remover_tag(tt);
            GerenciadorSistema__criador_da_tag_i[tt] = Usuario_Ctx__USUARIO_DUMMY;
        }
    }
    GerenciadorSistema__musicas_da_tag_i[tt][mm] = false;
}

void GerenciadorSistema__remover_tag_do_usuario_no_album(int32_t tt, int32_t uu, int32_t aa)
{
    {
        int32_t temp;
        
        temp = GerenciadorSistema__criador_da_tag_i[tt];
        if(temp == uu)
        {
            GerenciadorTag__remover_tag(tt);
            GerenciadorSistema__criador_da_tag_i[tt] = Usuario_Ctx__USUARIO_DUMMY;
        }
    }
    GerenciadorSistema__albuns_da_tag_i[tt][aa] = false;
}

void GerenciadorSistema__remover_tag_do_usuario_no_artista(int32_t tt, int32_t uu, int32_t aa)
{
    {
        int32_t temp;
        
        temp = GerenciadorSistema__criador_da_tag_i[tt];
        if(temp == uu)
        {
            GerenciadorTag__remover_tag(tt);
            GerenciadorSistema__criador_da_tag_i[tt] = Usuario_Ctx__USUARIO_DUMMY;
        }
    }
    GerenciadorSistema__artistas_da_tag_i[tt][aa] = false;
}

void GerenciadorSistema__cadastrar_artista_biblioteca(int32_t uu, int32_t aa)
{
    GerenciadorSistema__biblioteca_artistas_usuario_i[uu][aa] = true;
}

void GerenciadorSistema__remover_artista_biblioteca(int32_t uu, int32_t aa)
{
    GerenciadorSistema__biblioteca_artistas_usuario_i[uu][aa] = false;
}

void GerenciadorSistema__cadastrar_album_biblioteca(int32_t uu, int32_t aa)
{
    GerenciadorSistema__biblioteca_albuns_usuario_i[uu][aa] = true;
}

void GerenciadorSistema__remover_album_biblioteca(int32_t uu, int32_t aa)
{
    GerenciadorSistema__biblioteca_albuns_usuario_i[uu][aa] = false;
}

void GerenciadorSistema__cadastrar_musica_biblioteca(int32_t uu, int32_t mm)
{
    GerenciadorSistema__biblioteca_musicas_usuario_i[uu][mm] = true;
}

void GerenciadorSistema__remover_musica_biblioteca(int32_t uu, int32_t mm)
{
    GerenciadorSistema__biblioteca_musicas_usuario_i[uu][mm] = false;
    {
        int32_t xx;
        
        xx = GerenciadorSistema__obsessao_do_momento_i[uu];
        if(mm == xx)
        {
            GerenciadorSistema__obsessao_do_momento_i[uu] = Musica_Ctx__MUSICA_DUMMY;
        }
    }
}

void GerenciadorSistema__cadastrar_obsessao_do_momento(int32_t uu, int32_t mm)
{
    GerenciadorSistema__obsessao_do_momento_i[uu] = mm;
}

void GerenciadorSistema__remover_obsessao_do_momento(int32_t uu)
{
    GerenciadorSistema__obsessao_do_momento_i[uu] = Musica_Ctx__MUSICA_DUMMY;
}

void GerenciadorSistema__consultar_obsessao_do_momento(int32_t uu, int32_t *rr)
{
    (*rr) = GerenciadorSistema__obsessao_do_momento_i[uu];
}

void GerenciadorSistema__cadastrar_relacao_amizade(int32_t uu, int32_t us)
{
    GerenciadorSistema__amigos_i[uu][us] = true;
}

void GerenciadorSistema__remover_relacao_amizade(int32_t uu, int32_t us)
{
    GerenciadorSistema__amigos_i[uu][us] = false;
}

void GerenciadorSistema__compatibilidade_musical(int32_t uu, int32_t us, int32_t *ab, int32_t *ar, int32_t *mm)
{
    {
        int32_t ii;
        bool bb_album1;
        bool bb_album2;
        
        (*ab) = 0;
        ii = 1;
        bb_album1 = false;
        bb_album2 = false;
        while((ii) <= (Max_num__MAX_NUM))
        {
            bb_album1 = GerenciadorSistema__biblioteca_albuns_usuario_i[uu][ii];
            bb_album2 = GerenciadorSistema__biblioteca_albuns_usuario_i[us][ii];
            if(bb_album1 == true)
            {
                if(bb_album2 == true)
                {
                    (*ab) = (*ab)+1;
                }
            }
            ii = ii+1;
        }
    }
    {
        int32_t ii;
        bool bb_artista1;
        bool bb_artista2;
        
        (*ar) = 0;
        ii = 1;
        bb_artista1 = false;
        bb_artista2 = false;
        while((ii) <= (Max_num__MAX_NUM))
        {
            bb_artista1 = GerenciadorSistema__biblioteca_artistas_usuario_i[uu][ii];
            bb_artista2 = GerenciadorSistema__biblioteca_artistas_usuario_i[us][ii];
            if(bb_artista1 == true)
            {
                if(bb_artista2 == true)
                {
                    (*ar) = (*ar)+1;
                }
            }
            ii = ii+1;
        }
    }
    {
        int32_t ii;
        bool bb_musica1;
        bool bb_musica2;
        
        (*mm) = 0;
        ii = 1;
        bb_musica1 = false;
        bb_musica2 = false;
        while((ii) <= (Max_num__MAX_NUM))
        {
            bb_musica1 = GerenciadorSistema__biblioteca_musicas_usuario_i[uu][ii];
            bb_musica2 = GerenciadorSistema__biblioteca_musicas_usuario_i[us][ii];
            if(bb_musica1 == true)
            {
                if(bb_musica2 == true)
                {
                    (*mm) = (*mm)+1;
                }
            }
            ii = ii+1;
        }
    }
}

