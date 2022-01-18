# Location for Fuctions (.bashrc redirect)

# Functions
##########################################################################
# Calculates diskusage (with du) and reports back sorted and human readable.
# @param [Array] list of files or directories to report on (file args to du)
diskusage() {
  du -ks "$@" | sort -nr | \
    awk '{ \
      if ($1 > 1048576) printf("%8.2fG", $1/1048576) ; \
      else if ($1 > 1024) printf("%8.2fM", $1/1024) ; \
      else printf("%8.2fK", $1) ; \
      sub($1, "") ; print \
    }'
}
export -f diskusage
##########################################################################
# Secure file transfer 
sftpin () {                  
	sftp 192.168.1."$1" ;
	return
}
export -f sftpin
##########################################################################

