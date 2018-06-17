MACHINE GerenciadorAlbum

SEES
 Album_Ctx

VARIABLES
 albuns

INVARIANT
 albuns <: ALBUM

INITIALISATION
 albuns := { ALBUM_DUMMY }

OPERATIONS

 cadastrar_album(aa) =
 PRE
 	aa : ALBUM & aa /: albuns
 THEN
 	albuns := albuns \/ { aa }
 END;

 remover_album(aa) =
 PRE
	aa : ALBUM & aa : albuns & aa /= ALBUM_DUMMY
 THEN
	albuns := albuns - { aa }
 END;

 rr <-- buscar_album(aa) =
 PRE
	aa : ALBUM & aa /= ALBUM_DUMMY
 THEN
	IF aa : albuns THEN
		rr := TRUE
	ELSE
		rr := FALSE
	END
 END;

 aa <-- listar_albuns =
 ANY
	lista WHERE lista : ALBUM --> BOOL & dom(lista |> { TRUE }) = albuns
 THEN
 	aa := lista
 END

END
