MACHINE GerenciadorTag

SEES
 Tag_Ctx

VARIABLES 
 tags

INVARIANT
 tags <: TAG

INITIALISATION 
 tags := {}

OPERATIONS

 cadastrar_tag(tt) = 
 PRE
	tt : TAG & tt /: tags
 THEN 
	tags := tags \/ { tt }
 END;

 remover_tag(tt) = 
 PRE 
	tt : TAG & tt : tags
 THEN 
	tags := tags - { tt }
 END;

 rr <-- buscar_tag(tt) =
 PRE
	tt : TAG
 THEN
	IF tt : tags THEN
		rr := TRUE
	ELSE
		rr := FALSE
	END
 END

 //tt <-- listar_tags = tt := tags*/

END
