
#!/bin/sh -e
# Magic to Provision the Container
# Brian Dwyer - Intelligent Digital Services

# Custodian Wrapper & Passthrough
# if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
case "$1" in
	#
	# Custodian
	#
	run|schema|report|version|validate) custodian "$@";;
	-*) custodian "$@";;
	#
	# Other
	#
	* )	exec "$@";;
esac