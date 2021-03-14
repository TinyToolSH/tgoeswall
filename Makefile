.POSIX:

prefix = /usr/local

all:
	@echo "all target"

install:
	@echo "Installing tgoeswall..."
	install -m 555 tgoeswall $(DESTDIR)$(prefix)/bin/tgoeswall
	install -m 555 tgoeswallctrl $(DESTDIR)$(prefix)/bin/tgoeswallctrl
	install -D gtgoeswall.conf /etc/tinytools
	install tgoeswall.service /etc/systemd/user/
	install tgoeswall.timer /etc/systemd/user/
	@echo "done!"

clean:
	@echo "Cleaning tgoeswall"

distclean: clean

uninstall:
	@echo "Uninstall tgoeswall"
	systemctl --disable disable tgoeswall
	rm -f $(DESTDIR)$(prefix)bin/tgoeswall
	rm -f $(DESTDIR)$(prefix)bin/tgoeswallctrl
	rm -f /etc/systemd/user/tgoeswall.service
	rm -f /etc/systemd/user/tgoeswall.timer
	@echo "done!"

.PHONY: all install clean distclean uninstall
