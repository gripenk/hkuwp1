#!/bin/bash -e

WPTS="twentynineteen twentytwenty twentytwentyone"

echo "---> using post assemble "
pwd
ls -lad .
ls -la .


[ -d hku-content/mu-plugins ] && mv hku-content/mu-plugins/ wp-content/ || mkdir wp-content/mu-plugins
[ ! -z "$(ls -A hku-content/plugins)" ] && mv hku-content/plugins/* wp-content/plugins/
mv hku-content/sunrise.php wp-content/

[ -d hku-content/mu-themes ] && mv hku-content/mu-themes/ wp-content/ || mkdir wp-content/mu-themes
for WT in ${WPTS} ; do 
  [ -d wp-content/themes/${WT} ] && mv wp-content/themes/${WT} wp-content/mu-themes/
done
find  wp-content/themes/ -maxdepth 1 -mindepth 1 -type d -exec rm -rf {} \;
[ ! -z "$(ls -A hku-content/themes)" ] && mv hku-content/themes/* wp-content/themes/
# may not move back to wp-content/themes later, if we ask user to use child-theme
#for WT in ${WPTS} ; do [ -d wp-content/mu-themes/${WT} ] && mv wp-content/mu-themes/${WT} wp-content/themes/; done
