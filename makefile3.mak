

SRC_PATH = ./src
INC_PATH = ./inc
OBJ_PATH = ./obj

OBJ = main.o module.o 

vpath %.c    $(SRC_PATH)
vpath %.h    $(INC_PATH)
vpath %.o    $(OBJ_PATH)

CFLAGS = -I./inc 


OBS: $(OBJ)

	cc   $(addprefix $(OBJ_PATH)/,$(OBJ))  -o OBS 


main.o: main.c   module.h
	cc -c $(CFLAGS)  $< -o $(OBJ_PATH)/$@
module.o: module.c  
	cc -c $(CFLAGS) $< -o $(OBJ_PATH)/$@
	
.PHONY: clean
clean:
	-rm OBS $(addprefix $(OBJ_PATH)/,$(OBJ))

	
