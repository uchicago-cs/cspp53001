all:
	wget --relative --no-parent --no-host-directories --recursive http://www.classes.cs.uchicago.edu/archive/2012/fall/53001-1/
	pandoc --from=html --to=org \
	  $(find archive -name '*.html') --output=2012fall.org

%.org: archive/2012/fall/53001-1/%.html
	pandoc --from=html --to=org $^ --output=$@
