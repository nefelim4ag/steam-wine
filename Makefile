PREFIX ?= /

SRC_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

S_BIN := $(SRC_DIR)/steam-wine
S_CONF := $(SRC_DIR)/steam-wine.conf
S_PNG := $(SRC_DIR)/steam-wine.png
S_DESKTOP := $(SRC_DIR)/steam-wine.desktop

BIN := $(PREFIX)/usr/bin/steam-wine
CONF := $(PREFIX)/etc/steam-wine.conf
PNG := $(PREFIX)/usr/share/icons/hicolor/256x256/apps/steam-wine.png
DESKTOP := $(PREFIX)/usr/share/applications/steam-wine.desktop

default:  help

$(BIN): $(S_BIN)
	install -Dm755 $< $@

$(CONF): $(S_CONF)
	install -Dm644 $< $@

$(PNG): $(S_PNG)
	install -Dm644 $< $@

$(DESKTOP): $(S_DESKTOP)
	install -Dm644 $< $@

install: ## Install libvirt-autoballoon
install: $(BIN) $(CONF) $(PNG) $(DESKTOP)

uninstall: ## Delete libvirt-autoballoon
uninstall:
	@rm -fv $(BIN) $(CONF) $(PNG) $(DESKTOP)

help: ## Show help
	@grep -h "##" $(MAKEFILE_LIST) | grep -v grep | sed -e 's/\\$$//' | column -t -s '##'
