########       General C/C++ Makefile       ########
#####                                        #####
#####      Makefile produit et ecrit par     #####
#####        Thomas Laferriere pour          #####
#####           Hackatown - 2018             #####
#####                                        #####
#####      Inspire de Simon Barrette &       #####
#####            Jerome Collin -             #####
##### Polytechnique Montreal (www.polymtl.ca)#####
##################################################

# Ce Makefile vous permet de compiler des projets
# Linux ou Unix, en utilisant l'outil GCC (ou 
# n'importe quel outil qui vous convient). 
# Ce Makefile supporte C & C++


#####      Details specifique a la cible       #####
#####  Vous devez les adapter a votre projet   #####

# Nom de votre projet
# (utilisez un seul mot, exemple: 'monprojet')
PROJECTNAME=test

# Fichiers sources
# Utilisez le suffixe .cpp pour les fichiers C++
# Listez tous les fichiers a compiler, separes par
# un espace. exemple: 'tp1.c tp2.cpp':
PRJSRC= test.cpp

# Inclusions additionnels (ex: -I/path/to/mydir)
INC=

# Libraires a lier (ex: -lmylib)
LIBS=

# Niveau d'optimization
# Utilisez s (size opt), 1, 2, 3 ou 0 (off)
# https://goo.gl/Jxwdro
OPTLEVEL=0



####################################################
#####         Configuration terminee           #####
#####                                          #####
#####  Le reste de cette section contient les  #####
##### details d'implementation vous permettant #####
##### de mieux comprendre le fonctionnement de ##### 
#####   ce Makefile en vue de sa modification  #####
####################################################



####### variables #######

# C compiler used
# Compilateur C utilise
CC=gcc
#If compiling C++, select compiler here and flags
CXX=g++
#pour copier le contenu d'un fichier objet vers un autre
OBJCOPY=
#pour supprimer les fichiers lorsque l'on appel make clean
REMOVE=rm -f



####### Options de compilation #######

# Flags pour le compilateur en C
CFLAGS=-W -Wall -g -O$(OPTLEVEL)                                        

# Flags pour le compilateur en C++
CXXFLAGS=-W -Wall -fno-exceptions -O$(OPTLEVEL)

# Linker pour lier les librairies utilisees
LDFLAGS=-Wl,-Map,$(TRG).map



####### Cible (Target) #######

#Nom des cibles par defaut
TRG=$(PROJECTNAME).out

#Internal variables: \
$@ 	Le nom de la cible \
$< 	Le nom de la première dépendance \
$^ 	La liste des dépendances \
$? 	La liste des dépendances plus récentes que la cible \
$* 	Le nom du fichier sans suffixe

####### Definition de tout les fichiers objets #######

# Cette fonction permet de differencier les fichiers .c
# des fichiers .cpp
# Fichier C
CFILES=$(filter %.c, $(PRJSRC))
# Fichier C++
CPPFILES=$(filter %.cpp, $(PRJSRC))

# Liste de tout les fichiers objet que nous devons creer
OBJDEPS=$(CFILES:.c=.o) \
	$(CPPFILES:.cpp=.o)
	
# Pour plus d'information sur cette section, consulter :
# http://bit.ly/257R53E	
# Les fonctions $(filter patternâ€¦,text) &
# $(patsubst pattern,replacement,text) sont pertinentes
	


####### Creation des commandes du Makefile ####### 

# Creation des cibles Phony (Phony Target)
# En plus de la commande make qui permet de compiler
# votre projet, vous pouvez utilisez les commandes
# make all, make install et make clean
.PHONY: all install clean 

# Make all permet simplement de compiler le projet
#
all: $(TRG)

# Implementation de la cible
$(TRG): $(OBJDEPS)
	$(CC) $(LDFLAGS) -o $(TRG) $(OBJDEPS) \
	-lm $(LIBS)

# Production des fichiers object
# De C a objet
%.o: %.c
	$(CC) $(CFLAGS) -c $<
# De C++ a objet
%.o: %.cpp
	$(CXX) $(CFLAGS) $(CXXFLAGS) -c $<

# Verification des dependances (header dependencies)
-include *.d

# Pour plus d'information sur cette section, consulter:
# http://bit.ly/2580FU8

# Make clean permet d'effacer tout les fichiers generes
# lors de la compilation
clean:
	$(REMOVE) $(TRG) $(TRG).map $(OBJDEPS) $(HEXTRG) *.d

# Make mrproper permet d'effacer tous les generes lors 
# de la compilation et l'executable final.
mrproper: clean
	rm -rf $(TRG)

# Pour plus d'information sur les phony target, consulter:
# http://bit.ly/1WBQe61

# De plus, pour mieux comprendre les makefiles et 
# leur fonctionnement, consulter la documentation de GNU Make:
# http://bit.ly/23Vpk8s

# Finalement, ce tutoriel en ligne constitut une bonne 
# introduction au Makefile:
# http://bit.ly/1XvxsN3

#####                    EOF                   #####
