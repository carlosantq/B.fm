MACHINE GerenciadorUsuario

SEES 
 Usuario_Ctx

VARIABLES
 usuarios

INVARIANT
 usuarios <: USUARIO

INITIALISATION
 usuarios := {}

OPERATIONS

 cadastrar_usuario(uu) =
 PRE
	uu : USUARIO & uu /: usuarios
 THEN
	usuarios := usuarios \/ { uu }
 END;

 remover_usuario(uu) =
 PRE
 	uu : USUARIO & uu : usuarios
 THEN
	usuarios := usuarios - { uu }
 END;

 uu <-- listar_usuarios = uu := usuarios

END


