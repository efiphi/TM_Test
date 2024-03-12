CC=gcc
AR=ar
OBJECTS_MAIN=main.o
OBJECTS_LIB=mylib.o
OBJECTS_CAL=calculator.o

FLAGS= -Wall -g

all: libmylib.so libmylib.a calculator.so calculator.a progmains progmaind 
progmains: $(OBJECTS_MAIN) libmylib.a calculator.a
	$(CC) $(FLAGS) -o progmains $(OBJECTS_MAIN) libmylib.a calculator.a
progmaind: $(OBJECTS_MAIN)
	$(CC) $(FLAGS) -o progmaind $(OBJECTS_MAIN) ./libmylib.so ./calculator.so
libmylib.so: $(OBJECTS_LIB)
	$(CC) -shared -o libmylib.so $(OBJECTS_LIB)
libmylib.a: $(OBJECTS_LIB)
	$(AR) -rcs libmylib.a $(OBJECTS_LIB)	
mylib.o: mylib.c mylib.h
	$(CC) $(FLAGS) -c mylib.c
main.o: main.c mylib.h  
	$(CC) $(FLAGS) -c main.c 
calculator.so: $(OBJECTS_CAL)
	$(CC) -shared -o calculator.so $(OBJECTS_CAL)
calculator.a: $(OBJECTS_CAL)
	$(AR) -rcs calculator.a $(OBJECTS_CAL)	
calculator.o: calculator.c calculator.h
	$(CC) $(FLAGS) -c calculator.c




.PHONY: clean all

clean:
	rm -f *.o *.a *.so progmains progmaind
