main:
		flex prog1.l
		gcc lex.yy.c
bison:
		bison -d prog1.y
		flex prog1.l
		gcc lex.yy.c prog1.tab.c
run:
	a < input.txt > output.txt