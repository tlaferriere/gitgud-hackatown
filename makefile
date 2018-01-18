#Some useful variables:
#If compiling C, select compiler here and flags
CC=gcc
CFLAGS=-W -Wall -ansi -pedantic
#If compiling C++, select compiler here and flags
CXX=g++
CXXFLAGS=
#Linker flags
LDFLAGS=
#Ouptut executable name
EXEC=hello
#Main source dependencies ()
maindeps=$(EXEC).h

#Internal variables: \
$@ 	Le nom de la cible \
$< 	Le nom de la première dépendance \
$^ 	La liste des dépendances \
$? 	La liste des dépendances plus récentes que la cible \
$* 	Le nom du fichier sans suffixe

all: $(EXEC)

$(EXEC): hello.o main.o
	gcc -o $@ $^ $(LDFLAGS)

#Before using generic rule, define dependencies (usually headers, so that the sources are rebuilt when headers are modified):
main.o: hello.h

#Generic rule to generate .o files from .c files:
%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)

#If files are named clean, then clean will not execute since the file would satisfy the dependency:
.PHONY: clean mrproper #<--This helps reconstruct dependencies systematically. 

clean: 
	rm -rf *.o

mrproper: clean
	rm -rf $(EXEC)
