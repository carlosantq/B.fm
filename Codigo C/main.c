#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "c/GerenciadorSistema.h"

void printMenu() {
  printf("\n  Insira [1] para cadastrar um Usuario.");
  printf("\n  Insira [2] para cadastrar uma Gravadora.");
  printf("\n  Insira [3] para cadastrar um Artista.");
  printf("\n  Insira [4] para cadastrar um Album.");
  printf("\n  Insira [5] para cadastrar uma Musica.");
  printf("\n  Insira [6] para cadastrar uma Playlist.");
  printf("\n  Insira [7] para cadastrar uma Tag.");
  printf("\n  ==============================================");
  printf("\n  Insira [11] para cadastrar uma Musica numa Playlist.");
  printf("\n  Insira [12] para cadastrar uma Musica num Album.");
  printf("\n  Insira [13] para cadastrar um Album num Artista.");
  printf("\n  Insira [14] para cadastrar um Artista numa Gravadora.");
  printf("\n  Insira [15] para cadastrar uma Tag numa Musica.");
  printf("\n  Insira [16] para cadastrar uma Tag num Album.");
  printf("\n  Insira [17] para cadastrar uma Tag numa Artista.");
  printf("\n  Insira [18] para cadastrar um amigo para um Usuario.");
  printf("\n  Insira [19] para cadastrar uma Musica na biblioteca de um Usuario.");
  printf("\n  Insira [20] para cadastrar um Artista na biblioteca de um Usuario.");
  printf("\n  Insira [21] para cadastrar um Album na biblioteca de um Usuario.");
  printf("\n  Insira [22] para cadastrar uma obsessao para um Usuario.");
  printf("\n  ==============================================");
  printf("\n  Insira [0] para sair.");
}

