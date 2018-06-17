MACHINE GerenciadorMusica

SEES
 Musica_Ctx

VARIABLES
 musicas

INVARIANT
 musicas <: MUSICA

INITIALISATION
 musicas := {MUSICA_DUMMY}

OPERATIONS

 cadastrar_musica(mm) =
 PRE
	mm : MUSICA & mm /: musicas
 THEN
	musicas := musicas \/ { mm }
 END;

 remover_musica(mm) =
 PRE
 	mm : MUSICA & mm : musicas & mm /= MUSICA_DUMMY
 THEN
	musicas := musicas - { mm }
 END;

 rr <-- buscar_musica(mm) =
 PRE
	mm : MUSICA & mm : musicas & mm /= MUSICA_DUMMY
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
