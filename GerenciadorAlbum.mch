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

 cadastrar_album(aa) =
 PRE
 	aa:ALBUM & aa /: albuns
 THEN
 	albuns := albuns \/ {aa}
 END;

 /* Remove um album apos remover todas as musicas dele */
 remover_album(aa) =
 PRE
	aa : albuns
 THEN
	VAR xx IN
		xx := { aa } <| albunsMusicas;
		albunsMusicas := albunsMusicas - xx
	END;
	albuns := albuns - { aa }
 END;

 /* Lista todos os albuns */
 aa <-- listar_albuns = aa := albuns; 

 cadastrar_musica_em_album(aa, mm) =
 PRE
 	aa : albuns & mm : MUSICA & mm /: ran(albunsMusicas)
 THEN
	albunsMusicas := albunsMusicas \/ { aa |-> mm }
 END;

 remover_musica_de_album(aa, mm) = 
 PRE
	aa : albuns & mm : MUSICA & mm : albunsMusicas[{ aa }]
 THEN
	albunsMusicas := albunsMusicas - { aa |-> mm }
 END;

 mm <-- consultar_musicas_do_album(aa) =
 PRE
 	aa : albuns
 THEN
	mm := albunsMusicas[{ aa }]
 END;

 aa <-- consultar_album_da_musica(mm) =
 PRE
	mm : MUSICA
 THEN
	aa := dom(albunsMusicas |> { mm })
 END;
 
 remover_todas_musicas_do_album(aa) =
 PRE
	aa:albuns
 THEN
 	VAR xx IN
		xx := {aa} <| albunsMusicas;
		albunsMusicas := albunsMusicas - xx
	END
 END
END

