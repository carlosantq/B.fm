MACHINE GerenciadorTag

SEES
 Tag_Ctx,
 Usuario_Ctx

VARIABLES 
 tags, 
 criador

INVARIANT
 tags <: TAG & criador : tags --> USUARIO

INITIALISATION 
 tags := {}; criador := {}

OPERATIONS

 cadastrar_tag(tt, uu) = 
 PRE
	tt : TAG & tt /: tags & uu : USUARIO
 THEN 
	tags := tags \/ { tt }; criador := criador \/ { tt |-> uu }
 END;

 remover_tag(tt) = 
 PRE 
	tt : TAG & tt : tags
 THEN 
	tags := tags - { tt }; criador := criador - { tt |-> criador(tt) }
 END;

 tt <-- listar_tags = tt := tags;

 remover_todas_tags_do_usuario(uu) = 
 PRE 
	uu : USUARIO
 THEN 
	VAR tagsDoUsuario IN
		tagsDoUsuario := criador |> { uu };
		tags := tags - dom(tagsDoUsuario);
		criador := criador - tagsDoUsuario
	END
 END;
	
 modificar_nome_da_tag(velhoNomeTag, novoNomeTag) = 
 PRE 
	velhoNomeTag : TAG & velhoNomeTag : tags & novoNomeTag : TAG & novoNomeTag /: tags
 THEN 
	VAR criadorTag IN 
		criadorTag := criador(velhoNomeTag);

		// Deletando tag antiga
		tags := tags - { velhoNomeTag }; criador := criador - { velhoNomeTag |-> criador(velhoNomeTag) };

		// Criando tag nova
		tags := tags \/ { novoNomeTag }; criador := criador \/ { novoNomeTag |-> criadorTag }
	END
 END;

 uu <-- consultar_usuario_criador_da_tag (tt) =
 PRE 
	tt : tags
 THEN
	uu := criador(tt)
 END;

 tt <-- consultarTagsDoUsuario(uu) =
 PRE 
	uu : USUARIO
 THEN
	tt := dom(criador |> { uu })
 END
END
