* numero mayor, igual o menor que 128

	ORG	$C000
	LDAA	$00
	CMPA	#128

	BHI	mayor
	BLO	menor

	LDAA	#'=
	STAA	$01

fin	BRA	fin

mayor	LDAA	#'>
	STAA	$01
	BRA	fin

menor	LDAA	#'<
	STAA	$01
	BRA	fin