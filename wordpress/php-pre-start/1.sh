#!/bin/bash
echo "######## GRIPEN ########"

#pwd
#[ -d /opt/app-root/src/ ] && ls -la /opt/app-root/src
#[ -d /opt/app-root/src/wp-content ] && ls -al /opt/app-root/src/wp-content/*
[ ! -e content/mu-plugins ] && ln -sf ../wp-content/mu-plugins content/mu-plugins
#[ ! -d content/themes/mu-themes ] && mkdir -p content/themes && ln -sf ../../wp-content/mu-themes content/themes/mu-themes
[ ! -e content/themes ] && mkdir -p content/themes
[ ! -e content/plugins ] && mkdir -p content/plugins
[ ! -e content/ItTmSp ] && mkdir -p content/ItTmSp
wp core is-installed > /dev/null 2>/dev/null
EWP=$?
cd wp-content/plugins
for p in * ; do
  echo $p ;
  [ ! -d $p ] && continue
  [ ! -e /opt/app-root/src/content/plugins/$p ] && ln -sf ../../wp-content/plugins/$p  /opt/app-root/src/content/plugins/$p
#  [ $EWP -eq 0 ] && wp plugin activate $p
done
cd ../..

cd wp-content/mu-themes
for p in * ; do
  echo $p ;
  [ ! -d $p ] && continue
  [ ! -e /opt/app-root/src/content/themes/$p ] && ln -sf ../../wp-content/mu-themes/$p  /opt/app-root/src/content/themes/$p
done
cd ../..

cd wp-content/themes
for p in * ; do
  echo $p ;
  [ ! -d $p ] && continue
  [ ! -e /opt/app-root/src/content/themes/$p ] && cp -a ../../wp-content/themes/$p  /opt/app-root/src/content/themes/$p
done
cd ../..

#/usr/libexec/s2i/run
