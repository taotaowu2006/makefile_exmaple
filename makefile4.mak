
SRC_PATH = ./src
INC_PATH = ./inc
OBJ_PATH = ./obj

OBJ = main.o module.o 

vpath %.c    $(SRC_PATH)
vpath %.h    $(INC_PATH)
vpath %.o    $(OBJ_PATH)

CFLAGS = -I./inc 


module_test: $(OBJ) |$(OBJ_PATH)

	cc   $(addprefix $(OBJ_PATH)/,$(OBJ))  -o module_test 


main.o: main.c   module.h  |$(OBJ_PATH)
	cc -c $(CFLAGS)  $< -o $(OBJ_PATH)/$@
module.o: module.c    |$(OBJ_PATH)
	cc -c $(CFLAGS) $< -o $(OBJ_PATH)/$@
 
$(OBJ_PATH): 
	-mkdir obj
	
.PHONY: clean
clean:
	-rm OBS $(addprefix $(OBJ_PATH)/,$(OBJ))

	
