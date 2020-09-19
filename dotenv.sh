rm -f .env
touch .env
echo WP_USER=$1 >> .env
echo WP_PASS=$2 >> .env
echo WP_DATABASE=$3 >> .env
echo WP_ROOTUSER=$4 >> .env
echo URL_WP=$5 >> .env
echo URL_DB=$6 >> .env
echo CERT_EMAIL=$7 >> .env
