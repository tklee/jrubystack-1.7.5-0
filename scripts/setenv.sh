#!/bin/sh
echo $DYLD_LIBRARY_PATH | egrep "/Applications/jrubystack-1.7.5-0/common" > /dev/null
if [ $? -ne 0 ] ; then
PATH="/Applications/jrubystack-1.7.5-0/common/bin:/Applications/jrubystack-1.7.5-0/sqlite/bin:/Applications/jrubystack-1.7.5-0/subversion/bin:/Applications/jrubystack-1.7.5-0/mysql/bin:/Applications/jrubystack-1.7.5-0/jruby/bin:/Applications/jrubystack-1.7.5-0/java/bin:$PATH"
export PATH
DYLD_LIBRARY_PATH="/Applications/jrubystack-1.7.5-0/common/lib:/Applications/jrubystack-1.7.5-0/sqlite/lib:/Applications/jrubystack-1.7.5-0/subversion/lib:/Applications/jrubystack-1.7.5-0/mysql/lib::$DYLD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH
fi

##### SQLITE ENV #####
			
##### SUBVERSION ENV #####
			
##### MYSQL ENV #####

##### JRUBY ENV #####
GEM_HOME=/Applications/jrubystack-1.7.5-0/jruby/lib/ruby/gems/1.9
export GEM_HOME
GEM_PATH=/Applications/jrubystack-1.7.5-0/jruby/lib/ruby/gems/1.9
export GEM_PATH
JRUBY_HOME="/Applications/jrubystack-1.7.5-0/jruby"
export JRUBY_HOME
##### JAVA ENV #####
JAVA_HOME=/Applications/jrubystack-1.7.5-0/java
export JAVA_HOME

##### CURL ENV #####
CURL_CA_BUNDLE=/Applications/jrubystack-1.7.5-0/common/openssl/certs/curl-ca-bundle.crt
export CURL_CA_BUNDLE
##### SSL ENV #####
SSL_CERT_FILE=/Applications/jrubystack-1.7.5-0/common/openssl/certs/curl-ca-bundle.crt
export SSL_CERT_FILE
OPENSSL_CONF=/Applications/jrubystack-1.7.5-0/common/openssl/openssl.cnf
export OPENSSL_CONF


. /Applications/jrubystack-1.7.5-0/scripts/build-setenv.sh
