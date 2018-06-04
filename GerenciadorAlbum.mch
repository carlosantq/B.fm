MACHINE GerenciadorAlbum
SEES
 Album_Ctx,
 Musica_Ctx
VARIABLES
 albuns,
 albunsMusicas
INVARIANT
 albuns <: ALBUM & albunsMusicas : albuns --> MUSICA
INITIALISATION
 albuns := {} || albunsMusicas := {}
OPERATIONS
 cadastrar_album(aa) =
 PRE
 	aa:ALBUM
 THEN
 	albuns := albuns \/ {aa};
	albunsMusicas := albunsMusicas \/ {aa |-> empty}
 END;

 cadastrar_musica_album(aa, mm) =
 PRE
 	aa:albuns & mm:MUSICA & mm/:{empty} & mm/:ran(albunsMusicas)
 THEN
	albunsMusicas := albunsMusicas \/ {aa |-> mm};
	albunsMusicas := albunsMusicas - {aa |-> empty}
 END
END

