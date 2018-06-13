MACHINE GerenciadorAlbum

SEES
 Album_Ctx

VARIABLES
 albuns

INVARIANT
 albuns <: ALBUM

INITIALISATION
 albuns := {}

OPERATIONS

 cadastrar_album(aa) =
 PRE
 	aa : ALBUM & aa /: albuns
 THEN
 	albuns := albuns \/ { aa }
 END;

 remover_album(aa) =
 PRE
	aa : ALBUM
 THEN
	albuns := albuns - {aa}
 END;

 rr <-- buscar_album(aa) =
 PRE
	aa : ALBUM
 THEN
	IF aa : albuns THEN
		rr := TRUE
	ELSE
		rr := FALSE
	END
 END

 /* Lista todos os albuns */
 //aa <-- listar_albuns = aa := albuns 

END

