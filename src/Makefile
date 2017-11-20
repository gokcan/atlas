# CC     = g++ -std=c++11 -Wwrite-strings
# CXX    = g++ -std=c++11 -Wwrite-strings
# LEX    = flex
# YACC   = bison -y
# YFLAGS = -d

# default: lexer

# lexer: lexer.yy.c
# 	gcc main.c lexer.yy.c -ll -o atlas
# 	./atlas

# lexer.yy.c: definition.l
# 	flex -o lexer.yy.c definition.l

# clean:
# 	rm -f lexer.yy.c
# 	rm -f atlas

CC     = gcc
CXX    = gcc
LEX    = lex
YACC   = yacc
YFLAGS = -d
PROGRAM = atlas

OBJECTS = definition.o parser.o $(PROGRAM).o

all: $(PROGRAM)

$(PROGRAM): $(OBJECTS)
definition.o: definition.l parser.c
parser.o: parser.y
$(PROGRAM).o: $(PROGRAM).c

test: input.atlas
	cat input.atlas | ./$(PROGRAM)

clean:
	-rm -f $(OBJECTS)
	-rm -f y.tab.h
	-rm -f y.tab.c
	-rm -f parser.c
	-rm -f definition.c
	-rm -f $(PROGRAM)