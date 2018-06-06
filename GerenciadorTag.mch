MACHINE GerenciadorTag

SEES
 Tag_Ctx,
 Usuario_Ctx

VARIABLES tags, criador

INVARIANT
 tags <: TAG & criador : tags --> USUARIO

INITIALISATION tags := {}; criador := {}

OPERATIONS
 criarTag(nomeTag, usuario) = 
	PRE nomeTag : TAG & nomeTag /: tags & usuario : USUARIO
	THEN tags := tags \/ { nomeTag }; criador := criador \/ { nomeTag |-> usuario }
	END;

 deletarTag(nomeTag) = 
	PRE nomeTag : TAG & nomeTag : tags
	THEN tags := tags - { nomeTag }; criador := criador - { nomeTag |-> criador(nomeTag) }
	END;

 deletarTodasTagsDoUsuario(usuario) = 
	PRE usuario : USUARIO
	THEN 
		VAR tagsDoUsuario IN
			tagsDoUsuario := criador |> { usuario };
			tags := tags - dom(tagsDoUsuario);
			criador := criador - tagsDoUsuario
		END
	END;
	
 todasAsTags <-- listarTags = todasAsTags := tags;

 modificarTag(novoNomeTag, velhoNomeTag) = 
	PRE velhoNomeTag : TAG & velhoNomeTag : tags & novoNomeTag : TAG & novoNomeTag /: tags
	THEN 
		VAR criadorTag IN 
			criadorTag := criador(velhoNomeTag);

			// Deletando tag antiga
			tags := tags - { velhoNomeTag }; criador := criador - { velhoNomeTag |-> criador(velhoNomeTag) };
			// Criando tag nova
			tags := tags \/ { novoNomeTag }; criador := criador \/ { novoNomeTag |-> criadorTag }
		END
	END;

 usuarioCriadorDaTag <-- consultarUsuarioCriadorDaTag(tag) =
	PRE tag : tags
	THEN
		usuarioCriadorDaTag := criador(tag)
	END;

 tagsDoUsuario <-- consultarTagsDoUsuario(usuario) =
	PRE usuario : USUARIO
	THEN
		tagsDoUsuario := dom(criador |> { usuario })
	END
END
