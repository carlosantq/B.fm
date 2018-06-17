MACHINE GerenciadorTag

SEES
 Tag_Ctx

VARIABLES
 tags

INVARIANT
 tags <: TAG

INITIALISATION
 tags := { TAG_DUMMY }

OPERATIONS

 cadastrar_tag(tt) =
 PRE
	tt : TAG & tt /: tags
 THEN
	tags := tags \/ { tt }
 END;

 remover_tag(tt) =
 PRE
	tt : TAG & tt : tags & tt /= TAG_DUMMY
 THEN
	tags := tags - { tt }
 END;

 rr <-- buscar_tag(tt) =
 PRE
	tt : TAG & tt /= TAG_DUMMY
 THEN
	IF tt : tags THEN
		rr := TRUE
	ELSE
		rr := FALSE
	END
 END;

 tt <-- listar_tags =
 ANY
	lista WHERE lista : TAG --> BOOL & dom(lista |> { TRUE }) = tags
THEN
	tt := lista
 END

END
