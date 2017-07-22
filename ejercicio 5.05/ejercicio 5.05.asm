* suma s=p+q-r

	ORG	$0000
s	RMB	1
p	DB	05
q	DB	03
r	DB	02

	ORG	$C000
main	CLRA
	LDAA	p
	ADDA	q
	SUBA	r
	STAA	s
fin 	BRA	fin

