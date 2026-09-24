TARGET := build/cobolfetch
SRC := main.cob

.PHONY: all clean run

all: $(TARGET)

$(TARGET): $(SRC)
	mkdir -p build
	gcobol $(SRC) -o $(TARGET)

run: $(TARGET)
	./$(TARGET)

clean:
	rm -rf build