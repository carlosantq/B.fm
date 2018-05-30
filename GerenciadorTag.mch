MACHINE GerenciadorTag

SETS NOMES; USUARIOS = {Joao, Maria, Abbey}

VARIABLES tags, criador

INVARIANT
 tags <: NOMES & criador : tags --> USUARIOS

INITIALISATION tags := {}; criador := {}

OPERATIONS
 criarTag(nomeTag, usuario) = 
	PRE nomeTag : NOMES & nomeTag /: tags & usuario : USUARIOS
	THEN tags := tags \/ { nomeTag }; criador := criador \/ { nomeTag |-> usuario }
	END
END
