MACHINE GerenciadorArtista

SEES
 Artista_Ctx

VARIABLES 
 artistas

INVARIANT
 artistas <: ARTISTA

INITIALISATION 
 artistas := {}

OPERATIONS

  cadastrar_artista(aa) =
  PRE 
	aa : ARTISTA & aa /: artistas
  THEN 
	artistas := artistas \/ {aa}
  END;

  remover_artista(aa) =
  PRE
	aa : ARTISTA
  THEN 
	artistas := artistas - { aa }
  END;

 //aa <-- listar_artistas =  aa := artistas

END



