SRC = $(shell find . -type f -name "*.md")
PDF = $(patsubst %.md,%.pdf,$(SRC))

all: $(PDF)

%.pdf: %.md
	pandoc -f markdown+tex_math_dollars -o $@ $<

clean:
	rm -f $(PDF)

test:
	@echo $(PDF) $(SRC)

.PHONY: all clean
