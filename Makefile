TARGET := build/cobolfetch
SRC := main.cob
LOGOS := $(wildcard logo/*.txt)
LOGO_CPY := build/logos.cpy

.PHONY: all clean run

all: $(TARGET)

$(LOGO_CPY): $(LOGOS) gen-logos.sh
	mkdir -p build
	sh gen-logos.sh $(LOGOS) > $(LOGO_CPY)

$(TARGET): $(SRC) $(LOGO_CPY)
	gcobol -I build $(SRC) -o $(TARGET)

run: $(TARGET)
	./$(TARGET)

clean:
	rm -rf build a.out
