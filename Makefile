magisk-localpolicy.zip: customize.sh module.prop
	zip -Dr - META-INF/ $^ > $@