int main(void) {

  printf("\nBem vindo ao B.fm.");
  char input[10], input2[10];

  while(strcmp("0",input)) {
    printMenu();

    printf("\n\nEntrada:");
    scanf("%s", input);
    printf("\nVocê inseriu %s.", input);

    if (!strcmp("1",input)) {
      printf("\n    Cadastrando usuario...");
      printf("\n    Insira numero do usuario:");
      scanf("%s", input);
      // Método de cadastrar usuario
      printf("    Usuario cadastrado. Retornando ao menu inicial...\n");

    } else if(!strcmp("2",input)) {
      printf("\n    Cadastrando gravadora...");
      printf("\n    Insira numero da gravadora:");
      scanf("%s", input);
      // Método de cadastrar gravadora
      printf("    Gravadora cadastrada. Retornando ao menu inicial...\n");

    } else if(!strcmp("3",input)) {
      printf("\n    Cadastrando artista...");
      printf("\n    Insira numero do artista:");
      scanf("%s", input);
      // Método de cadastrar artista
      printf("    Artista cadastrado. Retornando ao menu inicial...\n");

    } else if(!strcmp("4",input)) {
      printf("\n    Cadastrando Album...");
      printf("\n    Insira numero do Album:");
      scanf("%s", input);
      // Método de cadastrar album
      printf("    Album cadastrado. Retornando ao menu inicial...\n");

    } else if(!strcmp("5",input)) {
      printf("\n    Cadastrando Musica...");
      printf("\n    Insira numero da musica:");
      scanf("%s", input);
      // Método de cadastrar musica
      printf("    Musica cadastrada. Retornando ao menu inicial...\n");

    } else if(!strcmp("6",input)) {
      printf("\n    Cadastrando Playlist...");
      printf("\n    Insira numero do usuario criador da playlist:");
      scanf("%s", input);
      printf("    Insira numero da playlist:");
      scanf("%s", input2);
      // Método de cadastrar playlist
      printf("    Playlist cadastrada. Retornando ao menu inicial...\n");

    } else if(!strcmp("7",input)) {
      printf("\n    Cadastrando Tag...");
      printf("\n    Insira numero do usuario criador da tag:");
      scanf("%s", input);
      printf("    Insira numero da tag:");
      scanf("%s", input2);
      // Método de cadastrar tag
      printf("    Tag cadastrada. Retornando ao menu inicial...\n");

// Relacionamentos =====================================================================
    } else if(!strcmp("11",input)) {
      printf("\n    Cadastrando Musica em Playlist...");
      printf("\n    Insira numero da Musica:");
      scanf("%s", input);
      printf("    Insira numero da Playlist:");
      scanf("%s", input2);
      // Método de cadastrar musica em playlist
      printf("    Musica %s cadastrada na Playlist %s. Retornando ao menu inicial...\n", input, input2);

    } else if(!strcmp("12",input)) {
      printf("\n    Cadastrando Musica em Album...");
      printf("\n    Insira numero da Musica:");
      scanf("%s", input);
      printf("    Insira numero do Album:");
      scanf("%s", input2);
      // Método de cadastrar musica em album
      printf("    Musica %s cadastrada no Album %s. Retornando ao menu inicial...\n", input, input2);

    } else if(!strcmp("13",input)) {
      printf("\n    Cadastrando Album em Artista...");
      printf("\n    Insira numero do Album:");
      scanf("%s", input);
      printf("    Insira numero do Artista:");
      scanf("%s", input2);
      // Método de cadastrar album em artista
      printf("    Album %s cadastrado no Artista %s. Retornando ao menu inicial...\n", input, input2);

    } else if(!strcmp("14",input)) {
      printf("\n    Cadastrando Artista em Gravadora...");
      printf("\n    Insira numero do Artista:");
      scanf("%s", input);
      printf("    Insira numero da Gravadora:");
      scanf("%s", input2);
      // Método de cadastrar artista em Gravadora
      printf("    Astista %s cadastrado na Gravadora %s. Retornando ao menu inicial...\n", input, input2);

    } else if(!strcmp("15",input)) {
      printf("\n    Cadastrando Tag em Musica...");
      printf("\n    Insira numero da Tag:");
      scanf("%s", input);
      printf("    Insira numero da Musica:");
      scanf("%s", input2);
      // Método de cadastrar tag em musica
      printf("    Tag %s cadastrada na Musica %s. Retornando ao menu inicial...\n", input, input2);

    } else if(!strcmp("16",input)) {
      printf("\n    Cadastrando Tag em Album...");
      printf("\n    Insira numero da Tag:");
      scanf("%s", input);
      printf("    Insira numero do Album:");
      scanf("%s", input2);
      // Método de cadastrar tag em Album
      printf("    Tag %s cadastrada no Album %s. Retornando ao menu inicial...\n", input, input2);

    } else if(!strcmp("17",input)) {
      printf("\n    Cadastrando Tag em Artista...");
      printf("\n    Insira numero da Tag:");
      scanf("%s", input);
      printf("    Insira numero do Artista:");
      scanf("%s", input2);
      // Método de cadastrar tag em artista
      printf("    Tag %s cadastrada no Artista %s. Retornando ao menu inicial...\n", input, input2);

    } else if(!strcmp("18",input)) {
      printf("\n    Cadastrando amigo para um Usuario...");
      printf("\n    Insira numero de um Usuario:");
      scanf("%s", input);
      printf("    Insira numero de outro Usuario:");
      scanf("%s", input2);
      // Método de cadastrar tag em musica
      printf("    Amigo %s cadastrado para o Usuario %s. Retornando ao menu inicial...\n", input, input2);

    } else if(!strcmp("19",input)) {
      printf("\n    Cadastrando Musica na biblioteca de um Usuario...");
      printf("\n    Insira numero da Musica:");
      scanf("%s", input);
      printf("    Insira numero do Usuario:");
      scanf("%s", input2);
      // Método de cadastrar tag em musica
      printf("    Musica %s cadastrada na biblioteca do Usuario %s. Retornando ao menu inicial...\n", input, input2);

    } else if(!strcmp("20",input)) {
      printf("\n    Cadastrando Artista na biblioteca de um Usuario...");
      printf("\n    Insira numero do Artista:");
      scanf("%s", input);
      printf("    Insira numero do Usuario:");
      scanf("%s", input2);
      // Método de cadastrar tag em musica
      printf("    Artista %s cadastrado na biblioteca do Usuario %s. Retornando ao menu inicial...\n", input, input2);

    } else if(!strcmp("21",input)) {
      printf("\n    Cadastrando Album na biblioteca de um Usuario...");
      printf("\n    Insira numero do Album:");
      scanf("%s", input);
      printf("    Insira numero do Usuario:");
      scanf("%s", input2);
      // Método de cadastrar tag em musica
      printf("    Album %s cadastrado na biblioteca do Usuario %s. Retornando ao menu inicial...\n", input, input2);

    } else if(!strcmp("22",input)) {
      printf("\n    Cadastrando obsessao para um Usuario...");
      printf("\n    Insira numero da Musica:");
      scanf("%s", input);
      printf("    Insira numero do Usuario:");
      scanf("%s", input2);
      // Método de cadastrar tag em musica
      printf("    Musica %s cadastrada como obsessao do Usuario %s. Retornando ao menu inicial...\n", input, input2);

// SAIDA ================================================================
    } else if(!strcmp("0",input)) {
      printf("\n    Saindo...");
    } else {
      printf("\n    Não existe essa opção :/");
    }
  }
  
  return 0;
}