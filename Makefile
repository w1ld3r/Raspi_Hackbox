all: shasums

shasums: $(addsuffix .img.sha256, $@) $(addsuffix .xz.sha256, $@)
xzimages: $(addsuffix .xz, $@)
images: $@

ifeq ($(shell id -u),0)
as_root =
else ifneq (,$(wildcard /usr/bin/fakemachine))
$(warning "This should normally be run as root, but found 'fakemachine', so using that.")
as_root = fakemachine -v $(CURDIR) -- env --chdir $(CURDIR)
else
$(error "This must be run as root")
endif

%.img.sha256: %.img
	echo $@
	sha256sum $< > $@

%.img.xz.sha256: %.img.xz
	echo $@
	sha256sum $< > $@

%.img.xz: %.img
	xz -f -k -z -9 $<

%.img.bmap: %.img
	bmaptool create -o $@ $<

%.img: %.yaml
	touch $(@:.img=.log)
	time nice $(as_root) vmdb2 --verbose --rootfs-tarball=$(subst .img,.tar.gz,$@) --output=$@ $(subst .img,.yaml,$@) --log $(subst .img,.log,$@)
	chmod 0644 $@ $(@,.img=.log)

_ck_root:
	[ `whoami` = 'root' ] # Only root can summon vmdb2 ☹

_clean_images:
	rm -f rpi4*.img
_clean_xzimages:
	rm -f rpi4*.img.xz
_clean_bmaps:
	rm -f rpi4*.img.bmap
_clean_shasums:
	rm -f rpi4*.img.sha256 rpi4*.img.xz.sha256
_clean_logs:
	rm -f rpi4*.log
_clean_tarballs:
	rm -f rpi4*.tar.gz
clean: _clean_xzimages _clean_images _clean_shasums _clean_tarballs _clean_logs _clean_bmaps

.PHONY: _ck_root _build_img clean _clean_images _clean_tarballs _clean_logs
