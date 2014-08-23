#
# Pumpkin is our NGINX router
#
node pumpkin {
	include base::common
	include service::nginx
}
