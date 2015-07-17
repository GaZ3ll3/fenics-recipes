UNAME := $(shell uname)

all: build install

conda:
	
	conda install -y conda-build
	conda install -y binstar
    
build: build-eigen3 build-ufl build-fiat build-instant build-petsc build-petsc4py build-ffc

build-eigen3: conda
	conda build eigen3 --python 27
    
build-ufl: conda
	conda build ufl --python 27
    
build-fiat: conda
	conda build fiat --python 27

build-instant: conda
	conda build instant --python 27
    
build-petsc: conda
ifeq ($(UNAME) ,Linux)
	conda build petsc --python 27
else
	bash petsc/build-osx.sh
endif

build-petsc4py: conda
ifeq ($(UNAME), Linux)
	conda build petsc4py --python 27
else
	bash petsc4py/build-osx.sh
endif
    
build-ffc: build-fiat build-ufl build-instant
	conda build ffc --python 27

build-dolfin: 
    
install: build
	conda install eigen3 --use-local
	conda install ufl --use-local
	conda install fiat --use-local
	conda install instant --use-local
	conda install ffc --use-local
