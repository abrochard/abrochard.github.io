# build and deploy the public forlder for [repo]
define deploy
	rm -rf $(1)
	mkdir $(1)
	cd repos/$(1) && git reset --hard master && git pull && npm install && make
	cp -r repos/$(1)/public/* $(1)/.
endef

.PHONY: spotify-gaming
spotify-gaming: repos
	$(call deploy,$@)

.PHONY: game-timeline
game-timeline: repos
	$(call deploy,$@)

repos:
	mkdir repos
	git clone https://github.com/abrochard/game-timeline.git repos/game-timeline
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

# .PHONY: all
# all: clean clone

.PHONY: all
all: spotify-gaming game-timeline
	git add spotify-gaming/
	git add game-timeline/
	git commit -m 'updating'
