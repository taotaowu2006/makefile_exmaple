
SRC_PATH = ./src
INC_PATH = ./inc
OBJ_PATH = ./obj
BIN_PATH = ./bin

OBJ = main.o module.o 

vpath %.c    $(SRC_PATH)
vpath %.h    $(INC_PATH)
vpath %.o    $(OBJ_PATH)

CFLAGS = -I./inc 


module_test: $(OBJ) |$(OBJ_PATH) $(BIN_PATH)

	cc   $(addprefix $(OBJ_PATH)/,$(OBJ))  -o $(BIN_PATH)/module_test 
	#cc   $(addprefix $(OBJ_PATH)/,$^)  -o $(BIN_PATH)/module_test 


main.o: main.c   module.h  |$(OBJ_PATH)
	cc -c $(CFLAGS)  $< -o $(OBJ_PATH)/$@
module.o: module.c    |$(OBJ_PATH)
	cc -c $(CFLAGS) $< -o $(OBJ_PATH)/$@
 
$(OBJ_PATH): 
	-mkdir obj
$(BIN_PATH):
	mkdir bin

	
.PHONY: clean
clean:
	-rm  $(BIN_PATH)/module_test $(addprefix $(OBJ_PATH)/,$(OBJ))

	
