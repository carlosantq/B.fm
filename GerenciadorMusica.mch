MACHINE GerenciadorMusica
SEES 
 Musica_Ctx
VARIABLES
 musicas
INVARIANT
 musicas <: MUSICA
INITIALISATION
 musicas := {}
OPERATIONS
 cadastrar_musica(mm) =
 PRE
	mm: MUSICA
 THEN musicas := musicas \/ {mm}
 END;

 remover_musica(mm) =
 PRE
 	mm: MUSICA
 THEN musicas := musicas - {mm}
 END
END


