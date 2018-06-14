MACHINE GerenciadorArtista

SEES
 Artista_Ctx

VARIABLES 
 artistas

INVARIANT
 artistas <: ARTISTA

INITIALISATION 
 artistas := {}

OPERATIONS

 cadastrar_artista(aa) =
 PRE 
    aa : ARTISTA & aa /: artistas
 THEN 
    artistas := artistas \/ {aa}
 END;

 remover_artista(aa) =
 PRE
    aa : ARTISTA
 THEN 
    artistas := artistas - { aa }
 END;

 rr <-- buscar_artista(aa) =
 PRE
    aa : ARTISTA
 THEN
    IF aa : artistas THEN
        rr := TRUE
    ELSE
        rr := FALSE
    END
 END;

 aa <-- listar_artistas =
 ANY lista WHERE lista : ARTISTA --> BOOL & dom(lista |> {TRUE}) = artistas THEN
    aa := lista
 END 

END



