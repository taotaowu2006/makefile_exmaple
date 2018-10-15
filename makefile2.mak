
OBJ = main.o Observer.o SheetObserver.o Subject.o
#SRC_PATH = ./src
#INC_PATH = ./inc

#vpath %.c    $(SRC_PATH)
#vpath %.h    $(INC_PATH)

VPATH = ./src : ./inc

OBS: $(OBJ)

	cc -o OBS $(OBJ)  


main.o: main.c   Observer.h SheetObserver.h
	cc -c $(CFLAGS) $< -o $@
Observer.o: Observer.c Observer.h
	cc -c $(CFLAGS) $< -o $@
SheetObserver.o: SheetObserver.c SheetObserver.h
	cc -c $(CFLAGS) $< -o $@
Subject.o: Subject.c  Subject.h
	cc -c $(CFLAGS) $< -o $@

.PHONY: clean
clean:
	-rm OBS $(OBJ)

