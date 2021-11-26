###############################################################################
########################### Parametros de Projeto #############################
###############################################################################

# TODO: altere a extensão dos arquivos (c ou cpp)
EXT = cpp
# TODO: altere a lista de forma que contenha todos os arquivos .cpp
#       do seu projeto (sem a extensão), que deve estar no diretório 
#       src
SRCS = $(patsubst %,%.$(EXT),main matching_solver)
OBJS = $(patsubst %,build/%.o,$(basename $(SRCS)))

###############################################################################
########################### Parametros de Ambiente ############################
###############################################################################

CC = gcc
CXX = g++
CCFLAGS = -Wall
CXXFLAGS = -Wall -g
CPPFLAGS = -Iinclude/

###############################################################################
################################ Executáveis ##################################
###############################################################################

all: bin/matching_solver

ifeq ($(EXT), c)
bin/matching_solver: $(OBJS)
	@echo "+ Compilando programa \"$@\""
	@$(CC) $(CCFLAGS) $(OBJS) -o bin/matching_solver
else
bin/matching_solver: $(OBJS)
	@echo "+ Compilando programa \"$@\""
	@$(CXX) $(CXXFLAGS) $(OBJS) -o bin/matching_solver
endif

###############################################################################
################################## Objetos ####################################
###############################################################################

ifeq ($(EXT), c)
build/%.o: src/%.c
	@echo "- Compilando objeto \"$@\""
	@$(CC) $(CPPFLAGS) $(CCFLAGS) -c $< -o $@
else
build/%.o: src/%.cpp
	@echo "- Compilando objeto \"$@\""
	@$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@
endif

###############################################################################
################################# Auxiliares ##################################
###############################################################################

clean:
	rm -f bin/* $(OBJS)
