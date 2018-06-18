
// Remover entidades ===================================================================
if (!strcmp("40",input)) {
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
} else if(!strcmp("41",input)) {
  printf("\n    Removendo gravadora...");
  printf("\n    Insira numero da gravadora:");
  scanf("%d", &valor);
  GerenciadorGravadora__buscar_gravadora(valor, busca);
  if ((valor <= 0) || valor > Max_num__MAX_NUM){
    printf("    Valor não é permitido.\n");
  }else if (busca[0] == true && valor <= Max_num__MAX_NUM && valor>0){
    GerenciadorGravadora__remover_gravadora(valor);
    printf("    Gravadora removida. Retornando ao menu inicial...\n");
  }else{
    printf("    Gravadora não existe...\n");
  }
} else if(!strcmp("42",input)) {
  printf("\n    Removendo artista...");
  printf("\n    Insira numero do artista:");
  scanf("%d", &valor);
  GerenciadorArtista__buscar_artista(valor, busca);
  if ((valor <= 0) || valor > Max_num__MAX_NUM){
    printf("    Valor não é permitido.\n");
  }else if (busca[0] == true && valor <= Max_num__MAX_NUM && valor>0){
    GerenciadorArtista__remover_artista(valor);
    printf("    Artista removida. Retornando ao menu inicial...\n");
  }else{
    printf("    Artista não existe...\n");
  }
} else if(!strcmp("43",input)) {
  printf("\n    Removendo album...");
  printf("\n    Insira numero do album:");
  scanf("%d", &valor);
  GerenciadorAlbum__buscar_album(valor, busca);
  if ((valor <= 0) || valor > Max_num__MAX_NUM){
    printf("    Valor não é permitido.\n");
  }else if (busca[0] == true && valor <= Max_num__MAX_NUM && valor>0){
    GerenciadorAlbum__remover_album(valor);
    printf("    Album removida. Retornando ao menu inicial...\n");
  }else{
    printf("    Album não existe...\n");
  }
} else if(!strcmp("44",input)) {
  printf("\n    Removendo musica...");
  printf("\n    Insira numero da musica:");
  scanf("%d", &valor);
  GerenciadorMusica__buscar_musica(valor, busca);
  if ((valor <= 0) || valor > Max_num__MAX_NUM){
    printf("    Valor não é permitido.\n");
  }else if (busca[0] == true && valor <= Max_num__MAX_NUM && valor>0){
    GerenciadorMusica__remover_musica(valor);
    printf("    Musica removida. Retornando ao menu inicial...\n");
  }else{
    printf("    Musica não existe...\n");
  }
} else if(!strcmp("45",input)) {
  printf("\n    Removendo playlist...");
  printf("\n    Insira numero da playlist:");
  scanf("%d", &valor);
  GerenciadorPlaylist__buscar_playlist(valor, busca);
  if ((valor <= 0) || valor > Max_num__MAX_NUM){
    printf("    Valor não é permitido.\n");
  }else if (busca[0] == true && valor <= Max_num__MAX_NUM && valor>0){
    GerenciadorPlaylist__remover_playlist(valor);
    printf("    Playlist removida. Retornando ao menu inicial...\n");
  }else{
    printf("    Playlist não existe...\n");
  }
}
