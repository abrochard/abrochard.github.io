update:
	git pull
	git submodule update --recursive --remote
	git commit -a -m 'updating'

clone:
	git submodule update --init --recursive

.PHONY: clean
clean:
	rm -rf KarmaJS game-timeline spotify-gaming

.PHONY: all
all: clean clone
