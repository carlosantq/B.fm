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
	mm : MUSICA & mm /: musicas
 THEN
	musicas := musicas \/ { mm }
 END;

 remover_musica(mm) =
 PRE
 	mm : MUSICA & mm : musicas
 THEN
	musicas := musicas - { mm }
 END;

 rr <-- buscar_musica(mm) =
 PRE
	mm : MUSICA
 THEN
	IF mm : musicas THEN
		rr := TRUE
	ELSE
		rr := FALSE
	END
 END;

 mm <-- listar_musicas =
 ANY
	lista WHERE lista : MUSICA --> BOOL & dom(lista |> { TRUE }) = musicas
 THEN
	mm := lista
 END 

END


