ifneq "$(MakeLogFile)" ""
log=/usr/bin/time -a -f '%U %S $1 $($1):: $@: $^ ? $?' -o $(MakeLogFile)
endif

ifneq ($(V),1)
cmd = @echo '  $(if $(label_$1),$(label_$1),$1) $@'; $(log) "$($1)"
else
cmd = $(log) "$($1)"
endif

label_ALEX=ALEX
label_HAPPY=HAPPY
label_hsc2hs_INPLACE=HSC2HS




