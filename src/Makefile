CC     = g++ -std=c++11 -Wwrite-strings
CXX    = g++ -std=c++11 -Wwrite-strings
LEX    = flex
YACC   = bison -y
YFLAGS = -d

default: lexer

lexer: lexer.yy.c
	gcc main.c lexer.yy.c -ll -o atlas
	./atlas

lexer.yy.c: definition.l
	flex -o lexer.yy.c definition.l

clean:
	rm -f lexer.yy.c
	rm -f atlas

