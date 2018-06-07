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
	aa <: albuns
 THEN
	albuns := albuns - aa
 END;

 /* Lista todos os albuns */
 aa <-- listar_albuns = aa := albuns 

END

