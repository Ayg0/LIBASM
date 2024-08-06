LIBASM = ../libasm.a
SRC = $(wildcard *Tests.c)
LIB = $(LIBASM) jtest.a
EXE = $(SRC:.c=)

# Default target
all: $(EXE)

# Compile each test file into an executable
$(EXE): %: %.c $(LIB)
	gcc -g -z noexecstack -o $@ $< $(LIB)

# Build libasm
$(LIBASM):
	make -C ..

clean:
	make -C .. clean
	rm -f $(EXE)

# Rebuild LibAsm
reLIB:
	make -C .. re
# Rebuild everything
re: reLIB clean all

# Run all the executables
run: $(EXE)
	@for exe in $(EXE); do \
		echo "Running $$exe"; \
		./$$exe; \
	done
# Run all the executables
minimal: $(EXE)
	@for exe in $(EXE); do \
		echo -n "Running $$exe:\n=> "; \
		./$$exe 2>&1 | grep "SUCCESS RATE:"; \
	done

.PHONY: run re clean all minimal