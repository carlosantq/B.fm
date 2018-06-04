MACHINE GerenciadorAlbum
SEES
 Album_Ctx,
 Musica_Ctx
VARIABLES
 albuns,
 albunsMusicas
INVARIANT
 albuns <: ALBUM & albunsMusicas : albuns <-> MUSICA
INITIALISATION
 albuns := {} || albunsMusicas := {}
OPERATIONS

 /* Cadastra um album */
 cadastrar_album(aa) =
 PRE
 	aa:ALBUM
 THEN
	IF aa/:albuns
	THEN
 		albuns := albuns \/ {aa}
	END
 END;

 /* Remove um album apos remover todas as musicas dele */
 remover_album(aa) =
 PRE
	aa:albuns
 THEN
	VAR x IN
		x := {aa} <| albunsMusicas;
		albunsMusicas := albunsMusicas - x
	END;
	albuns := albuns - {aa}
 END;

 /* Cadastra uma musica de um album */
 cadastrar_musica_album(aa, mm) =
 PRE
 	aa:albuns & mm:MUSICA & mm/:ran(albunsMusicas)
 THEN
	albunsMusicas := albunsMusicas \/ {aa |-> mm}
 END;

 /* Remove uma musica de um album */
 remover_musica_album(aa, mm) = 
 PRE
	aa:albuns & mm:MUSICA & mm:albunsMusicas[{aa}]
 THEN
	albunsMusicas := albunsMusicas - {aa |-> mm}
 END;

 /* Consulta as musicas de um album */
 mm <-- consultar_musicas_album(aa) =
 PRE
 	aa:albuns
 THEN
	mm := albunsMusicas[{aa}]
 END;

 /* Consulta o album no qual uma dada musica faz parte */
 aa <-- consultar_album_musica(mm) =
 PRE
	mm:MUSICA
 THEN
	aa := dom(albunsMusicas |> {mm})
 END;
 
/* Remove todas as musicas de um album */
 remover_todas_musicas_album(aa) =
 PRE
	aa:albuns
 THEN
 	VAR x IN
		x := {aa} <| albunsMusicas;
		albunsMusicas := albunsMusicas - x
	END
 END
END

