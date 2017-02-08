update:
	git submodule update --recursive --remote

clone:
	git submodule update --init --recursive

.PHONY: clean
clean:
	rm -rf KarmaJS game-timeline spotify-gaming

.PHONY: all
all: clean clone
