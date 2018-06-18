#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "c/GerenciadorSistema.h"

void printMenu() {
  printf("\n[1] Cadastrar\n");
  printf("[2] Remover\n");
  printf("[3] Listar\n");
  printf("[4] Consultar\n");
  printf("[0] Sair\n");
}

void printMenuCadastrar(){
  printf("\n  [1] Cadastrar um Usuario");
  printf("\n  [2] Cadastrar uma Gravadora");
  printf("\n  [3] Cadastrar um Artista");
  printf("\n  [4] Cadastrar um Album");
  printf("\n  [5] Cadastrar uma Musica");
  printf("\n  ==============================================");
  printf("\n  [6] Cadastrar uma Playlist de Usuario");
  printf("\n  [7] Cadastrar uma Musica numa Playlist");
  printf("\n  [8] Cadastrar uma Musica num Album");
  printf("\n  [9] Cadastrar um Album num Artista");
  printf("\n  [10] Cadastrar um Artista numa Gravadora");
  printf("\n  [11] Cadastrar uma Tag numa Musica");
  printf("\n  [12] Cadastrar uma Tag num Album");
  printf("\n  [13] Cadastrar uma Tag numa Artista");
  printf("\n  [14] Cadastrar um amigo um Usuario");
  printf("\n  [15] Cadastrar uma Musica na biblioteca de um Usuario");
  printf("\n  [16] Cadastrar um Artista na biblioteca de um Usuario");
  printf("\n  [17] Cadastrar um Album na biblioteca de um Usuario");
  printf("\n  [18] Cadastrar uma Musica como obsessao um Usuario");
  printf("\n  ==============================================");
  printf("\n  [0] Voltar");
}

void printMenuListar(){
  printf("\n  [19] Listar usuarios");
  printf("\n  [20] Listar gravadoras");
  printf("\n  [21] Listar artistas");
  printf("\n  [22] Listar albuns");
  printf("\n  [23] Listar musicas");
  printf("\n  [24] Listar playlists");
  printf("\n  ==============================================");
  printf("\n  [25] Listar Playlists e suas Musicas");
  printf("\n  [26] Listar Albuns e suas Musicas");
  printf("\n  [27] Listar Artistas e seus Albuns");
  printf("\n  [28] Listar Gravadoras e seus Artistas");
  printf("\n  [29] Listar Musicas e Tags");
  printf("\n  [30] Listar Albuns e Tags");
  printf("\n  [31] Listar Artistas e Tags");
  printf("\n  [32] Listar Usuarios e Relacionamentos");
  printf("\n  [33] Listar Bibliotecas de Musicas de Usuarios");
  printf("\n  [34] Listar Bibliotecas de Artistas de Usuarios");
  printf("\n  [35] Listar Bibliotecas de Albuns de Usuarios");
  printf("\n  ==============================================");
  printf("\n  [0] Voltar");
}
 
void printMenuConsultar(){
  printf("\n  ==============================================");
  printf("\n  [36] Consultar Usuario criador de Playlist");
  printf("\n  [37] Consultar Usuario criador de Tag");
  printf("\n  [38] Consultar Compatibilidade Musical entre Usuarios");
  printf("\n  [39] Consultar Musica obsessao de Usuario");
  printf("\n  ==============================================");
  printf("\n  [0] Voltar");
} 

void printMenuRemover(){  
  printf("\n  ==============================================");
  printf("\n  [40] Remover usuarios");
  printf("\n  [41] Remover gravadoras");
  printf("\n  [42] Remover artistas");
  printf("\n  [43] Remover albuns");
  printf("\n  [44] Remover musicas");
  printf("\n  [45] Remover playlists");
  printf("\n  ==============================================");
  printf("\n  [46] Remover Playlists e suas Musicas");
  printf("\n  [47] Remover Albuns e suas Musicas");
  printf("\n  [48] Remover Artistas e seus Albuns");
  printf("\n  [49] Remover Gravadoras e seus Artistas");
  printf("\n  [50] Remover Musicas e Tags");
  printf("\n  [51] Remover Albuns e Tags");
  printf("\n  [52] Remover Artistas e Tags");
  printf("\n  [53] Remover Usuarios e Relacionamentos");
  printf("\n  [54] Remover Bibliotecas de Musicas de Usuarios");
  printf("\n  [55] Remover Bibliotecas de Artistas de Usuarios");
  printf("\n  [56] Remover Bibliotecas de Albuns de Usuarios");
  printf("\n  ==============================================");
  printf("\n  [0] Voltar");
}

