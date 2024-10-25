ifeq ($(OS),Windows_NT)
    LIBS=-liphlpapi -lws2_32
else # else empty as linux dosent need extra lib
    LIBS=
endif

all: outputs outputs/quickcmd

outputs:
	mkdir outputs

outputs/quickcmd: main.c cmd_functions.c
	gcc -Wall -Wextra -g -o $@ $^ $(LIBS)

run: outputs/quickcmd
	@echo "Running the program..."
	@outputs/quickcmd

clean:
	@if [ "$(OS)" = "Windows_NT" ]; then \
		rmdir /s /q outputs; \
	else \
		rm -rf outputs; \
	fi