.PHONY: spotify-gaming
spotify-gaming: repos
	rm -rf spotify-gaming
	mkdir spotify-gaming
	cd repos/spotify-gaming && git pull && make
	cp -r repos/spotify-gaming/public/* spotify-gaming/.

repos:
	mkdir repos
	git clone https://github.com/abrochard/spotify-gaming.git repos/spotify-gaming

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