int main(void) {

  GerenciadorSistema__INITIALISATION();

  printf("\nBem vindo ao B.fm.");
  char input[10], input2[10];
  int32_t valor, valor2, valor3;
  bool * busca = malloc(sizeof(bool) * 10);
  bool * busca2 = malloc(sizeof(bool) * 10);
  bool * busca3 = malloc(sizeof(bool) * 10);

  while(1) {
    printMenu();

    printf("\n\nEntrada:");
    scanf("%s", input);
    printf("\nVocê inseriu %s.", input);

    if(!strcmp("1", input)){
      printMenuCadastrar();

      printf("\n\nEntrada:");
      scanf("%s", input);
      printf("\nVocê inseriu %s.", input);

      if (!strcmp("1",input)) {
        printf("\n    Cadastrando usuario...");
        printf("\n    Insira numero do usuario:");
        scanf("%d", &valor);
        // Método de cadastrar usuario
        GerenciadorUsuario__buscar_usuario(valor, busca);
        if (busca[0] == false && valor <= Max_num__MAX_NUM && valor>0){
          GerenciadorUsuario__cadastrar_usuario(valor);
          printf("    Usuario cadastrado. Retornando ao menu inicial...\n");
        }else if ((valor <= 0) || valor > Max_num__MAX_NUM){
          printf("    Valor não permitido.\n");
        }else{
          printf("    Usuario já existe...\n");
        }

      } else if(!strcmp("2",input)) {
        printf("\n    Cadastrando gravadora...");
        printf("\n    Insira numero da gravadora:");
        scanf("%d", &valor);
        // Método de cadastrar gravadora
        GerenciadorGravadora__buscar_gravadora(valor, busca);
        if (busca[0] == false && valor <= Max_num__MAX_NUM && valor>0){
          GerenciadorGravadora__cadastrar_gravadora(valor);
          printf("    Gravadora cadastrada. Retornando ao menu inicial...\n");
        }else if ((valor <= 0) || valor > Max_num__MAX_NUM){
          printf("    Valor não permitido.\n");
        }else{
          printf("    Gravadora já existe...\n");
        }

      } else if(!strcmp("3",input)) {
        printf("\n    Cadastrando artista...");
        printf("\n    Insira numero do artista:");
        scanf("%d", &valor);
        // Método de cadastrar artista
        GerenciadorArtista__buscar_artista(valor, busca);
        if (busca[0] == false && valor <= Max_num__MAX_NUM && valor>0){
          GerenciadorArtista__cadastrar_artista(valor);
          printf("    Artista cadastrada. Retornando ao menu inicial...\n");
        }else if ((valor <= 0) || valor > Max_num__MAX_NUM){
          printf("    Valor não permitido.\n");
        }else{
          printf("    Artista já existe...\n");
        }

      } else if(!strcmp("4",input)) {
        printf("\n    Cadastrando Album...");
        printf("\n    Insira numero do Album:");
        scanf("%d", &valor);
        // Método de cadastrar album
        GerenciadorAlbum__buscar_album(valor, busca);
        if (busca[0] == false && valor <= Max_num__MAX_NUM && valor>0){
          GerenciadorAlbum__cadastrar_album(valor);
          printf("    Album cadastrada. Retornando ao menu inicial...\n");
        }else if ((valor <= 0) || valor > Max_num__MAX_NUM){
          printf("    Valor não permitido.\n");
        }else{
          printf("    Album já existe...\n");
        }

      } else if(!strcmp("5",input)) {
        printf("\n    Cadastrando Musica...");
        printf("\n    Insira numero da musica:");
        scanf("%d", &valor);
        // Método de cadastrar musica
        GerenciadorMusica__buscar_musica(valor, busca);
        if (busca[0] == false && valor <= Max_num__MAX_NUM && valor>0){
          GerenciadorMusica__cadastrar_musica(valor);
          printf("    Musica cadastrada. Retornando ao menu inicial...\n");
        }else if ((valor <= 0) || valor > Max_num__MAX_NUM){
          printf("    Valor não permitido.\n");
        }else{
          printf("    Musica já existe...\n");
        }

      } else if(!strcmp("6",input)) {
        printf("\n    Cadastrando Playlist...");
        printf("\n    Insira numero do usuario criador da playlist:");
        scanf("%d", &valor);
        printf("    Insira numero da playlist:");
        scanf("%d", &valor2);
        // Método de cadastrar playlist
        GerenciadorUsuario__buscar_usuario(valor, busca);
        GerenciadorPlaylist__buscar_playlist(valor2, busca2);
        if (busca[0] == false || valor <= 0 || valor > Max_num__MAX_NUM){
          printf("    Usuario não existe. Não foi possível cadastrar a playlist\n");
        }else if (busca2[0] == false && valor2 <= Max_num__MAX_NUM && valor2>0){
          GerenciadorSistema__cadastrar_playlist_do_usuario(valor2, valor);
          printf("    Playlist cadastrada. Retornando ao menu inicial...\n");
        }else if ((valor2 <= 0) || valor2 > Max_num__MAX_NUM){
          printf("    Valor não permitido.\n");
        }else{
          printf("    Playlist já existe...\n");
        }

      } else if (!strcmp("7",input)){
        printf("\n    Cadastrando Musica em Playlist...");
        printf("\n    Insira numero da playlist:");
        scanf("%d", &valor);
        printf("    Insira numero da musica:");
        scanf("%d", &valor2);
        // Método de cadastrar musica em playlist
        GerenciadorMusica__buscar_musica(valor2, busca2);
        GerenciadorPlaylist__buscar_playlist(valor, busca);
        if (busca2[0] == false || valor2 <= 0 || valor2 > Max_num__MAX_NUM){
          printf("    Musica não existe. Não foi possível cadastrar a musica na playlist.\n");
        }else if (busca[0] == false || valor <= 0 || valor > Max_num__MAX_NUM){
          printf("    Playlist não existe. Não foi possível cadastrar a musica na playlist.\n");
        }else{
          GerenciadorSistema__cadastrar_musica_na_playlist(valor, valor2);
          printf("    Música cadastrada na Playlist...\n");
        }

      } else if (!strcmp("8",input)){

        printf("\n    Cadastrando Musica em Album...");
        printf("\n    Insira numero do album:");
        scanf("%d", &valor);
        printf("    Insira numero da musica:");
        scanf("%d", &valor2);
        // Método de cadastrar musica em album
        GerenciadorMusica__buscar_musica(valor2, busca2);
        GerenciadorAlbum__buscar_album(valor, busca);
        if (busca2[0] == false || valor2 <= 0 || valor2 > Max_num__MAX_NUM){
          printf("    Musica não existe. Não foi possível cadastrar a musica no álbum.\n");
        }else if (busca[0] == false || valor <= 0 || valor > Max_num__MAX_NUM){
          printf("    Album não existe. Não foi possível cadastrar a musica no álbum.\n");
        }else{
          GerenciadorSistema__cadastrar_musica_em_album(valor, valor2);
          printf("    Música cadastrada no Álbum...\n");
        }

      } else if (!strcmp("9",input)){

        printf("\n    Cadastrando Album em Artista...");
        printf("\n    Insira numero do artista:");
        scanf("%d", &valor);
        printf("    Insira numero do album:");
        scanf("%d", &valor2);
        // Método de cadastrar album em artista
        GerenciadorAlbum__buscar_album(valor2, busca2);
        GerenciadorArtista__buscar_artista(valor, busca);
        if (busca2[0] == false || valor2 <= 0 || valor2 > Max_num__MAX_NUM){
          printf("    Album não existe. Não foi possível cadastrar o album no artista.\n");
        }else if (busca[0] == false || valor <= 0 || valor > Max_num__MAX_NUM){
          printf("    Artista não existe. Não foi possível cadastrar o album no artista.\n");
        }else{
          GerenciadorSistema__cadastrar_album_para_artista(valor, valor2);
          printf("    Album cadastrada no Artista...\n");
        }

      } else if (!strcmp("10",input)){

        printf("\n    Cadastrando Artista em Gravadora...");
        printf("\n    Insira numero do artista:");
        scanf("%d", &valor);
        printf("    Insira numero da gravadora:");
        scanf("%d", &valor2);
        // Método de cadastrar artista em gravadora
        GerenciadorGravadora__buscar_gravadora(valor2, busca2);
        GerenciadorArtista__buscar_artista(valor, busca);
        if (busca2[0] == false || valor2 <= 0 || valor2 > Max_num__MAX_NUM){
          printf("    Gravadora não existe. Não foi possível cadastrar o artista na gravadora.\n");
        }else if (busca[0] == false || valor <= 0 || valor > Max_num__MAX_NUM){
          printf("    Artista não existe. Não foi possível cadastrar o artista na gravadora.\n");
        }else{
          GerenciadorSistema__cadastrar_artista_numa_gravadora(valor, valor2);
          printf("    Artista cadastrado na Gravadora...\n");
        }

      } else if (!strcmp("11",input)){

        printf("\n    Cadastrando Tag de Usuario em Musica...");
        printf("\n    Insira numero da tag:");
        scanf("%d", &valor);
        printf("    Insira numero do usuario:");
        scanf("%d", &valor2);
        printf("    Insira numero da musica:");
        scanf("%d", &valor3);
        // Método de cadastrar tag de usuario em musica
        GerenciadorUsuario__buscar_usuario(valor2, busca2);
        GerenciadorMusica__buscar_musica(valor3, busca3);
        if (busca2[0] == false || valor2 <= 0 || valor2 > Max_num__MAX_NUM){
          printf("    Usuario não existe. Não foi possível cadastrar tag em musica.\n");
        }else if (valor <= 0 || valor > Max_num__MAX_NUM){
          printf("    Tag não pode ser criada com esse valor. Não foi possível cadastrar tag em musica.\n");
        }else if (busca3[0] == false || valor3 <= 0 || valor3 > Max_num__MAX_NUM){
          printf("    Musica não existe. Não foi possível cadastrar tag em musica.\n");
        }else{
          GerenciadorSistema__cadastrar_tag_do_usuario_na_musica(valor, valor2, valor3);
          printf("    Tag cadastrada em musica...\n");
        }

      } else if (!strcmp("12",input)){

        printf("\n    Cadastrando Tag de Usuario em Album...");
        printf("\n    Insira numero da tag:");
        scanf("%d", &valor);
        printf("    Insira numero do usuario:");
        scanf("%d", &valor2);
        printf("    Insira numero do album:");
        scanf("%d", &valor3);
        GerenciadorUsuario__buscar_usuario(valor2, busca2);
        GerenciadorAlbum__buscar_album(valor3, busca3);
        if (busca2[0] == false || valor2 <= 0 || valor2 > Max_num__MAX_NUM){
          printf("    Usuario não existe. Não foi possível cadastrar tag em album.\n");
        }else if (valor <= 0 || valor > Max_num__MAX_NUM){
          printf("    Tag não pode ser criada com esse valor. Não foi possível cadastrar tag em album.\n");
        }else if (busca3[0] == false || valor3 <= 0 || valor3 > Max_num__MAX_NUM){
          printf("    Album não existe. Não foi possível cadastrar tag em album.\n");
        }else{
          GerenciadorSistema__cadastrar_tag_do_usuario_no_album(valor, valor2, valor3);
          printf("    Tag cadastrada em album...\n");
        }

      } else if (!strcmp("13",input)){

        printf("\n    Cadastrando Tag de Usuario em Artista...");
        printf("\n    Insira numero da tag:");
        scanf("%d", &valor);
        printf("    Insira numero do usuario:");
        scanf("%d", &valor2);
        printf("    Insira numero do artista:");
        scanf("%d", &valor3);
        GerenciadorUsuario__buscar_usuario(valor2, busca2);
        GerenciadorArtista__buscar_artista(valor3, busca3);
        if (busca2[0] == false || valor2 <= 0 || valor2 > Max_num__MAX_NUM){
          printf("    Usuario não existe. Não foi possível cadastrar tag em artista.\n");
        }else if (valor <= 0 || valor > Max_num__MAX_NUM){
          printf("    Tag não pode ser criada com esse valor. Não foi possível cadastrar tag em artista.\n");
        }else if (busca3[0] == false || valor3 <= 0 || valor3 > Max_num__MAX_NUM){
          printf("    Artista não existe. Não foi possível cadastrar tag em artista.\n");
        }else{
          GerenciadorSistema__cadastrar_tag_do_usuario_no_artista(valor, valor2, valor3);
          printf("    Tag cadastrada em artista...\n");
        }

      } else if (!strcmp("14",input)){

        printf("\n    Cadastrando amigo para um Usuario...");
        printf("\n    Insira numero do primeiro usuario:");
        scanf("%d", &valor);
        printf("    Insira numero do segundo usuario:");
        scanf("%d", &valor2);
        GerenciadorUsuario__buscar_usuario(valor, busca);
        GerenciadorUsuario__buscar_usuario(valor2, busca2);
        if (busca[0] == false || valor <= 0 || valor > Max_num__MAX_NUM){
          printf("    Primeiro usuario não existe. Não foi possível cadastrar amigo.\n");
        } else if (busca2[0] == false || valor2 <= 0 || valor2 > Max_num__MAX_NUM){
          printf("    Segundo usuario não existe. Não foi possível cadastrar amigo.\n");
        } else {
          GerenciadorSistema__cadastrar_relacao_amizade(valor, valor2);
          printf("    Amigo cadastrado para usuario...\n");
        }

      } else if (!strcmp("15",input)){

        printf("\n    Cadastrando Musica na biblioteca de um Usuario...");
        printf("\n    Insira numero da musica:");
        scanf("%d", &valor);
        printf("    Insira numero do usuario:");
        scanf("%d", &valor2);
        GerenciadorMusica__buscar_musica(valor, busca);
        GerenciadorUsuario__buscar_usuario(valor2, busca2);
        if (busca[0] == false || valor <= 0 || valor > Max_num__MAX_NUM){
          printf("    Música não existe. Não foi possível cadastrar música na biblioteca do usuario.\n");
        }else if (busca2[0] == false || valor2 <= 0 || valor2 > Max_num__MAX_NUM){
          printf("    Usuario não existe. Não foi possível cadastrar música na biblioteca do usuario.\n");
        }else{
          GerenciadorSistema__cadastrar_musica_biblioteca(valor2, valor);
          printf("    Musica cadastrada na biblioteca do usuario...\n");
        }

      } else if (!strcmp("16",input)){

        printf("\n    Cadastrando Artista na biblioteca de um Usuario...");
        printf("\n    Insira numero do artista:");
        scanf("%d", &valor);
        printf("    Insira numero do usuario:");
        scanf("%d", &valor2);
        GerenciadorArtista__buscar_artista(valor, busca);
        GerenciadorUsuario__buscar_usuario(valor2, busca2);
        if (busca[0] == false || valor <= 0 || valor > Max_num__MAX_NUM){
          printf("    Artista não existe. Não foi possível cadastrar artista na biblioteca do usuario.\n");
        }else if (busca2[0] == false || valor2 <= 0 || valor2 > Max_num__MAX_NUM){
          printf("    Usuario não existe. Não foi possível cadastrar artista na biblioteca do usuario.\n");
        }else{
          GerenciadorSistema__cadastrar_artista_biblioteca(valor2, valor);
          printf("    Artista cadastrado na biblioteca do usuario...\n");
        }

      } else if (!strcmp("17",input)){

        printf("\n    Cadastrando Album na biblioteca de um Usuario...");
        printf("\n    Insira numero do album:");
        scanf("%d", &valor);
        printf("    Insira numero do usuario:");
        scanf("%d", &valor2);
        GerenciadorAlbum__buscar_album(valor, busca);
        GerenciadorUsuario__buscar_usuario(valor2, busca2);
        if (busca[0] == false || valor <= 0 || valor > Max_num__MAX_NUM){
          printf("    Album não existe. Não foi possível cadastrar album na biblioteca do usuario.\n");
        }else if (busca2[0] == false || valor2 <= 0 || valor2 > Max_num__MAX_NUM){
          printf("    Usuario não existe. Não foi possível cadastrar album na biblioteca do usuario.\n");
        }else{
          GerenciadorSistema__cadastrar_album_biblioteca(valor2, valor);
          printf("    Album cadastrado na biblioteca do usuario...\n");
        }

      } else if (!strcmp("18",input)){

        printf("\n    Cadastrando obsessão do momento para Usuario...");
        printf("\n    Insira numero do usuario:");
        scanf("%d", &valor);
        printf("    Insira numero da musica:");
        scanf("%d", &valor2);
        GerenciadorUsuario__buscar_usuario(valor, busca);
        GerenciadorMusica__buscar_musica(valor2, busca2);
        if (busca[0] == false || valor <= 0 || valor > Max_num__MAX_NUM){
          printf("    Usuario não existe. Não foi possível cadastrar obsessão do momento.\n");
        }else if (busca2[0] == false || valor2 <= 0 || valor2 > Max_num__MAX_NUM){
          printf("    Música não existe. Não foi possível cadastrar obsessão do momento.\n");
        }else{
          GerenciadorSistema__cadastrar_obsessao_do_momento(valor, valor2);
          printf("    Obsessão do momento cadastrada...\n");
        }

      }else if(!strcmp("0",input)){
      } else{
        printf("\n Não existe essa opção :/");
      }      

    }else if(!strcmp("2", input)){
      printMenuRemover();

      printf("\n\nEntrada:");
      scanf("%s", input);
      printf("\nVocê inseriu %s.", input);

      if(!strcmp("40",input)){
        printf("\n    Removendo usuario...");
        printf("\n    Insira numero do usuario:");
        scanf("%d", &valor);
        GerenciadorUsuario__buscar_usuario(valor, busca);
        if ((valor <= 0) || valor > Max_num__MAX_NUM){
          printf("    Valor não é permitido.\n");
        }else if (busca[0] == true && valor <= Max_num__MAX_NUM && valor>0){
          GerenciadorUsuario__remover_usuario(valor);
          printf("    Usuario removido. Retornando ao menu inicial...\n");
        }else{
          printf("    Usuario não existe...\n");
        }
      }else if (!strcmp("41",input)){

      }else if (!strcmp("42",input)){
        
      }else if (!strcmp("43",input)){
        
      }else if (!strcmp("44",input)){
        
      }else if (!strcmp("45",input)){
        
      }else if (!strcmp("46",input)){
        
      }else if (!strcmp("47",input)){
        
      }else if (!strcmp("48",input)){
        
      }else if (!strcmp("49",input)){
        
      }else if (!strcmp("50",input)){
        
      }else if (!strcmp("51",input)){
        
      }else if (!strcmp("52",input)){
        
      }else if (!strcmp("53",input)){
        
      }else if (!strcmp("54",input)){
        
      }else if (!strcmp("55",input)){
        
      }else if (!strcmp("56",input)){
        
      }else if (!strcmp("0",input)){
      }else{

      }


    }else if(!strcmp("3", input)){
      printMenuListar();

      printf("\n\nEntrada:");
      scanf("%s", input);
      printf("\nVocê inseriu %s.", input);

      if(!strcmp("19",input)) {
        printf("\nListando usuarios...\n");
        // Método de listar usuarios
        bool uu[Max_num__MAX_NUM];
        GerenciadorUsuario__listar_usuarios(uu);
        printf("=====\n");
        for (int i=1; i<=Max_num__MAX_NUM; i++){
          if (uu[i] == 1){
            printf("  %d |\n", i);
          }
        }
        printf("=====\n");
      }else if(!strcmp("20",input)) {
        printf("\nListando gravadoras...\n");
        // Método de listar gravadoras
        bool uu[Max_num__MAX_NUM];
        GerenciadorGravadora__listar_gravadoras(uu);
        printf("=====\n");
        for (int i=1; i<=Max_num__MAX_NUM; i++){
          if (uu[i] == 1){
            printf("  %d |\n", i);
          }
        }
        printf("=====\n");
      }else if(!strcmp("21",input)) {
        printf("\nListando artistas...\n");
        // Método de listar artistas
        bool uu[Max_num__MAX_NUM];
        GerenciadorArtista__listar_artistas(uu);
        printf("=====\n");
        for (int i=1; i<=Max_num__MAX_NUM; i++){
          if (uu[i] == 1){
            printf("  %d |\n", i);
          }
        }
        printf("=====\n");
      }else if(!strcmp("22",input)) {
        printf("\nListando albuns...\n");
        // Método de listar albuns
        bool uu[Max_num__MAX_NUM];
        GerenciadorAlbum__listar_albuns(uu);
        printf("=====\n");
        for (int i=1; i<=Max_num__MAX_NUM; i++){
          if (uu[i] == 1){
            printf("  %d |\n", i);
          }
        }
        printf("=====\n");
      }else if(!strcmp("23",input)) {
        printf("\nListando musicas...\n");
        // Método de listar musicas
        bool uu[Max_num__MAX_NUM];
        GerenciadorMusica__listar_musicas(uu);
        printf("=====\n");
        for (int i=1; i<=Max_num__MAX_NUM; i++){
          if (uu[i] == 1){
            printf("  %d |\n", i);
          }
        }
        printf("=====\n");
      }else if(!strcmp("24",input)) {
        printf("\nListando playlists...\n");
        // Método de listar playlists
        bool uu[Max_num__MAX_NUM];
        GerenciadorPlaylist__listar_playlists (uu);
        printf("=====\n");
        for (int i=1; i<=Max_num__MAX_NUM; i++){
          if (uu[i] == 1){
            printf("  %d |\n", i);
          }
        }
        printf("=====\n"); 
      }else if(!strcmp("25",input)){
        printf("\nListando playlists e músicas...\n");
        //bool * uu[Max_num__MAX_NUM][Max_num__MAX_NUM];
        //GerenciadorSistema__consultar_playlists_e_musicas(uu);
        printf("===========\n");
        //ignorando os que tem 0, pois é valor dummy
        /*printf("1 -> 1 : %d|\n", uu[6]);
        printf("1 -> 2 : %d|\n", uu[7]);
        printf("1 -> 3 : %d|\n", uu[8]);
        printf("1 -> 4 : %d|\n", uu[9]);
        printf("1 -> 5 : %d|\n", uu[10]);
        printf("2 -> 1 : %d|\n", uu[12]);*/
        //printf("%d|\n", uu[1][1]);
        /*for (int i=0; i<=Max_num__MAX_NUM; i++){
          for (int j=0; j<=Max_num__MAX_NUM; j++){
            printf("%d %d %d\n", i, j, uu[i][j]);
          }
        }*/

        printf("===========\n");


        /*for (int i=1; i<=Max_num__MAX_NUM*Max_num__MAX_NUM; i++){
          if (uu[i] == 1){
            printf("  %d |\n", i);
         }
       }*/
      } else if(!strcmp("26",input)){
        
      } else if(!strcmp("27",input)){
        
      } else if(!strcmp("28",input)){
      
      } else if(!strcmp("29",input)){
        
      } else if(!strcmp("30",input)){
        
      } else if(!strcmp("31",input)){
        
      } else if(!strcmp("32",input)){
        
      } else if(!strcmp("33",input)){
        
      } else if(!strcmp("34",input)){
        
      } else if(!strcmp("35",input)){
        
      }else if(!strcmp("0",input)){
      }else{
        printf("\n Não existe essa opção :/");
      }       


    }else if(!strcmp("4", input)){
      printMenuConsultar();

      printf("\n\nEntrada:");
      scanf("%s", input);
      printf("\nVocê inseriu %s.", input);

      if(!strcmp("36",input)) {

        printf("\nConsultando usuario criador de playlist...\n");
        int32_t * uu = malloc(sizeof(int32_t) * 10);
        printf("\n    Insira numero da playlist:");
        scanf("%d", &valor);
        GerenciadorSistema__consultar_usuario_criador_da_playlist(valor, uu);
        if (*uu == 0){
          printf("\n Essa playlist não existe.\n");
        }else{
          printf("\n    Usuário criador da playlist %d é %d", valor, *uu);
        }

      }else if (!strcmp("37",input)){

        int32_t * temp1 = malloc(sizeof(int32_t));

        printf("\nConsultando usuario criador de tag...\n");
        printf("\n    Insira numero da tag:");
        scanf("%d", &valor);

        GerenciadorTag__buscar_tag(valor, busca);
        if (busca[0] == false || valor <= 0 || valor > Max_num__MAX_NUM){
          printf("Tag informada não existe!\n");
        }else{
          GerenciadorSistema__consultar_usuario_criador_da_tag(valor, temp1);
          printf("O usuário criador da tag %d é: %d", valor, *temp1);
        }

      }else if (!strcmp("38",input)){

        int32_t * temp1 = malloc(sizeof(int32_t));
        int32_t * temp2 = malloc(sizeof(int32_t));
        int32_t * temp3 = malloc(sizeof(int32_t));

        printf("\nConsultando Compatibilidade musical...\n");
        printf("\n    Insira o numero do primeiro usuario:");
        scanf("%d", &valor);
        printf("\n    Insira o numero do segundo usuario:");
        scanf("%d", &valor2);
        GerenciadorUsuario__buscar_usuario(valor, busca);
        GerenciadorUsuario__buscar_usuario(valor2, busca2);
        if (busca[0] == false || valor <= 0 || valor > Max_num__MAX_NUM){
          printf("Primerio usuário informado não existe!\n");
        }else if (busca2[0] == false || valor2 <= 0 || valor2 > Max_num__MAX_NUM){
          printf("Segundo usuário informado não existe!\n");
        }else{
          GerenciadorSistema__compatibilidade_musical(valor, valor2, temp1, temp2, temp3);
          printf("Compatibilidade musical entre %d e %d é: album: %d, artista: %d, musica: %d", valor, valor2, *temp1, *temp2, *temp3);
        }

      }else if (!strcmp("39",input)){

        int32_t * temp1 = malloc(sizeof(int32_t));

        printf("\nConsultando Musica obsessao do Usuario...\n");
        printf("\n    Insira o numero do usuario:");
        scanf("%d", &valor);

        GerenciadorUsuario__buscar_usuario(valor, busca);
        if (busca[0] == false || valor <= 0 || valor > Max_num__MAX_NUM){
          printf("Usuário informado não existe!\n");
        }else{
          GerenciadorSistema__consultar_obsessao_do_momento(valor, temp1);
          printf("A música obsessao do momento de %d é: %d", valor, *temp1);
        }

      }else if(!strcmp("0",input)){
      }else{
        printf("\n Não existe essa opção :/");
      }
  }
}

  return 0;
}
