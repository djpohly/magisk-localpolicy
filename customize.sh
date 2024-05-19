( # subshell to protect global namespace, since customize.sh is sourced

custompath=
realpath=

set_custompath() {
	ui_print "- Loading custom SELinux policy:"
	for dir in /sdcard /sdcard/Documents /sdcard/Download; do
		for filename in .localpolicy.te localpolicy.te; do
			filepath="$dir/$filename"
			if [ -f "$filepath" ]; then
				custompath="$filepath"
				ui_print "    * $filepath found!"
				return 0
			fi
			ui_print "    - $filepath not found"
		done
	done
	return 1
}

set_custompath || abort "! No localpolicy.te found"

ui_print "- Installing custom policy file"
install -Dm644 "$custompath" "$MODPATH/sepolicy.rule" || abort "! Install failed"

)
