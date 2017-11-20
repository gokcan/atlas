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

CC     = g++
CXX    = g++
LEX    = flex
YACC   = bison -y
YFLAGS = -d
PROGRAM = atlas

OBJECTS = definition.o parser.o $(PROGRAM).o

all: atlas

atlas: $(OBJECTS)
scan.o: definition.l parser.c
parse.o: parser.y
$(PROGRAM).o: $(PROGRAM).c


clean:
	-rm -f $(OBJECTS)
	-rm -f y.tab.h
	-rm -f parse.c
	-rm -f scan.c
	-rm -f $(PROGRAM)