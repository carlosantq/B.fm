MACHINE GerenciadorArtista
SETS 
 ARTISTA = {Coldplay, Arctic_Monkeys, Imagine_Dragons}
VARIABLES artistas
INVARIANT
 artistas <: ARTISTA
INITIALISATION 
 artistas := {}
OPERATIONS
  cadastrar(aa) =
  PRE 
	aa:ARTISTA
  THEN artistas := artistas \/ {aa}
  END;

  remover(aa) =
  PRE
	aa:ARTISTA
  THEN artistas := artistas - {aa}
  END
END

