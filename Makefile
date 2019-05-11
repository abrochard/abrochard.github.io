# build and deploy the public folder for [repo]
define deploy
	rm -rf $(1)
	mkdir $(1)
	cd repos/$(1) && git reset --hard master && git pull && npm install && make
	cp -r repos/$(1)/public/* $(1)/.
	git add $(1)/
	git status
endef

.PHONY: spotify-gaming
spotify-gaming: repos/spotify-gaming
	$(call deploy,$@)

.PHONY: game-timeline
game-timeline: repos/game-timeline
	$(call deploy,$@)

.PHONY: KarmaJS
KarmaJS: repos/KarmaJS
	$(call deploy,$@)

repos/game-timeline: repos
	git clone https://github.com/abrochard/game-timeline.git repos/game-timeline

repos/spotify-gaming: repos
	git clone https://github.com/abrochard/spotify-gaming.git repos/spotify-gaming

repos/KarmaJS: repos
	git clone https://github.com/abrochard/KarmaJS.git repos/KarmaJS

repos:
	mkdir repos

.PHONY: clean
clean:
	rm -rf KarmaJS game-timeline spotify-gaming
	rm -rf repos

.PHONY: all
all: spotify-gaming game-timeline KarmaJS
