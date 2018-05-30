MACHINE GerenciadorArtista
SETS 
 NOMES = {empty, Coldplay, Arctic_Monkeys, Imagine_Dragons}
CONSTANTS ARTISTA
PROPERTIES
 ARTISTA = 0..3
VARIABLES artistas, nomes_artistas
INVARIANT
 artistas <: ARTISTA & nomes_artistas : ARTISTA --> NOMES
INITIALISATION 
 artistas := {}; nomes_artistas := ARTISTA * {empty}
OPERATIONS
  cadastrar(aa, nn) =
  PRE 
	aa:ARTISTA & nn:NOMES & nn /: {empty} & nn /: ran(nomes_artistas)
  THEN
	BEGIN 
		artistas := artistas \/ {aa};
		nomes_artistas(aa) := nn
	END
  END;

  remover(aa) =
  PRE
	aa:ARTISTA
  THEN 
  	artistas := artistas - {aa};
	nomes_artistas(aa) := empty
  END;

  nn <-- consultar_nome(aa) = 
  PRE aa : ARTISTA
  THEN nn := nomes_artistas(aa) 
  END

END

