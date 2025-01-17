# Common Makefile for <pyModule>:

MODDIR = $(MAIN_DIR)/mod_cs
OBJDIR = $(MAIN_DIR)/obj_cs
LIBDIR = $(MAIN_DIR)/lib_cs

#      ******************************************************************
#      *                                                                *
#      * Include the file describing the compiler settings.             *
#      *                                                                *
#      ******************************************************************

MAKE = make

COMPILERS = $(MAIN_DIR)/config.mk
ifneq ($(MAKECMDGOALS),clean)
include ${COMPILERS}
endif

#      ******************************************************************
#      *                                                                *
#      * Redefine .SUFFIXES to be sure all the desired ones are         *
#      * included.                                                      *
#      *                                                                *
#      ******************************************************************

.SUFFIXES: .o .f .F .f90 .F90

#      ******************************************************************
#      *                                                                *
#      * Arguments of make clean.                                       *
#      *                                                                *
#      ******************************************************************

MAKE_CLEAN_ARGUMENTS = *~ *.o *.mod *.il *.stb c_* *.so

#      ******************************************************************
#      *                                                                *
#      * Compiler flags to compile the sources.                         *
#      * The macro's ADDITIONAL_FF90_FLAGS and ADDITIONAL_CC_FLAGS      *
#      * make it possible that every subdirectory adds its own specific *
#      * compiler flags, if necessary.                                  *
#      *                                                                *
#      ******************************************************************

FF90_ALL_FLAGS = -I$(MODDIR) -I. \
		$(CGNS_INCLUDE_FLAGS) \
		$(FF90_FLAGS) \
		$(PETSC_INCLUDE_FLAGS) \
		-DUSE_COMPLEX

CC_ALL_FLAGS = -I$(MODDIR) -I. \
		$(CGNS_INCLUDE_FLAGS) \
		$(C_FLAGS) \
		$(PETSC_INCLUDE_FLAGS)
